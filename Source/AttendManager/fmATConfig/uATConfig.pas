unit uATConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Buttons, StdCtrls, uSubForm, CommandArray,ADODB,
  ActiveX;

type
  TfmATConfig = class(TfmASubForm)
    Panel11: TPanel;
    GroupBox2: TGroupBox;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    rg_SATURDAY: TRadioGroup;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ed_YHour: TEdit;
    Label3: TLabel;
    ed_YMin: TEdit;
    Label4: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_ATHH: TEdit;
    Label9: TLabel;
    ed_ATMM: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RadioGroup1: TRadioGroup;
    rg_NonPay: TRadioGroup;
    rg_outtime: TRadioGroup;
    TabSheet4: TTabSheet;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    GroupBox4: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    cmb_Jigak: TComboBox;
    cmb_jotae: TComboBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    ed_WeekTime: TEdit;
    Label12: TLabel;
    Label21: TLabel;
    cmb_absence: TComboBox;
    Panel5: TPanel;
    Label14: TLabel;
    ed_ExtendAdd: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    ed_NightAdd: TEdit;
    Label17: TLabel;
    rg_atTypePay: TRadioGroup;
    Panel6: TPanel;
    Label22: TLabel;
    ed_MonthLastDay: TEdit;
    Label23: TLabel;
    Label27: TLabel;
    ed_EarlyAdd: TEdit;
    Label28: TLabel;
    Label13: TLabel;
    ed_SEarlyAdd: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    ed_sExtendAdd: TEdit;
    Label26: TLabel;
    Label29: TLabel;
    ed_sNightAdd: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    ed_hNormalAdd: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    ed_hExtendAdd: TEdit;
    Label34: TLabel;
    Label35: TLabel;
    ed_hNightAdd: TEdit;
    Label36: TLabel;
    rg_atType: TRadioGroup;
    rg_deviceType: TRadioGroup;
    TabSheet5: TTabSheet;
    rg_Company: TRadioGroup;
    pan_ATNO: TPanel;
    Label37: TLabel;
    Label38: TLabel;
    ed_StartWorkNo: TEdit;
    ed_OffWorkNo: TEdit;
    rg_InoutType: TRadioGroup;
    pan_OUTNO: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    ed_WorkOutSideNo: TEdit;
    ed_WorkInNo: TEdit;
    rg_Employee: TRadioGroup;
    rg_RealReportType: TRadioGroup;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rg_atTypePayClick(Sender: TObject);
  private
    { Private declarations }
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_ATWORKTYPE(aCode,aField,aValue:string):Boolean;
    procedure SetAtConfig;
    procedure GetNewAtConfig;
    procedure SetPayConfig;
  public
    { Public declarations }
  end;

var
  fmATConfig: TfmATConfig;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmATConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

function TfmATConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATConfig.btn_SaveClick(Sender: TObject);
begin
  UpdateTB_CONFIG('ATTEND','SATURDAY',inttostr(rg_SATURDAY.ItemIndex));
  if length(ed_YHour.Text) < 2 then ed_YHour.Text := '00';
  if length(ed_YMin.Text) < 2 then ed_YMin.Text := '00';
  if length(ed_ATHH.Text) < 2 then ed_ATHH.Text := '00';
  if length(ed_ATMM.Text) < 2 then ed_ATMM.Text := '00';

  UpdateTB_ATWORKTYPE('001','AW_YESTERDAYTIME',ed_YHour.Text + ed_YMin.Text);
  UpdateTB_ATWORKTYPE('001','AW_DEVICETYPE',inttostr(rg_deviceType.ItemIndex));
  UpdateTB_ATWORKTYPE('001','AW_ATSTARTBUTTON',ed_StartWorkNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_ATOFFBUTTON',ed_OffWorkNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_INOUTDEVICETYPE',inttostr(rg_InoutType.ItemIndex));
  UpdateTB_ATWORKTYPE('001','AW_WORKOUTBUTTON',ed_WorkOutSideNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_WORKINBUTTON',ed_WorkInNo.Text);


  UpdateTB_CONFIG('ATTEND','YTIME',ed_YHour.Text + ed_YMin.Text);
  UpdateTB_CONFIG('ATTEND','TTIME',ed_ATHH.Text + ed_ATMM.Text);
  UpdateTB_CONFIG('ATTEND','NONPAYHOLI',inttostr(rg_NonPay.ItemIndex));
  UpdateTB_CONFIG('ATTEND','OUTTIME',inttostr(rg_outtime.ItemIndex));
  UpdateTB_CONFIG('ATTEND','ATTYPE',inttostr(rg_atType.ItemIndex));
  //UpdateTB_CONFIG('ATTEND','ATTYPE1',inttostr(rg_atType1.ItemIndex));
  UpdateTB_CONFIG('ATTEND','DEVICETYPE',inttostr(rg_deviceType.ItemIndex));
  UpdateTB_CONFIG('ATTEND','REALREPORT',inttostr(rg_RealReportType.ItemIndex));

  UpdateTB_CONFIG('PAY','WEEKTIME',ed_WeekTime.Text);
  //UpdateTB_CONFIG('PAY','OVERTIME',ed_OverTime.Text);

  UpdateTB_CONFIG('PAY','EARLYADD',ed_EarlyAdd.Text);
  UpdateTB_CONFIG('PAY','EXTENDADD',ed_ExtendAdd.Text);
  UpdateTB_CONFIG('PAY','NIGHTADD',ed_NightAdd.Text);
  UpdateTB_CONFIG('PAY','SEARLYADD',ed_sEarlyAdd.Text);
  UpdateTB_CONFIG('PAY','SEXTENDADD',ed_sExtendAdd.Text);
  UpdateTB_CONFIG('PAY','SNIGHTADD',ed_sNightAdd.Text);
  UpdateTB_CONFIG('PAY','HEARLYADD','0');
  UpdateTB_CONFIG('PAY','HNORMALADD',ed_hNormalAdd.text);
  UpdateTB_CONFIG('PAY','HEXTENDADD',ed_hExtendAdd.Text);
  UpdateTB_CONFIG('PAY','HNIGHTADD',ed_hNightAdd.Text);

  UpdateTB_CONFIG('PAY','JIGAK',inttostr(cmb_Jigak.ItemIndex));
  UpdateTB_CONFIG('PAY','JOTAE',inttostr(cmb_Jotae.ItemIndex));
  UpdateTB_CONFIG('PAY','ABSENCE',inttostr(cmb_Absence.ItemIndex));
  UpdateTB_CONFIG('PAY','ATTYPEPAY',inttostr(rg_atTypePay.ItemIndex));
  UpdateTB_CONFIG('PAY','MONTHLAST',ed_MonthLastDay.Text);
  UpdateTB_CONFIG('ATTEND','EMPLOYEE',inttostr(rg_Employee.ItemIndex));
  UpdateTB_CONFIG('ATTEND','COMPANYCD',inttostr(rg_Company.ItemIndex));

  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '근태환경설정');

  showmessage('저장 완료');
  //showmessage('시스템 적용을 위해서는 반드시 데몬을 재시작해주셔야 합니다.');
end;

procedure TfmATConfig.FormActivate(Sender: TObject);
begin
  SetAtConfig;
  GetNewAtConfig;
  SetPayConfig;
  PageControl1.ActivePageIndex := 0;
  if IsInsertGrade or IsUpdateGrade then btn_Save.Enabled := True
  else btn_Save.Enabled := False;

  if CARDTYPE = '2' then //근태 전용이면 버튼식으로 처리 한다.
  begin
    rg_deviceType.Visible := False;
    rg_deviceType.ItemIndex := 2;
  end else
  begin
    rg_deviceType.Visible := True;
  end;
end;

procedure TfmATConfig.SetAtConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_Config ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
        rg_SATURDAY.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
      begin
        ed_YHour.Text := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
        ed_YMin.Text := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
      end else if FindField('CO_CONFIGCODE').AsString = 'TTIME' then
      begin
        ed_ATHH.Text := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
        ed_ATMM.Text := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
      end else if FindField('CO_CONFIGCODE').AsString = 'NONPAYHOLI' then
        rg_NonPay.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then
        rg_outtime.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
        rg_atType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
        rg_deviceType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEE' then
        rg_Employee.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCD' then
        rg_Company.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'REALREPORT' then
        rg_RealReportType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger;
        
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmATConfig.SetPayConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_Config ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''PAY'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'WEEKTIME' then
        ed_WeekTime.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'EARLYADD' then
        ed_EarlyAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'EXTENDADD' then
        ed_ExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'NIGHTADD' then
        ed_NightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SEARLYADD' then
        ed_sEarlyAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SEXTENDADD' then
        ed_sExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SNIGHTADD' then
        ed_sNightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HNORMALADD' then
        ed_hNormalAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HEXTENDADD' then
        ed_hExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HNIGHTADD' then
        ed_hNightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'JIGAK' then
        cmb_Jigak.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'JOTAE' then
        cmb_Jotae.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'ABSENCE' then
        cmb_Absence.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then
        rg_atTypePay.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'MONTHLAST' then
        ed_MonthLastDay.Text := FindField('CO_CONFIGVALUE').AsString;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  if rg_atTypePay.ItemIndex = 1 then Panel5.Visible:= True
  else Panel5.Visible := False;
end;

procedure TfmATConfig.rg_atTypePayClick(Sender: TObject);
begin
  if rg_atTypePay.ItemIndex <> 1 then
  begin
    Panel5.Visible:= False;
  end
  else
  begin
    Panel5.Visible := True;
  end;
end;

procedure TfmATConfig.GetNewAtConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_ATWORKTYPE ';
  stSql := stSql + ' Where AW_CODE = ''001'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('AW_DEVICETYPE').AsString) then
      begin
          rg_deviceType.ItemIndex := strtoint(FindField('AW_DEVICETYPE').AsString);
      end else rg_deviceType.ItemIndex := 0;

      ed_StartWorkNo.Text:= FindField('AW_ATSTARTBUTTON').AsString;
      ed_OffWorkNo.Text := FindField('AW_ATOFFBUTTON').AsString;
      ed_WorkOutSideNo.Text := FindField('AW_WORKOUTBUTTON').AsString;
      ed_WorkInNo.Text := FindField('AW_WORKINBUTTON').AsString;
      if isDigit(FindField('AW_INOUTDEVICETYPE').AsString) then
      begin
        rg_InoutType.ItemIndex := strtoint(FindField('AW_INOUTDEVICETYPE').AsString);
      end else rg_InoutType.ItemIndex := 0;
      ed_YHour.Text := copy(FindField('AW_YESTERDAYTIME').AsString,1,2);
      ed_YMin.Text := copy(FindField('AW_YESTERDAYTIME').AsString,3,2);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmATConfig.UpdateTB_ATWORKTYPE(aCode, aField,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATWORKTYPE set ' + aField + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where AW_CODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
