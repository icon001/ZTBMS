unit uD2DFdReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, Grids, BaseGrid,
  AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm, CommandArray;

type
  TfmD2DFdReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
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
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    DepartCodeList : TStringList;
    { Private declarations }
    Procedure LoadCompanyCode(cmb_Box: TComboBox);
    Procedure LoadDepartCode(aCompanyCode: string;cmb_Box: TComboBox);
  public
    { Public declarations }
  end;

var
  fmD2DFdReport: TfmD2DFdReport;

implementation
uses uDataModule1;

{$R *.dfm}

procedure TfmD2DFdReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmD2DFdReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('조회 후 출력하세요.');
    Exit;
  end;
  frReport1.ShowReport;

end;

procedure TfmD2DFdReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_endDate.Date);

end;

procedure TfmD2DFdReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='기간별 식수 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmD2DFdReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
begin
  GridInitialize(sg_Report);

  stSql := 'Select SubString(a.FO_DATE,1,4) + ''-'' + SubString(a.FO_DATE,5,2) + ''-'' + SubString(a.FO_DATE,7,2) as FO_DATE,';
  stSql := stSql + ' a.FO_BREAK,a.FO_LUNCH,a.FO_DINNER,a.FO_MIDNIGHT,a.TOT,';
  stSql := stSql + ' a.CA_CARDNO,b.CO_COMPANYCODE,b.COMPANY_NAME, ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.DEPART_NAME,b.PO_POSICODE,b.PO_NAME, ';
  stSql := stSql + ' b.EM_CODE,b.EM_NAME ';
  stSql := stSql + ' FROM (select a.GROUP_CODE,a.FO_DATE,a.CA_CARDNO,  ';
  stSql := stSql + ' SUM(a.FO_BREAK) as FO_BREAK,   ';
  stSql := stSql + ' SUM(a.FO_LUNCH) as FO_LUNCH,  ';
  stSql := stSql + ' SUM(a.FO_DINNER) as FO_DINNER,  ';
  stSql := stSql + ' SUM(a.FO_MIDNIGHT) as FO_MIDNIGHT,  ';
  stSql := stSql + ' SUM(a.TOT) as TOT    ';
  stSql := stSql + ' From   ';
  stSql := stSql + ' ( select GROUP_CODE,FO_DATE,CA_CARDNO,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_FOODCODE = ''001'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_BREAK,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_FOODCODE = ''002'' THEN 1   ';
  stSql := stSql + ' ELSE 0 END as FO_LUNCH,  ';
  stSql := stSql + ' CASE  ';
  stSql := stSql + ' WHEN FO_FOODCODE = ''003'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_DINNER,  ';
  stSql := stSql + ' CASE   ';
  stSql := stSql + ' WHEN FO_FOODCODE = ''004'' THEN 1  ';
  stSql := stSql + ' ELSE 0 END as FO_MIDNIGHT,  ';
  stSql := stSql + ' 1 as TOT   ';
  stSql := stSql + ' from   ';
  stSql := stSql + ' TB_FOODEVENT   ';
  stSql := stSql + ' WHERE FO_PERMIT = ''Y''  ';
  stSql := stSql + ' AND FO_DATE BETWEEN ''' + FormatDateTime('yyyymmdd',dt_startDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_endDate.Date) + ''' ';
  stSql := stSql + ' ) a   ';
  stSql := stSql + ' GROUP BY a.GROUP_CODE,a.FO_DATE,a.CA_CARDNO ) a  ';
  stSql := stSql + ' Inner Join ( select a.CA_CARDNO,a.GROUP_CODE,a.CO_COMPANYCODE,a.EM_CODE,  ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.EM_NAME,c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,  ';
  stSql := stSql + ' b.PO_POSICODE,e.PO_NAME  ';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' INNER JOIN TB_EMPLOYEE b  ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY c  ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY d  ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'')  ';
  stSql := stSql + ' LEFT JOIN TB_POSI e  ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = e.PO_POSICODE) ) b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_Company.ItemIndex > 0 then stSql := stSql + ' AND  b.CO_COMPANYCODE = ''' + copy(CompanyCodeList.Strings[cmb_Company.ItemIndex],1,3) + ''' ';
  if cmb_Depart.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND  b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ';
  end else
  begin
    if Not IsMaster then
    begin
      if DepartCodeList.Count > 1 then
      begin
        for i := 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' ( b.CO_COMPANYCODE = ''' + Copy(DepartCodeList.Strings[i],1,3) + ''' ';
          stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + Copy(DepartCodeList.Strings[i],4,3) + ''') ';
        end;
        stSql := stSql + ' ) ';
      end else
      begin
        showmessage('조회 가능한 부서 권한이 없습니다. 권한을 확인하세요.');
        Exit;
      end;
    end;
  end;
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND b.EM_CODE = ''' +  Trim(ed_empNo.Text) + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND b.EM_NAME  Like ''%' +  Trim(ed_name.Text) + '%'' ';

  stSql := stSql + ' Order By b.CO_COMPANYCODE,b.EM_CODE,a.FO_DATE ';

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
        Cells[0,nRow] := FindField('FO_DATE').AsString;
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('DEPART_NAME').AsString;
        Cells[3,nRow] := FindField('EM_CODE').AsString;
        Cells[4,nRow] := FindField('EM_NAME').AsString;
        Cells[5,nRow] := FindField('FO_BREAK').AsString;
        Cells[6,nRow] := FindField('FO_LUNCH').AsString;
        Cells[7,nRow] := FindField('FO_DINNER').AsString;
        Cells[8,nRow] := FindField('FO_MIDNIGHT').AsString;
        Cells[9,nRow] := FindField('TOT').AsString;

      end;

      inc(nRow);
      Next;
    end;

  end;
end;

procedure TfmD2DFdReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadDepartCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],cmb_Depart);

end;

procedure TfmD2DFdReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;

  Action := caFree;

end;

procedure TfmD2DFdReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;

end;

procedure TfmD2DFdReport.LoadCompanyCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  CompanyCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE ';

  cmb_Box.Items.Add('전체');
  CompanyCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  with DataModule1.GetObject.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmD2DFdReport.LoadDepartCode(aCompanyCode: string;
  cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  DepartCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE ';

  cmb_Box.Items.Add('전체');
  DepartCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  with DataModule1.GetObject.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmD2DFdReport.FormActivate(Sender: TObject);
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;
  LoadCompanyCode(cmb_Company);
  LoadDepartCode('',cmb_Depart);

end;

initialization
  RegisterClass(TfmD2DFdReport);
Finalization
  UnRegisterClass(TfmD2DFdReport);

end.
