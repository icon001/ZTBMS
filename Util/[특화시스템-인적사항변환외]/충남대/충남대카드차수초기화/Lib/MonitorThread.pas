unit MonitorThread;

interface

uses Classes,uDataModule1;

Type
  TControlSendThread = class(TThread)
  private
  protected
    procedure Execute; override;
    procedure ControlDataSend(aData:string) ;
  public
  end;

implementation


{ TControlSendThread }

procedure TControlSendThread.ControlDataSend(aData: string);
begin
  dmMonitorSocket.
end;

procedure TControlSendThread.Execute;
var
  stData : string;
begin
  if ControlDataList.Count > 0 then
  begin
    if G_bControlSocketConnected  then
    begin
      stData := ControlDataList.Strings[0];
      ControlDataSend(stData);
    end;
  end;

end;


end.
 