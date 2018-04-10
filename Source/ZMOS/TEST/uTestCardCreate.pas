unit uTestCardCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Gauges;

type
  TfmTestCardCreate = class(TForm)
    ADOExec: TADOQuery;
    Label1: TLabel;
    ed_cardCount: TEdit;
    Label2: TLabel;
    ed_cardLen: TEdit;
    Gauge1: TGauge;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    Function insertIntoTB_EMPloyee(aCompanyCode,aEmCode,aEmName:string):Boolean;
    Function InsertIntoTB_CARD(aCompanyCode,aEmCode,aCardNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmTestCardCreate: TfmTestCardCreate;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmTestCardCreate.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfmTestCardCreate.SpeedButton1Click(Sender: TObject);
var
  i : integer;
  ncardCount : integer;
  nCardLen : integer;
begin
  if Not Isdigit(ed_cardCount.Text) then
  begin
    showmessage('카드건수는 숫자만 입력하세요.');
    Exit;
  end;
  if Not Isdigit(ed_cardLen.Text) then
  begin
    showmessage('카드길이는 숫자만 입력하세요.');
    Exit;
  end;
  nCardCount := strtoint(ed_cardCount.Text);
  nCardLen := strtoint(ed_cardLen.Text);

  Gauge1.MaxValue := nCardCount;
  Gauge1.Progress := 0;
  for i:=1 to nCardCount do
  begin
    insertIntoTB_EMPloyee('001',inttostr(i),FillZeroNumber(i,9));
    InsertIntoTB_CARD('001',inttostr(i),FillZeroNumber(i,nCardLen));
    Gauge1.Progress := i;
    Application.ProcessMessages;
  end;
  showmessage('생성완료');
end;

function TfmTestCardCreate.InsertIntoTB_CARD(aCompanyCode, aEmCode,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_CARD( ';
  stSql := stSql + ' CA_CARDNO,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmTestCardCreate.insertIntoTB_EMPloyee(aCompanyCode, aEmCode,
  aEmName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE( ';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EM_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aEmName + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
