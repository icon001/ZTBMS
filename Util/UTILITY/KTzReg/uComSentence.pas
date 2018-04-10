unit uComSentence;

interface
uses uLomosUtil;

function MakeSendData(aDeviceID: String;aCmd:Char;aVer:string;aMsgNo:string; aData: String;aLen:integer):string;

implementation

function MakeSendData(aDeviceID: String;aCmd:Char;aVer:string;aMsgNo:string; aData: String;aLen:integer):string;
var
  stSendData : string;
  nKey : integer;
begin
  stSendData:= STX +FillZeroNumber(aLen,3) +  #$20+ aVer + aDeviceID+ aCmd+aMsgNo + aData;
  stSendData:= stSendData+ MakeCSData(stSendData+ETX)+ETX;
  nKey := $20;
  stSendData:= Copy(stSendData,1,5)+EncodeData(nKey,Copy(stSendData,6,Length(stSendData)-6))+ETX;
  MakeSendData := stSendData;
end;
end.
