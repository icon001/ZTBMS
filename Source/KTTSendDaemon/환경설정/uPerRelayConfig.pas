unit uPerRelayConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ADODB;

type
  TfmperRelayConfig = class(TForm)
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    mem_Query: TMemo;
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    ADOQuery: TADOQuery;
    ADOConnection: TADOConnection;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    mem_AllUpdateQuery: TMemo;
    mem_UpdateQuery: TMemo;
    GroupBox7: TGroupBox;
    GroupBox6: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_live: TEdit;
    ed_delete: TEdit;
    cmb_cardgubuncode: TComboBox;
    GroupBox8: TGroupBox;
    Label9: TLabel;
    cmb_FixUse: TComboBox;
    Label10: TLabel;
    ed_FixLength: TEdit;
    Label11: TLabel;
    ed_FixChar: TEdit;
    gb_dbConfig1: TGroupBox;
    cmb_DBType: TComboBox;
    Label1: TLabel;
    ed_ServerIP: TEdit;
    ed_ServerPort: TEdit;
    ed_DBUser: TEdit;
    ed_DBPasswd: TEdit;
    ed_DBName: TEdit;
    st_Connected: TStaticText;
    btn_Connect: TSpeedButton;
    Label5: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    gb_dbConfig2: TGroupBox;
    Label12: TLabel;
    btn_ConnectTest2: TSpeedButton;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cmb_DBType2: TComboBox;
    ed_ServerIP2: TEdit;
    ed_ServerPort2: TEdit;
    ed_DBUser2: TEdit;
    ed_DBPasswd2: TEdit;
    ed_DBName2: TEdit;
    st_Connected2: TStaticText;
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure btn_ConnectTest2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Function InsertTB_PERRELAYCONFIG(aCode,aValue,aDetail:string):Boolean;
    Function UpdateTB_PERRELAYCONFIG(aCode,aValue,aDetail:string):Boolean;

    procedure SearchConfig;
  public
    { Public declarations }
  end;

var
  fmperRelayConfig: TfmperRelayConfig;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

function TfmperRelayConfig.InsertTB_PERRELAYCONFIG(aCode, aValue,
  aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERRELAYCONFIG (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PC_CONFIGCODE,';
  stSql := stSql + 'PC_CONFIGVALUE,';
  stSql := stSql + 'PC_CONFIGDETAIL)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aValue + ''',';
  stSql := stSql + '''' + aDetail + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmperRelayConfig.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmperRelayConfig.sbSaveClick(Sender: TObject);
begin
  if Not InsertTB_PERRELAYCONFIG('DBTYPE',
                                 inttostr(cmb_DBType.ItemIndex),
                                 '0:MDB,1:MSSQL,2:Postgresql') then
          UpdateTB_PERRELAYCONFIG('DBTYPE',
                                 inttostr(cmb_DBType.ItemIndex),
                                 '0:MDB,1:MSSQL,2:Postgresql');
  if Not InsertTB_PERRELAYCONFIG('DBSERVERIP',
                                 ed_ServerIP.Text,
                                 '����IP') then
          UpdateTB_PERRELAYCONFIG('DBSERVERIP',
                                 ed_ServerIP.Text,
                                 '����IP');
  if Not InsertTB_PERRELAYCONFIG('DBSERVERPORT',
                                 ed_ServerPort.Text,
                                 '����Port') then
          UpdateTB_PERRELAYCONFIG('DBSERVERPORT',
                                 ed_ServerPort.Text,
                                 '����Port');
  if Not InsertTB_PERRELAYCONFIG('DBUSERID',
                                 ed_DBUser.Text,
                                 '����ڰ���') then
          UpdateTB_PERRELAYCONFIG('DBUSERID',
                                 ed_DBUser.Text,
                                 '����ڰ���');
  if Not InsertTB_PERRELAYCONFIG('DBUSERPW',
                                 ed_DBPasswd.Text,
                                 '����ں�й�ȣ') then
          UpdateTB_PERRELAYCONFIG('DBUSERPW',
                                 ed_DBPasswd.Text,
                                 '����ں�й�ȣ');
  if Not InsertTB_PERRELAYCONFIG('DBNAME',
                                 ed_DBName.Text,
                                 '�����ͺ��̽���') then
          UpdateTB_PERRELAYCONFIG('DBNAME',
                                 ed_DBName.Text,
                                 '�����ͺ��̽���');

  if Not InsertTB_PERRELAYCONFIG('DBTYPE2',
                                 inttostr(cmb_DBType2.ItemIndex),
                                 '0:MDB,1:MSSQL,2:Postgresql') then
          UpdateTB_PERRELAYCONFIG('DBTYPE2',
                                 inttostr(cmb_DBType2.ItemIndex),
                                 '0:MDB,1:MSSQL,2:Postgresql');
  if Not InsertTB_PERRELAYCONFIG('DBSERVERIP2',
                                 ed_ServerIP2.Text,
                                 '����IP') then
          UpdateTB_PERRELAYCONFIG('DBSERVERIP2',
                                 ed_ServerIP2.Text,
                                 '����IP');
  if Not InsertTB_PERRELAYCONFIG('DBSERVERPORT2',
                                 ed_ServerPort2.Text,
                                 '����Port') then
          UpdateTB_PERRELAYCONFIG('DBSERVERPORT2',
                                 ed_ServerPort2.Text,
                                 '����Port');
  if Not InsertTB_PERRELAYCONFIG('DBUSERID2',
                                 ed_DBUser2.Text,
                                 '����ڰ���') then
          UpdateTB_PERRELAYCONFIG('DBUSERID2',
                                 ed_DBUser2.Text,
                                 '����ڰ���');
  if Not InsertTB_PERRELAYCONFIG('DBUSERPW2',
                                 ed_DBPasswd2.Text,
                                 '����ں�й�ȣ') then
          UpdateTB_PERRELAYCONFIG('DBUSERPW2',
                                 ed_DBPasswd2.Text,
                                 '����ں�й�ȣ');
  if Not InsertTB_PERRELAYCONFIG('DBNAME2',
                                 ed_DBName2.Text,
                                 '�����ͺ��̽���') then
          UpdateTB_PERRELAYCONFIG('DBNAME2',
                                 ed_DBName2.Text,
                                 '�����ͺ��̽���');



  if Not InsertTB_PERRELAYCONFIG('DBQuery',
                                 StringReplace(mem_Query.Text,'''','''''',[rfReplaceAll]),
                                 '��ȸ����') then
          UpdateTB_PERRELAYCONFIG('DBQuery',
                                 StringReplace(mem_Query.Text,'''','''''',[rfReplaceAll]),
                                 '��ȸ����');
  if Not InsertTB_PERRELAYCONFIG('LIVECODE',
                                 ed_live.Text,
                                 '��ϻ����ڵ�') then
          UpdateTB_PERRELAYCONFIG('LIVECODE',
                                 ed_live.Text,
                                 '��ϻ����ڵ�');
  if Not InsertTB_PERRELAYCONFIG('DELETECODE',
                                 ed_delete.Text,
                                 '���������ڵ�') then
          UpdateTB_PERRELAYCONFIG('DELETECODE',
                                 ed_delete.Text,
                                 '���������ڵ�');
  if Not InsertTB_PERRELAYCONFIG('DBALLUPDATEQUERY',
                                 StringReplace(mem_AllUpdateQuery.Text,'''','''''',[rfReplaceAll]),
                                 '��ü������Ʈ����') then
          UpdateTB_PERRELAYCONFIG('DBALLUPDATEQUERY',
                                 StringReplace(mem_AllUpdateQuery.Text,'''','''''',[rfReplaceAll]),
                                 '��ü������Ʈ����');
  if Not InsertTB_PERRELAYCONFIG('DBUPDATEQUERY',
                                 StringReplace(mem_UpdateQuery.Text,'''','''''',[rfReplaceAll]),
                                 '������Ʈ����') then
          UpdateTB_PERRELAYCONFIG('DBUPDATEQUERY',
                                 StringReplace(mem_UpdateQuery.Text,'''','''''',[rfReplaceAll]),
                                 '������Ʈ����');
  if Not InsertTB_PERRELAYCONFIG('CARDGUBUNCODE',
                                 inttostr(cmb_cardgubuncode.ItemIndex),
                                 '0.�̻��,1.���(��ȯ��01������)') then
          UpdateTB_PERRELAYCONFIG('CARDGUBUNCODE',
                                 inttostr(cmb_cardgubuncode.ItemIndex),
                                 '0.�̻��,1.���(��ȯ��01������)');
  if Not InsertTB_PERRELAYCONFIG('CARDFIXUSE',
                                 inttostr(cmb_FixUse.ItemIndex),
                                 '0.�̻��,1.���(�����ش繮�ڸ����̸�ŭ����)') then
          UpdateTB_PERRELAYCONFIG('CARDFIXUSE',
                                 inttostr(cmb_FixUse.ItemIndex),
                                 '0.�̻��,1.���(�����ش繮�ڸ����̸�ŭ����)');
  if cmb_FixUse.ItemIndex > 0 then
  begin
    if Not isDigit(ed_FixLength.Text) then
    begin
      showmessage('ī��������� ���� ī��������̴� �ݵ�� �Է��ϼž� �մϴ�.');
      Exit;
    end;
  end;
  if Not InsertTB_PERRELAYCONFIG('CARDFIXLEN',
                                 ed_FixLength.Text,
                                 'ī���������') then
          UpdateTB_PERRELAYCONFIG('CARDFIXLEN',
                                 ed_FixLength.Text,
                                 'ī���������');
  if cmb_FixUse.ItemIndex > 0 then
  begin
    if Trim(ed_FixChar.Text) = '' then
    begin
      showmessage('ī��������� ���� ī�嵥���� ä�� ���ڸ� �ݵ�� �Է� �ϼž� �մϴ�.');
      Exit;
    end;
  end;
  if Not InsertTB_PERRELAYCONFIG('CARDFIXCHAR',
                                 ed_FixChar.Text,
                                 'ī���������') then
          UpdateTB_PERRELAYCONFIG('CARDFIXCHAR',
                                 ed_FixChar.Text,
                                 'ī���������');
  Close;

end;

function TfmperRelayConfig.UpdateTB_PERRELAYCONFIG(aCode, aValue,
  aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PERRELAYCONFIG Set ';
  stSql := stSql + 'PC_CONFIGVALUE = ''' + aValue + ''',';
  stSql := stSql + 'PC_CONFIGDETAIL = ''' + aDetail + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PC_CONFIGCODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmperRelayConfig.FormShow(Sender: TObject);
begin
  SearchConfig;
end;

procedure TfmperRelayConfig.SearchConfig;
var
  stSql : string;
begin
  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with AdoQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      if FindField('PC_CONFIGCODE').AsString = 'DBTYPE' then
        cmb_DBType.ItemIndex := strtoint(FindField('PC_CONFIGVALUE').AsString);
      if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP' then
        ed_ServerIP.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT' then
        ed_ServerPort.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBUSERID' then
        ed_DBUser.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW' then
        ed_DBPasswd.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBNAME' then
        ed_DBName.Text := FindField('PC_CONFIGVALUE').AsString;

      if FindField('PC_CONFIGCODE').AsString = 'DBTYPE2' then
        cmb_DBType2.ItemIndex := strtoint(FindField('PC_CONFIGVALUE').AsString);
      if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP2' then
        ed_ServerIP2.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT2' then
        ed_ServerPort2.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBUSERID2' then
        ed_DBUser2.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW2' then
        ed_DBPasswd2.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBNAME2' then
        ed_DBName2.Text := FindField('PC_CONFIGVALUE').AsString;

      if FindField('PC_CONFIGCODE').AsString = 'DBQuery' then
        mem_Query.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'LIVECODE' then
        ed_live.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DELETECODE' then
        ed_delete.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBALLUPDATEQUERY' then
        mem_AllUpdateQuery.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'DBUPDATEQUERY' then
        mem_UpdateQuery.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'CARDGUBUNCODE' then
        cmb_cardgubuncode.ItemIndex := strtoint(FindField('PC_CONFIGVALUE').AsString);
      if FindField('PC_CONFIGCODE').AsString = 'CARDFIXUSE' then
        cmb_FixUse.ItemIndex := strtoint(FindField('PC_CONFIGVALUE').AsString);
      if FindField('PC_CONFIGCODE').AsString = 'CARDFIXLEN' then
        ed_FixLength.Text := FindField('PC_CONFIGVALUE').AsString;
      if FindField('PC_CONFIGCODE').AsString = 'CARDFIXCHAR' then
        ed_FixChar.Text := FindField('PC_CONFIGVALUE').AsString;

      Next;
    end;
  end;
end;

procedure TfmperRelayConfig.btn_ConnectClick(Sender: TObject);
var
  conStr : string;
begin
    if cmb_DBType.ItemIndex = 1 then    //MSSQL
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + ed_DBPasswd.text + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + ed_DBUser.Text + ';';
      conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
      conStr := constr + 'Data Source=' + ed_ServerIP.Text  + ',' + ed_ServerPort.Text;
    end else if cmb_DBType.ItemIndex = 2 then  //PostGreSql
    begin
      conStr := 'Provider=PostgreSQL.1;';
      conStr := constr + 'Data Source=' + ed_ServerIP.Text + ';'   ;
      conStr := constr + 'location=' + ed_DBName.Text + ';';
      conStr := constr + 'User Id='+ ed_DBUser.Text + ';';
      conStr := constr + 'password=' + ed_DBPasswd.text;
    end else if cmb_DBType.ItemIndex = 3 then  //Oracle
    begin
      conStr := 'Provider=OraOLEDB.Oracle;';
      conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + ed_ServerIP.Text + ')(PORT=' + ed_ServerPort.Text + ')))(CONNECT_DATA=(SID=' + ed_DBName.Text + ')(SERVER=DEDICATED)));';
      conStr := constr + 'User Id='+ ed_DBUser.Text + ';';
      conStr := constr + 'Password=' + ed_DBPasswd.text + '';
    end else if cmb_DBType.ItemIndex = 0 then   //MDB
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
      showmessage('DB Type �� ��Ȯ���� �ʽ��ϴ�.');
      Exit;
    end;

    with ADOConnection do
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
            st_Connected.Caption := 'DisConnected';
            st_Connected.Font.Color := clRed;
            Exit;
          end;
        else
          begin
            //ShowMessage('�����ͺ��̽� ���� ����' );
            st_Connected.Caption := 'DisConnected';
            st_Connected.Font.Color := clRed;
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      st_Connected.Caption := 'Connected';
      st_Connected.Font.Color := clBlue;
    end;
end;

procedure TfmperRelayConfig.btn_ConnectTest2Click(Sender: TObject);
var
  conStr : string;
begin
    if cmb_DBType2.ItemIndex = 1 then    //MSSQL
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + ed_DBPasswd2.text + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + ed_DBUser2.Text + ';';
      conStr := constr + 'Initial Catalog=' + ed_DBName2.Text + ';';
      conStr := constr + 'Data Source=' + ed_ServerIP2.Text  + ',' + ed_ServerPort2.Text;
    end else if cmb_DBType2.ItemIndex = 2 then  //PostGreSql
    begin
      conStr := 'Provider=PostgreSQL.1;';
      conStr := constr + 'Data Source=' + ed_ServerIP2.Text + ';'   ;
      conStr := constr + 'location=' + ed_DBName2.Text + ';';
      conStr := constr + 'User Id='+ ed_DBUser2.Text + ';';
      conStr := constr + 'password=' + ed_DBPasswd2.text;
    end else if cmb_DBType2.ItemIndex = 3 then  //Oracle
    begin
      conStr := 'Provider=OraOLEDB.Oracle;';
      conStr := constr + 'Data Source=(DESCRIPTION=(CID=GTU_APP)(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=' + ed_ServerIP2.Text + ')(PORT=' + ed_ServerPort2.Text + ')))(CONNECT_DATA=(SID=' + ed_DBName2.Text + ')(SERVER=DEDICATED)));';
      conStr := constr + 'User Id='+ ed_DBUser2.Text + ';';
      conStr := constr + 'Password=' + ed_DBPasswd2.text + '';
    end else if cmb_DBType.ItemIndex = 0 then   //MDB
    begin
    end else
    begin
      showmessage('DB Type �� ��Ȯ���� �ʽ��ϴ�.');
      Exit;
    end;

    with ADOConnection do
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
            st_Connected2.Caption := 'DisConnected';
            st_Connected2.Font.Color := clRed;
            Exit;
          end;
        else
          begin
            //ShowMessage('�����ͺ��̽� ���� ����' );
            st_Connected2.Caption := 'DisConnected';
            st_Connected2.Font.Color := clRed;
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
      st_Connected2.Caption := 'Connected';
      st_Connected2.Font.Color := clBlue;
    end;
end;

procedure TfmperRelayConfig.FormActivate(Sender: TObject);
begin
  cmb_DBType.Enabled := gb_dbConfig1.Enabled;
  Label1.Enabled := gb_dbConfig1.Enabled;
  ed_ServerIP.Enabled := gb_dbConfig1.Enabled;
  Label2.Enabled := gb_dbConfig1.Enabled;
  ed_ServerPort.Enabled := gb_dbConfig1.Enabled;
  Label3.Enabled := gb_dbConfig1.Enabled;
  ed_DBUser.Enabled := gb_dbConfig1.Enabled;
  Label4.Enabled := gb_dbConfig1.Enabled;
  ed_DBPasswd.Enabled := gb_dbConfig1.Enabled;
  Label5.Enabled := gb_dbConfig1.Enabled;
  ed_DBName.Enabled := gb_dbConfig1.Enabled;
  btn_Connect.Enabled := gb_dbConfig1.Enabled;


  cmb_DBType2.Enabled := gb_dbConfig2.Enabled;
  Label12.Enabled := gb_dbConfig2.Enabled;
  ed_ServerIP2.Enabled := gb_dbConfig2.Enabled;
  Label16.Enabled := gb_dbConfig2.Enabled;
  ed_ServerPort2.Enabled := gb_dbConfig2.Enabled;
  Label15.Enabled := gb_dbConfig2.Enabled;
  ed_DBUser2.Enabled := gb_dbConfig2.Enabled;
  Label14.Enabled := gb_dbConfig2.Enabled;
  ed_DBPasswd2.Enabled := gb_dbConfig2.Enabled;
  Label13.Enabled := gb_dbConfig2.Enabled;
  ed_DBName2.Enabled := gb_dbConfig2.Enabled;
  btn_ConnectTest2.Enabled := gb_dbConfig2.Enabled;

end;

end.
