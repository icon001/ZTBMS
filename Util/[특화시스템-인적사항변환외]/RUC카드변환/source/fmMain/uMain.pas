unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls, AdPacket, OoMisc, AdPort,iniFiles, AdvObj;

type
  TfmMain = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    btn_targetAdoConnect: TSpeedButton;
    ed_Host: TEdit;
    rg_dbtype: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    ed_Port: TEdit;
    Label7: TLabel;
    ed_Userid: TEdit;
    Label8: TLabel;
    ed_Passwd: TEdit;
    TargetADOConnection: TADOConnection;
    Label9: TLabel;
    ed_DBName: TEdit;
    targetTempADOQuery: TADOQuery;
    targetADOExecQuery: TADOQuery;
    StatusBar1: TStatusBar;
    ADOSelectOldCardQuery: TADOQuery;
    btnClose: TBitBtn;
    Label1: TLabel;
    ed_empno: TEdit;
    Label2: TLabel;
    ed_CardNo: TEdit;
    lb_Name: TLabel;
    ed_CompanyCode: TEdit;
    pan_Message: TPanel;
    MessageTimer: TTimer;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    Label3: TLabel;
    cmb_Port: TComboBox;
    sg_empList: TAdvStringGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure ed_empnoChange(Sender: TObject);
    procedure ed_empnoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MessageTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_PortChange(Sender: TObject);
    procedure ReaderPortPortOpen(Sender: TObject);
    procedure ReaderPortPortClose(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure sg_empListDblClick(Sender: TObject);
  private
    L_bComportOpen : Boolean;
    L_stCardData : string;
    { Private declarations }
    Function targetAdoConnect:Boolean;
    Function TableCheck : Boolean;
    function CheckTB_NEWCARD : Boolean;
    function CheckTB_NEWDEVICECARDNO : Boolean;
    function CreateTB_NEWCARD : Boolean;
    function CreateTB_NEWDEVICECARDNO : Boolean;
    function GetMaxCardPositionNum:integer;

    function InsertTB_NEWCARD(aCompanyCode,aEmCode,aCardNo:string):Boolean;
    function DeviceGradeCardNOChange(aCompanyCode,aEmCode,aCardNo:string):Boolean;
    function CopyDeviceGradeCard(aOldCardno,aNewCardNo:string):Boolean;
  private
    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  private
    Function GetEmpName(aEmpNo:string;var aCompanyCode:string):string;
    Function ComPortOpen:Boolean;
    Function RcvCardDataByReader(aData:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil;

{$R *.dfm}


procedure TfmMain.FormActivate(Sender: TObject);
begin
  btn_targetAdoConnectClick(self);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  lb_Name.Caption := '';
  GROUPCODE := '1234567890';
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
    cmb_Port.ItemIndex := ini_fun.ReadInteger('CONFIG','COMPORT',0);
    rg_dbtype.ItemIndex := ini_fun.ReadInteger('CONFIG','DBTYPE',1);
    ed_Host.Text := ini_fun.ReadString('CONFIG','HOSTIP','192.168.0.11');
    ed_Port.Text := ini_fun.ReadString('CONFIG','DBPORT','5432');
    ed_Userid.Text := ini_fun.ReadString('CONFIG','DBUSERID','postgres');
    ed_Passwd.Text := ini_fun.ReadString('CONFIG','DBPW','1');
    ed_DBName.Text := ini_fun.ReadString('CONFIG','DBNAME','zmos');
  Finally
    ini_fun.Free;
  End;

end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_targetAdoConnectClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  ed_empno.Enabled := False;
  if targetAdoConnect then
  begin
    btn_targetAdoConnect.Enabled := False;
    TableCheck;
    Label1.Enabled := True;
    Label2.Enabled := True;
    ed_empno.Enabled := True;
    ed_CardNo.Enabled := True;
    ed_empno.SetFocus;
    ed_empno.SelectAll;
    ComPortOpen;
  end else
  begin
    showmessage('데이터베이스 접속실패');
  end;

end;

function TfmMain.targetAdoConnect: Boolean;
var
  conStr : wideString;
begin
  result := False;
  if rg_dbtype.ItemIndex = 0 then  //Mssql
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_Passwd.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_Userid.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_Host.Text  + ',' + ed_Port.Text;
  end else if rg_dbtype.ItemIndex = 1 then   //PostGresql
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + ed_Host.Text + ';'   ;
    conStr := constr + 'location=' + ed_DBName.Text + ';';
    conStr := constr + 'User Id='+ ed_Userid.Text + ';';
    conStr := constr + 'password=' + ed_Passwd.Text;
  end  else
  begin
    showmessage('데이터베이스 타입을 선택 하세요.');
    Exit;
  end;
  with TargetADOConnection do
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

  result := True;
end;


function TfmMain.ProcessExecSQL(aSql: string;bUpdateResult:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := TargetADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;


function TfmMain.TableCheck: Boolean;
begin
  if Not CheckTB_NEWCARD then
  begin
    CreateTB_NEWCARD;
  end;
  if Not CheckTB_NEWDEVICECARDNO then
  begin
    CreateTB_NEWDEVICECARDNO;
  end;
end;

function TfmMain.CheckTB_NEWCARD: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_NEWCARD ';
  with targetTempADOQuery do
  begin
    Try
      Close;
      SQL.Text := stSql;
      Open;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TfmMain.CheckTB_NEWDEVICECARDNO: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_NEWDEVICECARDNO ';
  with targetTempADOQuery do
  begin
    Try
      Close;
      SQL.Text := stSql;
      Open;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TfmMain.CreateTB_NEWCARD: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE TB_NEWCARD ( ';
  stSql := stSql + 'GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + 'CA_CARDNO varchar(20) NOT NULL,';
  stSql := stSql + 'CA_GUBUN char(1) DEFAULT ''1'',';
  stSql := stSql + 'CA_CARDTYPE char(1) NULL,';
  stSql := stSql + 'CO_COMPANYCODE varchar(3) NULL,';
  stSql := stSql + 'EM_CODE varchar(20) NULL,';
  stSql := stSql + 'CA_LASTUSE varchar(8) NULL,';
  stSql := stSql + 'CA_UPDATETIME varchar(14) NULL,';
  stSql := stSql + 'CA_UPDATEOPERATOR varchar(10) NULL,';
  stSql := stSql + 'CA_STATUS varchar(1) DEFAULT ''Y'' NULL,';
  stSql := stSql + 'POSITIONNUM int NULL,';
  stSql := stSql + 'CA_DOORGRADE char(1) DEFAULT ''N'' NULL,';
  stSql := stSql + 'PRIMARY KEY (GROUP_CODE, CA_CARDNO)';
  stSql := stSql + ')';
  
  result := ProcessExecSQL(stSql);
end;

function TfmMain.CreateTB_NEWDEVICECARDNO: Boolean;
var
  stSql : string;
begin
  stSql := 'CREATE TABLE TB_NEWDEVICECARDNO ( ';
  stSql := stSql + 'GROUP_CODE varchar(10) DEFAULT ''1234567890'' NOT NULL, ';
  stSql := stSql + 'AC_NODENO int NOT NULL,';
  stSql := stSql + 'AC_ECUID varchar(2) NOT NULL,';
  stSql := stSql + 'CA_CARDNO varchar(20) NOT NULL,';
  stSql := stSql + 'DE_DOOR1 char(1) NULL,';
  stSql := stSql + 'DE_DOOR2 char(1) NULL,';
  stSql := stSql + 'DE_USEACCESS char(1) NULL,';
  stSql := stSql + 'DE_USEALARM char(1) NULL,';
  stSql := stSql + 'DE_TIMECODE char(1) NULL,';
  stSql := stSql + 'DE_PERMIT char(1) NULL,';
  stSql := stSql + 'DE_RCVACK char(1) NULL,';
  stSql := stSql + 'DE_UPDATETIME varchar(14) NULL,';
  stSql := stSql + 'DE_UPDATEOPERATOR varchar(10) NULL,';
  stSql := stSql + 'AC_MCUID varchar(7) NULL,';
  stSql := stSql + 'PRIMARY KEY (GROUP_CODE, AC_NODENO,AC_ECUID,CA_CARDNO )';
  stSql := stSql + ')';
  result := ProcessExecSQL(stSql);
end;

procedure TfmMain.ed_empnoChange(Sender: TObject);
begin
  ed_CardNo.Text := '';
end;

procedure TfmMain.ed_empnoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stCompanyCode : string;
begin
  MessageTimer.Enabled := False;
  pan_Message.Visible := False;
  
  lb_Name.Caption := GetEmpName(ed_empno.Text,stCompanyCode);
  ed_CompanyCode.Text := stCompanyCode;
  if lb_Name.Caption = '중복사번' then
  begin
    lb_Name.Font.Color := clRed;
  end else
  begin
    lb_Name.Font.Color := clBlue;
  end;
  if ed_CompanyCode.Text <> '' then
  begin
    pan_Message.Visible := True;
    if L_bComportOpen then
      pan_Message.Caption := '등록기에 카드를 태그 하여 주세요.'
    else pan_Message.Caption := '등록기 포트를 확인해 주세요.';
    MessageTimer.Enabled := True;
  end;
end;

function TfmMain.GetEmpName(aEmpNo: string;var aCompanyCode:string): string;
var
  stSql : string;
  nRow : integer;
begin
  result := '';
  aCompanyCode := '';
  stSql := ' Select a.*,b.CO_NAME from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join ( select * from TB_COMPANY where co_gubun = ''1'' ) b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ) ';
  stSql := stSql + ' Where a.EM_CODE = ''' + aEmpNo + ''' ';

  with targetTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if recordCount = 1 then
    begin
      sg_empList.Visible := False;
      aCompanyCode := Findfield('CO_COMPANYCODE').AsString;
      result := Findfield('EM_NAME').AsString;
    end else
    begin
      with sg_empList do
      begin
        Clear;
        RowCount := recordCount + 1;
        cells[0,0] := '회사명';
        cells[1,0] := '이름';
        cells[2,0] := '회사코드';
        ColWidths[2] := 0;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('CO_NAME').AsString;
          cells[1,nRow] := FindField('EM_NAME').AsString;
          cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
          nRow := nRow + 1;
          Next;
        end;
        visible := True;
      end;
    end;
  end;

end;

procedure TfmMain.MessageTimerTimer(Sender: TObject);
begin
  pan_Message.Visible := Not pan_Message.Visible;
end;

function TfmMain.ComPortOpen: Boolean;
begin
  L_bComportOpen := False;
  pan_Message.Caption := '등록기 포트를 확인해 주세요.';
  try
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open := False;

    ApdDataPacket1.AutoEnable := false;
    ApdDataPacket1.StartCond := scString;
    ApdDataPacket1.StartString := #$02;
    ApdDataPacket1.EndCond := [ecString];
    ApdDataPacket1.EndString := #$03;
    ApdDataPacket1.Timeout := 0;
    ReaderPort.ComNumber := cmb_Port.ItemIndex + 1;
    ReaderPort.Open := true;
    ApdDataPacket1.Enabled := True;
  except
    Showmessage('등록기 포트오픈 실패');
  end;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
begin

  ApdDataPacket1.Enabled := False;
  ReaderPort.Open := False;
  Try
    ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\Config.INI');
    ini_fun.writeInteger('CONFIG','COMPORT',cmb_Port.ItemIndex);
    ini_fun.writeInteger('CONFIG','DBTYPE',rg_dbtype.ItemIndex);
    ini_fun.WriteString('CONFIG','HOSTIP',ed_Host.Text);
    ini_fun.WriteString('CONFIG','DBPORT',ed_Port.Text);
    ini_fun.WriteString('CONFIG','DBUSERID',ed_Userid.Text);
    ini_fun.WriteString('CONFIG','DBPW',ed_Passwd.Text);
    ini_fun.WriteString('CONFIG','DBNAME',ed_DBName.Text);
  Finally
    ini_fun.Free;
  End;
end;

procedure TfmMain.cmb_PortChange(Sender: TObject);
begin
  ComPortOpen;
end;

procedure TfmMain.ReaderPortPortOpen(Sender: TObject);
begin
  L_bComportOpen := True;
  if lb_Name.Caption <> '' then
  begin
      pan_Message.Caption := '등록기에 카드를 태그 하여 주세요.';
  end;

end;

procedure TfmMain.ReaderPortPortClose(Sender: TObject);
begin
  L_bComportOpen := False;
end;

procedure TfmMain.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;
end;

function TfmMain.RcvCardDataByReader(aData: string): Boolean;
var
  nIndex : integer;
  stCardNo : string;
begin
  if Not TargetADOConnection.Connected then
  begin
    showmessage('데이터베이스 연결이 안되었습니다.');
    Exit;
  end;
  L_stCardData := L_stCardData + aData;
  nIndex:= Pos(#$2,L_stCardData);
  if nIndex > 1 then Delete(L_stCardData,1,nIndex - 1);  //STX 바로 전까지 삭제 함
  nIndex:= Pos(#$3,L_stCardData);
  if nIndex = 0 then Exit; //ETX가 안들어 왔으면 빠져 나감

  if (ed_CompanyCode.Text = '') or
     (lb_Name.Caption = '중복사번') then
  begin
    pan_Message.Visible := True;
    pan_Message.Caption := '사번을 먼저 입력 하여 주세요.';
    MessageTimer.Enabled := True;
    Exit;
  end;

  stCardNo := copy(L_stCardData,2,nIndex - 2);
  ed_CardNo.Text := stCardNo;
  if Length(stCardno) <> 16 then
  begin
    pan_Message.Visible := True;
    pan_Message.Caption := '카드 포맷이 이상합니다.';
    MessageTimer.Enabled := True;
    Exit;
  end;

  InsertTB_NEWCARD(ed_CompanyCode.Text,ed_empno.Text,stCardNo);
  DeviceGradeCardNOChange(ed_CompanyCode.Text,ed_empno.Text,stCardNo);
  pan_Message.Visible := False;
  MessageTimer.Enabled := False;
  showmessage('등록 완료');
  ed_empno.Text := '';
  ed_CardNo.Text := '';
end;

function TfmMain.DeviceGradeCardNOChange(aCompanyCode, aEmCode,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOSelectOldCardQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      CopyDeviceGradeCard(FindField('CA_CARDNO').AsString,aCardNo);
      Next;
    end;
  end;

end;

function TfmMain.InsertTB_NEWCARD(aCompanyCode, aEmCode,
  aCardNo: string): Boolean;
var
  stSql : string;
  nCardPositionNum : integer;
begin
  nCardPositionNum := GetMaxCardPositionNum;

  stSql := 'Insert Into TB_NEWCARD(';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'POSITIONNUM ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '' + inttostr(nCardPositionNum) + ' ) ';

  result := ProcessExecSQL(stSql);

end;

function TfmMain.GetMaxCardPositionNum: integer;
var
  stSql : string;
begin
  result := 1;

  stSql := ' select Max(POSITIONNUM) as POSITIONNUM from TB_NEWCARD ';

  with targetTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then exit;
    result := FindField('POSITIONNUM').AsInteger + 1;
  end;
end;

function TfmMain.CopyDeviceGradeCard(aOldCardno,
  aNewCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_NEWDEVICECARDNO(';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'ca_cardno,';
  stSql := stSql + 'de_door1,';
  stSql := stSql + 'de_door2,';
  stSql := stSql + 'de_useaccess,';
  stSql := stSql + 'de_usealarm,';
  stSql := stSql + 'de_timecode,';
  stSql := stSql + 'de_permit,';
  stSql := stSql + 'de_rcvack ) ';
  stSql := stSql + ' select ';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + '''' + aNewCardNo + ''',' ;
  stSql := stSql + 'de_door1,';
  stSql := stSql + 'de_door2,';
  stSql := stSql + 'de_useaccess,';
  stSql := stSql + 'de_usealarm,';
  stSql := stSql + 'de_timecode,';
  stSql := stSql + 'de_permit,';
  stSql := stSql + '''N'' ';
  stSql := stSql + ' from TB_DEVICECARDNO ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aOldCardno + ''' ';

  result := ProcessExecSQL(stSql);
end;

procedure TfmMain.sg_empListDblClick(Sender: TObject);
begin
  with sg_empList do
  begin
    if cells[2,Row] = '' then Exit;
    lb_Name.Caption := cells[1,Row];
    ed_CompanyCode.Text := cells[2,Row];
    visible := False;
  end;
  if ed_CompanyCode.Text <> '' then
  begin
    pan_Message.Visible := True;
    if L_bComportOpen then
      pan_Message.Caption := '등록기에 카드를 태그 하여 주세요.'
    else pan_Message.Caption := '등록기 포트를 확인해 주세요.';
    MessageTimer.Enabled := True;
  end;

end;

end.
