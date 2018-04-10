unit uCommonFunction;

interface
uses
  SysUtils,Windows,Forms,ComCtrls,Classes,
  iniFiles,WinSock,Nb30,Messages,AdvGrid;
type
 TNBLanaResources = (lrAlloc, lrFree);

type
 PMACAddress = ^TMACAddress;
 TMACAddress = array[0..5] of Byte;

const
  HexString : String = '0123456789ABCDEF';

procedure LogSave(aFileName,ast:string);

function ApplicationBuildInfo: String;
Function BinToHexStr(aData:string):string;
Function BinToInt(Value : String) : Integer;

//인증키값을 비교하자
Function CompareKey(aSaupId,aKey:string):Boolean;
Function CompareKey2(aSaupId,aKey:string):Boolean;
Function CompareKey3(aSaupId,aKey:string):Boolean;
Function CompareOffLineKey(aSaupId,aKey,aGubun:string):Boolean;
function Dec2Hex(N: int64; A: Byte): string;
function DecodeCardNo(aCardNo: string;aLength : integer = 8;bHex:Boolean = False): String;
function Delay(MSecs: Longint):Boolean;
function ExecFileAndWait(const aCmdLine: String; Hidden, doWait: Boolean): Boolean;
Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
function FillZeroNumber(aNo:Int64; aLength:Integer): string;
function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
//인증키를 가져오자
Function GetAuthKey(aGubun:string;aSeq:integer=0) : string;
Function GetBuildInfo(var V1, V2, V3, V4: Word):Boolean;
//고객사 ID를 가져오자
Function GetCustomerId(aGubun:string;aSeq:integer=0) : string;
function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
function GetLocalIPAddr : string;
function GetMacAddress: string;
function GetMacAddressXe2(LanaNum: Byte; MACAddress: PMACAddress): Byte;
function GetMacFromIP(IP:string):string;
function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
Function GetOffLineAuthState(aGubun:string) : Boolean;
Procedure GridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);

function Hex2Ascii(St: String;bConvert:Boolean=False;aConvertDec:integer=30): String;
function Hex2Binary(Hexadecimal: string): string;
function Hex2Dec(const S: string): Longint;
function Hex2Dec64(const S: string): int64;
Function Hex2DecStr(S:String):String;
function Hex2ViewData(St: String):String;
function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,MSecs: Integer): TDateTime;
function IntToBin(Value: Longint; Digits:Integer): string;
function IsDate(aDate:string):Boolean;
function Isdigit(st: string):Boolean;
function IsIPTypeCheck(ip: string): Boolean;
Function MakeDatetimeStr(aTime: String;aTimeForamt:Boolean=True):String;
Function MakeTimeStr(aTime: String):String;
function MyF_UsingWinNT: Boolean;
Function MyProcessMessage:Boolean;
Function MyRunDosCommand(Command : string;  nShow : Boolean = False; bWait:Boolean = True):Boolean;
function ResetLana(LanaNum, ReqSessions, ReqNames: Byte;LanaRes: TNBLanaResources): Byte;
Function StringToBin(aData:string):string;
function ToHexStrNoSpace(st:string):String;

implementation
function SendARP(Destip,scrip:DWORD;pmacaddr:PDWORD;VAR phyAddrlen:DWORD):DWORD; stdcall; external 'iphlpapi.dll';


procedure LogSave(aFileName,ast:string);
Var
  f: TextFile;
  st: string;
  stDir : string;
begin
  {$I-}
  stDir := ExtractFilePath(aFileName);
  if not DirectoryExists(stDir) then CreateDir(stDir);

  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('yyyy-mm-dd hh:nn:ss:zzz">"',Now) + ' ' + ast;
  WriteLn(f,st);
  System.Close(f);
  {$I+}
end;

function ApplicationBuildInfo: String;
var
  V1, V2, V3, V4: Word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' +
            IntToStr(V2) + '.' +
            IntToStr(V3) + '.' +
            IntToStr(V4);
end;


Function BinToHexStr(aData:string):string;
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

Function BinToInt(Value : String) : Integer;
var
  i   : Integer;
begin
  Result := 0;
  for i := 1 to Length(Value) do
  begin
    Result := Result shl 1;
    Result := Result + Integer((Value[i] = '1'));
  end;
end;


//인증키값을 비교하자
Function CompareKey(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
//  MACAddress: PMACAddress;
//  RetCode: Byte;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  stMac := UpperCase(GetMacAddress);
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

  if stKey = aKey then Result := True;
end;

Function CompareKey2(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  stMac := UpperCase(GetMacFromIP(GetLocalIPAddr));
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

  if stKey = aKey then Result := True;
end;

Function CompareKey3(aSaupId,aKey:string):Boolean;
var
  nSaupID : integer;
  stMac : string;
  nMac : integer;
  stTemp :string;
  i : integer;
  stKey : string;
  MACAddress: PMACAddress;
  RetCode: Byte;
begin
  result := False;
  nSaupId := 0;
  for i:=1 to Length(aSaupId) do
  begin
    nSaupId := nSaupId + Ord(aSaupId[i]);
  end;
  RetCode := ResetLana(0, 0, 0, lrAlloc);

  New(MACAddress);
  try
    RetCode := GetMACAddressXe2(0, MACAddress);
    if RetCode = NRC_GOODRET then
    begin
      stMac := Format('%2.2x%2.2x%2.2x%2.2x%2.2x%2.2x',
        [MACAddress[0], MACAddress[1], MACAddress[2],
         MACAddress[3], MACAddress[4], MACAddress[5]]);
    end else
    begin
      stMac := '';
    end;
  finally
    Dispose(MACAddress);
  end;


  //stMac := UpperCase(GetMacFromIP(GetLocalIPAddr));
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

  if stKey = aKey then Result := True;
end;

Function CompareOffLineKey(aSaupId,aKey,aGubun:string):Boolean;
var
  stMac : string;
  stTemp :string;
  stKey : string;

  stExeFolder : string;
  ini_fun : TiniFile;
  stOffLine : string;
  stKeyID : string;
  stKeyPassword : string;
  nSaupID : integer;
  nMac : integer;
  i : integer;
begin
  result := False;
  stExeFolder := ExtractFileDir(Application.ExeName);
  Try
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini');
    stOffLine := ini_fun.ReadString('KEY','OFFLINE' + aGubun,'FALSE');
    if UpperCase(stOffLine) <> 'TRUE' then Exit; //오프라인 인증이 아니면 인증 실패
    stKeyID := ini_fun.ReadString('Key','ID','');
    stKeyPassword := ini_fun.ReadString('Key','Password','11');
    if stKeyID <> aSaupId then Exit;
    nSaupId := 0;
    for i:=1 to Length(aSaupId) do
    begin
      nSaupId := nSaupId + Ord(aSaupId[i]);
    end;
    nMac := 0;
    for i:=1 to Length(stKeyPassword) do
    begin
      nMac := nMac + Ord(stKeyPassword[i]);
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
    if stKey = aKey then Result := True;
  Finally
    ini_fun.Free;
  End;
end;

function Dec2Hex(N: int64; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function DecodeCardNo(aCardNo: string;aLength : integer = 8;bHex:Boolean = False): String;
var
  I: Integer;
  st: string;
  bCardNo: int64;
begin

  for I := 1 to aLength do
  begin

    if (I mod 2) <> 0 then
    begin
      aCardNo[I] := Char((Ord(aCardNo[I]) shl 4));
    end else
    begin
      aCardNo[I] := Char(Ord(aCardNo[I]) - $30); //상위니블을 0으로 만든다.
      //st:= st + char(ord(aCardNo[I-1]) +ord(aCardNo[I]));
      st:= st + char(ord(aCardNo[I-1]) + ord(aCardNo[I]))
    end;
    //aCardNo[I] := Char(Ord(aCardNo[I]) - $30);
    //st := st + aCardNo[I];
  end;


  st:= tohexstrNospace(st);


  if Not bHex then  //숫자 변환이면
  begin
    bCardNo:= Hex2Dec64(st);
    st:= FillZeroNumber(bCardNo,10);
  end;
  //SHowMessage(st);
  Result:= st;

end;

function Delay(MSecs: Longint):Boolean;
var
  Tick: DWORD;
  Event: THandle;
begin
  result := False;
  Event := CreateEvent(nil, False, False, nil);
  try
    Tick := GetTickCount + DWORD(MSecs);
    while (MSecs > 0) and
      (MsgWaitForMultipleObjects(1, Event, False, MSecs,
      QS_ALLINPUT) <> WAIT_TIMEOUT) do
    begin
      sleep(1);
      MyProcessMessage;
      Try
      //Application.ProcessMessages;
        MSecs := Tick - GetTickCount;
      Except
        Exit;
      End;
    end;
  finally
    CloseHandle(Event);
  end;
  result := True;
end;

function ExecFileAndWait(const aCmdLine: String; Hidden, doWait: Boolean): Boolean;
var
StartupInfo : TStartupInfo;
ProcessInfo : TProcessInformation;
begin
{setup the startup information for the application }
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  with StartupInfo do
  begin
    cb:= SizeOf(TStartupInfo);
    dwFlags:= STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
    if Hidden
    then wShowWindow:= SW_HIDE
    else wShowWindow:= SW_SHOWNORMAL;
  end;

  Result := CreateProcess(nil,PChar(aCmdLine), nil, nil, False,
  NORMAL_PRIORITY_CLASS, nil, nil, StartupInfo, ProcessInfo);
  if doWait then
  if Result then
  begin
  WaitForInputIdle(ProcessInfo.hProcess, INFINITE);
  WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
  end;
end;

Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
Var
  a, b : Integer;
  st   : String;
begin
  a := 0;
  b := 1;
  st := '';
  if (Length(SourceStr) < 1) then begin result:= ''; exit;  end;
  for b:=1 to Length(SourceStr) do
  begin
    if a = index then break;
    if SourceStr[b] = aChar then Inc(a);
  end;
  if (a = Index) then
  begin
    while (b <= Length(SourceStr)) and (SourceStr[b] <> aChar) do
    begin
      st := st + SourceStr[b];
      Inc(b);
    end;
  end;
  Result := st;
end;


function FillCharString(aNo:String;aChar:char; aLength:Integer;bFront:Boolean = False): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+ aChar;
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillCharString := st;
  end else FillCharString := copy(Strno,1,aLength);
end;


function FillZeroNumber(aNo:Int64; aLength:Integer): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= InttoStr(aNo);
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    St:= St + StrNo;
    FillZeroNumber:= st;
  end else FillZeroNumber:= copy(Strno,1,aLength);
end;

function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;
var
  I       : Integer;
  st      : string;
  strNo   : String;
  StrCount: Integer;
begin
  Strno:= aNo;
  StrCount:= Length(Strno);
  St:= '';
  StrCount:=  aLength - StrCount;
  if StrCount > 0 then
  begin
    st:='';
    for I:=1 to StrCount do St:=st+'0';
    if bFront then  St:= St + StrNo
    else St:= StrNo + St;

    FillZeroStrNum:= st;
  end else FillZeroStrNum:= copy(Strno,1,aLength);
end;


//인증키를 가져오자
Function GetAuthKey(aGubun:string;aSeq:integer=0) : string;
var
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  stExeFolder := ExtractFileDir(Application.ExeName);
  if aSeq = 0 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini')
  else if aSeq = 1 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key1.ini');
  result := ini_fun.ReadString('사업자정보','인증키' + aGubun,'');
  ini_fun.Free;
end;

Function GetBuildInfo(var V1, V2, V3, V4: Word):Boolean;
var
   VerInfoSize,
   VerValueSize,
   Dummy       : DWORD;
   VerInfo	   : Pointer;
   VerValue	   : PVSFixedFileInfo;
begin
	 VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
	 GetMem(VerInfo, VerInfoSize);
	 GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo);
	 VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
	 With VerValue^ do
	 begin
	 	V1 := dwFileVersionMS shr 16;
		V2 := dwFileVersionMS and $FFFF;
		V3 := dwFileVersionLS shr 16;
		V4 := dwFileVersionLS and $FFFF;
	end;
	FreeMem(VerInfo, VerInfoSize);
end;

//고객사 ID를 가져오자
Function GetCustomerId(aGubun:string;aSeq:integer=0) : string;
var
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  stExeFolder := ExtractFileDir(Application.ExeName);
  if aSeq = 0 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini')
  else if aSeq = 1 then
    ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key1.ini');
  result := ini_fun.ReadString('사업자정보','사업자등록번호' + aGubun,'');
  ini_fun.Free;
end;


function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
         aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //고정길이 사용하지 않으면 원 카드데이터 리턴
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//뒤에 채움문자 채우는 경우
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);
end;


function GetLocalIPAddr : string;
var
  wData: WSADATA;
  HostName: String;
  pHostInfo: pHostEnt;
begin
  WSAStartup(MAKEWORD(2, 2), wData);
  GetHostName(PAnsiChar(HostName), 512);
  pHostInfo := GetHostByName(PAnsiChar(HostName));
  if Assigned(pHostInfo) then
    Result := IntToStr(ord(pHostInfo.h_addr_list^[0]))
            + '.' + IntToStr(ord(pHostInfo.h_addr_list^[1])) + '.'
            + IntToStr(ord(pHostInfo.h_addr_list^[2])) + '.'
            + IntToStr(ord(pHostInfo.h_addr_list^[3]))
  else    Result := '';   WSACleanup;
end;

(* type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
 var
   phe : PHostEnt;
   pptr : PaPInAddr;
   Buffer : array [0..63] of char;
   I : Integer;
   GInitData : TWSADATA;
   stHostName : string;
begin
 try
   WSAStartup($101, GInitData);
   Result := '';
   GetHostName(Buffer, SizeOf(Buffer));
   phe := GetHostByName(buffer);
   if phe = nil then Exit;
   pptr := PaPInAddr(Phe^.h_addr_list);
   i := 0;
   result := '';
   while pptr^[I] <> nil do
   begin
     result:= result + StrPas(inet_ntoa(pptr^[I]^)) + ' ';
     Inc(I);
   end;
 finally WSACleanup; end;
end;  *)

function GetMACAddress:String;
var
  UuidCreateFunc : function (var guid: TGUID):HResult;stdcall;
  handle : THandle;
  g:TGUID;
  WinVer:_OSVersionInfoA;
  i:integer;
begin
  WinVer.dwOSVersionInfoSize := sizeof(WinVer);
  getversionexA(WinVer);

  handle := LoadLibrary('RPCRT4.DLL');
  if WinVer.dwMajorVersion >= 5 then {Windows 2000 }
    @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreateSequential')
  else
    @UuidCreateFunc := GetProcAddress(Handle, 'UuidCreate') ;

  UuidCreateFunc(g);
  result:='';
  for i:=2 to 7 do
    result:=result+IntToHex(g.d4[i],2);
end;

function GetMACAddressXe2(LanaNum: Byte; MACAddress: PMACAddress): Byte;
var
  AdapterStatus: PAdapterStatus;
  StatNCB: PNCB;
begin
  New(StatNCB);
  ZeroMemory(StatNCB, SizeOf(TNCB));
  StatNCB.ncb_length := SizeOf(TAdapterStatus) +  255 * SizeOf(TNameBuffer);
  GetMem(AdapterStatus, StatNCB.ncb_length);
  try
    with StatNCB^ do
    begin
      ZeroMemory(MACAddress, SizeOf(TMACAddress));
      ncb_buffer := PAnsiChar(AdapterStatus);
      ncb_callname := '*              ' + #0;
      ncb_lana_num := AnsiChar(LanaNum);
      ncb_command  := AnsiChar(NCBASTAT);
      NetBios(StatNCB);
      Result := Byte(ncb_cmd_cplt);
      if Result = NRC_GOODRET then
        MoveMemory(MACAddress, AdapterStatus, SizeOf(TMACAddress));
    end;
  finally
    FreeMem(AdapterStatus);
    Dispose(StatNCB);
  end;
end;

function GetMacFromIP(IP:string):string;
type
  Tinfo = array[0..7] of byte;
var
  dwTargetIP:dword;
  dwMacAddress:array[0..1] of DWORD;
  dwMacLen : DWORD;
  dwResult : DWORD;
  X:Tinfo;
  stemp:string;
  iloop:integer;
begin
  dwTargetIP := Inet_Addr(PAnsiChar(ip));
  dwMacLen := 6;
  dwResult := SendARP(dwtargetip,0,@dwmacaddress[0],dwMaclen);
  if dwResult = NO_ERROR then
  begin
    x:= tinfo(dwMacAddress);
    for iloop :=0 to 5 do
    begin
      stemp := stemp + inttohex(x[iloop],2);
    end;
    result := stemp;
  end;
end;

function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
var
    Node: TTreeNode;
begin

  Result := nil;
  if ATree.Items.Count = 0 then Exit;
  Node := ATree.Items[0];
  while Node <> nil do
  begin
    if UpperCase(Node.Text) = UpperCase(AValue) then
    begin
      Result := Node;
      if AVisible then
        Result.MakeVisible;
      Break;
    end;
    Node := Node.GetNext;
  end;
end;

Function GetOffLineAuthState(aGubun:string) : Boolean;
var
  stExeFolder : string;
  ini_fun : TiniFile;
begin
  result := False;
  stExeFolder := ExtractFileDir(Application.ExeName);
  ini_fun := TiniFile.Create(stExeFolder + '\' + 'Key.ini');
  Try
    if UpperCase(ini_fun.ReadString('KEY','OFFLINE'+aGubun,'FALSE')) = 'TRUE' then result := True;
  Finally
    ini_fun.Free;
  End;
end;

Procedure GridInitialize(sg_Grid:TAdvStringGrid;aRow:integer = 2;bCheckBox:Boolean=False);
var
  i:integer;
begin
  with sg_Grid do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    rowCount := aRow;
    for i:=0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;

end;


function Hex2Ascii(St: String;bConvert:Boolean=False;aConvertDec:integer=30): String;
var
  st2: string;
  I: Integer;
  aLength: Integer;
  aa: Integer;
begin
  st2:= '';
  for I:= 1 to Length(st) do
  begin
    if st[i] <> #$20 then st2:= st2 + st[I];
  end;
  if Length(st2) MOD 2 <> 0 then
  begin
    aLength:= Length(st2);
    st:= copy(st2,1,aLength-1) + '0'+ st2[aLength];
  end else
  begin
   st:= st2;
  end;

  st2:= '';
  while st <> '' do
  begin
    aa:= Hex2Dec(copy(st,1,2));
    if bConvert then
    begin
      if aa = 0 then aa := aConvertDec;
    end;
    st2:= st2 + Char(aa);
    delete(st,1,2);
  end;
  Hex2Ascii:= st2;
end;

function Hex2Binary(Hexadecimal: string): string;
const
  BCD: array [0..15] of string =
    ('0000', '0001', '0010', '0011', '0100', '0101', '0110', '0111',
    '1000', '1001', '1010', '1011', '1100', '1101', '1110', '1111');
var
  i: integer;
begin
  result := '';
  Try
    for i := Length(Hexadecimal) downto 1 do
      Result := BCD[StrToInt('$' + Hexadecimal[i])] + Result;
  Except
    Exit;
  End;
end;

function Hex2Dec(const S: string): Longint;
var
  HexStr: string;
begin
  result := -1;
  Try
    if Pos('$', S) = 0 then HexStr := '$' + S
    else HexStr := S;
    Result := StrToIntDef(HexStr, 0);
  Except
    Exit;
  End;
end;

function Hex2Dec64(const S: string): int64;
var
  HexStr: string;
begin
  result := -1;
  Try
    if Pos('$', S) = 0 then HexStr := '$' + S
    else HexStr := S;
    Result := StrToInt64Def(HexStr, 0);
  Except
    Exit;
  End;
end;

Function Hex2DecStr(S:String):String;
var
  i: longint;
  L: int64;
begin
  Result := '';
  if Length(s) = 0 then Exit;
  L:=0;
  for i := 1 to length(S) do L:=L*16 + pos(S[i],HexString)-1;
  Result:=intToStr(L);
end;


function Hex2ViewData(St: String):String;
var
  st2: string;
  I: Integer;
  aLength: Integer;
  aa: Integer;
begin
  st2:= '';
  for I:= 1 to Length(st) do
  begin
    if st[i] <> #$20 then st2:= st2 + st[I];
  end;
  if Length(st2) MOD 2 <> 0 then
  begin
    aLength:= Length(st2);
    st:= copy(st2,1,aLength-1) + '0'+ st2[aLength];
  end else
  begin
   st:= st2;
  end;

  st2:= '';
  while st <> '' do
  begin
    if pos(st[1],'34567') = 0 then st2 := st2+'['+copy(st,1,2) + ']'
    else
    begin
      aa:= Hex2Dec(copy(st,1,2));
      st2:= st2 + Char(aa);
    end;
    delete(st,1,2);
  end;
  result := st2;
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then Result := Result + 1;
end;


function IntToBin(Value: Longint; Digits:Integer): string;
begin
  Result := '';
  Try
    if Digits > 32 then Digits := 32;
    while Digits > 0 do begin
      Dec(Digits);
      Result := Result + IntToStr((Value shr Digits) and 1);
    end;
  Except
    Exit;
  End;
end;

function IsDate(aDate:string):Boolean;
var
  dtTime : TDateTime;
  stDate : string;
begin
  stDate := aDate;
  stDate := stringReplace(stDate,'-','',[rfReplaceAll]);
  stDate := stringReplace(stDate,':','',[rfReplaceAll]);
  stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
  result := False;
  Try
    dtTime := strtoDate(stDate);
  Except
    Exit;
  End;
  result := True;
end;

function Isdigit(st: string):Boolean;
var
  I: Integer;
begin
  result:=True;
  if Length(st) < 1 then
  begin
    result:=False;
    Exit;
  end;
  for I:=1 to Length(st) do
    if (st[I]< '0') or (st[I] > '9')  then result:=False
end;

function IsIPTypeCheck(ip: string): Boolean;
var
   z, i: byte;
   st: array[1..3] of byte;
const
   ziff = ['0'..'9'];
begin
   st[1]  := 0;
   st[2]  := 0;
   st[3]  := 0;
   z      := 0;
   Result := False;
   for i := 1 to Length(ip) do
   if ip[i] in ziff then
   else
   begin
     if ip[i] = '.' then
     begin
       Inc(z);
       if z < 4 then st[z] := i
       else
       begin
         Exit;
       end;
     end
     else
     begin
       Exit;
     end;
   end;
   if (z <> 3) or (st[1] < 2) or (st[3] = Length(ip)) or (st[1] + 2 > st[2]) or
     (st[2] + 2 > st[3]) or (st[1] > 4) or (st[2] > st[1] + 4) or (st[3] > st[2] + 4) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, 1, st[1] - 1));
   if (z > 255) or (ip[1] = '0') then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[1] + 1, st[2] - st[1] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[1] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[2] + 1, st[3] - st[2] - 1));
   if (z > 255) or ((z <> 0) and (ip[st[2] + 1] = '0')) then
   begin
     Exit;
   end;
   z := StrToInt(Copy(ip, st[3] + 1, Length(ip) - st[3]));
   if (z > 255) or ((z <> 0) and (ip[st[3] + 1] = '0')) then
   begin
     Exit;
   end;
   result := True;
end;

Function MakeDatetimeStr(aTime: String;aTimeForamt:Boolean=True):String;
var
  stResult : string;
begin
  if Length(aTime) < 8 then stResult := aTime
  else
  begin
    stResult:= Copy(aTime,1,4)+'-'+Copy(aTime,5,2)+'-'+Copy(aTime,7,2) ;
    if aTimeForamt then
    begin
      if Length(aTime) = 14 then
         stResult:= stResult + ' ' + Copy(aTime,9,2)+':'+Copy(aTime,11,2)+':'+Copy(aTime,13,2);
    end;
  end;
  Result := stResult;
end;

Function MakeTimeStr(aTime: String):String;
var
  stResult : string;
begin
  if Length(aTime) < 6 then stResult := aTime
  else
  begin
    stResult:= Copy(aTime,1,2)+':'+Copy(aTime,3,2)+':'+Copy(aTime,5,2);
  end;
  Result := stResult;
end;

function MyF_UsingWinNT: Boolean;
var
  OS: TOSVersionInfo;
begin
  OS.dwOSVersionInfoSize := Sizeof(OS);
  GetVersionEx(OS);
  if OS.dwPlatformId = VER_PLATFORM_WIN32_NT then Result:= True
  else Result:= False;
end;

Function MyProcessMessage:Boolean;
var
  Msg: TMsg;
begin
  if PeekMessage(Msg, 0, 0, 0, PM_REMOVE) then
  begin
    if Msg.Message = WM_QUIT then
    begin
      PostQuitMessage(0);
    end else
    begin
      TranslateMessage(Msg);
      DispatchMessage(Msg);
    end;
  end;
end;

Function MyRunDosCommand(Command : string;  nShow : Boolean = False; bWait:Boolean = True):Boolean;
var
  hReadPipe : THandle;
  hWritePipe : THandle;
  SI : TStartUpInfo;
  PI : TProcessInformation;
  SA : TSecurityAttributes;
  SD : TSecurityDescriptor;
  BytesRead : DWORD;
  Dest : array[0..1023] of char;
  CmdLine : array[0..512] of char;
  TmpList : TStringList;
  S, Param : string;
  Avail, ExitCode, wrResult : DWORD;
begin
  if MyF_UsingWinNT then begin
    InitializeSecurityDescriptor(@SD, SECURITY_DESCRIPTOR_REVISION);
    SetSecurityDescriptorDacl(@SD, True, nil, False);
    SA.nLength := SizeOf(SA);
    SA.lpSecurityDescriptor := @SD;
    SA.bInheritHandle := True;
    Createpipe(hReadPipe, hWritePipe, @SA, 1024);
  end else begin
    Createpipe(hReadPipe, hWritePipe, nil, 1024);
  end;
  try
     //Screen.Cursor := crHourglass;
     FillChar(SI, SizeOf(SI), 0);
     SI.cb := SizeOf(TStartUpInfo);
     if nShow then begin
       SI.wShowWindow := SW_SHOWNORMAL
     end else begin
       SI.wShowWindow := SW_HIDE;
     end;
     SI.dwFlags := STARTF_USESHOWWINDOW;
     SI.dwFlags := SI.dwFlags or STARTF_USESTDHANDLES;
     SI.hStdOutput := hWritePipe;
     SI.hStdError := hWritePipe;
     StrPCopy(CmdLine, Command);
     //if CreateProcess(nil,CmdLine , nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, SI, PI) then begin
     if CreateProcess(nil,pchar(Command) , nil, nil, True,  DETACHED_PROCESS, nil, nil, SI, PI) then begin
       if bWait then
       begin
         ExitCode := 0;
         while ExitCode = 0 do begin
           wrResult := WaitForSingleObject(PI.hProcess, 50);
           if PeekNamedPipe(hReadPipe, nil, 0, nil, @Avail, nil) then begin
             if Avail > 0 then begin
               TmpList := TStringList.Create;
               try
                 FillChar(Dest, SizeOf(Dest), 0);
                 ReadFile(hReadPipe, Dest, Avail, BytesRead, nil);
               finally
                 TmpList.Free;
               end;
             end;
           end;
           if wrResult <> WAIT_TIMEOUT then begin
             ExitCode := 1;
           end;
           Application.ProcessMessages;
         end;
         GetExitCodeProcess(PI.hProcess, ExitCode);
         CloseHandle(PI.hProcess);
         CloseHandle(PI.hThread);
       end;
     end;
  finally
     CloseHandle(hReadPipe);
     CloseHandle(hWritePipe);
  end;
  result := True;
end;

function ResetLana(LanaNum, ReqSessions, ReqNames: Byte;
  LanaRes: TNBLanaResources): Byte;
var
  ResetNCB: PNCB;
begin
  New(ResetNCB);
  ZeroMemory(ResetNCB, SizeOf(TNCB));
  try
    with ResetNCB^ do
    begin
      ncb_lana_num := Ansichar(LanaNum);        // Set Lana_Num
      ncb_lsn := Ansichar(LanaRes);             // Allocation of new resources
      ncb_callname[0] := Ansichar(ReqSessions); // Query of max sessions
      ncb_callname[1] := #0;                // Query of max NCBs (default)
      ncb_callname[2] := Ansichar(ReqNames);    // Query of max names
      ncb_callname[3] := #0;                // Query of use NAME_NUMBER_1
      ncb_command  := Ansichar(NCBRESET);
      NetBios(ResetNCB);
      Result := Byte(ncb_cmd_cplt);
    end;
  finally
    Dispose(ResetNCB);
  end;
end;

Function StringToBin(aData:string):string;
var
  i:integer;
  stTemp : string;
begin
  result := '';
  Try
    stTemp := '';
    for i:=1 to Length(aData) do
    begin
      stTemp := stTemp + IntToBin(strtoint(aData[i]),4);
    end;
    result := stTemp;
  Except
    Exit;
  End;
end;

function ToHexStrNoSpace(st:string):String;
var
  I : Integer;
  st2: string;
  st3: string[3];
begin
  for I:= 1 to length(st) do
  begin
    st3:= Dec2Hex(ord(st[I]),1);
    if Length(st3) < 2 then st3:= '0'+ st3;
    st2:=st2 +st3;
  end;
  ToHexStrnospace:= st2;
end;

end.
