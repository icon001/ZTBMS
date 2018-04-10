unit uAdminConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,iniFiles, Buttons,Registry;

type
  TfmAdminConfig = class(TForm)
    GroupBox1: TGroupBox;
    Chk_WindowsStart: TCheckBox;
    chk_AutoVisible: TCheckBox;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function CreateWindowStartRegKey(aRegName,aValue:string):Boolean;
    Function DeleteWindowStartRegKey(aRegName:string):Boolean;
    Function CreateAutoVisibleRegKey(aRegName,aValue:string):Boolean;
    Function DeleteAutoVisibleKey(aRegKey:string):Boolean;
    Function WindowsStartConfigSet:Boolean;
    Function AutoVisibleConfigSet:Boolean;
  public
    { Public declarations }
  end;

var
  fmAdminConfig: TfmAdminConfig;

implementation

{$R *.dfm}

function TfmAdminConfig.AutoVisibleConfigSet: Boolean;
var
  FReg : TRegistry;
  stAutoVisible : string;
begin
  stAutoVisible := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberAdmin\AutoVisible', True) then
   begin
     stAutoVisible := FReg.ReadString('AutoVisible');
   end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stAutoVisible <> '' then chk_AutoVisible.Checked := True
 else chk_AutoVisible.Checked := False;
 
 result := True;
end;

procedure TfmAdminConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAdminConfig.btn_SaveClick(Sender: TObject);
begin
  if Chk_WindowsStart.Checked then CreateWindowStartRegKey('TelNumberAdmin',Application.ExeName)
  else DeleteWindowStartRegKey('TelNumberAdmin');
  if chk_AutoVisible.Checked then CreateAutoVisibleRegKey('AutoVisible','TRUE')
  else DeleteAutoVisibleKey('AutoVisible');
  showmessage('환경설정을 저장하였습니다.');

end;

function TfmAdminConfig.CreateAutoVisibleRegKey(aRegName,
  aValue: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   FReg.CreateKey('SOFTWARE\Zeron\TelNumberAdmin\AutoVisible');
   FReg.OpenKey('SOFTWARE\Zeron\TelNumberAdmin\AutoVisible',True);
   FReg.WriteString(aRegName, aValue);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmAdminConfig.CreateWindowStartRegKey(aRegName,
  aValue: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   //FReg.CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
   FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
   FReg.WriteString(aRegName, aValue);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmAdminConfig.DeleteAutoVisibleKey(aRegKey: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   //FReg.CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberAdmin', false)then
      FReg.DeleteKey(aRegKey);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmAdminConfig.DeleteWindowStartRegKey(aRegName: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   //FReg.CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
   FReg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', false);
   FReg.DeleteValue(aRegName);//WriteString('ktamsReboot',sRegPath);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmAdminConfig.WindowsStartConfigSet: Boolean;
var
  FReg : TRegistry;
  stValue : string;
begin
  stValue := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True) then
     stValue := FReg.ReadString('TelNumberAdmin');
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stValue <> '' then Chk_WindowsStart.Checked := True
 else Chk_WindowsStart.Checked := False;
 
 result := True;
end;

procedure TfmAdminConfig.FormCreate(Sender: TObject);
begin
  WindowsStartConfigSet;
  AutoVisibleConfigSet;

end;

end.
