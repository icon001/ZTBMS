{*******************************************************}
{                                                       }
{         화일명: uLomosUtil.pas                        }
{         설  명: 유틸리티                              }
{         작성일:                                       }
{         작성자: 전진운                                }
{         Copyright                                     }
{                                                       }
{*******************************************************}
//OpenPictureDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
unit uLomosUtil;

interface
uses
  shellapi,
  ComCtrls,
  winsock,
  Windows,SysUtils,Controls, Classes, Graphics, Forms, DB,DBGrids;

const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  TAB = #$09;
  HexString : String = '0123456789ABCDEF';

type CString = string[100];

  function Dec2Hex(N: LongInt; A: Byte): string;
  function Dec2Hex64(N: int64; A: Byte): string;
  procedure SetBitB(var b:byte; BittoSet: integer);
  procedure ClearBitB(var b:byte; BitToClear: integer);
  function IsBitSetB(const b:byte; BitToCheck:integer):Boolean;
  Function MakeCSData(aData: string):String;
  function MakeSum(st:string):Char;
  Function DataConvert1(aMakeValue:Byte;aData:String):String;
  Function DataConvert2(aMakeValue:Byte;aData:String):String;
  function EncodeData(aKey:Byte; aData: String): String;
  function ToHexStr(st:string):String;
  function ToHexStrNoSpace(st:string):String;
  function Hex2Ascii(St: String): String;
  Function Hex2DecStr(S:String):String;
  function Hex2Dec(const S: string): Longint;
  function Hex2Dec64(const S: string): int64;
  function Isdigit(st: string):Boolean;
  function BinToInt(Value : String) : Integer;
  function Setlength(st : String; aLength : Integer): String;
  function FillZeroStrNum(aNo:String; aLength:Integer): string;
  function FillZeroNumber(aNo:LongInt; aLength:Integer): string;
  function FillZeroNumber2(aNo:Int64; aLength:Integer): string;
  function IntToBin(Value: Longint; Digits:Integer): string;
  Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String;
  procedure ErrorLogSave(aError:String;ast:string);
  Function MakeDatetimeStr(aTime: String):String;
  function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
    MSecs: Integer): TDateTime;
  function DecTime(ATime: TDateTime; Hours, Minutes, Seconds,
    MSecs: Integer): TDateTime;
  procedure LogSave(aFileName,ast:string);
  Function DeleteChar(st : String; DelChar : Char) : String;
  procedure Delay(MSecs: Longint);
  procedure GridtoFile(adbGrid: TDBGrid; aFileName: string);
  function DelChars(const S: string; Chr: Char): string;
  function ActivateScreenSaver( Activate : Boolean ) : Boolean;
  function DecodeCardNo(aCardNo: string): String;
  function EncodeCardNo(aCardNo: string): String;
  function Get_Local_IPAddr : string;
  function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
  procedure Snooze(ms: Cardinal);
  Procedure ShellExecute_AndWait(FileName:String;Params:String);

Implementation


Procedure ShellExecute_AndWait(FileName:String;Params:String);
var
  exInfo : TShellExecuteInfo;
  Ph     : DWORD;
  errmsg  : String;
begin
 FillChar( exInfo, Sizeof(exInfo), 0 );
 with exInfo do
 begin
   cbSize:= Sizeof( exInfo );
   fMask := SEE_MASK_NOCLOSEPROCESS or SEE_MASK_FLAG_DDEWAIT;
   Wnd := GetActiveWindow();
   ExInfo.lpVerb := 'open';
   ExInfo.lpParameters := PChar(Params);
   lpFile:= PChar(FileName);
   nShow := SW_SHOWNORMAL;
 end;
 if ShellExecuteEx(@exInfo) then
 begin
   Ph := exInfo.HProcess;
 end
 else
 begin
   errmsg:= SysErrorMessage(GetLastError);
   Application.MessageBox (PChar(errmsg),PChar('error'),MB_ICONSTOP or MB_OK);
   exit;
 end;

 while WaitForSingleObject(ExInfo.hProcess, 50) <> WAIT_OBJECT_0 do
 Application.ProcessMessages;
 CloseHandle(Ph);
end;

procedure Snooze(ms: Cardinal);
var
  Stop: Cardinal;
begin
  SetTimer(Application.Handle, 1235, ms, nil);
  Stop := GetTickCount + ms;
  repeat
    Application.HandleMessage;
  until Application.Terminated or (Integer(GetTickCount - Stop) >= 0);
  KillTimer(Application.Handle, 1235);
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

function DecodeCardNo(aCardNo: string): String;
var
  I: Integer;
  st: string;
  bCardNo: int64;
begin

  for I := 1 to 8 do
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
  bCardNo:= Hex2Dec64(st);
  st:= FillZeroNumber2(bCardNo,10);
  //SHowMessage(st);
  Result:= st;

end;

function EncodeCardNo(aCardNo: string): String;
var
  I: Integer;
  xCardNo: String;
  st: String;
begin
  aCardNo:= Dec2Hex64(StrtoInt64(aCardNo),8);
  xCardNo:= Hex2Ascii(aCardNo);
  for I:= 1 to 4 do
  begin
    st := st + Char((Ord(xCardNo[I]) shr 4) + $30) + Char((Ord(xCardNo[I]) and $F) + $30);
  end;
  Result:= st;
end;

function ActivateScreenSaver( Activate : Boolean ) : Boolean;
var
  IntActive : Byte;
begin
  if Activate then
     IntActive := 1
  else
     IntActive := 0;

  Result := SystemParametersInfo( SPI_SETSCREENSAVEACTIVE, IntActive, nil, 0 );
end;


function DelChars(const S: string; Chr: Char): string;
var
  I: Integer;
begin
  Result := S;
  for I := Length(Result) downto 1 do begin
    if Result[I] = Chr then Delete(Result, I, 1);
  end;
end;

{DBGrid를 CSV화일로 저장}
procedure GridtoFile(adbGrid: TDBGrid; aFileName: string);
var
  I: Integer;
  st: string;
  st2:string;
  CurMark: TBookmark;
  CurColumn: Integer;
  aStringList: Tstringlist;
begin

  aStringList := TStringList.Create;
  aStringList.Clear;
  //그리드 내용 저장

  with aDBGrid.Columns do
  begin
    for CurColumn := 0 to Count - 1 do
    begin
      if (CurColumn > 0) then st := st + ', ';
      st := st + aDBGrid.Columns.Items[CurColumn].Title.Caption;
    end;
    aStringList.Add(st);
  end;
  //Title 저장
  with aDBGrid.DataSource.Dataset do
  begin
    DisableControls;
    CurMark := GetBookmark; {현재 레코드 포인터 저장}
    First;
    while not eof do
    begin
      st := '';
      for CurColumn := 0 to aDBGrid.Columns.Count - 1 do
      begin
        if (CurColumn > 0) then st := st + ', ';
        st2:=aDBGrid.Columns[CurColumn].Field.Text;
        st2:= DelChars(st2,',');
        st := st +st2 ; {필드값}
      end;
      aStringList.Add(st);
      Next;
    end;
    GotoBookmark(CurMark);
    EnableControls;
  end;

  aStringList.SaveToFile(aFileName);
  aStringList.Free;

end;

procedure Delay(MSecs: Longint);
var
  FirstTickCount, Now: Longint;
begin
  FirstTickCount := GetTickCount;
  repeat
    Application.ProcessMessages;
    { allowing access to other controls, etc. }
    Now := GetTickCount;
  until (Now - FirstTickCount >= MSecs) or (Now < FirstTickCount);
end;

Function DeleteChar(st : String; DelChar : Char) : String;
begin
  While POS(DelChar,st) <> 0 do
    st := Copy(st,1,POS(DelChar,st)-1) + Copy(st,POS(DelChar,st)+1,255);
  Result := st;
end;


procedure LogSave(aFileName,ast:string);
Var
  f: TextFile;
  st: string;
begin
  {$I-}
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('yyyy-mm-dd hh:nn:ss:zzz">"',Now) + ' ' + ast;
  WriteLn(f,st);
  System.Close(f);
  {$I+}
end;

Function MakeDatetimeStr(aTime: String):String;
begin
  MakeDatetimeStr:= Copy(aTime,1,4)+'-'+Copy(aTime,5,2)+'-'+Copy(aTime,7,2) +' '+
                    Copy(aTime,9,2)+':'+Copy(aTime,11,2)+':'+Copy(aTime,13,2);
end;

procedure ErrorLogSave(aError:String;ast:string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin
  {$I-}
  aFileName:= 'c:\ktams\log\log'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"',Now) + '['+aError+']' + ast;
  WriteLn(f,st);
  System.Close(f);
  {$I+}
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

function IntToBin(Value: Longint; Digits:Integer): string;
begin
  Result := '';
  if Digits > 32 then Digits := 32;
  while Digits > 0 do begin
    Dec(Digits);
    Result := Result + IntToStr((Value shr Digits) and 1);
  end;
end;

function FillZeroStrNum(aNo:String; aLength:Integer): string;
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
    St:= St + StrNo;
    FillZeroStrNum:= st;
  end else FillZeroStrNum:= copy(Strno,1,aLength);
end;

function FillZeroNumber(aNo:LongInt; aLength:Integer): string;
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

function FillZeroNumber2(aNo:INt64; aLength:Integer): string;
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
    FillZeroNumber2:= st;
  end else FillZeroNumber2:= copy(Strno,1,aLength);
end;






function Setlength(st : String; aLength : Integer) : String;
begin
  result := st;
  while Length(Result) < aLength do
    Result := Result + ' ';
  Result := Copy(Result,1,aLength);
end;

function BinToInt(Value : String) : Integer;
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


function Dec2Hex(N: LongInt; A: Byte): string;
begin
  Result := IntToHex(N, A);
end;

function Dec2Hex64(N: int64; A: Byte): string;
begin
    Result := IntToHex(N, A);
end;

Function Hex2DecStr(S:String):String;
var
  i: longint;
  L: int64;
begin
  L:=0;
  for i := 1 to length(S) do L:=L*16 + pos(S[i],HexString)-1;
  Result:=intToStr(L);
end;


procedure SetBitB(var b:byte; BittoSet: integer);
{ set a bit in a byte }
begin
  if (BittoSet < 0) or (BittoSet > 7) then exit;
  b:= b or ( 1 SHL BittoSet);
end;

procedure ClearBitB(var b:byte; BitToClear: integer);
{ clear a bit in a byte }
begin
  if (BitToClear < 0) or (BitToClear > 7) then exit;
  b := b and not (1 shl BitToClear);
end;

function IsBitSetB(const b:byte; BitToCheck:integer):Boolean;
{ Test bit in a byte }
begin
  Result := false;
  if (BitToCheck < 0) or (BitToCheck > 7) then exit;
  Result := (b and (1 shl BitToCheck)) <> 0;
end;

function MakeSum(st:string):Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := Ord(st[1]);
  for i := 2 to Length(st) do
    aBcc := aBcc + Ord(st[i]);
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

{CheckSum을 만든다}
Function MakeCSData(aData: string):String;
var
  aSum: Integer;
  I: Integer;
  st: string;
begin
  aSum:= Ord(MakeSum(aData));
  aSum:= aSum*(-1);
  st:= Dec2Hex(aSum,2);

  Result:= copy(st,Length(st)-1,2);
end;

{난수 번호만(BIT4,BIT3,BIT2,BIT1,BIT0) 을 data와 XOR 한다.}
Function DataConvert1(aMakeValue:Byte;aData:String):String;
var
  I: Integer;
  bData: String;
begin
  bData:= aData;
  for I:= 1 to Length(bData) do
  begin
    bData[I]:= Char(ord(bData[I]) XOR aMakeValue);
  end;
  Result:= bData;
end;

{ 난수 번호만(BIT4,BIT3,BIT2,BIT1,BIT0) 을 data와 XOR 후 Message No의 하위 Nibble과 다시 XOR 한다.}
Function DataConvert2(aMakeValue:Byte;aData:String):String;
var
  I: Integer;
  bMakeValue: Byte;
  st: string;
  bData: String;
  TempByte: Byte;
begin
  bData:= aData;
  {13번쩨 Byte 가 MessageNo}
  bMakeValue:= Ord(aData[13]) and $F;
  Result:= '';
  for I:= 1 to Length(bData) do
  begin
    if I <> 13 then
    begin
      TempByte:= ord(bData[I]) XOR aMakeValue;
      bData[I]:= Char(TempByte XOR bMakeValue);
    end;
  end;
  Result:= bData;
end;

function EncodeData(aKey:Byte; aData: String): String;
var
  Encodetype: Integer;
  aMakeValue: Byte;
  I: Integer;
begin
  EncodeType:= aKey SHR 6; //7,6 번 Bit가 엔코딩 타입
  aMakeValue:= aKey;
  for I:= 5 to 7 do ClearBitB(aMakeValue,I); //1,2,3,4,5 Bit가 난수번호

  case EncodeType of
    0: Result:= DataConvert1(aMakeValue,aData);
    1: Result:= DataConvert2(aMakeValue,aData);
    else Result:= aData;
  end;
end;

function ToHexStr(st:string):String;
var
  I : Integer;
  st2: string;
  st3: string[3];
begin
  for I:= 1 to length(st) do
  begin
    st3:= Dec2Hex(ord(st[I]),1);
    if Length(st3) < 2 then st3:= '0'+ st3;
    st2:=st2 +st3 +' ';
  end;
  ToHexStr:= st2;
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


function Hex2Ascii(St: String): String;
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
    st2:= st2 + Char(aa);
    delete(st,1,2);
  end;
  Hex2Ascii:= st2;
end;

function Hex2Dec(const S: string): Longint;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToIntDef(HexStr, 0);
end;

function Hex2Dec64(const S: string): int64;
var
  HexStr: string;
begin
  if Pos('$', S) = 0 then HexStr := '$' + S
  else HexStr := S;
  Result := StrToInt64Def(HexStr, 0);
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

function GetNibble(aValue: Byte; NibbleHi:Byte; NibbleLo:Byte):Boolean;
begin
  NibbleHi := aValue shr 4;
  NibbleLo := aValue and $F;
  Result:= True;
end;

function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
  MSecs: Integer): TDateTime;
begin
  Result := ATime + (Hours div 24) + (((Hours mod 24) * 3600000 +
    Minutes * 60000 + Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then Result := Result + 1;
end;

function DecTime(ATime: TDateTime; Hours, Minutes, Seconds,
  MSecs: Integer): TDateTime;
begin
  Result := ATime - (Hours div 24) - (((Hours mod 24) * 3600000 -
    Minutes * 60000 - Seconds * 1000 + MSecs) / MSecsPerDay);
  if Result < 0 then Result := Result + 1;
end;

function Get_Local_IPAddr : string;
 type
   TaPInAddr = array [0..10] of PInAddr;
   PaPInAddr = ^TaPInAddr;
 var
   phe : PHostEnt;
   pptr : PaPInAddr;
   Buffer : array [0..63] of char;
   I : Integer;
   GInitData : TWSADATA;
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
end;

end.
