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
    Function checkTB_CARD_EmNum_Cnt(aEmcode: string):integer;
    Function CheckTB_CARD_Employee(aCompanyCode,aEmCode,aCardNo:string;var aOldCardNo:string;bRegCard:Boolean=True):integer;
    Function CheckTB_CARD_EmployeeGubun(aCompanyCode,aEmCode,aCardNo,aCardGubun:string;var aOldCardNo:string;bRegCard:Boolean=True):integer;
    Function CheckTB_CARD_Employee_STICK(aCompanyCode,aEmCode:string):integer;
    Function CheckTB_COMPANY_Gubun(aCompanyCode,aJijumCode,aDepartCode,aGubun:string):integer;
    Function CheckTB_CONFIG(aGroup,aCode:string):Boolean;
    Function CheckTB_DEVICECARDNO_CardPermit(aCardNo:string):Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string; var aFdmsID:integer;var aWorkCode:string;var aEndDate:string):Boolean;
    Function CheckTB_EMPLOYEE_CoEmCode(aCompanyCode,aEmCode:string):integer;
    Function CheckTB_EMPLOYEE_EmCode(aEmCode:string):integer;
    Function CheckTB_EMPLOYEE_EmPosiCode(aEmCode,aPosiCode:string):integer;
    Function CheckTB_HonikMappingDepart(aLEVEL1,aLEVEL2:string;var aName:string) : integer;
    Function CheckTB_HonikMappingJijum(aLEVEL1:string;var aName:string) : integer;
    Function CheckTB_HonikMappingPosi(aGUBUN:string;var aName:string) : integer;
    Function CheckTB_POSI(aCompanyCode,aPosiCode:string):integer;
    Function CheckTB_POSIJIJUMMapping(aCode:string):integer;
    Function CheckTB_HonikTempTable2(aCAMPUS,aKEY:string;var aMode,aChange,alevel1,alevel2,agubun,aname,acnt:string):integer;
    Function CheckTB_HonikTempTable2Seoul(aCAMPUS,aKEY:string;var aMode,aChange,alevel1,alevel2,agubun,aname,acnt,aStatus,aCardType,aCardStop:string ):integer;
    Function CopyGradeOldCard(aOldCardNO,aNewCardNO:string):Boolean;
    Function DeleteHongikTempTable(aCampus:string):Boolean;
    Function DeleteTB_CARD_EmployeeCardGubun(aCompanyCode,aEmCode,aCardGubun:string):Boolean;
    Function DeleteTB_CARD_Key(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
    Function DeleteTB_EMPLOYEE_Key(aCompanyCode,aEmCode:string;aFdmsID:integer=0):Boolean;
    Function DeleteTB_EMPLOYEE_CardNo(aEmCode,aCardNo:string;aDupCard:integer=0):Boolean;
    Function DeleteTB_HURELAY_Key(aHRSEQ:string):Boolean;



    Function InsertIntoTB_CARD_Value(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function InsertIntoTB_CONFIG(aGroup,aCode,aValue:string):Boolean;
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
    Function InsertIntoTB_HonikMappingDepart(aLEVEL1,aLEVEL2,aCompanyCode,aJijumCode,aDepartCode,aLEVEL2_NAME,aChange:string):Boolean;
    Function InsertIntoTB_HonikMappingJijum(aLEVEL1,aCompanyCode,aJijumCode,aLEVEL1_NAME,aChange:string):Boolean;
    Function InsertIntoTB_HonikMappingPosi(aGUBUN,aCompanyCode,aPosiCode,aGUBUN_NAME,aChange:string):Boolean;
    Function InsertIntoTB_HonikTempTable(aCAMPUS,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aNAME,aKEY,aCARD_CNT:string):Boolean;
    Function InsertIntoTB_HonikTempTableSeoul(aCAMPUS,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aNAME,aKEY,aStatus,aUpdt:string):Boolean;
    Function InsertIntoTB_HonikMCardTempTable(aKEY,aCARDTYPE,aCARDCNT,aCARDSTOP,aUPDT,aK_CARD_CNT,aM_CARD_GUBUN:string):Boolean;
    Function InsertIntoTB_HonikTempTable2(aCAMPUS,aKEY,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aNAME,aCARD_CNT,aCurChange,aCurMode:string):Boolean;
    Function InsertIntoTB_HonikTempTable2Seoul(aCAMPUS,aKEY,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aNAME,aCARD_CNT,aSTATUS,aCARDTYPE,aCARDSTOP,aCurChange,aCurMode:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertIntoTB_RELAYGUBUN(aRgCode,aCampusName:string):Boolean;
    Function InsertIntoTB_WORKGUBUN(aCode,aType,aName:string):Boolean;
    Function InsertTB_EMPHISCardStop(aCardNo:string):Boolean;
    Function InsertIntoTB_POSIJIJUMMapping(aCode,aName:string):Boolean;



    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;
    Function UpdateTB_CARD_Change(aOldCardNo,aNewCardNo:string;aDeleteCard:Boolean=True):Boolean;
    Function UpdateTB_CARD_Field_StringValue(aCardNo,aFieldName,aData:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string;aDoorGrade:string='') : Boolean;
    Function UpdateTB_CARD_NewCard(aCardNo:string):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_COMPANY_Gubun_Field_StringValue(aCompanyCode,aJijumCode,aDepartCode,aGubun,aFieldName,aData:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeCardStop(aEmCode:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode:string):Boolean;
    Function UpdateTB_DEVICECARDNO_Permit(aCardNO,aPermit:string):Boolean;
    Function UpdateTB_DEVICECARDNOExist(aCardNO,aPromiseGrade:string):Boolean;
    Function UpdateTB_DEVICECARDNORcvAck(aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string;aWorkCode:string='1'):Boolean;
    Function UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate:string):Boolean;
    Function UpdateTB_HonikMappingDepart(aLEVEL1,aLEVEL2,aLEVEL2_NAME,aChange:string):Boolean;
    Function UpdateTB_HonikMappingDepart_Field_StringValue(aLEVEL1,aLEVEL2,aFieldName,aData:string):Boolean;
    Function UpdateTB_HonikMappingJijum(aLEVEL1,aLEVEL1_NAME,aChange:string):Boolean;
    Function UpdateTB_HonikMappingJijum_Field_StringValue(aLEVEL1,aFieldName,aData:string):Boolean;
    Function UpdateTB_HonikMappingPosi(aGUBUN,aGUBUN_NAME,aChange:string):Boolean;
    Function UpdateTB_HonikMappingPosi_Field_StringValue(aGUBUN,aFieldName,aData:string):Boolean;
    Function UpdateTB_HonikTempTable2(aCAMPUS,aKEY,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aNAME,aCARD_CNT,aCurChange,aCurMode:string):Boolean;
    Function UpdateTB_HonikTempTable2Seoul(aCAMPUS,aKEY,aLEVEL1,aLEVEL1_NAME,aLEVEL2,aLEVEL2_NAME,aGUBUN,aGUBUN_NAME,aGUBUN_CHANGE,aNAME,aCARD_CNT,aSTATUS,aCARDTYPE,aCARDSTOP,aCurChange,aCurMode:string):Boolean;
    Function UpdateTB_HonikTempTable2_Field_StringValue(aCAMPUS,aKEY,aFieldName,aData:string):Boolean;
    Function UpdateTB_Posi_Field_StringValue(aCompanyCode,aPosiCode,aFieldName,aData:string):Boolean;
    Function UpdateTB_POSIJIJUMMapping(aCode, aName:string):Boolean;
  end;

var
  dmDBFunction: TdmDBFunction;

implementation

uses
  uDBModule,
  uCommonVariable,
  uLomosUtil, uCommonSql, uCommon;

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

function TdmDBFunction.checkTB_CARD_EmNum_Cnt(aEmcode: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := 0;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드 중에서

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
      result := recordcount;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARD_Employee(aCompanyCode, aEmCode,
  aCardNo: string; var aOldCardNo: string; bRegCard: Boolean): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
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
        if FindField('CA_CARDNO').AsString = aCardNo then Result := 0
        else
        begin
          aOldCardNo := FindField('CA_CARDNO').AsString;
          result := 1;
        end;
        Exit;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARD_EmployeeGubun(aCompanyCode, aEmCode,
  aCardNo, aCardGubun: string; var aOldCardNo: string;
  bRegCard: Boolean=True): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' and CA_GUBUN = ''' + aCardGubun + ''' ';
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
        if FindField('CA_CARDNO').AsString = aCardNo then Result := 0
        else
        begin
          aOldCardNo := FindField('CA_CARDNO').AsString;
          result := 1;
        end;
        Exit;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_CARD_Employee_STICK(aCompanyCode,
  aEmCode: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CA_STICK = ''Y'' ';


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

function TdmDBFunction.CheckTB_COMPANY_Gubun(aCompanyCode, aJijumCode,
  aDepartCode, aGubun: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''' + aGubun + ''' ';
  if (aGubun = '2') or (aGubun = '3') then stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  if (aGubun = '3') then stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';


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

function TdmDBFunction.CheckTB_CONFIG(aGroup, aCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';

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
      if recordCount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_DEVICECARDNO_CardPermit(
  aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ';

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
      result := True;
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

function TdmDBFunction.CheckTB_EMPLOYEE_EmPosiCode(aEmCode,
  aPosiCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where  EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND  PO_POSICODE = ''' + aPosiCode + ''' ';

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

function TdmDBFunction.CheckTB_HonikMappingDepart(aLEVEL1, aLEVEL2: string;
  var aName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HonikMappingDepart  where K_LEVEL1 = ''' + aLEVEL1 + ''' and K_LEVEL2 = ''' + aLEVEL2 + '''';

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
      if recordcount < 1 then Exit;
      aName := FindField('K_LEVEL2_NAME').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_HonikMappingJijum(aLEVEL1: string;
  var aName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HonikMappingJijum  where K_LEVEL1 = ''' + aLEVEL1 + ''' ';

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
      if recordcount < 1 then Exit;
      aName := FindField('K_LEVEL1_NAME').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_HonikMappingPosi(aGUBUN: string;
  var aName: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HonikMappingPosi  where K_GUBUN = ''' + aGUBUN + ''' ';

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
      if recordcount < 1 then Exit;
      aName := FindField('K_GUBUN_NAME').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_HonikTempTable2(aCAMPUS, aKEY: string;
  var aMode, aChange, alevel1, alevel2, agubun, aname,
  acnt: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HonikTempTable2  where K_CAMPUS = ' + aCAMPUS + ' and K_KEY = ''' + aKEY + ''' ';

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
      if recordcount < 1 then Exit;
      aMode := FindField('K_STATE').AsString;
      aChange := FindField('K_CHANGE').AsString;
      alevel1 := FindField('K_LEVEL1').AsString;
      alevel2:= FindField('K_LEVEL2').AsString;
      agubun:= FindField('K_GUBUN').AsString;
      aname:= FindField('K_NAME').AsString;
      acnt:= FindField('K_CARD_CNT').AsString;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_HonikTempTable2Seoul(aCAMPUS, aKEY: string;
  var aMode, aChange, alevel1, alevel2, agubun, aname, acnt, aStatus,
  aCardType, aCardStop: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_HonikTempTable2  where K_CAMPUS = ' + aCAMPUS + ' and K_KEY = ''' + aKEY + ''' ';

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
      if recordcount < 1 then Exit;
      aMode := Trim(FindField('K_STATE').AsString);
      aChange := Trim(FindField('K_CHANGE').AsString);
      alevel1 := Trim(FindField('K_LEVEL1').AsString);
      alevel2:= Trim(FindField('K_LEVEL2').AsString);
      agubun:= Trim(FindField('K_GUBUN').AsString);
      aname:= Trim(FindField('K_NAME').AsString);
      acnt:= Trim(FindField('K_CARD_CNT').AsString);
      aStatus := Trim(FindField('K_STATUS').AsString);
      aCardType := Trim(FindField('M_CARDTYPE').AsString);
      aCardStop := Trim(FindField('M_CARDSTOP').AsString);
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmDBFunction.CheckTB_POSI(aCompanyCode,
  aPosiCode: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';


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

function TdmDBFunction.CheckTB_POSIJIJUMMapping(aCode: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_POSIJIJUMMapping ';
  stSql := stSql + ' where PG_CODE = ''' + aCode + ''' ';


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

function TdmDBFunction.DeleteHongikTempTable(aCampus:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_HonikTempTable ';
  result := dmDBModule.ProcessExecSQL(stSql);


  if(aCampus='1') then   //홍익대 서울이면 
  begin
    stSql := ' Delete From TB_HonikMCardTempTable ';
    result := dmDBModule.ProcessExecSQL(stSql);
  end;

end;

function TdmDBFunction.DeleteTB_CARD_EmployeeCardGubun(aCompanyCode,
  aEmCode, aCardGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  //카드 권한 삭제
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' FROM TB_CARD a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND a.EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND a.CA_GUBUN = ''' + aCardGubun + ''' ';
  stSql := stSql + ' AND TB_DEVICECARDNO.CA_CARDNO = a.CA_CARDNO ';

  Result := dmDBModule.ProcessExecSQL(stSql);


  //카드 정지 
  stSql := 'Update TB_CARD Set ';
  stSql := stSql + ' CA_CARDTYPE = ''2'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CA_GUBUN = ''' + aCardGubun + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
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

function TdmDBFunction.DeleteTB_EMPLOYEE_CardNo(aEmCode,
  aCardNo: string;aDupCard:integer=0): Boolean;
var
  stSql : string;
begin
//  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' where CA_CARDNO = ''' + aCardNo + ''' ';
//  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' FROM TB_DEVICECARDNO A JOIN TB_CARD B ON A.CA_CARDNO = B.CA_CARDNO where B.EM_CODE = ''' + aEmCode + '''  ';
  result := dmDBModule.ProcessExecSQL(stSql);

  if aDupCard = 0 then
  begin
    stSql := ' Delete From TB_CARD where EM_CODE = ''' + aEmCode + ''' ';
    result := dmDBModule.ProcessExecSQL(stSql);

    stSql := ' Delete From TB_EMPLOYEE where EM_CODE = ''' + aEmCode + ''' ';
    result := dmDBModule.ProcessExecSQL(stSql);
  end else
  begin
    //카드 여러장 사용이면 카드번호로 카드만 삭제 후 카드 건수가 0 일때만 삭제 하자.
    stSql := ' Delete From TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
    result := dmDBModule.ProcessExecSQL(stSql);

    if checkTB_CARD_EmNum_Cnt(aEmCode) = 0 then
    begin
      stSql := ' Delete From TB_EMPLOYEE where EM_CODE = ''' + aEmCode + ''' ';
      result := dmDBModule.ProcessExecSQL(stSql);
    end;
  end;

end;

function TdmDBFunction.DeleteTB_EMPLOYEE_Key(aCompanyCode,
  aEmCode: string;aFdmsID:integer=0): Boolean;
var
  stSql : string;
begin

  stSql := 'Delete From TB_EMPLOYEE';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE =''' + aEmCode + ''' ';

  Result := dmDBModule.ProcessExecSQL(stSql);
  InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(aFdmsID),'3','','1',aEmCode,'','','','','');//삭제

end;

function TdmDBFunction.DeleteTB_HURELAY_Key(aHRSEQ: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_HURELAY';
  stSql := stSql + ' Where HR_SEQ = ' + aHRSEQ + ' ';

  Result := dmDBModule.ProcessExecSQL(stSql);

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

  nPositionNum := dmCommon.GetMaxPositionNum;  

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

function TdmDBFunction.InsertIntoTB_COMPANY(aCompanyCode, aJijumCode,
  aDepartCode, aGubun, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGubun + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_CONFIG(aGroup, aCode,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGroup + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aValue + ''')';

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

function TdmDBFunction.InsertIntoTB_HonikMappingDepart(aLEVEL1, aLEVEL2,
  aCompanyCode, aJijumCode, aDepartCode, aLEVEL2_NAME,
  aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikMappingDepart ( ';
  stSql := stSql + '  K_LEVEL1 ,';
  stSql := stSql + '  K_LEVEL2 ,';
  stSql := stSql + '  CO_COMPANYCODE ,';
  stSql := stSql + '  CO_JIJUMCODE ,';
  stSql := stSql + '  CO_DEPARTCODE ,';
  stSql := stSql + '  K_LEVEL2_NAME ,';
  stSql := stSql + '  K_CHANGE ,';
  stSql := stSql + '  K_CHANGEDATE ';               //구분
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aLEVEL1 + ''',';
  stSql := stSql + '''' + aLEVEL2 + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aLEVEL2_NAME + ''',';
  stSql := stSql + '''' + aChange + ''',';
  stSql := stSql + 'getdate())';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikMappingJijum(aLEVEL1,
  aCompanyCode, aJijumCode, aLEVEL1_NAME, aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikMappingJijum ( ';
  stSql := stSql + '  K_LEVEL1 ,';
  stSql := stSql + '  CO_COMPANYCODE ,';
  stSql := stSql + '  CO_JIJUMCODE ,';
  stSql := stSql + '  K_LEVEL1_NAME ,';
  stSql := stSql + '  K_CHANGE ,';
  stSql := stSql + '  K_CHANGEDATE ';               //구분
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aLEVEL1 + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aLEVEL1_NAME + ''',';
  stSql := stSql + '''' + aChange + ''',';
  stSql := stSql + 'getdate())';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikMappingPosi(aGUBUN, aCompanyCode,
  aPosiCode, aGUBUN_NAME, aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikMappingPosi ( ';
  stSql := stSql + '  K_GUBUN ,';
  stSql := stSql + '  CO_COMPANYCODE ,';
  stSql := stSql + '  PO_POSICODE ,';
  stSql := stSql + '  K_GUBUN_NAME ,';
  stSql := stSql + '  K_CHANGE ,';
  stSql := stSql + '  K_CHANGEDATE ';               //구분
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aGUBUN + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aGUBUN_NAME + ''',';
  stSql := stSql + '''' + aChange + ''',';
  stSql := stSql + 'getdate())';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikMCardTempTable(aKEY, aCARDTYPE,
  aCARDCNT, aCARDSTOP, aUPDT,aK_CARD_CNT,aM_CARD_GUBUN: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikMCardTempTable ( ';
  stSql := stSql + '  M_KEY ,';    //학생(학번), 교직원(종번)
  stSql := stSql + '  M_CARDTYPE ,';        //0:모바일신분증, 1:카드신분증
  stSql := stSql + '  M_CARDCNT ,';  //발급차수
  stSql := stSql + '  M_CARDSTOP ,';         //0:정상, 1:분실, 2:정지
  stSql := stSql + '  M_UPDT, ';  //트랜잭션시간
  stSql := stSql + '  K_CARD_CNT, ';  //실물카드 발급 차수
  stSql := stSql + '  M_CARD_GUBUN ';  //인증수단 구분(0.NFC,1.BLE)
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aKEY + ''',';
  stSql := stSql + '''' + aCARDTYPE + ''',';
  stSql := stSql + '''' + aCARDCNT + ''',';
  stSql := stSql + '''' + aCARDSTOP + ''',';
  stSql := stSql + '''' + aUPDT + ''',';
  stSql := stSql + '''' + aK_CARD_CNT + ''',';
  stSql := stSql + '''' + aM_CARD_GUBUN + ''')';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikTempTable(aCAMPUS, aLEVEL1,
  aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME, aNAME, aKEY,
  aCARD_CNT: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikTempTable ( ';
  stSql := stSql + '  K_CAMPUS ,';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_LEVEL1 ,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME ,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 ,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME ,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN ,';               //구분
  stSql := stSql + '  K_GUBUN_NAME , ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME ,';        //성명
  stSql := stSql + '  K_KEY ,';       //학번 ( 종번 )
  stSql := stSql + '  K_CARD_CNT ,';      //카드발급차수
  stSql := stSql + '  K_SEND ';      //연동 유무
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '' + aCAMPUS + ',';
  stSql := stSql + '''' + aLEVEL1 + ''',';
  stSql := stSql + '''' + aLEVEL1_NAME + ''',';
  stSql := stSql + '''' + aLEVEL2 + ''',';
  stSql := stSql + '''' + aLEVEL2_NAME + ''',';
  stSql := stSql + '''' + aGUBUN + ''',';
  stSql := stSql + '''' + aGUBUN_NAME + ''',';
  stSql := stSql + '''' + aNAME + ''',';
  stSql := stSql + '''' + aKEY + ''',';
  stSql := stSql + '''' + aCARD_CNT + ''',' ;
  stSql := stSql + '''N'')';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.InsertIntoTB_HonikTempTable2(aCAMPUS, aKEY, aLEVEL1,
  aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME, aNAME,
  aCARD_CNT, aCurChange, aCurMode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikTempTable2 ( ';
  stSql := stSql + '  K_CAMPUS,';        //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_KEY ,';        //학번 ( 종번 )
  stSql := stSql + '  K_LEVEL1 ,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME ,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 ,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME ,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN ,';               //구분
  stSql := stSql + '  K_GUBUN_NAME, ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME ,';        //성명
  stSql := stSql + '  K_CARD_CNT ,';      //카드발급차수
  stSql := stSql + '  K_STATE , ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + '  K_CHANGE, ';      //변경시 Y 미변경시 N
  stSql := stSql + '  K_RELAY, ';      //완료시 Y
  stSql := stSql + '  K_CHANGEDATE) ';
  stSql := stSql + ' Values(' + aCAMPUS + ',';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + ' ''' + aKEY + ''', ';       //학번 ( 종번 )
  stSql := stSql + ' ''' + aLEVEL1 + ''',';        //단과대코드( 소속 )
  stSql := stSql + ' ''' + aLEVEL1_NAME + ''',';  //단과대명칭( 소속명 )
  stSql := stSql + ' ''' + aLEVEL2 + ''',';         //학과코드 ( 소속2)
  stSql := stSql + ' ''' + aLEVEL2_NAME + ''',';  //학과명칭 (소속2명)
  stSql := stSql + ' ''' + aGUBUN + ''',';               //구분
  stSql := stSql + ' ''' + aGUBUN_NAME + ''', ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + ' ''' + aNAME + ''',';        //성명
  stSql := stSql + ' ''' + aCARD_CNT + ''',';      //카드발급차수
  stSql := stSql + ' ' + aCurMode  + ', ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + ' ''' + aCurChange + ''',';
  stSql := stSql + ' ''N'',';
  stSql := stSql + ' getDate())';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikTempTable2Seoul(aCAMPUS, aKEY,
  aLEVEL1, aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME, aNAME,
  aCARD_CNT, aSTATUS, aCARDTYPE, aCARDSTOP, aCurChange,
  aCurMode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_HonikTempTable2 ( ';
  stSql := stSql + '  K_CAMPUS,';        //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_KEY ,';        //학번 ( 종번 )
  stSql := stSql + '  K_LEVEL1 ,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME ,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 ,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME ,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN ,';               //구분
  stSql := stSql + '  K_GUBUN_NAME, ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME ,';        //성명
  stSql := stSql + '  K_CARD_CNT ,';      //카드발급차수
  stSql := stSql + '  K_STATE , ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + '  K_STATUS , ';      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
  stSql := stSql + '  M_CARDTYPE , ';      //0:모바일신분증, 1:BLE,2:카드신분증
  stSql := stSql + '  M_CARDSTOP , ';      //0:정상, 1:분실, 2:정지
  stSql := stSql + '  K_CHANGE, ';      //변경시 Y 미변경시 N
  stSql := stSql + '  K_RELAY, ';      //완료시 Y
  stSql := stSql + '  K_CHANGEDATE) ';
  stSql := stSql + ' Values(' + aCAMPUS + ',';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + ' ''' + Trim(aKEY) + ''', ';       //학번 ( 종번 )
  stSql := stSql + ' ''' + Trim(aLEVEL1) + ''',';        //단과대코드( 소속 )
  stSql := stSql + ' ''' + Trim(aLEVEL1_NAME) + ''',';  //단과대명칭( 소속명 )
  stSql := stSql + ' ''' + Trim(aLEVEL2) + ''',';         //학과코드 ( 소속2)
  stSql := stSql + ' ''' + Trim(aLEVEL2_NAME) + ''',';  //학과명칭 (소속2명)
  stSql := stSql + ' ''' + Trim(aGUBUN) + ''',';               //구분
  stSql := stSql + ' ''' + Trim(aGUBUN_NAME) + ''', ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + ' ''' + Trim(aNAME) + ''',';        //성명
  stSql := stSql + ' ''' + Trim(aCARD_CNT) + ''',';      //카드발급차수
  stSql := stSql + ' ' + aCurMode  + ', ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + ' ' + aSTATUS  + ', ';      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
  stSql := stSql + ' ''' + Trim(aCARDTYPE)  + ''', ';      //0:모바일신분증, 1:카드신분증
  stSql := stSql + ' ''' + Trim(aCARDSTOP)  + ''', ';      //0:정상, 1:분실, 2:정지
  stSql := stSql + ' ''' + Trim(aCurChange) + ''',';
  stSql := stSql + ' ''N'',';
  stSql := stSql + ' getDate())';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_HonikTempTableSeoul(aCAMPUS, aLEVEL1,
  aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME, aNAME, aKEY,
  aStatus, aUpdt: string): Boolean;
var
  stSql : string;
begin
  if Not isdigit(aStatus) then aStatus := '1';
  if Not isdigit(aUpdt) then aUpdt := formatdatetime('yyyymmdd',now);

  stSql := 'Insert Into TB_HonikTempTable ( ';
  stSql := stSql + '  K_CAMPUS ,';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + '  K_LEVEL1 ,';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME ,';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 ,';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME ,';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN ,';               //구분
  stSql := stSql + '  K_GUBUN_NAME , ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME ,';        //성명
  stSql := stSql + '  K_KEY ,';       //학번 ( 종번 )
  stSql := stSql + '  K_STATUS ,';      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
  stSql := stSql + '  K_UPDT ,';      //발령일 yyyymmdd
  stSql := stSql + '  K_SEND ';      //연동 유무
  stSql := stSql + ') ';
  stSql := stSql + ' Values(';
  stSql := stSql + '' + aCAMPUS + ',';
  stSql := stSql + '''' + aLEVEL1 + ''',';
  stSql := stSql + '''' + aLEVEL1_NAME + ''',';
  stSql := stSql + '''' + aLEVEL2 + ''',';
  stSql := stSql + '''' + aLEVEL2_NAME + ''',';
  stSql := stSql + '''' + aGUBUN + ''',';
  stSql := stSql + '''' + aGUBUN_NAME + ''',';
  stSql := stSql + '''' + aNAME + ''',';
  stSql := stSql + '''' + aKEY + ''',';
  stSql := stSql + '' + aStatus + ',' ;
  stSql := stSql + '' + aUpdt + ',' ;
  stSql := stSql + '''N'')';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_POSI(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_POSI(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_POSIJIJUMMapping(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_POSIJIJUMMapping(';
  stSql := stSql + ' PG_CODE,';
  stSql := stSql + ' PG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_RELAYGUBUN(aRgCode,
  aCampusName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYGUBUN(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RG_CODE,';
  stSql := stSql + ' RG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aRgCode + ''',';
  stSql := stSql + '''' + aCampusName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.InsertIntoTB_WORKGUBUN(aCode, aType,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_WORKGUBUN(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' WG_CODE,';
  stSql := stSql + ' WG_TYPE,';
  stSql := stSql + ' WG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aType + ''',';
  stSql := stSql + '''' + aName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
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
  if(aCardGubun<>'') then stSql := stSql + 'CA_GUBUN = ''' + aCardGubun + ''',';
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
  aNewCardNo: string;aDeleteCard:Boolean=True): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  if aNewCardNo = '' then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo

  if Not aDeleteCard then Exit; //기존카드 삭제가 아니라면 빠져 나간다.

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

function TdmDBFunction.UpdateTB_CARD_NewCard(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set CA_DOORGRADE = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_COMPANY_Gubun_Field_StringValue(
  aCompanyCode, aJijumCode, aDepartCode, aGubun, aFieldName,
  aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_COMPANY ';
  stSql := stSql + ' Set ' + aFieldName + ' = ''' + aData + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''' + aGubun + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
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

function TdmDBFunction.UpdateTB_DEVICECARDNORcvAck(aCardNo,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNO_EmCodeCardStop(
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  if G_stDBType = 'PG' then
  begin
    stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'',DE_PERMIT=''N'' ';
    stSql := stSql + ' where TB_DEVICECARDNO.CA_CARDNO IN ( ';
    stSql := stSql + ' Select CA_CARDNO from TB_CARD ';
    stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''') '
  end else
  begin
    stSql := ' Update A set A.DE_RCVACK = ''N'',A.DE_PERMIT=''N'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
    stSql := stSql + ' WHERE A.CA_CARDNO = B.CA_CARDNO ';
    stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';
  end;
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_DEVICECARDNO_EmCodeReSend(
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  if G_stDBType = 'PG' then
  begin
    stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'' ';
    stSql := stSql + ' where TB_DEVICECARDNO.CA_CARDNO IN ( ';
    stSql := stSql + ' Select CA_CARDNO from TB_CARD ';
    stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''') '
  end else
  begin
    stSql := ' Update A set A.DE_RCVACK = ''N'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
    stSql := stSql + ' WHERE A.CA_CARDNO = B.CA_CARDNO ';
    stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';
  end;
  result := dmDBModule.ProcessExecSQL(stSql);

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
  if aAddr1 <> '' then stSql := stSql + ',EM_ADDR1 = ''' + aAddr1 + ''' ';
  if aAddr2 <> '' then stSql := stSql + ',EM_ADDR2 = ''' + aAddr2 + ''' ';
//  if aHandphone <> '' then stSql := stSql + ',EM_HANDPHONE = ' + aHandphone + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,
  aDelDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set EM_RETIREDATE = ''' + aDelDate + ''' ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikMappingDepart(aLEVEL1, aLEVEL2,
  aLEVEL2_NAME, aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingDepart set ';
  stSql := stSql + '  K_LEVEL2_NAME =''' + aLEVEL2_NAME + ''',';
  stSql := stSql + '  K_CHANGE =''' + aChange + ''', ';      //변경시 Y 미변경시 N
  stSql := stSql + '  K_CHANGEDATE = getdate() ';
  stSql := stSql + ' where K_LEVEL1 = ''' + aLEVEL1 + ''' ';       //단과대코드( 소속 )
  stSql := stSql + ' AND K_LEVEL2 = ''' + aLEVEL2 + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_HonikMappingDepart_Field_StringValue(
  aLEVEL1, aLEVEL2, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingDepart set ';
  stSql := stSql + aFieldName + '=''' + aData + ''' ';
  stSql := stSql + ' where K_LEVEL1 = ''' + aLEVEL1 + ''' ';       //단과대코드( 소속 )
  stSql := stSql + ' AND K_LEVEL2 = ''' + aLEVEL2 + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikMappingJijum(aLEVEL1, aLEVEL1_NAME,
  aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingJijum set ';
  stSql := stSql + '  K_LEVEL1_NAME =''' + aLEVEL1_NAME + ''',';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_CHANGE =''' + aChange + ''', ';      //변경시 Y 미변경시 N
  stSql := stSql + '  K_CHANGEDATE = getdate() ';
  stSql := stSql + ' where K_LEVEL1 = ''' + aLEVEL1 + ''' ';       //단과대코드( 소속 )

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikMappingJijum_Field_StringValue(
  aLEVEL1, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingJijum set ';
  stSql := stSql + aFieldName + '=''' + aData + ''' ';
  stSql := stSql + ' where K_LEVEL1 = ''' + aLEVEL1 + ''' ';       

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikMappingPosi(aGUBUN, aGUBUN_NAME,
  aChange: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingPosi set ';
  stSql := stSql + '  K_GUBUN_NAME =''' + aGUBUN_NAME + ''',';
  stSql := stSql + '  K_CHANGE =''' + aChange + ''', ';      //변경시 Y 미변경시 N
  stSql := stSql + '  K_CHANGEDATE = getdate() ';
  stSql := stSql + ' where K_GUBUN = ''' + aGUBUN + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikMappingPosi_Field_StringValue(aGUBUN,
  aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikMappingPosi set ';
  stSql := stSql + aFieldName + ' =''' + aData + ''' ';
  stSql := stSql + ' where K_GUBUN = ''' + aGUBUN + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TdmDBFunction.UpdateTB_HonikTempTable2(aCAMPUS, aKEY, aLEVEL1,
  aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME, aNAME,
  aCARD_CNT, aCurChange, aCurMode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikTempTable2 set ';
  stSql := stSql + '  K_LEVEL1 = ''' + aLEVEL1 + ''',';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME =''' + aLEVEL1_NAME + ''',';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 = ''' + aLEVEL2 + ''',';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME = ''' + aLEVEL2_NAME + ''',';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN = ''' + aGUBUN + ''',';               //구분
  stSql := stSql + '  K_GUBUN_NAME = ''' + aGUBUN_NAME + ''', ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_NAME = ''' + aNAME + ''',';        //성명
  stSql := stSql + '  K_CARD_CNT =''' + aCARD_CNT + ''',';      //카드발급차수
  stSql := stSql + '  K_STATE = ' + aCurMode  + ', ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + '  K_CHANGE =''' + aCurChange + ''' ';      //변경시 Y 미변경시 N
  if aCurChange = 'Y' then stSql := stSql + '  ,K_RELAY = ''N'' ';
  if aCurChange = 'Y' then stSql := stSql + '  ,K_CHANGEDATE = getdate() ';
  stSql := stSql + ' where K_CAMPUS  = ' + aCAMPUS + '';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + ' and K_KEY = ''' + aKEY + ''' ';       //학번 ( 종번 )

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikTempTable2Seoul(aCAMPUS, aKEY,
  aLEVEL1, aLEVEL1_NAME, aLEVEL2, aLEVEL2_NAME, aGUBUN, aGUBUN_NAME,aGUBUN_CHANGE, aNAME,
  aCARD_CNT, aSTATUS, aCARDTYPE, aCARDSTOP, aCurChange,
  aCurMode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikTempTable2 set ';
  stSql := stSql + '  K_LEVEL1 = ''' + Trim(aLEVEL1) + ''',';        //단과대코드( 소속 )
  stSql := stSql + '  K_LEVEL1_NAME =''' + Trim(aLEVEL1_NAME) + ''',';  //단과대명칭( 소속명 )
  stSql := stSql + '  K_LEVEL2 = ''' + Trim(aLEVEL2) + ''',';         //학과코드 ( 소속2)
  stSql := stSql + '  K_LEVEL2_NAME = ''' + Trim(aLEVEL2_NAME) + ''',';  //학과명칭 (소속2명)
  stSql := stSql + '  K_GUBUN = ''' + Trim(aGUBUN) + ''',';               //구분
  stSql := stSql + '  K_GUBUN_NAME = ''' + Trim(aGUBUN_NAME) + ''', ';   //구분명 ( 1:교수, 2:강사, 3:조교, 4: 대학원생, 5:학부생, 6:직원 )
  stSql := stSql + '  K_GUBUN_CHANGE = ''' + Trim(aGUBUN_CHANGE) + ''', ';   //구분변경유무
  stSql := stSql + '  K_NAME = ''' + Trim(aNAME) + ''',';        //성명
  stSql := stSql + '  K_CARD_CNT =''' + Trim(aCARD_CNT) + ''',';      //카드발급차수
  stSql := stSql + '  K_STATE = ' + aCurMode  + ', ';      //변경 모드 1.입력,2.수정,3.삭제
  stSql := stSql + '  K_STATUS =''' + Trim(aSTATUS) + ''', ';      //1:재학(재직), 2:휴학(휴직), 3:졸업(퇴직), 4:제적, 5:수료
  stSql := stSql + '  M_CARDTYPE =''' + Trim(aCARDTYPE) + ''', ';      //0:모바일신분증, 1:카드신분증
  stSql := stSql + '  M_CARDSTOP =''' + Trim(aCARDSTOP) + ''', ';      //0:정상, 1:분실, 2:정지
  stSql := stSql + '  K_CHANGE =''' + Trim(aCurChange) + ''' ';      //변경시 Y 미변경시 N
  if aCurChange = 'Y' then stSql := stSql + '  ,K_RELAY = ''N'' ';
  if aCurChange = 'Y' then stSql := stSql + '  ,K_CHANGEDATE = getdate() ';
  stSql := stSql + ' where K_CAMPUS  = ' + aCAMPUS + '';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + ' and K_KEY = ''' + aKEY + ''' ';       //학번 ( 종번 )

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_HonikTempTable2_Field_StringValue(aCAMPUS,
  aKEY, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_HonikTempTable2 set ';
  stSql := stSql + aFieldName + '=''' + aData + ''' ';
  stSql := stSql + ' where K_CAMPUS  = ' + aCAMPUS + '';    //캠퍼스 구분 1:서울 2:세종
  stSql := stSql + ' and K_KEY = ''' + aKEY + ''' ';       //학번 ( 종번 )

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_POSIJIJUMMapping(aCode,
  aName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_POSIJIJUMMapping set ';
  stSql := stSql + 'PG_NAME =''' + aName + ''' ';
  stSql := stSql + ' where PG_CODE = ''' + aCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDBFunction.UpdateTB_Posi_Field_StringValue(aCompanyCode,
  aPosiCode, aFieldName, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := 'update TB_POSI set ';
  stSql := stSql + aFieldName + '=''' + aData + ''' ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
