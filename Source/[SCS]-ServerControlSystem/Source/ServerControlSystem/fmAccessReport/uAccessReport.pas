unit uAccessReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, FR_DSet, FR_DBSet, FR_Class, DB,
  ADODB, Grids, BaseGrid, AdvGrid, Buttons, ComCtrls, uSubForm,
  CommandArray, ExtCtrls;

type
  TfmAccessReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    sg_AccessReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    SaveDialog1: TSaveDialog;
    Label1: TLabel;
    dt_FromDate: TDateTimePicker;
    Label2: TLabel;
    dt_ToDate: TDateTimePicker;
    Label3: TLabel;
    cmb_Position: TComboBox;
    Label4: TLabel;
    cmb_AccessPermit: TComboBox;
    btn_Search: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure frmAccessReport1btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
  private
    DeviceCodeList : TStringList;
    PermitCodeList : TStringList;
    { Private declarations }
    procedure GetDoorName(cmb_box :TComboBox);
    procedure GetAccessPermit(cmb_box :TComboBox);
  public
    { Public declarations }
  end;

var
  fmAccessReport: TfmAccessReport;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmAccessReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceCodeList.Free;
  PermitCodeList.Free;
  Action := caFree;

end;

procedure TfmAccessReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
  PermitCodeList := TStringList.Create;
end;

procedure TfmAccessReport.frmAccessReport1btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAccessReport.FormActivate(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GetDoorName(cmb_Position);
  GetAccessPermit(cmb_AccessPermit);

end;

procedure TfmAccessReport.GetAccessPermit(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  PermitCodeList.Clear;
  cmb_Box.Items.Add('전체');
  PermitCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select * From TB_AUTHTYPE ';
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
      cmb_Box.Items.Add(FindField('AT_NAME').AsString);
      PermitCodeList.Add(FindField('AT_CODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmAccessReport.GetDoorName(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  DeviceCodeList.Clear;
  cmb_box.Items.Add('전체');
  DeviceCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.DO_VIEWSEQ ';
  stsql := stSql + ' From TB_DOOR a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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



procedure TfmAccessReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  GridInitialize(sg_AccessReport);
  stSql := ' SELECT a.AC_DATE,a.AC_TIME,c.DO_DOORNONAME, ';
  stSql := stSql + ' a.AC_READERNO,a.CA_CARDNO, ';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,b.AT_NAME ';
  stSql := stSql + ' FROM TB_ACCESSEVENT as a ';
  stSql := stSql + ' Left JOIN TB_AUTHTYPE as b ';
  stSql := stSql + ' ON(a.AC_AUTHTYPE = b.AT_CODE  ';
  stSql := stSql + ' AND a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Left JOIN TB_DOOR as c ';
  stSql := stSql + ' ON (a.DO_DOORNO = c.DO_DOORNO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.GROUP_CODE = c.GROUP_CODE) ';

  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_DATE BETWEEN ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date)
                 + ''' AND ''' + FormatDateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  if cmb_Position.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],1,3)));
    stSql := stSql + ' AND a.AC_ECUID = ''' + copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],4,2) + ''' ';
    stSql := stSql + ' AND a.DO_DOORNO = ''' + copy(DeviceCodeList.Strings[cmb_Position.ItemIndex],6,1) + ''' ';
  end;
  if cmb_AccessPermit.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AC_AUTHTYPE = ''' + PermitCodeList.Strings[cmb_AccessPermit.ItemIndex] + ''' ';
  end;
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';


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
      showmessage('조회데이터가 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_AccessReport.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_AccessReport  do
      begin
        cells[0,nRow] := copy(FindField('AC_DATE').AsString,1,4) + '-' + copy(FindField('AC_DATE').AsString,5,2)
                         + '-' + copy(FindField('AC_DATE').AsString,7,2)
                         + ' ' + copy(FindField('AC_TIME').AsString,1,2)
                         + ':' + copy(FindField('AC_TIME').AsString,3,2)
                         + ':' + copy(FindField('AC_TIME').AsString,5,2);   //발생시각
        cells[1,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[2,nRow] := FindField('AC_READERNO').AsString;
        cells[3,nRow] := FindField('CA_CARDNO').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;
        cells[6,nRow] := FindField('AT_NAME').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmAccessReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='출입 이력 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_AccessReport.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmAccessReport.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport;
end;

procedure TfmAccessReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

initialization
  RegisterClass(TfmAccessReport);
Finalization
  UnRegisterClass(TfmAccessReport);


end.
