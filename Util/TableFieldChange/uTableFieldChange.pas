unit uTableFieldChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    chk_Company: TCheckBox;
    ed_companycode: TEdit;
    chk_Jijum: TCheckBox;
    ed_jijumcode: TEdit;
    ed_departcode: TEdit;
    chk_Depart: TCheckBox;
    chk_posi: TCheckBox;
    ed_posicode: TEdit;
    chk_empcode: TCheckBox;
    ed_employeecode: TEdit;
    btn_Field: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btn_FieldClick(Sender: TObject);
  private
    { Private declarations }
    procedure CompanyCodeChange;
    procedure JijumCodeChange;
    procedure DepartCodeChange;
    procedure PosiCodeChange;
    procedure EmployeeCodeChange;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uDataBaseConfig,
  uDataModule1,
  uLomosUtil, uPostGreSql, uMssql, uFireBird, uMDBSql;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      bApplicationTerminate := True;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

end;

procedure TForm1.btn_FieldClick(Sender: TObject);
begin
  btn_Field.Enabled := False;
  if chk_Company.Checked then CompanyCodeChange;
  if chk_Jijum.Checked then JijumCodeChange;
  if chk_Depart.Checked then DepartCodeChange;
  if chk_posi.Checked then PosiCodeChange;
  if chk_empcode.Checked then EmployeeCodeChange;
  showmessage('필드적용 완료');
  btn_Field.Enabled := True;
end;

procedure TForm1.CompanyCodeChange;
var
  stLength : string;
  stSql : string;
begin
  if Not isDigit(ed_companycode.Text) then
  begin
    showmessage('회사코드 길이는 반드시 숫자로 입력하세요.');
    Exit;
  end;
  if strtoint(ed_companycode.Text) < 3 then
  begin
    showmessage('회사코드 길이는 반드시 3보다 큰 숫자를 입력하세요.');
    Exit;
  end;
  stLength := ed_companycode.Text;

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATDAYSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATDAYSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATDAYSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATDAYSUMMARYCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEMPEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEMPEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEMPEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEMPEXTRACompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATEVENTCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHEXTRACompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHEXTRACompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATMONTHSUMMARYCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATMONTHSUMMARYCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ATVACATIONCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ATVACATIONCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ATVACATIONCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ATVACATIONCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_BASEPAYCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_BASEPAYCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_BASEPAYCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_BASEPAYCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_CARDCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_CARDCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_CARDCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_CARDCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPHISCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPHISCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPHISCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPHISCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEECompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEECompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEECompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEECompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODEVENTCompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODEVENTCompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_FOODGRADECompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_FOODGRADECompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_FOODGRADECompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_FOODGRADECompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSICompanyCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSICompanyCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSICompanyCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSICompanyCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TForm1.DepartCodeChange;
var
  stLength : string;
  stSql : string;
begin
  if Not isDigit(ed_departcode.Text) then
  begin
    showmessage('부서코드 길이는 반드시 숫자로 입력하세요.');
    Exit;
  end;
  if strtoint(ed_departcode.Text) < 3 then
  begin
    showmessage('부서코드 길이는 반드시 3보다 큰 숫자를 입력하세요.');
    Exit;
  end;
  stLength := ed_departcode.Text;

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTDepartCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTDepartCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTDepartCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTDepartCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINDepartCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINDepartCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINDepartCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINDepartCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYDepartCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYDepartCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYDepartCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEDepartCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEDepartCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEDepartCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEDepartCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TForm1.EmployeeCodeChange;
var
  stLength : string;
  stSql : string;
begin
  if Not isDigit(ed_employeecode.Text) then
  begin
    showmessage('사원코드 길이는 반드시 숫자로 입력하세요.');
    Exit;
  end;
  if strtoint(ed_employeecode.Text) < 30 then
  begin
    showmessage('사원코드 길이는 반드시 30보다 큰 숫자를 입력하세요.');
    Exit;
  end;
  stLength := ed_employeecode.Text;

end;

procedure TForm1.JijumCodeChange;
var
  stLength : string;
  stSql : string;
begin
  if Not isDigit(ed_jijumcode.Text) then
  begin
    showmessage('지점코드 길이는 반드시 숫자로 입력하세요.');
    Exit;
  end;
  if strtoint(ed_jijumcode.Text) < 3 then
  begin
    showmessage('지점코드 길이는 반드시 3보다 큰 숫자를 입력하세요.');
    Exit;
  end;
  stLength := ed_jijumcode.Text;

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ACCESSEVENTJijumCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ACCESSEVENTJijumCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ACCESSEVENTJijumCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ACCESSEVENTJijumCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINJijumCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINJijumCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINJijumCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINJijumCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ADMINCOMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ADMINCOMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_ADMINCOMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ADMINCOMPANYJijumCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_COMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_COMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_COMPANYJijumCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_COMPANYJijumCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEJijumCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEJijumCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEJijumCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEJijumCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TForm1.PosiCodeChange;
var
  stLength : string;
  stSql : string;
begin
  if Not isDigit(ed_posicode.Text) then
  begin
    showmessage('직위코드 길이는 반드시 숫자로 입력하세요.');
    Exit;
  end;
  if strtoint(ed_posicode.Text) < 3 then
  begin
    showmessage('직위코드 길이는 반드시 3보다 큰 숫자를 입력하세요.');
    Exit;
  end;
  stLength := ed_posicode.Text;

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_EMPLOYEEPosiCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_EMPLOYEEPosiCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_EMPLOYEEPosiCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_EMPLOYEEPosiCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

  if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_POSIPosiCodeChange(stLength)
  else if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_POSIPosiCodeChange(stLength)
  else if DBTYPE = 'MSSQL' then stSql := MSSql.AlterTB_POSIPosiCodeChange(stLength)
  else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_POSIPosiCodeChange(stLength)
  else Exit;
  DataModule1.ProcessExecSQL(stSql);

end;

end.
