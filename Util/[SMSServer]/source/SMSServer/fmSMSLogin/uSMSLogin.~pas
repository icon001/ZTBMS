unit uSMSLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uSubForm, CommandArray,ADODB,ActiveX;

type
  TfmSMSLogin = class(TfmASubForm)
    edUserID: TEdit;
    edPassword: TEdit;
    btn_Login: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_LoginClick(Sender: TObject);
    procedure edUserIDKeyPress(Sender: TObject; var Key: Char);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSMSLogin: TfmSMSLogin;

implementation

uses uDataModule1;

{$R *.dfm}

procedure TfmSMSLogin.btn_CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSMSLogin.btn_LoginClick(Sender: TObject);
var
  TempAdoQuery : TADOQuery;
  stSql : string;
begin
  Try
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      with  TempAdoQuery  do
      begin
        stSql := 'Select * from TB_ADMIN ';
        stSql := stSql + ' Where AD_USERID = ''' + Trim(edUserID.text) + ''' ';
        stSql := stSql + ' AND AD_USERPW = ''' + Trim(edPassword.text) + ''' ';
        Close;
        SQL.Clear;
        SQL.Text := stSql;

        Try
          Open;
        Except
           showmessage('Select Error!!');
           Exit;
        End;
        if RecordCount < 1 then
        begin
          showmessage('계정이 없거나 비밀번호가 틀립니다.');
          Exit;
        end;
        if FindField('AD_MASTER').AsString <> 'Y' then
        begin
          showmessage('관리 권한이 없습니다.');
          Exit;
        end;
        self.FindSubForm('Main').FindCommand('DATA').Params.Values['PARAM'] := 'LOGIN';
        self.FindSubForm('Main').FindCommand('DATA').Params.Values['VALUE'] := 'TRUE';
        self.FindSubForm('Main').FindCommand('DATA').Execute;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
    Close;
  Except
    Exit;
  End;

end;

procedure TfmSMSLogin.edUserIDKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    edPassword.SetFocus;
  end;

end;

procedure TfmSMSLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    key := #0;
    btn_LoginClick(self);
  end;

end;

end.
