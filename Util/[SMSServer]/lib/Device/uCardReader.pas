unit uCardReader;

interface

uses
  SysUtils, Classes, OoMisc, AdPort, AdWnPort, AdPacket;

type
  TdmCardReader = class(TDataModule)
    CardCreatePort: TApdWinsockPort;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCardReader: TdmCardReader;

implementation

{$R *.dfm}

end.
