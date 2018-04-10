unit uDepartATReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, FR_DSet, FR_DBSet, FR_Class, DB, ADODB;

type
  TfmDepartAtReport = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label5: TLabel;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    dt_startDate: TDateTimePicker;
    ADOQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    SaveDialog1: TSaveDialog;
    cbWork: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure cbWorkExit(Sender: TObject);
    procedure cbWorkChange(Sender: TObject);
  private
    nCol : integer;
    nRow : integer;
    { Private declarations }
    Procedure LoadCompanyCode(cmb_Box: TComboBox);
    Procedure LoadDepartCode(aCompanyCode: string;cmb_Box: TComboBox);
    procedure LoadInCode(cmb_Box: TComboBox);
    procedure LoadOutCode(cmb_Box: TComboBox);
    function GetIndex(aCode:string):integer;
  public
    { Public declarations }
  end;

var
  fmDepartAtReport: TfmDepartAtReport;
  CompanyCodeList : TStringList;
  DepartCodeList : TStringList;

implementation

uses uDataModule1;

{$R *.dfm}

procedure TfmDepartAtReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmDepartAtReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;

  Action := caFree;

end;

procedure TfmDepartAtReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
end;

procedure TfmDepartAtReport.LoadCompanyCode(cmb_Box: TComboBox);
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

procedure TfmDepartAtReport.LoadDepartCode(aCompanyCode: string;
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

procedure TfmDepartAtReport.FormActivate(Sender: TObject);
begin
  dt_startDate.Date := Now;
  LoadCompanyCode(cmb_Company);
  LoadDepartCode('',cmb_Depart);
  sg_Report.ColWidths[9] := 0;
  sg_Report.ColWidths[10] := 0;
  sg_Report.ColWidths[11] := 0;

end;

procedure TfmDepartAtReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadDepartCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],cmb_Depart);
end;

procedure TfmDepartAtReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
begin
  GridInitialize(sg_Report);

  stSql := 'Select SubString(a.AT_DATE,1,4) + ''-'' + SubString(a.AT_DATE,5,2) + ''-'' + SubString(a.AT_DATE,7,2) as AT_DATE,';
  stSql := stSql + 'SubString(a.AT_INTIME,9,2) + '':'' + SubString(a.AT_INTIME,11,2) + '':'' + SubString(a.AT_INTIME,13,2) as AT_INTIME, ' ;
  stSql := stSql + 'SubString(a.AT_OUTTIME,9,2) + '':'' + SubString(a.AT_OUTTIME,11,2) + '':'' + SubString(a.AT_OUTTIME,13,2) as AT_OUTTIME, ';
  stSql := stSql + ' a.AT_INCODE,c.AT_INNAME as AT_INRESULT, ';
  stSql := stSql + ' a.AT_OUTCODE,d.AT_OUTNAME as AT_OUTRESULT, ';
  stSql := stSql + ' a.AT_CONTENT,a.CA_CARDNO,b.CO_COMPANYCODE,b.COMPANY_NAME, ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.DEPART_NAME,b.PO_POSICODE,b.PO_NAME, ';
  stSql := stSql + ' b.EM_CODE,b.EM_NAME ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( select a.CA_CARDNO,a.GROUP_CODE,a.CO_COMPANYCODE,a.EM_CODE,  ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.EM_NAME,c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,  ';
  stSql := stSql + ' b.PO_POSICODE,e.PO_NAME,a.CA_CARDTYPE  ';
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
  stSql := stSql + ' Left Join TB_ATEVENT a ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO  ';
  stSql := stSql + ' AND a.AT_DATE = ''' + FormatDateTime('yyyymmdd',dt_startDate.Date) + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE c ';
  stSql := stsql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_INCODE = c.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_OUTCODE = d.AT_OUTCODE ) ';
  stSql := stSql + ' Where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ';
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

  stSql := stSql + ' Order By b.CO_COMPANYCODE,b.CO_DEPARTCODE,b.EM_CODE ';

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
        Cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[1,nRow] := FindField('DEPART_NAME').AsString;
        Cells[2,nRow] := FindField('EM_CODE').AsString;
        Cells[3,nRow] := FindField('EM_NAME').AsString;
        Cells[4,nRow] := FindField('AT_INTIME').AsString;
        Cells[5,nRow] := FindField('AT_OUTTIME').AsString;
        Cells[6,nRow] := FindField('AT_INRESULT').AsString;
        Cells[7,nRow] := FindField('AT_OUTRESULT').AsString;
        Cells[8,nRow] := FindField('AT_CONTENT').AsString;
        Cells[9,nRow] := FindField('CA_CARDNO').AsString;
        Cells[10,nRow] := FindField('AT_INCODE').AsString;
        Cells[11,nRow] := FindField('AT_OUTCODE').AsString;
      end;

      inc(nRow);
      Next;
    end;

  end;


end;

procedure TfmDepartAtReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='부서별 근태 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmDepartAtReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('조회 후 출력하세요.');
    Exit;
  end;
  frReport1.ShowReport;

end;

procedure TfmDepartAtReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색날짜 : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) ;

end;

procedure TfmDepartAtReport.LoadInCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add('');
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
      cmb_Box.Items.Add(FindField('AT_INCODE').AsString + '.' + FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartAtReport.LoadOutCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add('');
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
      cmb_Box.Items.Add(FindField('AT_OUTCODE').AsString + '.' + FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartAtReport.cbWorkExit(Sender: TObject);
begin
  cbWork.visible := False;
end;

function TfmDepartAtReport.GetIndex(aCode: string): integer;
var
  nIndex : integer;
  nPos : integer;
  stCode : string;
begin
  result := 0;
  for nIndex := 1 to cbWork.Items.Count - 1 do
  begin
    nPos := Pos('.',cbWork.Items.Strings[nIndex]);
    if nPos > -1 then
    begin
      stCode := copy(cbWork.Items.Strings[nIndex],1,nPos - 1);
      if aCode = stCode then
      begin
        result := nIndex;
        break;
      end;
    end;
  end;
end;

procedure TfmDepartAtReport.cbWorkChange(Sender: TObject);
var
  nPos : integer;
  stCode : string;
  stCodename : string;
begin
  with sg_report do
  begin
    nPos := Pos('.',cbWork.Text);
    if nPos < 1 then
    begin
      cells[nCol,nRow] := '';
      cells[nCol + 4 ,nRow] := '';
    end else
    begin
      stCode := copy(cbWork.Text,1,nPos - 1);
      stCodeName := copy(cbWork.Text,nPos + 1,Length(cbWork.Text) - nPos);
      cells[nCol,nRow] := stCodeName;
      cells[nCol + 4 ,nRow] := stCode;

    end;
  end;
end;

initialization
  RegisterClass(TfmDepartAtReport);
Finalization
  UnRegisterClass(TfmDepartAtReport);

end.
