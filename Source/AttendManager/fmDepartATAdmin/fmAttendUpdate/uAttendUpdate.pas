unit uAttendUpdate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,ADODB,ActiveX;

type
  TfmAttendUpdate = class(TForm)
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox1: TGroupBox;
    StaticText11: TStaticText;
    StaticText10: TStaticText;
    StaticText9: TStaticText;
    StaticText8: TStaticText;
    StaticText7: TStaticText;
    StaticText6: TStaticText;
    StaticText5: TStaticText;
    StaticText4: TStaticText;
    StaticText3: TStaticText;
    StaticText2: TStaticText;
    StaticText1: TStaticText;
    cmb_ATType: TComboBox;
    cmb_InType: TComboBox;
    cmb_OutType: TComboBox;
    ed_CompanyName: TEdit;
    ed_JijumName: TEdit;
    ed_DepartName: TEdit;
    ed_EmCode: TEdit;
    ed_EmName: TEdit;
    ed_Intime: TEdit;
    ed_OutTime: TEdit;
    mem_Etc: TMemo;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_ATTypeClick(Sender: TObject);
    procedure cmb_InTypeClick(Sender: TObject);
    procedure cmb_OutTypeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_IntimeChange(Sender: TObject);
    procedure ed_OutTimeChange(Sender: TObject);
    procedure mem_EtcChange(Sender: TObject);
  private
    ATCodeList : TStringList;
    ATInTypeList : TStringList;
    ATOutTypeList : TStringList;
    FOnEMName: string;
    FOnEtc: string;
    FOnOutType: string;
    FOnInType: string;
    FOnDepartName: string;
    FOnEMCODE: string;
    FOnOutTime: string;
    FOnCompanyName: string;
    FOnInTime: string;
    FOnJijumName: string;
    FOnATType: string;
    FOnCompanyCode: string;
    FOnATTypeName: string;
    FOnInTypeName: string;
    FOnOutTypeName: string;
    FOnAtDate: string;
    FOnSaveResult: Boolean;
    procedure SetATType(const Value: string);
    procedure SetCompanyName(const Value: string);
    procedure SetDepartName(const Value: string);
    procedure SetEMCODE(const Value: string);
    procedure SetEMName(const Value: string);
    procedure SetEtc(const Value: string);
    procedure SetInTime(const Value: string);
    procedure SetInType(const Value: string);
    procedure SetJijumName(const Value: string);
    procedure SetOutTime(const Value: string);
    procedure SetOutType(const Value: string);
    { Private declarations }
    procedure LoadATCode(cmb_Box: TComboBox);
    procedure LoadInCode(cmb_Box: TComboBox);
    procedure LoadOutCode(cmb_Box: TComboBox);
    procedure SetATTypeName(const Value: string);
    procedure SetInTypeName(const Value: string);
    procedure SetOutTypeName(const Value: string);

    function SaveTB_ATEVENT(aDate,aCompanyCode,aEmCode,aAtType,aInTime,aOutTime,aInType,aOutType,aEtc:string):Boolean;
    function CheckTB_ATEVENT(aDate, aCompanyCode, aEmCode:string):Boolean;
    function InsertIntoTB_ATEVENT(aDate, aCompanyCode, aEmCode,aAtType, aInTime, aOutTime, aInType, aOutType, aEtc:string):Boolean;
    function UpdateTB_ATEVENT(aDate, aCompanyCode, aEmCode,aAtType, aInTime, aOutTime, aInType, aOutType, aEtc:string):Boolean;
  public
    { Public declarations }
    property CompanyName : string read FOnCompanyName write SetCompanyName;
    property JijumName : string read FOnJijumName write SetJijumName;
    property DepartName : string read FOnDepartName write SetDepartName;
    property EMCODE : string read FOnEMCODE write SetEMCODE;
    property EMName : string read FOnEMName write SetEMName;
    property ATType : string read FOnATType write SetATType;
    property ATTypeName : string read FOnATTypeName write SetATTypeName;
    property InTime : string read FOnInTime write SetInTime;
    property OutTime : string read FOnOutTime write SetOutTime;
    property InType : string read FOnInType write SetInType;
    property InTypeName : string read FOnInTypeName write SetInTypeName;
    property OutType : string read FOnOutType write SetOutType;
    property OutTypeName : string read FOnOutTypeName write SetOutTypeName;
    property Etc : string read FOnEtc write SetEtc;
    property COMPANYCODE : string read FOnCompanyCode write FOnCompanyCode;
    property ATDATE : string read FOnAtDate write FOnAtDate;
    property SaveResult :Boolean read FOnSaveResult write FOnSaveResult;
  end;

var
  fmAttendUpdate: TfmAttendUpdate;

implementation

uses
  uDataModule1;
{$R *.dfm}

procedure TfmAttendUpdate.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAttendUpdate.SetATType(const Value: string);
var
  nIndex : integer;
begin
  if FOnATType = Value then Exit;

  btn_Save.Enabled := True;

  nIndex := ATCodeList.IndexOf(Value);
  if nIndex > -1 then
  begin
    cmb_ATType.ItemIndex := nIndex;
  end;
  ATTypeName := cmb_ATType.Text;
  FOnATType := Value;
end;

procedure TfmAttendUpdate.SetCompanyName(const Value: string);
begin
  FOnCompanyName := Value;
  ed_CompanyName.Text := Value;
end;

procedure TfmAttendUpdate.SetDepartName(const Value: string);
begin
  FOnDepartName := Value;
  ed_DepartName.Text := Value;
end;

procedure TfmAttendUpdate.SetEMCODE(const Value: string);
begin
  FOnEMCODE := Value;
  ed_EmCode.Text := Value;
end;

procedure TfmAttendUpdate.SetEMName(const Value: string);
begin
  FOnEMName := Value;
  ed_EmName.Text := Value;
end;

procedure TfmAttendUpdate.SetEtc(const Value: string);
begin
  FOnEtc := Value;
  mem_Etc.Text := Value;
end;

procedure TfmAttendUpdate.SetInTime(const Value: string);
begin
  FOnInTime := Value;
  ed_Intime.Text := Value;
end;

procedure TfmAttendUpdate.SetInType(const Value: string);
var
  nIndex : integer;
begin
  if FOnInType = Value then Exit;
  btn_Save.Enabled := True;

  nIndex := ATInTypeList.IndexOf(Value);
  if nIndex > -1 then
  begin
    cmb_InType.ItemIndex := nIndex;
  end;
  InTypeName := cmb_InType.Text;
  FOnInType := Value;
end;

procedure TfmAttendUpdate.SetJijumName(const Value: string);
begin
  FOnJijumName := Value;
  ed_JijumName.Text := value;
end;

procedure TfmAttendUpdate.SetOutTime(const Value: string);
begin
  FOnOutTime := Value;
  ed_OutTime.Text := value;
end;

procedure TfmAttendUpdate.SetOutType(const Value: string);
var
  nIndex : integer;
begin
  if FOnOutType = Value then Exit;
  btn_Save.Enabled := True;
  nIndex := ATOutTypeList.IndexOf(Value);
  if nIndex > -1 then
  begin
    cmb_OutType.ItemIndex := nIndex;
  end;
  OutTypeName := cmb_OutType.Text;
  FOnOutType := Value;
end;

procedure TfmAttendUpdate.LoadATCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  ATCodeList.Clear;

  stSql := ' select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  ATCodeList.Add('');
  cmb_Box.Items.Add('');
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
      cmb_Box.Items.Add(FindField('AT_CODENAME').AsString);
      ATCodeList.Add(FindField('AT_ATCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmAttendUpdate.LoadInCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  ATInTypeList.Clear;

  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

  ATInTypeList.Add('');
  cmb_Box.Items.Add('');
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
      ATInTypeList.Add(FindField('AT_INCODE').AsString);
      cmb_Box.Items.Add(FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmAttendUpdate.LoadOutCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  ATOutTypeList.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

  ATOutTypeList.Add('');
  cmb_Box.Items.Add('');
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
      ATOutTypeList.Add(FindField('AT_OUTCODE').AsString);
      cmb_Box.Items.Add(FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmAttendUpdate.FormCreate(Sender: TObject);
begin
  ATCodeList := TStringList.Create;
  ATInTypeList := TStringList.Create;
  ATOutTypeList := TStringList.Create;
  LoadATCode(cmb_ATType);
  LoadInCode(cmb_InType);
  LoadOutCode(cmb_OutType);

  SaveResult := False;
end;

procedure TfmAttendUpdate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ATCodeList.Free;
  ATInTypeList.Free;
  ATOutTypeList.Free;
end;

procedure TfmAttendUpdate.btn_SaveClick(Sender: TObject);
var
  stInTime : string;
  stOutTime : string;
  stEtc : string;
begin
  if ATType = '' then
  begin
    showmessage('근무타입을 설정하셔야 합니다.');
    Exit;
  end;
  InTime := ed_Intime.Text;
  stInTime := InTime;
  stInTime := StringReplace(stInTime,':','',[rfReplaceAll]);
  stInTime := StringReplace(stInTime,'-','',[rfReplaceAll]);
  if Length(stInTime) <> 6 then
  begin
    showmessage('출근시간은 hh:nn:ss 형태로 기재해 주세요.');
    Exit;
  end;
  OutTime := ed_Outtime.Text;
  stOutTime := OutTime;
  stOutTime := StringReplace(stOutTime,':','',[rfReplaceAll]);
  stOutTime := StringReplace(stOutTime,'-','',[rfReplaceAll]);
  if Length(stOutTime) <> 6 then
  begin
    showmessage('퇴근시간은 hh:nn:ss 형태로 기재해 주세요.');
    Exit;
  end;

  if InType = '' then
  begin
    showmessage('출근형태를 설정하셔야 합니다.');
    Exit;
  end;
{  if OutType = '' then
  begin
    showmessage('퇴근형태를 설정하셔야 합니다.');
    Exit;
  end;  }
  Etc := mem_Etc.Text;

  if Not SaveTB_ATEVENT(ATDATE,companyCode,EMCODE,ATType,stInTime,stOutTime,InType,OutType,Etc) then
  begin
    showmessage('저장에 실패하였습니다.');
    Exit;
  end;
  SaveResult := True;
  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0',EMCODE , '근태정보업데이트');

  Close;
  
end;

procedure TfmAttendUpdate.SetATTypeName(const Value: string);
begin
  FOnATTypeName := Value;
end;

procedure TfmAttendUpdate.SetInTypeName(const Value: string);
begin
  FOnInTypeName := Value;
end;

procedure TfmAttendUpdate.SetOutTypeName(const Value: string);
begin
  FOnOutTypeName := Value;
end;

procedure TfmAttendUpdate.cmb_ATTypeClick(Sender: TObject);
begin
  ATType := ATCodeList.Strings[cmb_ATType.ItemIndex];
end;

procedure TfmAttendUpdate.cmb_InTypeClick(Sender: TObject);
begin
  InType := ATIntypeList.Strings[cmb_InType.ItemIndex];
end;

procedure TfmAttendUpdate.cmb_OutTypeClick(Sender: TObject);
begin
  OutType := ATOuttypeList.Strings[cmb_OutType.ItemIndex];

end;

function TfmAttendUpdate.SaveTB_ATEVENT(aDate, aCompanyCode, aEmCode,
  aAtType, aInTime, aOutTime, aInType, aOutType, aEtc: string): Boolean;
begin
  if CheckTB_ATEVENT(aDate, aCompanyCode, aEmCode) then
  begin
    result := UpdateTB_ATEVENT(aDate, aCompanyCode, aEmCode,aAtType, aInTime, aOutTime, aInType, aOutType, aEtc);
  end else
  begin
    result := InsertIntoTB_ATEVENT(aDate, aCompanyCode, aEmCode,aAtType, aInTime, aOutTime, aInType, aOutType, aEtc);
  end;
end;

function TfmAttendUpdate.CheckTB_ATEVENT(aDate, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_ATEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmAttendUpdate.InsertIntoTB_ATEVENT(aDate, aCompanyCode, aEmCode,
  aAtType, aInTime, aOutTime, aInType, aOutType, aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATEVENT ( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_DATE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' AT_ATCODE,';
  stSql := stSql + ' AT_INTIME,';
  stSql := stSql + ' AT_OUTTIME,';
  stSql := stSql + ' AT_INCODE,';
  stSql := stSql + ' AT_OUTCODE,';
  stSql := stSql + ' AT_CONTENT,';
  stSql := stSql + ' AT_SUMMARY,';
  stSql := stSql + ' AT_INSERTTIME,';
  stSql := stSql + ' AT_INSERTOPERATOR,';
  stSql := stSql + ' AT_UPDATEOPERATOR )';
  stSql := stsql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aAtType + ''',';
  stSql := stSql + '''' + ATDATE + aInTime + ''',';
  stSql := stSql + '''' + ATDATE + aOutTime + ''',';
  stSql := stSql + '''' + aInType + ''',';
  stSql := stSql + '''' + aOutType + ''',';
  stSql := stSql + '''' + aEtc + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);


end;

function TfmAttendUpdate.UpdateTB_ATEVENT(aDate, aCompanyCode, aEmCode,
  aAtType, aInTime, aOutTime, aInType, aOutType, aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATEVENT set ';
  stSql := stSql + ' AT_ATCODE = ''' + aAtType + ''',';
  stSql := stSql + ' AT_INTIME = ''' + ATDATE + aInTime + ''',';
  stSql := stSql + ' AT_OUTTIME = ''' + ATDATE + aOutTime + ''',';
  stSql := stSql + ' AT_INCODE = ''' + aInType + ''',';
  stSql := stSql + ' AT_OUTCODE = ''' + aOutType + ''',';
  stSql := stSql + ' AT_CONTENT = ''' + aEtc + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'',';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR = ''' + MASTER_ID + ''' ';
  stSql := stsql + ' Where  GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);


end;

procedure TfmAttendUpdate.FormShow(Sender: TObject);
begin
  btn_Save.Enabled := False;
end;

procedure TfmAttendUpdate.ed_IntimeChange(Sender: TObject);
begin
  if InTime <> ed_Intime.Text then btn_Save.Enabled := True;
end;

procedure TfmAttendUpdate.ed_OutTimeChange(Sender: TObject);
begin
  if OutTime <> ed_OutTime.Text then btn_Save.Enabled := True;

end;

procedure TfmAttendUpdate.mem_EtcChange(Sender: TObject);
begin
  if Etc <> mem_Etc.Text then btn_Save.Enabled := True;

end;

end.
