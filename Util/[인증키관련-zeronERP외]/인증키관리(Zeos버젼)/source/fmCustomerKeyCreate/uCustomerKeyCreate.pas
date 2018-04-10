unit uCustomerKeyCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, BaseGrid, AdvGrid, StdCtrls, Mask, DB,
  ADODB, uSubForm, CommandArray,Imm, ZAbstractRODataset, ZAbstractDataset,
  ZDataset,ActiveX, AdvObj;

type
  TfmCustomerKeyCreate = class(TfmASubForm)
    Panel12: TPanel;
    Panel2: TPanel;
    btn_Insert: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    btn_Search: TBitBtn;
    sg_AuthKey: TAdvStringGrid;
    Label4: TLabel;
    ed_sPCMac: TEdit;
    Splitter1: TSplitter;
    Panel3: TPanel;
    Label5: TLabel;
    Label15: TLabel;
    ed_Pw: TEdit;
    Label6: TLabel;
    ed_Mac: TEdit;
    btn_RegKey: TSpeedButton;
    Label7: TLabel;
    ed_AuthKey: TEdit;
    msk_AuthCompanyCode: TMaskEdit;
    Label9: TLabel;
    cmb_AuthCompanyCode: TComboBox;
    cmb_sAuthCompanyCode: TComboBox;
    btn_Update: TSpeedButton;
    st_count: TStaticText;
    TempQuery: TZQuery;
    cmb_sCompany: TComboBox;
    cmb_sJijum: TComboBox;
    cmb_sDepart: TComboBox;
    Label27: TLabel;
    Label26: TLabel;
    Label25: TLabel;
    ed_sPCIP: TEdit;
    Label1: TLabel;
    gb_ProgramType: TGroupBox;
    chk_Monitor: TCheckBox;
    chk_Attend: TCheckBox;
    chk_Food: TCheckBox;
    chk_CompanyName: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_RegKeyClick(Sender: TObject);
    procedure sg_AuthKeyClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure cmb_AuthCompanyCodeChange(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure cmb_sAuthCompanyCodeKeyPress(Sender: TObject; var Key: Char);
    procedure ed_MacEnter(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure cmb_sDepartChange(Sender: TObject);
    procedure cmb_sAuthCompanyCodeChange(Sender: TObject);
    procedure chk_CompanyNameClick(Sender: TObject);
  private
    State : string;
    sCompanyGubunList : TStringList;
    sCompanyCodeList : TStringList;
    sJijumCodeList : TStringList;
    sDepartCodeList : TStringList;
    sAuthCompanyCodeList : TStringList;
    AuthCompanyCodeList : TStringList;
    L_stOldPCMac : string;
    L_stOldProgramGubun : string;
    { Private declarations }

    Function GetMaxCount(aAuthCompanyCode:string;var aMonitorMaxCount,aAttendMaxCount,aFoodMaxCount:integer):Boolean;
    Function PasswdCheck(aAuthCompanyCode,aPasswd:string):Boolean;
    Function GetCurCount(aAuthCompanyCode,aMac:string;var aMonitorCurCount,aAttendCurCount,aFoodCurCount:integer):Boolean;
    Function SearchTB_AuthKey(aAuthCompanyCode,aMac:string):Boolean;
    Function InsertTB_AuthKey(aAuthCompanyCode,aMac,aKey,aMonitor,aAttend,aFood: string):Boolean;
    Function UpdateTB_AuthKey(aAuthCompanyCode,aMac,aKey,aMonitor,aAttend,aFood: string):Boolean;
    Function DeleteTB_AuthKey(aSaupId,aMac:string):Boolean;
    Function BinToHexStr(aData:string):string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowAuthKey(aAuthCompanyCode,aMac:string;aTopRow:integer = 0);
    Function GetPassword(aAuthCompanyCode:string):string;

    procedure SetHangeulMode(SetHangeul:Boolean);
  private
    procedure LoadCompanyCode(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True);
    procedure LoadJijumCode(cmb_Box:TComboBox;aCompanyCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadDepartCode(cmb_Box:TComboBox;aCompanyCode,aJijumCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadAuthCompanyCode(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True;bName:Boolean=True);
    procedure LoadAuthCompanyCodeAll(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True;bName:Boolean=True);
  public
    { Public declarations }
  end;

var
  fmCustomerKeyCreate: TfmCustomerKeyCreate;

implementation
uses
  uDataModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmCustomerKeyCreate.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sCompanyGubunList.Free;
  sCompanyCodeList.Free;
  sJijumCodeList.Free;
  sDepartCodeList.Free;
  sAuthCompanyCodeList.Free;
  AuthCompanyCodeList.Free;
  
  Action := caFree;
end;



procedure TfmCustomerKeyCreate.FormCreate(Sender: TObject);
begin
  sCompanyGubunList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  sAuthCompanyCodeList := TStringList.Create;
  AuthCompanyCodeList := TStringList.Create;
end;

procedure TfmCustomerKeyCreate.FormShow(Sender: TObject);
begin
  LoadCompanyCode(cmb_sCompany,sCompanyCodeList);
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);
  LoadAuthCompanyCode(cmb_sAuthCompanyCode,sAuthCompanyCodeList,True,chk_CompanyName.Checked);
  LoadAuthCompanyCodeAll(cmb_AuthCompanyCode,AuthCompanyCodeList,False,chk_CompanyName.Checked);

  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCustomerKeyCreate.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmCustomerKeyCreate.FormClear;
begin
  cmb_AuthCompanyCode.ItemIndex := 0;
  msk_AuthCompanyCode.Text := 'Z-';
  ed_Pw.Text := '';
  ed_Mac.Text := '';
  ed_AuthKey.Text := '';
  chk_Monitor.Checked := False;
  chk_Attend.Checked := False;
  chk_Food.Checked := False;
end;

procedure TfmCustomerKeyCreate.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    cmb_AuthCompanyCode.Enabled := True;
    sg_AuthKey.Enabled := False;
    msk_AuthCompanyCode.Enabled := True;
    ed_Pw.Enabled := True;
    ed_Mac.Enabled := True;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := True;
    gb_ProgramType.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    cmb_AuthCompanyCode.Enabled := False;
    sg_AuthKey.Enabled := True;
    msk_AuthCompanyCode.Enabled := False;
    ed_Pw.Enabled := False;
    ed_Mac.Enabled := False;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := False;
    gb_ProgramType.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    cmb_AuthCompanyCode.Enabled := False;
    sg_AuthKey.Enabled := True;
    msk_AuthCompanyCode.Enabled := False;
    ed_Pw.Enabled := False;
    ed_Mac.Enabled := False;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := False;
    gb_ProgramType.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    cmb_AuthCompanyCode.Enabled := False;
    sg_AuthKey.Enabled := False;
    msk_AuthCompanyCode.Enabled := False;
    ed_Pw.Enabled := True;
    ed_Mac.Enabled := True;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := True;
    gb_ProgramType.Enabled := True;
  end;
end;

procedure TfmCustomerKeyCreate.btn_SearchClick(Sender: TObject);
begin
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.ShowAuthKey(aAuthCompanyCode,aMac: string;aTopRow:integer = 0);
var
  stSql :string;
  stWhere : string;
  nRow : integer;
begin
  GridInit(sg_AuthKey,8); //��Ʈ���׸��� �ʱ�ȭ
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stWhere := '';
  if cmb_sCompany.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';
  end;
  if cmb_sJijum.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_JIJUMCODE = ''' + sJijumCodeList.Strings[cmb_sJijum.ItemIndex] + ''' ';
  end;
  if cmb_sDepart.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' b.CO_DEPARTCODE = ''' + sDepartCodeList.Strings[cmb_sDepart.ItemIndex] + ''' ';
  end;
  if cmb_sAuthCompanyCode.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AU_COMPANYID = ''' + sAuthCompanyCodeList.Strings[cmb_sAuthCompanyCode.ItemIndex] + ''' ';
  end;

  if Trim(ed_sPCIP.Text) <> '' then
  begin
    stWhere := stWhere + ' AND a.AU_PCIP Like ''%' + Trim(ed_sPCIP.Text) + '''% ';
  end;
  if Trim(ed_sPCMac.Text) <> '' then
  begin
    stWhere := stWhere + ' AND a.AU_MAC Like ''%' + Trim(ed_sPCMac.Text) + '''% ';
  end;

  stSql := 'select a.*,b.AU_COMPANYNAME,b.AU_PASSWD,b.AU_MOCOUNT,b.AU_ATCOUNT,AU_FDCOUNT from TB_AUTHKEY a ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY b ';
  stSql := stSql + ' ON(a.AU_COMPANYID = b.AU_COMPANYID) ';
  if stWhere <> '' then stSql := stSql + stWhere;

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nRow := 1;
    st_count.Caption := '��ȸ�Ǽ�: ' + inttostr(recordcount) + '��';
    if recordCount < 1 then Exit;

    sg_AuthKey.RowCount := recordCount + 1;
    While Not Eof do
    begin
      with sg_AuthKey do
      begin
        cells[0,nRow] := FindField('AU_COMPANYID').AsString;
        cells[1,nRow] := FindField('AU_COMPANYNAME').AsString;
        cells[2,nRow] := FindField('AU_MAC').AsString;
        cells[3,nRow] := FindField('AU_PCIP').AsString;
        cells[4,nRow] := FindField('AU_PASSWD').AsString;
        cells[5,nRow] := FindField('AU_KEY').AsString;
        cells[6,nRow] := FindField('AU_MONITOR').AsString;
        cells[7,nRow] := FindField('AU_ATTEND').AsString;
        cells[8,nRow] := FindField('AU_FOOD').AsString;
        cells[9,nRow] := FindField('AU_MOCOUNT').AsString;
        cells[10,nRow] := FindField('AU_ATCOUNT').AsString;
        cells[11,nRow] := FindField('AU_FDCOUNT').AsString;
        if FindField('AU_COMPANYID').AsString  = aAuthCompanyCode then
        begin
          if FindField('AU_MAC').AsString  = aMac then
          begin
            SelectRows(nRow,1);
          end;
        end;
      end;
      inc(nRow);
      Next;
    end;
    if aTopRow = 0 then
    begin
      if sg_AuthKey.Row > 18 then sg_AuthKey.TopRow := sg_AuthKey.Row - 18;
    end else
    begin
      sg_AuthKey.TopRow := aTopRow;
    end;
  end;
  sg_AuthKeyClick(sg_AuthKey);
end;

procedure TfmCustomerKeyCreate.sg_AuthKeyClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    cmb_AuthCompanyCode.ItemIndex :=  AuthCompanyCodeList.IndexOf(cells[0,Row]);
    msk_AuthCompanyCode.Text := cells[0,Row];
    ed_Pw.Text := cells[4,Row];
    ed_Mac.Text := cells[2,Row];
    ed_Mac.Text := StringReplace(ed_Mac.Text,'O','��',[rfReplaceAll]);
    ed_AuthKey.Text := cells[5,Row];
    ed_AuthKey.Text := StringReplace(ed_AuthKey.Text,'O','��',[rfReplaceAll]);
    if cells[6,Row] = '1' then chk_Monitor.Checked := True
    else chk_Monitor.Checked := False;
    if cells[7,Row] = '1' then chk_Attend.Checked := True
    else chk_Attend.Checked := False;
    if cells[8,Row] = '1' then chk_Food.Checked := True
    else chk_Food.Checked := False;
  end;

end;

procedure TfmCustomerKeyCreate.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  chk_Monitor.Checked := True;
  msk_AuthCompanyCode.SetFocus;
end;

procedure TfmCustomerKeyCreate.btn_CancelClick(Sender: TObject);
begin
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.btn_RegKeyClick(Sender: TObject);
var
  nMonitorMaxCount,nAttendMaxCount,nFoodMaxCount:integer;
  nMonitorCurCount,nAttendCurCount,nFoodCurCount : integer;
  bResult : Boolean;
  nSaupId,nMac : integer;
  stTemp,stKey,stDate : string;
  i : integer;
  stMonitor,stAttend,stFood : string;
begin
  if Length(Trim(msk_AuthCompanyCode.Text)) < 10 then
  begin
    showmessage('�����̵� ��Ȯ�� �Է��ϼ���.');
    exit;
  end;
  if Length(Trim(ed_Pw.Text)) < 1 then
  begin
    showmessage('��й�ȣ�� ��Ȯ�� �Է��ϼ���.');
    exit;
  end;

  ed_Mac.text := UpperCase(ed_mac.Text);
  if Length(Trim(ed_Mac.Text)) < 1 then
  begin
    showmessage('PC������ ��Ȯ�� �Է��ϼ���.');
    exit;
  end;
  if (Not chk_Monitor.Checked) and
     (Not chk_Attend.Checked) and
     (Not chk_Food.Checked) then
  begin
    showmessage('�������� ���α׷� Ÿ���� ��Ȯ�� �Է� �ϼ���.');
    exit;
  end;
  bResult := GetMaxCount(Trim(msk_AuthCompanyCode.Text),nMonitorMaxCount,nAttendMaxCount,nFoodMaxCount);
  if Not bResult then
  begin
     showmessage(msk_AuthCompanyCode.Text + '�� ��ϵ��� ���� ������ �Դϴ�. ');
     Exit;
  end;
  bResult := PasswdCheck(msk_AuthCompanyCode.Text,ed_pw.Text);
  if Not bResult then
  begin
     showmessage('��й�ȣ�� �ùٸ��� �ʽ��ϴ�.');
     Exit;
  end;
  //if  State = 'INSERT' then
  //begin

  //end;
  bResult := GetCurCount(msk_AuthCompanyCode.Text,ed_Mac.Text,nMonitorCurCount,nAttendCurCount,nFoodCurCount);
  if chk_Monitor.Checked then
  begin
    if nMonitorCurCount >= nMonitorMaxCount then
    begin
      showmessage(msk_AuthCompanyCode.Text + '�� ����͸� ��ġ ����� �ʰ��Ͽ����ϴ�.(' + inttostr(nMonitorMaxCount) + ')');
      Exit;
    end;
  end;
  if chk_Attend.Checked then
  begin
    if nAttendCurCount >= nAttendMaxCount then
    begin
      showmessage(msk_AuthCompanyCode.Text + '�� ���� ��ġ ����� �ʰ��Ͽ����ϴ�.(' + inttostr(nAttendMaxCount) + ')');
      Exit;
    end;
  end;
  if chk_Food.Checked then
  begin
    if nFoodCurCount >= nFoodMaxCount then
    begin
      showmessage(msk_AuthCompanyCode.Text + '�� �ļ� ��ġ ����� �ʰ��Ͽ����ϴ�.(' + inttostr(nFoodMaxCount) + ')');
      Exit;
    end;
  end;

  nSaupId := 0;
  for i:=1 to Length(msk_AuthCompanyCode.Text) do
  begin
    nSaupId := nSaupId + Ord(msk_AuthCompanyCode.Text[i]);
  end;
  ed_Mac.Text := UpperCase(ed_Mac.Text);
  ed_Mac.Text := StringReplace(ed_Mac.Text,'O','��',[rfReplaceAll]);
  nMac := 0;
  for i:=1 to Length(ed_Mac.Text) do
  begin
    nMac := nMac + Ord(ed_Mac.Text[i]);
  end;
  nSaupId := nSaupId + nMac;
  stTemp := inttostr(nSaupId);
  stTemp := StringToBin(stTemp);
  stTemp := FillZeroStrNum(stTemp,40);
  stTemp := copy(stTemp,21,Length(stTemp)-20) +copy(stTemp,11,10) + copy(stTemp,1,10);
  stTemp := copy(stTemp,16,Length(stTemp)-15) + copy(stTemp,1,15);
  stTemp := copy(stTemp,30,Length(stTemp)-29) +copy(stTemp,16,14) + copy(stTemp,1,15);

  stTemp := BinToHexStr(stTemp);
  stKey := copy(stTemp,1,3) + '-' + copy(stTemp,4,4) + '-' + copy(stTemp,8,3);
  stDate := '';
  bResult := SearchTB_AuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text);  //�̹� ��ϵǾ� �ִ� �������̸� ���ø� ��

  stMonitor := '0';
  stAttend := '0';
  stFood := '0';
  if chk_Monitor.Checked then stMonitor := '1';
  if chk_Attend.Checked then stAttend := '1';
  if chk_Food.Checked then stFood := '1';

  if Not bResult then
  begin
    bResult := InsertTB_AuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text,stKey,stMonitor,stAttend,stFood);
    if NOT bResult then
    begin
      showmessage('������ȣ ���� �����Դϴ�.��Ʈ���� Ȯ���Ͽ� �ּ���');
      Exit;
    end;
    //stDate := GetDateTime;
  end else
  begin
    bResult := UpdateTB_AuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text,stKey,stMonitor,stAttend,stFood);
    if NOT bResult then
    begin
      showmessage('������Ʈ �����Դϴ�.��Ʈ���� Ȯ���Ͽ� �ּ���');
      Exit;
    end;
  end;

  if  State = 'INSERT' then ShowAuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text)
  else ShowAuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text,sg_AuthKey.TopRow);  
end;

function TfmCustomerKeyCreate.GetMaxCount(aAuthCompanyCode:string;var aMonitorMaxCount,aAttendMaxCount,aFoodMaxCount:integer): Boolean;
var
  stSql : string;
begin
  aMonitorMaxCount := 0;
  aAttendMaxCount := 0;
  aFoodMaxCount := 0;
  
  result := False;
  stSql := ' select * from TB_AUTHCOMPANY ';
  stSql := stSql + ' where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';

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
    if recordCount < 1 then Exit;
    result := True;
    if Not FindField('AU_MOCOUNT').IsNull then
      aMonitorMaxCount := FindField('AU_MOCOUNT').AsInteger;
    if Not FindField('AU_ATCOUNT').IsNull then
      aAttendMaxCount := FindField('AU_ATCOUNT').AsInteger;
    if Not FindField('AU_FDCOUNT').IsNull then
      aFoodMaxCount := FindField('AU_FDCOUNT').AsInteger;
  end;
end;

function TfmCustomerKeyCreate.PasswdCheck(aAuthCompanyCode,
  aPasswd: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := ' select * from TB_AUTHCOMPANY ';
  stSql := stSql + ' where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';
  stSql := stSql + ' And AU_PASSWD = ''' + aPasswd + ''' ';

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
    if recordCount < 1 then Exit;
    result := true ;
  end;
end;

function TfmCustomerKeyCreate.GetCurCount(aAuthCompanyCode,aMac:string;var aMonitorCurCount,aAttendCurCount,aFoodCurCount:integer):Boolean;
var
  stSql : string;
begin
  aMonitorCurCount := 0;
  aAttendCurCount := 0;
  aFoodCurCount := 0;
  result := False;
  stSql := ' select sum(AU_MONITOR) as summonitor,sum(AU_ATTEND) as sumattend,sum(AU_FOOD) as sumfood from TB_AUTHKEY ';
  stSql := stSql + ' where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';
  stSql := stSql + ' AND AU_MAC <> ''' + aMac + ''' ';
  stSql := stSql + ' group by AU_COMPANYID ';

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
    if recordCount < 1 then Exit;
    result := True ;
    if Not FindField('summonitor').IsNull then
      aMonitorcurCount := FindField('summonitor').AsInteger;
    if Not FindField('sumattend').IsNull then
      aAttendcurCount := FindField('sumattend').AsInteger;
    if Not FindField('sumfood').IsNull then
      aFoodcurCount := FindField('sumfood').AsInteger;
  end;
end;

function TfmCustomerKeyCreate.SearchTB_AuthKey(aAuthCompanyCode, aMac: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_AUTHKEY ';
  stSql := stSql + ' where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';
  stSql := stSql + ' AND AU_MAC = ''' + aMac + ''' ';

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
    if recordCount < 1 then Exit;
    result := true ;
  end;
end;

function TfmCustomerKeyCreate.InsertTB_AuthKey(aAuthCompanyCode,aMac,aKey,aMonitor,aAttend,aFood: string):Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_AUTHKEY(AU_COMPANYID,AU_MAC,AU_KEY,AU_MONITOR,AU_ATTEND,AU_FOOD,AU_INSERTDATE)';
  stSql := stSql + ' values(''' + aAuthCompanyCode + ''',';
  stSql := stSql + '''' + aMac + ''',';
  stsql := stSql + '''' + aKey + ''',';
  stsql := stSql + '' + aMonitor + ',';
  stsql := stSql + '' + aAttend + ',';
  stsql := stSql + '' + aFood + ',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',now) + ''' )';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmCustomerKeyCreate.BinToHexStr(aData: string): string;
var
  stTemp : string;
  nTemp : integer;
  i : integer;
  stResult : string;
begin
  if (Length(aData) mod 4) <> 0 then Exit;

  stResult := '';
  for i:= 0 to (Length(aData) div 4) -1 do
  begin
    stTemp := copy(aData,(i * 4) + 1,4);
    nTemp := BinToInt(stTemp);
    stResult := stResult + Dec2Hex(nTemp,1);
  end;
  result := stResult;
end;

procedure TfmCustomerKeyCreate.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('�����͸� �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_AuthKey(msk_AuthCompanyCode.Text,ed_Mac.Text);

  if bResult then ShowAuthKey('','')
  else showmessage('��������.');

end;

function TfmCustomerKeyCreate.DeleteTB_AuthKey(aSaupId, aMac: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Delete from TB_AUTHKEY ';
  stSql := stSql + ' Where AU_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AU_MAC = ''' + aMac + ''' ';

  with TempQuery do
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



procedure TfmCustomerKeyCreate.cmb_AuthCompanyCodeChange(Sender: TObject);
begin
  if cmb_AuthCompanyCode.itemIndex > 0 then
    msk_AuthCompanyCode.Text := AuthCompanyCodeList.Strings[cmb_AuthCompanyCode.itemIndex]
  else msk_AuthCompanyCode.Text := 'Z-';

  if msk_AuthCompanyCode.Text <> 'Z-' then
  begin
    ed_Pw.Text := GetPassword(msk_AuthCompanyCode.Text);
  end;
end;

function TfmCustomerKeyCreate.GetPassword(aAuthCompanyCode: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_AUTHCOMPANY ';
  stSql := stSql + ' Where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';
  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := FindField('AU_PASSWD').AsString;
  end;

end;

procedure TfmCustomerKeyCreate.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  L_stOldPCMac := ed_Mac.Text;
  FormEnable(State);
  ButtonEnable(State);

  //msk_SaupId.SetFocus;

end;

function TfmCustomerKeyCreate.UpdateTB_AuthKey(aAuthCompanyCode,aMac,aKey,aMonitor,aAttend,aFood: string):Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := 'Update TB_AUTHKEY set ';
  stSql := stSql + ' AU_KEY = ''' + aKey + ''',';
  stSql := stSql + ' AU_MONITOR = ' + aMonitor + ',';
  stSql := stSql + ' AU_ATTEND = ' + aAttend + ',';
  stSql := stSql + ' AU_FOOD = ' + aFood + ',';
  stSql := stSql + ' AU_INSERTDATE = ''' + FormatDateTime('yyyymmddhhnnss',now) + ''' ';
  stSql := stSql + ' where AU_COMPANYID = ''' + aAuthCompanyCode + ''' ';
  stSql := stSql + ' AND AU_MAC = ''' + aMac + '''';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmCustomerKeyCreate.cmb_sAuthCompanyCodeKeyPress(Sender: TObject;
  var Key: Char);
var
  nIndex : integer;
begin
  if Key <> #13 then Exit;
  for nIndex := 0 to TComboBox(Sender).Items.Count - 1 do
  begin
    if UpperCase(TComboBox(Sender).Text) = Uppercase(copy(TComboBox(Sender).Items.Strings[nIndex],1,length(TComboBox(Sender).Text))) then
    begin
      TComboBox(Sender).ItemIndex := nIndex;
      TComboBox(Sender).Text := TComboBox(Sender).Items.Strings[nIndex];
      if Sender = cmb_AuthCompanyCode then cmb_AuthCompanyCodeChange(Sender);
      break;
    end;
  end;

end;

procedure TfmCustomerKeyCreate.ed_MacEnter(Sender: TObject);
begin
  SetHangeulMode(False);
end;

procedure TfmCustomerKeyCreate.SetHangeulMode(SetHangeul: Boolean);
var
  tMode:HIMC;
begin
  tMode := ImmGetContext(handle);
  if SetHangeul then
    ImmSetConversionStatus(tMode,IME_CMODE_HANGEUL,IME_CMODE_HANGEUL)
  else
    ImmSetConversionStatus(tMode,IME_CMODE_ALPHANUMERIC,IME_CMODE_ALPHANUMERIC);

end;


procedure TfmCustomerKeyCreate.LoadCompanyCode(cmb_Box: TComboBox;TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('��ü')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where CG_CODE = ''004'' ';

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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmCustomerKeyCreate.LoadDepartCode(cmb_Box: TComboBox;
  aCompanyCode, aJijumCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('��ü')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_DEPART ';
  if aJijumCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';

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
      cmb_Box.Items.Add(FindField('CO_DEPARTNAME').AsString );
      TempList.Add(FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmCustomerKeyCreate.LoadJijumCode(cmb_Box: TComboBox;
  aCompanyCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('��ü')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_JIJUM ';
  if aCompanyCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      cmb_Box.Items.Add(FindField('CO_JIJUMNAME').AsString );
      TempList.Add(FindField('CO_JIJUMCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmCustomerKeyCreate.LoadAuthCompanyCode(cmb_Box: TComboBox;TempList: TStringList;
  bAll: Boolean=True;bName:Boolean=True);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TZQuery;
  stWhere : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('��ü')
  else cmb_Box.Items.Add('');
  TempList.Add('');

  cmb_Box.ItemIndex := 0;

  stWhere := '';

  if cmb_sCompany.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';
  end;
  if cmb_sJijum.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' CO_JIJUMCODE = ''' + sJijumCodeList.Strings[cmb_sJijum.ItemIndex] + ''' ';
  end;
  if cmb_sDepart.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' CO_DEPARTCODE = ''' + sDepartCodeList.Strings[cmb_sDepart.ItemIndex] + ''' ';
  end;

  stSql := 'select * ';
  stSql := stSql + ' from TB_AUTHCOMPANY  ';
  if Trim(stWhere) <> '' then stSql := stSql + stWhere;
  if bName then stSql := stSql + ' order by AU_COMPANYNAME '
  else stSql := stSql + ' order by AU_COMPANYID ';

  CoInitialize(nil);
  TempAdoQuery := TZQuery.Create(nil);
  TempAdoQuery.Connection := dmDB.ZConnection1;

  Try
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
      if RecordCount < 1 then
      begin
        Exit;
      end;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AU_COMPANYNAME').AsString );
        TempList.Add(FindField('AU_COMPANYID').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerKeyCreate.cmb_sCompanyChange(Sender: TObject);
begin
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);
  LoadAuthCompanyCode(cmb_sAuthCompanyCode,sAuthCompanyCodeList);
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.cmb_sJijumChange(Sender: TObject);
begin
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);
  LoadAuthCompanyCode(cmb_sAuthCompanyCode,sAuthCompanyCodeList);
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.cmb_sDepartChange(Sender: TObject);
begin
  LoadAuthCompanyCode(cmb_sAuthCompanyCode,sAuthCompanyCodeList);
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.cmb_sAuthCompanyCodeChange(Sender: TObject);
begin
  inherited;
  ShowAuthKey('','');
end;

procedure TfmCustomerKeyCreate.LoadAuthCompanyCodeAll(cmb_Box: TComboBox;
  TempList: TStringList; bAll: Boolean=True;bName:Boolean=True);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TZQuery;
  stWhere : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('��ü')
  else cmb_Box.Items.Add('');
  TempList.Add('');

  cmb_Box.ItemIndex := 0;
 
  stSql := 'select * ';
  stSql := stSql + ' from TB_AUTHCOMPANY  ';
  if bName then  stSql := stSql + ' order by AU_COMPANYNAME '
  else stSql := stSql + ' order by AU_COMPANYID ';

  CoInitialize(nil);
  TempAdoQuery := TZQuery.Create(nil);
  TempAdoQuery.Connection := dmDB.ZConnection1;

  Try
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
      if RecordCount < 1 then
      begin
        Exit;
      end;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AU_COMPANYNAME').AsString );
        TempList.Add(FindField('AU_COMPANYID').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmCustomerKeyCreate.chk_CompanyNameClick(Sender: TObject);
begin
  inherited;
  LoadAuthCompanyCode(cmb_sAuthCompanyCode,sAuthCompanyCodeList,True,chk_CompanyName.Checked);
  LoadAuthCompanyCodeAll(cmb_AuthCompanyCode,AuthCompanyCodeList,False,chk_CompanyName.Checked);
end;

initialization
  RegisterClass(TfmCustomerKeyCreate);
Finalization
  UnRegisterClass(TfmCustomerKeyCreate);

end.
