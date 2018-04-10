unit uPerATState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, Grids,
  BaseGrid, AdvGrid, StdCtrls, Buttons, uSubForm, CommandArray;

type
  TfmPerATState = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    ADOQuery: TADOQuery;
    Label5: TLabel;
    dt_Date: TDateTimePicker;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
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
  fmPerATState: TfmPerATState;

implementation
uses
uLomosUtil,
uDataModule1;

{$R *.dfm}

procedure TfmPerATState.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmPerATState.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
  LoadCompanyCode(cmb_Company);
  LoadDepartCode('',cmb_Depart);

end;

procedure TfmPerATState.LoadCompanyCode(cmb_Box: TComboBox);
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

procedure TfmPerATState.LoadDepartCode(aCompanyCode: string;
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

procedure TfmPerATState.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;

end;

procedure TfmPerATState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;

  Action := caFree;

end;

procedure TfmPerATState.cmb_CompanyChange(Sender: TObject);
begin
  LoadDepartCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],cmb_Depart);

end;

procedure TfmPerATState.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='개인별 근태 통계';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmPerATState.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '작업월 : '+ FormatdateTime('yyyy년 mm 월',dt_Date.Date) ;

end;

procedure TfmPerATState.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('조회 후 출력하세요.');
    Exit;
  end;
  frReport1.ShowReport;
end;

procedure TfmPerATState.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
begin
  GridInitialize(sg_Report);

  stSql := 'select f.MO_MONTH,';
  stSql := stSql + 'f.MO_TOTATCNT,f.MO_ATCNT,f.MO_JIKAKCNT,f.MO_JOTAECNT,MO_NIGHTCNT,';
  stSql := stSql + 'f.MO_HOLIDAYCNT,f.MO_ABSENCECNT,';
  stSql := stSql + ' b.CO_COMPANYCODE,b.CO_DEPARTCODE,b.EM_CODE,b.EM_NAME, ';
  stSql := stSql + ' c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,e.PO_NAME from TB_MONTHAT f  ';
  stSql := stSql + ' Inner Join TB_CARD a  ';
  stSql := stSql + ' ON (f.GROUP_CODE = a.GROUP_CODE  ';
  stSql := stSql + ' AND f.CA_CARDNO = a.CA_CARDNO) ';
  stSql := stSql + '   INNER JOIN TB_EMPLOYEE b   ';
  stSql := stSql + '   ON (a.GROUP_CODE = b.GROUP_CODE  ';
  stSql := stSql + '   AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + '   AND a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + '   LEFT JOIN TB_COMPANY c  ';
  stSql := stSql + '   ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + '   AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + '   AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + '   LEFT JOIN TB_COMPANY d  ';
  stSql := stSql + '   ON (b.GROUP_CODE = d.GROUP_CODE  ';
  stSql := stSql + '   AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + '   AND b.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
  stSql := stSql + '   AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + '   LEFT JOIN TB_POSI e  ';
  stSql := stSql + '   ON (b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + '   AND b.PO_POSICODE = e.PO_POSICODE) ';
  stSql := stSql + ' Where f.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND f.MO_MONTH = ''' + FormatDateTime('yyyymm',dt_Date.Date) + ''' ';
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
  stSql := stSql + ' Order by b.EM_CODE ';

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
      showmessage('조회데이터가 없습니다. 통계자료는 배치작업->근태통계자료 생성을 하신후 조회 가능합니다.');
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
        Cells[4,nRow] := FindField('MO_TOTATCNT').AsString;
        Cells[5,nRow] := FindField('MO_ATCNT').AsString;
        Cells[6,nRow] := FindField('MO_JIKAKCNT').AsString;
        Cells[7,nRow] := FindField('MO_JOTAECNT').AsString;
        Cells[8,nRow] := FindField('MO_NIGHTCNT').AsString;
        Cells[9,nRow] := FindField('MO_HOLIDAYCNT').AsString;
        Cells[10,nRow] := FindField('MO_ABSENCECNT').AsString;
      end;

      inc(nRow);
      Next;
    end;

  end;

end;

initialization
  RegisterClass(TfmPerATState);
Finalization
  UnRegisterClass(TfmPerATState);

end.
