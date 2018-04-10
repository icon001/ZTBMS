unit uComTest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons,WinSpool, AdPacket, OoMisc, AdPort;

const
 USE_ENUMPORTS_API = False;
 MAX_COMPORT = 36;       // 최대 255 까지
 MAX_LISTCOUNT = 100; //리스트 출력 count

//const
//  KTDelayTime = 3000;

type
  TfmMain = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    btn_Close: TSpeedButton;
    StaticText1: TStaticText;
    btn_CardWriter: TBitBtn;
    btn_CardRead: TBitBtn;
    ed_readCard: TEdit;
    GroupBox3: TGroupBox;
    cmb_ComPort: TComboBox;
    Label1: TLabel;
    ReaderPort: TApdComPort;
    ApdDataPacket1: TApdDataPacket;
    ed_EmpNo: TEdit;
    mem_com: TMemo;
    ed_Seq: TEdit;
    ed_delayTime: TEdit;
    ed_delay: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure btn_CardWriterClick(Sender: TObject);
    procedure btn_CardReadClick(Sender: TObject);
    procedure ApdDataPacket1StringPacket(Sender: TObject; Data: String);
    procedure FormShow(Sender: TObject);
  private
    L_bSendResult : Boolean;
    L_bWait : Boolean;
    L_CardSeq : integer;
    { Private declarations }
    Procedure RcvCardDataByReader(aData:String);
    Function ConvAsciiFormat(aCardNo:string):string;
    Function ConvRecvAsciiToHex(aCardNo:string):string;
    Function InialzeCard:Boolean; //카드 초기화
    Function WriteCardInfo(aCardNo:string):Boolean; //카드 정보 Writer
    Function ACKCheck(aData:string):Boolean;
    Function NACKCheck(aData:string):Boolean;
    Function CardDataRead:Boolean;
  public
    { Public declarations }
    ComPortList : TStringList;
    { Public declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;
  end;

var
  fmMain: TfmMain;
  KTDelayTime : integer;

implementation
uses
  uLomosUtil;

{$R *.dfm}

{ TForm1 }

function TfmMain.DecodeCommportName(PortName: String): WORD;
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

function TfmMain.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmMain.GetSerialPortList(List: TStringList;
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

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  ComPortList := TStringList.Create;
  KTDelayTime := 3000;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ReaderPort.Open := False;
  ApdDataPacket1.Enabled := False;

  ComPortList.Free;

end;

procedure TfmMain.FormActivate(Sender: TObject);
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

end;

procedure TfmMain.cmb_ComPortChange(Sender: TObject);
begin
  if cmb_ComPort.text = '' then Exit;
  if ReaderPort.Open then ReaderPort.Open := False;
  ReaderPort.ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
  ReaderPort.Open := true;
end;

procedure TfmMain.btn_CardWriterClick(Sender: TObject);
var
  stSendData : string;
  stCardNo : string;
begin
  if isDigit(ed_delayTime.Text) then
    KTDelayTime := strtoint(ed_delayTime.Text);
  ed_readCard.Text := '';
  ed_readCard.Color := clWhite;

  stCardNo := ed_EmpNo.Text + ed_Seq.Text;
  if Length(stCardNo) <> 11 then
  begin
    showmessage('사원번호는 9자리 고정입니다.');
    Exit;
  end;
  if Not ReaderPort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  Try
    btn_CardWriter.Enabled := False;
    if Not InialzeCard then
    begin
      if Not InialzeCard then
      begin
        if Not InialzeCard then
        begin
          showmessage('카드 초기화에 실패하였습니다.');
          Exit;
        end;
      end;
    end;
    delay(strtoint(ed_delay.Text));
    if Not WriteCardInfo(stCardNo) then
    begin
      showmessage('카드 발급에 실패하였습니다.');
      Exit;
    end;
    CardDataRead;

    if ed_readCard.Text <> stCardNo then
    begin
      showmessage('카드가 정상적으로 등록되지 않았습니다.');
      Exit;
    end;
    inc(L_CardSeq);
    if L_CardSeq > 99 then L_CardSeq := 1;
    ed_EmpNo.Text := '';
    //ed_seq.Text := FillZeroNumber(L_CardSeq,2);
  Finally
    btn_CardWriter.Enabled := True;
  End;
end;

procedure TfmMain.btn_CardReadClick(Sender: TObject);
//var
//  stSendData : string;
begin
  if isDigit(ed_delayTime.Text) then
    KTDelayTime := strtoint(ed_delayTime.Text);
  Try
    btn_CardRead.Enabled := False;
    ed_readCard.Text := '';
    ed_readCard.Color := clWhite;
    CardDataRead;
  Finally
    btn_CardRead.Enabled := True;
  End;
{  if Not ReaderPort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  stSendData :=   'R' + #$5D;
  ReaderPort.PutString(stSendData);
}
end;

procedure TfmMain.ApdDataPacket1StringPacket(Sender: TObject; Data: String);
begin
  RcvCardDataByReader(Data);
  ApdDataPacket1.Enabled := True;

end;

procedure TfmMain.RcvCardDataByReader(aData: String);
var
  nPos : integer;
begin
  mem_com.Lines.Add('[RX]' + Ascii2Hex(aData));
  nPos := Pos(#$02,aData);
  if nPos = 0 then Exit;
  Delete(aData,1,nPos);

  if ACKCheck(aData) then Exit;
  if NACKCheck(aData) then Exit;
//  if CardReadCheck(aData) then Exit;
  L_bWait := True;
  nPos := Pos(#$03,aData);
  ed_readCard.Text := copy(aData,1,nPos - 1);
  ed_readCard.Color := clYellow;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stYY,stM,stDD,stSeq:string;
begin
  stSeq := '001';
  //ed_EmpNo.Text := FormatDateTime('yyyymmdd',now) + '1';
  L_CardSeq := 1;
  ed_seq.Text := '51';//FillZeroNumber(L_CardSeq,2);

end;

function TfmMain.ConvAsciiFormat(aCardNo: string): string;
var
  stCardNo : string;
  i : integer;
begin
  stCardNo := '';
  for i := 1 to Length(aCardNo) do
  begin
    if IsDigit(aCardNo[i]) then stCardNo := stCardNo + '3' + aCardNo[i]
    else stCardNo := stCardNo + '0' + aCardNo[i];
  end;
  result := stCardNo;
end;

function TfmMain.ConvRecvAsciiToHex(aCardNo: string): string;
var
  stCardNo : string;
  stTemp : string;
  i : integer;
begin
  stCardNo := '';
  for i := 1 to Length(aCardNo) div 2 do
  begin
    stTemp := copy(aCardNo,((i - 1) * 2) + 1,2);
    if strtoint(stTemp) < 40 then stTemp := FillZeroNumber(strtoint(stTemp) - 30,2);
//    if IsDigit(aCardNo[i]) then stCardNo := stCardNo + '3' + aCardNo[i]
//    else stCardNo := stCardNo + '0' + aCardNo[i];
    stCardNo := stCardNo + stTemp;
  end;
  result := stCardNo;

end;

function TfmMain.InialzeCard: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  result := False;
  if Not ReaderPort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  stSendData :=   #$51 + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  ReaderPort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not ReaderPort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if L_bSendResult then Result := true;
end;

function TfmMain.WriteCardInfo(aCardNo: string): Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  result := False;
  if Not ReaderPort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;     
  stSendData :=   'W' + aCardNo + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  ReaderPort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not ReaderPort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if L_bSendResult then Result := true;
end;

function TfmMain.ACKCheck(aData: string): Boolean;
var
  nPos : integer;
begin
  result := False;
  nPos := Pos(#$06,aData); //ACK 가 왔는지 체크
  if nPos = 0 then Exit;
  L_bWait := True;
  L_bSendResult := True;
  result := True;

end;

function TfmMain.NACKCheck(aData: string): Boolean;
var
  nPos : integer;
begin
  result := False;
  nPos := Pos(#$07,aData); //NACK 가 왔는지 체크
  if nPos = 0 then  Exit;
  L_bWait := True;
  L_bSendResult := False;
  result := True;

end;

function TfmMain.CardDataRead: Boolean;
var
  stSendData : string;
  PastTime : dword;
begin
  result := False;
  if Not ReaderPort.Open then
  begin
    showmessage('포트가 오픈되지 않았습니다.');
    Exit;
  end;
  stSendData :=   'R' + #$5D;
  L_bSendResult := False;
  L_bWait := False;
  ReaderPort.PutString(stSendData);
  mem_com.Lines.Add('[TX]' + Ascii2Hex(stSendData));

  PastTime := GetTickCount + KTDelayTime;
  while Not L_bWait do
  begin
    if Not ReaderPort.Open then Exit;
    Application.ProcessMessages;
    if GetTickCount > PastTime then Exit;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  if L_bSendResult then Result := true;
end;

end.
