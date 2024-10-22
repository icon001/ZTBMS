unit uDeviceVerInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, DB, ADODB, Gauges, ExtCtrls,iniFiles,ComObj, AdvObj;

type
  TfmDeviceVerInfo = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_DeviceInfo: TAdvStringGrid;
    AdoQuery: TADOQuery;
    btn_Excel: TSpeedButton;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_DeviceInfoResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    { Private declarations }
    procedure SearchDeviceVersionInfo;
    Function GetTitle : String;
  public
    { Public declarations }
  end;

var
  fmDeviceVerInfo: TfmDeviceVerInfo;

implementation

uses
  uDataModule1, uExcelSave;
{$R *.dfm}
procedure TfmDeviceVerInfo.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceVerInfo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceVerInfo';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

end;

procedure TfmDeviceVerInfo.btn_SearchClick(Sender: TObject);
begin
  SearchDeviceVersionInfo;
end;

procedure TfmDeviceVerInfo.FormActivate(Sender: TObject);
begin
  SearchDeviceVersionInfo;
end;

procedure TfmDeviceVerInfo.SearchDeviceVersionInfo;
var
  stSql : string;
  nRow : integer;
begin
  GridInitialize(sg_DeviceInfo);

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.AC_DEVICENAME,a.AC_VER,a.AC_DEVICECODE,a.AC_DEVICETYPE,b.ac_mcuip as NodeIP ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where ac_gubun = ''0'') b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';


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
        cells[0,nRow] := FindField('NodeIP').AsString;
        cells[1,nRow] := inttostr(FindField('AC_NodeNo').AsInteger);
        cells[2,nRow] := FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('AC_DEVICENAME').AsString;
        cells[4,nRow] := FindField('AC_VER').AsString;
        cells[5,nRow] := FindField('AC_DEVICECODE').AsString;
        cells[6,nRow] := FindField('AC_DEVICETYPE').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmDeviceVerInfo.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('기기버젼정보','참조파일','DeviceVerReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('기기버젼정보','시작위치',6);
  ini_fun.Free;

  aFileName:='기기버젼정보';
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
  btn_Excel.Enabled := True;   }
end;

procedure TfmDeviceVerInfo.sg_DeviceInfoResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_DeviceInfo.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

function TfmDeviceVerInfo.GetTitle: String;
begin
  result := '';
end;

procedure TfmDeviceVerInfo.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DeviceVerInfo';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmDeviceVerInfo.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDeviceVerInfo);
Finalization
  UnRegisterClass(TfmDeviceVerInfo);

end.
