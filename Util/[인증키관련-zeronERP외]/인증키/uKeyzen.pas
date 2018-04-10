unit uKeyzen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IdBaseComponent, IdComponent, IdTCPConnection,
  IdStack, IdTCPServer, OleCtrls, SHDocVw, LMDCustomComponent, LMDIniCtrl,
  DB, ADODB,DIMime;

type
  TForm1 = class(TForm)
    msk_SaupId: TMaskEdit;
    Label1: TLabel;
    ed_Coname: TEdit;
    Label2: TLabel;
    btn_Auth: TButton;
    btn_Close: TButton;
    IdTCPServer1: TIdTCPServer;
    Memo1: TMemo;
    LMDIniCtrl1: TLMDIniCtrl;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ed_AuthKey: TEdit;
    Label4: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    WebBrowser1: TWebBrowser;
    edPasswd: TEdit;
    procedure btn_AuthClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure msk_SaupIdKeyPress(Sender: TObject; var Key: Char);
    procedure ed_ConameKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edPasswdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Function DBConnect:Boolean;
    Function StringToBin(aData:string):string;
    Function BinToHexStr(aData:string):string;
    Function InsertTB_AuthKey(aSaupId,aLocalAddress,aKey:string):Boolean;
    Function GetMaxCount(aSaupId:string):integer;
    Function GetCurCount(aSaupId:string):integer;
    Function PasswdCheck(aSaupId,aPasswd:string):Boolean;
    Function SearchTB_AuthKey(aSaupId,aMac:string;var aDate : string):Boolean;
    Function GetDateTime:string;
  public
    { Public declarations }
    L_stGubun : string;
    L_bConnected : Boolean;
  end;

var
  Form1: TForm1;

implementation
uses uLomosUtil;

{$R *.dfm}



function TForm1.BinToHexStr(aData: string): string;
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

procedure TForm1.btn_AuthClick(Sender: TObject);
var
  TempList : TstringList;
  i :integer;
  stTemp : string;
  nSaupId : integer;
  nIp:integer;
  stUrl : string;
  stKey : string;
  bResult : Boolean;
  stMac : string;
  nMac : integer;
  stDate : string;
  nMaxCount,nCurCount : integer;
begin
  if Length(msk_SaupId.Text) < 10 then
  begin
    showmessage('사업자등록번호가 올바르지 않습니다');
    Exit;
  end;

  nSaupId := 0;
  for i:=1 to Length(msk_SaupId.Text) do
  begin
    nSaupId := nSaupId + Ord(msk_SaupId.Text[i]);
  end;

//  stMac := UpperCase(GetMacAddress);
  stMac := UpperCase(GetMacFromIP(Get_Local_IPAddr));
  memo1.Lines.Add(stMac);
  nMac := 0;
  for i:=1 to Length(stMac) do
  begin
    nMac := nMac + Ord(stMac[i]);
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
  stDate := FormatDateTime('yyyymmdd',now + 30);

  if L_bConnected then
  begin
    nMaxCount := GetMaxCount(msk_SaupId.Text);
    if nMaxCount = 0 then
    begin
      showmessage(msk_SaupId.Text + '는 등록되지 않은 가입자 입니다. ');
      Exit;
    end;

    stDate := GetDateTime;

    bResult := PasswdCheck(msk_SaupId.Text,edPasswd.Text);
    if Not bResult then
    begin
      showmessage('비밀번호가 올바르지 않습니다.');
      Exit;
    end;
    bResult := SearchTB_AuthKey(msk_SaupId.Text,stMac,stDate);  //이미 등록되어 있는 가입자이면 셋팅만 함
    if Not bResult then
    begin
      nCurCount := GetCurCount(msk_SaupId.Text);
      if nCurCount >= nMaxCount then
      begin
        showmessage(msk_SaupId.Text + '는 설치 대수를 초과하였습니다.(' + inttostr(nMaxCount) + ')');
        Exit;
      end;
      bResult := InsertTB_AuthKey(msk_SaupId.Text,stMac,stKey);
      if bResult then ed_AuthKey.Text := stKey
      else
      begin
        showmessage('인증번호 추출 에러입니다.네트웍을 확인하여 주세요');
        Exit;
      end;
    end else
    begin
      {if msk_SaupId.Text = 'Z-00000000' then
      begin
        showmessage('1회 이상 테스트용인증키를 등록한 컴퓨터 입니다. 인증키를 발급후 사용하시기 바랍니다.');
        Exit;
      end;  }
    end;
    LMDIniCtrl1.IniFile := ExtractFileDir(Application.ExeName) + '\' + 'Key.ini';
    stUrl := LMDIniCtrl1.ReadString('URL','Connect','http://zeron.co.kr');
  end else
  begin
    if edpasswd.Text <> stKey then
    begin
      showmessage('인증키값이 틀립니다. 정확한 인증키값을 넣어 주세요.');
      Exit;
    end;
  end;

{  if L_bConnected then
  begin
    bResult := SearchTB_AuthKey(msk_SaupId.Text,stMac,stDate);  //이미 등록되어 있는 가입자이면 셋팅만 함
    if Not bResult then
    begin
      bResult := InsertTB_AuthKey(msk_SaupId.Text,stMac,stKey);
      if bResult then ed_AuthKey.Text := stKey
      else
      begin
        showmessage('인증번호 추출 에러입니다.네트웍을 확인하여 주세요');
        Exit;
      end;
    end;
  end else
  begin
  end; }
  stDate := MimeEncodeString(stDate);
  LMDIniCtrl1.IniFile := ExtractFileDir(Application.ExeName) + '\' + 'Key.ini';
  LMDIniCtrl1.WriteString('사업자정보','사업자등록번호',msk_SaupId.Text);
  LMDIniCtrl1.WriteString('사업자정보','사업자명',ed_Coname.Text);
  LMDIniCtrl1.WriteString('사업자정보','인증키'+L_stGubun,stKey);
  LMDIniCtrl1.WriteString('사업자정보','설치일'+L_stGubun,stDate);




  stUrl := stUrl + '/Keyzen.php?Key=' + stKey;
  stUrl := stUrl + '&SaupId=' + msk_SaupId.Text;
  stUrl := stUrl + '&SaupName=' + ed_Coname.Text;
  stUrl := stUrl + '&LocalIp='+ stMac ;//GStack.LocalAddress;
//  WebBrowser1.Navigate(stUrl);
  showmessage('인증에 성공하였습니다.');
  Close;
end;

function TForm1.StringToBin(aData: string): string;
var
  i:integer;
  stTemp : string;
begin

  stTemp := '';
  for i:=1 to Length(aData) do
  begin
    stTemp := stTemp + IntToBin(strtoint(aData[i]),4);
  end;
  result := stTemp;
end;

procedure TForm1.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.msk_SaupIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if ed_Coname.Visible then
       ed_Coname.SetFocus
    else if edPasswd.Visible then edPasswd.SetFocus;
  end;
end;

procedure TForm1.ed_ConameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    edPasswd.SetFocus;
  end;
end;

function TForm1.InsertTB_AuthKey(aSaupId,
  aLocalAddress,aKey: string): Boolean;
var
  conStr : string;
  stSql : string;
begin
  result := False;
  stSql := 'Insert Into TB_AUTHKEY(AC_COMPANYID,AK_PCMAC,AK_GUBUN,AK_CONNECTIP,AK_KEY,Insertdate)';
  stSql := stSql + ' values(''' + aSaupId + ''',';
  stSql := stSql + '''' + aLocalAddress + ''',';
  stsql := stSql + '''' + L_stGUBUN + ''',';
  stsql := stSql + '''' + Get_Local_IPAddr + ''',';
  stSql := stSql + '''' + aKey + ''',';
  stSql := stSql + 'getDate() )';
  
  with AdoQuery1 do
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

function TForm1.DBConnect: Boolean;
var
  conStr : string;
begin
  result := false;
  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=zeronpass;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=zeron;';
  conStr := constr + 'Initial Catalog=zeron;';
  conStr := constr + 'Data Source=zeron.co.kr,1433' ;

  with ADOConnection1 do
  begin
    CommandTimeout := 600;
    ConnectionTimeout := 15;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러,네트웍 환경을 확인하세요.' );
          Exit;
        end;
    End;
  end;
  result := true;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  bResult : Boolean;
  nCount : integer;
begin
//  showmessage(stGubun);
  L_bConnected := True;
  L_bConnected := DBConnect;
  if Not L_bConnected then
  begin
    showmessage('인증키를 획득하시려면 02-2057-4981로 문의 하세요.');
    //Application.Terminate;
    Label2.Caption := '컴퓨터 MAC';
    Label2.Visible := True;
    ed_Coname.Enabled := False;
    //ed_Coname.Text := GetMacAddress;
    ed_Coname.Text := UpperCase(GetMacFromIP(Get_Local_IPAddr));
    ed_Coname.Visible := True;
    Label4.Caption := '인증번호';
  end;
end;

function TForm1.GetMaxCount(aSaupId: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' select * from TB_AUTHCOUNT ';
  stSql := stSql + ' where saupid = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND GUBUN = ''' + L_stGubun + ''' ';

  with AdoQuery1 do
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

function TForm1.GetCurCount(aSaupId: string): integer;
var
  stSql : string;
begin
  result := -1;
  stSql := ' select * from TB_AUTHKEY ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_GUBUN = ''' + L_stGUBUN + ''' ';

  with AdoQuery1 do
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

function TForm1.PasswdCheck(aSaupId, aPasswd: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := ' select * from TB_AUTHCOUNT ';
  stSql := stSql + ' where saupid = ''' + aSaupId + ''' ';
  stSql := stSql + ' And passwd = ''' + aPasswd + ''' ';

  with AdoQuery1 do
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

procedure TForm1.edPasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_Auth.SetFocus;
  end;

end;

function TForm1.SearchTB_AuthKey(aSaupId, aMac: string;var aDate:string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_AUTHKEY ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aSaupId + ''' ';
  stSql := stSql + ' AND AK_PCMAC = ''' + aMac + ''' ';
  stSql := stSql + ' AND AK_GUBUN = ''' + L_stGUBUN + ''' ';

  with AdoQuery1 do
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

function TForm1.GetDateTime: string;
var
  stSql : string;
begin
  result := formatdateTime('yyyymmdd',now + 30);
  if L_bConnected then
  begin
    stSql := 'select getdate() as curdate ';
    with AdoQuery1 do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then exit;
      result := formatdateTime('yyyymmdd',findField('curdate').AsDateTime + 30);
    end;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ParamCount = 0 then  L_stGubun := '0'
  else L_stGubun := ParamStr(1);
  //L_stGubun := '2';
end;

end.
