unit uPerAtReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm,
  CommandArray, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, ExtCtrls,IniFiles,
  Gauges,ComObj, AdvObj;

type
  TfmPerAtReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_Sabun: TLabel;
    lb_Name: TLabel;
    Label5: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ADOQuery: TADOQuery;
    Panel12: TPanel;
    Label7: TLabel;
    lb_JijumName: TLabel;
    cmb_Jijum: TComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TComboBox;
    Panel1: TPanel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    cmb_EmType: TComboBox;
    lb_emType: TLabel;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_PrintClick(Sender: TObject);
    procedure ADOQueryAT_DATEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQueryAT_INTIMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQueryAT_OUTTIMEGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQueryAT_INRESULTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure ADOQueryAT_OUTRESULTGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure FormNameSet;
    Function SearchATEvent(aCode:string) : Boolean;
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmPerAtReport: TfmPerAtReport;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad,
  uMssql,
  uPostGresql,
  uMDBSql,
  uFireBird, uExcelSave;

{$R *.dfm}



procedure TfmPerAtReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPerAtReport.FormActivate(Sender: TObject);
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  LoadEmpType(EmpTypeCodeList,cmb_EmType);
  if cmb_EmType.Items.Count > 0 then cmb_EmType.ItemIndex := 1;

  sg_Report.ColWidths[11] := 0;

  FormNameSet;
end;

procedure TfmPerAtReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
end;

procedure TfmPerAtReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'PerAtReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;

procedure TfmPerAtReport.btn_SearchClick(Sender: TObject);
begin
  SearchATEvent('');
{
  GridInitialize(sg_Report);


  //memo1.Lines.Text := stSql;
  //Exit;
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

    sg_Report.RowCount := RecordCount + 1 ;
    nRow := 1;

    while Not Eof do
    begin
      with sg_Report do
      begin
        Cells[0,nRow] := copy(FindField('AT_DATE').AsString,1,4) + '-' +
                         copy(FindField('AT_DATE').AsString,5,2) + '-' +
                         copy(FindField('AT_DATE').AsString,7,2) ;
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                         copy(FindField('AT_INTIME').AsString,11,2) + ':' +
                         copy(FindField('AT_INTIME').AsString,13,2);
        Cells[7,nRow] := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                         copy(FindField('AT_OUTTIME').AsString,11,2) + ':' +
                         copy(FindField('AT_OUTTIME').AsString,13,2);
        if FindField('AT_INRESULT').AsString = 'Y' then Cells[8,nRow] := '출근'
        else if FindField('AT_INRESULT').AsString = 'N' then Cells[8,nRow] := '지각'
        else Cells[8,nRow] := FindField('AT_INRESULT').AsString;
        if FindField('AT_OUTRESULT').AsString = 'Y' then Cells[9,nRow] := '퇴근'
        else if FindField('AT_OUTRESULT').AsString = 'N' then Cells[9,nRow] := '조퇴'
        else Cells[9,nRow] := FindField('AT_OUTRESULT').AsString;
        Cells[10,nRow] := FindField('AT_CONTENT').AsString;
        Cells[11,nRow] := FindField('CA_CARDNO').AsString;

      end;

      inc(nRow);
      Next;
    end;

  end;
}


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
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin

  btn_Print.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('개인별근태보고서','참조파일','perATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('개인별근태보고서','시작위치',6);
  ini_fun.Free;


  dmExcelSave.ExcelPrintOut(sg_report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmPerAtReport.ADOQueryAT_DATEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= copy(Sender.AsString,1,4) + '-' + copy(Sender.AsString,5,2) + '-' + copy(Sender.AsString,7,2);
end;

procedure TfmPerAtReport.ADOQueryAT_INTIMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= copy(Sender.AsString,9,2) + ':' + copy(Sender.AsString,11,2) + ':' + copy(Sender.AsString,13,2);

end;

procedure TfmPerAtReport.ADOQueryAT_OUTTIMEGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= copy(Sender.AsString,9,2) + ':' + copy(Sender.AsString,11,2) + ':' + copy(Sender.AsString,13,2);
end;

procedure TfmPerAtReport.ADOQueryAT_INRESULTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'Y' then  Text:= '출근'
  else if Sender.AsString = 'N' then Text := '지각'
  else Text := Sender.AsString;

end;

procedure TfmPerAtReport.ADOQueryAT_OUTRESULTGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = 'Y' then  Text:= '퇴근'
  else if Sender.AsString = 'N' then Text := '조퇴'
  else Text := Sender.AsString;
end;

procedure TfmPerAtReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmPerAtReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
end;

procedure TfmPerAtReport.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
  lb_emType.Caption := FM042;
  lb_Sabun.Caption := FM101;
  lb_Name.Caption := FM102;
  with sg_report do
  begin
    cells[1,0] := FM002;
    cells[2,0] := FM012;
    cells[3,0] := FM022;
    cells[4,0] := FM101;
    cells[5,0] := FM102;

  end;

end;

function TfmPerAtReport.SearchATEvent(aCode: string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
  stTemp : string;
  bCardType : Boolean;
  stOperator:string;
begin
  result := False;

  bCardType := False;
  
  RowGridInitialize(sg_Report);
  if DBTYPE = 'MSSQL' then stSql :=  Mssql.SelectTB_ATEVENTFromToDayBase(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTFromToDayBase(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTFromToDayBase(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
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
  if cmb_EmType.ItemIndex > 0 then
    stSql := stSql + ' AND a.RG_CODE = ''' + copy(EmpTypeCodeList.Strings[cmb_EmType.ItemIndex],1,3) + ''' ';

  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';


  stSql := stSql + ' Order By f.AT_DATE ,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

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
    if RecordCount < 1 then
    begin
      showmessage('근태 데이터가 없습니다.');
      Exit;
    end;
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
        Cells[0,nRow] := copy(FindField('AT_DATE').AsString,1,4) + '-' +
                         copy(FindField('AT_DATE').AsString,5,2) + '-' +
                         copy(FindField('AT_DATE').AsString,7,2) ;
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := stInTime;
        Cells[7,nRow] := stOutTime;
        if FindField('AT_INCODE').AsString = '001' then Cells[8,nRow] := ''
        else Cells[8,nRow] := FindField('JIKAK').AsString;
        if FindField('AT_OUTCODE').AsString = '001' then Cells[9,nRow] := ''
        else Cells[9,nRow] := FindField('Jotae').AsString;
        Cells[10,nRow] := FindField('AT_CONTENT').AsString;
      end;
      nRow := nRow + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
  result := True;

end;

procedure TfmPerAtReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('개인별근태보고서','참조파일','perATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('개인별근태보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='근태보고서';
  SaveDialog1.FileName := aFileName;
  if G_nFileFormat = 1 then
  begin
    SaveDialog1.DefaultExt := 'csv';
    SaveDialog1.Filter := 'CSV File(*.csv)|*.csv';
  end else
  begin
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter := 'EXCEL File(*.xls)|*.xls';
  end;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      if G_nFileFormat = 0 then
        dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_Report.SaveToCSV(stSaveFileName);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
{  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        showmessage('CSV파일로 저장합니다.');
        sg_Report.SaveToCSV(aFileName + '.csv');
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True; }
end;


function TfmPerAtReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '날짜 : ' + FormatDateTime('yyyy-mm-dd',dt_startDate.Date) + '-' + FormatDateTime('yyyy-mm-dd',dt_endDate.Date)  ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / 직위 : ' + cmb_Posi.text ;
  if cmb_EmType.ItemIndex > 0 then
    stTitle := stTitle + ' / ' + lb_emType.caption + ' : ' + cmb_EmType.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / 사번 : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / 이름 : ' + ed_name.text ;

  Result := stTitle;

end;

procedure TfmPerAtReport.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'PerAtReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmPerAtReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmPerATReport);
Finalization
  UnRegisterClass(TfmPerATReport);

end.
 