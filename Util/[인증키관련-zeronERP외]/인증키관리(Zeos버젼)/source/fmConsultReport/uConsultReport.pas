unit uConsultReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, Grids, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, DB, ADODB, uSubForm, CommandArray,IniFiles,ComObj,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, AdvObj;

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
    Label2: TLabel;
    ed_TelNum: TEdit;
    Label3: TLabel;
    ed_CustomerName: TEdit;
    cmb_ConsultCode1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    cmb_QnaCode1: TComboBox;
    sg_Consulting: TAdvStringGrid;
    SaveDialog1: TSaveDialog;
    TempQuery: TZQuery;
    cmb_sCompanyGubun: TComboBox;
    Label24: TLabel;
    cmb_sCompany: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    cmb_sJijum: TComboBox;
    cmb_sDepart: TComboBox;
    Label27: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure cmb_sCompanyGubunChange(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    sCompanyGubunList :TStringList;
    sCompanyCodeList :TStringList;
    sJijumCodeList :TStringList;
    sDepartCodeList :TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    { Private declarations }
    procedure LoadCompanyGubun(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True);
    procedure LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadJijumCode(cmb_Box:TComboBox;aCompanyCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadDepartCode(cmb_Box:TComboBox;aCompanyCode,aJijumCode:string;TempList:TStringList;bAll:Boolean = True);
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
  uDataModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmConsultReport.FormCreate(Sender: TObject);
begin
  sCompanyGubunList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  ConsultCodeList := TStringList.Create;
  QnaCodeList := TStringList.Create;
  
  dt_FromDate.Date := Now - 30;
  dt_ToDate.Date := Now;

  LoadCompanyGubun(cmb_sCompanyGubun,sCompanyGubunList);
  LoadCompanyCode(cmb_sCompany,'000',sCompanyCodeList);
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);

  LoadConsultCode(cmb_ConsultCode1,True);
  LoadQnACode(cmb_QnaCode1,True);
end;


procedure TfmConsultReport.LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANY ';
  if aCompanyGubunCode <> '000' then
    stSql := stSql + ' Where CG_CODE = ''' + aCompanyGubunCode + ''' ';
  stSql := stSql + ' order by CO_COMPANYCODE ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
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

  stSql := 'select * from TB_CONSULTTYPE ';

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
      ConsultCodeList.Add(FindField('CN_TYPE').AsString);
      cmb_Box.Items.Add(FindField('CN_NAME').AsString);
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

  stSql := 'select * from TB_QNATYPE ';
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
      QnaCodeList.Add(FindField('QA_TYPE').AsString);
      cmb_Box.Items.Add(FindField('QA_NAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmConsultReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sCompanyGubunList.Free;
  sCompanyCodeList.Free;
  sJijumCodeList.Free;
  sDepartCodeList.Free;
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
  stTelNum : string;
  stWhere : string;
  nRow : integer;
  i : integer;
begin
  RowGridInitialize(sg_Consulting);

  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  stSql := 'Select a.*,c.CO_NAME,d.QA_NAME as QnaName,e.CN_NAME,f.MA_USERNAME from ';
  stSql := stSql + ' TB_QNALIST a ';
  stSql := stSql + ' Left Join TB_PERSON b ';
  stSql := stSql + ' ON(a.PE_CODE = b.PE_CODE) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' Left Join TB_QNATYPE d ';
  stSql := stSql + ' ON(a.QA_TYPE = d.QA_TYPE) ';
  stSql := stSql + ' Left Join TB_CONSULTTYPE e ';
  stSql := stSql + ' ON(a.CN_TYPE = e.CN_TYPE) ';
  stSql := stSql + ' Left Join TB_MASTER f ';
  stSql := stSql + ' ON(a.MA_USERID = f.MA_USERID) ';

  stWhere := '';
  stWhere := stWhere + ' Where a.QA_DATE between ''' + FormatdateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stWhere := stWhere + ' AND ''' +  FormatdateTime('yyyymmdd',dt_ToDate.Date) + ''' ';

  if cmb_sCompany.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';
  end else if cmb_sCompanyGubun.ItemIndex > 0 then
  begin
    if sCompanyCodeList.Count > 1 then
    begin
      if stWhere = '' then stWhere := stWhere + ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' (';
      for i := 1 to sCompanyCodeList.Count - 1 do
      begin
        if i <> 1 then stWhere := stWhere + 'OR ';
        stWhere := stWhere + ' b.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[i] + ''' ';
      end;
      stWhere := stWhere + ' )';
    end;
  end;
  if cmb_sJijum.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_JIJUMCODE = ''' + sJijumCodeList.Strings[cmb_sJijum.ItemIndex] + ''' ';
  end;
  if cmb_sDepart.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_DEPARTCODE = ''' + sDepartCodeList.Strings[cmb_sDepart.ItemIndex] + ''' ';
  end;

  if stTelNum <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.QA_TEL Like ''%' + stTelNum + '%'' ';
  end;

  if ed_CustomerName.Text <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.QA_NAME Like ''%' + ed_CustomerName.Text + '%'' ';
  end;

  if cmb_QnaCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.QA_TYPE = ''' + QnaCodeList.Strings[cmb_QnaCode1.ItemIndex] + ''' ';
  end;

  if cmb_ConsultCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.CN_TYPE = ''' + ConsultCodeList.Strings[cmb_ConsultCode1.ItemIndex] + ''' ';
  end;

  if stWhere <> '' then stSql := stSql + stWhere;
  stSql := stSql + ' order by a.QA_DATE DESC,a.QA_TIME DESC ';

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
        Cells[0,nRow] := FillZeroNumber(FindField('QA_SEQ').asinteger,5);
        Cells[1,nRow] := DateType(FindField('QA_DATE').AsString,False);
        Cells[2,nRow] := TimeType(FindField('QA_TIME').AsString);
        Cells[3,nRow] := FindField('QA_JIJUMNAME').AsString;
        Cells[4,nRow] := FindField('QA_DEPARTNAME').AsString;
        Cells[5,nRow] := FindField('QA_NAME').AsString;
        Cells[6,nRow] := PhoneNumberType(FindField('QA_TEL').AsString);
        Cells[7,nRow] := FindField('MA_USERNAME').AsString;
        Cells[8,nRow] := FindField('QA_DEVICENAME').AsString;
        Cells[9,nRow] := FindField('QA_MODELNAME').AsString;
        Cells[10,nRow] := FindField('QA_FIRMWAREVERSION').AsString;
        Cells[11,nRow] := FindField('QA_SUBJECT').AsString;
        Cells[12,nRow] := FindField('CN_TYPE').AsString;
        Cells[13,nRow] := DateType(FindField('QA_RESULTDATE').AsString,False);
        Cells[14,nRow] := FindField('QA_DATA').AsString;
        Cells[15,nRow] := FindField('QA_DEVICETYPE').AsString;
        Cells[16,nRow] := FindField('QA_TYPE').AsString;
        Cells[17,nRow] := FindField('QA_ERRDETAIL').AsString;
        Cells[18,nRow] := FindField('QA_PROCESSTIME').AsString;
        Cells[19,nRow] := FindField('QA_ERRTARGET').AsString;

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
  if cmb_sCompany.ItemIndex > 0 then
    stTitle := stTitle + ' / 회사 : ' + cmb_sCompany.Text ;
  if cmb_sJijum.ItemIndex > 0 then
    stTitle := stTitle + ' / 지점 : ' + cmb_sJijum.Text ;
  if cmb_sDepart.ItemIndex > 0 then
    stTitle := stTitle + ' / 부서 : ' + cmb_sDepart.Text ;
  if Trim(ed_TelNum.Text) <> '' then
    stTitle := stTitle  + ' / 전화번호 : ' + ed_TelNum.text ;
  if Trim(ed_CustomerName.Text) <> '' then
    stTitle := stTitle  + ' / 고객명 : ' + ed_CustomerName.text ;
  if cmb_QnaCode1.ItemIndex > 0 then
    stTitle := stTitle + ' / 문의유형 : ' + cmb_QnaCode1.text ;
  if cmb_ConsultCode1.ItemIndex > 0 then
    stTitle := stTitle + ' / 상담결과 : ' + cmb_ConsultCode1.text ;

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

procedure TfmConsultReport.LoadCompanyGubun(cmb_Box: TComboBox;
  TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANYGUBUN ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CG_NAME').AsString );
      TempList.Add(FindField('CG_CODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmConsultReport.LoadJijumCode(cmb_Box: TComboBox;
  aCompanyCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_JIJUM ';
  if aCompanyCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_JIJUMNAME').AsString );
      TempList.Add(FindField('CO_JIJUMCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmConsultReport.LoadDepartCode(cmb_Box: TComboBox; aCompanyCode,
  aJijumCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_DEPART ';
  if aJijumCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_DEPARTNAME').AsString );
      TempList.Add(FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmConsultReport.cmb_sCompanyGubunChange(Sender: TObject);
begin
  inherited;
  LoadCompanyCode(cmb_sCompany,sCompanyGubunList.Strings[cmb_sCompanyGubun.itemIndex],sCompanyCodeList);
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);

end;

procedure TfmConsultReport.cmb_sCompanyChange(Sender: TObject);
begin
  inherited;
  LoadJijumCode(cmb_sJijum,sCompanyCodeList.Strings[cmb_sCompany.itemIndex],sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);

end;

procedure TfmConsultReport.cmb_sJijumChange(Sender: TObject);
begin
  inherited;
  LoadDepartCode(cmb_sDepart,sCompanyCodeList.Strings[cmb_sCompany.itemIndex],sJijumCodeList.Strings[cmb_sJijum.itemIndex],sDepartCodeList);

end;

procedure TfmConsultReport.FormShow(Sender: TObject);
begin
  inherited;
  ShowManagerList;
end;

initialization
  RegisterClass(TfmConsultReport);
Finalization
  UnRegisterClass(TfmConsultReport);

end.
