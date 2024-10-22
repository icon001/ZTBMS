unit udmBarCode;

interface

uses
  SysUtils, Classes,Forms, ExtCtrls,SyncObjs,
  ScktComp,AdPort,AdWnPort,AdSocket,DXString,
  IdGlobal,uDataModule1;

type
  TdmBarCode = class(TApdWinsockport)
  private
    FBarCodeID: string;
    FIP: string;
    FPORT: string;
    FBarCodeConnect: Boolean;
    FBarCodeConnected: Boolean;
    FDoorNodeNo: integer;
    FDoorNo: string;
    FDoorECUID: string;
    FOnRcvBarCode: TBarcodeEvent;
    FReaderNo: string;
    FReceiveTime: TDateTime;
    procedure SetBarCodeID(const Value: string);
    procedure SetIP(const Value: string);
    procedure SetPort(const Value: string);
    procedure SetBarCodeConnect(const Value: Boolean);
    { Private declarations }
  private
    L_stComBuff : string;
  protected
    procedure BarCodeTriggerAvail(CP: TObject; Count: Word);
    procedure BarCodeWsConnect(Sender: TObject);
    procedure BarCodeWsDisconnect(Sender: TObject);
    procedure BarCodeWsError(Sender: TObject; ErrCode: Integer);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    Property BarCodeConnect: Boolean read FBarCodeConnect write SetBarCodeConnect;
    Property BarCodeConnected: Boolean read FBarCodeConnected write FBarCodeConnected;

    Property BarCodeID: string read FBarCodeID write SetBarCodeID;
    Property BarCodeIP: string read FIP write SetIP;
    Property BarCodePORT: string read FPORT write SetPort;
    property DoorNodeNo : integer read FDoorNodeNo write FDoorNodeNo;
    property DoorECUID : string read FDoorECUID write FDoorECUID;
    property DoorNo : string read FDoorNo write FDoorNo;
    property ReaderNo : string read FReaderNo write FReaderNo;
    property ReceiveTime : TDateTime read FReceiveTime write FReceiveTime;

    property OnRcvBarCode:    TBarcodeEvent read FOnRcvBarCode     write FOnRcvBarCode;
  end;

var
  dmBarCode: TdmBarCode;

implementation

uses
  uLomosUtil;

{$R *.dfm}

{ TdmBarCode }


procedure TdmBarCode.BarCodeTriggerAvail(CP: TObject; Count: Word);
var
  i : integer;
  stTemp : string;
  stPacket : string;
  nPos : integer;
begin
  ReceiveTime := Now;
  for i := 1 to Count do stTemp := stTemp + GetChar;
  L_stComBuff := L_stComBuff + stTemp;

  nPos := Pos(#13#10,L_stComBuff);

  While nPos > 0 do
  begin
    stPacket := copy(L_stComBuff,1,nPos - 1);
    if Assigned(FOnRcvBarCode) then
      OnRcvBarCode(Self,stPacket,inttostr(DoorNodeNo),DoorECUID,DoorNo,ReaderNo);
    Delete(L_stComBuff,1,nPos + 1);
    nPos := Pos(#13#10,L_stComBuff);
  end;
  


end;

procedure TdmBarCode.BarCodeWsConnect(Sender: TObject);
begin
  BarCodeConnected := True;
end;

procedure TdmBarCode.BarCodeWsDisconnect(Sender: TObject);
begin
  BarCodeConnected := False;
end;

procedure TdmBarCode.BarCodeWsError(Sender: TObject; ErrCode: Integer);
begin
  BarCodeConnected := False;
  ErrCode := 0;
end;

constructor TdmBarCode.Create(AOwner: TComponent);
begin
  inherited;
  AutoOpen:= False;
  DeviceLayer:= dlWinsock;
  WsMode:= wsClient;

  OnTriggerAvail:= BarCodeTriggerAvail;
  OnWsConnect := BarCodeWsConnect;
  OnWsDisconnect := BarCodeWsDisconnect;
  OnWsError := BarCodeWsError;

  ReceiveTime := Now;
end;

destructor TdmBarCode.Destroy;
begin

  inherited;
end;

procedure TdmBarCode.SetBarCodeConnect(const Value: Boolean);
begin
  FBarCodeConnect := Value;
  if Value then Open := False;
  Open := Value;
end;

procedure TdmBarCode.SetBarCodeID(const Value: string);
begin
  FBarCodeID := Value;
end;

procedure TdmBarCode.SetIP(const Value: string);
begin
  FIP := Value;
  WsAddress := Value;
end;

procedure TdmBarCode.SetPort(const Value: string);
begin
  if Not isDigit(Value) then
  begin
    BarCodePORT := '502';
    Exit;
  end;
  FPORT := Value;
  wsPort := Value;
end;

end.
