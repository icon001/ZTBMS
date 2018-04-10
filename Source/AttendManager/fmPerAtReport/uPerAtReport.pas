unit uPerAtReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm,
  CommandArray, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, ExtCtrls;

type
  TfmPerAtReport = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ADOQuery: TADOQuery;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_FileSave: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    cmb_AtOuttype: TComboBox;
    cmb_AtIntype: TComboBox;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_PrintClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    ATINCodeList : TStringList;
    ATINTypeList : TStringList;
    ATOutCodeList : TStringList;
    ATOutTypeList : TStringList;
    { Private declarations }
    Function SearchATEvent(aCode:string) : Boolean;
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
  public
    { Public declarations }
  end;

var
  fmPerAtReport: TfmPerAtReport;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad;

{$R *.dfm}



procedure TfmPerAtReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPerAtReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  GridInit(sg_report as TStringGrid,11);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  Load_ATInCode(cmb_AtIntype,True);
  Load_ATOutCode(cmb_AtOuttype,True);

  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  btn_SearchClick(btn_Search);
end;





procedure TfmPerAtReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
  PosiCodeList := TStringList.Create;
  
  ATINCodeList := TstringList.Create;
  ATINTypeList := TstringList.Create;
  ATOutCodeList := TstringList.Create;
  ATOutTypeList := TstringList.Create;
end;

procedure TfmPerAtReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;

  ATINCodeList.Free;
  ATINTypeList.Free;
  ATOutCodeList.Free;
  ATOutTypeList.Free;

  Action := caFree;

end;

procedure TfmPerAtReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmPerAtReport.btn_SearchClick(Sender: TObject);
begin
  SearchATEvent('');
end;

procedure TfmPerAtReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='개인별 근태 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmPerAtReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_endDate.Date);

end;

procedure TfmPerAtReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('조회 후 출력하세요.');
    Exit;
  end;
  frReport1.ShowReport;

end;

procedure TfmPerAtReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  //if IsInsertGrade or IsUpdateGrade  then sg_report.Enabled := True
  //else sg_report.Enabled := False;
end;

function TfmPerAtReport.SearchATEvent(aCode: string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
  stTemp : string;
begin
  result := False;

  GridInitialize(sg_Report);

  stSql := 'Select f.AT_DATE,c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' f.AT_INCODE,g.AT_INNAME as JIKAK,f.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''N'' then ''지각'' ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as JIKAK1, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''N'' then ''조퇴'' ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as Jotae1, ';
  stSql := stSql + ' f.AT_CONTENT,b.CA_CARDNO ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (a.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_ATEVENT f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND f.AT_DATE between ''' + FormatDateTime('yyyymmdd',dt_startDate.Date) + '''  ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_endDate.Date) + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_INCODE = g.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_OUTCODE = h.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 회사 권한이 없습니다.');
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
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
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
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
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
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  if cmb_AtIntype.ItemIndex > 0 then //출근 타입 선택시
  begin
    if ATINCodeList.Strings[cmb_AtIntype.ItemIndex] = '003' then //결근 선택시
    begin
      stSql := stSql + ' AND ( f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
      stSql := stSql + ' OR f.AT_INCODE IS NULL ) ';
    end else stSql := stSql + ' AND f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
  end;
  if cmb_AtOuttype.ItemIndex > 0 then //퇴근 타입 선택시
  begin
    stSql := stSql + ' AND f.AT_OUTCODE = ''' + ATOUTCodeList.Strings[cmb_AtOuttype.ItemIndex]  + ''' ';
  end;

  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  //memo1.Lines.Text := stSql;
  with DataModule1.ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    First;
    sg_report.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      stInTime := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,11,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,13,2) ;
      stOutTime := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,11,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,13,2) ;

      with sg_report do
      begin
        Cells[0,nRow] := FindField('AT_DATE').AsString;
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('PO_NAME').AsString;
        Cells[5,nRow] := FindField('EM_CODE').AsString;
        Cells[6,nRow] := FindField('EM_NAME').AsString;
        Cells[7,nRow] := stInTime;
        Cells[8,nRow] := stOutTime;
        Cells[9,nRow] := FindField('JIKAK').AsString;
        Cells[10,nRow] := FindField('Jotae').AsString;
        Cells[11,nRow] := FindField('AT_CONTENT').AsString;
        Cells[12,nRow] := FindField('CA_CARDNO').AsString;
        Cells[13,nRow] := FindField('AT_INCODE').AsString;
        Cells[14,nRow] := FindField('AT_OUTCODE').AsString;
        Cells[15,nRow] := FindField('CO_COMPANYCODE').AsString;
        if FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString = aCode then
        begin
          SelectRows(nRow,1);
        end;

      end;
      nRow := nRow + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
  result := True;

end;

procedure TfmPerAtReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmPerAtReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerAtReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerAtReport.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerAtReport.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerAtReport.Load_ATInCode(cmb_Box: TComboBox;
  bAllShow: Boolean = False);
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Box.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATINCodeList.Add('');
  ATINTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATINCodeList.Add(FindField('AT_INCODE').AsString);
      ATINTypeList.Add(FindField('AT_INTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmPerAtReport.Load_ATOutCode(cmb_Box: TComboBox;
  bAllShow: Boolean = False);
var
  stSql : string;
begin
  ATOutCodeList.Clear;
  ATOutTypeList.Clear;
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATOutCodeList.Add('');
  ATOutTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATOUTCodeList.Add(FindField('AT_OUTCODE').AsString);
      ATOUTTypeList.Add(FindField('AT_OUTTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

initialization
  RegisterClass(TfmPerATReport);
Finalization
  UnRegisterClass(TfmPerATReport);

end.
 