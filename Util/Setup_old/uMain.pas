unit uMain;
 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls,Registry, RzButton;

type
  TfmMain = class(TForm)
    Notebook1: TNotebook;
    gb_Start: TGroupBox;
    btn_Exit: TSpeedButton;
    Panel4: TPanel;
    gb_Server: TGroupBox;
    btn_Prv: TRzBitBtn;
    btn_Next: TRzBitBtn;
    RzBitBtn1: TRzBitBtn;
    lb_MSSQLServer: TLabel;
    GroupBox1: TGroupBox;
    btn_MSSQLServer: TSpeedButton;
    btn_Daemon: TSpeedButton;
    Pn_DB: TPanel;
    pn_Daemon: TPanel;
    GroupBox2: TGroupBox;
    btn_Monitor: TSpeedButton;
    btn_Report: TSpeedButton;
    btn_FdReport: TSpeedButton;
    pn_FdReport: TPanel;
    pn_Report: TPanel;
    pn_Monitor: TPanel;
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_ServerClick(Sender: TObject);
    procedure btn_MonitorClick(Sender: TObject);
    procedure btn_ReportClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_PrvClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure btn_NextClick(Sender: TObject);
    procedure btn_MSSQLServerClick(Sender: TObject);
    procedure btn_DaemonClick(Sender: TObject);
    procedure btn_FdReportClick(Sender: TObject);
  private
    { Private declarations }
    function WriteRegistryFunc (ArgKey, ArgValue : string) : BOOLEAN;
    Function CreateWindowStartRegKey(aRegName,aValue:string):Boolean;
    Function DeleteWindowStartRegKey(aRegName:string):Boolean;

    function CheckMSSQLSetup : Boolean;
    function CheckPostGreSqlSetup : Boolean;
    function CheckKTMOSSetup : Boolean;
    function CheckKTATREPORTSetup : Boolean;
    function CheckKTFDREPORTSetup : Boolean;
    function CheckKTDAEMONSetup : Boolean;
    procedure ProgramCheck;
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
  DeleteWindowStartRegKey('ZTBMSSETUP');
  Close;
end;

procedure TfmMain.btn_ServerClick(Sender: TObject);
begin
  Notebook1.PageIndex := 1;
end;

procedure TfmMain.btn_MonitorClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\ZMOS\Zmos_PG_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '출입관제시스템 설치');
    Application.ProcessMessages;
  end;

  fmMain.Show;
  ProgramCheck;
end;

procedure TfmMain.btn_ReportClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\ATManager\ATmanager_PG_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '근태관리보고서 설치');
    Application.ProcessMessages;
  end;
//  showMessage('test');
  fmMain.Show;
  ProgramCheck;
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
        if (not RegKey.KeyExists('\Software\KTBMS')) then
        begin
            // 'TBMS' KEY CREATE
            RegKey.CreateKey ('\Software\KTBMS');
        end;
        // 'TBMS' KEY OPEN
        RegKey.OpenKey ('\Software\KTBMS',False);
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
begin
  ProgramCheck;
end;

function TfmMain.CheckMSSQLSetup: Boolean;
var
  regKey : TRegistry;
  stKey : string;
begin
  result := False;
  regKey := nil;
  Try
    regKey := TRegistry.Create;
    regKey.RootKey := HKEY_LOCAL_MACHINE;
    if (not regKey.KeyExists('\Software\Microsoft\Microsoft SQL Server')) then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end;
    regKey.OpenKey ('\Software\Microsoft\Microsoft SQL Server',False);
{    stKey := regKey.ReadString('test');
    if stKey = '' then
    begin
      if (Assigned(regKey)) then
      // REGISTRY KEY 해제
         regKey.Free;
      Exit;
    end; }
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

function TfmMain.CheckKTMOSSetup: Boolean;
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
    stKey := regKey.ReadString('ZMOS');
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

function TfmMain.CheckKTATREPORTSetup: Boolean;
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

procedure TfmMain.FormCreate(Sender: TObject);
begin
  ExecPath := ExtractFileDir(Application.ExeName);
  CreateWindowStartRegKey('ZTBMSSETUP',Application.ExeName);
  NoteBook1.PageIndex := 0;
end;

procedure TfmMain.btn_PrvClick(Sender: TObject);
begin
  NoteBook1.PageIndex := 0;
end;

procedure TfmMain.Notebook1PageChanged(Sender: TObject);
begin
  RzBitBtn1.Down := True;
end;

procedure TfmMain.btn_NextClick(Sender: TObject);
begin
  Close;
end;

function TfmMain.CheckKTDAEMONSetup: Boolean;
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
    stKey := regKey.ReadString('ZDAEMON');
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

procedure TfmMain.btn_MSSQLServerClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  fmMain.Hide;
{  stExe := ExecPath + '\DataBase\01.WindowsInstaller-KB893803-v2-x86.exe';
  My_RunDosCommand(stExe,True);
  stExe := ExecPath + '\DataBase\NetFramworkConfigurationTool.msi';
  My_RunDosCommand(stExe,True);}
  stExe := ExecPath + '\PostGreSqlDataBase\PostGreSql_Setup.exe';
  My_RunDosCommand(stExe,True);

  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, 'PostGreSql 설치');
    Application.ProcessMessages;
  end;

  fmMain.Show;
  ProgramCheck;

end;

procedure TfmMain.ProgramCheck;
begin
  if CheckPostGreSqlSetup then
  begin
    btn_MSSQLServer.Enabled := False;
    Pn_DB.Enabled := False;
    if CheckKTDAEMONSetup then
    begin
      btn_Daemon.Enabled := False;
      pn_Daemon.Enabled := False;
    end;
  end;   
  if CheckKTMOSSetup then
  begin
    btn_Monitor.Enabled := False;
    pn_Monitor.Enabled := False;
  end;
  if CheckKTATREPORTSetup then
  begin
    btn_Report.Enabled := False;
    pn_Report.Enabled := False;
  end;
  if CheckKTFDREPORTSetup then
  begin
    btn_FdReport.Enabled := False;
    pn_FdReport.Enabled := False;
  end;
  if CheckKTDAEMONSetup then
  begin
    btn_Daemon.Enabled := False;
    pn_Daemon.Enabled := False;
  end;
end;

procedure TfmMain.btn_DaemonClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\ZDAEMON\ZDAEMON_PG_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '출입관리통신프로그램 설치');
    Application.ProcessMessages;
  end;

  fmMain.Show;
  ProgramCheck;
end;

procedure TfmMain.btn_FdReportClick(Sender: TObject);
var
  stExe:string;
  iHandle : THandle;
begin
  stExe := ExecPath + '\FOODManager\FoodManager_PG_Setup.exe';
  fmMain.Hide;
  My_RunDosCommand(stExe,True);
  Delay(1000);
  while iHandle <> 0 do
  begin
    iHandle := FindWindow(Nil, '식수관리시스템 설치');
    Application.ProcessMessages;
  end;
//  showMessage('test');
  fmMain.Show;
  ProgramCheck;
end;

function TfmMain.CheckKTFDREPORTSetup: Boolean;
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
    stKey := regKey.ReadString('FoodManager');
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
    stKey := regKey.ReadString('Version');
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

function TfmMain.CreateWindowStartRegKey(aRegName,
  aValue: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_CURRENT_USER;
   FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
   FReg.WriteString(aRegName, aValue);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmMain.DeleteWindowStartRegKey(aRegName: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_CURRENT_USER;
   FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
   FReg.DeleteValue(aRegName);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

end.
