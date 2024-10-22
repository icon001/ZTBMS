unit uHoliday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PlannerMonthView, ComCtrls, Buttons,
  uSubForm, CommandArray,ActiveX,ADODB;

type
  TfmHoliday = class(TfmASubForm)
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    dt_Date: TDateTimePicker;
    ed_Name: TEdit;
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    Month: TPlannerMonthView;
    cmb_HolidayType: TComboBox;
    procedure MonthDateChange(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure FormActivate(Sender: TObject);
    procedure MonthDayChange(Sender: TObject; origDate,
      newDate: TDateTime);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    procedure HolidayShow(aDate,aName,aType: string);
    procedure Load_Holiday(aMonth:string);
    function CheckTB_HOLIDAY(aDate:string):Boolean;
    Function DeleteTB_Holiday(aDate:string):Boolean;
    Function InsertTB_HOLIDAY(aDate,aName,aState,aHoType:string):Boolean;
    Function UpdateTB_HOLIDAY(aDate,aName,aState,aHoType:string):Boolean;
    Function updateTB_ACCESSDEVICEHoSend(aHoSend:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmHoliday: TfmHoliday;

implementation
uses
  uDataModule1,
  uMssql,
  uMDBSql,
  uPostGreSql, uFireBird;

{$R *.dfm}

procedure TfmHoliday.HolidayShow(aDate,aName,aType: string);
var
  i : integer;
begin
  with Month.CreateItem do
  begin
    ItemStartTime :=  strToDate(aDate);
    ItemEndTime := strToDate(aDate);
    Text.Text := aName;
  end;

  for i:= 0 to Month.Items.Count - 1 do
  begin
    if FormatDateTime('yyyymmdd',Month.Items.Items[i].ItemStartTime)
       = stringreplace(aDate,'-','',[rfReplaceAll]) then
    begin
      if aType = '3' then Month.Items.Items[i].Color := clRed
      else if aType = '4' then Month.Items.Items[i].Color := clYellow
      else if aType = '5' then Month.Items.Items[i].Color := clBlue;
    end;
    Month.Items.Items[i].Font.Size := 3;
  end;

end;

procedure TfmHoliday.MonthDateChange(Sender: TObject; origDate,
  newDate: TDateTime);
var
  i : integer;
begin
  Load_Holiday(FormatDateTime('yyyyMM',Month.Date));
  dt_Date.Date := Month.Date;
  
  ed_Name.Text := '';
  for i:= 0 to Month.Items.Count - 1 do
  begin
    if FormatDateTime('yyyymmdd',Month.Items.Items[i].ItemStartTime)
       = FormatDateTime('yyyymmdd',Month.Date) then
    begin
      ed_Name.Text := Month.Items.Items[i].Text.Strings[0] ;
      if Month.Items.Items[i].Color = clRed then cmb_HolidayType.ItemIndex := 0
      else if Month.Items.Items[i].Color = clYellow then cmb_HolidayType.ItemIndex := 1
      else if Month.Items.Items[i].Color = clBlue then cmb_HolidayType.ItemIndex := 2
      else cmb_HolidayType.ItemIndex := 0;
      break;
    end;
  end;

end;

procedure TfmHoliday.FormActivate(Sender: TObject);
begin
  Month.Date := Now;
  dt_date.Date := Now;
  Load_Holiday(FormatDateTime('yyyyMM',Month.Date));

end;

procedure TfmHoliday.MonthDayChange(Sender: TObject; origDate,
  newDate: TDateTime);
var
  i : integer;
begin
  dt_Date.Date := Month.Date;
  
  ed_Name.Text := '';
  for i:= 0 to Month.Items.Count - 1 do
  begin
    if FormatDateTime('yyyymmdd',Month.Items.Items[i].ItemStartTime)
       = FormatDateTime('yyyymmdd',Month.Date) then
    begin
      ed_Name.Text := Month.Items.Items[i].Text.Strings[0] ;
      if Month.Items.Items[i].Color = clRed then cmb_HolidayType.ItemIndex := 0
      else if Month.Items.Items[i].Color = clYellow then cmb_HolidayType.ItemIndex := 1
      else if Month.Items.Items[i].Color = clBlue then cmb_HolidayType.ItemIndex := 2
      else cmb_HolidayType.ItemIndex := 0;
      break;
    end;
  end;

end;

procedure TfmHoliday.Load_Holiday(aMonth: string);
var
  stSql : string;
  stDate : string;
begin
  ed_Name.Text := '';
  Month.Items.Clear;
  if DBTYPE = 'MSSQL' then
  begin
    stSql := Mssql.SelectTB_HOLIDAYFromMonth(aMonth);
  end else if DBTYPE = 'PG' then
  begin
    stSql := PostGreSql.SelectTB_HOLIDAYFromMonth(aMonth);
  end else if DBTYPE = 'MDB' then
  begin
    stSql := MDBsql.SelectTB_HOLIDAYFromMonth(aMonth);
  end else if DBTYPE = 'FB' then
  begin
    stSql := FireBird.SelectTB_HOLIDAYFromMonth(aMonth);
  end else Exit;
  stSql := stSql + ' AND HO_STATE = ''I'' ';

  with DataModule1.ADOTmpQuery  do
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
      stDate := copy(FindField('HO_DAY').AsString,1,4) + '-' +
                copy(FindField('HO_DAY').AsString,5,2) + '-' +
                copy(FindField('HO_DAY').AsString,7,2);
      HolidayShow(stDate,FindField('HO_DESC').AsString,FindField('HO_TYPE').AsString);
      Next;
    end;
  end;
  MonthDayChange(self,Month.Date,Month.Date);

end;

procedure TfmHoliday.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmHoliday.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
//  bResult := DeleteTB_Holiday(FormatDateTime('yyyymmdd',dt_Date.Date));
  UpdateTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date),ed_Name.Text,'D',inttostr(cmb_HolidayType.ItemIndex + 3));
  updateTB_ACCESSDEVICEHoSend('N');
  Load_Holiday(FormatDateTime('yyyyMM',Month.Date));
end;

function TfmHoliday.DeleteTB_Holiday(aDate:string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_HOLIDAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  With DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;

  end;
  result := True;
end;

procedure TfmHoliday.btn_SaveClick(Sender: TObject);
var
  bResult :Boolean;
begin
  if Trim(ed_Name.Text) = '' then Exit;
  if Not CheckTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date)) then
  begin
    InsertTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date),ed_Name.Text,'I',inttostr(cmb_HolidayType.itemindex + 3));
  end else
  begin
    UpdateTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date),ed_Name.Text,'I',inttostr(cmb_HolidayType.itemindex + 3));
  end;
  updateTB_ACCESSDEVICEHoSend('N');
  Load_Holiday(FormatDateTime('yyyyMM',Month.Date));

end;

function TfmHoliday.InsertTB_HOLIDAY(aDate, aName,aState,aHoType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HOLIDAY ';
  stSql := stSql + '(GROUP_CODE,HO_DAY,HO_DESC,HO_SEND,HO_STATE,HO_TYPE) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aState + ''',';
  stSql := stSql + '' + aHoType + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmHoliday.UpdateTB_HOLIDAY(aDate, aName,aState,aHoType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_HOLIDAY ';
  stSql := stSql + ' Set HO_DESC = ''' + aName + ''', ';
  stSql := stSql + ' HO_SEND =''N'', ';
  stSql := stSql + ' HO_STATE = ''' + aState + ''', ';
  stSql := stSql + ' HO_TYPE = ' + aHoType + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmHoliday.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'HOLIDAY'+ DATADELIMITER + FormatDateTime('yyyy',Now) + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmHoliday.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Save.Enabled := True
    else btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

procedure TfmHoliday.FormResize(Sender: TObject);
var
  nWidth : integer;
begin
  nWidth := fmHoliday.Width;
  btn_Delete.Left := (nWidth div 2) - (btn_Delete.Width div 2);
  btn_Save.Left := (nWidth div 2) - (btn_Delete.Width div 2) - btn_Save.Width - 50;
  btn_Close.Left := (nWidth div 2) + (btn_Delete.Width div 2) + 50;

end;

function TfmHoliday.CheckTB_HOLIDAY(aDate: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_DAY = ''' + aDate + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmHoliday.updateTB_ACCESSDEVICEHoSend(aHoSend: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set HO_SEND = ''' + aHoSend + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
