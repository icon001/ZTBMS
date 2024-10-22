unit uAdminChangeReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, uSubForm,
  CommandArray, DB, ADODB, FR_DSet, FR_DBSet, FR_Class, AdvObj, RzCmboBx;

type
  TfmAdminChangeReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btn_Search: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Close: TSpeedButton;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    sg_DoorReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Label3: TLabel;
    ed_MasterID: TEdit;
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
  public
    { Public declarations }
  end;

var
  fmAdminChangeReport: TfmAdminChangeReport;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmAdminChangeReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AdminChangeReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
  
  DeviceCodeList.Free;
end;

procedure TfmAdminChangeReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GridInitialize(sg_DoorReport);

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AdminChangeReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmAdminChangeReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
end;

procedure TfmAdminChangeReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAdminChangeReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow: integer;
begin
  GridInitialize(sg_DoorReport);
  stSql := 'select * from TB_LOGINCREATEHIS ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LC_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  if ed_MasterID.Text <> '' then stSql := stSql + ' AND AD_USERID Like ''%' + ed_MasterID.Text + '%'' ';
  stSql := stSql + ' order by LC_DATE,LC_SEQ ';

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
        Cells[0,nRow] := FindField('LC_DATE').AsString;
        Cells[1,nRow] := FindField('AD_USERID').AsString;
        Cells[2,nRow] := FindField('AD_USERNAME').AsString;
        Cells[3,nRow] := FindField('GR_GRADECODE').AsString;
        Cells[4,nRow] := FindField('AD_MASTER').AsString;
        Cells[5,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[6,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[7,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[8,nRow] := FindField('AD_BUILDINGGRADE').AsString;
        Cells[9,nRow] := FindField('LO_DONGCODE').AsString;
        Cells[10,nRow] := FindField('LO_FLOORCODE').AsString;
        Cells[11,nRow] := FindField('LO_AREACODE').AsString;
        Cells[12,nRow] := FindField('AD_UPDATETIME').AsString;
        Cells[13,nRow] := FindField('AD_UPDATEOPERATER').AsString;
        Cells[14,nRow] := FindField('LC_PCIP').AsString;
        if(FindField('LC_MODE').AsString='1') then Cells[15,nRow] := '입력'
        else if(FindField('LC_MODE').AsString='2') then Cells[15,nRow] := '수정'
        else if(FindField('LC_MODE').AsString='3') then Cells[15,nRow] := '삭제'
        else Cells[15,nRow] := '';
      end;
      inc(nRow);
      Next;
    end;
  end;
end;

procedure TfmAdminChangeReport.btn_FileSaveClick(Sender: TObject);
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

procedure TfmAdminChangeReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport;
end;

procedure TfmAdminChangeReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmAdminChangeReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmAdminChangeReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmAdminChangeReport);
Finalization
  UnRegisterClass(TfmAdminChangeReport);

end.
