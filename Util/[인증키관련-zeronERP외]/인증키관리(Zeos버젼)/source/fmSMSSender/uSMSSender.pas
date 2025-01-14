unit uSMSSender;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfmSMSSender = class(TForm)
    Label1: TLabel;
    ed_PhoneNumber: TEdit;
    Label2: TLabel;
    mem_Message: TMemo;
    Button1: TButton;
    Label3: TLabel;
    lb_count: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure mem_MessageKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPhoneNumber: string;
    procedure SetPhoneNumber(const Value: string);
    { Private declarations }
  public
    { Public declarations }
    property PhoneNumber : string read FPhoneNumber write SetPhoneNumber;
  end;

var
  fmSMSSender: TfmSMSSender;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

{ TfmSMSSender }

procedure TfmSMSSender.SetPhoneNumber(const Value: string);
begin
  FPhoneNumber := Value;
  ed_PhoneNumber.Text := Value;
end;

procedure TfmSMSSender.Button1Click(Sender: TObject);
var
  stSql : string;
  stPhoneNumber : string;
begin
  stPhoneNumber := ed_PhoneNumber.Text;
  stPhoneNumber := stringReplace(stPhoneNumber,'-','',[rfReplaceAll]);
  if Not isDigit(stPhoneNumber) then
  begin
    showmessage('전화번호가 잘못 되었습니다.');
    Exit;
  end;
  if Length(stPhoneNumber) <> 11 then
  begin
    showmessage('전화번호가 휴대폰이 아닙니다.');
    Exit;
  end;

  if mem_Message.Text = '' then
  begin
    showmessage('전송메시지를 입력 하세요.');
    Exit;
  end;

  if Length(mem_Message.Text) > 70 then
  begin
    showmessage('메시지는 70자 이내로 입력 하세요.');
    Exit;
  end;

  stSql := ' Insert Into TB_SMS( ';
  stSql := stSql + ' MA_USERID,';
  stSql := stSql + ' SM_DATE,';
  stSql := stSql + ' SM_MESSAGE,';
  stSql := stSql + ' SM_PHONENUM,';
  stSql := stSql + ' SM_STATE ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + Master_ID + ''', ';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnsszzz',Now) + ''', ';
  stSql := stSql + '''' + mem_Message.Text + ''', ';
  stSql := stSql + '''' + stPhoneNumber + ''', ';
  stSql := stSql + '''N'') ';

  if Not dmDB.ProcessExecSQL(stSql) then
  begin
    showmessage('메시지전송에 실패했습니다.');
    Exit;
  end;
  Close;
end;

procedure TfmSMSSender.mem_MessageKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  lb_count.Caption := inttostr(Length(mem_Message.Text));
end;

end.
