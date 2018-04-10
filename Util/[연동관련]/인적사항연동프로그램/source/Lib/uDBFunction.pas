unit uDBFunction;

interface

uses
  SysUtils, Classes,ActiveX,ADODB,DB,uMssql,uPostGreSql,uMDBSql,uFireBird;

type
  TdmDBFunction = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function CheckTB_CARD_CardNo(aCardNo:string;var aCardState:string):integer;
    Function CheckTB_CARD_Employee(aCompanyCode,aEmCode,aCardNo:string;var aOldCardNo:string;bRegCard:Boolean=True):boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string; var aFdmsID:integer;var aWorkCode:string;var aEndDate:string):Boolean;
    Function CheckTB_EMPLOYEE_CoEmCode(aCompanyCode,aEmCode:string):integer;
    Function CheckTB_EMPLOYEE_EmCode(aEmCode:string):integer;
    Function CopyGradeOldCard(aOldCardNO,aNewCardNO:string):Boolean;
    Function DeleteTB_CARD_Key(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
    Function DeleteTB_EMPLOYEE_Key(aCompanyCode,aEmCode:string):Boolean;
    Function GetMaxPositionNum : integer;
    Function InsertIntoTB_CARD_Value(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertIntoTB_DEVICECARDNONotExist(aCardNO,aPromiseGrade:string):Boolean;
    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,afdmsID,aMode,aCardNo,aCardType,aEmName,aHandPhone,aCompanyName,aJijumName,aDepartName,aPosiName:string):Boolean;
    Function InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,aCardNo,aFormName,aWorkType:string):Boolean;
    Function InsertIntoTB_EMPLOYEE_Value(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCod,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 afdmsId,aEmTypeCode,aTimeCodeUse,aTimeCodeGroup,
                                 aTime1,aTime2,aTime3,aTime4,aTimeWeek,aMaster,aWorkCode:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string;aWorkCode:string='1'):Boolean;
    Function InsertTB_EMPHISCardStop(aCardNo:string):Boolean;
    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;
    Function UpdateTB_CARD_Change(aOldCardNo,aNewCardNo:string):Boolean;
    Function UpdateTB_CARD_Field_StringValue(aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string;aDoorGrade:string='') : Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_DEVICECARDNO_Permit(aCardNO,aPermit:string):Boolean;
    Function UpdateTB_DEVICECARDNOExist(aCardNO,aPromiseGrade:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string;aWorkCode:string='1'):Boolean;
  end;

var
  dmDBFunction: TdmDBFunction;

implementation

uses
  uDBModule,
  uCommonVariable,
  uLomosUtil, uCommonSql;

{$R *.dfm}

{ TdmDBFunction }

function TdmDBFunction.CheckTB_CARD_CardNo(aCardNo: string;
  var aCardState: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where  CA_CARDNO = ''' + aCardNo + ''' ';

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
      result := 0;
      if recordCount < 1 then Exit;
      result := 1;
      aCardState := FindField('CA_CARDTYPE').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARD_Employee(aCompanyCode, aEmCode,
  aCardNo: string; var aOldCardNo: string; bRegCard: Boolean): boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if bRegCard then stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드 중에서

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
      if recordcount = 0 then Exit;
      While Not Eof do
      begin
        if FindField('CA_CARDNO').AsString <> aCardNo then
        begin
          aOldCardNo := FindField('CA_CARDNO').AsString;
          result := True;
          Exit;
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

function TdmDBFunction.CheckTB_EMPLOYEE(aCompanyCode, aEmCode: string;
  var aFdmsID: integer; var aWorkCode, aEndDate: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmDBModule.DBConnected := False;
        Exit;
      End;
      if recordCount < 1 then Exit;
      aFdmsID := FindField('FDMS_ID').AsInteger;
      aWorkCode := FindField('WG_CODE').AsString;
      aEndDate := FindField('EM_RETIREDATE').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_EMPLOYEE_CoEmCode(aCompanyCode,
  aEmCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      result := 0;
      if recordCount < 1 then Exit;
      result := 1;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_EMPLOYEE_EmCode(aEmCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  EM_CODE = ''' + aEmCode + ''' ';

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
      result := 0;
      if recordCount < 1 then Exit;
      result := 1;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CopyGradeOldCard(aOldCardNO,
  aNewCardNO: string): Boolean;
var
  stSql : string;
begin
  if Trim(aNewCardNO) = '' then Exit;
    stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' CA_CARDNO, ';
    stSql := stSql + ' DE_DOOR1, ';
    stSql := stSql + ' DE_DOOR2, ';
    stSql := stSql + ' DE_USEACCESS, ';
    stSql := stSql + ' DE_USEALARM, ';
    stSql := stSql + ' DE_TIMECODE, ';
    stSql := stSql + ' DE_PERMIT, ';
    stSql := stSql + ' DE_RCVACK, ';
    stSql := stSql + ' DE_UPDATETIME, ';
    stSql := stSql + ' DE_UPDATEOPERATOR) ';
    stSql := stSql + ' select ''' + GROUPCODE + ''', ';
    stSql := stSql + ' b.AC_NODENO, ';
    stSql := stSql + ' b.AC_ECUID, ';
    stSql := stSql + ' ''' + aNewCardNO + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCardNO + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';

    result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DeleteTB_CARD_Key(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DeleteTB_DEVICECARDNOCardNo(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.DeleteTB_EMPLOYEE_Key(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Delete From TB_EMPLOYEE';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE =''' + aEmCode + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.InsertIntoTB_CARD_Value(aCardNo, aCardGubun,
  aCardType, aEmpID, aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;  

  Result := False;
  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' +  GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''SYSTEM'')' ;

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.InsertIntoTB_DEVICECARDNONotExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
  stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
  stSql := stSql + ' AC_NODENO, ';
  stSql := stSql + ' AC_ECUID, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' DE_DOOR1, ';
  stSql := stSql + ' DE_DOOR2, ';
  stSql := stSql + ' DE_USEACCESS, ';
  stSql := stSql + ' DE_USEALARM, ';
  stSql := stSql + ' DE_TIMECODE, ';
  stSql := stSql + ' DE_PERMIT, ';
  stSql := stSql + ' DE_RCVACK, ';
  stSql := stSql + ' DE_UPDATETIME, ';
  stSql := stSql + ' DE_UPDATEOPERATOR) ';
  stSql := stSql + ' select ''' + GROUPCODE + ''', ';
  stSql := stSql + ' b.AC_NODENO, ';
  stSql := stSql + ' b.AC_ECUID, ';
  stSql := stSql + ' ''' + aCardNO + ''', ';
  stSql := stSql + ' b.DE_DOOR1, ';
  stSql := stSql + ' b.DE_DOOR2, ';
  stSql := stSql + ' b.DE_USEACCESS, ';
  stSql := stSql + ' b.DE_USEALARM, ';
  stSql := stSql + ' b.DE_TIMECODE, ';
  stSql := stSql + ' b.DE_PERMIT, ';
  stSql := stSql + ' ''N'', ';
  stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' ''RelaySYS'' ';
  stSql := stSql + ' From TB_DEVICECARDNOGROUP B  ';
  stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND B.CA_GROUP = ''' + aPromiseGrade + ''' ';
  stSql := stSql + ' AND NOT EXISTS ';
  stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
  stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''')  ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, afdmsID,
  aMode, aCardNo, aCardType, aEmName, aHandPhone, aCompanyName, aJijumName,
  aDepartName, aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPHIS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  if afdmsID <> '' then
    stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' MODE, ';
  stSql := stSql + ' SEND_STATUS, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' CA_CARDTYPE, ';
  stSql := stSql + ' SEND_STATUS2,';
  stSql := stSql + ' EH_INSERTTIME, ';
  stSql := stSql + ' EM_NAME, ';
  stSql := stSql + ' EM_HANDPHONE, ';
  stSql := stSql + ' COMPANY_NAME, ';
  stSql := stSql + ' JIJUM_NAME, ';
  stSql := stSql + ' DEPART_NAME, ';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  if afdmsID <> '' then
    stSql := stSql + afdmsID + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun,
  aCardNo, aEmpImg, afdmsId, aEmTypeCode, aWorkCode: string): Boolean;
var
  stSql : string;
begin
  if aPosiCode = '' then aPosiCode := '000';
  if aEmTypeCode = '' then aEmTypeCode := '001';

  stSql := 'Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  if aWorkCode <> '' then stSql := stSql + 'WG_CODE,';
  stSql := stSql + 'RG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '' + afdmsId + ',';
  if aWorkCode <> '' then stSql := stSql + '' + aWorkCode + ',';
  stSql := stSql + '''' + aEmTypeCode + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode, aEmCode,
  aCardNo, aFormName, aWorkType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEECHANGE(';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' EC_CLIENTIP, ';
  stSql := stSql + ' EC_OPERATOR, ';
  stSql := stSql + ' EC_INSERTTIME, ';
  stSql := stSql + ' EC_FORMNAME, ';
  stSql := stSql + ' EC_WORKTYPE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + Get_Local_IPAddr + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aFormName + ''', ';
  stSql := stSql + '''' + aWorkType + ''') ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_EMPLOYEE_Value(aEmpID, aEmpNM,
  aCompanyCode, aJijumCode, aDepartCode, aPosiCod, aCompanyPhone,
  aJoinDate, aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone,
  afdmsId, aEmTypeCode, aTimeCodeUse,
  aTimeCodeGroup, aTime1, aTime2, aTime3, aTime4, aTimeWeek, aMaster,
  aWorkCode: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
  stMode : string;
  stImg : string;
begin
  Result := False;

  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'FDMS_RELAY,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR, ';
  stSql := stSql + 'RG_CODE,';
  stSql := stSql + 'DE_TIMECODEUSE,';
  stSql := stSql + 'TC_GROUP,';
  stSql := stSql + 'TC_TIME1,';
  stSql := stSql + 'TC_TIME2,';
  stSql := stSql + 'TC_TIME3,';
  stSql := stSql + 'TC_TIME4,';
  stSql := stSql + 'TC_WEEKCODE,';
  stSql := stSql + 'EM_MASTER,';
  stSql := stSql + 'WG_CODE)';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCod + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + afdmsID + ',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''', ';
  stSql := stSql + '''' + aEmTypeCode + ''',';
  stSql := stSql + '''' + aTimeCodeUse + ''',';
  stSql := stSql + '''' + aTimeCodeGroup + ''',';
  stSql := stSql + '''' + aTime1 + ''',';
  stSql := stSql + '''' + aTime2 + ''',';
  stSql := stSql + '''' + aTime3 + ''',';
  stSql := stSql + '''' + aTime4 + ''',';
  stSql := stSql + '''' + aTimeWeek + ''', ';
  stSql := stSql + '''' + aMaster + ''',  ';
  stSql := stSql + '' + aWorkCode + ' ) ';

  bResult := dmDBModule.ProcessExecSQL(stSql);
  if Not bResult then Exit;

  InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1','','1',aEmpNM,aHandphone,'','','','');//입력

  InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,'','EmpConv','1');
  result := True;
end;

function TdmDBFunction.InsertTB_EMPHISCardStop(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
  stEmpID : string;
  stfdmsID : string;
  stCardType : string;
  stEmpNM : string;
  stHandphone : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
begin
  if G_stDBType = 'MSSQL' then stSql := MSSQL.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'FB' then stSql := FireBird.SelectTB_CARDJoinTBEmployee
  else Exit;
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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
      if RecordCount = 0 then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').asstring;
      stEmpID := FindField('EM_CODE').asstring;
      stfdmsID := FindField('FDMS_ID').asstring;
      stCardType := FindField('CA_CARDTYPE').asstring;
      stEmpNM := FindField('EM_NAME').asstring;
      stHandphone := FindField('EM_HANDPHONE').asstring;
      stCompanyName := FindField('COMPANYNAME').asstring;
      stJijumName := FindField('JIJUMNAME').asstring;
      stDepartName := FindField('DEPARTNAME').asstring;
      stPosiName := FindField('PO_NAME').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmpID,stfdmsID,'2',aCardNo,stCardType,
           stEmpNM,stHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//입력
  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode, aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  if aDoorGrade <> '' then stSql := stSql + 'CA_DOORGRADE = ''' + aDoorGrade + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_CARDDOORGRADE(aCardNo,
  aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set CA_DOORGRADE = ''' + aDoorGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_CARD_Change(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  if aNewCardNo = '' then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
  bResult := UpdateTB_DEVICECARDNO_permit(aOldCardNo,'N'); //모든 카드 권한을 삭제 처리함

  InsertTB_EMPHISCardStop(aOldCardNo);    //
  //if Not bResult then Exit;

  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_CARD_Field_StringValue(aCardNo, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  if Length(aCardNo) = 0 then Exit;
  stSql := 'Update TB_CARD SET ' + aFieldName + '=''' + aData + ''' ' ;
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aCardNo + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNOExist(aCardNO,
  aPromiseGrade: string): Boolean;
var
  stSql : string;
begin
    stSql := ' Update A ';
    stSql := stSql + ' Set a.DE_DOOR1 = b.DE_DOOR1, ';
    stSql := stSql + '     a.DE_DOOR2 = b.DE_DOOR2, ';
    stSql := stSql + '     a.DE_USEACCESS = b.DE_USEACCESS, ';
    stSql := stSql + '     a.DE_USEALARM = b.DE_USEALARM, ';
    stSql := stSql + '     a.DE_TIMECODE = b.DE_TIMECODE, ';
    stSql := stSql + '     a.DE_PERMIT = b.DE_PERMIT, ';
    stSql := stSql + '     a.DE_RCVACK = ''N'', ';
    stSql := stSql + '     a.DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + '     a.DE_UPDATEOPERATOR = ''RelaySYS'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_DEVICECARDNOGROUP B ';
    stSql := stSql + ' WHERE A.GROUP_CODE = B.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = B.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = B.AC_ECUID ';
    stSql := stSql + ' AND (a.DE_DOOR1 <> B.DE_DOOR1 OR a.DE_DOOR2 <> B.DE_DOOR2 OR a.DE_USEACCESS <> B.DE_USEACCESS OR a.DE_USEALARM <> b.DE_USEALARM OR a.DE_PERMIT <> b.DE_PERMIT) ';
    stSql := stSql + ' AND B.CA_GROUP = ''' + aPromiseGrade + ''' ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aCardNO + ''' ';
    stSql := stSql + ' AND A.GROUP_CODE = ''' + GROUPCODE + ''' ';

    Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNO_Permit(aCardNO,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun,
  aCardNo, aEmpImg, afdmsId, aEmTypeCode, aWorkCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_JIJUMCODE =''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  if aPosiCode <> '' then stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  if aCompanyPhone <> '' then stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''' ';
  if aEmTypeCode <> '' then stSql := stSql + ',RG_CODE = ''' + aEmTypeCode + ''' ';
  if aWorkCode <> '' then stSql := stSql + ',WG_CODE = ' + aWorkCode + ' ';
//  if aHandphone <> '' then stSql := stSql + ',EM_HANDPHONE = ' + aHandphone + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
