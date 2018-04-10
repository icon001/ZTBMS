unit uD2DATReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, Grids, BaseGrid,
  AdvGrid, ComCtrls, StdCtrls, Buttons, uSubForm, CommandArray, ExtCtrls,iniFiles,
  Gauges,ComObj, AdvObj;

type
  TfmD2DATReport = class(TfmASubForm)
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
    cmb_AtOuttype: TComboBox;
    cmb_AtIntype: TComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    btnAddSearch: TSpeedButton;
    chk_Min: TCheckBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
    procedure btnAddSearchClick(Sender: TObject);
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
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Function SearchATReport(aCode : string;bAdd:Boolean):Boolean;
    Function GetTitle : String;

  public
    { Public declarations }
  end;

var
  fmD2DATReport: TfmD2DATReport;

implementation
uses
     uDataModule1,
     uCompanyCodeLoad,
     uLomosUtil, uMssql, uPostGreSql, uMDBSql, uExcelSave;

{$R *.dfm}

procedure TfmD2DATReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmD2DATReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  GridInitialize(sg_report as TStringGrid);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,cmb_Jijum);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.itemIndex],PosiCodeList,cmb_Posi);

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

procedure TfmD2DATReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  ATINCodeList := TStringList.Create;
  ATINTypeList := TStringList.Create;
  ATOutCodeList := TStringList.Create;
  ATOutTypeList := TStringList.Create;

end;

procedure TfmD2DATReport.FormClose(Sender: TObject;
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

procedure TfmD2DATReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmD2DATReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '�˻��Ⱓ : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_endDate.Date);

end;

procedure TfmD2DATReport.btn_PrintClick(Sender: TObject);
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
  stPrintRefPath := ini_fun.ReadString('ȯ�漳��','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('�Ⱓ�����º���','��������','D2DATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('�Ⱓ�����º���','������ġ',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmD2DATReport.btn_SearchClick(Sender: TObject);
begin
  SearchATReport('',False);
end;

procedure TfmD2DATReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmD2DATReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATReport.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATReport.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATReport.Load_ATInCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Box.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('��ü')
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

procedure TfmD2DATReport.Load_ATOutCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
var
  stSql : string;
begin
  ATOutCodeList.Clear;
  ATOutTypeList.Clear;
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('��ü')
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

function TfmD2DATReport.SearchATReport(aCode: string;bAdd:Boolean): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
  stLeaveTime,stBackTime : string;
  nInfromMM,nExtendMM,nNightMM,nRealMM:integer;
  nInfromAMT,nExtendAMT,nNightAMT:integer;
  nCount,nLeaveCount,nBackCount:integer;
begin
  result := False;
  nInfromMM := 0;
  nExtendMM := 0;
  nNightMM := 0;
  nRealMM := 0;
  nInfromAMT := 0;
  nExtendAMT := 0;
  nNightAMT := 0;
  nCount:= 0;
  nLeaveCount:= 0;
  nBackCount:= 0;

  if Not bAdd then
  begin
    RowGridInitialize(sg_Report);
  end;
  if G_nCompanyCodeType = 1 then  //�Ϲ����� ����
  begin
    if DBTYPE = 'MSSQL' then
      stSql := MSSQL.SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else if DBType = 'PG' then
      stSql := PostGreSql.SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else if DBType = 'MDB' then
      stSql := MDBSql.SelectTB_EMPLOYEEJoinATDAYSUMMARYDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else Exit;
  end else
  begin
    if DBTYPE = 'MSSQL' then
      stSql := MSSQL.SelectTB_ATDAYSUMMARYJoinEMPLOYEEDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else if DBType = 'PG' then
      stSql := PostGreSql.SelectTB_ATDAYSUMMARYJoinEMPLOYEEDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else if DBType = 'MDB' then
      stSql := MDBSql.SelectTB_ATDAYSUMMARYJoinEMPLOYEEDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
    else Exit;
  end;


  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� ȸ�� ������ �����ϴ�.');
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
        showmessage('������ �Ҽ� ȸ���ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� ���� ������ �����ϴ�.');
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
        showmessage('������ �Ҽ� ȸ���ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('������ �Ҽ� �����ڵ尡 �̻��մϴ�.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('�����Ҽ� �ִ� �μ� ������ �����ϴ�.');
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
  begin
    if G_nCompanyCodeType = 1 then  //�Ϲ����� ����
    begin
      stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
    end else
    begin
      stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
    end;
  end;
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  if cmb_AtIntype.ItemIndex > 0 then //��� Ÿ�� ���ý�
  begin
    if ATINCodeList.Strings[cmb_AtIntype.ItemIndex] = '003' then //��� ���ý�
    begin
      stSql := stSql + ' AND ( f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
      stSql := stSql + ' OR f.AT_INCODE IS NULL ) ';
    end else stSql := stSql + ' AND f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
  end;
  if cmb_AtOuttype.ItemIndex > 0 then //��� Ÿ�� ���ý�
  begin
    stSql := stSql + ' AND f.AT_OUTCODE = ''' + ATOUTCodeList.Strings[cmb_AtOuttype.ItemIndex]  + ''' ';
  end;

  if G_nCompanyCodeType = 1 then  //�Ϲ����� ����
  begin
    stSql := stSql + ' Order By b.AT_DATE,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';
  end else
  begin
    stSql := stSql + ' Order By a.AT_DATE,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';
  end;

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
      showmessage('��ȸ�� �����Ͱ� �����ϴ�.���������۾��� ��ȸ �����մϴ�.');
      Exit;
    end;
    nCount:= RecordCount;
    if Not bAdd then
    begin
      nRow := 1;
      sg_report.RowCount := RecordCount + 1;
    end else
    begin
      nRow := sg_Report.RowCount;
      sg_report.RowCount := sg_report.RowCount + RecordCount;
    end;
    While Not Eof do
    begin
      if Not chk_Min.Checked then
      begin
        stInTime := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                    copy(FindField('AT_INTIME').AsString,11,2) + ':' +
                    copy(FindField('AT_INTIME').AsString,13,2) ;
        stOutTime := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                     copy(FindField('AT_OUTTIME').AsString,11,2) + ':' +
                     copy(FindField('AT_OUTTIME').AsString,13,2) ;
        stLeaveTime := copy(FindField('AT_LEAVETIME').AsString,9,2) + ':' +
                    copy(FindField('AT_LEAVETIME').AsString,11,2) + ':' +
                    copy(FindField('AT_LEAVETIME').AsString,13,2) ;
        stBackTime := copy(FindField('AT_BACKTIME').AsString,9,2) + ':' +
                     copy(FindField('AT_BACKTIME').AsString,11,2) + ':' +
                     copy(FindField('AT_BACKTIME').AsString,13,2) ;
      end else
      begin
        stInTime := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                    copy(FindField('AT_INTIME').AsString,11,2) ;
        stOutTime := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                     copy(FindField('AT_OUTTIME').AsString,11,2) ;
        stLeaveTime := copy(FindField('AT_LEAVETIME').AsString,9,2) + ':' +
                    copy(FindField('AT_LEAVETIME').AsString,11,2) ;
        stBackTime := copy(FindField('AT_BACKTIME').AsString,9,2) + ':' +
                     copy(FindField('AT_BACKTIME').AsString,11,2) ;
      end;
      if Trim(FindField('AT_LEAVETIME').AsString) <> '' then inc(nLeaveCount);
      if Trim(FindField('AT_BACKTIME').AsString) <> '' then inc(nBackCount);

      with sg_Report do
      begin
        Cells[0,nRow] := FindField('AT_DATE').AsString;
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('PO_NAME').AsString;
        Cells[5,nRow] := FindField('EM_CODE').AsString;
        Cells[6,nRow] := FindField('EM_NAME').AsString;
        Cells[7,nRow] := stInTime;
        Cells[8,nRow] := stLeaveTime;
        Cells[9,nRow] := stBackTime;
        Cells[10,nRow] := stOutTime;
        Cells[11,nRow] := FindField('AT_INNAME').AsString;
        Cells[12,nRow] := FindField('AT_OUTNAME').AsString;
        Cells[13,nRow] := FindField('AT_CODENAME').AsString;  //�ٹ�Ÿ��
        nInfromMM := nInfromMM + FindField('AT_INFROMMM').AsInteger;
        Cells[14,nRow] := MinuteToString(FindField('AT_INFROMMM').AsInteger);
        nExtendMM := nExtendMM + FindField('AT_EXTENDMM').AsInteger;
        Cells[15,nRow] := MinuteToString(FindField('AT_EXTENDMM').AsInteger);
        nNightMM := nNightMM + FindField('AT_NIGHTMM').AsInteger;
        Cells[16,nRow] := MinuteToString(FindField('AT_NIGHTMM').AsInteger);
        nRealMM := nRealMM + FindField('AT_REALATTIMEMM').AsInteger;
        Cells[17,nRow] := MinuteToString(FindField('AT_REALATTIMEMM').AsInteger);
        nInfromAMT := nInfromAMT + FindField('AT_INFROMAMT').AsInteger;
        Cells[18,nRow] := WonStringFormat(FindField('AT_INFROMAMT').AsString);
        nExtendAMT := nExtendAMT + FindField('AT_EXTENDAMT').AsInteger;
        Cells[19,nRow] := WonStringFormat(FindField('AT_EXTENDAMT').AsString);
        nNightAMT := nNightAMT + FindField('AT_NIGHTAMT').AsInteger;
        Cells[20,nRow] := WonStringFormat(FindField('AT_NIGHTAMT').AsString);
        Cells[21,nRow] := FindField('AT_CONTENT').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
    //�հ� �Է�
    with sg_Report do
    begin
      RowCount := RowCount + 1;
      nRow := RowCount - 1;
      Cells[0,nRow] := '�հ�';
      Cells[6,nRow] := WonStringFormat(inttostr(nCount)) + '��';
      Cells[8,nRow] := WonStringFormat(inttostr(nLeaveCount)) + '��';     //����
      Cells[9,nRow] := WonStringFormat(inttostr(nBackCount)) + '��';     //����
      Cells[14,nRow] := MinuteToString(nInfromMM) ;
      Cells[15,nRow] := MinuteToString(nExtendMM) ;
      Cells[16,nRow] := MinuteToString(nNightMM);
      Cells[17,nRow] := MinuteToString(nRealMM);
      Cells[18,nRow] := WonStringFormat(inttostr(nInfromAMT)) + '��';
      Cells[19,nRow] := WonStringFormat(inttostr(nExtendAMT)) + '��';
      Cells[20,nRow] := WonStringFormat(inttostr(nNightAMT)) + '��'; 

    end;
  end;

end;


function TfmD2DATReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '�˻��Ⱓ : ' + FormatDateTime('yyyy-mm-dd',dt_startDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_endDate.Date) ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / ȸ�� : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / ���� : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / �μ� : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / ���� : ' + cmb_Posi.text ;
  if cmb_AtIntype.ItemIndex > 0 then
    stTitle := stTitle + ' / ������� : ' + cmb_AtIntype.text ;
  if cmb_AtOuttype.ItemIndex > 0 then
    stTitle := stTitle + ' / ������� : ' + cmb_AtOuttype.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / ��� : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / �̸� : ' + ed_name.text ;

  Result := stTitle;
end;



procedure TfmD2DATReport.btn_ExcelClick(Sender: TObject);
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
    showmessage('���ϻ��� �Ϸ�');
  end;    }
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('ȯ�漳��','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('�Ⱓ�����º���','��������','D2DATReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('�Ⱓ�����º���','������ġ',6);
  ini_fun.Free;

  aFileName:='�Ⱓ�����º���';
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
      //showmessage('���ϻ��� �Ϸ�');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True; }
end;

procedure TfmD2DATReport.sg_reportResize(Sender: TObject);
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

procedure TfmD2DATReport.btnAddSearchClick(Sender: TObject);
begin
  inherited;
  SearchATReport('',True);

end;

initialization
  RegisterClass(TfmD2DATReport);
Finalization
  UnRegisterClass(TfmD2DATReport);


end.
