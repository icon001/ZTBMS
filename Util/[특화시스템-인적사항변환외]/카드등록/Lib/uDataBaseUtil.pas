unit uDataBaseUtil;

interface

uses
  SysUtils, Classes;



type TLogInfo = Record
    Log_Time: TDatetime;
    User_ID:  String[10];
    Log_Note: String[40];
    IP_Addr:  String[20];
  end;

type
  TDataBaseUtil = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;


var
  DataBaseUtil: TDataBaseUtil;

  Function  logInSave(aLogInfo:TLogInfo):Boolean;

implementation
uses
  uDataModule1,uLomosUtil;
{$R *.dfm}



function logInSave(aLogInfo: TLogInfo): Boolean;
var
  stSql : string;
begin
  Result:= False;
  with TDataModule1.GetObject.ADOExecQuery  do
  begin
    stSql := 'Insert into TB_SYSTEMLOG(';
    stSql := stSql + ' GROUP_CODE,SY_DATE,SY_TIME,SY_CLIENTIP,SY_OPERATOR,SY_LOGDATA,AC_NODENO,AC_ECUID,CA_CARDNO,AC_NUMBER ' ;
    stSql := stSql + ') ';
    stSql := stSql + 'VALUES(';
    stSql := stSql + '''' + GROUPCODE + ''',';
    stSql := stSql + '''' + FormatDateTime('yyyymmdd',aLogInfo.Log_Time) + ''',';
    stSql := stSql + '''' + FormatDateTime('HHMMSS',aLogInfo.Log_Time) + ''',';
    stSql := stSql + '''' + aLogInfo.IP_Addr + ''',';
    stSql := stSql + '''' + aLogInfo.User_ID + ''',';
    stSql := stSql + '''' + aLogInfo.Log_Note + ''',0,''00'',''0000000000'',''0'' ';
    stSql := stSql + ') ';

    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
      Result:= True;
    except
      Cancel;
      Result:= False;
    end;
  end;
end;

end.
