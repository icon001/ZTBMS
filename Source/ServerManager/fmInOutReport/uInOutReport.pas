unit uInOutReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, Grids, BaseGrid, AdvGrid, StdCtrls,
  ComCtrls, Buttons, DB, ADODB, Gauges, ExtCtrls,iniFiles,ComObj, AdvObj;

type
  TfmInOutReport = class(TfmASubForm)
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
    { Private declarations }
    procedure LoadInOutGroup;
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmInOutReport: TfmInOutReport;

implementation
uses
  uDataModule1,
  uLomosUtil, uExcelSave;

{$R *.dfm}

{ TfmInOutReport }

procedure TfmInOutReport.LoadInOutGroup;
var
  stSql : string;
begin
  cmb_InOutGroup.Clear;
  stSql := 'Select IO_GROUPNAME from TB_INOUTGROUP ';
  stSql := stSql + ' GROUP BY IO_GROUPNAME ';

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
        Next;
      end;
      ItemIndex := 0;
    end;
  end;

end;

procedure TfmInOutReport.FormCreate(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  LoadInOutGroup;
end;

procedure TfmInOutReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'InOutReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;

procedure TfmInOutReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  stOldDate : string;
  stOldGroupName : string;
  nDateCount : integer;
  nGroupCount : integer;
  nRow : integer;
begin
  GridInitialize(sg_InOutReport);
  stOldDate := '';
  stOldGroupName := '';

  stSql := 'Select a.IO_DATE,b.IO_GROUPNAME,c.DO_DOORNONAME,a.IO_COUNT from TB_INOUTCOUNT a ';
  stSql := stSql + ' INNER JOIN TB_INOUTGROUP b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stsql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' INNER JOIN TB_DOOR c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stsql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ) ';
  stSql := stSql + ' Where a.IO_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_TODate.Date) + ''' ';
  if Trim(cmb_InOutGroup.Text) = '' then
  begin
    Exit;
  end;
  stSql := stSql + ' AND b.IO_GROUPNAME = ''' + cmb_InOutGroup.Text + ''' ';
  stSql := stsql + ' Order by a.IO_DATE,b.IO_GROUPNAME ';

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
    With sg_InOutReport do
    begin
      //RowCount := recordcount + 1;
      While Not Eof do
      begin
        InsertRows(nRow,1);
        Cells[0,nRow] := FindField('IO_DATE').AsString ;
        Cells[1,nRow] := FindField('IO_GROUPNAME').AsString ;
        Cells[2,nRow] := FindField('DO_DOORNONAME').AsString ;
        Cells[3,nRow] := inttostr(FindField('IO_COUNT').AsInteger);
           {
        if stOldGroupName = FindField('IO_GROUPNAME').AsString then
        begin
          nGroupCount := nGroupCount + FindField('IO_COUNT').AsInteger;
        end else
        begin
          if stOldGroupName <> '' then
          begin
            InsertRows(nRow,1);
            Cells[0,nRow] := '그룹별 합계';
            Cells[3,nRow] := inttostr(nGroupCount);
          end;
          nGroupCount := FindField('IO_COUNT').AsInteger;
          stOldGroupName := FindField('IO_GROUPNAME').AsString;
        end;
                 }
        if stOldDate = FindField('IO_DATE').AsString then
        begin
          nDateCount := nDateCount + FindField('IO_COUNT').AsInteger;
        end else
        begin
          if stOldDate <> '' then
          begin
            inc(nRow);
            InsertRows(nRow-1,1);
            Cells[0,nRow-1] := '날짜별 합계';
            Cells[3,nRow-1] := inttostr(nDateCount);
          end;
          nDateCount := FindField('IO_COUNT').AsInteger;
          stOldDate := FindField('IO_DATE').AsString;
        end;
        inc(nRow);
        Next;
      end;
      {
      InsertRows(nRow,1);
      Cells[0,nRow] := '그룹별 합계';
      Cells[3,nRow] := inttostr(nGroupCount);
      }
      //InsertRows(nRow,1);
      Cells[0,nRow] := '날짜별 합계';
      Cells[3,nRow] := inttostr(nDateCount);

    end;
  end;

end;

procedure TfmInOutReport.btn_ExcelClick(Sender: TObject);
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


function TfmInOutReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  stTitle := stTitle + ' / 입퇴실그룹 : ' + cmb_InOutGroup.Text ;

  Result := stTitle;
end;

procedure TfmInOutReport.sg_InOutReportResize(Sender: TObject);
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

procedure TfmInOutReport.btn_PrintClick(Sender: TObject);
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

procedure TfmInOutReport.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'InOutReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmInOutReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmInOutReport);
Finalization
  UnRegisterClass(TfmInOutReport);

end.
