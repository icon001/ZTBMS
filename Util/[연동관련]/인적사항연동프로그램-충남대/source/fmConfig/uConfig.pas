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
    Label1: TLabel;
    cmb_ProgramType: TComboBox;
    Label7: TLabel;
    ed_RelayTime: TEdit;
    Label9: TLabel;
    lb_companyCode: TLabel;
    ed_companyCode: TEdit;
    SpeedButton1: TSpeedButton;
    st_Connected: TStaticText;
    btn_QueryTest2: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure cmb_ProgramTypeChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_QueryTest2Click(Sender: TObject);
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
  uDBModule, udmAdoRelay,
  uQueryTest;
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
        if FindField('CO_CONFIGGROUP').AsString = 'EMPCONV' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PGTYPE'   then cmb_ProgramType.itemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then cmb_DBType.itemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then ed_dbip.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then ed_dbport.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then ed_dbuserid.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then ed_dbpw.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then ed_dbname.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then ed_RelayTime.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then ed_companyCode.Text := FindField('CO_CONFIGVALUE').AsString;
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

  stSql := UpdateTB_CONFIG('EMPCONV','PGTYPE',inttostr(cmb_ProgramType.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBTYPE',inttostr(cmb_DBType.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','DBIP',ed_dbip.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBPORT',ed_dbport.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID',ed_dbuserid.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW',ed_dbpw.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBNAME',ed_dbname.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','RELAYTIME',ed_RelayTime.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','COCODE',ed_companyCode.Text);
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



procedure TfmConfig.cmb_ProgramTypeChange(Sender: TObject);
begin
  if cmb_ProgramType.ItemIndex = 2 then   //KT�д��̸�
  begin
    lb_companyCode.Visible := True;
    ed_companyCode.Visible := True;
  end else
  begin
    lb_companyCode.Visible := False;
    ed_companyCode.Visible := False;
  end;
end;

procedure TfmConfig.SpeedButton1Click(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayConnected(inttostr(cmb_DBType.ItemIndex + 1), ed_dbip.Text, ed_dbport.Text,
                    ed_dbuserid.Text, ed_dbpw.Text, ed_dbname.Text,True) then st_Connected.Caption := 'Connected'
  else st_Connected.Caption := 'DisConnected';
end;

procedure TfmConfig.btn_QueryTest2Click(Sender: TObject);
begin
  fmQueryTest := TfmQueryTest.Create(self);
  fmQueryTest.ConnectNo := TSpeedButton(Sender).Tag;
  fmQueryTest.ShowModal;
  fmQueryTest.Free;
end;

end.
