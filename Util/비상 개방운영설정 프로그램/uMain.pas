unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ScktComp, OoMisc, AdStatLt;

type
  TfmMain = class(TForm)
    cmbDevice: TComboBox;
    Label1: TLabel;
    btn_OpenDoor: TSpeedButton;
    btn_CloseDoor: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    ClientSocket1: TClientSocket;
    ApdSLController: TApdSLController;
    ReconnectSocketTimer: TTimer;
    procedure btn_CloseClick(Sender: TObject);
    procedure cmbDeviceChange(Sender: TObject);
    procedure btn_OpenDoorClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ReconnectSocketTimerTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseDoorClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function DeviceConnect:Boolean;
  private
    L_nOrgWiznetServerMode : integer;
    L_bDirectClientConnect : Boolean;
    L_bDirectSearch : Boolean;
    L_bWiznetZeronType : Boolean;
    L_stWiznetData : string;
    L_nDeviceServerMode : integer;
    L_stDeviceRomVer : string;
    { Private declarations }
    Function ClientModeSetting(aDeviceIP:string;aServerMode:integer;aFinish:Boolean=False):Boolean;
    Function WiznetModuleSearch(aDeviceIP:string):Boolean;
    Function WiznetModuleSetting(aDeviceIP,aWiznetData:string;aServerMode:integer):Boolean;
  private
    procedure PanelMessage(Sender: TObject;  aMessage:string);
    procedure NodeConnect(Sender: TObject; aConnected:Boolean);
    procedure ConnectError(Sender: TObject; aConnected:Boolean);
    procedure ECUConnect(Sender: TObject; aEcuID:string; aConnected:Boolean);
    procedure PacketView(Sender: TObject;  aPacket,aType:string);
    procedure ServerModeConnect(Sender:TObject);
    procedure CurrentDeviceChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceConnected(Sender:TObject;aEcuID,aNo:string;aConnected:Boolean);
    procedure CurrentDeviceAlarmModeChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceDoorTypeChange(Sender:TObject;aEcuID,aNo:string;aUse:Boolean);
    procedure CurrentDeviceDoorStateChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentDeviceReaderUseChange(Sender:TObject;aEcuID,aNo:string;aUse:Boolean);
    procedure CurrentDeviceReaderConnectChange(Sender:TObject;aEcuID,aNo:string;aConnected:Boolean);
    procedure CurrentDeviceCodeChange(Sender:TObject;aEcuID,aDeviceCode:string;aChange:Boolean);
    procedure CurrentDeviceTypeChange(Sender:TObject;aEcuID,aDeviceType:string;aChange:Boolean);
    procedure CurrentCDMAUseChange(Sender:TObject;aEcuID,aNo:string;aUsed:Boolean);
    procedure CurrentDVRUseChange(Sender:TObject;aEcuID,aNo:string;aUsed:Boolean);
    procedure CurrentCARDREADERTELUseChange(Sender:TObject;aEcuID,aNo:string;aChange:Boolean);
    procedure CurrentCardTypeChange(Sender:TObject;aEcuID,aCardType:string;aChange:Boolean);
  private
    //수신 이벤트 처리
    //알람이벤트
    procedure AlarmEvent(Sender: TObject;  aECUID,aTime,aSubCLass,aSubAddr,aZone,
                          aMode,aStatus,aLoop,aState,aOper:string);
    //등록이벤트
    procedure DeviceIDData(Sender: TObject;  aECUID,aDeviceID:string);
    procedure CardReaderSetData(Sender: TObject;  aECUID,aReaderNo,aUsedCR,
                       aCRPosition,aDoorNo,aLocate,aBuildingPosi:string);
    procedure SystemSetData(Sender: TObject;  aECUID,aPowerWatch,aOutDelay,
                       aDoor1Type,aDoor2Type,aLocate,aInDelay,aLockExtend:string);
    procedure LampSirenOnOff(Sender: TObject;  aECUID,stLampOnOff,aSirenOnOff:string);
    procedure LampTimeSetData(Sender: TObject;  aECUID,aLampTime:string);
    procedure SirenTimeSetData(Sender: TObject;  aECUID,aSirenTime:string);
    procedure PortSettingData(Sender: TObject;  aECUID,aPort,aWatchType,aAlarmType,
                          aRecoverType,aDelayTimeType,aPortLocate,aDetectTime:string);
    procedure DeviceUsedSettingData(Sender: TObject;  aECUID,aDeviceUsed:string);
    procedure WiznetInfoSettingData(Sender: TObject;  aECUID,aHeader,aMacAddress,aMode,
                          aIPAddress,aSubnet,aGateway,aClientPort,aServerIP,aServerPort,
                          aSerial_Baud,aSerial_data,aSerial_Parity,aSerial_stop,
                          aSerial_flow,aDelimiterChar,aDelimiterSize,aDelimitertime,
                          aDelimiterIdle,aDebugMode,aROMVer,aOnDHCP,aReserve:string);
    procedure CardReaderTypeSettingData(Sender: TObject;  aECUID,aCardReaderType:string);
    procedure DeviceStateData(Sender: TObject;  aECUID,aCmd,aData:string);
    procedure CDMASetting(Sender:TObject; aEcuID,aData:string);
    procedure CDMAInfoSetting(Sender:TObject; aEcuID,aData:string);
    procedure CCCTimeInterval(Sender:TObject; aEcuID,aData:string);
    procedure CCCStartTime(Sender:TObject; aEcuID,aData:string);
    procedure KTTSystemIDData(Sender:TObject; aEcuID,aData:string);
    procedure KTTTelNumberData(Sender:TObject; aEcuID,aNo,aTelNum:string);
    procedure KTTRingCountData(Sender:TObject; aEcuID,aArmRingCount,aDisArmRingCount:string);
    procedure ArmDsCheckData(Sender:TObject; aEcuID,aDoorNo,aArmCheck:string);
    procedure ArmRelayCheckData(Sender:TObject; aEcuID,aNo,aArmRelay:string);
    procedure DVRUseSetting(Sender:TObject; aEcuID,aData:string);
    procedure DVRInfoSetting(Sender:TObject; aEcuID,aData:string);
    procedure CARDREADERTelNumberData(Sender:TObject; aEcuID,aNo,aTelNum:string);

    //원격제어 데이터
    procedure DeviceTimeData(Sender: TObject;  aECUID,aTime:string);
    procedure DeviceTypeData(Sender: TObject;  aECUID,aDeviceType:string);
    procedure DeviceCodeData(Sender: TObject;  aECUID,aDeviceCode:string);
    procedure SystemFunctionData(Sender: TObject;  aECUID:string;
                          aJavaraCloseCommand,aJavaraOpenCommand,aFireServerCommand:Boolean);
    procedure DeviceVersionData(Sender: TObject;  aECUID,aDeviceVersion:string);
    procedure CardReaderVersionData(Sender: TObject;  aECUID,aCardReaderNo,aCardReaderVersion:string);
    procedure DeviceResetData(Sender: TObject;  aECUID:string);
    procedure CardListSearchData(Sender: TObject;  aECUID,aData:string);
    procedure EcuStateData(Sender: TObject;  aECUID,aData:string);
    //출입통제이벤트
    procedure CardAccessEvent(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState,
                          aATButton,stCardNo:string);
    procedure DoorEvent(Sender: TObject;  aECUID,aDoorNo,aReaderNo,aInOut,aTime,
                          aCardMode,aDoorMode,aChangeState,aAccessResult,aDoorState:string);

    procedure DoorSettingEvent(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,
                          aDoorControlTime,aLongDoorOpenTime,aSchedule,aDoorState,
                          aNetFailRun,aAntiPass,aLongDoorOpenUse,aNetFailAlarm,
                          aDoorLockType,aFireDoorControl,aLockState,aDoorOpenState,
                          aRemoteDoorOpen:string);
    procedure DoorState(Sender: TObject;  aECUID,aDoorNo,aCardMode,aDoorMode,aDoorState,aDoorSchedule:string);
    procedure CardRegist(Sender: TObject;  aECUID,aDoorNo,aCmd,aCardType,
                          aCardNo,aExpireDate,aRegResult,aCardAuth,aTimeMode:string);
    procedure ScheduleData(Sender: TObject;  aECUID,aDoorNo,aCmd,aDayOfWeek,a1ModeTime,a1Mode,
                          a2ModeTime,a2Mode,a3ModeTime,a3Mode,a4ModeTime,a4Mode,
                          a5ModeTime,a5Mode:string);
    procedure HolidayData(Sender: TObject;  aECUID,aDoorNo,aMonth,aDate:string);
    //펌웨어 업데이트
    procedure GageMonitor(Sender: TObject;  aECUID,aNo,aData:string);
    procedure FirmwareProcess(Sender: TObject;  aECUID,aNo,aData:string);
    procedure FirmwareProcess2(Sender: TObject;  aECUID,aNo,aData:string);
    procedure PTMonitoringProcess(Sender: TObject;  aECUID,aNo,aData:string);

    procedure ProcessKTT811FTPFirmWareDownloadComplete(Sender: TObject;  aECUID,aData:string);
    //KTT812 펌웨어 다운로드
    procedure ProcessKTT812FlashData(Sender: TObject;  aECUID,aData:string);
    procedure ProcessKTT812FlashDataEnd(Sender: TObject;  aECUID,aData:string);
    procedure ProcessKTT812EcuFirmWareDownloadComplete(Sender: TObject;  aECUID,aData:string);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uSocket,
  uLomosUtil,
  uCommon,
  uConnectStatusMsg;
{$R *.dfm}

procedure TfmMain.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.cmbDeviceChange(Sender: TObject);
begin
  dmSocket.SocketDisConnect;
end;

procedure TfmMain.btn_OpenDoorClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('전체 개방시 현재 메인컨트롤러 아래 모든 출입문이 개방모드로 변경 됩니다.' + #13 +
                       '정말 개방모드로 변경 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
  Try
    btn_OpenDoor.Enabled := False;
    btn_CloseDoor.Enabled := False;

    if Not dmSocket.SocketConnected then
    begin
      if Not DeviceConnect then Exit;
    end;
    if Not dmSocket.SocketConnected then
    begin
      showmessage('연결에 실패하였습니다.');
      Exit;
    end;
    ErrorLogSave(ExtractFileDir(Application.ExeName) + '\' + FormatdateTime('yyyymmdd',Now) + '.log','개방모드',cmbDevice.Text );
    //출입문1 전체개방
    dmSocket.AllDeviceSendPacket('c','C01021');
    delay(1000);
    //출입문2 전체개방
    dmSocket.AllDeviceSendPacket('c','C02021');
  Finally
    btn_OpenDoor.Enabled := True;
    btn_CloseDoor.Enabled := True;
  End;

end;

function TfmMain.ClientModeSetting(aDeviceIP: string; aServerMode: integer;
  aFinish: Boolean): Boolean;
var
  PastTime : dword;
  i : integer;
begin
  if Not aFinish then L_nOrgWiznetServerMode := -1;
  Try
    Panel1.Visible := True;
    Panel1.Color := clYellow;
    Panel1.Caption := '컨트롤러 LAN설정 확인 중입니다.';
    for i:= 0 to 2 do
    begin
      if WiznetModuleSearch(aDeviceIP) then   //WiznetModule를 조회 하자.
      begin
        break;
      end;
    end;

    if L_stWiznetData = '' then Exit;
    if aServerMode = 2 then
    begin
      if L_stWiznetData[11] = #$02 then  //현재가 서버모드이면서
      begin
        if L_stWiznetData[49] = #$0 then  // DisConnected 상태 이면 바로 접속
        begin
          result := True;  //이미 클라이언트 모드 이므로 설정 할 필요 없다- 서버와 통신중이면 설정해야 됨
          Exit;
        end;
      end else
      begin
        if Not aFinish then L_nOrgWiznetServerMode := 0; //현재가 클라이언트 모드임
      end;
    end else if aServerMode = 0 then
    begin
      if L_stWiznetData[11] = #$00 then  //현재가 클라이언트모드이면서
      begin
        if L_stWiznetData[49] = #$0 then  // DisConnected 상태 이면 바로 접속
        begin
          result := True;  //이미 클라이언트 모드 이므로 설정 할 필요 없다- 서버와 통신중이면 설정해야 됨
          Exit;
        end;
      end else
      begin
        if Not aFinish then L_nOrgWiznetServerMode := 2; //현재가 서버 모드임
      end;
    end;

    for i:= 0 to 2 do
    begin
      if WiznetModuleSetting(aDeviceIP,L_stWiznetData,aServerMode) then   //WiznetModule를 설정 하자.
      begin
        result := True;
        Exit;
      end;
    end;

  Finally
    Panel1.Visible := False;
  End;
end;

function TfmMain.WiznetModuleSearch(aDeviceIP: string): Boolean;
var
  PastTime : dword;
begin
    result := false;
    ClientSocket1.Active := False;
    Delay(200);
    ClientSocket1.Host:= aDeviceIP;
    ClientSocket1.Port := TCPCLIENTPORT;
    PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자

    L_bDirectClientConnect := False;

    ClientSocket1.Active:= True;
    while Not L_bDirectClientConnect do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then
      begin
        Exit;  //300밀리동안 응답 없으면 실패로 처리함
      end;
    end;

    L_bDirectSearch := False;
    L_stWiznetData := '';
    ClientSocket1.Socket.SendText('FIND');
    PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
    while Not L_bDirectSearch do
    begin
      Application.ProcessMessages;
      if GetTickCount > PastTime then
      begin
        Exit;  //300밀리동안 응답 없으면 실패로 처리함
      end;
    end;
    result := True;
end;

function TfmMain.WiznetModuleSetting(aDeviceIP, aWiznetData: string;
  aServerMode: integer): Boolean;
var
  PastTime : dword;
begin
  if Not L_bWiznetZeronType then
  begin
    aWiznetData[1]:='S';
    aWiznetData[2]:='E';
    aWiznetData[3]:='T';
    aWiznetData[4]:='T';
  end else
  begin
    aWiznetData[1]:='L';
    aWiznetData[2]:='N';
    aWiznetData[3]:='S';
    aWiznetData[4]:='V';
  end;

  if aServerMode = 2 then
     aWiznetData[11] := #$02
  else if aServerMode = 0 then aWiznetData[11] := #$00
  else Exit;

  L_bDirectSearch := False;
  ClientSocket1.Active := False;
  Delay(200);
  ClientSocket1.Active:= True;
  PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
  while Not L_bDirectClientConnect do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then
    begin
      Exit;  //300밀리동안 응답 없으면 실패로 처리함
    end;
  end;
  if Not L_bDirectClientConnect then Exit;
  ClientSocket1.Socket.SendText(aWiznetData);
  PastTime := GetTickCount + 5000;  //Connect 될때까지 대기하자
  while Not L_bDirectSearch do
  begin
    Application.ProcessMessages;
    if GetTickCount > PastTime then
    begin
      Exit;  //300밀리동안 응답 없으면 실패로 처리함
    end;
  end;
  result := True;
end;

procedure TfmMain.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
  S: string;
begin

  S:= Socket.ReceiveText;

  if  Length(S) < 47 then Exit;

  L_stWiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC')
     and (copy(S,1,4) <> 'LNDT') and (copy(S,1,4) <> 'LNSD')
  then Exit;
{
04945    IMIN --> LNDT,    SETT --> LNSV,    SETC --> LNSD 로 변경 함.
04946    Wiznet IIM7100A tool은 Open Tool 및 source 이므로 누구나 사용할 수 있어서 기기가 많이 설치될 경우
04947    Wiznwet IIM7100A 로 Zeron기기의 LAN 정보를 변경 할 수 있기 때문에 Data를 달리 사용 하도록 함.
04948    
04949    //변경전                                          변경후
04950    
04951                    PC        w3100a                                PC        w3100a
04952    
04953        < UDP >     |               |                   < UDP >     |               |
04954                    |               |                               |               |
04955    Search    5001  | FIND -->      |  1460         Search    5001  | FIND -->      |  1460
04956              5001  |  <-- IMIN#### |  1460                   5001  |  <-- LNDT#### |  1460
04957                    |               |                               |               |
04958    Setting   5001  | SETT#### -->  |  1460         Setting   5001  | LNSV#### -->  |  1460
04959              5001  |  <-- SETC#### |  1460                   5001  |  <-- LNSD#### |  1460
04960                    |               |                               |               |
04961                    |               |                               |               |
04962        < TCP >     |               |                   < TCP >     |               |
04963                    |               |                               |               |
04964    Search    ????  | FIND -->      |  1461         Search    ????  | FIND -->      |  1461
04965              ????  |  <-- IMIN#### |  1461                   ????  |  <-- LNDT#### |  1461
04966                    |               |                               |               |
04967    Setting   ????  | SETT#### -->  |  1461         Setting   ????  | LNSV#### -->  |  1461
04968              ????  |  <-- SETC#### |  1461                   ????  |  <-- LNSD#### |  1461
04969                    |               |
}

  if (copy(S,1,4) = 'IMIN') or (copy(S,1,4) = 'SETC') then L_bWiznetZeronType := False
  else L_bWiznetZeronType := True;

  if L_stWiznetData[11] = #$00 then L_nDeviceServerMode := 0
  else if L_stWiznetData[11] = #$01 then L_nDeviceServerMode := 1
  else if L_stWiznetData[11] = #$02 then L_nDeviceServerMode := 2;

  //lb_RomVer.Caption := InttoStr(Ord(L_stWiznetData[45]))+'.'+InttoStr(Ord(L_stWiznetData[46]));
  L_stDeviceRomVer := InttoStr(Ord(L_stWiznetData[45])) + InttoStr(Ord(L_stWiznetData[46]));

  //Wiznet 접속을 끊는다.
  //if (OnWritewiznet = True) and ClientSocket1.Active  then
  //begin
  if ClientSocket1.Active  then
  begin
    ClientSocket1.Active:= False;
    L_bDirectSearch := True;
  end;
end;

procedure TfmMain.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  L_bDirectClientConnect := True;

end;

procedure TfmMain.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  L_bDirectClientConnect := False;

end;

procedure TfmMain.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode := 0;
  L_bDirectClientConnect := False;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True
end;

procedure TfmMain.ReconnectSocketTimerTimer(Sender: TObject);
var
  dtPollingTime: TDatetime;
  dtTimeOut: TDatetime;
begin
  if G_bApplicationTerminate then Exit;

  dtPollingTime:= dmSocket.LastConnectedTime;
  dtTimeOut:= IncTime(dtPollingTime,0,0,30,0);
  if Now > dtTimeout then
  begin
    dmSocket.SocketDisConnect;
    Delay(50);
    if G_bApplicationTerminate then Exit;
    dmSocket.SocketConnect;
  end;

end;

procedure TfmMain.FormCreate(Sender: TObject);
begin

  dmSocket.OnPanelMessage:=   PanelMessage;
  dmSocket.OnNodeConnect:=    NodeConnect;
  dmSocket.OnConnectError:=    ConnectError;
  dmSocket.OnECUConnect:=    ECUConnect;
  dmSocket.OnPacketView:=     PacketView;
  dmSocket.OnServerModeConnect := ServerModeConnect;
  //알람이벤트
  dmSocket.OnAlarmEvent :=    AlarmEvent;
  //등록정보
  dmSocket.OnDeviceIDSetting := DeviceIDData;
  dmSocket.OnCardReaderSetting := CardReaderSetData;
  dmSocket.OnSystemSetting := SystemSetData;
  dmSocket.OnLampSirenOnOff := LampSirenOnOff;
  dmSocket.OnLampTime := LampTimeSetData;
  dmSocket.OnSirenTime := SirenTimeSetData;
  dmSocket.OnPortSetting := PortSettingData;
  dmSocket.OnDeviceUsedSetting := DeviceUsedSettingData;
  dmSocket.OnWiznetInfoSetting := WiznetInfoSettingData;
  dmSocket.OnCardReaderTypeSetting := CardReaderTypeSettingData;
  dmSocket.OnDeviceState := DeviceStateData;
  dmSocket.OnCDMASetting := CDMASetting;
  dmSocket.OnCCCInfoSetting := CDMAInfoSetting;
  dmSocket.OnCCCTimeInterval := CCCTimeInterval;
  dmSocket.OnCCCStartTime := CCCStartTime;
  dmSocket.OnKTTSystemID := KTTSystemIDData;
  dmSocket.OnKTTTelNumber := KTTTelNumberData;
  dmSocket.OnKTTRingCount := KTTRingCountData;
  dmSocket.OnArmDsCheck := ArmDsCheckData;
  dmSocket.OnArmRelayCheck := ArmRelayCheckData;
  dmSocket.OnDVRUseSetting := DVRUseSetting;
  dmSocket.OnDVRInfoSetting := DVRInfoSetting;
  dmSocket.OnCARDREADERTelNumber := CARDREADERTelNumberData;

  //원격제어
  dmSocket.OnDeviceTime := DeviceTimeData;
  dmSocket.OnDeviceType := DeviceTypeData;
  dmSocket.OnDeviceCode := DeviceCodeData;
  dmSocket.OnSystemFunction := SystemFunctionData;
  dmSocket.OnDeviceVersion := DeviceVersionData;
  dmSocket.OnCardReaderVersion := CardReaderVersionData;
  dmSocket.OnDeviceReset := DeviceResetData;
  dmSocket.OnCardGrade := CardListSearchData;
  dmSocket.OnEcuState := EcuStateData;
  //출입통제
  dmSocket.OnCardAccessEvent:=CardAccessEvent;
  dmSocket.OnDoorEvent      :=DoorEvent;
  dmSocket.OnDoorSettingEvent := DoorSettingEvent;
  dmSocket.OnDoorState := DoorState;
  dmSocket.OnCardRegist := CardRegist;
  dmSocket.OnScheduleSetting := ScheduleData;
  dmSocket.OnHolidaySetting := HolidayData;
  //펌웨어
  dmSocket.OnGageMonitor := GageMonitor;
  dmSocket.OnFirmwareProcess := FirmwareProcess;
  dmSocket.OnFirmwareProcess2 := FirmwareProcess2;
  dmSocket.OnPTMonitoringProcess := PTMonitoringProcess;
  dmSocket.OnKTT811FTPFirmWareDownloadComplete := ProcessKTT811FTPFirmWareDownloadComplete;
  //KTT812 FirmwareDownload
  dmSocket.OnKTT812FlashDataEvent := ProcessKTT812FlashData;
  dmSocket.OnKTT812FlashDataEndEvent := ProcessKTT812FlashDataEnd;
  dmSocket.OnKTT812EcuFirmWareDownloadComplete := ProcessKTT812EcuFirmWareDownloadComplete;

end;

procedure TfmMain.PanelMessage(Sender: TObject; aMessage: string);
begin
//
end;

procedure TfmMain.NodeConnect(Sender: TObject; aConnected: Boolean);
begin
//
end;

procedure TfmMain.ConnectError(Sender: TObject; aConnected: Boolean);
begin
  ReconnectSocketTimer.Enabled := True;
end;

procedure TfmMain.ECUConnect(Sender: TObject; aEcuID: string;
  aConnected: Boolean);
begin
//
end;

procedure TfmMain.CurrentCARDREADERTELUseChange(Sender: TObject; aEcuID,
  aNo: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentCardTypeChange(Sender: TObject; aEcuID,
  aCardType: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentCDMAUseChange(Sender: TObject; aEcuID,
  aNo: string; aUsed: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceAlarmModeChange(Sender: TObject; aEcuID,
  aNo: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceChange(Sender: TObject; aEcuID, aNo: string;
  aChange: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceCodeChange(Sender: TObject; aEcuID,
  aDeviceCode: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceConnected(Sender: TObject; aEcuID,
  aNo: string; aConnected: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceDoorStateChange(Sender: TObject; aEcuID,
  aNo: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceDoorTypeChange(Sender: TObject; aEcuID,
  aNo: string; aUse: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceReaderConnectChange(Sender: TObject; aEcuID,
  aNo: string; aConnected: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceReaderUseChange(Sender: TObject; aEcuID,
  aNo: string; aUse: Boolean);
begin

end;

procedure TfmMain.CurrentDeviceTypeChange(Sender: TObject; aEcuID,
  aDeviceType: string; aChange: Boolean);
begin

end;

procedure TfmMain.CurrentDVRUseChange(Sender: TObject; aEcuID, aNo: string;
  aUsed: Boolean);
begin

end;

procedure TfmMain.PacketView(Sender: TObject; aPacket, aType: string);
begin

end;

procedure TfmMain.ServerModeConnect(Sender: TObject);
begin

end;

procedure TfmMain.AlarmEvent(Sender: TObject; aECUID, aTime, aSubCLass,
  aSubAddr, aZone, aMode, aStatus, aLoop, aState, aOper: string);
begin

end;

procedure TfmMain.ArmDsCheckData(Sender: TObject; aEcuID, aDoorNo,
  aArmCheck: string);
begin

end;

procedure TfmMain.ArmRelayCheckData(Sender: TObject; aEcuID, aNo,
  aArmRelay: string);
begin

end;

procedure TfmMain.CardAccessEvent(Sender: TObject; aECUID, aDoorNo,
  aReaderNo, aInOut, aTime, aCardMode, aDoorMode, aChangeState,
  aAccessResult, aDoorState, aATButton, stCardNo: string);
begin

end;

procedure TfmMain.CardListSearchData(Sender: TObject; aECUID,
  aData: string);
begin

end;

procedure TfmMain.CardReaderSetData(Sender: TObject; aECUID, aReaderNo,
  aUsedCR, aCRPosition, aDoorNo, aLocate, aBuildingPosi: string);
begin

end;

procedure TfmMain.CARDREADERTelNumberData(Sender: TObject; aEcuID, aNo,
  aTelNum: string);
begin

end;

procedure TfmMain.CardReaderTypeSettingData(Sender: TObject; aECUID,
  aCardReaderType: string);
begin

end;

procedure TfmMain.CardReaderVersionData(Sender: TObject; aECUID,
  aCardReaderNo, aCardReaderVersion: string);
begin

end;

procedure TfmMain.CardRegist(Sender: TObject; aECUID, aDoorNo, aCmd,
  aCardType, aCardNo, aExpireDate, aRegResult, aCardAuth,
  aTimeMode: string);
begin

end;

procedure TfmMain.CCCStartTime(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.CCCTimeInterval(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.CDMAInfoSetting(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.CDMASetting(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.DeviceCodeData(Sender: TObject; aECUID,
  aDeviceCode: string);
begin

end;

procedure TfmMain.DeviceIDData(Sender: TObject; aECUID, aDeviceID: string);
begin

end;

procedure TfmMain.DeviceResetData(Sender: TObject; aECUID: string);
begin

end;

procedure TfmMain.DeviceStateData(Sender: TObject; aECUID, aCmd,
  aData: string);
begin

end;

procedure TfmMain.DeviceTimeData(Sender: TObject; aECUID, aTime: string);
begin

end;

procedure TfmMain.DeviceTypeData(Sender: TObject; aECUID,
  aDeviceType: string);
begin

end;

procedure TfmMain.DeviceUsedSettingData(Sender: TObject; aECUID,
  aDeviceUsed: string);
begin

end;

procedure TfmMain.DeviceVersionData(Sender: TObject; aECUID,
  aDeviceVersion: string);
begin

end;

procedure TfmMain.DoorEvent(Sender: TObject; aECUID, aDoorNo, aReaderNo,
  aInOut, aTime, aCardMode, aDoorMode, aChangeState, aAccessResult,
  aDoorState: string);
begin

end;

procedure TfmMain.DoorSettingEvent(Sender: TObject; aECUID, aDoorNo,
  aCardMode, aDoorMode, aDoorControlTime, aLongDoorOpenTime, aSchedule,
  aDoorState, aNetFailRun, aAntiPass, aLongDoorOpenUse, aNetFailAlarm,
  aDoorLockType, aFireDoorControl, aLockState, aDoorOpenState,
  aRemoteDoorOpen: string);
begin

end;

procedure TfmMain.DoorState(Sender: TObject; aECUID, aDoorNo, aCardMode,
  aDoorMode, aDoorState, aDoorSchedule: string);
begin

end;

procedure TfmMain.DVRInfoSetting(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.DVRUseSetting(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.EcuStateData(Sender: TObject; aECUID, aData: string);
begin

end;

procedure TfmMain.FirmwareProcess(Sender: TObject; aECUID, aNo,
  aData: string);
begin

end;

procedure TfmMain.FirmwareProcess2(Sender: TObject; aECUID, aNo,
  aData: string);
begin

end;

procedure TfmMain.GageMonitor(Sender: TObject; aECUID, aNo, aData: string);
begin

end;

procedure TfmMain.HolidayData(Sender: TObject; aECUID, aDoorNo, aMonth,
  aDate: string);
begin

end;

procedure TfmMain.KTTRingCountData(Sender: TObject; aEcuID, aArmRingCount,
  aDisArmRingCount: string);
begin

end;

procedure TfmMain.KTTSystemIDData(Sender: TObject; aEcuID, aData: string);
begin

end;

procedure TfmMain.KTTTelNumberData(Sender: TObject; aEcuID, aNo,
  aTelNum: string);
begin

end;

procedure TfmMain.LampSirenOnOff(Sender: TObject; aECUID, stLampOnOff,
  aSirenOnOff: string);
begin

end;

procedure TfmMain.LampTimeSetData(Sender: TObject; aECUID,
  aLampTime: string);
begin

end;

procedure TfmMain.PortSettingData(Sender: TObject; aECUID, aPort,
  aWatchType, aAlarmType, aRecoverType, aDelayTimeType, aPortLocate,
  aDetectTime: string);
begin

end;

procedure TfmMain.ProcessKTT811FTPFirmWareDownloadComplete(Sender: TObject;
  aECUID, aData: string);
begin

end;

procedure TfmMain.ProcessKTT812EcuFirmWareDownloadComplete(Sender: TObject;
  aECUID, aData: string);
begin

end;

procedure TfmMain.ProcessKTT812FlashData(Sender: TObject; aECUID,
  aData: string);
begin

end;

procedure TfmMain.ProcessKTT812FlashDataEnd(Sender: TObject; aECUID,
  aData: string);
begin

end;

procedure TfmMain.PTMonitoringProcess(Sender: TObject; aECUID, aNo,
  aData: string);
begin

end;

procedure TfmMain.ScheduleData(Sender: TObject; aECUID, aDoorNo, aCmd,
  aDayOfWeek, a1ModeTime, a1Mode, a2ModeTime, a2Mode, a3ModeTime, a3Mode,
  a4ModeTime, a4Mode, a5ModeTime, a5Mode: string);
begin

end;

procedure TfmMain.SirenTimeSetData(Sender: TObject; aECUID,
  aSirenTime: string);
begin

end;

procedure TfmMain.SystemFunctionData(Sender: TObject; aECUID: string;
  aJavaraCloseCommand, aJavaraOpenCommand, aFireServerCommand: Boolean);
begin

end;

procedure TfmMain.SystemSetData(Sender: TObject; aECUID, aPowerWatch,
  aOutDelay, aDoor1Type, aDoor2Type, aLocate, aInDelay,
  aLockExtend: string);
begin

end;

procedure TfmMain.WiznetInfoSettingData(Sender: TObject; aECUID, aHeader,
  aMacAddress, aMode, aIPAddress, aSubnet, aGateway, aClientPort,
  aServerIP, aServerPort, aSerial_Baud, aSerial_data, aSerial_Parity,
  aSerial_stop, aSerial_flow, aDelimiterChar, aDelimiterSize,
  aDelimitertime, aDelimiterIdle, aDebugMode, aROMVer, aOnDHCP,
  aReserve: string);
begin

end;

function TfmMain.DeviceConnect: Boolean;
var
  stIP : string;
  nIndex : integer;
  bResult : Boolean;
  i : integer;
begin
  result := False;
  if cmbDevice.ItemIndex < 0 then
  begin
    showmessage('접속할 컨트롤러를 선택하세요.');
    Exit;
  end;
  stIP := cmbDevice.Text;

  nIndex := Pos(#9,stIP);
  if nIndex > 0 then
    delete(stIP,1,nIndex);
  stIP := Trim(stIP);
  if Not dmSocket.SocketConnected then
  begin
    if Not ClientModeSetting(stIP,2) then  //컨트롤러를 ServerMode로 변경 함다.
    begin
      showmessage('기기 접속에 실패 하였습니다.');
      Exit;
    end;
    dmSocket.ConnectMode := 0;
    dmSocket.ServerMode := 0;
    dmSocket.SocketAddress := stIP;
    dmSocket.SocketPort := '3000';
    dmSocket.SocketCOM := 1;
    ApdSLController.Monitoring:= True;

    for i := 0 to G_nLoopCount do
    begin
      if G_bApplicationTerminate then Exit;
      bResult := dmSocket.SocketConnect;
      if bResult then Break;
    end;
    if bResult then
    begin
      if G_nServerMode <> 1 then
      begin
        fmConnectStatusMsg:= TfmConnectStatusMsg.Create(Self);
        fmConnectStatusMsg.ShowModal;
        fmConnectStatusMsg.Free;
      end;
      ReconnectSocketTimer.Enabled := True;
    end else
    begin
      showmessage('접속실패');
      Exit;
    end;
  end;
  result := True;
end;

procedure TfmMain.btn_CloseDoorClick(Sender: TObject);
begin
  if Application.MessageBox(Pchar('전체 운영시 현재 메인컨트롤러 아래 모든 출입문이 운영모드로 변경 됩니다.' + #13 +
                       '정말 운영모드로 변경 하시겠습니까?'),'경고',MB_OKCANCEL)= ID_CANCEL then Exit;
  Try
    btn_OpenDoor.Enabled := False;
    btn_CloseDoor.Enabled := False;

    if Not dmSocket.SocketConnected then
    begin
      if Not DeviceConnect then Exit;
    end;
    if Not dmSocket.SocketConnected then
    begin
      showmessage('연결에 실패하였습니다.');
      Exit;
    end;
    ErrorLogSave(ExtractFileDir(Application.ExeName) + '\' + FormatdateTime('yyyymmdd',Now) + '.log','운영모드',cmbDevice.Text );
    //출입문1 전체운영
    dmSocket.AllDeviceSendPacket('c','C01020');
    delay(1000);
    //출입문2 전체운영
    dmSocket.AllDeviceSendPacket('c','C02020');
  Finally
    btn_OpenDoor.Enabled := True;
    btn_CloseDoor.Enabled := True;
  End;

end;

procedure TfmMain.FormShow(Sender: TObject);
var
  stPCIP : string;
begin
  stPCIP := Get_Local_IPAddr;

  if copy(stPCip,1,Length('202.30.25.134')) <> '202.30.25.134' then
  begin
    showmessage('서버에서만 프로그램을 실행 하실 수 있습니다.');
    Application.Terminate;
    Exit;
  end;
end;

end.
