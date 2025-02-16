{
KT 서초사옥 연동을 위해서 MSSQL 테이블에 INSERT 하는 과정
}
unit uPersonRelay;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX;

type
  TdmPersonRelay = class(TDataModule)
    RelayADOConnection: TADOConnection;
    CheckADOQuery: TADOQuery;
  private
    { Private declarations }
    Function ProcessRelayExecute(aSql:string;CountCheck:Boolean=False):Boolean;
    Function CheckRelayTB_Company(aCompanyCode,aJijumcode,aDepartCode:string):Boolean;
    Function InsertRelayTB_Company(aCompanyCode,aJijumcode,aDepartCode,aConame,aGubun:string):Boolean;
    Function UpdateRelayTB_Company(aCompanyCode,aJijumcode,aDepartCode,aConame,aGubun:string):Boolean;
    Function CheckRelayTB_POSI(aCompanyCode,aPosicode:string):Boolean;
    Function InsertRelayTB_POSI(aCompanyCode,aPosicode,aPosiname:string):Boolean;
    Function UpdateRelayTB_POSI(aCompanyCode,aPosicode,aPosiname:string):Boolean;

    Function InsertRelayTB_EMPHIS(aCompanyCode,aEmCode,aFdmsID,aMode,aSendStatus,
            aCardNo,aCardType,aSendStatus2,aInsertTime:string ):Boolean;
    Function InsertRelayTB_EMPLOYEE(aEmCode,aCompanyCode,aJijumCode,
              aDepartCode,aPosiCode,aEmName,aCoPhone,aHomePhone,aHandPhone,
              aZipCode,aAddr1,aAddr2,aJoinDate,aRetireDate,aUpdateTime,aOperater,
              aFdmsID,aFdmsRelay,aRgCode:string):Boolean;
    Function UpdateRelayTB_EMPLOYEE(aEmCode,aCompanyCode,aJijumCode,
              aDepartCode,aPosiCode,aEmName,aCoPhone,aHomePhone,aHandPhone,
              aZipCode,aAddr1,aAddr2,aJoinDate,aRetireDate,aUpdateTime,aOperater,
              aFdmsID,aFdmsRelay,aRgCode:string):Boolean;
    Function  InsertRelayTB_CARD(aCardNo,aCardGubun,aCardType,aEmCode,aCompanyCode,
                aLastUse,aUpdateTime,aOperater,aCardStatus:string;aPosiNum:integer):Boolean;
    Function  UpdateRelayTB_CARD(aCardNo,aCardGubun,aCardType,aEmCode,aCompanyCode,
                aLastUse,aUpdateTime,aOperater,aCardStatus:string;aPosiNum:integer):Boolean;
    Function CheckRelayTB_CARD(aCardNo:string):Boolean;
    Function DeleteRelayTB_EMPLOYEE(aCompanyCode,aEmCode:string):Boolean;
    Function DeleteRelayTB_CARD(aCardNo:string):Boolean;

  private
    Function UpdateTB_EMPHISSendStatusID(aSeq:integer;aStatus:string):Boolean;
    Function UpdateTB_EMPHISSendStatus2ID(aSeq:integer;aStatus:string):Boolean;
  public
    Function KT_ALLEHCAMPUSRelay:Boolean;
    Function TB_CARDALLEHRelay(aCardNo,aMode:string):Boolean;
    Function TB_EMPLOYEEALLEHRelay(aCompanyCode,aEmCode,aMode:string):Boolean;
    Function RelayTB_CARDCheck(aCardNo:string):integer;
    Function RelayTB_EMPLOYEECheck(aCompanyCode,aEmCode:string):integer;
  public
    { Public declarations }
    Function RelayAdoConnect(aDBType,aServerIP,aServerPort,aDBName,
         aUserID,aUserPw:string):Boolean;
    Function RelayAdoDisConnect:Boolean;
    Function KTTB_COMPANYRelay : Boolean;
    Function KTTB_POSIRelay : Boolean;
    Function KTTB_CARD_Relay : Boolean;
    Function KTTB_EmployeeRelay : Boolean;
    Function UpdateTB_EMPHISSendReady:Boolean;
    Function UpdateTB_EMPHISSend2Ready:Boolean;
    Function UpdateTB_COMPANYUPDATECHECK(aOldState,aNewState:string):Boolean;
    Function UpdateTB_POSIUPDATECHECK(aOldState,aNewState:string):Boolean;

    Function STXFoodTB_EmployeeRelay : Boolean;
    Function InsertSTXFoodTable(
                        aInsertDate,
                        aCardNo,
                        aCompanyCode,
                        aCompanyName,
                        aDepartName,
                        aPosiName,
                        aEmCode,
                        aEmployeeName,
                        aCardState:string):Boolean;
    function CheckSTXFoodRelay(aInsertDate,aCompanyCode,aEmCode,aCardState:string):Boolean;
  end;

var
  dmPersonRelay: TdmPersonRelay;

implementation

uses
  uDataModule1,
  uLomosUtil;
  
{$R *.dfm}

{ TdmPersonRelay }

function TdmPersonRelay.CheckRelayTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  with CheckADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TdmPersonRelay.CheckRelayTB_Company(aCompanyCode, aJijumcode,
  aDepartCode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';

  With CheckADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TdmPersonRelay.CheckRelayTB_POSI(aCompanyCode,
  aPosicode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosicode + ''' ';

  With CheckADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TdmPersonRelay.CheckSTXFoodRelay(aInsertDate, aCompanyCode,
  aEmCode, aCardState: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from CUSTOMER_TEMPORARY ';
  stSql := stSql + ' Where INSERT_DATE = ''' + aInsertDate + ''' ';
  stSql := stSql + ' AND COMPANY_CODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EMPLOYEE_NO = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND REGIST_FLAG = ''' + aCardState + ''' ';

  with CheckADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

function TdmPersonRelay.DeleteRelayTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.DeleteRelayTB_EMPLOYEE(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.InsertRelayTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmCode, aCompanyCode, aLastUse, aUpdateTime, aOperater,
  aCardStatus: string; aPosiNum: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CARD( ';
  stSql := stSql + ' group_code,';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' ca_gubun,';
  stSql := stSql + ' ca_cardtype,';
  stSql := stSql + ' em_code,';
  stSql := stSql + ' co_companycode,';
  stSql := stSql + ' ca_lastuse,';
  stSql := stSql + ' ca_updatetime,';
  stSql := stSql + ' ca_updateoperator,';
  stSql := stSql + ' ca_status,';
  stSql := stSql + ' positionnum ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardGubun + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aLastUse + ''',';
  stSql := stSql + '''' + aUpdateTime + ''',';
  stSql := stSql + '''' + aOperater + ''',';
  stSql := stSql + '''' + aCardStatus + ''',';
  stSql := stSql + '' + inttostr(aPosiNum) + ') ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.InsertRelayTB_Company(aCompanyCode, aJijumcode,
  aDepartCode, aConame, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME, ';
  stSql := stSql + ' CO_GUBUN ) ';
  stSql := stsql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumcode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aConame + ''',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.InsertRelayTB_EMPHIS(aCompanyCode, aEmCode,
  aFdmsID, aMode, aSendStatus, aCardNo, aCardType, aSendStatus2,
  aInsertTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_EMPHIS( ';
  stSql := stSql + ' group_code,';
  stSql := stSql + ' co_companycode,';
  stSql := stSql + ' em_code,';
  stSql := stSql + ' fdms_id,';
  stSql := stSql + ' mode,';
  stSql := stSql + ' send_status,';
  stSql := stSql + ' ca_cardno,';
  stSql := stSql + ' ca_cardtype,';
  stSql := stSql + ' send_status2,';
  stSql := stSql + ' eh_inserttime ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''' + aSendStatus + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''' + aSendStatus2 + ''',';
  stSql := stSql + '''' + aInsertTime + ''') ';

  result := ProcessRelayExecute(stSql,True);
  
end;

function TdmPersonRelay.InsertRelayTB_EMPLOYEE(aEmCode, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aEmName, aCoPhone, aHomePhone,
  aHandPhone, aZipCode, aAddr1, aAddr2, aJoinDate, aRetireDate,
  aUpdateTime, aOperater, aFdmsID, aFdmsRelay, aRgCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'group_code,';
  stSql := stSql + 'em_code,';
  stSql := stSql + 'co_companycode,';
  stSql := stSql + 'co_jijumcode,';
  stSql := stSql + 'co_departcode,';
  stSql := stSql + 'po_posicode,';
  stSql := stSql + 'em_name,';
  stSql := stSql + 'em_cophone,';
  stSql := stSql + 'em_homephone,';
  stSql := stSql + 'em_handphone,';
  stSql := stSql + 'zi_zipcode,';
  stSql := stSql + 'em_addr1,';
  stSql := stSql + 'em_addr2,';
  stSql := stSql + 'em_joindate,';
  stSql := stSql + 'em_retiredate,';
  stSql := stSql + 'em_updatetime,';
  stSql := stSql + 'em_updateoperator,';
  stSql := stSql + 'fdms_id,';
  stSql := stSql + 'fdms_relay,';
  stSql := stSql + 'rg_code) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aCoPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aZipCode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '''' + aUpdateTime + ''',';
  stSql := stSql + '''' + aOperater + ''',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''' + aFdmsRelay + ''',';
  stSql := stSql + '''' + aRgCode + ''')';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.InsertRelayTB_POSI(aCompanyCode, aPosicode,
  aPosiname: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_POSI(';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME ) ';
  stSql := stsql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosicode + ''',';
  stSql := stSql + '''' + aPosiname + ''' ) ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.InsertSTXFoodTable(aInsertDate, aCardNo,
  aCompanyCode, aCompanyName, aDepartName, aPosiName, aEmCode,
  aEmployeeName, aCardState: string): Boolean;
var
  stSql : string;
begin

  result := False;
{  if Trim(aEmCode) = '' then
  begin
    Exit;
  end; }
  if Trim(aCardNo) = '' then
  begin
    Exit;
  end;

  if Trim(aCardState) = '' then aCardState := '1';
  if Trim(aInsertDate) = '' then aInsertDate := FormatDateTime('yyyy-mm-dd hh:nn:ss',Now);

  stSql := 'Insert Into CUSTOMER_TEMPORARY(';
  stSql := stSql + 'INSERT_DATE,';
  stSql := stSql + 'CARD_NO,';
  stSql := stSql + 'COMPANY_CODE,';
  stSql := stSql + 'COMPANY_NAME,';
  stSql := stSql + 'DEPARTMENT_NAME,';
  stSql := stSql + 'DUTY,';
  stSql := stSql + 'EMPLOYEE_NO,';
  stSql := stSql + 'EMPLOYEE_NAME,';
  stSql := stSql + 'REGIST_FLAG ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aInsertDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aEmployeeName + ''',';
  stSql := stSql + '''' + aCardState + ''')';

  result := ProcessRelayExecute(stSql,True);

end;

function TdmPersonRelay.KTTB_CARD_Relay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nPosiNum : integer;
  nFdmsID : integer;
  stCompanyCode : string;
  stEmCode : string;
  stMode : string;
  stSendStatus :string;
  stCardNo : string;
  stCardType : string;
  stSendStatus2 :string;
  stInsertTime : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stEmName : string;
  stCoPhone : string;
  stHomePhone : string;
  stHandPhone : string;
  stZipCode : string;
  stAddr1,stAddr2 : string;
  stJoinDate,stRetireDate : string;
begin
  result := False;
  stSql := ' Select a.seq,a.fdms_id,a.mode, ';
  stSql := stSql + ' a.send_status,a.eh_inserttime,a.send_status2, ';
  stSql := stSql + ' c.ca_cardno,c.ca_cardtype,c.co_companycode,c.em_code,c.ca_gubun,c.ca_lastuse,c.ca_updatetime,c.ca_updateoperator,';
  stSql := stSql + ' c.ca_status,c.positionnum ';
  stSql := stSql + ' from TB_EMPHIS a ';   //부하가 많이 걸리므로 연동 안된 데이터만 처리
  stSql := stSql + ' Left Join TB_CARD c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = c.CA_CARDNO ) ';
  stSql := stSql + ' Where a.send_status = ''R'' ';
  stSql := stSql + ' Order by a.seq ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        if FindField('positionnum').IsNull then nPosiNum := 0
        else nPosiNum := FindField('positionnum').AsInteger;
        if FindField('fdms_id').IsNull then nFdmsID := 31
        else nFdmsID := FindField('fdms_id').AsInteger;

        stCompanyCode := FindField('co_companycode').AsString;
        stEmCode := FindField('em_code').AsString;
        stMode := FindField('mode').AsString;
        stCardNo := FindField('ca_cardno').AsString;
        stCardType := FindField('ca_cardtype').AsString;

        if stMode = '1' then //입력
        begin
          if Trim(stCardNo) <> '' then
          begin
            InsertRelayTB_CARD(
              stCardNo,
              FindField('ca_gubun').AsString,
              stCardType,
              stEmCode,
              stCompanyCode,
              FindField('ca_lastuse').AsString,
              FindField('ca_updatetime').AsString,
              FindField('ca_updateoperator').AsString,
              FindField('ca_status').AsString,
              nPosiNum
            );
          end;
        end else if stMode = '2' then //수정
        begin
          if Trim(stCardNo) <> '' then
          begin
            if CheckRelayTB_CARD(stCardNo) then
            begin
              UpdateRelayTB_CARD(stCardNo,
                FindField('ca_gubun').AsString,
                stCardType,stEmCode,stCompanyCode,
                FindField('ca_lastuse').AsString,
                FindField('ca_updatetime').AsString,
                FindField('ca_updateoperator').AsString,
                FindField('ca_status').AsString,
                nPosiNum
              );
            end else
            begin
              InsertRelayTB_CARD(stCardNo,
                FindField('ca_gubun').AsString,
                stCardType,stEmCode,stCompanyCode,
                FindField('ca_lastuse').AsString,
                FindField('ca_updatetime').AsString,
                FindField('ca_updateoperator').AsString,
                FindField('ca_status').AsString,
                nPosiNum
              );
            end;
          end;
        end else if stMode = '3' then //삭제
        begin
          DeleteRelayTB_CARD(stCardNo);
        end;
        Next;
      end;
      result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.KTTB_COMPANYRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  UpdateTB_COMPANYUPDATECHECK('N','R');

  stSql := ' Select * from TB_COMPANY ';   //부하가 많이 안걸리니까 매번마다 업데이트 처리 하자.
  stSql := stSql + ' Where CO_UPDATECHECK = ''R'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      while Not Eof do
      begin
        if Not CheckRelayTB_Company(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString) then
        begin
          InsertRelayTB_COMPANY(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,FindField('CO_NAME').AsString,FindField('CO_GUBUN').AsString);
        end else
        begin
          UpdateRelayTB_COMPANY(FindField('CO_COMPANYCODE').AsString,FindField('CO_JIJUMCODE').AsString,FindField('CO_DEPARTCODE').AsString,FindField('CO_NAME').AsString,FindField('CO_GUBUN').AsString);
        end;
        Next;
      end;
      UpdateTB_COMPANYUPDATECHECK('R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

function TdmPersonRelay.KTTB_EmployeeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nPosiNum : integer;
  nFdmsID : integer;
  stCompanyCode : string;
  stEmCode : string;
  stMode : string;
  stSendStatus :string;
  stCardNo : string;
  stCardType : string;
  stSendStatus2 :string;
  stInsertTime : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stEmName : string;
  stCoPhone : string;
  stHomePhone : string;
  stHandPhone : string;
  stZipCode : string;
  stAddr1,stAddr2 : string;
  stJoinDate,stRetireDate : string;
begin
  result := False;
  stSql := ' Select a.seq,a.co_companycode,a.em_code,a.fdms_id,a.mode,a.ca_cardno,a.ca_cardtype, ';
  stSql := stSql + ' a.send_status,a.eh_inserttime,a.send_status2, ';
  stSql := stSql + ' b.co_jijumcode,b.co_departcode,b.po_posicode,';
  stSql := stSql + ' b.em_name,b.em_cophone,b.em_homephone,b.em_handphone,';
  stSql := stSql + ' b.zi_zipcode,b.em_addr1,b.em_addr2,b.em_joindate,';
  stSql := stSql + ' b.em_retiredate,b.em_image,b.em_pass,b.at_atcode,b.em_updatetime,';
  stSql := stSql + ' b.em_updateoperator,b.fdms_relay,b.rg_code,';
  stSql := stSql + ' c.ca_gubun,c.ca_lastuse,c.ca_updatetime,c.ca_updateoperator,';
  stSql := stSql + ' c.ca_status,c.positionnum ';
  stSql := stSql + ' from TB_EMPHIS a ';   //부하가 많이 걸리므로 연동 안된 데이터만 처리
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_CARD c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = c.CA_CARDNO ) ';
  stSql := stSql + ' Where a.send_status = ''R'' ';
  stSql := stSql + ' Order by a.seq ';
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        if FindField('positionnum').IsNull then nPosiNum := 0
        else nPosiNum := FindField('positionnum').AsInteger;
        if FindField('fdms_id').IsNull then nFdmsID := 31
        else nFdmsID := FindField('fdms_id').AsInteger;

        stCompanyCode := FindField('co_companycode').AsString;
        stEmCode := FindField('em_code').AsString;
        stMode := FindField('mode').AsString;
        stSendStatus := FindField('send_status').AsString;
        stCardNo := FindField('ca_cardno').AsString;
        stCardType := FindField('ca_cardtype').AsString;
        stSendStatus2 := FindField('send_status2').AsString;
        stInsertTime := FindField('eh_inserttime').AsString;
        stJijumCode := FindField('co_jijumcode').AsString;
        stDepartCode := FindField('co_departcode').AsString;
        stPosiCode := FindField('po_posicode').AsString;
        stEmName := FindField('em_name').AsString;
        stCoPhone := FindField('em_cophone').AsString;
        stHomePhone := FindField('em_homephone').AsString;
        stHandPhone := FindField('em_handphone').AsString;
        stZipCode := FindField('zi_zipcode').AsString;
        stAddr1 := FindField('em_addr1').AsString;
        stAddr2 := FindField('em_addr2').AsString;
        stJoinDate := FindField('em_joindate').AsString;
        stRetireDate := FindField('em_retiredate').AsString;

        if InsertRelayTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
            stMode,stSendStatus,stCardNo,stCardType,stSendStatus2,stInsertTime ) then
        begin
          if stMode = '1' then //입력
          begin
            InsertRelayTB_EMPLOYEE(stEmCode,stCompanyCode,stJijumCode,stDepartCode,
              stPosiCode,stEmName,stCoPhone,stHomePhone,stHandPhone,stZipCode,
              stAddr1,stAddr2,stJoinDate,stRetireDate,
              FindField('em_updatetime').AsString,
              FindField('em_updateoperator').AsString,
              inttostr(nFdmsID),
              FindField('fdms_relay').AsString,
              FindField('rg_code').AsString
              );

          end else if stMode = '2' then //수정
          begin
            UpdateRelayTB_EMPLOYEE(stEmCode,stCompanyCode,stJijumCode,stDepartCode,
              stPosiCode,stEmName,stCoPhone,stHomePhone,stHandPhone,stZipCode,
              stAddr1,stAddr2,stJoinDate,stRetireDate,
              FindField('em_updatetime').AsString,
              FindField('em_updateoperator').AsString,
              inttostr(FindField('fdms_id').AsInteger),
              FindField('fdms_relay').AsString,
              FindField('rg_code').AsString
            );
          end else if stMode = '3' then //삭제
          begin
            if DUPCARDTYPE = 1 then
            begin
              if stCardNo = '' then DeleteRelayTB_EMPLOYEE(stCompanyCode,stEmCode);       //2010.06.11 사원증 카드 2장 이상 인경우
            end else
            begin
              DeleteRelayTB_EMPLOYEE(stCompanyCode,stEmCode);
            end;
          end;
          UpdateTB_EMPHISSendStatusID(FindField('seq').AsInteger,'Y');
        end else Break;
        Next;
      end;
      result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;


function TdmPersonRelay.KTTB_POSIRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  UpdateTB_POSIUPDATECHECK('N','R');
  stSql := ' Select * from TB_POSI ';   //부하가 많이 안걸리니까 매번마다 업데이트 처리 하자.
  stSql := stSql + ' Where PO_UPDATECHECK = ''R'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      while Not Eof do
      begin
        if Not CheckRelayTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString) then
        begin
          InsertRelayTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,FindField('PO_NAME').AsString);
        end else
        begin
          UpdateRelayTB_POSI(FindField('CO_COMPANYCODE').AsString,FindField('PO_POSICODE').AsString,FindField('PO_NAME').AsString);
        end;
        Next;
      end;
      UpdateTB_POSIUPDATECHECK('R','Y');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.KT_ALLEHCAMPUSRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
  stEmCode : string;
  stMode : string;
  stSendStatus : string;
  stSendStatus2 : string;
  stCardNo : string;
  stCardType : string;
  nFdmsID : integer;
  stInsertTime : string;
  bResult : Boolean;
begin
  result := False;
  stSql := ' Select * ';
  stSql := stSql + ' from TB_EMPHIS ';   //부하가 많이 걸리므로 연동 안된 데이터만 처리
  stSql := stSql + ' Where send_status = ''R'' ';
  stSql := stSql + ' Order by seq ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        bResult := False;
        if FindField('fdms_id').IsNull then nFdmsID := 31
        else nFdmsID := FindField('fdms_id').AsInteger;

        stCompanyCode := FindField('co_companycode').AsString;
        stEmCode := FindField('em_code').AsString;
        stMode := FindField('mode').AsString;
        stSendStatus := FindField('send_status').AsString;
        stCardNo := FindField('ca_cardno').AsString;
        stCardType := FindField('ca_cardtype').AsString;
        stSendStatus2 := FindField('send_status2').AsString;
        stInsertTime := FindField('eh_inserttime').AsString;

        RelayADOConnection.BeginTrans;
        InsertRelayTB_EMPHIS(stCompanyCode,stEmCode,inttostr(nFdmsID),
            stMode,stSendStatus,stCardNo,stCardType,stSendStatus2,stInsertTime );

        if Trim(stCardNo) <> '' then
        begin
           bResult := TB_CARDALLEHRelay(stCardNo,stMode);
        end else bResult := True;
        if Trim(stEmCode) <> '' then
        begin
          if bResult then
          begin
             bResult := TB_EMPLOYEEALLEHRelay(stCompanyCode,stEmCode,stMode);
          end;
        end;
        if Not bResult then
        begin
          RelayADOConnection.RollbackTrans;
          Exit;
        end;
        RelayADOConnection.CommitTrans;
        UpdateTB_EMPHISSendStatusID(FindField('seq').AsInteger,'Y');
        Next;
      end;
      result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.ProcessRelayExecute(aSql: string;CountCheck:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nCount : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := RelayADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nCount := ExecSQL;
      except
      ON E: Exception do
        begin
          DataModule1.SQLErrorLog('Relay DBError:'+ SQL.Text);
          Exit;
        end
      end;
      if CountCheck then
      begin
        if nCount > 0 then Result := True; 
      end else
      begin
        Result:= True;
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.RelayAdoConnect(aDBType,aServerIP,aServerPort,aDBName,
         aUserID,aUserPw:string): Boolean;
var
  conStr : wideString;
begin
  result := False;
  conStr := '';
  if aDBType = '0' then //MDB
  begin
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + aDBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
  end else if aDBType = '1' then  //MSSQL
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + aUserPw + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + aUserID + ';';
    conStr := constr + 'Initial Catalog=' + aDBName + ';';
    conStr := constr + 'Data Source=' + aServerIP  + ',' + aServerPort;
  end else if aDBType = '2' then  //PostGreSql
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + aServerIP + ';'   ;
    conStr := constr + 'location=' + aDBName + ';';
    conStr := constr + 'User Id='+ aUserID + ';';
    conStr := constr + 'password=' + aUserPw;
  end else Exit;

  with RelayADOConnection do
  begin
    ConnectionTimeout := 1;
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          //ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    Result := True;
    //CursorLocation := clUseClient;
  end;

end;

function TdmPersonRelay.RelayAdoDisConnect: Boolean;
begin
  result := False;
  Try
    with RelayADOConnection do
    begin
      Connected := False;
    end;
  Except
    Exit;
  End;
  result := True;
end;

function TdmPersonRelay.RelayTB_CARDCheck(aCardNo: string): integer;
var
  stSql : string;
  TempCheckQuery : TADOQuery;
begin
  result := -1;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempCheckQuery := TADOQuery.Create(nil);
    TempCheckQuery.Connection := RelayADOConnection;
    TempCheckQuery.DisableControls;
    with TempCheckQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        Open;
      except
        Exit;
      end;
      if recordcount < 1 then result := 0
      else result := 1;
    end;
  Finally
    TempCheckQuery.EnableControls;
    TempCheckQuery.Free;
    CoUninitialize;
  End;

end;

{TO DO STX 식수연동 부분 처리 할것}
function TdmPersonRelay.RelayTB_EMPLOYEECheck(aCompanyCode,aEmCode: string): integer;
var
  stSql : string;
  TempCheckQuery : TADOQuery;
begin
  result := -1;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempCheckQuery := TADOQuery.Create(nil);
    TempCheckQuery.Connection := RelayADOConnection;
    TempCheckQuery.DisableControls;
    with TempCheckQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        Open;
      except
        Exit;
      end;
      if recordcount < 1 then result := 0
      else result := 1;
    end;
  Finally
    TempCheckQuery.EnableControls;
    TempCheckQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.STXFoodTB_EmployeeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stInsertDate : string;
  stCardNo : string;
  stCompanyCode : string;
  stCompanyName : string;
  stDepartName : string;
  stPosiName : string;
  stEmCode : string;
  stEmployeeName : string;
  stCardState : string;
begin
  result := False;
  stSql := ' Select ';
  if DBTYPE = 'MSSQL' then stSql := stSql + ' top 200 ';
  stSql := stSql + ' a.seq,a.ca_cardno,a.co_companycode,a.company_name,a.jijum_name,';
  stSql := stSql + ' a.depart_name,a.po_name,a.em_code,a.em_name,a.mode,a.ca_cardtype, ';
  stSql := stSql + ' c.rg_code ';
  stSql := stSql + ' from TB_EMPHIS a ';   //부하가 많이 걸리므로 연동 안된 데이터만 처리
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE) ';
  stSql := stSql + ' Where a.send_status2 = ''R'' ';
  stSql := stSql + ' Order by a.seq ';
  if DBTYPE = 'PG' then stSql := stSql + ' LIMIT 200 OFFSET 0 ';
  
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;

      while Not Eof do
      begin
        stInsertDate := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
        stCardNo := FindField('ca_cardno').AsString;
        stCompanyCode := FindField('co_companycode').AsString;
        stCompanyName := FindField('company_name').AsString;
        stDepartName := FindField('jijum_name').AsString;
        stPosiName := FindField('po_name').AsString;
        stEmCode := FindField('em_code').AsString;
        stEmployeeName := FindField('em_name').AsString;
        stCardState := FindField('ca_cardtype').AsString;
        if FindField('mode').AsString = '3' then //삭제면
           stCardState := '3';
        if FindField('rg_code').AsString <> '001' then stCardState := '3';  
        if Trim(stCardState) = '' then stCardState := '3';
        if InsertSTXFoodTable(
                        stInsertDate,
                        stCardNo,
                        stCompanyCode,
                        stCompanyName,
                        stDepartName,
                        stPosiName,
                        stEmCode,
                        stEmployeeName,
                        stCardState) then
        begin
          if CheckSTXFoodRelay(stInsertDate,stCompanyCode,stEmCode,stCardState) then  //인서트가 정확히 되었는지 확인
             UpdateTB_EMPHISSendStatus2ID(FindField('seq').AsInteger,'Y');
        end else
        begin
          if Trim(stEmCode) = '' then
            UpdateTB_EMPHISSendStatus2ID(FindField('seq').AsInteger,'Y');
          if Trim(stCardNo) = '' then
            UpdateTB_EMPHISSendStatus2ID(FindField('seq').AsInteger,'Y');
        end;
        Next;
      end;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmPersonRelay.TB_CARDALLEHRelay(aCardNo,aMode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then
      begin
        //카드 번호가 없는 경우이므로 연동 테이블에 카드를 삭제 하자.
        DeleteRelayTB_CARD(aCardNo);
        if RelayTB_CARDCheck(aCardNo) = 0 then result := True; //연동 테이블에 카드데이터가 있는지 체크하자.
        Exit;
      end;
      if CheckRelayTB_CARD(aCardNo) then
      begin
        UpdateRelayTB_CARD(aCardNo,
          FindField('ca_gubun').AsString,
          FindField('ca_cardtype').AsString,
          FindField('em_code').AsString,
          FindField('co_companycode').AsString,
          FindField('ca_lastuse').AsString,
          FindField('ca_updatetime').AsString,
          FindField('ca_updateoperator').AsString,
          FindField('ca_status').AsString,
          FindField('positionnum').AsInteger
        );
      end else
      begin
        InsertRelayTB_CARD(aCardNo,
          FindField('ca_gubun').AsString,
          FindField('ca_cardtype').AsString,
          FindField('em_code').AsString,
          FindField('co_companycode').AsString,
          FindField('ca_lastuse').AsString,
          FindField('ca_updatetime').AsString,
          FindField('ca_updateoperator').AsString,
          FindField('ca_status').AsString,
          FindField('positionnum').AsInteger
        );
      end;
      if RelayTB_CARDCheck(aCardNo) = 1 then result := True; //연동 테이블에 카드데이터가 있는지 체크하자.
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.TB_EMPLOYEEALLEHRelay(aCompanyCode,
  aEmCode,aMode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then
      begin
        //if aMode = '3' then
        //begin
          //사원 번호가 없는 경우이므로 연동 테이블에 사원정보를 삭제 하자.
          DeleteRelayTB_EMPLOYEE(aCompanyCode,aEmCode);
          if RelayTB_EMPLOYEECheck(aCompanyCode,aEmCode) = 0 then result := True
          else  //연동 테이블에 카드데이터가 있는지 체크하자.
            LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','DeleteRelayTB_EMPLOYEE Error');
        //end;
        Exit;
      end;
      if RelayTB_EMPLOYEECheck(aCompanyCode,aEmCode) =  1 then
      begin
        UpdateRelayTB_EMPLOYEE(aEmCode,aCompanyCode,
          FindField('CO_JIJUMCODE').AsString,
          FindField('CO_DEPARTCODE').AsString,
          FindField('PO_POSICODE').AsString,
          FindField('EM_NAME').AsString,
          FindField('EM_COPHONE').AsString,
          FindField('EM_HOMEPHONE').AsString,
          FindField('EM_HANDPHONE').AsString,
          FindField('ZI_ZIPCODE').AsString,
          FindField('EM_ADDR1').AsString,
          FindField('EM_ADDR2').AsString,
          FindField('EM_JOINDATE').AsString,
          FindField('EM_RETIREDATE').AsString,
          FindField('em_updatetime').AsString,
          FindField('em_updateoperator').AsString,
          inttostr(FindField('fdms_id').AsInteger),
          FindField('fdms_relay').AsString,
          FindField('rg_code').AsString
        );
      end else
      begin
        InsertRelayTB_EMPLOYEE(aEmCode,aCompanyCode,
          FindField('CO_JIJUMCODE').AsString,
          FindField('CO_DEPARTCODE').AsString,
          FindField('PO_POSICODE').AsString,
          FindField('EM_NAME').AsString,
          FindField('EM_COPHONE').AsString,
          FindField('EM_HOMEPHONE').AsString,
          FindField('EM_HANDPHONE').AsString,
          FindField('ZI_ZIPCODE').AsString,
          FindField('EM_ADDR1').AsString,
          FindField('EM_ADDR2').AsString,
          FindField('EM_JOINDATE').AsString,
          FindField('EM_RETIREDATE').AsString,
          FindField('em_updatetime').AsString,
          FindField('em_updateoperator').AsString,
          inttostr(FindField('fdms_id').AsInteger),
          FindField('fdms_relay').AsString,
          FindField('rg_code').AsString
        );
      end;
      if RelayTB_EMPLOYEECheck(aCompanyCode,aEmCode) =  1 then result := True
      else LogSave(ExeFolder + '\..\log\Relay'+FormatDateTime('yyyymmdd',Now) + '.log','Insert RelayTB_EMPLOYEE Error'); //연동 테이블에 사원데이터가 있는지 체크하자.
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmPersonRelay.UpdateRelayTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmCode, aCompanyCode, aLastUse, aUpdateTime, aOperater,
  aCardStatus: string; aPosiNum: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD Set ';
  stSql := stSql + ' ca_gubun = ''' + aCardGubun + ''',';
  stSql := stSql + ' ca_cardtype = ''' + aCardType + ''',';
  stSql := stSql + ' em_code = ''' + aEmCode + ''',';
  stSql := stSql + ' co_companycode = ''' + aCompanyCode + ''',';
  stSql := stSql + ' ca_lastuse = ''' + aLastUse + ''',';
  stSql := stSql + ' ca_updatetime = ''' + aUpdateTime + ''',';
  stSql := stSql + ' ca_updateoperator = ''' + aOperater + ''',';
  stSql := stSql + ' ca_status = ''' + aCardStatus + ''',';
  stSql := stSql + ' positionnum = ' + inttostr(aPosiNum) ;
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.UpdateRelayTB_Company(aCompanyCode, aJijumcode,
  aDepartCode, aConame, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_COMPANY set ';
  stSql := stSql + ' CO_NAME = ''' + aConame + ''', ';
  stSql := stSql + ' CO_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumcode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.UpdateRelayTB_EMPLOYEE(aEmCode, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aEmName, aCoPhone, aHomePhone,
  aHandPhone, aZipCode, aAddr1, aAddr2, aJoinDate, aRetireDate,
  aUpdateTime, aOperater, aFdmsID, aFdmsRelay, aRgCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE Set ';
  if Trim(aJijumCode) <> '' then
    stSql := stSql + 'co_jijumcode = ''' + aJijumCode + ''',';
  if Trim(aDepartCode) <> '' then
    stSql := stSql + 'co_departcode = ''' + aDepartCode + ''',';
  if Trim(aPosiCode) <> '' then
    stSql := stSql + 'po_posicode = ''' + aPosiCode + ''',';
  if Trim(aEmName) <> '' then
    stSql := stSql + 'em_name = ''' + aEmName + ''',';
  if Trim(aCoPhone) <> '' then
    stSql := stSql + 'em_cophone = ''' + aCoPhone + ''',';
  if Trim(aHomePhone) <> '' then
    stSql := stSql + 'em_homephone = ''' + aHomePhone + ''',';
  if Trim(aHandPhone) <> '' then
    stSql := stSql + 'em_handphone = ''' + aHandPhone + ''',';
  if Trim(aZipCode) <> '' then
    stSql := stSql + 'zi_zipcode = ''' + aZipCode + ''',';
  if Trim(aAddr1) <> '' then
    stSql := stSql + 'em_addr1 = ''' + aAddr1 + ''',';
  if Trim(aAddr2) <> '' then
    stSql := stSql + 'em_addr2 = ''' + aAddr2 + ''',';
  if Trim(aJoinDate) <> '' then
    stSql := stSql + 'em_joindate = ''' + aJoinDate + ''',';
  if Trim(aRetireDate) <> '' then
    stSql := stSql + 'em_retiredate = ''' + aRetireDate + ''',';
  if Trim(aUpdateTime) <> '' then
    stSql := stSql + 'em_updatetime = ''' + aUpdateTime + ''',';
  stSql := stSql + 'em_updateoperator = ''' + aOperater + ''',';
  if Trim(aFdmsID) <> '' then
    stSql := stSql + 'fdms_id = ' + aFdmsID + ',';
  if Trim(aFdmsRelay) <> '' then
    stSql := stSql + 'fdms_relay = ''' + aFdmsRelay + ''',';
  stSql := stSql + 'rg_code = ''' + aRgCode + ''' ';
  stSql := stSql + ' Where em_code = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND co_companycode = ''' + aCompanyCode + ''' ';

  result := ProcessRelayExecute(stSql);
end;

function TdmPersonRelay.UpdateRelayTB_POSI(aCompanyCode, aPosicode,
  aPosiname: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_POSI set ';
  stSql := stSql + ' PO_NAME = ''' + aPosiname + ''' ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosicode + ''' ';

  result := ProcessRelayExecute(stSql);

end;

function TdmPersonRelay.UpdateTB_COMPANYUPDATECHECK(aOldState,
  aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_COMPANY set CO_UPDATECHECK = ''' + aNewState + ''' ';
  stSql := stSql + ' Where CO_UPDATECHECK = ''' + aOldState + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmPersonRelay.UpdateTB_EMPHISSend2Ready: Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPHIS set send_status2 = ''R'' ';
  stSql := stSql + ' Where send_status2 = ''N'' ' ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmPersonRelay.UpdateTB_EMPHISSendReady: Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPHIS set send_status = ''R'' ';
  stSql := stSql + ' Where send_status = ''N'' ' ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmPersonRelay.UpdateTB_EMPHISSendStatus2ID(aSeq: integer;
  aStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPHIS set send_status2 = ''' + aStatus + ''' ';
  stSql := stSql + ' Where seq = ' + inttostr(aSeq) ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmPersonRelay.UpdateTB_EMPHISSendStatusID(aSeq: integer;
  aStatus: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPHIS set send_status = ''' + aStatus + ''' ';
  stSql := stSql + ' Where seq = ' + inttostr(aSeq) ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TdmPersonRelay.UpdateTB_POSIUPDATECHECK(aOldState,
  aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_POSI set PO_UPDATECHECK = ''' + aNewState + ''' ';
  stSql := stSql + ' Where PO_UPDATECHECK = ''' + aOldState + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
