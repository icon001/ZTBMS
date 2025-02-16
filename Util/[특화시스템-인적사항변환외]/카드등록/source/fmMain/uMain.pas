unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls,Imm, uSubForm, CommandArray, AdPacket, OoMisc,
  AdPort,WinSpool;


const MAX_COMPORT = 100;       // 최대 255 까지

type

  TfmMain = class(TfmASubForm)
    OpenDialog1: TOpenDialog;
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
    Panel1: TPanel;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label4: TLabel;
    cmb_SearchType: TComboBox;
    cmb_regGubun1: TComboBox;
    lb_search: TLabel;
    ed_searchText: TEdit;
    sg_Employ: TAdvStringGrid;
    Panel4: TPanel;
    ed_sEmpNo: TEdit;
    lb_sabun: TLabel;
    lb_Name: TLabel;
    ed_sEmpNM: TEdit;
    lb_CompanyName1: TLabel;
    lb_JijumName1: TLabel;
    lb_DepartName1: TLabel;
    lb_PosiName1: TLabel;
    ed_sCompanyPhone: TEdit;
    lb_CompanyPhone: TLabel;
    GroupBox1: TGroupBox;
    ed_CardNo: TEdit;
    Label19: TLabel;
    cmb_ComPort: TComboBox;
    Label1: TLabel;
    ed_CompanyName: TEdit;
    ed_jijumname: TEdit;
    ed_departname: TEdit;
    ed_posiname: TEdit;
    ed_CompanyCode: TEdit;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    chk_Initialize: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure ed_searchTextEnter(Sender: TObject);
    procedure ed_searchTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure sg_EmployClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    Function MDBAdoConnect(aDBPath:string):Boolean;
    Function targetAdoConnect:Boolean;
  private
    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string):Boolean;
    Function CheckTB_CARDEMPCODE(aCompanyCode,aEmpID:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;

    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,afdmsID,aMode,aCardNo,aCardType,aEmName,aHandPhone,aCompanyName,aJijumName,aDepartName,aPosiName:string):string;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;


    Function UpdateTB_FORMNAME(aCode,aName:string):Boolean;
    Function InsertIntoTB_RELAYGUBUN(aRgCode,aRgName:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  private
    Function GetCompanyCode(aCompanyName:string):string;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetMaxDepartCode(aCompanycode,aJijumCode:string):string;
    Function MakeCardNo( aIDNO,aSeq:string):string;
    Function GetMaxCompanyCode:integer;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function GetMaxPosiCode(aCompanyCode:string):string;
  public
    { Public declarations }
    procedure DeleteTB_COMPANYCODE;
    procedure DeleteTB_PosiCODE;
    procedure DeleteTB_RelayCode;
    procedure AlterTableTB_COMPANYName;
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateRelayGubunCode;
    procedure CreateCompanyCode(aCompanyName:string;var aCompanyCode:string);
    procedure CreateDepartCode(aCompanycode,aJijumCode,aDepartName:string; var aDepartCode:string);
    procedure FormNameChange;
  private
    procedure SearchEmployee;
    procedure FormClear;
  private
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

    procedure ComportRead;
    procedure RcvCardDataByReader(aData:string);
    procedure CardReadProcess(aCardNo:string);
    function DupCheckTB_CARDNO(aCardNo:string):Boolean;
    function DupCheckTB_CARDCardNo(aCardNo,aCompanyCode, aEmpCode:string; var aOldEmpCode:string):Boolean;
    function DeleteTB_CARD(aCardNo:string):Boolean;
    function SaveTB_CARDNO(aCardNo,aCompanyCode,aEmCode:string):Boolean;
    function InsertTB_CARDNO(aCardNo, aCompanyCode,aEmCode:string):Boolean;
    function UpdateTB_CARDNO(aCardNo, aCompanyCode,aEmCode:string):Boolean;
    function GetCardNoPositionNum(aCardNo:string):integer;
  private
    L_nCARDLENGTHTYPE : integer;
    L_bIsNumericCardNo : Boolean;
    L_stCardFixedFillChar : String;
    L_nCardFixedPosition : integer;
    L_nCardFixedLength : integer;
    L_nSpecialProgram : integer;
    L_bCardFixedUse : Boolean;
    procedure InitConfigSet;
    function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
    function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;

  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil;

{$R *.dfm}

function TfmMain.MDBAdoConnect(aDBPath: string): Boolean;
var
  conStr : wideString;
begin
{  result := False;
  conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := conStr + 'Data Source=' + aDBPath + ';';
  conStr := conStr + 'Persist Security Info=True;';
  conStr := conStr + 'Jet OLEDB:Database ';

  with MDBADOConnection do
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
  result := True; }
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  ComPortList := TStringList.Create;
  ComPortList.Clear;

  GROUPCODE := '1234567890';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;
  ComPortList.Free;

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
  if targetAdoConnect then
  begin
    btn_targetAdoConnect.Enabled := False;
    Panel1.Enabled := True;
    ed_searchText.SetFocus;
    InitConfigSet;

  end else
  begin
    showmessage('데이터베이스 접속실패');
    Panel1.Enabled := False;
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

function TfmMain.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
begin
  result := '31';
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
  with targetTempADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    Try
      nFdms_id := FindField('fdms_id').AsInteger;
      if nFdms_id = 0 then Exit;
    Except
      Exit;
    End;
    result := inttostr(nFdms_id + 1);
  end;
end;

function TfmMain.CheckTB_EMPLOYEE(aCompanyCode, aEmpID: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmMain.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate, aRetireDate,
  aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'RG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '' + afdmsId + ',';
  stSql := stSql + '''' + aEmTypeCode + ''')';

  result := ProcessExecSQL(stSql);


end;

function TfmMain.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, afdmsID, aMode,
  aCardNo, aCardType, aEmName, aHandPhone, aCompanyName, aJijumName,
  aDepartName, aPosiName: string): string;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPHIS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  if afdmsID <> '' then
    stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' MODE, ';
  stSql := stSql + ' SEND_STATUS, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' CA_CARDTYPE, ';
  stSql := stSql + ' SEND_STATUS2,';
  stSql := stSql + ' EH_INSERTTIME, ';
  stSql := stSql + ' EM_NAME, ';
  stSql := stSql + ' EM_HANDPHONE, ';
  stSql := stSql + ' COMPANY_NAME, ';
  stSql := stSql + ' JIJUM_NAME, ';
  stSql := stSql + ' DEPART_NAME, ';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  if afdmsID <> '' then
    stSql := stSql + afdmsID + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := stSql;
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

{          //SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;      }

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
      //SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

function TfmMain.CheckTB_CARDEMPCODE(aCompanyCode,
  aEmpID: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmMain.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount > 0 then Result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmMain.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''SYSTEM'')' ;

  result := ProcessExecSQL(stSql);
end;

function TfmMain.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := TargetADOConnection;
  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    if Not IsDigit(FindField('MaxPosition').AsString) then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    result := FindField('MaxPosition').AsInteger + 1;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;
{
procedure TfmMain.LoadMDB;
var
  stSql : string;
  nRow : integer;
begin
  stSql := 'select * from SECU_VIEW ';

  with MdbADOCodeLoad do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;

    sg_Employ.RowCount := recordcount + 1;
    Gauge1.MaxValue := recordcount + 1;
    Gauge1.Visible := True;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Employ do
      begin
        cells[0,nRow] := FindField('SECU_IDNO').AsString;
        cells[1,nRow] := FindField('SECU_IDDI').AsString;
        cells[2,nRow] := FindField('SECU_SDCO').AsString;
        cells[3,nRow] := FindField('SECU_NAME').AsString;
        cells[4,nRow] := FindField('SECU_UNNM').AsString;
        cells[5,nRow] := FindField('SECU_PSNM').AsString;
        cells[6,nRow] := FindField('SECU_ISFG').AsString;
        cells[7,nRow] := FindField('SECU_FLAG').AsString;
        Gauge1.Progress := nRow;
        Application.ProcessMessages;
      end;
      inc(nRow);
      Next;
    end;
    Gauge1.Visible := false;
  end;
end;   }

procedure TfmMain.CreateCompanyCode(aCompanyName:string;var aCompanyCode:string);
var
  stSql : string;
  nCompanyCode : integer;
begin
  nCompanyCode := GetMaxCompanyCode;
  aCompanyCode := FillZeroNumber(nCompanyCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,'000','000','1',aCompanyName);
  InsertIntoTB_COMPANY(aCompanyCode,'001','000','2','본사');
end;

procedure TfmMain.CreateDepartCode(aCompanycode,aJijumCode,aDepartName:string; var aDepartCode:string);
var
  stSql : string;
  nCode : integer;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stGubun : string;
  nDepartCode : integer;
begin
  aDepartCode := GetMaxDepartCode(aCompanycode,aJijumCode);
  //aDepartCode := FillZeroNumber(nDepartCode,3);
  InsertIntoTB_COMPANY(aCompanycode,aJijumCode,aDepartCode,'3',aDepartName);
end;

procedure TfmMain.CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
begin
  aPosiCode := GetMaxPosiCode(aCompanyCode);
  InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName);
end;

procedure TfmMain.CreateRelayGubunCode;
begin

end;



procedure TfmMain.DeleteTB_COMPANYCODE;
var
  stSql : string;
begin
  stSql := ' Delete From TB_COMPANY ';
  ProcessExecSQL(stSql);

end;

function TfmMain.InsertIntoTB_COMPANY(aCompanyCode, aJijumCode,
  aDepartCode, aGubun, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGubun + ''')';

  ProcessExecSQL(stSql);
end;

procedure TfmMain.FormNameChange;
begin
  UpdateTB_FORMNAME('011','지점코드');
  UpdateTB_FORMNAME('012','지점명칭');
  UpdateTB_FORMNAME('021','소속코드');
  UpdateTB_FORMNAME('022','소속명칭');
  UpdateTB_FORMNAME('031','직위코드');
  UpdateTB_FORMNAME('032','직위명');
  UpdateTB_FORMNAME('040','재직구분');
  UpdateTB_FORMNAME('041','재직코드');
  UpdateTB_FORMNAME('042','재직구분');
  UpdateTB_FORMNAME('103','주민번호');
end;

procedure TfmMain.AlterTableTB_COMPANYName;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ALTER COLUMN CO_NAME varchar(100) ';
  ProcessExecSQL(stSql);
end;

function TfmMain.GetMaxDepartCode(aCompanycode,aJijumCode: string): string;
var
  stSql : string;
begin
  result := '001';
  stSql := ' Select Max(CO_DEPARTCODE) as departCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanycode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';

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
    if isDigit(FindField('departCode').AsString) then
    begin
      result := FillZeroNumber(strtoint(FindField('departCode').AsString) + 1 ,3);
    end else
    begin
      result := '001';
    end;
  end;

end;

procedure TfmMain.DeleteTB_PosiCODE;
var
  stSql : string;
begin
  stSql := ' Delete From TB_POSI ';
  ProcessExecSQL(stSql);
end;

function TfmMain.InsertIntoTB_POSI(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_POSI(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME,';
  stSql := stSql + ' PO_UPDATECHECK) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''',';
  stSql := stSql + '''N'') ';
  
  ProcessExecSQL(stSql);
end;

procedure TfmMain.DeleteTB_RelayCode;
var
  stSql : string;
begin
  stSql := ' Delete From TB_RELAYGUBUN ';
  ProcessExecSQL(stSql);
end;

function TfmMain.InsertIntoTB_RELAYGUBUN(aRgCode,
  aRgName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYGUBUN(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'RG_CODE,';
  stSql := stSql + 'RG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aRgCode + ''',';
  stSql := stSql + '''' + aRgName + ''')';

  ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_FORMNAME(aCode, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FORMNAME set FM_NAME = ''' + aName + ''' ';
  stSql := stSql + ' Where FM_CODE = ''' + aCode + ''' ';

  ProcessExecSQL(stSql);
end;

function TfmMain.GetCompanyCode(aCompanyName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''1'' ';
  stSql := stSql + ' AND CO_NAME = ''' + aCompanyName + ''' ';

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
    result := FindField('CO_COMPANYCODE').AsString;
  end;

end;

function TfmMain.GetDepartCode(aCompanyCode,aJijumCode, aDepartName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';

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
    result := FindField('CO_DEPARTCODE').AsString;
  end;

end;

function TfmMain.MakeCardNo(aIDNO, aSeq: string): string;
var
  i : integer;
  nLength : integer;
begin
  nLength:= Length(aIDNO);
  for i := nLength + 1 to 13 do
  begin
    aIDNO := aIDNO + 'N';  
  end;
  //nLength:= Length(aIDNO);
  if Not isDigit(aSeq) then aSeq := '0';
  result := aIDNO + FillZeroNumber(strtoint(aSeq),2);

end;

function TfmMain.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun,
  aCardNo, aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_JIJUMCODE =''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := ProcessExecSQL(stSql);
end;


function TfmMain.GetMaxCompanyCode: integer;
var
  stSql : string;
begin
  result := 1;
  stSql := ' Select Max(CO_COMPANYCODE) as CO_COMPANYCODE from TB_COMPANY ';

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
    if isDigit(FindField('CO_COMPANYCODE').AsString) then
    begin
      result := strtoint(FindField('CO_COMPANYCODE').AsString) + 1;
    end else
    begin
      result := 1;
    end;
  end;
end;

function TfmMain.GetPosiCode(aCompanyCode,aPosiName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := ' select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

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
    result := FindField('PO_POSICODE').AsString;
  end;

end;

function TfmMain.GetMaxPosiCode(aCompanyCode:string): string;
var
  stSql : string;
begin
  result := '001';
  stSql := ' Select Max(PO_POSICODE) as PO_POSICODE from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';

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
    if isDigit(FindField('PO_POSICODE').AsString) then
    begin
      result := FillZeroNumber(strtoint(FindField('PO_POSICODE').AsString) + 1 ,3);
    end else
    begin
      result := '001';
    end;
  end;
end;

procedure TfmMain.cmb_SearchTypeChange(Sender: TObject);
begin
  if cmb_SearchType.ItemIndex = 0 then
  begin
    lb_search.Visible := False;
    ed_searchText.Visible := False;
    SearchEmployee;
    chk_Initialize.Visible := False;
  end else
  begin
    lb_search.Visible := True;
    ed_searchText.Visible := True;
    lb_search.Caption := cmb_SearchType.Text;
    ed_searchText.SetFocus;
    chk_Initialize.Visible := True;
  end;
end;

procedure TfmMain.ed_searchTextEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD;
  dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  if cmb_SearchType.ItemIndex = 2 then
  begin
    ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence); //영문시 IME_CMODE_ALPHANUMERIC
  end else
  begin
    ImmSetConversionStatus(TIMC, IME_CMODE_ALPHANUMERIC, dwSentence); //영문시 IME_CMODE_ALPHANUMERIC
  end;
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;

procedure TfmMain.ed_searchTextKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SearchEmployee;
end;

procedure TfmMain.SearchEmployee;
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_Employ,6); //스트링그리드 초기화
  if cmb_SearchType.ItemIndex <> 0 then
  begin
    if ed_searchText.Text = '' then Exit;
  end;

  FormClear;

  stSql := 'select a.AT_ATCODE,a.EM_PASS,c.CO_NAME as COMPANYNAME, ';
  stSql := stSql + ' d.CO_NAME as JIJUMNAME,e.CO_NAME as DEPARTNAME,f.PO_NAME,a.EM_CODE,';
  stSql := stSql + ' a.EM_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.PO_POSICODE, ';
  stSql := stSql + ' a.EM_COPHONE,a.EM_JOINDATE,a.EM_RETIREDATE,a.ZI_ZIPCODE,';
  stSql := stSql + ' a.EM_ADDR1,a.EM_ADDR2,EM_HOMEPHONE,a.EM_HANDPHONE,a.EM_IMAGE,';
  stSql := stSql + ' b.CA_CARDNO,b.CA_CARDTYPE,a.RG_CODE,a.FDMS_ID ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON ( a.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = f.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = f.PO_POSICODE ) ';
  if cmb_SearchType.ItemIndex = 1 then //사번
  begin
    stSql := stSql + ' WHERE a.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    stSql := stSql + ' order by a.EM_CODE ';
  end else if cmb_SearchType.ItemIndex = 2 then //이름
  begin
    stSql := stSql + ' WHERE a.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    stSql := stSql + ' order by a.EM_NAME ';
  end;

  Try
    with targetTempADOQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('EM_CODE').AsString;
          cells[2,nRow] := FindField('EM_NAME').AsString;
          cells[3,nRow] := FindField('JIJUMNAME').AsString;
          cells[4,nRow] := FindField('DEPARTNAME').AsString;
          cells[5,nRow] := FindField('PO_NAME').AsString;
          cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[7,nRow] := FindField('CO_JIJUMCODE').AsString;
          cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
          cells[9,nRow] := FindField('PO_POSICODE').AsString;
          cells[10,nRow] := FindField('EM_COPHONE').AsString;
          cells[11,nRow] := FindField('EM_JOINDATE').AsString;
          cells[12,nRow] := FindField('EM_RETIREDATE').AsString;
          cells[13,nRow] := FindField('ZI_ZIPCODE').AsString;
          cells[14,nRow] := FindField('EM_ADDR1').AsString;
          cells[15,nRow] := FindField('EM_ADDR2').AsString;
          cells[16,nRow] := FindField('EM_HOMEPHONE').AsString;
          cells[17,nRow] := FindField('EM_HANDPHONE').AsString;
          if FindField('EM_IMAGE').IsNull then  cells[18,nRow] := 'N'
          else cells[18,nRow] := 'Y';
          cells[19,nRow] := FindField('CA_CARDNO').AsString;
          cells[20,nRow] := FindField('CA_CARDTYPE').AsString;
          cells[21,nRow] := FindField('RG_CODE').AsString;
          cells[22,nRow] := FindField('FDMS_ID').AsString;
        end;
        nRow := nRow + 1;
        Next;
      end;
      sg_Employ.SelectRows(1,1);
    end;
  Finally

  End;
  sg_EmployClick(sg_Employ);
end;

procedure TfmMain.FormClear;
begin
    ed_CompanyName.Text := '';
    ed_sEmpNo.Text:= '';
    ed_sEmpNM.Text := '';
    ed_jijumname.Text := '';
    ed_departname.Text := '';
    ed_posiname.Text := '';
    ed_CompanyCode.Text := '';
    ed_sCompanyPhone.Text := '';
    ed_CardNo.Text := '';

end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  inherited;
  FormClear;
end;

procedure TfmMain.sg_EmployClick(Sender: TObject);
begin
  FormClear;
  with sg_Employ do
  begin
    ed_CompanyName.Text := cells[0,Row];
    ed_sEmpNo.Text:= cells[1,Row];
    ed_sEmpNM.Text := cells[2,Row];
    ed_jijumname.Text := cells[3,Row];
    ed_departname.Text := cells[4,Row];
    ed_posiname.Text := cells[5,Row];
    ed_CompanyCode.Text := cells[6,Row];
    ed_sCompanyPhone.Text := Cells[10,Row];
    ed_CardNo.Text := cells[19,Row];
  end;
end;

function TfmMain.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmMain.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmMain.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  inherited;
  ComportRead;

end;

procedure TfmMain.cmb_ComPortChange(Sender: TObject);
var
  nComPort : integer;
begin
  inherited;
  Try
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open := False;
  Except
    Exit;
  end;
  if cmb_ComPort.ItemIndex > 0 then
  begin
    nComPort := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex - 1]);
    try
      ApdDataPacket1.AutoEnable := false;
      ApdDataPacket1.StartCond := scString;
      ApdDataPacket1.StartString := #$02;
      ApdDataPacket1.EndCond := [ecString];
      ApdDataPacket1.EndString := #$03;
      ApdDataPacket1.Timeout := 0;
      ReaderPort.ComNumber := nComPort;
      ReaderPort.Open := true;
      ApdDataPacket1.Enabled := True;
    except
      Exit;
    end;
  end;
end;

procedure TfmMain.ComportRead;
var
  nCount : integer;
  i : integer;
begin
  Try
    ApdDataPacket1.Enabled := False;
    ReaderPort.Open := False;
  Except
    Exit;
  end;
  cmb_ComPort.Clear;
  cmb_ComPort.Items.add('사용안함');
  cmb_ComPort.ItemIndex := 0;

  nCount := GetSerialPortList(ComPortList);
  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;

end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  nIndex := cmb_ComPort.ItemIndex;
  ComportRead;

  if cmb_ComPort.Items.Count > nIndex then
  begin
    cmb_ComPort.ItemIndex := nIndex;
    cmb_ComPortChange(self);
  end;
end;

procedure TfmMain.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  inherited;
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmMain.RcvCardDataByReader(aData: string);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
begin
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  aCardNo := aData;
  if L_nCARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    if L_bIsNumericCardNo then  //숫자변환이면
    begin
      if L_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
      begin
        bCardNo:= Hex2Dec64(copy(aData,1,6) + '00');
        aCardNo := inttostr(bCardNo);
      end else
      begin
        bCardNo:= Hex2Dec64(aData);
        aCardNo := inttostr(bCardNo);
      end;
    end;
  end
  else
  begin
    if L_nCARDLENGTHTYPE = 1 then
    begin
      if L_bIsNumericCardNo then  //숫자변환이면
      begin
        if L_nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
        begin
          bCardNo:= Hex2Dec64(copy(aData,1,6) + '00');
          aCardNo := inttostr(bCardNo);
        end else
        begin
          bCardNo:= Hex2Dec64(aData);
          aCardNo := inttostr(bCardNo);
        end;
      end;
    end else if L_nCARDLENGTHTYPE = 2 then
    begin
      aCardNo := aCardNo;  //ASCII 로 데이터를 받으니까 그냥 처리
    end;
  end;

  if (L_nCARDLENGTHTYPE = 0) and L_bIsNumericCardNo then  //고정이며 숫자변환이면
     aCardNo:= FillZeroNumber2(bCardNo,10);

  aCardNo := GetFixedCardNoCheck(aCardNo,L_bCardFixedUse,L_stCardFixedFillChar,L_nCardFixedPosition,L_nCardFixedLength);
  if Trim(aCardNo) <> '' then CardReadProcess(aCardNo);

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
begin
  L_nCARDLENGTHTYPE := 0; //디폴트로 고정 4Byte 사용
  L_bIsNumericCardNo := True; //카드번호 숫자타입 사용/미사용
  L_stCardFixedFillChar := '0';  //카드고정길이 사용시 채움문자
  L_nCardFixedPosition := 0; //채움문자위치 0:앞,1:뒤
  L_nCardFixedLength := 11;  //카드고정길이 KT에서 처음 사용해서 디폴트 11자리
  L_nSpecialProgram := 0;
  L_bCardFixedUse := False;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''ALARM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''MCUCOMM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''FIRE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''CARD'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'')';

  Try

    with targetTempADOQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      First;
      While Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then L_nCARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then L_bIsNumericCardNo := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then
        begin
          L_nSpecialProgram := StrtoInt(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then L_bCardFixedUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLCHAR' then
        begin
          if FindField('CO_CONFIGVALUE').AsString <> '' then
            L_stCardFixedFillChar := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLPOSI' then  
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            L_nCardFixedPosition := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FIXEDLEN' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            L_nCardFixedLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;

        Next;
      end;
    end;
  Finally
  End;
end;

function TfmMain.GetFixedCardNoCheck(aCardNo: string;
  bCardFixedUse: Boolean; aCardFixedFillChar: string; nCardFixedPosition,
  nCardFixedLength: integer): string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //고정길이 사용하지 않으면 원 카드데이터 리턴
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//뒤에 채움문자 채우는 경우
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);

end;

function TfmMain.FillCharString(aNo: String; aChar: char; aLength: Integer;
  bFront: Boolean): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+ aChar;
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;
    
    FillCharString := st;
  end else FillCharString := copy(Strno,1,aLength);

end;

procedure TfmMain.CardReadProcess(aCardNo: string);
var
  stOldEmpNo : string;
begin
  if ed_sEmpNo.Text = '' then
  begin
    ed_CardNo.Text := aCardNo;
    Exit;
  end;

  if DupCheckTB_CARDCardNo(aCardNo,ed_CompanyCode.Text, ed_sEmpNo.Text,stOldEmpNo) then
  begin
    if (Application.MessageBox(PChar(stOldEmpNo + ' 사번으로 ' + aCardNo + ' 카드가 등록되어 있습니다. 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
  end;

  if ed_CardNo.Text <> '' then
  begin
    if ed_CardNo.Text <> aCardNo then
    begin
      if (Application.MessageBox(PChar(ed_CardNo.Text + ' 카드가 등록되어 있습니다. 변경하시겠습니까?'),'정보',MB_OKCANCEL) = IDCANCEL)  then Exit;
      DeleteTB_CARD(ed_CardNo.Text);
    end;
  end;

  if Not SaveTB_CARDNO(aCardNo,ed_CompanyCode.Text, ed_sEmpNo.Text) then Exit;

  if Not chk_Initialize.Checked then
  begin
    sg_Employ.cells[19,sg_Employ.Row]:= aCardNo;
    ed_CardNo.Text := aCardNo;
    Exit;
  end;
  
  FormClear;
  ed_searchText.Text := '';
  SearchEmployee;

end;

function TfmMain.DupCheckTB_CARDCardNo(aCardNo, aCompanyCode,
  aEmpCode: string; var aOldEmpCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  aOldEmpCode := '';
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

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
    First;
    if FindField('CO_COMPANYCODE').AsString <> aCompanyCode then result := True;
    if FindField('EM_CODE').AsString <> aEmpCode then result := True;
    aOldEmpCode := FindField('EM_CODE').AsString;
  end;

end;

function TfmMain.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' ';
  stSql := stSql +' Where CA_CARDNO = ''' + aCardNo + ''' ';
  result := ProcessExecSQL(stSql);
  if Not result then Exit;
  stSql := 'Delete From TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
  result := ProcessExecSQL(stSql);

  stSql := InsertIntoTB_EMPHIS('000', '000', '0', '3',  aCardNo, '1', '', '', '', '',  '', '');
  ProcessExecSQL(stSql);
end;


function TfmMain.SaveTB_CARDNO(aCardNo, aCompanyCode,
  aEmCode: string): Boolean;
begin
  if DupCheckTB_CARDNO(aCardNo) then
  begin
    result := UpdateTB_CARDNO(aCardNo, aCompanyCode,aEmCode);
  end else
  begin
    result := InsertTB_CARDNO(aCardNo, aCompanyCode,aEmCode);
  end;
end;

function TfmMain.DupCheckTB_CARDNO(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

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
    result := True;
  end;

end;

function TfmMain.InsertTB_CARDNO(aCardNo, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  nPositionNum := GetMaxPositionNum;
  stSql := ' Insert Into TB_CARD (';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';  //1:일반,2:기타
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'POSITIONNUM)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCardNO + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '' + inttostr(nPositionNum) + ')';

  result := ProcessExecSQL(stSql);

  stSql := InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, inttostr(nPositionNum), '1',  aCardNo, '1', ed_sEmpNM.text, '', ed_CompanyName.text, ed_jijumname.text,  ed_departname.text, ed_posiname.text);
  ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_CARDNO(aCardNo, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  stSql := ' Update TB_CARD Set ';
  stSql := stSql + 'CA_GUBUN = ''1'',';
  stSql := stSql + 'CA_CARDTYPE = ''1'',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNO + ''' ';

  result := ProcessExecSQL(stSql);

  nPositionNum := GetCardNoPositionNum(aCardNo);

  stSql := InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, inttostr(nPositionNum), '2',  aCardNo, '1', ed_sEmpNM.text, '', ed_CompanyName.text, ed_jijumname.text,  ed_departname.text, ed_posiname.text);
  ProcessExecSQL(stSql);
end;


function TfmMain.GetCardNoPositionNum(aCardNo: string): integer;
var
  stSql : string;
begin
  result := 31;

  stSql := 'select * from TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('PositionNum').AsInteger;
  end;

end;

end.
