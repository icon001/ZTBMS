unit uNotCardReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, uSubForm, CommandArray, DB, ADODB,iniFiles,ComObj, AdvObj;

type
  TfmNotCardReport = class(TfmASubForm)
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
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    dt_Date: TDateTimePicker;
    sg_Report: TAdvStringGrid;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    AdoQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    Panel2: TPanel;
    Label2: TLabel;
    cmb_CardState: TComboBox;
    Panel3: TPanel;
    btn_CardStop: TSpeedButton;
    Panel4: TPanel;
    btn_CardDelete: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_ReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_ReportCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_CardStopClick(Sender: TObject);
    procedure btn_CardDeleteClick(Sender: TObject);
    procedure cmb_CardStateChange(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    CheckCount : integer;
    { Private declarations }
    procedure FormNameSet;
    Function GetTitle : String;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);

    procedure CardStop(aCardNo,aCompanyCode,aEmpID,aFdmsID,aEmpNM,
          aCompanyName,aJijumName,aDepartName:string);
    Function updateTB_CARDState(aCardNo,aState:string):Boolean;
    Function updateTB_DEVICECARDNOStop(aCardNo:string):Boolean;
    procedure CardDelete(aCardNo,aCompanyCode,aEmpID,aFdmsID,aEmpNM,
          aCompanyName,aJijumName,aDepartName:string);

    Function DeleteTB_CARD(aCardNo:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmNotCardReport: TfmNotCardReport;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uCompanyCodeLoad,
  uFireBird,
  uCommonSql,
  uUser, udmAdoQuery, uExcelSave;

{$R *.dfm}

procedure TfmNotCardReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NotCardReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;

  Action := caFree;
end;

procedure TfmNotCardReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  GridInit(sg_Report,9,2,True);
end;

procedure TfmNotCardReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode:string;
  stCardState : string;
begin
  GridInit(sg_Report,9,2,True);

  CheckCount := 0;

  stCompanyCode:='000';
  stJijumCode:='000';
  stDepartCode:='000';
  stPosiCode:='000';

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


  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectNotCardReport(FormatDateTime('yyyymmdd',dt_Date.Date),
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectNotCardReport(FormatDateTime('yyyymmdd',dt_Date.Date),
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectNotCardReport(FormatDateTime('yyyymmdd',dt_Date.Date),
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectNotCardReport(FormatDateTime('yyyymmdd',dt_Date.Date),
                          stCompanyCode,stJijumCode,stDepartCode,stPosiCode)
  else Exit;
  if cmb_CardState.ItemIndex > 0 then
    stSql := stSql + ' AND a.CA_CARDTYPE = ''' + inttostr(cmb_CardState.ItemIndex) + ''' ';
  stSql := stSql + ' order by a.CO_COMPANYCODE,a.EM_CODE ';

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
      //showmessage('미사용카드내역이 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_Report.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      if FindField('CA_CARDTYPE').AsString = '1' then stCardState := '등록'
      else if FindField('CA_CARDTYPE').AsString = '2' then stCardState := '정지'
      else if FindField('CA_CARDTYPE').AsString = '3' then stCardState := '분실'
      else if FindField('CA_CARDTYPE').AsString = '4' then stCardState := '기타';

      with sg_Report  do
      begin
        cells[0,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[1,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[2,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[3,nRow] := FindField('PO_NAME').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;
        cells[6,nRow] := FindField('CA_CARDNO').AsString;
        cells[7,nRow] := stCardState;
        cells[8,nRow] := FindField('CA_LASTUSE').AsString;
        cells[9,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[10,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[11,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[12,nRow] := inttostr(FindField('FDMS_ID').AsInteger);
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmNotCardReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('카드미사용자보고서','참조파일','NOTCardReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('카드미사용자보고서','시작위치',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;
end;

procedure TfmNotCardReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmNotCardReport.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
  with sg_Report do
  begin
    cells[0,0] := FM002;
    cells[1,0] := FM012;
    cells[2,0] := FM022;
    cells[3,0] := FM032;
    cells[4,0] := FM101;
    cells[5,0] := FM102;

  end;

end;

procedure TfmNotCardReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);

end;

procedure TfmNotCardReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmNotCardReport.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmNotCardReport.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmNotCardReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('카드미사용자보고서','참조파일','NOTCardReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('카드미사용자보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='카드미사용자보고서';
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
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True; }
end;

function TfmNotCardReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '최종사용일 : ' + FormatDateTime('yyyy-mm-dd',dt_Date.Date) ;
  if cmb_Company.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_Company.Text ;
  if cmb_Jijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_Jijum.text ;
  if cmb_Depart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_Depart.text ;
  if cmb_Posi.ItemIndex > 0 then
    stTitle := stTitle + ' / 직위 : ' + cmb_Posi.text ;

  Result := stTitle;
end;

procedure TfmNotCardReport.sg_ReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_Report.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmNotCardReport.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

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

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NotCardReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;


procedure TfmNotCardReport.sg_ReportCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmNotCardReport.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmNotCardReport.btn_CardStopClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stCardNo : string;
  bUserOk : Boolean;
  stUserName : string;
  stUserPhone : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('정지할 카드를 선택하여 주세요.');
    Exit;
  end;

  if (Application.MessageBox(PChar('카드 정지시 모든 권한이 삭제됩니다. 계속하시겠습니까?'),'경고',MB_OKCANCEL) = IDCANCEL)  then Exit;

  fmUser := TfmUser.Create(self);
  fmUser.st_msg.Caption := #10#13 + '카드 정지시 모든 권한이 삭제 되어 권한을 복구 할 수 없습니다.' + #10#13 +
                         '계속 진행 하시려면 작업자 이름과 전화번호를 입력 후 확인 버튼을 클릭 하시면 됩니다.';
  fmUser.ShowModal;
  bUserOk := fmUser.L_bOK;
  stUserName := fmUser.ed_name.Text;
  stUserPhone := fmUser.ed_Phone.Text;
  fmUser.Free;

  if Not bUserOk then Exit;
  if Length(stUserName) > 20 then stUserName := copy(stUserName,1,20);
  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0',stUserName , '미사용카드정지' + stUserPhone);

  btn_CardStop.Enabled := False;
  with sg_Report do
  begin
    pan_gauge.Visible := True;
    Label1.Caption := '카드 데이터 정지 작업중입니다.';
    Gauge1.MaxValue := RowCount - 1;
    for i := 1 to RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
    begin
      Gauge1.Progress := i;
      GetCheckBoxState(0,i, bchkState);

      if bchkState then
      begin
        CardStop(Cells[6,i],Cells[9,i],Cells[4,i],Cells[12,i],Cells[5,i],
                 Cells[0,i],Cells[1,i],Cells[2,i]);
        DataModule1.TB_SYSTEMLOGInsert('000','00','0','0',Cells[6,i] , '미사용카드정지');
      end;

    end;
    pan_gauge.Visible := False;
  end;
  dmAdoQuery.NotGradePermitDelete;
  btn_CardStop.Enabled := True;
  btn_SearchClick(self);
  showmessage('선택 카드를 모두 정지 하였습니다.');
end;

procedure TfmNotCardReport.CardStop(aCardNo,aCompanyCode,aEmpID,aFdmsID,aEmpNM,
          aCompanyName,aJijumName,aDepartName: string);
var
  stSql : string;
begin
  updateTB_CARDState(aCardNo,'2');
  updateTB_DEVICECARDNOStop(aCardNo);

  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'2',aCardNo,'2',
           aEmpNM,'',aCompanyName,aJijumName,aDepartName,'');//수정
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'NotCardReport','2');
  DataModule1.ProcessExecSQL(stSql);
end;

function TfmNotCardReport.updateTB_CARDState(aCardNo,
  aState: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set CA_CARDTYPE = ''' + aState + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmNotCardReport.updateTB_DEVICECARDNOStop(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO ';
  stSql := stSql + ' set DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmNotCardReport.btn_CardDeleteClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stCardNo : string;
  bUserOk : Boolean;
  stUserName : string;
  stUserPhone : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('삭제할 카드를 선택하여 주세요.');
    Exit;
  end;

  if (Application.MessageBox(PChar('카드 삭제시 모든 정보가 삭제됩니다. 계속하시겠습니까?'),'경고',MB_OKCANCEL) = IDCANCEL)  then Exit;

  fmUser := TfmUser.Create(self);
  fmUser.st_msg.Caption := #10#13 + '카드 삭제시 모든 정보가 삭제 되어 복구 할 수 없습니다.' + #10#13 +
                         '계속 진행 하시려면 작업자 이름과 전화번호를 입력 후 확인 버튼을 클릭 하시면 됩니다.';
  fmUser.ShowModal;
  bUserOk := fmUser.L_bOK;
  stUserName := fmUser.ed_name.Text;
  stUserPhone := fmUser.ed_Phone.Text;
  fmUser.Free;

  if Not bUserOk then Exit;
  if Length(stUserName) > 20 then stUserName := copy(stUserName,1,20);
  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0',stUserName , '미사용카드삭제' + stUserPhone);

  btn_CardDelete.Enabled := False;
  with sg_Report do
  begin
    pan_gauge.Visible := True;
    Label1.Caption := '카드 데이터 삭제 작업중입니다.';
    Gauge1.MaxValue := RowCount - 1;
    for i := 1 to RowCount - 1 do   //체크되어 있는 사용자 모두를 삭제 시킴
    begin
      Gauge1.Progress := i;
      GetCheckBoxState(0,i, bchkState);

      if bchkState then
      begin
        CardDelete(Cells[6,i],Cells[9,i],Cells[4,i],Cells[12,i],Cells[5,i],
                 Cells[0,i],Cells[1,i],Cells[2,i]);
        DataModule1.TB_SYSTEMLOGInsert('000','00','0','0',Cells[6,i] , '미사용카드삭제');
      end;

    end;
    pan_gauge.Visible := False;
  end;
  btn_CardDelete.Enabled := True;
  btn_SearchClick(self);
  showmessage('선택 카드를 모두 삭제 하였습니다.');
end;

procedure TfmNotCardReport.CardDelete(aCardNo, aCompanyCode, aEmpID,
  aFdmsID, aEmpNM, aCompanyName, aJijumName, aDepartName: string);
var
  stSql : string;
begin
  dmAdoQuery.DeleteTB_EMPLOYEE(aEmpID,aCompanyCode,aCardNo);
  DeleteTB_CARD(aCardNo);

  (*
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,aFdmsID,'3',aCardNo,'2',
           aEmpNM,'',aCompanyName,aJijumName,aDepartName,'');//삭제
  DataModule1.ProcessExecSQL(stSql);

  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'NotCardReport','3');
  DataModule1.ProcessExecSQL(stSql);
  *)
end;

function TfmNotCardReport.DeleteTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;


procedure TfmNotCardReport.cmb_CardStateChange(Sender: TObject);
begin

  if cmb_CardState.ItemIndex < 2 then btn_CardDelete.Visible := False
  else btn_CardDelete.Visible := True;

  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);
end;

procedure TfmNotCardReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmNotCardReport);
Finalization
  UnRegisterClass(TfmNotCardReport);

end.
