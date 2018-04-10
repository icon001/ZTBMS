unit uDevice;

interface

uses
  SysUtils, Classes, AdStatLt, OoMisc, AdPort, AdWnPort,AdSocket,
  uCommonVariable, ExtCtrls,ADOdb,ActiveX,Windows,Forms;

type
  TdmDevice = class(TDataModule)
    WinsockPort: TApdWinsockPort;
    ApdSLController1: TApdSLController;
    SendTimer: TTimer;
    PolingTimer: TTimer;
    EventSendingTimer: TTimer;
    procedure WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
      var Accept: Boolean);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure DataModuleCreate(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure SendTimerTimer(Sender: TObject);
    procedure PolingTimerTimer(Sender: TObject);
    procedure EventSendingTimerTimer(Sender: TObject);
  private
    L_stConnectedIP: string;
    L_stComBuff : string;
    L_bCardEventSending : Boolean; //카드 이벤트 전송 중
    FirstSendPacketList : TStringList;
    EventSendPacketList : TStringList;

    FOnSocketAccepted: TSocketEvent;
    FOnDisconnect: TSocketEvent;
    FDeviceID: string;
    FOnSeverStartError: TSocketEvent;
    FOnReceivePacketData: TSocketEvent;
    FOnSendPacketData: TSocketEvent;
    { Private declarations }
  private
    function  PacketFormatCheck(aData: String; var aLeavePacketData:String;var aPacketData:String):integer; //데코더 포맷인지 체크하자.
    function  CheckDataPacket(aData: String; var bData:String;var aPacketData:string):integer;
    function  DataPacektProcess( aPacketData: string):Boolean;
    function  ChekCSData(aData: String;nLength:integer):Boolean;
    function  getCheckSumData(aData:string;nLength:integer):String;
  private
    procedure RemoteControl(aEcuId,aMsgNo,aRealData:string);
    procedure AlaramEventCreate(aEcuId,aMsgNo:string);
    procedure AccessDataProcess(aEcuId,aMsgNo,aRealData:string);
    procedure DoorStateEventCreate(aEcuId,aMsgNo,aDoorNo:string);
    procedure CardRegistration(aEcuId,aMsgNo,aData:string);
    procedure CardEventSendingCompleted;

    function FirstEventCardSending:Boolean;
    function CheckSendingEvent:Boolean;
    function UpdateSendingEvent:Boolean;
    function UpdateTB_RELAYEVENT_State(aCode,aDate,aCardNo,aState:string):Boolean;
  private
    function  SendPacket(aEcuID: String;aCmd:Char; aData: String;aSendMsgNo:string = '0';aQuick:integer=0):Boolean;
    function SendCardEvent(aEcuID,aDoorNo,aReaderNo,aAccessDate,aCardNo:string):Boolean;
  public
    { Public declarations }
    procedure ServerStart;
    procedure ServerStop;
    procedure CardEventSendig;
  published
    property DeviceID : string read FDeviceID write FDeviceID;

    property OnSocketAccepted:      TSocketEvent read FOnSocketAccepted       write FOnSocketAccepted;
    property OnDisconnect:  TSocketEvent read FOnDisconnect       write FOnDisconnect;
    property OnSeverStartError:  TSocketEvent read FOnSeverStartError       write FOnSeverStartError;
    property OnReceivePacketData:  TSocketEvent read FOnReceivePacketData       write FOnReceivePacketData;
    property OnSendPacketData:  TSocketEvent read FOnSendPacketData       write FOnSendPacketData;

  end;

var
  dmDevice: TdmDevice;
  DeviceList : TStringList;

implementation

uses
  uLomosUtil,
  uDBModule;

{$R *.dfm}

{ TdmDevice }

procedure TdmDevice.ServerStart;
begin
  Try
    with WinsockPort do
    begin
      DeviceLayer:= dlWinsock;
      wsAddress:= '127.0.0.1';
      wsPort:=    '3000';
      ApdSLController1.Monitoring:= True;
      OPen:= False;
      Sleep(100);

      wsMode:= wsServer;
      OPen:= True;
      FlushInBuffer;
      FlushOutBuffer;
    end;
  Except
    if Assigned(FOnSeverStartError) then
    begin
      OnSeverStartError(Self,'','','');
    end;
  End;

end;

procedure TdmDevice.ServerStop;
begin
  WinsockPort.Open := False;
  SendTimer.Enabled := False;
  PolingTimer.Enabled := False;
end;

procedure TdmDevice.WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
  var Accept: Boolean);
begin
//  SockErroCode:= 0;

  L_stConnectedIP:= InttoStr(Ord(Addr.S_un_b.s_b1))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b2))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b3))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b4));
  
  if Assigned(FOnSocketAccepted) then
  begin
    OnSocketAccepted(Self,L_stConnectedIP,'','');
  end;
  SendTimer.Enabled := True;
  PolingTimer.Enabled := True;
end;

procedure TdmDevice.WinsockPortWsDisconnect(Sender: TObject);
begin
  if Assigned(FOnDisconnect) then
  begin
    OnDisconnect(Self,L_stConnectedIP,'','');
  end;
  SendTimer.Enabled := False;
  PolingTimer.Enabled := False;

end;

procedure TdmDevice.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  stTemp : string;
  bLoop : Boolean;
  nFormat : integer; //-1: 포맷 모름, 1: STX 포맷,2:SOH 포맷
  stRemaind : string;
  stPacket : string;
  i : integer;
begin
  stTemp:= '';

  for i := 1 to Count do stTemp := stTemp + WinsockPort.GetChar;
  L_stComBuff:= L_stComBuff + stTemp;
  if Trim(L_stComBuff) = '' then Exit;

  bLoop := False;

  repeat

    if L_stComBuff = '' then break;

    nFormat := PacketFormatCheck(L_stComBuff,stRemaind,stPacket);
    {/*
     nFormat : -1 -> 비정상 전문
               -2 -> 길이가 짧은 전문
                1 ->  STX 포맷
                2 ->  SOH 포맷
                3 ->  KTT812 포맷
    */}
    L_stComBuff:= stRemaind;

    if nFormat < 0 then
    begin
      if L_stComBuff = '' then break;
      if nFormat = -1 then  //비정상 전문 인경우
      begin
         Delete(L_stComBuff,1,1);
         continue;
      end else break;   //포맷 길이가 작게 들어온 경우
    end;

    if nFormat <> 1 then      //STX 포맷이 아니면 다시 찾자
    begin
       Delete(L_stComBuff,1,1);
       continue;
    end;

    if stPacket <> '' then
    begin
      DataPacektProcess(stPacket);
    end;

    if pos(ETX,L_stComBuff) = 0 then bLoop := True
    else bLoop := False;

  until bLoop;
end;

function TdmDevice.PacketFormatCheck(aData: String; var aLeavePacketData,
  aPacketData: String): integer;
begin

  aPacketData := '';
  result := -1; //비정상 전문
  if aData[1] = STX then
  begin
    result:= CheckDataPacket(aData,aLeavePacketData,aPacketData);
  end else
  begin
    aLeavePacketData := aData;
  end;
end;

function TdmDevice.CheckDataPacket(aData: String; var bData,
  aPacketData: string): integer;
var
  aIndex: Integer;
  Lenstr: String;
  DefinedDataLength: Integer;
  StrBuff: String;
  etxIndex: Integer;
  aKey: Byte;
  st : string;
begin

  result := -1; //비정상 전문

  aPacketData:= '';
  Lenstr:= Copy(aData,2,3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    bData:= aData;           //한자리 삭제 후  리턴
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < DefinedDataLength then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    bData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[DefinedDataLength] = ETX then
  begin

    StrBuff:= Copy(aData,1,DefinedDataLength);
    // 2010.11.22 패킷 체크 부분에서 체크썸까지 체크로 변경 하기 위해서 작업 함.
    //31:Q++()./,-**s*S^**+()./,-()
    aKey:= Ord(StrBuff[5]);
    st:= Copy(StrBuff,1,5) + EncodeData(aKey,Copy(StrBuff,6,Length(StrBuff)-6))+StrBuff[Length(StrBuff)];

    if Not ChekCSData(st,Length(StrBuff)) then
    begin
      //Delete(aData,1,1);
      bData:= aData;
      Exit;
    end;
    // 2010.11.22 패킷 체크 부분에서 체크썸까지 체크로 변경 하기 위해서 작업 함.

    result := 1; //STX 포맷이 맞다
    Delete(aData, 1, DefinedDataLength);
    bData:= aData;
    aPacketData:=st;
  end else
  begin
    //마직막 데이터가 EXT가 아니면 1'st STX지우고 다음 STX를 찾는다.
    bData:= aData;
  end;
end;

function TdmDevice.DataPacektProcess(aPacketData: string): Boolean;
var
  aKey: Byte;
  stTemp: string;
  aCommand: Char;
  stEcuId: String;
  DeviceIndex: Integer;
  StatusCode: String;
  stMsgNo : string;
  stRealData : string;
begin
  if aPacketData = '' then Exit;
  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aPacketData[5]);
  stTemp:= Copy(aPacketData,1,5) + EncodeData(aKey,Copy(aPacketData,6,Length(aPacketData)-6));
  aPacketData:= stTemp;

  if Assigned(FOnReceivePacketData) then
  begin
    OnReceivePacketData(Self,L_stConnectedIP,aPacketData,'');
  end;

  stEcuId:= Copy(aPacketData,15,2);
  aCommand:= aPacketData[17];
  stMsgNo:= aPacketData[18];
  stRealData := copy(aPacketData,19,Length(aPacketData) - 18);

  StatusCode:= Copy(aPacketData,41,2);

  case aCommand of
    'a': begin //Ack Data
          // 무시하면 됨
         end;
    'c': begin // 출입 데이터 - 이벤트 Ack 및 카드 등록
          // 카드 등록,출입문 상태 처리
          AccessDataProcess(stEcuId,stMsgNo,stRealData);
         end;
    'R': begin //원격제어
          //rd00 인 경우 방범상태 만들어서 전송하자.
          RemoteControl(stEcuId,stMsgNo,stRealData);
         end;
    'Q': begin // 기기설정정보조회
          // 무시하면 됨
         end;
    'I': begin  //등록
          // 무시하면 됨
         end;
  end;

end;

function TdmDevice.ChekCSData(aData: String; nLength: integer): Boolean;
var
  stCheckSum : string;
  stMakeCS : string;
begin
  result := False;
  stCheckSum := getCheckSumData(aData,nLength);
  stMakeCS := MakeCSData(copy(aData,1,nLength - 3) + ETX);
  if stMakeCS = stCheckSum then result := True;
end;

function TdmDevice.getCheckSumData(aData: string;
  nLength: integer): String;
begin
  result := copy(aData,nLength - 2,2);
end;

function TdmDevice.SendPacket(aEcuID: String; aCmd: Char;
  aData: String;aSendMsgNo:string = '0';aQuick:integer=0): Boolean;
var
  ACKStr: String;
  ACKStr2: String;
  aDataLength: Integer;
  aLengthStr: String;
  aKey:Integer;
  amsgData : String;
  st: string;
  DecorderFormat : string;
  i : integer;
  stDeviceID : string;
begin

  Result := False;
  stDeviceID := DeviceID + aEcuID;

  if not WinsockPort.Open then
  begin
    Exit;
  end;

  Result:= False;
  aDataLength:= (G_nIDLength + 14) + Length(aData);
  aLengthStr:= FillZeroNumber(aDataLength,3);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr:= STX +aLengthStr+  #$20+ 'K1' + stDeviceID+ aCmd+ aSendMsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end else           {제어 or 등록 }
  begin
    ACkStr:= STX +aLengthStr+ #$20+ 'K1' + stDeviceID+ aCmd+ aSendMsgNo +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= Ord(ACkStr[5]);
    ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;
  end;

  if aQuick = 0 then FirstSendPacketList.Add(ACkStr2)
  else if aQuick = 1 then EventSendPacketList.Add(ACkStr2);

  Result:= True;
end;

procedure TdmDevice.DataModuleCreate(Sender: TObject);
begin
  FirstSendPacketList := TStringList.Create;
  EventSendPacketList := TStringList.Create;
  DeviceID := '0000000';
end;

procedure TdmDevice.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
begin
  if Assigned(FOnSeverStartError) then
  begin
    OnSeverStartError(Self,inttostr(ErrCode),'','');
  end;
  ServerStop;
  Delay(1000);
  ServerStart;
end;

procedure TdmDevice.SendTimerTimer(Sender: TObject);
var
  stSendData : string;
begin
  Try
    SendTimer.Enabled := False;
    if Not WinsockPort.Open then Exit;
    stSendData := '';
    if FirstSendPacketList.Count > 0 then
    begin
      stSendData := FirstSendPacketList.Strings[0];
      FirstSendPacketList.Delete(0);
    end else if EventSendPacketList.Count > 0 then
    begin
      stSendData := EventSendPacketList.Strings[0];
      EventSendPacketList.Delete(0);
    end;
    if stSendData <> '' then
    begin
      WinsockPort.PutString(stSendData);
      if Assigned(FOnSendPacketData) then
      begin
        OnSendPacketData(Self,L_stConnectedIP,stSendData,'');
      end;
    end;
  Finally
    SendTimer.Enabled := True;
  End;
end;

procedure TdmDevice.PolingTimerTimer(Sender: TObject);
begin
  SendPacket('00','e','');
end;

procedure TdmDevice.RemoteControl(aEcuId, aMsgNo, aRealData: string);
var
  stSubCmd : string;
begin
  stSubCmd := copy(aRealData,1,4);
  if UpperCase(stSubCmd) = 'RD00' then
  begin
    AlaramEventCreate(aEcuId,aMsgNo);
  end;
end;

procedure TdmDevice.AlaramEventCreate(aEcuId, aMsgNo: string);
var
  i : integer;
  stData : string;
begin
//058 K1000000000ohn20111227180222MN0000d00***000000000091
  for i := 0 to DeviceList.Count - 1 do
  begin
    stData := 'n' + formatDateTime('yyyymmddhhnnss',now) + 'MN0000d00***0000000000';
    SendPacket(DeviceList.Strings[i],'o',stData,aMsgNo);
  end;
end;

procedure TdmDevice.AccessDataProcess(aEcuId, aMsgNo, aRealData: string);
var
  cSubCmd : char;
  stDoorNo : string;
begin
  cSubCmd := aRealData[1];

  case cSubCmd of
      'L','M','N','J','F' :   //카드등록 포맷 처리
      begin
        aRealData[1] := LowerCase(aRealData[1])[1];
        CardRegistration(aEcuId,aMsgNo,copy(aRealData,1,length(aRealData) - 2));
      end;
      'C' :   //출입문 상태 확인
      begin
        stDoorNo := aRealData[3];
        DoorStateEventCreate(aEcuId,aMsgNo,stDoorNo);
      end;
      'Y' :   //카드 이벤트 ACK
      begin
        CardEventSendingCompleted;
        L_bCardEventSending := False;
      end;
  end;
end;

procedure TdmDevice.DoorStateEventCreate(aEcuId, aMsgNo,aDoorNo: string);
var
  stData : string;
begin
  stData := 'c0' + aDoorNo + '0000C';
  SendPacket(aEcuId,'c',stData,aMsgNo);
end;

procedure TdmDevice.CardRegistration(aEcuId, aMsgNo, aData: string);
begin
  SendPacket(aEcuId,'c',aData,aMsgNo);
end;

procedure TdmDevice.CardEventSendig;
begin
  EventSendingTimer.Enabled := True;
end;

procedure TdmDevice.EventSendingTimerTimer(Sender: TObject);
var
  bResult : Boolean;
begin
  //여기에서 카드 이벤트 전송 하자.
  if L_bCardEventSending then Exit; //카드데이터 전송 중이면
  EventSendingTimer.Enabled := False;
  Try
    L_bCardEventSending := True;

    bResult := FirstEventCardSending; //송신할 데이터가 없으면 bResult 는 True;
  Finally
    if Not bResult then EventSendingTimer.Enabled := True;
    L_bCardEventSending := False;
  End;
end;

procedure TdmDevice.CardEventSendingCompleted;
var
  stSql : string;
begin
  //카드 전송 완료 처리
  stSql := 'Delete From TB_RELAYEVENT  Where RE_SEND = ''S'' ';
  dmDBModule.ProcessExecSQL(stSql);
end;

function TdmDevice.FirstEventCardSending: Boolean;
var
  stSql : string;
  bResult : Boolean;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  bResult := False;
  if Not CheckSendingEvent then //전송중인 카드데이터가 있는가? 있으면 그걸 보내야지
  begin
    bResult := UpdateSendingEvent; //없으면 한개의 Event 를 전송 중으로 변경하자.
  end else bResult := True;

  if Not bResult then
  begin
    result := True; //전송할 데이터가 없으면   종료 하자.
    Exit;
  end;

  stSql := 'Select ';
  if G_stDBType = 'MSSQL' then stSql := stSql + ' top 1 ';
  stSql := stSql + ' * ';
  stSql := stSql + ' from TB_RELAYEVENT a ';
  stSql := stSql + ' Left Join TB_RELAYDEVICEMAPPINGCODE b ';
  stSql := stSql + ' ON(a.RM_CODE = b.RM_CODE) ';
  stSql := stSql + ' Where a.RE_SEND = ''S'' ';
  if G_stDBType = 'PG' then stSql := stSql + ' LIMIT 1 OFFSET 0 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      while Not Eof do
      begin
        SendCardEvent(FindField('RM_ECUID').asstring,
                      FindField('RM_DOORID').asstring,
                      FindField('RM_READERID').asstring,
                      FindField('RE_DATE').asstring,
                      FindField('RE_CARDNO').asstring);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDevice.SendCardEvent(aEcuID, aDoorNo, aReaderNo, aAccessDate,
  aCardNo: string): Boolean;
var
  xCardNo : string;
  nCardLength : integer;
  stSendData : string;
  FirstTickCount : Double;
begin
  result := False;
  if Trim(aEcuID) = '' then aEcuID := '00';
  if Trim(aDoorNo) = '' then aDoorNo := '1';
  if Trim(aReaderNo) = '' then aReaderNo := '1';
  if Trim(aAccessDate) = '' then aAccessDate := FormatDateTime('yyyymmddhhnnss',now);
  Delete(aAccessDate,1,2);
  
  if Trim(aCardNo) = '' then
  begin
    CardEventSendingCompleted; //전송중인 카드 데이터 삭제 후 빠져 나감.
    L_bCardEventSending := False;
    Exit;
  end;

  if G_nCARDLENGTHTYPE = 0 then //고정 4Byte 타입이면
  begin
    if G_nSaveCardType = 0 then  //시리얼 Hex
    begin
      aCardNo := FillZeroNumber(Hex2Dec64(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end else
    begin
      //ASCII 타입을 시리얼로 송신 할 수 없다.
      aCardNo := Ascii2Hex(aCardNo);
      if Length(aCardNo) > 8 then aCardNo := copy(aCardNo,1,8);
      aCardNo := FillZeroNumber(Hex2Dec64(aCardNo),10);
      xCardNo:=  '00'+EncodeCardNo(aCardNo);
    end;
    xCardNo := FillZeroStrNum(Trim(xCardNo),10);
  end else if G_nCARDLENGTHTYPE = 1 then  // Length Type ASCII
  begin
    xCardNo := aCardNo;
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end else if G_nCARDLENGTHTYPE = 2 then  // KT타입
  begin
    xCardNo := Ascii2Hex(aCardNo,False,True);
    nCardLength := Length(xCardNo);
    xCardNo := FillzeroNumber(nCardLength,2) + xCardNo;
  end;

  stSendData := 'E' +
                '0' +
                aDoorNo[1] +
                aReaderNo[1] +
                '0' +
                aAccessDate +
                '0' +
                '0' +
                'C' +
                '1' +
                'C' +
                '0' +
                xCardNo;

  SendPacket(aEcuId,'c',stSendData,'0');

  FirstTickCount := GetTickCount + 3000; //3초 대기
  while L_bCardEventSending do
  begin
    if G_bApplicationTerminate then Exit;
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;
  
  result := L_bCardEventSending;

end;

function TdmDevice.CheckSendingEvent: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  stSql := 'Select * ';
  stSql := stSql + ' from TB_RELAYEVENT  ';
  stSql := stSql + ' Where RE_SEND = ''S'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDevice.UpdateSendingEvent: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  //한개의 상태만 'S' 로 돌리자
  stSql := 'Select * ';
  stSql := stSql + ' from TB_RELAYEVENT  ';
  stSql := stSql + ' Order by RE_DATE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount < 1 then Exit;
      First;
      result := UpdateTB_RELAYEVENT_State(FindField('RM_CODE').AsString,
                                FindField('RE_DATE').AsString,
                                FindField('RE_CARDNO').AsString,
                                'S');
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmDevice.UpdateTB_RELAYEVENT_State(aCode, aDate, aCardNo,
  aState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_RELAYEVENT set RE_SEND = ''' + aState + ''' ';
  stSql := stSql + ' Where RM_CODE = ''' + aCode + ''' ';
  stSql := stSql + ' AND RE_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND RE_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

end.
