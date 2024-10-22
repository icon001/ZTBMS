unit uAlarmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, FR_DSet,
  FR_DBSet, FR_Class, DB, ADODB, uSubForm, CommandArray, Menus,iniFiles,ComObj,
  Gauges, ExtCtrls;

type
  TfmAlarmReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    cmb_Position: TComboBox;
    cmb_AlarmType: TComboBox;
    sg_AlarmReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    PopupMenu_Alarm: TPopupMenu;
    N12: TMenuItem;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    pan_gauge: TPanel;
    Label5: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_SearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_AlarmReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    DeviceCodeList : TStringList;
    AlarmCodeList : TStringList;
    { Private declarations }
    procedure GetAlarmName(cmb_box : TComboBox);
    procedure GetAlarmType(cmb_box : TComboBox);
    Function GetTitle : String;
    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
  public
    { Public declarations }
  end;

var
  fmAlarmReport: TfmAlarmReport;

implementation

uses
    uDataModule1,
    uLomosUtil, uMssql, uPostGreSql, uMDBSql, uFireBird;

{$R *.dfm}

procedure TfmAlarmReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceCodeList.Free;
  AlarmCodeList.Free;
  Action := caFree;

end;

procedure TfmAlarmReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;

end;

procedure TfmAlarmReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmAlarmReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='경보 이력 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_AlarmReport.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmAlarmReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('입퇴실현황보고서','참조파일','D2DInOutReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('입퇴실현황보고서','시작위치',6);
  ini_fun.Free;
  
  if Not ExcelPrintOut(sg_AlarmReport,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False) then
  begin
    btn_Print.Enabled := True;
    Screen.Cursor:= crDefault;
  end;
  btn_Print.Enabled := True;
  //showmessage('출력 완료');
  Screen.Cursor:= crDefault;
{  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport; }

end;

procedure TfmAlarmReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmAlarmReport.GetAlarmName(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  DeviceCodeList.Clear;
  cmb_box.Items.Add('전체');
  DeviceCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID  ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
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
      cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;


end;

procedure TfmAlarmReport.GetAlarmType(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  AlarmCodeList.Clear;
  cmb_box.Items.Add('전체');
  AlarmCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := ' Select * from TB_ALARMSTATUSCODE ';
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
      cmb_Box.Items.Add(FindField('AL_ALARMNAME').AsString);
      AlarmCodeList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmAlarmReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stAlarmType:string;
begin
  GridInitialize(sg_AlarmReport);

  stNodeNo:='';
  stEcuID:= '';
  stAlarmType:= '';
  if cmb_Position.ItemIndex > 0 then
  begin
    stNodeNo := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
    stEcuID := copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
  end;
  if cmb_AlarmType.ItemIndex > 0 then
  begin
    stAlarmType := AlarmCodeList.Strings[cmb_AlarmType.ItemIndex] ;
  end;

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectTB_ALARMEVENTFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stAlarmType)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectTB_ALARMEVENTFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stAlarmType)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectTB_ALARMEVENTFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stAlarmType)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectTB_ALARMEVENTFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stAlarmType)
  else Exit;


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

    if RecordCount < 1 then
    begin
      showmessage('조회할 데이터가 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_AlarmReport.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_AlarmReport  do
      begin
        cells[0,nRow] := copy(FindField('AL_DATE').AsString,1,4) + '-' + copy(FindField('AL_DATE').AsString,5,2)
                         + '-' + copy(FindField('AL_DATE').AsString,7,2)
                         + ' ' + copy(FindField('AL_TIME').AsString,1,2)
                         + ':' + copy(FindField('AL_TIME').AsString,3,2)
                         + ':' + copy(FindField('AL_TIME').AsString,5,2);   //발생시각
        if FindField('AL_ZONENAME').AsString <> '' then
          cells[1,nRow] := FindField('AL_ZONENAME').AsString
        else cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        cells[2,nRow] := FindField('AL_ZONENO').AsString;
        //cells[3,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;    
        cells[3,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
        cells[4,nRow] := FindField('AL_SUBADDR').AsString;
        if FindField('AL_ALARMMODECODE').AsString = 'D' then cells[5,nRow] := '해제모드'
        else if FindField('AL_ALARMMODECODE').AsString = 'A' then cells[5,nRow] := '경계모드';
//        cells[4,nRow] := FindField('AL_ALARMMODECODE').AsString;
        if FindField('AL_ALARMNAME').AsString <> '' then
          cells[6,nRow] := FindField('AL_ALARMNAME').AsString + '(' + FindField('AL_OPERATOR').AsString + ')'
        else cells[6,nRow] := FindField('AL_ALARMSTATUSCODE').AsString + '(' + FindField('AL_OPERATOR').AsString + ')';
        cells[7,nRow] := FindField('AL_CHECKCODE').AsString;
        cells[8,nRow] := FindField('AL_CHECKMSG').AsString;
        cells[9,nRow] := FindField('AL_UPDATEOPERATOR').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmAlarmReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmAlarmReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('경보이력보고서','참조파일','D2DAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('경보이력보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='경보이력보고서';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_AlarmReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
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

function TfmAlarmReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  if cmb_Position.Text <> '' then
    stTitle := stTitle + ' / 방범구역 : ' + cmb_Position.Text ;
  if cmb_AlarmType.Text <> '' then
    stTitle := stTitle + ' / 경보종류 : ' + cmb_AlarmType.Text ;

  Result := stTitle;

end;

function TfmAlarmReport.ExcelPrintOut(StringGrid: TAdvStringGrid;
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
  pan_gauge.Visible := True;
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

    Gauge1.MaxValue := ( RowCount - FixedRows );
    Gauge1.Progress := 0;
    for i := FixedRows to RowCount - 1 do
    begin

      if i <  RowCount - 2 then    //한칸씩 삽입
      begin
        oSheet.Range['A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)].Insert;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
     {
      for j := 0 to ColCount - 1 do
      begin
        nColChar := j div 26;
        if j < 26 then
          oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i]
        else
          oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i];
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
      end;
      }
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
  pan_gauge.Visible := False;
  Result := True;
end;

procedure TfmAlarmReport.sg_AlarmReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_AlarmReport.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmAlarmReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GetAlarmName(cmb_Position);
  GetAlarmType(cmb_AlarmType);

  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

initialization
  RegisterClass(TfmAlarmReport);
Finalization
  UnRegisterClass(TfmAlarmReport);

end.
