unit uRelay;

interface

uses
  SysUtils, Classes;

type
  TArmAreaStatusChange = procedure(Sender: TObject;aArmAreaCode,aArmRelayCode,aArmAreaName,aBuildingCode,aArmStatus,aVacancy:string  ) of object;

  TdmRelay = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function HURelay(aId,aName,aLoccode,aStatus,aVacancy:string):Boolean;
  end;

  TRelayBuildingCode = Class(TComponent)
  private
    FBuildingCode: string;
    FRelayBuildingCode: string;
  public
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property RelayBuildingCode : string read FRelayBuildingCode write FRelayBuildingCode;
  end;
  
  TRelayArmAreaCode = Class(TComponent)
  private
    FVacancy: string;
    FArmRelayCode: string;
    FBuildingCode: string;
    FArmAreaName: string;
    FArmAreaCode: string;
    FArmStatus: string;
    FOnArmAreaStatusChange: TArmAreaStatusChange;
    procedure SetArmStatus(const Value: string);
    procedure SetVacancy(const Value: string);
  public
    property ArmAreaCode : string read FArmAreaCode write FArmAreaCode;
    property ArmRelayCode : string read FArmRelayCode write FArmRelayCode;
    property ArmAreaName : string read FArmAreaName write FArmAreaName;
    property BuildingCode : string read FBuildingCode write FBuildingCode;
    property ArmStatus : string read FArmStatus write SetArmStatus;
    property Vacancy : string read FVacancy write SetVacancy;    //공실
  public
    property OnArmAreaStatusChange:      TArmAreaStatusChange read FOnArmAreaStatusChange       write FOnArmAreaStatusChange;
  end;

var
  dmRelay: TdmRelay;

implementation

uses
  uRelayDB;

{$R *.dfm}

{ TRelayArmAreaCode }

procedure TRelayArmAreaCode.SetArmStatus(const Value: string);
begin
  if FArmStatus = Value then Exit;
  FArmStatus := Value;
  if Assigned(FOnArmAreaStatusChange) then
  begin
    OnArmAreaStatusChange(Self,ArmAreaCode,ArmRelayCode,ArmAreaName,BuildingCode,ArmStatus,Vacancy);
  end;
end;

procedure TRelayArmAreaCode.SetVacancy(const Value: string);
begin
//  if FVacancy = Value then Exit;  ///2020-06-05 ET 발생시 마다 계속 넘겨 주도록 프로그램 변경
  FVacancy := Value;
  if Assigned(FOnArmAreaStatusChange) then
  begin
    OnArmAreaStatusChange(Self,ArmAreaCode,ArmRelayCode,ArmAreaName,BuildingCode,ArmStatus,Vacancy);
  end;
end;

{ TdmRelay }

function TdmRelay.HURelay(aId, aName, aLoccode, aStatus,
  aVacancy: string): Boolean;
begin
(*  if HURelayCheck(aId) then
  begin
    result := UpdateHURelay(aId, aName, aLoccode, aStatus,aVacancy);
  end else
  begin
    result := InsertHURelay(aId, aName, aLoccode, aStatus,aVacancy);
  end;
*)
end;

end.
