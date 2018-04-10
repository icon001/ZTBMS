unit uConsultReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, ADODB, uSubForm, CommandArray,IniFiles,ComObj;

type
  TfmConsultReport = class(TfmASubForm)
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    Label5: TLabel;
    cmb_CompanyCode1: TComboBox;
    Label2: TLabel;
    ed_TelNum: TEdit;
    Label3: TLabel;
    ed_CustomerName: TEdit;
    cmb_ConsultCode1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    cmb_QnaCode1: TComboBox;
    sg_Consulting: TAdvStringGrid;
    TempQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    { Private declarations }
    procedure  LoadCompanyCode(cmb_box:TComboBox;aPgGroup:string;bTotal:Boolean);
    procedure  LoadConsultCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadQnACode(cmb_box:TComboBox;bTotal:Boolean);

    procedure ShowManagerList;

    Function GetTitle : String;
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
  public
    { Public declarations }
  end;

var
  fmConsultReport: TfmConsultReport;

implementation

uses
  uDataModule;
{$R *.dfm}

procedure TfmConsultReport.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  ConsultCodeList := TStringList.Create;
  QnaCodeList := TStringList.Create;
  
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

  LoadCompanyCode(cmb_CompanyCode1,'',True);
  LoadConsultCode(cmb_ConsultCode1,True);
  LoadQnACode(cmb_QnaCode1,True);
end;


procedure TfmConsultReport.LoadCompanyCode(cmb_box: TComboBox;
  aPgGroup: string; bTotal: Boolean);
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCOMPANY ';
  if aPgGroup <> '' then stSql := stSql + ' Where AC_CPPGTYPE = ''' + aPgGroup + ''' ';
  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      CompanyCodeList.Add(FindField('AC_COMPANYID').AsString);
      cmb_Box.Items.Add(FindField('AC_CPNAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmConsultReport.LoadConsultCode(cmb_box: TComboBox;
  bTotal: Boolean);
var
  stSql : string;
begin
  ConsultCodeList.Clear;
  ConsultCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCONSULTCODE ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      ConsultCodeList.Add(FindField('AC_CONSULTCODE').AsString);
      cmb_Box.Items.Add(FindField('AC_CONSULTNAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmConsultReport.LoadQnACode(cmb_box: TComboBox;
  bTotal: Boolean);
var
  stSql : string;
begin
  QnaCodeList.Clear;
  QnaCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHQNATYPE ';
  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      QnaCodeList.Add(FindField('AC_QNATYPE').AsString);
      cmb_Box.Items.Add(FindField('AC_QNANAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmConsultReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  ConsultCodeList.Free;
  QnaCodeList.Free;

  Action := caFree;
end;

procedure TfmConsultReport.btn_SearchClick(Sender: TObject);
begin
  ShowManagerList;
end;

procedure TfmConsultReport.ShowManagerList;
var
  stSql : string;
  stCompanyCode : string;
  stTelNum : string;
  stWhere : string;
  nRow : integer;
begin
  RowGridInitialize(sg_Consulting);

  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  stSql := 'Select a.*,b.AC_CPNAME,c.AC_CONSULTNAME,d.AC_QNANAME from ';
  stSql := stSql + ' TB_AUTHMANAGELIST a ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY b ';
  stSql := stSql + ' ON(a.AC_COMPANYID = b.AC_COMPANYID) ';
  stSql := stSql + ' Left Join TB_AUTHCONSULTCODE c ';
  stSql := stSql + ' ON(a.AC_CONSULTCODE = c.AC_CONSULTCODE) ';
  stSql := stSql + ' Left Join TB_AUTHQNATYPE d ';
  stSql := stSql + ' ON(a.AC_QNATYPE = d.AC_QNATYPE) ';

  stWhere := '';
  stWhere := stWhere + ' Where a.AM_DATE between ''' + FormatdateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stWhere := stWhere + ' AND ''' +  FormatdateTime('yyyymmdd',dt_ToDate.Date) + ''' ';

  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_COMPANYID = ''' + CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex] + ''' ';
  end;

  if stTelNum <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_TELNO Like ''%' + stTelNum + '%'' ';
  end;

  if ed_CustomerName.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_CUSTOMERNAME Like ''%' + ed_CustomerName.Text + '%'' ';
  end;

  if cmb_ConsultCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_CONSULTCODE = ''' + ConsultCodeList.Strings[cmb_ConsultCode1.ItemIndex] + ''' ';
  end;

  if cmb_QnaCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_QNATYPE = ''' + QnaCodeList.Strings[cmb_QnaCode1.ItemIndex] + ''' ';
  end;

  if stWhere <> '' then stSql := stSql + stWhere;

  stSql := stSql + ' order by a.AM_DATE DESC,a.AM_TIME DESC ';
//  stSql := stSql + ' LIMIT 0,100 ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    with sg_Consulting do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('AM_DATE').AsString;
        Cells[1,nRow] := FindField('AM_TIME').AsString;
        Cells[2,nRow] := FindField('AC_CPNAME').AsString;
        Cells[3,nRow] := FindField('AM_CUSTOMERNAME').AsString;
        Cells[4,nRow] := FindField('AM_QUESTION').AsString;
        Cells[5,nRow] := FindField('AM_DATA').AsString;
        Cells[6,nRow] := FindField('AC_CONSULTNAME').AsString;
        Cells[7,nRow] := FindField('AC_QNANAME').AsString;
        Cells[8,nRow] := FindField('AM_MASTERID').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmConsultReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmConsultReport.btn_ExcelClick(Sender: TObject);
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
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',ExeFolder + '\');
  stRefFileName  := ini_fun.ReadString('상담이력보고서','참조파일','D2DConsultReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('상담이력보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='상담이력보고서';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Consulting,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
end;

function TfmConsultReport.ExcelPrintOut(StringGrid: TAdvStringGrid;
  refFileName, SaveFileName: String; FileOut: Boolean;
  ExcelRowStart: integer; stTitle: string; bRowHeader,
  bColHeader: Boolean): Boolean;
var
  oXL, oWB, oSheet, oRng, VArray : Variant;
  nCol1,nCol2 : Integer;
  Loop : Integer;
  sCurDay,sPreDay : String;
  curDate : TDateTime;
  mergeStart :char;
  i,j,k : Integer;
  st : String;
  nColChar : integer;
  nFixCol,nFixRow : integer;

begin
  Result := False;

  Try
    oXL := CreateOleObject('Excel.Application');
  Except
    showmessage('출력은 엑셀이 설치된 컴퓨터에서만 가능합니다.');
    exit;
  End;

  if FileExists(refFileName) = False then
  begin
    Showmessage(refFileName + ' 파일이 없습니다.');
    exit;
  end;


  oXL.Workbooks.Open(refFileName);
  oXL.DisplayAlerts := False;
//  oXL.Visible := True;
  oSheet := oXL.ActiveSheet;


  with StringGrid do
  begin

    //타이틀을 적자
    nCol1 := ColCount div 26;
    nCol2 := ColCount mod 26;
    if bRowHeader then
    begin
      oSheet.Range['A' + inttostr(ExcelRowStart - 1)].Value := stTitle;
      if bColHeader then nFixCol := 0
      else nFixCol := FixedCols ;
      for i:= 0 to FixedRows - 1 do
      begin
        for j:= nFixCol to ColCount - 1 do
        begin
          nColChar := j div 26;
          if j < 26 then
            oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i]
          else
            oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i];
        end;
      end;
      ExcelRowStart := ExcelRowStart + FixedRows ;
    end
    else    oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows - 1)].Value := stTitle;

    for i := FixedRows to RowCount - 1 do
    begin

      if i <  RowCount - 2 then    //한칸씩 삽입
      begin
        oSheet.Range['A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)].Insert;
      end;
      Application.ProcessMessages;
    end;
    StringGrid.CopyToClipBoard;
    oSheet.Range['A' + inttostr(ExcelRowStart - 1), 'A' + inttostr(ExcelRowStart - 1)].Select;
    oSheet.Paste;
  end;//With

  //oXL.Visible := False;
  if FileOut then  oSheet.SaveAs(SaveFileName)
  else  oSheet.PrintOut;
  //oSheet.SaveAs(ExtractFileDir(Application.ExeName) + '\WorkSch2.xls');
  oXL.ActiveWorkbook.Close(False);
  oXL.Quit;
  Result := True;
end;

function TfmConsultReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  if cmb_CompanyCode1.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_CompanyCode1.Text ;
  if Trim(ed_TelNum.Text) <> '' then
    stTitle := stTitle  + ' / 전화번호 : ' + ed_TelNum.text ;
  if Trim(ed_CustomerName.Text) <> '' then
    stTitle := stTitle  + ' / 고객명 : ' + ed_CustomerName.text ;
  if cmb_ConsultCode1.ItemIndex > 0 then
    stTitle := stTitle + ' / 문의유형 : ' + cmb_ConsultCode1.text ;
  if cmb_QnaCode1.ItemIndex > 0 then
    stTitle := stTitle + ' / 상담결과 : ' + cmb_QnaCode1.text ;

  Result := stTitle;
end;

procedure TfmConsultReport.btn_PrintClick(Sender: TObject);
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
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',ExeFolder + '\');
  stRefFileName  := ini_fun.ReadString('상담이력보고서','참조파일','D2DConsultReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('상담이력보고서','시작위치',6);
  ini_fun.Free;
  
  if Not ExcelPrintOut(sg_Consulting,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False) then
  begin
    btn_Print.Enabled := True;
    Screen.Cursor:= crDefault;
  end;
  btn_Print.Enabled := True;
  //showmessage('출력 완료');
  Screen.Cursor:= crDefault;
end;

initialization
  RegisterClass(TfmConsultReport);
Finalization
  UnRegisterClass(TfmConsultReport);

end.
