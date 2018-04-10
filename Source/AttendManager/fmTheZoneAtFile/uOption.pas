unit uOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,IniFiles;

type
  TfmTheZoneOption = class(TForm)
    Label1: TLabel;
    ed_emcodeLen: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_AtGubun: TEdit;
    Label4: TLabel;
    btn_save: TButton;
    btn_cancel: TButton;
    procedure btn_saveClick(Sender: TObject);
  private
    FSave: Boolean;
    FEmCodeLen: integer;
    FAtGubunLen: integer;
    procedure SetAtGubunLen(const Value: integer);
    procedure SetEmCodeLen(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property EmCodeLen : integer read FEmCodeLen write SetEmCodeLen;
    property AtGubunLen : integer read FAtGubunLen write SetAtGubunLen;
    property Save : Boolean read FSave write FSave;
  end;

var
  fmTheZoneOption: TfmTheZoneOption;

implementation

uses
  uDataModule1;
{$R *.dfm}

{ TfmTheZoneOption }

procedure TfmTheZoneOption.SetAtGubunLen(const Value: integer);
begin
  if FAtGubunLen = Value then Exit;
  FAtGubunLen := Value;
  ed_AtGubun.Text := inttostr(Value);
end;

procedure TfmTheZoneOption.SetEmCodeLen(const Value: integer);
begin
  if FEmCodeLen = Value then Exit;
  FEmCodeLen := Value;
  ed_emcodeLen.Text := inttostr(Value);
end;

procedure TfmTheZoneOption.btn_saveClick(Sender: TObject);
var
  ini_fun : TiniFile;
begin
  ini_fun := TiniFile.Create(ExeFolder + '\thezoneatfile.ini');
  ini_fun.WriteString('환경설정','EMCODELEN',ed_emcodeLen.Text);
  ini_fun.WriteString('환경설정','ATGubun',ed_AtGubun.Text);
  ini_fun.Free;
end;

end.
