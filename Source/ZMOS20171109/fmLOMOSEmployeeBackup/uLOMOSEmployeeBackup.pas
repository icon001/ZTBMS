unit uLOMOSEmployeeBackup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, Buttons, DB, dbisamtb, Grids, DBGrids,
  uSubForm, CommandArray, ADODB;

type
  TfmLOMOSEmployeeBackup = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_selectFile: TSpeedButton;
    btn_Backup: TSpeedButton;
    btn_close: TSpeedButton;
    ed_SaveFile: TEdit;
    btn_Search: TSpeedButton;
    SaveDialog1: TSaveDialog;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    lb_PosiName: TLabel;
    lb_emType: TLabel;
    cmb_EmpType: TComboBox;
    BackQuery: TADOQuery;
    procedure btn_closeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_BackupClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_selectFileClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure GridtoFile(adbGrid: TDBGrid; aFileName: string);
  public
    { Public declarations }
  end;

var
  fmLOMOSEmployeeBackup: TfmLOMOSEmployeeBackup;

implementation
uses
  uLomosUtil,
  uCompanyCodeLoad,
  uDataModule1;
{$R *.dfm}

procedure TfmLOMOSEmployeeBackup.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLOMOSEmployeeBackup.FormCreate(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
  LoadEmpType(EmpTypeCodeList,cmb_EmpType);

end;

procedure TfmLOMOSEmployeeBackup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
  EmpTypeCodeList.Free;


end;

procedure TfmLOMOSEmployeeBackup.btn_BackupClick(Sender: TObject);
begin
  if ed_SaveFile.Text = '' then
  begin
    showmessage('저장할 파일을 선택하세요.');
    Exit;
  end;
{  if FileExists(ed_SaveFile.Text) then
  begin

  end;   }
  GridtoFile(DBGrid1,ed_SaveFile.Text);
  showmessage('백업완료');

end;

procedure TfmLOMOSEmployeeBackup.GridtoFile(adbGrid: TDBGrid;
  aFileName: string);
var
  st: string;
  st2:string;
  CurMark: TBookmark;
  CurColumn: Integer;
  aStringList: Tstringlist;
begin

  aStringList := TStringList.Create;
  aStringList.Clear;
  //그리드 내용 저장

  with aDBGrid.Columns do
  begin
    for CurColumn := 0 to Count - 1 do
    begin
      if (CurColumn > 0) then st := st + ', ';
      st := st + aDBGrid.Columns.Items[CurColumn].Title.Caption;
    end;
    aStringList.Add(st);
  end;
  //Title 저장
  with aDBGrid.DataSource.Dataset do
  begin
    DisableControls;
    CurMark := GetBookmark; {현재 레코드 포인터 저장}
    First;
    while not eof do
    begin
      st := '';
      for CurColumn := 0 to aDBGrid.Columns.Count - 1 do
      begin
        if (CurColumn > 0) then st := st + ', ';
        st2:=aDBGrid.Columns[CurColumn].Field.Text;
        st2:= DelChars(st2,',');
        st := st +st2 ; {필드값}
      end;
      aStringList.Add(st);
      Next;
    end;
    GotoBookmark(CurMark);
    EnableControls;
  end;

  aStringList.SaveToFile(aFileName);
  aStringList.Free;
end;

procedure TfmLOMOSEmployeeBackup.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmLOMOSEmployeeBackup.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmLOMOSEmployeeBackup.btn_selectFileClick(Sender: TObject);
begin
  SaveDialog1.FileName := '사원정보백업';
  ed_SaveFile.Text := '';
  if SaveDialog1.Execute then
  begin
    ed_SaveFile.Text := SaveDialog1.FileName;
    btn_Backup.Enabled := True;
  end else btn_Backup.Enabled := False;

end;

procedure TfmLOMOSEmployeeBackup.btn_SearchClick(Sender: TObject);
var
  stSql : string;
begin
  stSql := ' select a.ca_cardno as CARD_NO,';
  stSql := stSql + ' a.CO_COMPANYCODE as CO_CODE,';
  stSql := stSql + ' c.CO_NAME as CO_NAME,';
  stSql := stSql + ' '''' as LOCAL_CODE,';
  stSql := stsql + ' '''' as LOCAL_NAME,';
  stSql := stSql + ' b.CO_DEPARTCODE as DEPART_CODE,';
  stSql := stSql + ' e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' b.PO_POSICODE as POSI_CODE,';
  stSql := stSql + ' f.PO_NAME as POSI_NAME,';
  stSql := stSql + ' a.EM_CODE as ID_NO,';
  stSql := stSql + ' b.EM_NAME as USER_NAME,';
  stSql := stSql + ' ''0'' as ISMASTER,';
  stSql := stSql + ' '''' as AGROUP_CODE,';
  stSql := stSql + ' '''' as TP_CODE,';
  stSql := stSql + ' ''0'' as USE_EXP,';
  stSql := stSql + ' '''' as S_DATE,';
  stSql := stSql + ' '''' as E_DATE,';
  stSql := stSql + ' '''' as USE_ATTEND,';
  stSql := stSql + ' '''' as ATTEND_GROUP,';
  stSql := stSql + ' '''' as USE_FOOD,';
  stSql := stSql + ' ''0'' as USE_TYPE,';
  stSql := stSql + ' '''' as CARD_TYPE,';
  stSql := stSql + ' a.ca_cardtype as CARD_STATE,';
  stSql := stSql + '''' + datetimetostr(now) + ''' as REG_DAY,';
  stSql := stSql + '''' + datetimetostr(now) + ''' as UPDATE,';
  stSql := stSql + ' a.ca_updateoperator as OPERATOR,';
  stSql := stSql + ' '''' as ENTERCOMPANY,';
  stSql := stSql + ' '''' as LEAVECOMPANY,';
  stSql := stSql + ' '''' as JUMINNO,';
  stSql := stSql + ' '''' as DORMITORY,';
  stSql := stSql + ' b.fdms_id as FPMS_ID,';
  stSql := stSql + ' '''' as FPMS_Check,';
  stSql := stSql + ' '''' as FoodUse,';
  stSql := stSql + ' '''' as FoodRelay,';
  stSql := stSql + ' a.ca_lastuse as CardLastDay,';
  stSql := stSql + ' '''' as CardvalidDay,';
  stSql := stSql + ' '''' as UsevalidDay ';
  stSql := stSql + ' from TB_CARD a';
  stSql := stSql + ' INNER JOIN TB_EMPLOYEE b';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE)';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON(b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE) ';
  stSql := stsql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_Company.ItemIndex > 0 then
  begin
    stSql := stsql + ' AND a.CO_COMPANYCODE = ''' + copy(CompanyCodeList.Strings[cmb_Company.ItemIndex],1,3) + ''' ';
  end;
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stSql := stsql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    stSql := stsql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
  end;
  if cmb_Posi.ItemIndex > 0 then
  begin
    stSql := stsql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  end;
  if cmb_EmpType.ItemIndex > 0 then
  begin
    stSql := stsql + ' AND b.rg_code = ''' + copy(EmpTypeCodeList.Strings[cmb_EmpType.ItemIndex],1,3) + ''' ';
  end;

  with BackQuery do
  begin
    Close;
    Sql.Text := stSql ;
    Try
      Open;
    Except
      Exit;
    End;
  end;

end;

end.
