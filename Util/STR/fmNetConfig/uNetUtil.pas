unit uNetUtil;


interface

uses
  SysUtils, Classes,Windows,Forms,
  ComCtrls,
  uNetCheckValiable,
  uLomosUtil,
  uNetCommon;

  procedure Delay(MSecs: Longint);
  function ResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
  function PortResponseCheck(aIndex,aDelay:integer):Boolean;
  function GetNodeByText(ATree : TTreeView; AValue:String; AVisible: Boolean): TTreeNode;
  function CheckIPType(aIP:string;aZeroType:Boolean):Boolean;

implementation

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

end.
