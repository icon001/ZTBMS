unit uSCSRelay;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  TdmOracleRelay = class(TDataModule)
    OracleADOConnection: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmOracleRelay: TdmOracleRelay;

implementation

{$R *.dfm}

end.
