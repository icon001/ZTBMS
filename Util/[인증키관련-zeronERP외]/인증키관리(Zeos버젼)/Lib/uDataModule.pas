unit uDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX, ZConnection, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection;

const
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';

type
  TdmDB = class(TDataModule)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ZTempQuery: TZQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    Function CreateTB_DEVICEFUNCTIONCODE:Boolean;
    Function CreateTB_DEVICEFUNCTIONGROUP:Boolean;
    Function CreateTB_DEVICEFUNCTIONMAPPING:Boolean;
    Function CreateTB_DEVICEFUNCTIONLIST:Boolean;
    Function GetTableVersion : integer;
    Function DBConnect(aIp,aPort,aDataBase,aUser,aUserPw:string):Boolean;
    Function MakeTable001:Boolean;
    Function MakeTable002:Boolean;
    Function ProcessExecSQL(aSql:String): Boolean;
    Function TableVersionCheck():Boolean;

  public
    Function UpdateTB_CONFIG(aCode,aValue:string):Boolean;
  end;

var
  dmDB: TdmDB;
  Master_ID : string;
  Master_COMPANYCODE : string;
  Master_Name : string;
  ExeFolder: String;
  Master_ProductAccept : integer;
  Master_DeliveryAccept : integer;
  ReceiveTelNumber : String;
  G_stServerIP : string;
  G_stServerPort : string;

implementation

{$R *.dfm}

{ TDataModule1 }

function TdmDB.CreateTB_DEVICEFUNCTIONCODE: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICEFUNCTIONCODE (';
  stSql := stSql + ' DG_GROUPCODE integer NOT NULL,'; //functionGroupCode
  stSql := stSql + ' DF_CODE integer NOT NULL,'; //functionCode
  stSql := stSql + ' DF_NAME varchar(50) ,';//기능명
  stSql := stSql + ' PRIMARY KEY (DF_GROUPCODE,DF_CODE) ';
  stSql := stSql + ' ) ';

  result := ProcessExecSQL(stSql);

end;

function TdmDB.CreateTB_DEVICEFUNCTIONGROUP: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICEFUNCTIONGROUP (';
  stSql := stSql + ' DG_GROUPCODE integer NOT NULL,'; //functionGroupCode
  stSql := stSql + ' DG_NAME varchar(50) ,';//그룹명
  stSql := stSql + ' PRIMARY KEY (DG_GROUPCODE) ';
  stSql := stSql + ' ) ';

  result := ProcessExecSQL(stSql);

end;

function TdmDB.CreateTB_DEVICEFUNCTIONLIST: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICEFUNCTIONLIST (';
  stSql := stSql + ' DE_DEVICETYPE varchar(3)  NOT NULL,';//기기 타입
  stSql := stSql + ' DE_ROMTYPE varchar(3)  NOT NULL,';//롬 타입
  stSql := stSql + ' DG_GROUPCODE integer NOT NULL, ';
  stSql := stSql + ' DF_CODE integer NOT NULL,'; //functionCode
  stSql := stSql + ' DF_VALUE varchar(100) ,';//기능
  stSql := stSql + ' PRIMARY KEY (DE_DEVICETYPE,DE_ROMTYPE,DG_GROUPCODE,DF_CODE) ';
  stSql := stSql + ' ) ';

  result := ProcessExecSQL(stSql);


end;

function TdmDB.CreateTB_DEVICEFUNCTIONMAPPING: Boolean;
var
  stSql : string;
begin
  stSql := 'Create Table TB_DEVICEFUNCTIONMAPPING (';
  stSql := stSql + ' DE_DEVICETYPE varchar(3) ,';//기기 타입
  stSql := stSql + ' DE_ROMTYPE varchar(3) ,';//롬 타입
  stSql := stSql + ' PRIMARY KEY (DE_DEVICETYPE,DE_ROMTYPE) ';
  stSql := stSql + ' ) ';

  result := ProcessExecSQL(stSql);

end;

function TdmDB.DBConnect(aIp, aPort, aDataBase, aUser,
  aUserPw: string): Boolean;
begin
  result := False;
  ZConnection1.Protocol := 'mysql';
  ZConnection1.Database := aDataBase;
  ZConnection1.HostName := aIp;
  ZConnection1.Port := strtoint(aPort);
  ZConnection1.User := aUser;
  ZConnection1.Password := aUserPw;
  try
    ZConnection1.Disconnect;
    ZConnection1.Connect;
  Except
    Exit;
  End;

  TableVersionCheck();
  result := True;

end;

function TdmDB.GetTableVersion: integer;
var
  stSql : string;
  TempQuery :TZQuery;
begin
  result := 0;
  stSql := ' select * from TB_CONFIG  ';
  stSql := stSql + ' Where CO_CODE = ''TABLEVER'' ';

  Try
    OleInitialize(nil);
    TempQuery := TZQuery.Create(nil);
    TempQuery.Connection := ZConnection1;
    with TempQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= stSql;
      try
        Open;
      except
      ON E: Exception do
        begin
          Exit;
        end
      end;
      if recordCount < 1 then Exit;
      result := strtoint(FindField('CO_VALUE').AsString);
    end;
  Finally
    TempQuery.Free;
    OleUninitialize;
  End;
end;

function TdmDB.MakeTable001: Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG(CO_CODE,CO_VALUE) values(''TABLEVER'',''1'')';
  ProcessExecSQL(stSql);
  CreateTB_DEVICEFUNCTIONCODE;
  CreateTB_DEVICEFUNCTIONGROUP;
  CreateTB_DEVICEFUNCTIONLIST;
end;

function TdmDB.MakeTable002: Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CONFIG Set CO_VALUE = ''2'' where CO_CODE = ''TABLEVER'' ';
  ProcessExecSQL(stSql);
  CreateTB_DEVICEFUNCTIONMAPPING;

end;

function TdmDB.ProcessExecSQL(aSql: String): Boolean;
var
  ExecQuery :TZQuery;
begin
  Result:= False;
  OleInitialize(nil);
  ExecQuery := TZQuery.Create(nil);
  ExecQuery.Connection := ZConnection1;
  with ExecQuery do
  begin
    Close;
    //SQL.Clear;
    SQL.Text:= aSql;
    try
      ExecSQL;
    except
    ON E: Exception do
      begin
//        ADOConnection.Connected := False;
//        ADOConnection.Connected := True;
//        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        OleUninitialize;
        //ADOConnection.RollbackTrans;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  OleUninitialize;
  Result:= True;
end;

function TdmDB.TableVersionCheck: Boolean;
var
  nVer : integer;
begin
  nVer := GetTableVersion;
  if nVer < 1 then MakeTable001;
  if nVer < 2 then MakeTable002;
end;

function TdmDB.UpdateTB_CONFIG(aCode, aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CONFIG set CO_VALUE = ''' + aValue + ''' ';
  stSql := stSql + ' Where CO_CODE = ''' + aCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

end.
