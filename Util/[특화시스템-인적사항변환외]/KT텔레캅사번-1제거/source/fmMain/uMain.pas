unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, DB, ADODB,
  ActiveX, Gauges, ComCtrls;

type
  TfmMain = class(TForm)
    OpenDialog1: TOpenDialog;
    GroupBox3: TGroupBox;
    btn_WorkBranch: TBitBtn;
    GroupBox4: TGroupBox;
    btn_targetAdoConnect: TSpeedButton;
    ed_Host: TEdit;
    rg_dbtype: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    ed_Port: TEdit;
    Label7: TLabel;
    ed_Userid: TEdit;
    Label8: TLabel;
    ed_Passwd: TEdit;
    TargetADOConnection: TADOConnection;
    Label9: TLabel;
    ed_DBName: TEdit;
    targetTempADOQuery: TADOQuery;
    targetADOExecQuery: TADOQuery;
    StatusBar1: TStatusBar;
    btnClose: TBitBtn;
    Gauge1: TGauge;
    ADOQuery: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_targetAdoConnectClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btn_WorkBranchClick(Sender: TObject);
  private
    { Private declarations }
    Function targetAdoConnect:Boolean;
  private
    Function ProcessExecSQL(aSql:string;bUpdateResult:Boolean=False):Boolean;
  public
    { Public declarations }
    procedure PersonDataConversion;
    Function ChangeEmpCode(aCompanyCode,aEmCode:string):Boolean;
    Function UpdateTB_EMPLOYEEChange(aCompanyCode,aEmCode,aNewEmCode:string):Boolean;
    Function UpdateTB_CARDChange(aCompanyCode,aEmCode,aNewEmCode:string):Boolean;
    Function UpdateTB_ATEVENTChange(aCompanyCode,aEmCode,aNewEmCode:string):Boolean;
    Function UpdateTB_FOODEVENTChange(aCompanyCode,aEmCode,aNewEmCode:string):Boolean;
    Function DeleteTB_EMPLOYEE(aCompanyCode,aEmCode:string):Boolean;
  end;

var
  fmMain: TfmMain;
  GROUPCODE : string;

implementation

uses
  uLomosUtil;

{$R *.dfm}


procedure TfmMain.FormActivate(Sender: TObject);
begin
  btn_WorkBranch.Enabled := False;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin

  GROUPCODE := '1234567890';
end;

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_targetAdoConnectClick(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  btn_WorkBranch.Enabled := False;
  if targetAdoConnect then
  begin
    btn_WorkBranch.Enabled := True;
  end else
  begin
    showmessage('데이터베이스 접속실패');
  end;
end;

function TfmMain.targetAdoConnect: Boolean;
var
  conStr : wideString;
begin
  result := False;
  if rg_dbtype.ItemIndex = 0 then  //Mssql
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_Passwd.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_Userid.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_Host.Text  + ',' + ed_Port.Text;
  end else if rg_dbtype.ItemIndex = 1 then   //PostGresql
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + ed_Host.Text + ';'   ;
    conStr := constr + 'location=' + ed_DBName.Text + ';';
    conStr := constr + 'User Id='+ ed_Userid.Text + ';';
    conStr := constr + 'password=' + ed_Passwd.Text;
  end  else
  begin
    showmessage('데이터베이스 타입을 선택 하세요.');
    Exit;
  end;
  with TargetADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;

  result := True;
end;


function TfmMain.ProcessExecSQL(aSql: string;bUpdateResult:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := TargetADOConnection;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
    end;
  end else
  begin
    Result:= True;
  end;
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.btn_WorkBranchClick(Sender: TObject);
begin
  PersonDataConversion;
end;

procedure TfmMain.PersonDataConversion;
var
  stSql : string;
begin
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE Like ''%-1'' ';

  Try
    with ADOQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then
      begin
        showmessage('변환할 데이터가 없습니다.');
        Exit;
      end;
      Gauge1.MaxValue := recordcount;
      Gauge1.Progress := 0;
      While Not Eof do
      begin
        ChangeEmpCode(FindField('CO_COMPANYCODE').AsString,FindField('EM_CODE').AsString);
        Gauge1.Progress := Gauge1.Progress + 1;
        Next;
      end;
    end;

  Except
    Exit;
  End;

end;

function TfmMain.ChangeEmpCode(aCompanyCode, aEmCode: string): Boolean;
var
  stNewEmCode : string;
begin
  stNewEmCode := stringReplace(aEmCode,'-1','',[rfReplaceAll]);
  UpdateTB_EMPLOYEEChange(aCompanyCode,aEmCode,stNewEmCode);
  UpdateTB_CARDChange(aCompanyCode,aEmCode,stNewEmCode);
  UpdateTB_ATEVENTChange(aCompanyCode,aEmCode,stNewEmCode);
  UpdateTB_FOODEVENTChange(aCompanyCode,aEmCode,stNewEmCode);
  DeleteTB_EMPLOYEE(aCompanyCode,aEmCode);
end;

function TfmMain.DeleteTB_EMPLOYEE(aCompanyCode, aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_ATEVENTChange(aCompanyCode, aEmCode,
  aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATEVENT set EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_CARDChange(aCompanyCode, aEmCode,
  aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_EMPLOYEEChange(aCompanyCode, aEmCode,
  aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_FOODEVENTChange(aCompanyCode, aEmCode,
  aNewEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_FOODEVENT set EM_CODE = ''' + aNewEmCode + ''' ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := ProcessExecSQL(stSql);

end;

end.
