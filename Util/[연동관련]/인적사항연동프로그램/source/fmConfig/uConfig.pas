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
    Label10: TLabel;
    ed_JijumCode: TEdit;
    btn_ConnectTest: TSpeedButton;
    ed_ConnectedTest: TEdit;
    TabSheet3: TTabSheet;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    TabSheet4: TTabSheet;
    Label11: TLabel;
    cmb_DBType2: TComboBox;
    ed_dbip2: TEdit;
    Label12: TLabel;
    Label13: TLabel;
    ed_dbport2: TEdit;
    ed_dbuserid2: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    ed_dbpw2: TEdit;
    ed_dbname2: TEdit;
    Label16: TLabel;
    btn_ConnectTest2: TSpeedButton;
    ed_ConnectedTest2: TEdit;
    btn_QueryTest1: TSpeedButton;
    btn_QueryTest2: TSpeedButton;
    Label17: TLabel;
    ed_BasicPosiCode: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure cmb_ProgramTypeChange(Sender: TObject);
    procedure btn_ConnectTestClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_ConnectTest2Click(Sender: TObject);
    procedure btn_QueryTest1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfig;
  private
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):string;
    Function InsertIntoTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):string;
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;

implementation

uses
  uCommonVariable,
  uDBModule,
  udmAdoRelay,
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
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE2'   then cmb_DBType2.itemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP2'     then ed_dbip2.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT2'   then ed_dbport2.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID2' then ed_dbuserid2.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW2' then ed_dbpw2.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME2'   then ed_dbname2.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then ed_RelayTime.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then ed_companyCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'JIJUMCD'   then ed_JijumCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'POSICD'   then ed_BasicPosiCode.Text := FindField('CO_CONFIGVALUE').AsString
          ;
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
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBTYPE2',inttostr(cmb_DBType2.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBTYPE2',inttostr(cmb_DBType2.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);


  stSql := UpdateTB_CONFIG('EMPCONV','DBIP',ed_dbip.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBIP2',ed_dbip2.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBIP2',ed_dbip2.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','DBPORT',ed_dbport.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBPORT2',ed_dbport2.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBPORT2',ed_dbport2.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID',ed_dbuserid.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERID2',ed_dbuserid2.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID2',ed_dbuserid2.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW',ed_dbpw.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERPW2',ed_dbpw2.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW2',ed_dbpw2.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','DBNAME',ed_dbname.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := InsertIntoTB_CONFIG('EMPCONV','DBNAME2',ed_dbname2.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBNAME2',ed_dbname2.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','RELAYTIME',ed_RelayTime.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','COCODE',ed_companyCode.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','JIJUMCD',ed_JijumCode.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','POSICD',ed_BasicPosiCode.Text);
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
  (*
  if (cmb_ProgramType.ItemIndex = 1) or (cmb_ProgramType.ItemIndex = 2) then   //KT분당이면
  begin
    lb_companyCode.Visible := True;
    ed_companyCode.Visible := True;
  end else
  begin
    lb_companyCode.Visible := False;
    ed_companyCode.Visible := False;
  end; *)
  ed_BasicPosiCode.Enabled := True;
end;

procedure TfmConfig.btn_ConnectTestClick(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayTESTConnected(inttostr(cmb_DBType.ItemIndex + 1), ed_dbip.Text, ed_dbport.Text,
                    ed_dbuserid.Text, ed_dbpw.Text, ed_dbname.Text) then
  begin
    ed_ConnectedTest.Text := 'Connected';
    btn_QueryTest1.Enabled := True;
  end else
  begin
    ed_ConnectedTest.Text := 'DisConnected';
    btn_QueryTest1.Enabled := False;
  end;
end;

procedure TfmConfig.SpeedButton1Click(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayConnectTEST(Memo1.Text) then Edit1.Text := 'Connected'
  else Edit1.Text := 'DisConnected';

end;

function TfmConfig.InsertIntoTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): string;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CONFIG (GROUP_CODE,CO_CONFIGGROUP,CO_CONFIGCODE,CO_CONFIGVALUE) ';
  stSql := stSql + ' Values( ''' + GROUPCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGGROUP + ''', ';
  stSql := stSql + ' ''' + aCONFIGCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGVALUE + ''') ';

  result :=  stSql;
end;

procedure TfmConfig.btn_ConnectTest2Click(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayTESTConnected(inttostr(cmb_DBType2.ItemIndex + 1), ed_dbip2.Text, ed_dbport2.Text,
                    ed_dbuserid2.Text, ed_dbpw2.Text, ed_dbname2.Text) then
  begin
    ed_ConnectedTest2.Text := 'Connected';
    btn_QueryTest2.Enabled := True; 
  end else
  begin
    ed_ConnectedTest2.Text := 'DisConnected';
    btn_QueryTest2.Enabled := False;
  end;

end;

procedure TfmConfig.btn_QueryTest1Click(Sender: TObject);
begin
  fmQueryTest := TfmQueryTest.Create(self);
  fmQueryTest.ConnectNo := TSpeedButton(Sender).Tag;
  fmQueryTest.ShowModal;
  fmQueryTest.Free;
end;

end.
