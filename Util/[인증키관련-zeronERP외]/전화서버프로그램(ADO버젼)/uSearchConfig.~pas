unit uSearchConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,Registry, StdCtrls, Buttons;

type
  TfmConfig = class(TForm)
    GroupBox1: TGroupBox;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    Chk_WindowsStart: TCheckBox;
    chk_PortOpen: TCheckBox;
    Label1: TLabel;
    ed_Comport: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    Function DeleteWindowStartRegKey(aRegName:string):Boolean;
    Function CreateWindowStartRegKey(aRegName,aValue:string):Boolean;
    Function CreatePortOpenRegKey(aRegName,aValue:string):Boolean;
    Function DeletePortOpenKey(aRegKey:string):Boolean;
    Function WindowsStartConfigSet:Boolean;
    Function PortOpenConfigSet:Boolean;
  public
    { Public declarations }
  end;

var
  fmConfig: TfmConfig;

implementation

{$R *.dfm}

procedure TfmConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConfig.btn_SaveClick(Sender: TObject);
begin
  if Chk_WindowsStart.Checked then CreateWindowStartRegKey('TelNumberSearch',Application.ExeName)
  else DeleteWindowStartRegKey('TelNumberSearch');
  if chk_PortOpen.Checked then CreatePortOpenRegKey('PortOpen',ed_Comport.Text)
  else DeletePortOpenKey('PortOpen');
  showmessage('환경설정을 저장하였습니다.');
end;

function TfmConfig.CreatePortOpenRegKey(aRegName, aValue: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   FReg.CreateKey('SOFTWARE\Zeron\TelNumberSearch\PortOpen');
   FReg.OpenKey('SOFTWARE\Zeron\TelNumberSearch\PortOpen',True);
   FReg.WriteString(aRegName, 'True');
   FReg.WriteString('PortNum', aValue);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmConfig.CreateWindowStartRegKey(aRegName,
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

function TfmConfig.DeletePortOpenKey(aRegKey: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   //FReg.CreateKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run');
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberSearch', false)then
      FReg.DeleteKey(aRegKey);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

function TfmConfig.DeleteWindowStartRegKey(aRegName: string): Boolean;
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

procedure TfmConfig.FormActivate(Sender: TObject);
begin
  WindowsStartConfigSet;
  PortOpenConfigSet;
end;

function TfmConfig.PortOpenConfigSet: Boolean;
var
  FReg : TRegistry;
  stPortOpen : string;
  stPortNum : string;
begin
  stPortOpen := '';
  stPortNum := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Zeron\TelNumberSearch\PortOpen', True) then
   begin
     stPortOpen := FReg.ReadString('PortOpen');
     stPortNum := FReg.ReadString('PortNum');
   end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stPortOpen <> '' then chk_PortOpen.Checked := True
 else chk_PortOpen.Checked := False;
 ed_Comport.Text := stPortNum;
 
 result := True;
end;

function TfmConfig.WindowsStartConfigSet: Boolean;
var
  FReg : TRegistry;
  stValue : string;
begin
  stValue := '';
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if FReg.OpenKey('SOFTWARE\Microsoft\Windows\CurrentVersion\Run', True) then
     stValue := FReg.ReadString('TelNumberSearch');
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 if stValue <> '' then Chk_WindowsStart.Checked := True
 else Chk_WindowsStart.Checked := False;
 
 result := True;

end;

end.
