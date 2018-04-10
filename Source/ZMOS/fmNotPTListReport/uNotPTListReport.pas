unit uNotPTListReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, Gauges, Grids, BaseGrid,
  AdvGrid, DB, ADODB,ActiveX, uSubForm, CommandArray,iniFiles,ComObj,
  AdvObj;

type
  TfmNotPTListReport = class(TfmASubForm)
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    lb_buildingcode: TLabel;
    lb_FloorCode: TLabel;
    cmb_Building: TComboBox;
    cmb_Floor: TComboBox;
    GroupBox2: TGroupBox;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    sg_report: TAdvStringGrid;
    pan_gauge: TPanel;
    Label3: TLabel;
    Gauge1: TGauge;
    ADOQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmb_BuildingChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    { Private declarations }
    procedure FormNameSet;
    procedure MemoryCreate;
    procedure MemoryFree;
    Function GetTitle : String;
  private
    procedure LoadBuildingCode;
    procedure LoadFloorCode(aBuildingCode:string);
    procedure SearchNotPTReport(aBuildingCode,aFloorCode:string);
  public
    { Public declarations }
  end;

var
  fmNotPTListReport: TfmNotPTListReport;

implementation

uses
 uDataModule1,
 uMssql,
 uPostGreSql,
 uMDBSql,
 uFireBird,
 uLomosUtil, uExcelSave;

{$R *.dfm}

procedure TfmNotPTListReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NotPTListReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  MemoryFree;
  Action := caFree;
end;

procedure TfmNotPTListReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmNotPTListReport.FormNameSet;
begin
  lb_buildingcode.Caption := FM901;
  lb_FloorCode.Caption := FM911;
  with sg_report do
  begin
    Cells[0,0] := FM902;
    Cells[1,0] := FM912;
    Cells[2,0] := FM922;
  end;
end;

procedure TfmNotPTListReport.FormCreate(Sender: TObject);
begin
  MemoryCreate;
  FormNameSet;
  LoadBuildingCode;
  LoadFloorCode('');


  dt_FromDate.Date := now -7;
  dt_toDate.Date := now;
end;

procedure TfmNotPTListReport.MemoryCreate;
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;

end;

procedure TfmNotPTListReport.MemoryFree;
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
end;

procedure TfmNotPTListReport.LoadBuildingCode;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  BuildingCodeList.Clear;
  cmb_Building.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
{  if Not IsMaster then
  begin
    if (BuildingGrade > 0) and (BuildingGrade < 4) then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end;
  end;
  }
  cmb_Building.Items.Add('전체');
  cmb_Building.ItemIndex := 0;
  BuildingCodeList.Add('');

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Building.Items.Add(FindField('LO_NAME').AsString );
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
{      if Not IsMaster then
      begin
        if (BuildingGrade > 0) and (BuildingGrade < 4) then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_BuildingCode1.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          end;
        end;
      end;   }

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNotPTListReport.LoadFloorCode(aBuildingCode: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  FloorCodeList.Clear;
  cmb_Floor.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode +''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  cmb_Floor.Items.Add('전체');
  cmb_Floor.ItemIndex := 0;
  FloorCodeList.Add('');
  if aBuildingCode = '' then Exit;
  if aBuildingCode = '000' then Exit;

  Try
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
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Floor.Items.Add(FindField('LO_NAME').AsString );
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNotPTListReport.cmb_BuildingChange(Sender: TObject);
begin
  if cmb_Building.itemindex < 0 then Exit;
  LoadFloorCode(BuildingCodeList.Strings[cmb_Building.itemindex]);
end;

procedure TfmNotPTListReport.btn_SearchClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := '';
  stFloorCode := '';
  if cmb_Building.itemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_Building.itemIndex];
  if cmb_Floor.itemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_Floor.itemIndex];

  SearchNotPTReport(stBuildingCode,stFloorCode);
end;

procedure TfmNotPTListReport.SearchNotPTReport(aBuildingCode,
  aFloorCode: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nRow : integer;
begin
  GridInit(sg_report,4,2,False);

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectNotPTReport(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          aBuildingCode,aFloorCode)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectNotPTReport(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          aBuildingCode,aFloorCode)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectNotPTReport(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date),
                          aBuildingCode,aFloorCode)
  else Exit;

  Try
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
        Exit;
      End;

      self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '조회건수:' + numberformat(inttostr(recordcount)) + '건';
      self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
      self.FindSubForm('Main').FindCommand('STATUS').Execute;

      if RecordCount < 1 then
      begin
        showmessage('조회 결과가 없습니다.');
        Exit;
      end;

      First;
      nRow := 1;
      sg_Report.RowCount := RecordCount + 1;
      While Not Eof do
      begin
        with sg_Report  do
        begin
          cells[0,nRow] := FindField('buildingname').AsString;
          cells[1,nRow] := FindField('floorname').AsString;
          cells[2,nRow] := FindField('areaname').AsString;
          cells[3,nRow] := FindField('AL_ZONENAME').AsString;
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNotPTListReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('미사용방범구역보고서','참조파일','NOTPTReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('미사용방범구역보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='미사용방범구역보고서';
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
  btn_Excel.Enabled := True;  }
end;


function TfmNotPTListReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date);
  if cmb_Building.ItemIndex > 0 then
    stTitle := stTitle + ' / 빌딩 : ' + cmb_Building.Text ;
  if cmb_Floor.ItemIndex > 0 then
    stTitle := stTitle + ' / 층 : ' + cmb_Floor.text ;

  Result := stTitle;

end;

procedure TfmNotPTListReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('미사용방범구역보고서','참조파일','NOTPTReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('미사용방범구역보고서','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmNotPTListReport.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NotPTListReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmNotPTListReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmNotPTListReport);
Finalization
  UnRegisterClass(TfmNotPTListReport);

end.
