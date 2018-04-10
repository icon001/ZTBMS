unit uCardReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, AdPacket, OoMisc, AdPort,WinSpool,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient;

const
 USE_ENUMPORTS_API = False;
 MAX_COMPORT = 36;       // 최대 255 까지
 MAX_LISTCOUNT = 100; //리스트 출력 count

type
  TForm1 = class(TForm)
    cmb_ComPort: TComboBox;
    Label1: TLabel;
    ed_CardNo: TEdit;
    Label19: TLabel;
    SpeedButton1: TSpeedButton;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    chk_Send: TCheckBox;
    IdTCPClient1: TIdTCPClient;
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
  private
    L_stExecPath : string;
    { Private declarations }
    Procedure RcvCardDataByReader(aData:String);
    procedure SendServer(aIp,aPort,aData:string);
  public
    ComPortList : TStringList;
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  end;

var
  Form1: TForm1;

implementation

uses
  uLomosUtil;
{$R *.dfm}

{ TForm1 }

function TForm1.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TForm1.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TForm1.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

procedure TForm1.FormActivate(Sender: TObject);
var
  nCount : integer;
  i : integer;
begin
  ComPortList.Clear;
  nCount := GetSerialPortList(ComPortList);
  cmb_ComPort.Clear;
  if nCount = 0 then
  begin
    showmessage('시리얼 포트를 찾을 수 없습니다. 제어판에서 시리얼 포트를 확인하여 주세요.');
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;
  cmb_ComPort.ItemIndex := 0;

  try
    ApdDataPacket1.AutoEnable := false;
    ApdDataPacket1.StartCond := scString;
    ApdDataPacket1.StartString := #$02;
    ApdDataPacket1.EndCond := [ecString];
    ApdDataPacket1.EndString := #$03;
    ApdDataPacket1.Timeout := 0;
    ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
    //ReaderPort.ComNumber := strtoint(copy(cmb_ComPort.text,4,Pos(':',cmb_ComPort.text) -4));
    ReaderPort.Open := true;
    ApdDataPacket1.Enabled := True;
  except
    MessageDlg('통신포트를 확인해 주세요', mtError, [mbOK], 0);
    Exit;
  end;
  //cmb_ComPort.Enabled := True;
  L_stExecPath := ExtractFileDir(Application.ExeName);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComPortList := TStringList.Create;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ComPortList.Free;
end;

procedure TForm1.cmb_ComPortChange(Sender: TObject);
begin
  if cmb_ComPort.text = '' then Exit;
  if ReaderPort.Open then ReaderPort.Open := False;
  ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
  ReaderPort.Open := true;

end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ApdDataPacket1StringPacket(Sender: TObject; Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;
end;

procedure TForm1.RcvCardDataByReader(aData: String);
var
  aIndex: Integer;
  aCardNo:String;
  bCardNo: int64;
  stMsg : string;
  stFileName : string;
begin
  stFileName := L_stExecPath + '\CardData.txt';
  //STX 삭제
  aIndex:= Pos(#$2,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);
  //ETX삭제
  aIndex:= Pos(#$3,aData);
  if aIndex > 0 then Delete(aData,aIndex,1);

  if chk_Send.Checked then
    SendServer('127.0.0.1','2999',aData);
  bCardNo:= Hex2Dec64(aData);
  aCardNo:= FillZeroNumber2(bCardNo,10);

  LogSave(stFileName,FormatDateTime('yyyy-mm-dd HH:MM:SS',now) + ' ' + aCardNo);
  ed_CardNo.Text := aCardNo;
  ed_CardNo.SetFocus;
  ed_CardNo.SelectAll;
end;

procedure TForm1.SendServer(aIp, aPort, aData: string);
var
  stSendServer : string;
begin
  stSendServer := #$2 +
                  FillZeroNumber(1,4) +
                  FillZeroNumber(Length(aData),2) +
                  aData +
                  #$3;

  IdTCPClient1.Host := aIp;
  IdTCPClient1.Port := strtoint(aPort);
  if Not IdTCPClient1.Connected then
    IdTCPClient1.Connect;
  IdTCPClient1.Write(stSendServer);
  //IdTCPClient1.Disconnect;
end;

end.
