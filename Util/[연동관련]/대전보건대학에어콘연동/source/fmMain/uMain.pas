unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ToolWin, ComCtrls,
  uCommonVariable, StdCtrls,ADOdb,ActiveX, Buttons, uSubForm, CommandArray,
  DB, OoMisc, AdPort, AdWnPort, ActnList;

const
  DelayTime = 300;
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  BINARYPACKETSIZE = 32;   //모니터링 State 확인시 ECU 개당 패킷 사이즈
  MAXECUCOUNT = 63;        //확장기 최대 갯수
  DATADELIMITER = '^';

type
  TfmMain = class(TfmASubForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    tbi: TantTaskbarIcon;
    imlstIcons: TImageList;
    FirstTimer: TTimer;
    Image1: TImage;
    ToolBar1: TToolBar;
    StatusBar1: TStatusBar;
    Menu_ImageList: TImageList;
    AdoConnectCheckTimer: TTimer;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    Ver011: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    RelayTimer: TTimer;
    RelayAdoConnectCheckTimer: TTimer;
    btn_SearchState: TToolButton;
    RelayADOQuery: TADOQuery;
    N2: TMenuItem;
    mn_Controler: TMenuItem;
    mn_Relay: TMenuItem;
    mn_Device: TMenuItem;
    mn_DMS: TMenuItem;
    WinsockPort1: TApdWinsockPort;
    ServerConnectTimer: TTimer;
    ActionList1: TActionList;
    Action_StateSearch: TAction;
    SendDaemonTimer: TTimer;
    DaemonReceiveTimer: TTimer;
    DMSSendTimer: TTimer;
    DBSocketReceiveTimer: TTimer;
    procedure mn_ExitClick(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FirstTimerTimer(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);
    procedure miShowClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchStateClick(Sender: TObject);
    procedure CommandArrayCommandsTDEVICECURRENTSTATEExecute(
      Command: TCommand; Params: TStringList);
    procedure mn_DMSClick(Sender: TObject);
    procedure mn_ControlerClick(Sender: TObject);
    procedure mn_RelayClick(Sender: TObject);
    procedure mn_DeviceClick(Sender: TObject);
    procedure ServerConnectTimerTimer(Sender: TObject);
    procedure WinsockPort1WsConnect(Sender: TObject);
    procedure WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPort1WsDisconnect(Sender: TObject);
    procedure Action_StateSearchExecute(Sender: TObject);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure WinsockPort1TriggerAvail(CP: TObject; Count: Word);
    procedure DaemonReceiveTimerTimer(Sender: TObject);
    procedure DMSSendTimerTimer(Sender: TObject);
    procedure DBSocketReceiveTimerTimer(Sender: TObject);
  private
    SendDaemonDataList : TStringList;
    ReceiveDataList : TStringList;
    L_stDaemonServerIP : string;
    L_stDaemonServerPort : string;
    L_stServerComBuff : string;
    L_nOldDBSocketSeq : integer; //최종 가져온 DBSocketSequence

    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bActive : Boolean;
    FDaemonServerConnected: Boolean;
    { Private declarations }
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    procedure SetFDaemonServerConnected(const Value: Boolean);
  private
    procedure LoadDMS;
    procedure UnLoadDMS;
    procedure LoadSystemAircon;
    procedure InitConfigSet;
  private
    Procedure SendDaemon(aData:string);
    procedure MonitoringDataProcess(aData:string;aDaemonNo:integer=0);
    procedure DaemonReceiveDataProcess(aData:string;Sender:Tobject);
    procedure DaemonRestart;
    procedure DaemonLive;
    procedure MonitorAlarmRefresh;
    procedure DeviceAllStateCheckReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
    procedure DeviceStateCheckIIIReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string;Sender:Tobject);
    procedure NODEDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
    procedure ECUDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
    procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
    procedure AlarmDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지
  public
    { Public declarations }
    property DaemonServerConnected : Boolean read FDaemonServerConnected write SetFDaemonServerConnected;
  end;

var
  fmMain: TfmMain;

implementation

uses
  uLomosUtil,
  uDBModule,
  uDataBaseConfig,
  uConfig,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uFireBird,
  uCommonSql,
  uSysAirconDMS,
  uSysAirconControler,
  uSysAirconRelay,
  uSysAirconDevice,
  udmSystemAirCon;

{$R *.dfm}

procedure TfmMain.mn_ExitClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  LogoFile : string;
begin
  self.ModuleID := 'Main';
  IsMaster := True;

  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  ExeFolder := G_stExeFolder;
  L_bApplicationTerminate := False;
  LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','Program Start ');

  tbi.Visible := True;
  tbi.Hint := '시스템에어콘 연동 시스템 정지';
  FirstTimer.Enabled := False;

  LogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  dmDBModule.OnAdoConnected := DataModuleAdoConnected;

  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if L_bApplicationTerminate then Exit;
    if TDataBaseConfig.GetObject.Cancel then
    begin
      L_bClose := True;
      LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','Daemon Program Close(DB Connect Fail) ');

      Application.Terminate;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;
  SystemAirConDMSList := TStringList.create;
  ArmAreaDeviceList := TStringList.Create;
  SendDaemonDataList := TStringList.Create;
  ReceiveDataList := TStringList.Create;
  LoadDMS;
  LoadSystemAircon;
  InitConfigSet;
  ServerConnectTimer.Enabled := True;
  DaemonReceiveTimer.Enabled := True;
  DMSSendTimer.Enabled := True;
  L_nOldDBSocketSeq := 0;
end;

procedure TfmMain.FirstTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  FirstTimer.Enabled:=False;
  Visible:=False;

end;

procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;

end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;

  if L_bActive then Exit;
  L_bActive := True;
  
  FirstTimer.Enabled := True;

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    Exit;
  End;

end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  UnLoadDMS;
  SystemAirConDMSList.free;
  ArmAreaDeviceList.Free;
  SendDaemonDataList.Free;
  ReceiveDataList.Free;
end;

procedure TfmMain.MDIChildShow(FormName: String);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          //Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
end;

function TfmMain.MDIForm(FormName: string): TForm;
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  result := nil;
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        result := Screen.Forms[i];
        Exit;
      end;
    end;
  end;
end;

procedure TfmMain.btn_SearchStateClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDeviceCurrentState');
end;

procedure TfmMain.CommandArrayCommandsTDEVICECURRENTSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
//   if stResult = 'TRUE' then L_bShowState := True
//   else L_bShowState := False;

end;

procedure TfmMain.DefaultHandler(var Message);
begin
  inherited DefaultHandler(Message);
  with Tmessage(message) do
  begin
    if Msg = wmTaskbar then
    begin
      if tbi = nil then
      begin
        tbi := TantTaskbarIcon.Create(self);
      end;
      {사라진 트레이 재생}

      tbi.Visible := False;
      tbi.Visible := True;
    end;
  end;//with

end;

procedure TfmMain.mn_DMSClick(Sender: TObject);
begin
  inherited;
  fmSysAirconDMS:= TfmSysAirconDMS.Create(Self);
  fmSysAirconDMS.SHowmodal;
  fmSysAirconDMS.Free;

end;

procedure TfmMain.mn_ControlerClick(Sender: TObject);
begin
  inherited;
  fmSysAirconControler:= TfmSysAirconControler.Create(Self);
  fmSysAirconControler.SHowmodal;
  fmSysAirconControler.Free;

end;

procedure TfmMain.mn_RelayClick(Sender: TObject);
begin
  inherited;
  fmSysAirconRelay:= TfmSysAirconRelay.Create(Self);
  fmSysAirconRelay.SHowmodal;
  fmSysAirconRelay.Free;

end;

procedure TfmMain.mn_DeviceClick(Sender: TObject);
begin
  inherited;
  fmSysAirconDevice:= TfmSysAirconDevice.Create(Self);
  fmSysAirconDevice.SHowmodal;
  fmSysAirconDevice.Free;
  LoadDMS;
  LoadSystemAircon;

end;

procedure TfmMain.LoadDMS;
var
  stSql : string;
  oDMSNode   : TDMSNode;
  TempAdoQuery : TADOQuery;
begin
  UnLoadDMS;
  stSql := ' Select * from TB_SYSAIRCONDMS order by SD_NODENO ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      First;
      while Not Eof do
      begin
        oDMSNode:= TDMSNode.Create(nil);
        oDMSNode.SocketConnected := False;
        oDMSNode.DMSNo := FindField('SD_NODENO').AsInteger;
        oDMSNode.WsAddress:= FindField('SD_IP').AsString;
        oDMSNode.WsPort:= FindField('SD_PORT').AsString;

        SystemAirConDMSList.AddObject(FillZeroNumber(FindField('SD_NODENO').AsInteger,3),oDMSNode);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.UnLoadDMS;
var
  i : integer;
begin
  if SystemAirConDMSList.Count < 1 then Exit;
  Try
    for i := SystemAirConDMSList.Count - 1 downto 0 do
    begin
      TDMSNode(SystemAirConDMSList.Objects[i]).Free;
    end;
    SystemAirConDMSList.Clear;
    if ArmAreaDeviceList.Count < 1 then Exit;
    for i := ArmAreaDeviceList.Count - 1 downto 0 do
    begin
      TArmAreaDevice(ArmAreaDeviceList.Objects[i]).Free;
    end;
    ArmAreaDeviceList.Clear;
  Except
    Exit;
  End;
end;

procedure TfmMain.LoadSystemAircon;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oArmAreaDevice:TArmAreaDevice;
begin
  stSql := ' Select * from TB_SYSAIRCONDEVICE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      First;
      while Not Eof do
      begin
        nIndex := SystemAirConDMSList.IndexOf(FillZeroNumber(FindField('SD_NODENO').AsInteger,3));
        if nIndex > -1 then
        begin
          TDMSNode(SystemAirConDMSList.Objects[nIndex]).AirconDevice_Add(FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString + FindField('SD_DEVICEID').AsString);
        end;
        if FindField('AC_NODENO').AsInteger <> 0 then
        begin
          nIndex := ArmAreaDeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
          if nIndex < 0 then
          begin
            oArmAreaDevice := TArmAreaDevice.Create(nil);
            oArmAreaDevice.SystemAirconDevice_Add(FillZeroNumber(FindField('SD_NODENO').AsInteger,3)+ FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString + FindField('SD_DEVICEID').AsString);
            ArmAreaDeviceList.AddObject(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString,oArmAreaDevice);
          end else
          begin
            TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).SystemAirconDevice_Add(FillZeroNumber(FindField('SD_NODENO').AsInteger,3)+ FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString + FindField('SD_DEVICEID').AsString);
          end;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.ServerConnectTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  ServerConnectTimer.Enabled := False;
  if Not DaemonServerConnected then WinsockPort1.Open := False;
  if Not WinsockPort1.Open then
  begin
    WinsockPort1.WsAddress := L_stDaemonServerIP;
    WinsockPort1.WsPort := L_stDaemonServerPort;
    WinsockPort1.Open := True;
  end;
  ServerConnectTimer.Enabled := Not G_bApplicationTerminate;

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  stFileServerIP : string;
  stFileServerDir :string;
begin
  G_nMonitorSockType := 0; //소켓 사용

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''DAEMON'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

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

      First;
      While Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'IP' then
        begin
          L_stDaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'PORT' then
        begin
          L_stDaemonServerPort := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'CSOCKTYPE' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then G_nMonitorSockType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  if G_nMonitorSockType = 1 then
  begin
    DBSocketReceiveTimer.Enabled := True;
    L_nOldDBSocketSeq := 0;
  end else DBSocketReceiveTimer.Enabled := False;

end;

procedure TfmMain.SetFDaemonServerConnected(const Value: Boolean);
begin
  if FDaemonServerConnected = Value then Exit;
  FDaemonServerConnected := Value;
  if Value then
  begin
    Action_StateSearchExecute(self);
  end;
end;

procedure TfmMain.WinsockPort1WsConnect(Sender: TObject);
begin
  inherited;
  DaemonServerConnected := True;
end;

procedure TfmMain.WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
begin
  inherited;
  DaemonServerConnected := False;
  ErrCode := 0;
end;

procedure TfmMain.WinsockPort1WsDisconnect(Sender: TObject);
begin
  inherited;
  DaemonServerConnected := False;
end;

procedure TfmMain.Action_StateSearchExecute(Sender: TObject);
var
  stSendData : string;
begin
  Try
    stSendData := 'DEVICEALLSTATE_III'+ DATADELIMITER;
    SendDaemonDataList.Add(stSendData);
    SendDaemonTimer.Enabled := True;
  Except
    Exit;
  End;

end;

procedure TfmMain.SendDaemonTimerTimer(Sender: TObject);
var
  PastTime : dword;
  i : integer;
  SendData : string;
begin
  if G_bApplicationTerminate then Exit;
  if SendDaemonDataList.Count  < 1 then Exit;
  if Not DaemonServerConnected then Exit;
  Try
    SendDaemonTimer.Enabled := False;
    if Not WinsockPort1.Open then
    begin
      DaemonServerConnected := False;
      Exit;
    end;
    SendData := sendDaemonDataList.Strings[0] + LINEEND;
    sendDaemonDataList.Delete(0);

    SendDaemon(SendData);

    PastTime := GetTickCount + DelayTime;
    while True do
    begin
      if G_bApplicationTerminate then Exit;
      Application.ProcessMessages;
      if GetTickCount > PastTime then Break;  //300밀리동안 응답 없으면 실패로 처리함
    end;
  Finally
    SendDaemonTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

procedure TfmMain.SendDaemon(aData: string);
begin
  if G_bApplicationTerminate then Exit;
  if WinsockPort1.Open then WinsockPort1.PutString(aData);
end;

procedure TfmMain.WinsockPort1TriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  stPacketData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  DaemonServerConnected := True;
  Try
    for I := 1 to Count do st := st + WinsockPort1.GetChar;
  Except
    Exit;
  End;
  L_stServerComBuff:= L_stServerComBuff + st ;

  repeat
    if G_bApplicationTerminate then Exit;
    stPacketData:= Copy(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    Delete(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    nIndex := Pos('R',stPacketData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(stPacketData,1,nIndex - 1);
    if Length(Trim(stPacketData)) < 2 then continue;
    ReceiveDataList.Add(stPacketData);
    Application.ProcessMessages;
  until pos(LINEEND,L_stServerComBuff) = 0;

end;

procedure TfmMain.DaemonReceiveTimerTimer(Sender: TObject);
var
  stTemp : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DaemonReceiveTimer.Enabled := False;
    if ReceiveDataList.Count < 1 then Exit;
    stTemp := ReceiveDataList.Strings[0];
    ReceiveDataList.Delete(0);
    MonitoringDataProcess(stTemp);
  Finally
    DaemonReceiveTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.MonitoringDataProcess(aData: string; aDaemonNo: integer);
begin
  if G_bApplicationTerminate then Exit;
  DaemonReceiveDataProcess(aData,self);
end;

procedure TfmMain.DaemonReceiveDataProcess(aData: string; Sender: Tobject);
var
  stReceiveType : string; //'N'(노드),'E'(기기),'D'(도어),'A'(알람),'S'(데몬제어-재시작등)
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stDataType : string;    // 'CR'(카드리더등록),'PT'(방범데이터),'AC'(출입데이터),'AT'(근태데이터),'SV'(데몬서버데이터),'DV'(기기데이터)
  stControlType: string;  //'C'(카드데이터 또는 'DV' 인경우 CONNECT 상태),'R'(원격제어),'S'(상태-출입문,알람),'F'(FTP다운로드 상태)
  stDataLength : string;
  stDeviceData : string;
begin
  if aData[1] <> 'R' then Exit; //정상 수신 데이터가 아니다.
  stReceiveType := aData[2];
  stNodeNo := copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  stDoorNo := copy(aData,8,2);
  if Not IsDigit(stDoorNo) then stDoorNo := '0';
  stDoorNo := inttostr(strtoint(stDoorNo));
  stReaderNo := copy(aData,10,2);
  if Not IsDigit(stReaderNo) then stReaderNo := '0';
  stReaderNo := inttostr(strtoint(stReaderNo));
  
  stDataType := copy(aData,12,2);
  stControlType := aData[14];
  stDataLength := copy(aData,15,3);
  if Not IsDigit(stDataLength) then Exit;
  stDeviceData := copy(aData,18,strtoint(stDataLength));

  if stReceiveType = '' then Exit;
  case stReceiveType[1] of
    'S' : begin
            if Pos('RESTART',UpperCase(stDeviceData)) > 0  then
            begin
              DaemonRestart;
            end else if Pos('ALARMREFRESH',UpperCase(stDeviceData)) > 0  then
            begin
              MonitorAlarmRefresh;
            end else if stControlType = 'S' then
            begin
              DeviceAllStateCheckReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);
            end else if stControlType = 'N' then
            begin
              DeviceStateCheckIIIReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData,Sender);
            end else if stDataType = 'BR' then
            begin
              if stDeviceData = 'DAEMONLIVE' then DaemonLive;
            end;
          end;
    'N' : begin
            NODEDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);
          end;
    'E' : begin
            ECUDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);
          end;
    'D' : begin
            DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);
          end;
    'A' : begin
            AlarmDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);
          end;
    else begin
          end;
  end;
end;

procedure TfmMain.MonitorAlarmRefresh;
begin
  //알람 이벤트 Refresh
end;

procedure TfmMain.DaemonRestart;
begin
  //데몬 재시작
end;

procedure TfmMain.DeviceAllStateCheckReceive(aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aDataType, aControlType, aDeviceData: string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  if aControlType <> 'S' then Exit;

  nIndex := ArmAreaDeviceList.IndexOf(stDeviceID);
  if nIndex < 0 then Exit;
  case aDeviceData[2] of //Device Watch Mode
    'N' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmNothing end;
    'A' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmArm end;
    'D' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmDisarm end;
    'P' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmPatrol end;
    'I' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmInit end;
    'T' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmTest end;
    'E' : begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmJaejung end;
    else begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmNothing end;
  end;

end;

procedure TfmMain.DeviceStateCheckIIIReceive(aNodeNo, aEcuID, aDoorNo,
  aReaderNo, aDataType, aControlType, aDeviceData: string;
  Sender: Tobject);
var
  stDeviceID : string;
  nIndex : integer;
  i : integer;
  nPacketSize : integer;
  stEcuPacket : string;
  stWatchMode : string;
begin
  if aControlType <> 'N' then Exit;

  if G_nMonitorSockType = 0 then
    nPacketSize := BINARYPACKETSIZE div 8      //ASCII 8비트가 한패킷
  else nPacketSize := BINARYPACKETSIZE div 4; //HEX 4비트가 한패킷
  for i := 0 to MAXECUCOUNT do
  begin
    stEcuPacket := copy(aDeviceData,(i * nPacketSize) + 1,nPacketSize);
    if G_nMonitorSockType = 0 then
      stEcuPacket := Ascii2Hex(stEcuPacket);  //ASCII 값으로 오면 HEX 로 변환
    stEcuPacket := HexToBinary(stEcuPacket);
    stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + FillZeroNumber(i,2);
    nIndex := ArmAreaDeviceList.IndexOf(stDeviceID);
    if nIndex < 0 then continue;

    stWatchMode := copy(stEcuPacket,3,4);

    if stWatchMode = '0000' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmNothing
    else if stWatchMode = '0001' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmArm
    else if stWatchMode = '0010' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmDisarm
    else if stWatchMode = '0011' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmPatrol
    else if stWatchMode = '0100' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmInit
    else if stWatchMode = '0101' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmTest
    else if stWatchMode = '0110' then TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmJaejung
    else TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmNothing;
  end;

end;

procedure TfmMain.DaemonLive;
begin

end;

procedure TfmMain.NODEDataProcess(aNodeNo, aEcuID, aDoorNo, aReaderNo,
  aDataType, aControlType, aDeviceData: string);
begin
  //노드 연결상태
end;

procedure TfmMain.ECUDataProcess(aNodeNo, aEcuID, aDoorNo, aReaderNo,
  aDataType, aControlType, aDeviceData: string);
begin
  //컨트롤러 연결상태 및 출입데이터
end;

procedure TfmMain.AlarmDataProcess(aNodeNo, aEcuID, aDoorNo, aReaderNo,
  aDataType, aControlType, aDeviceData: string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  nIndex := ArmAreaDeviceList.IndexOf(stDeviceID);
  if nIndex < 0 then Exit;

  if aDataType = 'DV' then //기기정보
  begin
    if aControlType = 'S' then //상태정보
    begin
      case UpperCase(aDeviceData)[1] of
       'A': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmArm end;
       'D': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmDisarm end;
       'T': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmTest end;
       'I': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmInit end;
       'P': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmPatrol end;
       'E': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmJaejung end;
      else
        begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmNothing end;
      end;
    end;
  end else if aDataType = 'PT' then  //Alarm 발생 전체전문
  begin
    case UpperCase(aDeviceData[40])[1] of
     'A': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmArm end;
     'D': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmDisarm end;
     'T': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmTest end;
     'I': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmInit end;
     'P': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmPatrol end;
     'E': begin TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode := cmJaejung end;
    else  begin  end;
    end;
  end else if aDataType = 'AL' then  //전체전문
  begin
  end;
end;

procedure TfmMain.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aReaderNo,
  aDataType, aControlType, aDeviceData: string);
begin
  //출입문 상태 이벤트
end;

procedure TfmMain.DMSSendTimerTimer(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if SystemAirConDMSList.Count < 1 then Exit;
  Try
    DMSSendTimer.Enabled := False;
    for i := 0 to SystemAirConDMSList.Count - 1 do
    begin
      TDMSNode(SystemAirConDMSList.Objects[i]).DMSPowerOff_Sending;
    end;
  Finally
    DMSSendTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.DBSocketReceiveTimerTimer(Sender: TObject);
var
  stSql : string;
begin
  if G_bApplicationTerminate then Exit;
  Try
    DBSocketReceiveTimer.Enabled := False;
    stSql := ' Select * from TB_CLIENTSOCK ';
    stSql := stSql + ' Where seq > ' + inttostr(L_nOldDBSocketSeq);

    with dmDBModule.ADODBSocketQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 0 then Exit;
      while Not Eof do
      begin
        L_nOldDBSocketSeq := FindField('SEQ').AsInteger;
        ReceiveDataList.Add(FindField('CSDATA').AsString);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    if G_nMonitorSockType = 1 then DBSocketReceiveTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

end.
