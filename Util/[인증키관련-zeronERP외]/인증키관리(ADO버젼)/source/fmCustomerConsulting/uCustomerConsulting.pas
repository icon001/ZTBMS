unit uCustomerConsulting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, DB, ADODB, Buttons,
  uSubForm, CommandArray, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, Menus;

type
  TfmCustomerConsulting = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    cmb_CompanyCode1: TComboBox;
    Label1: TLabel;
    ed_TelNum: TEdit;
    Label2: TLabel;
    ed_CustomerName: TEdit;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    sg_Consulting: TAdvStringGrid;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    ed_QnaSubject: TEdit;
    Label4: TLabel;
    mem_QnaData: TMemo;
    Panel3: TPanel;
    Label6: TLabel;
    cmb_searchGubun: TComboBox;
    Label7: TLabel;
    cmb_ConsultCode1: TComboBox;
    TempQuery: TADOQuery;
    Label8: TLabel;
    cmb_QnaCode1: TComboBox;
    Label9: TLabel;
    cmb_ConsultCode2: TComboBox;
    Label10: TLabel;
    cmb_QnaCode2: TComboBox;
    btn_Save: TSpeedButton;
    ed_emNum: TEdit;
    ADOTelQuery: TADOQuery;
    btn_Search: TSpeedButton;
    btn_Memo: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Send: TSpeedButton;
    PopupMenu1: TPopupMenu;
    mn_F4: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Label11: TLabel;
    ed_sQna: TEdit;
    Label12: TLabel;
    ed_sContent: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_TelNumKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_searchGubunChange(Sender: TObject);
    procedure cmb_ConsultCode2Change(Sender: TObject);
    procedure cmb_QnaCode2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyCode1Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_SendClick(Sender: TObject);
    procedure mn_F4Click(Sender: TObject);
    procedure btn_MemoClick(Sender: TObject);
    procedure ed_QnaSubjectKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sQnaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sContentKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MenuItem1Click(Sender: TObject);
    procedure sg_ConsultingDblClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    { Private declarations }
    procedure  LoadCompanyCode(cmb_box:TComboBox;aPgGroup:string;bTotal:Boolean);
    procedure  LoadConsultCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadQnACode(cmb_box:TComboBox;bTotal:Boolean);
    Function CheckTelNum(aTelNum:string;var aCompanyCode,aCustomerID,aCustomerName:string):Boolean;
    Function GetLastTelNumber(aTelNum:string;var aCompanyCode,aCustomerID,aCustomerName:string):Boolean;
    procedure GetTelNumberState;

    Function CheckTB_CUSTOMERID(aCompanyCode,aPhoneNumber:string):Boolean;
    Function InsertTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber:string):Boolean;

    Function CheckTB_LASTCUSTOMERID(aPhoneNumber:string):Boolean;
    Function InsertTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber:string):Boolean;

    Function CheckTB_AUTHMANAGER(aCompanyCode,aManagerID:string):Boolean;
    Function InsertTB_AUTHMANAGER(aCompanyCode,aManagerID,aManagerName:string):Boolean;
    Function UpdateTB_AUTHMANAGER(aCompanyCode,aManagerID,aManagerName:string):Boolean;

    Function GetCustomID(aCompanyCode:string):string;

    Function InsertTB_AUTHMANAGELIST(aDate,
                          aTime,
                          aTelNum,
                          aCompanyCode,
                          aQnaSubject,
                          aQnaData,
                          aMasterID,
                          aConsultCode,
                          aQnaCode,
                          aCustomerName:string):Boolean;

    procedure FormClear;

    procedure SaveCustomer;
  public
    { Public declarations }
  end;

var
  fmCustomerConsulting: TfmCustomerConsulting;

implementation
uses
  uDataModule,
  uLomosUtil,
  uSendTelNo,
  uSendMemo, uConsultUpdate;
{$R *.dfm}

procedure TfmCustomerConsulting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  ConsultCodeList.Free;
  QnaCodeList.Free;
  
  Action := caFree;
end;


procedure TfmCustomerConsulting.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  ConsultCodeList := TStringList.Create;
  QnaCodeList := TStringList.Create;
end;

procedure TfmCustomerConsulting.LoadCompanyCode(cmb_box: TComboBox;
  aPgGroup: string; bTotal: Boolean);
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCOMPANY ';
  if aPgGroup <> '' then stSql := stSql + ' Where AC_CPPGTYPE = ''' + aPgGroup + ''' ';
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
      CompanyCodeList.Add(FindField('AC_COMPANYID').AsString);
      cmb_Box.Items.Add(FindField('AC_CPNAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmCustomerConsulting.FormShow(Sender: TObject);
begin
  LoadCompanyCode(cmb_CompanyCode1,'',True);
  LoadConsultCode(cmb_ConsultCode1,False);
  LoadConsultCode(cmb_ConsultCode2,True);
  LoadQnaCode(cmb_QnaCode1,False );
  LoadQnaCode(cmb_QnaCode2,True);
end;

procedure TfmCustomerConsulting.LoadConsultCode(cmb_box: TComboBox;
  bTotal: Boolean);
var
  stSql : string;
begin
  ConsultCodeList.Clear;
  ConsultCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCONSULTCODE ';

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
      ConsultCodeList.Add(FindField('AC_CONSULTCODE').AsString);
      cmb_Box.Items.Add(FindField('AC_CONSULTNAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmCustomerConsulting.LoadQnACode(cmb_box: TComboBox;
  bTotal: Boolean);
var
  stSql : string;
begin
  QnaCodeList.Clear;
  QnaCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHQNATYPE ';
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
      QnaCodeList.Add(FindField('AC_QNATYPE').AsString);
      cmb_Box.Items.Add(FindField('AC_QNANAME').AsString);
      Next;
    end;

  end;

end;

function TfmCustomerConsulting.CheckTelNum(aTelNum: string;
  var aCompanyCode, aCustomerID, aCustomerName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select a.*,b.AM_USERNAME from TB_CUSTOMERID a ';
  stSql := stSql + ' Left Join TB_AUTHMANAGER b ';
  stSql := stSql + ' ON (a.AC_COMPANYID = b.AC_COMPANYID ';
  stSql := stSql + ' AND a.AM_MANAGERID = b.AM_MANAGERID) ';
  stSql := stSql + ' Where a.CT_TELNO = ''' + aTelNum + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND a.AC_COMPANYID = ''' + aCompanyCode + ''' ';

  with ADOTelQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aCompanyCode := FindField('AC_COMPANYID').asString;
    aCustomerID := FindField('AM_MANAGERID').asString;
    aCustomerName := FindField('AM_USERNAME').asString;
    if recordCount > 1 then
    begin
      GetLastTelNumber(aTelNum,aCompanyCode,aCustomerID,aCustomerName);
    end;
  end;
  result := True;
end;

function TfmCustomerConsulting.GetLastTelNumber(aTelNum: string;
  var aCompanyCode, aCustomerID, aCustomerName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select a.*,b.AM_USERNAME from TB_LASTCUSTOMERID a ';
  stSql := stSql + ' Left Join TB_AUTHMANAGER b ';
  stSql := stSql + ' ON (a.AC_COMPANYID = b.AC_COMPANYID ';
  stSql := stSql + ' AND a.AM_MANAGERID = b.AM_MANAGERID) ';
  stSql := stSql + ' Where a.CT_TELNO = ''' + aTelNum + ''' ';

  with ADOTelQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aCompanyCode := FindField('AC_COMPANYID').asString;
    aCustomerID := FindField('AM_MANAGERID').asString;
    aCustomerName := FindField('AM_USERNAME').asString;
  end;
  result := True;
end;

procedure TfmCustomerConsulting.ed_TelNumKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  GetTelNumberState;
end;

procedure TfmCustomerConsulting.GetTelNumberState;
var
  stTelNum : string;
  stCompanyCode : string;
  stCustomerID : string;
  stCustomerName : string;
begin
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  if CheckTelNum(stTelNum,stCompanyCode,stCustomerID,stCustomerName) then
  begin
    if cmb_CompanyCode1.ItemIndex < 1 then
    begin
      cmb_CompanyCode1.ItemIndex := CompanyCodeList.IndexOf(stCompanyCode);
      ed_emNum.Text := stCustomerID;
      ed_CustomerName.Text := stCustomerName;
    end;
    ed_QnaSubject.SetFocus;
  end;

end;

procedure TfmCustomerConsulting.btn_SaveClick(Sender: TObject);
var
  stTelNum : string;
  stCompanyCode : string;
  stConsultCode,stQnaCode : string;
  stPhoneGubun : string;
  stTime : string;
begin
  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  SaveCustomer;

  if Trim(ed_QnaSubject.Text) = '' then
  begin
    showmessage('제목을 입력하셔야 합니다.');
    Exit;
  end;
  stConsultCode := '';
  stQnaCode := '';

  if cmb_ConsultCode1.ItemIndex > 0 then
  begin
    stConsultCode := ConsultCodeList.Strings[cmb_ConsultCode1.ItemIndex];
  end;
  if cmb_QnaCode1.ItemIndex > 0 then
  begin
    stQnaCode := QnaCodeList.Strings[cmb_QnaCode1.ItemIndex];
  end;
  stTime := FormatDateTime('yyyymmddHHMMSS',Now);
  if InsertTB_AUTHMANAGELIST(copy(stTime,1,8),
                          copy(stTime,9,6),
                          stTelNum,
                          stCompanyCode,
                          ed_QnaSubject.Text,
                          mem_QnaData.Text,
                          Master_ID,
                          stConsultCode,
                          stQnaCode,
                          ed_CustomerName.Text) then
  begin
    FormClear;
    btn_SearchClick(self);
  end;

  //저장후 Form Clear
end;

procedure TfmCustomerConsulting.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

function TfmCustomerConsulting.CheckTB_CUSTOMERID(aCompanyCode,
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  result := false;

  stSql := ' Select * from TB_CUSTOMERID ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';
  stSql := stSql + ' AND AC_COMPANYID = ''' + aCompanyCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmCustomerConsulting.CheckTB_LASTCUSTOMERID(
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  result := false;

  stSql := ' Select * from TB_LASTCUSTOMERID ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmCustomerConsulting.InsertTB_CUSTOMERID(aCompanyCode,
  aManagerID, aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CUSTOMERID (';
  stSql := stSql + ' CT_TELNO,';
  stSql := stSql + ' AC_COMPANYID,';
  stSql := stSql + ' AM_MANAGERID,';
  stSql := stSql + ' CT_GUBUN )';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + aPhoneNumber + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCustomerConsulting.InsertTB_LASTCUSTOMERID(aCompanyCode,
  aManagerID, aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_LASTCUSTOMERID (';
  stSql := stSql + ' CT_TELNO,';
  stSql := stSql + ' AC_COMPANYID,';
  stSql := stSql + ' AM_MANAGERID,';
  stSql := stSql + ' CT_GUBUN )';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + aPhoneNumber + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmCustomerConsulting.UpdateTB_CUSTOMERID(aCompanyCode,
  aManagerID, aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CUSTOMERID set ';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';
  stSql := stSql + ' AND AC_COMPANYID = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCustomerConsulting.UpdateTB_LASTCUSTOMERID(aCompanyCode,
  aManagerID, aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_LASTCUSTOMERID set ';
  stSql := stSql + ' AC_COMPANYID = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCustomerConsulting.GetCustomID(aCompanyCode: string): string;
var
  nMaxID : integer;
  stSql  : string;
begin
  result := '0';
  nMaxID := 0 ;
  stSql := 'select Max(AM_MANAGERID) as AM_MANAGERID from TB_AUTHMANAGER ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    nMaxID := FindField('AM_MANAGERID').AsInteger + 1;
  end;
  result := inttostr(nMaxID);
  
end;

function TfmCustomerConsulting.InsertTB_AUTHMANAGELIST(aDate, aTime,
  aTelNum, aCompanyCode, aQnaSubject, aQnaData, aMasterID, aConsultCode,
  aQnaCode, aCustomerName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_AUTHMANAGELIST ( ';
  stSql := stSql + 'AM_DATE,';
  stSql := stSql + 'AM_TIME,';
  stSql := stSql + 'AM_TELNO,';
  stSql := stSql + 'AC_COMPANYID,';
  stSql := stSql + 'AM_QUESTION,';
  stSql := stSql + 'AM_DATA,';
  stSql := stSql + 'AM_MASTERID,';
  stSql := stSql + 'AC_CONSULTCODE,';
  stSql := stSql + 'AC_QNATYPE,';
  stSql := stSql + 'AM_CUSTOMERNAME ) ';
  stSql := stSql + ' Values(';
  stsql := stSql + '''' + aDate + ''',';
  stsql := stSql + '''' + aTime + ''',';
  stsql := stSql + '''' + aTelNum + ''',';
  stsql := stSql + '''' + aCompanyCode + ''',';
  stsql := stSql + '''' + aQnaSubject + ''',';
  stsql := stSql + '''' + aQnaData + ''',';
  stsql := stSql + '''' + aMasterID + ''',';
  stsql := stSql + '''' + aConsultCode + ''',';
  stsql := stSql + '''' + aQnaCode + ''',';
  stsql := stSql + '''' + aCustomerName + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCustomerConsulting.FormClear;
begin
  ed_TelNum.Enabled := True;
  ed_TelNum.ReadOnly := False;
  ReceiveTelNumber := ''; 
  cmb_CompanyCode1.ItemIndex := 0;
  ed_TelNum.Text := '';
  ed_CustomerName.Text := '';
  ed_emNum.Text := '';
  ed_QnaSubject.Text := '';
  cmb_ConsultCode1.ItemIndex := 0;
  cmb_QnaCode1.ItemIndex := 0;
  mem_QnaData.Text := '';
end;

procedure TfmCustomerConsulting.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  stCompanyCode : string;
  stTelNum : string;
  stWhere : string;
  nRow : integer;
begin
  RowGridInitialize(sg_Consulting);

  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  stSql := 'Select a.*,b.AC_CPNAME from ';
  stSql := stSql + ' TB_AUTHMANAGELIST a ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY b ';
  stSql := stSql + ' ON(a.AC_COMPANYID = b.AC_COMPANYID) ';

  stWhere := '';
  if cmb_searchGubun.ItemIndex < 0 then cmb_searchGubun.ItemIndex := 0;
  if cmb_searchGubun.ItemIndex = 0 then  //회사명 조회
  begin
    if stCompanyCode <> '' then
    begin
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.AC_COMPANYID = ''' + stCompanyCode + ''' ';
    end;
  end else if cmb_searchGubun.ItemIndex = 1 then //전화번호조회
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_TELNO = ''' + stTelNum + ''' ';
  end else if cmb_searchGubun.ItemIndex = 2 then //고객명조회
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_CUSTOMERNAME Like ''%' + ed_CustomerName.text + '%'' ';
  end else if cmb_searchGubun.ItemIndex = 3 then //회사명 + 고객명
  begin
    if stCompanyCode <> '' then
    begin
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.AC_COMPANYID = ''' + stCompanyCode + ''' ';
    end;
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_CUSTOMERNAME Like ''%' + ed_CustomerName.text + '%'' ';
  end;

  if cmb_ConsultCode2.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_CONSULTCODE = ''' + ConsultCodeList.Strings[cmb_ConsultCode2.ItemIndex] + ''' ';
  end;

  if cmb_QnaCode2.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_QNATYPE = ''' + QnaCodeList.Strings[cmb_QnaCode2.ItemIndex] + ''' ';
  end;

  if Trim(ed_sQna.Text) <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_QUESTION Like ''%' + Trim(ed_sQna.Text) + '%'' ';
  end;

  if Trim(ed_sContent.Text) <> '' then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_DATA Like ''%' + Trim(ed_sContent.Text) + '%'' ';
  end;

  if stWhere <> '' then stSql := stSql + stWhere;

  stSql := stSql + ' order by a.AM_DATE DESC,a.AM_TIME DESC ';
//  stSql := stSql + ' LIMIT 0,100 ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    with sg_Consulting do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('AM_DATE').AsString;
        Cells[1,nRow] := FindField('AM_TIME').AsString;
        Cells[2,nRow] := FindField('AC_CPNAME').AsString;
        Cells[3,nRow] := FindField('AM_CUSTOMERNAME').AsString;
        Cells[4,nRow] := FindField('AM_QUESTION').AsString;
        Cells[5,nRow] := FindField('AM_DATA').AsString;
        Cells[6,nRow] := FindField('AM_MASTERID').AsString;
        Cells[7,nRow] := FindField('AM_TELNO').AsString;
        Cells[8,nRow] := FindField('AC_COMPANYID').AsString;
        Cells[9,nRow] := FindField('AC_CONSULTCODE').AsString;
        Cells[10,nRow] := FindField('AC_QNATYPE').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;

function TfmCustomerConsulting.CheckTB_AUTHMANAGER(aCompanyCode,
  aManagerID: string): Boolean;
var
  stSql : string;
begin
  result := false;

  stSql := ' Select * from TB_AUTHMANAGER ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID ;

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmCustomerConsulting.InsertTB_AUTHMANAGER(aCompanyCode,
  aManagerID, aManagerName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_AUTHMANAGER (';
  stSql := stSql + ' AC_COMPANYID,';
  stSql := stSql + ' AM_MANAGERID,';
  stSql := stSql + ' AM_USERNAME )';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aManagerName + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmCustomerConsulting.UpdateTB_AUTHMANAGER(aCompanyCode,
  aManagerID, aManagerName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHMANAGER set ';
  stSql := stSql + ' AM_USERNAME = ''' + aManagerName + ''' ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmCustomerConsulting.cmb_searchGubunChange(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.cmb_ConsultCode2Change(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.cmb_QnaCode2Change(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.FormActivate(Sender: TObject);
begin
  btn_SearchClick(self);

end;

procedure TfmCustomerConsulting.cmb_CompanyCode1Click(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stTelNum : string;
begin
  stTelNum := Params.Values['TELNUM'];

  if Trim(stTelNum) = '' then Exit;
  if Not IsDigit(stTelNum) then Exit;
  FormClear;
  ed_TelNum.Text := stTelNum;
  GetTelNumberState;
  ed_TelNum.ReadOnly := True;
  //ed_TelNum.Enabled := False;
end;

procedure TfmCustomerConsulting.btn_SendClick(Sender: TObject);
begin
  SaveCustomer;
  fmSendTelNo:= TfmSendTelNo.Create(Self);
  fmSendTelNo.L_TelNumber := ed_TelNum.Text;
  fmSendTelNo.SHowmodal;
  if fmSendTelNo.L_bSend then FormClear;
  fmSendTelNo.Free;

end;

procedure TfmCustomerConsulting.SaveCustomer;
var
  stTelNum : string;
  stCompanyCode : string;
  stPhoneGubun : string;
  stTime : string;
begin
  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  if stCompanyCode = '' then Exit;
  if stTelNum = '' then Exit;
  if ed_CustomerName.Text = '' then Exit;

  if copy(stTelNum,1,2) = '01' then stPhoneGubun := '1'
  else stPhoneGubun := '2';

  //여기에서 TB_CUSTOMERID 테이블에 전화번호가 있는지 확인한다.
  //없으면 인서트 있으면 Update
  //TB_LASTCUSTOMERID 테이블에 전화번호가 있는지 확인한다. 역시 마찬가지
  if Trim(ed_emNum.Text)='' then ed_emNum.Text := '0';
  if Not CheckTB_CUSTOMERID(stCompanyCode,stTelNum) then
  begin
    ed_emNum.Text := GetCustomID(stCompanyCode);
    InsertTB_CUSTOMERID(stCompanyCode,ed_emNum.Text,stTelNum,stPhoneGubun);
  end; //
//  else UpdateTB_CUSTOMERID(stCompanyCode,ed_emNum.Text,stTelNum);

  if Not CheckTB_AUTHMANAGER(stCompanyCode,ed_emNum.Text) then
  begin
    InsertTB_AUTHMANAGER(stCompanyCode,ed_emNum.Text,ed_CustomerName.Text);
  end else
  begin
//    UpdateTB_AUTHMANAGER(stCompanyCode,ed_emNum.Text,ed_CustomerName.Text);
  end;

  if Not CheckTB_LASTCUSTOMERID(stTelNum) then
     InsertTB_LASTCUSTOMERID(stCompanyCode,ed_emNum.Text,stTelNum,stPhoneGubun)
  else UpdateTB_LASTCUSTOMERID(stCompanyCode,ed_emNum.Text,stTelNum);

end;

procedure TfmCustomerConsulting.mn_F4Click(Sender: TObject);
begin
  btn_SaveClick(self);
end;

procedure TfmCustomerConsulting.btn_MemoClick(Sender: TObject);
begin
  SaveCustomer;
  fmSendMemo:= TfmSendMemo.Create(Self);
  fmSendMemo.ed_memSubject.Text := ed_TelNum.Text + '[' + ed_CustomerName.Text + '] 님으로부터 전화입니다.';
  fmSendMemo.SHowmodal;
  if fmSendMemo.L_bSend then FormClear;
  fmSendMemo.Free;
end;

procedure TfmCustomerConsulting.ed_QnaSubjectKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = vk_return then 
  perform(WM_NEXTDLGCTL,0,0) ;
end;

procedure TfmCustomerConsulting.ed_sQnaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(self);

end;

procedure TfmCustomerConsulting.ed_sContentKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.MenuItem1Click(Sender: TObject);
begin
  with sg_Consulting do
  begin
    if Cells[0,Row] = '' then Exit;
    fmConsultUpdate:= TfmConsultUpdate.Create(Self);
    fmConsultUpdate.ed_date.Text := Cells[0,Row];
    fmConsultUpdate.ed_Time.Text := Cells[1,Row];
    fmConsultUpdate.ed_CustomerName.Text := Cells[3,Row];
    fmConsultUpdate.ed_QnaSubject.Text := Cells[4,Row];
    fmConsultUpdate.mem_QnaData.Text := Cells[5,Row];
    fmConsultUpdate.ed_TelNum.Text := Cells[7,Row];
    fmConsultUpdate.L_stCompanyCode := Cells[8,Row];
    fmConsultUpdate.L_stConsultCode := Cells[9,Row];
    fmConsultUpdate.L_stQnaCode := Cells[10,Row];
    fmConsultUpdate.ShowModal;
  end;
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.sg_ConsultingDblClick(Sender: TObject);
begin
  MenuItem1Click(self);
end;

initialization
  RegisterClass(TfmCustomerConsulting);
Finalization
  UnRegisterClass(TfmCustomerConsulting);

end.
