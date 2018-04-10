
unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, StdCtrls, Buttons,IniFiles, ComCtrls,
  Gauges, FolderDialog, RzButton, dbisamtb,ActiveX;

type
  TfmMain = class(TForm)
    ADOConnection: TADOConnection;
    Notebook1: TNotebook;
    pan_header: TPanel;
    pan_DBConfig: TPanel;
    gr_org: TGroupBox;
    btn_Close: TSpeedButton;
    Rd_DBType: TRadioGroup;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    ed_ServerIP: TEdit;
    ed_ServerPort: TEdit;
    ed_UserID: TEdit;
    ed_UserPW: TEdit;
    ed_DBName: TEdit;
    ADOExecQuery: TADOQuery;
    FolderDialog1: TFolderDialog;
    btn_Connect: TSpeedButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ed_orgEmCode: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cmb_CompanyCode1: TComboBox;
    cmb_CompanyCode2: TComboBox;
    Label3: TLabel;
    Label4: TLabel;
    ed_name: TEdit;
    btn_Change: TSpeedButton;
    Label5: TLabel;
    ed_emcode: TEdit;
    ADOQuery1: TADOQuery;
    Memo1: TMemo;
    procedure btn_CloseClick(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Rd_DBTypeClick(Sender: TObject);
    procedure ed_orgEmCodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_ChangeClick(Sender: TObject);
  private
    bClose :Boolean;
    CompanyCodeList : TStringList;
    { Private declarations }
    Function AdoConnect : Boolean;
    procedure LoadCompanyCode;
    Function searchEmployee(aCompanyCode,aorgEmCode:string):Boolean;
    Function DupCheckTB_Employee(aCompanyCode,aEmCode:string):Boolean;
  private
    Function UpdateTB_ACCESSEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_ATEMPEXTRA_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_ATEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_ATMONTHEXTRA_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_ATMONTHSUMMARY_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_ATVACATION_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_BASEPAY_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_CARD_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_EMPHIS_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_EMPLOYEE_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_FOODEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;
    Function UpdateTB_FOODGRADE_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uLomosUtil;
{$R *.dfm}

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Notebook1PageChanged(Sender: TObject);
begin
  pan_Header.Caption := NoteBook1.ActivePage;
end;

procedure TfmMain.btn_ConnectClick(Sender: TObject);
begin

  if Not AdoConnect then
  begin
    ShowMessage('데이터베이스 접속환경 설정이 잘못 되었습니다.');
    Exit;
  end;

  LoadCompanyCode;
  btn_Change.Enabled := True;
  GroupBox2.Enabled := True;
  GroupBox1.Enabled := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  bClose := False;
  Notebook1.PageIndex := 0;
  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Conv.ini');
  ed_ServerIP.Text  := ini_fun.ReadString('DB','ServerIP','127.0.0.1');
  ed_ServerPort.Text  := ini_fun.ReadString('DB','ServerPORT','1433');
  ed_DBName.Text  := ini_fun.ReadString('DB','DBName','');
  ed_UserID.Text  := ini_fun.ReadString('DB','UserID','');
  ed_UserPW.Text  := ini_fun.ReadString('DB','UserPW','');
  Rd_DBType.ItemIndex := ini_fun.ReadInteger('DB','DBTYPE',0);
  ini_fun.free;
  Rd_DBTypeClick(self);

  CompanyCodeList := TStringList.Create;

end;

function TfmMain.AdoConnect: Boolean;
var
  conStr : string;
begin
  result := False;
  conStr := '';
  if Rd_DBType.ItemIndex = 0 then
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    //conStr := 'Provider=PostgreSQL.1;';
    conStr := constr + 'Data Source=' + ed_ServerIP.Text + ';'   ;
    conStr := constr + 'location=' + ed_DBName.Text + ';';
    conStr := constr + 'User Id='+ ed_UserID.Text + ';';
    conStr := constr + 'password=' + ed_UserPW.Text;
  end else if Rd_DBType.ItemIndex = 1 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + ed_UserPW.Text + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + ed_UserID.Text + ';';
    conStr := constr + 'Initial Catalog=' + ed_DBName.Text + ';';
    conStr := constr + 'Data Source=' + ed_ServerIP.Text  + ',' + ed_ServerPort.Text;
  end;
  with ADOConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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



procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  ini_fun : TiniFile;
  stExeFolder : String;
begin
  bClose := True;
  CompanyCodeList.Free;

  stExeFolder  := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\Conv.ini');
  ini_fun.WriteString('DB','ServerIP',ed_ServerIP.Text);
  ini_fun.WriteString('DB','ServerPORT',ed_ServerPort.Text);
  ini_fun.WriteString('DB','DBName',ed_DBName.Text);
  ini_fun.WriteString('DB','UserID',ed_UserID.Text);
  ini_fun.WriteString('DB','UserPW',ed_UserPW.Text);
  ini_fun.WriteInteger('DB','DBTYPE',Rd_DBType.ItemIndex);
  ini_fun.free;


end;


procedure TfmMain.LoadCompanyCode;
var
  stSql : string;
begin
  cmb_CompanyCode1.Clear;
  cmb_CompanyCode2.Clear;
  CompanyCodeList.Clear;

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where co_gubun = ''1'' ';
  with ADOQuery1 do
  begin
    Close;
    sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      cmb_CompanyCode1.Items.Add(FindField('CO_NAME').AsString);
      cmb_CompanyCode2.Items.Add(FindField('CO_NAME').AsString);
      Next;
    end;
  end;
  if CompanyCodeList.Count > 0 then
  begin
    cmb_CompanyCode1.ItemIndex := 0;
    cmb_CompanyCode2.ItemIndex := 0;
  end;

end;

procedure TfmMain.Rd_DBTypeClick(Sender: TObject);
begin
  if Rd_DBType.ItemIndex = 0 then
  begin
    Label7.Visible:= False;
    ed_ServerPort.Visible := False;
  end else
  begin
    Label7.Visible:= True;
    ed_ServerPort.Visible := True;
  end;

end;

procedure TfmMain.ed_orgEmCodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  stCompanyCode : string;
begin
  if cmb_CompanyCode1.ItemIndex < 0 then
  begin
    showmessage('회사코드를 선택 하셔야 합니다.');
    Exit;  
  end;
  stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  if ed_orgEmCode.Text <> '' then
  begin
    searchEmployee(stCompanyCode,ed_orgEmCode.Text);
  end;
end;

function TfmMain.searchEmployee(aCompanyCode, aorgEmCode: string): Boolean;
var
  stSql : string;
begin
  ed_name.Text := '';
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aorgEmCode + ''' ';

  with ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    ed_name.Text := FindField('EM_NAME').AsString;
    if ed_name.Text = '' then ed_name.Text := '  ';
  end;

end;

procedure TfmMain.btn_ChangeClick(Sender: TObject);
var
  stOrgCompanyCode : string;
  stTargetCompanyCode : string;
  stOrgEmCode : string;
  stTargetEmCode : string;

begin
  Memo1.Lines.Clear;

  if ed_name.Text = '' then
  begin
    showmessage('정확한 사번을 입력 하세요.');
    Exit;
  end;

  if cmb_CompanyCode1.ItemIndex < 0 then
  begin
    showmessage('변경전 회사를 선택 하세요.');
    Exit;
  end;

  if ed_orgEmCode.Text = '' then
  begin
    showmessage('변경전 사번을 입력 하세요.');
    Exit;
  end;

  if cmb_CompanyCode2.ItemIndex < 0 then
  begin
    showmessage('변경후 회사를 선택 하세요.');
    Exit;
  end;

  if ed_emcode.Text = '' then
  begin
    showmessage('변경후 사번을 입력 하세요.');
    Exit;
  end;

  stOrgCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  stTargetCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex];
  stOrgEmCode := ed_orgEmCode.Text;
  stTargetEmCode := ed_emcode.Text;

  if DupCheckTB_Employee(stTargetCompanyCode,stTargetEmCode) then
  begin
    showmessage('변경 후 사번이 이미 등록되어 있는 사번입니다. 확인 후 작업 하세요.');
    Exit;
  end;

  btn_Change.Enabled := false;

  UpdateTB_ACCESSEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_ATEMPEXTRA_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_ATEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_ATMONTHEXTRA_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_ATMONTHSUMMARY_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_ATVACATION_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_BASEPAY_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_CARD_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_EMPHIS_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_EMPLOYEE_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_FOODEVENT_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);
  UpdateTB_FOODGRADE_EMCODE(stOrgCompanyCode,stOrgEmCode,stTargetCompanyCode,stTargetEmCode);

  memo1.Lines.Add('사번 수정 완료');
  btn_Change.Enabled := TRUE;

end;

function TfmMain.DupCheckTB_Employee(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' +  aEmCode + ''' ';

  with ADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;


end;

function TfmMain.UpdateTB_ACCESSEVENT_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ACCESSEVENT ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ACCESSEVENT:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ACCESSEVENT:수정 완료');

end;

function TfmMain.UpdateTB_ATEMPEXTRA_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ATEMPEXTRA ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ATEMPEXTRA:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ATEMPEXTRA:수정 완료');

end;

function TfmMain.UpdateTB_ATEVENT_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ATEVENT ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ATEVENT:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ATEVENT:수정 완료');
end;

function TfmMain.UpdateTB_ATMONTHEXTRA_EMCODE(stOrgCompanyCode,
  stOrgEmCode, stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ATMONTHEXTRA ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ATMONTHEXTRA:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ATMONTHEXTRA:수정 완료');
end;

function TfmMain.UpdateTB_ATMONTHSUMMARY_EMCODE(stOrgCompanyCode,
  stOrgEmCode, stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ATMONTHSUMMARY ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ATMONTHSUMMARY:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ATMONTHSUMMARY:수정 완료');
end;

function TfmMain.UpdateTB_ATVACATION_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_ATVACATION ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_ATVACATION:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_ATVACATION:수정 완료');
end;

function TfmMain.UpdateTB_BASEPAY_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_BASEPAY ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_BASEPAY:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_BASEPAY:수정 완료');
end;

function TfmMain.UpdateTB_CARD_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_CARD ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_CARD:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_CARD:수정 완료');
end;

function TfmMain.UpdateTB_EMPHIS_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_EMPHIS ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_EMPHIS:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_EMPHIS:수정 완료');
end;

function TfmMain.UpdateTB_EMPLOYEE_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_EMPLOYEE ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_EMPLOYEE:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_EMPLOYEE:수정 완료');
end;

function TfmMain.UpdateTB_FOODEVENT_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_FOODEVENT ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_FOODEVENT:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_FOODEVENT:수정 완료');
end;

function TfmMain.UpdateTB_FOODGRADE_EMCODE(stOrgCompanyCode, stOrgEmCode,
  stTargetCompanyCode, stTargetEmCode: string): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  result := False;
  stSql := 'update TB_FOODGRADE ';
  stSql := stSql + ' set CO_COMPANYCODE = ''' + stTargetCompanyCode  + ''', ';
  stSql := stSql + ' EM_CODE = ''' + stTargetEmCode  + '''  ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + stOrgCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + stOrgEmCode + ''' ';

  with ADOExecQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      nCount := ExecSql;
    Except
      memo1.Lines.Add('TB_FOODGRADE:Error');
      Exit;
    End;
    result := True;
  end;
  memo1.Lines.Add('TB_FOODGRADE:수정 완료');
end;

end.
