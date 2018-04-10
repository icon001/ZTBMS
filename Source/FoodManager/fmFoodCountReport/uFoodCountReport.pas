unit uFoodCountReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  uSubForm, CommandArray, AdvEdit, AdvEdBtn, DBPlannerDatePicker, DB, ADODB,ActiveX;

type
  TfmFoodCountReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label5: TLabel;
    lb_gubun: TLabel;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    dt_startDate: TDateTimePicker;
    dt_endDate: TDateTimePicker;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    Label7: TLabel;
    cmb_Gubun: TComboBox;
    cmb_gubun1: TComboBox;
    ADOQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    cmb_Company: TComboBox;
    Label22: TLabel;
    procedure cmb_GubunChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    L_nFoodDayLimitCount : integer;        //일일 식수 제한 횟수
    L_nFoodWeekLimitCount : integer;       //주별 식수 제한 횟수
    L_nFoodSemesterLimitCount : integer;   //학기별 식수 제한 횟수
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    { Private declarations }
    procedure LoadCompanyCode;
    Procedure LoadJijumCode(aCompanyCode:string);
    Procedure LoadDepartCode(aCompanyCode,aJijumCode:string);
    Function  GetSonghoConfig:Boolean;
  public
    { Public declarations }
  end;

var
  fmFoodCountReport: TfmFoodCountReport;

implementation
uses
  uLomosUtil, uDataModule1;

{$R *.dfm}

procedure TfmFoodCountReport.cmb_GubunChange(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if cmb_Gubun.ItemIndex = 0 then
  begin
    lb_Gubun.Caption := '~';
    cmb_gubun1.Visible := False;
    dt_startDate.Format := 'yyyy-MM-dd';
    dt_endDate.Visible := True;
    sg_Report.ColWidths[1] := 0;
    sg_Report.Cells[0,0] := '날짜';
  end else if cmb_Gubun.ItemIndex = 1 then
  begin
    lb_Gubun.Caption := '년';
    cmb_gubun1.Visible := True;
    dt_startDate.Format := 'yyyy';
    dt_endDate.Visible := False;
    cmb_gubun1.Items.Clear;
    cmb_gubun1.Items.Add('전체');
    for i := 1 to 52 do
    begin
      cmb_gubun1.Items.Add(FillZeroNumber(i,2) + '주');
    end;
    cmb_gubun1.ItemIndex := 0;
    sg_Report.ColWidths[1] := 120;
    sg_Report.Cells[1,0] := '주차';
    sg_Report.Cells[0,0] := '년도';
  end else if cmb_Gubun.ItemIndex = 2 then
  begin
    lb_Gubun.Caption := '년';
    cmb_gubun1.Visible := True;
    dt_startDate.Format := 'yyyy';
    dt_endDate.Visible := False;
    cmb_gubun1.Items.Clear;
    cmb_gubun1.Items.Add('전체');
    cmb_gubun1.Items.Add('1학기');
    cmb_gubun1.Items.Add('2학기');
    cmb_gubun1.ItemIndex := 0;
    sg_Report.ColWidths[1] := 120;
    sg_Report.Cells[1,0] := '학기';
    sg_Report.Cells[0,0] := '년도';
  end;
end;

procedure TfmFoodCountReport.FormCreate(Sender: TObject);
begin
  inherited;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  dt_startDate.Date := now;
  dt_endDate.Date := now;

  LoadCompanyCode;
  LoadJijumCode('');
  cmb_JijumChange(cmb_Jijum);
  GetSonghoConfig;
  cmb_Gubun.ItemIndex := 2;
  cmb_GubunChange(cmb_Gubun);
end;

procedure TfmFoodCountReport.LoadDepartCode(aCompanyCode,aJijumCode:string);
var
  stSql : string;
begin
  DepartCodeList.Clear;
  DepartCodeList.Add('');
  cmb_Depart.Items.Clear;
  cmb_Depart.Items.Add('전체');
  cmb_Depart.ItemIndex := 0;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3''';
  if aCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + '''';
  if aJijumCode <> '' then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + '''';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';

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
      cmb_Depart.Items.Add(FindField('CO_NAME').AsString);
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmFoodCountReport.LoadJijumCode(aCompanyCode:string);
var
  stSql : string;
begin
  JijumCodeList.Clear;
  JijumCodeList.Add('');
  cmb_Jijum.Items.Clear;
  cmb_Jijum.Items.Add('전체');
  cmb_Jijum.ItemIndex := 0;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  if aCompanyCode <> '' then  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE ';

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
      cmb_Jijum.Items.Add(FindField('CO_NAME').AsString);
      JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmFoodCountReport.cmb_JijumChange(Sender: TObject);
var
  stCompanyCode,stJijumCode:string;
begin
  inherited;
  stCompanyCode := '';
  stJijumCode := '';
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex] ,1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex] ,4,3);
  end;
  LoadDepartCode(stCompanyCode,stJijumCode);
end;

procedure TfmFoodCountReport.btn_SearchClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stSql : string;
  i : integer;
  nRow : integer;
  stDate : string;
begin
  inherited;
  GridInitialize(sg_Report);

  stCompanyCode := '';
  stJijumCode := '';
  stDepartCode := '';

  if cmb_Depart.ItemIndex > 0 then
  begin
    stCompanyCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex] ,1,3);
    stJijumCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex] ,4,3);
    stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex] ,7,3);
  end else if cmb_Jijum.ItemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex] ,1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex] ,4,3);
  end else if cmb_Company.ItemIndex > 0 then
  begin
    stCompanyCode := copy(CompanyCodeList.Strings[cmb_Company.ItemIndex] ,1,3);
  end;

  stSql := 'Select a.*,b.EM_NAME,c.CO_NAME as JijumName,d.CO_NAME as DepartName from ';
  if cmb_Gubun.ItemIndex = 0 then
  begin
    stSql := stSql + '(select FD_DATE,1 as FD_SEQ,CO_COMPANYCODE,EM_CODE,FD_COUNT,' + inttostr(L_nFoodDayLimitCount) + ' - FD_COUNT as RemainCount from TB_FOODDayCount  ';
    stSql := stSql + ' Where FD_DATE between ''' + FormatDateTime('yyyyMMdd',dt_startDate.date) + ''' ';
    stSql := stSql + ' AND ''' + FormatDateTime('yyyyMMdd',dt_ENDDate.date) + ''' ';
    stSql := stSql + ' ) a ';
  end else if cmb_Gubun.ItemIndex = 1 then
  begin
    stSql := stSql + '(select FW_YEAR as FD_DATE,FW_WEEKDAY as FD_SEQ,CO_COMPANYCODE,EM_CODE,FW_COUNT as FD_COUNT,' + inttostr(L_nFoodWeekLimitCount) + ' - FW_COUNT as RemainCount from TB_FOODWeekCount  ';
    stSql := stSql + ' Where FW_YEAR = ''' + FormatDateTime('yyyy',dt_startDate.date) + ''' ';
    if cmb_gubun1.ItemIndex > 0 then stSql := stSql + ' AND FW_WEEKDAY = ' + inttostr(cmb_gubun1.ItemIndex) + ' ';
    stSql := stSql + ' ) a ';
  end else if cmb_Gubun.ItemIndex = 2 then
  begin
    stSql := stSql + '(select FS_YEAR as FD_DATE,SE_CODE as FD_SEQ,CO_COMPANYCODE,EM_CODE,FS_COUNT as FD_COUNT,' + inttostr(L_nFoodSemesterLimitCount) + ' - FS_COUNT as RemainCount from TB_FOODSemesterCount  ';
    stSql := stSql + ' Where FS_YEAR = ''' + FormatDateTime('yyyy',dt_startDate.date) + ''' ';
    if cmb_gubun1.ItemIndex > 0 then stSql := stSql + ' AND SE_CODE = ' + inttostr(cmb_gubun1.ItemIndex) + ' ';
    stSql := stSql + ' ) a ';
  end;
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = c.CO_JIJUMCODE  ';
  stSql := stSql + ' AND c.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if stCompanyCode <> '' then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
  if stJijumCode <> '' then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + stJijumCode + ''' ';
  if stDepartCode <> '' then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + stDepartCode + ''' ';
  if ed_empNo.Text <> '' then stSql := stSql + ' AND a.EM_CODE = ''' + ed_empNo.Text + ''' ';
  if ed_name.Text <> '' then stSql := stSql + ' AND b.EM_NAME Like ''%' + ed_name.Text + '%'' ';

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
        stDate := FindField('FD_DATE').AsString;
        if Length(stDate) > 4 then stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
        Cells[0,nRow] := stDate;
        Cells[1,nRow] := FindField('FD_SEQ').AsString;
        Cells[2,nRow] := FindField('JijumName').AsString;
        Cells[3,nRow] := FindField('DepartName').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := FindField('FD_COUNT').AsString;
        Cells[7,nRow] := FindField('RemainCount').AsString;

      end;

      inc(nRow);
      Next;
    end;

  end;
end;

procedure TfmFoodCountReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  Action := caFree;
end;

function TfmFoodCountReport.GetSonghoConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_nFoodDayLimitCount := 0;        //일일 식수 제한 횟수
  L_nFoodWeekLimitCount := 0;       //주별 식수 제한 횟수
  L_nFoodSemesterLimitCount := 0;   //학기별 식수 제한 횟수

  stSql := 'Select * from TB_SONGHOFDCONFIG ';
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if FindField('SF_CODE').AsString = 'DAY' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodDayLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodDayLimitCount := 0;
        end else if FindField('SF_CODE').AsString = 'WEEK' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodWeekLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodWeekLimitCount := 0;
        end else if FindField('SF_CODE').AsString = 'SEMESTER' then
        begin
          if FindField('SF_USE').AsString = 'Y' then L_nFoodSemesterLimitCount := FindField('SF_COUNT').AsInteger
          else L_nFoodSemesterLimitCount := 0;
        end;
        Next;
        Application.ProcessMessages;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFoodCountReport.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmFoodCountReport.btn_PrintClick(Sender: TObject);
begin
  inherited;
  sg_Report.Print;
end;

procedure TfmFoodCountReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='개인별 잔여횟수 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmFoodCountReport.LoadCompanyCode;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  stTemp : string;
begin
  cmb_Company.Clear;
  CompanyCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if strtoint(CompanyGrade) = 1 then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if strtoint(CompanyGrade) = 1 then
     stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' Group by a.CO_NAME,a.CO_COMPANYCODE ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

  //if aAll then   //잘못하면 CompanyCodeList 의 인덱스와 맞지 않을 수 있다
  //begin
    cmb_Company.Items.Add('전체');
    CompanyCodeList.Add('');
    cmb_Company.ItemIndex := 0;
  //end;

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;

    While Not Eof do
    begin
      stTemp := FindField('CO_COMPANYCODE').AsString + FindField('CO_NAME').AsString;
      cmb_Company.Items.Add(FindField('CO_NAME').AsString);
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
    if RecordCount = 1 then
    begin
      cmb_Company.ItemIndex := 1;
    end else
    begin
      if strtoint(CompanyGrade) > 1 then
      begin
        nIndex := CompanyCodeList.IndexOf(MasterCompany);
        if nIndex > 0 then cmb_Company.ItemIndex := nIndex;
      end;
      if cmb_Company.Items.Count > 0 then
         cmb_Company.ItemIndex := 0;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmFoodCountReport.cmb_CompanyChange(Sender: TObject);
var
  stCompanyCode : string;
begin
  inherited;
  if cmb_Company.ItemIndex > 0 then
  begin
    stCompanyCode := copy(CompanyCodeList.Strings[cmb_Company.ItemIndex] ,1,3);
  end;
  LoadJijumCode(stCompanyCode);
  cmb_JijumChange(cmb_Jijum);

end;

procedure TfmFoodCountReport.FormShow(Sender: TObject);
begin
  inherited;
  windowstate := wsMaximized;
end;

initialization
  RegisterClass(TfmFoodCountReport);
Finalization
  UnRegisterClass(TfmFoodCountReport);

end.
