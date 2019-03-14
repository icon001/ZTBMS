unit uPersonFdReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, Grids, BaseGrid,
  AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm, CommandArray, ExtCtrls,
  iniFiles, Gauges,ComObj, AdvObj;

type
  TfmPersonFdReport = class(TfmASubForm)
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
    Label20: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label22: TLabel;
    Label21: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    cmb_FoodPERMIT: TComboBox;
    cmb_FoodGubun: TComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    Label2: TLabel;
    cmb_FoodArea: TComboBox;
    Bevel1: TBevel;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_FoodGubunChange(Sender: TObject);
    procedure cmb_FoodPERMITChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
    procedure ed_empNoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    FoodCodeList : TStringList;
    FoodAreaList : TStringList;
    { Private declarations }
    procedure LoadFoodCode(aList:TStringList;cmb_Box:TComboBox);
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmPersonFdReport: TfmPersonFdReport;

implementation
uses
  uDataModule1,
  uLomosutil,
  uCompanyCodeLoad,
  uMDBSql,
  uPostGreSql,
  uMssql, uExcelSave;

{$R *.dfm}

procedure TfmPersonFdReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;



procedure TfmPersonFdReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('개인별식수보고서','참조파일','PersonFDReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('개인별식수보고서','시작위치',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);
  
  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;
{
  if Not ExcelPrintOut(sg_report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False) then
  begin
    btn_Print.Enabled := True;
    Screen.Cursor:= crDefault;
  end;
  btn_Print.Enabled := True;
  //showmessage('출력 완료');
  Screen.Cursor:= crDefault;
}
end;

procedure TfmPersonFdReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_endDate.Date);

end;

procedure TfmPersonFdReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='개인별 식수 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmPersonFdReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
  stFoodPermit,stFoodCode:string;
  stStartDate,stEndDate : string;
  stFoodArea : string;
  nBreakCount,nLunchCount,nDinnerCount,nMidNightCount : integer;
  stMessage : string;
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['VALUE'] := '' ;
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  GridInitialize(sg_Report);
  nBreakCount := 0;
  nLunchCount := 0;
  nDinnerCount := 0;
  nMidNightCount := 0;
  stFoodPermit := '';
  stFoodCode := '';
  stFoodArea := '';
  stStartDate:= FormatDateTime('yyyymmdd',dt_startDate.Date);
  stEndDate := FormatDateTime('yyyymmdd',dt_endDate.Date);
  if cmb_FoodArea.ItemIndex > 0 then
  begin
    stFoodArea := FoodAreaList.Strings[cmb_FoodArea.ItemIndex];
  end;
  if cmb_FoodGubun.ItemIndex > 0 then
  begin
    stFoodCode := FoodCodeList.Strings[cmb_FoodGubun.ItemIndex];
  end;
  if cmb_FoodPERMIT.ItemIndex < 0 then cmb_FoodPERMIT.ItemIndex := 1;
  if cmb_FoodPERMIT.ItemIndex = 1 then stFoodPermit := 'Y'
  else if cmb_FoodPERMIT.ItemIndex = 2 then stFoodPermit := 'N';

  if DBTYPE = 'MDB' then  stSql := MDBSql.SelectTB_EMPLOYEEJoinFoodEventFromD2D(stFoodArea,stFoodCode,stFoodPermit,stStartDate,stEndDate)
  else if DBTYPE = 'PG' then  stSql := PostGreSql.SelectTB_EMPLOYEEJoinFoodEventFromD2D(stFoodArea,stFoodCode,stFoodPermit,stStartDate,stEndDate)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_EMPLOYEEJoinFoodEventFromD2D(stFoodArea,stFoodCode,stFoodPermit,stStartDate,stEndDate)
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

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_name.Text)  + '%'' ';

  stSql := stSql + ' order by b.FO_DATE ';

//  memo1.text := stSql;

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      on E : EDatabaseError do
          begin
            // ERROR MESSAGE-BOX DISPLAY
            ShowMessage(E.Message );
            Exit;
          end;
        else
          begin
            ShowMessage('데이터베이스 에러' );
            Exit;
          end;
      //Exit;
    End;

    if RecordCount < 1 then
    begin
      showmessage('조회데이터가 없습니다.');
      Exit;
    end;

    sg_Report.RowCount := RecordCount + 1 ;
    nRow := 1;

    while Not Eof do
    begin
      with sg_Report do
      begin
        Cells[0,nRow] := FindField('FO_DATE').AsString;
        Cells[1,nRow] := FindField('FO_TIME').AsString;
        Cells[2,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[3,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[4,nRow] := FindField('DEPART_NAME').AsString;
        Cells[5,nRow] := FindField('EM_CODE').AsString;
        Cells[6,nRow] := FindField('EM_NAME').AsString;
        Cells[7,nRow] := FindField('FO_CODENAME').AsString;
        Cells[8,nRow] := FindField('FO_NAME').AsString;
        Cells[9,nRow] := FindField('FO_PERMIT').AsString;
        Cells[10,nRow] := FindField('FO_CONTENT').AsString;
        if FindField('FO_FOODCODE').AsString = '001' then inc(nBreakCount)
        else if FindField('FO_FOODCODE').AsString = '002' then inc(nLunchCount)
        else if FindField('FO_FOODCODE').AsString = '003' then inc(nDinnerCount)
        else if FindField('FO_FOODCODE').AsString = '004' then inc(nMidNightCount);
      end;

      inc(nRow);
      Next;
    end;

  end;
  stMessage := '조회건수 - 조식 : ' + inttostr(nBreakCount);
  stMessage := stMessage + ' / 중식 : ' +  inttostr(nLunchCount);
  stMessage := stMessage + ' / 석식 : ' +  inttostr(nDinnerCount);
  stMessage := stMessage + ' / 야식 : ' +  inttostr(nMidNightCount);
  stMessage := stMessage + ' / 합계 : ' +  inttostr( nBreakCount + nLunchCount + nDinnerCount + nMidNightCount);

  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['VALUE'] := stMessage ;
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

end;

procedure TfmPersonFdReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmPersonFdReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  FoodCodeList.Free;
  FoodAreaList.Free;

  Action := caFree;

end;

procedure TfmPersonFdReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  FoodCodeList := TStringList.Create;
  FoodAreaList := TStringList.Create;
end;

procedure TfmPersonFdReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(btn_Search);
end;

procedure TfmPersonFdReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);

end;

procedure TfmPersonFdReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);

end;

procedure TfmPersonFdReport.LoadFoodCode(aList: TStringList;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  aList.Clear;
  cmb_Box.Clear;
  aList.Add('');
  cmb_Box.Items.Add('전체');
  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_FOODCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
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
      aList.Add(FindField('FO_FOODCODE').AsString);
      cmb_Box.Items.Add(FindField('FO_CODENAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmPersonFdReport.cmb_FoodGubunChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);
end;

procedure TfmPersonFdReport.cmb_FoodPERMITChange(Sender: TObject);
begin
  btn_SearchClick(btn_Search);
end;

procedure TfmPersonFdReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
{  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if stSaveFileName <> '' then
    begin
      ExcelIO1.XLSExport(stSaveFileName);
    end;
    showmessage('파일생성 완료');
  end;    }
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('개인별식수보고서','참조파일','PersonFDReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('개인별식수보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='개인별식수보고서';
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

function TfmPersonFdReport.GetTitle: String;
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
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / 직위 : ' + cmb_Posi.text ;
  if cmb_FoodGubun.ItemIndex > 0 then
    stTitle := stTitle + ' / 식수구분 : ' + cmb_FoodGubun.text ;
  if cmb_FoodPERMIT.ItemIndex > 0 then
    stTitle := stTitle + ' / 승인구분 : ' + cmb_FoodPERMIT.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / 사번 : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / 이름 : ' + ed_name.text ;

  Result := stTitle;
end;



procedure TfmPersonFdReport.sg_reportResize(Sender: TObject);
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


procedure TfmPersonFdReport.ed_empNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    btn_SearchClick(btn_Search);
  end;

end;

procedure TfmPersonFdReport.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  GridInitialize(sg_report as TStringGrid);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  LoadFoodCode(FoodCodeList,cmb_FoodGubun);
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

initialization
  RegisterClass(TfmPersonFdReport);
Finalization
  UnRegisterClass(TfmPersonFdReport);

end.
