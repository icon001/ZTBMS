unit uLogin;
 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, StdCtrls,ADODB,ActiveX, DB;

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
    class Function GetObject:TLogin;   //�ڱ��ڽ��� ã�°�  class �� ������������ ��밡��
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
    ADOQuery: TADOQuery;
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
  uDataModule1,DIMime;

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
begin

  TLogin.GetObject.Logined  := False ;
  with ADOQuery do
  begin
    stSql := 'select * from TB_CURRENTDAEMON ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
    stSql := stSql + ' and CU_STATECODE = ''Password''';
    stSql := stSql + ' and CU_STATEVALUE = ''' + MimeEncodeString(edPassword.Text) + '''';

    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('�����ͺ��̽� ���� ����');
      Exit;
    End;

    if RecordCount < 1 then
    begin
      showmessage('��й�ȣ�� ���� �ʽ��ϴ�.');
      Exit;
    end;
  end;
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
