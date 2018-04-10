unit uClientInfo;

interface
uses
  Classes,SysUtils,SyncObjs,IdTCPServer;

Type
  TClientInfo = class
    private
    public
      AThread: TIdPeerThread;
      ClientIP : string;
      ClientPort : integer;
      AliveTime : TDateTime;
  end;

  TDeviceSocketInfo = class
  private
    RcvData : string;
    FConnected: Boolean;
    FMCUID: String;
    procedure SetConnected(const Value: Boolean);
    procedure SetMCUID(const Value: String);
  public
    AThread: TIdPeerThread;
    ClientIP : string;
    ClientPort : integer;
    AliveTime : TDateTime;
    constructor create;
    destructor Destroy;override;
    procedure PushData(aData:string);
    function GetPacket:string;
    function GetMcuID(aPacket:string):string;
  published
    Property MCUID: String Read FMCUID write SetMCUID;
    Property Connected: Boolean Read FConnected write SetConnected;
  end;

implementation
uses
  uServerDaemon,
  uMcusocket,
  uLomosUtil,
  uDataModule1;


{ TDeviceSocketInfo }

constructor TDeviceSocketInfo.create;
begin
  inherited;
  AThread := nil;
  RcvData := '';
  MCUID := '';
  Connected := False;
end;

destructor TDeviceSocketInfo.Destroy;
begin
  inherited;
  AThread := nil;
end;

function TDeviceSocketInfo.GetMcuID(aPacket: string): string;
begin
  result := Copy(aPacket,8,7);
end;

function TDeviceSocketInfo.GetPacket: string;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
begin
  Result:= '';
  Lenstr:= Copy(RcvData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    Delete(RcvData,1,1);       //1'st STX 삭제
    aIndex:= Pos(STX,RcvData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      RcvData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(RcvData,1,aIndex-1);//STX 앞 데이터 삭제
    end;
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(RcvData) < DefinedDataLength then
  begin

    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    etxIndex:= POS(ETX,RcvData);
    if etxIndex > 0 then
    begin
     Delete(RcvData,1,etxIndex);
     //ShowMessage(toHExstr(aData));
    end;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if RcvData[DefinedDataLength] = ETX then
  begin
    StrBuff:= Copy(RcvData,1,DefinedDataLength);
    Result:=StrBuff;
    Delete(RcvData, 1, DefinedDataLength);
  end else
  begin
    //마직막 데이터가 EXT가 아니면 1'st STX지우고 다음 STX를 찾는다.
    Delete(RcvData,1,1);
    aIndex:= Pos(STX,RcvData); // 다음 STX 찾기
    if aIndex = 0 then       //STX가 없으면...
    begin
      //전체 데이터 버림
      RcvData:= '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(RcvData,1,aIndex-1);//STX 앞 데이터 삭제
    end;
  end;
end;

procedure TDeviceSocketInfo.PushData(aData: string);
var
  stPacket : string;
  aMcuServer   : TMCUNodeInfo;
  nIndex : integer;
begin
  AliveTime := Now;
  RcvData := RcvData + aData;
  repeat
    stPacket := GetPacket;
    if stPacket <> '' then
    begin
      Connected := True;
      MCUID := GetMcuID(stPacket);
      nIndex := DeviceClientNodeList.IndexOf(MCUID);
      if nIndex < 0 then
      begin
        //DeviceClientNodeList Add
        if Not fmMain.DeviceClientNodeAddItem(MCUID) then Exit;
      end;
      aMcuServer := fmMain.FindClientMcuNode(MCUID);
      if aMcuServer <> nil then
      begin
        aMcuServer.Socket := AThread;
        aMcuServer.ClientIP := ClientIP;
        aMcuServer.ClientPort := ClientPort;
        aMcuServer.SocketConnected := True;
        aMcuServer.DataPacektProcess(stPacket);
      end;
    end;
  until pos(ETX,RcvData) = 0;  //패킷 중에 ETX가 있는 동안은 패킷 처리하자.
end;

procedure TDeviceSocketInfo.SetConnected(const Value: Boolean);
var
  aMcuServer   : TMCUNodeInfo;
begin
  if FConnected = Value then Exit;  //상태가 같으면 그냥 빠짐.
  if MCUID <> '' then
  begin
    FConnected := Value;
    aMcuServer := fmMain.FindClientMcuNode(MCUID);
    if aMcuServer <> nil then
    begin
      aMcuServer.SocketConnected := Value;
    end;
  end;
end;

procedure TDeviceSocketInfo.SetMCUID(const Value: String);
begin
  FMCUID := Value;
end;

end.
 