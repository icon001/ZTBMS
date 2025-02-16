unit uKHUEmpInitialize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, BaseGrid, AdvGrid, Buttons, uSubForm,
  CommandArray, DB, ADODB,ActiveX, Gauges, AdvObj;

type
  TfmKHUEmpInitialize = class(TfmASubForm)
    GroupBox1: TGroupBox;
    sg_Employ: TAdvStringGrid;
    OpenDialog1: TOpenDialog;
    GroupBox2: TGroupBox;
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
    cmb_JojikNm: TComboBox;
    btn_Search: TButton;
    Gauge1: TGauge;
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure sg_EmployCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_WorkBranchClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_JojikNmChange(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    CheckCount : integer;
    { Private declarations }
    procedure FormNameSet;
//    function getEmpRelayInfo(aEmpCode:string;var aName,aCardNo:string):Boolean;
//    Function getCardRelayInfo(aCardNo:string;var aName,aEmCode:string):Boolean;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(aCompanyCode,aEmCode,aEmName,
                                aJijumCode,aDepartCode,aPosicode,aFdmsNo,aCardNo:string):Boolean;
    Function UpdateTB_EMPLOYEE(aCompanyCode,aEmCode,aEmName,
                                aJijumCode,aDepartCode,aPosicode,aFdmsNo,aCardNo:string):Boolean;

    Function GetMaxPositionNum : integer;

    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertIntoTB_CARD(aCardNo,aGubun,aRegType,aEmCode,aCompanyCode,aPositionNum:string):Boolean;
    Function updateTB_CARD(aCardNo,aGubun,aRegType,aEmCode,aCompanyCode:string):Boolean;
    
    Function CheckTB_CARDEMPNO(aCompanyCode,aEmCode,aCardNo:string):Boolean;
    Function DeleteTB_CARD(aCardNo : string):Boolean;
    Function UpdateTB_DEVICECARDNOGRADEDEL(aCardNo:string):Boolean;
  private
    Function GetKHUJojik:Boolean;
    Function GetCardNo(aIDno:string):string;
  public
    { Public declarations }
  end;

var
  fmKHUEmpInitialize: TfmKHUEmpInitialize;

implementation

uses
  udmAdoRelay,
  uDataModule1,
  uCompanyCodeLoad,
  uLomosUtil,
  uCommonSql
  , UCommonModule;

{$R *.dfm}

procedure TfmKHUEmpInitialize.FormShow(Sender: TObject);
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

  if Not dmAdoRelay.ADOConnection2.Connected then
  begin
    if Not dmAdoRelay.AdoRelayConnected2(inttostr(G_nRelayDataBaseType2), G_stRelayServerIP2, G_stRelayServerPort2,
                      G_stRelayUserID2, G_stRelayUserPW2, G_stRelayDataBaseName2) then
    begin
      showmessage('오라클 연동에 실패하였습니다.');
      Exit;
    end;
  end;

  GetKHUJojik;
end;

procedure TfmKHUEmpInitialize.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmKHUEmpInitialize.FormCreate(Sender: TObject);
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

procedure TfmKHUEmpInitialize.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;

end;

procedure TfmKHUEmpInitialize.FormNameSet;
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
end;

procedure TfmKHUEmpInitialize.cmb_CompanyChange(Sender: TObject);
begin
  LoadsJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadsPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

//  btn_SearchClick(self);
end;

procedure TfmKHUEmpInitialize.cmb_JijumChange(Sender: TObject);
begin
  LoadsDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
end;

{
function TfmKHUEmpInitialize.getEmpRelayInfo(aEmpCode: string; var aName,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TBL_CARD ';
  stSql := stSql + ' Where CARD_ID = ''' + aEmpCode + ''' ';
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
    aCardNo := FindField('CARD_DATA').AsString;
  end;
  result := True;
end;    }

procedure TfmKHUEmpInitialize.sg_EmployCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmKHUEmpInitialize.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmKHUEmpInitialize.btn_WorkBranchClick(Sender: TObject);
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

  nFdmsNo := strtoint(CommonModule.GetNextFdmsID);
  nPositionNum := GetMaxPositionNum ;

  Gauge1.MaxValue := CheckCount;
  Gauge1.Progress := 0;
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
                                stJijumCode,stDepartCode,stPosicode,inttostr(nFdmsNo),stCardNo);
          inc(nFdmsNo); //지문번호 증가
        end else
        begin
          UpdateTB_EMPLOYEE(stCompanyCode,stEmCode,stEmName,
                                stJijumCode,stDepartCode,stPosicode,inttostr(nFdmsNo),stCardNo);
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
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
      end;
    end;
  end;
  //showmessage('완료');
  //Gauge1.Progress := 0;
end;

function TfmKHUEmpInitialize.CheckTB_EMPLOYEE(aCompanyCode,
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



function TfmKHUEmpInitialize.CheckTB_CARDEMPNO(aCompanyCode, aEmCode,
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

function TfmKHUEmpInitialize.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKHUEmpInitialize.UpdateTB_DEVICECARDNOGRADEDEL(
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

function TfmKHUEmpInitialize.GetMaxPositionNum: integer;
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

function TfmKHUEmpInitialize.InsertIntoTB_EMPLOYEE(aCompanyCode, aEmCode,
  aEmName,  aJijumCode, aDepartCode, aPosicode,
  aFdmsNo,aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  if aPosicode <> '000' then
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
  if aPosicode <> '000' then
  stSql := stSql + '''' + aPosicode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmdd',now) + ''',';
  stSql := stSql + '''99991231'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '' + aFdmsNo + ',';
  stSql := stSql + '''001'' ) ';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode,aFdmsNo,
              '1',aCardNo,'1',aEmName,'',cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,aCardNo,'KHUEmpInitialize','1');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmKHUEmpInitialize.UpdateTB_EMPLOYEE(aCompanyCode, aEmCode, aEmName,
  aJijumCode, aDepartCode, aPosicode,aFdmsNo,aCardNo: string): Boolean;
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

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode,aFdmsNo,
              '2',aCardNo,'1',aEmName,'',cmb_Company.Text,cmb_Jijum.Text,cmb_Depart.Text,cmb_Posi.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,aCardNo,'KHUEmpInitialize','2');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmKHUEmpInitialize.CheckTB_CARD(aCardNo: string): Boolean;
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

function TfmKHUEmpInitialize.InsertIntoTB_CARD(aCardNo, aGubun, aRegType,
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

function TfmKHUEmpInitialize.updateTB_CARD(aCardNo, aGubun, aRegType, aEmCode,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set';
  stSql := stSql + 'ca_gubun = ''' + aGubun + ''',';
  stSql := stSql + 'ca_cardtype = ''' + aRegType + ''',';
  stSql := stSql + 'em_code = ''' + aEmCode + ''',';
  stSql := stSql + 'co_companycode = ''' + aCompanyCode + ''',';
  stSql := stSql + ' CA_MEMLOAD = ''N'',';
  stSql := stSql + 'ca_updatetime = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + 'ca_updateoperator ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ca_cardno = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

{
function TfmKHUEmpInitialize.getCardRelayInfo(aCardNo: string; var aName,
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

function TfmKHUEmpInitialize.GetKHUJojik: Boolean;
var
  stSql : string;
begin
  cmb_JojikNm.Clear;
  stSql := ' select jojik_nm from trn_members_for_telecop ';
  stSql := stSql + ' where CAMP_ID = ''2'' ';
  stSql := stSql + ' AND ( ing_stat = ''0'' OR ing_stat = ''1'' ) ';
  stSql := stSql + ' Group by jojik_nm ';
  stSql := stSql + ' Order by jojik_nm ';

  with dmAdoRelay.ADOQuery2 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      cmb_JojikNm.Items.Add(FindField('JOJIK_NM').AsString);
      Next;
    end;
  end;
end;

procedure TfmKHUEmpInitialize.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  RowGridInitialize(sg_Employ,2,True);
  CheckCount := 0;
  Gauge1.Progress := 0;

  if cmb_JojikNm.ItemIndex < 0 then
  begin
    showmessage('조직명을 선택하세요.');
    Exit;
  end;

  stSql := 'Select * from TRN_MEMBERS_FOR_TELECOP ';
  stSql := stSql + ' Where JOJIK_NM Like ''' + cmb_JojikNm.Text + '%'' ';
  stSql := stSql + ' AND ( ing_stat = ''0'' OR ing_stat = ''1'' ) ';

  with dmAdoRelay.ADOQuery2 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('조회실패');
      Exit;
    End;
    if recordCount < 1 then
    begin
      showmessage('데이타가 없습니다.');
      Exit;
    end;

    with sg_Employ do
    begin
      nRow := 1;
      RowCount := recordCount + 1;

      While Not Eof do
      begin
        AddCheckBox(0,nRow,False,False);
        Cells[0,nRow] := FindField('ID_NUM').AsString;
        Cells[1,nRow] := FindField('NAME_KOR').AsString;
        Cells[2,nRow] := GetCardNo(FindField('ID_NUM').AsString);
        inc(nRow);
        Next;
      end;
    end;

  end;
end;

function TfmKHUEmpInitialize.GetCardNo(aIDno: string): string;
var
  stSql : string;
  stCardNo : string;
begin
  result := '';
  stSql := 'select * from VW_CARD_TELECOP ';
  stSql := stSql + ' where IDNUM = ''' + aIDNo + ''' ';
  stSql := stSql + ' AND CARDFLAG <> ''2'' ';
  stSql := stSql + ' Order by ISSUNO DESC ';

  with dmAdoRelay.ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := copy(Trim(FindField('CAMPUSID').AsString),1,1) +
                FillCharString(Trim(FindField('CARDID').AsString),'N',12) +
                FillCharString(inttostr(strtoint(FindField('ISSUNO').AsString)),'N',2,True) +
                'N';
  end;
end;

procedure TfmKHUEmpInitialize.cmb_JojikNmChange(Sender: TObject);
begin
  btn_SearchClick(self);

end;

end.
