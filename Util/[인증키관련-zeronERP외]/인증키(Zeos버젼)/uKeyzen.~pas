unit uKeyzen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, IdBaseComponent, IdComponent, IdTCPConnection,
  IdStack, IdTCPServer, OleCtrls, SHDocVw, LMDCustomComponent, LMDIniCtrl,
  DB, ADODB,DIMime, IdTCPClient, IdHTTP, Buttons;

type
  TForm1 = class(TForm)
    msk_SaupId: TMaskEdit;
    Label1: TLabel;
    ed_Coname: TEdit;
    Label2: TLabel;
    IdTCPServer1: TIdTCPServer;
    Memo1: TMemo;
    LMDIniCtrl1: TLMDIniCtrl;
    Label3: TLabel;
    ComboBox1: TComboBox;
    ed_AuthKey: TEdit;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    WebBrowser1: TWebBrowser;
    edPasswd: TEdit;
    IdHTTP1: TIdHTTP;
    btn_Auth: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure btn_AuthClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure msk_SaupIdKeyPress(Sender: TObject; var Key: Char);
    procedure ed_ConameKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure edPasswdKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
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
    Function HTMLANALIYSIS(aSource,aTag:string):string;
  public
    { Public declarations }
    L_stGubun : string;
    L_bConnected : Boolean;
    L_stMaxCount : string;
    L_stServerDate : string;
    L_stPasswdCheck : string;
    L_stAuthKeyRegCheck : string;
    L_stGetCurAuthCount : string;
    L_stInserResult : string;
    L_bWebComplete : Boolean;
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
  stPassword : string;
  bResult : Boolean;
  stMac : string;
  nMac : integer;
  stDate : string;
  nMaxCount,nCurCount : integer;
  bOffLineKey : Boolean;
begin
  if Length(msk_SaupId.Text) < 10 then
  begin
    showmessage('고객사아이디가 올바르지 않습니다');
    Exit;
  end;
  LMDIniCtrl1.IniFile := ExtractFileDir(Application.ExeName) + '\' + 'Key.ini';

  bOffLineKey := False;
  nSaupId := 0;
  for i:=1 to Length(msk_SaupId.Text) do
  begin
    nSaupId := nSaupId + Ord(msk_SaupId.Text[i]);
  end;

//  stMac := UpperCase(GetMacAddress);
  if L_bConnected then
  begin
    stMac := UpperCase(GetMacFromIP(Get_Local_IPAddr));
    memo1.Lines.Add(stMac);
    nMac := 0;
    for i:=1 to Length(stMac) do
    begin
      nMac := nMac + Ord(stMac[i]);
    end;
  end else
  begin
    stMac := LMDIniCtrl1.ReadString('Key','ID','');
    if stMac <> '' then
    begin
      bOffLineKey := True;
      if msk_SaupId.Text <> stMac then
      begin
        showmessage('고객사아이디가 틀립니다.');
        Exit;
      end;
      stMac := LMDIniCtrl1.ReadString('Key','Password','11');
      if edPasswd.Text <> stMac then
      begin
        showmessage('비밀번호가 틀립니다.');
        Exit;
      end;
      nMac := 0;
      for i:=1 to Length(stMac) do
      begin
        nMac := nMac + Ord(stMac[i]);
      end;
    end else
    begin
      stMac := UpperCase(GetMacFromIP(Get_Local_IPAddr));
      memo1.Lines.Add(stMac);
      nMac := 0;
      for i:=1 to Length(stMac) do
      begin
        nMac := nMac + Ord(stMac[i]);
      end;
    end;
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
      //if msk_SaupId.Text = 'Z-00000000' then
      //begin
      //  showmessage('1회 이상 테스트용인증키를 등록한 컴퓨터 입니다. 인증키를 발급후 사용하시기 바랍니다.');
      //  Exit;
      //end;
    end;
    stUrl := LMDIniCtrl1.ReadString('URL','Connect','http://zeron.co.kr');
    LMDIniCtrl1.WriteString('KEY','OFFLINE'+L_stGubun,'FALSE');
  end else
  begin
    if bOffLineKey then
    begin
      LMDIniCtrl1.WriteString('KEY','OFFLINE'+L_stGubun,'TRUE');
    end else
    begin
      if edpasswd.Text <> stKey then
      begin
        showmessage('인증키값이 틀립니다. 정확한 인증키값을 넣어 주세요.');
        Exit;
      end;
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
  LMDIniCtrl1.WriteString('사업자정보','사업자등록번호',msk_SaupId.Text);
  LMDIniCtrl1.WriteString('사업자정보','사업자명',ed_Coname.Text);
  LMDIniCtrl1.WriteString('사업자정보','인증키'+L_stGubun,stKey);
  LMDIniCtrl1.WriteString('사업자정보','설치일'+L_stGubun,stDate);
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

  L_stInserResult := '';
  conStr := 'http://zeron.co.kr/ztbmskey/InsertAuthKey.php?id=' + aSaupId + '&gubun=' + L_stGUBUN;
  conStr := conStr + '&mac=' + aLocalAddress + '&ip=' + Get_Local_IPAddr + '&key=' + aKey;
  conStr := conStr + '&date=' + FormatDateTime('yyyymmddhhnnss',now);
  L_bWebComplete := False;
  WebBrowser1.Navigate(conStr);
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
  end;
  if UpperCase(L_stInserResult) = 'OK' then result := True;
end;

function TForm1.DBConnect: Boolean;
var
  conStr : string;
  FirstTickCount : double;
begin
  result := False;
  L_bConnected := False;
  conStr := 'http://zeron.co.kr/ztbmskey/connectcheck.html';
  L_bWebComplete := False;
  WebBrowser1.Navigate(conStr);
  FirstTickCount := GetTickCount + 3000;
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Exit;
  end;

  result := true;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  bResult : Boolean;
  nCount : integer;
  stKey : string;
begin
//  showmessage(stGubun);
  //L_bConnected := True;
  DBConnect;
  if Not L_bConnected then
  begin
    LMDIniCtrl1.IniFile := ExtractFileDir(Application.ExeName) + '\' + 'Key.ini';
    stKey := LMDIniCtrl1.ReadString('Key','ID','');
    if stKey = '' then
    begin
      showmessage('인증키를 획득하시려면 02-2057-4981로 문의 하세요.');
      //Application.Terminate;
      Label2.Caption := '컴퓨터 MAC';
      Label2.Visible := True;
      ed_Coname.Enabled := True;
      //ed_Coname.Text := GetMacAddress;
      ed_Coname.Text := UpperCase(GetMacFromIP(Get_Local_IPAddr));
      ed_Coname.Visible := True;
      Label4.Caption := '인증번호';
    end;
  end;
end;

function TForm1.GetMaxCount(aSaupId: string): integer;
var
  conStr : string;
begin
  result := 0;
  L_stMaxCount := '';
  conStr := 'http://zeron.co.kr/ztbmskey/GetMaxCount.php?id=' + aSaupId + '&gubun=' + L_stGUBUN;
  L_bWebComplete := False;
  WebBrowser1.Navigate(conStr);
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
  end;
  if isdigit(L_stMaxCount) then result := strtoint(L_stMaxCount);
end;

function TForm1.GetCurCount(aSaupId: string): integer;
var
  conStr : string;
begin
  result := -1;
  L_stGetCurAuthCount := '';
  conStr := 'http://zeron.co.kr/ztbmskey/curAuthCount.php?id=' + aSaupId + '&gubun=' + L_stGUBUN;
  L_bWebComplete := False;
  WebBrowser1.Navigate(conStr);
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
  end;
  if isdigit(L_stGetCurAuthCount) then result := strtoint(L_stGetCurAuthCount);
end;

function TForm1.PasswdCheck(aSaupId, aPasswd: string): Boolean;
var
  stSql : string;
  conStr : string;
begin
  result := false;
  if L_bConnected then
  begin
    L_stPasswdCheck := '';
    conStr := 'http://zeron.co.kr/ztbmskey/passwdcheck.php?id=' + aSaupId + '&pw=' + aPasswd;
    L_bWebComplete := False;
    WebBrowser1.Navigate(conStr);
    while Not L_bWebComplete do
    begin
      Application.ProcessMessages;
    end;
  end;
  if UpperCase(L_stPasswdCheck) = 'OK' then result := True;

end;

procedure TForm1.edPasswdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_AuthClick(self);
  end;

end;

function TForm1.SearchTB_AuthKey(aSaupId, aMac: string;var aDate:string): Boolean;
var
  stSql : string;
  nPos : integer;
  stResult : string;
  stDate : string;
  conStr : string;
begin
  result := False;
  if L_bConnected then
  begin
    L_stAuthKeyRegCheck := '';
    conStr := 'http://zeron.co.kr/ztbmskey/AuthKeyRegcheck.php?id=' + aSaupId + '&mac=' + aMac + '&gubun=' + L_stGubun;
    L_bWebComplete := False;
    WebBrowser1.Navigate(conStr);
    while Not L_bWebComplete do
    begin
      Application.ProcessMessages;
    end;
  end;
  nPos := pos(uppercase('result='),L_stAuthKeyRegCheck);
  if nPos = 0 then Exit;
  delete(L_stAuthKeyRegCheck,1,npos + length('result=') - 1);
  nPos := pos(',',L_stAuthKeyRegCheck);
  if nPos = 0 then stResult := L_stAuthKeyRegCheck
  else
  begin
    stResult := copy(L_stAuthKeyRegCheck,1,nPos - 1);
    delete(L_stAuthKeyRegCheck,1,nPos);
    stDate := L_stAuthKeyRegCheck;
  end;

  if UpperCase(L_stPasswdCheck) = 'OK' then
  begin
    result := True;
    aDate := stDate;
  end;  

end;

function TForm1.GetDateTime: string;
var
  conStr : string;
  nPos : integer;
  stYYYY : string;
  stMM : string;
  stDD : string;
  dtTime : TDateTime;
begin
  result := formatdateTime('yyyymmdd',now + 30);
  if L_bConnected then
  begin
    L_stServerDate := '';
    conStr := 'http://zeron.co.kr/ztbmskey/getdate.php';
    L_bWebComplete := False;
    WebBrowser1.Navigate(conStr);
    while Not L_bWebComplete do
    begin
      Application.ProcessMessages;
    end;
    nPos := Pos('date=',L_stServerDate);
    if nPos = 0 then Exit;
    delete(L_stServerDate,1,nPos + length('date=') - 1);
    nPos := Pos('.',L_stServerDate);
    stYYYY := copy(L_stServerDate,1,nPos - 1);
    delete(L_stServerDate,1,nPos);
    nPos := Pos('.',L_stServerDate);
    stMM := copy(L_stServerDate,1,nPos - 1);
    delete(L_stServerDate,1,nPos);
    stDD := L_stServerDate;
    if Not isDigit(stYYYY) then exit;
    if Not isDigit(stMM) then exit;
    if Not isDigit(stDD) then exit;
    if Length(stYYYY) = 2 then stYYYY := '20' + stYYYY;
    stYYYY := FillZeroStrNum(stYYYY,4);
    stMM := FillZeroStrNum(stMM,2);
    stDD := FillZeroStrNum(stDD,2);
    dtTime := strtoDate(stYYYY + '-' + stMM + '-' + stDD);
    result := formatdateTime('yyyymmdd',dtTime + 30);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if ParamCount = 0 then  L_stGubun := '0'
  else L_stGubun := ParamStr(1);
//  L_stGubun := '2';
end;

procedure TForm1.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  stHTML : string;
begin
  //stHTML := WebBrowser1.OleObject.Document.DocumentElement.InnerHTML;
  //memo1.Text := stHTML;
  //memo1.Text := stHTML;
  If LowerCase(URL) = LowerCase('http://zeron.co.kr/ztbmskey/connectcheck.html') Then
  Begin
    stHTML := WebBrowser1.OleObject.Document.Body.InnerHTML;
    if UpperCase(stHTML) = 'OK' then
      L_bConnected := True;
  end else if LowerCase(copy(URL,1,Length('http://zeron.co.kr/ztbmskey/GetMaxCount.php'))) = LowerCase('http://zeron.co.kr/ztbmskey/GetMaxCount.php') then
  begin
    L_stMaxCount := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end else if LowerCase(URL) = LowerCase('http://zeron.co.kr/ztbmskey/getdate.php') then
  begin
    L_stServerDate := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end else if LowerCase(copy(URL,1,Length('http://zeron.co.kr/ztbmskey/passwdcheck.php'))) = LowerCase('http://zeron.co.kr/ztbmskey/passwdcheck.php') then
  begin
    L_stPasswdCheck := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end else if LowerCase(copy(URL,1,Length('http://zeron.co.kr/ztbmskey/AuthKeyRegcheck.php'))) = LowerCase('http://zeron.co.kr/ztbmskey/AuthKeyRegcheck.php') then
  begin
    L_stAuthKeyRegCheck := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end else if LowerCase(copy(URL,1,Length('http://zeron.co.kr/ztbmskey/curAuthCount.php'))) = LowerCase('http://zeron.co.kr/ztbmskey/curAuthCount.php') then
  begin
    L_stGetCurAuthCount := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end else if LowerCase(copy(URL,1,Length('http://zeron.co.kr/ztbmskey/InsertAuthKey.php'))) = LowerCase('http://zeron.co.kr/ztbmskey/InsertAuthKey.php') then
  begin
    L_stInserResult := WebBrowser1.OleObject.Document.Body.InnerHTML;
  end;
  L_bWebComplete := True;

end;

function TForm1.HTMLANALIYSIS(aSource, aTag: string): string;
begin

end;

end.
