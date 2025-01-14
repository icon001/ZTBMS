unit uFoodAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, StdCtrls, ComCtrls, Buttons,
  uSubForm, CommandArray, AdvObj,DateUtils,ActiveX,ADODB;

type
  TfmFoodAdmin = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
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
    ed_CompanyCode: TEdit;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox4: TGroupBox;
    btn_Update: TSpeedButton;
    btn_save: TSpeedButton;
    btn_delete: TSpeedButton;
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
    GroupBox5: TGroupBox;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    ed_name: TEdit;
    Label17: TLabel;
    cmb_Gubun: TComboBox;
    GroupBox6: TGroupBox;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    ed_JijumName: TEdit;
    Label2: TLabel;
    cmb_FoodArea: TComboBox;
    btn_FileFormat: TSpeedButton;
    btn_FileRead: TSpeedButton;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    sg_FileFormat: TAdvStringGrid;
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
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure btn_FileFormatClick(Sender: TObject);
    procedure btn_FileReadClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    FoodCodeList : TStringList;
    FoodAreaList : TStringList;
    State : String;
    L_stOldPermit : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure Load_FoodCode(cmb_Box:TComboBox);
    procedure PanelClear;
    Function CheckTB_FoodEvent(aDate,aCompanyCode,aEmCode,aFoodCode:string;var aPermit:string):Boolean;
    Function InsertTB_FOODEVENT(aDate,aFoodTime,aNodeNo,aReaderNo,
                   aCompanyCode,
                   aEmCode,
                   aEcuId,
                   aFoodCode,
                   aPermit, //승인유무
                   aContent,aFoodAmt:string):Boolean;
    Function UpdateTB_FOODEVENT(aDate,aFoodTime,aNodeNo,aReaderNo,
                   aCompanyCode,
                   aEmCode,
                   aEcuId,
                   aFoodCode,
                   aPermit, //승인유무
                   aContent,aFoodAmt:string):Boolean;
    Function UpdateTB_FOODEVENT_Gubun(aDate,aFoodTime,aNodeNo,aReaderNo,
                   aCompanyCode,
                   aEmCode,
                   aEcuId,
                   aFoodCode,
                   aPermit, //승인유무
                   aContent,aFoodAmt:string):Boolean;
    Function GetNodeNo(var aEcuId:string):integer;
    Function DeleteTB_FOODEVENT(aDate, aFoodTime, aNodeno,aReaderno,
                   aCompanyCode,aEmCode,aEcuid:string):Boolean;
    Function InsertTB_WORKLOG(aCode,aCommand,aData:string):boolean;
    Function songhoFoodCount_Add(aCompanyCode,aEmCode,aFoodDate,aFoodCode:string):Boolean;
    Function songhoFoodCount_Delete(aCompanyCode,aEmCode,aFoodDate,aFoodCode:string):Boolean;
    function CheckTB_FoodCodeCount(aDate,aFoodCode,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodDayCount(aDate,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodSemesterCount(aYear,aSemesterCode,aCompanyCode,aEMCode:string):integer;
    function CheckTB_FoodWeekCount(aYear,aWeekDay,aCompanyCode,aEMCode:string):integer;
    Function  GetFoodCurrentSemesterCode(aDate:string) : integer;
    procedure SearchFoodEvent(aCode:string);
    Function FoodInfoInsert():Boolean;
    Function FoodFormatCheck():Boolean;
  public
    { Public declarations }
  end;

var
  fmFoodAdmin: TfmFoodAdmin;

implementation
uses uDataModule1,
  uCommonSql,
  uCompanyCodeLoad,
  uMDBSql,
  uPostGreSql,
  uMssql,
  uLomosUtil;

{$R *.dfm}

{ TfmFoodAdmin }

procedure TfmFoodAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  Load_FoodCode(cmb_Gubun);
  Load_FoodCode(cmb_sGubun);

  GridInit(sg_report,10);

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

procedure TfmFoodAdmin.FormCreate(Sender: TObject);
begin
  btn_FileFormat.Visible := False;
  btn_FileRead.Visible := False;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.create;
  FoodCodeList := TStringList.Create;
  FoodAreaList := TStringList.Create;

  LoadFoodArea(FoodAreaList,cmb_FoodArea,False,'');
end;

procedure TfmFoodAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  FoodCodeList.Free;
  FoodAreaList.Free;
  
  Action := caFree;

end;

procedure TfmFoodAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmFoodAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(Self);

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
  stNodeNo,stEcuID,stFoodDoorNo : string;
  stFoodAmt : string;
begin
  stDate := StringReplace(ed_date.Text,'-','',[rfReplaceAll]);
  stFoodTime := StringReplace(ed_FoodTime.Text,':','',[rfReplaceAll]);
  if Trim(stFoodTime) = '' then
  begin
    showmessage('식사시간을 입력하여 주세요.');
    Exit;
  end;
  if cmb_Permit.ItemIndex = 0 then stPermit := 'Y'
  else stPermit := 'N';
  if Trim(ed_nodeno.Text) = '' then stNodeNo := '0'
  else stNodeNo := ed_nodeno.Text;
  stFoodAmt := '0';
  if ed_FoodAmt.Text <> '' then stFoodAmt := ed_FoodAmt.Text;
  if cmb_FoodArea.ItemIndex < 0 then
  begin
    showmessage('식수구역을 선택해 주셔야 합니다.');
    Exit;
  end;
  stNodeNo := copy(FoodAreaList.Strings[cmb_FoodArea.ItemIndex],1,3);
  stEcuID := copy(FoodAreaList.Strings[cmb_FoodArea.ItemIndex],4,2);
  stFoodDoorNo := copy(FoodAreaList.Strings[cmb_FoodArea.ItemIndex],6,1);

  DataModule1.ADOConnectionEVENT.BeginTrans;
  if UpperCase(State) = 'INSERT' then
  begin
    bResult := InsertTB_FOODEVENT(stDate,stFoodTime,stNodeNo,stFoodDoorNo,
                     ed_CompanyCode.Text,ed_EmployNo.Text, stEcuID,
                     FoodCodeList.Strings[cmb_sGubun.ItemIndex],
                     stPermit, //승인유무
                     mo_etc.text,stFoodAmt);
    if bResult  and (G_nSpecialProgram = 5) then   //송호대학교
    begin
      if stPermit = 'Y' then
      begin
        songhoFoodCount_Add(ed_CompanyCode.Text,ed_EmployNo.Text,stDate,FoodCodeList.Strings[cmb_sGubun.ItemIndex]);
      end;
    end;
  end else if UpperCase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_FOODEVENT(stDate,stFoodTime,stNodeNo,stFoodDoorNo,
                   ed_CompanyCode.Text,ed_EmployNo.Text,stEcuID,
                   FoodCodeList.Strings[cmb_sGubun.ItemIndex],
                   stPermit, //승인유무
                   mo_etc.text,stFoodAmt);

    if bResult and (G_nSpecialProgram = 5) then   //송호대학교
    begin
      if L_stOldPermit <> stPermit then
      begin
        if stPermit = 'Y' then
        begin
          songhoFoodCount_Add(ed_CompanyCode.Text,ed_EmployNo.Text,stDate,FoodCodeList.Strings[cmb_sGubun.ItemIndex]);
        end else
        begin
          songhoFoodCount_Delete(ed_CompanyCode.Text,ed_EmployNo.Text,stDate,FoodCodeList.Strings[cmb_sGubun.ItemIndex]);
        end;
      end;
    end;
  end;

  DataModule1.ADOConnectionEVENT.CommitTrans;

//  Delay(100);
  if bResult then searchFoodEvent(ed_CompanyCode.Text + ed_EmployNo.Text + stFoodTime)
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
  btn_SearchClick(Self);

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
  aReaderNo, aCompanyCode,aEmCode,  aEcuId, aFoodCode, aPermit,
  aContent,aFoodAmt:string): Boolean;
var
  nNodeNo : integer;
  stSql : string;
  st : string;
begin
  result := False;
  nNodeNo := strtoint(aNodeNo);
{  if State = 'INSERT' then
  begin
    nNodeNo := GetNodeNo(aEcuId);
  end;
 }
  stSql := ' Insert Into TB_FOODEVENT( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'FO_DATE,';
  stSql := stSql + 'FO_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
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
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aEcuId + ''',';
  stSql := stSql + '''' + aFoodCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''' + aContent + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',' + aFoodAmt + ')';

  result := DataModule1.ProcessEventExecSQL(stSql);

  st := aDate + ';' + aFoodTime + ';' + aNodeNo + ';' + aEcuId + ';' + aReaderNo + ';' + aCompanyCode + ';' + aEmCode + ';'  ;
  InsertTB_WORKLOG('FOODEVENT','INSERT',st);

//
end;

function TfmFoodAdmin.UpdateTB_FOODEVENT(aDate, aFoodTime, aNodeNo,
  aReaderNo, aCompanyCode,aEmCode, aEcuId, aFoodCode, aPermit,
  aContent,aFoodAmt:string): Boolean;
var
  stSql : string;
  st : string;
begin
  result := False;

  stSql := ' Update TB_FOODEVENT Set ';
  stSql := stSql + 'FO_FOODCODE = ''' + aFoodCode + ''', ';
  stSql := stSql + 'FO_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + 'FO_CONTENT  = ''' + aContent + ''',  ';
  stSql := stSql + 'FO_UPDATETIME  = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',  ';
  stSql := stSql + 'FO_UPDATEOPERATOR  = ''' + Master_ID + ''',  ';
  stSql := stSql + 'FO_FOODAMT  = ' + aFoodAmt + '  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + '''  ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
  st := aDate + ';' + aFoodTime + ';' + aNodeNo + ';' + aEcuId + ';' + aReaderNo + ';' + aCompanyCode + ';' + aEmCode + ';'  ;
  InsertTB_WORKLOG('FOODEVENT','UPDATE',st);

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
var
  stNodeNo,stEcuID,stFoodDoorNo:string;
  stFoodAreaCode : string;
  nIndex : integer;
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
    ed_JijumName.Text := Cells[3,Row];
    ed_DepartName.Text := Cells[4,Row];
    ed_EmployNo.Text := Cells[5,Row];
    ed_EmployName.Text := Cells[6,Row];
    ed_CompanyCode.Text := Cells[10,Row];
    ed_FoodTime.Text := Cells[7,Row];
    mo_etc.Text := Cells[9,Row];
    ed_nodeno.Text := Cells[11,Row];
    stNodeNo := Cells[11,Row];
    ed_readerno.Text := Cells[12,Row];
    stFoodDoorNo:= Cells[12,Row];
    ed_mcuid.Text := Cells[13,Row];
    ed_ecuid.Text := Cells[14,Row];
    stEcuID := Cells[14,Row];
    ed_FoodAmt.Text := Cells[15,Row];
    cmb_sGubun.ItemIndex := cmb_sGubun.Items.IndexOf(Cells[1,Row]);
    cmb_Permit.ItemIndex := cmb_Permit.Items.IndexOf(Cells[8,Row]);
    L_stOldPermit := Cells[8,Row];
    if Cells[1,Row] = '' then btn_Update.Enabled := False;

    if isDigit(stNodeNo) then
    begin
      if isDigit(stEcuID) then
      begin
        if isDigit(stFoodDoorNo) then
        begin
          stFoodAreaCode := FillZeroNumber(strtoint(stNodeNo),3) + stEcuID + stFoodDoorNo;
          nIndex := FoodAreaList.IndexOf(stFoodAreaCode);
          if nIndex > -1 then cmb_FoodArea.ItemIndex := nIndex;
        end;
      end;
    end;
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
                   ed_CompanyCode.Text, ed_EmployNo.Text ,ed_ecuid.Text);

  if G_nSpecialProgram = 5 then   //송호대학교
  begin
    songhoFoodCount_Delete(ed_CompanyCode.Text,ed_EmployNo.Text,stDate,FoodCodeList.Strings[cmb_sGubun.ItemIndex]);
  end;
  btn_SearchClick(self);

end;

function TfmFoodAdmin.DeleteTB_FOODEVENT(aDate, aFoodTime, aNodeno,
  aReaderno, aCompanyCode,aEmCode, aEcuid: string): Boolean;
var
  stSql : string;
  st : string;
begin
  result := False;
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_FOODEVENTALL
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_FOODEVENTALL
  else if DBTYPE = 'MSSQL' then stSql := MsSql.SelectTB_FOODEVENTALL
  else Exit;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

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
    if G_nFoodAdminGrade = 0 then
    begin
      if FindField('FO_PERMIT').asstring <> 'N' then
      begin
        if FindField('FO_INSERTOPERATOR').asstring <> Master_ID then
        begin
          showmessage('식수데이터 삭제는 최초등록자만 가능합니다.');
          Exit;
        end;
      end;
    end;
  end;

  stSql := ' delete from TB_FOODEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + aFoodTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  DataModule1.ProcessEventExecSQL(stSql);
  st := aDate + ';' + aFoodTime + ';' + aNodeNo + ';' + aEcuId + ';' + aReaderNo + ';' + aCompanyCode + ';' + aEmCode + ';'  ;
  InsertTB_WORKLOG('FOODEVENT','DELETE',st);

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
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + Master_ID + ''') ';

  result := DataModule1.ProcessLogExecSQL(stSql);

end;

procedure TfmFoodAdmin.SearchFoodEvent(aCode:string);
var
  stSql : string;
  i :integer;
  nRow : integer;
  stFoodTime : string;
  stDate : string;
  stFoodCode : string;
begin
  RowGridInitialize(sg_report); //스트링그리드 초기화

  L_stOldPermit := '';
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stDate :=  FormatDateTime('yyyymmdd',dt_Date.Date);
  if cmb_Gubun.ItemIndex <> 0 then stFoodCode := FoodCodeList.Strings[cmb_Gubun.itemIndex]
  else stFoodCode := '';

  if DBTYPE = 'MDB' then stSql := MDBSQL.SelectTB_EMPLOYEEJoinFoodCode(stDate,stFoodCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinFoodCode(stDate,stFoodCode)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinFoodCode(stDate,stFoodCode)
  else Exit;

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
    stSql := stSql + ' AND a.EM_NAME LIKE ''%' + Trim(ed_name.Text)  + '%'' ';


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
        Cells[3,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[4,nRow] := FindField('DEPART_NAME').AsString;
        Cells[5,nRow] := FindField('EM_CODE').AsString;
        Cells[6,nRow] := FindField('EM_NAME').AsString;
        Cells[7,nRow] := stFoodTime;
        Cells[8,nRow] := FindField('PERMIT').AsString;
        Cells[9,nRow] := FindField('FO_CONTENT').AsString;
        Cells[10,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[11,nRow] := FindField('AC_NODENO').AsString;
        Cells[12,nRow] := FindField('FO_DOORNO').AsString;
        Cells[13,nRow] := FindField('AC_MCUID').AsString;
        Cells[14,nRow] := FindField('AC_ECUID').AsString;
        Cells[15,nRow] := FindField('FO_FOODAMT').AsString;
        if (FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString + FindField('FO_TIME').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  sg_reportClick(sg_report);
end;

procedure TfmFoodAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//  if Not IsMaster then
//  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
//    if IsUpdateGrade then btn_Update.Enabled := True
//    else btn_Update.Enabled := False;
//    if IsDeleteGrade then btn_Delete.Enabled := True
//    else btn_Delete.Enabled := False;
//  end;
 
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
  cmb_FoodArea.ItemIndex := 0;
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
    cmb_FoodArea.Enabled := True;

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
    cmb_FoodArea.Enabled := False;

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
    cmb_FoodArea.Enabled := False;
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
    cmb_FoodArea.Enabled := False;
  end;
end;

procedure TfmFoodAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmFoodAdmin.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmFoodAdmin.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

function TfmFoodAdmin.songhoFoodCount_Add(aCompanyCode, aEmCode, aFoodDate,
  aFoodCode: string): Boolean;
var
  nWeekDay : integer;
  nSemesterCode : integer;
  dtTime : TDateTime;
  stSql : string;
begin
  if CheckTB_FoodCodeCount(aFoodDate,aFoodCode,aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FOODCODECount_Inc(aFoodDate,aFoodCode,aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
    stSql := CommonSql.InsertIntoTB_FOODCODECount(aFoodDate,aFoodCode,aCompanyCode,aEmCode,'1');
    DataModule1.ProcessExecSQL(stSql);
  end;

  if CheckTB_FoodDayCount(aFoodDate,aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodDayCount_Inc(aFoodDate,aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
    stSql := CommonSql.InsertIntoTB_FoodDayCount(aFoodDate,aCompanyCode,aEmCode,'1');
    DataModule1.ProcessExecSQL(stSql);
  end;

  dtTime := EncodeDateTime(strtoint(copy(aFoodDate,1,4)),
                                           strtoint(copy(aFoodDate,5,2)),
                                           strtoint(copy(aFoodDate,7,2)),
                                           0,0,0,0);
  nWeekDay := WeekOf(dtTime);
  if CheckTB_FoodWeekCount(copy(aFoodDate,1,4),inttostr(nWeekDay),aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodWeekCount_Inc(copy(aFoodDate,1,4),inttostr(nWeekDay),aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
    stSql := CommonSql.InsertIntoTB_FoodWeekCount(copy(aFoodDate,1,4),inttostr(nWeekDay),aCompanyCode,aEmCode,'1');
    DataModule1.ProcessExecSQL(stSql);
  end;

  nSemesterCode := GetFoodCurrentSemesterCode(aFoodDate);
  if CheckTB_FoodSemesterCount(copy(aFoodDate,1,4),inttostr(nSemesterCode),aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodSemesterCount_Inc(copy(aFoodDate,1,4),inttostr(nSemesterCode),aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
    stSql := CommonSql.InsertIntoTB_FoodSemesterCount(copy(aFoodDate,1,4),inttostr(nSemesterCode),aCompanyCode,aEmCode,'1');
    DataModule1.ProcessExecSQL(stSql);
  end;
end;

function TfmFoodAdmin.songhoFoodCount_Delete(aCompanyCode, aEmCode,
  aFoodDate, aFoodCode: string): Boolean;
var
  nWeekDay : integer;
  nSemesterCode : integer;
  dtTime : TDateTime;
  stSql : string;
begin
  if CheckTB_FoodCodeCount(aFoodDate,aFoodCode,aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FOODCODECount_Dec(aFoodDate,aFoodCode,aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면 아무것도 하지 않는다
  end;

  if CheckTB_FoodDayCount(aFoodDate,aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodDayCount_Dec(aFoodDate,aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
  end;

  dtTime := EncodeDateTime(strtoint(copy(aFoodDate,1,4)),
                                           strtoint(copy(aFoodDate,5,2)),
                                           strtoint(copy(aFoodDate,7,2)),
                                           0,0,0,0);
  nWeekDay := WeekOf(dtTime);
  if CheckTB_FoodWeekCount(copy(aFoodDate,1,4),inttostr(nWeekDay),aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodWeekCount_Dec(copy(aFoodDate,1,4),inttostr(nWeekDay),aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
  end;

  nSemesterCode := GetFoodCurrentSemesterCode(aFoodDate);
  if CheckTB_FoodSemesterCount(copy(aFoodDate,1,4),inttostr(nSemesterCode),aCompanyCode,aEmCode) = 1 then
  begin
    //존재 하는 경우
    stSql := CommonSql.UpdateTB_FoodSemesterCount_Dec(copy(aFoodDate,1,4),inttostr(nSemesterCode),aCompanyCode,aEmCode);
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    //존재하지 않으면
  end;
end;

function TfmFoodAdmin.CheckTB_FoodCodeCount(aDate, aFoodCode, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodCodeCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FC_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodAdmin.CheckTB_FoodDayCount(aDate, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodDayCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FD_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodAdmin.CheckTB_FoodSemesterCount(aYear, aSemesterCode,
  aCompanyCode, aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodSemesterCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FS_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND SE_CODE = ' + aSemesterCode + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodAdmin.CheckTB_FoodWeekCount(aYear, aWeekDay, aCompanyCode,
  aEMCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := -1;
  stSql := 'Select * from TB_FoodWeekCount ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FW_YEAR = ''' + aYear + ''' ';
  stSql := stSql + ' AND FW_WEEKDAY = ' + aWeekDay + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodAdmin.GetFoodCurrentSemesterCode(aDate: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stDate : string;
begin
  stDate := copy(aDate,5,4);
  result := 0;
  stSql := 'Select * from TB_SEMESTER ';
  stSql := stSql + ' where SE_STARTDATE < ''' + stDate + ''' ';
  stSql := stSql + ' AND SE_ENDDATE > ''' + stDate + ''' ';
  stSql := stSql + ' AND SE_USE = ''Y'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then Exit;
      result := FindField('SE_CODE').AsInteger;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmFoodAdmin.btn_FileFormatClick(Sender: TObject);
var
  stFile : string;
begin
  GridInitialize(sg_FileFormat);
  SaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
    stFile:= SaveDialog1.FileName;
    sg_FileFormat.SaveToCSV(stFile);
  end;
end;

procedure TfmFoodAdmin.btn_FileReadClick(Sender: TObject);
var
  stFile : string;
  i : integer;
begin
  if Application.MessageBox(pchar('업로드할 파일의 포맷을 정확히 확인 하셨습니까?'),'정보',mb_okcancel) = idcancel then Exit;
  GridInitialize(sg_FileFormat);
  OpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
    stFile:= OpenDialog1.FileName;
    sg_FileFormat.LoadFromCSV(stFile);
  end else Exit;

  if Not FoodInfoInsert then
  begin
    Exit;
  end;
  showmessage('식수정보 입력 완료!!!');
  btn_SearchClick(self);

end;

function TfmFoodAdmin.FoodInfoInsert: Boolean;
var
  nRow : integer;
  i : integer;
  stNodeNo,stEcuID,stFoodDoorNo : string;
  bResult : Boolean;
  stOldPermit : string;
begin
  result := False;
  if Not FoodFormatCheck() then Exit;

  DataModule1.ADOConnectionEVENT.BeginTrans;
  Try

    with sg_FileFormat do
    begin
      for i := 1 to RowCount do
      begin
        if(cells[0,i]='') then continue;
        stNodeNo := copy(FoodAreaList.Strings[strtoint(cells[6,i])],1,3);
        stEcuID := copy(FoodAreaList.Strings[strtoint(cells[6,i])],4,2);
        stFoodDoorNo := copy(FoodAreaList.Strings[strtoint(cells[6,i])],6,1);

        if CheckTB_FoodEvent(cells[0,i],cells[2,i],cells[3,i],FoodCodeList.Strings[strtoint(cells[1,i])],stOldPermit) then
        begin
          bResult := UpdateTB_FOODEVENT_Gubun(cells[0,i],cells[4,i],stNodeNo,stFoodDoorNo,
                         cells[2,i],cells[3,i],stEcuID,
                         FoodCodeList.Strings[strtoint(cells[1,i])],
                         'Y', //승인유무
                         cells[7,i],cells[5,i]);

          if bResult and (G_nSpecialProgram = 5) then   //송호대학교
          begin
            if stOldPermit <> 'Y' then
            begin
                songhoFoodCount_Add(cells[2,i],cells[3,i],cells[0,i],FoodCodeList.Strings[strtoint(cells[1,i])]);
            end;
          end;

        end else
        begin
          bResult := InsertTB_FOODEVENT(cells[0,i],cells[4,i],stNodeNo,stFoodDoorNo,
                       cells[2,i],cells[3,i], stEcuID,
                       FoodCodeList.Strings[strtoint(cells[1,i])],
                       'Y', //승인유무
                       cells[7,i],cells[5,i]);
          if bResult  and (G_nSpecialProgram = 5) then   //송호대학교
          begin
            songhoFoodCount_Add(cells[2,i],cells[3,i],cells[0,i],FoodCodeList.Strings[strtoint(cells[1,i])]);
          end;
        end;

      end;
    end;

  Except
    showmessage('식수 입력 실패');
    DataModule1.ADOConnectionEVENT.RollbackTrans;
    Exit;
  End;

  DataModule1.ADOConnectionEVENT.CommitTrans;

  result := True;
end;

function TfmFoodAdmin.FoodFormatCheck: Boolean;
var
  nRow : integer;
  i : integer;
begin
  result := False;
  with sg_FileFormat do
  begin
    for i := 1 to RowCount do
    begin
      if(cells[0,i] <> '') then
      begin
        cells[0,i] := stringReplace(cells[0,i],'-','',[rfReplaceAll]);
        if( length(cells[0,i]) <> 8 ) then
        begin
          showmessage('날짜 포맷은 yyyymmdd 형태입니다.');
          Exit;
        end;
        if( Not isdigit(cells[0,i]) ) then
        begin
          showmessage('날짜 포맷은 yyyymmdd 형태입니다.');
          Exit;
        end;
        if( Not isdigit(cells[1,i]) ) then
        begin
          showmessage('식수구분은 조식(1),중식(2),석식(3),야식(4)의 숫자 타입으로 입력 하셔야 합니다.');
          Exit;
        end;
        if( FoodCodeList.Count < strtoint(cells[1,i]) ) then
        begin
          showmessage('식수구분은 조식(1),중식(2),석식(3),야식(4)의 숫자 타입으로 입력 하셔야 합니다.');
          Exit;
        end;
        if( Not isdigit(cells[2,i]) ) then
        begin
          cells[2,i] := '001';
        end;
        cells[2,i] := FillZeroStrNum(cells[2,i],3);
        if Trim(cells[3,i]) = ''  then
        begin
          showmessage('사번이 입력되지 않은 데이터가 있습니다.');
          Exit;
        end;
        cells[4,i] := stringReplace(cells[4,i],'-','',[rfReplaceAll]);
        cells[4,i] := stringReplace(cells[4,i],':','',[rfReplaceAll]);
        if( Not isdigit(cells[4,i]) ) then
        begin
          showmessage('식사시간 포맷은 hhnnss(시분초) 형태입니다.');
          Exit;
        end;
        cells[4,i] := FillZeroStrNum(cells[4,i],6);
        if( Not isdigit(cells[5,i]) ) then cells[5,i] := '0';  //식수금액
        if( Not isdigit(cells[6,i]) ) then cells[6,i] := '0';  //식수구역
        if cmb_FoodArea.Items.Count <= strtoint(cells[6,i]) then
        begin
          showmessage('식수구역은 범위 안에서 선택하셔야 합니다.');
          Exit;
        end;
      end;
    end;
  end;
  result := True;
end;

function TfmFoodAdmin.CheckTB_FoodEvent(aDate, aCompanyCode, aEmCode,
  aFoodCode: string;var aPermit:string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_FoodEvent ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    With TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := False;
      if recordcount < 1 then Exit;
      aPermit := FindField('aPermit').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmFoodAdmin.UpdateTB_FOODEVENT_Gubun(aDate, aFoodTime, aNodeNo,
  aReaderNo, aCompanyCode, aEmCode, aEcuId, aFoodCode, aPermit, aContent,
  aFoodAmt: string): Boolean;
var
  stSql : string;
  st : string;
begin
  result := False;

  stSql := ' Update TB_FOODEVENT Set ';
  stSql := stSql + ' AC_NODENO = ' + aNodeNo;
  stSql := stSql + ' AC_ECUID = ''' + aEcuId + ''' ';
  stSql := stSql + ' FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' FO_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' FO_CONTENT  = ''' + aContent + ''',  ';
  stSql := stSql + ' FO_UPDATETIME  = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',  ';
  stSql := stSql + ' FO_FOODAMT  = ' + aFoodAmt + '  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFoodCode + ''', ';
  stSql := stSql + ' AND FO_UPDATEOPERATOR  = ''' + Master_ID + ''',  ';

  result := DataModule1.ProcessEventExecSQL(stSql);
  st := aDate + ';' + aFoodTime + ';' + aNodeNo + ';' + aEcuId + ';' + aReaderNo + ';' + aCompanyCode + ';' + aEmCode + ';'  ;
  InsertTB_WORKLOG('FOODEVENT','UPDATE',st);
end;

initialization
  RegisterClass(TfmFoodAdmin);
Finalization
  UnRegisterClass(TfmFoodAdmin);

end.
