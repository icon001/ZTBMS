unit uRelayBuilding;

interface

uses
  SysUtils, Classes;

type
  TdmBuilding = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TBuildingCode = Class(TComponent)
  private
    FBuildingCode: string;
  public
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property RelayBuildingCode : string read FRelayBuildingCode write FRelayBuildingCode;
  end;

var
  dmBuilding: TdmBuilding;

implementation

{$R *.dfm}

end.
