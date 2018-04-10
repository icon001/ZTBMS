unit uDataModule;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX;

const
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  DATADELIMITER = '^';

type
  TDataModule1 = class(TDataModule)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    Function ProcessExecSQL(aSql:String): Boolean;
  end;

var
  DataModule1: TDataModule1;
  Master_ID : string;
  Master_Name : string;
  ExeFolder: String;
  ReceiveTelNumber : String;
  G_stReceiveIP : string;

implementation

{$R *.dfm}

{ TDataModule1 }

function TDataModule1.ProcessExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  OleInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOConnection1;
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

end.
