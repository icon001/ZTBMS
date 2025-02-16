unit uDataModule1;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX;

type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;

  TDataModule1 = class(TDataModule)
    ADOTmpQuery: TADOQuery;
  private
    { Private declarations }
    FOnAdoConnected: TAdoConnectedEvent;
  published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function ProcessEventExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function GetDaemonVersion:integer;
  end;

var
  DataModule1: TDataModule1;
  GROUPCODE : string;
  IsMaster : Boolean = True;
  BuildingGrade : integer = 0;
  MasterBuildingCode : string = '000';
  MasterFloorCode : string = '000';
  MasterAreaCode : string = '000';
  Master_ID : string = 'Master';
  ExeFolder : string;

  G_nDaemonServerVersion : integer;
  G_nCompanyCodeType :integer;

implementation
uses
  uDataBaseConvert;
{$R *.dfm}

{ TDataModule1 }

function TDataModule1.GetDaemonVersion: integer;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''DAEMON_VER'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := fmMain.targetADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount > 0 then
      begin
        Try
          result := strtoint(FindField('CO_CONFIGVALUE').AsString);
        Except
          Exit;
        End;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.ProcessEventExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := fmMain.targetADOConnection;
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
    end;
  end else
  begin
    Result:= True;
  end;
end;

function TDataModule1.ProcessExecSQL(aSql: String;
  bUpdateResult: Boolean): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := fmMain.targetADOConnection;
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
    end;
  end else
  begin
    Result:= True;
  end;
end;

end.

