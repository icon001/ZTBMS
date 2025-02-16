unit uDeviceSettingUtil;

interface
uses
  Windows,Forms,uDataModule1;

  function ResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderResponseCheck(aIndex,aDelay:integer):Boolean;
  function CardReaderVersionResponseCheck(aIndex,aDelay:integer):Boolean;
  function PortResponseCheck(aIndex,aDelay:integer):Boolean;


implementation
uses
  uDeviceSettingValiable;

function ResponseCheck(aIndex,aDelay:integer):Boolean;
var
  FirstTickCount : double;
begin
  FirstTickCount := GetTickCount + aDelay;
  While Not G_bDeviceResponse[aIndex] do
  begin
    if G_bApplicationTerminate then Exit;
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
    if G_bApplicationTerminate then Exit;
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
    if G_bApplicationTerminate then Exit;
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
end.
