unit uZeronEventDataBase;

interface

uses
  SysUtils, Classes, DB, ADODB,
  ActiveX,uDBVariable,IBDatabase;

type
  TdmZeronEventDataBase = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOEventConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ADOEventQuery: TADOQuery;
    ADOTempQuery: TADOQuery;
  private
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function ProcessEventExecSQL(aSql:String): Boolean;
    Function DBSessionCheck : Boolean;
  published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  dmZeronEventDataBase: TdmZeronEventDataBase;

implementation
uses
  uLomosUtil,
  uCommonVariable;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TdmDataBase }

function TdmZeronEventDataBase.DBSessionCheck: Boolean;
var
  stSql : string;
  TempQuery :TADOQuery;
begin
  Result:= False;
  stSql := 'select * from TB_CONFIG';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := ADOEventConnection;
    TempQuery.DisableControls;
    with TempQuery do
    begin
      Close;
      SQL.Text:= stSql;
      try
        Open;
      except
        Exit;
      end;
    end;
    Result:= True;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;


end;

function TdmZeronEventDataBase.ProcessEventExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOEventConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        ExecSql;
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);
          if Pos('no connection to the server',E.Message) > 0 then
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
  Result:= True;
end;

function TdmZeronEventDataBase.ProcessExecSQL(aSql: String;
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
      except
      ON E: Exception do
        begin
          LogSave(G_stExeFolder + '\..\Log\DB' + FormatDateTime('yyyymmdd',Now) + '.log','DBError('+ E.Message + ')' + aSql);

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

end.
