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
  NodeList : TStringList;      //��庰 ��� ����
  BuildingList : TStringList;  //������ ��� ����
  DeviceStateList : TStringList;    //��⺰ ���� ����

implementation

{$R *.dfm}

end.
