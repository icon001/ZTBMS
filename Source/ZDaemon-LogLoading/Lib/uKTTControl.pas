{/*
  Lan으로  KT관제 센터와 통신하기 위한 모듈
  1.이벤트 발생시 KT관제센터에 접속하여 이벤트 전송
  2.관제센터에서 원격제어시 로컬PC에 접속하여 원격 제어
*/}
unit uKTTControl;

interface

uses
  SysUtils,Windows, Classes, DXUnicastDataQueue, DXString, DXServerCore, OoMisc,
  AdPort, AdWnPort, ExtCtrls,ActiveX,ADODB,Forms,AdSocket,uDataModule1;

const
  KTTRECEIVEDELAYTIME = 2000;
  ClientConnectTime = 60000;

type
  TdmKTTControl = class(TDataModule)
    KTTControlSERVER: TDXServerCore;
    DXUnicastDataQueue1: TDXUnicastDataQueue;
    ClientSocket: TApdWinsockPort;
    KTTServerSendTimer: TTimer;
    PamCyleTimer: TTimer;
    PamSockPort: TApdWinsockPort;
    procedure KTTServerSendTimerTimer(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure ClientSocketTriggerAvail(CP: TObject; Count: Word);
    procedure KTTControlSERVERNewConnect(ClientThread: TDXClientThread);
    procedure PamCyleTimerTimer(Sender: TObject);
    procedure PamSockPortTriggerAvail(CP: TObject; Count: Word);
    procedure PamSockPortWsConnect(Sender: TObject);
    procedure ClientSocketWsConnect(Sender: TObject);
    procedure ClientSocketWsDisconnect(Sender: TObject);
    procedure ClientSocketWsError(Sender: TObject; ErrCode: Integer);
    procedure PamSockPortWsError(Sender: TObject; ErrCode: Integer);
  private
    FServerUses: Boolean;
    FKttServerIP: string;
    FKttServerPort: Integer;
    FClientServerPort: Integer;
    FKTTPamCycle: Integer;
    FOnEvent: TKTTEvent;
    procedure SetServerUses(const Value: Boolean);
    procedure SetClientServerPort(const Value: Integer);
    procedure SetKTTPamCycle(const Value: Integer);
    { Private declarations }
  private
    L_bKttEventSending : Boolean; //전송 중이면 다시 타지 말자.
    L_bEventReceive : Boolean;    //이벤트 전송 후 수신 되었는지 확인
    L_nEventAckResult : integer;  // 1.정상,2.ESYN,3.EMAL
    L_stEventComBuffer : string;
    L_bAllPamDataSending : Boolean;  //PAM(회선체크) 타이머에 의한 데이터 전송유무
    L_bPamDataSending : Boolean;  //PAM(회선체크) 데이터 전송유무
    L_bPAMConnected : Boolean;    //PAM(회선체크) Connection 상태
    L_bEventConnected : Boolean;    //Event Connection 상태
    L_nSeq : integer;
    function KTTServerSocketConnect:Boolean;
    function KTTEventSending : integer;
    function UpdateTB_AlarmEventKttSendStatus(aDate,aTime,aNodeNo,aEcuID,aMsgNo,aRcvAck:string):Boolean;
    function UpdateTB_CURRENTDAEMONKttSendSeq : Boolean;
    function KTTSendPacket(aLINKUSID,aMUXID,aDECODERID,aKTTFUNCODE,
                           aKTTEVENTCODE,aDATE,aTIME,aECUID,aSUBADDR,
                           aZONENO,aOPERATOR:string):integer;
    function KTTCenter_SendPacket(aLINKUSID,aMUXID,aDECODERID,aKTTFUNCODE,
                           aKTTEVENTCODE,aDATE,aTIME,aECUID,aData:string):integer;
  private
    function GetKTPartHeader(aMUXID,aDECODERID,aLINKUSID,aECUID:string):string;
    function GetKTTPartHeader(aKTTFUNCODE,aDATE, aTIME,aMUXID,aDECODERID,aLINKUSID,aECUID:string):string;
    function GetDetailData(aKTTEVENTCODE,aSUBADDR,aZONENO,aCardData:string):string;
    function GetCardPositionNum(aCardNo:string):string;

  private
    //Packet 수신
    function PacketFormatCheck(aData:string; var aLeavePacketData,aPacketData:string):integer;
    procedure EventDataPacketProcess(aPacketData:string);
    procedure KTTControlDataPacketProcess(aPacketData:string;ClientThread: TDXClientThread);
  private
    //관제 제어 수신응답
    procedure SendKTTDeviceStateAck(aVer,aFuncode,aDate,aUserID,aSeq:string;ClientThread: TDXClientThread);
    function GetArmModeState(aUserID,aEcuID:string):string;
    procedure DeviceArmModeChange(aUserID,aEcuID,aMode:string);
    procedure DeviceReset(aVer,aFuncode,aDate,aUserID,aSeq:string;ClientThread: TDXClientThread);
  private
    function PamServerSocketConnect:Boolean;
    function PamDataSendPacket(aUserID:string;aClientServerPort:integer):integer;
  public
    KTTIDList : TStringList;
    NodeIDList : TStringList;
    { Public declarations }
    procedure ListClear;
    procedure DeviceAdd(aKTTID:string;aNodeNo:string);
    procedure LoadLastnSeq;
    procedure AlarmEventProcess;
  public
    property SERVERUSES :Boolean read FServerUses write SetServerUses;
    property KTTServerIP:string read FKttServerIP write FKttServerIP;
    property KTTServerPort:Integer read FKttServerPort write FKttServerPort;
    property ClientServerPort:Integer read FClientServerPort write SetClientServerPort;
    property KTTPamCycle:Integer read FKTTPamCycle write SetKTTPamCycle;

    property OnEvent:      TKTTEvent read FOnEvent       write FOnEvent;

  end;

var
  dmKTTControl: TdmKTTControl;

implementation

uses
  uLomosUtil,
  uDevicemodule;

{$R *.dfm}

procedure TdmKTTControl.SetServerUses(const Value: Boolean);
begin
  if Value = FServerUses then Exit;
  FServerUses := Value;
  KTTServerSendTimer.Enabled := Value;
  PamCyleTimer.Enabled := Value;
  if Value then
    KTTControlSERVER.Start
  else KTTControlSERVER.Stop;
end;

procedure TdmKTTControl.KTTServerSendTimerTimer(Sender: TObject);
var
  nResult : integer;
begin
  if Not ServerUses then
  begin
    KTTServerSendTimer.Enabled := False;
    Exit;
  end;
  if L_bKttEventSending then Exit; //전송중이면 다음 기회에...
  //버퍼에 전송할 데이터가 있으면 데이터를 전송 한다.
  Try
    KTTServerSendTimer.Enabled := False;
    nResult := KTTEventSending;
    if nResult < 0 then  //접속 실패시 3초 대기 후 재전송
    begin
      KTTServerSendTimer.Interval := 3000;
      KTTServerSendTimer.Enabled := True; //5초 후 재전송하자
    end else if nResult = 0 then  //1초동안 응답이 없는 경우
    begin
      KTTServerSendTimer.Interval := 5000;
      KTTServerSendTimer.Enabled := True; //5초 후 재전송하자
    end;
  Except

  End;
end;

procedure TdmKTTControl.DataModuleCreate(Sender: TObject);
begin
  KTTIDList := TStringList.Create;
  NodeIDList := TStringList.Create;
end;

procedure TdmKTTControl.DataModuleDestroy(Sender: TObject);
begin
  KTTIDList.Free;
  NodeIDList.Free;
end;

procedure TdmKTTControl.DeviceAdd(aKTTID: string; aNodeNo: string);
var
  nIndex : integer;
begin
  nIndex := KTTIDList.IndexOf(aKTTID);
  if nIndex > -1 then Exit;
  KTTIDList.Add(aKTTID);
  NodeIDList.Add(aNodeNo);
end;

function TdmKTTControl.KTTEventSending: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nResult : integer;
  i : integer;
begin
  result := -1;   //3초 후에 다시 송신해야 하는 경우
  if L_bKttEventSending then Exit;
  L_bKttEventSending := True;

  stSql := 'Select a.*,b.AC_LINKUSID,b.AC_MUXID,b.AC_DECODERID,c.KTTFUNCODE,c.KTTEVENTCODE from TB_ALARMEVENT a ';
  stSql := stSql + ' INNER Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' INNER Join (select * from TB_KTTMAPPINGCODE where senduse = ''Y'') c ';
  stSql := stSql + ' ON(a.AL_ALARMDEVICETYPECODE = c.AL_ALARMDEVICETYPECODE ';
  stSql := stSql + ' AND a.AL_ALARMMODECODE = c.AL_ALARMMODECODE ';
  stSql := stSql + ' AND a.AL_STATUSCODE2 = c.AL_ALARMSTATUSCODE2 ) ';
  stSql := stSql + ' where a.AL_KTTSENDSTATUS = ''N'' ';
  stSql := stSql + ' order by a.al_updatetime ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if recordCount < 1 then
      begin
        result := 1;  //전송할게 없으면 종료
        Exit;
      end;
      

      while Not Eof do
      begin
        if FindField('AC_LINKUSID').AsString = '' then
        begin
          UpdateTB_AlarmEventKttSendStatus(FindField('AL_DATE').AsString,
                                           FindField('AL_TIME').AsString,
                                           inttostr(FindField('AC_NODENO').AsInteger),
                                           FindField('AC_ECUID').AsString,
                                           FindField('AL_MSGNO').AsString,
                                           'E'); //Error 처리 하고 보내지 말자.
        end else
        begin

          if Not KTTServerSocketConnect then Exit; //Server Connect 실패시 빠져 나간 후 3초 후에 재시도
          for i := 0 to 2 do
          begin
            nResult := KTTSendPacket(FindField('AC_LINKUSID').AsString,
                                 FindField('AC_MUXID').AsString,
                                 FindField('AC_DECODERID').AsString,
                                 FindField('KTTFUNCODE').AsString,
                                 FindField('KTTEVENTCODE').AsString,
                                 FindField('AL_DATE').AsString,
                                 FindField('AL_TIME').AsString,
                                 FindField('AC_ECUID').AsString,
                                 FindField('AL_SUBADDR').AsString,
                                 FindField('AL_ZONENO').AsString,
                                 FindField('AL_OPERATOR').AsString);
            if nResult <> 2 then break; //ESYN 인 경우에는 3회 송신 해 보자.
          end;
          Try
            ClientSocket.Open := False;
          Except
          End;

          if nResult <> 1 then
          begin
            Result := nResult;
            if (nResult = -2) or (nResult = 2) or (nResult = 3) then  //전문생성 실패,ESYN 로 3회 송신 했는데도 역시 ESYN 로 뜨거나 EMAL 인 경우
              UpdateTB_AlarmEventKttSendStatus(FindField('AL_DATE').AsString,
                                               FindField('AL_TIME').AsString,
                                               inttostr(FindField('AC_NODENO').AsInteger),
                                               FindField('AC_ECUID').AsString,
                                               FindField('AL_MSGNO').AsString,
                                               'E'); //Error 처리 하고 보내지 말자.

            Exit;  //송신 실패시 다음 기회에...
          end;

          if Not UpdateTB_AlarmEventKttSendStatus(FindField('AL_DATE').AsString,
                                           FindField('AL_TIME').AsString,
                                           inttostr(FindField('AC_NODENO').AsInteger),
                                           FindField('AC_ECUID').AsString,
                                           FindField('AL_MSGNO').AsString,
                                           'Y') then //송신 성공 처리 하고 다음을 처리 하자.
          begin
            Exit; //송신성공 마크 실패시 다시 전송 하자
          end;
          UpdateTB_CURRENTDAEMONKttSendSeq;
          Delay(100);
          inc(L_nSeq);
          if L_nSeq > 9999 then L_nSeq := 1;
        end;
        Next;
        Application.ProcessMessages;
        Delay(200);
      end;
      result := 1; //전송 완료
    End;

  Finally
    L_bKttEventSending := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmKTTControl.UpdateTB_AlarmEventKttSendStatus(aDate, aTime,
  aNodeNo, aEcuID, aMsgNo, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMEVENT set AL_KTTSENDSTATUS = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aMsgNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql,True);
end;

function TdmKTTControl.KTTSendPacket(aLINKUSID, aMUXID, aDECODERID,
  aKTTFUNCODE, aKTTEVENTCODE, aDATE, aTIME, aECUID, aSUBADDR, aZONENO,
  aOPERATOR: string): integer;
var
  stKTPartHeader : string;
  nKTPartLen : integer;
  stKTTPartHeader : string;
  nKTTPartLen : integer;
  stDetailData : string;
  stSendData : string;

  PastTime : dword;
begin
  result := -1; //초기 실패시 3초 대기후 재송신
{  if Length(aMUXID) <> 2 then aMUXID := FillZeroStrNum(aMUXID,2);
  if Length(aDECODERID) <> 5 then aDECODERID := FillZeroStrNum(aDECODERID,5,False);
  if Length(aLINKUSID) <> 4 then aLINKUSID := FillZeroStrNum(aLINKUSID,4);
  if Length(aECUID) <> 2 then aECUID := FillZeroStrNum(aECUID,2);
  stKTPartHeader := GetKTPartHeader(aMUXID,aDECODERID,aLINKUSID,aECUID);
  stKTTPartHeader := GetKTTPartHeader(aKTTFUNCODE,aDATE, aTIME,aMUXID,aDECODERID,aLINKUSID,aECUID);
  nKTTPartLen := Length(stDetailData);
  stKTTPartHeader := stKTTPartHeader + FillZeroNumber(nKTTPartLen,4);
  nKTPartLen := nKTTPartLen + 41;
  stKTPartHeader := stKTPartHeader + FillZeroNumber(nKTPartLen,4);

  stSendData := stKTPartHeader + stKTTPartHeader + stDetailData + ETX;
}
  if Not ClientSocket.Open then Exit;
  L_bEventReceive := False;
  L_nEventAckResult := 0;
  stDetailData := GetDetailData(aKTTEVENTCODE,aSUBADDR,aZONENO,aOPERATOR);
  if stDetailData = '' then
  begin
    result := -2; //정상적인 전문을 만들지 못함
    Exit;
  end;
  KTTCenter_SendPacket(aLinkusid,aMuxID,aDecoderID,aKttFuncode,aKttEventCode,aDate,aTime,aEcuID,stDetailData);

  PastTime := GetTickCount + KTTRECEIVEDELAYTIME;  //응답이 올때 까지 대기하자.  1초 대기
  while Not L_bEventReceive do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then
    begin
      result := 0; //1초 대기후 응답이 없는 경우 5초 후에 재송신
      Exit;  //3000밀리동안 응답 없으면 실패로 처리함
    end;
  end;
  if L_bEventReceive then
  begin
    result := L_nEventAckResult;
  end;
end;

function TdmKTTControl.GetKTPartHeader(aMUXID, aDECODERID, aLINKUSID,
  aECUID: string): string;
begin
  result := 'KT' + 'K1' + aMUXID + aDECODERID + aLINKUSID + aECUID;
end;

procedure TdmKTTControl.LoadLastnSeq;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  L_nSeq := 1;
  stSql := 'select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' Where CU_STATECODE = ''KTALARMSEQ'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      //sql.Clear;
      sql.Text := stSql;

      Try
        Open;
      Except
        //에러처리
        Exit;
      End;
      if recordCount < 1 then Exit;
      First;
      if Not FindField('CU_STATEVALUE').IsNull then
        L_nSeq := strtoint(FindField('CU_STATEVALUE').AsString) + 1;

    End;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmKTTControl.UpdateTB_CURRENTDAEMONKttSendSeq: Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CURRENTDAEMON set CU_STATEVALUE = ''' + inttostr(L_nSeq) + ''' ';
  stSql := stSql + ' Where CU_STATECODE = ''KTALARMSEQ'' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TdmKTTControl.GetKTTPartHeader(aKTTFUNCODE, aDATE, aTIME, aMUXID,
  aDECODERID, aLINKUSID, aECUID: string): string;
begin
  result := STX + KTTPARTVER + aKTTFUNCODE + aDATE + aTIME + aMUXID + aDECODERID + aLINKUSID + aECUID + FillZeroNumber(L_nSeq,4);
end;

function TdmKTTControl.KTTServerSocketConnect: Boolean;
var
  WaitTickCount : Double;
begin
  result := False;
  if Trim(KTTServerIP) = '' then Exit;
  if KTTServerPort = 0 then Exit;
  
  with ClientSocket do
  begin
    DeviceLayer:= dlWinsock;
    wsAddress:= KTTServerIP;
    wsPort:=    inttostr(KTTServerPort);
    wsMode:=    wsClient;
    Try
      OPen:= False;
      Sleep(200);
      L_bEventConnected := False;
      Open := True;
    Except
      Exit;
    End;
    WaitTickCount := GetTickCount + 1000; //1초 대기
    While Not L_bEventConnected do
    begin
      Application.ProcessMessages;
      if GetTickCount > WaitTickCount then Break;
    end;
    result := L_bEventConnected;

  end;
end;

function TdmKTTControl.GetDetailData(aKTTEVENTCODE, aSUBADDR, aZONENO,
  aCardData: string): string;
var
  stDetailData : string;
  stZZZZ : string;
begin
  stDetailData := '';
  stZZZZ := '';
  stDetailData := FillZeroStrNum(stDetailData,15); //Event Code Detail Data 영역을 '0' 로 설정
  stZZZZ := FillZeroStrNum(stZZZZ,4);

  if (aKTTEVENTCODE = 'E400') or (aKTTEVENTCODE = 'R400') then
  begin
    stZZZZ := GetCardPositionNum(aCardData);
    if stZZZZ = '0000' then Exit;
  end else if (aKTTEVENTCODE = 'E130') or (aKTTEVENTCODE = 'R130') then stZZZZ := FillZeroStrNum(aZONENO,4)
  else if (aKTTEVENTCODE = 'E138') or (aKTTEVENTCODE = 'R138') or
          (aKTTEVENTCODE = 'E136') or (aKTTEVENTCODE = 'R136') then stZZZZ := FillZeroStrNum(aSUBADDR,2) + '00'
  else if (aKTTEVENTCODE = 'E701') or (aKTTEVENTCODE = 'R701') then stZZZZ :='0000';// FillZeroNumber(strtoint(aSUBADDR) + 15,4);

  result := aKTTEVENTCODE + stDetailData + stZZZZ;

end;

function TdmKTTControl.GetCardPositionNum(aCardNo: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nPositionNum : integer;
  stCardNo : string;
begin
  result := FillZeroNumber(0,4);
  Try
    stSql := 'Select * from TB_CARD ';
    stSql := stSql + ' Where CA_CARDNO = ''' + FillZeroNumber2(Hex2Dec64(Trim(aCardNo)),10) + ''' ';
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        sql.Text := stSql;

        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if recordCount < 1 then  Exit;
        First;
        //result := Dec2Hex(FindField('PositionNum').AsInteger,4);
        result := FillZeroNumber(FindField('PositionNum').AsInteger,4);
      End;

    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;

end;

procedure TdmKTTControl.ClientSocketTriggerAvail(CP: TObject; Count: Word);
var
  stTemp: string;
  i: Integer;
  bLoop : Boolean;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
begin
  stTemp := '';
  for i := 1 to Count do
  begin
    stTemp := stTemp + TApdWinsockPort(CP).GetChar;
  end;

  L_stEventComBuffer := L_stEventComBuffer + stTemp;

  bLoop := False;
  repeat
    if Trim(L_stEventComBuffer) = '' then Exit;
    nFormat := PacketFormatCheck(L_stEventComBuffer,stLeavePacketData,stPacketData);
    {/*
     nFormat : -1 -> 비정상 전문
               -2 -> 길이가 짧은 전문
                1 ->  STX 포맷
                2 ->  SOH 포맷
    */}
    L_stEventComBuffer:= stLeavePacketData;

    if nFormat < 0 then
    begin
      if L_stEventComBuffer = '' then break;
      if nFormat = -1 then  //비정상 전문 인경우
      begin
         Delete(L_stEventComBuffer,1,1);
         continue;
      end else break;   //포맷 길이가 작게 들어온 경우
    end;

    if stPacketData <> '' then EventDataPacketProcess(stPacketData);

    if pos(ETX,L_stEventComBuffer) = 0 then bLoop := True
    else bLoop := False;

  until bLoop;

end;

function TdmKTTControl.PacketFormatCheck(aData: string;
  var aLeavePacketData, aPacketData: string): integer;
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
  if copy(aData,1,4) <> 'KTK1' then //처음 4자리는 'KTK1' 임
  begin
    aLeavePacketData := aData;
    Exit;
  end;
  Lenstr:= Copy(aData,18,4);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    aLeavePacketData:= aData;
    Exit;
  end;

  //패킷에 정의된 길이
  DefinedDataLength:= StrtoInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < (DefinedDataLength + 21) then
  begin
    result := -2; //자릿수가 작게 들어온 경우
    aLeavePacketData:= aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  //if aData[DefinedDataLength + 21] = ETX then
  if aData[DefinedDataLength + 21] <> '' then
  begin
    result := 1; //STX 포맷이 맞다

    StrBuff:= Copy(aData,1,DefinedDataLength + 21);
    Delete(aData, 1, DefinedDataLength + 21);
    aLeavePacketData:= aData;
    aPacketData:=StrBuff;
  end else
  begin
    aLeavePacketData:= aData;
  end;
end;

procedure TdmKTTControl.EventDataPacketProcess(aPacketData: string);
var
  stKTPartHeader : string;
  stKTTPartData : string;
  stKTTSubData : string;
  nTemp : integer;
begin
  stKTPartHeader := copy(aPacketData,1,21);
  Delete(aPacketData,1,21);
  stKTTPartData := aPacketData;
  if Not isDigit(copy(stKTTPartData,37,4)) then Exit;
  nTemp := strtoint(copy(stKTTPartData,37,4));
  stKTTSubData := copy(stKTTPartData,41,nTemp);

  L_bEventReceive := True;
  if stKTTSubData = 'EACK' then
  begin
    L_nEventAckResult := 1;
  end else if stKTTSubData = 'ESYN' then
  begin
    L_nEventAckResult := 2;
  end else if stKTTSubData = 'EMAL' then
  begin
    L_nEventAckResult := 3;
  end;
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'eRx',KTTServerIP,aPacketData,'');
  end;

end;

procedure TdmKTTControl.AlarmEventProcess;
begin
  KTTServerSendTimer.Interval := 10;
  KTTServerSendTimer.Enabled := True;
end;

procedure TdmKTTControl.KTTControlSERVERNewConnect(
  ClientThread: TDXClientThread);
Var
  Ws:String;
  Sock: Integer;
  StartTime:Comp;
  stIP : string;
  stLeavePacketData : string;
  stPacketData : string;
  nFormat : integer;
  bLoop : Boolean;
  i : integer;
begin
  Sock:=ClientThread.Socket.Sock; // store it ASAP, dropped connections set .Sock=-1;
  stIP := ClientThread.Socket.PeerIPAddress;
  Try
    DXUnicastDataQueue1.AddSock(Sock);
    StartTime:=TimeCounter+ ClientConnectTime;
    ws:='';
    if Assigned(FOnEvent) then
    begin
      OnEvent(Self,'CONTROL',stIP,'Connected','');
    end;
    While ClientThread.Socket.Connected and (not DXString.Timeout (StartTime) ) do
    Begin
      If Application.Terminated then
      Begin
        Try
          ClientThread.Socket.CloseNow;
        Except
        End;
        if Assigned(FOnEvent) then
        begin
          OnEvent(Self,'CONTROL',stIP,'DisConnected','');
        end;
        Exit;
      End;
      If ClientThread.Socket.Readable then
      Begin
        If ClientThread.Socket.CharactersToRead=0 then
        begin
          Break;
        end else
        begin
          for I:= 1 to ClientThread.Socket.CharactersToRead do
          begin
            Ws:= Ws + ClientThread.Socket.Read ;
          end;
          
          bLoop := False;
          repeat
            if Trim(Ws) = '' then break;
            nFormat := PacketFormatCheck(Ws,stLeavePacketData,stPacketData);
            {/*
             nFormat : -1 -> 비정상 전문
                       -2 -> 길이가 짧은 전문
                        1 ->  STX 포맷
                        2 ->  SOH 포맷
            */}
            Ws:= stLeavePacketData;
            if nFormat < 0 then
            begin
              if Ws = '' then break;
              if nFormat = -1 then  //비정상 전문 인경우
              begin
                 Delete(Ws,1,1);
                 continue;
              end else break;   //포맷 길이가 작게 들어온 경우
            end;
            if stPacketData <> '' then KTTControlDataPacketProcess(stPacketData,ClientThread);

            if pos(ETX,Ws) = 0 then bLoop := True
            else bLoop := False;
          until bLoop;
        end;
        StartTime:=TimeCounter+ ClientConnectTime;
      End
      Else Begin
         DoSleepEx(1);
         //Application.ProcessMessages;
         ProcessWindowsMessageQueue;
      end;
    End;
  Finally
     DXUnicastDataQueue1.DelSock(Sock);
  End;
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'CONTROL',stIP,'DisConnected','');
  end;

end;

procedure TdmKTTControl.KTTControlDataPacketProcess(aPacketData: string;ClientThread: TDXClientThread);
var
  stKTPartHeader : string;
  stKTTPartData : string;
  stKTTSubData : string;
  nTemp : integer;
  stVer : string;
  stFunCode : string;
  stDate : string;
  stUserID : string;
  stLinkusID : string;
  stEcuID : string;
  stSeq : string;
  nIndex : integer;
  stNodeNo : string;
  oDevice: TDevice;
begin
  stKTPartHeader := copy(aPacketData,1,21);
  Delete(aPacketData,1,21);
  stKTTPartData := aPacketData;
  stVer := copy(stKTTPartData,2,2);
  stFunCode := copy(stKTTPartData,4,2);
  stDate := copy(stKTTPartData,6,14);
  stUserID := copy(stKTTPartData,20,13);
  stLinkusID := copy(stKTTPartData,27,4);
  stEcuID := copy(stKTTPartData,31,2);
  stSeq := copy(stKTTPartData,33,4);
  if Not isDigit(copy(stKTTPartData,37,4)) then Exit;

  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'cRx',ClientThread.Socket.PeerIPAddress,aPacketData,'');
  end;

  nTemp := strtoint(copy(stKTTPartData,37,4));
  stKTTSubData := copy(stKTTPartData,41,nTemp);

  if stFunCode = 'C7' then
  begin
    if stKTTSubData = 'C7' then
    begin
      //주장치동작상태 조회
      SendKTTDeviceStateAck(stVer,'C1',stDate,stUserID,stSeq,ClientThread);
    end else
    begin
    end;
  end else if stFunCode = 'C9' then
  begin
    if stKTTSubData = 'C0' then  //경계
    begin
      DeviceArmModeChange(copy(stUserID,1,11),stEcuID,'A');
      SendKTTDeviceStateAck(stVer,'C1',stDate,stUserID,stSeq,ClientThread);
    end else if stKTTSubData = 'O0' then //해제
    begin
      DeviceArmModeChange(copy(stUserID,1,11),stEcuID,'D');
      SendKTTDeviceStateAck(stVer,'C1',stDate,stUserID,stSeq,ClientThread);
    end else if stKTTSubData = 'C6' then //원격리셋
    begin
      DeviceReset(stVer,'11',stDate,stUserID,stSeq,ClientThread);
    end;
  end else if stFunCode = 'C6' then //리셋
  begin
    if stKTTSubData = 'C6' then  //리셋
    begin
      DeviceReset(stVer,'11',stDate,stUserID,stSeq,ClientThread);
    end;
  end else if stFunCode = '57' then //회선체크
  begin
    nIndex := KTTIDList.IndexOf(copy(stUserID,1,11));
    if nIndex < 0 then Exit;
    stNodeNo := NodeIDList.Strings[nIndex];
    nIndex := DeviceList.IndexOf(stNodeNo + stEcuID);
    if nIndex < 0 then Exit;
    oDevice:= TDevice(DeviceList.Objects[nIndex]);
    if oDevice.Connected then
      SendKTTDeviceStateAck(stVer,'51',stDate,stUserID,stSeq,ClientThread);
  end;


end;

function TdmKTTControl.PamDataSendPacket(aUserID: string;
  aClientServerPort: integer): integer;
var
  stSendData : string;
  PastTime : dword;
begin
  result := -1;

  stSendData := 'AL' +
                '01' +
                aUserID +
                '00' +
                FillZeroNumber(aClientServerPort,5) +
                ETX;

  if Not PamServerSocketConnect then Exit;
  Try
    PamSockPort.PutString(stSendData);
    if Assigned(FOnEvent) then
    begin
      OnEvent(Self,'pTx',KTTServerIP,stSendData,'');
    end;

    L_bPamDataSending := False;

    PastTime := GetTickCount + KTTRECEIVEDELAYTIME;  //응답이 올때 까지 대기하자.  1초 대기
    while Not L_bPamDataSending do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then
      begin
        Exit;  //3000밀리동안 응답 없으면 실패로 처리함
      end;
    end;
    if L_bPamDataSending then result := 1;
  Finally
    PamSockPort.Open := False;
    if Assigned(FOnEvent) then
    begin
      OnEvent(Self,'PAM',KTTServerIP,'DisConnecting','');
    end;
  End;

end;

function TdmKTTControl.PamServerSocketConnect: Boolean;
var
  WaitTickCount : Double;
begin
  result := False;
  if Trim(KTTServerIP) = '' then Exit;
  if KTTServerPort = 0 then Exit;
  
  with PamSockPort do
  begin
    DeviceLayer:= dlWinsock;
    wsAddress:= KTTServerIP;
    wsPort:=    inttostr(KTTServerPort);
    wsMode:=    wsClient;
    Try
      OPen:= False;
      Sleep(100);
      L_bPAMConnected := False;
      Open := True;
    Except
      Exit;
    End;
      
    WaitTickCount := GetTickCount + 1000; //1초 대기
    While Not L_bPAMConnected do
    begin
      Application.ProcessMessages;
      if GetTickCount > WaitTickCount then Break;
    end;
    result := L_bPAMConnected;
    if Assigned(FOnEvent) then
    begin
      if L_bPAMConnected then
        OnEvent(Self,'PAM',KTTServerIP,'Connecting','')
      else OnEvent(Self,'PAM',KTTServerIP,'Connect Fail','');
    end;

  end;

end;

procedure TdmKTTControl.SendKTTDeviceStateAck(aVer, aFuncode, aDate,
  aUserID, aSeq: string; ClientThread: TDXClientThread);
var
  stKTPartHeader : string;
  stKTTSubData : string;
  stKTTPartHeader : string;
  nKTTPartLen : integer;
  nKTPartLen : integer;
  stSendData : string;
begin
  stKTPartHeader := GetKTPartHeader(copy(aUserID,1,2),copy(aUserID,3,5),copy(aUserID,8,4),copy(aUserID,12,2));

  if aFuncode = '51' then stKTTSubData := 'EACK'
  else
  begin
    stKTTSubData := 'S000';
    stKTTSubData := stKTTSubData + GetArmModeState(copy(aUserID,1,11),copy(aUserID,12,2));
    stKTTSubData := stKTTSubData + 'X'; //사이렌 미설치
    stKTTSubData := stKTTSubData + 'X'; //경광등 미설치
    stKTTSubData := stKTTSubData + 'X'; //도어락1 미설치
    stKTTSubData := stKTTSubData + 'X'; //도어락2 미설치
    stKTTSubData := stKTTSubData + 'X'; //예비
  end;

  stKTTPartHeader := GetKTTPartHeader(aFuncode,copy(aDATE,1,8), copy(aDATE,9,6),copy(aUserID,1,2),copy(aUserID,3,5),copy(aUserID,8,4),copy(aUserID,12,2));
  nKTTPartLen := Length(stKTTSubData);
  stKTTPartHeader := stKTTPartHeader + FillZeroNumber(nKTTPartLen,4);
  nKTPartLen := nKTTPartLen + 41;
  stKTPartHeader := stKTPartHeader + FillZeroNumber(nKTPartLen,4);

  stSendData := stKTPartHeader + stKTTPartHeader + stKTTSubData + ETX;

  ClientThread.Socket.Write(stSendData);

  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'cTx',ClientThread.Socket.PeerIPAddress,stSendData,'');
  end;

end;

function TdmKTTControl.GetArmModeState(aUserID, aEcuID: string): string;
var
  nIndex : integer;
  stNodeNo : string;
  oDevice: TDevice;
begin
  result := 'C';
  nIndex := KTTIDList.IndexOf(aUserID);
  if nIndex < 0 then Exit;
  stNodeNo := NodeIDList.Strings[nIndex];
  nIndex := DeviceList.IndexOf(stNodeNo + aEcuID);
  if nIndex < 0 then Exit;
  oDevice:= TDevice(DeviceList.Objects[nIndex]);
  case oDevice.GetArmAreaState(0) of
    cmArm : result := 'A';  //경계중
    cmDisarm : result := 'D';      //해제중
  end;

end;

procedure TdmKTTControl.SetClientServerPort(const Value: Integer);
begin
  if Value = FClientServerPort then Exit;
  KTTControlSERVER.Stop;
  FClientServerPort := Value;
  KTTControlSERVER.ServerPort := Value;
  if ServerUses then
    KTTControlSERVER.Start;
end;

procedure TdmKTTControl.ListClear;
begin
  KTTIDList.Clear;
  NodeIDList.Clear;
end;


procedure TdmKTTControl.DeviceArmModeChange(aUserID, aEcuID,
  aMode: string);
var
  nIndex : integer;
  stNodeNo : string;
  oDevice: TDevice;
begin
  nIndex := KTTIDList.IndexOf(aUserID);
  if nIndex < 0 then Exit;
  stNodeNo := NodeIDList.Strings[nIndex];
  nIndex := DeviceList.IndexOf(stNodeNo + aEcuID);
  if nIndex < 0 then Exit;
  oDevice:= TDevice(DeviceList.Objects[nIndex]);
  if aMode = 'A' then
  begin
    oDevice.ChangewatchMode('0',cmArm);
    DataModule1.TB_SYSTEMLOGInsert(stNodeNo,aEcuID,ALARMTYPE,'0','0000000000','경계모드','KTTREMOTE');
  end else if aMode = 'D' then
  begin
    oDevice.ChangewatchMode('0',cmDisArm);
    DataModule1.TB_SYSTEMLOGInsert(stNodeNo,aEcuID,ALARMTYPE,'0','0000000000','해제모드','KTTREMOTE');
  end;


  //Delay(1000);
end;

procedure TdmKTTControl.DeviceReset(aVer, aFuncode, aDate, aUserID,
  aSeq: string; ClientThread: TDXClientThread);
var
  stKTPartHeader : string;
  stKTTSubData : string;
  stKTTPartHeader : string;
  nKTTPartLen : integer;
  nKTPartLen : integer;
  stSendData : string;
  nIndex : integer;
  stNodeNo : string;
  oDevice: TDevice;
begin
  stKTPartHeader := GetKTPartHeader(copy(aUserID,1,2),copy(aUserID,3,5),copy(aUserID,8,4),copy(aUserID,12,2));

  stKTTSubData := 'E307' + FillZeroNumber(0,15) + FillZeroNumber(0,4);

  stKTTPartHeader := GetKTTPartHeader(aFuncode,copy(aDATE,1,8), copy(aDATE,9,6),copy(aUserID,1,2),copy(aUserID,3,5),copy(aUserID,8,4),copy(aUserID,12,2));
  nKTTPartLen := Length(stKTTSubData);
  stKTTPartHeader := stKTTPartHeader + FillZeroNumber(nKTTPartLen,4);
  nKTPartLen := nKTTPartLen + 41;
  stKTPartHeader := stKTPartHeader + FillZeroNumber(nKTPartLen,4);

  stSendData := stKTPartHeader + stKTTPartHeader + stKTTSubData + ETX;

  nIndex := KTTIDList.IndexOf(copy(aUserID,1,11));
  if nIndex < 0 then Exit;
  stNodeNo := NodeIDList.Strings[nIndex];
  nIndex := DeviceList.IndexOf(stNodeNo + copy(aUserID,12,2));
  if nIndex < 0 then Exit;
  oDevice:= TDevice(DeviceList.Objects[nIndex]);

  if oDevice.Connected then
     ClientThread.Socket.Write(stSendData);
  oDevice.ReBoot;
  DataModule1.TB_SYSTEMLOGInsert(stNodeNo,copy(aUserID,12,2),ALARMTYPE,'0','0000000000','원격리셋','KTTREMOTE');


end;

procedure TdmKTTControl.SetKTTPamCycle(const Value: Integer);
begin
  if FKTTPamCycle = Value then Exit;
  FKTTPamCycle := Value;
  if Value < 1 then PamCyleTimer.Interval := 1000
  else PamCyleTimer.Interval := Value * 1000;
end;

procedure TdmKTTControl.PamCyleTimerTimer(Sender: TObject);
var
  i : integer;
  nResult : integer;
  stNodeNo : string;
  nIndex : integer;
  oDevice: TDevice;
begin
  if Not ServerUses then
  begin
    PamCyleTimer.Enabled := False;
    Exit;
  end;
  if KTTIDList.Count = 0 then Exit;
  if L_bAllPamDataSending then Exit;
  Try
    L_bAllPamDataSending := True;
    for i := 0 to KTTIDList.Count - 1 do
    begin
      stNodeNo := NodeIDList.Strings[i];
      nIndex := DeviceList.IndexOf(stNodeNo + '00');
      if nIndex < 0 then continue;
      oDevice:= TDevice(DeviceList.Objects[nIndex]);
      if oDevice.Connected then          //연결이 된 경우에만 전송하자.
      begin
        nResult := PamDataSendPacket(KTTIDList.Strings[i],ClientServerPort);
        if nResult < 0 then break;
      end;
    end;
    if nResult < 0 then PamCyleTimer.Interval := 3000
    else PamCyleTimer.Interval := KTTPamCycle * 1000;
  Finally
    L_bAllPamDataSending := False;
  End;
end;

procedure TdmKTTControl.PamSockPortTriggerAvail(CP: TObject; Count: Word);
var
  stTemp: string;
  i: Integer;
begin
  stTemp := '';
  for i := 1 to Count do stTemp := stTemp + TApdWinsockPort(CP).GetChar;
  if copy(stTemp,1,4) = 'AL01' then
  begin
    L_bPamDataSending := True;
    if isDigit(copy(stTemp,5,4)) then KTTPamCycle := strtoint(copy(stTemp,5,4));
  end;
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'pRx',KTTServerIP,stTemp,'');
  end;

end;

function TdmKTTControl.KTTCenter_SendPacket(aLINKUSID, aMUXID, aDECODERID,
  aKTTFUNCODE, aKTTEVENTCODE, aDATE, aTIME, aECUID,
  aData: string): integer;
var
  stKTPartHeader : string;
  nKTPartLen : integer;
  stKTTPartHeader : string;
  nKTTPartLen : integer;
  stSendData : string;
begin
  result := -1; //초기 실패시 3초 대기후 재송신
  if Length(aMUXID) <> 2 then aMUXID := FillZeroStrNum(aMUXID,2);
  if Length(aDECODERID) <> 5 then aDECODERID := FillZeroStrNum(aDECODERID,5,False);
  if Length(aLINKUSID) <> 4 then aLINKUSID := FillZeroStrNum(aLINKUSID,4);
  if Length(aECUID) <> 2 then aECUID := FillZeroStrNum(aECUID,2);
  nKTTPartLen := Length(aData);
  stKTTPartHeader := GetKTTPartHeader(aKTTFUNCODE,aDATE, aTIME,aMUXID,aDECODERID,aLINKUSID,aECUID);
  stKTTPartHeader := stKTTPartHeader + FillZeroNumber(nKTTPartLen,4);
  stSendData := stKTTPartHeader + aData + ETX;
  stKTPartHeader := GetKTPartHeader(aMUXID,aDECODERID,aLINKUSID,aECUID);
  nKTPartLen := Length(stSendData);
  stKTPartHeader := stKTPartHeader + FillZeroNumber(nKTPartLen,4);

  stSendData := stKTPartHeader + stSendData;

  Try
    if Not ClientSocket.Open then Exit;
    ClientSocket.PutString(stSendData);
  Except
    Exit;
  End;

  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'eTx',KTTServerIP,stSendData,'');
  end;

end;

procedure TdmKTTControl.PamSockPortWsConnect(Sender: TObject);
begin
  L_bPAMConnected := True;
end;

procedure TdmKTTControl.ClientSocketWsConnect(Sender: TObject);
begin
  L_bEventConnected := True;
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'Event',KTTServerIP,'Connected','');
  end;
end;

procedure TdmKTTControl.ClientSocketWsDisconnect(Sender: TObject);
begin
  if Assigned(FOnEvent) then
  begin
    OnEvent(Self,'Event',KTTServerIP,'DisConnected','');
  end;

end;

procedure TdmKTTControl.ClientSocketWsError(Sender: TObject;
  ErrCode: Integer);
begin
  ErrCode := 0;
end;

procedure TdmKTTControl.PamSockPortWsError(Sender: TObject;
  ErrCode: Integer);
begin
  ErrCode := 0;
end;

end.
