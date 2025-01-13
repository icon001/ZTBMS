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
    Function HongiKDepartCodeChange():Boolean;  //TB_HonikTempTable2 -> TB_HonikMappingDepart 구성
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
    Function HongiKUniversityRelay(aCampus:string):Boolean;  //연동 메인 
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
          //매핑 테이블에 이미 존재 하고 있으면

          if (stName <> FindField('K_LEVEL2_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingDepart(FindField('K_LEVEL1').AsString,  //단과대코드
                                 FindField('K_LEVEL2').AsString,
                                 FindField('K_LEVEL2_NAME').AsString,      //학과대명칭
                                 'Y');
          end;

        end else
        begin
          //없으면 지점 코드 생성
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);
          stJijumCode := GetHonikJijumCode(stCompanyCode,FindField('K_LEVEL1').AsString);
          stDepartCode := dmCommon.GetDepartCode(stCompanyCode,stJijumCode,FindField('K_LEVEL2_NAME').AsString);
          if stDepartCode = '000' then
          begin
            if Trim(FindField('K_LEVEL2_NAME').AsString) <> '' then
              dmCommon.CreateDepartCode(stCompanyCode,stJijumCode,FindField('K_LEVEL2_NAME').AsString,stDepartCode);
          end;

          dmDBFunction.InsertIntoTB_HonikMappingDepart(FindField('K_LEVEL1').AsString,  //단과대코드
                                 FindField('K_LEVEL2').AsString,
                                 stCompanyCode,      //회사코드
                                 stJijumCode,   //단과대코드
                                 stDepartCode,   //단과대코드
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
          //부서 코드가 있으면 업데이트 하자.
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
  stCardState := '1';  //aType이 0 인경우만 정상

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
                        '','홍익대학교',stJijumCode,stDepartCode,'');
    end else
    begin
      dmDBFunction.DeleteTB_EMPLOYEE_CardNo(stEmCode,stCardNo);
      //dmDBFunction.DeleteTB_EMPLOYEE_Key(stCompanyCode,stEmCode);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aKEY,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aName,
                        '','홍익대학교',stJijumCode,stDepartCode,'');
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
                          '','홍익대학교',stJijumCode,stDepartCode,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  result := True;
  if dmDBFunction.CheckTB_CARD_Employee_STICK(stCompanyCode,stEmCode) = 1 then Exit; //수동으로 들어온 카드라면 변경하지 않는다.
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo)=1 then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
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

  if stCardState <> '1' then  //비정상
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
          //매핑 테이블에 이미 존재 하고 있으면

          if (stName <> FindField('K_LEVEL1_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingJijum(FindField('K_LEVEL1').AsString,  //단과대코드
                                 FindField('K_LEVEL1_NAME').AsString,      //단과대명칭
                                 'Y');
          end;

        end else
        begin
          //없으면 지점 코드 생성
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);
          stJijumCode := dmCommon.GetJijumCode(stCompanyCode,FindField('K_LEVEL1_NAME').AsString); ///없으면 지점명으로 이미 등록된 코드가 있는지 검색한다.
          //stJijumCode := '000';//없으면 무조건 생성하자.
          if stJijumCode = '000' then
          begin
            if Trim(FindField('K_LEVEL1_NAME').AsString) <> '' then
              dmCommon.CreateJijumCode(stCompanyCode,FindField('K_LEVEL1_NAME').AsString,stJijumCode);
          end;
          dmDBFunction.InsertIntoTB_HonikMappingJijum(FindField('K_LEVEL1').AsString,  //단과대코드
                                 stCompanyCode,      //회사코드
                                 stJijumCode,   //단과대코드
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
          //지점 코드가 있으면 업데이트 하자.
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
          //매핑 테이블에 이미 존재 하고 있으면

          if (stName <> FindField('K_GUBUN_NAME').AsString) then
          begin
            dmDBFunction.UpdateTB_HonikMappingPosi(FindField('K_GUBUN').AsString,  //구분코드
                                 FindField('K_GUBUN_NAME').AsString,      //구분명칭
                                 'Y');
          end;

        end else
        begin
          //없으면 직위 코드 생성
          stCompanyCode := FillZeroNumber(FindField('K_CAMPUS').asinteger,3);

          stPosiCode := dmCommon.GetPosiCode(stCompanyCode,FindField('K_GUBUN_NAME').AsString);
          if stPosiCode = '000' then
          begin
            if Trim(FindField('K_GUBUN_NAME').AsString) <> '' then
              dmCommon.CreatePosiCode(stCompanyCode,FindField('K_GUBUN_NAME').AsString,stPosiCode);
          end;


          dmDBFunction.InsertIntoTB_HonikMappingPosi(FindField('K_GUBUN').AsString,
                                 stCompanyCode,      //회사코드
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
          //직위 코드가 있으면 업데이트 하자.
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
  stCardGubun : string; //1.일반카드,2:모바일카드
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
aCAMPUS : 1:서울, 2:세종
aKEY : 학생(학번), 교직원(종번)
aName : 성명
aCOJIJUMCODE,
aCODEPARTCODE,
aPOPOSICODE,
aCARDCNT : 발급 차수
aSTATE : 상태,1.신규,2.업데이트,3,삭제
aSTATUS : 1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
aCARDTYPE : 0:NFC, 1:BLE, 2:RF
aCARDSTOP : 0:정상, 1:분실, 2:정지
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
  stCardState := '1';  //aType이 0 인경우만 정상
  if aSTATUS = '5' then aSTATUS := '1'; //수료도 정상으로 처리
  //if aSTATUS <> '1' then stCardState := '3'; ///카드 정지
  if (aCARDSTOP = '1') then stCardState := '2' ///카드 분실
  else if (aCARDSTOP = '2') then stCardState := '3' ; ///카드 정지

  stEmCode := aKey;
  if length(aKEY) < 13 then
  begin
    stPosiGubun := aKGUBUN;
    (*
    if (Trim(aKGUBUN) = '4') or (Trim(aKGUBUN) = '5') then stPosiGubun := '01'    //구성원 코드가 4,5 이면 01 타입으로 변환
    else if (Trim(aKGUBUN) = '1') or (Trim(aKGUBUN) = '2') then stPosiGubun := '02'   //구성원 구분코드가 1,2 이면 02 타입으로 변환
    else if (Trim(aKGUBUN) = '3') or (Trim(aKGUBUN) = '6') then stPosiGubun := '03';  //구성원 구분코드가 3,6 이면 03 타입으로 변환
    *)
    if (Trim(aKGUBUN) = '1') or (Trim(aKGUBUN) = '2') then stPosiGubun := '01';   //구성원 구분코드가 1,2 이면 01 타입으로 변환

    if(aCARDTYPE='0') then
    begin
      //모바일카드 생성 규칙 M/B + 구분코드 2자리,사번10자리(*로 채움)+N+차수(2)
      aKEY := 'M' + FillZeroStrNum(Trim(stPosiGubun),2) + FillCharString(aKEY,'*',10,False)+ 'N';        ///모바일 카드
      stCardGubun := '2';
    end else if (aCARDTYPE='1') then
    begin
      aKEY := 'B' + FillZeroStrNum(Trim(stPosiGubun),2) + FillCharString(aKEY,'*',10,False)+ 'N';  ///BLE 카드
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

  if dmDBFunction.CheckTB_EMPLOYEE(stCompanyCode,stEmCode,nFdmsID,stWorkCode,stEndDate) then    //회사코드,아이디 가 존재하면
  begin
    if (aSTATE <> '3') then //삭제가 아니라면  사원 정보 업데이트
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
                        '','홍익대학교',stJijumCode,stDepartCode,'');
    end else
    begin
      dmDBFunction.DeleteTB_EMPLOYEE_CardNo(stEmCode,stCardNo); //astate == 3 이라면 사원 정보가 삭제 된 것임
      //dmDBFunction.DeleteTB_EMPLOYEE_Key(stCompanyCode,stEmCode);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aKEY,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aName,
                        '','홍익대학교',stJijumCode,stDepartCode,'');
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

      bCardGroupGrade := True; //카드 상태 변경으로 권한 부여
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aName,
                          '','홍익대학교',stJijumCode,stDepartCode,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;

  result := True;
  if(stCardNo='') then Exit; ///카드 번호가 없는 경우 빠져 나가자.


  //if dmDBFunction.CheckTB_CARD_Employee_STICK(stCompanyCode,stEmCode) = 1 then Exit; //수동으로 들어온 카드라면 변경하지 않는다. 이 부분은 제거

  if(stCardGubun='1') then//실물카드라면
  begin
    //실물 카드가 있는지 확인한다.
    nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,stEmCode,stCardNo,stCardGubun,stOldCodeNo);
    if nResult = 1 then
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮긴다.
      dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
      bCardGroupGrade := False;
    end else if nResult = 0 then
    begin
      //같은 사번으로 같은 카드가 있는 경우 권한 변경 하지 말자.
      bCardGroupGrade := False;
    end else if nResult = -1 then
    begin
      //실물 카드가 없다면 전체 카드 확인한다.
      nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo);
      if nResult = 1 then
      begin
        //같은 사번으로 다른 카드가 있는 경우
        //기존카드 권한을 똑같이 옮김,기존 카드 삭제는 하지 않는다.
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
        begin       //그룹권한을 적용한다.
          bCardGroupGrade := True;
        end;
      end;
    end;
    // 모바일 카드 권한은 삭제 한다.
    dmDBFunction.DeleteTB_CARD_EmployeeCardGubun(stCompanyCode,stEmCode,'2');

  end else //모바일 카드라면
  begin
    nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,stEmCode,stCardNo,stCardGubun,stOldCodeNo);
    if nResult = 1 then
    begin
      //같은 사번으로 다른 모바일 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
      bCardGroupGrade := False;
    end else if nResult = 0 then
    begin
      //같은 사번으로 같은 카드가 있는 경우 권한 변경 하지 말자.
      bCardGroupGrade := False;
    end else if nResult = -1 then
    begin
      //모바일 카드가 없다면 전체 카드를 조회한다.
      nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,stEmCode,stCardNo,stOldCodeNo);
      if nResult = 1 then
      begin
        //같은 사번으로 다른 카드가 있는 경우
        //기존카드 권한을 똑같이 옮김,기존 카드 삭제는 하지 않는다.
        dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo,False);
        bCardGroupGrade := False;
      end else
      begin
        //그룹권한을 적용한다.
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
  구분이 변경 될때 디폴드 값으로 가져 갈것인지 체크
  if(aGUBUN_CHANGE='Y') then
    bCardGroupGrade:=True;
  *)

  if (stCardState <> '1') then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end else
  begin
    ///신규 카드 여기서 권한 적용하자.
    if (bCardGroupGrade) then
    begin
      nIndex := MappingCode1List.IndexOf(stCompanyCode + stPosiCode);
      stGradeGroupCode := '';
      if nIndex > -1 then
      begin
        stGradeGroupCode := MappingCode2List.Strings[nIndex];
      end;
      if stGradeGroupCode <> '' then  //여기서 그룹 권한 복사 하자...
      begin
        dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);   //존재하는 권한 업데이트
        dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);  //없는 권한 추가
        dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');  //권한 부여됨 체크
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
  //Temp2 테이블에 삭제 되지 않은 것 중에서 모든 것을 삭제3으로  설정 후 변경 됨으로 표시하자.
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
            //Temp2 테이블에 이미 존재 하고 있으면 stChange가 'Y'이고 stMode가 '3'으로 되어 있다면 원래 데로 돌려 놓는다.
            stCurChange := 'N';   //변경 유무를 체크  기본으로 변경 안됨
            stCurMode := '2';     //변경 모드를 체크 기본으로 수정
            if stChange = 'N' then //원래가 삭제 되었던 것이다.
            begin
              stCurChange := 'Y'; //이번 것은 수정으로 다시 입력 들어 온것이다.
            end;
            if (stlevel1 <> FindField('K_LEVEL1').AsString) or
               (stlevel2 <> FindField('K_LEVEL2').AsString) or
               (stgubun <> FindField('K_GUBUN').AsString) or
               (stname <> FindField('K_NAME').AsString) or
               (stcnt <> FindField('K_CARD_CNT').AsString) then
            begin
              stCurChange := 'Y'; //정보가 바뀌면 업데이트 해야 한다.
            end;
            dmDBFunction.UpdateTB_HonikTempTable2(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                   FindField('K_KEY').AsString,      //학번
                                   FindField('K_LEVEL1').AsString,   //단과대코드
                                   FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                   FindField('K_LEVEL2').AsString,   //학과코드
                                   FindField('K_LEVEL2_NAME').AsString,   //이름
                                   FindField('K_GUBUN').AsString,      //구분
                                   FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                   FindField('K_NAME').AsString,       //성명
                                   FindField('K_CARD_CNT').AsString,      //카드 발급 차수
                                   stCurChange,
                                   stCurMode);
          end else
          begin
            dmDBFunction.InsertIntoTB_HonikTempTable2(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                   FindField('K_KEY').AsString,      //학번
                                   FindField('K_LEVEL1').AsString,   //단과대코드
                                   FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                   FindField('K_LEVEL2').AsString,   //학과코드
                                   FindField('K_LEVEL2_NAME').AsString,   //이름
                                   FindField('K_GUBUN').AsString,      //구분
                                   FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                   FindField('K_NAME').AsString,       //성명
                                   FindField('K_CARD_CNT').AsString,      //카드 발급 차수
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
  //삭제 정보가 있으면 연동을 해야 한다.
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
  stStatus : string;  //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
  stCardType : string;
  stCardStop : string;
  stGubunChange : string;
  stCardRegcnt : string; //카드 발급 차수
  stCardRegType : string; //카드 타입 모바일:0,BLE:1,NFC:2
  nCur : integer;
  nTot : integer;
  TempAdoQuery : TADOQuery;
begin
  //Temp2 테이블에 삭제 되지 않은 것 중에서 모든 것을 삭제3으로  설정 후 변경 됨으로 표시하자.
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
            //Temp2 테이블에 이미 존재 하고 있으면 stChange가 'Y'이고 stMode가 '3'으로 되어 있다면 원래 데로 돌려 놓는다.
            stCurChange := 'N';   //변경 유무를 체크  기본으로 변경 안됨
            stCurMode := '2';     //변경 모드를 체크 기본으로 수정
            stGubunChange := 'N'; //구분은 변경되지 않았다.
            if stChange = 'N' then //원래가 삭제 되었던 것이다.
            begin
              stCurChange := 'Y'; //이번 것은 수정으로 다시 입력 들어 온것이다.
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
              stCurChange := 'Y'; //정보가 바뀌면 업데이트 해야 한다.
              if((stgubun <> FindField('K_GUBUN').AsString)) then stGubunChange := 'Y';
            end;

            dmDBFunction.UpdateTB_HonikTempTable2Seoul(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                   FindField('K_KEY').AsString,      //학번
                                   FindField('K_LEVEL1').AsString,   //단과대코드
                                   FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                   FindField('K_LEVEL2').AsString,   //학과코드
                                   FindField('K_LEVEL2_NAME').AsString,   //이름
                                   FindField('K_GUBUN').AsString,      //구분
                                   FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                   stGubunChange,
                                   FindField('K_NAME').AsString,       //성명
                                   stCardRegcnt,      //카드 발급 차수
                                   FindField('K_STATUS').AsString,      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
                                   stCardRegType,    //0:모바일신분증, 1: BLE, 2:카드신분증
                                   FindField('M_CARDSTOP').AsString,    //0:정상, 1:분실, 2:정지
                                   stCurChange,
                                   stCurMode);
          end else
          begin
            dmDBFunction.InsertIntoTB_HonikTempTable2Seoul(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                   FindField('K_KEY').AsString,      //학번
                                   FindField('K_LEVEL1').AsString,   //단과대코드
                                   FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                   FindField('K_LEVEL2').AsString,   //학과코드
                                   FindField('K_LEVEL2_NAME').AsString,   //이름
                                   FindField('K_GUBUN').AsString,      //구분
                                   FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                   FindField('K_NAME').AsString,       //성명
                                   stCardRegcnt,      //카드 발급 차수
                                   FindField('K_STATUS').AsString,      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
                                   stCardRegType,    //0:모바일신분증, 1: BLE, 2:카드신분증
                                   FindField('M_CARDSTOP').AsString,    //0:정상, 1:분실, 2:정지
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
  //삭제 정보가 있으면 연동을 해야 한다.
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

  //dmDBFunction.DeleteHongikTempTable(aCampus);  ///임시 테이블을 모두 삭제하고 다시 연동 뷰에서 가져 온다.

  if (dmDBFunction.CheckTB_COMPANY_Gubun(FillZeroNumber(strtoint(aCampus),3),'000','000','1') <> 1) then
  begin
    //만약 001 코드가 없으면 001 코드를 생성한다.
    if aCampus = '1' then
    begin
      stName := '홍익대서울';
    end else
    begin
      stName := '홍익대세종';
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
            ///발령일이 오늘 이전인 데이터만 가져 오자.
            dmDBFunction.InsertIntoTB_HonikTempTableSeoul(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                 FindField('K_LEVEL1').AsString,   //단과대코드
                                 FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                 FindField('K_LEVEL2').AsString,   //학과코드
                                 FindField('K_LEVEL2_NAME').AsString,   //이름
                                 FindField('K_GUBUN').AsString,      //구분
                                 FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                 FindField('K_NAME').AsString,       //성명
                                 FindField('K_KEY').AsString,      //학번
                                 FindField('K_STATUS').AsString,   //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
                                 FindField('K_UPDT').AsString      //발령일(상태변경일)

            );
          end;
        end else
        begin
          //세종캠퍼스이면
          dmDBFunction.InsertIntoTB_HonikTempTable(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                                 FindField('K_LEVEL1').AsString,   //단과대코드
                                 FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                                 FindField('K_LEVEL2').AsString,   //학과코드
                                 FindField('K_LEVEL2_NAME').AsString,   //이름
                                 FindField('K_GUBUN').AsString,      //구분
                                 FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                                 FindField('K_NAME').AsString,       //성명
                                 FindField('K_KEY').AsString,      //학번
                                 FindField('K_CARD_CNT').AsString      //카드 발급 차수
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
            dmDBFunction.InsertIntoTB_HonikMCardTempTable(FindField('M_KEY').AsString,  //학번
                                     FindField('M_CARDTYPE').AsString,   //0:모바일신분증, 1:카드신분증
                                     FindField('M_CARDCNT').AsString,   //발급차수
                                     FindField('M_CARDSTOP').AsString,   //0:정상, 1:분실, 2:정지
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
        HongiKJijumCodeChange(); //지점코드 생성
        HongiKDepartCodeChange(); //부서코드 생성
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
      HongiKJijumCodeChange(); //지점코드 생성
      HongiKDepartCodeChange(); //부서코드 생성
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

  //dmDBFunction.DeleteHongikTempTable('1');  ///임시 테이블을 모두 삭제하고 다시 연동 뷰에서 가져 온다.

  if (dmDBFunction.CheckTB_COMPANY_Gubun('001','000','000','1') <> 1) then
  begin
    stName := '홍익대서울';
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

        dmDBFunction.InsertIntoTB_HonikTempTableSeoul(FindField('K_CAMPUS').AsString,  //1.서울,2.세종
                               FindField('K_LEVEL1').AsString,   //단과대코드
                               FindField('K_LEVEL1_NAME').AsString,   //단과대명칭
                               FindField('K_LEVEL2').AsString,   //학과코드
                               FindField('K_LEVEL2_NAME').AsString,   //이름
                               FindField('K_GUBUN').AsString,      //구분
                               FindField('K_GUBUN_NAME').AsString,     //1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원
                               FindField('K_NAME').AsString,       //성명
                               FindField('K_KEY').AsString,      //학번
                               FindField('K_STATUS').AsString,   //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
                               FindField('K_UPDT').AsString      //발령일(상태변경일)

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
          dmDBFunction.InsertIntoTB_HonikMCardTempTable(FindField('M_KEY').AsString,  //학번
                                   FindField('M_CARDTYPE').AsString,   //0:모바일신분증, 1:카드신분증
                                   FindField('M_CARDCNT').AsString,   //발급차수
                                   FindField('M_CARDSTOP').AsString,   //0:정상, 1:분실, 2:정지
                                   FindField('M_UPDT').AsString   //YYYYMMDDHHMMSS

            );


          fmMain.StatusBar1.Panels[2].Text := FindField('M_KEY').AsString + ' MCopy';
          Application.ProcessMessages;
          Next;
        end;
      end;

      HongiKTempToTempSeoul(); //TB_HonikTempTable2 테이블 생성
      HongiKJijumCodeChange(); //지점코드 생성
      HongiKDepartCodeChange(); //부서코드 생성
      HongiKPosiCodeChange(); //직위코드 생성


    end;
  Finally
    fmMain.L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  *)
  Try
      HongiKTempToTempSeoul(); //TB_HonikTempTable2 테이블 생성
      HongiKJijumCodeChange(); //지점코드 생성
      HongiKDepartCodeChange(); //부서코드 생성
      HongiKPosiCodeChange(); //직위코드 생성
  Finally
    fmMain.L_bRelayDB := False;
  End;
  fmMain.StatusBar1.Panels[2].Text := 'InitSeoulRelay END';
end;

end.
