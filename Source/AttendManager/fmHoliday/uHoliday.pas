unit uHoliday;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, PlannerMonthView, ComCtrls, Buttons,
  uSubForm, CommandArray;

type
  TfmHoliday = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox1: TGroupBox;
    Month: TPlannerMonthView;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Label1: TLabel;
    dt_Date: TDateTimePicker;
    Label2: TLabel;
    ed_Name: TEdit;
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
  private
    { Private declarations }
    procedure HolidayShow(aDate,aName: string);
    procedure Load_Holiday(aMonth:string);
    Function DeleteTB_Holiday(aDate:string):Boolean;
    Function InsertTB_HOLIDAY(aDate,aName:string):Boolean;
    Function UpdateTB_HOLIDAY(aDate,aName:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmHoliday: TfmHoliday;

implementation
uses
  uDataModule1,
  uMSSQL,
  uPostGreSql,
  uMDBSql;

{$R *.dfm}

procedure TfmHoliday.HolidayShow(aDate,aName: string);
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
    Month.Items.Items[i].Color := clRed;
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

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_HOLIDAYFromMonth(aMonth)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_HOLIDAYFromMonth(aMonth)
  else if DBTYPE = 'MDB' then stSql := MDBSQL.SelectTB_HOLIDAYFromMonth(aMonth)
  else Exit;

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
      HolidayShow(stDate,FindField('HO_DESC').AsString);
      Next;
    end;
  end;

end;

procedure TfmHoliday.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmHoliday.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  bResult := DeleteTB_Holiday(FormatDateTime('yyyymmdd',dt_Date.Date));
  if bResult  then Load_Holiday(FormatDateTime('yyyyMM',Month.Date));
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
  bResult := InsertTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date),ed_Name.Text);
  if Not bResult then bResult := UpdateTB_HOLIDAY(FormatDateTime('yyyymmdd',dt_Date.Date),ed_Name.Text);
  if bResult  then Load_Holiday(FormatDateTime('yyyyMM',Month.Date));

end;

function TfmHoliday.InsertTB_HOLIDAY(aDate, aName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Insert Into TB_HOLIDAY ';
  stSql := stSql + '(GROUP_CODE,HO_DAY,HO_DESC,HO_SEND) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''N'')';

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

function TfmHoliday.UpdateTB_HOLIDAY(aDate, aName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_HOLIDAY ';
  stSql := stSql + ' Set HO_DESC = ''' + aName + ''', ';
  stSql := stSql + ' HO_SEND =''N'' ';
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

end.
