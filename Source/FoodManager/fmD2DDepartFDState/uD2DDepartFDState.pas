unit uD2DDepartFDState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, Grids, BaseGrid,
  AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm, CommandArray, ExtCtrls,
  Gauges,iniFiles,ComObj, AdvObj;

type
  TfmD2DDepartFDState = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ADOQuery: TADOQuery;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    Label12: TLabel;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    Label2: TLabel;
    cmb_FoodArea: TComboBox;
    Label22: TLabel;
    cmb_FoodPERMIT: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
    procedure cmb_FoodAreaChange(Sender: TObject);
    procedure cmb_FoodPERMITChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    FoodAreaList : TStringList;
    { Private declarations }
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmD2DDepartFDState: TfmD2DDepartFDState;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMDBSql,
  uPostGreSql,
  uMssql, uExcelSave;

{$R *.dfm}

procedure TfmD2DDepartFDState.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmD2DDepartFDState.btn_PrintClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  stTitle : string;
begin
  btn_Print.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle ;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('부서별식수통계','참조파일','D2DDepartFDState.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('부서별식수통계','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);
  
  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;
end;

procedure TfmD2DDepartFDState.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='개인별 식수 통계';
  SaveDialog1.DefaultExt:= 'XLS';
  SaveDialog1.Filter := 'XLS files (*.XLS)|*.XLS';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmD2DDepartFDState.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
  stFoodArea : string;
  stFoodPermit : string;
  nBreakSummary : integer;
  nLunchSummary : integer;
  nDinnerSummary : integer;
  nMidNightSummary : integer;
  nSummaryCount : integer;
  nAmtSummary : integer;
begin
  GridInitialize(sg_Report);
  nBreakSummary := 0;
  nLunchSummary := 0;
  nDinnerSummary := 0;
  nMidNightSummary := 0;
  nSummaryCount := 0;
  nAmtSummary := 0;
  stFoodArea := '';
  stFoodPermit := '';
  if cmb_FoodArea.ItemIndex > 0 then
  begin
    stFoodArea := FoodAreaList.Strings[cmb_FoodArea.ItemIndex];
  end;
  
  if cmb_FoodPERMIT.ItemIndex < 0 then cmb_FoodPERMIT.ItemIndex := 1;

  if cmb_FoodPERMIT.ItemIndex = 1 then stFoodPermit := 'Y'
  else if cmb_FoodPERMIT.ItemIndex = 2 then stFoodPermit := 'N';

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinD2DDepartFoodState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date),stFoodArea,stFoodPermit)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinD2DDepartFoodState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date),stFoodArea,stFoodPermit)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_EMPLOYEEJoinD2DDepartFoodState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date),stFoodArea,stFoodPermit)
  else Exit;

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
  stSql := stSql + ' Order By a.FO_DATE,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('조회에 실패하였습니다');
      Exit;
    End;

    if RecordCount < 1 then
    begin
      showmessage('조회데이터가 없습니다.');
      Exit;
    end;

    sg_Report.RowCount := RecordCount + 1 + 1 ;
    nRow := 1;
    with sg_Report do
    begin                          

      while Not Eof do
      begin
        Cells[0,nRow] := MakeDatetimeStr(FindField('FO_DATE').AsString,False);
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('FO_BREAK').AsString;
        Cells[5,nRow] := FindField('FO_LUNCH').AsString;
        Cells[6,nRow] := FindField('FO_DINNER').AsString;
        Cells[7,nRow] := FindField('FO_MIDNIGHT').AsString;
        Cells[8,nRow] := FindField('TOT').AsString;
        Cells[9,nRow] := FindField('FO_FOODAMT').AsString;
        if isDigit(FindField('FO_BREAK').AsString) then nBreakSummary := nBreakSummary + strtoint(FindField('FO_BREAK').AsString);
        if isDigit(FindField('FO_LUNCH').AsString) then nLunchSummary := nLunchSummary + strtoint(FindField('FO_LUNCH').AsString);
        if isDigit(FindField('FO_DINNER').AsString) then nDinnerSummary := nDinnerSummary + strtoint(FindField('FO_DINNER').AsString);
        if isDigit(FindField('FO_MIDNIGHT').AsString) then nMidNightSummary := nMidNightSummary + strtoint(FindField('FO_MIDNIGHT').AsString);
        if isDigit(FindField('TOT').AsString) then nSummaryCount := nSummaryCount + strtoint(FindField('TOT').AsString);
        if isDigit(FindField('FO_FOODAMT').AsString) then nAmtSummary := nAmtSummary + strtoint(FindField('FO_FOODAMT').AsString);
        inc(nRow);
        Next;
      end;
      Cells[0,nRow] := '합계';
      Cells[1,nRow] := '';
      Cells[2,nRow] := '';
      Cells[3,nRow] := '';
      Cells[4,nRow] := inttostr(nBreakSummary);
      Cells[5,nRow] := inttostr(nLunchSummary);
      Cells[6,nRow] := inttostr(nDinnerSummary);
      Cells[7,nRow] := inttostr(nMidNightSummary);
      Cells[8,nRow] := inttostr(nSummaryCount);
      Cells[9,nRow] := inttostr(nAmtSummary);
    end;

  end;
end;

procedure TfmD2DDepartFDState.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(btn_Search);
end;

procedure TfmD2DDepartFDState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  FoodAreaList.Free;

  Action := caFree;

end;

procedure TfmD2DDepartFDState.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  FoodAreaList := TStringList.Create;

end;

procedure TfmD2DDepartFDState.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(btn_Search);
end;

procedure TfmD2DDepartFDState.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);
end;

procedure TfmD2DDepartFDState.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);
end;

procedure TfmD2DDepartFDState.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('부서별식수통계','참조파일','D2DDepartFDState.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('부서별식수통계','시작위치',6);
  ini_fun.Free;

  aFileName:='부서별식수통계';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;

end;


function TfmD2DDepartFDState.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_startDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_endDate.Date) ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_Depart.text ;

  Result := stTitle;
end;

procedure TfmD2DDepartFDState.sg_reportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_report.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmD2DDepartFDState.cmb_FoodAreaChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);

end;

procedure TfmD2DDepartFDState.cmb_FoodPERMITChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);

end;

procedure TfmD2DDepartFDState.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  GridInitialize(sg_report as TStringGrid);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadFoodArea(FoodAreaList,cmb_FoodArea);

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

initialization
  RegisterClass(TfmD2DDepartFDState);
Finalization
  UnRegisterClass(TfmD2DDepartFDState);

end.
