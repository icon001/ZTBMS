unit uSMSConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, ADODB,ActiveX, ComCtrls, Grids,
  DBGrids, DB;

type
  TfmSMSConfig = class(TForm)
    btn_Setting: TSpeedButton;
    btn_Cancel: TSpeedButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    gb_smsSeverConfig: TGroupBox;
    Panel1: TPanel;
    Label1: TLabel;
    cmb_ServerType: TComboBox;
    Panel2: TPanel;
    lb_ServerIP: TLabel;
    lb_ServerPort: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label9: TLabel;
    ed_SMSServerIP: TEdit;
    ed_SMSServerPort: TEdit;
    ed_SMSUserID: TEdit;
    ed_SMSUserPW: TEdit;
    ed_DBName: TEdit;
    gb_smsSendConfig: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_smsid: TEdit;
    ed_callbacknum: TEdit;
    ed_Sendername: TEdit;
    TabSheet2: TTabSheet;
    Label2: TLabel;
    ed_smsMessage: TRichEdit;
    TabSheet3: TTabSheet;
    rg_SMSNumGubun: TRadioGroup;
    rg_areagubun: TRadioGroup;
    rg_SMSUse: TRadioGroup;
    Label3: TLabel;
    cmb_DBType: TComboBox;
    btn_Test: TButton;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Memo2: TMemo;
    SMSConnection: TADOConnection;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure rg_SMSUseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SettingClick(Sender: TObject);
    procedure cmb_ServerTypeChange(Sender: TObject);
    procedure btn_TestClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    FDBConnected: Boolean;
    FServerType: integer;
    FDataBasePort: integer;
    FDataBaseName: string;
    FDataBaseIP: string;
    FUserID: string;
    FDataBaseType: string;
    FUserPW: string;
    { Private declarations }
    procedure FormInitialize;
    procedure GetSMSConfig;
    Function DataBaseConnect(aMessage:Boolean=True):Boolean;
    procedure SetDBConnected(const Value: Boolean);
  public
    { Public declarations }
    property ServerType : integer read FServerType write FServerType;
    property DataBaseType : string read FDataBaseType write FDataBaseType;
    property DataBaseIP : string read FDataBaseIP write FDataBaseIP;
    property DataBasePort : integer read FDataBasePort write FDataBasePort;
    property UserID : string read FUserID write FUserID;
    property UserPW : string read FUserPW write FUserPW;
    property DataBaseName : string read FDataBaseName write FDataBaseName;

    Property DBConnected : Boolean read FDBConnected write SetDBConnected;

  end;

var
  fmSMSConfig: TfmSMSConfig;

implementation

uses
  uDataModule1,
  uCommonSql,
  uSMSModule;

{$R *.dfm}

{ TfmSMSConfig }

procedure TfmSMSConfig.GetSMSConfig;
var
  TempAdoQuery : TADOQuery;
  stSql : string;
begin
  FormInitialize;
  Try
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      with  TempAdoQuery  do
      begin
        stSql := 'Select * from TB_CONFIG ';
        stSql := stSql + ' where CO_CONFIGGROUP = ''SMS'' ';
        Close;
        SQL.Text := stSql;

        Try
          Open;
        Except
           showmessage('Select Error!!');
           Exit;
        End;
        if RecordCount < 1 then
        begin
          Exit;
        end;
        While Not Eof do
        begin
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSUSE' then
          begin
            rg_SMSUse.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'AREAGUBUN' then
          begin
            rg_areagubun.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSNUMTYPE' then
          begin
            rg_SMSNumGubun.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERTYPE' then
          begin
            cmb_ServerType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERIP' then
          begin
            ed_SMSServerIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'DBNAME' then
          begin
            ed_DBName.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'DBTYPE' then
          begin
            cmb_DBType.Text := FindField('CO_CONFIGVALUE').AsString;
          end;

          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERPORT' then
          begin
            ed_SMSServerPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'USERID' then
          begin
            ed_SMSUserID.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'USERPW' then
          begin
            ed_SMSUserPW.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSUSERID' then
          begin
            ed_smsid.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'BACKNUM' then
          begin
            ed_callbacknum.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SENDERNAME' then
          begin
            ed_Sendername.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'MESSAGE' then
          begin
            ed_smsMessage.Text := FindField('CO_CONFIGVALUE').AsString;
          end;

          Next;
        end;
        rg_SMSUseClick(self);
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;
end;

procedure TfmSMSConfig.FormCreate(Sender: TObject);
begin
  GetSMSConfig;
end;

procedure TfmSMSConfig.FormInitialize;
begin
  rg_SMSUse.ItemIndex := 0;
  rg_areagubun.ItemIndex := 0;
  rg_SMSNumGubun.ItemIndex := 0;
  cmb_ServerType.ItemIndex := 0;
  ed_SMSServerIP.Text := '127.0.0.1';
  ed_SMSServerPort.Text := '1433';
  ed_SMSUserID.Text := 'sa';
  ed_SMSUserPW.Text := 'sapasswd';   
end;

procedure TfmSMSConfig.rg_SMSUseClick(Sender: TObject);
begin
  if rg_SMSUse.ItemIndex = 0 then
  begin
    gb_smsSeverConfig.Visible := False;
    gb_smsSendConfig.Visible := False;
  end else
  begin
    gb_smsSeverConfig.Visible := True;
    gb_smsSendConfig.Visible := True;
  end;
end;

procedure TfmSMSConfig.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSMSConfig.btn_SettingClick(Sender: TObject);
var
  stSql : string;
begin
  stSql := CommonSql.UpdateTB_CONFIG('SMS','SMSUSE',inttostr(rg_SMSUse.ItemIndex));
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','AREAGUBUN',inttostr(rg_areagubun.ItemIndex));
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SMSNUMTYPE',inttostr(rg_SMSNumGubun.ItemIndex));
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SERVERTYPE',inttostr(cmb_ServerType.ItemIndex));
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SERVERIP',ed_SMSServerIP.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SERVERPORT',ed_SMSServerPort.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','DBNAME',ed_DBName.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','DBTYPE',cmb_DBType.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','USERID',ed_SMSUserID.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','USERPW',ed_SMSUserPW.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SMSUSERID',ed_smsid.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','BACKNUM',ed_callbacknum.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','SENDERNAME',ed_Sendername.Text);
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.UpdateTB_CONFIG('SMS','MESSAGE',ed_smsMessage.Text);
  DataModule1.ProcessExecSQL(stSql);

  Close;

end;

procedure TfmSMSConfig.cmb_ServerTypeChange(Sender: TObject);
begin
  if cmb_ServerType.ItemIndex = 0 then
  begin
    lb_ServerIP.Caption := '서버 IP';
    lb_ServerPort.Caption := '서버 Port';
  end else if cmb_ServerType.ItemIndex = 1 then
  begin

  end;
end;

procedure TfmSMSConfig.btn_TestClick(Sender: TObject);
var
  stSql : string;
begin
    DataBaseType := UpperCase(cmb_DBType.Text);
    DataBaseIP := ed_SMSServerIP.Text;
    DataBasePort := strtoint(ed_SMSServerPort.Text);
    UserID := ed_SMSUserID.Text;
    UserPW := ed_SMSUserPW.Text;
    DataBaseName := ed_DBName.Text;
    DataBaseConnect(True);
    if DBConnected then
    begin
      showmessage('접속 성공');
      stSql := Memo2.Text;
      ADOQuery1.SQL.Text := 'set names euckr';
      Try
        ADOQuery1.Close;
        ADOQuery1.ExecSQL;
      Except
        on e: Exception do
        begin
            ShowMessage(E.Message );
            Exit;
        end;

      End;
      ADOQuery1.SQL.Text := stSql;
      Try
        ADOQuery1.Close;
        ADOQuery1.Open;
      Except
        on e: Exception do
        begin
            ShowMessage(E.Message );
            Exit;
        end;

      End;
    end;

end;

function TfmSMSConfig.DataBaseConnect(aMessage: Boolean): Boolean;
var
  conStr : wideString;
  stpsqlOdbcSetup : string;
begin
  if DBConnected then Exit;
(*  with SMSConnection do
  begin
    if UpperCase(DataBaseType) = 'MSSQL' then Protocol := 'mssql'
    else if UpperCase(DataBaseType) = 'PG' then Protocol := 'postgresql'
    else if UpperCase(DataBaseType) = 'mysql' then Protocol := 'mysql';
//    SMSConnection.
//    Parameters.Add('trusted=yes');
    Database := DataBaseName;
    HostName := DataBaseIP;
    Port := DataBasePort;
    User := UserID;
    Password := UserPW;
    try
      Disconnect;
      Connect;
    Except
      Exit;
    End;
  end;
  DBConnected := True;
  result := True;
*)

  stpsqlOdbcSetup := 'FALSE';
  result := False;
  Try
    conStr := '';
    if UpperCase(DataBaseType) = 'MSSQL' then
    begin
      conStr := constr + 'Provider=SQLOLEDB.1;';
      conStr := constr + 'Password=' + UserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID=' + UserID + ';';
      conStr := constr + 'Initial Catalog=' + DataBaseName + ';';
      conStr := constr + 'Data Source=' + DataBaseIP  + ',' + inttostr(DataBasePort);
    end else if UpperCase(DataBaseType) = 'PG' then
    begin
      if stpsqlOdbcSetup = 'TRUE' then
      begin
        conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
        conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + DataBaseName + ';';
        conStr := conStr + 'SERVER=' + DataBaseIP + ';PORT=5432;UID='+ UserID + ';PWD=' + UserPW + ';SSLmode=disable;';
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
        conStr := constr + 'Data Source=' + DataBaseIP + ';'   ;
        conStr := constr + 'location=' + DataBaseName + ';';
        conStr := constr + 'User Id='+ UserID + ';';
        conStr := constr + 'password=' + UserPW;
      end;
    end else if UpperCase(DataBaseType) = 'MYSQL' then
    begin
      conStr := 'DRIVER={MySQL ODBC 3.51 Driver};';
      conStr := constr + 'SERVER=' + DataBaseIP + ';'   ;
      conStr := constr + 'DATABASE=' + DataBaseName + ';';
      conStr := constr + 'UID='+ UserID + ';';
      conStr := constr + 'PWD=' + UserPW + ';';
      conStr := constr + 'OPTION=3';
    end else if UpperCase(DataBaseType) = 'ODBC' then
    begin
      conStr := 'Provider=MSDASQL.1;';
      conStr := constr + 'Password=' + UserPW + ';';
      conStr := constr + 'Persist Security Info=True;';
      conStr := constr + 'User ID='+ UserID + ';';
      conStr := constr + 'Data Source=' + DataBaseIP + ';';
      conStr := constr + 'Initial Catalog=' + DataBaseName + ';';
    end else if UpperCase(DataBaseType) = 'MDB' then
    begin
      conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
      conStr := conStr + 'Data Source=' + DataBaseName + ';';
      conStr := conStr + 'Persist Security Info=True;';
      conStr := conStr + 'Jet OLEDB:Database ';
    end else if UpperCase(DataBaseType) = 'FB' then
    begin
      conStr := 'Provider=MSDASQL;';
      conStr := conStr + 'DRIVER=Firebird/InterBase(r) driver;';
      conStr := constr + 'UID=' + UserID + ';';
      conStr := constr + 'PWD=' + UserPW + ';';
      conStr := constr + 'Auto Commit=true;';
      conStr := constr + 'DBNAME=' + DataBaseIP + ':' + DataBaseName;
    end else
    begin
      showmessage('DB Type 이 정확하지 않습니다.');
      Exit;
    end;

    with SMSConnection do
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
              ShowMessage('SMS 데이터베이스 접속 에러' + conStr );
            Exit;
          end;
      End;
      CursorLocation := clUseServer;
    end;

    DBConnected := True;
    result := True;

  Finally
    //
  End;
end;

procedure TfmSMSConfig.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

procedure TfmSMSConfig.Button1Click(Sender: TObject);
begin

    if Not dmSMSModule.DBConnected then
    begin
      dmSMSModule.ServerType := 0;
      dmSMSModule.DataBaseType := UpperCase(cmb_DBType.Text);
      dmSMSModule.DataBaseIP := ed_SMSServerIP.Text;
      dmSMSModule.DataBasePort := strtoint(ed_SMSServerPort.Text);
      dmSMSModule.UserID := ed_SMSUserID.Text;
      dmSMSModule.UserPW := ed_SMSUserPW.Text;
      dmSMSModule.DataBaseName := ed_DBName.Text;
      dmSMSModule.DataBaseConnect(False);
    end;
    if Not dmSMSModule.DBConnected then
    begin
      DataModule1.SQLErrorLog('SMS Server DBConnected Error');
      Exit;
    end;
    dmSMSModule.SMSDataSend(ed_smsid.text, '', ed_smsMessage.text ,
             '', ed_callbacknum.text,ed_Sendername.text , '01032035497',ed_smsid.Text );

end;

end.
