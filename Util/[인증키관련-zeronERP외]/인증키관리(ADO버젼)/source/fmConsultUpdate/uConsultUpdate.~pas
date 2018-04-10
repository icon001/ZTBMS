unit uConsultUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB;

type
  TfmConsultUpdate = class(TForm)
    GroupBox1: TGroupBox;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    cmb_CompanyCode1: TComboBox;
    ed_TelNum: TEdit;
    ed_CustomerName: TEdit;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_QnaSubject: TEdit;
    mem_QnaData: TMemo;
    cmb_ConsultCode1: TComboBox;
    cmb_QnaCode1: TComboBox;
    btn_Close: TSpeedButton;
    btn_Save: TSpeedButton;
    TempQuery: TADOQuery;
    ed_Date: TEdit;
    ed_Time: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    { Private declarations }
    procedure  LoadCompanyCode(cmb_box:TComboBox;aPgGroup:string;bTotal:Boolean);
    procedure  LoadConsultCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadQnACode(cmb_box:TComboBox;bTotal:Boolean);

    procedure SaveCustomer;

    Function UpdateTB_AUTHMANAGELIST(aDate,
                          aTime,
                          aTelNum,
                          aCompanyCode,
                          aQnaSubject,
                          aQnaData,
                          aMasterID,
                          aConsultCode,
                          aQnaCode,
                          aCustomerName:string):Boolean;

    Function CheckTB_CUSTOMERID(aCompanyCode,aPhoneNumber:string; var aEmNum:string ):Boolean;
    Function InsertTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber:string):Boolean;

    Function CheckTB_AUTHMANAGER(aCompanyCode,aManagerID:string):Boolean;
    Function InsertTB_AUTHMANAGER(aCompanyCode,aManagerID,aManagerName:string):Boolean;
    Function UpdateTB_AUTHMANAGER(aCompanyCode,aManagerID,aManagerName:string):Boolean;

    Function CheckTB_LASTCUSTOMERID(aPhoneNumber:string):Boolean;
    Function InsertTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber:string):Boolean;

    Function GetCustomID(aCompanyCode:string):string;
  public
    L_stCompanyCode :string;
    L_stConsultCode :string;
    L_stQnaCode : string;
    { Public declarations }

  end;

var
  fmConsultUpdate: TfmConsultUpdate;

implementation

uses
  uDataModule;
{$R *.dfm}

procedure TfmConsultUpdate.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmConsultUpdate.LoadCompanyCode(cmb_box: TComboBox;
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

procedure TfmConsultUpdate.LoadConsultCode(cmb_box: TComboBox;
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

procedure TfmConsultUpdate.LoadQnACode(cmb_box: TComboBox;
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

procedure TfmConsultUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  ConsultCodeList.Free;
  QnaCodeList.Free;
  
  Action := caFree;

end;

procedure TfmConsultUpdate.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  ConsultCodeList := TStringList.Create;
  QnaCodeList := TStringList.Create;

  LoadCompanyCode(cmb_CompanyCode1,'',True);
  LoadConsultCode(cmb_ConsultCode1,False);
  LoadQnaCode(cmb_QnaCode1,False );

end;

procedure TfmConsultUpdate.FormShow(Sender: TObject);
begin
  if Trim(L_stCompanyCode) <> '' then cmb_CompanyCode1.ItemIndex := CompanyCodeList.IndexOf(L_stCompanyCode);
  if Trim(L_stConsultCode) <> '' then cmb_ConsultCode1.ItemIndex := ConsultCodeList.IndexOf(L_stConsultCode);
  if Trim(L_stQnaCode) <> '' then cmb_QnaCode1.ItemIndex := QnaCodeList.IndexOf(L_stQnaCode);
end;

procedure TfmConsultUpdate.btn_SaveClick(Sender: TObject);
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
  if UpdateTB_AUTHMANAGELIST(ed_Date.Text,
                          ed_Time.Text,
                          stTelNum,
                          stCompanyCode,
                          ed_QnaSubject.Text,
                          mem_QnaData.Text,
                          Master_ID,
                          stConsultCode,
                          stQnaCode,
                          ed_CustomerName.Text) then
  begin
    Close;
  end else
  begin
    showmessage('저장에 실패하였습니다.');
  end;

end;

procedure TfmConsultUpdate.SaveCustomer;
var
  stTelNum : string;
  stCompanyCode : string;
  stPhoneGubun : string;
  stTime : string;
  stEmNum : string;
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
  if Not CheckTB_CUSTOMERID(stCompanyCode,stTelNum,stEmNum) then
  begin
    stEmNum := GetCustomID(stCompanyCode);
    InsertTB_CUSTOMERID(stCompanyCode,stEmNum,stTelNum,stPhoneGubun);
  end
  else UpdateTB_CUSTOMERID(stCompanyCode,stEmNum,stTelNum);

  if Not CheckTB_AUTHMANAGER(stCompanyCode,stEmNum) then
  begin
    InsertTB_AUTHMANAGER(stCompanyCode,stEmNum,ed_CustomerName.Text);
  end else
  begin
    UpdateTB_AUTHMANAGER(stCompanyCode,stEmNum,ed_CustomerName.Text);
  end;

  if Not CheckTB_LASTCUSTOMERID(stTelNum) then
     InsertTB_LASTCUSTOMERID(stCompanyCode,stEmNum,stTelNum,stPhoneGubun)
  else UpdateTB_LASTCUSTOMERID(stCompanyCode,stEmNum,stTelNum);

end;

function TfmConsultUpdate.UpdateTB_AUTHMANAGELIST(aDate, aTime, aTelNum,
  aCompanyCode, aQnaSubject, aQnaData, aMasterID, aConsultCode, aQnaCode,
  aCustomerName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  aDate := StringReplace(aDate,' ','',[rfReplaceAll]);
  aDate := StringReplace(aDate,'-','',[rfReplaceAll]);
  aDate := StringReplace(aDate,':','',[rfReplaceAll]);

  aTime := StringReplace(aTime,' ','',[rfReplaceAll]);
  aTime := StringReplace(aTime,'-','',[rfReplaceAll]);
  aTime := StringReplace(aTime,':','',[rfReplaceAll]);

  aTelNum := StringReplace(aTelNum,' ','',[rfReplaceAll]);
  aTelNum := StringReplace(aTelNum,'-','',[rfReplaceAll]);
  aTelNum := StringReplace(aTelNum,':','',[rfReplaceAll]);

  stSql := 'Update TB_AUTHMANAGELIST Set ';
  stSql := stSql + 'AC_COMPANYID = ''' + aCompanyCode + ''',';
  stSql := stSql + 'AM_QUESTION = ''' + aQnaSubject + ''',';
  stSql := stSql + 'AM_DATA = ''' + aQnaData + ''',';
  stSql := stSql + 'AM_MASTERID = ''' + aMasterID + ''',';
  stSql := stSql + 'AC_CONSULTCODE = ''' + aConsultCode + ''',';
  stSql := stSql + 'AC_QNATYPE = ''' + aQnaCode + ''',';
  stSql := stSql + 'AM_CUSTOMERNAME = ''' + aCustomerName + ''' ';
  stSql := stSql + ' Where AM_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AM_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND AM_TELNO = ''' + aTelNum + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmConsultUpdate.CheckTB_CUSTOMERID(aCompanyCode,
  aPhoneNumber: string; var aEmNum:string): Boolean;
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
    aEmNum := FindField('AM_MANAGERID').AsString;
    result := True;
  end;
end;

function TfmConsultUpdate.GetCustomID(aCompanyCode: string): string;
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

function TfmConsultUpdate.InsertTB_CUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
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

function TfmConsultUpdate.UpdateTB_CUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CUSTOMERID set ';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';
  stSql := stSql + ' AND AC_COMPANYID = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmConsultUpdate.CheckTB_AUTHMANAGER(aCompanyCode,
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

function TfmConsultUpdate.InsertTB_AUTHMANAGER(aCompanyCode, aManagerID,
  aManagerName: string): Boolean;
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

function TfmConsultUpdate.UpdateTB_AUTHMANAGER(aCompanyCode, aManagerID,
  aManagerName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHMANAGER set ';
  stSql := stSql + ' AM_USERNAME = ''' + aManagerName + ''' ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmConsultUpdate.CheckTB_LASTCUSTOMERID(
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

function TfmConsultUpdate.InsertTB_LASTCUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
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

function TfmConsultUpdate.UpdateTB_LASTCUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_LASTCUSTOMERID set ';
  stSql := stSql + ' AC_COMPANYID = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
