unit uKTAMSDataBase;

interface

uses
  SysUtils, Classes, DB, ADODB,Forms,Windows,Dialogs,ActiveX,
  uCommonVariable;

type
  TdmZTBMSDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOTempQuery: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    FCancel: Boolean;
    FDBConnected: Boolean;
    FOnAdoConnected: TAdoConnectedEvent;
    procedure SetCancel(const Value: Boolean);
    procedure SetDBConnected(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Function DataBaseConnect(aDBType:integer;aDBHost,aDBPort,aDBUserID,aDBUserPw,aDBName:string;aMessage: Boolean):Boolean;
    Function DataBaseDisConnect:Boolean;
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function GetTableVersion:integer;
    Function TableVersionCheck:Boolean;
    function Table_0001_VersionMake:Boolean;
    function Table_0002_VersionMake:Boolean;
  public
    Function AlterTB_SLOCAL_RelayBuildingCode_Add:Boolean;
    Function AlterTB_SLOCAL_RelayCode_Add:Boolean;
    Function AlterTB_EMPLOYEE_EMSEQ_ADD : Boolean;
    Function CheckTB_LOCAL_Code(aLocalCode:string):integer;
    Function GetTB_SLOCAL_BuildingCode(aCode:string;var aName:string):string;
    Function GetTB_SLOCAL_CompanyCode(aCode:string;var aName:string):string;
    Function GetTB_CONFIG_Value(aGroup,aCode:string):string;
    Function InsertIntoTB_CONFIG_All(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aDetail:string=''):Boolean;
    Function UpdateTB_CONFIG_Value(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,stBuildingCode:string):Boolean;
    Function UpdateTB_SLOCAL_CompanyCode(aSLocalCode,aCompanyCode:string):Boolean;
    Function UpdateTB_EMPLOYEE_Field_IntValue(aCompanyCode,aEmCode,aFieldName,aValue:string):Boolean;
  public
    Property Cancel:Boolean read FCancel write SetCancel;
    Property DBConnected : Boolean read FDBConnected write SetDBConnected;
  Published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;
function SQLConfigDataSource(hwndParent : HWND; fRequest : WORD; lpszDriver : LPCSTR; lpszAttributes : LPCSTR) : Boolean; stdcall; external 'ODBCCP32.DLL';

var
  dmZTBMSDataBase: TdmZTBMSDataBase;

implementation

uses
  uCommonFunction;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmKTAMSDataBase }

function TdmZTBMSDataBase.AlterTB_EMPLOYEE_EMSEQ_ADD: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_SEQ integer NULL ';
  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.AlterTB_SLOCAL_RelayBuildingCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SLOCAL ADD SL_RELAYBUILDINGCODE varchar(50) NULL ';
  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.AlterTB_SLOCAL_RelayCode_Add: Boolean;
var
  stSql : string;
begin
  stSql := 'ALTER TABLE TB_SLOCAL ADD SL_RELAYCODE varchar(50) NULL ';
  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.CheckTB_LOCAL_Code(aLocalCode: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := -1;
  stSql := 'select * from TB_LOCAL ';
  stSql := stSql + ' where LOCAL_CODE = ''' + aLocalCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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
      if recordcount = 0 then result := 0
      else result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmZTBMSDataBase.DataBaseConnect(aDBType: integer; aDBHost, aDBPort,
  aDBUserID, aDBUserPw, aDBName: string; aMessage: Boolean): Boolean;
var
  stConnectString : string;
  stDBType : string;
begin
  if DBConnected then Exit;
  result := False;
  CanCel := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  if aDBType = MSSQL then
  begin
    stConnectString := stConnectString + 'Provider=SQLOLEDB.1;';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'User ID=' + aDBUserID + ';';
    stConnectString := stConnectString + 'Initial Catalog=' + aDBName + ';';
    stConnectString := stConnectString + 'Data Source=' + aDBHost  + ',' + aDBPort;
  end else if aDBType = POSTGRESQL then
  begin
    stConnectString := 'Provider=PostgreSQL OLE DB Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ';'   ;
    stConnectString := stConnectString + 'location=' + aDBName + ';';
    stConnectString := stConnectString + 'User Id='+ aDBUserID + ';';
    stConnectString := stConnectString + 'password=' + aDBUserPw;
  end else if aDBType = FIREBIRD then
  begin
    stConnectString := 'Provider=ZStyle IBOLE Provider;';
    stConnectString := stConnectString + 'Data Source=' + aDBHost + ':' + aDBName + ';';
    stConnectString := stConnectString + 'UID='+ aDBUserID + ';';
    stConnectString := stConnectString + 'Password=' + aDBUserPw + ';';
    stConnectString := stConnectString + 'DIALECT=3;';
  end else //디폴트로 MDB로 인식하자
  begin
    if Not FileExists(G_stExeFolder + '\..\db\SAC.mdb') then
    begin
      ChDir(G_stExeFolder + '\..\db');
      SQLConfigDataSource(0, 1, LPCSTR('Microsoft Access Driver (*.mdb)'), LPCSTR('CREATE_DB=SAC.mdb General'));
    end;

    stConnectString := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    stConnectString := stConnectString + 'Data Source=' + G_stExeFolder + '\..\db\SAC.mdb' + ';';
    stConnectString := stConnectString + 'Persist Security Info=True;';
    stConnectString := stConnectString + 'Jet OLEDB:Database ';
  end;

  with ADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := stConnectString;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          if aMessage then
            ShowMessage(stConnectString + E.Message );
          Exit;
        end;
      else
        begin
          if aMessage then
            ShowMessage('데이터베이스 접속에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    TableVersionCheck;
    //CursorLocation := clUseClient;
  end;

  DBConnected := True;
  result := True;
end;

function TdmZTBMSDataBase.DataBaseDisConnect: Boolean;
begin
  DBConnected := False;
  with ADOConnection do
  begin
    Connected := False;
  end;
end;

procedure TdmZTBMSDataBase.DataModuleCreate(Sender: TObject);
begin
  DBConnected := False;
end;

function TdmZTBMSDataBase.GetTableVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLEVER'' ';
  with ADOTempQuery do
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
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmZTBMSDataBase.GetTB_CONFIG_Value(aGroup, aCode: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' and CO_CONFIGCODE = ''' + aCode + ''' ';

  with ADOTempQuery do
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
      result := Trim(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmZTBMSDataBase.GetTB_SLOCAL_BuildingCode(aCode: string;
  var aName: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_SLOCAL ';
  stSql := stSql + ' where SLOCAL_CODE = ''' + aCode + ''' ';
  with ADOTempQuery do
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
      aName := FindField('SLOCAL_NAME').AsString;
      result := Trim(FindField('SL_RELAYBUILDINGCODE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmZTBMSDataBase.GetTB_SLOCAL_CompanyCode(aCode:string;var aName:string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_SLOCAL ';
  stSql := stSql + ' where SLOCAL_CODE = ''' + aCode + ''' ';
  with ADOTempQuery do
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
      aName := FindField('SLOCAL_NAME').AsString;
      result := Trim(FindField('SL_RELAYCODE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TdmZTBMSDataBase.InsertIntoTB_CONFIG_All(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE, aDetail: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCONFIGGROUP + ''', ';
  stSql := stSql + '''' + aCONFIGCODE + ''', ';
  stSql := stSql + '''' + aCONFIGVALUE + ''',';
  stSql := stSql + '''' + aDetail + ''') ';

  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  //원복시키자
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
//        LogSave(G_stExeFolder + '\..\Log\DBSUCCESS' + FormatDateTime('yyyymmdd',Now) + '.log',aSql);
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('out of memory',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('연결을 실패했습니다',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError(UPDATE)' + aSql);
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TdmZTBMSDataBase.SetCancel(const Value: Boolean);
begin
  FCancel := Value;
end;

procedure TdmZTBMSDataBase.SetDBConnected(const Value: Boolean);
begin
  FDBConnected := Value;
end;

function TdmZTBMSDataBase.TableVersionCheck: Boolean;
var
  nTableVersion : integer;
begin
  result := False;
  nTableVersion := GetTableVersion;
  if nTableVersion < 1 then Table_0001_VersionMake;
  if nTableVersion < 2 then Table_0002_VersionMake;

end;

function TdmZTBMSDataBase.Table_0001_VersionMake: Boolean;
begin
  AlterTB_SLOCAL_RelayCode_Add;
  InsertIntoTB_CONFIG_All('COMMON','TABLEVER','1','');
end;

function TdmZTBMSDataBase.Table_0002_VersionMake: Boolean;
begin
  AlterTB_SLOCAL_RelayBuildingCode_Add;

  UpdateTB_CONFIG_Value('COMMON','TABLEVER','2');
end;

function TdmZTBMSDataBase.UpdateTB_CONFIG_Value(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CONFIG set CO_CONFIGVALUE = ''' + aCONFIGVALUE + '''' ;
  stSql := stSql + ' Where CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.UpdateTB_EMPLOYEE_Field_IntValue(aCompanyCode,
  aEmCode, aFieldName, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set ' + aFieldName + ' = ' + aValue + ' ' ;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);

end;

function TdmZTBMSDataBase.UpdateTB_SLOCAL_BUILDINGCode(aSLocalCode,
  stBuildingCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SLOCAL set SL_RELAYBUILDINGCODE = ''' + stBuildingCode + '''' ;
  if aSLocalCode <> '' then stSql := stSql + ' Where SLOCAL_CODE = ''' + aSLocalCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TdmZTBMSDataBase.UpdateTB_SLOCAL_CompanyCode(aSLocalCode,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_SLOCAL set SL_RELAYCODE = ''' + aCompanyCode + '''' ;
  if aSLocalCode <> '' then stSql := stSql + ' Where SLOCAL_CODE = ''' + aSLocalCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

end.
