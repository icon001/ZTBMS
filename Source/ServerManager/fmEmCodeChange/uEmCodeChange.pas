unit uEmCodeChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,ADODB,ActiveX, ExtCtrls, Grids, AdvObj,
  BaseGrid, AdvGrid, uSubForm, CommandArray;

type
  TfmEmCodeChange = class(TfmASubForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    lb_sabun: TLabel;
    ed_EmpNo: TEdit;
    lb_empName: TLabel;
    Label2: TLabel;
    ed_sEmpNo: TEdit;
    lb_sEmName: TLabel;
    cmb_sCompany: TComboBox;
    Label4: TLabel;
    btn_Update: TSpeedButton;
    btn_Close: TSpeedButton;
    lb_JijumName1: TLabel;
    cmb_sJijum: TComboBox;
    lb_DepartName1: TLabel;
    cmb_sDepart: TComboBox;
    lb_PosiName1: TLabel;
    cmb_sPosi: TComboBox;
    SpeedButton1: TSpeedButton;
    pan_EmployeeSearch: TPanel;
    Label1: TLabel;
    ed_Name: TEdit;
    SpeedButton2: TSpeedButton;
    sg_Employ: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ed_EmpNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sEmpNoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_UpdateClick(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ed_NameChange(Sender: TObject);
    procedure sg_EmployDblClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    sCompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    sJijumCodeList : TStringList;
    PosiCodeList : TStringList;
    sPosiCodeList : TStringList;
    DepartCodeList : TStringList;
    sDepartCodeList : TStringList;

    L_bFindName : Boolean;
    L_bDubCheck : Boolean;
    { Private declarations }
    function GetEmpName(aCompanyCode,aEmCode:string):string;
    function CheckTB_Employee(aCompanyCode,aEmCode:string):Boolean;
    function ChangeEmCode(aCompanyCode,aEmpCode,aTargetCompanyCode,aTargetJijumCode,aTargetDepartCode,aTargetPosiCode,aTargetEmCode:string):Boolean;
    function UpdateTB_EMPLOYEE_EmCode(aCompanyCode,aEmpCode,aTargetCompanyCode,aTargetEmCode:string):Boolean;
    function UpdateTB_CARD_EmCode(aCompanyCode,aEmpCode,aTargetCompanyCode,aTargetEmCode:string):Boolean;
    procedure ShowEmployeeName(aName:string);
  public
    { Public declarations }
  end;

var
  fmEmCodeChange: TfmEmCodeChange;

implementation

uses
  uCompanyCodeLoad,
  uDataModule1, uCommonSql, uMssql, uPostGreSql, uMDBSql, uFireBird;
{$R *.dfm}

procedure TfmEmCodeChange.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmCodeChange.FormCreate(Sender: TObject);
var
  stCompanyCode : string;
begin
  CompanyCodeList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  sPosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadCompanyCode(sCompanyCodeList,cmb_sCompany);
  stCompanyCode := '000';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_sCompany.ItemIndex];
  LoadPosiCode(stCompanyCode,sPosiCodeList,cmb_sPosi);
  LoadJijumCode(stCompanyCode,sJijumCodeList,cmb_sJijum);
  LoadDepartCode('000','000',sDepartCodeList,cmb_sDepart);

  lb_empName.Caption := '';
  lb_sEmName.Caption := '';
end;

procedure TfmEmCodeChange.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  sCompanyCodeList.Free;
  JijumCodeList.Free;
  sJijumCodeList.Free;
  PosiCodeList.Free;
  sPosiCodeList.Free;
  DepartCodeList.Free;
  sDepartCodeList.Free;
end;

procedure TfmEmCodeChange.ed_EmpNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stCompanyCode : string;
begin
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex]
  else stCompanyCode := '';
  lb_empName.Caption := GetEmpName(stCompanyCode,ed_EmpNo.Text);

end;

function TfmEmCodeChange.GetEmpName(aCompanyCode, aEmCode: string): string;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  L_bFindName := False;
  result := '';
  stSql := 'select * from tb_employee ';
  stSql := stSql + ' Where em_code = ''' + aEmCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount <> 1 then Exit;
      result := FindField('EM_NAME').AsString;
      L_bFindName := True;
    end;

  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmCodeChange.ed_sEmpNoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stCompanyCode : string;
begin
  lb_sEmName.Caption := '';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex]
  else stCompanyCode := '';
  if CheckTB_Employee(stCompanyCode,ed_sEmpNo.Text) then
  begin
    lb_sEmName.Caption := '�ߺ� ��� ����';
  end;
end;

function TfmEmCodeChange.CheckTB_Employee(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  L_bDubCheck := False;
  result := False;
  stSql := 'select * from tb_employee ';
  stSql := stSql + ' Where em_code = ''' + aEmCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

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
      result := True;
      L_bDubCheck := True;
    end;

  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmEmCodeChange.btn_UpdateClick(Sender: TObject);
var
  stCompanyCode : string;
  stCompanyCode1 : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
begin
  if Not L_bFindName then
  begin
    showmessage('������ ����� ã�� ���Ͽ����ϴ�.');
    Exit;
  end;
  if L_bDubCheck then
  begin
    showmessage('�ߺ� ����� ���� �մϴ�.');
    Exit;
  end;
  if ed_EmpNo.Text = '' then Exit;
  if ed_sEmpNo.Text = '' then Exit;

  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex]
  else stCompanyCode := '';
  if cmb_sCompany.ItemIndex > 0 then stCompanyCode1 := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex]
  else stCompanyCode1 := '';

  if cmb_sJijum.ItemIndex > 0 then stJijumCode := copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3)
  else stJijumCode := '';

  if cmb_sDepart.ItemIndex > 0 then  stDepartCode := copy(sDepartCodeList.Strings[cmb_sDepart.itemIndex],7,3)
  else stDepartCode := '';

  if cmb_sPosi.ItemIndex > 0 then  stPosiCode := copy(sPosiCodeList.Strings[cmb_sPosi.ItemIndex],4,3)
  else stPosiCode := '';

  ChangeEmCode(stCompanyCode,ed_EmpNo.Text,stCompanyCode1,stJijumCode,stDepartCode,stPosiCode,ed_sEmpNo.Text);
  ed_EmpNo.Text := '';
  ed_sEmpNo.Text := '';

end;

function TfmEmCodeChange.ChangeEmCode(aCompanyCode, aEmpCode,
  aTargetCompanyCode,aTargetJijumCode,aTargetDepartCode,aTargetPosiCode, aTargetEmCode: string): Boolean;
var
  stSql : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
begin
  //UpdateTB_EMPLOYEE_EmCode(aCompanyCode,aEmpCode,aTargetCompanyCode,aTargetEmCode);
  stSql := ' Insert Into TB_EMPLOYEE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' EM_COPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' ZI_ZIPCODE,';
  stSql := stSql + ' EM_ADDR1,';
  stSql := stSql + ' EM_ADDR2,';
  stSql := stSql + ' EM_JOINDATE,';
  stSql := stSql + ' EM_RETIREDATE,';
  stSql := stSql + ' EM_IMAGE,';
  stSql := stSql + ' EM_PASS,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' EM_UPDATETIME,';
  stSql := stSql + ' EM_UPDATEOPERATOR,';
  stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' FDMS_RELAY,';
  stSql := stSql + ' RG_CODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' DG_CODE,';
  stSql := stSql + ' DG_APPLY,';
  stSql := stSql + ' DE_TIMECODEUSE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_WEEKCODE,';
  stSql := stSql + ' EM_MASTER )';
  stSql := stSql + ' select ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + '''' + aTargetEmCode + ''',';
  if aTargetCompanyCode = '' then stSql := stSql + ' CO_COMPANYCODE,'
  else stSql := stSql + '''' + aTargetCompanyCode + ''',';
  if aTargetJijumCode = '' then stSql := stSql + ' CO_JIJUMCODE,'
  else stSql := stSql + '''' +  aTargetJijumCode + ''',';
  if aTargetDepartCode = '' then stSql := stSql + ' CO_DEPARTCODE,'
  else stSql := stSql + '''' +  aTargetDepartCode + ''',';
  if aTargetPosiCode = '' then stSql := stSql + ' PO_POSICODE,'
  else stSql := stSql + '''' +  aTargetPosiCode + ''',';
  stSql := stSql + ' EM_NAME,';
  stSql := stSql + ' EM_COPHONE,';
  stSql := stSql + ' EM_HOMEPHONE,';
  stSql := stSql + ' EM_HANDPHONE,';
  stSql := stSql + ' ZI_ZIPCODE,';
  stSql := stSql + ' EM_ADDR1,';
  stSql := stSql + ' EM_ADDR2,';
  stSql := stSql + ' EM_JOINDATE,';
  stSql := stSql + ' EM_RETIREDATE,';
  stSql := stSql + ' EM_IMAGE,';
  stSql := stSql + ' EM_PASS,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' EM_UPDATETIME,';
  stSql := stSql + ' EM_UPDATEOPERATOR,';
  stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' FDMS_RELAY,';
  stSql := stSql + ' RG_CODE,';
  stSql := stSql + ' AW_CODE,';
  stSql := stSql + ' DG_CODE,';
  stSql := stSql + ' DG_APPLY,';
  stSql := stSql + ' DE_TIMECODEUSE,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_WEEKCODE, ';
  stSql := stSql + ' EM_MASTER ';
  stSql := stSql + ' From TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
     stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpCode + ''' ';

  dataModule1.ProcessExecSQL(stSql);
  UpdateTB_CARD_EmCode(aCompanyCode,aEmpCode,aTargetCompanyCode,aTargetEmCode);

//  stCompanyName := GetEmployeeCompanyName(aCompanycode,aEmpCode);
//  stJijumName := GetEmployeeJijumName(aCompanycode,aEmpCode);
//  stDepartName := GetEmployeeDepartName(aCompanycode,aEmpCode);
//  stPosiName := GetEmployeePosiName(aCompanycode,aEmpCode);

//  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpCode,aFdmsID,'1',aCardNo,aCardType,
//           aEmName,'',stCompanyName,stJijumName,stDepartName,stPosiName);//����
//  DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmCodeChange.UpdateTB_CARD_EmCode(aCompanyCode, aEmpCode,
  aTargetCompanyCode, aTargetEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set EM_CODE = ''' + aTargetEmCode + ''', ';
  stSql := stSql + ' CA_MEMLOAD = ''N'' ';
  if (aTargetCompanyCode <> '') and (aTargetCompanyCode <> '000') then
    stSql := stSql + ', CO_COMPANYCODE = ''' + aTargetCompanyCode + ''' ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmpCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + 'AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmEmCodeChange.UpdateTB_EMPLOYEE_EmCode(aCompanyCode, aEmpCode,
  aTargetCompanyCode, aTargetEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set EM_CODE = ''' + aTargetEmCode + ''' ';
  if (aTargetCompanyCode <> '') and (aTargetCompanyCode <> '000') then
    stSql := stSql + ', CO_COMPANYCODE = ''' + aTargetCompanyCode + ''' ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmpCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + 'AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmEmCodeChange.cmb_sCompanyChange(Sender: TObject);
begin
  LoadJijumCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sJijumCodeList,cmb_sJijum);
  if cmb_sJijum.ItemIndex > -1 then
  LoadDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
  LoadPosiCode(sCompanyCodeList.Strings[cmb_sCompany.ItemIndex],sPosiCodeList,cmb_sPosi);
end;

procedure TfmEmCodeChange.cmb_sJijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],1,3),copy(sJijumCodeList.Strings[cmb_sJijum.ItemIndex],4,3),sDepartCodeList,cmb_sDepart);
end;

procedure TfmEmCodeChange.SpeedButton1Click(Sender: TObject);
begin
  ed_Name.Text := '';
  pan_EmployeeSearch.Visible := True;
end;

procedure TfmEmCodeChange.SpeedButton2Click(Sender: TObject);
begin
  pan_EmployeeSearch.Visible := False;
end;

procedure TfmEmCodeChange.ed_NameChange(Sender: TObject);
begin
  ShowEmployeeName(ed_Name.Text);
end;

procedure TfmEmCodeChange.ShowEmployeeName(aName: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  bWhereSearch : Boolean;
begin
  GridInitialize(sg_Employ); //��Ʈ���׸��� �ʱ�ȭ
  if aName = '' then Exit;

  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;
  stSql := stSql + ' AND a.EM_NAME LIKE ''%' + aName  + '%'' ';
  stSql := stSql + ' order by a.EM_CODE ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  TempAdoQuery.DisableControls;

  Try
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
          //if FindField('EM_IMAGE').IsNull then  cells[18,nRow] := 'N'
          //else cells[18,nRow] := 'Y';
          cells[19,nRow] := FindField('CA_CARDNO').AsString;
          cells[20,nRow] := FindField('CA_CARDTYPE').AsString;
          cells[21,nRow] := FindField('RG_CODE').AsString;
          cells[22,nRow] := FindField('FDMS_ID').AsString;
          cells[23,nRow] := FindField('DE_TIMECODEUSE').AsString;
          cells[24,nRow] := FindField('TC_GROUP').AsString;
          cells[25,nRow] := FindField('TC_TIME1').AsString;
          cells[26,nRow] := FindField('TC_TIME2').AsString;
          cells[27,nRow] := FindField('TC_TIME3').AsString;
          cells[28,nRow] := FindField('TC_TIME4').AsString;
          cells[29,nRow] := FindField('TC_WEEKCODE').AsString;
          cells[30,nRow] := FindField('EM_MASTER').AsString;

        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmEmCodeChange.sg_EmployDblClick(Sender: TObject);
var
  nIndex : integer;
begin
  inherited;
  nIndex := CompanyCodeList.IndexOf(sg_Employ.Cells[6,sg_Employ.Row]);
  if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
  ed_EmpNo.text :=  sg_Employ.Cells[1,sg_Employ.Row];
  lb_empName.Caption := GetEmpName(sg_Employ.Cells[6,sg_Employ.Row],ed_EmpNo.Text);
  pan_EmployeeSearch.Visible := False;
end;

end.