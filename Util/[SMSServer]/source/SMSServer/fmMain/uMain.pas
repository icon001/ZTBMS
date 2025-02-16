unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, 
  iniFiles, uSubForm, CommandArray,systeminfos,AdPacket,AdPort, ComCtrls,
  Gauges, StdCtrls, Buttons, ExtCtrls, antTaskbarIcon, Menus,ADODB,ActiveX,
  ToolWin;

type
  TfmMain = class(TfmASubForm)
    StatusBar1: TStatusBar;
    Gauge2: TGauge;
    Pan_Gauge: TPanel;
    Gauge1: TGauge;
    StaticText1: TStaticText;
    Image1: TImage;
    tbi: TantTaskbarIcon;
    Timer1: TTimer;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    miExit: TMenuItem;
    N3: TMenuItem;
    mn_Ver: TMenuItem;
    N1: TMenuItem;
    MainMenu1: TMainMenu;
    mn_setting: TMenuItem;
    mn_BasiicConfig: TMenuItem;
    mn_SMSInfoSetting: TMenuItem;
    StartMonitorTimer: TTimer;
    mn_Close: TMenuItem;
    mn_smsmonitoring: TMenuItem;
    mn_alarmCode: TMenuItem;
    SMSSendTimer: TTimer;
    mn_Login: TMenuItem;
    SMS1: TMenuItem;
    N2: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowClick(Sender: TObject);
    procedure CommandArrayCommandsTDATAExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_BasiicConfigClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure StartMonitorTimerTimer(Sender: TObject);
    procedure mn_SMSInfoSettingClick(Sender: TObject);
    procedure mn_CloseClick(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure mn_alarmCodeClick(Sender: TObject);
    procedure SMSSendTimerTimer(Sender: TObject);
    procedure mn_smsmonitoringClick(Sender: TObject);
    procedure CommandArrayCommandsTSMSMONITORExecute(Command: TCommand;
      Params: TStringList);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure mn_LoginClick(Sender: TObject);
    procedure SMS1Click(Sender: TObject);
  private
    { Private declarations }
    procedure MemoryCreate;
    procedure MemoryClear;
    procedure MemoryFree;
    procedure ClientConfigRead;
    procedure CenterPanel;
  private
    procedure MainFormSetting;
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    Function  MDIForm(FormName:string):TForm;
  private
    L_bClose : Boolean;
    procedure MainMenuVisible(aVisible:Boolean);
    procedure StartMonitor;
  private
    L_nSMSUse : integer; //0:미사용,1:사용
    L_nAreagubun : integer; //0:존별설정,1:침입신호별설정,2:방범구역별설정
    L_nSMSNumGubun : integer; //0:알람구분별 전송,1:일괄전송
    L_nServerType : integer;  //0: 아주대
    L_stSMSDBType : string;  //sms서버 DBType
    L_stSMSServerIP : string;  //sms서버 IP
    L_stSMSServerPort : string; //SMS 서버 PORT
    L_stSMSServerID : string;  //SMS 서버 계정
    L_stSMSServerPW : string;  //SMS 계정 비밀번호
    L_stSMSDataBaseName : string;  //SMS 데이터베이스명
    L_stSMSDefaultMessage : string; //SMS 디폴트 메시지

    L_stSMSUserID   : string;  //SMS 사용자 계정
    L_stSMSCallbackNum   : string;  //회신번호
    L_stSMSSenderName    : string;  //발신자명
    L_stSMSSenderID      : string;  //발신자아이디

    L_bSMSSendStop : Boolean;
    L_bSMSMonitoring : Boolean;

    SMSAlarmCodeList : TStringList; //전송 AlarmCode List;

    procedure GetSMSServerConfig;
    procedure GetSMSAlarmCodeSetting;
    procedure AlarmToSmsSend;
  private
    function UpdateTB_ALARMEVENTSMSSend(aDATE,aTIME,aNODENO,aECUID,aMSGNO,aSmsSend:string):Boolean;
  private
    procedure SMSSendEvent(Sender: TObject;  aUserID, aSubject, aSmsMessage,aCallBackUrl,aCallback, aSendername, aDestNumber,aCdrID,aResult:string);
  public
    { Public declarations }
  end;

var
  fmMain: TfmMain;

implementation
uses
  uDataModule1,
  uCommonVariable,
  uCardReader,
  uDataBaseConfig,
  uSMSConfig,
  uSMSZoneSetting,
  uSMSAlarmCodeSetting,
  uSMSModule, uSMSMonitoring, uLogin, uSMSLogin, uSMSUser;

{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
  i : integer;
  stLogoFile : string;
begin
  NETTYPE :='TCPIP';
  self.ModuleID := 'Main';
  G_bApplicationTerminate := False;
  G_stExeFolder  := ExtractFileDir(Application.ExeName);

  MainFormSetting;
  Timer1.Enabled := True;

  stLogoFile := G_stExeFolder + '\..\image\Logo.JPG';
  if FileExists(stLogoFile) then
  Image1.Picture.LoadFromFile(stLogoFile);

  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

  SMSAlarmCodeList := TStringList.Create;

  L_bSMSSendStop := False;
  GetSMSServerConfig;
  //GetSMSAlarmCodeSetting;
  dmSMSModule.OnSMSEvent := SMSSendEvent;

  if L_nSMSUse = 1 then
  begin
    SMSSendTimer.Enabled := True;
  end;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width - StatusBar1.Panels[4].Width - StatusBar1.Panels[5].Width;
  CenterPanel;
  mn_Ver.Caption := 'Ver ' + strBuildInfo ;

end;

procedure TfmMain.MDIChildGradeShow(FormName: String; aInsertGrade,
  aUpdateGrade, aDeleteGrade: Boolean);
var
  tmpFormClass : TFormClass;
  tmpClass : TPersistentClass;
  tmpForm : TForm;
  clsName : String;
  i : Integer;
begin
  tmpClass := FindClass(FormName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(FormName) then
      begin
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    tmpForm.Show;
  end;

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
          Screen.Forms[i].WindowState := wsMaximized;
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

procedure TfmMain.FormShow(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;


  tbi.Visible := True;
  tbi.Hint := 'SMS 서버 Start';




end;

procedure TfmMain.MainFormSetting;
var
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\zmos.INI');
    with ini_fun do
    begin
      fmMain.Width :=   ini_fun.ReadInteger('Form','Width',1024);
      fmMain.Height :=   ini_fun.ReadInteger('Form','Height',734);
      fmMain.Left :=   ini_fun.ReadInteger('Form','Left',0);
      fmMain.Top :=    ini_fun.ReadInteger('Form','Top',0);
      if ini_fun.ReadInteger('Form','Maximized',1) = 0 then fmMain.WindowState := wsNormal
      else fmMain.WindowState := wsMaximized;
      G_stBuildingStep := ini_fun.ReadString('Config','Building','0');
    end;
  Finally
    ini_fun.Free;
  End;

  MemoryCreate;
  MemoryClear;

  ClientConfigRead;

  fmMain.Caption := fmMain.Caption + '[' + strBuildInfo + ']';

  G_bAlarmRefreshStart := False;

end;

procedure TfmMain.MemoryClear;
begin

end;

procedure TfmMain.MemoryCreate;
begin
  SetLength(G_arrAccessEventShowTable,ACCESSEVENTMAXCELL + 1);
  SetLength(G_arrAccess1SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(G_arrAccess2SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(G_arrAccess3SizeTable,ACCESSEVENTMAXCELL + 1);
  SetLength(G_arrAlarm1SizeTable,ALARMEVENTMAXCELL + 1);
  SetLength(G_arrAlarm2SizeTable,ALARMEVENTMAXCELL + 1);
  SetLength(G_arrAlarmEventShowTable,ALARMEVENTMAXCELL + 1);
  SetLength(G_arrMapAlarm1SizeTable,MAPALARMEVENTMAXCELL + 1);


end;

procedure TfmMain.MemoryFree;
begin
  SMSAlarmCodeList.Free;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  G_bApplicationTerminate := True;
  MemoryFree;
end;

procedure TfmMain.ClientConfigRead;
var
  i : integer;
  ini_fun : TiniFile;
begin
  Try
    ini_fun := TiniFile.Create(G_stExeFolder + '\zmos.INI');
    with ini_fun do
    begin
      if ReadString('환경설정','알람발생','N') = 'Y' then G_bACAlarmUse := True
      else G_bACAlarmUse := False;
      if ReadString('환경설정','장시간열림알람발생','N') = 'Y' then G_bLongDoorOpenAlarmUse := True
      else G_bLongDoorOpenAlarmUse := False;
      if ReadString('환경설정','출입전용알람발생','N') = 'Y' then G_bACAlarmEventUse := True
      else G_bACAlarmEventUse := False;
      G_stACAlarmEventCode := ReadString('환경설정','출입전용알람코드','NF,AF');
      G_stACAlaramFile := ReadString('환경설정','알람파일','');
      if ReadString('환경설정','방범알람발생','N') = 'Y' then G_bPTAlarmUse := True
      else G_bPTAlarmUse := False;
      if ReadString('환경설정','알람메시지','N') = 'Y' then G_bPTAlarmMessageUse := True
      else G_bPTAlarmMessageUse := False;

      G_stPTAlaramFile := ReadString('환경설정','방범알람파일','');

      G_nAccessEventSearch := ReadInteger('환경설정','출입이벤트',1);

      if ReadString('환경설정','범례표시','Y') = 'Y' then G_bACIntroView := True
      else G_bACIntroView := False;
      if ReadString('환경설정','폐쇄모드','N') = 'Y' then G_bColseModeView := True
      else G_bColseModeView := False;
      if ReadString('환경설정','화재메시지','Y') = 'Y' then G_bFireMessageView := True
      else G_bFireMessageView := False;
      G_nFireTime := ReadInteger('환경설정','화재표시시간',30);

      G_stFireState := ReadString('환경설정','화재상태','FI');
      G_nMonitorGubun := ReadInteger('환경설정','모니터방법',0); //모니터링 시 전체모니터링 0,그룹별모니터링 1
      G_nSearchIndex := ReadInteger('환경설정','조회방법',0); //기본값조회 0,조회안함 1
      G_nCompanySearchIndex := ReadInteger('환경설정','회사정보조회순서',0); //회사정보조회시 코드순 0,명칭순 1
      G_nBuildingSearchIndex := ReadInteger('환경설정','위치정보조회순서',0); //위치정보조회시 코드순 0,명칭순 1
      if ReadString('환경설정','카드중복발급','N') = 'Y' then G_bKTDupCardReg := True
      else G_bKTDupCardReg := False;
      G_stRelayDefaultCode := ReadString('환경설정','연동코드','001');

      G_nCardRegisterPort := ReadInteger('환경설정','등록기포트',0);
      G_nCardCreatePort := ReadInteger('CARDCREATE','COMPORT',0);

      G_nMonitoringAttendReport := ReadInteger('환경설정','근태보고서',0);


      for i := 0 to ACCESSEVENTMAXCELL do
      begin
        if (i = 3) or (i = 11) then
          G_arrAccessEventShowTable[i] := Readinteger('출입이벤트',inttostr(i),0)
        else
          G_arrAccessEventShowTable[i] := Readinteger('출입이벤트',inttostr(i),1);
        if (i = 0) or (i = 2) then
        begin
          G_arrAccess1SizeTable[i] := Readinteger('출입이벤트1사이즈',inttostr(i),140);
          G_arrAccess2SizeTable[i] := Readinteger('출입이벤트2사이즈',inttostr(i),140);
          G_arrAccess3SizeTable[i] := Readinteger('출입이벤트3사이즈',inttostr(i),140);
        end else
        begin
          G_arrAccess1SizeTable[i] := Readinteger('출입이벤트1사이즈',inttostr(i),90);
          G_arrAccess2SizeTable[i] := Readinteger('출입이벤트2사이즈',inttostr(i),90);
          G_arrAccess3SizeTable[i] := Readinteger('출입이벤트3사이즈',inttostr(i),90);
        end;
      end;
      for i := 0 to ALARMEVENTMAXCELL do
      begin
        if (i = 5) or (i = 7) then
          G_arrAlarmEventShowTable[i] := Readinteger('알람이벤트',inttostr(i),0)
        else
          G_arrAlarmEventShowTable[i] := Readinteger('알람이벤트',inttostr(i),1);
        if (i = 0) or (i = 2) then
        begin
          G_arrAlarm1SizeTable[i] := Readinteger('알람이벤트1사이즈',inttostr(i),140);
          G_arrAlarm2SizeTable[i] := Readinteger('알람이벤트2사이즈',inttostr(i),140);
        end else
        begin
          G_arrAlarm1SizeTable[i] := Readinteger('알람이벤트1사이즈',inttostr(i),90);
          G_arrAlarm2SizeTable[i] := Readinteger('알람이벤트2사이즈',inttostr(i),90);
        end;
      end;
      for i := 0 to MAPALARMEVENTMAXCELL do
      begin
        if (i = 3) then
        begin
          G_arrMapAlarm1SizeTable[i] := Readinteger('맵알람이벤트1사이즈',inttostr(i),300);
        end else
        begin
          G_arrMapAlarm1SizeTable[i] := Readinteger('맵알람이벤트1사이즈',inttostr(i),150);
        end;
      end;

      if G_nCardRegisterPort <> 0 then
      begin
        try
          with dmCardReader do
          begin
            ApdDataPacket1.AutoEnable := false;
            ApdDataPacket1.StartCond := scString;
            ApdDataPacket1.StartString := #$02;
            ApdDataPacket1.EndCond := [ecString];
            ApdDataPacket1.EndString := #$03;
            ApdDataPacket1.Timeout := 0;
            ReaderPort.ComNumber := G_nCardRegisterPort;
            ReaderPort.Open := true;
            ApdDataPacket1.Enabled := True;
          end;
        except
          Exit;
        end;
      end;
      if G_nCardCreatePort <> 0 then
      begin
        try
          with dmCardReader do
          begin
            CardCreatePort.DeviceLayer := dlWin32;
            CardCreatePort.Baud := 9600;
            CardCreatePort.ComNumber := G_nCardCreatePort;
            CardCreatePort.Open := true;
          end;
        except
          Exit;
        end;
      end;
    end;
  Finally
    ini_fun.free;
  End;

end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width - StatusBar1.Panels[3].Width- StatusBar1.Panels[4].Width- StatusBar1.Panels[5].Width;
  CenterPanel;

end;

procedure TfmMain.CenterPanel;
var
  nTotW,nTotH,nPanW,nPanH:integer;
  nTop,nLeft : integer;
  nStartH,nStartW : integer;
begin
  nStartH := 65;
  nStartW := 0;
  nTotW := Width;
  nTotH := Height;
  nPanW := Pan_Gauge.Width;
  nPanH := Pan_Gauge.Height;
  nTop := nStartH + (nTotH div 2) - (nPanH div 2);
  nLeft := nStartW + (nTotW div 2) - (nPanW div 2);
  Pan_Gauge.Top := nTop;
  Pan_Gauge.Left := nLeft;

end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  Timer1.Enabled:=False;
  Visible:=False;
  ShowWindow( Application.Handle, SW_HIDE );
  MainMenuVisible(False);
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  inherited;
  L_bClose := True;
  Close;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  Try
    if L_bClose = False then
    Begin
      CanClose := False;
      Visible := False;
      ShowWindow( Application.Handle, SW_HIDE );
      MainMenuVisible(False);
    end;
  Except
    Exit;
  End;
end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  inherited;
  if Not Visible then Visible := True;

end;

procedure TfmMain.CommandArrayCommandsTDATAExecute(Command: TCommand;
  Params: TStringList);
var
  stParam : string;
  stValue : string;
begin
  stParam := Params.Values['PARAM'];
  stValue := Params.Values['VALUE'];

  if UpperCase(stParam) = 'LOGIN' then
  begin
    if UpperCase(stValue) = 'TRUE' then
    begin
      //MainMenuVisible(True);
      StartMonitorTimer.Enabled := True;

    end else
    begin
      MainMenuVisible(False);
      Close;
    end;
  end;

end;

procedure TfmMain.MainMenuVisible(aVisible: Boolean);
var
  i : integer;
begin
  Exit;
  //ToolBar1.Visible := aVisible;
  for i := 0 to MainMenu1.items.Count - 1 do
  begin
    MainMenu1.Items[i].Visible := aVisible;
  end;
  if L_nSMSUse = 0 then mn_SMSInfoSetting.Visible := False;
  mn_setting.Visible := True;
  mn_Login.Visible := Not aVisible;
  mn_BasiicConfig.Visible := aVisible;
  mn_SMSInfoSetting.Visible := aVisible;
end;

procedure TfmMain.StartMonitor;
begin

end;

procedure TfmMain.GetSMSServerConfig;
var
  TempAdoQuery : TADOQuery;
  stSql : string;
begin
  L_bSMSSendStop := True;
  
  L_nSMSUse := 0;
  L_nAreagubun := 0;
  L_nSMSNumGubun := 0;
  L_nServerType := 0;
  L_stSMSServerIP := '127.0.0.1';
  L_stSMSServerPort := '1433';
  L_stSMSServerID := 'sa';
  L_stSMSServerPW := 'sapasswd';
  L_stSMSDataBaseName := 'sms';
  L_stSMSUserID   := '';
  L_stSMSCallbackNum   := '';
  L_stSMSSenderName    := '';
  L_stSMSSenderID := '1111';
  L_stSMSDBType := UpperCase('mysql');

  Try
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      with  TempAdoQuery  do
      begin
        stSql := 'Select * from TB_CONFIG ';
        stSql := stSql + ' where CO_CONFIGGROUP = ''SMS'' ';
        Close;
        SQL.Text := stSql;

        Try
          Open;
        Except
           //showmessage('Select Error!!');
           Exit;
        End;
        if RecordCount < 1 then
        begin
          Exit;
        end;
        While Not Eof do
        begin
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSUSE' then
          begin
            L_nSMSUse := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'AREAGUBUN' then
          begin
            L_nAreagubun := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSNUMTYPE' then
          begin
            L_nSMSNumGubun := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERTYPE' then
          begin
            L_nServerType := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERIP' then
          begin
            L_stSMSServerIP := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SERVERPORT' then
          begin
            L_stSMSServerPort := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'USERID' then
          begin
            L_stSMSServerID := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'USERPW' then
          begin
            L_stSMSServerPW := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'DBNAME' then
          begin
            L_stSMSDataBaseName := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'DBTYPE' then
          begin
            L_stSMSDBType := UpperCase(FindField('CO_CONFIGVALUE').AsString);
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SMSUSERID' then
          begin
            L_stSMSUserID := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'BACKNUM' then
          begin
            L_stSMSCallbackNum := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SENDERNAME' then
          begin
            L_stSMSSenderName := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'SENDERID' then
          begin
            L_stSMSSenderID := FindField('CO_CONFIGVALUE').AsString;
          end;
          if UpperCase(FindField('CO_CONFIGCODE').AsString) = 'MESSAGE' then
          begin
            L_stSMSDefaultMessage := FindField('CO_CONFIGVALUE').AsString;
          end;

          Next;
        end;
        if L_nSMSUse = 0 then
        begin
          mn_SMSInfoSetting.visible := False;
        end else
        begin
          L_bSMSSendStop := False;
          SMSSendTimer.Enabled := True;
          mn_SMSInfoSetting.visible := True;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;
end;

procedure TfmMain.mn_BasiicConfigClick(Sender: TObject);
begin
  inherited;
  fmSMSConfig:= TfmSMSConfig.Create(Self);
  fmSMSConfig.ShowModal;
  GetSMSServerConfig;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  inherited;
  if Not Visible then Visible := True;
end;

procedure TfmMain.StartMonitorTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  StartMonitorTimer.Enabled := False;
  MainMenuVisible(True);
  StartMonitor;
end;

procedure TfmMain.mn_SMSInfoSettingClick(Sender: TObject);
begin
  inherited;
  if L_nAreagubun = 0 then
  begin
    fmSMSZoneSetting:= TfmSMSZoneSetting.Create(Self);
    fmSMSZoneSetting.DefaultMessage := L_stSMSDefaultMessage;

    fmSMSZoneSetting.ShowModal;
  end;

end;

procedure TfmMain.mn_CloseClick(Sender: TObject);
begin
  inherited;
  L_bClose := True;
  Close;

end;

procedure TfmMain.ToolButton5Click(Sender: TObject);
begin
  inherited;
  L_bClose := True;
  Close;

end;

procedure TfmMain.ToolButton1Click(Sender: TObject);
begin
  inherited;
  MainMenuVisible(False);
  Visible := False;
end;

procedure TfmMain.ToolButton2Click(Sender: TObject);
begin
  inherited;
  mn_SMSInfoSettingClick(Sender);
end;

procedure TfmMain.mn_alarmCodeClick(Sender: TObject);
begin
  inherited;
    fmSMSAlarmCodeSetting:= TfmSMSAlarmCodeSetting.Create(Self);
    fmSMSAlarmCodeSetting.ShowModal;
    //GetSMSAlarmCodeSetting;
end;

procedure TfmMain.GetSMSAlarmCodeSetting;
var
  TempAdoQuery : TADOQuery;
  stSql : string;
begin
  L_bSMSSendStop := True;

  SMSAlarmCodeList.Clear;
  Try
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      with  TempAdoQuery  do
      begin
        stSql := 'Select * from TB_ALARMSTATUSCODE ';
        stSql := stSql + ' where AL_SMSSEND = ''Y'' ';
        stSql := stSql + ' AND AL_GUBUN = ''001'' ';
        Close;
        SQL.Text := stSql;

        Try
          Open;
        Except
           //showmessage('Select Error!!');
           Exit;
        End;
        if RecordCount < 1 then
        begin
          Exit;
        end;
        While Not Eof do
        begin
          SMSAlarmCodeList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
          Next;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    if L_nSMSUse <> 0 then L_bSMSSendStop := False;
    Exit;
  End;
end;

procedure TfmMain.SMSSendTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if L_bSMSSendStop then Exit; //설정 변경 중이므로 전송 중지
  StatusBar1.Panels.Items[2].Text := 'SMSSendTimerTimer Start' + FormatDateTime('hhnnss',now);
  //Exit;
  Try
    SMSSendTimer.Enabled := False;
    dmSMSModule.DBConnected := False;  //매번 재접속하자.
    if Not dmSMSModule.DBConnected then
    begin
      dmSMSModule.ServerType := L_nServerType;
      dmSMSModule.DataBaseType := L_stSMSDBType;
      dmSMSModule.DataBaseIP := L_stSMSServerIP;
      dmSMSModule.DataBasePort := strtoint(L_stSMSServerPort);
      dmSMSModule.UserID := L_stSMSServerID;
      dmSMSModule.UserPW := L_stSMSServerPW;
      dmSMSModule.DataBaseName := L_stSMSDataBaseName;
      dmSMSModule.DataBaseConnect(False);
    end;
    if Not dmSMSModule.DBConnected then
    begin
      DataModule1.SQLErrorLog('SMS Server DBConnected Error');
      Exit;
    end;
    AlarmToSmsSend;

  Finally
    SMSSendTimer.Enabled := True;
  End;
  StatusBar1.Panels.Items[2].Text := 'SMSSendTimerTimer End' + FormatDateTime('hhnnss',now);
end;

procedure TfmMain.AlarmToSmsSend;
var
  TempAdoQuery : TADOQuery;
  stSql : string;
  stMessage : string;
begin
  TDataBaseConfig.GetObject.DataBaseConnect;

  if ( Not TDataBaseConfig.GetObject.DBConnected) then
  begin
    DataModule1.SQLErrorLog('Zmos DBConnected Error');
    Exit;
  end;

  stSql := ' Select a.*,b.AR_NAME as AL_ALARMAREANAME,c.AL_ZONENAME,d.SA_MESSAGE,d.SA_TELNO from TB_ALARMEVENT a ';
  //stSql := stSql + ' Inner Join TB_ALARMSTATUSCODE b ';
  //stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE
  //stSql := stSql + ' AND AL_SMSSEND = ''Y'') ';
  stSql := stSql + ' Inner Join TB_ARMAREA b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND a.AL_ZONECODE = b.AR_AREANO ) ';
  stSql := stSql + ' Inner Join tb_zonedevice c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
  if UpperCase(DBType) = 'MSSQL' then
    stSql := stSql + ' AND substring(a.al_zoneno,2,1) = c.AL_ZONENUM) '
  else if UpperCase(DBType) = 'PG' then
    stSql := stSql + ' AND substr(a.al_zoneno,2,1) = c.AL_ZONENUM) ';
  stSql := stSql + ' Inner Join TB_SMSALARMZONE d ';
  stSql := stSql + ' ON(a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = d.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = d.AC_ECUID ';
  if UpperCase(DBType) = 'MSSQL' then
    stSql := stSql + ' AND substring(a.al_zoneno,2,1) = d.al_zonenum '
  else if UpperCase(DBType) = 'PG' then
    stSql := stSql + ' AND substr(a.al_zoneno,2,1) = d.al_zonenum ';
  stSql := stSql + ' AND d.SA_USE = ''1'') '  ;
  stSql := stSql + ' Where a.AL_SMSSEND = ''N'' ';
  stSql := stSql + ' AND a.AL_ZONESTATE <> ''N'' ';

  Try
    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := DataModule1.ADOConnection;
      with  TempAdoQuery  do
      begin
        Close;
        SQL.Text := stSql;

        Try
          Open;
        Except
           //showmessage('Select Error!!');
           Exit;
        End;
        if RecordCount < 1 then
        begin
          Exit;
        end;
        While Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          stMessage := FindField('SA_MESSAGE').asstring;
          stMessage := StringReplace(stMessage,'{존명칭}',FindField('AL_ZONENAME').asstring,[rfReplaceAll]);
          stMessage := StringReplace(stMessage,'{방범구역명}',FindField('AL_ALARMAREANAME').asstring,[rfReplaceAll]);
          stMessage := copy(WideString(stMessage),1,45);
          StatusBar1.Panels.Items[1].Text := '(Add)' + FormatDateTime('yyyymmddhhnnss',now) + stMessage  ;
          if dmSMSModule.SMSDataSend(L_stSMSUserID, '', stMessage ,
             '', L_stSMSCallbackNum, L_stSMSSenderName, FindField('SA_TELNO').asstring,L_stSMSSenderID) then
          begin
            StatusBar1.Panels.Items[1].Text := '(END1)' + FormatDateTime('yyyymmddhhnnss',now) + stMessage  ;
            UpdateTB_ALARMEVENTSMSSend(FindField('AL_DATE').asstring,FindField('AL_TIME').asstring,FindField('AC_NODENO').asstring,FindField('AC_ECUID').asstring,FindField('AL_MSGNO').asstring,'Y');
            StatusBar1.Panels.Items[1].Text := '(END)' + FormatDateTime('yyyymmddhhnnss',now) + stMessage  ;
          end else StatusBar1.Panels.Items[1].Text := '(Fail)' + stMessage ;
          //StatusBar1.Panels.Items[1].Text := '(END2)' + FormatDateTime('yyyymmddhhnnss',now) + stMessage  ;
          Application.ProcessMessages;
          Next;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  Except
    Exit;
  End;
end;

function TfmMain.UpdateTB_ALARMEVENTSMSSend(aDATE, aTIME, aNODENO, aECUID,
  aMSGNO, aSmsSend: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMEVENT set AL_SMSSEND = ''' + aSmsSend + ''' ';
  stSql := stSql + ' Where AL_DATE = ''' + aDATE + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + aTIME + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNODENO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aMSGNO + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.SMSSendEvent(Sender: TObject; aUserID, aSubject,
  aSmsMessage, aCallBackUrl, aCallback, aSendername, aDestNumber, aCdrID,
  aResult: string);
var
  fmSMSMonitoring : TForm;
begin
  if L_bSMSMonitoring then
  begin
    fmSMSMonitoring := MDIForm('TfmSMSMonitoring');
    TfmSMSMonitoring(fmSMSMonitoring).SMSSendEvent(aUserID, aSubject,
  aSmsMessage, aCallBackUrl, aCallback, aSendername, aDestNumber, aCdrID, aResult);
  end;
end;

procedure TfmMain.mn_smsmonitoringClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmSMSMonitoring');

end;

procedure TfmMain.CommandArrayCommandsTSMSMONITORExecute(Command: TCommand;
  Params: TStringList);
var
  stValue : string;
begin
  stValue := Params.Values['VALUE'];

  if UpperCase(stValue) = 'TRUE' then
  begin
    L_bSMSMonitoring := True;
  end else
  begin
    L_bSMSMonitoring := False;
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

procedure TfmMain.ToolButton4Click(Sender: TObject);
begin
  inherited;
  mn_smsmonitoringClick(sender);
end;

procedure TfmMain.ToolButton3Click(Sender: TObject);
begin
  inherited;
  mn_BasiicConfigClick(Sender);
end;

procedure TfmMain.mn_LoginClick(Sender: TObject);
begin
  inherited;
  fmSMSLogin:= TfmSMSLogin.Create(Self);
  fmSMSLogin.ShowModal;

end;

procedure TfmMain.SMS1Click(Sender: TObject);
begin
  inherited;
  fmSMSUser:= TfmSMSUser.Create(Self);
  fmSMSUser.ShowModal;

end;

end.
