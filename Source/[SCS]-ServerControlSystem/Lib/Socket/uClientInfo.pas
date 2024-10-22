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
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(Lenstr) then
  begin
    Delete(RcvData,1,1);       //1'st STX ����
    aIndex:= Pos(STX,RcvData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      RcvData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(RcvData,1,aIndex-1);//STX �� ������ ����
    end;
    Exit;
  end;

  //��Ŷ�� ���ǵ� ����
  DefinedDataLength:= StrtoInt(Lenstr);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(RcvData) < DefinedDataLength then
  begin

    //���� �����Ͱ� ���̰� ������(���� �� ������ ����)
    etxIndex:= POS(ETX,RcvData);
    if etxIndex > 0 then
    begin
     Delete(RcvData,1,etxIndex);
     //ShowMessage(toHExstr(aData));
    end;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if RcvData[DefinedDataLength] = ETX then
  begin
    StrBuff:= Copy(RcvData,1,DefinedDataLength);
    Result:=StrBuff;
    Delete(RcvData, 1, DefinedDataLength);
  end else
  begin
    //������ �����Ͱ� EXT�� �ƴϸ� 1'st STX����� ���� STX�� ã�´�.
    Delete(RcvData,1,1);
    aIndex:= Pos(STX,RcvData); // ���� STX ã��
    if aIndex = 0 then       //STX�� ������...
    begin
      //��ü ������ ����
      RcvData:= '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(RcvData,1,aIndex-1);//STX �� ������ ����
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
  until pos(ETX,RcvData) = 0;  //��Ŷ �߿� ETX�� �ִ� ������ ��Ŷ ó������.
end;

procedure TDeviceSocketInfo.SetConnected(const Value: Boolean);
var
  aMcuServer   : TMCUNodeInfo;
begin
  if FConnected = Value then Exit;  //���°� ������ �׳� ����.
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
 