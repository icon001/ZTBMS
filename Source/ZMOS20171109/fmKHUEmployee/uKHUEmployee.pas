unit uKHUEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, Buttons, uSubForm,
  CommandArray, DB, ADODB,ActiveX, AdvObj;

type
  TfmKHUEmployee = class(TfmASubForm)
    GroupBox1: TGroupBox;
    sg_Employ: TAdvStringGrid;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
    lb_sabun: TLabel;
    ed_EmpNo: TEdit;
    btn_OracleSearch: TSpeedButton;
    GroupBox3: TGroupBox;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    lb_JijumName: TLabel;
    cmb_Jijum: TComboBox;
    lb_DepartName: TLabel;
    cmb_Depart: TComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TComboBox;
    btn_Close: TSpeedButton;
    btn_WorkBranch: TBitBtn;
    ADORelaySearch: TADOQuery;
    Label1: TLabel;
    ed_CardNo: TEdit;
    btn_CardSearch: TSpeedButton;
    procedure btn_CSVClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_OracleSearchClick(Sender: TObject);
    procedure sg_EmployCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_WorkBranchClick(Sender: TObject);
    procedure btn_CardSearchClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    CheckCount : integer;
    { Private declarations }
    procedure FormNameSet;
    function getEmpRelayInfo(aEmpCode:string;var aName,aCardNo:string):Boolean;
//    Function getCardRelayInfo(aCardNo:string;var aName,aEmCode:string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(aCompanyCode,aEmCode,aEmName,
                                aJijumCode,aDepartCode,aPosicode,aFdmsNo:string):Boolean;
    Function UpdateTB_EMPLOYEE(aCompanyCode,aEmCode,aEmName,
                                aJijumCode,aDepartCode,aPosicode:string):Boolean;

    Function GetFdmsID:integer;
    Function GetEmployeeFdmsID(aCompanyCode,aEmpID:string):string;
    Function GetMaxPositionNum : integer;

    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertIntoTB_CARD(aCardNo,aGubun,aRegType,aEmCode,aCompanyCode,aPositionNum:string):Boolean;
    Function updateTB_CARD(aCardNo,aGubun,aRegType,aEmCode,aCompanyCode:string):Boolean;
    
    Function CheckTB_CARDEMPNO(aCompanyCode,aEmCode,aCardNo:string):Boolean;
    Function DeleteTB_CARD(aCardNo : string):Boolean;
    Function UpdateTB_DEVICECARDNOGRADEDEL(aCardNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmKHUEmployee: TfmKHUEmployee;

implementation

uses
  udmAdoRelay,
  uDataModule1,
  uCompanyCodeLoad,
  uLomosUtil,
  uCommonSql;

{$R *.dfm}

procedure TfmKHUEmployee.btn_CSVClick(Sender: TObject);
var
  stFile : string;
  i : integer;
  stName,stCardNo : string;
begin
  RowGridInitialize(sg_Employ,2,True);
  OpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
    stFile:= OpenDialog1.FileName;
    sg_Employ.LoadFromCSV(stFile);
  end;

  for i := 1 to sg_Employ.RowCount - 1 do
  begin
    sg_Employ.AddCheckBox(0,i,False,False);
    stName := '';
    stCardNo := '';
    getEmpRelayInfo(Trim(sg_Employ.Cells[0,i]),stName,stCardNo);
    sg_Employ.Cells[1,i] := stName;
    sg_Employ.Cells[2,i] := stCardNo;
  end;

end;

procedure TfmKHUEmployee.FormShow(Sender: TObject);
begin
  RowGridInitialize(sg_Employ,2,True);
  if Not dmAdoRelay.ADOConnection.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected(inttostr(G_nRelayDataBaseType), G_stRelayServerIP, G_stRelayServerPort,
                      G_stRelayUserID, G_stRelayUserPW, G_stRelayDataBaseName) then
    begin
      showmessage('오라클 연동에 실패하였습니다.');
      Exit;
    end;
  end;

end;

procedure TfmKHUEmployee.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmKHUEmployee.FormCreate(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  nIndex : integer;
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  CheckCount := 0;

  FormNameSet;

  LoadsCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadsJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadsDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadsPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadsJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadsPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end else
  begin
    if cmb_Company.ItemIndex > -1 then LoadsJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  end;
  if cmb_Jijum.ItemIndex > -1 then LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmKHUEmployee.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;

end;

procedure TfmKHUEmployee.FormNameSet;
begin
  with sg_Employ do
  begin
    Cells[0,0] := FM101;
    Cells[1,0] := FM102;
    Cells[2,0] := '카드번호';
  end;
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
  lb_sabun.Caption := FM101;
end;

procedure TfmKHUEmployee.cmb_CompanyChange(Sender: TObject);
begin
  LoadsJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadsPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmKHUEmployee.cmb_JijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
end;

function TfmKHUEmployee.getEmpRelayInfo(aEmpCode: string; var aName,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from VW_CARD_TELECOP ';
  stSql := stSql + ' Where IDNUM = ''' + aEmpCode + ''' ';
  stSql := stSql + ' order by ISSUNO DESC ';

  with ADORelaySearch do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aName := FindField('NAMEKOR').AsString;
    aCardNo := copy(Trim(FindField('CAMPUSID').AsString),1,1) +
                FillCharString(Trim(FindField('CARDID').AsString),'N',12) +
                FillCharString(inttostr(strtoint(FindField('ISSUNO').AsString)),'N',2,True) +
                'N';
  end;
  result := True;
end;

procedure TfmKHUEmployee.btn_OracleSearchClick(Sender: TObject);
var
  stName : string;
  stCardNo : string;
begin
  stName := '';
  stCardNo := '';
  if Not getEmpRelayInfo(Trim(ed_EmpNo.Text),stName,stCardNo) then
  begin
    showmessage('조회 데이터가 없습니다.');
    Exit;
  end;
  if sg_Employ.RowCount = 2 then
  begin
    if sg_Employ.Cells[0,1] <> '' then sg_Employ.AddRow;
  end else sg_Employ.AddRow;
  sg_Employ.Cells[0,sg_Employ.RowCount - 1] := Trim(ed_EmpNo.Text);
  sg_Employ.Cells[1,sg_Employ.RowCount - 1] := stName;
  sg_Employ.Cells[2,sg_Employ.RowCount - 1] := stCardNo;
  sg_Employ.AddCheckBox(0,sg_Employ.RowCount - 1,False,False);

end;

procedure TfmKHUEmployee.sg_EmployCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmKHUEmployee.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmKHUEmployee.btn_WorkBranchClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosicode : string;
  stEmCode : string;
  stEmName : string;
  stCardNo : string;
  i : integer;
  bchkState : Boolean;
  nFdmsNo : integer;
  nPositionNum : integer;
  stSql : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('가져올 데이터를 선택 하세요.');
    Exit;
  end;
  if cmb_Company.ItemIndex < 1 then
  begin
    showmessage('분류할 ' + FM001 + '를 선택 하세요.');
    Exit;
  end;
  if cmb_Jijum.ItemIndex < 1 then
  begin
    showmessage('분류할 ' + FM011 + '를 선택 하세요.');
    Exit;
  end;
  if cmb_Depart.ItemIndex < 1 then
  begin
    showmessage('분류할 ' + FM021 + '를 선택 하세요.');
    Exit;
  end;
  stCompanyCode := CompanyCodeList.Strings[cmb_Company.itemindex];
  stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.itemindex],4,3);
  stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  stPosicode := '000';
  if cmb_Posi.ItemIndex > 0 then stPosicode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3);

  nFdmsNo := GetFdmsID;
  nPositionNum := GetMaxPositionNum ;
  with sg_Employ do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);
      if bchkState then
      begin
        stEmCode := Trim(Cells[0,i]);
        stEmName := Trim(Cells[1,i]);
        stCardNo := Trim(Cells[2,i]);
        if Not CheckTB_EMPLOYEE(stCompanyCode,stEmCode) then
        begin
          InsertIntoTB_EMPLOYEE(stCompanyCode,stEmCode,stEmName,
                                stJijumCode,stDepartCode,stPosicode,inttostr(nFdmsNo));
          stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode, stEmCode,inttostr(nFdmsNo),
                      '1',stCardNo,'1',stEmName,'',cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);
          DataModule1.ProcessExecSQL(stSql);
          stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmcode,stCardNo,'KHUEmployee','1');
          DataModule1.ProcessExecSQL(stSql);
          inc(nFdmsNo); //지문번호 증가
        end else
        begin
          UpdateTB_EMPLOYEE(stCompanyCode,stEmCode,stEmName,
                                stJijumCode,stDepartCode,stPosicode);
          stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode, stEmCode,GetEmployeeFdmsID(stCompanyCode,stEmCode),
                      '2',stCardNo,'1',stEmName,'',cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);
          DataModule1.ProcessExecSQL(stSql);
          stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmcode,stCardNo,'KHUEmployee','2');
          DataModule1.ProcessExecSQL(stSql);
        end;
        
        if Trim(stCardNo) <> '' then
        begin
          if CheckTB_CARDEMPNO(stCompanyCode,stEmCode,stCardNo) then  //카드 테이블에 현재 카드가 아닌 카드 존재시
          begin
            // 있는 것이므로 업데이트 할 필요가 없음
          end else
          begin
            //없으면
            if Not CheckTB_CARD(stCardNo)then
            begin
              InsertIntoTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode,inttostr(nPositionNum));
              inc(nPositionNum);
            end else
            begin
              updateTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
            end;
          end;
        end;
        //InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsNo),'1','N',stCardNo,'1','N');
      end;
    end;
  end;

end;

function TfmKHUEmployee.CheckTB_EMPLOYEE(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode + ''' ';

  with DataModule1.ADOTmpQuery do
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

function TfmKHUEmployee.GetFdmsID: integer;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TADOQuery;
begin
  result := 31;
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      result := nFdms_id + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKHUEmployee.CheckTB_CARDEMPNO(aCompanyCode, aEmCode,
  aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      while Not Eof do
      begin
        if FindField('CA_CARDNO').AsString = aCardNo then result := True
        else
        begin
          //해당 사번에 다른 카드 존재시 다른 카드 삭제 및 권한 삭제
          DeleteTB_CARD(FindField('CA_CARDNO').AsString);
          UpdateTB_DEVICECARDNOGRADEDEL(FindField('CA_CARDNO').AsString);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKHUEmployee.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKHUEmployee.UpdateTB_DEVICECARDNOGRADEDEL(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO ';
  stSql := stSql + ' set de_permit = ''N'', ';
  stSql := stSql + ' de_rcvack = ''N'' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKHUEmployee.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKHUEmployee.InsertIntoTB_EMPLOYEE(aCompanyCode, aEmCode,
  aEmName,  aJijumCode, aDepartCode, aPosicode,
  aFdmsNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'em_joindate,';
  stSql := stsql + 'em_retiredate,';
  stSql := stSql + 'em_updatetime,';
  stSql := stSql + 'em_updateoperator,';
  stSql := stSql + 'fdms_id,';
  stSql := stsql + 'rg_code) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosicode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmdd',now) + ''',';
  stSql := stSql + '''99991231'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '' + aFdmsNo + ',';
  stSql := stSql + '''001'' ) ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKHUEmployee.UpdateTB_EMPLOYEE(aCompanyCode, aEmCode, aEmName,
  aJijumCode, aDepartCode, aPosicode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  if aPosicode <> '000' then
  stSql := stSql + 'PO_POSICODE = ''' + aPosicode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmName + ''',';
  stSql := stSql + 'em_updatetime = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + 'em_updateoperator = ''' + Master_ID + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKHUEmployee.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stsql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKHUEmployee.InsertIntoTB_CARD(aCardNo, aGubun, aRegType,
  aEmCode, aCompanyCode, aPositionNum: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARD(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'ca_cardno,';
  stSql := stSql + 'ca_gubun,';
  stSql := stSql + 'ca_cardtype,';
  stSql := stSql + 'em_code,';
  stSql := stSql + 'co_companycode,';
  stSql := stSql + 'ca_updatetime,';
  stSql := stSql + 'ca_updateoperator,';
  stSql := stSql + 'positionnum) ';
  stSql := stSql + 'values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aRegType + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '' + aPositionNum + ') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKHUEmployee.updateTB_CARD(aCardNo, aGubun, aRegType, aEmCode,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'ca_gubun = ''' + aGubun + ''',';
  stSql := stSql + 'ca_cardtype = ''' + aRegType + ''',';
  stSql := stSql + 'em_code = ''' + aEmCode + ''',';
  stSql := stSql + 'co_companycode = ''' + aCompanyCode + ''',';
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + 'ca_updatetime = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + 'ca_updateoperator = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ca_cardno = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;


procedure TfmKHUEmployee.btn_CardSearchClick(Sender: TObject);
var
  stName : string;
  stEmCode : string;
begin
{  stName := '';
  stEmCode := '';
  if Not getCardRelayInfo(Trim(ed_CardNo.Text),stName,stEmCode) then
  begin
    showmessage('조회 데이터가 없습니다.');
    Exit;
  end;
  if sg_Employ.RowCount = 2 then
  begin
    if sg_Employ.Cells[0,1] <> '' then sg_Employ.AddRow;
  end else sg_Employ.AddRow;
  sg_Employ.Cells[0,sg_Employ.RowCount - 1] := stEmCode;
  sg_Employ.Cells[1,sg_Employ.RowCount - 1] := stName;
  sg_Employ.Cells[2,sg_Employ.RowCount - 1] := Trim(ed_CardNo.Text);
  sg_Employ.AddCheckBox(0,sg_Employ.RowCount - 1,False,False);
}
end;
{
function TfmKHUEmployee.getCardRelayInfo(aCardNo: string; var aName,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TBL_CARD ';
  stSql := stSql + ' Where CARD_DATA = ''' + aCardNo + ''' ';
  stSql := stSql + ' order by CARD_ORDER DESC ';

  with ADORelaySearch do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aName := FindField('CARD_NAME').AsString;
    aEmCode := FindField('CARD_ID').AsString;
  end;
  result := True;
end;  }

function TfmKHUEmployee.GetEmployeeFdmsID(aCompanyCode,
  aEmpID: string): string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery :TADOQuery;
begin
  result := '0';
  stSql := 'select fdms_id from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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

end.
