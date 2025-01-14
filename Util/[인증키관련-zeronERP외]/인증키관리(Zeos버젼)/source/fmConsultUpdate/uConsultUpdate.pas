unit uConsultUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, DB, ADODB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset,ActiveX;

type
  TfmConsultUpdate = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
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
    ed_Date: TEdit;
    ed_Time: TEdit;
    TempQuery: TZQuery;
    Label5: TLabel;
    ed_JijumName: TEdit;
    ed_DepartName: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    cmb_DeviceName: TComboBox;
    cmb_ModelName: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    cmb_FirmWareVersion: TComboBox;
    cmb_DeviceType: TComboBox;
    Label17: TLabel;
    Label20: TLabel;
    cmb_ProcessTime: TComboBox;
    ed_CompanyName: TEdit;
    Label18: TLabel;
    cmb_errDetail: TComboBox;
    Label19: TLabel;
    cmb_ErrTarget: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_DeviceNameChange(Sender: TObject);
  private
    CompanyCodeList : TStringList;
    ConsultCodeList : TStringList;
    QnaCodeList : TStringList;
    { Private declarations }
    procedure  LoadConsultCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadQnACode(cmb_box:TComboBox;bTotal:Boolean);
    procedure  LoadDeviceName;
    procedure  LoadDeviceModel;
    procedure  LoadDeviceType;
    procedure  LoadProcessTime;
    procedure  LoadErrorDetail;
    procedure  LoadErrorTarget;

    Function UpdateTB_QNALIST(aJijumName,
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
                          aMasterID:string):Boolean;
  public
    L_stCompanyCode :string;
    L_stConsultCode :string;
    L_stQnaCode : string;
    L_stPersonCode : string;
    L_stQASeq : string;
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

  stSql := 'select * from TB_CONSULTTYPE ';

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
      ConsultCodeList.Add(FindField('CN_TYPE').AsString);
      cmb_Box.Items.Add(FindField('CN_NAME').AsString);
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

  stSql := 'select * from TB_QNATYPE ';
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
      QnaCodeList.Add(FindField('QA_TYPE').AsString);
      cmb_Box.Items.Add(FindField('QA_NAME').AsString);
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

  LoadConsultCode(cmb_ConsultCode1,False);
  LoadQnaCode(cmb_QnaCode1,False );
  LoadDeviceName;
  LoadDeviceType;
  LoadProcessTime;
  LoadErrorDetail;
  LoadErrorTarget;

end;

procedure TfmConsultUpdate.FormShow(Sender: TObject);
begin
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
  if UpdateTB_QNALIST(ed_JijumName.Text,
                      ed_DepartName.Text,
                      ed_CustomerName.text,
                      ed_TelNum.text,
                      cmb_DeviceName.text,
                      cmb_ModelName.text,
                      cmb_FirmWareVersion.text,
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
                      Master_ID) then
  begin
    Close;
  end else
  begin
    showmessage('저장에 실패하였습니다.');
  end;

end;



function TfmConsultUpdate.UpdateTB_QNALIST(aJijumName,
aDepartName,aCustomerName,aTelNum,aDeviceName,aModelName,aFirmWareVersion,aQnaSubject,
aConsultType,aResultDate,aResultTime,aQnaData,aDeviceType,aResultType,aErrDetail,
aProcessTime,aErrTarget,aMasterID:string): Boolean;
var
  stSql : string;
begin
  aTelNum := StringReplace(aTelNum,' ','',[rfReplaceAll]);
  aTelNum := StringReplace(aTelNum,'-','',[rfReplaceAll]);
  aTelNum := StringReplace(aTelNum,':','',[rfReplaceAll]);

  stSql := 'Update TB_QNALIST set ';
  stSql := stSql + 'QA_JIJUMNAME = ''' + aJijumName + ''',';
  stSql := stSql + 'QA_DEPARTNAME = ''' + aDepartName + ''',';
  stSql := stSql + 'QA_NAME = ''' + aCustomerName + ''',';
  stSql := stSql + 'QA_TEL = ''' + aTelNum + ''',';
  stSql := stSql + 'QA_DEVICENAME = ''' + aDeviceName + ''',';
  stSql := stSql + 'QA_MODELNAME = ''' + aModelName + ''',';
  stSql := stSql + 'QA_FIRMWAREVERSION = ''' + aFirmWareVersion + ''',';
  stSql := stSql + 'QA_SUBJECT = ''' + aQnaSubject + ''',';
  stSql := stSql + 'CN_TYPE = ''' + aConsultType + ''',';
  stSql := stSql + 'QA_RESULTDATE = ''' + aResultDate + ''',';
  stSql := stSql + 'QA_RESULTTIME = ''' + aResultTime + ''',';
  stSql := stSql + 'QA_DATA = ''' + aQnaData + ''',';
  stSql := stSql + 'QA_DEVICETYPE = ''' + aDeviceType + ''',';
  stSql := stSql + 'QA_TYPE = ''' + aResultType + ''',';
  stSql := stSql + 'QA_ERRDETAIL = ''' + aErrDetail + ''',';
  stSql := stSql + 'QA_PROCESSTIME = ''' + aProcessTime + ''',';
  stSql := stSql + 'QA_ERRTARGET = ''' + aErrTarget + ''',';
  stSql := stSql + 'MA_USERID = ''' + aMasterID + ''' ';
  stSql := stSql + ' Where QA_SEQ = ' + L_stQASeq ;

  result := dmDB.ProcessExecSQL(stSql);

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmConsultUpdate.LoadDeviceModel;
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

procedure TfmConsultUpdate.LoadDeviceName;
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

procedure TfmConsultUpdate.LoadDeviceType;
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

procedure TfmConsultUpdate.LoadErrorDetail;
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

procedure TfmConsultUpdate.LoadErrorTarget;
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

procedure TfmConsultUpdate.LoadProcessTime;
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

procedure TfmConsultUpdate.cmb_DeviceNameChange(Sender: TObject);
begin
  LoadDeviceModel;
end;

end.
