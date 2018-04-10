unit uMain;
 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,Registry, RzButton;

type
  TfmMain = class(TForm)
    Notebook1: TNotebook;
    gb_Start: TGroupBox;
    btn_MDBServer: TSpeedButton;
    btn_MultiServer: TSpeedButton;
    btn_Exit: TSpeedButton;
    Panel4: TPanel;
    pn_Report: TPanel;
    Pn_Server: TPanel;
    gb_DataBase: TGroupBox;
    btn_Prv1: TRzBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    btn_PostGreSql: TSpeedButton;
    pn_Daemon: TPanel;
    btn_Mssql: TSpeedButton;
    Pn_DB: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    gb_Program: TGroupBox;
    btn_prv2: TRzBitBtn;
    btn_Complete: TRzBitBtn;
    btn_DataBaseSetup: TSpeedButton;
    btn_DaemonServer: TSpeedButton;
    btn_Attendsetup: TSpeedButton;
    Panel1: TPanel;
    pan_DataBase: TPanel;
    Panel3: TPanel;
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_MDBServerClick(Sender: TObject);
    procedure btn_MultiServerClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_Prv1Click(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure btn_Next1Click(Sender: TObject);
    procedure btn_PostGreSqlClick(Sender: TObject);
    procedure btn_MssqlClick(Sender: TObject);
    procedure btn_prv2Click(Sender: TObject);
    procedure btn_CompleteClick(Sender: TObject);
    procedure btn_DataBaseSetupClick(Sender: TObject);
    procedure btn_DaemonServerClick(Sender: TObject);
    procedure btn_AttendsetupClick(Sender: TObject);
  private
    L_DBMS : string;
    { Private declarations }
    procedure RegClear;
    function WriteRegistryFunc (ArgKey, ArgValue : string) : BOOLEAN;

    function CheckPostGreSqlSetup: Boolean;
    function CheckDaemonServerSetup: Boolean;
    function CheckAttendReportSetup: Boolean;
    function CheckSetupDB: String;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;
  ExecPath : string;

implementation
uses
uLomosUtil;
{$R *.dfm}

procedure TfmMain.btn_ExitClick(Sender: TObject);
begin
  RegClear;
  Close;
end;

procedure TfmMain.btn_MDBServerClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\MDB\ATManager_MDB_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '근태관리보고서 설치');
    Application.ProcessMessages;
  end;

  fmMain.Show;
end;

procedure TfmMain.btn_MultiServerClick(Sender: TObject);
begin
  NoteBook1.PageIndex := 1;
end;

function TfmMain.WriteRegistryFunc(ArgKey, ArgValue: string): BOOLEAN;
var
    RegKey : TRegistry;
begin
    // REGISTRY KEY 초기화
    RegKey := nil;
    try
        // REGISTRY KEY 생성
        RegKey := TRegistry.Create;
        // ROOT KEY 설정
        RegKey.RootKey := HKEY_LOCAL_MACHINE;
        // 'TBMS' KEY 존재여부 CHECK
        if (not RegKey.KeyExists('\Software\ZERON')) then
        begin
            // 'TBMS' KEY CREATE
            RegKey.CreateKey ('\Software\ZERON');
        end;
        // 'TBMS' KEY OPEN
        RegKey.OpenKey ('\Software\ZERON',False);
        // WRITE
        RegKey.WriteString (ArgKey,ArgValue);
    finally
        // REGISTRY KEY ASSIGN CHECK
        if (Assigned(RegKey)) then
        begin
            // REGISTRY KEY 해제
            RegKey.Free;
        end;
    end;
    WriteRegistryFunc := True;
end;

procedure TfmMain.FormActivate(Sender: TObject);
var
    RegKey : TRegistry;
begin
    // REGISTRY KEY 초기화  시작프로그램에 등록
    RegKey := nil;
    try
        // REGISTRY KEY 생성
        RegKey := TRegistry.Create;
        // ROOT KEY 설정
        RegKey.RootKey := HKEY_LOCAL_MACHINE;
        // 'TBMS' KEY 존재여부 CHECK
        if (not RegKey.KeyExists('SOFTWARE\Microsoft\Windows\CurrentVersion\Run')) then
        begin
            // 'TBMS' KEY CREATE
            RegKey.CreateKey ('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
        end;
        // 'TBMS' KEY OPEN
        RegKey.OpenKey ('SOFTWARE\Microsoft\Windows\CurrentVersion\Run',False);
        // WRITE
        RegKey.WriteString ('SCRSETUP',Application.ExeName);
    finally
        // REGISTRY KEY ASSIGN CHECK
        if (Assigned(RegKey)) then
        begin
            // REGISTRY KEY 해제
            RegKey.Free;
        end;
    end;

    L_DBMS := CheckSetupDB;
    if L_DBMS <> '' then //설치 중간에 재부팅 된 경우임
    begin
      NoteBook1.PageIndex := 2;
    end;
end;


procedure TfmMain.FormCreate(Sender: TObject);
begin
  L_DBMS := '';
  ExecPath := ExtractFileDir(Application.ExeName);
  NoteBook1.PageIndex := 0;
end;

procedure TfmMain.btn_Prv1Click(Sender: TObject);
begin
  NoteBook1.PageIndex := 0;
end;

procedure TfmMain.Notebook1PageChanged(Sender: TObject);
begin
  if CheckPostGreSqlSetup then btn_DataBaseSetup.Enabled := False;
  if CheckDaemonServerSetup then btn_DaemonServer.Enabled := False;
  if CheckAttendReportSetup then btn_Attendsetup.Enabled := False;
end;

procedure TfmMain.btn_Next1Click(Sender: TObject);
begin
  Close;
end;


procedure TfmMain.btn_PostGreSqlClick(Sender: TObject);
begin
  L_DBMS := 'PG';
  NoteBook1.PageIndex := 2;
  btn_DataBaseSetup.Enabled := True;
  pan_DataBase.Caption := 'PostGreSql 서버를 설치합니다.';
  WriteRegistryFunc('SETUPDB',L_DBMS);
end;


procedure TfmMain.btn_MssqlClick(Sender: TObject);
begin
  L_DBMS := 'MSSQL';
  NoteBook1.PageIndex := 2;
  btn_DataBaseSetup.Enabled := False;
  pan_DataBase.Caption := 'MSSQL은 설치를 지원하지 않습니다.';
  WriteRegistryFunc('SETUPDB',L_DBMS);
end;

procedure TfmMain.btn_prv2Click(Sender: TObject);
begin
  NoteBook1.PageIndex := 1;
end;

procedure TfmMain.btn_CompleteClick(Sender: TObject);
begin
  Close;
end;

function TfmMain.CheckAttendReportSetup: Boolean;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\ZERON')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\ZERON',False);
    stKey := regKey.ReadString('ATTENDREPORT');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
  result := True;
end;

function TfmMain.CheckDaemonServerSetup: Boolean;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\ZERON')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\ZERON',False);
    stKey := regKey.ReadString('SCRDAEMON');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
  result := True;
end;

function TfmMain.CheckPostGreSqlSetup: Boolean;
var
  regKey : TRegistry;
  stKey : string;
begin
  stKey := '';
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\PostgreSQL\Installations\postgresql-8.3')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\PostgreSQL\Installations\postgresql-8.3',False);
    stKey := regKey.ReadString('Base Directory');
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
  if stKey <> '' then result := True;
end;

function TfmMain.CheckSetupDB: String;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := '';
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\ZERON')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\ZERON',False);
    stKey := regKey.ReadString('SETUPDB');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
  Except
    if (Assigned(regKey)) then
    // REGISTRY KEY 해제
       regKey.Free;
    Exit;
  End;
  if (Assigned(regKey)) then
  // REGISTRY KEY 해제
     regKey.Free;
  result := stKey;
end;

procedure TfmMain.btn_DataBaseSetupClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\PostGreSql\PostGreSqlDataBase\PostGreSql_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, 'PostGreSql 설치');
    Application.ProcessMessages;
  end;

  fmMain.Show;
end;

procedure TfmMain.btn_DaemonServerClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  if L_DBMS = 'PG' then
    stExe := ExecPath + '\PostGreSql\SCRDAEMON\SCRDaemon_PG_Setup.exe'
  else if L_DBMS = 'MSSQL' then
    stExe := ExecPath + '\MSSQL\SCRDAEMON\SCRDaemon_MSSQL_Setup.exe'
  else
  begin
    showmessage('설치할 데이터베이스 선택이 잘못 되었습니다.');
    NoteBook1.PageIndex := 1;
    Exit;
  end;
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '근태통신프로그램 설치');
    Application.ProcessMessages;
  end; 

  fmMain.Show;
end;

procedure TfmMain.btn_AttendsetupClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  if L_DBMS = 'PG' then
    stExe := ExecPath + '\PostGreSql\ATManager\ATmanager_PG_Setup.exe'
  else if L_DBMS = 'MSSQL' then
    stExe := ExecPath + '\MSSQL\ATManager\ATmanager_MSSQL_Setup.exe'
  else
  begin
    showmessage('설치할 데이터베이스 선택이 잘못 되었습니다.');
    NoteBook1.PageIndex := 1;
    Exit;
  end;
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '근태관리보고서 설치');
    Application.ProcessMessages;
  end; 

  fmMain.Show;
end;

procedure TfmMain.RegClear;
var
  FReg : TRegistry;
begin
//시작프로그램에 등록되어 있는 이걸 삭제하자.
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
//   if Not FReg.KeyExists(sRegPath) then exit;
   //FReg.CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
   FReg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', false);
   FReg.DeleteValue('SCRSETUP');
   FReg.CloseKey;
   FReg.OpenKey('\Software\ZERON', false);
   FReg.DeleteValue('SETUPDB');
   FReg.CloseKey;

 Finally
  FReg.Free;
 end;
end;

end.
