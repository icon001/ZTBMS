unit uCardAdminReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, uSubForm,
  CommandArray, FR_DSet, FR_DBSet, FR_Class, DB, ADODB, ExtCtrls, AdvObj;

type
  TfmCardAdminReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    sg_AlarmReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    SaveDialog1: TSaveDialog;
    ed_cardNo: TEdit;
    Panel1: TPanel;
    btn_Close: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_CardSearch: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_PrintClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CardSearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    DeviceCodeList : TStringList;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmCardAdminReport: TfmCardAdminReport;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCardSearch;

{$R *.dfm}

procedure TfmCardAdminReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardAdminReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;

  DeviceCodeList.Free;
end;

procedure TfmCardAdminReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardAdminReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
end;

procedure TfmCardAdminReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardAdminReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmCardAdminReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow: integer;
begin
  GridInitialize(sg_AlarmReport);
  stSql := 'select a.*,b.AR_NAME,c.DO_DOORNONAME from TB_SYSTEMLOG a ';
  stSql := stSql + ' Left Join TB_ARMAREA b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND a.AC_NUMBER = substring(b.AR_AREANO,2,1) )  ';
  stSql := stSql + ' Left Join TB_DOOR c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  stSql := stSql + ' AND a.AC_NUMBER = c.DO_DOORNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.SY_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + ed_cardNo.Text + ''' ';
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
    sg_AlarmReport.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_AlarmReport do
      begin
        Cells[0,nRow] := FindField('SY_DATE').AsString;
        Cells[1,nRow] := FindField('SY_TIME').AsString;
        Cells[2,nRow] := FindField('SY_OPERATOR').AsString;
        Cells[3,nRow] := FindField('SY_CLIENTIP').AsString;
        Cells[4,nRow] := FindField('CA_CARDNO').AsString;
        Cells[5,nRow] := FindField('AR_NAME').AsString;
        Cells[6,nRow] := FindField('DO_DOORNONAME').AsString;
        Cells[7,nRow] := FindField('SY_LOGDATA').AsString;
      end;
      inc(nRow);
      Next;
    end;
  end;
end;

procedure TfmCardAdminReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='경비구역 운영보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_AlarmReport.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmCardAdminReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date) + '  카드번호:' + ed_cardNo.Text ;

end;

procedure TfmCardAdminReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport;

end;

procedure TfmCardAdminReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmCardAdminReport.btn_CardSearchClick(Sender: TObject);
begin
  fmCardSearch:= TfmCardSearch.Create(Self);
  fmCardSearch.SHowmodal;
  ed_cardNo.Text := fmCardSearch.SelectCardNo;
  fmCardSearch.free;
  btn_SearchClick(self);
end;

procedure TfmCardAdminReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmCardAdminReport);
Finalization
  UnRegisterClass(TfmCardAdminReport);

end.
