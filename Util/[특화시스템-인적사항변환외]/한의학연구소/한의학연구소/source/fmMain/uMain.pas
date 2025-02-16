unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls;

type
  TfmMain = class(TForm)
    GroupBox2: TGroupBox;
    ed_DBPath: TEdit;
    btn_FileSearch: TSpeedButton;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    GroupBox3: TGroupBox;
    btn_WorkBranch: TBitBtn;
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
    btnClose: TBitBtn;
    CheckBox1: TCheckBox;
    Gauge1: TGauge;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_FileSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn_WorkBranchClick(Sender: TObject);
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
    Function GetEmCode:integer;
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
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetMaxDepartCode(aCompanycode,aJijumCode:string):string;
    Function MakeCardNo( aIDNO,aSeq:string):string;
    Function GetMaxCompanyCode:integer;
    Function GetMaxJijumCode(aCompanycode:string):string;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function GetMaxPosiCode(aCompanyCode:string):string;
  public
    { Public declarations }
    procedure DeleteTB_COMPANYCODE;
    procedure DeleteTB_PosiCODE;
    procedure DeleteTB_Employee;
    procedure DeleteTB_CARD;
    procedure DeleteTB_RelayCode;
    procedure AlterTableTB_COMPANYName;
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateRelayGubunCode;
    procedure CreateCompanyCode(aCompanyName:string;var aCompanyCode:string);
    procedure CreateJijumCode(aCompanycode,aJijumName:string; var aJijumCode:string);
    procedure CreateDepartCode(aCompanycode,aJijumCode,aDepartName:string; var aDepartCode:string);
    procedure FormNameChange;
    procedure PersonDataConversion;
    function LinePersonConvert(aPersonData:string;aFdmsID,aEmCode:integer):Boolean;
  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil;

{$R *.dfm}

procedure TfmMain.btn_FileSearchClick(Sender: TObject);
begin
  ed_DBPath.Text := '';
  OpenDialog1.DefaultExt := 'csv';
  if OpenDialog1.Execute then
  begin
    ed_DBPath.Text := OpenDialog1.FileName;
  end;
end;

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

procedure TfmMain.FormActivate(Sender: TObject);
begin
  btn_WorkBranch.Enabled := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  GROUPCODE := '1234567890';
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;

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

procedure TfmMain.btn_WorkBranchClick(Sender: TObject);
begin
  if Not FileExists(ed_DBPath.Text) then
  begin
    showmessage('파일이 존재하지 않습니다.');
    Exit;
  end;
  if CheckBox1.Checked then
  begin
    if Application.MessageBox('데이터가 삭제됩니다. 계속 하시겠습니까?','경고',MB_OKCANCEL) = IDCANCEL then Exit;
    DeleteTB_COMPANYCODE;
    DeleteTB_PosiCODE;
    DeleteTB_Employee;
    DeleteTB_CARD;
    AlterTableTB_COMPANYName;
    //CreatePosiCode;
    //CreateRelayGubunCode;
    //CreateCompanyCode;
    //CreateJijumCode;
    //CreateDeprtCode;
    //FormNameChange;
  end;
  PersonDataConversion;
end;

procedure TfmMain.CreateCompanyCode(aCompanyName:string;var aCompanyCode:string);
var
  stSql : string;
  nCompanyCode : integer;
begin
  nCompanyCode := GetMaxCompanyCode;
  aCompanyCode := FillZeroNumber(nCompanyCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,'000','000','1',aCompanyName);
  //InsertIntoTB_COMPANY(aCompanyCode,'001','000','2','본사');
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

procedure TfmMain.PersonDataConversion;
var
  stSql : string;
  stPreCompanyName : string;
  stPreJijumName : string;
  stPreDepartName : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stRgCode : string;
  stEmName : string;
  stCardNo : string;
  stRegGubun : string;
  nFdmsID : integer;
  nEmCode : integer;
  PersonList : TStringList;
  i : integer;
begin
  stPreCompanyName := '';
  stPreJijumName := '';
  stPreDepartName := '';
  nFdmsID := strtoint(GetFdmsID);
  nEmCode := GetEmCode;

  Try
    btn_WorkBranch.Enabled := False;
    PersonList := TStringList.Create;
    PersonList.LoadFromFile(ed_DBPath.Text);
    Gauge1.Visible := True;
    Gauge1.Progress := 0;
    Gauge1.MaxValue := PersonList.Count - 1;
    for i := 1 to PersonList.Count - 1 do
    begin
      Gauge1.Progress := i;
      if LinePersonConvert(PersonList.Strings[i],nFdmsID,nEmCode) then
      begin
        nFdmsID := nFdmsID + 1;
        nEmCode := nEmCode + 1;
      end;
      Application.ProcessMessages;
      Label1.Caption := inttostr(i);
    end;
  Finally
    PersonList.Free;
    btn_WorkBranch.Enabled := True;
  End;
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
  UpdateTB_FORMNAME('001','동코드');
  UpdateTB_FORMNAME('002','동');
  UpdateTB_FORMNAME('011','층코드');
  UpdateTB_FORMNAME('012','층');
  UpdateTB_FORMNAME('021','호실코드');
  UpdateTB_FORMNAME('022','호실명칭');
  UpdateTB_FORMNAME('031','학과코드');
  UpdateTB_FORMNAME('032','학과명');
  UpdateTB_FORMNAME('040','재직구분');
  UpdateTB_FORMNAME('041','재직코드');
  UpdateTB_FORMNAME('042','재직구분');
  UpdateTB_FORMNAME('103','호실정보');
  UpdateTB_FORMNAME('101','학번');
  UpdateTB_FORMNAME('106','학생');

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


function TfmMain.LinePersonConvert(aPersonData: string;aFdmsID,aEmCode:integer): Boolean;
var
  TempList : TStringList;
  i : integer;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stEmCode : string;
  stCardNo : string;
  stEmName : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
  stJumin : string;
  stHPNum : string;
  stSql : string;
begin
  result := False;
  aPersonData := stringReplace(aPersonData,' ','^',[rfReplaceAll]);
  TempList := TStringList.Create;
  TempList.Delimiter := ',';
  TempList.DelimitedText := aPersonData;

  stCardNo := TempList.Strings[0];
  if Trim(stCardNo) <> '' then stCardNo := FillZeroNumber(Hex2Dec(stCardNo),10);
  if CheckTB_CARD(stCardNo) then Exit;
  stEmName := TempList.Strings[1];

  Try
    stCompanyName := '한의학정보';
    stCompanyName := stringReplace(stCompanyName,'^',' ',[rfReplaceAll]);
    stJijumName := '';
    stJijumName := stringReplace(stJijumName,'^',' ',[rfReplaceAll]);
    stDepartName := '';
    stDepartName := stringReplace(stDepartName,'^',' ',[rfReplaceAll]);
    stPosiName := '';
    stPosiName := stringReplace(stPosiName,'^',' ',[rfReplaceAll]);
    stJumin := '';

    stCompanyCode := GetCompanyCode(stCompanyName);
    if stCompanyCode = '000' then
    begin
      if Trim(stCompanyName) <> '' then
        CreateCompanyCode(stCompanyName,stCompanyCode);
    end;
    stJijumCode := GetJijumCode(stCompanyCode,stJijumName);
    if stJijumCode = '000' then
    begin
      if Trim(stJijumName) <> '' then
        CreateJijumCode(stCompanyCode,stJijumName,stJijumCode);
    end;
    stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,stDepartName);
    if stDepartCode = '000' then
    begin
      if Trim(stDepartName) <> '' then
        CreateDepartCode(stCompanyCode,stJijumCode,stDepartName,stDepartCode);
    end;
    stPosiCode := GetPosiCode(stCompanyCode,stPosiName);
    if stPosiCode = '000' then
    begin
      if Trim(stPosiName) <> '' then
        CreatePosiCode(stCompanyCode,stPosiName,stPosiCode);
    end;
    stCardState := '1';
    stEmCode := 'Z-' + FillZeroNumber(aEmCode,5);
    stEmCode := stringReplace(stEmCode,'^',' ',[rfReplaceAll]);
    stHPNum := '';
    stEmName := stringReplace(stEmName,'^',' ',[rfReplaceAll]);
    Label2.Caption :=  stEmCode;

    if Not InsertTB_EMPLOYEE(stEmCode,
                        stEmName,
                        stCompanyCode,
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        stJumin,
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        stHPNum,
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(aFdmsID),
                        '001') then
    begin
        UpdateTB_EMPLOYEE(stEmCode,
                        stEmName,
                        stCompanyCode,
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        stJumin,
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(aFdmsID),
                        '001');
        stSql := InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(aFdmsID),
                          '2',stCardNo,stCardState,stEmName,
                          '',stCompanyName,'본사',stDepartName,stPosiName);
        ProcessExecSQL(stSql);
    end else
    begin
        stSql :=  InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(aFdmsID),
                          '1',stCardNo,stCardState,stEmName,
                          '',stCompanyName,'본사',stDepartName,stPosiName);
        ProcessExecSQL(stSql);
    end;

    if CheckTB_CARD(stCardNo) then
    begin
      UpdateTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
    end else
    begin
      InsertTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
    end;

  Finally
    TempList.Free;
  End;
  result := True;
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

function TfmMain.GetJijumCode(aCompanyCode, aJijumName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
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
  end;

end;

procedure TfmMain.CreateJijumCode(aCompanycode, aJijumName: string;
  var aJijumCode: string);
begin
  aJijumCode := GetMaxJijumCode(aCompanycode);
  InsertIntoTB_COMPANY(aCompanycode,aJijumCode,'000','2',aJijumName);

end;

function TfmMain.GetMaxJijumCode(aCompanycode: string): string;
var
  stSql : string;
begin
  result := '001';
  stSql := ' Select Max(CO_JIJUMCODE) as JIJUMCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanycode + '''';

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
    if isDigit(FindField('JIJUMCode').AsString) then
    begin
      result := FillZeroNumber(strtoint(FindField('JIJUMCode').AsString) + 1 ,3);
    end else
    begin
      result := '001';
    end;
  end;
end;

function TfmMain.GetEmCode: integer;
var
  stSql : string;
  nFdms_id : integer;
  stSabun : string;
begin
  result := 1;
  stSql := 'select Max(EM_CODE) as EM_CODE from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = '''  + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE Like ''Z-%'' ';
  if rg_dbtype.ItemIndex = 1 then stSql := stSql + ' AND Length(EM_CODE) = 7 '
  else stSql := stSql + ' AND Len(EM_CODE) = 7 ';
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
    stSabun := FindField('EM_CODE').AsString;
    if stSabun = '' then Exit;
    stSabun := copy(stSabun,3,Length(stSabun) - 2);
    result := strtoint(stSabun) + 1;
  end;
end;

procedure TfmMain.DeleteTB_Employee;
var
  stSql : string;
begin
  stSql := ' Delete From TB_Employee ';
  ProcessExecSQL(stSql);

end;

procedure TfmMain.DeleteTB_CARD;
var
  stSql : string;
begin
  stSql := ' Delete From TB_CARD ';
  ProcessExecSQL(stSql);

end;

end.
