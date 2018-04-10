unit uMoPacketList; //모니터링 패킷리스트

interface
uses
  Classes,SysUtils,SyncObjs,uClientInfo,IdTCPServer,uMoPacketItem;

Type
  TMoPacketList = Class
  private
    FCS : TCriticalSection;

    FList : TList;

  public
    constructor create;
    destructor Destroy;override;

    procedure AddPacket(aPeerThread: TIdPeerThread;aCmd,aDeviceID,aData:string);
    function GetItem:TMoPacketItem;
  end;

implementation

{ TMoPacketList }

procedure TMoPacketList.AddPacket(aPeerThread: TIdPeerThread;aCmd, aDeviceID, aData: string);
var
  Item : TMoPacket1;
begin
  FCS.Enter;
  Try
    Item := TMoPacket1.Create;
    Item.Command := aCmd;
    Item.DeviceID := aDeviceID;
    Item.Data := aData;
    Item.AThread := aPeerThread;

    FList.Add(Item);

  finally
    FCS.Leave;
  end;
end;

constructor TMoPacketList.create;
begin
  inherited;
  FCS := TCriticalSection.Create;
  FList := TList.Create;
end;

destructor TMoPacketList.Destroy;
begin
  inherited;
  FCS.Free;
  FList.Free;
end;

function TMoPacketList.GetItem: TMoPacketItem;
var
  Item : TMoPacket1;
begin
  FCS.Enter;
  Try
    if FList.Count = 0 then
    begin
      result := nil;
      Exit;
    end;
    result := Pointer(FList.Items[0]);
    FList.Delete(0);
  finally
    FCS.Leave;
  end;

end;

end.
 