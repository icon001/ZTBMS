unit uMdbToMssql;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,iniFiles, DB, ADODB, ExtCtrls, ComCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

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
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ed_mdbfile: TEdit;
    btn_FileSearch: TBitBtn;
    btn_DBTrance: TButton;
    btn_Exit: TButton;
    OpenDialog1: TOpenDialog;
    rg_Type: TRadioGroup;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    ProgressBar1: TProgressBar;
    rg_DBType: TRadioGroup;
    GroupBox4: TGroupBox;
    cmb_Program: TComboBox;
    chk_DataBaseCreate: TCheckBox;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_FileSearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_DBTranceClick(Sender: TObject);
    procedure rg_DBTypeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    L_bPGOdbcUse : Boolean;
    { Private declarations }
    procedure CreateDataBase(stDBName : string);
    Function DBChange(stDBName : string):Boolean;
    Function Create_Table : Boolean;
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

procedure TfmMain.btn_FileSearchClick(Sender: TObject);
begin
  OpenDialog1.Title := '데이터 파일 찾기';
  OpenDialog1.DefaultExt := 'mdb';
  OpenDialog1.Filter := 'mdb files (*.mdb)|*.MDB';
  if OpenDialog1.Execute then
  begin
    ed_mdbfile.Text := OpenDialog1.FileName;
  end;
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
    if UpperCase(stDBTYPE) = 'MDB' then
    begin
      GroupBox1.Visible := False;
      GroupBox2.Visible := True;
      rg_DBType.ItemIndex := 2;
      ed_mdbfile.Text := L_ExeFolder + '\..\DB\ZMOS.MDB';
    end else if UpperCase(stDBType) = 'PG' then
    begin
      GroupBox1.Visible := True;
      GroupBox2.Visible := False;
      rg_DBType.ItemIndex := 1;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','postgres');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
    end else if UpperCase(stDBType) = 'MSSQL' then
    begin
      GroupBox1.Visible := True;
      GroupBox2.Visible := False;
      rg_DBType.ItemIndex := 0;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','1433');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','sa');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW',''));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
    end else if UpperCase(stDBType) = 'FB' then
    begin
      GroupBox1.Visible := True;
      GroupBox2.Visible := False;
      rg_DBType.ItemIndex := 3;
      ed_serverip.text := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
      ed_serverPort.Text := ini_fun.ReadString('DBConfig','Port','5432');
      ed_userid.Text := ini_fun.ReadString('DBConfig','UserID','SYSDBA');
      ed_Passwd.Text := MimeDecodeString(ini_fun.ReadString('DBConfig','UserPW','masterkey'));
      ed_DBName.Text := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
    end;
    rg_DBType.Visible := False;
    rg_DBTypeClick(rg_DBType);

end;

procedure TfmMain.btn_DBTranceClick(Sender: TObject);
var
  conStr : string;

  ini_fun : TiniFile;
  FileList:TStringList;
  startTime : string;
  endTime : string;
begin
  if cmb_Program.ItemIndex < 1 then
  begin
    showmessage('프로그램환경 설정을 선택 하셔야 합니다.');
    Exit;
  end;

    startTime := formatDateTime('hh:nn:ss',now);
    btn_DBTrance.Enabled := False;

    if rg_DBType.ItemIndex = 0 then
    begin
      ZConnection1.Protocol := 'mssql';
      ZConnection1.HostName := Trim(ed_serverip.Text);
      ZConnection1.Port := strtoint(ed_serverPort.Text);
      ZConnection1.Database := 'master';
      ZConnection1.User := Trim(ed_userid.Text);
      ZConnection1.Password := Trim(ed_Passwd.Text);
    end else
    if rg_DBType.ItemIndex = 1 then
    begin
      ZConnection1.Protocol := 'postgresql-8';
      ZConnection1.HostName := Trim(ed_serverip.Text);
      ZConnection1.Port := strtoint(ed_serverPort.Text);
      ZConnection1.Database := 'postgres';
      ZConnection1.User := Trim(ed_userid.Text);
      ZConnection1.Password := Trim(ed_Passwd.Text);
    end else
    begin
      exit;
    end;



    with ZConnection1 do
    begin
      Connected := False;
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
//      CursorLocation := clUseServer;
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

    if chk_DataBaseCreate.Checked then
    begin
      Label7.Caption := 'DataBase 생성중...';
      Label7.Visible := True;
      Label7.Refresh;
      if rg_DBType.ItemIndex <> 3 then
      begin
        if (rg_Type.ItemIndex = 0) or (rg_Type.ItemIndex = 1) then
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

    if cmb_Program.ItemIndex = 1 then //Common Program
    begin
      CommonConfigSetting;
    end else if cmb_Program.ItemIndex = 2 then //KT
    begin
      KTConfigSetting;
    end;
    endTime := formatDateTime('hh:nn:ss',now);
    showmessage(startTime + '/' + endTime);
    Close;

end;

procedure TfmMain.CreateDataBase(stDBName: string);
var
  stSql :string;
begin
  stSql := 'Create DataBase ' + stDBName ;

  with ZQuery1 do
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
      ZConnection1.Protocol := 'mssql';
      ZConnection1.HostName := Trim(ed_serverip.Text);
      ZConnection1.Port := strtoint(ed_serverPort.Text);
      ZConnection1.Database := 'master';
      ZConnection1.User := Trim(ed_userid.Text);
      ZConnection1.Password := Trim(ed_Passwd.Text);
    end else
    if rg_DBType.ItemIndex = 1 then
    begin
      ZConnection1.Protocol := 'postgresql-8';
      ZConnection1.HostName := Trim(ed_serverip.Text);
      ZConnection1.Port := strtoint(ed_serverPort.Text);
      ZConnection1.Database := 'postgres';
      ZConnection1.User := Trim(ed_userid.Text);
      ZConnection1.Password := Trim(ed_Passwd.Text);
    end else
    begin
      exit;
    end;


    with ZConnection1 do
    begin
      Connected := False;
      LoginPrompt:= false ;

      Try
        Connected := True;
      Except
        Exit;
      End;
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
      with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
  with ZQuery1 do
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
    GroupBox2.Visible := False;
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
    GroupBox2.Visible := True;
  end else if rg_DBType.ItemIndex = 3 then
  begin
    GroupBox1.Visible := True;
    GroupBox2.Visible := False;
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

  with ZQuery1 do
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

procedure TfmMain.FormResize(Sender: TObject);
begin
  btn_DBTrance.Left := (fmMain.Width div 2) - ( btn_DBTrance.Width div 2); 
end;

end.
