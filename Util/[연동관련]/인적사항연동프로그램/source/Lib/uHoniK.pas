unit uHoniK;

interface

uses
  SysUtils, Classes,ADODB,ActiveX,Forms;

type
  TdmHoniK = class(TDataModule)
  private
    { Private declarations }
    Function GetHonikJijumCode(stCompanyCode,aLEVEL1:string):string;
    Function HongiKEmployeeUpdate(aCAMPUS,aKEY,aName,aCOJIJUMCODE,aCODEPARTCODE,aPOPOSICODE,aCARDCNT,aSTATE,aKGUBUN:string):Boolean;
    Function HongiKSeoulEmployeeUpdate(aCAMPUS,aKEY,aName,aCOJIJUMCODE,aCODEPARTCODE,aPOPOSICODE,aGUBUN_CHANGE,aCARDCNT,aSTATE,aSTATUS,aCARDTYPE,aCARDSTOP,aKGUBUN:string):Boolean;

  public
    { Public declarations }
    Function HongiKDepartCodeChange():Boolean;  //TB_HonikTempTable2 -> TB_HonikMappingDepart ����
    Function HongiKDepartRelay():Boolean;       //TB_HonikMappingDepart -> TB_COMPANY
    Function HongiKEmployeeRelay():Boolean;     //TB_HonikTempTable2 -> TB_EMPLOYEE
    Function HongiKEmployeeRelaySeoul():Boolean; //TB_HonikTempTable2 -> TB_EMPLOYEE
    Function HongiKJijumCodeChange():Boolean;    //TB_HonikTempTable2 -> TB_HonikMappingJijum
    Function HongiKJijumRelay():Boolean;         //TB_HonikTempTable2 -> TB_COMPANY
    Function HongiKPosiCodeChange():Boolean;     //TB_HonikTempTable2 -> TB_HonikMappingPosi
    Function HongiKPosiRelay():Boolean;          //TB_HonikMappingPosi -> TB_POSI
    Function HongiKRelay():Boolean;
    Function HongiKRelaySeoul():Boolean;
    Function HongiKTempToTemp():Boolean;         //V_MEMBER_KTTELECOP ->TB_HonikTempTable2
    Function HongiKTempToTempSeoul():Boolean;    //V_MEMBER_KTTELECOP,V_MCARDTYPE_KTTELECOP ->TB_HonikTempTable2
    Function HongiKUniversityRelay(aCampus:string):Boolean;  //���� ���� 
    Function InitSeoulRelay():Boolean;           //v_member_kttelecop,V_MCARDTYPE_KTTELECOP -> TB_HonikTempTable,TB_HonikMCardTempTable



  end;

var
  dmHoniK: TdmHoniK;

implementation

uses
  uCommonVariable,
  uDBFunction,
  udmAdoRelay,
  uDBModule,
  uMain,
  uLomosUtil, uCommon;

{$R *.dfm}

{ TdmHoniK }

function TdmHoniK.GetHonikJijumCode(stCompanyCode,
  aLEVEL1: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '000';
  stSql := 'select * from TB_HonikMappingJijum  where K_LEVEL1 = ''' + aLEVEL1 + ''' and CO_COMPANYCODE = ''' + stCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := FindField('CO_JIJUMCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKDepartCodeChange: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stName : string;
  TempAdoQuery :TADOQuery;
begin

  stSql := 'select K_CAMPUS,K_LEVEL1,K_LEVEL2,K_LEVEL2_NAME from TB_HonikTempTable2 where K_CHANGE = ''Y'' group by K_CAMPUS,K_LEVEL1,K_LEVEL2,K_LEVEL2_NAME';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_HonikMappingDepart(FindField('K_LEVEL1').AsString,FindField('K_LEVEL2').AsString,stName) = 1 then
        begin
          //���� ���̺� �̹� ���� �ϰ� ������

          if (stName <> FindField('K_LEVEL2_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingDepart(FindField('K_LEVEL1').AsString,  //�ܰ����ڵ�
                                 FindField('K_LEVEL2').AsString,
                                 FindField('K_LEVEL2_NAME').AsString,      //�а����Ī
                                 'Y');
          end;

        end else
        begin
          //������ ���� �ڵ� ����
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);
          stJijumCode := GetHonikJijumCode(stCompanyCode,FindField('K_LEVEL1').AsString);
          stDepartCode := dmCommon.GetDepartCode(stCompanyCode,stJijumCode,FindField('K_LEVEL2_NAME').AsString);
          if stDepartCode = '000' then
          begin
            if Trim(FindField('K_LEVEL2_NAME').AsString) <> '' then
              dmCommon.CreateDepartCode(stCompanyCode,stJijumCode,FindField('K_LEVEL2_NAME').AsString,stDepartCode);
          end;

          dmDBFunction.InsertIntoTB_HonikMappingDepart(FindField('K_LEVEL1').AsString,  //�ܰ����ڵ�
                                 FindField('K_LEVEL2').AsString,
                                 stCompanyCode,      //ȸ���ڵ�
                                 stJijumCode,   //�ܰ����ڵ�
                                 stDepartCode,   //�ܰ����ڵ�
                                 FindField('K_LEVEL2_NAME').AsString,
                                 'N');
        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmHoniK.HongiKDepartRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_HonikMappingDepart where K_CHANGE = ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_COMPANY_Gubun(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,'3') = 1 then
        begin
          //�μ� �ڵ尡 ������ ������Ʈ ����.
          if dmDBFunction.UpdateTB_COMPANY_Gubun_Field_StringValue(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,'3','CO_NAME',FindField('K_LEVEL2_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingDepart_Field_StringValue(FindField('K_LEVEL1').AsString,FindField('K_LEVEL2').AsString,'K_CHANGE','N');
          end;
        end else
        begin
          if dmDBFunction.InsertIntoTB_COMPANY(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,'3',FindField('K_LEVEL2_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingDepart_Field_StringValue(FindField('K_LEVEL1').AsString,FindField('K_LEVEL2').AsString,'K_CHANGE','N');
          end;
        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKEmployeeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.*,b.CO_JIJUMCODE,c.CO_DEPARTCODE,d.PO_POSICODE from TB_HonikTempTable2 a ';
  stSql := stSql + ' Left Join TB_HonikMappingJijum b ';
  stSql := stSql + ' ON(a.K_LEVEL1 = b.K_LEVEL1) ';
  stSql := stSql + ' Left Join TB_HonikMappingDepart c ';
  stSql := stSql + ' ON(a.K_LEVEL1 = c.K_LEVEL1 ';
  stSql := stSql + ' AND a.K_LEVEL2 = c.K_LEVEL2) ';
  stSql := stSql + ' Left Join TB_HonikMappingPosi d ';
  stSql := stSql + ' ON(a.K_GUBUN = d.K_GUBUN) ';
  stSql := stSql + ' where a.K_RELAY = ''N'' or a.K_RELAY is Null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        
        if HongiKEmployeeUpdate(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,FindField('K_GUBUN').AsString) then
        begin
          dmDBFunction.UpdateTB_HonikTempTable2_Field_StringValue(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,'K_RELAY','Y');
          fmMain.HongiKEventState(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,'sucess');
        end else
        begin
          fmMain.HongiKEventState(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,'Fail');

        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKEmployeeRelaySeoul: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.*,b.CO_JIJUMCODE,c.CO_DEPARTCODE,d.PO_POSICODE from TB_HonikTempTable2 a ';
  stSql := stSql + ' Left Join TB_HonikMappingJijum b ';
  stSql := stSql + ' ON(a.K_LEVEL1 = b.K_LEVEL1) ';
  stSql := stSql + ' Left Join TB_HonikMappingDepart c ';
  stSql := stSql + ' ON(a.K_LEVEL1 = c.K_LEVEL1 ';
  stSql := stSql + ' AND a.K_LEVEL2 = c.K_LEVEL2) ';
  stSql := stSql + ' Left Join TB_HonikMappingPosi d ';
  stSql := stSql + ' ON(a.K_GUBUN = d.K_GUBUN) ';
  stSql := stSql + ' where a.K_RELAY = ''N'' or a.K_RELAY is Null ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

        if HongiKSeoulEmployeeUpdate(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_GUBUN_CHANGE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,FindField('K_STATUS').AsString,
                                 FindField('M_CARDTYPE').AsString,FindField('M_CARDSTOP').AsString,FindField('K_GUBUN').AsString) then
        begin
          dmDBFunction.UpdateTB_HonikTempTable2_Field_StringValue(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,'K_RELAY','Y');
          fmMain.HongiKEventState(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,'sucess');
        end else
        begin
          fmMain.HongiKEventState(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,FindField('K_NAME').AsString,
                                 FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,
                                 FindField('PO_POSICODE').AsString,FindField('K_CARD_CNT').AsString,
                                 FindField('K_STATE').AsString,'Fail');

        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKEmployeeUpdate(aCAMPUS, aKEY, aName, aCOJIJUMCODE,
  aCODEPARTCODE, aPOPOSICODE, aCARDCNT, aSTATE,aKGUBUN: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
  stEmCode : string;
begin
  result := False;
  aName := StringReplace(aName,'''','',[rfReplaceAll]);
  stCompanyCode := FillZeroNumber(strtoint(aCAMPUS),3);
  stJijumCode := aCOJIJUMCODE;
  stDepartCode := aCODEPARTCODE;
  stPosiCode := aPOPOSICODE;

  bCardStateChange := False;
  stCardState := '1';  //aType�� 0 �ΰ�츸 ����

  stEmCode := aKey;
  if length(aKEY) < 13 then
    aKEY := FillZeroStrNum(aKEY,13,True);

  stCardNo := dmCommon.MakeCardNo(fmMain.L_stProgramType,aKEY,aCARDCNT);

  if dmDBFunction.CheckTB_EMPLOYEE(stCompanyCode,stEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if (aSTATE <> '3') then
    begin
      if Not dmDBFunction.UpdateTB_EMPLOYEE(stEmCode,
                      aName,
                      stCompanyCode,
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aName,
                        '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
    end else
    begin
      dmDBFunction.DeleteTB_EMPLOYEE_CardNo(stEmCode,stCardNo);
      //dmDBFunction.DeleteTB_EMPLOYEE_Key(stCompanyCode,stEmCode);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aKEY,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aName,
                        '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
      result := True;
      Exit;
    end;
  end else
  begin
    if (aSTATE <> '3') then
    begin
      nFdmsID := strtoint(dmCommon.GetFdmsID);
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE(stEmCode,
                        aName,
                        stCompanyCode,
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        '',
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001',
                        '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aName,
                          '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  result := True;
  if dmDBFunction.CheckTB_CARD_Employee_STICK(stCompanyCode,stEmCode) = 1 then Exit; //�������� ���� ī���� �������� �ʴ´�.
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo)=1 then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
    dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,stEmCode,stCompanyCode) then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,stEmCode,stCompanyCode) then Exit;
  end;

  if stCardState <> '1' then  //������
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  result := True;
end;

function TdmHoniK.HongiKJijumCodeChange: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  stJijumCode : string;
  stName : string;
  TempAdoQuery :TADOQuery;
begin

  stSql := 'select K_CAMPUS,K_LEVEL1,K_LEVEL1_NAME from TB_HonikTempTable2 where K_CHANGE = ''Y'' group by K_CAMPUS,K_LEVEL1,K_LEVEL1_NAME';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_HonikMappingJijum(FindField('K_LEVEL1').AsString,stName) = 1 then
        begin
          //���� ���̺� �̹� ���� �ϰ� ������

          if (stName <> FindField('K_LEVEL1_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingJijum(FindField('K_LEVEL1').AsString,  //�ܰ����ڵ�
                                 FindField('K_LEVEL1_NAME').AsString,      //�ܰ����Ī
                                 'Y');
          end;

        end else
        begin
          //������ ���� �ڵ� ����
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);
          stJijumCode := dmCommon.GetJijumCode(stCompanyCode,FindField('K_LEVEL1_NAME').AsString); ///������ ���������� �̹� ��ϵ� �ڵ尡 �ִ��� �˻��Ѵ�.
          //stJijumCode := '000';//������ ������ ��������.
          if stJijumCode = '000' then
          begin
            if Trim(FindField('K_LEVEL1_NAME').AsString) <> '' then
              dmCommon.CreateJijumCode(stCompanyCode,FindField('K_LEVEL1_NAME').AsString,stJijumCode);
          end;
          dmDBFunction.InsertIntoTB_HonikMappingJijum(FindField('K_LEVEL1').AsString,  //�ܰ����ڵ�
                                 stCompanyCode,      //ȸ���ڵ�
                                 stJijumCode,   //�ܰ����ڵ�
                                 FindField('K_LEVEL1_NAME').AsString,
                                 'N');
        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKJijumRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_HonikMappingJijum where K_CHANGE = ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_COMPANY_Gubun(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,'000','2') = 1 then
        begin
          //���� �ڵ尡 ������ ������Ʈ ����.
          if dmDBFunction.UpdateTB_COMPANY_Gubun_Field_StringValue(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,'000','2','CO_NAME',FindField('K_LEVEL1_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingJijum_Field_StringValue(FindField('K_LEVEL1').AsString,'K_CHANGE','N');
          end;
        end else
        begin
          if dmDBFunction.InsertIntoTB_COMPANY(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,'000','2',FindField('K_LEVEL1_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingJijum_Field_StringValue(FindField('K_LEVEL1').AsString,'K_CHANGE','N');
          end;
        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKPosiCodeChange: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  stPosiCode : string;
  stName : string;
  TempAdoQuery :TADOQuery;
begin

  stSql := 'select K_CAMPUS,K_GUBUN,K_GUBUN_NAME from TB_HonikTempTable2 where K_CHANGE = ''Y'' group by K_CAMPUS,K_GUBUN,K_GUBUN_NAME';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_HonikMappingPosi(FindField('K_GUBUN').AsString,stName) = 1 then
        begin
          //���� ���̺� �̹� ���� �ϰ� ������

          if (stName <> FindField('K_GUBUN_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingPosi(FindField('K_GUBUN').AsString,  //�����ڵ�
                                 FindField('K_GUBUN_NAME').AsString,      //���и�Ī
                                 'Y');
          end;

        end else
        begin
          //������ ���� �ڵ� ����
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);

          stPosiCode := dmCommon.GetPosiCode(stCompanyCode,FindField('K_GUBUN_NAME').AsString);
          if stPosiCode = '000' then
          begin
            if Trim(FindField('K_GUBUN_NAME').AsString) <> '' then
              dmCommon.CreatePosiCode(stCompanyCode,FindField('K_GUBUN_NAME').AsString,stPosiCode);
          end;


          dmDBFunction.InsertIntoTB_HonikMappingPosi(FindField('K_GUBUN').AsString,
                                 stCompanyCode,      //ȸ���ڵ�
                                 stPosiCode,
                                 FindField('K_GUBUN_NAME').AsString,
                                 'N');
        end;


        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmHoniK.HongiKPosiRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_HonikMappingPosi where K_CHANGE = ''Y'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if dmDBFunction.CheckTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString) = 1 then
        begin
          //���� �ڵ尡 ������ ������Ʈ ����.
          if dmDBFunction.UpdateTB_Posi_Field_StringValue(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,'PO_NAME',FindField('K_GUBUN_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingPosi_Field_StringValue(FindField('K_GUBUN').AsString,'K_CHANGE','N');
          end;
        end else
        begin
          if dmDBFunction.InsertIntoTB_Posi(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,FindField('K_GUBUN_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingPosi_Field_StringValue(FindField('K_GUBUN').AsString,'K_CHANGE','N');
          end;
        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmHoniK.HongiKRelay: Boolean;
begin
  HongiKJijumRelay;
  HongiKDepartRelay;
  HongiKPosiRelay;
  HongiKEmployeeRelay;
end;

function TdmHoniK.HongiKRelaySeoul: Boolean;
begin
  HongiKJijumRelay;
  HongiKDepartRelay;
  HongiKPosiRelay;
  HongiKEmployeeRelaySeoul;
end;

function TdmHoniK.HongiKSeoulEmployeeUpdate(aCAMPUS, aKEY, aName,
  aCOJIJUMCODE, aCODEPARTCODE, aPOPOSICODE,aGUBUN_CHANGE, aCARDCNT, aSTATE, aSTATUS,
  aCARDTYPE, aCARDSTOP,aKGUBUN: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardGubun : string; //1.�Ϲ�ī��,2:�����ī��
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardGroupGrade : Boolean;
  stWorkCode,stEndDate : string;
  stEmCode : string;
  nIndex : integer;
  nResult : integer;
  stGradeGroupCode : string;
  stPosiGubun : string;
begin

(*
aCAMPUS : 1:����, 2:����
aKEY : �л�(�й�), ������(����)
aName : ����
aCOJIJUMCODE,
aCODEPARTCODE,
aPOPOSICODE,
aCARDCNT : �߱� ����
aSTATE : ����,1.�ű�,2.������Ʈ,3,����
aSTATUS : 1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
aCARDTYPE : 0:NFC, 1:BLE, 2:RF
aCARDSTOP : 0:����, 1:�н�, 2:����
*)
  result := False;
  aName := StringReplace(aName,'''','',[rfReplaceAll]);
  stCompanyCode := FillZeroNumber(strtoint(aCAMPUS),3);
  stJijumCode := aCOJIJUMCODE;
  stDepartCode := aCODEPARTCODE;
  stPosiCode := aPOPOSICODE;

  stCardGubun := '1';

  bCardGroupGrade := False;
  stCardNo :='';
  stCardState := '1';  //aType�� 0 �ΰ�츸 ����
  if aSTATUS = '5' then aSTATUS := '1'; //���ᵵ �������� ó��
  //if aSTATUS <> '1' then stCardState := '3'; ///ī�� ����
  if (aCARDSTOP = '1') then stCardState := '2' ///ī�� �н�
  else if (aCARDSTOP = '2') then stCardState := '3' ; ///ī�� ����

  stEmCode := aKey;
  if length(aKEY) < 13 then
  begin
    stPosiGubun := aKGUBUN;
    (*
    if (Trim(aKGUBUN) = '4') or (Trim(aKGUBUN) = '5') then stPosiGubun := '01'    //������ �ڵ尡 4,5 �̸� 01 Ÿ������ ��ȯ
    else if (Trim(aKGUBUN) = '1') or (Trim(aKGUBUN) = '2') then stPosiGubun := '02'   //������ �����ڵ尡 1,2 �̸� 02 Ÿ������ ��ȯ
    else if (Trim(aKGUBUN) = '3') or (Trim(aKGUBUN) = '6') then stPosiGubun := '03';  //������ �����ڵ尡 3,6 �̸� 03 Ÿ������ ��ȯ
    *)
    if (Trim(aKGUBUN) = '1') or (Trim(aKGUBUN) = '2') then stPosiGubun := '01';   //������ �����ڵ尡 1,2 �̸� 01 Ÿ������ ��ȯ

    if(aCARDTYPE='0') then
    begin
      //�����ī�� ���� ��Ģ M/B + �����ڵ� 2�ڸ�,���10�ڸ�(*�� ä��)+N+����(2)
      aKEY := 'M' + FillZeroStrNum(Trim(stPosiGubun),2) + FillCharString(aKEY,'*',10,False)+ 'N';        ///����� ī��
      stCardGubun := '2';
    end else if (aCARDTYPE='1') then
    begin
      aKEY := 'B' + FillZeroStrNum(Trim(stPosiGubun),2) + FillCharString(aKEY,'*',10,False)+ 'N';  ///BLE ī��
      stCardGubun := '2';
    end else if (aCARDTYPE='2') then
    begin
      aKEY := FillZeroStrNum(aKEY,13,True) + 'N';
      stCardGubun := '1';
    end;
  end;

  if isdigit(aCARDCNT) then
  begin
    if(aCARDTYPE='0') or (aCARDTYPE='1') then stCardNo := aKEY + FillZeroStrNum(aCARDCNT,2)
    else if (aCARDTYPE='2') then stCardNo := aKEY + FillZeroNumber( strtoint(aCARDCNT),2,False);
    //stCardNo := dmCommon.MakeCardNo(fmMain.L_stProgramType,aKEY,aCARDCNT);
  end;

  if dmDBFunction.CheckTB_EMPLOYEE(stCompanyCode,stEmCode,nFdmsID,stWorkCode,stEndDate) then    //ȸ���ڵ�,���̵� �� �����ϸ�
  begin
    if (aSTATE <> '3') then //������ �ƴ϶��  ��� ���� ������Ʈ
    begin
      if Not dmDBFunction.UpdateTB_EMPLOYEE(stEmCode,
                      aName,
                      stCompanyCode,
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      aSTATUS) then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aName,
                        '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
    end else
    begin
      dmDBFunction.DeleteTB_EMPLOYEE_CardNo(stEmCode,stCardNo); //astate == 3 �̶�� ��� ������ ���� �� ����
      //dmDBFunction.DeleteTB_EMPLOYEE_Key(stCompanyCode,stEmCode);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aKEY,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aName,
                        '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
      result := True;
      Exit;
    end;
  end else
  begin
    if (aSTATE <> '3') then
    begin
      nFdmsID := strtoint(dmCommon.GetFdmsID);
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE(stEmCode,
                        aName,
                        stCompanyCode,
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        '',
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001',
                        aSTATUS) then Exit;

      bCardGroupGrade := True; //ī�� ���� �������� ���� �ο�
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aName,
                          '','ȫ�ʹ��б�',stJijumCode,stDepartCode,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;

  result := True;
  if(stCardNo='') then Exit; ///ī�� ��ȣ�� ���� ��� ���� ������.


  //if dmDBFunction.CheckTB_CARD_Employee_STICK(stCompanyCode,stEmCode) = 1 then Exit; //�������� ���� ī���� �������� �ʴ´�. �� �κ��� ����

  if(stCardGubun='1') then//�ǹ�ī����
  begin
    //�ǹ� ī�尡 �ִ��� Ȯ���Ѵ�.
    nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,stEmCode,stCardNo,stCardGubun,stOldCodeNo);
    if nResult = 1 then
    begin
      //���� ������� �ٸ� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű��.
      dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
      bCardGroupGrade := False;
    end else if nResult = 0 then
    begin
      //���� ������� ���� ī�尡 �ִ� ��� ���� ���� ���� ����.
      bCardGroupGrade := False;
    end else if nResult = -1 then
    begin
      //�ǹ� ī�尡 ���ٸ� ��ü ī�� Ȯ���Ѵ�.
      nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo);
      if nResult = 1 then
      begin
        //���� ������� �ٸ� ī�尡 �ִ� ���
        //����ī�� ������ �Ȱ��� �ű�,���� ī�� ������ ���� �ʴ´�.
        dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo,False);
        bCardGroupGrade := False;
      end else
      begin
        nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo,False);
        if nResult = 1 then
        begin
          dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo,False);
          bCardGroupGrade := False;
        end else
        begin       //�׷������ �����Ѵ�.
          bCardGroupGrade := True;
        end;
      end;
    end;
    // ����� ī�� ������ ���� �Ѵ�.
    dmDBFunction.DeleteTB_CARD_EmployeeCardGubun(stCompanyCode,stEmCode,'2');

  end else //����� ī����
  begin
    nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,stEmCode,stCardNo,stCardGubun,stOldCodeNo);
    if nResult = 1 then
    begin
      //���� ������� �ٸ� ����� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű�
      dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
      bCardGroupGrade := False;
    end else if nResult = 0 then
    begin
      //���� ������� ���� ī�尡 �ִ� ��� ���� ���� ���� ����.
      bCardGroupGrade := False;
    end else if nResult = -1 then
    begin
      //����� ī�尡 ���ٸ� ��ü ī�带 ��ȸ�Ѵ�.
      nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo);
      if nResult = 1 then
      begin
        //���� ������� �ٸ� ī�尡 �ִ� ���
        //����ī�� ������ �Ȱ��� �ű�,���� ī�� ������ ���� �ʴ´�.
        dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo,False);
        bCardGroupGrade := False;
      end else
      begin
        //�׷������ �����Ѵ�.
        bCardGroupGrade := True;
      end;
    end;
  end;

  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardGroupGrade := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,stCardGubun,stCardState,stEmCode,stCompanyCode) then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,stCardGubun,stCardState,stEmCode,stCompanyCode) then Exit;
  end;

  (*
  ������ ���� �ɶ� ������ ������ ���� �������� üũ
  if(aGUBUN_CHANGE='Y') then
    bCardGroupGrade:=True;
  *)

  if (stCardState <> '1') then  //������
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end else
  begin
    ///�ű� ī�� ���⼭ ���� ��������.
    if (bCardGroupGrade) then
    begin
      nIndex := MappingCode1List.IndexOf(stCompanyCode + stPosiCode);
      stGradeGroupCode := '';
      if nIndex > -1 then
      begin
        stGradeGroupCode := MappingCode2List.Strings[nIndex];
      end;
      if stGradeGroupCode <> '' then  //���⼭ �׷� ���� ���� ����...
      begin
        dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);   //�����ϴ� ���� ������Ʈ
        dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);  //���� ���� �߰�
        dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');  //���� �ο��� üũ
      end;
    end;
  end;

  result := True;
end;

function TdmHoniK.HongiKTempToTemp: Boolean;
var
  stSql : string;
  stMode : string;
  stChange : string;
  stlevel1 : string;
  stlevel2 : string;
  stgubun : string;
  stname : string;
  stcnt: string;
  stCurChange : string;
  stCurMode : string;
  nCur : integer;
  nTot : integer;
  TempAdoQuery : TADOQuery;
begin
  //Temp2 ���̺� ���� ���� ���� �� �߿��� ��� ���� ����3����  ���� �� ���� ������ ǥ������.
  stSql := 'update TB_HonikTempTable2 set K_STATE = 3,K_CHANGE = ''Y'' where K_STATE <> 3  ';
  dmDBModule.ProcessExecSQL(stSql);

  stSql := 'select * from V_MEMBER_KTTELECOP ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      nCur := 0;
      nTot := recordcount;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if(FindField('K_KEY').AsString <> '') then
        begin
          if dmDBFunction.CheckTB_HonikTempTable2(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,stMode,stChange,stlevel1,stlevel2,stgubun,stname,stcnt) = 1 then
          begin
            //Temp2 ���̺� �̹� ���� �ϰ� ������ stChange�� 'Y'�̰� stMode�� '3'���� �Ǿ� �ִٸ� ���� ���� ���� ���´�.
            stCurChange := 'N';   //���� ������ üũ  �⺻���� ���� �ȵ�
            stCurMode := '2';     //���� ��带 üũ �⺻���� ����
            if stChange = 'N' then //������ ���� �Ǿ��� ���̴�.
            begin
              stCurChange := 'Y'; //�̹� ���� �������� �ٽ� �Է� ��� �°��̴�.
            end;
            if (stlevel1 <> FindField('K_LEVEL1').AsString) or
               (stlevel2 <> FindField('K_LEVEL2').AsString) or
               (stgubun <> FindField('K_GUBUN').AsString) or
               (stname <> FindField('K_NAME').AsString) or
               (stcnt <> FindField('K_CARD_CNT').AsString) then
            begin
              stCurChange := 'Y'; //������ �ٲ�� ������Ʈ �ؾ� �Ѵ�.
            end;
            dmDBFunction.UpdateTB_HonikTempTable2(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                   FindField('K_KEY').AsString,      //�й�
                                   FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                   FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                   FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                   FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                   FindField('K_GUBUN').AsString,      //����
                                   FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                   FindField('K_NAME').AsString,       //����
                                   FindField('K_CARD_CNT').AsString,      //ī�� �߱� ����
                                   stCurChange,
                                   stCurMode);
          end else
          begin
            dmDBFunction.InsertIntoTB_HonikTempTable2(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                   FindField('K_KEY').AsString,      //�й�
                                   FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                   FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                   FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                   FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                   FindField('K_GUBUN').AsString,      //����
                                   FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                   FindField('K_NAME').AsString,       //����
                                   FindField('K_CARD_CNT').AsString,      //ī�� �߱� ����
                                   'Y',
                                   '1');
          end;

        end;
        nCur := nCur + 1;
        fmMain.StatusBar1.Panels[2].Text := 'TB_HonikTempTable2 : ' + inttostr(nCur) +'/' + inttostr(nTot);

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  //���� ������ ������ ������ �ؾ� �Ѵ�.
  stSql := 'update TB_HonikTempTable2 set K_RELAY = ''N'',K_CHANGEDATE = getdate() where K_STATE = 3 and K_CHANGE = ''Y'' ';
  dmDBModule.ProcessExecSQL(stSql);

end;

function TdmHoniK.HongiKTempToTempSeoul: Boolean;
var
  stSql : string;
  stMode : string;
  stChange : string;
  stlevel1 : string;
  stlevel2 : string;
  stgubun : string;
  stname : string;
  stcnt: string;
  stCurChange : string;
  stCurMode : string;
  stStatus : string;  //1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
  stCardType : string;
  stCardStop : string;
  stGubunChange : string;
  stCardRegcnt : string; //ī�� �߱� ����
  stCardRegType : string; //ī�� Ÿ�� �����:0,BLE:1,NFC:2
  nCur : integer;
  nTot : integer;
  TempAdoQuery : TADOQuery;
begin
  //Temp2 ���̺� ���� ���� ���� �� �߿��� ��� ���� ����3����  ���� �� ���� ������ ǥ������.
  stSql := 'update TB_HonikTempTable2 set K_STATE = 3,K_CHANGE = ''Y'' where K_STATE <> 3  ';
  dmDBModule.ProcessExecSQL(stSql);

  stSql := 'select * from V_MEMBER_KTTELECOP a';
  stSql := stSql + ' left join V_MCARDTYPE_KTTELECOP b ';
  stSql := stSql + ' ON(a.K_KEY = b.M_KEY)';
//  stSql := stSql + ' Inner join V_MCARDTYPE_KTTELECOP b ';
//  stSql := stSql + ' ON(a.K_KEY = b.M_KEY  ';
//  stSql := stSql + ' AND b.M_CARDTYPE = ''1'') ';

  nCur := 0;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      nTot := recordcount;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        stCardRegcnt :='';
        stCardRegType := '';
        if(FindField('K_KEY').AsString <> '') then
        begin
          if FindField('M_CARDTYPE').AsString = '0' then
          begin
            stCardRegcnt := FindField('M_CARDCNT').AsString;
            stCardRegType := FindField('M_AUTHTYPE').AsString;
          end
          else if FindField('M_CARDTYPE').AsString = '1' then
          begin
            stCardRegcnt := FindField('M_CARDCNT').AsString;
            stCardRegType := '2';
          end;

          if dmDBFunction.CheckTB_HonikTempTable2Seoul(FindField('K_CAMPUS').AsString,FindField('K_KEY').AsString,stMode,stChange,stlevel1,stlevel2,stgubun,stname,stcnt,stStatus,stCardType,stCardStop) = 1 then
          begin
            //Temp2 ���̺� �̹� ���� �ϰ� ������ stChange�� 'Y'�̰� stMode�� '3'���� �Ǿ� �ִٸ� ���� ���� ���� ���´�.
            stCurChange := 'N';   //���� ������ üũ  �⺻���� ���� �ȵ�
            stCurMode := '2';     //���� ��带 üũ �⺻���� ����
            stGubunChange := 'N'; //������ ������� �ʾҴ�.
            if stChange = 'N' then //������ ���� �Ǿ��� ���̴�.
            begin
              stCurChange := 'Y'; //�̹� ���� �������� �ٽ� �Է� ��� �°��̴�.
            end;
            if (stlevel1 <> FindField('K_LEVEL1').AsString) or
               (stlevel2 <> FindField('K_LEVEL2').AsString) or
               (stgubun <> FindField('K_GUBUN').AsString) or
               (stname <> FindField('K_NAME').AsString) or
               (stcnt <> stCardRegcnt) or
               (stStatus <> FindField('K_STATUS').AsString) or
               (stCardType <> stCardRegType) or
               (stCardStop <> FindField('M_CARDSTOP').AsString)
            then
            begin
              stCurChange := 'Y'; //������ �ٲ�� ������Ʈ �ؾ� �Ѵ�.
              if((stgubun <> FindField('K_GUBUN').AsString)) then stGubunChange := 'Y';
            end;

            dmDBFunction.UpdateTB_HonikTempTable2Seoul(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                   FindField('K_KEY').AsString,      //�й�
                                   FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                   FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                   FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                   FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                   FindField('K_GUBUN').AsString,      //����
                                   FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                   stGubunChange,
                                   FindField('K_NAME').AsString,       //����
                                   stCardRegcnt,      //ī�� �߱� ����
                                   FindField('K_STATUS').AsString,      //1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
                                   stCardRegType,    //0:����Ͻź���, 1: BLE, 2:ī��ź���
                                   FindField('M_CARDSTOP').AsString,    //0:����, 1:�н�, 2:����
                                   stCurChange,
                                   stCurMode);
          end else
          begin
            dmDBFunction.InsertIntoTB_HonikTempTable2Seoul(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                   FindField('K_KEY').AsString,      //�й�
                                   FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                   FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                   FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                   FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                   FindField('K_GUBUN').AsString,      //����
                                   FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                   FindField('K_NAME').AsString,       //����
                                   stCardRegcnt,      //ī�� �߱� ����
                                   FindField('K_STATUS').AsString,      //1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
                                   stCardRegType,    //0:����Ͻź���, 1: BLE, 2:ī��ź���
                                   FindField('M_CARDSTOP').AsString,    //0:����, 1:�н�, 2:����
                                   'Y',
                                   '1');
          end;

        end;
        nCur := nCur + 1;
        fmMain.StatusBar1.Panels[2].Text := 'TB_HonikTempTable2 : ' + inttostr(nCur) +'/' + inttostr(nTot);

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  //���� ������ ������ ������ �ؾ� �Ѵ�.
  stSql := 'update TB_HonikTempTable2 set K_RELAY = ''N'',K_CHANGEDATE = getdate() where K_STATE = 3 and K_CHANGE = ''Y'' ';
  dmDBModule.ProcessExecSQL(stSql);
end;

function TdmHoniK.HongiKUniversityRelay(aCampus: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
  stName : string;
  nTot,nCur:integer;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    fmMain.RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    fmMain.StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    fmMain.AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;

  //dmDBFunction.DeleteHongikTempTable(aCampus);  ///�ӽ� ���̺��� ��� �����ϰ� �ٽ� ���� �信�� ���� �´�.

  if (dmDBFunction.CheckTB_COMPANY_Gubun(FillZeroNumber(strtoint(aCampus),3),'000','000','1') <> 1) then
  begin
    //���� 001 �ڵ尡 ������ 001 �ڵ带 �����Ѵ�.
    if aCampus = '1' then
    begin
      stName := 'ȫ�ʹ뼭��';
    end else
    begin
      stName := 'ȫ�ʹ뼼��';
    end;
    dmDBFunction.InsertIntoTB_COMPANY(FillZeroNumber(strtoint(aCampus),3),'000','000','1',stName);
  end;


  (*
  stSql := 'SELECT * from v_member_kttelecop ';
  stSql := stSql + ' Where K_CAMPUS = ' + aCampus + ' ';



  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      nTot := recordcount;
      nCur := 0;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if (aCampus = '1') then
        begin
          if FindField('K_UPDT').isNull or (FindField('K_UPDT').AsString <= formatdatetime('yyyymmdd',now)) then
          begin
            ///�߷����� ���� ������ �����͸� ���� ����.
            dmDBFunction.InsertIntoTB_HonikTempTableSeoul(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                 FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                 FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                 FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                 FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                 FindField('K_GUBUN').AsString,      //����
                                 FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                 FindField('K_NAME').AsString,       //����
                                 FindField('K_KEY').AsString,      //�й�
                                 FindField('K_STATUS').AsString,   //1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
                                 FindField('K_UPDT').AsString      //�߷���(���º�����)

            );
          end;
        end else
        begin
          //����ķ�۽��̸�
          dmDBFunction.InsertIntoTB_HonikTempTable(FindField('K_CAMPUS').AsString,  //1.����,2.����
                                 FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                                 FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                                 FindField('K_LEVEL2').AsString,   //�а��ڵ�
                                 FindField('K_LEVEL2_NAME').AsString,   //�̸�
                                 FindField('K_GUBUN').AsString,      //����
                                 FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                                 FindField('K_NAME').AsString,       //����
                                 FindField('K_KEY').AsString,      //�й�
                                 FindField('K_CARD_CNT').AsString      //ī�� �߱� ����
                                 );
          end;

        nCur := nCur + 1;
        fmMain.StatusBar1.Panels[2].Text := inttostr(nCur) +'/' + inttostr(nTot) + ':' + FindField('K_KEY').AsString + ' Copy';
        Application.ProcessMessages;
        Next;
      end;


      if(aCampus='1') then
      begin
        stSql := 'SELECT * from V_MCARDTYPE_KTTELECOP ';
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
          result := True;
          nTot := recordcount;
          nCur := 0;

          While Not Eof do
          begin
            if G_bApplicationTerminate then Exit;
            dmDBFunction.InsertIntoTB_HonikMCardTempTable(FindField('M_KEY').AsString,  //�й�
                                     FindField('M_CARDTYPE').AsString,   //0:����Ͻź���, 1:ī��ź���
                                     FindField('M_CARDCNT').AsString,   //�߱�����
                                     FindField('M_CARDSTOP').AsString,   //0:����, 1:�н�, 2:����
                                     FindField('M_UPDT').AsString   //YYYYMMDDHHMMSS

              );

            nCur := nCur + 1;
            fmMain.StatusBar1.Panels[2].Text := inttostr(nCur) +'/' + inttostr(nTot) + ':' + FindField('M_KEY').AsString + ' MCopy';
            Application.ProcessMessages;
            Next;
          end;
        end;
      end;



      if(aCampus='1') then
      begin
        HongiKTempToTempSeoul();
        HongiKJijumCodeChange(); //�����ڵ� ����
        HongiKDepartCodeChange(); //�μ��ڵ� ����
        HongiKPosiCodeChange();
        HongiKRelaySeoul();
      end else
      begin
        HongiKTempToTemp();
        HongiKJijumCodeChange();
        HongiKDepartCodeChange();
        HongiKPosiCodeChange();
        HongiKRelay();
      end;
      
      fmMain.L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',now);
      dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',fmMain.L_stLastRelayTime);
    end;
  Finally
    fmMain.L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  *)
  if fmMain.L_bRelayDB then Exit;
  fmMain.L_bRelayDB := True;

  Try
    if(aCampus='1') then
    begin
      HongiKTempToTempSeoul();
      HongiKJijumCodeChange(); //�����ڵ� ����
      HongiKDepartCodeChange(); //�μ��ڵ� ����
      HongiKPosiCodeChange();
      HongiKRelaySeoul();
    end else
    begin
      HongiKTempToTemp();
      HongiKJijumCodeChange();
      HongiKDepartCodeChange();
      HongiKPosiCodeChange();
      HongiKRelay();
    end;
  Finally
    fmMain.L_bRelayDB := False;
  End;

end;


function TdmHoniK.InitSeoulRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
  stName : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    fmMain.RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    fmMain.StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    fmMain.AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;

  //dmDBFunction.DeleteHongikTempTable('1');  ///�ӽ� ���̺��� ��� �����ϰ� �ٽ� ���� �信�� ���� �´�.

  if (dmDBFunction.CheckTB_COMPANY_Gubun('001','000','000','1') <> 1) then
  begin
    stName := 'ȫ�ʹ뼭��';
    dmDBFunction.InsertIntoTB_COMPANY('001','000','000','1',stName);
  end;

  stSql := 'SELECT * from v_member_kttelecop ';
  stSql := stSql + ' Where K_CAMPUS = 1 ';

  fmMain.L_bRelayDB := True;
   (*
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;

        dmDBFunction.InsertIntoTB_HonikTempTableSeoul(FindField('K_CAMPUS').AsString,  //1.����,2.����
                               FindField('K_LEVEL1').AsString,   //�ܰ����ڵ�
                               FindField('K_LEVEL1_NAME').AsString,   //�ܰ����Ī
                               FindField('K_LEVEL2').AsString,   //�а��ڵ�
                               FindField('K_LEVEL2_NAME').AsString,   //�̸�
                               FindField('K_GUBUN').AsString,      //����
                               FindField('K_GUBUN_NAME').AsString,     //1:����, 2:����, 3:����, 4: ���п���, 5:�кλ�, 6:����
                               FindField('K_NAME').AsString,       //����
                               FindField('K_KEY').AsString,      //�й�
                               FindField('K_STATUS').AsString,   //1:����(����), 2:����(����), 3:����(����), 4:����, 5:����
                               FindField('K_UPDT').AsString      //�߷���(���º�����)

        );
        fmMain.StatusBar1.Panels[2].Text := FindField('K_KEY').AsString + ' Copy';
        Application.ProcessMessages;
        Next;
      end;


      stSql := 'SELECT * from V_MCARDTYPE_KTTELECOP ';
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
        result := True;
        While Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          dmDBFunction.InsertIntoTB_HonikMCardTempTable(FindField('M_KEY').AsString,  //�й�
                                   FindField('M_CARDTYPE').AsString,   //0:����Ͻź���, 1:ī��ź���
                                   FindField('M_CARDCNT').AsString,   //�߱�����
                                   FindField('M_CARDSTOP').AsString,   //0:����, 1:�н�, 2:����
                                   FindField('M_UPDT').AsString   //YYYYMMDDHHMMSS

            );


          fmMain.StatusBar1.Panels[2].Text := FindField('M_KEY').AsString + ' MCopy';
          Application.ProcessMessages;
          Next;
        end;
      end;

      HongiKTempToTempSeoul(); //TB_HonikTempTable2 ���̺� ����
      HongiKJijumCodeChange(); //�����ڵ� ����
      HongiKDepartCodeChange(); //�μ��ڵ� ����
      HongiKPosiCodeChange(); //�����ڵ� ����


    end;
  Finally
    fmMain.L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  *)
  Try
      HongiKTempToTempSeoul(); //TB_HonikTempTable2 ���̺� ����
      HongiKJijumCodeChange(); //�����ڵ� ����
      HongiKDepartCodeChange(); //�μ��ڵ� ����
      HongiKPosiCodeChange(); //�����ڵ� ����
  Finally
    fmMain.L_bRelayDB := False;
  End;
  fmMain.StatusBar1.Panels[2].Text := 'InitSeoulRelay END';
end;

end.
