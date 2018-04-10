unit uLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,ADODB,ActiveX;

type

  TLogin = class(TComponent)
  private
    FLogined: Boolean;
    class function FindSelf:TComponent;
    procedure SetLogined(const Value: Boolean);
    { Private declarations }
  public
    { Public declarations }
    Procedure ShowLoginDlg;
    class Function GetObject:TLogin;   //자기자신을 찾는것  class 는 폼생성전에도 사용가능
  Published
    { Published declarations }
    Property Logined : Boolean read FLogined write SetLogined;
  end;

  TfmLogin = class(TForm)
    Label1: TLabel;
    edPassword: TEdit;
    Bevel1: TBevel;
    sbLogin: TSpeedButton;
    sbCancel: TSpeedButton;
    procedure sbCancelClick(Sender: TObject);
    procedure sbLoginClick(Sender: TObject);
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
  uDataModule1,DIMime,
  uCommonSql;

{$R *.dfm}

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

procedure TfmLogin.sbLoginClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  TLogin.GetObject.Logined  := False ;
  with TempAdoQuery do
  begin
    stSql := CommonSql.GetDaemonPasswordSelect(MimeEncodeString(edPassword.Text));
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      TempAdoQuery.free;
      CoUninitialize;
      showmessage('데이터베이스 오픈 실패');
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      showmessage('비밀번호가 맞지 않습니다.');
      Exit;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  TLogin.GetObject.Logined  := True ;
  Close;
end;

procedure TfmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    sbLoginClick(Self);
  end;
end;

end.
