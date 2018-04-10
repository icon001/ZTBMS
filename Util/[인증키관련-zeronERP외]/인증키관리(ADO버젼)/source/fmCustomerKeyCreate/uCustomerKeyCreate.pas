unit uCustomerKeyCreate;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, BaseGrid, AdvGrid, StdCtrls, Mask, DB,
  ADODB, uSubForm, CommandArray,Imm;

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
    Label2: TLabel;
    Label3: TLabel;
    cmb_spgGroup: TComboBox;
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
    msk_SaupId: TMaskEdit;
    TempQuery: TADOQuery;
    Label8: TLabel;
    cmb_pggubun: TComboBox;
    Label9: TLabel;
    cmb_CompanyCode2: TComboBox;
    cmb_CompanyCode1: TComboBox;
    btn_Update: TSpeedButton;
    st_count: TStaticText;
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
    procedure cmb_spgGroupChange(Sender: TObject);
    procedure cmb_CompanyCode2Change(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure cmb_CompanyCode1KeyPress(Sender: TObject; var Key: Char);
    procedure ed_MacEnter(Sender: TObject);
  private
    State : string;
    ProgramTypeList : TStringList;
    CompanyCodeList : TStringList;
    L_stOldPCMac : string;
    L_stOldProgramGubun : string;
    { Private declarations }

    procedure cmbPGTypeLoad(cmb_Box:TComboBox;bAll:Boolean = True);
    Function GetMaxCount(aSaupId,aGubun:string):integer;
    Function PasswdCheck(aSaupId,aPasswd:string):Boolean;
    Function GetCurCount(aSaupId,aGubun:string):integer;
    Function SearchTB_AuthKey(aSaupId,aMac,aGubun:string;var aDate : string):Boolean;
    Function InsertTB_AuthKey(aSaupId,aLocalAddress,aKey,aGubun: string):Boolean;
    Function UpdateTB_AuthKey(aSaupId,aOldMac,aOldGubun,aLocalAddress,aKey,aGubun: string):Boolean;
    Function DeleteTB_AuthKey(aSaupId,aMac,aGubun:string):Boolean;
    Function BinToHexStr(aData:string):string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowAuthKey(aCompanyCode,aMac,aPgGubun:string;aTopRow:integer = 0);
    procedure  LoadCompanyCode(cmb_box:TComboBox;aPgGroup:string;bTotal:Boolean);
    Function GetPassword(aSaupId:string):string;

    procedure SetHangeulMode(SetHangeul:Boolean);
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
  ProgramTypeList.Free;
  CompanyCodeList.Free;
  Action := caFree;
end;

procedure TfmCustomerKeyCreate.cmbPGTypeLoad(cmb_Box: TComboBox;
  bAll: Boolean);
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

procedure TfmCustomerKeyCreate.FormCreate(Sender: TObject);
begin
  ProgramTypeList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
end;

procedure TfmCustomerKeyCreate.FormShow(Sender: TObject);
begin
  cmbPGTypeLoad(cmb_spgGroup);
  LoadCompanyCode(cmb_CompanyCode1,'',True);
  LoadCompanyCode(cmb_CompanyCode2,'',False);
  ShowAuthKey('','','');
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
  cmb_CompanyCode2.ItemIndex := 0;
  msk_SaupId.Text := 'Z-';
  ed_Pw.Text := '';
  ed_Mac.Text := '';
  ed_AuthKey.Text := '';
  cmb_pggubun.ItemIndex := 0;
end;

procedure TfmCustomerKeyCreate.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    cmb_CompanyCode2.Enabled := True;
    sg_AuthKey.Enabled := False;
    msk_SaupId.Enabled := True;
    ed_Pw.Enabled := True;
    ed_Mac.Enabled := True;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := True;
    cmb_pggubun.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    cmb_CompanyCode2.Enabled := False;
    sg_AuthKey.Enabled := True;
    msk_SaupId.Enabled := False;
    ed_Pw.Enabled := False;
    ed_Mac.Enabled := False;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := False;
    cmb_pggubun.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    cmb_CompanyCode2.Enabled := False;
    sg_AuthKey.Enabled := True;
    msk_SaupId.Enabled := False;
    ed_Pw.Enabled := False;
    ed_Mac.Enabled := False;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := False;
    cmb_pggubun.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    cmb_CompanyCode2.Enabled := False;
    sg_AuthKey.Enabled := False;
    msk_SaupId.Enabled := False;
    ed_Pw.Enabled := True;
    ed_Mac.Enabled := True;
    ed_AuthKey.Enabled := True;
    btn_RegKey.Enabled := True;
    cmb_pggubun.Enabled := True;
  end;
end;

procedure TfmCustomerKeyCreate.btn_SearchClick(Sender: TObject);
begin
  ShowAuthKey('','','');
end;

procedure TfmCustomerKeyCreate.ShowAuthKey(aCompanyCode, aMac,aPgGubun: string;aTopRow:integer = 0);
var
  stSql :string;
  stWhere : string;
  nRow : integer;
begin
  GridInitialize(sg_AuthKey); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stWhere := '';
  if cmb_spgGroup.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' b.AC_CPPGTYPE = ''' + ProgramTypeList.Strings[cmb_spgGroup.ItemIndex] + ''' ';
  end;

  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' a.AC_COMPANYID = ''' + CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex] + ''' ';
  end;

  if Trim(ed_sPCMac.Text) <> '' then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';

    stWhere := stWhere + ' a.AK_PCMAC = ''' + Trim(ed_sPCMac.Text) + ''' ';
  end;


  stSql := 'select a.*,b.AC_CPNAME,b.AC_AUTHKEY as PW from TB_AUTHKEY a ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY b ';
  stSql := stSql + ' ON(a.AC_COMPANYID = b.AC_COMPANYID) ';
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
    st_count.Caption := '조회건수: ' + inttostr(recordcount) + '건';
    if recordCount < 1 then Exit;

    sg_AuthKey.RowCount := recordCount + 1;
    While Not Eof do
    begin
      with sg_AuthKey do
      begin
        cells[0,nRow] := FindField('AC_COMPANYID').AsString;
        cells[1,nRow] := FindField('AC_CPNAME').AsString;
        cells[2,nRow] := FindField('AK_PCMAC').AsString;
        cells[3,nRow] := FindField('AK_GUBUN').AsString;
        cells[4,nRow] := FindField('AK_KEY').AsString;
        cells[5,nRow] := FindField('PW').AsString;
        if FindField('AC_COMPANYID').AsString  = aCompanyCode then
        begin
          if FindField('AK_PCMAC').AsString  = aMac then
          begin
            if FindField('AK_GUBUN').AsString = aPgGubun then
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

procedure TfmCustomerKeyCreate.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  msk_SaupId.SetFocus;
end;

procedure TfmCustomerKeyCreate.btn_CancelClick(Sender: TObject);
begin
  ShowAuthKey('','','');
end;

procedure TfmCustomerKeyCreate.btn_RegKeyClick(Sender: TObject);
var
  nMaxCount,nCurCount : integer;
  bResult : Boolean;
  nSaupId,nMac : integer;
  stTemp,stKey,stDate : string;
  i : integer;
begin
  if Length(Trim(msk_SaupId.Text)) < 10 then
  begin
    showmessage('고객아이디를 정확히 입력하세요.');
    exit;
  end;
  if Length(Trim(ed_Pw.Text)) < 1 then
  begin
    showmessage('비밀번호를 정확히 입력하세요.');
    exit;
  end;

  ed_Mac.text := UpperCase(ed_mac.Text);
  if Length(Trim(ed_Mac.Text)) < 1 then
  begin
    showmessage('PC정보를 정확히 입력하세요.');
    exit;
  end;
  if cmb_pggubun.ItemIndex < 2 then
  begin
    showmessage('프로그램구분을 정확히 입력하세요.');
    exit;
  end;
  nMaxCount := GetMaxCount(Trim(msk_SaupId.Text),copy(cmb_pggubun.text,1,1));
  if nMaxCount = 0 then
  begin
     showmessage(msk_SaupId.Text + '는 등록되지 않은 가입자 입니다. ');
     Exit;
  end;
  bResult := PasswdCheck(msk_SaupId.Text,ed_pw.Text);
  if Not bResult then
  begin
     showmessage('비밀번호가 올바르지 않습니다.');
     Exit;
  end;
  if  State = 'INSERT' then
  begin
    nCurCount := GetCurCount(msk_SaupId.Text,copy(cmb_pggubun.text,1,1));
    if nCurCount >= nMaxCount then
    begin
       showmessage(msk_SaupId.Text + '는 설치 대수를 초과하였습니다.(' + inttostr(nMaxCount) + ')');
       Exit;
    end;
  end;
  nSaupId := 0;
  for i:=1 to Length(msk_SaupId.Text) do
  begin
    nSaupId := nSaupId + Ord(msk_SaupId.Text[i]);
  end;
  ed_Mac.Text := UpperCase(ed_Mac.Text);
  ed_Mac.Text := StringReplace(ed_Mac.Text,'O','ⓞ',[rfReplaceAll]);
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
  if  State = 'INSERT' then
  begin
    bResult := SearchTB_AuthKey(msk_SaupId.Text,ed_Mac.Text,copy(cmb_pggubun.text,1,1),stDate);  //이미 등록되어 있는 가입자이면 셋팅만 함
    if Not bResult then
    begin
      bResult := InsertTB_AuthKey(msk_SaupId.Text,ed_Mac.Text,stKey,copy(cmb_pggubun.text,1,1));
      if NOT bResult then 
      begin
        showmessage('인증번호 추출 에러입니다.네트웍을 확인하여 주세요');
        Exit;
      end;
      //stDate := GetDateTime;
    end;
  end else
  begin
    bResult := UpdateTB_AuthKey(msk_SaupId.Text,L_stOldPCMac,L_stOldProgramGubun,
                                ed_Mac.Text,stKey,copy(cmb_pggubun.text,1,1));
    if NOT bResult then
    begin
      showmessage('업데이트 에러입니다.네트웍을 확인하여 주세요');
      Exit;
    end;
  end;


  if  State = 'INSERT' then ShowAuthKey(msk_SaupId.Text,ed_Mac.Text,copy(cmb_pggubun.text,1,1))
  else ShowAuthKey(msk_SaupId.Text,ed_Mac.Text,copy(cmb_pggubun.text,1,1),sg_AuthKey.TopRow);
end;

function TfmCustomerKeyCreate.GetMaxCount(aSaupId,aGubun: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' select * from TB_AUTHCOUNT ';
  stSql := stSql + ' where saupid = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND GUBUN = ''' + aGubun + ''' ';

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
    result := FindField('Maxcount').AsInteger ;
  end;
end;

function TfmCustomerKeyCreate.PasswdCheck(aSaupId,
  aPasswd: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := ' select * from TB_AUTHCOUNT ';
  stSql := stSql + ' where saupid = ''' + aSaupId + ''' ';
  stSql := stSql + ' And passwd = ''' + aPasswd + ''' ';

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

function TfmCustomerKeyCreate.GetCurCount(aSaupId,aGubun: string): integer;
var
  stSql : string;
begin
  result := -1;
  stSql := ' select * from TB_AUTHKEY ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_GUBUN = ''' + aGubun + ''' ';

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
    //if recordCount < 1 then Exit;
    result := recordCount ;
  end;
end;

function TfmCustomerKeyCreate.SearchTB_AuthKey(aSaupId, aMac,aGubun: string;
  var aDate: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_AUTHKEY ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_PCMAC = ''' + aMac + ''' ';
  stSql := stSql + ' AND AK_GUBUN = ''' + aGubun + ''' ';

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
    aDate := formatDateTime('yyyymmdd',findField('insertDate').asdateTime);
    result := true ;
  end;
end;

function TfmCustomerKeyCreate.InsertTB_AuthKey(aSaupId, aLocalAddress,
  aKey, aGubun: string): Boolean;
var
  conStr : string;
  stSql : string;
begin
  result := False;

  stSql := 'Insert Into TB_AUTHKEY(AC_COMPANYID,AK_PCMAC,AK_GUBUN,AK_CONNECTIP,AK_KEY,Insertdate)';
  stSql := stSql + ' values(''' + aSaupId + ''',';
  stSql := stSql + '''' + aLocalAddress + ''',';
  stsql := stSql + '''' + aGubun + ''',';
  stsql := stSql + '''' + Get_Local_IPAddr + ''',';
  stSql := stSql + '''' + aKey + ''',';
  stSql := stSql + 'getDate() )';
  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E: Exception do
      begin
//        showmessage(stSql);
        showmessage(E.Message);
        Exit;
      end;
    End;
  end;
  result := True;
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

procedure TfmCustomerKeyCreate.sg_AuthKeyClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    cmb_CompanyCode2.ItemIndex :=  CompanyCodeList.IndexOf(cells[0,Row]);
    msk_SaupId.Text := cells[0,Row];
    ed_Pw.Text := cells[5,Row];
    ed_Mac.Text := cells[2,Row];
    ed_Mac.Text := StringReplace(ed_Mac.Text,'O','ⓞ',[rfReplaceAll]);
    if IsDigit(cells[3,Row]) then
      cmb_pggubun.ItemIndex := strtoint(cells[3,Row])
    else cmb_pggubun.ItemIndex := 0;
    ed_AuthKey.Text := cells[4,Row];
    ed_AuthKey.Text := StringReplace(ed_AuthKey.Text,'O','ⓞ',[rfReplaceAll]);

  end;

end;

procedure TfmCustomerKeyCreate.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_AuthKey(msk_SaupId.Text,ed_Mac.Text,copy(cmb_pggubun.Text,1,1));

  if bResult then ShowAuthKey('','','')
  else showmessage('삭제실패.');

end;

function TfmCustomerKeyCreate.DeleteTB_AuthKey(aSaupId, aMac,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Delete from TB_AUTHKEY ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_PCMAC = ''' + aMac + ''' ';
  stSql := stSql + ' AND AK_GUBUN = ''' + aGubun + ''' ';

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

procedure TfmCustomerKeyCreate.LoadCompanyCode(cmb_box: TComboBox;aPgGroup:string;
  bTotal: Boolean);
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCOMPANY order by AC_CPNAME';
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

procedure TfmCustomerKeyCreate.cmb_spgGroupChange(Sender: TObject);
var
  stPgGroupCode : string;
begin
  stPgGroupCode := '';
  if cmb_spgGroup.ItemIndex > 0 then
  begin
    stPgGroupCode := ProgramTypeList.Strings[cmb_spgGroup.ItemIndex] ;
  end;
  LoadCompanyCode(cmb_CompanyCode1,stPgGroupCode,True);
  LoadCompanyCode(cmb_CompanyCode2,stPgGroupCode,False);

end;

procedure TfmCustomerKeyCreate.cmb_CompanyCode2Change(Sender: TObject);
begin
  if cmb_CompanyCode2.itemIndex > 0 then
    msk_SaupId.Text := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex]
  else msk_SaupId.Text := 'Z-';

  if msk_SaupId.Text <> 'Z-' then
  begin
    ed_Pw.Text := GetPassword(msk_SaupId.Text);
  end;
end;

function TfmCustomerKeyCreate.GetPassword(aSaupId: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from TB_AUTHCOMPANY ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aSaupId + ''' ';
  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := FindField('AC_AUTHKEY').AsString;
  end;

end;

procedure TfmCustomerKeyCreate.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  L_stOldPCMac := ed_Mac.Text;
  L_stOldProgramGubun := copy(cmb_pggubun.text,1,1);
  //FormClear;
  FormEnable(State);
  ButtonEnable(State);

  //msk_SaupId.SetFocus;

end;

function TfmCustomerKeyCreate.UpdateTB_AuthKey(aSaupId, aOldMac, aOldGubun,
  aLocalAddress, aKey, aGubun: string): Boolean;
var
  conStr : string;
  stSql : string;
begin
  result := False;

  stSql := 'update TB_AUTHKEY ';
  stSql := stSql + 'set AK_PCMAC = ''' + aLocalAddress + ''',';
  stSql := stSql + ' AK_GUBUN = ''' + aGubun + ''',';
  stSql := stSql + ' AK_CONNECTIP = ''' + Get_Local_IPAddr + ''',';
  stSql := stSql + ' AK_KEY  = ''' + aKey + ''',';
  stSql := stSql + ' Insertdate = getDate() ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_PCMAC = ''' + aOldMac + ''' ';
  stsql := stSql + ' AND AK_GUBUN = ''' + aOldGubun + ''' ';
  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E: Exception do
      begin
//        showmessage(stSql);
        showmessage(E.Message);
        Exit;
      end;
    End;
  end;
  result := True;
end;

procedure TfmCustomerKeyCreate.cmb_CompanyCode1KeyPress(Sender: TObject;
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
      if Sender = cmb_CompanyCode2 then cmb_CompanyCode2Change(Sender);
      if Sender = cmb_CompanyCode1 then btn_SearchClick(btn_Search);
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

initialization
  RegisterClass(TfmCustomerKeyCreate);
Finalization
  UnRegisterClass(TfmCustomerKeyCreate);

end.
