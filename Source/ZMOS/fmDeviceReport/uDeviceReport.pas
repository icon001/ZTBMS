unit uDeviceReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls, Grids, BaseGrid, AdvGrid, Buttons,
  DB, ADODB, uSubForm, CommandArray,iniFiles,ComObj, AdvObj;

type
  TfmDeviceListReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Excel: TSpeedButton;
    sg_DeviceInfo: TAdvStringGrid;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    AdoQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    { Private declarations }
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmDeviceListReport: TfmDeviceListReport;

implementation
uses
  uDataModule1,
  uLomosUtil, uExcelSave;
{$R *.dfm}

procedure TfmDeviceListReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceListReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceListReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
end;

procedure TfmDeviceListReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  GridInitialize(sg_DeviceInfo);

  stSql := 'select c.LO_NAME,b.AC_MCUIP,b.AC_DEVICENAME as McuName,a.AC_ECUID, ';
  stSql := stSql + 'd.AR_NAME as AL_ZONENAME,e.DO_DOORNONAME as door1Name,f.DO_DOORNONAME as door2Name ';
  stSql := stSql + 'from TB_ACCESSDEVICE a ';
  stSql := stSql + 'Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + 'ON(a.AC_NODENO = b.AC_NODENO and  b.AC_GUBUN = ''0'') ';
  stSql := stSql + 'Left Join TB_LOCATION c ';
  stSql := stSql + 'ON(a.LO_DONGCODE = c.LO_DONGCODE and c.LO_GUBUN = ''0'') ';
  stSql := stSql + 'Left Join TB_ARMAREA d ';
  stSql := stSql + 'ON(a.AC_NODENO = d.AC_NODENO and a.AC_ECUID = d.AC_ECUID and d.AR_AREANO = ''00'' and d.AR_USE = ''Y'') ';
  stSql := stSql + 'Left Join TB_DOOR e ';
  stSql := stSql + 'ON(a.AC_NODENO = e.AC_NODENO and a.AC_ECUID = e.AC_ECUID and e.DO_DOORNO = ''1'') ';
  stSql := stSql + 'Left Join TB_DOOR f ';
  stSql := stSql + 'ON(a.AC_NODENO = f.AC_NODENO and a.AC_ECUID = f.AC_ECUID and f.DO_DOORNO = ''2'') ';

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
      showmessage('기기내역이 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_DeviceInfo.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_DeviceInfo  do
      begin
        cells[0,nRow] := FindField('LO_NAME').AsString;
        cells[1,nRow] := FindField('AC_MCUIP').AsString;
        cells[2,nRow] := FindField('McuName').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('AL_ZONENAME').AsString;
        cells[5,nRow] := FindField('door1Name').AsString;
        cells[6,nRow] := FindField('door2Name').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmDeviceListReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('장비리스트','참조파일','DeviceListReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('장비리스트','시작위치',6);
  ini_fun.Free;

  aFileName:='장비리스트';
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
        dmExcelSave.ExcelPrintOut(sg_DeviceInfo,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_DeviceInfo.SaveToCSV(stSaveFileName);
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
      if Not ExcelPrintOut(sg_DeviceInfo,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
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


function TfmDeviceListReport.GetTitle: String;
begin
  result := '';

end;

procedure TfmDeviceListReport.FormShow(Sender: TObject);
begin
  inherited;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceListReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmDeviceListReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDeviceListReport);
Finalization
  UnRegisterClass(TfmDeviceListReport);

end.
