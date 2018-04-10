unit uATStateCalc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ComCtrls, DB, ADODB;

type
  TfmATStateCalc = class(TForm)
    btn_Summary: TBitBtn;
    btn_Close: TBitBtn;
    Label1: TLabel;
    dt_Date: TDateTimePicker;
    Gauge: TGauge;
    ADOQuery: TADOQuery;
    ADOExec: TADOQuery;
    ADOTemp: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SummaryClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    HolidayList : TStringList;
    { Private declarations }
    Function SummaryCheck(var aUser:string) : Boolean;
    Function SummaryWork(aState : string):Boolean;
    Function GetHoliday:integer;
    Function SaturdayATCheck:Boolean; //����� �޹� üũ
    Function DeleteTB_MONTHAT(aMonth:string):Boolean;
    Function ATDataSummary(aMonth,aLastDay,aCardNo:string):Boolean; //�ش�� �ش�ī�� ����
    Function UpdateTB_MONTHAT(aMonth,aCardNo,aField,aValue,aType:string):Boolean;
    Function GetNightCheck(aCode,aIntime,aOutTime:string;var aValue:string;Var aNightTime:integer):Boolean;
    Function GetATCode(aInTime:string; var aCode,aNightTime :string):Boolean;
    Function CalcTime(aNightTime,aOutTime:string):integer;
  public
    { Public declarations }
  end;

var
  fmATStateCalc: TfmATStateCalc;

implementation
uses
uDataModule1,
uLomosUtil;

{$R *.dfm}

procedure TfmATStateCalc.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmATStateCalc.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
end;

procedure TfmATStateCalc.btn_SummaryClick(Sender: TObject);
var
  stSql : string;
  stMonth : string;
  bResult : Boolean;
  stUser : string;
  stCardNo : string;
  nLastDay : integer; //�ش���� ������ ��¥
begin

  btn_Summary.Enabled := False;
  //����üũ
  nLastDay := GetHoliday;

  stMonth := FormatDateTime('yyyymm',dt_Date.Date);

  bResult := SummaryCheck(stUser);
  if Not bResult then
  begin
    showmessage('���� ' + stUser + '�� ���� �۾� ���Դϴ�.');
    Exit;
  end;

  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      btn_Summary.Enabled := True;
      showmessage('���̺� ���� ����');
      Exit;
    End;
    if recordCount < 1 then  Exit;

    Gauge.Visible := True;
    Gauge.MaxValue := recordCount;
    Gauge.Progress := 0;
    SummaryWork('START');
    DeleteTB_MONTHAT(stMonth);  //�۾��� �����͸� ���� �Ͽ� Ŭ���� �Ѵ�.
    while Not Eof do
    begin
      stCardNo := FindField('CA_CARDNO').AsString ;
      ATDataSummary(stMonth,FillzeroNumber(nLastDay,2),stCardNo);
      Gauge.Progress := Gauge.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  Gauge.Visible := False;
  SummaryWork('END');
  btn_Summary.Enabled := True;
end;

function TfmATStateCalc.SummaryCheck(var aUser:string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CU_STATECODE = ''ATSUMMARY'' ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Result := True
    else
    begin
      aUser := FindField('CU_STATEVALUE').AsString ;
    end;
  end;
end;

function TfmATStateCalc.SummaryWork(aState: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  if aState = 'START' then
  begin
    stSql := 'Insert Into TB_CURRENTDAEMON(GROUP_CODE,CU_STATECODE,CU_STATEVALUE)';
    stsql := stSql + ' VALUES (''' + GROUPCODE + ''',';
    stSql := stSql + '''ATSUMMARY'',';
    stSql := stSql + '''' + Master_ID + ''')';
  end
  else if aState = 'END' then
  begin
    stSql := 'Delete From TB_CURRENTDAEMON ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''' ;
    stSql := stSql + ' AND CU_STATECODE = ''ATSUMMARY''';
  end;

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

  Result := True;
end;

procedure TfmATStateCalc.FormCreate(Sender: TObject);
begin
  HolidayList := TStringList.Create;
end;

procedure TfmATStateCalc.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  HolidayList.Free;
end;

function TfmATStateCalc.GetHoliday: integer;
var
  stSql : string;
  stMonth : string;
  stDate : string;
  i : integer;
  bSaturDay : Boolean;
begin
  result := 0;
  bSaturDay := SaturdayATCheck;
  stMonth := FormatDateTime('yyyy-mm',dt_Date.Date);
  HolidayList.Clear;
  for i := 1 to 32 do
  begin
    stDate := stMonth + '-' + FillZeroNumber(i,2);
    if Not DateCheck(stDate) then break;
    if DayOfWeek(StrtoDate(stDate)) = 1 then
        HolidayList.Add(StringReplace(stDate,'-','',[rfReplaceAll])); //�Ͽ���
    if bSaturDay then
    begin
      if DayOfWeek(StrtoDate(stDate)) = 7 then
          HolidayList.Add(StringReplace(stDate,'-','',[rfReplaceAll])); //�����
    end;
  end;
  result := i - 1; //������ ��¥ ����
  stSql := 'select * From TB_HOLIDAY';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND HO_DAY Between ''' + FormatDateTime('yyyymm',dt_Date.Date) + '01'' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymm',dt_Date.Date) + '31'' ';

  with AdoTemp do
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
      if HolidayList.IndexOf(FindField('HO_DAY').AsString) < 0 then HolidayList.Add(FindField('HO_DAY').AsString);
      Next;
    end;
  end;
  HolidayList.Sort;
end;

function TfmATStateCalc.SaturdayATCheck: Boolean;
var
  stSql : string;
begin
  result := True;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''SATURDAY'' ';

  with AdoTemp do
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
    if FindField('CO_CONFIGVALUE').AsString = 'N' then Result := False;
  end;
end;

function TfmATStateCalc.DeleteTB_MONTHAT(aMonth: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_MONTHAT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND MO_MONTH = ''' + aMonth + ''' ';

  with ADOExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Execsql;
    Except
      Exit;
    End;

  end;
  result := True;
end;

function TfmATStateCalc.ATDataSummary(aMonth, aLastDay,
  aCardNo: string): Boolean;
var
  stSql : string;
  nTotCnt : integer; //�� ����ؾ� �� ����
  nATCnt : integer;  // ����ϼ�
  nJikakCnt : integer; //�����ϼ�
  nJotaeCnt : integer;  //�����ϼ�
  nNightCnt : integer;  //�߱��ϼ�
  nNightTime : integer;  //�߱� �ð�(��)
  nTempTime : integer;
  nHolidayCnt : integer; //���ϱٹ��ϼ�
  nHolidayTime : integer; //���ϱٹ��ð�(��)
  nABSENCECNT : integer; //����ϼ�
  i : integer;
  stValue : string; //'0'�ٹ�����,'1'���������,'2'�����������,'3'�����������,'4'��������,'A'���,'B'���ϱٹ�,'C'�߱�,'D'�����߱�
  bResult : Boolean;
begin
  result := False;
  nTotCnt := strtoint(aLastDay) - HolidayList.Count ; //�� ��¥ �� ���� ��¥�� �� ���� ����ؾ� �� ��¥.
  stSql := ' Insert Into TB_MONTHAT(GROUP_CODE,MO_MONTH,CA_CARDNO) ';
  stSql := stSql + ' VALUES(''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aMonth + ''',';
  stSql := stSql + '''' + aCardNo + ''')';

  with AdoExec do
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

  stSql := ' Select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE Between ''' + aMonth + '01'' ';
  stSql := stSql + ' AND ''' + aMonth + aLastDay + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' Order By AT_DATE ';

  with AdoQuery1 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nATCnt := 0;
    nJikakCnt := 0;
    nJotaeCnt := 0;
    nNightCnt := 0;
    nNightTime := 0;
    nHolidayCnt := 0;
    nHolidayTime := 0;
    nABSENCECNT := 0;
    if RecordCount < 1 then
    begin
      for i := 1 to strtoint(aLastDay) do
      begin
        if HolidayList.IndexOf(aMonth + FillZeroNumber(i,2)) < 0 then
        begin
          inc(nABSENCECNT);
          UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'A','CHAR');  //���
        end else
          UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'0','CHAR'); //�ٹ�����
      end;
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ATCNT' ,inttoStr(nATCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JIKAKCNT' ,inttoStr(nJikakCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JOTAECNT' ,inttoStr(nJotaeCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTCNT' ,inttoStr(nNightCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_TOTATCNT' ,inttoStr(nTotCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ABSENCECNT' ,inttoStr(nABSENCECNT),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTTIME' ,inttoStr(nNightTime),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYCNT' ,inttoStr(nHolidayCnt),'INTEGER');
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYTIME' ,inttoStr(nHolidayTime),'INTEGER');

      Result := True;
      Exit;
    end;
    nATCnt := RecordCount; //�� ����ϼ�
    for i := 1 to strtoint(aLastDay) do
    begin
      if HolidayList.IndexOf(aMonth + FillZeroNumber(i,2)) < 0 then
      begin
        inc(nABSENCECNT);
        UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'A','CHAR');  //���
      end else
        UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + FillZeroNumber(i,2),'0','CHAR'); //�ٹ�����
    end;
    First;
    While Not Eof do
    begin
      if HolidayList.IndexOf(FindField('AT_DATE').AsString) < 0 then //����ٹ�
      begin
        stValue := '1' ; //'0'�ٹ�����,'1'���������,'2'�����������,'3'�����������,'4'��������,'A'���,'B'���ϱٹ�,'C'�߱�,'D'�����߱�
        nABSENCECNT := nABSENCECNT - 1;
        if FindField('AT_INRESULT').AsString = 'N' then   //�������̸�
        begin
          stValue := '3';
          inc(nJikakCnt);
          bResult := False;
          if FindField('AT_OUTRESULT').AsString = 'N' then
          begin
            stValue := '4'; //�������̸�
            inc(nJotaeCnt);
          end
          else bResult := GetNightCheck(FindField('AT_ATCODE').AsString,FindField('AT_INTIME').AsString,FindField('AT_OUTTIME').AsString,stValue,nTempTime);
          if bResult then
          begin
            inc(nNightCnt);
            nNightTime := nNightTime + nTempTime;
          end;
        end else
        begin
          bResult := False;
          if FindField('AT_OUTRESULT').AsString = 'N' then
          begin
            stValue := '2';
            inc(nJotaeCnt);
          end
          else bResult := GetNightCheck(FindField('AT_ATCODE').AsString,FindField('AT_INTIME').AsString,FindField('AT_OUTTIME').AsString,stValue,nTempTime);
          if bResult then
          begin
           inc(nNightCnt);
           nNightTime := nNightTime + nTempTime;
          end;
        end;
      end else begin //���ϱٹ�
        inc(nHolidayCnt);
        nTempTime := CalcTime(copy(FindField('AT_INTIME').AsString,9,4),copy(FindField('AT_OUTTIME').AsString,9,4)) ;
        nHolidayTime := nHolidayTime + nTempTime;
        stValue := 'B'; //���ϱٹ�
      end;
      UpdateTB_MONTHAT(aMonth,aCardNo,'MO_' + Copy(FindField('AT_DATE').AsString,7,2),stValue,'CHAR');  //���

      Next;
    end;
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ATCNT' ,inttoStr(nATCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JIKAKCNT' ,inttoStr(nJikakCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_JOTAECNT' ,inttoStr(nJotaeCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTCNT' ,inttoStr(nNightCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_TOTATCNT' ,inttoStr(nTotCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_ABSENCECNT' ,inttoStr(nABSENCECNT),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_NIGHTTIME' ,inttoStr(nNightTime),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYCNT' ,inttoStr(nHolidayCnt),'INTEGER');
    UpdateTB_MONTHAT(aMonth,aCardNo,'MO_HOLIDAYTIME' ,inttoStr(nHolidayTime),'INTEGER');

  end;

  result := True;
end;

function TfmATStateCalc.UpdateTB_MONTHAT(aMonth, aCardNo, aField,
  aValue,aType: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := ' Update TB_MONTHAT SET ' + aField + ' = ';
  if aType = 'CHAR' then stSql := stSql + '''';
  stSql := stSql + aValue ;
  if aType = 'CHAR' then stSql := stSql + '''';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND MO_MONTH = ''' + aMonth + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with AdoExec  do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
    Result := True;
  end;
end;

function TfmATStateCalc.GetNightCheck(aCode,aIntime,aOutTime:string; var aValue: string; Var aNightTime:integer): Boolean;
var
  bResult : Boolean;
  stNightTime : string;
begin
  result := False;
  bResult := True;
  aNightTime := 0;
  bResult := GetATCode(aInTime,aCode,stNightTime);
  if Not bResult then Exit; //stNightTime �� ������ �� ��� �߱� üũ ���� ����.
  if Length(Trim(stNightTime)) <> 4 then Exit; //stNightTime �� ������ �� ��� �߱� üũ ���� ����.
  if strtoint(stNightTime) < strtoint(copy(aOutTime,9,4)) then //���� ��¥�ΰ�� üũ
  begin
    aNightTime := CalcTime(stNightTime,copy(aOutTime,9,4));
    if aValue = '3' then aValue := 'D'        //�����߱�
    else if aValue = '1' then aValue := 'C';  //����߱�
    result := True; //�߱ٽÿ��� True
  end else if strtoint(copy(aIntime,1,8)) < strtoint(copy(aOutTime,1,8)) then //���� ��� ������ ����ΰ��
  begin
    aNightTime := CalcTime(stNightTime,copy(aOutTime,9,4));
    if aValue = '3' then aValue := 'D'        //�����߱�
    else if aValue = '1' then aValue := 'C';  //����߱�
    result := True; //�߱ٽÿ��� True
  end;

end;

function TfmATStateCalc.GetATCode(aInTime: string;
  var aCode,aNightTime: string): Boolean;
var
  stSql : string;
  nRow : integer;
begin
  result := False;
  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Trim(aCode) <> '' then stSql := stSql + ' AND AT_ATCODE = ''' + aCode + ''' ';
  aNightTime := '';

  with AdoTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql ;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    if Trim(aCode) <> '' then
    begin
      aNightTime := FindField('AT_NIGHTTIME').AsString;
    end else
    begin
      While Not Eof do
      begin
        if FindField('AT_INFROMTIME').asInteger < FindField('AT_INTOTIME').asInteger then   //�����ΰ��
        begin
          if FindField('AT_INFROMTIME').asInteger < strtoint(aInTime) then
          begin
            if FindField('AT_INTOTIME').asInteger > strtoint(aInTime) then
            begin
              aCode :=  FindField('AT_ATCODE').AsString;
              aNightTime := FindField('AT_NIGHTTIME').AsString;
              Break;
            end;
          end;
        end else   //�������� �Ѿ�� ���
        begin
          if FindField('AT_INFROMTIME').asInteger < strtoint(aInTime) then
          begin
            aCode :=  FindField('AT_ATCODE').AsString;
            aNightTime := FindField('AT_NIGHTTIME').AsString;
            Break;
          end else if  FindField('AT_INTOTIME').asInteger > strtoint(aInTime) then
          begin
            aCode :=  FindField('AT_ATCODE').AsString;
            aNightTime := FindField('AT_NIGHTTIME').AsString;
            Break;
          end;
        end;
        Next;
      end;
    end; //If

  end;
  if Trim(aCode) <> '' then result := True;
end;

function TfmATStateCalc.CalcTime(aNightTime, aOutTime: string): integer;
var
  nBasicHH : integer;
  nBasicMM : integer;
  nDestHH : integer;
  nDestMM : integer;
  nCalcHH : integer;
  nCalcMM : integer;
begin
  nBasicHH := strtoint(copy(aNightTime,1,2));
  nBasicMM := strtoint(copy(aNightTime,3,2));
  nDestHH := strtoint(copy(aOutTime,1,2));
  nDestMM := strtoint(copy(aOutTime,3,2));

  if nBasicHH > nDestHH then nDestHH := nDestHH + 24; //������ ������ ������ ���
  if nBasicMM > nDestMM then
  begin
    nDestHH := nDestHH - 1;
    nDestMM := nDestMM + 60;
  end;
  nCalcHH := nDestHH - nBasicHH;
  nCalcMM := nDestMM - nBasicMM;
  result := (nCalcHH * 60) + nCalcMM;
end;

end.
