unit uCardAccessTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, uSubForm, CommandArray,ADODB,ActiveX,iniFiles,ComObj, AdvObj;

type
  TfmCardAccessTime = class(TfmASubForm)
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
    sg_Employ: TAdvStringGrid;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    Label4: TLabel;
    cmb_SearchType: TComboBox;
    lb_search: TLabel;
    ed_searchText: TEdit;
    Panel2: TPanel;
    btn_Search: TBitBtn;
    btn_Close: TBitBtn;
    gb_TimeCode: TGroupBox;
    pan_TimeCode: TPanel;
    Panel7: TPanel;
    chk_TimeSun: TCheckBox;
    chk_TimeMon: TCheckBox;
    chk_TimeTue: TCheckBox;
    chk_TimeWed: TCheckBox;
    chk_TimeThu: TCheckBox;
    chk_TimeFri: TCheckBox;
    chk_TimeSat: TCheckBox;
    Panel8: TPanel;
    chk_Time1: TCheckBox;
    chk_Time2: TCheckBox;
    chk_Time3: TCheckBox;
    chk_Time4: TCheckBox;
    Panel6: TPanel;
    rg_TimeCodeNotUse: TRadioButton;
    rg_TimeGroup1: TRadioButton;
    rg_TimeGroup2: TRadioButton;
    Panel3: TPanel;
    btn_ChangeValidDate: TSpeedButton;
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
    procedure FormActivate(Sender: TObject);
    procedure rg_TimeCodeNotUseClick(Sender: TObject);
    procedure rg_TimeGroup1Click(Sender: TObject);
    procedure rg_TimeGroup2Click(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure ed_searchTextChange(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    L_nCheckCount : integer;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure ShowCardList;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure ChangeValidateAll(aValidDate:string);
    procedure ChangeEmployeeValidate(aCompanyCode,aEmCode,aValidDate:string);
    procedure CardGradeDownLoad(aCardNo:string);
    procedure CheckTimeGroupView(aTimeGroup:string);
    Function UpdateTB_EMPLOYEE_TimeCodeUse(aCompanyCode,aEmCode,aTimeCodeUse:string):Boolean;
    Function UpdateTB_EMPLOYEE_TimeCodeValue(aCompanyCode,aEmCode,aTimeCodeUse,aTimeGroup,
                             aTime1,aTime2,aTime3,aTime4,aTimeWeek:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeRcvAck(aCompanyCode,aEmCode,aRcvAck:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmCardAccessTime: TfmCardAccessTime;

implementation
uses
  uCompanyCodeLoad,
  uDataModule1,
  uLomosUtil,
  uCommonSql,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uFireBird, uValidateSelect;

{$R *.dfm}
procedure TfmCardAccessTime.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  L_nCheckCount := 0;

end;

procedure TfmCardAccessTime.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
  EmpTypeCodeList.Free;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardAccessTime';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;

procedure TfmCardAccessTime.btn_CloseClick(Sender: TObject);
begin
  close;

end;

procedure TfmCardAccessTime.FormShow(Sender: TObject);
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

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardAccessTime';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmCardAccessTime.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  ShowCardList;
end;

procedure TfmCardAccessTime.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  ShowCardList;
end;

procedure TfmCardAccessTime.cmb_SearchTypeChange(Sender: TObject);
begin
  lb_search.Caption := cmb_SearchType.Text;
end;

procedure TfmCardAccessTime.btn_SearchClick(Sender: TObject);
begin
  ShowCardList;
end;

procedure TfmCardAccessTime.ShowCardList;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  stWeekCode : string;
begin
  GridInit(sg_Employ,19,2,True); //스트링그리드 초기화

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBType = 'FB' then stSql := FireBird.SelectTB_EMPLOYEEJoinBase
  else Exit;

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
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
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
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;
  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';

  if cmb_SearchType.ItemIndex = 1 then //사번
    stSql := stSql + ' AND a.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 0 then //이름
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';

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
          cells[0,nRow] := FindField('COMPANYNAME').AsString;
          cells[1,nRow] := FindField('JIJUMNAME').AsString;
          cells[2,nRow] := FindField('DEPARTNAME').AsString;
          cells[3,nRow] := FindField('PO_NAME').AsString;
          cells[4,nRow] := FindField('EM_CODE').AsString;
          cells[5,nRow] := FindField('EM_NAME').AsString;
          cells[6,nRow] := FindField('DE_TIMECODEUSE').AsString;
          cells[7,nRow] := FindField('TC_GROUP').AsString;
          cells[8,nRow] := FindField('TC_TIME1').AsString;
          cells[9,nRow] := FindField('TC_TIME2').AsString;
          cells[10,nRow] := FindField('TC_TIME3').AsString;
          cells[11,nRow] := FindField('TC_TIME4').AsString;
          stWeekCode := FindField('TC_WEEKCODE').AsString;
          if stWeekCode <> '' then
          begin
            if stWeekCode[7] = '1' then cells[12,nRow] := 'Y'
            else cells[12,nRow] := '';
            if stWeekCode[6] = '1' then cells[13,nRow] := 'Y'
            else cells[13,nRow] := '';
            if stWeekCode[5] = '1' then cells[14,nRow] := 'Y'
            else cells[14,nRow] := '';
            if stWeekCode[4] = '1' then cells[15,nRow] := 'Y'
            else cells[15,nRow] := '';
            if stWeekCode[3] = '1' then cells[16,nRow] := 'Y'
            else cells[16,nRow] := '';
            if stWeekCode[2] = '1' then cells[17,nRow] := 'Y'
            else cells[17,nRow] := '';
            if stWeekCode[1] = '1' then cells[18,nRow] := 'Y'
            else cells[18,nRow] := '';
          end;
          cells[19,nRow] := FindField('CO_COMPANYCODE').AsString;
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

procedure TfmCardAccessTime.sg_EmployCheckBoxClick(Sender: TObject; ACol,
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

procedure TfmCardAccessTime.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmCardAccessTime.btn_ChangeValidDateClick(Sender: TObject);
var
  i : integer;
  bChecked : Boolean;
  stCompanyCode : string;
  stEmCode : string;
  stTimeCodeUse : string;
  stTimeGroup : string;
  stTime1 : string;
  stTime2 : string;
  stTime3 : string;
  stTime4 : string;
  stTimeWeek : string;
begin
  if L_nCheckCount < 1 then
  begin
    showmessage('작업 할 사원이 선택 되지 않았습니다.');
    Exit;
  end;

  stTimeCodeUse := 'Y';
  if rg_TimeCodeNotUse.Checked then stTimeCodeUse := 'N';
  stTimeGroup := '0';
  if rg_TimeGroup2.Checked then stTimeGroup := '1';
  if chk_Time1.Checked then stTime1 := 'Y'
  else stTime1 := 'N';
  if chk_Time2.Checked then stTime2 := 'Y'
  else stTime2 := 'N';
  if chk_Time3.Checked then stTime3 := 'Y'
  else stTime3 := 'N';
  if chk_Time4.Checked then stTime4 := 'Y'
  else stTime4 := 'N';
  stTimeWeek := '1111111';
  if Not chk_TimeSun.Checked then stTimeWeek[7] := '0';
  if Not chk_TimeMon.Checked then stTimeWeek[6] := '0';
  if Not chk_TimeTue.Checked then stTimeWeek[5] := '0';
  if Not chk_TimeWed.Checked then stTimeWeek[4] := '0';
  if Not chk_TimeThu.Checked then stTimeWeek[3] := '0';
  if Not chk_TimeFri.Checked then stTimeWeek[2] := '0';
  if Not chk_TimeSat.Checked then stTimeWeek[1] := '0';


  Try
    btn_Search.Enabled := False;
    btn_ChangeValidDate.Enabled := False;
    sg_Employ.Enabled := False;
    pan_gauge.Visible := True;
    Label2.Caption := '출입시간 변경 중입니다.';
    Gauge1.Progress := 0;
    Gauge1.MaxValue := L_nCheckCount;
    with sg_Employ do
    begin
      for i := 1 to RowCount - 1 do
      begin
        GetCheckBoxState(0,i, bChecked);
        if bChecked then
        begin
          stCompanyCode := cells[19,i];
          stEmCode := cells[4,i];
          if rg_TimeCodeNotUse.Checked then
          begin
            UpdateTB_EMPLOYEE_TimeCodeUse(stCompanyCode,stEmCode,stTimeCodeUse);
          end else
          begin
            UpdateTB_EMPLOYEE_TimeCodeValue(stCompanyCode,stEmCode,stTimeCodeUse,stTimeGroup,
                             stTime1,stTime2,stTime3,stTime4,stTimeWeek);
          end;
          UpdateTB_DEVICECARDNO_EmCodeRcvAck(stCompanyCode,stEmCode,'N'); //재전송
          Gauge1.Progress := Gauge1.Progress + 1;
        end;
      end;
    end;
  Finally
    btn_Search.Enabled := True;
    btn_ChangeValidDate.Enabled := True;
    sg_Employ.Enabled := True;
    pan_gauge.Visible := False;
  End;
  ShowCardList;
end;

procedure TfmCardAccessTime.ChangeValidateAll(aValidDate: string);
var
  i : integer;
  bChecked : Boolean;
begin
  Try
    btn_Search.Enabled := False;
    btn_ChangeValidDate.Enabled := False;
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
          ChangeEmployeeValidate(cells[9,i],cells[7,i],aValidDate);
          CardGradeDownLoad(cells[0,i]);
        end;
      end;
    end;
  Finally
    btn_Search.Enabled := True;
    btn_ChangeValidDate.Enabled := True;
    sg_Employ.Enabled := True;
  End;
end;

procedure TfmCardAccessTime.ChangeEmployeeValidate(aCompanyCode, aEmCode,
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

procedure TfmCardAccessTime.CardGradeDownLoad(aCardNo: string);
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCardAccessTime.FormActivate(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
  ShowCardList;
  rg_TimeCodeNotUse.Checked := True;
end;

procedure TfmCardAccessTime.rg_TimeCodeNotUseClick(Sender: TObject);
begin
  inherited;
  pan_TimeCode.Visible := False;

end;

procedure TfmCardAccessTime.rg_TimeGroup1Click(Sender: TObject);
begin
  inherited;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('0');

end;

procedure TfmCardAccessTime.rg_TimeGroup2Click(Sender: TObject);
begin
  inherited;
  pan_TimeCode.Visible := True;
  CheckTimeGroupView('1');

end;

procedure TfmCardAccessTime.CheckTimeGroupView(aTimeGroup: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'Select * from TB_TIMECODE ';
  stSql := stSql + ' Where TC_GROUP = ''' + aTimeGroup + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

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
      if recordcount < 1 then Exit;
      chk_Time1.Caption := copy(FindField('TC_TIME1').AsString,1,2) + ':' + copy(FindField('TC_TIME1').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME1').AsString,5,2) + ':' + copy(FindField('TC_TIME1').AsString,7,2);
      chk_Time2.Caption := copy(FindField('TC_TIME2').AsString,1,2) + ':' + copy(FindField('TC_TIME2').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME2').AsString,5,2) + ':' + copy(FindField('TC_TIME2').AsString,7,2);
      chk_Time3.Caption := copy(FindField('TC_TIME3').AsString,1,2) + ':' + copy(FindField('TC_TIME3').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME3').AsString,5,2) + ':' + copy(FindField('TC_TIME3').AsString,7,2);
      chk_Time4.Caption := copy(FindField('TC_TIME4').AsString,1,2) + ':' + copy(FindField('TC_TIME4').AsString,3,2) + '-' +
                           copy(FindField('TC_TIME4').AsString,5,2) + ':' + copy(FindField('TC_TIME4').AsString,7,2);

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmCardAccessTime.UpdateTB_EMPLOYEE_TimeCodeUse(aCompanyCode,
  aEmCode, aTimeCodeUse: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'DE_TIMECODEUSE = ''' + aTimeCodeUse + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCardAccessTime.UpdateTB_EMPLOYEE_TimeCodeValue(aCompanyCode,
  aEmCode, aTimeCodeUse, aTimeGroup, aTime1, aTime2, aTime3, aTime4,
  aTimeWeek: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE Set ';
  stSql := stSql + 'DE_TIMECODEUSE = ''' + aTimeCodeUse + ''',';
  stSql := stSql + 'TC_GROUP = ''' + aTimeGroup + ''',';
  stSql := stSql + 'TC_TIME1 = ''' + aTime1 + ''',';
  stSql := stSql + 'TC_TIME2 = ''' + aTime2 + ''',';
  stSql := stSql + 'TC_TIME3 = ''' + aTime3 + ''',';
  stSql := stSql + 'TC_TIME4 = ''' + aTime4 + ''',';
  stSql := stSql + 'TC_WEEKCODE= ''' + aTimeWeek + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCardAccessTime.UpdateTB_DEVICECARDNO_EmCodeRcvAck(aCompanyCode,
  aEmCode, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO IN ( ';
  stSql := stSql + ' Select CA_CARDNO from TB_CARD ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCardAccessTime.cmb_DepartChange(Sender: TObject);
begin
  inherited;
  ShowCardList;

end;

procedure TfmCardAccessTime.cmb_PosiChange(Sender: TObject);
begin
  inherited;
  ShowCardList;

end;

procedure TfmCardAccessTime.ed_searchTextChange(Sender: TObject);
begin
  inherited;
//  ShowCardList;

end;

procedure TfmCardAccessTime.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmCardAccessTime);
Finalization
  UnRegisterClass(TfmCardAccessTime);

end.
