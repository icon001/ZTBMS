unit uDeviceFunction;

interface

uses
  SysUtils, Classes;

type
  TdmDeviceFunction = class(TDataModule)
  private
    { Private declarations }
    procedure ClearBitB(var b:byte; BitToClear: integer);
    Function DataConvert1(aMakeValue:Byte;aData:String):String;
    Function DataConvert2(aMakeValue:Byte;aData:String):String;
    function MakeSum(st:string;nCSType:integer=0):Char;
  public
    { Public declarations }
    function EncodeData(aKey:Byte; aData: String): String; export;
    function GetFixedCardNoCheck(aCardNo:string;bCardFixedUse:Boolean;
             aCardFixedFillChar:string;nCardFixedPosition,nCardFixedLength:integer):string;
    Function MakeCSData(aData: string;nCSType:integer=0):String;
    function PacketCreate(aProgramType:integer;aLen,aVer,aDeviceID,aCmd,aData,aMsgNo:string):string;
  end;

var
  dmDeviceFunction: TdmDeviceFunction;

implementation
uses
  uLomosUtil;

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

{ TDataModule1 }

procedure TdmDeviceFunction.ClearBitB(var b: byte; BitToClear: integer);
begin
  if (BitToClear < 0) or (BitToClear > 7) then exit;
  b := b and not (1 shl BitToClear);
end;

{난수 번호만(BIT4,BIT3,BIT2,BIT1,BIT0) 을 data와 XOR 한다.}
function TdmDeviceFunction.DataConvert1(aMakeValue: Byte;
  aData: String): String;
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
function TdmDeviceFunction.DataConvert2(aMakeValue: Byte;
  aData: String): String;
var
  I: Integer;
  bMakeValue: Byte;
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

function TdmDeviceFunction.EncodeData(aKey: Byte; aData: String): String;
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

function TdmDeviceFunction.GetFixedCardNoCheck(aCardNo: string;
  bCardFixedUse: Boolean; aCardFixedFillChar: string; nCardFixedPosition,
  nCardFixedLength: integer): string;
var
  bFront : Boolean;
begin
  result := aCardNo;
  if Not bCardFixedUse then Exit; //고정길이 사용하지 않으면 원 카드데이터 리턴
  bFront := True;
  if nCardFixedPosition <> 0 then bFront := False;//뒤에 채움문자 채우는 경우
  result := FillCharString(aCardNo,aCardFixedFillChar[1],nCardFixedLength,bFront);

end;


function TdmDeviceFunction.MakeCSData(aData: string; nCSType: integer): String;
var
  aSum: Integer;
  st: string;
begin
  aSum:= Ord(MakeSum(aData,nCSType));
  aSum:= aSum*(-1);
  st:= Dec2Hex(aSum,2);

  Result:= copy(st,Length(st)-1,2);
end;

function TdmDeviceFunction.MakeSum(st: string; nCSType: integer): Char;
var
  i: Integer;
  aBcc: Byte;
  BCC: string;
begin
  aBcc := Ord(st[1]);
  for i := 2 to Length(st) do
  begin
    aBcc := aBcc + Ord(st[i]);
  end;
  if nCSType = 1 then
  begin
    aBcc := aBcc + Ord(#$A7);
  end;
  BCC := Chr(aBcc);
  Result := BCC[1];
end;

function TdmDeviceFunction.PacketCreate(aProgramType: integer; aLen, aVer,
  aDeviceID, aCmd, aData, aMsgNo: string): string;
var
  stPacket : string;
  nKey : integer;
begin
  stPacket := STX + aLen + #$20 + aVer + aDeviceID + aCmd + aMsgNo + aData;
  stPacket  := stPacket + MakeCSData(stPacket + ETX,aProgramType) + ETX;
  nKey    := $20;
  result := Copy(stPacket, 1, 5) + EncodeData(nKey,
    Copy(stPacket, 6, Length(stPacket) - 6)) + ETX;
end;

end.
