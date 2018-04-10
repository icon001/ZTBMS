unit uFoodEmployee;

interface

uses
  SysUtils, Classes;

type
  TFoodEmployee = class(TComponent)
  private
    L_arrayFoodCodeCount: array [0..10] of integer;
    FEMCODE: string;
    FCompanyCode: string;
    FFoodSemesterCount: integer;
    FFoodDayCount: integer;
    FFoodWeekCount: integer;
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure FoodCodeCountInitialize;
    function FoodCodeCount_Inc(aIndex:integer):Boolean;
    function SetFoodCodeCount(aIndex,aCount:integer):Boolean;
    function  GetFoodCodeCount(aIndex:integer):integer;
  published
    property CompanyCode : string read FCompanyCode write FCompanyCode;
    property EMCODE : string read FEMCODE write FEMCODE;
    property FoodDayCount : integer read FFoodDayCount write FFoodDayCount;
    property FoodWeekCount : integer read FFoodWeekCount write FFoodWeekCount;
    property FoodSemesterCount : integer read FFoodSemesterCount write FFoodSemesterCount;
  end;
  TdmFoodEmployee = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmFoodEmployee: TdmFoodEmployee;

implementation

{$R *.dfm}

{ TFoodEmployee }

constructor TFoodEmployee.Create(AOwner: TComponent);
begin
  inherited;
  FoodCodeCountInitialize;
  FoodDayCount := 0;
  FoodWeekCount := 0;
  FoodSemesterCount := 0;
end;

destructor TFoodEmployee.Destroy;
begin

  inherited;
end;

procedure TFoodEmployee.FoodCodeCountInitialize;
var
  i : integer;
begin
  for i := Low(L_arrayFoodCodeCount) to HIGH(L_arrayFoodCodeCount) do
  begin
    L_arrayFoodCodeCount[i] := 0;
  end;
end;

function TFoodEmployee.FoodCodeCount_Inc(aIndex: integer): Boolean;
begin
  L_arrayFoodCodeCount[aIndex] := L_arrayFoodCodeCount[aIndex] + 1;
end;

function TFoodEmployee.GetFoodCodeCount(aIndex: integer): integer;
begin
  result := L_arrayFoodCodeCount[aIndex];
end;

function TFoodEmployee.SetFoodCodeCount(aIndex, aCount: integer): Boolean;
begin
  L_arrayFoodCodeCount[aIndex] := aCount;
end;

end.
