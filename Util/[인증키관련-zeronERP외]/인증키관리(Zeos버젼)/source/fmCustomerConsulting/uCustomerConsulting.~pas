unit uCustomerConsulting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, DB, ADODB, Buttons,
  uSubForm, CommandArray, IdBaseComponent, IdComponent, IdUDPBase,
  IdUDPClient, Menus, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  AdvObj,ActiveX,Imm;

const
  English = 0;
  Korean = 1;

type
  TfmCustomerConsulting = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
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
    cmb_CompanyCode: TComboBox;
    Label7: TLabel;
    cmb_QnaCode1: TComboBox;
    Label8: TLabel;
    cmb_ConsultCode1: TComboBox;
    Label9: TLabel;
    cmb_QnaCode2: TComboBox;
    Label10: TLabel;
    cmb_ConsultCode2: TComboBox;
    btn_Save: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Memo: TSpeedButton;
    btn_Send: TSpeedButton;
    PopupMenu1: TPopupMenu;
    mn_F4: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    Label11: TLabel;
    ed_sQna: TEdit;
    Label12: TLabel;
    ed_sContent: TEdit;
    btn_ManagerAdd: TSpeedButton;
    TempQuery: TZQuery;
    ed_emNum: TEdit;
    sg_Customer: TAdvStringGrid;
    Label5: TLabel;
    ed_JijumName: TEdit;
    Label13: TLabel;
    ed_DepartName: TEdit;
    Label14: TLabel;
    cmb_DeviceName: TComboBox;
    Label15: TLabel;
    cmb_ModelName: TComboBox;
    Label16: TLabel;
    cmb_FirmWareVersion: TComboBox;
    Label17: TLabel;
    cmb_DeviceType: TComboBox;
    Label18: TLabel;
    cmb_errDetail: TComboBox;
    btn_Close: TSpeedButton;
    cmb_ErrTarget: TComboBox;
    Label19: TLabel;
    ed_CompanyName: TEdit;
    Label20: TLabel;
    cmb_ProcessTime: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_TelNumKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyCodeChange(Sender: TObject);
    procedure cmb_QnaCode2Change(Sender: TObject);
    procedure cmb_ConsultCode2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
    procedure cmb_CompanyCodeKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_CompanyCodeExit(Sender: TObject);
    procedure btn_ManagerAddClick(Sender: TObject);
    procedure sg_CustomerDblClick(Sender: TObject);
    procedure chk_CustomerIDClick(Sender: TObject);
    procedure ed_CustomerNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_CustomerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_DeviceNameChange(Sender: TObject);
    procedure cmb_ProcessTimeKeyPress(Sender: TObject; var Key: Char);
  private
    CompanyCodeList : TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    L_nSelectCompanyIndex : integer;
    L_bKeyPress : Boolean;
    L_bEnterKey : Boolean;
    { Private declarations }
    procedure  LoadCompanyCode(cmb_box:TComboBox;aPgGroup:string;bTotal:Boolean = True);
    procedure  LoadConsultCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadQnACode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadDeviceName;
    procedure  LoadDeviceModel;
    procedure  LoadDeviceType;
    procedure  LoadProcessTime;
    procedure  LoadErrorDetail;
    procedure  LoadErrorTarget;
    Function CheckTelNum(aTelNum:string;var aCompanyCode,aCustomerID,aCustomerName,aCompanyName,aJijumName,aDepartName:string):Boolean;
    Function CheckQNAListTelNum(aTelNum:string;var aCompanyCode,aCustomerID,aCustomerName,aCompanyName,aJijumName,aDepartName:string):Boolean;
    procedure GetTelNumberState;
    procedure GetCustomerNameState;

    Function InsertTB_QNALIST(aDate,
                          aTime,
                          aCompanyName,
                          aJijumName,
                          aDepartName,
                          aCustomerName,
                          aTelNum,
                          aDeviceName,
                          aModelName,
                          aFirmWareVersion,
                          aQnaSubject,
                          aConsultType,
                          aResultDate,
                          aResultTime,
                          aQnaData,
                          aDeviceType,
                          aResultType,
                          aErrDetail,
                          aProcessTime,
                          aErrTarget,
                          aEmCode,
                          aMasterID:string):Boolean;

    procedure FormClear;
  private
    procedure SetOnlyAlphanumeric(aHandle: HWND);
    procedure SetIMEMode(const Language: Integer);
    function IsHanState(paForm: TForm): boolean;
  protected
    FOldMethod: TWndMethod;
    procedure EditWindowProc(var Message: TMessage);
  public
    { Public declarations }
  end;

var
  fmCustomerConsulting: TfmCustomerConsulting;

implementation
uses
  uDataModule,
  uLomosUtil, uSendTelNo, uSendMemo, uManagerAdd, uConsultUpdate;
  //uSendTelNo,
  //uSendMemo,
  //uConsultUpdate;
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
var
  hIMC : Integer; //원래 형이 HIMC인데 내부적으로 이넘도 integer던데요.. ^^;;
begin
  {hIMC := ImmGetContext(Self.Handle);

  // 한글형일때
  ImmSetConversionStatus(hIMC, IME_CMODE_NATIVE, IME_SMODE_NONE);
  // 영문형일때(이건 안해봤어요^^;;)
  //ImmSetConversionStatus(hIMC, 0, IME_SMODE_NONE);
  ImmReleaseContext(Self.Handle, hIMC);
  ImeMode := imHanguel;
  ImeName := ''; }
  SetIMEMode(Korean);

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

  stSql := 'select * from TB_COMPANY ';
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
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmCustomerConsulting.FormShow(Sender: TObject);
begin
  LoadCompanyCode(cmb_CompanyCode,'',True);
  LoadQnaCode(cmb_QnaCode1,False );
  LoadQnaCode(cmb_QnaCode2,True);
  LoadConsultCode(cmb_ConsultCode1,False);
  LoadConsultCode(cmb_ConsultCode2,True);
  LoadDeviceName;
  LoadDeviceType;
  LoadProcessTime;
  LoadErrorDetail;
  LoadErrorTarget;
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

  stSql := 'select * from TB_CONSULTTYPE order by CN_TYPE';

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
    while Not Eof do
    begin
      ConsultCodeList.Add(FindField('CN_TYPE').AsString);
      cmb_Box.Items.Add(FindField('CN_NAME').AsString);
      Next;
    end;
    if Not bTotal then
      cmb_Box.ItemIndex := 1;

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

  stSql := 'select * from TB_QNATYPE order by QA_TYPE';
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
    while Not Eof do
    begin
      QnaCodeList.Add(FindField('QA_TYPE').AsString);
      cmb_Box.Items.Add(FindField('QA_NAME').AsString);
      Next;
    end;
    if Not bTotal then
      cmb_Box.ItemIndex := 1;

  end;

end;

function TfmCustomerConsulting.CheckTelNum(aTelNum: string;
  var aCompanyCode, aCustomerID, aCustomerName,aCompanyName,aJijumName,aDepartName: string): Boolean;
var
  stSql : string;
  nRow : integer;
begin
  result := False;
  stSql := 'select a.TE_TELNUMBER,a.TE_VIEWSEQ,b.*,c.CO_NAME,d.CO_JIJUMNAME,e.CO_DEPARTNAME from TB_TELNUM a ';
  stSql := stSql + ' Left Join TB_PERSON b ';
  stSql := stSql + ' ON (a.PE_CODE = b.PE_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' Left Join TB_JIJUM d ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' Left Join TB_DEPART e ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' Where a.TE_TELNUMBER = ''' + aTelNum + ''' ';
  stSql := stSql + ' order by a.TE_VIEWSEQ DESC';

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
    if recordcount = 1 then
    begin
      aCustomerName := FindField('PE_NAME').AsString;
      aCustomerID := FindField('PE_CODE').AsString;
      aCompanyCode := FindField('CO_COMPANYCODE').AsString;
      aCompanyName := FindField('CO_NAME').AsString;
      aJijumName := FindField('CO_JIJUMNAME').AsString;
      aDepartName := FindField('CO_DEPARTNAME').AsString;
    end else
    begin
      sg_Customer.Visible := True;
      GridInit(sg_Customer,4); //스트링그리드 초기화
      with sg_Customer do
      begin
        RowCount := recordCount + 1;
        nRow := 1;
        While Not Eof do
        begin
          Cells[0,nRow] := FindField('PE_NAME').AsString;
          Cells[1,nRow] := FindField('TE_TELNUMBER').AsString;
          Cells[2,nRow] := FindField('CO_NAME').AsString;
          Cells[3,nRow] := FindField('CO_JIJUMNAME').AsString;
          Cells[4,nRow] := FindField('CO_DEPARTNAME').AsString;
          Cells[5,nRow] := FindField('PE_CODE').AsString;
          Cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
          inc(nRow);
          next;
        end;
      end;
    end;
  end;
  result := True;
end;


procedure TfmCustomerConsulting.ed_TelNumKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if ed_TelNum.Text <> '' then
     GetTelNumberState;
end;

procedure TfmCustomerConsulting.GetTelNumberState;
var
  stTelNum : string;
  stCompanyCode : string;
  stCustomerID : string;
  stCustomerName : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
begin
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);
  ed_emNum.Text := '';
  if CheckQNAListTelNum(stTelNum,stCompanyCode,stCustomerID,stCustomerName,stCompanyName,stJijumName,stDepartName) then
  begin
//    cmb_CompanyCode.ItemIndex := CompanyCodeList.IndexOf(stCompanyCode);
    ed_emNum.Text := stCustomerID;
    ed_CustomerName.Text := stCustomerName;
    ed_CompanyName.Text := stCompanyName;
    ed_JijumName.Text := stJijumName;
    ed_DepartName.Text := stDepartName;
    ed_QnaSubject.SetFocus;
    btn_SearchClick(self);
  end else if CheckTelNum(stTelNum,stCompanyCode,stCustomerID,stCustomerName,stCompanyName,stJijumName,stDepartName) then
  begin
//    cmb_CompanyCode.ItemIndex := CompanyCodeList.IndexOf(stCompanyCode);
    ed_emNum.Text := stCustomerID;
    ed_CustomerName.Text := stCustomerName;
    ed_CompanyName.Text := stCompanyName;
    ed_JijumName.Text := stJijumName;
    ed_DepartName.Text := stDepartName;
    ed_QnaSubject.SetFocus;
    btn_SearchClick(self);
  end;
end;

procedure TfmCustomerConsulting.btn_SaveClick(Sender: TObject);
var
  stTelNum : string;
  stPhoneGubun : string;
  stTime : string;
begin
  stTelNum := ed_TelNum.Text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  if Trim(ed_QnaSubject.Text) = '' then
  begin
    showmessage('접수내역을 입력하셔야 합니다.');
    Exit;
  end;

  stTime := FormatDateTime('yyyymmddHHMMSS',Now);
  if InsertTB_QNALIST(copy(stTime,1,8),
                          copy(stTime,9,6),
                          ed_CompanyName.Text,
                          ed_JijumName.Text,
                          ed_DepartName.Text,
                          ed_CustomerName.Text,
                          ed_TelNum.Text,
                          cmb_DeviceName.Text,
                          cmb_ModelName.Text,
                          cmb_FirmWareVersion.Text,
                          ed_QnaSubject.Text,
                          cmb_QnaCode1.Text,
                          copy(stTime,1,8),
                          copy(stTime,9,6),
                          mem_QnaData.Text,
                          cmb_DeviceType.Text,
                          cmb_ConsultCode1.Text,
                          cmb_errDetail.Text,
                          cmb_ProcessTime.Text,
                          cmb_ErrTarget.Text,
                          ed_emNum.Text,
                          Master_ID) then
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

function TfmCustomerConsulting.InsertTB_QNALIST(aDate,aTime,aCompanyName,aJijumName,
aDepartName,aCustomerName,aTelNum,aDeviceName,aModelName,aFirmWareVersion,aQnaSubject,
aConsultType,aResultDate,aResultTime,aQnaData,aDeviceType,aResultType,aErrDetail,
aProcessTime,aErrTarget,aEmCode,aMasterID:string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_QNALIST ( ';
  stSql := stSql + 'QA_DATE,';
  stSql := stSql + 'QA_TIME,';
  stSql := stSql + 'QA_COMPANYNAME,';
  stSql := stSql + 'QA_JIJUMNAME,';
  stSql := stSql + 'QA_DEPARTNAME,';
  stSql := stSql + 'QA_NAME,';
  stSql := stSql + 'QA_TEL,';
  stSql := stSql + 'QA_DEVICENAME,';
  stSql := stSql + 'QA_MODELNAME,';
  stSql := stSql + 'QA_FIRMWAREVERSION,';
  stSql := stSql + 'QA_SUBJECT,';
  stSql := stSql + 'CN_TYPE,';
  stSql := stSql + 'QA_RESULTDATE,';
  stSql := stSql + 'QA_RESULTTIME,';
  stSql := stSql + 'QA_DATA,';
  stSql := stSql + 'QA_DEVICETYPE,';
  stSql := stSql + 'QA_TYPE,';
  stSql := stSql + 'QA_ERRDETAIL,';
  stSql := stSql + 'QA_PROCESSTIME,';
  stSql := stSql + 'QA_ERRTARGET,';
  stSql := stSql + 'PE_CODE,';
  stSql := stSql + 'MA_USERID ) ';
  stSql := stSql + ' Values(';
  stsql := stSql + '''' + aDate + ''',';
  stsql := stSql + '''' + aTime + ''',';
  stsql := stSql + '''' + aCompanyName + ''',';
  stsql := stSql + '''' + aJijumName + ''',';
  stsql := stSql + '''' + aDepartName + ''',';
  stsql := stSql + '''' + aCustomerName + ''',';
  stsql := stSql + '''' + aTelNum + ''',';
  stsql := stSql + '''' + aDeviceName + ''',';
  stsql := stSql + '''' + aModelName + ''',';
  stsql := stSql + '''' + aFirmWareVersion + ''',';
  stsql := stSql + '''' + aQnaSubject + ''',';
  stsql := stSql + '''' + aConsultType + ''',';
  stsql := stSql + '''' + aResultDate + ''',';
  stsql := stSql + '''' + aResultTime + ''',';
  stsql := stSql + '''' + aQnaData + ''',';
  stsql := stSql + '''' + aDeviceType + ''',';
  stsql := stSql + '''' + aResultType + ''',';
  stsql := stSql + '''' + aErrDetail + ''',';
  stsql := stSql + '''' + aProcessTime + ''',';
  stsql := stSql + '''' + aErrTarget + ''',';
  stsql := stSql + '''' + aEmCode + ''',';
  stsql := stSql + '''' + aMasterID + ''') ';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmCustomerConsulting.FormClear;
begin
  ed_TelNum.Enabled := True;
  ed_TelNum.ReadOnly := False;
  ReceiveTelNumber := '';
  cmb_CompanyCode.ItemIndex := 0;
  ed_TelNum.Text := '';
  ed_CustomerName.Text := '';
  ed_CompanyName.Text := '';
  ed_JijumName.Text := '';
  ed_DepartName.Text := '';
  ed_emNum.Text := '';
  ed_QnaSubject.Text := '';
  //cmb_ConsultCode1.ItemIndex := 0;
  //cmb_QnaCode1.ItemIndex := 0;
  mem_QnaData.Text := '';
end;

procedure TfmCustomerConsulting.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  stCompanyCode : string;
  stWhere : string;
  stWhere1 : string;
  nRow : integer;
  stTelNum : string;
begin
  GridInit(sg_Consulting,6); //스트링그리드 초기화

  stCompanyCode := '';
  stTelNum := ed_TelNum.text;
  stTelNum := StringReplace(stTelNum,' ','',[rfReplaceAll]);
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  stSql := 'Select a.* from ';
  stSql := stSql + ' TB_QNALIST a ';
  stSql := stSql + ' Left Join TB_TELNUM b ';
  stSql := stSql + ' ON(a.QA_TEL = b.TE_TELNUMBER ';
  stSql := stSql + ' AND a.PE_CODE = b.PE_CODE) ';

  if cmb_CompanyCode.ItemIndex < 0 then cmb_CompanyCode.ItemIndex := 0;
  if cmb_CompanyCode.ItemIndex > 0 then  //회사명 조회
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode.ItemIndex];
    if stCompanyCode <> '' then
    begin
      stSql := stSql + ' Left Join TB_PERSON c ';
      stSql := stSql + ' ON(a.PE_CODE = c.PE_CODE) ';
    end;
  end;
  stWhere := '';
  if (stTelNum <> '') or
     (ed_CustomerName.text <> '') then
  begin
    if stWhere = '' then stWhere := ' Where '
    else stWhere := stWhere + ' OR ';
    stWhere := stWhere + '(';
    stWhere1 := '';
    if stTelNum <> '' then //전화번호조회
    begin
      if stWhere1 <> '' then stWhere1 := stWhere1 + ' OR ';
      stWhere1 := stWhere1 + ' a.QA_TEL = ''' + stTelNum + ''' ';
    end;
    if ed_CustomerName.text <> '' then //고객명조회
    begin
      if stWhere1 <> '' then stWhere1 := stWhere1 + ' OR ';
      stWhere1 := stWhere1 + ' a.QA_NAME Like ''%' + ed_CustomerName.text + '%'' ';
    end;
    stWhere := stWhere + stWhere1 + ')';
  end else
  begin
    if cmb_CompanyCode.ItemIndex > 0 then  //회사명 조회
    begin
      stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode.ItemIndex];
      if stCompanyCode <> '' then
      begin
        if stWhere = '' then stWhere := ' Where '
        else stWhere := stWhere + ' AND ';
        stWhere := stWhere + ' c.CO_COMPANYCODE = ''' + stCompanyCode + ''' ';
      end;
    end;

    if cmb_QnaCode2.ItemIndex > 0 then
    begin
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.QA_TYPE = ''' + cmb_QnaCode2.Text + ''' ';
    end;

    if cmb_ConsultCode2.ItemIndex > 0 then
    begin
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.CN_TYPE = ''' + cmb_ConsultCode2.Text + ''' ';
    end;

    if Trim(ed_sQna.Text) <> '' then
    begin
      stWhere := '';
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.QA_SUBJECT Like ''%' + Trim(ed_sQna.Text) + '%'' ';
    end;

    if Trim(ed_sContent.Text) <> '' then
    begin
      stWhere := '';
      if stWhere = '' then stWhere := ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' a.QA_DATA Like ''%' + Trim(ed_sContent.Text) + '%'' ';
    end;
  end;

  if stWhere <> '' then stSql := stSql + stWhere
  else stSql := stSql + ' where a.QA_DATE > ''' + formatDateTime('yyyymmdd',now-30) + ''' ';

  stSql := stSql + ' order by a.QA_DATE DESC,a.QA_TIME DESC ';

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
        Cells[0,nRow] := FindField('QA_DATE').AsString;
        Cells[1,nRow] := FindField('QA_TIME').AsString;
        Cells[2,nRow] := FindField('QA_NAME').AsString;
        Cells[3,nRow] := FindField('QA_SUBJECT').AsString;
        Cells[4,nRow] := FindField('QA_DATA').AsString;
        Cells[5,nRow] := FindField('MA_USERID').AsString;
        Cells[6,nRow] := inttostr(FindField('QA_SEQ').asInteger);
        Cells[7,nRow] := FindField('QA_TEL').AsString;
        Cells[8,nRow] := FindField('QA_TYPE').AsString;
        Cells[9,nRow] := FindField('CN_TYPE').AsString;
        Cells[10,nRow] := FindField('PE_CODE').AsString;
        Cells[11,nRow] := inttostr(FindField('QA_SEQ').AsInteger);
        Cells[12,nRow] := FindField('QA_DEVICENAME').AsString;
        Cells[13,nRow] := FindField('QA_MODELNAME').AsString;
        Cells[14,nRow] := FindField('QA_FIRMWAREVERSION').AsString;
        Cells[15,nRow] := FindField('QA_COMPANYNAME').AsString;
        Cells[16,nRow] := FindField('QA_JIJUMNAME').AsString;
        Cells[17,nRow] := FindField('QA_DEPARTNAME').AsString;
        Cells[18,nRow] := FindField('QA_DEVICETYPE').AsString;
        Cells[19,nRow] := FindField('QA_ERRDETAIL').AsString;
        Cells[20,nRow] := FindField('QA_PROCESSTIME').AsString;
        Cells[21,nRow] := FindField('QA_ERRTARGET').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;


procedure TfmCustomerConsulting.cmb_CompanyCodeChange(Sender: TObject);
begin
  if L_bKeyPress then Exit;
  if cmb_CompanyCode.itemIndex < 0 then Exit;
  L_nSelectCompanyIndex := cmb_CompanyCode.ItemIndex;
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.cmb_QnaCode2Change(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.cmb_ConsultCode2Change(Sender: TObject);
begin
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.FormActivate(Sender: TObject);
begin
  btn_SearchClick(self);

end;

procedure TfmCustomerConsulting.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stTelNum : string;
begin
  stTelNum := Params.Values['TELNUM'];
  stTelNum := stringReplace(stTelNum,'-','',[rfReplaceAll]);

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
  fmSendTelNo:= TfmSendTelNo.Create(Self);
  fmSendTelNo.L_TelNumber := ed_TelNum.Text;
  fmSendTelNo.SHowmodal;
  if fmSendTelNo.L_bSend then FormClear;
  fmSendTelNo.Free;
end;

procedure TfmCustomerConsulting.mn_F4Click(Sender: TObject);
begin
  btn_SaveClick(self);
end;

procedure TfmCustomerConsulting.btn_MemoClick(Sender: TObject);
begin
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
  begin
    if sg_Customer.Visible then sg_Customer.SetFocus
    else perform(WM_NEXTDLGCTL,0,0);
  end;
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
    fmConsultUpdate.ed_CustomerName.Text := Cells[2,Row];
    fmConsultUpdate.ed_QnaSubject.Text := Cells[3,Row];
    fmConsultUpdate.mem_QnaData.Text := Cells[4,Row];
    fmConsultUpdate.ed_TelNum.Text := Cells[7,Row];
    fmConsultUpdate.cmb_QnaCode1.text := Cells[9,Row];
    fmConsultUpdate.cmb_ConsultCode1.text := Cells[8,Row];
    fmConsultUpdate.L_stPersonCode := Cells[10,Row];
    fmConsultUpdate.L_stQASeq := Cells[11,Row];
    fmConsultUpdate.cmb_DeviceName.text := Cells[12,Row];
    fmConsultUpdate.cmb_ModelName.text := Cells[13,Row];
    fmConsultUpdate.cmb_FirmWareVersion.text := Cells[14,Row];
    fmConsultUpdate.ed_CompanyName.text := Cells[15,Row];
    fmConsultUpdate.ed_JijumName.text := Cells[16,Row];
    fmConsultUpdate.ed_DepartName.text := Cells[17,Row];
    fmConsultUpdate.cmb_DeviceType.text := Cells[18,Row];
    fmConsultUpdate.cmb_errDetail.text := Cells[19,Row];
    fmConsultUpdate.cmb_ProcessTime.text := Cells[20,Row];
    fmConsultUpdate.cmb_ErrTarget.text := Cells[21,Row];
    fmConsultUpdate.ShowModal;
{        Cells[11,nRow] := inttostr(FindField('QA_SEQ').AsInteger);
         := FindField('QA_DEVICENAME').AsString;
        Cells[18,nRow] := FindField('QA_DEVICETYPE').AsString;
        Cells[19,nRow] := FindField('QA_ERRDETAIL').AsString;
        Cells[20,nRow] := FindField('QA_PROCESSTIME').AsString;
        Cells[21,nRow] := FindField('QA_ERRTARGET').AsString;    }
  end;
  btn_SearchClick(self); 
end;

procedure TfmCustomerConsulting.sg_ConsultingDblClick(Sender: TObject);
begin
  MenuItem1Click(self);
end;

procedure TfmCustomerConsulting.cmb_CompanyCodeKeyPress(Sender: TObject;
  var Key: Char);
var
  i : integer;
  stWriteCompanyName : string;
begin
  inherited;
  stWriteCompanyName := cmb_CompanyCode.Text;
  L_bKeyPress := True;
  L_bEnterKey := False;
  if Key <> #13 then exit;
  L_bEnterKey := True;
  L_bKeyPress := False;
  if L_nSelectCompanyIndex > (cmb_CompanyCode.Items.Count - 1) then Exit;
  for i:= L_nSelectCompanyIndex + 1 to cmb_CompanyCode.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteCompanyName),UpperCase(cmb_CompanyCode.Items.Strings[i])) > 0 then
    begin
      cmb_CompanyCode.ItemIndex := i;
      cmb_CompanyCode.Text := cmb_CompanyCode.Items.Strings[i];
      break;
    end else L_nSelectCompanyIndex := -1;
  end;
  cmb_CompanyCodeChange(Sender);

end;

procedure TfmCustomerConsulting.cmb_CompanyCodeExit(Sender: TObject);
var
  chKey : char;
begin
  L_bKeyPress := False;
  chKey := char(13);
  if Not L_bEnterKey then
    cmb_CompanyCodeKeyPress(Sender,chKey);
  cmb_CompanyCodeChange(Sender);
end;

procedure TfmCustomerConsulting.btn_ManagerAddClick(Sender: TObject);
begin
  fmManagerAdd:= TfmManagerAdd.Create(Self);
  fmManagerAdd.L_TelNumber := ed_TelNum.Text;
  fmManagerAdd.L_CustomerName := ed_CustomerName.Text;
  fmManagerAdd.SHowmodal;
  if fmManagerAdd.L_bSave then
  begin
    ed_emNum.Text := fmManagerAdd.ed_PersonID.Text;
    ed_CustomerName.Text := fmManagerAdd.ed_UserName.Text;
    cmb_CompanyCode.ItemIndex := fmManagerAdd.cmb_Company.ItemIndex;
    ed_QnaSubject.SetFocus;
  end;
  fmManagerAdd.Free;

end;

procedure TfmCustomerConsulting.sg_CustomerDblClick(Sender: TObject);
begin
  inherited;
  with sg_Customer do
  begin
    ed_CustomerName.Text := Cells[0,Row];
    ed_emNum.Text := Cells[5,Row];
    cmb_CompanyCode.ItemIndex := CompanyCodeList.IndexOf(Cells[6,Row]);
    ed_TelNum.Text := Cells[1,Row];
    ed_CompanyName.Text := Cells[2,Row];
    ed_JijumName.Text := Cells[3,Row];
    ed_DepartName.Text := Cells[4,Row];
    visible := False;
    ed_QnaSubject.SetFocus;
  end;
end;

procedure TfmCustomerConsulting.chk_CustomerIDClick(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmCustomerConsulting.ed_CustomerNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ed_CustomerName.Text <> '' then
     GetCustomerNameState;

end;

procedure TfmCustomerConsulting.GetCustomerNameState;
var
  stSql : string;
  nRow : integer;
begin
  if ed_TelNum.Text <> '' then Exit;
  stSql := 'select a.TE_TELNUMBER,a.TE_VIEWSEQ,b.*,c.CO_NAME,d.CO_JIJUMNAME,e.CO_DEPARTNAME from TB_TELNUM a ';
  stSql := stSql + ' Left Join TB_PERSON b ';
  stSql := stSql + ' ON (a.PE_CODE = b.PE_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' Left Join TB_JIJUM d ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' Left Join TB_DEPART e ';
  stSql := stSql + ' ON (b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE) ';
  stSql := stSql + ' Where b.PE_NAME Like ''%' + ed_CustomerName.Text + '%'' ';
  stSql := stSql + ' order by a.TE_VIEWSEQ DESC';

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
    sg_Customer.Visible := True;
    GridInit(sg_Customer,5); //스트링그리드 초기화
    with sg_Customer do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('PE_NAME').AsString;
        Cells[1,nRow] := FindField('TE_TELNUMBER').AsString;
        Cells[2,nRow] := FindField('CO_NAME').AsString;
        Cells[3,nRow] := FindField('CO_JIJUMNAME').AsString;
        Cells[4,nRow] := FindField('CO_DEPARTNAME').AsString;
        Cells[5,nRow] := FindField('PE_CODE').AsString;
        Cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
        inc(nRow);
        next;
      end;
    end;
  end;
end;

procedure TfmCustomerConsulting.sg_CustomerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = VK_ESCAPE then sg_Customer.Visible := False
  else if key = vk_return then sg_CustomerDblClick(self);
end;

procedure TfmCustomerConsulting.LoadDeviceName;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_DeviceName.Items.Clear;
  stSql := 'select * from TB_QNADEVICENAME order by QA_DEVICENAME ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_DeviceName.Items.Add(FindField('QA_DEVICENAME').AsString);
        Next;
      end;
    end;
    if cmb_DeviceName.Items.Count > 0 then cmb_DeviceName.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  LoadDeviceModel;
end;

procedure TfmCustomerConsulting.LoadDeviceModel;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_ModelName.Items.Clear;
  stSql := 'select * from TB_QNAMODELTYPE ';
  stSql := stSql + ' Where QA_DEVICENAME = ''' + cmb_DeviceName.Text + ''' ';
  stSql := stSql + ' order by QA_MODELNAME ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_ModelName.Items.Add(FindField('QA_MODELNAME').AsString);
        Next;
      end;
    end;
    if cmb_ModelName.Items.Count > 0 then cmb_ModelName.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerConsulting.cmb_DeviceNameChange(Sender: TObject);
begin
  inherited;
  LoadDeviceModel;
end;

procedure TfmCustomerConsulting.LoadDeviceType;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_DeviceType.Items.Clear;
  stSql := 'select * from TB_QNADEVICETYPE ';
  stSql := stSql + ' order by QA_DEVICETYPENAME ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_DeviceType.Items.Add(FindField('QA_DEVICETYPENAME').AsString);
        Next;
      end;
    end;
    if cmb_DeviceType.Items.Count > 0 then cmb_DeviceType.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerConsulting.LoadProcessTime;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_ProcessTime.Items.Clear;
  stSql := 'select * from TB_PROCESSTIME ';
  stSql := stSql + ' order by QA_PROCESSTIME ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_ProcessTime.Items.Add(FindField('QA_PROCESSTIME').AsString);
        Next;
      end;
    end;
    if cmb_ProcessTime.Items.Count > 0 then cmb_ProcessTime.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerConsulting.LoadErrorDetail;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_errDetail.Items.Clear;
  stSql := 'select * from TB_QNAERRORLIST ';
  stSql := stSql + ' order by QA_ERRORLIST ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_errDetail.Items.Add(FindField('QA_ERRORLIST').AsString);
        Next;
      end;
    end;
    if cmb_errDetail.Items.Count > 0 then cmb_errDetail.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerConsulting.LoadErrorTarget;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  cmb_ErrTarget.Items.Clear;
  stSql := 'select * from TB_QNAERRORTARGET ';
  stSql := stSql + ' order by QA_ERRORTARGET  ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      While Not Eof do
      begin
        cmb_ErrTarget.Items.Add(FindField('QA_ERRORTARGET').AsString);
        Next;
      end;
    end;
    if cmb_ErrTarget.Items.Count > 0 then cmb_ErrTarget.ItemIndex := 0;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmCustomerConsulting.CheckQNAListTelNum(aTelNum: string;
  var aCompanyCode, aCustomerID, aCustomerName, aCompanyName, aJijumName,
  aDepartName: string): Boolean;
var
  stSql : string;
  nRow : integer;
begin
  result := False;
  stSql := 'select * from TB_QNALIST ';
  stSql := stSql + ' Where QA_TEL = ''' + aTelNum + ''' ';
  stSql := stSql + ' order by QA_SEQ DESC';

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
    aCustomerName := FindField('QA_NAME').AsString;
    aCustomerID := FindField('PE_CODE').AsString;
    aCompanyName := FindField('QA_COMPANYNAME').AsString;
    aJijumName := FindField('QA_JIJUMNAME').AsString;
    aDepartName := FindField('QA_DEPARTNAME').AsString;
  end;
  result := True;
end;

procedure TfmCustomerConsulting.EditWindowProc(var Message: TMessage);
begin
{  case Message.Msg of
     WM_SETFOCUS, WM_IME_COMPOSITION:
     begin
      SetOnlyAlphanumeric(Edit.Handle);
      if Message.Msg = WM_IME_COMPOSITION then Exit;
     end;
  end;
  FOldMethod(Message);  }
end;

procedure TfmCustomerConsulting.SetOnlyAlphanumeric(aHandle: HWND);
var
  lhIMC: HIMC;
  ldSentence, ldConversion : DWORD;
begin
  lhIMC := ImmGetContext(aHandle);
  ImmGetConversionStatus(lhIMC, ldConversion, ldSentence);
  if ldConversion = IME_CMODE_NATIVE then
  ImmSetConversionStatus(lhIMC, IME_CMODE_ALPHANUMERIC, ldSentence);
  ImmReleaseContext(aHandle, lhIMC);
end;

procedure TfmCustomerConsulting.cmb_ProcessTimeKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then ed_QnaSubject.SetFocus;
end;

procedure TfmCustomerConsulting.SetIMEMode(const Language: Integer);
var
   dwConversion, dwSentence: DWORD;
   hIMC: THandle;
begin
   hIMC:= ImmGetContext(Application.Handle);
   ImmGetConversionStatus(hIMC, dwConversion, dwSentence);
   Case Language Of
      English: ImmSetConversionStatus(hIMC, IME_CMODE_ALPHANUMERIC, dwSentence);
      Korean : ImmSetConversionStatus(hIMC, IME_CMODE_NATIVE, dwSentence);
   end; {Case Value Of}
   ImmReleaseContext(Application.Handle, hIMC);
end;

function TfmCustomerConsulting.IsHanState(paForm: TForm): boolean;
var
   fFlag, imeMode: DWORD;
   hIMC: THandle;
begin
   hIMC:= ImmGetContext(paForm.Handle);
   ImmGetConversionStatus(hIMC, fFlag, imeMode);
   ImmReleaseContext(paForm.Handle, hIMC);
   Result:= (fFlag = 1);
end;

initialization
  RegisterClass(TfmCustomerConsulting);
Finalization
  UnRegisterClass(TfmCustomerConsulting);

end.
