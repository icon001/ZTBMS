unit uComParsing;

interface
uses SysUtils,uLomosUtil;

//�������� ���� ������ ��Ŷ ���� Ȯ�� �� ����Ŷ �����Ͽ� ����
function  CheckDataPacket(aData: String; var bData:String):String;
//�� ��Ŷ�� �м��Ͽ� ������ ����
function  GetDataPacket(aData:string; var aDeviceID:string;
                        var aCMD:Char;var aMsgNo:Char;var aVer:string;var aDataLen:integer):string;

function GetDataCommand(aData:string):string; //������ CMD ����
function GetDataCommandType(aData:string):string; //������ CMDType ����
function GetDeviceData(aData:string):string; //������Ŀ�ǵ带 ������ ������

//----------ī�帮�� ���� ��ȸ------------
function GetReaderNo(aData:string):integer;   //ī�帮�� ��ȣ ����
function GetCardReaderUse(aData:string):integer;  //ī�帮�� �����������
function GetCardReaderInOut(aData:string):integer; //ī�帮�� ��ġ ��ġ����
function GetCardReaderBuildingInOut(aData:string):integer; //ī�帮�� ���� ��ġ ��ġ����
function GetReaderToDoorNo(aData:string):integer;          //ī�帮���� �ش��ϴ� ����ȣ
function GetCardReaderToZoneNo(aData:string):integer;      //ī�帮���� �ش��ϴ� ����ȣ �̻��
function GetCardReaderLocateName(aData:string):string;      //ī�帮�� ��ġ ��ġ ����
function GetCardReaderType(aData:string):Char;             //ī�帮�� Ÿ��

//----------�ý����������(I) ���� ��ȸ------------  //SY001000222                00003D
function GetWatchPowerOff(aData:string):integer;  //�������ÿ��� ����
function GetComControlType(aData:string):integer;  //������Ź��
function GetOutDelayTime(aData:string):integer; //������� �ð� ����
function GetInDelayTime(aData:string):integer; //�Խ����� �ð� ����
function GetSystemSpare(aData:string):integer;  //����
function GetDoor1Type(aData:string):integer;    //Door1 Type
function GetDoor2Type(aData:string):integer;    //Door2 Type
function GetSystemLocateName(aData:string):string; //�ý��� ��ġ��

//----------���������� ���� ��ȸ------------  //RY02110000600
function GetRelayNo(aData:string):integer;
function GetRelayLinkType(aData:string):integer; //������ �������
function GetRelayOutPutType(aData:string):integer; //������ ��¹��
function GetRelayTimer(aData:string):integer; //������ Ÿ�̸�
function GetRelayUseType(aData:string):integer; //������ �����
function GetRelayActionTime(aData:string):integer; //������ ���۽ð�

//----------��Ʈ���� ���� ��ȸ------------  //LP01SS00000000000000000000000000�̼���          04007
function GetPortNo(aData:string):integer;  //��Ʈ��ȣ
function GetPortStatus(aData:string):string; //��Ʈ ����
function GetPortWatchType(aData:string):integer; //��Ʈ��������
function GetPortAlarmType(aData:string):integer; //�˶��߻��������
function GetPortRecorverSignal(aData:string):integer; //�˶�������ȣ ��������
function GetPortDelayTimeUse(aData:string):integer;    //�����ð� ��������
function GetPortLocateName(aData:string):string;     //��Ʈ ��ġ��
function GetPortDetectTime(aData:string):string;     //��Ʈ�����ð�

//----------�������� ���� ��ȸ------------  //LP01SS00000000000000000000000000�̼���          04007
function GetLinkusID(aData:string):string;  //�������̵�
function GetLinkusTelNoSeq(aData:string):integer; //������ȭ��ȣ ����
function GetLinkusTelNum(aData:string):string;    //������ȭ��ȣ
function GetLinkusLineCheckTime(aData:string):string;  //����üũ�ð�
function GetLinkusLineCheckStartTime(aData:string):string;  //����üũ���۽ð�
function GetLinkusRemoteControlRingCount(aData:string):integer; //�������� ��ī��Ʈ

//----------���� ���� ��ȸ------------  //LP01SS00000000000000000000000000�̼���          04007
function GetTimeSync(aData:string):string; //�ð�����ȭ
function GetDeviceVersion(aData:string):string; //��� ����
function GetAlarmMode(aData:string):char; //�˶� ���
function GetSirenType(aData:string):string; //���̷�Ÿ��

//----------���� ���� ��ȸ------------  //LP01SS00000000000000000000000000�̼���          04007
function GetAcMsgCode(aData:string):char;

//----------�߿��� �ٿ�ε� ���� ------------  //LP01SS00000000000000000000000000�̼���          04007
function GetFlashWritePrograss(aData:string):integer;  //������Ȳ
function GetFlashWriteSize(aData:string):string;  //��û�� ������

implementation

function  CheckDataPacket(aData: String; var bData:String):String;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin

  Result:= '';
  Lenstr:= Copy(aData,2,3);
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(Lenstr) then
  begin
    Delete(aData,1,1);       //1'st STX ����
    aIndex:= Pos(STX,aData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      bData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(aData,1,aIndex-1);//STX �� ������ ����
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  DefinedDataLength:= StrtoInt(Lenstr);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < DefinedDataLength then
  begin
    //���� �����Ͱ� ���̰� ������(���� �� ������ ����)
    etxIndex:= POS(ETX,aData);
    if etxIndex > 0 then
    begin
     Delete(aData,1,etxIndex);
    end;
    bData:= aData;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if aData[DefinedDataLength] = ETX then
  begin
    StrBuff:= Copy(aData,1,DefinedDataLength);
    Result:=StrBuff;
    Delete(aData, 1, DefinedDataLength);
    bData:= aData;
  end else
  begin
    //������ �����Ͱ� EXT�� �ƴϸ� 1'st STX����� ���� STX�� ã�´�.
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      bData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(aData,1,aIndex-1);//STX �� ������ ����
      bData:= aData;
    end else
    begin
      bData:= aData;
    end;
  end;
end;

function  GetDataPacket(aData:string; var aDeviceID:string;
                        var aCMD:Char;var aMsgNo:Char;var aVer:string;var aDataLen:integer):string;
begin
  aVer := copy(aData,6,2);
  if aVer = 'K1' then
  begin
    aDataLen := 21;
    aDeviceID:= Copy(aData,8,9);
    aCMD:= aData[17];
    aMsgNo:= aData[18];
    GetDataPacket := Copy(aData,19,Length(aData)- aDataLen);
  end
  else if aVer = 'K2' then
  begin
    aDataLen := 22;
    aDeviceID:= Copy(aData,8,10);
    aCMD:= aData[18];
    aMsgNo:= aData[19];
    GetDataPacket := Copy(aData,20,Length(aData)- aDataLen );
  end;

end;

function GetDataCommand(aData:string):string;
begin
  GetDataCommand := copy(aData,1,2);
end;
function GetDataCommandType(aData:string):string; //������ CMDType ����
begin
  GetDataCommandType := copy(aData,3,4);
end;
function GetDeviceData(aData:string):string; //������Ŀ�ǵ带 ������ ������
begin
  GetDeviceData := Trim(copy(aData,5,length(aData) - 4));
end;


function GetReaderNo(aData:string):integer;
var
  stTemp : string;
begin
  Delete(aData,1,2); //Data Command
  stTemp:= copy(aData,1,2);
  GetReaderNo := strtoint(stTemp);
end;

function GetCardReaderUse(aData:string):integer;
begin
  GetCardReaderUse := strtoint(copy(aData,5,1)); //5��° �ڸ��� ��� ������ ǥ����
end;

function GetCardReaderInOut(aData:string):integer; //ī�帮�� ��ġ ��ġ����
begin
  GetCardReaderInOut := strtoint(copy(aData,6,1)); //6��° �ڸ��� ��� ������ ǥ����
end;

function GetCardReaderBuildingInOut(aData:string):integer; //ī�帮�� ���� ��ġ ��ġ����
begin
  if IsDigit(copy(aData,26,1)) then
    GetCardReaderBuildingInOut := strtoint(copy(aData,26,1)) //26��° �ڸ��� ��� ������ ǥ����
  else GetCardReaderBuildingInOut := -1;
end;

function GetReaderToDoorNo(aData:string):integer;          //ī�帮���� �ش��ϴ� ����ȣ
begin
  if IsDigit(copy(aData,7,1)) then
    GetReaderToDoorNo := strtoint(copy(aData,7,1)) //7��° �ڸ�
  else GetReaderToDoorNo := -1;
end;

function GetCardReaderToZoneNo(aData:string):integer;      //ī�帮���� �ش��ϴ� ����ȣ �̻��
begin
  if IsDigit(copy(aData,8,1)) then
    GetCardReaderToZoneNo := strtoint(copy(aData,8,1)) //8��° �ڸ�
  else GetCardReaderToZoneNo := -1;
end;

function GetCardReaderLocateName(aData:string):string;      //ī�帮�� ��ġ ��ġ ����
begin
  GetCardReaderLocateName := Trim(Copy(aData,10,16));
end;

function GetCardReaderType(aData:string):Char;             //ī�帮�� Ÿ��
begin
  GetCardReaderType := aData[5];
end;

function GetWatchPowerOff(aData:string):integer;  //�������ÿ��� ����
begin
  if IsDigit(copy(aData,5,1)) then
    GetWatchPowerOff := strtoint(copy(aData,5,1)) //5��° �ڸ�
  else GetWatchPowerOff := -1;
end;
function GetComControlType(aData:string):integer;  //������Ź��
begin
  Try
    GetComControlType := strtoint(aData[31]); //31��° �ڸ�
  Except
    GetComControlType := 0;
  End;
end;
function GetOutDelayTime(aData:string):integer; //������� �ð� ����
begin
  Try
    GetOutDelayTime := strtoint(copy(aData,6,3)); //6~8��° �ڸ�
  Except
    GetOutDelayTime := 0;
  End;
end;
function GetInDelayTime(aData:string):integer; //�Խ����� �ð� ����
begin
  Try
    GetInDelayTime := strtoint(copy(aData,28,3)); //28~30��° �ڸ�
  Except
    GetInDelayTime := 0;
  End;
end;

function GetSystemSpare(aData:string):integer; //���� ����
begin
  Try
    GetSystemSpare := strtoint(copy(aData,9,1)); //9��° �ڸ�
  Except
    GetSystemSpare := -1;
  End;
end;
function GetDoor1Type(aData:string):integer;    //Door1 Type
begin
  Try
    GetDoor1Type := strtoint(copy(aData,10,1)); //10��° �ڸ�
  Except
    GetDoor1Type := -1;
  End;
end;
function GetDoor2Type(aData:string):integer;    //Door2 Type
begin
  Try
    GetDoor2Type := strtoint(copy(aData,11,1)); //11��° �ڸ�
  Except
    GetDoor2Type := -1;
  End;
end;
function GetSystemLocateName(aData:string):string; //�ý��� ��ġ��
begin
  GetSystemLocateName := Trim(Copy(aData,12,16));
end;
function GetRelayNo(aData:string):integer;   //�����̹�ȣ
begin
  Try
    GetRelayNo := strtoint(copy(aData,3,2)); //3~4��° �ڸ�
  Except
    GetRelayNo := -1;
  End;
end;
function GetRelayLinkType(aData:string):integer; //������ �������
begin
  Try
    GetRelayLinkType := strtoint(copy(aData,5,1)); //5��° �ڸ�
  Except
    GetRelayLinkType := -1;
  End;
end;
function GetRelayOutPutType(aData:string):integer; //������ ��¹��
begin
  Try
    GetRelayOutPutType := strtoint(copy(aData,6,1)); //6��° �ڸ�
  Except
    GetRelayOutPutType := -1;
  End;
end;
function GetRelayTimer(aData:string):integer; //������ Ÿ�̸�
begin
  Try
    GetRelayTimer := strtoint(copy(aData,7,1)); //7��° �ڸ�
  Except
    GetRelayTimer := -1;
  End;
end;
function GetRelayUseType(aData:string):integer; //������ �����
begin
  Try
    GetRelayUseType := strtoint(copy(aData,8,1)); //8��° �ڸ�
  Except
    GetRelayUseType := -1;
  End;
end;
function GetRelayActionTime(aData:string):integer; //������ ���۽ð�
begin
  Try
    GetRelayActionTime := strtoint(copy(aData,9,5)); //9~13��° �ڸ�
  Except
    GetRelayActionTime := 0;
  End;
end;

function GetPortNo(aData:string):integer;  //��Ʈ��ȣ
begin
  Try
    GetPortNo := strtoint(copy(aData,3,2)); //3~4��° �ڸ�
  Except
    GetPortNo := 0;
  End;
end;
function GetPortStatus(aData:string):string; //��Ʈ ����
begin
  GetPortStatus := Trim(copy(aData,5,2)); //5~6��° �ڸ�
end;
function GetPortWatchType(aData:string):integer; //��Ʈ��������
begin
  Try
    GetPortWatchType := strtoint(copy(aData,7,1)); //7��° �ڸ�
  Except
    GetPortWatchType := 0;
  End;
end;
function GetPortAlarmType(aData:string):integer; //�˶��߻��������
begin
  Try
    GetPortAlarmType := strtoint(copy(aData,8,1)); //8��° �ڸ�
  Except
    GetPortAlarmType := -1;
  End;
end;
function GetPortRecorverSignal(aData:string):integer; //�˶�������ȣ ��������
begin
  Try
    GetPortRecorverSignal := strtoint(copy(aData,9,1)); //9��° �ڸ�
  Except
    GetPortRecorverSignal := -1;
  End;
end;
function GetPortDelayTimeUse(aData:string):integer;    //�����ð� ��������
begin
  Try
    GetPortDelayTimeUse := strtoint(copy(aData,10,1)); //10��° �ڸ�
  Except
    GetPortDelayTimeUse := -1;
  End;
end;
function GetPortLocateName(aData:string):string;     //��Ʈ ��ġ��
begin
  GetPortLocateName := Trim(copy(aData,33,16));
end;
function GetPortDetectTime(aData:string):string;     //��Ʈ�����ð�
begin
  GetPortDetectTime := Trim(copy(aData,49,4));
end;

function GetLinKusID(aData:string):string;  //�������̵�
var
  stTemp : string;
begin
  stTemp := Trim(copy(aData,5,4));
  GetLinKusID := Hex2DecStr(stTemp);
end;
function GetLinkusTelNoSeq(aData:string):integer; //������ȭ��ȣ ����
begin
  Try
    GetLinkusTelNoSeq := strtoint(copy(aData,5,2)); //5~6��° �ڸ�
  Except
    GetLinkusTelNoSeq := 0;
  End;
end;
function GetLinkusTelNum(aData:string):string;    //������ȭ��ȣ
begin
  GetLinkusTelNum := Trim(copy(aData,7,Length(aData) - 6));
end;
function GetLinkusLineCheckTime(aData:string):string;  //����üũ�ð�
begin
  GetLinkusLineCheckTime := Trim(copy(aData,5,2));
end;
function GetLinkusLineCheckStartTime(aData:string):string;  //����üũ���۽ð�
begin
  GetLinkusLineCheckStartTime := Trim(copy(aData,5,2));
end;

function GetLinkusRemoteControlRingCount(aData:string):integer; //�������� ��ī��Ʈ
begin
  Try
    GetLinkusRemoteControlRingCount := strtoint(copy(aData,5,2)); //5~6��° �ڸ�
  Except
    GetLinkusRemoteControlRingCount := 0;
  End;
end;

function GetTimeSync(aData:string):string; //�ð�����ȭ
begin
  GetTimeSync := Trim(copy(aData,5,14));
end;
function GetDeviceVersion(aData:string):string; //��� ����
begin
  GetDeviceVersion := Trim(copy(aData,5,length(aData) - 4));
end;
function GetAlarmMode(aData:string):char; //�˶� ���
begin
  GetAlarmMode := aData[7];
end;
function GetSirenType(aData:string):string; //���̷�Ÿ��
begin
  GetSirenType := Trim(copy(aData,5,2));
end;

function GetAcMsgCode(aData:string):char;
begin
  GetAcMsgCode := aData[1];
end;

function GetFlashWritePrograss(aData:string):integer;
begin
  Try
    GetFlashWritePrograss := strtoint(copy(aData,5,7)); //5~11��° �ڸ�
  Except
    GetFlashWritePrograss := 0;
  End;
end;
function GetFlashWriteSize(aData:string):string;  //��û�� ������
begin
  GetFlashWriteSize := copy(aData,12,4); //12~15��° �ڸ�
end;

end.
