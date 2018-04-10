unit udmDaySummary;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX;

type
  TSummaryEvent = procedure(Sender: TObject;  EventType,EventData:string) of object;

  TdmDaySummary = class(TDataModule)
    ADOQuery: TADOQuery;
    ADOTmpQuery: TADOQuery;
    ADOSummary: TADOQuery;
    ADOMonthSummary: TADOQuery;
  private
    FSaturday: integer;
    FMonthLastDay: integer;
    FsExtendAdd: integer;
    FhNightAdd: integer;
    FhNormalAdd: integer;
    FhExtendAdd: integer;
    FExtendAdd: integer;
    FATType: integer;
    FNightAdd: integer;
    FEarlyAdd: integer;
    FWeekTime: integer;
    FsEarlyAdd: integer;
    FMonthATTime: integer;
    FATTypePay: integer;
    FsNightAdd: integer;
    FhEarlyAdd: integer;
    FYesterDayTime: string;
    FOnEvent: TSummaryEvent;
    { Private declarations }
    Function VacationCheck(aDate,aCompanyCode,aEmCode:string; var aPayVacation,aNonPayVacation:string):Boolean;
    Function GetPerAmt(aTimeAmt,aMinuate,aPer:integer;bFixedAmt:Boolean):integer;
    Function GetPersonType(aCompanyCode,aEmCode,aWeekCode:string;aTimeAmt:integer;var aInfromAdd,aWorkAdd,aExtendAdd,aNightAdd:integer;var bFixedAmt:Boolean):Boolean;
    Function GetTB_EMPLOYEE_Info(aCompanyCode,aEmCode:string;var aJijumCode,aDepartCode,aEmName:string):Boolean;
  private
    Function InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,aAtType,aWeekCode,aInfromMM,aWorkMM,
                          aExtendMM,aNightMM,aPayVacation,aNonPayVacation,aInfromAmt,aWorkAmt,
                          aExtendAmt,aNightAmt,aJiKag,aJotae,aRealyATTimeMM,aLeaveCount,aBackCount,aJijumCode,aDepartCode,aEmName:string):Boolean;

    Function DeleteTB_AtDAYSUMMARY(aDate,aCompanyCode,aEmCode:string):Boolean;
  public
    { Public declarations }
    Function DaySummary(aDate,aWeekCode,
                   aCompanyCode,aEmCode,aPayGubun,aPayAmt,aWorkStartTime,aWorkEndTime:string):Boolean;
  public
    property Saturday : integer read FSaturday write FSaturday;    //0:�޹�,1:������,2:����
    property ATTypePay : integer read FATTypePay write FATTypePay;  //0:����Ÿ�Կ� ���� ���,1:������� ���
    property ATType : integer read FATType write FATType;          //0:�����ٹ�Ÿ��,1:������ٹ�Ÿ��,2:����ٹ�Ÿ�� ,3:ȥ��Ÿ��
    property EarlyAdd : integer read FEarlyAdd write FEarlyAdd;    //���� ���Ⱑ��
    property ExtendAdd : integer read FExtendAdd write FExtendAdd; //���� ����
    property NightAdd : integer read FNightAdd write FNightAdd;    //���� �ɾ�
    property sEarlyAdd : integer read FsEarlyAdd write FsEarlyAdd; //����� ���Ⱑ��
    property sExtendAdd : integer read FsExtendAdd write FsExtendAdd;   //����� ����
    property sNightAdd : integer read FsNightAdd write FsNightAdd;      //����� �ɾ�
    property hEarlyAdd : integer read FhEarlyAdd write FhEarlyAdd;      //������ ���Ⱑ��
    property hNormalAdd : integer read FhNormalAdd write FhNormalAdd;   //������ ���Ⱑ��
    property hExtendAdd : integer read FhExtendAdd write FhExtendAdd;   //������ ����
    property hNightAdd : integer read FhNightAdd write FhNightAdd;      //������ �ɾ�
    property WeekTime : integer read FWeekTime write FWeekTime;         //�ְ� �ٹ� ���ؽð�
    property MonthATTime : integer read FMonthATTime write FMonthATTime;  //���� �ٹ� ���ؽð�
    property MonthLastDay : integer read FMonthLastDay write FMonthLastDay;  //�� �и� ����
    property YesterDayTime : string read FYesterDayTime write FYesterDayTime;  //������¥ ���ؽð�

    property OnEvent:      TSummaryEvent read FOnEvent       write FOnEvent;
  end;

var
  dmDaySummary: TdmDaySummary;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql;

{$R *.dfm}


{ TdmDaySummary }

function TdmDaySummary.DaySummary(aDate, aWeekCode, aCompanyCode, aEmCode,
  aPayGubun, aPayAmt, aWorkStartTime, aWorkEndTime: string): Boolean;
var
  stSql : string;
  stPayVacation,stNonPayVacation : string;
  stAtType:string;
  nInfromMM,nWorkMM,nExtendMM,nNightMM:integer;
  nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd:integer;
  nInfromAMT,nWorkAMT,nExtendAMT,nNightAMT:integer;
  bYesterDay : Boolean;
  nTimeAmt : integer;  //�ð��� �޿�
  nJikag:integer;
  nJotae:integer;
  nRealyATTimeMM : integer; //���� �ٹ��ð�
  nLeaveCount : integer;
  nBackCount : integer;
  bError : Boolean;
  bFixedAmt : Boolean; //���κ� ���� ����
  stJijumCode,stDepartCode,stEMName : string;
begin
  bFixedAmt := False;
  bError := False;
  nInfromMM := 0;
  nWorkMM:= 0;
  nExtendMM:=0;
  nNightMM:=0;
  nInfromAdd := 0;
  nWorkAdd:= 0;
  nExtendAdd:=0;
  nNightAdd:=0;
  nInfromAMT := 0;
  nWorkAMT := 0;
  nExtendAMT := 0;
  nNightAMT := 0;
  nJikag:= 0;
  nJotae:= 0;
  nRealyATTimeMM := 0;
  nLeaveCount := 0;
  nBackCount := 0;
  stJijumCode := '';
  stDepartCode := '';
  stEMName := '';
  if Not isDigit(aPayAmt) then aPayAmt := '0';

(*  if aEmCode = 'T130002' then
  begin
    if Assigned(FOnEvent) then
    begin
      OnEvent(Self,'TEST','TEST');
    end;
  end;  *)
  if aPayGubun = '' then aPayGubun := '0';
  if aPayGubun = '0' then //���� ������
  begin
    nTimeAmt := strtoint(aPayAmt) div MonthATTime;
  end else if aPayGubun = '1' then //�ð��� ������
  begin
    nTimeAmt := strtoint(aPayAmt);
  end;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTDaySummary(aDate,aCompanyCode,aEmCode)
  else Exit;

  result := False;
  with AdoSummary do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount = 0 then
    begin
      if Not GetTB_EMPLOYEE_Info(aCompanyCode,aEmCode,stJijumCode,stDepartCode,stEmName) then Exit;

      if VacationCheck(aDate,aCompanyCode,aEmCode,stPayVacation,stNonPayVacation) then
      begin //�ް�
        if stPayVacation = '1' then  //�����ް��� ��츸...
        begin
          nWorkMM := MakeWorkTime_Minute(aWorkEndTime,aWorkStartTime,2);
          nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,0,bFixedAmt);  //�ް��� �⺻���
        end;
        result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'2',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),stPayVacation,stNonPayVacation,inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName);
      end else
      begin
        if strtoint(aWeekCode) = 1 then //������
           result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'4',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName)
        else result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'3',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName); //���
      end;
      Exit;
    end;

    if aCompanyCode <> FindField('CO_COMPANYCODE').AsString then
      aCompanyCode := FindField('CO_COMPANYCODE').AsString; //���̽���ũ��� ȸ���ڵ� ��������� �����̺�Ʈ ���̺��� ȸ���ڵ带 �����
    stJijumCode := FindField('CO_JIJUMCODE').AsString ;
    stDepartCode := FindField('CO_DEPARTCODE').AsString ;
    stEmName := FindField('EM_NAME').AsString ;

    if (ATType = 1) or         //������ٹ�
       (ATType = 3) then       //ȥ�ձٹ�
    begin
      if FindField('AT_WORKSTARTTIME').AsString <> '' then aWorkStartTime := FindField('AT_WORKSTARTTIME').AsString;   //���� �ٹ����۽ð� �� ��ٽð��� �ٲ��ش�.
      if FindField('AT_WORKENDTIME').AsString <> '' then aWorkEndTime := FindField('AT_WORKENDTIME').AsString;   //���� �ٹ����۽ð� �� ��ٽð��� �ٲ��ش�.
    end;

    if VacationCheck(aDate,aCompanyCode,aEmCode,stPayVacation,stNonPayVacation) then
    begin //�ް�
      if stPayVacation = '1' then   //�����ް��� ��츸
      begin
        nWorkMM := MakeWorkTime_Minute(aWorkEndTime,aWorkStartTime,2);
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,0,bFixedAmt);  //�ް��� �⺻���
      end;
      result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'2',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),stPayVacation,stNonPayVacation,inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName);
      Exit;
    end;
    
    if FindField('AT_INTYPE').AsString = '3' then //����̸�
    begin
      result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,'3',aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName); //���
      Exit;
    end;

    //nRealyATTimeMM := DiffMinute(copy(FindField('AT_OUTTIME').asstring,9,4),copy(FindField('AT_INTIME').asstring,9,4),0);
    nRealyATTimeMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),copy(FindField('AT_INTIME').asstring,9,4),0);
    if Trim(FindField('AT_LEAVETIME').asstring) <> '' then nLeaveCount := 1;
    if Trim(FindField('AT_BACKTIME').asstring) <> '' then nBackCount := 1;

    if ATTypePay = 2 then  //���κ� �ݾ� ������
    begin
      GetPersonType(aCompanyCode,aEmCode,aWeekCode,nTimeAmt,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
    end;

    stAtType:= '1'; //���
    if FindField('AT_INTYPE').AsString = '4' then //��������̸�
    begin
      if aWeekCode = '1' then //������
      begin
        nInfromMM := MakeWorkTime_Minute(FindField('AT_HINFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nInfromAdd := FindField('AT_HEARLYADD').AsInteger;
            nWorkAdd := FindField('AT_HNORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then //��ü ���� ���
        begin
          nInfromAdd := hEarlyAdd;
          nWorkAdd := hNormalAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //�̹� ���� ����
        end;
        //nWorkAmt := nTimeAmt * ( nWorkMM / 60) * (( 100 + FindField('AT_HNORMALADD').AsInteger ) / 100);
      end
      else if aWeekCode = '7' then //�����
      begin
        nInfromMM := MakeWorkTime_Minute(FindField('AT_SINFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_SWORKENDTIME').asstring,FindField('AT_SWORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nInfromAdd := FindField('AT_SEARLYADD').AsInteger;
            nWorkAdd := FindField('AT_SNORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then  //��ü ���� ���
        begin
          nInfromAdd := sEarlyAdd;
          nWorkAdd := 0;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else     //����
      begin
        nInfromMM := MakeWorkTime_Minute(FindField('AT_INFROMTIME').asstring,copy(FindField('AT_INTIME').asstring,9,4),1);
        nWorkMM := MakeWorkTime_Minute(FindField('AT_WORKENDTIME').asstring,FindField('AT_WORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nInfromAdd := FindField('AT_EARLYADD').AsInteger;
            nWorkAdd := FindField('AT_NORMALADD').AsInteger;
          Except
            nInfromAdd := 0;
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nInfromAdd := EarlyAdd;
          nWorkAdd := 0;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if ATTypePay = 2 then //���κ� ���� ���
      begin
        nInfromAmt := GetPerAmt(nInfromAdd,nInfromMM,0,bFixedAmt);
        nWorkAmt := GetPerAmt(nWorkAdd,nWorkMM,0,False);
      end else
      begin
        nInfromAmt := GetPerAmt(nTimeAmt,nInfromMM,nInfromAdd,bFixedAmt);
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,nWorkAdd,bFixedAmt);
      end;
    end else if (FindField('AT_INTYPE').AsString = '1') or (FindField('AT_INTYPE').AsString = '2') then  //��� �Ǵ� ���� �̸�
    begin

      if FindField('AT_INTYPE').AsString = '2' then nJikag:= 1;

      if aWeekCode = '1' then //������
      begin
        {if copy(FindField('AT_OUTTIME').asstring,9,4) < FindField('AT_HWORKENDTIME').asstring then
          nWorkMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HWORKSTARTTIME').asstring,2)
        else
        begin
          nWorkMM := MakeWorkTime_Minute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        end;}
        nWorkMM := MakeWorkTime_Minute(FindField('AT_HWORKENDTIME').asstring,FindField('AT_HWORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nWorkAdd := FindField('AT_HNORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nWorkAdd := hNormalAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //�����
      begin
        nWorkMM := MakeWorkTime_Minute(FindField('AT_SWORKENDTIME').asstring,FindField('AT_SWORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nWorkAdd := FindField('AT_SNORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nWorkAdd := 0;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nWorkMM := MakeWorkTime_Minute(FindField('AT_WORKENDTIME').asstring,FindField('AT_WORKSTARTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nWorkAdd := FindField('AT_NORMALADD').AsInteger;
          Except
            nWorkAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nWorkAdd := 0;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if ATTypePay = 2 then
      begin
        nWorkAmt := GetPerAmt(nWorkAdd,nWorkMM,0,False);
      end else
      begin
        nWorkAmt := GetPerAmt(nTimeAmt,nWorkMM,nWorkAdd,bFixedAmt);
      end;
    end else bError := True;

    if FindField('AT_OUTTYPE').AsString = '2' then  nJotae:= 1 //�����̸�
    else if FindField('AT_OUTTYPE').AsString = '3' then //����ٹ��̸�
    begin
      if aWeekCode = '1' then //������
      begin
        nExtendMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HEXTENDTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_HEXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := hExtendAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //�����
      begin
        nExtendMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_SEXTENDTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_SEXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := sExtendAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nExtendMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_EXTENDTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_EXTENDADD').AsInteger;
          Except
            nExtendAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := ExtendAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if ATTypePay = 2 then
      begin
        nExtendAmt := GetPerAmt(nExtendAdd,nExtendMM,0,bFixedAmt);
      end else
      begin
        nExtendAmt := GetPerAmt(nTimeAmt,nExtendMM,nExtendAdd,bFixedAmt);
      end;
    end else if FindField('AT_OUTTYPE').AsString = '4' then //�߰��ٹ��̸�
    begin
      if aWeekCode = '1' then //������
      begin
        nExtendMM := MakeWorkTime_Minute(FindField('AT_HNIGHTTIME').asstring,FindField('AT_HEXTENDTIME').asstring,3);
        nNightMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_HNIGHTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_HEXTENDADD').AsInteger;
            nNightAdd := FindField('AT_HNIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := hExtendAdd;
          nNightAdd := hNightAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else if aWeekCode = '7' then //�����
      begin
        nExtendMM := MakeWorkTime_Minute(FindField('AT_SNIGHTTIME').asstring,FindField('AT_SEXTENDTIME').asstring,3);
        nNightMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_SNIGHTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_SEXTENDADD').AsInteger;
            nNightAdd := FindField('AT_SNIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := sExtendAdd;
          nNightAdd := sNightAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end
      else
      begin
        nExtendMM := MakeWorkTime_Minute(FindField('AT_NIGHTTIME').asstring,FindField('AT_EXTENDTIME').asstring,3);
        nNightMM := MakeWorkTime_Minute(copy(FindField('AT_OUTTIME').asstring,9,4),FindField('AT_NIGHTTIME').asstring,2);
        if ATTypePay = 0 then  //���� Ÿ�Ժ� ���
        begin
          Try
            nExtendAdd := FindField('AT_EXTENDADD').AsInteger;
            nNightAdd := FindField('AT_NIGHTADD').AsInteger;
          Except
            nExtendAdd := 0;
            nNightAdd := 0;
          End;
        end else if ATTypePay = 1 then
        begin
          nExtendAdd := ExtendAdd;
          nNightAdd := NightAdd;
        end else if ATTypePay = 2 then  //���κ� ���� ���
        begin
          //GetPersonType(aCompanyCode,aEmCode,aWeekCode,nInfromAdd,nWorkAdd,nExtendAdd,nNightAdd,bFixedAmt);
        end;
      end;
      if ATTypePay = 2 then
      begin
        nExtendAmt := GetPerAmt(nExtendAdd,nExtendMM,0,bFixedAmt);
        nNightAmt := GetPerAmt(nNightAdd,nNightMM,0,bFixedAmt);
      end else
      begin
        nExtendAmt := GetPerAmt(nTimeAmt,nExtendMM,nExtendAdd,bFixedAmt);
        nNightAmt := GetPerAmt(nTimeAmt,nNightMM,nNightAdd,bFixedAmt);
      end;

    end
    else if FindField('AT_OUTTYPE').AsString <> '1' then
    begin
      //��ٽð��� ���� ��� 
      bError := True;
    end;

    result := InsertTB_ATDAYSUMMARY(aDate,aCompanyCode,aEmCode,stAtType,aWeekCode,inttostr(nInfromMM),inttostr(nWorkMM),inttostr(nExtendMM),inttostr(nNightMM),'0','0',inttostr(nInfromAmt),inttostr(nWorkAmt),inttostr(nExtendAmt),inttostr(nNightAmt),inttostr(nJiKag),inttostr(nJotae),inttostr(nRealyATTimeMM),inttostr(nLeaveCount),inttostr(nBackCount),stJijumCode,stDepartCode,stEmName);

    if bError then
    begin
      if Assigned(FOnEvent) then
      begin
        OnEvent(Self,'ERROR','1');
      end;
    end;
  end;

end;

function TdmDaySummary.DeleteTB_AtDAYSUMMARY(aDate, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ATDAYSUMMARY ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmDaySummary.GetPerAmt(aTimeAmt, aMinuate, aPer: integer;
  bFixedAmt: Boolean): integer;
begin
  if bFixedAmt then result := aTimeAmt
  else result := (aTimeAmt * aMinuate * ( 100 + aPer )) div (60 * 100) ;
end;

function TdmDaySummary.GetPersonType(aCompanyCode, aEmCode,
  aWeekCode: string; aTimeAmt: integer; var aInfromAdd, aWorkAdd,
  aExtendAdd, aNightAdd: integer; var bFixedAmt: Boolean): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aInfromAdd := 0;
  aWorkAdd := aTimeAmt;
  aExtendAdd := 0;
  aNightAdd := 0;
  bFixedAmt := False;
  result := False;
  stSql := ' select * from TB_ATEMPEXTRA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then Exit;
    Try
      if aWeekCode = '1' then   //������
      begin
        aWorkAdd := FindField('EX_HEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_HEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_HNIGHTAMT').AsInteger;
      end else if aWeekCode = '7' then   //�����
      begin
        aInfromAdd := FindField('EX_SEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_SEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_SNIGHTAMT').AsInteger;
      end else
      begin
        aInfromAdd := FindField('EX_WEARLYAMT').AsInteger;
        aExtendAdd := FindField('EX_WEXTENDAMT').AsInteger;
        aNightAdd := FindField('EX_WNIGHTAMT').AsInteger;
      end;
      if FindField('EX_TYPE').AsInteger = 1 then bFixedAmt := True;
    Except
      Exit;
    End;
    result := True;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TdmDaySummary.GetTB_EMPLOYEE_Info(aCompanyCode, aEmCode: string;
  var aJijumCode, aDepartCode, aEmName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  if G_nCompanyCodeType = 1 then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOTmpQuery do
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
    aJijumCode := FindField('CO_JIJUMCODE').AsString;
    aDepartCode := FindField('CO_DEPARTCODE').AsString;
    aEmName := FindField('EM_NAME').AsString;

  end;
  result := True;
end;

function TdmDaySummary.InsertTB_ATDAYSUMMARY(aDate, aCompanyCode, aEmCode,
  aAtType, aWeekCode, aInfromMM, aWorkMM, aExtendMM, aNightMM,
  aPayVacation, aNonPayVacation, aInfromAmt, aWorkAmt, aExtendAmt,
  aNightAmt, aJiKag, aJotae, aRealyATTimeMM, aLeaveCount,
  aBackCount,aJijumCode,aDepartCode,aEmName: string): Boolean;
var
  stSql : string;
begin

  DeleteTB_AtDAYSUMMARY(aDate, aCompanyCode, aEmCode);

  stSql := 'Insert Into TB_ATDAYSUMMARY(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_DATE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_TYPE,';
  stSql := stSql + 'AT_WEEKCODE,';
  stSql := stSql + 'AT_INFROMMM,';
  stSql := stSql + 'AT_WORKMM,';
  stSql := stSql + 'AT_EXTENDMM,';
  stSql := stSql + 'AT_NIGHTMM,';
  stSql := stSql + 'AT_INFROMAMT,';
  stSql := stSql + 'AT_WORKAMT,';
  stSql := stSql + 'AT_EXTENDAMT,';
  stSql := stSql + 'AT_NIGHTAMT,';
  stSql := stSql + 'AT_PAYVACATION,';
  stSql := stSql + 'AT_NONPAYVACATION, ';
  stSql := stSql + 'AT_JIKAG, ';
  stSql := stSql + 'AT_JOTAE, ';
  stSql := stSql + 'AT_REALATTIMEMM, ';
  stSql := stSql + 'AT_LEAVECOUNT, ';
  stSql := stSql + 'AT_BACKCOUNT , ';
  stSql := stSql + 'CO_JIJUMCODE , ';
  stSql := stSql + 'CO_DEPARTCODE , ';
  stSql := stSql + 'EM_NAME ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aAtType + ''',';
  stSql := stSql + aWeekCode + ',';
  stSql := stSql + aInfromMM + ',';
  stSql := stSql + aWorkMM + ',';
  stSql := stSql + aExtendMM + ',';
  stSql := stSql + aNightMM + ',';
  stSql := stSql + aInfromAmt + ',';
  stSql := stSql + aWorkAmt + ',';
  stSql := stSql + aExtendAmt + ',';
  stSql := stSql + aNightAmt + ',';
  stSql := stSql + aPayVacation + ',';
  stSql := stSql + aNonPayVacation + ',';
  stSql := stSql + aJiKag + ',';
  stSql := stSql + aJotae + ',';
  stSql := stSql + aRealyATTimeMM + ',';
  stSql := stSql + aLeaveCount + ',';
  stSql := stSql + aBackCount + ',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aEmName + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;


function TdmDaySummary.VacationCheck(aDate, aCompanyCode, aEmCode: string;
  var aPayVacation, aNonPayVacation: string): Boolean;
var
  stSql : string;
begin
  result := False;
  aPayVacation := '0';
  aNonPayVacation := '0';
  stSql := 'select a.*,b.AT_VATYPE from TB_ATVACATION a ';
  stSql := stSql + ' Left Join TB_ATVACODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_VACODE = b.AT_VACODE) ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.VA_DATE = ''' + aDate + ''' ';
  if G_nCompanyCodeType = 1 then stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';

  with ADOTmpQuery do
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
    if FindField('AT_VATYPE').AsString = '1' then aPayVacation := '1'
    else if FindField('AT_VATYPE').AsString = '2' then aNonPayVacation := '1';
    
  end;
  result := True;

end;

end.
