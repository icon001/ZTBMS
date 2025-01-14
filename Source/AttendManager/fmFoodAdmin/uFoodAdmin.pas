unit uFoodAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, StdCtrls, ComCtrls, Buttons,
  uSubForm, CommandArray, AdvObj;

type
  TfmFoodAdmin = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label5: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    dt_Date: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label6: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ed_CompanyName: TEdit;
    ed_DepartName: TEdit;
    ed_EmployNo: TEdit;
    ed_date: TEdit;
    ed_EmployName: TEdit;
    mo_etc: TMemo;
    ed_FoodTime: TMaskEdit;
    ed_CardNo: TEdit;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox4: TGroupBox;
    btn_Update: TSpeedButton;
    btn_save: TSpeedButton;
    btn_delete: TSpeedButton;
    Label17: TLabel;
    cmb_Gubun: TComboBox;
    Label12: TLabel;
    cmb_sGubun: TComboBox;
    btn_Insert: TSpeedButton;
    Label13: TLabel;
    ed_nodeno: TEdit;
    Label14: TLabel;
    ed_readerno: TEdit;
    Label18: TLabel;
    ed_mcuid: TEdit;
    Label19: TLabel;
    ed_ecuid: TEdit;
    cmb_Permit: TComboBox;
    Label20: TLabel;
    Label21: TLabel;
    ed_FoodAmt: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
    procedure cmb_GubunChange(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure sg_reportClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    DepartCodeList : TStringList;
    FoodCodeList : TStringList;
    State : String;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    Procedure Load_Company(cmb_Box: TComboBox);
    procedure Load_Depart(aCompanyCode: string;cmb_Box: TComboBox);
    procedure Load_FoodCode(cmb_Box:TComboBox);
    procedure PanelClear;
    Function InsertTB_FOODEVENT(aDate,aFoodTime,aNodeNo,aReaderNo,
                   aCardNo,aEcuId,
                   aFoodCode,
                   aPermit, //승인유무
                   aContent,aFoodAmt:string):Boolean;
    Function UpdateTB_FOODEVENT(aDate,aFoodTime,aNodeNo,aReaderNo,
                   aCardNo,aEcuId,
                   aFoodCode,
                   aPermit, //승인유무
                   aContent,aFoodAmt:string):Boolean;
    Function GetNodeNo(var aEcuId:string):integer;
    Function DeleteTB_FOODEVENT(aDate, aFoodTime, aNodeno,aReaderno,
                   aCardNo,aEcuid:string):Boolean;
    Function InsertTB_WORKLOG(aCode,aCommand,aData:string):boolean;
    procedure SearchFoodEvent(aCode:string);
  public
    { Public declarations }
  end;

var
  fmFoodAdmin: TfmFoodAdmin;

implementation
uses uDataModule1;

{$R *.dfm}

{ TfmFoodAdmin }

procedure TfmFoodAdmin.Load_Company(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  CompanyCodeList.Clear;

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

  cmb_Box.Items.Add('전체');
  CompanyCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmFoodAdmin.Load_Depart(aCompanyCode: string;
  cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  DepartCodeList.Clear;

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
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE ';

  cmb_Box.Items.Add('전체');
  DepartCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

procedure TfmFoodAdmin.FormActivate(Sender: TObject);
begin
  dt_Date.Date := Now;
  
  Load_Company(cmb_Company);
  Load_Depart(CompanyCodeList.Strings[cmb_Company.itemIndex],cmb_Depart);
  Load_FoodCode(cmb_Gubun);
  Load_FoodCode(cmb_sGubun);

  sg_report.ColWidths[9] := 0;
  sg_report.ColWidths[10] := 0;
  sg_report.ColWidths[11] := 0;
  sg_report.ColWidths[12] := 0;
  sg_report.ColWidths[13] := 0;

end;

procedure TfmFoodAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  FoodCodeList := TStringList.Create;

end;

procedure TfmFoodAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;
  FoodCodeList.Free;
  Action := caFree;

end;

procedure TfmFoodAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmFoodAdmin.cmb_CompanyChange(Sender: TObject);
begin
  Load_Depart(CompanyCodeList.Strings[cmb_Company.itemIndex],cmb_Depart);

end;

procedure TfmFoodAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);

{  State :=  'UPDATE';
  ed_FoodTime.Enabled := True;
  cmb_Permit.Enabled := True;
  mo_etc.Enabled := True;
  ed_FoodTime.SetFocus;
  btn_Save.Enabled := True;
  cmb_sGubun.Enabled := True;
  ed_FoodAmt.Enabled := True;}

end;

procedure TfmFoodAdmin.btn_SearchClick(Sender: TObject);
begin
  SearchFoodEvent('');

end;

procedure TfmFoodAdmin.PanelClear;
begin
  ed_FoodTime.Enabled := False;
  cmb_sGubun.Enabled := False;
  mo_etc.Enabled := False;
//  btn_insert.Enabled := False;
  btn_Update.Enabled := False;
  btn_save.Enabled := False;
  btn_Delete.Enabled := False;
  ed_FoodAmt.Text := '';
  ed_FoodAmt.Enabled := False;
  cmb_Permit.ItemIndex := 0;
  cmb_Permit.Enabled := False;

  ed_date.Text := '';
  ed_CompanyName.Text := '';
  ed_DepartName.Text := '';
  ed_EmployNo.Text := '';
  ed_EmployName.Text := '';
  ed_FoodTime.Text := '';
  cmb_sGubun.ItemIndex := cmb_Gubun.ItemIndex;
  mo_etc.Text :=  '';
  ed_nodeno.Text := '0';
  ed_readerno.Text := '0';
  ed_mcuid.Text := '0000000';
  ed_ecuid.Text := '00';

end;

procedure TfmFoodAdmin.btn_saveClick(Sender: TObject);
var
  bResult : Boolean;
  stDate,stFoodTime : string;
  stPermit : string;
  stNodeNo : string;
  stFoodAmt : string;
begin
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);
  stFoodTime := StringReplace(ed_FoodTime.Text,':','',[rfReplaceAll]);
  if cmb_Permit.ItemIndex = 0 then stPermit := 'Y'
  else stPermit := 'N';
  if Trim(ed_nodeno.Text) = '' then stNodeNo := '0'
  else stNodeNo := ed_nodeno.Text;
  stFoodAmt := '0';
  if ed_FoodAmt.Text <> '' then stFoodAmt := ed_FoodAmt.Text;

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_FOODEVENT(stDate,stFoodTime,stNodeNo,ed_readerno.Text,
                     ed_CardNo.Text,ed_ecuid.Text,
                     FoodCodeList.Strings[cmb_sGubun.ItemIndex],
                     stPermit, //승인유무
                     mo_etc.text,stFoodAmt)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_FOODEVENT(stDate,stFoodTime,stNodeNo,ed_readerno.Text,
                   ed_CardNo.Text,ed_ecuid.Text,
                   FoodCodeList.Strings[cmb_sGubun.ItemIndex],
                   stPermit, //승인유무
                   mo_etc.text,stFoodAmt);

  if bResult then searchFoodEvent(ed_CardNo.Text + stFoodTime)
  else showmessage('저장실패');

end;

procedure TfmFoodAdmin.Load_FoodCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  FoodCodeList.Clear;


  stSql := ' select FO_FOODCODE,FO_CODENAME from TB_FOODCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' ORDER BY FO_FOODCODE ';
  cmb_Box.Items.Add('전체');
  FoodCodeList.Add('');

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
      cmb_Box.Items.Add(FindField('FO_CODENAME').AsString);
      FoodCodeList.Add(FindField('FO_FOODCODE').AsString);
      Next;
    end;
    cmb_Box.ItemIndex := 0;

  end;
end;

procedure TfmFoodAdmin.cmb_GubunChange(Sender: TObject);
begin
  cmb_sGubun.ItemIndex := cmb_Gubun.ItemIndex;
end;

procedure TfmFoodAdmin.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  ed_FoodTime.Text := '';
  ed_FoodAmt.Text := '';
  ed_nodeno.Text := '0';
  ed_readerno.Text := '0';
  ed_mcuid.Text := '0000000';
  ed_ecuid.Text := '00'; 

  FormEnable(State);
  ButtonEnable(State);

{
  State := 'INSERT';
  ed_FoodTime.Enabled := True;
  mo_etc.Enabled := True;
  cmb_sGubun.Enabled := True;
  cmb_permit.Enabled := True;
  ed_FoodTime.Text := '';
  cmb_Permit.ItemIndex := 0;
  ed_FoodAmt.Text := '';
  ed_FoodAmt.Enabled := True;
  ed_FoodTime.SetFocus;
  btn_Save.Enabled := True;
  btn_Update.Enabled := False;
  ed_nodeno.Text := '0';
  ed_readerno.Text := '0';
  ed_mcuid.Text := '0000000';
  ed_ecuid.Text := '00'; }
end;

function TfmFoodAdmin.InsertTB_FOODEVENT(aDate, aFoodTime, aNodeNo,
  aReaderNo, aCardNo,  aEcuId, aFoodCode, aPermit,
  aContent,aFoodAmt:string): Boolean;
var
  nNodeNo : integer;
  stSql : string;
begin
  result := False;
  nNodeNo := strtoint(aNodeNo);
  if State = 'INSERT' then
  begin
    nNodeNo := GetNodeNo(aEcuId);
  end;

  stSql := ' Insert Into TB_FOODEVENT( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'FO_DATE,';
  stSql := stSql + 'FO_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'FO_FOODCODE,';
  stSql := stSql + 'FO_PERMIT,';
  stSql := stSql + 'FO_CONTENT,';
  stSql := stSql + 'FO_INSERTTIME,';
  stSql := stSql + 'FO_INSERTOPERATOR, FO_FOODAMT) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aFoodTime + ''',';
  stSql := stSql + inttostr(nNodeNo) + ',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aEcuId + ''',';
  stSql := stSql + '''' + aFoodCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''' + aContent + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',' + aFoodAmt + ')';

  result := DataModule1.ProcessEventExecSQL(stSql);

//
end;

function TfmFoodAdmin.UpdateTB_FOODEVENT(aDate, aFoodTime, aNodeNo,
  aReaderNo, aCardNo, aEcuId, aFoodCode, aPermit,
  aContent,aFoodAmt:string): Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Update TB_FOODEVENT Set ';
  stSql := stSql + 'FO_FOODCODE = ''' + aFoodCode + ''', ';
  stSql := stSql + 'FO_CONTENT  = ''' + aContent + ''',  ';
  stSql := stSql + 'FO_UPDATETIME  = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',  ';
  stSql := stSql + 'FO_UPDATEOPERATOR  = ''' + Master_ID + ''',  ';
  stSql := stSql + 'FO_FOODAMT  = ' + aFoodAmt + '  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + '''  ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TfmFoodAdmin.GetNodeNo(var aEcuId: string): integer;
var
  stSql : string;
begin
  result := 0;
  aEcuId := '00';
  stSql := ' select * From TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_FDTYPE = ''1'' ';

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
    if recordcount < 1 then Exit;
    result := FindField('AC_NodeNo').AsInteger;
    aEcuId := FindField('AC_ECUID').AsString;
  end;
end;

procedure TfmFoodAdmin.sg_reportClick(Sender: TObject);
begin
  if sg_report.Cells[0,sg_report.row] = '' then Exit;
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
{  PanelClear;
  btn_Update.Enabled := True;
  btn_save.Enabled := False;
  btn_Delete.Enabled := True;  }

  with sg_report do
  begin
    ed_date.Text := Cells[0,Row];
    ed_CompanyName.Text := Cells[2,Row];
    ed_DepartName.Text := Cells[3,Row];
    ed_EmployNo.Text := Cells[4,Row];
    ed_EmployName.Text := Cells[5,Row];
    ed_CardNo.Text := Cells[9,Row];
    ed_FoodTime.Text := Cells[6,Row];
    mo_etc.Text := Cells[8,Row];
    ed_nodeno.Text := Cells[10,Row];
    ed_readerno.Text := Cells[11,Row];
    ed_mcuid.Text := Cells[12,Row];
    ed_ecuid.Text := Cells[13,Row];
    ed_FoodAmt.Text := Cells[14,Row];
    cmb_sGubun.ItemIndex := cmb_sGubun.Items.IndexOf(Cells[1,Row]);
    cmb_Permit.ItemIndex := cmb_Permit.Items.IndexOf(Cells[7,Row]);
  end;
end;

procedure TfmFoodAdmin.btn_deleteClick(Sender: TObject);
var
  stDate : string;
  stFoodTime : string;
  stNodeNo : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);
  stFoodTime := StringReplace(ed_FoodTime.Text,':','',[rfReplaceAll]);

  if Trim(ed_nodeno.Text) = '' then stNodeNo := '0'
  else stNodeNo := ed_nodeno.Text;

  DeleteTB_FOODEVENT(stDate, stFoodTime, stNodeNo,ed_readerno.Text,
                   ed_CardNo.Text,ed_ecuid.Text);

  btn_SearchClick(self);

end;

function TfmFoodAdmin.DeleteTB_FOODEVENT(aDate, aFoodTime, aNodeno,
  aReaderno, aCardNo, aEcuid: string): Boolean;
var
  stSql : string;
  st : string;
begin
  result := False;
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';

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
    if FindField('FO_INSERTOPERATOR').asstring <> Master_ID then
    begin
      showmessage('식수데이터 삭제는 최초등록자만 가능합니다.');
      Exit;
    end;
  end;

  stSql := ' delete from TB_FOODEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';

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
    st := aDate + ';' + aFoodTime + ';' + aNodeNo + ';' + aReaderNo + ';' + aCardNo + ';' + aEcuId + ';';
    InsertTB_WORKLOG('FOODEVENT','DELETE',st);
  end;

  result := True;
end;

function TfmFoodAdmin.InsertTB_WORKLOG(aCode, aCommand,
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

  result := DataModule1.ProcessLogExecSQL(stSql);

end;

procedure TfmFoodAdmin.SearchFoodEvent(aCode:string);
var
  stSql : string;
  i :integer;
  nRow : integer;
  stFoodTime : string;
begin
  GridInitialize(sg_report); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'Select c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.EM_CODE,a.EM_NAME,e.FO_DATE,e.FO_TIME,';
  stSql := stSql + ' e.AC_NODENO,e.FO_DOORNO,e.AC_MCUID,e.AC_ECUID,';
  stSql := stSql + ' CASE ';
  stsql := stSql + ' WHEN e.FO_PERMIT = ''Y'' then ''승인'' ';
  stsql := stSql + ' WHEN e.FO_PERMIT = ''N'' then ''불가'' ';
  stSql := stSql + ' ELSE '''' ';
  stSql := stSql + ' END as PERMIT, ';
  stSql := stSql + ' e.FO_CONTENT,b.CA_CARDNO,f.FO_CODENAME,e.FO_FOODAMT ';
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
  stSql := stSql + ' Left Join TB_FOODEVENT e ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CA_CARDNO = e.CA_CARDNO ';
  if cmb_Gubun.ItemIndex <> 0 then
  stSql := stSql + ' AND e.FO_FOODCODE = ''' + FoodCodeList.Strings[cmb_Gubun.itemIndex] + ''' ';
  stSql := stSql + ' AND e.FO_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.Date) + ''') ';
  stSql := stSql + ' Left Join TB_FOODCODE f ';
  stSql := stSql + ' ON (e.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND e.FO_FOODCODE = f.FO_FOODCODE) ';
  stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ';
  if Trim(ed_name.Text) <> '' then stSql := stSql + ' AND a.EM_NAME Like ''%' + Trim(ed_name.Text) + '%'' ';
  if Trim(ed_empNo.Text) <> '' then stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text) + ''' ';
  if cmb_Company.ItemIndex > 0 then stSql := stSql + ' AND  a.CO_COMPANYCODE = ''' + copy(CompanyCodeList.Strings[cmb_Company.ItemIndex],1,3) + ''' ';
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
      stFoodTime := copy(FindField('FO_TIME').AsString,1,2) + ':' +
                  copy(FindField('FO_TIME').AsString,3,2) + ':' +
                  copy(FindField('FO_TIME').AsString,5,2) ;

      with sg_report do
      begin
        Cells[0,nRow] := FormatDateTime('yyyy-mm-dd',dt_Date.Date);
        Cells[1,nRow] := FindField('FO_CODENAME').AsString;
        Cells[2,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[3,nRow] := FindField('DEPART_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := stFoodTime;
        Cells[7,nRow] := FindField('PERMIT').AsString;
        Cells[8,nRow] := FindField('FO_CONTENT').AsString;
        Cells[9,nRow] := FindField('CA_CARDNO').AsString;
        Cells[10,nRow] := FindField('AC_NODENO').AsString;
        Cells[11,nRow] := FindField('FO_DOORNO').AsString;
        Cells[12,nRow] := FindField('AC_MCUID').AsString;
        Cells[13,nRow] := FindField('AC_ECUID').AsString;
        Cells[14,nRow] := FindField('FO_FOODAMT').AsString;  
        if (FindField('CA_CARDNO').AsString + FindField('FO_TIME').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmFoodAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
 
end;

procedure TfmFoodAdmin.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
  end;

end;

procedure TfmFoodAdmin.FormClear;
begin
  ed_FoodAmt.Text := '';
  cmb_Permit.ItemIndex := 0;

  ed_date.Text := '';
  ed_CompanyName.Text := '';
  ed_DepartName.Text := '';
  ed_EmployNo.Text := '';
  ed_EmployName.Text := '';
  ed_FoodTime.Text := '';
  mo_etc.Text :=  '';
  ed_nodeno.Text := '0';
  ed_readerno.Text := '0';
  ed_mcuid.Text := '0000000';
  ed_ecuid.Text := '00';
end;

procedure TfmFoodAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_FoodAmt.Enabled := True;
    cmb_Permit.Enabled := True;

    ed_FoodTime.Enabled := True;
    mo_etc.Enabled := True;
    cmb_sGubun.Enabled := True;

  end else if upperCase(aState) = 'SEARCH' then
  begin
    cmb_sGubun.Enabled := False;
    ed_FoodAmt.Enabled := False;
    cmb_Permit.Enabled := False;

    ed_date.Enabled := False;
    ed_CompanyName.Enabled := False;
    ed_DepartName.Enabled := False;
    ed_EmployNo.Enabled := False;
    ed_EmployName.Enabled := False;
    ed_FoodTime.Enabled := False;
    mo_etc.Enabled := False;
    ed_nodeno.Enabled := False;
    ed_readerno.Enabled := False;
    ed_mcuid.Enabled := False;
    ed_ecuid.Enabled := False;

  end else if upperCase(aState) = 'CLICK' then
  begin
    cmb_sGubun.Enabled := False;
    ed_FoodAmt.Enabled := False;
    cmb_Permit.Enabled := False;

    ed_date.Enabled := False;
    ed_CompanyName.Enabled := False;
    ed_DepartName.Enabled := False;
    ed_EmployNo.Enabled := False;
    ed_EmployName.Enabled := False;
    ed_FoodTime.Enabled := False;
    mo_etc.Enabled := False;
    ed_nodeno.Enabled := False;
    ed_readerno.Enabled := False;
    ed_mcuid.Enabled := False;
    ed_ecuid.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    cmb_sGubun.Enabled := True;
    ed_FoodAmt.Enabled := True;
    cmb_Permit.Enabled := True;

    ed_FoodTime.Enabled := False;
    mo_etc.Enabled := True;
    ed_nodeno.Enabled := False;
    ed_readerno.Enabled := False;
    ed_mcuid.Enabled := False;
    ed_ecuid.Enabled := False;
  end;
end;

initialization
  RegisterClass(TfmFoodAdmin);
Finalization
  UnRegisterClass(TfmFoodAdmin);

end.
