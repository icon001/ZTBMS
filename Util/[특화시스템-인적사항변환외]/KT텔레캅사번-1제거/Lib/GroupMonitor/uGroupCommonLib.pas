unit uGroupCommonLib;

interface
uses
  Classes;
{uses
  Classes,
  ADODB,
  Controls,
  Forms;
}
Type
  TPopupEvent = procedure(Sender: TObject;  aType,aCmd,aDeviceID: string) of object;
{
IDllGroupForm = interface
  function GetPopupEvent: TPopupEvent;
  procedure SetPopupEvent(value:TPopupEvent);

  function GetBuildingCode : string;
  procedure SetBuindingCode(value:string);
  function GetFloorCode : string;
  procedure SetFloorCode(value:string);
  function GetIsMaster : Boolean;
  procedure SetIsMaster(value:Boolean);
  function GetGroupCode : string;
  procedure SetGroupCode(value:string);
  function GetMasterID : string;
  procedure SetMasterID(value:string);

  function GetAdoConnection : TADOConnection;
  procedure SetAdoConnection(value:TADOConnection);
  function GetParent : TWinControl;
  procedure SetParent(value:TWinControl);
  function GetApplication : TApplication;
  procedure SetApplication(value:TApplication);
  function GetBorderStyle : TFormBorderStyle;
  procedure SetBorderStyle(value:TFormBorderStyle);
  function GetAlign : TAlign;
  procedure SetAlign(value:TAlign);

  procedure Show;

  property OnPopupEvent: TPopupEvent read GetPopupEvent write SetPopupEvent;
  property OnBuildingCode : string read GetBuildingCode write SetBuindingCode;
  property OnFloorCode : string read GetFloorCode write SetFloorCode;
  property OnIsMaster : Boolean read GetIsMaster write SetIsMaster;
  property OnGroupCode : string read GetGroupCode write SetGroupCode;
  property OnMasterID : string read GetMasterID write SetMasterID;
  property AdoConnection :TADOConnection read GetAdoConnection write SetAdoConnection;
  property OnParent:TWinControl read GetParent Write SetParent;
  property OnApplication:TApplication read GetApplication write SetApplication;
  property OnBorderStyle:TFormBorderStyle read GetBorderStyle write SetBorderStyle;
  property OnAlign:TAlign read GetAlign write SetAlign;
end;

var
  GroupForm : IDllGroupForm;                            }

var
  GroupFormList : TStringList;

implementation

end.
 