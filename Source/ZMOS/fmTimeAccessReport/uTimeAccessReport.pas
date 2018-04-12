unit uTimeAccessReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Gauges, ExtCtrls, Grids, BaseGrid,
  AdvGrid, uSubForm, CommandArray,ComObj, DB, ADODB,iniFiles, AdvObj,
  RzCmboBx;

type
  TfmTimeAccessReport = class(TfmASubForm)
    sg_AccessReport: TAdvStringGrid;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    lb_Name: TLabel;
    lb_Position: TLabel;
    Label4: TLabel;
    lb_emType: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_name: TEdit;
    cmb_AccessPermit: TComboBox;
    cmb_Type: TComboBox;
    cmb_EmType: TComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt_FromDate: TDateTimePicker;
    ed_startTime: TEdit;
    ed_endTime: TEdit;
    Label2: TLabel;
    AdoQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    rg_Gubun: TRadioGroup;
    dt_ToDate: TDateTimePicker;
    cmb_Position: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_PositionChange(Sender: TObject);
    procedure cmb_AccessPermitChange(Sender: TObject);
    procedure sg_AccessReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_TypeChange(Sender: TObject);
    procedure rg_GubunClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    DeviceCodeList : TStringList;
    PermitCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    DoorGubunCodeList : TStringList;
    { Private declarations }
    procedure FormNameSet;
    procedure LoadType;
    procedure GetDoorName(cmb_box :TComboBox);
    procedure LoadDoorGubun(cmb_box :TComboBox);
    procedure GetAccessPermit(cmb_box :TComboBox);
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmTimeAccessReport: TfmTimeAccessReport;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uCompanyCodeLoad, uFireBird, uExcelSave;

{$R *.dfm}



procedure TfmTimeAccessReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'TimeAccessReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  DeviceCodeList.Free;
  PermitCodeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EmpTypeCodeList.Free;
  DoorGubunCodeList.Free;

  Action := caFree;

end;

procedure TfmTimeAccessReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
  PermitCodeList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
  DoorGubunCodeList := TStringList.Create;

end;

procedure TfmTimeAccessReport.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
//  lb_Sabun.Caption := FM101;
//  lb_Name.Caption := FM102;
  with sg_AccessReport do
  begin
    cells[6,0] := FM002;
    cells[7,0] := FM012;
    cells[8,0] := FM022;
    cells[9,0] := FM032;
    cells[10,0] := FM101;
    cells[11,0] := FM102;
    cells[14,0] := FM103;

  end;

end;

procedure TfmTimeAccessReport.GetAccessPermit(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  PermitCodeList.Clear;
  cmb_Box.Items.Add('전체');
  PermitCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select * From TB_PERMITCODE ';
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
      cmb_Box.Items.Add(FindField('PE_PERMITNAME').AsString);
      PermitCodeList.Add(FindField('PE_PERMITCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmTimeAccessReport.GetDoorName(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  DeviceCodeList.Clear;
  cmb_box.Items.Add('전체');
  DeviceCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.DO_VIEWSEQ ';
  stsql := stSql + ' From TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

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
      cmb_Box.Items.Add(FindField('DO_DOORNONAME').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)
                       + FindField('AC_ECUID').AsString
                       + FindField('DO_DOORNO').AsString);
      Next;
    end;
  end;

end;

function TfmTimeAccessReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ' + ed_startTime.Text + '~' + ed_endTime.Text ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / 직위 : ' + cmb_Posi.text ;
  if cmb_Type.ItemIndex <> 2 then
  begin
    if Trim(ed_name.Text) <> '' then
      stTitle := stTitle  + ' / ' + lb_Name.Caption + ' : ' + ed_name.text ;
  end else
  begin
    if cmb_EmType.ItemIndex > 0 then
      stTitle := stTitle  + ' / ' + lb_Name.Caption + ' : ' + cmb_EmType.text ;
  end;
  if cmb_Position.ItemIndex > 0 then
    stTitle := stTitle + ' / 출입문 : ' + cmb_Position.text ;
  if cmb_AccessPermit.ItemIndex > 0 then
    stTitle := stTitle + ' / 승인구분 : ' + cmb_AccessPermit.text ;

  Result := stTitle;
end;

procedure TfmTimeAccessReport.LoadType;
begin
  with cmb_Type do
  begin
    Clear;
    Items.Add(FM101); //사번
    Items.Add(FM102); //이름
    Items.Add(FM042); //직원구분
    Items.Add('카드번호'); //직원구분
    ItemIndex := 0;
  end;
  cmb_TypeChange(cmb_Type);

end;

procedure TfmTimeAccessReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stDoorNo,stPermitCode:string;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode:string;
  stEmCode,stEmName,stEmTypeCode:string;
  stStartTime : string;
  stEndTime : string;
  bDoorGubun : Boolean;
  stDoorGubunCode : string;
  stDoorPosi : string;
  stCardNo : string;
begin
  GridInitialize(sg_AccessReport);

  stNodeNo:='';
  stEcuID:= '';
  stDoorNo:= '';
  stPermitCode:= '';
  stCompanyCode:='';
  stJijumCode:='';
  stDepartCode:='';
  stPosiCode:='';
  stEmCode:= '';
  stEmName:= '';
  stEmTypeCode := '';
  stCardNo := '';
  if cmb_Type.ItemIndex = 0 then //사번
    stEmCode := ed_Name.Text
  else if cmb_Type.ItemIndex = 1 then //이름
    stEmName := ed_Name.Text
  else if cmb_Type.ItemIndex = 2 then //직원구분
  begin
    if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];
  end else if cmb_Type.ItemIndex = 3 then //카드번호
  begin
    stCardNo := ed_Name.Text;
  end;

  if Not isDigit(ed_startTime.Text) then
  begin
    showmessage('시작 시간은 숫자만 입력 하세요.');
    ed_startTime.SetFocus;
    Exit;
  end;
  if Not isDigit(ed_endTime.Text) then
  begin
    showmessage('종료 시간은 숫자만 입력 하세요.');
    ed_endTime.SetFocus;
    Exit;
  end;

  if Length(ed_startTime.Text) <> 4 then
  begin
    showmessage('시작 시간은 hhnn 타입의 4자리 숫자입니다.');
    ed_startTime.SetFocus;
    Exit;
  end;
  if Length(ed_endTime.Text) <> 4 then
  begin
    showmessage('종료 시간은 hhnn 타입의 4자리 숫자입니다.');
    ed_endTime.SetFocus;
    Exit;
  end;

  if cmb_Company.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  end;
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    stCompanyCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3);
    stJijumCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3);
    stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  end;
  if cmb_Posi.ItemIndex > 0 then
  begin
    stCompanyCode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],1,3);
    stPosiCode := copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3);
  end;
  if rg_Gubun.ItemIndex = 0 then
  begin
    bDoorGubun := False;
    if cmb_Position.ItemIndex > 0 then
    begin
      stNodeNo := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
      stEcuID := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
      stDoorNo := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],6,1) ;
    end;
  end else
  begin
    bDoorGubun := True;
    if cmb_Position.ItemIndex > 0 then
    begin
      stDoorGubunCode := DoorGubunCodeList.Strings[cmb_Position.ItemIndex];
    end;
  end;
  if cmb_AccessPermit.ItemIndex > 0 then
  begin
    stPermitCode := PermitCodeList.Strings[cmb_AccessPermit.ItemIndex] ;
  end;

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectTB_ACCESSEVENTFromDayToTime(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          ed_startTime.Text,ed_endTime.Text,stNodeNo,stEcuID,stDoorNo,stDoorGubunCode,stPermitCode,
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmCode,stEmName,stEmTypeCode,bDoorGubun)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectTB_ACCESSEVENTFromDayToTime(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          ed_startTime.Text,ed_endTime.Text,stNodeNo,stEcuID,stDoorNo,stDoorGubunCode,stPermitCode,
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmCode,stEmName,stEmTypeCode,bDoorGubun)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectTB_ACCESSEVENTFromDayToTime(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          ed_startTime.Text,ed_endTime.Text,stNodeNo,stEcuID,stDoorNo,stDoorGubunCode,stPermitCode,
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmCode,stEmName,stEmTypeCode,bDoorGubun)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectTB_ACCESSEVENTFromDayToTime(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          ed_startTime.Text,ed_endTime.Text,stNodeNo,stEcuID,stDoorNo,stDoorGubunCode,stPermitCode,
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmCode,stEmName,stEmTypeCode,bDoorGubun)
  else Exit;
  if stCardNo <> '' then
  begin
    stSql := stSql + ' AND a.CA_CARDNO = ''' + stCardNo + ''' ';
  end;          

  stSql := stSql + ' Order by a.AC_DATE,a.AC_TIME ';
  //memo1.Lines.Text := stSql;
  //Exit;
  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '조회건수:' + numberformat(inttostr(recordcount)) + '건';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

    if RecordCount < 1 then
    begin
      showmessage('출입이력이 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_AccessReport.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_AccessReport  do
      begin
        if FindField('AC_DOORPOSI').AsString = '0' then stDoorPosi := '내부'
        else stDoorPosi := '외부';
        cells[0,nRow] := copy(FindField('AC_DATE').AsString,1,4) + '-' + copy(FindField('AC_DATE').AsString,5,2)
                         + '-' + copy(FindField('AC_DATE').AsString,7,2);
        cells[1,nRow] := copy(FindField('AC_TIME').AsString,1,2)
                         + ':' + copy(FindField('AC_TIME').AsString,3,2)
                         + ':' + copy(FindField('AC_TIME').AsString,5,2);   //발생시각
        cells[2,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[3,nRow] := FindField('AC_READERNO').AsString;
        cells[4,nRow] := stDoorPosi;
        cells[5,nRow] := FindField('CA_CARDNO').AsString;
        cells[6,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[7,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[8,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[9,nRow] := FindField('PO_NAME').AsString;
        cells[10,nRow] := FindField('EM_CODE').AsString;
        cells[11,nRow] := FindField('EM_NAME').AsString;
        cells[12,nRow] := FindField('PE_PERMITNAME').AsString;
        cells[13,nRow] := FindField('CT_NAME').AsString;
        cells[14,nRow] := FindField('EM_COPHONE').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmTimeAccessReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기간별출입보고서','참조파일','D2DACReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('기간별출입보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='기간별출입보고서';
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
        dmExcelSave.ExcelPrintOut(sg_AccessReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_AccessReport.SaveToCSV(stSaveFileName);
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
      if Not ExcelPrintOut(sg_AccessReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
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

procedure TfmTimeAccessReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기간별출입보고서','참조파일','D2DACReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('기간별출입보고서','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_AccessReport,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmTimeAccessReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmTimeAccessReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);

end;

procedure TfmTimeAccessReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmTimeAccessReport.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmTimeAccessReport.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmTimeAccessReport.cmb_PositionChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmTimeAccessReport.cmb_AccessPermitChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmTimeAccessReport.sg_AccessReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_AccessReport.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmTimeAccessReport.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  ed_startTime.Text := '0000';
  ed_endTime.Text := '2400';
  GetDoorName(TComboBox(cmb_Position));
  GetAccessPermit(cmb_AccessPermit);
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  LoadType;

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

  FormNameSet;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'TimeAccessReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmTimeAccessReport.cmb_TypeChange(Sender: TObject);
begin
  lb_Name.Caption := cmb_Type.Text;
  if cmb_Type.ItemIndex <> 2 then
  begin
    cmb_EmType.Visible := False;
    ed_Name.Visible := True;
  end else
  begin
    cmb_EmType.Visible := True;
    ed_Name.Visible := False;
    LoadEmpType(EmpTypeCodeList,cmb_EmType);
  end;

end;


procedure TfmTimeAccessReport.rg_GubunClick(Sender: TObject);
begin
  if rg_Gubun.ItemIndex = 0 then
  begin
    GetDoorName(TComboBox(cmb_Position));
    lb_Position.Caption := '출입문명칭';
    sg_AccessReport.Cells[0,0] := '출입문명칭';
  end else
  begin
    LoadDoorGubun(TComboBox(cmb_Position));
    lb_Position.Caption := '출입문구분';
    sg_AccessReport.Cells[0,0] := '출입문구분';
  end;

end;

procedure TfmTimeAccessReport.LoadDoorGubun(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  DoorGubunCodeList.Clear;
  cmb_Box.Items.Add('전체');
  DoorGubunCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select * From TB_DOORGUBUN ';
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
      cmb_Box.Items.Add(FindField('DG_NAME').AsString);
      DoorGubunCodeList.Add(FindField('DG_CODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmTimeAccessReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmTimeAccessReport);
Finalization
  UnRegisterClass(TfmTimeAccessReport);


end.
