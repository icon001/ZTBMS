unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry,iniFiles;

const
ODBC_ADD_DSN=1;
ODBC_CONFIG_DSN=2;
ODBC_REMOVE_DSN=3;
ODBC_ADD_SYS_DSN=4;
ODBC_CONFIG_SYS_DSN=5;
ODBC_REMOVE_SYS_DSN=6;
ODBC_REMOVE_DEFAULT_DSN=7;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    ExecPath : string;
    { Private declarations }
    function GetPostGresqlPath:string;
    function ChekPsqlOdbcSetup : Boolean;
    function ODBCCreate:Boolean;
    Function IniFileWrite:Boolean;
  public
    { Public declarations }
  end;

function SQLConfigDataSource(HwndParent:HWND;FRequest:WORD;Driver:PChar;
                             Attributes:Pchar):boolean;Stdcall;

function SQLWriteDSNToIni(DSN: PChar;Driver: PChar):Boolean stdcall;
function SQLRemoveDSNFromIni(DSN: PChar):Boolean stdcall;

var
  Form1: TForm1;

implementation
uses
  uLomosUtil;
{$R *.dfm}

function SQLConfigDataSource;external 'odbccp32.dll' name 'SQLConfigDataSource';
function SQLWriteDSNToIni;external 'odbccp32.dll' name 'SQLWriteDSNToIni';
function SQLRemoveDSNFromIni;external 'odbccp32.dll' name 'SQLRemoveDSNFromIni';

function TForm1.ChekPsqlOdbcSetup: Boolean;
var
  regKey : TRegistry;
begin
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\ODBC\ODBCINST.INI\PostgreSQL Unicode')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 秦力
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\ODBC\ODBCINST.INI\PostgreSQL Unicode',False);
    if regKey.ReadString('Driver') <> '' then result := True;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 秦力
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 秦力
     regKey.Free;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  stExe:string;
  FileList : TStringList;
  stPostGresqlPath : string;
begin
  Top := -200;
  ExecPath := ExtractFileDir(Application.ExeName);
  if Not ChekPsqlOdbcSetup then
  begin
    stExe := ExecPath + '\psqlodbc.msi';
    if FileExists(stExe) then
    begin
      My_RunDosCommand('msiexec /i psqlodbc.msi',True);
    end;
  end;
  if ODBCCreate then
  begin
    IniFileWrite;
  end;
  //My_RunDosCommand('msiexec /i pgoledb.msi',True);
  Application.Terminate;
end;

function TForm1.GetPostGresqlPath: string;
var
  regKey : TRegistry;
begin
  result := '';
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\PostgreSQL\Installations\postgresql-8.3')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 秦力
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\PostgreSQL\Installations\postgresql-8.3',False);
    result := regKey.ReadString('Base Directory');
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 秦力
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 秦力
     regKey.Free;
end;

function TForm1.IniFileWrite: Boolean;
var
  ini_fun : TiniFile;
begin

  ini_fun := TiniFile.Create(ExecPath + '\zmos.INI');
  ini_fun.WriteString('DBConfig','psqlodbcsetup','TRUE');
  ini_fun.Free;

end;

function TForm1.ODBCCreate: Boolean;
begin
  result := False;
  if SQLRemoveDSNFromIni('PostgreSQL35W') then
  begin
    SQLWriteDSNToIni('PostgreSQL35W', 'PostgreSQL Unicode');
    if SQLConfigDataSource(0, ODBC_CONFIG_SYS_DSN,
                        PChar('PostgreSQL Unicode'),
    // add other params to the last one here:
                        PChar('DSN=PostgreSQL35W'+ #0 +
                               #0 + #0)) then result := True;
  // to remove the one that you created, use this code:
  // SQLRemoveDSNFromIni('TA');
  end;

end;

end.
