unit uCardValidDate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, uSubForm, CommandArray,ADODB,ActiveX,iniFiles,ComObj, AdvObj;

type
  TfmCardValidDate = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    GroupBox1: TGroupBox;
    btn_Search: TBitBtn;
    btn_Close: TBitBtn;
    sg_Employ: TAdvStringGrid;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    btn_ChangeValidDate: TSpeedButton;
    GroupBox2: TGroupBox;
    dt_FromDate: TDateTimePicker;
    Label1: TLabel;
    dt_ToDate: TDateTimePicker;
    Label4: TLabel;
    cmb_SearchType: TComboBox;
    cmb_CardRegType: TComboBox;
    lb_search: TLabel;
    ed_searchText: TEdit;
    btn_EmployeeDelete: TSpeedButton;
    cmb_EmpWorkGubun: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_EmployCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_ChangeValidDateClick(Sender: TObject);
    procedure btn_EmployeeDeleteClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    L_nCheckCount : integer;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    WorkGubunCodeList : TStringList;
    { Private declarations }
    procedure ShowCardList;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure ChangeValidateAll(aValidDate:string);
    procedure ChangeEmployeeValidate(aCompanyCode,aEmCode,aValidDate:string);
    procedure CardGradeDownLoad(aCardNo:string);
    procedure DeleteEmployee;
    function DleteCard(aCardNo:string):Boolean;
    function UpdateTB_DEVICECARDNO(aCardNo,aPermit:string):Boolean;
    //function DeleteEmployeeInfo(aCompanyCode,aEmCode,aCardNo:string):Boolean;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
  public
    { Public declarations }
  end;

var
  fmCardValidDate: TfmCardValidDate;

implementation
uses
  uCompanyCodeLoad,
  uDataModule1,
  uLomosUtil,
  uCommonSql,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uFireBird, uValidateSelect, udmAdoQuery;

{$R *.dfm}
procedure TfmCardValidDate.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
  WorkGubunCodeList := TStringList.Create;

  dt_FromDate.Date := Now - 30;
  dt_ToDate.Date := Now;

  GridInit(sg_Employ,9,2,True);
  L_nCheckCount := 0;

end;

procedure TfmCardValidDate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardValidDate';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
  EmpTypeCodeList.Free;
  WorkGubunCodeList.Free;

  Action := caFree;

end;

procedure TfmCardValidDate.btn_CloseClick(Sender: TObject);
begin
  close;

end;

procedure TfmCardValidDate.FormShow(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  stJijumCode := '000';
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);

  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardValidDate';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmCardValidDate.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
end;

procedure TfmCardValidDate.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmCardValidDate.cmb_SearchTypeChange(Sender: TObject);
begin
  lb_search.Caption := cmb_SearchType.Text;
  if cmb_SearchType.ItemIndex = 0 then
  begin
    cmb_CardRegType.Visible := True;
    ed_searchText.Visible := False;
    cmb_EmpWorkGubun.Visible := False;
  end else if cmb_SearchType.ItemIndex = 4 then
  begin
    cmb_CardRegType.Visible := False;
    ed_searchText.Visible := False;
    cmb_EmpWorkGubun.Visible := True;
    LoadWorkGubun(WorkGubunCodeList,cmb_EmpWorkGubun); 
  end else
  begin
    cmb_CardRegType.Visible := False;
    ed_searchText.Visible := True;
    cmb_EmpWorkGubun.Visible := False;
  end;

end;

procedure TfmCardValidDate.btn_SearchClick(Sender: TObject);
begin
  ShowCardList;

end;

procedure TfmCardValidDate.ShowCardList;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  stCardState : string;
  stFromDate : string;
  stToDate : string;
  stWorkCode : string;
begin
  GridInitialize(sg_Employ); //스트링그리드 초기화

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDJoinTBEmployee
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDJoinTBEmployee
  else Exit;
  stFromDate := FormatDateTime('yyyymmdd',dt_FromDate.Date);
  stToDate := FormatDateTime('yyyymmdd',dt_ToDate.Date);

  stSql := stSql + ' AND b.em_retiredate between ''' + stFromDate + ''' ';
  stSql := stSql + ' AND ''' + stToDate + ''' ';

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;
  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';

  if cmb_SearchType.ItemIndex = 0 then //카드등록구분
  begin
    if cmb_CardRegType.ItemIndex <> 0 then
    begin
      stSql := stSql + ' AND a.ca_cardtype = ''' + copy(cmb_CardRegType.Text,1,1)  + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 1 then //카드번호
    stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 2 then //사번
    stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 3 then //이름
    stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 4 then  //재직 구분
  begin
    stWorkCode := '';
    if cmb_EmpWorkGubun.ItemIndex > 0 then stWorkCode := WorkGubunCodeList.Strings[cmb_EmpWorkGubun.ItemIndex];
    if stWorkCode <> '' then stSql := stSql + ' AND b.WG_CODE = ''' + stWorkCode  + ''' '
  end;

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  TempAdoQuery.DisableControls;

  Try
    btn_Search.Enabled := False;
    Screen.Cursor:= crHourGlass;
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
      pan_gauge.Visible := True;
      Label2.Caption := '데이터 조회중입니다.';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := RecordCount;
      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('CA_CARDNO').AsString;
          cells[1,nRow] := FindField('em_retiredate').AsString;
          Case FindField('CA_CARDTYPE').asstring[1] of
            '1' : begin stCardState := '1.등록'; end;
            '2' : begin stCardState := '2.분실'; end;
            '3' : begin stCardState := '3.정지'; end;
            '4' : begin stCardState := '4.변경'; end;
          end;
          cells[2,nRow] := stCardState;// FindField('CA_CARDTYPE').AsString;
          cells[3,nRow] := FindField('COMPANYNAME').AsString;
          cells[4,nRow] := FindField('JIJUMNAME').AsString;
          cells[5,nRow] := FindField('DEPARTNAME').AsString;
          cells[6,nRow] := FindField('PO_NAME').AsString;
          cells[7,nRow] := FindField('EM_CODE').AsString;
          cells[8,nRow] := FindField('EM_NAME').AsString;
          cells[9,nRow] := FindField('CO_COMPANYCODE').AsString;
          AddCheckBox(0,nRow,False,False);
        end;
        Gauge1.Progress := nRow;
        nRow := nRow + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    pan_gauge.Visible := False;
    btn_Search.Enabled := True;
    Screen.Cursor:= crDefault;
  End;
end;

procedure TfmCardValidDate.sg_EmployCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nCheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nCheckCount := L_nCheckCount + 1
    else L_nCheckCount := L_nCheckCount - 1 ;
  end;

end;

procedure TfmCardValidDate.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmCardValidDate.btn_ChangeValidDateClick(Sender: TObject);
var
  stValidDate : string;
begin
  if L_nCheckCount < 1 then
  begin
    showmessage('변경할 카드가 선택 되지 않았습니다.');
    Exit;
  end;
  fmValidateSelect:= TfmValidateSelect.Create(Self);
  Try
    fmValidateSelect.SHowmodal;
    stValidDate := fmValidateSelect.ValidDate;
  Finally
    fmValidateSelect.Free;
  End;

  if stValidDate <> '' then
  begin
    ChangeValidateAll(stValidDate);
    ShowCardList;
  end;

end;

procedure TfmCardValidDate.ChangeValidateAll(aValidDate: string);
var
  i : integer;
  bChecked : Boolean;
begin
  Try
    btn_Search.Enabled := False;
    btn_ChangeValidDate.Enabled := False;
    btn_EmployeeDelete.Enabled := False;
    sg_Employ.Enabled := False;
    pan_gauge.Visible := True;
    Label2.Caption := '유효기간 변경 중입니다.';
    Gauge1.Progress := 0;
    Gauge1.MaxValue := L_nCheckCount;
    with sg_Employ do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bChecked);
        if bChecked then
        begin
          Gauge1.Progress := Gauge1.Progress + 1;
          ChangeEmployeeValidate(cells[9,i],cells[7,i],aValidDate);
          CardGradeDownLoad(cells[0,i]);
        end;
      end;
    end;
  Finally
    btn_Search.Enabled := True;
    btn_ChangeValidDate.Enabled := True;
    btn_EmployeeDelete.Enabled := True;
    sg_Employ.Enabled := True;
  End;
end;

procedure TfmCardValidDate.ChangeEmployeeValidate(aCompanyCode, aEmCode,
  aValidDate: string);
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set em_retiredate = ''' + aValidDate + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCardValidDate.CardGradeDownLoad(aCardNo: string);
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCardValidDate.btn_EmployeeDeleteClick(Sender: TObject);
var
  stValidDate : string;
begin
  if L_nCheckCount < 1 then
  begin
    showmessage('삭제할 카드가 선택 되지 않았습니다.');
    Exit;
  end;
  DeleteEmployee;
  ShowCardList;

end;

procedure TfmCardValidDate.DeleteEmployee;
var
  i : integer;
  bChecked : Boolean;
begin
  Try
    btn_Search.Enabled := False;
    btn_ChangeValidDate.Enabled := False;
    btn_EmployeeDelete.Enabled := False;
    sg_Employ.Enabled := False;
    pan_gauge.Visible := True;
    Label2.Caption := '데이터 삭제 중입니다.';
    Gauge1.Progress := 0;
    Gauge1.MaxValue := L_nCheckCount;
    with sg_Employ do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bChecked);
        if bChecked then
        begin
          Gauge1.Progress := Gauge1.Progress + 1;
          if DleteCard(cells[0,i]) then dmAdoQuery.DeleteTB_EMPLOYEE(cells[7,i],cells[9,i],cells[0,i]);
             //DeleteEmployeeInfo(cells[9,i],cells[7,i],cells[0,i]);
        end;
      end;
    end;
  Finally
    btn_Search.Enabled := True;
    btn_ChangeValidDate.Enabled := True;
    btn_EmployeeDelete.Enabled := True;
    sg_Employ.Enabled := True;
  End;
end;

function TfmCardValidDate.DleteCard(aCardNo: string):Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  result := False;
  if aCardNo = '' then Exit;
  bResult := UpdateTB_DEVICECARDNO(aCardNo,'N'); //모든 카드 권한을 삭제 처리함
  if Not bResult then Exit;

  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCardValidDate.UpdateTB_DEVICECARDNO(aCardNo,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;
(*
function TfmCardValidDate.DeleteEmployeeInfo(aCompanyCode,
  aEmCode,aCardNo: string): Boolean;
var
  stSql : string;
  stFdmsId : string;
begin
  Result := False;
  stFdmsId := GetEmployeeFdmsID(aCompanyCode,aEmCode);
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,stFdmsId,'3',aCardNo,'2',
           '','','','','','');//삭제
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmCode + ''' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
  begin
    stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';
  end;
  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,aCardNo,'CardValidDate','3');
  DataModule1.ProcessExecSQL(stSql);
end;
*)

function TfmCardValidDate.GetEmployeeFdmsID(aCompanyCode,
  aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TAdoQuery;
begin
  result := '0';
  stSql := 'select fdms_id from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

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
      if recordCount < 1 then Exit;
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := inttostr(nFdms_id);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCardValidDate.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmCardValidDate);
Finalization
  UnRegisterClass(TfmCardValidDate);

end.
