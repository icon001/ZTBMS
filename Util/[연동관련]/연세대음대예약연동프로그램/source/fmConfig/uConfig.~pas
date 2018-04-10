unit uConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls,WinSpool,ActiveX,ADODB;

type
  TfmConfig = class(TForm)
    sbSave: TSpeedButton;
    sbCancel: TSpeedButton;
    StatusBar1: TStatusBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    cmb_DBType: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label5: TLabel;
    ed_dbip: TEdit;
    ed_dbport: TEdit;
    ed_dbuserid: TEdit;
    ed_dbpw: TEdit;
    ed_dbname: TEdit;
    TabSheet2: TTabSheet;
    Label7: TLabel;
    ed_RelayTime: TEdit;
    Label9: TLabel;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    ed_emdbip: TEdit;
    ed_emdbport: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    ed_emdbuserid: TEdit;
    ed_emdbpw: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ed_emdbname: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfig;
  private
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):string;
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;

implementation

uses
  uCommonVariable,
  uDBModule,
  udmAdoRelay;
{$R *.dfm}

procedure TfmConfig.FormCreate(Sender: TObject);
begin
  LoadConfig;

end;

procedure TfmConfig.LoadConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  stSql := 'select * from TB_CONFIG ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      while Not Eof do
      begin
        if FindField('CO_CONFIGGROUP').AsString = 'RESERVE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then cmb_DBType.ItemIndex := cmb_DBType.Items.IndexOf(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then ed_dbip.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then ed_dbport.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then ed_dbuserid.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then ed_dbpw.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then ed_dbname.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then ed_RelayTime.Text := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'EMRELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then ed_emdbip.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then ed_emdbport.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then ed_emdbuserid.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then ed_emdbpw.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then ed_emdbname.Text := FindField('CO_CONFIGVALUE').AsString
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmConfig.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.sbSaveClick(Sender: TObject);
var
  stSql : string;
begin

  stSql := UpdateTB_CONFIG('RESERVE','DBTYPE',cmb_DBType.text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('RESERVE','DBIP',ed_dbip.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('RESERVE','DBPORT',ed_dbport.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('RESERVE','DBUSERID',ed_dbuserid.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('RESERVE','DBUSERPW',ed_dbpw.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('RESERVE','DBNAME',ed_dbname.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('RESERVE','RELAYTIME',ed_RelayTime.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMRELAY','DBIP',ed_emdbip.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMRELAY','DBPORT',ed_emdbport.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMRELAY','DBUSERID',ed_emdbuserid.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMRELAY','DBUSERPW',ed_emdbpw.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMRELAY','DBNAME',ed_emdbname.Text);
  dmDBModule.ProcessExecSQL(stSql);

  Close;
end;

function TfmConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
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



procedure TfmConfig.Button1Click(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayConnected('mysql', ed_dbip.text, ed_dbport.Text,
                    ed_dbuserid.Text, ed_dbpw.Text, ed_dbname.Text) then
  begin
    showmessage('Success');
  end else
  begin
    showmessage('Not Success');
  end;
end;

end.
