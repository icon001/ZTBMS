unit uCompanyAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, AdvPanel, Grids, BaseGrid, AdvGrid, StdCtrls,
  Spin, DB, ADODB, ComCtrls, uSubForm, CommandArray,ActiveX, Gauges,iniFiles,
  ComObj;

type
  TfmCompanyAdmin = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    cmb_spgGroup: TComboBox;
    ed_scompanycode: TEdit;
    Label1: TLabel;
    btn_Search: TBitBtn;
    sg_Company: TAdvStringGrid;
    Panel12: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Label3: TLabel;
    ed_sCompanyName: TEdit;
    Splitter1: TSplitter;
    Label4: TLabel;
    ed_CompanyID: TEdit;
    Label5: TLabel;
    ed_CompanyName: TEdit;
    Label6: TLabel;
    ed_Phone: TEdit;
    Label7: TLabel;
    ed_Fax: TEdit;
    Label8: TLabel;
    ed_Addr1: TEdit;
    Label9: TLabel;
    ed_Addr2: TEdit;
    btn_Manager: TSpeedButton;
    TempQuery: TADOQuery;
    chk_AutoCompanyCode: TCheckBox;
    dt_sJoinDt: TDateTimePicker;
    Label14: TLabel;
    Label15: TLabel;
    ed_AuthKey: TEdit;
    Label16: TLabel;
    ed_Hompage: TEdit;
    GroupBox2: TGroupBox;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    cmb_pgGroup: TComboBox;
    Label11: TLabel;
    se_monitor: TSpinEdit;
    Label12: TLabel;
    se_Attend: TSpinEdit;
    Label13: TLabel;
    se_Food: TSpinEdit;
    Panel3: TPanel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    ed_mcusalecount: TEdit;
    ed_mcuver: TEdit;
    GroupBox5: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    ed_ecusalecount: TEdit;
    ed_ecuver: TEdit;
    GroupBox7: TGroupBox;
    mem_etc: TMemo;
    GroupBox3: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    ed_Readersalecount: TEdit;
    ed_Readerver: TEdit;
    btn_Excel: TSpeedButton;
    pan_gauge: TPanel;
    Label23: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure chk_AutoCompanyCodeClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_CompanyClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_ManagerClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure ed_sCompanyNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_scompanycodeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
  private
    State : string;
    ProgramTypeList :TStringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure cmbPGTypeLoad(cmb_Box:TComboBox;bAll:Boolean = True);
  private
    procedure ShowCompanyID(aCode:string;aTopRow:integer = 0);
    procedure showDeviceInfo(aCompanyID:string);
    Function GetAutoCompanyCode:string;

    Function DeleteTB_AUTHCOMPANY(aCode:string):Boolean;
    Function DeleteTB_AUTHDEVICE(aCode:string):Boolean;
    Function DeleteTB_AUTHMANAGERCompany(aCompanyCode:string):Boolean;

    Function InsertTB_AUTHCOMPANY(aCompanyID,aCompanyName,
                                  aAuthKey,aPhone,aFax,aHompage,
                                  aAddr1,aAddr2,aPgType,amonitor,aAttend,
                                  aFood,aEtc,aJoinDt:string):Boolean;
    Function UpdateTB_AUTHCOMPANY(aCompanyID,aCompanyName,
                                  aAuthKey,aPhone,aFax,aHompage,
                                  aAddr1,aAddr2,aPgType,amonitor,aAttend,
                                  aFood,aEtc,aJoinDt:string):Boolean;

    Function InsertTB_AUTHCOUNT(aCompanyID,aPasswd,aGubun,aCount:string):Boolean;
    Function UpdateTB_AUTHCOUNT(aCompanyID,aPasswd,aGubun,aCount:string):Boolean;
    Function InsertTB_AUTHDEVICE(aCompanyID,aDeviceGubun,aSaleCount,amcuver:string):Boolean;
    Function UpdateTB_AUTHDEVICE(aCompanyID,aDeviceGubun,aSaleCount,amcuver:string):Boolean;
    Function InsertTB_CUSTOMERID(aPhone,aCompanyID,aManagerID,aGubun:string):Boolean;
    Function UpdateTB_CUSTOMERID(aPhone,aCompanyID,aManagerID,aGubun:string):Boolean;

    Function ExcelPrintOut(StringGrid:TAdvStringGrid;refFileName,SaveFileName:String;FileOut:Boolean;ExcelRowStart:integer;stTitle:string;bRowHeader,bColHeader:Boolean):Boolean;
  public
    { Public declarations }
  end;

var
  fmCompanyAdmin: TfmCompanyAdmin;

implementation
uses
  uDataModule,
  uLomosUtil, uManagerAdmin, uManagerAdminN;
{$R *.dfm}


procedure TfmCompanyAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ProgramTypeList.Free;

  Action := caFree;
end;

procedure TfmCompanyAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompanyAdmin.cmbPGTypeLoad(cmb_Box: TComboBox;bAll:Boolean = True);
var
  stSql : string;
begin
  cmb_Box.Clear;
  ProgramTypeList.Clear;
  if bAll then cmb_Box.Items.Add('000.전체')
  else cmb_Box.Items.Add('');
  ProgramTypeList.Add('');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_AUTHPGTYPE ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AP_PGTYPE').AsString + '.' + FindField('AP_PGNAME').AsString );
      ProgramTypeList.Add(FindField('AP_PGTYPE').AsString);
      Next;
    end;
  end;
end;

procedure TfmCompanyAdmin.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmCompanyAdmin.FormClear;
begin
    ed_CompanyID.Text := '';
    ed_AuthKey.Text := '';
    ed_CompanyName.Text := '';
    ed_Phone.Text := '';
    ed_Fax.Text := '';
    ed_Addr1.Text := '';
    ed_Addr2.Text := '';
    cmb_pgGroup.ItemIndex := 0;
    se_monitor.Value := 0;
    se_Attend.Value := 0;
    se_Food.Value := 0;
    dt_sJoinDt.Date := Now;
    ed_Hompage.Text := '';
    ed_mcusalecount.Text := '';
    ed_ecusalecount.Text := '';
    ed_Readersalecount.Text := '';
    ed_mcuVer.Text := '';
    ed_ecuVer.Text := '';
    ed_ReaderVer.Text := '';
    mem_etc.Text := '';
end;

procedure TfmCompanyAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Company.Enabled := False;
    ed_CompanyID.Enabled := true;
    ed_AuthKey.Enabled := True;
    ed_CompanyName.Enabled  := true;
    ed_Phone.Enabled := True;
    ed_Fax.Enabled := True;
    ed_Addr1.Enabled := True;
    ed_Addr2.Enabled := True;
    cmb_pgGroup.Enabled := True;
    se_monitor.Enabled := True;
    se_Attend.Enabled := True;
    se_Food.Enabled := True;
    chk_AutoCompanyCode.Enabled := True;
    btn_Manager.Enabled := True;
    dt_sJoinDt.Enabled := True;
    ed_Hompage.Enabled := True;
    ed_mcusalecount.Enabled := True;
    ed_ecusalecount.Enabled := True;
    ed_Readersalecount.Enabled := True;
    ed_mcuVer.Enabled := True;
    ed_ecuVer.Enabled := True;
    ed_ReaderVer.Enabled := True;
    //mem_etc.Enabled := True;
    mem_etc.ReadOnly := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Company.Enabled := true;
    ed_CompanyID.Enabled := False;
    ed_AuthKey.Enabled := False;
    ed_CompanyName.Enabled  := False;
    ed_Phone.Enabled := False;
    ed_Fax.Enabled := False;
    ed_Addr1.Enabled := False;
    ed_Addr2.Enabled := False;
    cmb_pgGroup.Enabled := False;
    se_monitor.Enabled := False;
    se_Attend.Enabled := False;
    se_Food.Enabled := False;
    chk_AutoCompanyCode.Enabled := False;
    btn_Manager.Enabled := False;
    dt_sJoinDt.Enabled := False;
    ed_Hompage.Enabled := False;
    ed_mcusalecount.Enabled := False;
    ed_ecusalecount.Enabled := False;
    ed_Readersalecount.Enabled := False;
    ed_mcuVer.Enabled := False;
    ed_ecuVer.Enabled := False;
    ed_ReaderVer.Enabled := False;
    //mem_etc.Enabled := False;
    mem_etc.ReadOnly := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Company.Enabled := true;
    ed_CompanyID.Enabled := False;
    ed_AuthKey.Enabled := False;
    ed_CompanyName.Enabled  := False;
    ed_Phone.Enabled := False;
    ed_Fax.Enabled := False;
    ed_Addr1.Enabled := False;
    ed_Addr2.Enabled := False;
    cmb_pgGroup.Enabled := False;
    se_monitor.Enabled := False;
    se_Attend.Enabled := False;
    se_Food.Enabled := False;
    chk_AutoCompanyCode.Enabled := False;
    btn_Manager.Enabled := False;
    dt_sJoinDt.Enabled := False;
    ed_Hompage.Enabled := False;
    ed_mcusalecount.Enabled := False;
    ed_ecusalecount.Enabled := False;
    ed_Readersalecount.Enabled := False;
    ed_mcuVer.Enabled := False;
    ed_ecuVer.Enabled := False;
    ed_ReaderVer.Enabled := False;
    //mem_etc.Enabled := False;
    mem_etc.ReadOnly := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Company.Enabled := False;
    ed_CompanyID.Enabled := False;
    chk_AutoCompanyCode.Enabled := False;
    ed_AuthKey.Enabled := True;
    ed_CompanyName.Enabled  := true;
    ed_Phone.Enabled := True;
    ed_Fax.Enabled := True;
    ed_Addr1.Enabled := True;
    ed_Addr2.Enabled := True;
    cmb_pgGroup.Enabled := True;
    se_monitor.Enabled := True;
    se_Attend.Enabled := True;
    se_Food.Enabled := True;
    btn_Manager.Enabled := True;
    dt_sJoinDt.Enabled := True;
    ed_Hompage.Enabled := False;
    ed_mcusalecount.Enabled := True;
    ed_ecusalecount.Enabled := True;
    ed_Readersalecount.Enabled := True;
    ed_mcuVer.Enabled := True;
    ed_ecuVer.Enabled := True;
    ed_ReaderVer.Enabled := True;
    //mem_etc.Enabled := true;
    mem_etc.ReadOnly := False;
  end;
end;

procedure TfmCompanyAdmin.chk_AutoCompanyCodeClick(Sender: TObject);
begin
  if chk_AutoCompanyCode.Checked then ed_CompanyID.Text := GetAutoCompanyCode;

end;

function TfmCompanyAdmin.GetAutoCompanyCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 1;
  stSql := 'select MAX(AC_COMPANYID) as AC_COMPANYID from TB_AUTHCOMPANY ';
  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := 'Z-' + FillZeroNumber(nSeq,8);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(copy(FindField('AC_COMPANYID').AsString,3,8)) then
      begin
        nSeq := strtoint(copy(FindField('AC_COMPANYID').AsString,3,8)) + 1;
      end;
    end;
  end;
  result := 'Z-' + FillZeroNumber(nSeq,8);
end;

procedure TfmCompanyAdmin.btn_SearchClick(Sender: TObject);
begin
  ShowCompanyID('');
end;

procedure TfmCompanyAdmin.ShowCompanyID(aCode: string;aTopRow:integer=0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  stWhere : string;
begin
  GridInitialize(sg_Company); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stWhere := '';

  stSql := 'select a.*,b.Maxcount as MonitorCnt,c.Maxcount as AtCnt,d.Maxcount as FoodCnt ';
  stSql := stSql + ' from TB_AUTHCOMPANY a ';
  stSql := stSql + ' Left Join TB_AUTHCOUNT b ';
  stSql := stSql + ' ON (a.AC_COMPANYID = b.saupid ';
  stSql := stSql + ' AND b.GUBUN = ''2'') '; // 모니터링 프로그램
  stSql := stSql + ' Left Join TB_AUTHCOUNT c ';
  stSql := stSql + ' ON (a.AC_COMPANYID = c.saupid ';
  stSql := stSql + ' AND c.GUBUN = ''3'') '; // 근태 프로그램
  stSql := stSql + ' Left Join TB_AUTHCOUNT d ';
  stSql := stSql + ' ON (a.AC_COMPANYID = d.saupid ';
  stSql := stSql + ' AND d.GUBUN = ''4'') '; // 식수 프로그램
  if cmb_spgGroup.ItemIndex > 0 then
    stWhere := ' where a.AC_CPPGTYPE = ''' + FindCharCopy(cmb_spgGroup.Text,0,'.') + ''' ';
  if Trim(ed_scompanycode.Text) <> '' then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' AC_COMPANYID Like ''%' + Trim(ed_scompanycode.Text) + '%'' ';
  end;
  if Trim(ed_sCompanyName.Text) <> '' then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' AC_CPNAME Like ''%' + Trim(ed_sCompanyName.Text) + '%'' ';
  end;

  if Trim(stWhere) <> '' then stSql := stSql + stWhere;

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection1;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_Company do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AC_COMPANYID').AsString;
        cells[1,nRow] := FindField('AC_CPNAME').AsString;
        cells[2,nRow] := FindField('AC_AUTHKEY').AsString;
        cells[3,nRow] := FindField('AC_CPPHONE').AsString;
        cells[4,nRow] := FindField('AC_CPFAX').AsString;
        cells[5,nRow] := FindField('AC_CPADDR1').AsString;
        cells[6,nRow] := FindField('AC_CPADDR2').AsString;
        cells[7,nRow] := FindField('AC_CPPGTYPE').AsString;
        cells[8,nRow] := FindField('AC_REGDATE').AsString;
        cells[9,nRow] := FindField('MonitorCnt').AsString;
        cells[10,nRow] := FindField('AtCnt').AsString;
        cells[11,nRow] := FindField('FoodCnt').AsString;
        cells[12,nRow] := FindField('AC_HOMEPAGE').AsString;
        cells[13,nRow] := FindField('AC_MEMO').AsString;


        if FindField('AC_COMPANYID').AsString  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if Row > 15 then TopRow := row - 14;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_CompanyClick(sg_Company);
end;

procedure TfmCompanyAdmin.sg_CompanyClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_CompanyID.Text := cells[0,Row];
    ed_CompanyName.Text := cells[1,Row];
    ed_AuthKey.Text := cells[2,Row];
    ed_Phone.Text := cells[3,Row];
    ed_Fax.Text := cells[4,Row];
    ed_Addr1.Text := cells[5,Row];
    ed_Addr2.Text := cells[6,Row];
    nIndex := ProgramTypeList.IndexOf(cells[7,Row]);
    if nIndex > 0 then cmb_pgGroup.ItemIndex := nIndex;
    if Trim(cells[8,Row]) <> '' then
      dt_sJoinDt.Date := strToDate(copy(cells[8,Row],1,4) + '-' + copy(cells[8,Row],5,2) + '-' + copy(cells[8,Row],7,2) );
    if IsDigit(cells[9,Row]) then
      se_monitor.Value := strtoint(cells[9,Row]);
    if IsDigit(cells[10,Row]) then
      se_Attend.Value := strtoint(cells[10,Row]);
    if IsDigit(cells[11,Row]) then
      se_Food.Value := strtoint(cells[11,Row]);
    ed_Hompage.Text := cells[12,Row];
    mem_etc.Text := cells[13,Row];
    showDeviceInfo(cells[0,Row]);
  end;
end;

procedure TfmCompanyAdmin.btn_CancelClick(Sender: TObject);
begin
  if UpperCase('State') = 'INSERT' then
    DeleteTB_AUTHMANAGERCompany(ed_CompanyID.Text);
  ShowCompanyID(ed_CompanyID.Text,sg_Company.TopRow);

end;

procedure TfmCompanyAdmin.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Company do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 18 then TopRow := RowCount - 17;
      Enabled := False;
    end;
  end;
  if chk_AutoCompanyCode.Checked then
  begin
    chk_AutoCompanyCodeClick(self);
    ed_CompanyName.SetFocus;
  end
  else  ed_CompanyID.SetFocus;

  ed_AuthKey.Text := FormatDateTime('nnsshh',now);

  cmb_pgGroup.ItemIndex := cmb_spgGroup.ItemIndex;
  se_monitor.Value := 1;
  
end;

procedure TfmCompanyAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_CompanyName.SetFocus;

end;

procedure TfmCompanyAdmin.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_AUTHCOMPANY(ed_CompanyID.Text);
  if bResult then
  begin
    DeleteTB_AUTHDEVICE(ed_CompanyID.Text);
  end;

  if bResult then ShowCompanyID('')
  else showmessage('삭제실패.');

end;

function TfmCompanyAdmin.DeleteTB_AUTHCOMPANY(aCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_AUTHCOMPANY ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCompanyAdmin.FormCreate(Sender: TObject);
begin
  ProgramTypeList := TStringList.Create;
end;

function TfmCompanyAdmin.DeleteTB_AUTHMANAGERCompany(
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_AUTHMANAGER ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aCompanyCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCompanyAdmin.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  stPgType : string;
  stPhone:string;
  stMemo : string;
begin
  stPhone := Trim(StringReplace(ed_Phone.Text,'-','',[rfReplaceAll]));
  if Not isDigit(stPhone) then
  begin
    if stPhone <> '' then
    begin
      showmessage('대표전화번호가 이상합니다.');
      Exit;
    end;
  end;
  stPgType := '';
  stMemo := StringReplace(mem_etc.Text,'''','''''',[rfReplaceAll]);
  if cmb_pgGroup.ItemIndex > 0 then stPgType := ProgramTypeList.Strings[cmb_pgGroup.ItemIndex];
  if UpperCase(State) = 'INSERT' then
  begin
    bResult := InsertTB_AUTHCOMPANY(ed_CompanyID.Text,
                                    ed_CompanyName.Text,
                                    ed_AuthKey.Text,
                                    ed_Phone.Text,
                                    ed_Fax.Text,
                                    ed_Hompage.Text,
                                    ed_Addr1.Text,
                                    ed_Addr2.Text,
                                    stPgType,
                                    inttostr(se_monitor.Value),
                                    inttostr(se_Attend.Value),
                                    inttostr(se_Food.Value),
                                    stMemo,
                                    FormatDateTime('yyyymmdd',dt_sJoinDt.Date)
                                    );
    if bResult then
    begin
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'2',inttostr(se_monitor.Value)) then  //모니터링
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'2',inttostr(se_monitor.Value));
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'3',inttostr(se_Attend.Value)) then  //근태
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'3',inttostr(se_Attend.Value));
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'4',inttostr(se_Food.Value)) then  //식수
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'4',inttostr(se_Food.Value));
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'001',ed_mcusalecount.Text,ed_mcuver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'001',ed_mcusalecount.Text,ed_mcuver.Text);
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'002',ed_ecusalecount.Text,ed_ecuver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'002',ed_ecusalecount.Text,ed_ecuver.Text);
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'003',ed_Readersalecount.Text,ed_Readerver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'003',ed_Readersalecount.Text,ed_Readerver.Text);
    end;
  end
  else if UpperCase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_AUTHCOMPANY(ed_CompanyID.Text,
                                    ed_CompanyName.Text,
                                    ed_AuthKey.Text,
                                    ed_Phone.Text,
                                    ed_Fax.Text,
                                    ed_Hompage.Text,
                                    ed_Addr1.Text,
                                    ed_Addr2.Text,
                                    stPgType,
                                    inttostr(se_monitor.Value),
                                    inttostr(se_Attend.Value),
                                    inttostr(se_Food.Value),
                                    stMemo,
                                    FormatDateTime('yyyymmdd',dt_sJoinDt.Date)
                                    );
    if bResult then
    begin
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'2',inttostr(se_monitor.Value)) then  //모니터링
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'2',inttostr(se_monitor.Value));
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'3',inttostr(se_Attend.Value)) then  //근태
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'3',inttostr(se_Attend.Value));
      if Not InsertTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'4',inttostr(se_Food.Value)) then  //식수
         UpdateTB_AUTHCOUNT(ed_CompanyID.Text,ed_AuthKey.Text,'4',inttostr(se_Food.Value));
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'001',ed_mcusalecount.Text,ed_mcuver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'001',ed_mcusalecount.Text,ed_mcuver.Text);
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'002',ed_ecusalecount.Text,ed_ecuver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'002',ed_ecusalecount.Text,ed_ecuver.Text);
      if Not InsertTB_AUTHDEVICE(ed_CompanyID.Text,'003',ed_Readersalecount.Text,ed_Readerver.Text) then //MCU정보 인서트
         UpdateTB_AUTHDEVICE(ed_CompanyID.Text,'003',ed_Readersalecount.Text,ed_Readerver.Text);
    end;
  end;

  if stPhone <> '' then
  begin
    if Not InsertTB_CUSTOMERID(stPhone,ed_CompanyID.Text,'0','0') then
      UpdateTB_CUSTOMERID(stPhone,ed_CompanyID.Text,'0','0');
  end;

  if bResult then
  begin
    if UpperCase(State) = 'UPDATE' then ShowCompanyID(ed_CompanyID.Text,sg_Company.TopRow)
    else ShowCompanyID(ed_CompanyID.Text);
  end
  else showmessage('저장실패');

end;

function TfmCompanyAdmin.InsertTB_AUTHCOMPANY(aCompanyID, aCompanyName,
  aAuthKey, aPhone, aFax, aHompage, aAddr1, aAddr2, aPgType, amonitor,
  aAttend, aFood,aEtc, aJoinDt: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_AUTHCOMPANY(';
  stSql := stSql + 'AC_COMPANYID,';
  stSql := stSql + 'AC_CPNAME,';
  stSql := stSql + 'AC_CPPHONE,';
  stSql := stSql + 'AC_CPFAX,';
  stSql := stSql + 'AC_CPADDR1,';
  stSql := stSql + 'AC_CPADDR2,';
  stSql := stSql + 'AC_CPPGTYPE,';
  stSql := stSql + 'AC_REGDATE,';
  stSql := stSql + 'AC_AUTHKEY,';
  stSql := stSql + 'AC_MEMO,';
  stSql := stSql + 'AC_HOMEPAGE) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCompanyID + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aPhone + ''',';
  stSql := stSql + '''' + aFax + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aPgType + ''',';
  stSql := stSql + '''' + aJoinDt + ''',';
  stSql := stSql + '''' + aAuthKey + ''',';
  stSql := stSql + '''' + aEtc + ''',';
  stSql := stSql + '''' + aHompage + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCompanyAdmin.UpdateTB_AUTHCOMPANY(aCompanyID, aCompanyName,
  aAuthKey, aPhone, aFax, aHompage, aAddr1, aAddr2, aPgType, amonitor,
  aAttend, aFood,aEtc, aJoinDt: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHCOMPANY Set ';
  stSql := stSql + 'AC_CPNAME = ''' + aCompanyName + ''',';
  stSql := stSql + 'AC_CPPHONE = ''' + aPhone + ''',';
  stSql := stSql + 'AC_CPFAX = ''' + aFax + ''',';
  stSql := stSql + 'AC_CPADDR1 = ''' + aAddr1 + ''',';
  stSql := stSql + 'AC_CPADDR2 = ''' + aAddr2 + ''',';
  stSql := stSql + 'AC_CPPGTYPE = ''' + aPgType + ''',';
  stSql := stSql + 'AC_REGDATE = ''' + aJoinDt + ''',';
  stSql := stSql + 'AC_AUTHKEY = ''' + aAuthKey + ''',';
  stSql := stSql + 'AC_HOMEPAGE = ''' + aHompage + ''', ';
  stSql := stSql + 'AC_MEMO= ''' + aEtc + ''' ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCompanyAdmin.InsertTB_AUTHCOUNT(aCompanyID, aPasswd,aGubun,
  aCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_AUTHCOUNT(';
  stSql := stSql + 'saupid,';
  stSql := stSql + 'GUBUN,';
  stSql := stSql + 'passwd,';
  stSql := stSql + 'Maxcount) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCompanyID + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aPasswd + ''',';
  stSql := stSql + aCount + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCompanyAdmin.UpdateTB_AUTHCOUNT(aCompanyID, aPasswd,aGubun,
  aCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHCOUNT set ';
  stSql := stSql + 'passwd = ''' + aPasswd + ''', ';
  stSql := stSql + 'Maxcount = ' + aCount ;
  stSql := stSql + ' Where saupid = ''' + aCompanyID + ''' ';
  stSql := stSql + ' AND GUBUN = ''' + aGubun + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCompanyAdmin.btn_ManagerClick(Sender: TObject);
begin
  if Trim(ed_CompanyID.Text) = '' then
  begin
    showmessage('고객사 아이디를 설정해 주세요.');
    Exit;
  end;
  fmManagerAdmin1:= TfmManagerAdmin1.Create(Self);
  fmManagerAdmin1.L_sCompanyID := ed_CompanyID.Text;
  fmManagerAdmin1.ShowModal;
  fmManagerAdmin1.Free;

end;

function TfmCompanyAdmin.DeleteTB_AUTHDEVICE(aCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_AUTHDEVICE ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCompanyAdmin.InsertTB_AUTHDEVICE(aCompanyID, aDeviceGubun,
  aSaleCount, amcuver: string): Boolean;
var
  stSql : string;
begin
  if Not IsDigit(aSaleCount) then aSaleCount := '0';

  stSql := ' Insert Into TB_AUTHDEVICE(';
  stSql := stSql + 'AC_COMPANYID,';
  stSql := stSql + 'AD_DEVICEGUBUN,';
  stSql := stSql + 'AD_SALECOUNT,';
  stSql := stSql + 'AD_VERSION) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aCompanyID + ''',';
  stSql := stSql + '''' + aDeviceGubun + ''',';
  stSql := stSql + aSaleCount + ',';
  stSql := stSql + '''' + amcuver + ''' )';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCompanyAdmin.UpdateTB_AUTHDEVICE(aCompanyID, aDeviceGubun,
  aSaleCount, amcuver: string): Boolean;
var
  stSql : string;
begin
  if Not IsDigit(aSaleCount) then aSaleCount := '0';
  stSql := ' Update TB_AUTHDEVICE set ';
  stSql := stSql + 'AD_SALECOUNT = ' + aSaleCount + ',' ;
  stSql := stSql + 'AD_VERSION = ''' + amcuver + ''' ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyID + ''' ';
  stSql := stSql + ' AND AD_DEVICEGUBUN = ''' + aDeviceGubun + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCompanyAdmin.showDeviceInfo(aCompanyID: string);
var
  stsql : string;
begin
  stSql := ' Select * from TB_AUTHDEVICE ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyID + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      if FindField('AD_DEVICEGUBUN').AsString = '001' then //MCU
      begin
        ed_mcusalecount.Text := FindField('AD_SALECOUNT').AsString;
        ed_mcuver.Text := FindField('AD_VERSION').AsString;
      end else if FindField('AD_DEVICEGUBUN').AsString = '002' then //ECU
      begin
        ed_ecusalecount.Text := FindField('AD_SALECOUNT').AsString;
        ed_ecuver.Text := FindField('AD_VERSION').AsString;
      end else if FindField('AD_DEVICEGUBUN').AsString = '003' then //READER
      begin
        ed_Readersalecount.Text := FindField('AD_SALECOUNT').AsString;
        ed_Readerver.Text := FindField('AD_VERSION').AsString;
      end;
      Next;
    end;

  end;

end;

function TfmCompanyAdmin.InsertTB_CUSTOMERID(aPhone, aCompanyID,
  aManagerID, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CUSTOMERID(';
  stSql := stSql + 'CT_TELNO,';
  stSql := stSql + 'AC_COMPANYID,';
  stSql := stSql + 'AM_MANAGERID,';
  stSql := stSql + 'CT_GUBUN) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aPhone + ''',';
  stSql := stSql + '''' + aCompanyID + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aGubun + ''' )';

  result := DataModule1.ProcessExecSQL(stSql);
end;
function TfmCompanyAdmin.UpdateTB_CUSTOMERID(aPhone, aCompanyID,
  aManagerID, aGubun: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Update TB_CUSTOMERID set ';
  stSql := stSql + 'AC_COMPANYID = ''' + aCompanyID + '''. ';
  stSql := stSql + 'AM_MANAGERID = ' + aManagerID + ',' ;
  stSql := stSql + 'CT_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhone + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCompanyAdmin.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
{  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if stSaveFileName <> '' then
    begin
      ExcelIO1.XLSExport(stSaveFileName);
    end;
    showmessage('파일생성 완료');
  end;    }
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := '';
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('고객사정보','참조파일','CustomerReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('고객사정보','시작위치',6);
  ini_fun.Free;

  aFileName:='고객사정보';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_Company,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
end;

function TfmCompanyAdmin.ExcelPrintOut(StringGrid: TAdvStringGrid;
  refFileName, SaveFileName: String; FileOut: Boolean;
  ExcelRowStart: integer; stTitle: string; bRowHeader,
  bColHeader: Boolean): Boolean;
var
  oXL, oWB, oSheet, oRng, VArray : Variant;
  nCol1,nCol2 : Integer;
  Loop : Integer;
  sCurDay,sPreDay : String;
  curDate : TDateTime;
  mergeStart :char;
  i,j,k : Integer;
  st : String;
  nColChar : integer;
  nFixCol,nFixRow : integer;

begin
  pan_gauge.Visible := True;
  Result := False;

  Try
    oXL := CreateOleObject('Excel.Application');
  Except
    showmessage('출력은 엑셀이 설치된 컴퓨터에서만 가능합니다.');
    exit;
  End;

  if FileExists(refFileName) = False then
  begin
    Showmessage(refFileName + ' 파일이 없습니다.');
    exit;
  end;


  oXL.Workbooks.Open(refFileName);
  oXL.DisplayAlerts := False;
//  oXL.Visible := True;
  oSheet := oXL.ActiveSheet;


  with StringGrid do
  begin

    //타이틀을 적자
    nCol1 := ColCount div 26;
    nCol2 := ColCount mod 26;
    if bRowHeader then
    begin
      oSheet.Range['A' + inttostr(ExcelRowStart - 1)].Value := stTitle;
      if bColHeader then nFixCol := 0
      else nFixCol := FixedCols ;
      for i:= 0 to FixedRows - 1 do
      begin
        for j:= nFixCol to ColCount - 1 do
        begin
          nColChar := j div 26;
          if j < 26 then
            oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i]
          else
            oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart)].Value := Cells[j,i];
        end;
      end;
      ExcelRowStart := ExcelRowStart + FixedRows ;
    end
    else    oSheet.Range['A' + inttostr(ExcelRowStart - FixedRows - 1)].Value := stTitle;

    Gauge1.MaxValue := ( RowCount - FixedRows );
    Gauge1.Progress := 0;
    for i := FixedRows to RowCount - 1 do
    begin

      if i <  RowCount - 2 then    //한칸씩 삽입
      begin
        oSheet.Range['A' + inttostr(i+ ExcelRowStart - FixedRows + 1) + ':' + Chr(Ord('A') + nCol1 ) + Chr(Ord('A') + nCol2 - 1 ) +  inttostr(i+ ExcelRowStart - FixedRows + 1)].Insert;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
     {
      for j := 0 to ColCount - 1 do
      begin
        nColChar := j div 26;
        if j < 26 then
          oXL.Range[Chr(Ord('A') + j ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i]
        else
          oXL.Range[Chr(Ord('A') + nColChar - 1 ) + Chr(Ord('A') + j - (26 * nColChar) ) + inttostr(i+ ExcelRowStart - FixedRows)].Value := Cells[j,i];
        Gauge1.Progress := Gauge1.Progress + 1;
        Application.ProcessMessages;
      end;
      }
    end;
    StringGrid.CopyToClipBoard;
    oSheet.Range['A' + inttostr(ExcelRowStart - 1), 'A' + inttostr(ExcelRowStart - 1)].Select;
    oSheet.Paste;
  end;//With

  //oXL.Visible := False;
  if FileOut then  oSheet.SaveAs(SaveFileName)
  else  oSheet.PrintOut;
  //oSheet.SaveAs(ExtractFileDir(Application.ExeName) + '\WorkSch2.xls');
  oXL.ActiveWorkbook.Close(False);
  oXL.Quit;
  pan_gauge.Visible := False;
  Result := True;
end;

procedure TfmCompanyAdmin.ed_sCompanyNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then btn_SearchClick(self);

end;

procedure TfmCompanyAdmin.ed_scompanycodeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = vk_return then btn_SearchClick(self);

end;

procedure TfmCompanyAdmin.FormShow(Sender: TObject);
begin
  cmbPGTypeLoad(cmb_spgGroup);
  cmbPGTypeLoad(cmb_pgGroup,False);
  ShowCompanyID('');

end;

initialization
  RegisterClass(TfmCompanyAdmin);
Finalization
  UnRegisterClass(TfmCompanyAdmin);


end.
