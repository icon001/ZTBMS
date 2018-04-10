unit uSTXAtFileSend;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Gauges, ComCtrls, StdCtrls,ADODB,ActiveX, DB, Grids,
  DBGrids;

type
  TfmSTXAtFileSend = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    Gauge1: TGauge;
    btn_AtFileSave: TSpeedButton;
    btn_Close: TSpeedButton;
    Button1: TButton;
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Memo: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AtFileSaveClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Function CheckIF_CARD_DUTY_TIME(aDate:string):Boolean;
    Function InsertIntoIF_CARD_DUTY_TIME(aCompanyCode,aEmCode,aAtDate,aAtInTime,aAtOutTime:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSTXAtFileSend: TfmSTXAtFileSend;

implementation

uses
  uDataModule1,
  uRelayDB;
  
{$R *.dfm}

procedure TfmSTXAtFileSend.FormActivate(Sender: TObject);
begin
  if Not dmRelayDB.RelayAdoConnect(G_stRelayDBType2,G_stRelayDBServerIP2,G_stRelayDBServerPort2,G_stRelayDBServerName2,G_stRelayDBServerUserID2,G_stRelayDBServerUserPW2) then
  begin
    showmessage('연동 테이블에 접속 할 수 없습니다.');
  end;
  dt_Fromdate.Date := now - 1;
end;

procedure TfmSTXAtFileSend.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSTXAtFileSend.btn_AtFileSaveClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  if Not dmRelayDB.RelayDBConnected then
  begin
    if Not dmRelayDB.RelayAdoConnect(G_stRelayDBType2,G_stRelayDBServerIP2,G_stRelayDBServerPort2,G_stRelayDBServerUserID2,G_stRelayDBServerUserPW2,G_stRelayDBServerName2) then
    begin
      showmessage('연동 테이블에 접속 할 수 없습니다.');
      Exit;
    end;
  end;
  if CheckIF_CARD_DUTY_TIME(FormatDateTime('yyyy-mm-dd',dt_Fromdate.Date)) then
  begin
    showmessage('이미 전송된 근태 자료가 존재 합니다.');
    Exit;
  end;
  stSql := 'Select * from TB_ATEVENT where AT_DATE = ''' + FormatDateTime('yyyymmdd',dt_Fromdate.Date) + ''' ';
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
      if recordcount < 1 then Exit;
      Gauge1.MaxValue := recordcount;
      Gauge1.Progress := 0;
      While Not Eof do
      begin

        if Not InsertIntoIF_CARD_DUTY_TIME('040',FindField('EM_CODE').asString,FormatDateTime('yyyy-mm-dd',dt_Fromdate.Date),FindField('AT_INTIME').asString,FindField('AT_OUTTIME').asString) then
        begin
          memo.Lines.Add(FindField('EM_CODE').asString + ':Insert Fail');
        end;
        Gauge1.Progress := Gauge1.Progress + 1;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmSTXAtFileSend.CheckIF_CARD_DUTY_TIME(aDate: string): Boolean;
var
  TempAdoQuery :TADOQuery;
  stSql : string;
begin
  result := False;
  stSql := ' Select count(*) as CNT from IF_CARD_DUTY_TIME where WORKING_DATE = ''' + aDate + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmRelayDB.AttendRelayADOConnection;

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
      if recordcount < 1 then Exit;
      if FindField('CNT').asinteger > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmSTXAtFileSend.InsertIntoIF_CARD_DUTY_TIME(aCompanyCode,
  aEmCode, aAtDate, aAtInTime, aAtOutTime: string): Boolean;
var
  stSql : string;
begin
  if aAtInTime = '' then aAtInTime := aAtOutTime;
  if aAtOutTime = '' then aAtOutTime := aAtInTime;
  stSql := 'insert into IF_CARD_DUTY_TIME (IF_CARD_DUTY_TIME_ID,com_code,emp_code,working_date,attendance_date,leave_date,interface_date) ';
  stSql := stSql + ' values (Q_IF_CARD_DUTY_TIME_ID.NEXTVAL,';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + ''''+ aEmCode + ''',';
  stSql := stSql + ''''+ aAtDate + ''',';
  stSql := stSql + 'to_date(''' + aAtInTime + ''',''YYYYMMDDHH24MISS''),';
  stSql := stSql + 'to_date(''' + aAtOutTime + ''',''YYYYMMDDHH24MISS''),';
  stSql := stSql + 'sysdate)';

  result := dmRelayDB.RelayProcessExecSQL(stSql);
end;

procedure TfmSTXAtFileSend.Button1Click(Sender: TObject);
begin
  ADOQuery1.SQL.Text := ' Select * from IF_CARD_DUTY_TIME where WORKING_DATE = ''' + FormatDateTime('yyyy-mm-dd',dt_Fromdate.Date) + ''' ';
  ADOQuery1.Close;
  ADOQuery1.Open;

end;

end.
