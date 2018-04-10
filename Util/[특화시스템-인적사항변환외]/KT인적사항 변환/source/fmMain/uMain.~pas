unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_MdbSearch: TSpeedButton;
    cmb_Code1: TComboBox;
    cmb_Code2: TComboBox;
    cmb_Code3: TComboBox;
    GroupBox2: TGroupBox;
    ed_DBPath: TEdit;
    btn_FileSearch: TSpeedButton;
    Label4: TLabel;
    OpenDialog1: TOpenDialog;
    GroupBox3: TGroupBox;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
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
    btn_Close: TSpeedButton;
    sg_Employ: TAdvStringGrid;
    MDBADOConnection: TADOConnection;
    TargetADOConnection: TADOConnection;
    MdbADOCodeLoad: TADOQuery;
    Label9: TLabel;
    ed_DBName: TEdit;
    lb_emType: TLabel;
    cmb_emType: TComboBox;
    Gauge1: TGauge;
    targetTempADOQuery: TADOQuery;
    targetADOExecQuery: TADOQuery;
    StatusBar1: TStatusBar;
    procedure btn_FileSearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_Code1Change(Sender: TObject);
    procedure cmb_Code2Change(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_MdbSearchClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_WorkBranchClick(Sender: TObject);
  private
    MDBCode1List : TStringList;
    MDBCode2List : TStringList;
    MDBCode3List : TStringList;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    Function MDBAdoConnect(aDBPath:string):Boolean;
    Function targetAdoConnect:Boolean;
    procedure LoadMDBCode1;
    procedure LoadMDBCode2(aCode1:string);
    procedure LoadMDBCode3(aCode1,aCode2:string);
    procedure LoadsCompanyCode(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsJijumCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsDepartCode(aCompanyCode,aJijumCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsPosiCode(aCompanyCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadsEmpType(aStringList:TStringList;cmb_Box:TComboBox);
  private
    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string):Boolean;
    Function CheckTB_CARDEMPCODE(aCompanyCode,aEmpID:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;

    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,afdmsID,aMode,aCardNo,aCardType,aEmName,aHandPhone,aCompanyName,aJijumName,aDepartName,aPosiName:string):string;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function SaveTB_KTCARDISSUE(aEmCode,aCardSeq:string):Boolean;
    Function CheckTB_KTCARDISSUE(aEmCode:string):Boolean;
    Function InsertTB_KTCARDISSUE(aEmCode,aCardSeq:string):Boolean;
    Function UpdateTB_KTCARDISSUE(aEmCode,aCardSeq:string):Boolean;

    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  uLomosUtil;

{$R *.dfm}

procedure TfmMain.btn_FileSearchClick(Sender: TObject);
begin
  ed_DBPath.Text := '';
  btn_MdbSearch.Enabled := False;
  if OpenDialog1.Execute then
  begin
    ed_DBPath.Text := OpenDialog1.FileName;
    if MDBAdoConnect(ed_DBPath.Text) then
    begin
      btn_MdbSearch.Enabled := True;
      LoadMDBCode1;
      LoadMDBCode2('');
      LoadMDBCode3('','');
    end else
    begin
      showmessage('데이터베이스 접속에 실패했습니다.');
      btn_MdbSearch.Enabled := False;
    end;
  end;
end;

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
  btn_MdbSearch.Enabled := False;
  btn_WorkBranch.Enabled := False;
end;

procedure TfmMain.LoadMDBCode1;
var
  stSql : string;
begin
  cmb_Code1.Clear;
  MDBCode1List.Clear;
  cmb_Code1.Items.Add('전체');
  MDBCode1List.Add('');
  cmb_Code1.ItemIndex := 0;

  stSql := 'select * from tbl_department_1st ';

  with MdbADOCodeLoad do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    while Not Eof do
    begin
      MDBCode1List.Add(FindField('dpt_department_1st_code').AsString);
      cmb_Code1.Items.Add(FindField('dpt_department_1st_name').AsString);
      Next;
    end;
  end;
end;

procedure TfmMain.LoadMDBCode2(aCode1: string);
var
  stSql : string;
begin
  cmb_Code2.Clear;
  MDBCode2List.Clear;
  cmb_Code2.Items.Add('전체');
  MDBCode2List.Add('');
  cmb_Code2.ItemIndex := 0;
  if Trim(aCode1) = '' then Exit;
  stSql := 'select * from tbl_department_2nd ';
  stSql := stSql + ' Where dpt_department_2nd_1st_code = ''' + aCode1 + ''' ';

  with MdbADOCodeLoad do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    while Not Eof do
    begin
      MDBCode2List.Add(FindField('dpt_department_2nd_code').AsString);
      cmb_Code2.Items.Add(FindField('dpt_department_2nd_name').AsString);
      Next;
    end;
  end;
end;

procedure TfmMain.LoadMDBCode3(aCode1, aCode2: string);
var
  stSql : string;
begin
  cmb_Code3.Clear;
  MDBCode3List.Clear;
  cmb_Code3.Items.Add('전체');
  MDBCode3List.Add('');
  cmb_Code3.ItemIndex := 0;
  if Trim(aCode1) = '' then Exit;
  if Trim(aCode2) = '' then Exit;

  stSql := 'select * from tbl_department_3rd ';
  stSql := stSql + ' Where dpt_department_3rd_1st_code = ''' + aCode1 + ''' ';
  stSql := stSql + ' And dpt_department_3rd_2nd_code = ''' + aCode2 + ''' ';

  with MdbADOCodeLoad do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    while Not Eof do
    begin
      MDBCode3List.Add(FindField('dpt_department_3rd_code').AsString);
      cmb_Code3.Items.Add(FindField('dpt_department_3rd_name').AsString);
      Next;
    end;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  MDBCode1List := TStringList.Create;
  MDBCode2List := TStringList.Create;
  MDBCode3List := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  MDBCode1List.Free;
  MDBCode2List.Free;
  MDBCode3List.free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;

end;

procedure TfmMain.cmb_Code1Change(Sender: TObject);
var
  stCode : string;
begin
  if cmb_Code1.ItemIndex < 0 then Exit;
  stCode := MDBCode1List.Strings[cmb_Code1.ItemIndex];
  LoadMDBCode2(stCode);
  LoadMDBCode3(stCode,'');

end;

procedure TfmMain.cmb_Code2Change(Sender: TObject);
var
  stCode1 : string;
  stCode2 : string;
begin
  if cmb_Code1.ItemIndex < 0 then Exit;
  if cmb_Code2.ItemIndex < 0 then Exit;
  stCode1 := MDBCode1List.Strings[cmb_Code1.ItemIndex];
  stCode2 := MDBCode2List.Strings[cmb_Code2.ItemIndex];
  LoadMDBCode3(stCode1,stCode2);

end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_MdbSearchClick(Sender: TObject);
var
  stCode1,stCode2,stCode3 : string;
  stSql : string;
  nRow : integer;
begin
  stCode1 := '';
  stCode2 := '';
  stCode3 := '';
  if cmb_Code1.ItemIndex > 0 then stCode1 := MDBCode1List.Strings[cmb_Code1.ItemIndex];
  if cmb_Code2.ItemIndex > 0 then stCode2 := MDBCode2List.Strings[cmb_Code2.ItemIndex];
  if cmb_Code3.ItemIndex > 0 then stCode3 := MDBCode3List.Strings[cmb_Code3.ItemIndex];

  stSql := 'Select * from tbl_employee ';
  if Trim(stCode1) <> '' then
  begin
    stSql := stSql + ' Where emp_department_1st_code = ''' + stCode1 + ''' ';
    if Trim(stCode2) <> '' then stSql := stSql + ' AND emp_department_2nd_code = ''' + stCode2 + ''' ';
    if Trim(stCode3) <> '' then stSql := stSql + ' AND emp_department_3rd_code = ''' + stCode3 + ''' ';
  end;

  with MdbADOCodeLoad do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nRow := 1;
    with sg_Employ do
    begin
      rowcount := recordcount + 1;
      While Not Eof do
      begin
        cells[0,nRow] := FindField('emp_user_id').AsString;
        cells[1,nRow] := FindField('emp_card_id').AsString;
        if FindField('emp_issue_count').IsNull then cells[2,nRow] := '51'
        else
        begin
          if FindField('emp_issue_count').asinteger = 0 then cells[2,nRow] := '51'
          else cells[2,nRow] := FillzeroNumber(FindField('emp_issue_count').asinteger,2);
        end;
        cells[3,nRow] := FindField('emp_user_name').AsString;
        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmMain.btn_targetAdoConnectClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  btn_WorkBranch.Enabled := False;
  if targetAdoConnect then
  begin
    LoadsCompanyCode(companyCodeList,cmb_Company);
    stCompanyCode := '000';
    if cmb_Company.itemIndex > 0 then
      stCompanyCode := CompanyCodeList.Strings[cmb_Company.itemIndex];
    LoadsJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
    stJijumCode := '000';
    if cmb_Jijum.itemIndex > 0 then
      stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemIndex],4,3);
    LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
    LoadsPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
    LoadsEmpType(EmpTypeCodeList,cmb_EmType);
    btn_WorkBranch.Enabled := True;
  end else
  begin
    showmessage('데이터베이스 접속실패');
  end;
end;

procedure TfmMain.LoadsCompanyCode(aStringList: TStringList;
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

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.CO_GUBUN = ''1''';
  stSql := stSql + ' Group by a.CO_NAME,a.CO_COMPANYCODE ';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.LoadsDepartCode(aCompanyCode, aJijumCode: string;
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

  if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;
  if (aJijumCode = '000') or (aJijumCode = '') then Exit;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.CO_GUBUN = ''3''';
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';

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

procedure TfmMain.LoadsJijumCode(aCompanyCode: string;
  aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  if (aCompanyCode = '000') or (aCompanyCode = '') then Exit;
  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.CO_GUBUN = ''2''';
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.CO_JIJUMCODE';

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

  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
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

procedure TfmMain.cmb_CompanyChange(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  if cmb_Company.itemIndex > 0 then
    stCompanyCode := CompanyCodeList.Strings[cmb_Company.itemIndex];
  LoadsJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  stJijumCode := '000';
  if cmb_Jijum.itemIndex > 0 then
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemIndex],4,3);
  LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadsPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);

end;

procedure TfmMain.cmb_JijumChange(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Jijum.itemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.itemIndex],1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemIndex],4,3);
  end;
  LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);

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

procedure TfmMain.btn_WorkBranchClick(Sender: TObject);
var
  i : integer;
  stEmCode : string;
  stCardNo : string;
  stEmpName : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stEmpTypeCode : string;
  stFdmsId : string;
  bResult : Boolean;
begin

  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  stPosiCode := '000';
  stEmpTypeCode := '001';

  if cmb_Company.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  end;
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  end;
  if cmb_Posi.ItemIndex > 0 then
  begin
    stPosiCode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3);
  end;
  if cmb_emType.ItemIndex > 0 then
  begin
    stEmpTypeCode := EmpTypeCodeList.Strings[cmb_Company.ItemIndex];
  end;

  if (stCompanyCode = '') or (stCompanyCode = '000') then
  begin
    showmessage('회사코드를 반드시 선택 하셔야 합니다.');
    Exit;
  end;
  btn_WorkBranch.Enabled := False;

  with sg_Employ do
  begin
    Gauge1.Visible := True;
    Gauge1.Progress := 0;
    Gauge1.MaxValue := rowcount - 1;
    for i := 1 to rowcount - 1 do
    begin
      Gauge1.Progress := i;
      StatusBar1.Panels[0].Text := stEmpName;
      Application.ProcessMessages;
      stEmCode := Cells[0,i];
      stCardNo := FillZeroStrNum(Cells[1,i],9) + FillZeroStrNum(cells[2,i],2);
      if Length(stCardNo) <> 11 then
      begin
        stCardNo := FillZeroStrNum(stEmCode,9) + '51';
      end;
      stEmpName := Cells[3,i];
      if Not CheckTB_EMPLOYEE(stCompanyCode,stEmCode) then
      begin
        stFdmsId := GetFdmsID;
        bResult := InsertTB_EMPLOYEE(stEmCode,stEmpName,stCompanyCode,stJijumCode,
                                 stDepartCode,stPosiCode,'',
                                 FormatDateTime('yyyymmdd',now),'99991231',
                                 '','','','','',
                                 '1',stCardNo,'',stFdmsId,stEmpTypeCode);

      end;
      if Not CheckTB_CARDEMPCODE(stCompanyCode,stEmCode) then
      begin
        if Not CheckTB_CARD(stCardNo) then
        begin
          bResult := InsertTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
        end;
      end;
      SaveTB_KTCARDISSUE(FillZeroStrNum(Cells[1,i],9),FillZeroStrNum(cells[2,i],2));
    end;
  end;
  btn_WorkBranch.Enabled := True;
  Gauge1.Visible := False;
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
  aJijumCode, aDepartCode, aPosiCod, aCompanyPhone, aJoinDate, aRetireDate,
  aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun, aCardNo,
  aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
begin
  Result := False;
  bResult := False;

  stSql := 'Insert Into TB_EMPLOYEE(';
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
  if FileExists(aEmpImg) then
  begin
    stSql := stSql + 'EM_IMAGE,';
  end;
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'FDMS_RELAY,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR, ';
  stSql := stSql + 'RG_CODE ) ';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCod + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  if FileExists(aEmpImg) then
  begin
    stSql := stSql + ':EM_IMAGE,';
  end;
  stSql := stSql + '''001'',';
  stSql := stSql + afdmsID + ',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''SYSTEM'', ';
  stSql := stSql + '''' + aEmTypeCode + ''' )';

  with targetADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    if rg_dbtype.ItemIndex = 0 then
    begin
      if FileExists(aEmpImg) then
        Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( aEmpImg, ftGraphic );
    end else
    begin
    end;
    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  stSql := InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
           aEmpNM,aHandphone,cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);//입력
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

  Result := False;
  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''SYSTEM'')' ;

  with targetADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  Result := True;
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

function TfmMain.SaveTB_KTCARDISSUE(aEmCode, aCardSeq: string): Boolean;
begin
  if Not CheckTB_KTCARDISSUE(aEmCode) then
    InsertTB_KTCARDISSUE(aEmCode,aCardSeq)
  else UpdateTB_KTCARDISSUE(aEmCode,aCardSeq);

end;

function TfmMain.CheckTB_KTCARDISSUE(aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_KTCARDISSUE ';
  stsql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';

  With targetTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    result := True;
  end;

end;

function TfmMain.InsertTB_KTCARDISSUE(aEmCode, aCardSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_KTCARDISSUE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' CARD_SEQ ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + inttostr(strtoint(aCardSeq)) + ')';

  result := ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_KTCARDISSUE(aEmCode, aCardSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_KTCARDISSUE Set ';
  stSql := stSql + ' CARD_SEQ = ' + inttostr(strtoint(aCardSeq));
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + '''';

  result := ProcessExecSQL(stSql);

end;

end.
