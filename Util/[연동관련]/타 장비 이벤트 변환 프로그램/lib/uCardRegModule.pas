unit uCardRegModule;

interface

uses
  SysUtils, Classes, AdPacket, OoMisc, AdPort,
  uCommonVariable;

type
  TdmCardReg = class(TDataModule)
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
  private
    FCOMPORT: integer;
    FOnCardReceiveEvent: TSocketEvent;
    FOnEvent: TSocketEvent;
    procedure SetComPort(const Value: integer);
    { Private declarations }
  private
    procedure RcvCardDataByReader(aData:string);
    procedure CardReaderFormatChange(aType:string);
  public
    { Public declarations }
    function PortOpen:Boolean;
    function PortClose:Boolean;
  published
    property COMPORT : integer read FCOMPORT write SetComPort;

    property OnCardReceiveEvent:      TSocketEvent read FOnCardReceiveEvent       write FOnCardReceiveEvent;
    property OnEvent:      TSocketEvent read FOnEvent       write FOnEvent;
  end;

var
  dmCardReg: TdmCardReg;

implementation

uses
  uLomosUtil,
  uDBModule;
{$R *.dfm}

{ TdmCardReg }

function TdmCardReg.PortClose: Boolean;
begin
  ApdDataPacket1.Enabled := False;
  ReaderPort.Open := False;
end;

function TdmCardReg.PortOpen:Boolean;
begin
  result := False;
  if COMPORT < 1 then Exit;
  Try
    ApdDataPacket1.AutoEnable := false;
    ApdDataPacket1.StartCond := scString;
    ApdDataPacket1.StartString := #$02;
    ApdDataPacket1.EndCond := [ecString];
    ApdDataPacket1.EndString := #$03;
    ApdDataPacket1.Timeout := 0;
    ReaderPort.ComNumber := COMPORT;
    ReaderPort.Open := true;
    ApdDataPacket1.Enabled := True;
  Except
    Exit;
  End;
  result := ReaderPort.Open;

end;

procedure TdmCardReg.SetComPort(const Value: integer);
begin
  FCOMPORT := Value;
  ReaderPort.ComNumber := Value;
end;

procedure TdmCardReg.ApdDataPacket1StringPacket(Sender: TObject;
  Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TdmCardReg.RcvCardDataByReader(aData: string);
var
  aIndex: Integer;
  aCardNo:String;
  stReaderType : string;
begin
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'RX',aData,'COMPORT' + inttostr(COMPORT));
  end;
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  if aData = 'F' then    //포맷 요청
  begin
    stReaderType := 'C';
    //if nSpecialProgram = 1 then stReaderType := 'K';
    CardReaderFormatChange(stReaderType);
    Exit;
  end;
  if (aData = 'Y') OR (aData = 'N') then Exit;

  aCardNo := aData;

  if Assigned(FOnCardReceiveEvent) then
  begin
    OnCardReceiveEvent(Self,aCardNo,formatdateTime('yyyymmddhhnnss',now),'COMPORT' + inttostr(COMPORT));
  end;

end;



procedure TdmCardReg.CardReaderFormatChange(aType: string);
begin
  if ReaderPort.Open then
    ReaderPort.PutString(STX + aType + ETX);

end;

end.
