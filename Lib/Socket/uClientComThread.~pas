unit uClientComThread;

interface
uses
  Classes,SysUtils,uMoPacketItem;

type
  TClientComThread = class(TThread)
  private
  protected
    procedure Execute;override;
  public
  end;
  
implementation
uses
  uServerDaemon;
{ TClientComThread }

procedure TClientComThread.Execute;
var
  Item : TMoPacketItem;
begin
  repeat
    Item := fmMain.ClientCommunication.MoPacketList.GetItem;
    Try
      if Item <> nil then Item.Execute;
    Finally
      Item.Free;
    end;
    sleep(25);
  until self.Terminated = true;

end;

end.
