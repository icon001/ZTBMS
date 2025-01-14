unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls, uSubForm, CommandArray, AdvObj;

type
  TEmTypeCode = class(Tcomponent)
  private
    FEmTypeCode: string;
    FEmTypeName: string;
  public
    property EmTypecode : string read FEmTypeCode write FEmTypeCode;
    property EmTypeName : string read FEmTypeName write FEmTypeName;
  end;
  TPosiCode = class(Tcomponent)
  private
    FPosiCode: string;
    FPosiName: string;
  public
    property Posicode : string read FPosiCode write FPosiCode;
    property PosiName : string read FPosiName write FPosiName;
  end;
  TDepartCode = class(Tcomponent)
  private
    FDepartCode: string;
    FDepartName: string;
  public
    property Departcode : string read FDepartCode write FDepartCode;
    property DepartName : string read FDepartName write FDepartName;
  end;
  TJijumCode = class(TComponent)
  private
    DepartNameList : TStringList;
    FJijumCode: string;
    FJijumName: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function SetDepartCodeName(aDepartCode,aDepartName:string):Boolean;
    function GetDepartCode(aDepartName:string):string;
    
    property jijumcode : string read FJijumCode write FJijumCode;
    property JijumName : string read FJijumName write FJijumName;
  end;

  TfmMain = class(TfmASubForm)
    GroupBox2: TGroupBox;
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
    MDBADOConnection: TADOConnection;
    TargetADOConnection: TADOConnection;
    MdbADO: TADOQuery;
    Label9: TLabel;
    ed_DBName: TEdit;
    targetTempADOQuery: TADOQuery;
    targetADOExecQuery: TADOQuery;
    StatusBar1: TStatusBar;
    MdbADOTemp: TADOQuery;
    Label1: TLabel;
    ed_dbip: TEdit;
    Label2: TLabel;
    ed_dbport: TEdit;
    Label3: TLabel;
    ed_dbuserid: TEdit;
    Label4: TLabel;
    ed_dbpw: TEdit;
    Label10: TLabel;
    ed_Oradbname: TEdit;
    SpeedButton1: TSpeedButton;
    Label11: TLabel;
    st_Connected: TLabel;
    btn_WorkBranch: TBitBtn;
    btnClose: TBitBtn;
    Gauge1: TProgressBar;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn_WorkBranchClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    EmTypeCodeList : TStringList;
    RegCodeList : TStringList;
    { Private declarations }
    Function MDBAdoConnect(aDBPath:string):Boolean;
    Function targetAdoConnect:Boolean;
  private
    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string;var aFdmsNo:integer):Boolean;
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
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;


    Function UpdateTB_FORMNAME(aCode,aName:string):Boolean;
    Function InsertIntoTB_RELAYGUBUN(aRgCode,aRgName:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  private
    Function GetDepartCode(aJijumCode,aDepartName,aJijumName:string):string;
    Function GetEmpTypeCode(aEmTypeName:string):string;
    Function GetJijumCode(aJijumName:string):string;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxEmTypeCode:integer;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxPosiCode(aCompanyCode:string):integer;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function MakeCardNo( aIDNO,aSeq:string):string;
  public
    { Public declarations }
    procedure DeleteTB_COMPANYCODE;
    procedure DeleteTB_DEVICECARDNO(aCompanyCode,aEmCode:string);
    procedure DeleteTB_EMPLOYEE(aCompanyCode,aEmCode:string);
    procedure DeleteTB_PosiCODE;
    procedure DeleteTB_RelayCode;
    procedure AlterTableTB_COMPANYName;
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateEmTypeCode(aName:string;var aEmpTypeCode:string);
    procedure CreateCompanyCode;
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName,aJijumName:string; var aDepartCode:string);
    procedure FormNameChange;
    procedure PersonDataConversion(aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpTypeCode,
                             aEmCode,aSeq,aEmName,aPhoneNumber,aStateCode,aJijumName,aDepartName,aPosiName:string);
  private
    procedure LoadsCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsEmpType(aStringList:TStringList;cmb_Box:TComboBox);

  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil, uAdoRelay;

{$R *.dfm}

function TfmMain.MDBAdoConnect(aDBPath: string): Boolean;
var
  conStr : wideString;
begin
  result := False;
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
  result := True;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  btn_WorkBranch.Enabled := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmTypeCodeList := TStringList.Create;
  RegCodeList := TStringList.Create;

  RegCodeList.Add('APS111.10');  //재직상태
  RegCodeList.Add('SET06.CEASE');  //휴학생
  RegCodeList.Add('SET06.HOLD');  //재학생
  RegCodeList.Add('SET06.COMPL');  //수료생

  GROUPCODE := '1234567890';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin

  if JijumCodeList.Count > 0 then
  begin
    for i := JijumCodeList.Count - 1 downto 0 do
    begin
      TJijumCode(JijumCodeList.Objects[i]).Free;
    end;
  end;
  JijumCodeList.Free;
  if PosiCodeList.Count > 0 then
  begin
    for i := PosiCodeList.Count - 1 downto 0 do
    begin
      TPosiCode(PosiCodeList.Objects[i]).Free;
    end;
  end;
  PosiCodeList.Free;
  if EmTypeCodeList.Count > 0 then
  begin
    for i := EmTypeCodeList.Count - 1 downto 0 do
    begin
      TEmTypeCode(EmTypeCodeList.Objects[i]).Free;
    end;
  end;
  EmTypeCodeList.Free;
  RegCodeList.free;
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
  btn_WorkBranch.Enabled := False;
  if targetAdoConnect then
  begin
    btn_WorkBranch.Enabled := True;
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

function TfmMain.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
begin
  result := '123';
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

function TfmMain.CheckTB_EMPLOYEE(aCompanyCode, aEmpID: string;var aFdmsNo:integer): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  aFdmsNo := 0;
  stSql := 'select * from TB_EMPLOYEE  ';
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
    if RecordCount > 0 then
    begin
      Result := True;
      aFdmsNo := FindField('FDMS_ID').AsInteger;
    end;
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

procedure TfmMain.btn_WorkBranchClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmpTypeCode,stRGCode : string;
  stSql : string;
  stDate : string;
  stStateCode : string;
  nIndex : integer;
  stLastRelayTime : string;
begin
  // 기본 데이터를 초기화하는 부분
  stSql := 'Delete From TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN <> ''1'' ';
  ProcessExecSQL(stSql);
  stSql := 'Update TB_EMPLOYEE set CO_JIJUMCODE=''000'',CO_DEPARTCODE=''000'',PO_POSICODE=''000'' ';
  ProcessExecSQL(stSql);
  // 기본 데이터를 초기화하는 부분

  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRUNC(TRET_DT) as TRET_DT  from VW_KT_USR ';
  stSql := stSql + ' where TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' Order by TRET_DT';
  
//  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRET_DT  from VW_KT_USR ';
//  stSql := stSql + ' where TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
//  stSql := stSql + ' Order by TRET_DT';

  Gauge1.Visible := True;
  with dmAdoRelay.ADOOraSearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge1.Max := recordCount;
    Gauge1.Position := 0;
    While Not Eof do
    begin
      stCompanyCode := '001';
      stJijumCode := GetJijumCode(FindField('ORGN_NM_L').AsString);
      if stJijumCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_L').AsString) <> '' then
          CreateJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString,stJijumCode);
      end;
      stDepartCode := GetDepartCode(stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString);
      if stDepartCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_M').AsString) <> '' then
          CreateDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString,stDepartCode);
      end;
      stPosiCode := GetPosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString);
      if stPosiCode = '000' then
      begin
        if Trim(FindField('STTS_DIV_CD_NM').AsString) <> '' then
          CreatePosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString,stPosiCode);
      end;
      stEmpTypeCode := GetEmpTypeCode(FindField('ST_CD_NM').AsString);
      if stEmpTypeCode = '000' then
      begin
        if Trim(FindField('ST_CD_NM').AsString) <> '' then
          CreateEmTypeCode(FindField('ST_CD_NM').AsString,stEmpTypeCode);
      end;
      stStateCode := '3'; //정지
      nIndex := RegCodeList.indexof(FindField('ST_CD').AsString);
      if FindField('ST_CD').AsString = '' then stStateCode := '1';
      if FindField('ST_CD').IsNull then stStateCode := '1';
      if nIndex > -1 then stStateCode := '1';
      PersonDataConversion(stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmpTypeCode,
                           FindField('ID').AsString,'0',FindField('NM').AsString,FindField('CELL_NO').AsString,stStateCode,
                           FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString);
      Gauge1.Position := Gauge1.Position + 1;

      Application.ProcessMessages;
      Next;
    end;
  end;

  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRUNC(TRET_DT) as TRET_DT  from VW_KT_APS ';
  stSql := stSql + ' where TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' Order by TRET_DT';
  
//  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRET_DT  from VW_KT_APS ';
//  stSql := stSql + ' where TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
//  stSql := stSql + ' Order by TRET_DT';

  Gauge1.Visible := True;
  with dmAdoRelay.ADOOraSearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge1.Max := recordCount;
    Gauge1.Position := 0;
    While Not Eof do
    begin
      stCompanyCode := '001';
      stJijumCode := GetJijumCode(FindField('ORGN_NM_L').AsString);
      if stJijumCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_L').AsString) <> '' then
          CreateJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString,stJijumCode);
      end;
      stDepartCode := GetDepartCode(stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString);
      if stDepartCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_M').AsString) <> '' then
          CreateDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString,stDepartCode);
      end;
      stPosiCode := GetPosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString);
      if stPosiCode = '000' then
      begin
        if Trim(FindField('STTS_DIV_CD_NM').AsString) <> '' then
          CreatePosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString,stPosiCode);
      end;
      stEmpTypeCode := GetEmpTypeCode(FindField('ST_CD_NM').AsString);
      if stEmpTypeCode = '000' then
      begin
        if Trim(FindField('ST_CD_NM').AsString) <> '' then
          CreateEmTypeCode(FindField('ST_CD_NM').AsString,stEmpTypeCode);
      end;
      stStateCode := '3'; //직원은 모두 등록 상태로 처리 하자
      nIndex := RegCodeList.indexof(FindField('ST_CD').AsString);
      if nIndex > -1 then stStateCode := '1';
      if FindField('ST_CD').AsString = '' then stStateCode := '1';
      if FindField('ST_CD').IsNull then stStateCode := '1';
      PersonDataConversion(stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmpTypeCode,
                           FindField('ID').AsString,'0',FindField('NM').AsString,FindField('CELL_NO').AsString,stStateCode,
                           FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString);
      Gauge1.Position := Gauge1.Position + 1;

      Application.ProcessMessages;
      Next;
    end;
  end;
  stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',Now - 1);
  UpdateTB_CONFIG('EMPCONV','LASTTIME',stLastRelayTime);

  btn_WorkBranch.Enabled := False;
  Gauge1.Visible := False;
  btn_WorkBranch.Enabled := True;

end;

procedure TfmMain.CreateCompanyCode;
var
  stSql : string;
begin
  InsertIntoTB_COMPANY('001','000','000','1','충남대학교');
end;

procedure TfmMain.CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
var
  nJijumCode : integer;
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex < 0 then
  begin
    oJijumCode := TJijumCode.Create(nil);
    oJijumCode.jijumcode := aJijumCode;
    oJijumCode.JijumName := aJijumName;
    JijumCodeList.AddObject(aJijumName,oJijumCode);
  end;
end;

procedure TfmMain.CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
var
  nPosiCode : integer;
  oPosiCode : TPosiCode;
  nIndex : integer;
begin
  nPosiCode := GetMaxPosiCode(aCompanyCode);
  aPosiCode := FillZeroNumber(nPosiCode,3);
  InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName);
  nIndex := PosiCodeList.IndexOf(aPosiName);
  if nIndex < 0 then
  begin
    oPosiCode := TPosiCode.Create(nil);
    oPosiCode.Posicode := aPosiCode;
    oPosiCode.PosiName := aPosiName;
    PosiCodeList.AddObject(aPosiName,oPosiCode);
  end;
end;

procedure TfmMain.PersonDataConversion(aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpTypeCode,
                             aEmCode,aSeq,aEmName,aPhoneNumber,aStateCode,aJijumName,aDepartName,aPosiName:string);
var
  stSql : string;
  stCardNo : string;
  stRegGubun : string;
  nFdmsID : integer;
  stTemp : string;
begin

  if Length(aEmCode) <> 9 then aEmCode := FillZeroStrNum(aEmCode,9,True);

  stCardNo := MakeCardNo(aEmCode,aSeq);
  stRegGubun := aStateCode;
  if CheckTB_EMPLOYEE(aCompanyCode,aEmCode,nFdmsID) then
  begin
    if aStateCode <> '3' then
    begin
      UpdateTB_EMPLOYEE(aEmCode,
                      aEmName,
                      aCompanyCode,
                      aJijumCode,
                      aDepartCode,
                      aPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      aPhoneNumber,
                      stRegGubun,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      aEmpTypeCode);
    end else
    begin
      DeleteTB_EMPLOYEE(aCompanyCode,aEmCode);
    end;
    InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(nFdmsID),'2',stCardNo,aStateCode,aEmName,'','충남대',aJijumName,aDepartName,aPosiName);
  end else
  begin
    if aStateCode <> '3' then
    begin
      nFdmsID := strtoint(GetFdmsID);
      InsertTB_EMPLOYEE(aEmCode,
                      aEmName,
                      aCompanyCode,
                      aJijumCode,
                      aDepartCode,
                      aPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      aPhoneNumber,
                      stRegGubun,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      aEmpTypeCode);
      InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(nFdmsID),'1',stCardNo,'1',aEmName,'','충남대',aJijumName,aDepartName,aPosiName);
    end;
  end;
  if aStateCode <> '3' then
  begin
    if Not CheckTB_CARDEMPCODE(aCompanyCode,aEmCode) then   //카드가 없는 경우
    begin
      InsertTB_CARD(stCardNo,'3',stRegGubun,aEmCode,aCompanyCode);
    end;
  end else
  begin
    if CheckTB_CARDEMPCODE(aCompanyCode,aEmCode) then
    begin
      DeleteTB_DEVICECARDNO(aCompanyCode,aEmCode);
    end;
  end;


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
  UpdateTB_FORMNAME('001','대학교코드');
  UpdateTB_FORMNAME('002','대학교명칭');
  UpdateTB_FORMNAME('011','단과대코드');
  UpdateTB_FORMNAME('012','단과대명칭');
  UpdateTB_FORMNAME('021','학과코드');
  UpdateTB_FORMNAME('022','학과명칭');
  UpdateTB_FORMNAME('031','신분코드');
  UpdateTB_FORMNAME('032','신분명');
  UpdateTB_FORMNAME('040','재직구분');
  UpdateTB_FORMNAME('041','재직코드');
  UpdateTB_FORMNAME('042','재직구분');
  UpdateTB_FORMNAME('101','교번');
  UpdateTB_FORMNAME('102','성명');
  UpdateTB_FORMNAME('103','교내전화번호');
  UpdateTB_FORMNAME('104','입학일');
  UpdateTB_FORMNAME('105','졸업일');
  UpdateTB_FORMNAME('106','학생');
  UpdateTB_FORMNAME('901','단과대코드');
  UpdateTB_FORMNAME('902','단과대명칭');
  UpdateTB_FORMNAME('903','단과대권한');
  UpdateTB_FORMNAME('911','건물코드');
  UpdateTB_FORMNAME('912','건물명칭');
  UpdateTB_FORMNAME('913','건물권한');
  UpdateTB_FORMNAME('921','층코드');
  UpdateTB_FORMNAME('922','층명칭');
  UpdateTB_FORMNAME('923','층권한');
  UpdateTB_FORMNAME('933','기기별권한');

end;

procedure TfmMain.AlterTableTB_COMPANYName;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_COMPANY ALTER COLUMN CO_NAME varchar(100) ';
  ProcessExecSQL(stSql);
end;

function TfmMain.GetMaxDepartCode(aCompanyCode,aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '001';
  stSql := ' Select Max(CO_DEPARTCODE) as departCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := TargetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
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
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

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

function TfmMain.GetJijumCode(aJijumName: string): string;
var
  stSql : string;
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  result := '000';

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    result := TJijumCode(JijumCodeList.Objects[nIndex]).jijumcode;
    Exit;
  end;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';

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
    result := FindField('CO_JIJUMCODE').AsString;
    //메모리 적재
    nIndex := JijumCodeList.IndexOf(aJijumName);
    if nIndex < 0 then
    begin
      oJijumCode := TJijumCode.Create(nil);
      oJijumCode.jijumcode := FindField('CO_JIJUMCODE').AsString;
      oJijumCode.JijumName := aJijumName;
      JijumCodeList.AddObject(aJijumName,oJijumCode);
    end;
  end;

end;

function TfmMain.GetDepartCode(aJijumCode, aDepartName,aJijumName: string): string;
var
  stSql : string;
  nIndex : integer;
begin
  result := '000';
  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    result := TJijumCode(JijumCodeList.Objects[nIndex]).GetDepartCode(aDepartName);
    if result <> '' then Exit;
    result := '000';
  end;
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''3'' ';
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
    if nIndex > -1 then
    begin
      TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(FindField('CO_DEPARTCODE').AsString,aDepartName);
    end;
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
  stSql := stSql + 'EM_HANDPHONE= ''' + aHandphone + ''',';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := ProcessExecSQL(stSql);
end;


procedure TfmMain.LoadsCompanyCode(aStringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  stSql := stSql + ' Group by a.CO_NAME,a.CO_COMPANYCODE ';
  stSql := stSql + ' Order by a.CO_NAME ';

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;

      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('CO_NAME').AsString);
        aStringList.Add(FindField('CO_COMPANYCODE').AsString);
        Next;
      end;
      cmb_Box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.LoadsJijumCode(aCompanyCode: string;
  aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Order by a.CO_NAME ';

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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;
   
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmMain.LoadsDepartCode(aCompanyCode, aJijumCode: string;
  aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3''';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' Order by a.CO_NAME ';

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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString +  FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.LoadsEmpType(aStringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' order by RG_CODE ';

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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('RG_NAME').AsString);
      aStringList.Add(FindField('RG_CODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.LoadsPosiCode(aCompanyCode: string;
  aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' order by CO_COMPANYCODE,PO_POSICODE ';

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

    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('PO_NAME').AsString);
      aStringList.Add(FindField('CO_COMPANYCODE').AsString + FindField('PO_POSICODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if dmAdoRelay.AdoRelayConnected('3', ed_dbip.Text, ed_dbport.Text,
                    ed_dbuserid.Text, ed_dbpw.Text, ed_Oradbname.Text) then
  begin
    st_Connected.Caption := 'Connected';
    btn_targetAdoConnect.Enabled := True;
  end else st_Connected.Caption := 'DisConnected';

end;

{ TJijumCode }

constructor TJijumCode.Create(AOwner: TComponent);
begin
  inherited;
  DepartNameList := TStringList.Create;
end;

destructor TJijumCode.Destroy;
var
  i : integer;
begin
  if DepartNameList.Count > 0 then
  begin
    for i := DepartNameList.Count - 1 downto 0 do
    begin
      TDepartCode(DepartNameList.Objects[i]).Free;
    end;
  end;
  DepartNameList.Free;
  inherited;
end;

function TJijumCode.GetDepartCode(aDepartName: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex < 0 then Exit;
  result := TDepartCode(DepartNameList.Objects[nIndex]).Departcode;
end;

function TJijumCode.SetDepartCodeName(aDepartCode,
  aDepartName: string): Boolean;
var
  nIndex : integer;
  oDepartCode : TDepartCode;
begin
  result := False;
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex > -1 then Exit;
  oDepartCode := TDepartCode.Create(nil);
  oDepartCode.Departcode := aDepartCode;
  oDepartCode.DepartName := aDepartName;
  DepartNameList.AddObject(aDepartName,oDepartCode);
  result := True;
end;

function TfmMain.GetMaxJijumCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(CO_JIJUMCODE) as CO_JIJUMCODE from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := TargetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('CO_JIJUMCODE').AsString) then
      begin
        result := strtoint(FindField('CO_JIJUMCODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CreateDepartCode(aCompanyCode, aJijumCode,aDepartName,aJijumName: string; var aDepartCode: string);
var
  nIndex : integer;
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(aDepartCode,aDepartName);
  end;

end;

function TfmMain.GetPosiCode(aCompanyCode,aPosiName:string):string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oPosiCode : TPosiCode;
begin
  result := '000';
  nIndex := PosiCodeList.IndexOf(aPosiName);
  if nIndex > -1 then
  begin
    result := TPosiCode(PosiCodeList.Objects[nIndex]).Posicode;
    Exit;
  end;
  stSql := ' select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := TargetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
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
      if nIndex < 0 then
      begin
        oPosiCode := TPosiCode.Create(nil);
        oPosiCode.Posicode := FindField('PO_POSICODE').AsString;
        oPosiCode.PosiName := aPosiName;
        PosiCodeList.AddObject(aPosiName,oPosiCode);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetMaxPosiCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(PO_POSICODE) as PO_POSICODE from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := TargetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
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
        result := strtoint(FindField('PO_POSICODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetEmpTypeCode(aEmTypeName: string): string;
var
  stSql : string;
  nIndex : integer;
  oEmTypeCode : TEmTypeCode;
begin
  result := '000';

  nIndex := EmTypeCodeList.IndexOf(aEmTypeName);
  if nIndex > -1 then
  begin
    result := TEmTypeCode(EmTypeCodeList.Objects[nIndex]).EmTypecode;
    Exit;
  end;

  stSql := ' select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where RG_NAME = ''' + aEmTypeName + ''' ';

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
    result := FindField('RG_CODE').AsString;
    //메모리 적재
    nIndex := EmTypeCodeList.IndexOf(aEmTypeName);
    if nIndex < 0 then
    begin
      oEmTypeCode := TEmTypeCode.Create(nil);
      oEmTypeCode.EmTypeCode := FindField('RG_CODE').AsString;
      oEmTypeCode.EmTypeName := aEmTypeName;
      EmTypeCodeList.AddObject(aEmTypeName,oEmTypeCode);
    end;
  end;
end;

procedure TfmMain.CreateEmTypeCode(aName: string;
  var aEmpTypeCode: string);
var
  nEmTypeCode : integer;
  oEmTypeCode : TEmTypeCode;
  nIndex : integer;
begin
  nEmTypeCode := GetMaxEmTypeCode;
  aEmpTypeCode := FillZeroNumber(nEmTypeCode,3);
  InsertIntoTB_RELAYGUBUN(aEmpTypeCode,aName);
  nIndex := EmTypeCodeList.IndexOf(aName);
  if nIndex < 0 then
  begin
    oEmTypeCode := TEmTypeCode.Create(nil);
    oEmTypeCode.EmTypecode := aEmpTypeCode;
    oEmTypeCode.EmTypeName := aName;
    EmTypeCodeList.AddObject(aName,oEmTypeCode);
  end;
end;

function TfmMain.GetMaxEmTypeCode: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(RG_CODE) as RG_CODE from TB_RELAYGUBUN ';
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := TargetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('RG_CODE').AsString) then
      begin
        result := strtoint(FindField('RG_CODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.DeleteTB_EMPLOYEE(aCompanyCode, aEmCode: string);
var
  stSql : string;
begin
  stSql := ' Delete From TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  ProcessExecSQL(stSql);

end;

procedure TfmMain.DeleteTB_DEVICECARDNO(aCompanyCode, aEmCode: string);
var
  stSql : string;
begin
  stSql := ' Update A set A.DE_PERMIT = ''N'',A.DE_RCVACK = ''N'' ';
  stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
  stSql := stSql + ' WHERE A.GROUP_CODE = B.GROUP_CODE ';
  stSql := stSql + ' AND A.CA_CARDNO = B.CA_CARDNO ';
  stSql := stSql + ' AND B.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';

  ProcessExecSQL(stSql);

  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := ProcessExecSQL(stSql); 

end;

end.
