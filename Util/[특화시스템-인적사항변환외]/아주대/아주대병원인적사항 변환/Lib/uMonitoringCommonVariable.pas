unit uMonitoringCommonVariable;

interface

uses
  SysUtils, Classes;

type
  TdmMonitoringCommonVariable = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMonitoringCommonVariable: TdmMonitoringCommonVariable;
  NodeList : TStringList;      //노드별 기기 정보
  BuildingList : TStringList;  //빌딩별 기기 정보
  DeviceStateList : TStringList;    //기기별 상태 정보

implementation

{$R *.dfm}

end.
