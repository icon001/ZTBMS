unit uD2DATHistoryReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, uSubForm, CommandArray, DB, ADODB,iniFiles,ComObj,ActiveX;

type
  TfmD2DATHistoryReport = class(TfmASubForm)
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
    GroupBox3: TGroupBox;
    ADOQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    sg_report: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    ATINCodeList : TStringList;
    ATINTypeList : TStringList;
    ATOutCodeList : TStringList;
    ATOutTypeList : TStringList;
    L_nDeviceType : integer;
    { Private declarations }
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Function SearchATHistoryReport(aCode : string):Boolean;
    Function GetTitle : String;
    Function GetConfig:Boolean;
  public
    { Public declarations }
  end;

var
  fmD2DATHistoryReport: TfmD2DATHistoryReport;

implementation

uses
     uDataModule1,
     uCompanyCodeLoad,
     uLomosUtil,
     uMssql,
     uPostGreSql,
     uMDBSql,
     uCommonSql, uExcelSave;

{$R *.dfm}



{ TfmD2DATHistoryReport }

function TfmD2DATHistoryReport.GetTitle: String;
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
  if cmb_AtIntype.ItemIndex > 0 then
    stTitle := stTitle + ' / 출근형태 : ' + cmb_AtIntype.text ;
  if cmb_AtOuttype.ItemIndex > 0 then
    stTitle := stTitle + ' / 퇴근형태 : ' + cmb_AtOuttype.text ;
  if Trim(ed_empNo.Text) <> '' then
    stTitle := stTitle  + ' / 사번 : ' + ed_empNo.text ;
  if Trim(ed_name.Text) <> '' then
    stTitle := stTitle  + ' / 이름 : ' + ed_name.text ;

  Result := stTitle;
end;

procedure TfmD2DATHistoryReport.Load_ATInCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
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

procedure TfmD2DATHistoryReport.Load_ATOutCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
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

function TfmD2DATHistoryReport.SearchATHistoryReport(aCode: string): Boolean;
var
  stSql : string;
  stTime : string;
  stState : string;
  stGubun : string;
  i : integer;
  nRow : integer;
begin

  RowGridInitialize(sg_Report);

  if DBTYPE = 'MDB' then  stSql := MDBSQL.SelectTB_EMPLOYEEJoinACEventDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinACEventDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinACEventDayToDay(FormatDateTime('yyyymmdd',dt_startDate.Date),FormatDateTime('yyyymmdd',dt_endDate.Date))
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

  stSql := stSql + ' Order By c.AC_DATE,c.AC_TIME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

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

    sg_report.RowCount := RecordCount + 1;
    nRow := 1;
    While Not Eof do
    begin
      stTime :=   copy(FindField('AC_DATE').AsString,1,4) + '-' +
                  copy(FindField('AC_DATE').AsString,5,2) + '-' +
                  copy(FindField('AC_DATE').AsString,7,2) + ' ' +
                  copy(FindField('AC_TIME').AsString,1,2) + ':' +
                  copy(FindField('AC_TIME').AsString,3,2) + ':' +
                  copy(FindField('AC_TIME').AsString,5,2) ;
      stState := '0';
      if L_nDeviceType = 1 then //리더번호
      begin
        stState := FindField('AC_READERNO').AsString;
      end else if L_nDeviceType = 2 then //버튼...일때에도 리더번호에다 넣었음
      begin
        if Not isDigit(FindField('AC_BUTTONNO').AsString) then  //SCR에서는 버튼번호를 버튼 구분으로 삼았음(B 버튼,C카드)
          stState := FindField('AC_READERNO').AsString
        else stState := FindField('AC_BUTTONNO').AsString;
      end;
      if Not IsDigit(stState) then stState := '0';
      case stState[1] of
        INBUTTON : begin
          stState := '출근';
        end;
        OUTBUTTON : begin
          stState := '퇴근';
        end;
        LEAVEBUTTON : begin
          stState := '외근';
        end;
        BACKBUTTON : begin
          stState := '복귀';
        end;
      end;
      stGubun := '카드';
      if FindField('AC_BUTTONNO').AsString = 'B' then stGubun := '버튼';

      with sg_Report do
      begin
        Cells[0,nRow] := stTime;
        Cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        Cells[2,nRow] := stState;
        Cells[3,nRow] := FindField('COMPANYNAME').AsString;
        Cells[4,nRow] := FindField('JIJUMNAME').AsString;
        Cells[5,nRow] := FindField('DEPARTNAME').AsString;
        Cells[6,nRow] := FindField('PO_NAME').AsString;
        Cells[7,nRow] := FindField('EM_CODE').AsString;
        Cells[8,nRow] := FindField('EM_NAME').AsString;
        Cells[9,nRow] := stGubun;
        Cells[10,nRow] := FindField('CA_CARDNO').AsString;
        Cells[11,nRow] := FindField('CO_COMPANYCODE').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;

  end;
 
end;

procedure TfmD2DATHistoryReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmD2DATHistoryReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_startDate.Date := Now;
  dt_endDate.Date := Now;

  GridInitialize(sg_report as TStringGrid);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  Load_ATInCode(cmb_AtIntype,True);
  Load_ATOutCode(cmb_AtOuttype,True);

  GetConfig;

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

procedure TfmD2DATHistoryReport.FormCreate(Sender: TObject);
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

procedure TfmD2DATHistoryReport.FormClose(Sender: TObject;
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

procedure TfmD2DATHistoryReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);

end;

procedure TfmD2DATHistoryReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기간별근태이력보고서','참조파일','D2DATHistoryReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('기간별근태이력보고서','시작위치',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;
end;

procedure TfmD2DATHistoryReport.btn_SearchClick(Sender: TObject);
begin
  SearchATHistoryReport('');
end;

procedure TfmD2DATHistoryReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmD2DATHistoryReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATHistoryReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATHistoryReport.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmD2DATHistoryReport.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;


procedure TfmD2DATHistoryReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기간별근태이력보고서','참조파일','D2DATHistoryReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('기간별근태이력보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='기간별근태이력보고서';
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
  btn_Excel.Enabled := True;  }
end;

function TfmD2DATHistoryReport.GetConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    stSql := commonSql.GetTB_CONFIGGroupSelect('ATTEND');
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    First;
    if RecordCount > 0 then
    begin
      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
          L_nDeviceType := strtoint(FindField('CO_CONFIGVALUE').Asstring );
        next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
  Result := True;
end;

initialization
  RegisterClass(TfmD2DATHistoryReport);
Finalization
  UnRegisterClass(TfmD2DATHistoryReport);

end.
