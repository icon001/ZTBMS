unit uReAtInsert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Gauges, Buttons,ADODB,ActiveX,DateUtils;

type
  TfmReAtInsert = class(TForm)
    StaticText1: TStaticText;
    dt_Fromdate: TDateTimePicker;
    dt_todate: TDateTimePicker;
    StaticText2: TStaticText;
    btn_AtReInsert: TSpeedButton;
    btn_Close: TSpeedButton;
    Gauge1: TGauge;
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_AtReInsertClick(Sender: TObject);
  private
    AttendConfigCodeList : TStringList; //�����ڵ� ����Ʈ
    AttendConfigInFromTimeList : TStringList; //���԰��ɽ��� �ð�
    AttendConfigInToTimeList : TStringList; //���԰��ɳ� �ð�
    AttendConfigWorkTimeList : TStringList; //�ٹ� ���� �ð�
    AttendConfigOutTimeList : TStringList; //��� �ð�
    AttendConfigExtendTimeList : TStringList; //����ٹ� �ð�
    AttendConfigNightTimeList : TStringList; //�߰��ٹ� �ð�
    AttendConfigSInFromTimeList : TStringList; //������ ���԰��ɽ��� �ð�
    AttendConfigSInToTimeList : TStringList; //������ ���԰��ɳ� �ð�
    AttendConfigSWorkTimeList : TStringList; //������ �ٹ� ���� �ð�
    AttendConfigSOutTimeList : TStringList; //������ ��� �ð�
    AttendConfigSExtendTimeList : TStringList; //�����Ͽ���ٹ� �ð�
    AttendConfigSNightTimeList : TStringList; //�����Ͼ߰��ٹ� �ð�
    AttendConfigHInFromTimeList : TStringList; //������ ���԰��ɽ��� �ð�
    AttendConfigHInToTimeList : TStringList; //������ ���԰��ɳ� �ð�
    AttendConfigHWorkTimeList : TStringList; //������ �ٹ� ���� �ð�
    AttendConfigHOutTimeList : TStringList; //������ ��� �ð�
    AttendConfigHExtendTimeList : TStringList; //������ ����ٹ� �ð�
    AttendConfigHNightTimeList : TStringList; //������ �߰��ٹ� �ð�
    L_YesterDayStandTime : string;           //������¥ ���� �ð�
    L_ToDayStandTime : string;           //���ó�¥ ���� �ð�
    L_nSaturday : integer;         //0:�޹�,1:������,2:����
    L_nDeviceType : integer;       //0:������Ʈ,1:ī�帮��,2:��ư
    L_nATType : integer;           //0:�����ٹ�1:�����,2:����ٹ�
    L_nATType1 : integer;           //0:����ٹ�1:����� ���������
    L_nNonBackType : integer;           //0:�̺��ͽ����ó��,1:�̺��ͽ��������
    { Private declarations }
    Function LoadAttendConfig : Boolean;
    //����ó�� �Լ�
    Function GetATInCode(aAttendCode,aTime:string;nWeekCode:integer):string; //���Ÿ�Կ� ���� ����ڵ� ��������
    Function GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //���Ÿ�Կ� ���� ����ڵ� ��������
    Function GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer):string; //�ش������� ���Ÿ�� ��������
    Function GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //�ش���������� ��� ���� Ÿ���� ��������.
    Function GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
    Function GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function GetUpdateAttendType(aTime,aCompanyCode,aEMCode:string;dtYesterDay:TDatetime):string;

    Function InsertATTENDINCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer):Boolean;
    Function InsertATTENDOutCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDLEAVECode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;
    Function InsertATTENDBACKCode(aDate,aTime,aCompanyCode,aEMCode:String;nWeekCode:integer;dtYesterDay:TDatetime):Boolean;

    Function deleteTB_ATEVENTDtoD(aFromDate,aToDate:string):Boolean;

    Function ProcessAttendData1(aTime:String;aCardNo:String):Boolean; // ������Ʈ ���
    Function ProcessAttendData2(aTime:String;aCardNo,aAttendCode:String):Boolean; // ������ ��ȣ �Ǵ� ��ư ��� ó��
    Function GetEmployeeInfo(aCardNo:string;bPassNo:Boolean; var aCompanyCode,aEMCode:string ):Boolean;

    Function CheckHolidy(aYear,aMonth,aDay:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmReAtInsert: TfmReAtInsert;

implementation
uses
  uDataModule1,
  udmAdoQuery,
  uLomosutil,
  uMDBSql,uMssql,uPostGreSql;

{$R *.dfm}

procedure TfmReAtInsert.FormCreate(Sender: TObject);
begin
  dt_Fromdate.DateTime := Now;
  dt_toDate.DateTime := Now;

  AttendConfigCodeList := TStringList.Create; //�����ڵ� ����Ʈ
  AttendConfigInFromTimeList := TStringList.Create; //���԰��ɽ��� �ð�
  AttendConfigInToTimeList := TStringList.Create; //���԰��ɳ� �ð�
  AttendConfigWorkTimeList := TStringList.Create; //�ٹ� ���� �ð�
  AttendConfigOutTimeList := TStringList.Create; //��� �ð�
  AttendConfigExtendTimeList := TStringList.Create; //����ٹ� �ð�
  AttendConfigNightTimeList := TStringList.Create; //�߰��ٹ� �ð�
  AttendConfigSInFromTimeList := TStringList.Create; //������ ���԰��ɽ��� �ð�
  AttendConfigSInToTimeList := TStringList.Create; //������ ���԰��ɳ� �ð�
  AttendConfigSWorkTimeList := TStringList.Create; //������ �ٹ� ���� �ð�
  AttendConfigSOutTimeList := TStringList.Create; //������ ��� �ð�
  AttendConfigSExtendTimeList := TStringList.Create; //�����Ͽ���ٹ� �ð�
  AttendConfigSNightTimeList := TStringList.Create; //�����Ͼ߰��ٹ� �ð�
  AttendConfigHInFromTimeList := TStringList.Create; //������ ���԰��ɽ��� �ð�
  AttendConfigHInToTimeList := TStringList.Create; //������ ���԰��ɳ� �ð�
  AttendConfigHWorkTimeList := TStringList.Create; //������ �ٹ� ���� �ð�
  AttendConfigHOutTimeList := TStringList.Create; //������ ��� �ð�
  AttendConfigHExtendTimeList := TStringList.Create; //������ ����ٹ� �ð�
  AttendConfigHNightTimeList := TStringList.Create; //������ �߰��ٹ� �ð�

end;

procedure TfmReAtInsert.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmReAtInsert.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AttendConfigCodeList.Free;
  AttendConfigInFromTimeList.Free;
  AttendConfigInToTimeList.Free;
  AttendConfigWorkTimeList.Free;
  AttendConfigOutTimeList.Free;
  AttendConfigExtendTimeList.Free;
  AttendConfigNightTimeList.Free;
  AttendConfigSInFromTimeList.Free;
  AttendConfigSInToTimeList.Free;
  AttendConfigSWorkTimeList.Free;
  AttendConfigSOutTimeList.Free;
  AttendConfigSExtendTimeList.Free;
  AttendConfigSNightTimeList.Free;
  AttendConfigHInFromTimeList.Free;
  AttendConfigHInToTimeList.Free;
  AttendConfigHWorkTimeList.Free;
  AttendConfigHOutTimeList.Free;
  AttendConfigHExtendTimeList.Free;
  AttendConfigHNightTimeList.Free;

end;

function TfmReAtInsert.LoadAttendConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    AttendConfigCodeList.Clear;
    AttendConfigInFromTimeList.Clear;
    AttendConfigInToTimeList.Clear;
    AttendConfigWorkTimeList.Clear;
    AttendConfigOutTimeList.Clear;
    AttendConfigExtendTimeList.Clear;
    AttendConfigNightTimeList.Clear;
    AttendConfigSInFromTimeList.Clear;
    AttendConfigSInToTimeList.Clear;
    AttendConfigSWorkTimeList.Clear;
    AttendConfigSOutTimeList.Clear;
    AttendConfigSExtendTimeList.Clear;
    AttendConfigSNightTimeList.Clear;
    AttendConfigHInFromTimeList.Clear;
    AttendConfigHInToTimeList.Clear;
    AttendConfigHWorkTimeList.Clear;
    AttendConfigHOutTimeList.Clear;
    AttendConfigHExtendTimeList.Clear;
    AttendConfigHNightTimeList.Clear;

    L_YesterDayStandTime := '0000'; //���ؽð� = 00�� 00��
    L_ToDayStandTime := '0000'; // ���ؽð� = 00�� 00��
    L_nATType := 1;
    L_nATType1 := 0;

    stSql := 'select * from TB_ATCODE ';
    stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        AttendConfigCodeList.Add(FindField('AT_ATCODE').AsString);
        AttendConfigInFromTimeList.Add(FindField('AT_INFROMTIME').AsString);
        AttendConfigInToTimeList.Add(FindField('AT_INTOTIME').AsString);
        AttendConfigWorkTimeList.Add(FindField('AT_WORKSTARTTIME').AsString);
        AttendConfigOutTimeList.Add(FindField('AT_WORKENDTIME').AsString);
        AttendConfigExtendTimeList.Add(FindField('AT_EXTENDTIME').AsString);
        AttendConfigNightTimeList.Add(FindField('AT_NIGHTTIME').AsString);
        AttendConfigSInFromTimeList.Add(FindField('AT_SINFROMTIME').AsString);
        AttendConfigSInToTimeList.Add(FindField('AT_SINTOTIME').AsString);
        AttendConfigSWorkTimeList.Add(FindField('AT_SWORKSTARTTIME').AsString);
        AttendConfigSOutTimeList.Add(FindField('AT_SWORKENDTIME').AsString);
        AttendConfigSExtendTimeList.Add(FindField('AT_SEXTENDTIME').AsString);
        AttendConfigSNightTimeList.Add(FindField('AT_SNIGHTTIME').AsString);
        AttendConfigHInFromTimeList.Add(FindField('AT_HINFROMTIME').AsString);
        AttendConfigHInToTimeList.Add(FindField('AT_HINTOTIME').AsString);
        AttendConfigHWorkTimeList.Add(FindField('AT_HWORKSTARTTIME').AsString);
        AttendConfigHOutTimeList.Add(FindField('AT_HWORKENDTIME').AsString);
        AttendConfigHExtendTimeList.Add(FindField('AT_HEXTENDTIME').AsString);
        AttendConfigHNightTimeList.Add(FindField('AT_HNIGHTTIME').AsString);

        Next;
      end;

      stSql := 'select * from TB_CONFIG ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';

      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      First;
      if RecordCount > 0 then
      begin
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
            L_YesterDayStandTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'TTIME' then
            L_ToDayStandTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
            L_nSaturday := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
            L_nDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
            L_nATType := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then
            L_nATType1 := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
            L_nNonBackType := strtoint(FindField('CO_CONFIGVALUE').AsString);

          next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

procedure TfmReAtInsert.FormShow(Sender: TObject);
begin
  LoadAttendConfig;
end;

function TfmReAtInsert.GetATInCode(aAttendCode, aTime: string;
  nWeekCode: integer): string;
var
  nIndex : integer;
  stInFromTime,stWorkStartTime:string;
begin
  result := '000';

  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //������
  begin
    stInFromTime := AttendConfigHInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigHWorkTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //�����
  begin
    stInFromTime := AttendConfigSInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigSWorkTimeList.Strings[nIndex];
  end else //����
  begin
    stInFromTime := AttendConfigInFromTimeList.Strings[nIndex];
    stWorkStartTime := AttendConfigWorkTimeList.Strings[nIndex];
  end;
  if copy(aTime,9,4) < stInFromTime then result := '004' //�������
  else if copy(aTime,9,4) > stWorkStartTime then result := '002' //����
  else result := '001'; //�������

  if L_nATType1 = 1 then  result := '001';  //����� ����������̸� ����������� �ѱ�
end;

function TfmReAtInsert.GetATOutCode(aAttendCode, aTime: string;
  nWeekCode: integer; bYesterDay: Boolean): string;
var
  nIndex : integer;
  stWorkEndTime:string;
  stExtendTime:string;
  stNightTime:string;
begin
  result := '000';

  nIndex := AttendConfigCodeList.IndexOf(aAttendCode);
  if nIndex < 0 then Exit;
  if nWeekCode = 1 then  //������
  begin
    stWorkEndTime := AttendConfigHOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigHExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigHNightTimeList.Strings[nIndex];
  end else if nWeekCode = 7 then //�����
  begin
    stWorkEndTime := AttendConfigSOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigSExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigSNightTimeList.Strings[nIndex];
  end else //����
  begin
    stWorkEndTime := AttendConfigOutTimeList.Strings[nIndex];
    stExtendTime := AttendConfigExtendTimeList.Strings[nIndex];
    stNightTime := AttendConfigNightTimeList.Strings[nIndex];
  end;

  if Not bYesterDay then  //���ῡ ����̸�...
  begin
    if copy(aTime,9,4) < stWorkEndTime then result := '002' //����
    else result := '001';    //�������
    if stExtendTime <> '0000' then
    begin
      if stExtendTime > L_YesterDayStandTime then //������ ����ٹ��ð��� �����̹Ƿ� ������¥ �����϶� ���� ��
      begin
        if stNightTime > L_YesterDayStandTime then
        begin
          if (stExtendTime < copy(aTime,9,4)) and (copy(aTime,9,4) < stNightTime) then result := '003' //����ٹ�
          else if copy(aTime,9,4) >= stNightTime then result := '004'; //�߰��ٹ�
        end else result := '003'; //�߰��ٹ� ������ �����̸� ������ ����ٹ���
      end;
    end else  //�����ڵ� �̻��
    begin
      if  stNightTime <> '0000' then   //�߰��ڵ� �̻���̸� �׳� �������
      begin
        if stNightTime > L_YesterDayStandTime then  //�߰��ٹ��ð��� ������ �ƴϸ�...
        begin
          if copy(aTime,9,4) >= stNightTime then result := '004'; //�߰��ٹ�
        end;
      end;
    end;
  end else   //������ ����̸�...
  begin
    result := '001'; //���� ���
    if stExtendTime <> '0000' then //����ٹ� ������̰�...
    begin
      if stExtendTime < L_YesterDayStandTime then //����ٹ��ð��� ���������̸�
      begin
        if stExtendTime < copy(aTime,9,4) then
        begin
          result := '003'; //����ٹ�
          if stNightTime <> '0000' then //�߰��ٹ��ð� ������̰�...
          begin
            if stNightTime < L_YesterDayStandTime then  // �߰� �ٹ��� �����̸�
            begin
              if stNightTime < copy(aTime,9,4) then result := '004'; //�߰��ٹ�
            end;
          end;
        end;
      end else //����ٹ� �ð��� ���� �ð��̸�
      begin
        result := '003'; //����ٹ�
        if stNightTime <> '0000' then //�߰��ٹ��ð� ������̰�...
        begin
          if stNightTime < L_YesterDayStandTime then //�����ð����� �����̸�
          begin
            if stNightTime < copy(aTime,9,4) then result := '004'; //�߰��ٹ�
          end else result := '004';
        end;
      end;
    end else //����ٹ� ��� �� �ϰ�
    begin
      if stNightTime <> '0000' then //�߰��ٹ��ð� ������̰�...
      begin
        if stNightTime < L_YesterDayStandTime then //�߰��ٹ��ð��� ���������̸�
        begin
          if stNightTime < copy(aTime,9,4) then result := '004'; //�߰��ٹ�
        end else result := '004'; //�߰��ٹ��� ����ð������̸� �߰��ٹ�
      end;
    end;
  end;

  if L_nATType1 = 1 then  result := '001';  //����� ����������̸� ����������� �ѱ�
end;

function TfmReAtInsert.GetAttendCode(aTime, aCompanyCode, aEMCode: string;
  nWeekCode: integer): string;
begin
  result := '001';
  if L_nATType = 0 then //�����ٹ�Ÿ���̸�  ù��° ���� Ÿ���� �Ѱ��ش�.
  begin
    if AttendConfigCodeList.Count > 0 then
      result := AttendConfigCodeList.Strings[0];
  end else if L_nATType = 1 then
  begin
    result := GetEMPLOYEEATCode(aCompanyCode,aEMCode);
  end else if L_nATType = 2 then
  begin
    result := GetChangeATCode(aTime,nWeekCode);
  end;

end;

function TfmReAtInsert.GetChangeATCode(aTime: string;
  nWeekCode: integer): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  stTime : string;

begin
  result := '000';
  stTime := copy(aTime,9,4);


  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if nWeekCode = 1 then //�Ͽ��� �����Ϳ��� ã��
  begin
    stSql := stSql + ' AND AT_HINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_HINTOTIME >= ''' + stTime + ''' ';
  end else if nWeekCode = 7 then
  begin
    stSql := stSql + ' AND AT_SINFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_SINTOTIME >= ''' + stTime + ''' ';
  end else
  begin
    stSql := stSql + ' AND AT_INFROMTIME <= ''' + stTime + ''' ';
    stSql := stSql + ' AND AT_INTOTIME >= ''' + stTime + ''' ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

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
      Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmReAtInsert.GetEMPLOYEEATCode(aCompanyCode,
  aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select * from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
    stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

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
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmReAtInsert.GetEmployeeInfo(aCardNo: string; bPassNo: Boolean;
  var aCompanyCode, aEMCode: string): Boolean;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  aCompanyCode := '000';
  aEMCode := '000';

  if Not bPassNo then
  begin
    stSql := 'select a.CO_COMPANYCODE,a.EM_CODE from TB_CARD a ';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ' ;
  end
  else   //��й�ȣ�ΰ��
  begin
    stSql := 'select CO_COMPANYCODE,EM_CODE from TB_EMPLOYEE ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND EM_PASS = ''' + aCardNo + ''' ' ;
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

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
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aEMCode := FindField('EM_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmReAtInsert.GetOutAttendCode(aDate, aCompanyCode,
  aEMCode: string): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';


  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ' ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql ;

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
      if FindField('AT_ATCODE').IsNull then Result := '000'
      else if Trim(FindField('AT_ATCODE').AsString) = '' then Result := '000'
      else Result := FindField('AT_ATCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmReAtInsert.GetUpdateAttendType(aTime, aCompanyCode,
  aEMCode: string; dtYesterDay: TDatetime): string;
var
  stDate : string;
  stVarTime : string;
begin
  stDate := copy(aTime,1,8);
  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //������¥.
  end;
  
  if dmAdoQuery.DupCheckTB_ATEVENT_ATInOut(stDate,aCompanyCode,aEMCode,stVarTime) then
  begin
    if AnsiCompareStr(aTime,stVarTime) < 0 then result := '1'   //���� ���� �ð��� �Էµ� �ð� ���� ������
    else result := '2'; //���
  end
  else result := '1'; //���

end;

function TfmReAtInsert.InsertATTENDBACKCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
  result := False;
  bYesterDay := False;

  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
  begin
    dmAdoQuery.TB_ATEVENTBACKtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTBACKtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);

end;

function TfmReAtInsert.InsertATTENDINCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;
  
  //���������� ���� ����ϸ鼭 ������ ��� ǥ�� ������ ������? �������̴�. ���� ���ó�¥�� �������̴�.
  stAttendCode := GetAttendCode(aTime,aCompanyCode,aEMCode,nWeekCode);
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //�����ڵ带 ã�� ���Ѱ��
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
    begin
      dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end else
    begin
      dmAdoQuery.TB_ATEVENTIntimeUpdate(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end;
    Exit;
  end;
  stATInCode := GetATInCode(stAttendCode,aTime,nWeekCode);  //���Ÿ�Կ� ���� ����ڵ� ��������.
  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
  begin
    dmAdoQuery.TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,stATInCode);
  end else
  begin
    dmAdoQuery.TB_ATEVENTIntimeUpdate(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,stATInCode);
  end;
  result := True;

end;

function TfmReAtInsert.InsertATTENDLEAVECode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
begin
  result := False;
  bYesterDay := False;

  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
  begin
    dmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aTime);
  end else dmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aDate,aCompanyCode,aEMCode,aTime);

end;

function TfmReAtInsert.InsertATTENDOutCode(aDate, aTime, aCompanyCode,
  aEMCode: String; nWeekCode: integer; dtYesterDay: TDatetime): Boolean;
var
  bYesterDay : Boolean;
  stAttendCode : string;
  stATOutCode : string;
  nIndex : integer;
begin
  result := False;
  bYesterDay := False;

  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < L_YesterDayStandTime then
  begin
    aDate := FormatDateTime('yyyymmdd',dtYesterDay);
    bYesterDay := True;
  end;

  stAttendCode := GetOutAttendCode(aDate,aCompanyCode,aEMCode); //���� �����Ϳ��� �����ڵ带 ������.
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //�����ڵ带 ã�� ���Ѱ��
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
    begin
      dmAdoQuery.TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aTime,'000');
    end else dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,'000');
    Exit;
  end;
  
  stATOutCode := GetATOutCode(stAttendCode,aTime,nWeekCode,bYesterDay);  //����Ÿ�Կ� ���� ����ڵ� ��������.
  dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aTime,stATOutCode);
  result := True;
end;

function TfmReAtInsert.ProcessAttendData1(aTime, aCardNo: String): Boolean;
var
  stDate: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;

  stAttendCode : string; //����ڵ�
  nWeekCode : integer; //1:������,7:�����
  stAttendType : string;
  stEMCode : string;
  stCompanyCode : string;
begin
  if Not GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ������� ��ȸ����',aTime+':'+aCardNo);
    Exit;
  end;

  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stDate:= Copy(aTime,1,8);

  //������ ���������ΰ�? ����...
  nWeekCode := DayOfWeek(dtPresent); //1: �Ͽ���,7:�����
  if nWeekCode <> 1 then
    if CheckHolidy(Copy(aTime,1,4),Copy(aTime,5,2),Copy(aTime,7,2)) then nWeekCode := 1; //�������̸�

  //L_nSaturday //0:�޹�,1:������,2:����
  if nWeekCode = 7 then //����� �̸� ���Ϸ� ������ ���� üũ
  begin
    if L_nSaturday = 0 then  nWeekCode := 1      //������ ó��
    else if L_nSaturday = 2 then nWeekCode := 8; //���� ó��
  end;

  stAttendType := GetUpdateAttendType(aTime,stCompanyCode,stEMCode,dtYesterDay);

  if stAttendType = '1' then //���
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode);
  end else if stAttendType = '2' then //���
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ���� ����[�����ڵ�]',aTime+':'+stCompanyCode+':'+stEMCode+':'+stAttendType);
    Exit;
  end;

end;

function TfmReAtInsert.ProcessAttendData2(aTime, aCardNo,aAttendCode: String): Boolean;
var
  stDate: String;
  wYear    : word;
  wMonth   : word;
  wDay     : word;
  wHour    : word;
  wMinute  : word;
  wSecond  : word;
  dtPresent: TDatetime;
  dtYesterDay : TDatetime;

  nWeekCode : integer; //1:������,7:�����

  stEMCode : string;
  stCompanyCode : string;

begin
  if Not GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ������� ��ȸ����',aTime+':'+aCardNo+':'+aAttendCode);
    Exit;
  end;

  wYear  := StrtoInt(Copy(aTime,1,4));
  wMonth := StrtoInt(Copy(aTime,5,2));
  wDay   := StrtoInt(Copy(aTime,7,2));
  wHour  := StrtoInt(Copy(aTime,9,2));
  wMinute:= StrtoInt(Copy(aTime,11,2));
  wSecond:= StrtoInt(Copy(aTime,13,2));
  dtPresent:= EncodeDatetime(wYear, wMonth, wDay, wHour, wMinute, wSecond,00);
  dtYesterDay := dtPresent - 1;

  stDate:= Copy(aTime,1,8);

  //������ ���������ΰ�? ����...
  nWeekCode := DayOfWeek(dtPresent); //1: �Ͽ���,7:�����
  if nWeekCode <> 1 then
    if CheckHolidy(Copy(aTime,1,4),Copy(aTime,5,2),Copy(aTime,7,2)) then nWeekCode := 1; //�������̸�

    //L_nSaturday //0:�޹�,1:������,2:����
  if nWeekCode = 7 then //����� �̸� ���Ϸ� ������ ���� üũ
  begin
    if L_nSaturday = 0 then  nWeekCode := 1      //������ ó��
    else if L_nSaturday = 2 then nWeekCode := 8; //���� ó��
  end;

  if aAttendCode = '1' then //���
  begin
    InsertATTENDINCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode);
  end else if aAttendCode = '2' then //���
  begin
    InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
  end else if aAttendCode = '3' then //����
  begin
    InsertATTENDLEAVECode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
    //���⿡�� ����� ���� ����̸�...
    if L_nNonBackType = 0 then //�̺��ͽ� ���� �ð����� ��� ó��
      InsertATTENDOUTCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay)
    else if L_nNonBackType = 1 then //�̺��ͽ� ���� ��� ó��
    begin
      dmAdoQuery.TB_ATEVENTOuttimeUpdate(stDate,stCompanyCode,stEMCode,aTime,'001');
    end;
  end else if aAttendCode = '4' then //����
  begin
    InsertATTENDBACKCode(stDate,aTime,stCompanyCode,stEMCode,nWeekCode,dtYesterDay);
    dmAdoQuery.TB_ATEVENTOuttimeUpdate(stDate,stCompanyCode,stEMCode,'','000'); //��ٽð� ����
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ���� ����[�����ڵ�]',aTime+':'+aCardNo+':'+aAttendCode);
    Exit;
  end;

end;

function TfmReAtInsert.CheckHolidy(aYear, aMonth, aDay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_HOLIDAY ';
  stSql := stSql + ' where HO_DAY = ''' + aYear + aMonth + aDay + ''' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text :=  stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
  end;
  result := True;
end;

procedure TfmReAtInsert.btn_AtReInsertClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
  stFromDate,stToDate : string;
  stAtType : string;
  stTimestr : string;
  stCardNo : string;
begin
  stFromDate := FormatdateTime('yyyymmdd',dt_Fromdate.Date);
  stToDate := FormatdateTime('yyyymmdd',dt_Todate.Date);

  deleteTB_ATEVENTDtoD(stFromDate,stToDate);

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else if DBTYPE = 'PG' then stSql := PostGresql.SelectTB_ACCESSEVENTJOINATDEVICE(stFromDate,stToDate)
  else Exit;
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
      Gauge1.Visible := True;
      Gauge1.Progress := 0;
      Gauge1.MaxValue := recordcount;
      while Not Eof do
      begin
        stTimestr := FindField('AC_DATE').Asstring + FindField('AC_TIME').Asstring;
        stCardNo := FindField('CA_CARDNO').Asstring;
        if L_nDeviceType = 0 then
        begin
          stAtType := '0';
          ProcessAttendData1(stTimestr,stCardNo); //���������� ������Ʈ
        end else if L_nDeviceType = 1 then
        begin
          stAtType := FindField('AC_READERNO').Asstring;
          ProcessAttendData2(stTimestr,stCardNo,stAtType);  //������1�� ��� 2�� ��� 3�� ���� 4�� ����
        end else if L_nDeviceType = 2 then
        begin
          stAtType := FindField('AC_BUTTONNO').Asstring;
          ProcessAttendData2(stTimestr,stCardNo,stAtType);   //��ư 1 ��� 2 ��� 3�� ���� 4�� ����
        end;
        Gauge1.Progress := Gauge1.Progress +  1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Gauge1.Visible := False;
end;

function TfmReAtInsert.deleteTB_ATEVENTDtoD(aFromDate,
  aToDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'delete From TB_ATEVENT ';
  stSql := stSql + ' Where AT_DATE between ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

end.