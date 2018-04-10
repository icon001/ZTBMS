unit uRelayDoor;

interface

uses
  SysUtils, Classes,
  uDataModule1;

type
  TdmRelayDoor = class(TComponent)
  private
    FNodeNo: integer;
    FDoorNo: char;
    FEcuID: string;
    FDoorState: TDoorDSState;
    FDoorLockMode: TDoorLockState;
    FDoorManageMode: TDoorManageMode;
    FDoorPNMode: TDoorPNMode;
    { Private declarations }
  public
    procedure DoorPNModeChange(aPNMode:TDoorPNMode);
  public
    { Public declarations }
    property NodeNo : integer read FNodeNo write FNodeNo;
    property EcuID : string read FEcuID write FEcuID;
    property DoorNO : char read FDoorNo write FDoorNo;
    property DoorManageMode : TDoorManageMode read FDoorManageMode write FDoorManageMode;
    property DoorPNMode : TDoorPNMode read FDoorPNMode write FDoorPNMode;
    property DoorState : TDoorDSState read FDoorState write FDoorState;
    property DoorLockMode : TDoorLockState read FDoorLockMode write FDoorLockMode;
  end;

var
  dmRelayDoor: TdmRelayDoor;

implementation

uses
  uDevicemodule,
  uLomosUtil;

{$R *.dfm}

{ TdmRelayDoor }

procedure TdmRelayDoor.DoorPNModeChange(aPNMode: TDoorPNMode);
var
  nIndex : integer;
  stDeviceID : string;
  chPNMode : char;
begin
  if aPNMode = pnNegative then chPNMode := '1'
  else chPNMode := '0';
  stDeviceID := FillZeroNumber(NodeNo,3) + EcuID;
  nIndex := DeviceList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    TDevice(DeviceList.Objects[nIndex]).Control_DoorPNModeChange(DoorNO,chPNMode,True);
  end;
end;

end.
