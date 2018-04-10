unit uDoorAdminReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, uSubForm,
  CommandArray, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, AdvObj;

type
  TfmDoorAdminReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    btn_Search: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Close: TSpeedButton;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    cmb_Door: TComboBox;
    sg_DoorReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    DeviceCodeList :TStringList;
    { Private declarations }
    procedure GetDoorName(cmb_box :TComboBox);
  public
    { Public declarations }
  end;

var
  fmDoorAdminReport: TfmDoorAdminReport;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmDoorAdminReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorAdminReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
  
  DeviceCodeList.Free;
end;

procedure TfmDoorAdminReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GetDoorName(cmb_Door);
  GridInitialize(sg_DoorReport);

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorAdminReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmDoorAdminReport.GetDoorName(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  DeviceCodeList.Clear;
  cmb_box.Items.Add('전체');
  DeviceCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.DO_VIEWSEQ ';
  stsql := stSql + ' From TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
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
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

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
      cmb_Box.Items.Add(FindField('DO_DOORNONAME').AsString);
      DeviceCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)
                       + FindField('AC_ECUID').AsString
                       + FindField('DO_DOORNO').AsString);
      Next;
    end;
  end;

end;

procedure TfmDoorAdminReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
end;

procedure TfmDoorAdminReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDoorAdminReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow: integer;
begin
  GridInitialize(sg_DoorReport);
  stSql := 'select a.*,b.DO_DOORNONAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.AC_NUMBER = b.DO_DOORNO ) ';
  if Not IsMaster then //Master 가 아니면
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.AC_NUMBER = c.DO_DOORNO ';
      stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''') ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_TYPE = ''1'' ';
  stSql := stSql + ' AND a.SY_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_ToDate.Date) + ''' ';

  if cmb_Door.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Door.ItemIndex],1,3))) ;
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(DeviceCodeList.Strings[cmb_Door.ItemIndex],4,2) + ''' ';
    stSql := stSql + ' AND a.AC_NUMBER = ''' + copy(DeviceCodeList.Strings[cmb_Door.ItemIndex],6,1) + ''' ';
  end;
  stSql := stSql + ' order by a.SY_DATE,a.SY_TIME ';

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
    if recordCount < 1 then
    begin
      showmessage('조회 데이터가 없습니다.');
      Exit;
    end;
    sg_DoorReport.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_DoorReport do
      begin
        Cells[0,nRow] := FindField('SY_DATE').AsString;
        Cells[1,nRow] := FindField('SY_TIME').AsString;
        Cells[2,nRow] := FindField('SY_OPERATOR').AsString;
        Cells[3,nRow] := FindField('SY_CLIENTIP').AsString;
        Cells[4,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[5,nRow] := FindField('CA_CARDNO').AsString;
        Cells[6,nRow] := FindField('SY_LOGDATA').AsString;
      end;
      inc(nRow);
      Next;
    end;
  end;
end;

procedure TfmDoorAdminReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='출입문 운영보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_DoorReport.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmDoorAdminReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport;
end;

procedure TfmDoorAdminReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmDoorAdminReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmDoorAdminReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDoorAdminReport);
Finalization
  UnRegisterClass(TfmDoorAdminReport);

end.
