unit uATD2DStatReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Gauges, Grids, BaseGrid,
  AdvGrid, uSubForm, CommandArray, DB, ADODB,iniFiles,ComObj,ActiveX,
  AdvObj;

type
  TfmATD2DStatReport = class(TfmASubForm)
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
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    ADOQuery: TADOQuery;
    Label11: TLabel;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    Label12: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure sg_reportColChanging(Sender: TObject; OldCol,
      NewCol: Integer; var Allow: Boolean);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    { Private declarations }
    procedure GridMerge;
    Function SearchReport(aCode:string):Boolean;
    Function CheckTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName:string):Boolean;
    Function UpdateTB_ATMONTHEXTRAName(aMonth,aCompanyCode,aEmCode,aOldExtraName,aNewExtraName:string):Boolean;
    Function UpdateTB_ATMONTHEXTRAAmt(aMonth,aCompanyCode,aEmCode,aExtraName,aExtraAmt:string):Boolean;
    Function DeleteTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName:string):Boolean;
    Function InsertIntoTB_ATMONTHEXTRA(aMonth,aCompanyCode,aEmCode,aExtraName,aExtraAmt:string):Boolean;

    procedure RefreshTotalAmt(aRow:integer);
    procedure GetExtraSearch(aMonth,aCompanyCode,aEmCode:string;aRow:integer);

    Function GetTitle:string;

  public
    { Public declarations }
  end;

var
  fmATD2DStatReport: TfmATD2DStatReport;

implementation
uses
     uDataModule1,
     uCompanyCodeLoad,
     uLomosUtil, uMssql, uPostGreSql, uMDBSql, uExcelSave;

{$R *.dfm}

procedure TfmATD2DStatReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmATD2DStatReport.FormShow(Sender: TObject);
begin
  GridInit(sg_Report,15,sg_Report.FixedRows + 1);
  GridMerge;
end;

procedure TfmATD2DStatReport.GridMerge;
begin
  with sg_report do
  begin

    MergeCells(0,0,6,1);
    Cells[0,0] := '기본정보';
    Cells[0,1] := '회사';
    Cells[1,1] := '지점';
    Cells[2,1] := '부서';
    Cells[3,1] := '직위';
    Cells[4,1] := '사번';
    Cells[5,1] := '이름';

    MergeCells(6,0,4,1);
    Cells[6,0] := '평일 근무';
    Cells[6,1] := '평균 출근시간';
    Cells[7,1] := '평균 퇴근시간';
    Cells[8,1] := '평균 근무시간';
    Cells[9,1] := '지각 횟수';
    MergeCells(10,0,4,1);
    Cells[10,0] := '휴일 근무';
    Cells[10,1] := '출근 일수';
    Cells[11,1] := '평균 출근시간';
    Cells[12,1] := '평균 퇴근시간';
    Cells[13,1] := '평균 근무시간';
    MergeCells(14,0,1,2);
    Cells[14,0] := '비고';

  end;
end;

procedure TfmATD2DStatReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  Action := caFree;

end;

procedure TfmATD2DStatReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

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

procedure TfmATD2DStatReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;

end;

procedure TfmATD2DStatReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);

end;

procedure TfmATD2DStatReport.btn_SearchClick(Sender: TObject);
begin
  SearchReport('');

end;

function TfmATD2DStatReport.SearchReport(aCode: string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  nFirstRow : integer; //시작하는 줄
  nCount:integer;
  nTemp : integer;
begin
  result := False;

  RowGridInitialize(sg_Report,sg_Report.FixedRows + 1);
  if DBTYPE = 'MSSQL' then
    stSql := MSSQL.SelectTB_EMPLOYEEJoinATD2DState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBType = 'PG' then
    stSql := PostGreSql.SelectTB_EMPLOYEEJoinATD2DState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBType = 'MDB' then
    stSql := MDBSql.SelectTB_EMPLOYEEJoinATD2DState(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
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
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then
    begin
      showmessage('조회할 데이터가 없습니다.');
      Exit;
    end;
    nCount:= RecordCount;

    sg_report.RowCount := sg_report.FixedRows + RecordCount;
    nRow := sg_report.FixedRows;
    While Not Eof do
    begin
      nFirstRow := nRow;
      with sg_Report do
      begin
        Cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[1,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[2,nRow] := FindField('DEPART_NAME').AsString;
        Cells[3,nRow] := FindField('PO_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        nTemp := FindField('intime').AsInteger;
        if FindField('cnt').AsInteger <> 0 then
          nTemp := nTemp div FindField('cnt').AsInteger;
        Cells[6,nRow] := FillZeroNumber(nTemp div 60,2) + ':' + FillZeroNumber(nTemp mod 60,2); //평균 출근시간
        nTemp := FindField('outtime').AsInteger;
        if FindField('cnt').AsInteger <> 0 then
          nTemp := nTemp div FindField('cnt').AsInteger;
        Cells[7,nRow] := FillZeroNumber(nTemp div 60,2) + ':' + FillZeroNumber(nTemp mod 60,2); //평균 퇴근시간
        nTemp := FindField('outtime').AsInteger - FindField('intime').AsInteger;
        if FindField('cnt').AsInteger <> 0 then
          nTemp := nTemp div FindField('cnt').AsInteger;
        Cells[8,nRow] := FillZeroNumber(nTemp div 60,2) + '시간 ' + FillZeroNumber(nTemp mod 60,2) + '분'; //평균 근무시간
        Cells[9,nRow] := FindField('JIKAK').AsString ; //지각횟수
        Cells[10,nRow] := FindField('HOLIDAYCNT').AsString ;   //휴일 출근 일수
        nTemp := FindField('HOLIDAYINTIME').AsInteger;
        if FindField('HOLIDAYCNT').AsInteger <> 0 then
          nTemp := nTemp div FindField('HOLIDAYCNT').AsInteger;
        Cells[11,nRow] := FillZeroNumber(nTemp div 60,2) + ':' + FillZeroNumber(nTemp mod 60,2); //휴일 평균 출근시간
        nTemp := FindField('HOLIDAYOUTTIME').AsInteger;
        if FindField('HOLIDAYCNT').AsInteger <> 0 then
          nTemp := nTemp div FindField('HOLIDAYCNT').AsInteger;
        Cells[12,nRow] := FillZeroNumber(nTemp div 60,2) + ':' + FillZeroNumber(nTemp mod 60,2); //휴일 평균 퇴근시간
        nTemp := FindField('HOLIDAYOUTTIME').AsInteger - FindField('HOLIDAYINTIME').AsInteger;
        if FindField('HOLIDAYCNT').AsInteger <>  0 then
          nTemp := nTemp div FindField('HOLIDAYCNT').AsInteger;
        Cells[13,nRow] := FillZeroNumber(nTemp div 60,2) + '시간 ' + FillZeroNumber(nTemp mod 60,2) + '분'; //휴일 평균 근무시간

      end;
      nRow := nRow + 1;
      Next;
    end;

  end;
end;

procedure TfmATD2DStatReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmATD2DStatReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmATD2DStatReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmATD2DStatReport.sg_reportColChanging(Sender: TObject; OldCol,
  NewCol: Integer; var Allow: Boolean);
begin
  with sg_report do
  begin
    if (NewCol = 12) or (NewCol = 13) then
    begin
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goEditing];
    end
    else Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing] ;
  end;

end;

procedure TfmATD2DStatReport.sg_reportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;

  with sg_report do
  begin
    if (ColCount -  2) > Col then
      SelectRange(Col + 1,Col + 1,Row,Row);
  end;
end;

function TfmATD2DStatReport.CheckTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;
  stSql := 'select * from TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount > 0 then
    begin
      Result:= True;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmATD2DStatReport.UpdateTB_ATMONTHEXTRAName(aMonth, aCompanyCode,
  aEmCode, aOldExtraName, aNewExtraName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ATMONTHEXTRA set AT_EXTRANAME = ''' + aNewExtraName + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aOldExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmATD2DStatReport.InsertIntoTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName, aExtraAmt: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATMONTHEXTRA(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_MONTH,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_EXTRANAME,';
  stSql := stSql + 'AT_EXTRAAMT )';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aMonth + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''', ';
  stSql := stSql + '''' + aExtraName + ''', ';
  stSql := stSql + aExtraAmt + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmATD2DStatReport.UpdateTB_ATMONTHEXTRAAmt(aMonth, aCompanyCode,
  aEmCode, aExtraName, aExtraAmt: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ATMONTHEXTRA set AT_EXTRAAMT = ' + aExtraAmt ;
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmATD2DStatReport.DeleteTB_ATMONTHEXTRA(aMonth, aCompanyCode,
  aEmCode, aExtraName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND AT_EXTRANAME = ''' + aExtraName + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATD2DStatReport.RefreshTotalAmt(aRow: integer);
var
  nBaseTotal : integer;
  stExtraAmt1 : string;
  stExtraAmt2 : string;
  stExtraAmt3 : string;
  stExtraAmt4 : string;
  nTotalAmt : integer;
begin
  with sg_Report do
  begin
    if Not isDigit(Cells[15,aRow]) then Cells[15,aRow] := '0';
    stExtraAmt1 := Cells[13,aRow];
    stExtraAmt2 := Cells[13,aRow + 1];
    stExtraAmt3 := Cells[13,aRow + 2];
    stExtraAmt4 := Cells[13,aRow + 3];
    stExtraAmt1 := StringReplace(stExtraAmt1,',','',[rfReplaceAll]);
    stExtraAmt1 := StringReplace(stExtraAmt1,'원','',[rfReplaceAll]);
    stExtraAmt2 := StringReplace(stExtraAmt2,',','',[rfReplaceAll]);
    stExtraAmt2 := StringReplace(stExtraAmt2,'원','',[rfReplaceAll]);
    stExtraAmt3 := StringReplace(stExtraAmt3,',','',[rfReplaceAll]);
    stExtraAmt3 := StringReplace(stExtraAmt3,'원','',[rfReplaceAll]);
    stExtraAmt4 := StringReplace(stExtraAmt4,',','',[rfReplaceAll]);
    stExtraAmt4 := StringReplace(stExtraAmt4,'원','',[rfReplaceAll]);
    if Trim(stExtraAmt1) = '' then stExtraAmt1 := '0';
    if Trim(stExtraAmt2) = '' then stExtraAmt2 := '0';
    if Trim(stExtraAmt3) = '' then stExtraAmt3 := '0';
    if Trim(stExtraAmt4) = '' then stExtraAmt4 := '0';
    nBaseTotal := strtoint(Cells[15,aRow]);
    nTotalAmt := nBaseTotal + strtoint(stExtraAmt1) + strtoint(stExtraAmt2)+ strtoint(stExtraAmt3)+ strtoint(stExtraAmt4);
    Cells[14,aRow] := WonStringFormat(inttostr(nTotalAmt)) + '원';
  end;
end;

procedure TfmATD2DStatReport.GetExtraSearch(aMonth, aCompanyCode,
  aEmCode: string; aRow: integer);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  stSql := ' select * from TB_ATMONTHEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    i:= 0;
    While Not Eof do
    begin
      if i> 3 then Break;

      with sg_Report do
      begin
        Cells[12,aRow+i] := FindField('AT_EXTRANAME').AsString;
        Cells[18,aRow+i] := FindField('AT_EXTRANAME').AsString; // Old Data 가지고 있자
        Cells[13,aRow+i] := WonStringFormat(FindField('AT_EXTRAAMT').AsString) + '원';
      end;

      inc(i);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmATD2DStatReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기간별근태통계','참조파일','ATD2DStatReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('기간별근태통계','시작위치',7);
  ini_fun.Free;

  aFileName:='기간별 근태통계';
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
{  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;}
end;


function TfmATD2DStatReport.GetTitle: string;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy년mm월dd일',dt_startDate.Date) + ' ~ ' + FormatDateTime('yyyy년mm월dd일',dt_endDate.Date)  ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / 직위 : ' + cmb_Posi.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / 사번 : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / 이름 : ' + ed_name.text ;

  Result := stTitle;
end;

procedure TfmATD2DStatReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('월별근태보고서','참조파일','MonthATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('월별근태보고서','시작위치',10);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmATD2DStatReport.sg_reportResize(Sender: TObject);
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

initialization
  RegisterClass(TfmATD2DStatReport);
Finalization
  UnRegisterClass(TfmATD2DStatReport);


end.
