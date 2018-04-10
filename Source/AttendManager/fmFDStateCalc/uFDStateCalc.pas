unit uFDStateCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, StdCtrls, Buttons, Gauges;

type
  TfmFDStateCalc = class(TForm)
    Label1: TLabel;
    Gauge: TGauge;
    btn_Summary: TBitBtn;
    btn_Close: TBitBtn;
    dt_Date: TDateTimePicker;
    ADOQuery: TADOQuery;
    ADOExec: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SummaryClick(Sender: TObject);
  private
    { Private declarations }
    Function  UpdateFOODAMT(aGroupCode,
                    aDate,
                    aTime,
                    aNodeNo,
                    aEcuID,
                    aReaderNo,
                    aCardNo,
                    aFoodAmt : string):Boolean;
  public
    { Public declarations }
  end;

var
  fmFDStateCalc: TfmFDStateCalc;

implementation
uses
uDataModule1,
uLomosUtil;

{$R *.dfm}

procedure TfmFDStateCalc.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFDStateCalc.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
end;

procedure TfmFDStateCalc.btn_SummaryClick(Sender: TObject);
var
  stSql : string;
  nFoodAmt : integer;
begin
  stSql := ' select a.GROUP_CODE,a.FO_DATE,a.FO_TIME,a.AC_NODENO,';
  stSql := stSql + ' a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO,a.CA_CARDNO,';
  stSql := stSql + ' b.FO_AMTPER,c.FO_AMT ';
  stSql := stSql + ' from ';
  stSql := stSql + ' TB_FOODEVENT a ';
  stSql := stSql + ' Inner Join TB_FOOD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Inner Join TB_FOODCODE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.FO_FOODCODE = c.FO_FOODCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE =  ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE BETWEEN ''' + FormatDateTime('yyyyMM',dt_Date.Date) + '01'' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyyMM',dt_Date.Date) + '31'' ';

  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('테이블 오픈 실패');
      Exit;
    End;
    btn_Summary.Enabled := False;
    Gauge.Visible := True;
    Gauge.MaxValue := recordCount;
    Gauge.Progress := 0;
    While Not Eof do
    begin
      nFoodAmt := (FindField('FO_AMT').AsInteger *  FindField('FO_AMTPER').AsInteger) div 100 ;
      UpdateFOODAMT(FindField('GROUP_CODE').AsString,
                    FindField('FO_DATE').AsString,
                    FindField('FO_TIME').AsString,
                    FindField('AC_NODENO').AsString,
                    FindField('AC_ECUID').AsString,
                    FindField('FO_DOORNO').AsString,
                    FindField('CA_CARDNO').AsString,
                    inttostr(nFoodAmt));
      Gauge.Progress := Gauge.Progress + 1;
      Next;
    End;
    Gauge.Visible := False;
    btn_Summary.Enabled := True;
    showmessage('집계 완료');
  end;
end;

function TfmFDStateCalc.UpdateFOODAMT(aGroupCode, aDate, aTime, aNodeNo,
  aEcuID, aReaderNo, aCardNo, aFoodAmt: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_FOODEVENT Set FO_FOODAMT = ' + aFoodAmt ;
  stSql := stSql + ' where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOExec do
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

end.
