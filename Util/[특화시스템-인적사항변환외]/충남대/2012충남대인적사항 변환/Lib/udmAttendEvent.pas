unit udmAttendEvent;

interface

uses
  SysUtils, Classes,DateUtils,ADODB,ActiveX,uDataModule1;

type
  TdmAttendEvent = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    AttendConfigCodeList : TStringList; //�����ڵ帮��Ʈ
    AttendConfigHInFromTimeList : TStringList; //������ ���԰��ɽ��� �ð�
    AttendConfigHWorkTimeList : TStringList; //������ �ٹ� ���� �ð�
    AttendConfigSInFromTimeList : TStringList; //������ ���԰��ɽ��� �ð�
    AttendConfigSWorkTimeList : TStringList; //������ �ٹ� ���� �ð�
    AttendConfigInFromTimeList : TStringList; //���԰��ɽ��� �ð�
    AttendConfigWorkTimeList : TStringList; //�ٹ� ���� �ð�
    AttendConfigHOutTimeList : TStringList; //������ ��� �ð�
    AttendConfigHExtendTimeList : TStringList; //������ ����ٹ� �ð�
    AttendConfigHNightTimeList : TStringList; //������ �߰��ٹ� �ð�
    AttendConfigSOutTimeList : TStringList; //������ ��� �ð�
    AttendConfigSExtendTimeList : TStringList; //�����Ͽ���ٹ� �ð�
    AttendConfigSNightTimeList : TStringList; //�����Ͼ߰��ٹ� �ð�
    AttendConfigOutTimeList : TStringList; //��� �ð�
    AttendConfigExtendTimeList : TStringList; //����ٹ� �ð�
    AttendConfigNightTimeList : TStringList; //�߰��ٹ� �ð�
    AttendConfigInToTimeList : TStringList; //���԰��ɳ� �ð�
    AttendConfigSInToTimeList : TStringList; //������ ���԰��ɳ� �ð�
    AttendConfigHInToTimeList : TStringList; //������ ���԰��ɳ� �ð�

    FOnSendEvent: TNotifyReceive;
    FAtYesterDayStandTime: string;
    FSaturdayType: integer;
    FATInOutDeviceType: integer;
    FATWorkInNo: string;
    FATWorkOutsideNo: string;
    FATDeviceType: integer;
    FATStartWorkNo: string;
    FATOffWorkNo: string;
    FAttendWorkingType: integer;
    FATWorkNotBackupType: integer;
    FATOutFixedType: integer;
    { Private declarations }
  private
    procedure StringListCreate;
    procedure StringListFree;
  private
    Function  GetATInCode(aAttendCode,aNowTime:string;nWeekCode:integer):string; //���Ÿ�Կ� ���� ����ڵ� ��������
    Function  GetATOutCode(aAttendCode,aTime:string;nWeekCode:integer;bYesterDay:Boolean):string; //���Ÿ�Կ� ���� ����ڵ� ��������
    Function  GetOutAttendCode(aDate,aCompanyCode,aEMCode:string):string; //�ش���������� ��� ���� Ÿ���� ��������.
    Function  GetAttendCode(aTime,aCompanyCode,aEMCode:string;nWeekCode:integer):string; //�ش������� ���Ÿ�� ��������
    Function  GetChangeATCode(aTime:string;nWeekCode:integer):string;
    Function  GetEMPLOYEEATCode(aCompanyCode,aEMCode:string):string;
  private
    Function InsertTB_ATTEND_BACKCode(aAtDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aYesterDay:Boolean):Boolean;
    Function InsertTB_ATTEND_BusinessOutCode(aAtDate,aNowTime,aCompanyCode,aEMCode:String;aWeekCode:integer;aYesterDay:Boolean):Boolean;
    Function InsertTB_ATTEND_INCode(aATDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aAtInsert:Boolean):Boolean;
    Function InsertTB_ATTEND_OutCode(aDate,aNowTime,aCompanyCode,aEMCode:String;nWeekCode:integer;aYesterDay:Boolean):Boolean;
  public
    procedure StringListClear;
    procedure AttendConfigCodeList_Add(aData:string);
    procedure AttendConfigHInFromTimeList_Add(aData:string);
    procedure AttendConfigHWorkTimeList_Add(aData:string);
    procedure AttendConfigSInFromTimeList_Add(aData:string);
    procedure AttendConfigSWorkTimeList_Add(aData:string);
    procedure AttendConfigInFromTimeList_Add(aData:string);
    procedure AttendConfigWorkTimeList_Add(aData:string);
    procedure AttendConfigHOutTimeList_Add(aData:string);
    procedure AttendConfigHExtendTimeList_Add(aData:string);
    procedure AttendConfigHNightTimeList_Add(aData:string);
    procedure AttendConfigSOutTimeList_Add(aData:string);
    procedure AttendConfigSExtendTimeList_Add(aData:string);
    procedure AttendConfigSNightTimeList_Add(aData:string);
    procedure AttendConfigOutTimeList_Add(aData:string);
    procedure AttendConfigExtendTimeList_Add(aData: string);
    procedure AttendConfigNightTimeList_Add(aData: string);
    procedure AttendConfigInToTimeList_Add(aData: string);
    procedure AttendConfigSInToTimeList_Add(aData: string);
    procedure AttendConfigHInToTimeList_Add(aData: string);
  public
    { Public declarations }
    Function Process_ATEvent(aTime,aNodeNo,aECUID,aCardNo,aDoorNo,aReaderNo,aButton:string):Boolean;
    Function Process_UpdateAttendData(aATDate,aNowTime,aCardNo,aCompanyCode,aEMCode,aAttendType:string;aWeekCode:integer;aYesterDay:Boolean;aAtInsert:Boolean):Boolean;
    Function Process_UpdateBussinessInOut(aATDate,aNowTime,aCardNo,aCompanyCode,aEMCode,aAttendType:string;aWeekCode:integer;aYesterDay:Boolean):Boolean;
  published
    Property OnSendEvent : TNotifyReceive read FOnSendEvent write FOnSendEvent;
  published
    property AtYesterDayStandTime : string read FAtYesterDayStandTime write FAtYesterDayStandTime;  //���� ���ر��½ð�
    property SaturdayType : integer read FSaturdayType write FSaturdayType; //0:����� ������ ó��, 1:����� ������ ó��,2:����� ���� ó��
    property ATDeviceType : integer read FATDeviceType write FATDeviceType; //����� 0:������Ʈ 1:ī�� 2:��ư
    property ATInOutDeviceType : integer read FATInOutDeviceType write FATInOutDeviceType; //���� ���� 0:������ 1:ī�� 2:��ư
    property ATStartWorkNo : string read FATStartWorkNo write FATStartWorkNo; //��� ��ư��
    property ATOffWorkNo : string read FATOffWorkNo write FATOffWorkNo;       //��� ��ư��
    property ATWorkInNo : string read FATWorkInNo write FATWorkInNo; //���͹�ư ��
    property ATWorkOutsideNo : string read FATWorkOutsideNo write FATWorkOutsideNo; //�����ư ��
    property AttendWorkingType : integer read FAttendWorkingType write FAttendWorkingType;   //0:�����ٹ�1:�����,2:����ٹ�
    property ATWorkNotBackupType : integer read FATWorkNotBackupType write FATWorkNotBackupType; ////���� �� �̺��� ó��0:�̺��ͽ����ó��,1:�̺��ͽ��������
    property ATOutFixedType : integer read FATOutFixedType write FATOutFixedType;  //��������ٻ������ - 0:������,1:�����
  end;

var
  dmAttendEvent: TdmAttendEvent;

implementation

uses
  udmAdoQuery,
  uCommonModule,
  uLomosUtil;

{$R *.dfm}

{ TdmAttendEvent }

function TdmAttendEvent.GetAttendCode(aTime, aCompanyCode, aEMCode: string;
  nWeekCode: integer): string;
begin
  result := '001';
  if AttendWorkingType = 0 then //�����ٹ�Ÿ���̸�  ù��° ���� Ÿ���� �Ѱ��ش�.
  begin
    if AttendConfigCodeList.Count > 0 then
      result := AttendConfigCodeList.Strings[0];
  end else if AttendWorkingType = 1 then  //����� �ٹ�Ÿ���̸� ����� �ٹ� Ÿ���� �����´�.
  begin
    result := GetEMPLOYEEATCode(aCompanyCode,aEMCode);
  end else if AttendWorkingType = 2 then  //����ٹ��� �ٹ� Ÿ���� �����´�.
  begin
    result := GetChangeATCode(aTime,nWeekCode);
  end;

end;

function TdmAttendEvent.InsertTB_ATTEND_INCode(aATDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aAtInsert: Boolean): Boolean;
var
  stAttendCode : string;
  stATInCode : string;
  nIndex : integer;
begin
  result := False;
  
  //���������� ���� ����ϸ鼭 ������ ��� ǥ�� ������ ������? �������̴�. ��� ���ó�¥�� �������̴�.
  stAttendCode := GetAttendCode(aNowTime,aCompanyCode,aEMCode,nWeekCode);
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //�����ڵ带 ã�� ���Ѱ��
  begin
    if aAtInsert then dmAdoQuery.TB_ATEVENTIntimeInsert(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000')
    else dmAdoQuery.TB_ATEVENTIntimeUpdate(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000');
    Exit;
  end;
  stATInCode := GetATInCode(stAttendCode,aNowTime,nWeekCode);  //���Ÿ�Կ� ���� ����ڵ� ��������.
  if aAtInsert then  dmAdoQuery.TB_ATEVENTIntimeInsert(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,stATInCode)
  else dmAdoQuery.TB_ATEVENTIntimeUpdate(aATDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,stATInCode);
  result := True;

end;

function TdmAttendEvent.Process_ATEvent(aTime, aNodeNo, aECUID, aCardNo,
  aDoorNo, aReaderNo, aButton: string): Boolean;
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
  stAttendType : string; //1:���,2:���
  stEMCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stEmName : string;

  nAtOutGubun : integer; //0:�����,1:���⺹��
  cAtType : char;
  bYesterDay : Boolean;
  nATDeviceType : integer;
  nReaderNo : integer;

  stClientSendData : string;
  bAtInsert : Boolean;
begin
  bYesterDay := False; //������ �����̴�.
  cAtType := ' ';

  if Not CommonModule.GetEmployeeInfo(aCardNo,False,stCompanyCode,stEMCode,stJijumCode,stDepartCode,stEmName) then
  begin
    stClientSendData := 'R' +
                        'E' +
                        aNodeNo +
                        aEcuID +
                        '00' +
                        FillZeroNumber(strtoint(aReaderNo),2) +
                        'AT' +
                        'C' +
                        FillZeroNumber(Length(aCardNo) + 15 ,3) +
                        aTime +
                        cAtType +
                        aCardNo;

    if Assigned(FOnSendEvent) then
    begin
      OnSendEvent(Self,stClientSendData,strtoint(aNodeNo));
    end;
    Exit;
  end;

  if Not IsDigit(aTime) then
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� �ð� ����',aTime+':'+aCardNo);
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

  stDate:= Copy(aTime,1,8);  //���� ���� ���ڸ� ����.
  //���ؽð��� ������ ����°�?
  if copy(aTime,9,4) < AtYesterDayStandTime then
  begin
    stDate := FormatDateTime('yyyymmdd',dtYesterDay); //������¥�� �����Ϸ� ����.
    bYesterDay := True; //������ ������ ����.
  end;

  if bYesterDay then
  begin
    //������ ���������ΰ�? ����...
    nWeekCode := DayOfWeek(dtYesterDay); //1: �Ͽ���,7:�����
  end else
  begin
    //������ ���������ΰ�? ����...
    nWeekCode := DayOfWeek(dtPresent); //1: �Ͽ���,7:�����
  end;
  
  if nWeekCode <> 1 then
  begin
    if CommonModule.CheckHolidy(Copy(stDate,1,4),Copy(stDate,5,2),Copy(stDate,7,2)) then nWeekCode := 1; //�������� �������̸�
  end;

  //L_nSaturday //0:�޹�,1:������,2:����
  if nWeekCode = 7 then //����� �̸� ���Ϸ� ������ ���� üũ
  begin
    if SaturdayType = 0 then  nWeekCode := 1      //������ ó��
    else if SaturdayType = 2 then nWeekCode := 8; //���� ó��
  end;

  //���⿡�� ���⺹������ ��������� ������ ����.

  nAtOutGubun := 0;
  if ATInOutDeviceType = 1 then  //ī�帮�� ���
  begin
    if (aReaderNo = ATWorkInNo)
    or (aReaderNo = ATWorkOutsideNo) then nAtOutGubun := 1;
  end else if ATInOutDeviceType = 2 then //��ư ���
  begin
    if (aButton = ATWorkInNo)
    or (aButton = ATWorkOutsideNo) then nAtOutGubun := 1;
  end;

  if nAtOutGubun = 0 then  //��/��� ó��
  begin
    nATDeviceType := ATDeviceType;
    if ATStartWorkNo = ATOffWorkNo then //��ư�� ���� ���̸�.
    begin
      if nATDeviceType = 1 then
      begin
        if aReaderNo[1] = ATStartWorkNo[1] then nATDeviceType := 0; //���� ���� ��� ���� ������Ʈ ������� ����
      end else if nATDeviceType = 2 then
      begin
        if aButton[1] = ATStartWorkNo[1] then nATDeviceType := 0; //��ư ���� ��� ���� ������Ʈ ������� ����
      end;
    end;
    bAtInsert := True;
    stAttendType := dmAdoQuery.GetUpdateAttendType(stDate,aTime,stCompanyCode,stEMCode,bAtInsert);
    if nATDeviceType = 0 then   //������Ʈ ��� ����� ó��
    begin
      cAtType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 1 then  //ī�帮��
    begin
      bAtInsert := True;
      cAtType := aReaderNo[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //���
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //���
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 2 then //��ư Ÿ��
    begin
      bAtInsert := True;
      cAtType := aButton[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //���
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //���
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end else if nATDeviceType = 3 then //���Թ� Ÿ��
    begin
      bAtInsert := True;
      cAtType := aDoorNo[1];
      if cAtType = ATStartWorkNo[1] then stAttendType := '1' //���
      else if cAtType = ATOffWorkNo[1] then stAttendType := '2' //���
      else stAttendType := '0';
      Process_UpdateAttendData(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay,bAtInsert);
    end;
  end else if nAtOutGubun = 1 then //���� ���� ó��
  begin
    if ATInOutDeviceType = 1 then  //ī�帮��
    begin
      cAtType := aReaderNo[1];
      if cAtType = ATWorkOutsideNo[1] then stAttendType := '1' //����
      else if cAtType = ATWorkInNo[1] then stAttendType := '2' //����
      else stAttendType := '0';
      Process_UpdateBussinessInOut(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay);
    end else if ATInOutDeviceType = 2 then  //��ư Ÿ��
    begin
      cAtType := aButton[1];
      if cAtType = ATWorkOutsideNo[1] then stAttendType := '1' //����
      else if cAtType = ATWorkInNo[1] then stAttendType := '2' //����
      else stAttendType := '0';
      Process_UpdateBussinessInOut(stDate,aTime,aCardNo,stCompanyCode,stEMCode,stAttendType,nWeekCode,bYesterDay);
    end;
  end;

  if isDigit(aReaderNo) then nReaderNo := strtoint(aReaderNo)
  else nReaderNo := 0;
  
  stClientSendData := 'R' +
                      'E' +
                      aNodeNo +
                      aEcuID +
                      '00' +
                      FillZeroNumber(strtoint(aReaderNo),2) +
                      'AT' +
                      'C' +
                      FillZeroNumber(Length(aCardNo+';'+inttostr(nAtOutGubun)+';'+stAttendType) + 15 ,3) +
                      aTime +
                      cAtType +
                      aCardNo+';'+inttostr(nAtOutGubun)+';'+stAttendType;

  if Assigned(FOnSendEvent) then
  begin
    OnSendEvent(Self,stClientSendData,strtoint(aNodeNo));
  end;

end;

function TdmAttendEvent.Process_UpdateAttendData(aATDate, aNowTime,
  aCardNo, aCompanyCode, aEMCode, aAttendType: string; aWeekCode: integer;
  aYesterDay, aAtInsert: Boolean): Boolean;
begin

  if aAttendType = '1' then //���
  begin
    InsertTB_ATTEND_INCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aAtInsert);
  end else if aAttendType = '2' then //���
  begin
    InsertTB_ATTEND_OutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ���� ����[�����ڵ�]',aNowTime+':'+aCompanyCode+':'+aEMCode+':'+aAttendType);
    Exit;
  end;

end;

function TdmAttendEvent.Process_UpdateBussinessInOut(aATDate, aNowTime,
  aCardNo, aCompanyCode, aEMCode, aAttendType: string; aWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin

  if aAttendType = '1' then //����
  begin
    InsertTB_ATTEND_BusinessOutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
    //���⿡�� ����� ���� ����̸�...
    if ATWorkNotBackupType = 0 then //�̺��ͽ� ���� �ð����� ��� ó��
      InsertTB_ATTEND_OutCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay)
    else if ATWorkNotBackupType = 1 then //�̺��ͽ� ���� ��� ó��
    begin
      dmAdoQuery.TB_ATEVENTOuttimeUpdate(aATDate,aCompanyCode,aEMCode,aNowTime,'001');
    end;
  end else if aAttendType = '2' then //����
  begin
    InsertTB_ATTEND_BACKCode(aATDate,aNowTime,aCompanyCode,aEMCode,aWeekCode,aYesterDay);
    if Not dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aATDate,aNowTime,aCompanyCode,aEMCode) then  //��� �ð��� ���� �ð����� ������ 
       dmAdoQuery.TB_ATEVENTOuttimeUpdate(aATDate,aCompanyCode,aEMCode,'','000'); //��ٽð� ����
  end else
  begin
    ErrorLogSave(ExeFolder + '\..\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log',
                 '���� ������ ���� ����[�����ڵ�]',aNowTime+':'+aCompanyCode+':'+aEMCode+':'+aAttendType);
    Exit;
  end;

end;

procedure TdmAttendEvent.DataModuleCreate(Sender: TObject);
begin
  StringListCreate;
end;

procedure TdmAttendEvent.StringListCreate;
begin
    AttendConfigCodeList := TStringList.Create;
    AttendConfigHInFromTimeList := TStringList.Create; //������ ���԰��ɽ��� �ð�
    AttendConfigHWorkTimeList := TStringList.Create; //������ �ٹ� ���� �ð�
    AttendConfigSInFromTimeList := TStringList.Create; //������ ���԰��ɽ��� �ð�
    AttendConfigSWorkTimeList := TStringList.Create; //������ �ٹ� ���� �ð�
    AttendConfigInFromTimeList := TStringList.Create; //���԰��ɽ��� �ð�
    AttendConfigWorkTimeList := TStringList.Create; //�ٹ� ���� �ð�
    AttendConfigHOutTimeList := TStringList.Create; //������ ��� �ð�
    AttendConfigHExtendTimeList := TStringList.Create; //������ ����ٹ� �ð�
    AttendConfigHNightTimeList := TStringList.Create; //������ �߰��ٹ� �ð�
    AttendConfigSOutTimeList := TStringList.Create; //������ ��� �ð�
    AttendConfigSExtendTimeList := TStringList.Create; //�����Ͽ���ٹ� �ð�
    AttendConfigSNightTimeList := TStringList.Create; //�����Ͼ߰��ٹ� �ð�
    AttendConfigOutTimeList := TStringList.Create; //��� �ð�
    AttendConfigExtendTimeList := TStringList.Create; //����ٹ� �ð�
    AttendConfigNightTimeList := TStringList.Create; //�߰��ٹ� �ð�
    AttendConfigInToTimeList := TStringList.Create; //���԰��ɳ� �ð�
    AttendConfigSInToTimeList := TStringList.Create; //������ ���԰��ɳ� �ð�
    AttendConfigHInToTimeList := TStringList.Create; //������ ���԰��ɳ� �ð�
end;

procedure TdmAttendEvent.StringListClear;
begin
    AttendConfigCodeList.Clear;
    AttendConfigHInFromTimeList.Clear; //������ ���԰��ɽ��� �ð�
    AttendConfigHWorkTimeList.Clear;
    AttendConfigSInFromTimeList.Clear; //������ ���԰��ɽ��� �ð�
    AttendConfigSWorkTimeList.Clear; //������ �ٹ� ���� �ð�
    AttendConfigInFromTimeList.Clear; //���԰��ɽ��� �ð�
    AttendConfigWorkTimeList.Clear; //�ٹ� ���� �ð�
    AttendConfigHOutTimeList.Clear; //������ ��� �ð�
    AttendConfigHExtendTimeList.Clear; //������ ����ٹ� �ð�
    AttendConfigHNightTimeList.Clear; //������ �߰��ٹ� �ð�
    AttendConfigSOutTimeList.Clear; //������ ��� �ð�
    AttendConfigSExtendTimeList.Clear; //�����Ͽ���ٹ� �ð�
    AttendConfigSNightTimeList.Clear; //�����Ͼ߰��ٹ� �ð�
    AttendConfigOutTimeList.Clear; //��� �ð�
    AttendConfigExtendTimeList.Clear; //����ٹ� �ð�
    AttendConfigNightTimeList.Clear; //�߰��ٹ� �ð�
    AttendConfigInToTimeList.Clear; //���԰��ɳ� �ð�
    AttendConfigSInToTimeList.Clear; //������ ���԰��ɳ� �ð�
    AttendConfigHInToTimeList.Clear; //������ ���԰��ɳ� �ð�
end;

procedure TdmAttendEvent.AttendConfigCodeList_Add(aData: string);
begin
  //if AttendConfigCodeList.IndexOf(aData) < 0 then
  AttendConfigCodeList.Add(aData);
end;

procedure TdmAttendEvent.StringListFree;
begin
    AttendConfigCodeList.Free; //�����ڵ� ����Ʈ
    AttendConfigHInFromTimeList.Free; //������ ���԰��ɽ��� �ð�
    AttendConfigHWorkTimeList.Free; //������ �ٹ� ���� �ð�
    AttendConfigSInFromTimeList.Free; //������ ���԰��ɽ��� �ð�
    AttendConfigSWorkTimeList.Free; //������ �ٹ� ���� �ð�
    AttendConfigInFromTimeList.Free; //���԰��ɽ��� �ð�
    AttendConfigWorkTimeList.Free; //�ٹ� ���� �ð�
    AttendConfigHOutTimeList.Free; //������ ��� �ð�
    AttendConfigHExtendTimeList.Free; //������ ����ٹ� �ð�
    AttendConfigHNightTimeList.Free; //������ �߰��ٹ� �ð�
    AttendConfigSOutTimeList.Free; //������ ��� �ð�
    AttendConfigSExtendTimeList.Free; //�����Ͽ���ٹ� �ð�
    AttendConfigSNightTimeList.Free; //�����Ͼ߰��ٹ� �ð�
    AttendConfigOutTimeList.Free; //��� �ð�
    AttendConfigExtendTimeList.Free; //����ٹ� �ð�
    AttendConfigNightTimeList.Free; //�߰��ٹ� �ð�
    AttendConfigInToTimeList.Free; //���԰��ɳ� �ð�
    AttendConfigSInToTimeList.Free; //������ ���԰��ɳ� �ð�
    AttendConfigHInToTimeList.Free; //������ ���԰��ɳ� �ð�
end;

procedure TdmAttendEvent.DataModuleDestroy(Sender: TObject);
begin
  StringListFree;
end;

function TdmAttendEvent.GetEMPLOYEEATCode(aCompanyCode,
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

function TdmAttendEvent.GetChangeATCode(aTime: string;
  nWeekCode: integer): string;
var
  stSql:string;
  TempAdoQuery : TADOQuery;
  stTime : string;

begin
  result := '001';
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

function TdmAttendEvent.GetATInCode(aAttendCode, aNowTime: string;
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
    if nIndex < AttendConfigHInFromTimeList.Count then stInFromTime := AttendConfigHInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigHWorkTimeList.Count then  stWorkStartTime := AttendConfigHWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end else if nWeekCode = 7 then //�����
  begin
    if nIndex < AttendConfigSInFromTimeList.Count then stInFromTime := AttendConfigSInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigSWorkTimeList.Count then  stWorkStartTime := AttendConfigSWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end else //����
  begin
    if nIndex < AttendConfigInFromTimeList.Count then stInFromTime := AttendConfigInFromTimeList.Strings[nIndex]
    else stInFromTime := '0000';
    if nIndex < AttendConfigWorkTimeList.Count then stWorkStartTime := AttendConfigWorkTimeList.Strings[nIndex]
    else stWorkStartTime := '0000';
  end;
  if copy(aNowTime,9,4) < stInFromTime then result := '004' //�������
  else if copy(aNowTime,9,4) > stWorkStartTime then result := '002' //����
  else result := '001'; //�������

  if ATOutFixedType = 1 then  result := '001';  //����� ����������̸� ����������� �ѱ�

end;

function TdmAttendEvent.InsertTB_ATTEND_OutCode(aDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aYesterDay: Boolean): Boolean;
var
  stAttendCode : string;
  stATOutCode : string;
  nIndex : integer;
begin
  result := False;

  stAttendCode := GetOutAttendCode(aDate,aCompanyCode,aEMCode); //���� �����Ϳ��� �����ڵ带 ������.
  nIndex := AttendConfigCodeList.IndexOf(stAttendCode);
  if nIndex = -1 then //�����ڵ带 ã�� ���Ѱ��
  begin
    if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
    begin
      dmAdoQuery.TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,stAttendCode,inttostr(nWeekCode),aNowTime,'000');
    end else
    begin
      if dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aDate,aNowTime,aCompanyCode,aEMCode) then   //��ٽð��� ���ų� ����ð����� ���� ���
         dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aNowTime,'000');
    end;
    Exit;
  end;
  
  if dmAdoQuery.DupCheckTB_ATEVENT_OutTime(aDate,aNowTime,aCompanyCode,aEMCode) then   //��ٽð��� ���ų� ����ð����� ���� ���
  begin
    stATOutCode := GetATOutCode(stAttendCode,aNowTime,nWeekCode,aYesterDay);  //����Ÿ�Կ� ���� ����ڵ� ��������.
    dmAdoQuery.TB_ATEVENTOuttimeUpdate(aDate,aCompanyCode,aEMCode,aNowTime,stATOutCode);
    result := True;
  end;
end;

function TdmAttendEvent.InsertTB_ATTEND_BusinessOutCode(aAtDate, aNowTime,
  aCompanyCode, aEMCode: String; aWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin
  result := False;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aAtDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
  begin
    dmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aAtDate,aCompanyCode,aEMCode,inttostr(aWeekCode),aNowTime);
  end else
  begin
    if dmAdoQuery.DupCheckTB_ATEVENT_BussinessOutTime(aAtDate,aNowTime,aCompanyCode,aEMCode) then   //�ܱٽð��� ���ų� ����ð����� ū ���
       dmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aAtDate,aCompanyCode,aEMCode,aNowTime);
  end;

end;

function TdmAttendEvent.InsertTB_ATTEND_BACKCode(aAtDate, aNowTime,
  aCompanyCode, aEMCode: String; nWeekCode: integer;
  aYesterDay: Boolean): Boolean;
begin
  result := False;

  if  Not dmAdoQuery.DupCheckTB_AT_EVENT(aAtDate,aCompanyCode,aEMCode) then //�ߺ� ������ üũ�Ͽ� ������ Insert  ������ ����
  begin
    dmAdoQuery.TB_ATEVENTBACKtimeInsert(aAtDate,aCompanyCode,aEMCode,inttostr(nWeekCode),aNowTime);
  end else
  begin
    if dmAdoQuery.DupCheckTB_ATEVENT_BussinessInTime(aAtDate,aNowTime,aCompanyCode,aEMCode) then   //���ͽð��� ���ų� ����ð����� ���� ���
      dmAdoQuery.TB_ATEVENTBACKtimeUpdate(aAtDate,aCompanyCode,aEMCode,aNowTime);
  end;

end;

procedure TdmAttendEvent.AttendConfigHInFromTimeList_Add(aData: string);
begin
  //if AttendConfigHInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigHInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHWorkTimeList_Add(aData: string);
begin
  //if AttendConfigHWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigHWorkTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSInFromTimeList_Add(aData: string);
begin
  //if AttendConfigSInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigSInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSWorkTimeList_Add(aData: string);
begin
  //if AttendConfigSWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigSWorkTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigInFromTimeList_Add(aData: string);
begin
  //if AttendConfigInFromTimeList.IndexOf(aData) < 0 then
  AttendConfigInFromTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigWorkTimeList_Add(aData: string);
begin
  //if AttendConfigWorkTimeList.IndexOf(aData) < 0 then
  AttendConfigWorkTimeList.Add(aData);
end;

function TdmAttendEvent.GetOutAttendCode(aDate, aCompanyCode,
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

function TdmAttendEvent.GetATOutCode(aAttendCode, aTime: string;
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
    if nIndex < AttendConfigHOutTimeList.Count then stWorkEndTime := AttendConfigHOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigHExtendTimeList.Count then stExtendTime := AttendConfigHExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigHNightTimeList.Count then stNightTime := AttendConfigHNightTimeList.Strings[nIndex]
    else stNightTime := '2400';
  end else if nWeekCode = 7 then //�����
  begin
    if nIndex < AttendConfigSOutTimeList.Count then stWorkEndTime := AttendConfigSOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigSExtendTimeList.Count then stExtendTime := AttendConfigSExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigSNightTimeList.Count then stNightTime := AttendConfigSNightTimeList.Strings[nIndex]
    else stNightTime := '2400';
  end else //����
  begin
    if nIndex < AttendConfigOutTimeList.Count then stWorkEndTime := AttendConfigOutTimeList.Strings[nIndex]
    else stWorkEndTime := '2400';
    if nIndex < AttendConfigExtendTimeList.Count then stExtendTime := AttendConfigExtendTimeList.Strings[nIndex]
    else stExtendTime := '2400';
    if nIndex < AttendConfigNightTimeList.Count then stNightTime := AttendConfigNightTimeList.Strings[nIndex]
    else stNightTime :='2400';
  end;

  if Not bYesterDay then  //���ῡ ����̸�...
  begin
    if copy(aTime,9,4) < stWorkEndTime then result := '002' //����
    else result := '001';    //�������
    if stExtendTime <> '0000' then
    begin
      if stExtendTime > AtYesterDayStandTime then //������ ����ٹ��ð��� �����̹Ƿ� ������¥ �����϶� ���� ��
      begin
        if stNightTime > AtYesterDayStandTime then
        begin
          if (stExtendTime < copy(aTime,9,4)) and (copy(aTime,9,4) < stNightTime) then result := '003' //����ٹ�
          else if copy(aTime,9,4) >= stNightTime then result := '004'; //�߰��ٹ�
        end else result := '003'; //�߰��ٹ� ������ �����̸� ������ ����ٹ���
      end;
    end else  //�����ڵ� �̻��
    begin
      if  stNightTime <> '0000' then   //�߰��ڵ� �̻���̸� �׳� �������
      begin
        if stNightTime > AtYesterDayStandTime then  //�߰��ٹ��ð��� ������ �ƴϸ�...
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
      if stExtendTime < AtYesterDayStandTime then //����ٹ��ð��� ���������̸�
      begin
        if stExtendTime < copy(aTime,9,4) then
        begin
          result := '003'; //����ٹ�
          if stNightTime <> '0000' then //�߰��ٹ��ð� ������̰�...
          begin
            if stNightTime < AtYesterDayStandTime then  // �߰� �ٹ��� �����̸�
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
          if stNightTime < AtYesterDayStandTime then //�����ð����� �����̸�
          begin
            if stNightTime < copy(aTime,9,4) then result := '004'; //�߰��ٹ�
          end else result := '004';
        end;
      end;
    end else //����ٹ� ��� �� �ϰ�
    begin
      if stNightTime <> '0000' then //�߰��ٹ��ð� ������̰�...
      begin
        if stNightTime < AtYesterDayStandTime then //�߰��ٹ��ð��� ���������̸�
        begin
          if stNightTime < copy(aTime,9,4) then result := '004'; //�߰��ٹ�
        end else result := '004'; //�߰��ٹ��� ����ð������̸� �߰��ٹ�
      end;
    end;
  end;
  if ATOutFixedType = 1 then  result := '001';  //����� ����������̸� ����������� �ѱ�

end;

procedure TdmAttendEvent.AttendConfigHOutTimeList_Add(aData: string);
begin
  //if AttendConfigHOutTimeList.IndexOf(aData) < 0 then
  AttendConfigHOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHExtendTimeList_Add(aData: string);
begin
  //if AttendConfigHExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigHExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHNightTimeList_Add(aData: string);
begin
  //if AttendConfigHNightTimeList.IndexOf(aData) < 0 then
  AttendConfigHNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSOutTimeList_Add(aData: string);
begin
  //if AttendConfigSOutTimeList.IndexOf(aData) < 0 then
  AttendConfigSOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSExtendTimeList_Add(aData: string);
begin
  //if AttendConfigSExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigSExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSNightTimeList_Add(aData: string);
begin
  //if AttendConfigSNightTimeList.IndexOf(aData) < 0 then
  AttendConfigSNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigOutTimeList_Add(aData: string);
begin
  //if AttendConfigOutTimeList.IndexOf(aData) < 0 then
  AttendConfigOutTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigExtendTimeList_Add(aData: string);
begin
  //if AttendConfigExtendTimeList.IndexOf(aData) < 0 then
  AttendConfigExtendTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigNightTimeList_Add(aData: string);
begin
  //if AttendConfigNightTimeList.IndexOf(aData) < 0 then
  AttendConfigNightTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigHInToTimeList_Add(aData: string);
begin
  //if AttendConfigHInToTimeList.IndexOf(aData) < 0 then
  AttendConfigHInToTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigInToTimeList_Add(aData: string);
begin
  //if AttendConfigInToTimeList.IndexOf(aData) < 0 then
  AttendConfigInToTimeList.Add(aData);
end;

procedure TdmAttendEvent.AttendConfigSInToTimeList_Add(aData: string);
begin
  //if AttendConfigSInToTimeList.IndexOf(aData) < 0 then
  AttendConfigSInToTimeList.Add(aData);
end;

end.
