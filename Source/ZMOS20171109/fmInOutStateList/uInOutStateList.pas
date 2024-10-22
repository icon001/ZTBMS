unit uInOutStateList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, Grids, BaseGrid, AdvGrid, StdCtrls,
  ComCtrls, Buttons, DB, ADODB, Gauges, ExtCtrls,iniFiles,ComObj, AdvObj;

type
  TfmInOutStateList = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    cmb_InOutGroup: TComboBox;
    sg_InOutReport: TAdvStringGrid;
    ADOQuery: TADOQuery;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label4: TLabel;
    Gauge1: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_InOutReportResize(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    IOInOutReaderGroupCodeList : TStringList;
    { Private declarations }
    procedure LoadInOutGroup;
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmInOutStateList: TfmInOutStateList;

implementation
uses
  uDataModule1,
  uLomosUtil, uExcelSave;

{$R *.dfm}

{ TfmInOutReport }

procedure TfmInOutStateList.LoadInOutGroup;
var
  stSql : string;
begin
  cmb_InOutGroup.Clear;
  IOInOutReaderGroupCodeList.Clear;
  stSql := 'Select IO_GROUPCODE,IO_GROUPNAME from TB_INOUTREADERGROUP ';
  cmb_InOutGroup.Items.Add('전체');
  IOInOutReaderGroupCodeList.Add('000');
  cmb_InOutGroup.ItemIndex := 0;

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;

    with cmb_InOutGroup do
    begin
      While Not Eof do
      begin
        Items.Add(FindField('IO_GROUPNAME').AsString);
        IOInOutReaderGroupCodeList.Add(FindField('IO_GROUPCODE').AsString);
        Next;
      end;

    end;
  end;

end;

procedure TfmInOutStateList.FormCreate(Sender: TObject);
begin
  IOInOutReaderGroupCodeList := TStringList.Create;

  dt_FromDate.Date := Now - 30;
  dt_ToDate.Date := Now;
  LoadInOutGroup;
end;

procedure TfmInOutStateList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutStateList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  IOInOutReaderGroupCodeList.Free;
  
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'InOutStateList';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;

procedure TfmInOutStateList.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  stOldGroupCode : string;
  nRow : integer;
  nGroupCount : integer;
begin
  GridInitialize(sg_InOutReport);


  stSql := 'Select a.*,b.IO_GROUPNAME,c.AC_DEVICENAME,e.EM_NAME from TB_INOUTGROUPLIST a ';
  stSql := stSql + ' INNER JOIN TB_INOUTREADERGROUP b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.IO_GROUPCODE = b.IO_GROUPCODE ) ';
  stSql := stSql + ' INNER JOIN TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stsql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_CARD d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = d.CA_CARDNO) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE e ';
  stSql := stSql + ' ON ( d.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND d.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.EM_CODE = e.EM_CODE ) ';
  stSql := stSql + ' Where a.IO_TIME Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + '000000'' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_TODate.Date) + '999999'' ';
  if cmb_InOutGroup.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.IO_GROUPCODE = ''' + IOInOutReaderGroupCodeList.Strings[cmb_InOutGroup.ItemIndex] + ''' ';
  end;
  stSql := stsql + ' Order by a.IO_GROUPCODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '조회건수:' + numberformat(inttostr(recordcount)) + '건';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;
    if recordcount < 1 then Exit;
    nRow := 1;

    nGroupCount := 0;
    With sg_InOutReport do
    begin
      InsertRows(nRow,1);
      MergeCells(0,1,4,1);
      cells[0,nRow] := '현재 입실 총 인원 : ' + formatfloat('###,###,##0',recordCount) + ' 명';
      inc(nRow);
      //RowCount := recordcount + 1;
      While Not Eof do
      begin
        InsertRows(nRow,1);
        Cells[0,nRow] := FindField('IO_GROUPNAME').AsString ;
        Cells[1,nRow] := FindField('EM_NAME').AsString ;
        Cells[2,nRow] := FindField('AC_DEVICENAME').AsString + '-' + FindField('RE_READERNO').AsString + '번 리더' ;
        Cells[3,nRow] := MakeDatetimeStr(FindField('IO_TIME').AsString);
        if stOldGroupCode = FindField('IO_GROUPCODE').AsString then
        begin
          nGroupCount := nGroupCount + 1;
        end else
        begin
          if stOldGroupCode <> '' then
          begin
            InsertRows(nRow,1);
            MergeCells(1,nRow,3,1);
            Cells[0,nRow] := '소계';
            Cells[1,nRow] := formatfloat('###,###,##0',nGroupCount) + ' 명';
            inc(nRow);
          end;
          nGroupCount := 1;
          stOldGroupCode := FindField('IO_GROUPCODE').AsString;
        end;
        inc(nRow);
        Next;
      end;
      MergeCells(1,nRow,3,1);
      Cells[0,nRow] := '소계';
      Cells[1,nRow] := formatfloat('###,###,##0',nGroupCount) + ' 명';

    end;
  end;

end;

procedure TfmInOutStateList.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('입퇴실현황보고서','참조파일','D2DInOutReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('입퇴실현황보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='입퇴실현황보고서';
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
        dmExcelSave.ExcelPrintOut(sg_InOutReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_InOutReport.SaveToCSV(stSaveFileName);
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
      if Not ExcelPrintOut(sg_InOutReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;   }
end;


function TfmInOutStateList.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  stTitle := stTitle + ' / 입퇴실그룹 : ' + cmb_InOutGroup.Text ;

  Result := stTitle;
end;

procedure TfmInOutStateList.sg_InOutReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_InOutReport.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmInOutStateList.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('경보이력보고서','참조파일','D2DAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('경보이력보고서','시작위치',6);
  ini_fun.Free;

  dmExcelSave.ExcelPrintOut(sg_InOutReport,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;
end;

procedure TfmInOutStateList.FormShow(Sender: TObject);
begin
  inherited;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'InOutStateList';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmInOutStateList.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmInOutStateList);
Finalization
  UnRegisterClass(TfmInOutStateList);

end.
