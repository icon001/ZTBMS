unit uClientCommunication;

interface
uses
  Classes,SysUtils,IdTCPServer,uMoPacketList,uClientComThread;

Type
  TClientCommunication = class
  private
  public
    MoPacketList : TMoPacketList;
    ClientComThread : TClientComThread;
    constructor create;
    destructor Destroy;override;

    procedure Excute(aPeerThread: TIdPeerThread;aCmd,aDeviceID,aData:string);
  end;

implementation

{ TClientCommunication }

constructor TClientCommunication.create;
begin
  inherited;
  MoPacketList := TMoPacketList.Create;
  ClientComThread := TClientComThread.Create(false);  //True 면 멈충상태로 생성
end;

destructor TClientCommunication.Destroy;
begin
  ClientComThread.Terminate;
  MoPacketList.Free;
  inherited;
end;

procedure TClientCommunication.Excute(aPeerThread: TIdPeerThread;aCmd,aDeviceID,aData:string);
begin
  MoPacketList.AddPacket(aPeerThread,acmd,aDeviceID,aData);
end;

end.
