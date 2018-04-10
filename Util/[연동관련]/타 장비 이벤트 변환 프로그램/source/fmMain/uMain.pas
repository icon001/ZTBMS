unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ToolWin, ComCtrls,
  uCommonVariable, StdCtrls,ADOdb,ActiveX, Buttons, uSubForm, CommandArray;

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
    ToolButton1: TToolButton;
    Menu_ImageList: TImageList;
    ToolButton2: TToolButton;
    N2: TMenuItem;
    mn_MappingCode: TMenuItem;
    N5: TMenuItem;
    mn_Config: TMenuItem;
    AdoConnectCheckTimer: TTimer;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    MenuItem3: TMenuItem;
    Ver011: TMenuItem;
    miExit: TMenuItem;
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
    procedure mn_MappingCodeClick(Sender: TObject);
    procedure mn_ConfigClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure CommandArrayCommandsTSERVERCURRENTSTATEExecute(
      Command: TCommand; Params: TStringList);
    procedure ToolButton2Click(Sender: TObject);
    procedure CommandArrayCommandsTDEVICECURRENTSTATEExecute(
      Command: TCommand; Params: TStringList);
  private
    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bSERVERCURRENTSTATEView : Boolean;
    L_bDEVICECURRENTSTATEView : Boolean;
    L_bActive : Boolean;
    { Private declarations }
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
  private
    procedure DeviceSocketAccept(Sender: TObject;aAcceptIP,aTemp,aTemp1:string);
    procedure DeviceSocketDisconnected(Sender: TObject;aIP,aTemp,aTemp1:string);
    procedure DeviceSeverStartError(Sender: TObject;aErrCode,aTemp1,aTemp2:string);
    procedure DeviceReceivePacketData(Sender: TObject;aConnectIP,aReceivePacketData,aTemp2:string);
    procedure DeviceSendPacketData(Sender: TObject;aConnectIP,aSendPacketData,aTemp2:string);
    procedure DeviceStart;
  private
    function ConversionHexToASCII(aCardNo:string):string;
    function ConvertHIDCardNO(aCardNO1,aCardNo2:string):string;
    function InsertIntoTB_RELAYEVENT(aCode,aDate,aCardNo,aSendstatus:string):Boolean;
    procedure CardReceiveEventData(Sender: TObject;aCardNo,aDateTime,aIP:string);
    procedure DeviceReceiveEventData(Sender: TObject;aTxRx,aPacket,aIP:string);
  private
    procedure DeviceLoad;
    procedure LoadConfig;
    procedure CardRegistPortOpen;
  private
    procedure CardRegistServerAccecept;
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation

uses
  uLomosUtil,
  uDBModule,
  uDataBaseConfig,
  uDevice,
  uMappingCode,
  uConfig,
  uCardRegModule,
  uServerCurrentState,
  uDeviceCurrentState,
  uCardServerModule;
  
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

  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  L_bApplicationTerminate := False;
  LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','Program Start ');

  tbi.Visible := True;
  tbi.Hint := '기기변환 시스템 정지';
  FirstTimer.Enabled := False;

  LogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  dmDBModule.OnAdoConnected := DataModuleAdoConnected;
  dmDevice.OnSocketAccepted := DeviceSocketAccept;
  dmDevice.OnDisconnect := DeviceSocketDisconnected;
  dmDevice.OnSeverStartError := DeviceSeverStartError;
  dmDevice.OnReceivePacketData := DeviceReceivePacketData;
  dmDevice.OnSendPacketData := DeviceSendPacketData;

  dmCardReg.OnCardReceiveEvent := CardReceiveEventData;
  dmCardReg.OnEvent := DeviceReceiveEventData;
  dmCardServer.OnCardReceiveEvent := CardReceiveEventData;
  dmCardServer.OnEvent := DeviceReceiveEventData;

  if DeviceList = nil then
    DeviceList := TStringList.Create;


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

  LoadConfig;
  DeviceLoad;
  DeviceStart;
  
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

procedure TfmMain.DeviceStart;
begin
  dmDevice.ServerStart;
  tbi.Hint := '기기변환 시스템 정상';
end;

procedure TfmMain.DeviceSocketAccept(Sender: TObject; aAcceptIP, aTemp,
  aTemp1: string);
var
  fmServerCurrentState :TForm;
begin
  if L_bSERVERCURRENTSTATEView then
  begin
    fmServerCurrentState := MDIForm('TfmServerCurrentState');
    if fmServerCurrentState <> nil then
    begin
      TfmServerCurrentState(fmServerCurrentState).DisplayStringGrid('','Er',aAcceptIP,'00','Accepted');
    end;
  end;
end;

procedure TfmMain.DeviceSocketDisconnected(Sender: TObject; aIP, aTemp,
  aTemp1: string);
var
  fmServerCurrentState :TForm;
begin
  if L_bSERVERCURRENTSTATEView then
  begin
    fmServerCurrentState := MDIForm('TfmServerCurrentState');
    if fmServerCurrentState <> nil then
    begin
      TfmServerCurrentState(fmServerCurrentState).DisplayStringGrid('','Er',aIP,'00','DisConnected');
    end;
  end;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;

  dmDevice.ServerStop;
  dmCardServer.ServerStop;

end;

procedure TfmMain.mn_MappingCodeClick(Sender: TObject);
begin
  fmMappingCode := TfmMappingCode.Create(Self);
  fmMappingCode.ShowModal;
  fmMappingCode.Free;
  DeviceLoad;
end;

procedure TfmMain.DeviceSeverStartError(Sender: TObject; aErrCode, aTemp1,
  aTemp2: string);
var
  fmServerCurrentState :TForm;
begin
  if L_bSERVERCURRENTSTATEView then
  begin
    fmServerCurrentState := MDIForm('TfmServerCurrentState');
    if fmServerCurrentState <> nil then
    begin
      TfmServerCurrentState(fmServerCurrentState).DisplayStringGrid('','Er','','00','Device Server Start Error !!'+ aErrCode);
    end;
  end;
end;

procedure TfmMain.DeviceReceivePacketData(Sender: TObject;
  aConnectIP,aReceivePacketData, aTemp2: string);
var
  fmServerCurrentState :TForm;
  stEcuId : string;
  aCommand : char;
begin
  stEcuId:= Copy(aReceivePacketData,15,2);
  aCommand:= aReceivePacketData[17];
  if L_bSERVERCURRENTSTATEView then
  begin
    fmServerCurrentState := MDIForm('TfmServerCurrentState');
    if fmServerCurrentState <> nil then
    begin
      TfmServerCurrentState(fmServerCurrentState).DisplayStringGrid(aCommand,'RX',aConnectIP,stEcuId,aReceivePacketData);
    end;
  end;
end;

procedure TfmMain.DeviceSendPacketData(Sender: TObject; aConnectIP,aSendPacketData,
   aTemp2: string);
var
  fmServerCurrentState :TForm;
  stEcuId : string;
  aCommand : char;
begin
  //송신되는 항목 보여주기
  stEcuId:= Copy(aSendPacketData,15,2);
  aCommand:= aSendPacketData[17];
  if L_bSERVERCURRENTSTATEView then
  begin
    fmServerCurrentState := MDIForm('TfmServerCurrentState');
    if fmServerCurrentState <> nil then
    begin
      TfmServerCurrentState(fmServerCurrentState).DisplayStringGrid(aCommand,'TX',aConnectIP,stEcuId,aSendPacketData);
    end;
  end;
end;

procedure TfmMain.DeviceLoad;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  if DeviceList = nil then
    DeviceList := TStringList.Create;

  DeviceList.Clear;
  DeviceList.Add('00');

  stSql := 'select * from TB_RELAYDEVICEMAPPINGCODE ';

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
      while Not Eof do
      begin
        nIndex := DeviceList.IndexOf(FillZeroNumber(strtoint(FindField('RM_ECUID').AsString),2));
        if nIndex < 0 then DeviceList.Add(FillZeroNumber(strtoint(FindField('RM_ECUID').AsString),2));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  DeviceList.Sort;
end;

procedure TfmMain.mn_ConfigClick(Sender: TObject);
begin
  dmCardReg.PortClose;
  dmCardServer.ServerStop;
  fmConfig := TfmConfig.Create(Self);
  fmConfig.ShowModal;
  fmConfig.Free;
  LoadConfig;
end;

procedure TfmMain.LoadConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  G_nCARDLENGTHTYPE := 0;

  stSql := 'select * from TB_CONFIG ';

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
      while Not Eof do
      begin
        if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)  // 0.고정4Byte,1.길이ASCII,2.KT
        end else if FindField('CO_CONFIGGROUP').AsString = 'DEVCONV' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'INCARD' then G_nInputCardType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'SAVECARD' then G_nSaveCardType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'INDEVTYPE' then G_nInputDeviceType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'INCOMPORT' then G_nCardRegisterPort := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'SERVERPORT' then G_nCardServerPort := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'INCDLENTP' then G_nInputCardLengthType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  if G_nInputDeviceType = 0 then
  begin
    if G_nCardRegisterPort > 0 then CardRegistPortOpen;
  end else if G_nInputDeviceType = 1 then  //RUC 스피드게이트
  begin
    if G_nCardServerPort > 0 then CardRegistServerAccecept;
  end;

end;

procedure TfmMain.CardRegistPortOpen;
begin
  dmCardReg.COMPORT := G_nCardRegisterPort;
  if Not dmCardReg.PortOpen then
  begin
    showmessage('등록기 포트 오픈에 실패 하였습니다.');
  end;
end;

procedure TfmMain.CardReceiveEventData(Sender: TObject; aCardNo, aDateTime,aIP: string);
var
  stCardNo1 : string;
  stCardNo2 : string;
begin
  if G_nInputCardType = 0 then  //시리얼 Hex 타입
  begin
    if G_nSaveCardType = 1 then  //ASCII 타입으로 저장할때
      aCardNo := ConversionHexToASCII(aCardNo);
  end else if G_nInputCardType = 1 then //시리얼 Deceimal 타입
  begin
    aCardNo := Dec2Hex(strtoint(aCardNo),8);
    if G_nSaveCardType = 1 then
      aCardNo := ConversionHexToASCII(aCardNo);
  end else if G_nInputCardType = 2 then //시리얼 HID-Deceimal 타입
  begin
    stCardNo1 := copy(aCardNo,1,5);
    stCardNo2 := copy(aCardNo,6,5);
    aCardNo := ConvertHIDCardNO(stCardNO1,stCardNo2);
    if G_nSaveCardType = 1 then
      aCardNo := ConversionHexToASCII(aCardNo);
  end else if G_nInputCardType = 3 then //ASCII 타입
  begin
    if G_nSaveCardType = 0 then
       aCardNo := Ascii2Hex(aCardNo);
  end;
  InsertIntoTB_RELAYEVENT('1',aDateTime,aCardNo,'N');

  dmDevice.CardEventSendig;
end;

procedure TfmMain.ToolButton1Click(Sender: TObject);
begin
  MDIChildShow('TfmServerCurrentState');
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

procedure TfmMain.CommandArrayCommandsTSERVERCURRENTSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stView : string;
begin
  stView := Params.Values['VALUE'];

  if UpperCase(stView) = 'TRUE' then L_bSERVERCURRENTSTATEView := True
  else L_bSERVERCURRENTSTATEView := False;

end;

procedure TfmMain.CardRegistServerAccecept;
begin
  dmCardServer.ServerStart(G_nCardServerPort);
end;

function TfmMain.InsertIntoTB_RELAYEVENT(aCode, aDate, aCardNo,
  aSendstatus: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYEVENT( ';
  stSql := stSql + ' RM_CODE,';
  stSql := stSql + ' RE_DATE,';
  stSql := stSql + ' RE_CARDNO,';
  stSql := stSql + ' RE_SEND ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aSendstatus + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.ConversionHexToASCII(aCardNo: string): string;
begin
  result := Hex2Ascii(aCardNo);

end;

function TfmMain.ConvertHIDCardNO(aCardNO1, aCardNo2: string): string;
begin
  result := Dec2Hex(strtoInt(aCardNo1),4) + Dec2Hex(strtoInt(aCardNo2),4);

end;

procedure TfmMain.ToolButton2Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmDeviceCurrentState');

end;

procedure TfmMain.DeviceReceiveEventData(Sender: TObject; aTxRx, aPacket,
  aIP: string);
var
  fmDeviceCurrentState :TForm;
begin
  if L_bDEVICECURRENTSTATEView then
  begin
    fmDeviceCurrentState := MDIForm('TfmDeviceCurrentState');
    if fmDeviceCurrentState <> nil then
    begin
      TfmDeviceCurrentState(fmDeviceCurrentState).DisplayStringGrid(aTxRx,aIP,aPacket);
    end;
  end;

end;

procedure TfmMain.CommandArrayCommandsTDEVICECURRENTSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stView : string;
begin
  stView := Params.Values['VALUE'];

  if UpperCase(stView) = 'TRUE' then L_bDEVICECURRENTSTATEView := True
  else L_bDEVICECURRENTSTATEView := False;

end;

end.
