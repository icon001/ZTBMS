
unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Buttons,IniFiles, ComCtrls,
  Gauges, FolderDialog, RzButton, dbisamtb,ActiveX;

type
  TfmMain = class(TForm)
    ADOConnection: TADOConnection;
    Notebook1: TNotebook;
    pan_header: TPanel;
    pan_DBConfig: TPanel;
    gr_org: TGroupBox;
    GroupBox1: TGroupBox;
    btn_next: TSpeedButton;
    btn_Close: TSpeedButton;
    Rd_OrgDBType: TRadioGroup;
    gb_MssqlConfig1: TGroupBox;
    Label1: TLabel;
    ed_OrgServerIP: TEdit;
    Label2: TLabel;
    ed_OrgServerPort: TEdit;
    ed_OrgUserID: TEdit;
    Label3: TLabel;
    ed_OrgUserPW: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    ed_OrgDBName: TEdit;
    Rd_DBType: TRadioGroup;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ed_ServerIP: TEdit;
    ed_ServerPort: TEdit;
    ed_UserID: TEdit;
    ed_UserPW: TEdit;
    ed_DBName: TEdit;
    NextImg: TImage;
    CheckImg: TImage;
    ADOOrgConnection: TADOConnection;
    pan_DataConv: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    memList: TMemo;
    GroupBox5: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Gauge_Table: TGauge;
    Gauge_Tot: TGauge;
    StatusBar1: TStatusBar;
    ADOOrgSelectQuery: TADOQuery;
    ADOInsertQuery: TADOQuery;
    gb_DBISAM1: TGroupBox;
    Label13: TLabel;
    ed_DBISAM: TEdit;
    btFileSearch: TRzBitBtn;
    FolderDialog1: TFolderDialog;
    ed_CompanyName: TEdit;
    Label14: TLabel;
    ADOTargetTempQuery: TADOQuery;
    OpenDialog1: TOpenDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure btn_nextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rd_OrgDBTypeClick(Sender: TObject);
    procedure btFileSearchClick(Sender: TObject);
  private
    bClose :Boolean;
    SelectSqlList : TStringList;
    InsertSqlList : TStringList;
    { Private declarations }
    Function AdoOrgConnect : Boolean;
    Function MDBConnect : Boolean;
    Function DBISAMConnect : Boolean;
    Function AdoConnect : Boolean;
    Function AdoTestConnect : Boolean;
    procedure DataConversion;
    procedure LoadingSelect(aSelectFileName:string);
    procedure LoadingInsert(aInsertFileName:string);
    Function SqlCheck:Boolean;
    Function CheckField(aSelectSql,aInsertSql:string):Boolean;
    Function GetSelectCount:integer;
    Function GetMSSQLTableCount(aSql:string):integer;
    Function GetDBISAMTableCount(aSql:string):integer;
    Function GetTB_CARD_PositionMaxNum:integer;
    Function TableAdoToAdoConversion(aSelectSql,aInsertSql:string):Boolean;
    Function TableDBISAMToAdoConversion(aSelectSql,aInsertSql:string):Boolean;
    Function InsertQueryCreate(aSql,aFieldValue:string):string;
    Function GetTableName(aInsertSql:string):string;
    Function InsertProcess(aSql:string):Boolean;
  private
    Function NodeConversion:Boolean;
    Function DoorConversion:Boolean;
    Function AlarmdeviceConversion:Boolean;
    Function FoodDeviceConversion:Boolean;
    Function CreateCompanyCode:Boolean;
    Function CompanyCodeConversion:Boolean;
    Function JijumCodeConversion:Boolean;
    Function DepartCodeConversion:Boolean;
    Function PosiCodeConversion:Boolean;
    Function EmployeeConversion:Boolean;
    Function CardConversion:Boolean;
    Function DeviceCardNoConversion:Boolean; //카드권한

    Function CheckTB_ACCESSDEVICE(aNodeNo,aEcuID:string):Boolean;
    Function InsertIntoTB_ACCESSDEVICE(aNodNo,aEcuID,aDeviceName,
                                      aViewSeq,aAcType,aAtType,aFdType,
                                      aPtType,aBuildingCode,aFloorCode,
                                      aAreaCode,aLocateUse,atotW,aTotH,
                                      aCurX,aCurY,aIP,aPort,aMcuID,aNetType,
                                      aDeviceGubun,aSendAck,aDaemonGubun,
                                      aHoSend:string):Boolean;
    Function UpdateTB_ACCESSDEVICE(aNodNo,aEcuID,aDeviceName,
                                      aViewSeq,aAcType,aAtType,aFdType,
                                      aPtType,aBuildingCode,aFloorCode,
                                      aAreaCode,aLocateUse,atotW,aTotH,
                                      aCurX,aCurY,aIP,aPort,aMcuID,aNetType,
                                      aDeviceGubun,aSendAck,aDaemonGubun,
                                      aHoSend:string):Boolean;
    Function CheckTB_DOOR(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function InsertIntoTB_DOOR(aNodeNo,aEcuID,aDoorNo,aDoorName,aViewSeq,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY,aFdmsID,aResverState,
                          aRelaySend,aDoorGubun:string):Boolean;
    Function UpdateTB_DOOR(aNodeNo,aEcuID,aDoorNo,aDoorName,aViewSeq,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY,aFdmsID,aResverState,
                          aRelaySend,aDoorGubun:string):Boolean;
    Function CheckTB_ALARMDEVICE(aNodeNo,aEcuID:string):Boolean;
    Function InsertIntoTB_ALARMDEVICE(aNodeNo,aEcuID,aAlarmName,aViewSeq,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY:string):Boolean;
    Function UpdateTB_ALARMDEVICE(aNodeNo,aEcuID,aAlarmName,aViewSeq,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY:string):Boolean;
    Function InsertIntoTB_ZONEDEVICE(aNodeNo,aEcuID,aZoneNum,aZoneName,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY,aWatchType,aSendAck,
                          aZoneStop:string):Boolean;
    Function CheckTB_FOOD(aNodeNo,aEcuID,aDoorNo:string):Boolean;
    Function InsertIntoTB_FOOD(aNodeNo,aEcuID,aDoorNo,aDoorName,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY,aMcuID,aSendAck:string):Boolean;
    Function UpdateTB_FOOD(aNodeNo,aEcuID,aDoorNo,aDoorName,
                          aBuildingCode,aFloorCode,aAreaCode,aLocateUse,
                          atotW,aTotH,aCurX,aCurY,aMcuID,aSendAck:string):Boolean;
    Function CheckTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode:string):Boolean;
    Function InsertTB_Company(aCompanyCode,aJijumCode,aDepartCode,aName,aGubun:string):Boolean;
    Function UpdateTB_Company(aCompanyCode,aJijumCode,aDepartCode,aName,aGubun:string):Boolean;
    Function CheckTB_POSI(aCompanyCode,aPosiCode:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function UpdateTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function CheckTB_Employee(aCompanyCode,aEmployeeNo:string):Boolean;
    Function InsertIntoTB_Employee(aCompanyCode,aEmployeeNo,
                              aJijumCode,aDepartCode,aPosiCode,
                              aEmName,aCoPhone,aHandPhone,aZipCode,
                              aAddr1,aAddr2,aJoinDate,aRetireDate,
                              aUpdatTime,aOperater,aFdmsID,aFdmsRelay,
                              aRelayCode,aRelayState:string):Boolean;
    Function UpdateTB_Employee(aCompanyCode,aEmployeeNo,
                              aJijumCode,aDepartCode,aPosiCode,
                              aEmName,aCoPhone,aHandPhone,aZipCode,
                              aAddr1,aAddr2,aJoinDate,aRetireDate,
                              aUpdatTime,aOperater,aFdmsID,aFdmsRelay,
                              aRelayCode,aRelayState:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertIntoTB_CARD(aCardNo,aCardGubun,aCardState,aCompanyCode,
                          aEmployeeNo,aUpdateTime,aOperater,aPositionNum,aRelayState:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardState,aCompanyCode,
                          aEmployeeNo,aUpdateTime,aOperater,aRelayState:string):Boolean;
    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmployeeNo,afdmsid,
                        aMode,aSendStatus,aCardNo,aCardState,aSendStatus2,
                        aInsertTime,aEmName,aHandPhone,aCompanyName,
                        aJijumName,aDepartName,aPosiName,aRelayState:string):Boolean;
    Function CheckTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo:string):Boolean;
    Function InsertIntoTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo,aDoor1,aDoor2,
                                      aUseAccess,aUseAlarm,aTimeCode,aPermit,
                                      aRcvAck,aUpdateTime,aOperater,aMcuID,
                                      aRelayState:string):Boolean; //Relay
    Function UpdateTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo,aDoor1,aDoor2,
                                      aUseAccess,aUseAlarm,aTimeCode,aPermit,
                                      aRcvAck,aUpdateTime,aOperater,aMcuID,
                                      aRelayState:string):Boolean; //Relay

    Function ProcessTargetExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;

  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uLomosUtil;
{$R *.dfm}

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Notebook1PageChanged(Sender: TObject);
begin
  pan_Header.Caption := NoteBook1.ActivePage;
end;

procedure TfmMain.btn_nextClick(Sender: TObject);
begin
  if NoteBook1.PageIndex = 0 then
  begin
    if Rd_OrgDBType.ItemIndex = 1 then
    begin
      if Not MDBConnect then
      begin
        ShowMessage('원본데이터베이스 접속환경 설정이 잘못 되었습니다.');
        Exit;
      end;
      {if ed_CompanyName.Text = '' then
      begin
        showmessage('회사명을 입력하셔야 합니다.');
        Exit;
      end; }
    end else if Rd_OrgDBType.ItemIndex = 0 then
    begin
      if Not AdoOrgConnect then
      begin
        ShowMessage('원본데이터베이스 접속환경 설정이 잘못 되었습니다.');
        Exit;
      end;
    end;

    if Not AdoConnect then
    begin
      ShowMessage('변경할 데이터베이스 접속환경 설정이 잘못 되었습니다.');
      Exit;
    end;   {
    if Not AdoTestConnect then
    begin
      ShowMessage('변경할 데이터베이스 접속환경 설정이 잘못 되었습니다.');
      Exit;
    end;  }

    
    NoteBook1.PageIndex := NoteBook1.PageIndex + 1;
    btn_next.Glyph := CheckImg.Picture.Bitmap;
    btn_next.Caption := '변환';
  end else
  begin
    DataConversion;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  bClose := False;
  Notebook1.PageIndex := 0;
  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\DBConv.ini');
  ed_OrgServerIP.Text  := ini_fun.ReadString('원본DB','ServerIP','127.0.0.1');
  ed_OrgServerPort.Text  := ini_fun.ReadString('원본DB','ServerPORT','1433');
  ed_OrgDBName.Text  := ini_fun.ReadString('원본DB','DBName','');
  ed_OrgUserID.Text  := ini_fun.ReadString('원본DB','UserID','');
  ed_OrgUserPW.Text  := ini_fun.ReadString('원본DB','UserPW','');

  ed_ServerIP.Text  := ini_fun.ReadString('DB','ServerIP','127.0.0.1');
  ed_ServerPort.Text  := ini_fun.ReadString('DB','ServerPORT','1433');
  ed_DBName.Text  := ini_fun.ReadString('DB','DBName','zmos');
  ed_UserID.Text  := ini_fun.ReadString('DB','UserID','sa');
  ed_UserPW.Text  := ini_fun.ReadString('DB','UserPW','sapasswd');
  ini_fun.free;

  btn_next.Glyph := NextImg.Picture.Bitmap;

  SelectSqlList := TStringList.Create;
  InsertSqlList := TStringList.Create;

end;

function TfmMain.AdoConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := '';
  if Rd_DBType.ItemIndex = 0 then
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    //conStr := 'Provider=PostgreSQL.1;';
    conStr := constr + 'Data Source=' + ed_ServerIP.Text + ';'   ;
    conStr := constr + 'location=' + ed_DBName.Text + ';';
    conStr := constr + 'User Id='+ ed_UserID.Text + ';';
    conStr := constr + 'password=' + ed_UserPW.Text;

{    conStr := 'Provider=MSDASQL.1;Persist Security Info=False;';
    conStr := conStr + 'Extended Properties="DSN=PostgreSQL35W;DATABASE=' + ed_DBName.Text + ';';
    conStr := conStr + 'SERVER=' + ed_ServerIP.Text + ';PORT=5432;UID='+ ed_UserID.Text + ';PWD=' + ed_UserPW.Text + ';SSLmode=disable;';
    conStr := conStr + 'ReadOnly=0;Protocol=7.4;FakeOidIndex=0;ShowOidColumn=0;';
    conStr := conStr + 'RowVersioning=0;ShowSystemTables=0;ConnSettings=;Fetch=100;';
    conStr := conStr + 'Socket=4096;UnknownSizes=0;MaxVarcharSize=255;MaxLongVarcharSize=8190;';
    conStr := conStr + 'Debug=0;CommLog=0;Optimizer=1;Ksqo=1;UseDeclareFetch=0;TextAsLongVarchar=1;';
    conStr := conStr + 'UnknownsAsLongVarchar=0;BoolsAsChar=1;Parse=0;CancelAsFreeStmt=0;';
    conStr := conStr + 'ExtraSysTablePrefixes=dd_;;LFConversion=1;UpdatableCursors=1;';
    conStr := conStr + 'DisallowPremature=0;TrueIsMinus1=0;BI=0;ByteaAsLongVarBinary=0;UseServerSidePrepare=0;LowerCaseIdentifier=0;XaOpt=1"';
}
  end else if Rd_DBType.ItemIndex = 1 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_UserPW.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_UserID.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_ServerIP.Text  + ',' + ed_ServerPort.Text;
  end;
  with ADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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

function TfmMain.AdoOrgConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := '';
  if Rd_OrgDBType.ItemIndex = 0 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_OrgUserPW.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_OrgUserID.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_OrgDBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_OrgServerIP.Text  + ',' + ed_OrgServerPort.Text;
  end;

  with ADOOrgConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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
  end;

  result := True;

end;

function TfmMain.AdoTestConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := '';
  if Rd_OrgDBType.ItemIndex = 0 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_UserPW.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_UserID.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_ServerIP.Text  + ',1433';
  end;

  with ADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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
  end;

  result := True;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  bClose := True;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\DBConv.ini');
  ini_fun.WriteString('원본DB','ServerIP',ed_OrgServerIP.Text);
  ini_fun.WriteString('원본DB','ServerPORT',ed_OrgServerPort.Text);
  ini_fun.WriteString('원본DB','DBName',ed_OrgDBName.Text);
  ini_fun.WriteString('원본DB','UserID',ed_OrgUserID.Text);
  ini_fun.WriteString('원본DB','UserPW',ed_OrgUserPW.Text);

  ini_fun.WriteString('DB','ServerIP',ed_ServerIP.Text);
  ini_fun.WriteString('DB','ServerPORT',ed_ServerPort.Text);
  ini_fun.WriteString('DB','DBName',ed_DBName.Text);
  ini_fun.WriteString('DB','UserID',ed_UserID.Text);
  ini_fun.WriteString('DB','UserPW',ed_UserPW.Text);
  ini_fun.free;

  SelectSqlList.Free;
  InsertSqlList.Free;

end;

procedure TfmMain.DataConversion;
begin
  btn_next.Enabled := False;
  Gauge_Tot.MaxValue := 1000;

  NodeConversion;
  DoorConversion;
  AlarmdeviceConversion;
  FoodDeviceConversion;
  //CreateCompanyCode;
  CompanyCodeConversion;
  JijumCodeConversion;
  //DepartCodeConversion;
  PosiCodeConversion;
  EmployeeConversion;
  CardConversion;
  DeviceCardNoConversion; //카드권한

  btn_next.Enabled := True; 

end;

procedure TfmMain.LoadingInsert(aInsertFileName: string);
var
  TempList : TStringList;
  i : integer;
  stSql : string;
begin
  InsertSqlList.Clear;
  stSql := '';
  TempList := TStringList.Create;
  TempList.Clear;
  TempList.LoadFromFile(aInsertFileName);
  for i:=0 to TempList.Count - 1 do
  begin
    if Pos(';',TempList.Strings[i]) > 0 then
    begin
      stSql := stSql + ' ' + TempList.Strings[i];
      stSql := stringReplace(stSql,';','',[rfReplaceAll]);
      InsertSqlList.Add(stSql);
      stSql := '';
    end else
    begin
      stSql := stSql + ' ' + TempList.Strings[i];
    end;
  end;
  TempList.Free;

end;

procedure TfmMain.LoadingSelect(aSelectFileName: string);
var
  TempList : TStringList;
  i : integer;
  stSql : string;
begin
  SelectSqlList.Clear;
  stSql := '';
  TempList := TStringList.Create;
  TempList.Clear;
  TempList.LoadFromFile(aSelectFileName);
  for i:=0 to TempList.Count - 1 do
  begin
    if Pos(';',TempList.Strings[i]) > 0 then
    begin
      stSql := stSql + ' ' + TempList.Strings[i];
      stSql := stringReplace(stSql,';','',[rfReplaceAll]);
      SelectSqlList.Add(stSql);
      stSql := '';
    end else
    begin
      stSql := stSql + ' ' + TempList.Strings[i];
    end;
  end;
  TempList.Free;
end;

function TfmMain.SqlCheck: Boolean;
var
  i : integer;
begin
  result := False;
  if SelectSqlList.Count <> InsertSqlList.Count then   //Select 쿼리문과 Insert Query 문이 갯수가 틀리면 에러
  begin
    memList.Lines.Add(' 조회 쿼리문과 입력 쿼리문의 갯수가 상이 합니다.');
    showmessage('조회 쿼리문과 입력 쿼리문의 갯수가 상이 합니다.');
    Exit;
  end;
  for i:=0 to SelectSqlList.Count - 1 do
  begin
    if Not CheckField(SelectSqlList.Strings[i],InsertSqlList.Strings[i]) then
    begin
      memList.Lines.Add(' ' + SelectSqlList.Strings[i] + ' 문과 매치되는 입력 쿼리문의 필드 갯수가 상이 합니다.');
      showmessage(SelectSqlList.Strings[i] + ' 문과 매치되는 입력 쿼리문의 필드 갯수가 상이 합니다.');
      Exit;
    end;
  end;
  result := True;
end;

function TfmMain.CheckField(aSelectSql, aInsertSql: string): Boolean;
var
  nPos : integer;
  stSelect : string;
  nSelectCount,nInsertCount:integer;
  nfirstPos,nlastPos:integer;
begin
  result := False;
  nPos := Pos('from',aSelectSql);
  stSelect := copy(aSelectSql,1,nPos - 1);
  nfirstPos := Pos('(',stSelect);
  while nfirstPos <> 0 do
  begin
    nLastPos := Pos(')',stSelect);
    stSelect := copy(stSelect,1,nFirstPos - 1) + copy(stSelect,nLastPos + 1,length(stSelect) - nLastPos);
    nfirstPos := Pos('(',stSelect);
  end;
  nSelectCount := posCount(',',stSelect);
  nInsertCount := posCount('[',aInsertSql);
  if (nSelectCount + 1) = nInsertCount then result := True;
end;

function TfmMain.GetSelectCount: integer;
var
  nCount : integer;
  i : integer;
begin
  nCount := 0;
  for i:=0 to SelectSqlList.Count - 1 do
  begin
    if Rd_OrgDBType.ItemIndex = 0 then
      nCount := nCount + GetMSSQLTableCount(SelectSqlList.Strings[i])
    else if Rd_OrgDBType.ItemIndex = 1 then
      nCount := nCount + GetDBISAMTableCount(SelectSqlList.Strings[i]);
    Application.ProcessMessages;
  end;
  result := nCount;
end;

function TfmMain.GetMSSQLTableCount(aSql: string): integer;
begin
  result := 0;
  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := aSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := recordCount;
  end;
end;

function TfmMain.TableAdoToAdoConversion(aSelectSql, aInsertSql: string): Boolean;
var
  stSql : string;
  i : integer;
  stTableName : string;
begin
  stTableName := GetTableName(aInsertSql);
  memList.Lines.Add( stTableName + ' 테이블 작업 시작.');
  StatusBar1.Panels[0].Text := stTableName + ' 테이블 작업중....';

  result := false;

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := aSelectSql;
    Try
      Open;
    Except
      showmessage('테이블 Open 실패');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;
    While Not Eof do
    begin
      if bClose then Exit;
      stSql := aInsertSql;
      for i := 0 to FieldCount - 1 do
      begin
        stSql := InsertQueryCreate(stSql,Fields[i].AsString);
      end;
      InsertProcess(stSql);
      Gauge_Table.Progress := Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := Gauge_Tot.Progress + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
end;

function TfmMain.InsertQueryCreate(aSql, aFieldValue: string): string;
var
  stSql : string;
  stFieldType : string;
  stSql1,stSql2 : string;
  nPos1 : integer;
  nPos2 : integer;
begin
  nPos1 := Pos('[',aSql);
  nPos2 := Pos(']',aSql);
  stSql1 := copy(aSql,1,nPos1 -1);
  stFieldType := copy(aSql,nPos1 + 1,nPos2 - nPos1 - 1);
  stSql2 := copy(aSql,nPos2+1,Length(aSql) - nPos2);
  if UpperCase(stFieldType) = 'INT' then
  begin
    if Not isDigit(aFieldValue) then aFieldValue := '0';
    stSql := stSql1 + ' ' + aFieldValue + ' ' + stSql2;
  end else
  begin
    stSql := stSql1 + ' ''' + aFieldValue + ''' ' + stSql2;
  end;
  result := stSql;
end;

function TfmMain.GetTableName(aInsertSql: string): string;
var
  stSql : string;
  nPos : integer;
  stHeader : string;
  stTableName:string;
begin
  stSql := Trim(aInsertSql);
  nPos := Pos(' ',stSql);
  stHeader := copy(stSql,1,nPos - 1);
  if UpperCase(stHeader) = 'INSERT' then
  begin
    nPos := Pos('VALUE',UpperCase(aInsertSql));
    stSql := copy(aInsertSql,1,nPos - 1);
    nPos := Pos('(',stSql);
    if nPos > 0 then
    begin
      stSql := copy(stSql,1,nPos - 1);
    end;
    nPos := Pos('INTO',UpperCase(stSql));
    stTableName := Trim(copy(stSql,nPos + 5,Length(stSql) - nPos -5));
  end else if UpperCase(stHeader) = 'UPDATE' then
  begin
    nPos := Pos('SET',UpperCase(aInsertSql));
    stSql := copy(aInsertSql,1,nPos - 1);
    nPos := Pos('UPDATE',UpperCase(stSql));
    stTableName := Trim(copy(stSql,nPos + 7,Length(stSql) - nPos -7));
  end else
  begin
    stTableName := '';
  end;
  result := stTableName;
end;

function TfmMain.InsertProcess(aSql: string): Boolean;
begin
  result := False;
  with ADOInsertQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := aSql;
    Try
      ExecSql;
    Except
      memList.Lines.Add(aSql + ' 실패');
      Exit;
    End;
  end;
  result := True;
end;

procedure TfmMain.Rd_OrgDBTypeClick(Sender: TObject);
begin
  if rd_OrgDBType.ItemIndex = 0 then
  begin
    gb_MssqlConfig1.Visible := True;
    gb_MssqlConfig1.Left := 152;
    gb_MssqlConfig1.Top := 24;
    gb_DBISAM1.Visible := False;
    gb_DBISAM1.Left := 152;
    gb_DBISAM1.Top := 24;
  end else if rd_OrgDBType.ItemIndex = 1 then
  begin
    gb_MssqlConfig1.Visible := False;
    gb_MssqlConfig1.Left := 152;
    gb_MssqlConfig1.Top := 24;
    gb_DBISAM1.Visible := True;
    gb_DBISAM1.Left := 152;
    gb_DBISAM1.Top := 24;
  end;
end;

procedure TfmMain.btFileSearchClick(Sender: TObject);
begin
  //OpenDialog1.Title:= '파일 찾기';
  //OpenDialog1.DefaultExt:= '';
  //OpenDialog1.Filter := 'MDB files (*.mdb)|*.mdb';
  if FolderDialog1.Execute then
  begin
    ed_DBISAM.Text := FolderDialog1.Directory;
  end;
  
  
end;

function TfmMain.DBISAMConnect: Boolean;
begin
  result := False;
(*  DBISAMDatabase1.Directory:= ed_DBISAM.Text;
  DBISAMSession1.SessionType:=stLocal;
  DBISAMSession1.PrivateDir:= ed_DBISAM.Text;
  
  Try
    DBISAMDatabase1.Connected:= True;
  except
    on E : EDatabaseError do
    begin
      //MessageDlg(E.Message, mtError, [mbOK], 0);
      Exit;
    end;
  end;
  result:= True; *)
end;

function TfmMain.TableDBISAMToAdoConversion(aSelectSql,
  aInsertSql: string): Boolean;
var
  stSql : string;
  i : integer;
  stTableName : string;
begin
  stTableName := GetTableName(aInsertSql);
  memList.Lines.Add( stTableName + ' 테이블 작업 시작.');
  StatusBar1.Panels[0].Text := stTableName + ' 테이블 작업중....';

  result := false;
(*
  with DBISAMOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := aSelectSql;
    Try
      Open;
    Except
      showmessage('테이블 Open 실패');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;
    While Not Eof do
    begin
      if bClose then Exit;
      stSql := aInsertSql;
      for i := 0 to FieldCount - 1 do
      begin
        stSql := InsertQueryCreate(stSql,Fields[i].AsString);
      end;
      InsertProcess(stSql);
      Gauge_Table.Progress := Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := Gauge_Tot.Progress + 1;
      Next;
      Application.ProcessMessages;
    end;
  end; *)
end;

function TfmMain.GetDBISAMTableCount(aSql: string): integer;
begin
  result := 0;
(*  with DBISAMOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := aSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := recordCount;
  end; *)
end;

function TfmMain.AlarmdeviceConversion: Boolean;
var
  stSql : string;
begin
  memList.Lines.Add('Alarmdevice Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_ALARMDEVICE';


  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('Alarmdevice Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin

      if Not CheckTB_ALARMDEVICE(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString) then
      begin
        InsertIntoTB_ALARMDEVICE(FindField('AC_NODENO').AsString,
                          FindField('AC_ECUID').AsString,
                          FindField('AL_ZONENAME').AsString,
                          FindField('AL_VIEWSEQ').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0');  //CurY
      end else
      begin
        UpdateTB_ALARMDEVICE(FindField('AC_NODENO').AsString,
                          FindField('AC_ECUID').AsString,
                          FindField('AL_ZONENAME').AsString,
                          FindField('AL_VIEWSEQ').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0');  //CurY
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 200 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.CardConversion: Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  //stCompanyCode := '001';
  memList.Lines.Add('Card Conversion Start!!!');
  result := False;

  nPositionNum := GetTB_CARD_PositionMaxNum;
  stSql := 'Select * from TB_CARD ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('TB_CARD Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin
      nPositionNum := nPositionNum + 1;
      if Not CheckTB_CARD(FindField('CA_CARDNO').AsString) then
      begin

        InsertIntoTB_CARD(FindField('CA_CARDNO').AsString,
                          FindField('CA_GUBUN').AsString,//CARD 구분
                          FindField('CA_CARDTYPE').AsString,//등록상태
                          FindField('CO_COMPANYCODE').AsString,
                          FindField('EM_CODE').AsString,
                          FormatDateTime('yyyymmddhhnnss',now),
                          'SYSTEM',
                          inttostr(nPositionNum),
                          'N'//CA_Relay
                          );
      end else
      begin
        UpdateTB_CARD(FindField('CA_CARDNO').AsString,
                          FindField('CA_GUBUN').AsString,//CARD 구분
                          FindField('CA_CARDTYPE').AsString,//등록상태
                          FindField('CO_COMPANYCODE').AsString,
                          FindField('EM_CODE').AsString,
                          FormatDateTime('yyyymmddhhnnss',now),
                          'SYSTEM',
                          'N'//CA_Relay
                          );
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 800 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.CreateCompanyCode: Boolean;
begin
  memList.Lines.Add('CreateCompanyCode Start!!!');
  InsertTB_Company('001','000','000',ed_CompanyName.Text,'1');
  Gauge_Tot.Progress := 400 + Gauge_Table.PercentDone;
end;

function TfmMain.DepartCodeConversion: Boolean;
var
  stSql : string;
  stJijumCode : string;
begin
(*  memList.Lines.Add('DepartCode Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_DEPART ';

  with DBISAMOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('DepartCode Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    if FindField('COMPANY_CODE').IsNull then stJijumCode := '001'
    else if FindField('COMPANY_CODE').AsString = '' then stJijumCode := '001'
    else stJijumCode := FindField('COMPANY_CODE').AsString;

    while Not Eof do
    begin

      if Not CheckTB_COMPANY('001',stJijumCode,FindField('DEPART_CODE').AsString) then
      begin
        InsertTB_Company('001',stJijumCode,FindField('DEPART_CODE').AsString,FindField('DEPART_NAME1').AsString,'3');
      end else
      begin
        UpdateTB_Company('001',stJijumCode,FindField('DEPART_CODE').AsString,FindField('DEPART_NAME1').AsString,'3');
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 600 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;  *)
end;

function TfmMain.DeviceCardNoConversion: Boolean;
var
  stSql : string;
begin
  memList.Lines.Add('DeviceCardNo Conversion Start!!!');
  result := False;
  stSql := 'Select * ';
  stSql := stSql + ' from TB_DEVICECARDNO ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('DeviceCardNo Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin
      if Not CheckTB_DEVICECARDNO(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('CA_CARDNO').AsString) then
      begin
        InsertIntoTB_DEVICECARDNO(FindField('AC_NODENO').AsString,
                                      FindField('AC_ECUID').AsString,
                                      FindField('CA_CARDNO').AsString,
                                      FindField('DE_DOOR1').AsString,
                                      FindField('DE_DOOR2').AsString,
                                      FindField('DE_USEACCESS').AsString,
                                      FindField('DE_USEALARM').AsString,
                                      FindField('DE_TIMECODE').AsString,
                                      FindField('DE_PERMIT').AsString,
                                      FindField('DE_RCVACK').AsString,
                                      FormatDateTime('yyyymmddhhnnss',now),
                                      'SYSTEM',//Operater
                                      FindField('AC_MCUID').AsString,
                                      'N'); //Relay

      end else
      begin
        UpdateTB_DEVICECARDNO(FindField('AC_NODENO').AsString,
                                      FindField('AC_ECUID').AsString,
                                      FindField('CA_CARDNO').AsString,
                                      FindField('DE_DOOR1').AsString,
                                      FindField('DE_DOOR2').AsString,
                                      FindField('DE_USEACCESS').AsString,
                                      FindField('DE_USEALARM').AsString,
                                      FindField('DE_TIMECODE').AsString,
                                      FindField('DE_PERMIT').AsString,
                                      FindField('DE_RCVACK').AsString,
                                      FormatDateTime('yyyymmddhhnnss',now),
                                      'SYSTEM',//Operater
                                      FindField('AC_MCUID').AsString,
                                      'N'); //Relay
      end;

      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 900 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.DoorConversion: Boolean;
var
  stSql : string;
begin
  memList.Lines.Add('DOOR Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_DOOR ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('DOOR Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin

      if Not CheckTB_DOOR(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString) then
      begin
        InsertIntoTB_DOOR(FindField('AC_NODENO').AsString,
                          FindField('AC_ECUID').AsString,
                          FindField('DO_DOORNO').AsString,
                          FindField('DO_DOORNONAME').AsString,
                          FindField('DO_VIEWSEQ').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0',  //CurY
                          FindField('FDMS_ID').AsString,
                          'N', //DoorStateRevers 상태값 거꾸로
                          'N', //Relay Send
                          '000' //Door Gubun
                          );
      end else
      begin
        UpdateTB_DOOR(FindField('AC_NODENO').AsString,
                      FindField('AC_ECUID').AsString,
                      FindField('DO_DOORNO').AsString,
                      FindField('DO_DOORNONAME').AsString,
                      FindField('DO_VIEWSEQ').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0',  //CurY
                      FindField('FDMS_ID').AsString,
                          'N', //DoorStateRevers 상태값 거꾸로
                          'N', //Relay Send
                          '000' //Door Gubun
                          );
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 100 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;


function TfmMain.EmployeeConversion: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  stEmployeeNo : string;
  stRgCode : string;
begin
  memList.Lines.Add('Employee Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_EMPLOYEE ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('Employee Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin
      if Not CheckTB_Employee(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString) then
      begin
        InsertIntoTB_Employee(FindField('CO_COMPANYCODE').AsString,
                              FindField('EM_CODE').AsString,
                              FindField('CO_JIJUMCODE').AsString,
                              FindField('CO_DEPARTCODE').AsString,
                              FindField('PO_POSICODE').AsString,
                              FindField('EM_NAME').AsString,
                              '',//회사전화번호
                              '',//핸드폰
                              '',//우편번호
                              '',//주소1
                              '',//주소2
                              formatdateTime('yyyymmdd',now),//입사일
                              '99991231',//퇴사일
                              formatdateTime('yyyymmddhhnnss',now),//updateTime
                              'SYSTEM',//operate
                              FindField('FDMS_ID').AsString,
                              'N',  //fdms_relay
                              FindField('RG_CODE').AsString,//rg_code
                              'N'   //em_relay
                              );
      end else
      begin
        UpdateTB_Employee(FindField('CO_COMPANYCODE').AsString,
                          FindField('EM_CODE').AsString,
                          FindField('CO_JIJUMCODE').AsString,
                          FindField('CO_DEPARTCODE').AsString,
                          FindField('PO_POSICODE').AsString,
                          FindField('EM_NAME').AsString,
                              '',//회사전화번호
                              '',//핸드폰
                              '',//우편번호
                              '',//주소1
                              '',//주소2
                              formatdateTime('yyyymmdd',now),//입사일
                              '99991231',//퇴사일
                              formatdateTime('yyyymmddhhnnss',now),//updateTime
                              'SYSTEM',//operate
                              FindField('FDMS_ID').AsString,
                              'N',  //fdms_relay
                              FindField('RG_CODE').AsString,//rg_code
                              'N'   //em_relay
                              );
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 800 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.FoodDeviceConversion: Boolean;
var
  stSql : string;
  nViewSeq : integer;
  stAcType : string;
  stAtType : string;
  stFdType : string;
  stPtType : string;
  stDeviceGubun : string;
begin
  memList.Lines.Add('FoodDevice Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_FOOD ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('FoodDevice Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;
    nViewSeq := 0;

    while Not Eof do
    begin

      if Not CheckTB_FOOD(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('FO_DOORNO').AsString) then
      begin
        InsertIntoTB_FOOD(FindField('AC_NODENO').AsString,
                          FindField('AC_ECUID').AsString,
                          FindField('FO_DOORNO').AsString,
                          FindField('FO_NAME').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0',  //CurY
                          FindField('AC_MCUID').AsString, //MCUID
                          'N'   //SendAck
                          );
      end else
      begin
        UpdateTB_FOOD(FindField('AC_NODENO').AsString,
                      FindField('AC_ECUID').AsString,
                      FindField('FO_DOORNO').AsString,
                      FindField('FO_NAME').AsString,
                          '000',//Building
                          '000',//Floor
                          '000',//Area
                          'N',  //LocateUse
                          '0',  //totWidth
                          '0',  //totH
                          '0',  //curX
                          '0',  //CurY
                      FindField('AC_MCUID').AsString, //MCUID
                          'N'   //SendAck
                          );  //CurY
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 300 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.JijumCodeConversion: Boolean;
var
  stSql : string;
  stCompanyCode : string;
begin
(*  memList.Lines.Add('JijumCode Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_DEPART ';

  with DBISAMOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('JijumCode Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    if FindField('COMPANY_CODE').IsNull then stCompanyCode := '001'
    else if FindField('COMPANY_CODE').AsString = '' then stCompanyCode := '001'
    else stCompanyCode := FindField('COMPANY_CODE').AsString;

    while Not Eof do
    begin

      if Not CheckTB_COMPANY(stCompanyCode,FindField('DEPART_CODE').AsString,'000') then
      begin
        InsertTB_Company(stCompanyCode,FindField('DEPART_CODE').AsString,'000',FindField('DEPART_NAME1').AsString,'2');
      end else
      begin
        UpdateTB_Company(stCompanyCode,FindField('DEPART_CODE').AsString,'000',FindField('DEPART_NAME1').AsString,'2');
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 600 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
*)
{  memList.Lines.Add('JijumCode Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_COMPANY ';

  with DBISAMOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('JijumCode Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin

      if Not CheckTB_COMPANY('001',FindField('CO_CODE').AsString,'000') then
      begin
        InsertTB_Company('001',FindField('CO_CODE').AsString,'000',FindField('CO_NAME1').AsString,'2');
      end else
      begin
        UpdateTB_Company('001',FindField('CO_CODE').AsString,'000',FindField('CO_NAME1').AsString,'2');
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 500 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True; }
end;

function TfmMain.NodeConversion: Boolean;
var
  stSql : string;
  nViewSeq : integer;
  stAcType : string;
  stAtType : string;
  stFdType : string;
  stPtType : string;
  stDeviceGubun : string;
begin
  memList.Lines.Add('Node Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_ACCESSDEVICE  ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('Node Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;
    nViewSeq := 0;

    while Not Eof do
    begin
      inc(nViewSeq);
      if Not CheckTB_ACCESSDEVICE(inttostr(FindField('AC_NODENO').AsInteger),FindField('AC_ECUID').AsString) then
      begin
        InsertIntoTB_ACCESSDEVICE(FindField('AC_NODENO').AsString,
                                      FindField('AC_ECUID').AsString,
                                      FindField('AC_DEVICENAME').AsString,
                                      FindField('AC_VIEWSEQ').AsString,
                                      FindField('AC_ACTYPE').AsString,
                                      FindField('AC_ATTYPE').AsString,
                                      FindField('AC_FDTYPE').AsString,
                                      FindField('AC_PTTYPE').AsString,
                                      FindField('LO_DONGCODE').AsString,//Building
                                      FindField('LO_FLOORCODE').AsString,//Floor
                                      FindField('LO_AREACODE').AsString,//Area
                                      FindField('AC_LOCATEUSE').AsString,  //LocateUse
                                      FindField('AC_TOTWIDTH').AsString,  //totWidth
                                      FindField('AC_TOTHEIGHT').AsString,  //totH
                                      FindField('AC_CURX').AsString,  //curX
                                      FindField('AC_CURY').AsString,  //CurY
                                      FindField('AC_MCUIP').AsString,
                                      '3000',//Port
                                      FindField('AC_MCUID').AsString,//MCUID
                                      'TCPIP', //NetType
                                      FindField('AC_GUBUN').AsString, //'0:MCU,1:ECU
                                      'N', //SENDACK
                                      '1', //DaemonGubun
                                      'N'); //Holiday Send

      end else
      begin
        UpdateTB_ACCESSDEVICE(FindField('AC_NODENO').AsString,
                              FindField('AC_ECUID').AsString,
                              FindField('AC_DEVICENAME').AsString,
                              FindField('AC_VIEWSEQ').AsString,
                              FindField('AC_ACTYPE').AsString,
                              FindField('AC_ATTYPE').AsString,
                              FindField('AC_FDTYPE').AsString,
                              FindField('AC_PTTYPE').AsString,
                              FindField('LO_DONGCODE').AsString,//Building
                              FindField('LO_FLOORCODE').AsString,//Floor
                              FindField('LO_AREACODE').AsString,//Area
                              'N',  //LocateUse
                              '0',  //totWidth
                              '0',  //totH
                              '0',  //curX
                              '0',  //CurY
                              FindField('AC_MCUIP').AsString,
                              '3000',//Port
                              FindField('AC_MCUID').AsString,//MCUID
                              'TCPIP', //NetType
                              FindField('AC_GUBUN').AsString, //'0:MCU,1:ECU
                              'N', //SENDACK
                              '1', //DaemonGubun
                              'N'); //Holiday Send
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.PosiCodeConversion: Boolean;
var
  stSql : string;
  stCompanyCode : string;
begin
  memList.Lines.Add('PosiCode Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_POSI ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('PosiCode Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin

      if Not CheckTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString) then
      begin
        InsertIntoTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,FindField('PO_NAME').AsString);
      end else
      begin
        UpdateTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,FindField('PO_NAME').AsString);
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 700 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.CheckTB_ACCESSDEVICE(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertIntoTB_ACCESSDEVICE(aNodNo, aEcuID, aDeviceName,
  aViewSeq, aAcType, aAtType, aFdType, aPtType, aBuildingCode, aFloorCode,
  aAreaCode, aLocateUse, atotW, aTotH, aCurX, aCurY, aIP, aPort, aMcuID,
  aNetType, aDeviceGubun, aSendAck, aDaemonGubun,
  aHoSend: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aViewSeq) then aViewSeq := '0';
  result := False;
  stSql := ' Insert Into TB_ACCESSDEVICE (';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'ac_devicename,';
  stSql := stSql + 'ac_viewseq,';
  stSql := stSql + 'ac_actype,';
  stSql := stSql + 'ac_attype,';
  stSql := stSql + 'ac_fdtype,';
  stSql := stSql + 'ac_pttype,';
  stSql := stSql + 'lo_dongcode,';
  stSql := stSql + 'lo_floorcode,';
  stSql := stSql + 'lo_areacode,';
  stSql := stSql + 'ac_locateuse,';
  stSql := stSql + 'ac_totwidth,';
  stSql := stSql + 'ac_totheight,';
  stSql := stSql + 'ac_curx,';
  stSql := stSql + 'ac_cury,';
  stSql := stSql + 'ac_mcuip,';
  stSql := stSql + 'ac_mcuport,';
  stSql := stSql + 'ac_mcuid,';
  stSql := stSql + 'ac_nettype,';
  stSql := stSql + 'ac_gubun,';
  stSql := stSql + 'send_ack,';
  stSql := stSql + 'ac_daemongubun,';
  stSql := stSql + 'ho_send)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDeviceName + ''',';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aAcType + ''',';
  stSql := stSql + '''' + aAtType + ''',';
  stSql := stSql + '''' + aFdType + ''',';
  stSql := stSql + '''' + aPtType + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocateUse + ''',';
  stSql := stSql + '' + atotW + ',';
  stSql := stSql + '' + aTotH + ',';
  stSql := stSql + '' + aCurX + ',';
  stSql := stSql + '' + aCurY + ',';
  stSql := stSql + '''' + aIP + ''',';
  stSql := stSql + '''' + aPort + ''',';
  stSql := stSql + '''' + aMcuID + ''',';
  stSql := stSql + '''' + aNetType + ''',';
  stSql := stSql + '''' + aDeviceGubun + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '' + aDaemonGubun + ',';
  stSql := stSql + '''' + aHoSend + ''')';

  result := ProcessTargetExecSQL(stSql);
  {
  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      memList.Lines.Add(stSql);
      Exit;
    End;
    result := True;
  end;   }


end;

function TfmMain.UpdateTB_ACCESSDEVICE(aNodNo, aEcuID, aDeviceName,
  aViewSeq, aAcType, aAtType, aFdType, aPtType, aBuildingCode, aFloorCode,
  aAreaCode, aLocateUse, atotW, aTotH, aCurX, aCurY, aIP, aPort, aMcuID,
  aNetType, aDeviceGubun, aSendAck, aDaemonGubun,
  aHoSend: string): Boolean;
var
  stSql : string;
begin
  result := False;

  if Not isDigit(aViewSeq) then aViewSeq := '0';

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aIP + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''', ';
  stSql := stSql + 'AC_MCUPORT = ''' + aPort + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aDeviceName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AC_LOCATEUSE = ''' + aLocateUse + ''',';
  stSql := stSql + 'AC_TOTWIDTH =' + atotW + ',';
  stSql := stSql + 'AC_TOTHEIGHT = ' + aTotH + ',';
  stSql := stSql + 'AC_CURX = ' + aCurX + ',';
  stSql := stSql + 'AC_CURY = ' + aCurY + ',';
  stSql := stSql + 'AC_ACTYPE = ''' + aAcType + ''',';
  stSql := stSql + 'AC_ATTYPE = ''' + aAtType + ''',';
  stSql := stSql + 'AC_FDTYPE = ''' + aFdType + ''',';
  stSql := stSql + 'AC_PTTYPE = ''' + aPtType + ''', ';  
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''' ';
  stSql := stSql + ' where AC_NODENO = ' + aNodNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := ProcessTargetExecSQL(stSql);
  {
  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      memList.Lines.Add(stSql);
      Exit;
    End;
    result := True;
  end;}

end;

function TfmMain.CheckTB_DOOR(aNodeNo, aEcuID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_DOOR ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertIntoTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aViewSeq, aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH,
  aCurX, aCurY, aFdmsID, aResverState, aRelaySend,
  aDoorGubun: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aFdmsID) then aFdmsID := '0';
  result := False;
  stSql := ' Insert Into TB_DOOR (';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'do_doorno,';
  stSql := stSql + 'do_doornoname,';
  stSql := stSql + 'do_viewseq,';
  stSql := stSql + 'lo_dongcode,';
  stSql := stSql + 'lo_floorcode,';
  stSql := stSql + 'lo_areacode,';
  stSql := stSql + 'do_locateuse,';
  stSql := stSql + 'do_totwidth,';
  stSql := stSql + 'do_totheight,';
  stSql := stSql + 'do_curx,';
  stSql := stSql + 'do_cury,';
  stSql := stSql + 'fpms_id,';
  stSql := stSql + 'do_statereverse,';
  stSql := stSql + 'relay_send,';
  stSql := stSql + 'fdms_id,';
  stSql := stSql + 'fdms_relay,';
  stSql := stSql + 'do_gubun)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aDoorName + ''',';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocateUse + ''',';
  stSql := stSql + '' + atotW + ',';
  stSql := stSql + '' + aTotH + ',';
  stSql := stSql + '' + aCurX + ',';
  stSql := stSql + '' + aCurY + ',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''' + aResverState + ''',';
  stSql := stSql + '''' + aRelaySend + ''',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aDoorGubun + ''')';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end; }

end;

function TfmMain.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aViewSeq, aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH,
  aCurX, aCurY, aFdmsID, aResverState, aRelaySend,
  aDoorGubun: string): Boolean;
var
  stSql : string;
begin
  if Not isDigit(aFdmsID) then aFdmsID := '0';
  result := False;
  stSql := ' Update TB_DOOR Set ';
  stSql := stSql + 'do_doornoname = ''' + aDoorName + ''',';
  stSql := stSql + 'do_viewseq = ' + aViewSeq + ',';
  stSql := stSql + 'lo_dongcode = ''' + aBuildingCode + ''',';
  stSql := stSql + 'lo_floorcode = ''' + aFloorCode + ''',';
  stSql := stSql + 'lo_areacode = ''' + aAreaCode + ''',';
  stSql := stSql + 'do_locateuse = ''' + aLocateUse + ''',';
  stSql := stSql + 'do_totwidth = ' + atotW + ',';
  stSql := stSql + 'do_totheight = ' + aTotH + ',';
  stSql := stSql + 'do_curx = ' + aCurX + ',';
  stSql := stSql + 'do_cury = ' + aCurY + ',';
  stSql := stSql + 'fpms_id = ' + aFdmsID + ',';
  stSql := stSql + 'do_statereverse = ''' + aResverState + ''',';
  stSql := stSql + 'relay_send = ''' + aRelaySend + ''',';
  stSql := stSql + 'fdms_id = ' + aFdmsID + ',';
  stSql := stSql + 'fdms_relay = ''N'',';
  stSql := stSql + 'do_gubun = ''' + aDoorGubun + ''' ';
  stSql := stSql + ' Where ac_nodeno = ' + aNodeNo + ' ';
  stSql := stSql + ' AND ac_ecuid = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND do_doorno = ''' + aDoorNo + ''' ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;   }

end;

function TfmMain.CheckTB_ALARMDEVICE(aNodeNo, aEcuID: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertIntoTB_ALARMDEVICE(aNodeNo, aEcuID, aAlarmName,
  aViewSeq, aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH,
  aCurX, aCurY: string): Boolean;
var
  stSql : string;
  i : integer;
begin
  result := False;
  stSql := ' Insert Into TB_ALARMDEVICE (';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'al_zonename,';
  stSql := stSql + 'al_viewseq,';
  stSql := stSql + 'lo_dongcode,';
  stSql := stSql + 'lo_floorcode,';
  stSql := stSql + 'lo_areacode,';
  stSql := stSql + 'al_locateuse,';
  stSql := stSql + 'al_totwidth,';
  stSql := stSql + 'al_totheight,';
  stSql := stSql + 'al_curx,';
  stSql := stSql + 'al_cury,';
  stSql := stSql + 'send_ack) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aAlarmName + ''',';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocateUse + ''',';
  stSql := stSql + '' + atotW + ',';
  stSql := stSql + '' + aTotH + ',';
  stSql := stSql + '' + aCurX + ',';
  stSql := stSql + '' + aCurY + ',';
  stSql := stSql + '''N'') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
  for i:= 1 to 8 do
  begin
    InsertIntoTB_ZONEDEVICE(
                  aNodeNo,
                  aEcuID,
                  inttostr(i), //ZoneNum
                  aAlarmName + '-' + inttostr(i), //ZoneName
                  aBuildingCode,
                  aFloorCode,
                  aAreaCode,
                  aLocateUse,
                  atotW,
                  aTotH,
                  aCurX,
                  aCurY,
                  '0',//WatchType
                  'N',//SendAck
                  'N' //ZoneStop

    );
  end;
end;

function TfmMain.UpdateTB_ALARMDEVICE(aNodeNo, aEcuID, aAlarmName,
  aViewSeq, aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH,
  aCurX, aCurY: string): Boolean;
var
  stSql : string;
  i : integer;
begin
  result := False;
  stSql := ' Update TB_ALARMDEVICE set ';
  stSql := stSql + 'al_zonename = ''' + aAlarmName + ''',';
  stSql := stSql + 'al_viewseq = ' + aViewSeq + ',';
  stSql := stSql + 'lo_dongcode = ''' + aBuildingCode + ''',';
  stSql := stSql + 'lo_floorcode = ''' + aFloorCode + ''',';
  stSql := stSql + 'lo_areacode = ''' + aAreaCode + ''',';
  stSql := stSql + 'al_locateuse = ''' + aLocateUse + ''',';
  stSql := stSql + 'al_totwidth = ' + atotW + ',';
  stSql := stSql + 'al_totheight = ' + aTotH + ',';
  stSql := stSql + 'al_curx = ' + aCurX + ',';
  stSql := stSql + 'al_cury = ' + aCurY + ',';
  stSql := stSql + 'send_ack = ''N'' ';
  stSql := stSql + ' where ac_nodeno = ' + aNodeNo + '';
  stSql := stSql + ' and ac_ecuid = ''' + aEcuID + '''';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
  for i:= 1 to 8 do
  begin
    InsertIntoTB_ZONEDEVICE(
                  aNodeNo,
                  aEcuID,
                  inttostr(i), //ZoneNum
                  aAlarmName + '-' + inttostr(i), //ZoneName
                  aBuildingCode,
                  aFloorCode,
                  aAreaCode,
                  aLocateUse,
                  atotW,
                  aTotH,
                  aCurX,
                  aCurY,
                  '0',//WatchType
                  'N',//SendAck
                  'N' //ZoneStop

    );
  end;
end;

function TfmMain.InsertIntoTB_ZONEDEVICE(aNodeNo, aEcuID, aZoneNum,
  aZoneName, aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW,
  aTotH, aCurX, aCurY, aWatchType, aSendAck, aZoneStop: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_ZONEDEVICE (';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'al_zonenum,';
  stSql := stSql + 'al_zonename,';
  stSql := stSql + 'lo_dongcode,';
  stSql := stSql + 'lo_floorcode,';
  stSql := stSql + 'lo_areacode,';
  stSql := stSql + 'al_locateuse,';
  stSql := stSql + 'al_totwidth,';
  stSql := stSql + 'al_totheight,';
  stSql := stSql + 'al_curx,';
  stSql := stSql + 'al_cury,';
  stSql := stSql + 'al_watchtype, ';
  stSql := stSql + 'send_ack, ';
  stSql := stSql + 'al_zonestop) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aZoneNum + ''',';
  stSql := stSql + '''' + aZoneName + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocateUse + ''',';
  stSql := stSql + '' + atotW + ',';
  stSql := stSql + '' + aTotH + ',';
  stSql := stSql + '' + aCurX + ',';
  stSql := stSql + '' + aCurY + ',';
  stSql := stSql + '''' + aWatchType + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aZoneStop + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;

function TfmMain.CheckTB_FOOD(aNodeNo, aEcuID, aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_FOOD ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aDoorNo + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.InsertIntoTB_FOOD(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH, aCurX,
  aCurY, aMcuID, aSendAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_FOOD (';
  stSql := stSql + 'ac_nodeno,';
  stSql := stSql + 'ac_ecuid,';
  stSql := stSql + 'fo_doorno,';
  stSql := stSql + 'fo_name,';
  stSql := stSql + 'lo_dongcode,';
  stSql := stSql + 'lo_floorcode,';
  stSql := stSql + 'lo_areacode,';
  stSql := stSql + 'al_locateuse,';
  stSql := stSql + 'al_totwidth,';
  stSql := stSql + 'al_totheight,';
  stSql := stSql + 'al_curx,';
  stSql := stSql + 'al_cury,';
  stSql := stSql + 'ac_mcuid,';
  stSql := stSql + 'send_ack) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aDoorName + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aLocateUse + ''',';
  stSql := stSql + '' + atotW + ',';
  stSql := stSql + '' + aTotH + ',';
  stSql := stSql + '' + aCurX + ',';
  stSql := stSql + '' + aCurY + ',';
  stSql := stSql + '''' + aMcuID + ''',';
  stSql := stSql + '''' + aSendAck + ''')';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.UpdateTB_FOOD(aNodeNo, aEcuID, aDoorNo, aDoorName,
  aBuildingCode, aFloorCode, aAreaCode, aLocateUse, atotW, aTotH, aCurX,
  aCurY, aMcuID, aSendAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_FOOD set ';
  stSql := stSql + 'fo_name = ''' + aDoorName + ''',';
  stSql := stSql + 'lo_dongcode = ''' + aBuildingCode + ''',';
  stSql := stSql + 'lo_floorcode = ''' + aFloorCode + ''',';
  stSql := stSql + 'lo_areacode = ''' + aAreaCode + ''',';
  stSql := stSql + 'al_locateuse = ''' + aLocateUse + ''',';
  stSql := stSql + 'al_totwidth = ' + atotW + ',';
  stSql := stSql + 'al_totheight = ' + aTotH + ',';
  stSql := stSql + 'al_curx = ' + aCurX + ',';
  stSql := stSql + 'al_cury = ' + aCurY + ',';
  stSql := stSql + 'ac_mcuid = ''' + aMcuID + ''',';
  stSql := stSql + 'send_ack =  ''' + aSendAck + ''' ';
  stSql := stSql + ' Where ac_nodeno = ' + aNodeNo + ' ';
  stSql := stSql + ' AND ac_ecuid = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND fo_doorno = ''' + aDoorNo + ''' ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.InsertTB_Company(aCompanyCode, aJijumCode, aDepartCode,
  aName, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_Company (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'CO_NAME,';
  stSql := stSql + 'CO_GUBUN) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;

function TfmMain.CheckTB_COMPANY(aCompanyCode, aJijumCode,
  aDepartCode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.UpdateTB_Company(aCompanyCode, aJijumCode, aDepartCode,
  aName, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_Company set ';
  stSql := stSql + 'CO_NAME = ''' + aName + ''',';
  stSql := stSql + 'CO_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;

function TfmMain.CheckTB_POSI(aCompanyCode, aPosiCode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.InsertIntoTB_POSI(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_POSI (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;

function TfmMain.UpdateTB_POSI(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_POSI set ';
  stSql := stSql + 'PO_NAME = ''' + aPosiName + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.CheckTB_Employee(aCompanyCode,
  aEmployeeNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmployeeNo + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertIntoTB_Employee(aCompanyCode, aEmployeeNo,
  aJijumCode, aDepartCode, aPosiCode, aEmName, aCoPhone, aHandPhone,
  aZipCode, aAddr1, aAddr2, aJoinDate, aRetireDate, aUpdatTime, aOperater,
  aFdmsID, aFdmsRelay, aRelayCode, aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_EMPLOYEE (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'em_updateoperator,';
  stSql := stSql + 'fdms_id,';
  stSql := stSql + 'fdms_Relay,';
  stSql := stSql + 'rg_code) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmployeeNo + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aCoPhone + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aZipCode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '''' + aUpdatTime + ''',';
  stSql := stSql + '''' + aOperater + ''',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''' + aFdmsRelay + ''',';
  stSql := stSql + '''' + aRelayCode + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.UpdateTB_Employee(aCompanyCode, aEmployeeNo, aJijumCode,
  aDepartCode, aPosiCode, aEmName, aCoPhone, aHandPhone, aZipCode, aAddr1,
  aAddr2, aJoinDate, aRetireDate, aUpdatTime, aOperater, aFdmsID,
  aFdmsRelay, aRelayCode, aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_EMPLOYEE Set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmName + ''',';
  stSql := stSql + 'EM_COPHONE = ''' + aCoPhone + ''',';
  stSql := stSql + 'EM_HANDPHONE = ''' + aHandPhone + ''',';
  stSql := stSql + 'ZI_ZIPCODE = ''' + aZipCode + ''',';
  stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'EM_UPDATETIME = ''' + aUpdatTime + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + aOperater + ''',';
  stSql := stSql + 'fdms_id = ' + aFdmsID + ',';
  stSql := stSql + 'fdms_Relay = ''' + aFdmsRelay + ''',';
  stSql := stSql + 'rg_code = ''' + aRelayCode + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmployeeNo + ''' ';

  result := ProcessTargetExecSQL(stSql);

{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertIntoTB_CARD(aCardNo, aCardGubun, aCardState,
  aCompanyCode, aEmployeeNo, aUpdateTime, aOperater, aPositionNum,
  aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_CARD (';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CA_UPDATETIME,';
  stSql := stSql + 'CA_UPDATEOPERATOR,';
  stSql := stSql + 'POSITIONNUM) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardGubun + ''',';
  stSql := stSql + '''' + aCardState + ''',';
  stSql := stSql + '''' + aEmployeeNo + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aUpdateTime + ''',';
  stSql := stSql + '''' + aOperater + ''',';
  stSql := stSql + '' + aPositionNum + ') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;



function TfmMain.InsertIntoTB_EMPHIS(aCompanyCode, aEmployeeNo, afdmsid,
  aMode, aSendStatus, aCardNo, aCardState, aSendStatus2, aInsertTime,
  aEmName, aHandPhone, aCompanyName, aJijumName, aDepartName, aPosiName,
  aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_EMPHIS (';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'MODE,';
  stSql := stSql + 'SEND_STATUS,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'SEND_STATUS2,';
  stSql := stSql + 'EH_INSERTTIME,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'COMPANY_NAME,';
  stSql := stSql + 'JIJUM_NAME,';
  stSql := stSql + 'DEPART_NAME,';
  stSql := stSql + 'PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmployeeNo + ''',';
  stSql := stSql + '' + afdmsid + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''' + aSendStatus + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardState + ''',';
  stSql := stSql + '''' + aSendStatus2 + ''',';
  stSql := stSql + '''' + aInsertTime + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.UpdateTB_CARD(aCardNo, aCardGubun, aCardState,
  aCompanyCode, aEmployeeNo, aUpdateTime, aOperater,
  aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_CARD Set ';
  stSql := stSql + 'CA_GUBUN = ''' + aCardGubun + ''',';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardState + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmployeeNo + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + 'CA_UPDATETIME = ''' + aUpdateTime + ''',';
  stSql := stSql + 'CA_UPDATEOPERATOR = ''' + aOperater + ''' ';
//  stSql := stSql + 'CA_RELAY = ''' + aRelayState + ''' ';
  stSql := stSql + ' WHERE CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessTargetExecSQL(stSql);

{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
}
end;

function TfmMain.CheckTB_DEVICECARDNO(aNodeNo, aEcuID,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TfmMain.InsertIntoTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo,
  aDoor1, aDoor2, aUseAccess, aUseAlarm, aTimeCode, aPermit, aRcvAck,
  aUpdateTime, aOperater, aMcuID, aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO (';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'DE_DOOR1,';
  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_USEALARM,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR,';
  stSql := stSql + 'AC_MCUID) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aDoor1 + ''',';
  stSql := stSql + '''' + aDoor2 + ''',';
  stSql := stSql + '''' + aUseAccess + ''',';
  stSql := stSql + '''' + aUseAlarm + ''',';
  stSql := stSql + '''' + aTimeCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''' + aRcvAck + ''',';
  stSql := stSql + '''' + aUpdateTime + ''',';
  stSql := stSql + '''' + aOperater + ''',';
  stSql := stSql + '''' + aMcuID + ''') ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
 }
end;

function TfmMain.UpdateTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo, aDoor1,
  aDoor2, aUseAccess, aUseAlarm, aTimeCode, aPermit, aRcvAck, aUpdateTime,
  aOperater, aMcuID, aRelayState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO Set ';
  stSql := stSql + 'DE_DOOR1 = ''' + aDoor1 + ''',';
  stSql := stSql + 'DE_DOOR2 = ''' + aDoor2 + ''',';
  stSql := stSql + 'DE_USEACCESS = ''' + aUseAccess + ''',';
  stSql := stSql + 'DE_USEALARM = ''' + aUseAlarm + ''',';
  stSql := stSql + 'DE_TIMECODE = ''' + aTimeCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''' + aRcvAck + ''',';
  stSql := stSql + 'DE_UPDATETIME = ''' + aUpdateTime + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + aOperater + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''' ';
  stSql := stSql + ' WHERE AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessTargetExecSQL(stSql);
{  with ADOInsertQuery do
  begin
    Close;
    Try
      Sql.Text := stSql;
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
  }
end;

function TfmMain.ProcessTargetExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
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
          memList.Lines.Add(aSql);

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

function TfmMain.CompanyCodeConversion: Boolean;
var
  stSql : string;
begin
  memList.Lines.Add('CompanyCode Conversion Start!!!');
  result := False;
  stSql := 'Select * from TB_COMPANY ';

  with ADOOrgSelectQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      memList.Lines.Add('CompanyCode Select Error');
      Exit;
    End;
    Gauge_Table.MaxValue := recordCount;
    Gauge_Table.Progress := 0;

    while Not Eof do
    begin

      if Not CheckTB_COMPANY(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString) then
      begin
        InsertTB_Company(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,FindField('CO_NAME').AsString,FindField('CO_GUBUN').AsString);
      end else
      begin
        UpdateTB_Company(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,FindField('CO_NAME').AsString,FindField('CO_GUBUN').AsString);
      end;
      Gauge_Table.Progress :=  Gauge_Table.Progress + 1;
      Gauge_Tot.Progress := 500 + Gauge_Table.PercentDone;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TfmMain.MDBConnect: Boolean;
var
  conStr : string;
  stDBName : string;
begin
  result := False;
  conStr := '';
  stDBName := ed_DBISAM.Text + '\ZMOS.mdb';
  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := conStr + 'Data Source=' + stDBName + ';';
  conStr := conStr + 'Persist Security Info=True;';
  conStr := conStr + 'Jet OLEDB:Database ';


  with ADOOrgConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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
  end;

  result := True;

end;

function TfmMain.GetTB_CARD_PositionMaxNum: integer;
var
  stSql : string;
begin
  result := 0;

  stSql := 'Select Max(POSITIONNUM) as POSITIONNUM from TB_CARD ';

  with ADOTargetTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := FindField('POSITIONNUM').AsInteger;
  end;
  
end;

end.
