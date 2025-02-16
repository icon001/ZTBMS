unit uUtil;


interface

uses
  SysUtils, Classes,Windows,Forms,
  ComCtrls,
  uCheckValiable,
  uCommon,
  uLomosUtil,
  WinSock;

  procedure Delay(MSecs: Longint);
  function ResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
  function PortResponseCheck(aIndex,aDelay:integer):Boolean;
  function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
  function CheckIPType(aIP:string;aZeroType:Boolean):Boolean;
  function SetSpacelength(st : String; aLength : Integer) : String;
  function Get_Local_IPAddr : string;
  function Ascii2Hex(aData:string;bReverse:Boolean = False):string;
  function MakeHexSum(aHex:string):Char;

implementation

function MakeHexSum(aHex:string):Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := 0;
  for i := 1 to (Length(aHex) div 2) do
  begin
    //aBcc := aBcc + Ord(Hex2Ascii(copy(aHex,(i * 2) - 1,2)));
    aBcc := aBcc + Hex2Dec(copy(aHex,(i * 2) - 1,2));
  end;
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

function Ascii2Hex(aData:string;bReverse:Boolean = False):string;
var
  i : integer;
  stHex : string;
  nLen : integer;
begin
  stHex := '';
  nLen := Length(aData);
  for i:= 1 to nLen do
  begin
    if Not bReverse then stHex := stHex + Dec2Hex(Ord(aData[i]),2)
    else stHex := Dec2Hex(Ord(aData[i]),2) + stHex;
  end;
  result := stHex;
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

function ResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not G_bDeviceResponse[aIndex] do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := G_bDeviceResponse[aIndex];
end;

function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not G_bCardReaderResponse[aIndex] do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := G_bCardReaderResponse[aIndex];
end;

function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not G_bCardReaderVersionResponse[aIndex] do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := G_bCardReaderVersionResponse[aIndex];
end;

function PortResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not G_bPortResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := G_bPortResponse[aIndex];
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

function CheckIPType(aIP:string;aZeroType:Boolean):Boolean;
var
  stTemp : string;
  i : integer;
  nSum : integer;
  nTemp : integer;
begin
  Result := False;
  nSum := 0;
  Try
    for i := 0 to 3 do
    begin
      stTemp  := FindCharCopy(aIP, i, '.');
      nTemp  := StrToInt(stTemp);
      if nTemp > 255 then Exit;
      nSum := nSum + nTemp;
    end;
  Except
    Exit;
  End;

  if Not aZeroType then //0.0.0.0 을 잘못된 타입으로 인식하는 경우
  begin
    if nSum = 0 then Exit;
  end;
  result := True;
end;

function SetSpacelength(st : String; aLength : Integer) : String;
begin
  result := st;
  while Length(Result) < aLength do
    Result := Result + ' ';
  Result := Copy(Result,1,aLength);
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
