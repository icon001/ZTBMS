unit uPerATAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, Mask,
  uSubForm, CommandArray;

type
  TfmPerATAdmin = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ed_empNo: TEdit;
    Label4: TLabel;
    ed_name: TEdit;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    dt_Date: TDateTimePicker;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox4: TGroupBox;
    btn_Update: TSpeedButton;
    btn_save: TSpeedButton;
    btn_delete: TSpeedButton;
    Label17: TLabel;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    cmb_AtIntype: TComboBox;
    Label22: TLabel;
    cmb_AtOuttype: TComboBox;
    GroupBox5: TGroupBox;
    Label6: TLabel;
    ed_date: TEdit;
    Label19: TLabel;
    edit_CompanyCode: TEdit;
    Label16: TLabel;
    ed_CardNo: TEdit;
    Label7: TLabel;
    ed_CompanyName: TEdit;
    Label18: TLabel;
    ed_JijumName: TEdit;
    Label8: TLabel;
    ed_DepartName: TEdit;
    Label23: TLabel;
    ed_PosiName: TEdit;
    Label9: TLabel;
    ed_EmployNo: TEdit;
    Label10: TLabel;
    ed_EmployName: TEdit;
    GroupBox6: TGroupBox;
    cmb_jotae: TComboBox;
    Label14: TLabel;
    ed_OutTime: TMaskEdit;
    Label12: TLabel;
    cmb_Jikak: TComboBox;
    Label13: TLabel;
    ed_inTime: TMaskEdit;
    Label11: TLabel;
    mo_etc: TMemo;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure sg_reportClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    ATINCodeList : TStringList;
    ATINTypeList : TStringList;
    ATOutCodeList : TStringList;
    ATOutTypeList : TStringList;
    { Private declarations }
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    procedure GetDepartCode;
    procedure PanelClear;
    Function InsertTB_ATEVENT(aDate,
                   aCompanyCode,
                   aEmCode,
                   aCardNo,
                   aInTime,
                   aOutTime,
                   aInResult,
                   aOutResult,
                   aATInCode,
                   aATOutCode,
                   aContent:string):Boolean;
    Function UpdateTB_ATEVENT(aDate,
                   aCompanyCode,
                   aEmCode,
                   aCardNo,
                   aInTime,
                   aOutTime,
                   aInResult,
                   aOutResult,
                   aATInCode,
                   aATOutCode,
                   aContent:string):Boolean;
    Function DeleteTB_ATEVENT(aDate,aCompanyCode,aEMCode:string):Boolean;
    Function SearchATEvent(aCode:string) : Boolean;
    Function InsertTB_WORKLOG(aCode,aCommand,aData:string):boolean;
  public
    { Public declarations }
  end;

var
  fmPerATAdmin: TfmPerATAdmin;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad;
{$R *.dfm}

{ TfmPerATAdmin }
{
procedure TfmPerATAdmin.Load_Company;
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  cmb_Company.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE ';

  cmb_Company.Items.Add('전체');
  CompanyCodeList.Add('000');
  cmb_Company.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      cmb_Company.Items.Add(FindField('CO_NAME').AsString);
      Next;
    end;

  end;
end;   }

procedure TfmPerATAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  ATINCodeList := TStringList.Create;
  ATINTypeList := TStringList.Create;
  ATOutCodeList := TStringList.Create;
  ATOutTypeList := TStringList.Create;

end;

procedure TfmPerATAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  ATINCodeList.Free;
  ATINTypeList.Free;
  ATOutCodeList.Free;
  ATOutTypeList.Free;
  Action := caFree;
end;

procedure TfmPerATAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;

  GridInit(sg_report as TStringGrid,12);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  Load_ATInCode(cmb_AtIntype,True);
  Load_ATInCode(cmb_Jikak);
  Load_ATOutCode(cmb_AtOuttype,True);
  Load_ATOutCode(cmb_Jotae);

  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  btn_SearchClick(btn_Search);

end;
{
procedure TfmPerATAdmin.Load_Depart(aCompanyCode: string;
  cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  DepartCodeList.Clear;

  cmb_Box.Items.Add('전체');
  DepartCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  if (aCompanyCode = '000') Or (aCompanyCode = '') then Exit;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE ';

  with DataModule1.GetObject.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;

  end;
end;   }

procedure TfmPerATAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPerATAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmPerATAdmin.btn_UpdateClick(Sender: TObject);
begin
  ed_InTime.Enabled := True;
  ed_OutTime.Enabled := True;
  cmb_Jikak.Enabled := True;
  cmb_jotae.Enabled := True;
  mo_etc.Enabled := True;
  ed_InTime.SetFocus;
  btn_Save.Enabled := True;
end;

procedure TfmPerATAdmin.btn_SearchClick(Sender: TObject);
begin
  SearchATEvent('');

end;

procedure TfmPerATAdmin.PanelClear;
begin
  ed_InTime.Enabled := False;
  ed_OutTime.Enabled := False;
  cmb_Jikak.Enabled := False;
  cmb_jotae.Enabled := False;
  mo_etc.Enabled := False;
  btn_Update.Enabled := False;
  btn_save.Enabled := False;
  btn_Delete.Enabled := False;

  ed_date.Text := '';
  ed_CompanyName.Text := '';
  ed_DepartName.Text := '';
  ed_EmployNo.Text := '';
  ed_EmployName.Text := '';
  ed_InTime.Text := '';
  ed_OutTime.Text := '';
  cmb_Jikak.ItemIndex := 0;
  cmb_jotae.ItemIndex := 0;
  mo_etc.Text :=  '';


end;

procedure TfmPerATAdmin.btn_saveClick(Sender: TObject);
var
  stInResult,stOutResult : string;
  bResult : Boolean;
  stDate,stInTime,stOutTime : string;
  stATIncode,stATOutCode : string;
  stATInType,stATOutType : string;
  stCompanyCode,stEmCode : string;
begin
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);
  stInTime := StringReplace(ed_InTime.Text,':','',[rfReplaceAll]);
  stOutTime := StringReplace(ed_OutTime.Text,':','',[rfReplaceAll]);
  stCompanyCode := edit_CompanyCode.Text ;
  stEmCode := ed_EmployNo.Text;

  if cmb_Jikak.ItemIndex < 0 then cmb_Jikak.ItemIndex := 0;
  if cmb_Jotae.ItemIndex < 0 then cmb_Jotae.ItemIndex := 0;

  stATIncode := ATINCodeList.Strings[cmb_Jikak.ItemIndex];
  stATInType := ATINTypeList.Strings[cmb_Jikak.ItemIndex];

  stInResult := '';
  if stATInType = '1' then stInResult := 'Y'
  else if stATInType = '2' then stInResult := 'N';

  stATOutcode := ATOutCodeList.Strings[cmb_Jotae.ItemIndex];
  stATOutType := ATOutTypeList.Strings[cmb_Jotae.ItemIndex];
  stOutResult := '';
  if stATOutType = '1' then stOutResult := 'Y'
  else if stATOutType = '2' then stOutResult := 'N';


  bResult := InsertTB_ATEVENT(stDate,
                   stCompanyCode,
                   stEmCode,
                   ed_CardNo.Text,
                   stDate + stInTime,
                   stDate + stOutTime,
                   stInResult,
                   stOutResult,
                   stATInCode,
                   stATOutCode,
                   mo_etc.Text);
  if Not bResult then UpdateTB_ATEVENT(stDate,
                   stCompanyCode,
                   stEmCode,
                   ed_CardNo.Text,
                   stDate + stInTime,
                   stDate + stOutTime,
                   stInResult,
                   stOutResult,
                   stATInCode,
                   stATOutCode,
                   mo_etc.Text);

  SearchATEvent(stCompanyCode + stEmCode);


end;

function TfmPerATAdmin.InsertTB_ATEVENT(aDate,aCompanyCode,aEmCode,
  aCardNo, aInTime, aOutTime,
  aInResult, aOutResult,aATInCode,aATOutCode, aContent: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ATEVENT( GROUP_CODE,';
  stSql := stSql + 'AT_DATE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AT_INTIME,';
  stSql := stSql + 'AT_OUTTIME,';
  stSql := stSql + 'AT_INRESULT,';
  stSql := stSql + 'AT_OUTRESULT,';
  stSql := stSql + 'AT_INSERTTIME,';
  stSql := stSql + 'AT_INSERTOPERATOR,';
  stSql := stSql + 'AT_INCODE,';
  stSql := stSql + 'AT_OUTCODE,';
  stSql := stSql + 'AT_CONTENT ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aInTime + ''',';
  stSql := stSql + '''' + aOutTime + ''',';
  stSql := stSql + '''' + aInResult + ''',';
  stSql := stSql + '''' + aOutResult + ''',';
  stSql := stSql + '''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '''' + aATInCode + ''',';
  stSql := stSql + '''' + aATOutCode + ''',';
  stSql := stSql + '''' + aContent + ''')';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;


  result := True;
end;

function TfmPerATAdmin.UpdateTB_ATEVENT(aDate,aCompanyCode,aEmCode, aCardNo, aInTime, aOutTime,
  aInResult, aOutResult,aATInCode,aATOutCode, aContent: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Update TB_ATEVENT ';
  stSql := stSql + 'Set AT_INTIME = ''' + aInTime + ''',';
  stSql := stSql + 'AT_OUTTIME = ''' + aOutTime + ''',';
  stSql := stSql + 'CA_CARDNO = ''' + aCardNo + ''', ';
  stSql := stSql + 'AT_INRESULT = ''' + aInResult + ''',';
  stSql := stSql + 'AT_OUTRESULT = ''' + aOutResult + ''',';
  stSql := stSql + 'AT_UPDATETIME = ''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'AT_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + 'AT_INCODE = ''' + aATInCode + ''',';
  stSql := stSql + 'AT_OUTCODE = ''' + aATOutCode + ''',';
  stSql := stSql + 'AT_CONTENT = ''' + aContent + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;


  result := True;
end;

procedure TfmPerATAdmin.btn_deleteClick(Sender: TObject);
var
  stDate : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);

  DeleteTB_ATEVENT(stDate, edit_CompanyCode.Text,ed_EmployNo.Text);
  SearchATEvent('');
end;

function TfmPerATAdmin.DeleteTB_ATEVENT(aDate,aCompanyCode,aEMCode:string):Boolean;
var
  stSql : string;
  st : string;
begin
  Result := False;
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    First;
    if recordcount < 1 then Exit;
    if FindField('AT_INSERTOPERATOR').asstring <> Master_ID then
    begin
      showmessage('근태데이터 삭제는 최초등록자만 가능합니다.');
      Exit;
    end;

    stSql := 'Delete from TB_ATEVENT ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
    stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    st := aDate + ';' + aCompanyCode + ';' + aEMCode ;
    InsertTB_WORKLOG('ATEVENT','DELETE',st);

  end;
  Result := True;
end;

procedure TfmPerATAdmin.sg_reportClick(Sender: TObject);
begin
  PanelClear;
  if sg_report.Cells[0,sg_report.row] = '' then Exit;
  btn_Update.Enabled := True;
  btn_save.Enabled := False;
  btn_Delete.Enabled := True;

  with sg_report do
  begin
    ed_date.Text := Cells[0,Row];
    ed_CompanyName.Text := Cells[1,Row];
    ed_JijumName.Text :=  Cells[2,Row];
    ed_DepartName.Text := Cells[3,Row];
    ed_PosiName.Text := Cells[4,Row];
    ed_EmployNo.Text := Cells[5,Row];
    ed_EmployName.Text := Cells[6,Row];
    ed_CardNo.Text := Cells[12,Row];
    ed_InTime.Text := Cells[7,Row];
    ed_OutTime.Text := Cells[8,Row];
    Cmb_Jikak.ItemIndex := ATINCODEList.IndexOf(Cells[13,Row]);
    Cmb_jotae.ItemIndex := ATOUTCODEList.IndexOf(Cells[14,Row]);
    mo_etc.Text := Cells[11,Row];
    edit_CompanyCode.Text := Cells[15,Row];
  end;
end;

function TfmPerATAdmin.SearchATEvent(aCode:string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
begin
  result := False;

  GridInitialize(sg_Report);
  PanelClear;

  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,f.AT_INTIME,f.AT_OUTTIME,I.PO_NAME,';
  stSql := stSql + ' g.AT_INCODE,g.AT_INNAME as JIKAK,h.AT_OUTCODE,h.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''N'' then ''지각'' ';
  stsql := stSql + ' WHEN f.AT_INRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as JIKAK1, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''N'' then ''조퇴'' ';
  stsql := stSql + ' WHEN f.AT_OUTRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as Jotae1, ';
  stSql := stSql + ' f.AT_CONTENT,b.CA_CARDNO ';
  stSql := stSql + ' from TB_EMPLOYEE a  ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE  ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (a.Group_Code = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_ATEVENT f ';
  stSql := stSql + ' ON (b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = f.EM_CODE ';
  stSql := stSql + ' AND f.AT_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.Date) + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE g ';
  stSql := stSql + ' ON (f.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_INCODE = g.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE h ';
  stSql := stSql + ' ON (f.GROUP_CODE = h.GROUP_CODE ';
  stSql := stSql + ' AND f.AT_OUTCODE = h.AT_OUTCODE ) ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 회사 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to CompanyCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 지점 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 부서 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' '; 
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';

  if cmb_AtIntype.ItemIndex > 0 then //출근 타입 선택시
  begin
    if ATINCodeList.Strings[cmb_AtIntype.ItemIndex] = '003' then //결근 선택시
    begin
      stSql := stSql + ' AND ( f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
      stSql := stSql + ' OR f.AT_INCODE IS NULL ) ';
    end else stSql := stSql + ' AND f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
  end;
  if cmb_AtOuttype.ItemIndex > 0 then //퇴근 타입 선택시
  begin
    stSql := stSql + ' AND f.AT_OUTCODE = ''' + ATOUTCodeList.Strings[cmb_AtOuttype.ItemIndex]  + ''' ';
  end;

  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with DataModule1.ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    First;
    sg_report.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      stInTime := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,11,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,13,2) ;
      stOutTime := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,11,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,13,2) ;

      with sg_report do
      begin
        Cells[0,nRow] := FormatDateTime('yyyy-mm-dd',dt_Date.Date);
        Cells[1,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[2,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('PO_NAME').AsString;
        Cells[5,nRow] := FindField('EM_CODE').AsString;
        Cells[6,nRow] := FindField('EM_NAME').AsString;
        Cells[7,nRow] := stInTime;
        Cells[8,nRow] := stOutTime;
        Cells[9,nRow] := FindField('JIKAK').AsString;
        Cells[10,nRow] := FindField('Jotae').AsString;
        Cells[11,nRow] := FindField('AT_CONTENT').AsString;
        Cells[12,nRow] := FindField('CA_CARDNO').AsString;
        Cells[13,nRow] := FindField('AT_INCODE').AsString;
        Cells[14,nRow] := FindField('AT_OUTCODE').AsString;
        Cells[15,nRow] := FindField('CO_COMPANYCODE').AsString;
        if FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString = aCode then
        begin
          SelectRows(nRow,1);
        end;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  result := True;
  sg_reportClick(sg_Report);

end;

procedure TfmPerATAdmin.GetDepartCode;
var
  stSql : String;
begin
  DepartCodeList.Clear;
  DepartCodeList.Add('');

  stSql := 'Select * from ';
  stSql := stSql + ' TB_ADMINCOMPANY  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

function TfmPerATAdmin.InsertTB_WORKLOG(aCode, aCommand,
  aData: string): boolean;
var
  stSql : string;

begin
  result := False;
  stSql := 'INSERT INTO TB_WORKLOG(WO_CODE,WO_COMMAND,WO_DATA,WO_TIME,WO_OPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aCommand + ''',';
  stSql := stSql + '''' + aData + ''',';
  stSql := stSql + 'getDate(),';
  stSql := stSql + '''' + Master_ID + ''') ';
  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
  end;

  result := True;
end;

procedure TfmPerATAdmin.Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Box.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATINCodeList.Add('');
  ATINTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATINCodeList.Add(FindField('AT_INCODE').AsString);
      ATINTypeList.Add(FindField('AT_INTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmPerATAdmin.Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
var
  stSql : string;
begin
  ATOutCodeList.Clear;
  ATOutTypeList.Clear;
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATOutCodeList.Add('');
  ATOutTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATOUTCodeList.Add(FindField('AT_OUTCODE').AsString);
      ATOUTTypeList.Add(FindField('AT_OUTTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmPerATAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade then btn_Update.Enabled := True
  else btn_Update.Enabled := False;
  if IsDeleteGrade then btn_Delete.Enabled := True
  else btn_Delete.Enabled := False;
end;

procedure TfmPerATAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);
end;

procedure TfmPerATAdmin.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerATAdmin.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmPerATAdmin.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);
end;

procedure TfmPerATAdmin.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);
end;

initialization
  RegisterClass(TfmPerATAdmin);
Finalization
  UnRegisterClass(TfmPerATAdmin);

end.
