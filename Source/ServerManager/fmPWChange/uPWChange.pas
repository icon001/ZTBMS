unit uPWChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons;

type
  TfmPWChange = class(TForm)
    PageControl1: TPageControl;
    Tab_Message: TTabSheet;
    Tab_PWChange: TTabSheet;
    chk_Update: TCheckBox;
    btn_PWChange: TSpeedButton;
    btn_Cancel: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel2: TPanel;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    ed_PW1: TEdit;
    ed_PW2: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_PWChangeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ActiveTap : integer;
    LoginID : string;
    UpdateTime : string;
  end;

var
  fmPWChange: TfmPWChange;
  

implementation
uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmPWChange.FormShow(Sender: TObject);
begin
  if ActiveTap = 0 then
  begin
    Tab_Message.TabVisible := True;
    Tab_PWChange.TabVisible := False;
    stringReplace(Panel2.Caption,'$DATE',inttostr(G_nPWUpdateTime),[rfReplaceAll]);
  end else
  begin
    Tab_Message.TabVisible := False;
    Tab_PWChange.TabVisible := True;
  end;
end;

procedure TfmPWChange.btn_CancelClick(Sender: TObject);
var
  dtUpdateTime : TDateTime;
  stSql : string;
begin
  if chk_Update.Checked then
  begin
    dtUpdateTime := strToDate(copy(UpdateTime,1,4) + '-' + copy(UpdateTime,5,2) + '-' + copy(UpdateTime,7,2)) + 7;
    stSql := ' Update TB_ADMIN set AD_UPDATETIME = ''' + FormatDateTime('yyyymmddhhnnss',dtUpdateTime) + ''' ';
    stSql := stSql + ' Where AD_USERID = ''' + LoginID + ''' ';
    DataModule1.ProcessExecSQL(stSql);
  end;
  Close;
end;

procedure TfmPWChange.btn_PWChangeClick(Sender: TObject);
begin
  Tab_Message.TabVisible := False;
  Tab_PWChange.TabVisible := True;
end;

procedure TfmPWChange.btn_SaveClick(Sender: TObject);
var
  stSql : string;
begin
  if ed_PW1.Text <> ed_PW2.Text then
  begin
    showmessage('�űԺ�й�ȣ�� Ȯ�� ��й�ȣ�� ���� Ʋ���ϴ�.');
    Exit;
  end;
  if G_bPWLengthUse then
  begin
    if Length(ed_PW1.Text) < G_nPWLength then
    begin
      showmessage('��й�ȣ�� ' + inttostr(G_nPWLength) + '�� �̻� ��� �ϼž� �մϴ�.');
      Exit;
    end;
  end;
  if G_bPWCharUse then
  begin
    if Not SpecialCharUse(ed_PW1.Text) then
    begin
      showmessage('��й�ȣ�� ����/����/Ư������(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')�� �����ϼž� �մϴ�.');
      Exit;
    end;
    if Not IntegerCharUse(ed_PW1.Text) then
    begin
      showmessage('��й�ȣ�� ����/����/Ư������(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')�� �����ϼž� �մϴ�.');
      Exit;
    end;
    if Not StringCharUse(ed_PW1.Text) then
    begin
      showmessage('��й�ȣ�� ����/����/Ư������(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')�� �����ϼž� �մϴ�.');
      Exit;
    end;
  end;
  stSql := ' Update TB_ADMIN set AD_UPDATETIME = ''' + FormatDateTime('yyyymmddhhnnss',Now) + ''', ';
  stSql := stSql + ' AD_USERPW = ''' + ed_PW1.Text + ''' ';
  stSql := stSql + ' Where AD_USERID = ''' + LoginID + ''' ';
  DataModule1.ProcessExecSQL(stSql);
  Close;
end;

end.
