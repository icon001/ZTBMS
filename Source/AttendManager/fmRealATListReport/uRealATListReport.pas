unit uRealATListReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, FR_DSet, FR_DBSet, FR_Class, DB, ADODB,IniFiles, Gauges,
  ExtCtrls,ComObj, AdvObj;

type
  TfmRealATListReport = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox1: TGroupBox;
    ADOQuery: TADOQuery;
    ADOTempQuery: TADOQuery;
    ADOEventQuery: TADOQuery;
    GroupBox2: TGroupBox;
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
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    dt_ToDate: TDateTimePicker;
    dt_FromDate: TDateTimePicker;
    Label11: TLabel;
    Label12: TLabel;
    cmb_Button: TComboBox;
    Label2: TLabel;
    btnAddSearch: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure sg_reportColChanging(Sender: TObject; OldCol,
      NewCol: Integer; var Allow: Boolean);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_reportResize(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure btnAddSearchClick(Sender: TObject);
  private
    nCol : integer;
    nRow : integer;
    ATCodeList : TStringList;
    { Private declarations }
    Function SearchATListEvent(aCode:string;bAdd:Boolean) : Boolean;
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    procedure LoadATCode(cmb_Box: TComboBox);
    procedure LoadInCode(cmb_Box: TComboBox);
    procedure LoadOutCode(cmb_Box: TComboBox);

    function InsertTB_ATEVENTATCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTATCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function InsertTB_ATEVENTInCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTInCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function InsertTB_ATEVENTOutCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTOutCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate:string):Boolean;

    procedure SaveInTime(aCompanyCode,aEmCode,aDate,aData:string);
    procedure SaveOutTime(aCompanyCode,aEmCode,aDate,aData:string);
    procedure SaveBigo(aCompanyCode,aEmCode,aDate,aData:string);
    function InsertTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    Function GetTitle : String;

  public
    { Public declarations }
  end;

var
  fmRealATListReport: TfmRealATListReport;
  CompanyCodeList : TStringList;
  JijumCodeList : TStringList;
  DepartCodeList : TStringList;
  PosiCodeList : TStringList;
  ATINCodeList : TStringList;
  ATINTypeList : TStringList;
  ATOutCodeList : TStringList;
  ATOutTypeList : TStringList;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uLomosUtil,
  uAttendCommon, uExcelSave;

{$R *.dfm}

procedure TfmRealATListReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRealATListReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;

  ATCodeList.Free;

  ATINCodeList.Free;
  ATINTypeList.Free;
  ATOutCodeList.Free;
  ATOutTypeList.Free;

  Action := caFree;

end;

procedure TfmRealATListReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
  PosiCodeList := TStringList.Create;

  ATCodeList := TStringList.Create;
  
  ATINCodeList := TstringList.Create;
  ATINTypeList := TstringList.Create;
  ATOutCodeList := TstringList.Create;
  ATOutTypeList := TstringList.Create;
  sg_report.ColWidths[0] := 0;
end;

procedure TfmRealATListReport.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

  GridInitialize(sg_report);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

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

  btn_SearchClick(btn_Search);
end;

procedure TfmRealATListReport.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmRealATListReport.btn_SearchClick(Sender: TObject);
begin
  SearchATListEvent('',False);
end;

procedure TfmRealATListReport.btn_FileSaveClick(Sender: TObject);
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

procedure TfmRealATListReport.sg_reportColChanging(Sender: TObject; OldCol,
  NewCol: Integer; var Allow: Boolean);
begin
  with sg_report do
  begin
    if NewCol > 5 then
    begin
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goEditing];
      //sg_report.EditorMode := True;
    end
    else Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing] ;
  end;

end;

procedure TfmRealATListReport.LoadInCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

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

procedure TfmRealATListReport.LoadOutCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

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

function TfmRealATListReport.InsertTB_ATEVENTInCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.InsertTB_ATEVENTOutCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_OUTCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTInCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTOutCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.DupCheckTB_ATEVENT(aCompanyCode, aEmCode,
  aDate: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOEventQuery do
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
  end;

  result := True;
end;

procedure TfmRealATListReport.sg_reportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;

  with sg_report do
  begin
    {if Col > 3 then
    begin
      if Not EditorMode then
      begin
        EditorMode := True;
        Exit;
      end;
    end;   }
    if (ColCount -  2) > Col then
      SelectRange(Col + 1,Col + 1,Row,Row);
//    nCol := Col + 1;
    //sg_report.SetFocus;
  end;

end;

procedure TfmRealATListReport.SaveBigo(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData);

end;

procedure TfmRealATListReport.SaveInTime(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Length(aData) > 6 then aData := copy(aData,1,6)
  else aData := FillZeroStrNum(aData,6,False);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData);

end;

procedure TfmRealATListReport.SaveOutTime(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Length(aData) > 6 then aData := copy(aData,1,6)
  else aData := FillZeroStrNum(aData,6,False);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData);

end;

function TfmRealATListReport.InsertTB_ATEVENTBigo(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_CONTENT,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.InsertTB_ATEVENTInTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_INTIME,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.InsertTB_ATEVENTOutTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_OUTTIME,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTBigo(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_CONTENT = ''' + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTInTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTOutTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmRealATListReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade or IsUpdateGrade  then sg_report.Enabled := True
  else sg_report.Enabled := False;

end;

function TfmRealATListReport.SearchATListEvent(aCode: string;bAdd:Boolean): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stDate : string;
  stTime : string;
  stATDate : string;
  stButton : string;
begin
  result := False;

  if Not bAdd then
  begin
    RowGridInitialize(sg_Report);
  end;
  if DBTYPE = 'MSSQL' then stSql :=  Mssql.SelectTB_ATLISTEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_toDate.Date))
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ATLISTEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_toDate.Date))
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ATLISTEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_toDate.Date))
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
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
          stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
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
          stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND b.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  if cmb_Button.ItemIndex > 0 then
    stSql := stSql + ' AND a.AC_BUTTONNO = ''' + inttostr(cmb_Button.ItemIndex) + ''' ';

  stSql := stSql + ' Order By a.AC_DATE,a.AC_TIME,a.CO_COMPANYCODE,JIJUM_NAME,DEPART_NAME,a.EM_CODE ';

  //memo1.Lines.Text := stSql;
  //Exit;
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
    if RecordCount < 1 then Exit;
    First;
    if Not bAdd then
    begin
      nRow := 1;
      sg_report.RowCount := RecordCount + 1;
    end else
    begin
      nRow := sg_Report.RowCount;
      sg_report.RowCount := sg_report.RowCount + RecordCount;
    end;
    while Not Eof do
    begin
      stDate := copy(FindField('AC_DATE').AsString,1,4) + '-' +
                  copy(FindField('AC_DATE').AsString,5,2) + '-' +
                  copy(FindField('AC_DATE').AsString,7,2) ;
      stTime := copy(FindField('AC_TIME').AsString,1,2) + ':' +
                   copy(FindField('AC_TIME').AsString,3,2) + ':' +
                   copy(FindField('AC_TIME').AsString,5,2) ;
      stATDate := copy(FindField('AT_DATE').AsString,1,4) + '-' +
                  copy(FindField('AT_DATE').AsString,5,2) + '-' +
                  copy(FindField('AT_DATE').AsString,7,2) ;
      stButton := '';
      case FindField('AC_BUTTONNO').AsString[1] of
        '1' : stButton := '출근버튼';
        '2' : stButton := '퇴근버튼';
        '4' : stButton := '외출버튼';
        '5' : stButton := '복귀버튼';
      end;

      with sg_report do
      begin
        Cells[0,nRow] := stDate + ' ' + stTime;
        Cells[1,nRow] := stDate;
        Cells[2,nRow] := stTime;
        Cells[3,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[4,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[5,nRow] := FindField('DEPART_NAME').AsString;
        Cells[6,nRow] := FindField('PO_NAME').AsString;
        Cells[7,nRow] := FindField('EM_CODE').AsString;
        Cells[8,nRow] := FindField('EM_NAME').AsString;
        Cells[9,nRow] := FindField('AT_CODENAME').AsString;
        Cells[10,nRow] := FindField('AT_ATTYPENAME').AsString;
        Cells[11,nRow] := stButton;
        Cells[12,nRow] := stATDate;

      end;
      nRow := nRow + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
  result := True;
  //sg_reportClick(sg_Report);

end;

procedure TfmRealATListReport.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmRealATListReport.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmRealATListReport.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmRealATListReport.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmRealATListReport.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmRealATListReport.Load_ATInCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Box.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AT_INCODE '; 

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

procedure TfmRealATListReport.Load_ATOutCode(cmb_Box: TComboBox;
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

procedure TfmRealATListReport.LoadATCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  ATCodeList.Clear;

  stSql := ' select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  ATCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('AT_CODENAME').AsString);
      ATCodeList.Add(FindField('AT_ATCODE').AsString);
      Next;
    end;

  end;
end;

function TfmRealATListReport.InsertTB_ATEVENTATCode(aCompanyCode, aEmcode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmRealATListReport.UpdateTB_ATEVENTATCode(aCompanyCode, aEmcode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_ATCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmRealATListReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('실시간근태현황리스트','참조파일','RealATListReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('실시간근태현황리스트','시작위치',6);
  ini_fun.Free;

  aFileName:='실시간근태보고서';
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

function TfmRealATListReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date)  ;
  stTitle := ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_toDate.Date)  ;
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

procedure TfmRealATListReport.sg_reportResize(Sender: TObject);
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

procedure TfmRealATListReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('실시간근태현황리스트','참조파일','RealATListReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('실시간근태현황리스트','시작위치',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmRealATListReport.btnAddSearchClick(Sender: TObject);
begin
  inherited;
  SearchATListEvent('',True);

end;

initialization
  RegisterClass(TfmRealATListReport);
Finalization
  UnRegisterClass(TfmRealATListReport);

end.
