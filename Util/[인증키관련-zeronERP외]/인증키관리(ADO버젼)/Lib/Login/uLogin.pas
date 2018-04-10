unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls,DB, ADODB,ActiveX;

type

  TLogin = class(TComponent)
  private
    FLogined: Boolean;
    FSYSADMIN: Boolean;
    procedure SetLogined(const Value: Boolean);
    class function FindSelf:TComponent;
    { Private declarations }
  public
    { Public declarations }
    EmpSn : Integer;    //사원번호
    ProgIDs,UserID,UserName,CompanyCode,DepartCode,Grade : String;
    Procedure ShowLoginDlg;
    procedure SetSysAdmin(const Value: Boolean);
    class Function GetObject:TLogin;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
    Property SYSADMIN : Boolean read FSYSADMIN write SetSYSADMIN;
  Published
    { Published declarations }
    Property Logined : Boolean read FLogined write SetLogined;


  end;

  TfmLogin = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Bevel1: TBevel;
    edPassword: TEdit;
    edUserID: TEdit;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    ADOQuery1: TADOQuery;
    chk_AutoLogin: TCheckBox;
    procedure sbLoginClick(Sender: TObject);
    procedure sbCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUserIDKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;

implementation

uses
  uLomosUtil,
  uDataModule,
  IniFiles;

{$R *.dfm}


procedure TfmLogin.sbLoginClick(Sender: TObject);
var
  stUserName: String;
  stSql: String;
  TempAdoQuery : TADOQuery;
  ini_fun : TiniFile;
begin

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection1;

  TLogin.GetObject.ProgIDs:=''; //사용가능한 프로그램 목록 초기화

  with  TempAdoQuery  do
  begin
    stSql := 'Select * from TB_AUTHADMIN ';
    stSql := stSql + ' Where AD_USERID = ''' + Trim(edUserID.text) + ''' ';
    stSql := stSql + ' AND AD_USERPW = ''' + Trim(edPassword.text) + ''' ';
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
       TLogin.GetObject.Logined  := False ;
       TempAdoQuery.Free;
       Exit;
    End;

    if RecordCount < 1 then
    begin
        Application.messagebox(PChar('사용자 정보가 틀립니다.'),PChar(Application.MainForm.Caption),mb_OK);
        TLogin.GetObject.Logined  := False ;
        TempAdoQuery.Free;
        Exit;
    end;

    stUserName:=   FindField('AD_USERNAME').asString;
  end;

  //로그인 성공시
  TLogin.GetObject.UserID := edUserID.text;
  TLogin.GetObject.UserName := stUserName;
  TLogin.GetObject.Logined  := True ;

  TempAdoQuery.Free;
  Close;

  ini_fun := TiniFile.Create(ExeFolder + '\PGKEY.INI');

  if chk_AutoLogin.Checked then
  begin
    ini_fun.WriteString('CONFIG','AUTOSTART','TRUE');
    ini_fun.WriteString('CONFIG','USERID',edUserID.text);
    ini_fun.WriteString('CONFIG','USERNAME',stUserName);
  end else
  begin
    ini_fun.WriteString('CONFIG','AUTOSTART','FALSE');
  end;
end;

{ TLogin }

class function TLogin.FindSelf: TComponent;
var
  Loop:Integer;
begin
  Result:=Nil;
  for Loop:=0 to Application.ComponentCount-1 do begin
      if Application.Components[Loop] is TLogin then begin
          Result:= Application.Components[Loop];
          Break;
      end;
  end;
end;

class function TLogin.GetObject: TLogin;
begin
   If FindSelf = Nil then TLogin.Create(Application);
   Result := TLogin(FindSelf);

end;

procedure TLogin.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
end;

procedure TLogin.SetSYSADMIN(const Value: Boolean);
begin
  FSYSADMIN := Value;
end;

procedure TLogin.ShowLoginDlg;
begin
  FLogined := False;

  fmLogin:=TfmLogin.Create(Nil);
  Try
    fmLogin.ShowModal;
  Finally
    fmLogin.Free;
  End;
end;

procedure TfmLogin.sbCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLogin.FormCreate(Sender: TObject);
begin
  edUserID.Text:= '';
  edPassword.Text := '';
end;

procedure TfmLogin.edUserIDKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    edPassword.SetFocus;
  end;
end;

procedure TfmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
  begin
    key := #0;
    sbLogin.click;
  end;
end;

end.
