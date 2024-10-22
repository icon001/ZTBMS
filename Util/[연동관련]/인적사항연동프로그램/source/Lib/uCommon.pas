unit uCommon;

interface

uses
  SysUtils, Classes,ADODB,ActiveX;

type
  TdmCommon = class(TDataModule)
  public
    { Private declarations }
  public
    { Public declarations }
    Function CheckTB_CONFIG(aCONFIGGROUP,aCONFIGCODE : string):Boolean;

    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName:string; var aDepartCode:string);
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateRelayCode(aCampusName:string; var aRgCode:string);

    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetFdmsID:string;
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxPosiCode(aCompanyCode:string):integer;
    Function GetMaxPositionNum : integer;
    Function GetMaxRelayCode:integer;
    Function GetMappingType : string;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function GetRelayCode(aRelayName:string):string;

    Function LoadMappingCode(aMapType:string):Boolean;

    Function MakeCardNo( aProgramType,aIDNO,aSeq:string):string;
  end;

var
  dmCommon: TdmCommon;
  MappingCode1List : TStringList;
  MappingCode2List : TStringList;
  PatientList : TStringList;
  EmergencyList : TStringList;
  SendServerList : TStringList;
  
implementation

uses
uDBModule,
uDBFunction,
uLomosUtil;

{$R *.dfm}

{ TdmCommon }

function TdmCommon.CheckTB_CONFIG(aCONFIGGROUP,
  aCONFIGCODE: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

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

procedure TdmCommon.CreateDepartCode(aCompanyCode, aJijumCode,
  aDepartName: string; var aDepartCode: string);
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  dmDBFunction.InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
end;

procedure TdmCommon.CreateJijumCode(aCompanyCode, aJijumName: string;
  var aJijumCode: string);
var
  nJijumCode : integer;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  dmDBFunction.InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);  
end;

procedure TdmCommon.CreatePosiCode(aCompanyCode, aPosiName: string;
  var aPosiCode: string);
var
  nPosiCode : integer;
begin
  nPosiCode := GetMaxPosiCode(aCompanyCode);
  aPosiCode := FillZeroNumber(nPosiCode,3);
  dmDBFunction.InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName);
end;

procedure TdmCommon.CreateRelayCode(aCampusName: string;
  var aRgCode: string);
var
  nRgCode : integer;
begin
  nRgCode := GetMaxRelayCode;
  aRgCode := FillZeroNumber(nRgCode,3);
  dmDBFunction.InsertIntoTB_RELAYGUBUN(aRgCode,aCampusName);
end;

function TdmCommon.GetDepartCode(aCompanyCode, aJijumCode,
  aDepartName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('CO_DEPARTCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmCommon.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TADOQuery;
begin
  result := '31';
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
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
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := inttostr(nFdms_id + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetJijumCode(aCompanyCode, aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('CO_JIJUMCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetMappingType: string;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := '1';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''EMMAPCODE'' ';

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
      result := FindField('CO_CONFIGVALUE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetMaxDepartCode(aCompanyCode,
  aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '001';
  stSql := ' Select Max(CO_DEPARTCODE) as departCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('departCode').AsString) then
      begin
        result := FillZeroNumber(strtoint(FindField('departCode').AsString) + 1 ,3);
      end else
      begin
        result := '001';
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmCommon.GetMaxJijumCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(CO_JIJUMCODE) as CO_JIJUMCODE from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('CO_JIJUMCODE').AsString) then
      begin
        result := strtoint(FindField('CO_JIJUMCODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetMaxPosiCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(PO_POSICODE) as PO_POSICODE from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('PO_POSICODE').AsString) then
      begin
        result := strtoint(FindField('PO_POSICODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetMaxPositionNum: integer;
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

function TdmCommon.GetMaxRelayCode: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(RG_CODE) as RG_CODE from TB_RELAYGUBUN ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('RG_CODE').AsString) then
      begin
        result := strtoint(FindField('RG_CODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.GetPosiCode(aCompanyCode, aPosiName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('PO_POSICODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmCommon.GetRelayCode(aRelayName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where RG_NAME = ''' + aRelayName + ''' ';

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
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := FindField('RG_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.LoadMappingCode(aMapType:string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  MappingCode1List.Clear;
  MappingCode2List.Clear;

  stSql := 'select * from TB_EMMAPPING ';
  stSql := stSql + ' Where MP_TYPE = ''' + aMapType + ''' ';

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

      While Not Eof do
      begin
        MappingCode1List.Add(FindField('MP_CODE').AsString);
        MappingCode2List.Add(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmCommon.MakeCardNo(aProgramType,aIDNO, aSeq: string): string;
begin
  result := '';
  if aProgramType = '1' then //아주대
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if aProgramType = '2' then //전남대병원
  begin
    result := FillCharString(aIDNO,'*',16);
  end else if aProgramType = '11' then   //동양대 북서울 캠퍼스
  begin
    result := FillCharString(aIDNO,'N',14);
    result := result + FillZeroStrNum(aSeq,2);
  end else if aProgramType = '12' then   //아주대 기숙사
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if aProgramType = '13' then //여수병원
  begin
    result := FillCharString(aIDNO,'*',16);
  end else if aProgramType = '14' then //영광종합병원
  begin
    aIDNO := FillCharString(aIDNO,'0',8);
    result := FillCharString(aIDNO,'*',16);
  end else if (aProgramType = '15') or (aProgramType = '16') then //홍익대
  begin
    result := FillCharString(aIDNO,'N',14);
    result := result + FillZeroStrNum(aSeq,2,False);
  end;
end;

end.
