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
    TabSheet5: TTabSheet;
    Label18: TLabel;
    cmb_DBType3: TComboBox;
    Label19: TLabel;
    ed_dbip3: TEdit;
    Label20: TLabel;
    ed_dbport3: TEdit;
    Label21: TLabel;
    ed_dbuserid3: TEdit;
    Label22: TLabel;
    ed_dbpw3: TEdit;
    Label23: TLabel;
    ed_dbname3: TEdit;
    btn_ConnectTest3: TSpeedButton;
    ed_ConnectedTest3: TEdit;
    btn_QueryTest3: TSpeedButton;
    gb_Emergency: TGroupBox;
    ed_EmergencyCode: TEdit;
    Label24: TLabel;
    ed_PosiJijumCode: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure sbSaveClick(Sender: TObject);
    procedure cmb_ProgramTypeChange(Sender: TObject);
    procedure btn_ConnectTestClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_ConnectTest2Click(Sender: TObject);
    procedure btn_QueryTest1Click(Sender: TObject);
    procedure btn_ConnectTest3Click(Sender: TObject);
  private
    { Private declarations }
    procedure LoadConfig;
  private
    Function CheckHonikTempTable() : Boolean;
    Function CreateHonikTempTable() : Boolean;
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
  uQueryTest, uDBFunction, uCommon, uHoniK;
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
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE3'   then cmb_DBType3.itemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP3'     then ed_dbip3.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT3'   then ed_dbport3.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID3' then ed_dbuserid3.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW3' then ed_dbpw3.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME3'   then ed_dbname3.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then ed_RelayTime.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then ed_companyCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'JIJUMCD'   then ed_JijumCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'POSICD'   then ed_BasicPosiCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'EMGCD'   then ed_EmergencyCode.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'POSIJIJUM'   then ed_PosiJijumCode.Text := FindField('CO_CONFIGVALUE').AsString
          ;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  cmb_ProgramTypeChange(cmb_ProgramType);
end;

procedure TfmConfig.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.sbSaveClick(Sender: TObject);
var
  stSql : string;
begin
  if( (cmb_ProgramType.ItemIndex + 1) = 15) or ((cmb_ProgramType.ItemIndex + 1) = 16) then
  begin
    dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',formatDateTime('yyyymmddhhnnsszzz',now)); //바로 연동 안되도록 처리하자.

    if Not CheckHonikTempTable() then
    begin
      CreateHonikTempTable();

      dmDBFunction.InsertIntoTB_WORKGUBUN('4','2','제적');
      dmDBFunction.InsertIntoTB_WORKGUBUN('5','2','수료');
    end;
    if (cmb_ProgramType.ItemIndex + 1) = 15 then dmHoniK.InitSeoulRelay();  ///초기화 작업으로 직위코드 가져 오자.
  end;
  
  stSql := UpdateTB_CONFIG('EMPCONV','PGTYPE',inttostr(cmb_ProgramType.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','DBTYPE',inttostr(cmb_DBType.ItemIndex + 1));
  dmDBModule.ProcessExecSQL(stSql);

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBTYPE2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBTYPE2',inttostr(cmb_DBType2.ItemIndex + 1));
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBTYPE2',inttostr(cmb_DBType2.ItemIndex + 1));
    dmDBModule.ProcessExecSQL(stSql);
  end;

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBTYPE3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBTYPE3',inttostr(cmb_DBType3.ItemIndex + 1));
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBTYPE3',inttostr(cmb_DBType3.ItemIndex + 1));
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','DBIP',ed_dbip.Text);
  dmDBModule.ProcessExecSQL(stSql);
  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBIP2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBIP2',ed_dbip2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBIP2',ed_dbip2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;
  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBIP3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBIP3',ed_dbip3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBIP3',ed_dbip3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','DBPORT',ed_dbport.Text);
  dmDBModule.ProcessExecSQL(stSql);

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBPORT2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBPORT2',ed_dbport2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBPORT2',ed_dbport2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBPORT3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBPORT3',ed_dbport3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBPORT3',ed_dbport3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID',ed_dbuserid.Text);
  dmDBModule.ProcessExecSQL(stSql);
  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBUSERID2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERID2',ed_dbuserid2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID2',ed_dbuserid2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBUSERID3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERID3',ed_dbuserid3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBUSERID3',ed_dbuserid3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW',ed_dbpw.Text);
  dmDBModule.ProcessExecSQL(stSql);

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBUSERPW2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERPW2',ed_dbpw2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW2',ed_dbpw2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBUSERPW3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBUSERPW3',ed_dbpw3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBUSERPW3',ed_dbpw3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','DBNAME',ed_dbname.Text);
  dmDBModule.ProcessExecSQL(stSql);
  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBNAME2') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBNAME2',ed_dbname2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBNAME2',ed_dbname2.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','DBNAME3') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','DBNAME3',ed_dbname3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','DBNAME3',ed_dbname3.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

  stSql := UpdateTB_CONFIG('EMPCONV','RELAYTIME',ed_RelayTime.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','COCODE',ed_companyCode.Text);
  dmDBModule.ProcessExecSQL(stSql);
  stSql := UpdateTB_CONFIG('EMPCONV','JIJUMCD',ed_JijumCode.Text);
  dmDBModule.ProcessExecSQL(stSql);

  stSql := UpdateTB_CONFIG('EMPCONV','POSICD',ed_BasicPosiCode.Text);
  dmDBModule.ProcessExecSQL(stSql);

  if Not dmCommon.CheckTB_CONFIG('EMPCONV','EMGCD') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','EMGCD',ed_EmergencyCode.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','EMGCD',ed_EmergencyCode.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;
 
  if Not dmCommon.CheckTB_CONFIG('EMPCONV','POSIJIJUM') then
  begin
    stSql := InsertIntoTB_CONFIG('EMPCONV','POSIJIJUM',ed_PosiJijumCode.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    stSql := UpdateTB_CONFIG('EMPCONV','POSIJIJUM',ed_PosiJijumCode.Text);
    dmDBModule.ProcessExecSQL(stSql);
  end;

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
  if cmb_ProgramType.ItemIndex = 12 then
  begin
    gb_Emergency.Visible := True;
  end else
  begin
    gb_Emergency.Visible := False;
  end;
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

procedure TfmConfig.btn_ConnectTest3Click(Sender: TObject);
begin
  if dmAdoRelay.AdoRelayTESTConnected(inttostr(cmb_DBType3.ItemIndex + 1), ed_dbip3.Text, ed_dbport3.Text,
                    ed_dbuserid3.Text, ed_dbpw3.Text, ed_dbname3.Text) then
  begin
    ed_ConnectedTest3.Text := 'Connected';
    btn_QueryTest3.Enabled := True;
  end else
  begin
    ed_ConnectedTest3.Text := 'DisConnected';
    btn_QueryTest3.Enabled := False;
  end;

end;

function TfmConfig.CheckHonikTempTable(): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_HonikTempTable2 ';

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
      result := true;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmConfig.CreateHonikTempTable: Boolean;
var
  stSql : string;
begin
(*
  stSql := 'CREATE TABLE TB_HonikTempTable ( ';
  stSql := stSql + '  K_CAMPUS integer  NULL,';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_LEVEL1 varchar(6)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME varchar(100)   NULL,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 varchar(6)  NULL,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME varchar(100)   NULL,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN char(10) NULL,';               //구분
  stSql := stSql + '  K_GUBUN_NAME varchar(100)  NULL, ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME varchar(100)    NULL,';        //성명
  stSql := stSql + '  K_KEY varchar(50)    NULL,';       //학번 ( 종번 )
  stSql := stSql + '  K_STATUS integer    NULL,';       //구성원 상태(1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료)
  stSql := stSql + '  K_UPDT integer    NULL,';       //발령일(상태변경일)
  stSql := stSql + '  K_CARD_CNT varchar(10)   NULL,';      //카드발급차수
  stSql := stSql + '  K_SEND char(10)   NULL';      //연동 유무
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);


  stSql := 'CREATE TABLE TB_HonikMCardTempTable ( ';
  stSql := stSql + '  M_KEY varchar(40)  NULL,';    //학번
  stSql := stSql + '  M_CARDTYPE varchar(1)   NULL,';        //카드구분(0:모바일신분증, 1:카드신분증)
  stSql := stSql + '  M_CARDCNT varchar(2)   NULL,';  //발급차수
  stSql := stSql + '  M_CARDSTOP varchar(6)  NULL,';         //분실여부코드(0:정상, 1:분실, 2:정지)
  stSql := stSql + '  M_UPDT varchar(14)   NULL,';  //트랜잭션시간(YYYYMMDDHHMMSS)
  stSql := stSql + '  K_GUBUN char(10) NULL,';               //구분
  stSql := stSql + '  K_CARD_CNT varchar(2) NULL,';          //실물카드 발급 차수
  stSql := stSql + '  M_CARD_GUBUN varchar(2) NULL';        //인증수단 구분(0.NFC,1.BLE)
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);   *)


  stSql := 'CREATE TABLE TB_HonikTempTable2 ( ';
  stSql := stSql + '  K_CAMPUS integer  NULL,';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_LEVEL1 varchar(6)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME varchar(100)   NULL,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 varchar(6)  NULL,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME varchar(100)   NULL,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN char(10) NULL,';               //구분
  stSql := stSql + '  K_GUBUN_NAME varchar(100)  NULL, ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_GUBUN_CHANGE varchar(1)  NULL, ';   //구분 변경 유무
  stSql := stSql + '  K_NAME varchar(100)    NULL,';        //성명
  stSql := stSql + '  K_KEY varchar(50)    NULL,';       //학번 ( 종번 )
  stSql := stSql + '  M_CARDTYPE varchar(10)   NULL,';      //카드구분
  stSql := stSql + '  K_CARD_CNT varchar(10)   NULL,';      //카드발급차수
  stSql := stSql + '  M_CARDSTOP varchar(10)   NULL,';      //0:정상, 1:분실, 2:정지
  stSql := stSql + '  K_STATUS integer    NULL,';       //구성원 상태(1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료)
  stSql := stSql + '  K_UPDT integer    NULL,';       //발령일(상태변경일)
  stSql := stSql + '  K_STATE integer   NULL,';      //상태,1.신규,2.업데이트,3,삭제
  stSql := stSql + '  K_CHANGE char(10)   NULL,';      //변경유무
  stSql := stSql + '  K_RELAY char(10)   NULL,';      //연동 유무
  stSql := stSql + '  M_UPDT varchar(14)    NULL,';       //트랜잭션 시간
  stSql := stSql + '  K_CHANGEDATE datetime   NULL';      //변경일
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := 'CREATE TABLE TB_HonikMappingJijum ( ';
  stSql := stSql + '  K_LEVEL1 varchar(6)   NOT NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  CO_COMPANYCODE varchar(3)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  CO_JIJUMCODE varchar(3)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME varchar(100)   NULL,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_CHANGE char(10)   NULL,';      //변경유무
  stSql := stSql + '  K_CHANGEDATE datetime   NULL,';      //변경일
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([K_LEVEL1]) ';
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := 'CREATE TABLE TB_HonikMappingDepart ( ';
  stSql := stSql + '  K_LEVEL1 varchar(6)   NOT NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL2 varchar(6)   NOT NULL,';        //학과코드 ( 소속2)
  stSql := stSql + '  CO_COMPANYCODE varchar(3)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  CO_JIJUMCODE varchar(3)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  CO_DEPARTCODE varchar(3)   NULL,';        //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME varchar(100)   NULL,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_CHANGE char(10)   NULL,';      //변경유무
  stSql := stSql + '  K_CHANGEDATE datetime   NULL,';      //변경일
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([K_LEVEL1],[K_LEVEL2]) ';
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := 'CREATE TABLE TB_HonikMappingPosi ( ';
  stSql := stSql + '  K_GUBUN varchar(6)   NOT NULL,';        //구분코드
  stSql := stSql + '  CO_COMPANYCODE varchar(3)   NULL,';        //단과대코드( 소속 )
  stSql := stSql + '  PO_POSICODE varchar(3)   NULL,';        //직위코드
  stSql := stSql + '  K_GUBUN_NAME varchar(100)   NULL,';  //구분명
  stSql := stSql + '  K_CHANGE char(10)   NULL,';      //변경유무
  stSql := stSql + '  K_CHANGEDATE datetime   NULL,';      //변경일
  stSql := stSql + '  PRIMARY KEY CLUSTERED ([K_GUBUN]) ';
  stSql := stSql + ') ';


  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
