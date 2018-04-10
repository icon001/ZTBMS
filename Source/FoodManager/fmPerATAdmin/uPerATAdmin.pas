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
    cmb_Depart: TComboBox;
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
    Label7: TLabel;
    ed_CompanyName: TEdit;
    ed_DepartName: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    ed_EmployNo: TEdit;
    Label6: TLabel;
    ed_date: TEdit;
    ed_EmployName: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cmb_Jikak: TComboBox;
    Label14: TLabel;
    cmb_jotae: TComboBox;
    Label15: TLabel;
    mo_etc: TMemo;
    ed_inTime: TMaskEdit;
    ed_OutTime: TMaskEdit;
    Label16: TLabel;
    ed_CardNo: TEdit;
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
  private
    CompanyCodeList : TStringList;
    DepartCodeList : TStringList;
    ATINCodeList : TStringList;
    ATINTypeList : TStringList;
    ATOutCodeList : TStringList;
    ATOutTypeList : TStringList;
    { Private declarations }
    Procedure Load_Company;
    procedure Load_Depart(aCompanyCode: string;cmb_Box: TComboBox);
    Procedure Load_ATInCode;
    Procedure Load_ATOutCode;
    procedure GetDepartCode;
    procedure PanelClear;
    Function InsertTB_ATEVENT(aDate,
                   aCardNo,
                   aInTime,
                   aOutTime,
                   aInResult,
                   aOutResult,
                   aATInCode,
                   aATOutCode,
                   aContent:string):Boolean;
    Function UpdateTB_ATEVENT(aDate,
                   aCardNo,
                   aInTime,
                   aOutTime,
                   aInResult,
                   aOutResult,
                   aATInCode,
                   aATOutCode,
                   aContent:string):Boolean;
    Function DeleteTB_ATEVENT(aDate,aCardNo:string):Boolean;
    Function SearchATEvent : Boolean;
    Function InsertTB_WORKLOG(aCode,aCommand,aData:string):boolean;
  public
    { Public declarations }
  end;

var
  fmPerATAdmin: TfmPerATAdmin;

implementation

uses uDataModule1;
{$R *.dfm}

{ TfmPerATAdmin }

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
end;

procedure TfmPerATAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  ATINCodeList := TStringList.Create;
  ATINTypeList := TStringList.Create;
  ATOutCodeList := TStringList.Create;
  ATOutTypeList := TStringList.Create;

  Load_ATInCode;
  Load_ATOutCode;
end;

procedure TfmPerATAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;
  ATINCodeList.Free;
  ATINTypeList.Free;
  ATOutCodeList.Free;
  ATOutTypeList.Free;
  Action := caFree;
end;

procedure TfmPerATAdmin.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
  
  Load_Company;

  sg_report.ColWidths[10] := 0;
  sg_report.ColWidths[11] := 0;
  sg_report.ColWidths[12] := 0;
end;

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
end;

procedure TfmPerATAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPerATAdmin.cmb_CompanyChange(Sender: TObject);
begin
  Load_Depart(CompanyCodeList.Strings[cmb_Company.itemIndex],cmb_Depart);
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
  GridInitialize(sg_Report);
  PanelClear;
  SearchATEvent;
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
begin
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);
  stInTime := StringReplace(ed_InTime.Text,':','',[rfReplaceAll]);
  stOutTime := StringReplace(ed_OutTime.Text,':','',[rfReplaceAll]);

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
                   ed_CardNo.Text,
                   stDate + stInTime,
                   stDate + stOutTime,
                   stInResult,
                   stOutResult,
                   stATInCode,
                   stATOutCode,
                   mo_etc.Text);
  if Not bResult then UpdateTB_ATEVENT(stDate,
                   ed_CardNo.Text,
                   stDate + stInTime,
                   stDate + stOutTime,
                   stInResult,
                   stOutResult,
                   stATInCode,
                   stATOutCode,
                   mo_etc.Text);

  btn_SearchClick(self);


end;

function TfmPerATAdmin.InsertTB_ATEVENT(aDate, aCardNo, aInTime, aOutTime,
  aInResult, aOutResult,aATInCode,aATOutCode, aContent: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_ATEVENT( GROUP_CODE,';
  stSql := stSql + 'AT_DATE,';
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

function TfmPerATAdmin.UpdateTB_ATEVENT(aDate, aCardNo, aInTime, aOutTime,
  aInResult, aOutResult,aATInCode,aATOutCode, aContent: string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Update TB_ATEVENT ';
  stSql := stSql + 'Set AT_INTIME = ''' + aInTime + ''',';
  stSql := stSql + 'AT_OUTTIME = ''' + aOutTime + ''',';
  stSql := stSql + 'AT_INRESULT = ''' + aInResult + ''',';
  stSql := stSql + 'AT_OUTRESULT = ''' + aOutResult + ''',';
  stSql := stSql + 'AT_UPDATETIME = ''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'AT_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + 'AT_INCODE = ''' + aATInCode + ''',';
  stSql := stSql + 'AT_OUTCODE = ''' + aATOutCode + ''',';
  stSql := stSql + 'AT_CONTENT = ''' + aContent + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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

  DeleteTB_ATEVENT(stDate, ed_CardNo.Text);
  btn_SearchClick(self);
end;

function TfmPerATAdmin.DeleteTB_ATEVENT(aDate, aCardNo: string): Boolean;
var
  stSql : string;
  st : string;
begin
  Result := False;
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
    stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    st := aDate + ';' + aCardNo + ';' ;
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
    ed_DepartName.Text := Cells[2,Row];
    ed_EmployNo.Text := Cells[3,Row];
    ed_EmployName.Text := Cells[4,Row];
    ed_CardNo.Text := Cells[10,Row];
    ed_InTime.Text := Cells[5,Row];
    ed_OutTime.Text := Cells[6,Row];
    Cmb_Jikak.ItemIndex := ATINCODEList.IndexOf(Cells[11,Row]);
    Cmb_jotae.ItemIndex := ATOUTCODEList.IndexOf(Cells[12,Row]);
    mo_etc.Text := Cells[9,Row];
  end;
end;

function TfmPerATAdmin.SearchATEvent: Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
begin
  result := False;
  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,e.AT_INTIME,e.AT_OUTTIME,';
  stSql := stSql + ' f.AT_INCODE,f.AT_INNAME as JIKAK,g.AT_OUTCODE,g.AT_OUTNAME as JOTAE, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN e.AT_INRESULT = ''N'' then ''지각'' ';
  stsql := stSql + ' WHEN e.AT_INRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as JIKAK1, ';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN e.AT_OUTRESULT = ''N'' then ''조퇴'' ';
  stsql := stSql + ' WHEN e.AT_OUTRESULT = ''Y'' then ''정상'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as Jotae1, ';
  stSql := stSql + ' e.AT_CONTENT,b.CA_CARDNO ';
  stSql := stSql + ' from TB_CARD b ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE a ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.Group_Code = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.Group_Code = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_ATEVENT e ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = e.CA_CARDNO ';
  stSql := stSql + ' AND e.AT_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.Date) + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE f ';
  stSql := stSql + ' ON (e.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND e.AT_INCODE = f.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE g ';
  stSql := stSql + ' ON (e.GROUP_CODE = g.GROUP_CODE ';
  stSql := stSql + ' AND e.AT_OUTCODE = g.AT_OUTCODE ) ';
  stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ';
  if Trim(ed_name.Text) <> '' then stSql := stSql + ' AND a.EM_NAME Like ''%' + Trim(ed_name.Text) + '%'' ';
  if Trim(ed_empNo.Text) <> '' then stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text) + ''' ';
  if cmb_Company.ItemIndex = 0 then GetDepartCode
  else  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(CompanyCodeList.Strings[cmb_Company.ItemIndex],1,3) + ''' ';

  if cmb_Depart.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ';
  end else
  begin
    if Not IsMaster then
    begin
      if DepartCodeList.Count > 1 then
      begin
        stSql := stSql + ' AND ( ';
        for i := 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' ('
          else stSql := stSql + ' OR ( ';
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[i],1,3) + ''' ';
          stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],4,3) + ''' ';
          stSql := stSql + ') ';
        end;
        stSql := stSql + ') ';
      end else
      begin
        showmessage('조회 가능한 부서 권한이 없습니다. 권한을 확인하세요.');
        Exit;
      end;
    end;
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
        Cells[2,nRow] := FindField('DEPART_NAME').AsString;
        Cells[3,nRow] := FindField('EM_CODE').AsString;
        Cells[4,nRow] := FindField('EM_NAME').AsString;
        Cells[5,nRow] := stInTime;
        Cells[6,nRow] := stOutTime;
        Cells[7,nRow] := FindField('JIKAK').AsString;
        Cells[8,nRow] := FindField('Jotae').AsString;
        Cells[9,nRow] := FindField('AT_CONTENT').AsString;
        Cells[10,nRow] := FindField('CA_CARDNO').AsString;
        Cells[11,nRow] := FindField('AT_INCODE').AsString;
        Cells[12,nRow] := FindField('AT_OUTCODE').AsString;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  result := True;
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

procedure TfmPerATAdmin.Load_ATInCode;
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Jikak.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Jikak.Items.Add('');
  ATINCodeList.Add('');
  ATINTypeList.Add('3');
  cmb_Jikak.ItemIndex := 0;

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
      cmb_Jikak.Items.Add(FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmPerATAdmin.Load_ATOutCode;
var
  stSql : string;
begin
  ATOutCodeList.Clear;
  ATOutTypeList.Clear;
  cmb_jotae.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_jotae.Items.Add('');
  ATOutCodeList.Add('');
  ATOutTypeList.Add('3');
  cmb_jotae.ItemIndex := 0;

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
      cmb_jotae.Items.Add(FindField('AT_OUTNAME').AsString);
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

initialization
  RegisterClass(TfmPerATAdmin);
Finalization
  UnRegisterClass(TfmPerATAdmin);

end.
