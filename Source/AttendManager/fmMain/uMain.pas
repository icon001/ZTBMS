unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Planner, PlanSimpleEdit, ExtCtrls, OoMisc, AdPort, AdWnPort,
  ActnList, ImgList, Menus, ComCtrls, ToolWin, uSubForm,
  CommandArray,ADODB,ActiveX,Registry,iniFiles
  ;

type
  TfmMain = class(TfmASubForm)
    Image1: TImage;
    ToolBar1: TToolBar;
    btnATadmin: TToolButton;
    btnPerAtReport: TToolButton;
    BtnD2DAtReport: TToolButton;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    mn_PG: TMenuItem;
    mn_Login: TMenuItem;
    Mn_LogOff: TMenuItem;
    N2: TMenuItem;
    mn_Close: TMenuItem;
    N3: TMenuItem;
    mn_PGInfo: TMenuItem;
    Menu_ImageList: TImageList;
    ActionList1: TActionList;
    Action_ATAdmin: TAction;
    SaveDialog1: TSaveDialog;
    SimpleItemEditor1: TSimpleItemEditor;
    mn_BaseCode: TMenuItem;
    mn_batch: TMenuItem;
    mn_ATReport: TMenuItem;
    mn_ATState: TMenuItem;
    N29: TMenuItem;
    N31: TMenuItem;
    N1: TMenuItem;
    Action_Login: TAction;
    Action_LogOut: TAction;
    Action_PerSonAtReport: TAction;
    Action_MonAtReport: TAction;
    N6: TMenuItem;
    Action_JikakReport: TAction;
    Action_JotaeReport: TAction;
    Action_D2DATReport: TAction;
    Action_absenceReport: TAction;
    Action_MonATState: TAction;
    Action_PersonFDState: TAction;
    N10: TMenuItem;
    N11: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    mn_ATSystem: TMenuItem;
    N30: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    mn_Management: TMenuItem;
    N41: TMenuItem;
    btn_EmployeeAdmin: TToolButton;
    Action_Employee: TAction;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N57: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N14: TMenuItem;
    btnMonitor: TToolButton;
    Action_Monitoring: TAction;
    ServerConnect: TTimer;
    WinsockPort: TApdWinsockPort;
    btnDaemonConnect: TToolButton;
    Action_StateSearch: TAction;
    SendDaemonTimer: TTimer;
    BtnDeviceState: TToolButton;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N40: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    mn_RealATReport: TMenuItem;
    N59: TMenuItem;
    N58: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    mn_ReAtInsert: TMenuItem;
    mn_Relay: TMenuItem;
    mn_AtFileSave: TMenuItem;
    tb_realAtReport: TToolButton;
    N63: TMenuItem;
    mn_ACEATFileSave: TMenuItem;
    StateCheckTimer: TTimer;
    mn_EmployeeBranch: TMenuItem;
    mn_EmCodeChange: TMenuItem;
    mn_HizeAT: TMenuItem;
    mn_STXAT: TMenuItem;
    mn_ThezonRelay: TMenuItem;
    N64: TMenuItem;
    mn_ATD2DStatReport: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mn_CloseClick(Sender: TObject);
    procedure Action_ATAdminExecute(Sender: TObject);
    procedure Action_LoginExecute(Sender: TObject);
    procedure Action_LogOutExecute(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Action_PerSonAtReportExecute(Sender: TObject);
    procedure Action_JikakReportExecute(Sender: TObject);
    procedure Action_JotaeReportExecute(Sender: TObject);
    procedure Action_absenceReportExecute(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Action_MonATStateExecute(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure Action_FdAdminExecute(Sender: TObject);
    procedure Action_PersonFdReportExecute(Sender: TObject);
    procedure Action_D2DFdReportExecute(Sender: TObject);
    procedure Action_PersonFDStateExecute(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure mn_DepartAtAdminClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
    procedure Action_EmployeeExecute(Sender: TObject);
    procedure Action_MonAtReportExecute(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure Action_MonitoringExecute(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure ServerConnectTimer(Sender: TObject);
    procedure btnDaemonConnectClick(Sender: TObject);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_StateSearchExecute(Sender: TObject);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure BtnDeviceStateClick(Sender: TObject);
    procedure Action_D2DATReportExecute(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure mn_RealATReportClick(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure mn_ReAtInsertClick(Sender: TObject);
    procedure tb_realAtReportClick(Sender: TObject);
    procedure mn_AtFileSaveClick(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure mn_ACEATFileSaveClick(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure mn_EmployeeBranchClick(Sender: TObject);
    procedure mn_EmCodeChangeClick(Sender: TObject);
    procedure mn_HizeATClick(Sender: TObject);
    procedure mn_STXATClick(Sender: TObject);
    procedure mn_ThezonRelayClick(Sender: TObject);
    procedure mn_ATD2DStatReportClick(Sender: TObject);
  private
    FLogined: Boolean;
    FPrivileges: String;
    FMonitoring: Boolean;
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    Procedure TravelMenuItem(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelMenuView(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelToolBar(ToolBar:TToolBar;ProgIDs:String);
    Procedure TravelToolButton(ToolButton:TToolButton;ProgIDs:String);
    procedure InitConfigSet;
    Procedure MenuViewSetting;
    procedure GetProgramGrade(aProgID:string;var aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    Function  GetSentenceRelayConfig:Boolean;
    procedure SetMonitoring(const Value: Boolean);
    Procedure SendDaemon(aData:string);
    procedure FormNameSet;
  private
    L_stRealReportType : string;
    L_stPrivileges:String;
    L_bIsFormShow : Boolean;
    L_stServerComBuff: String;
    L_stDaemonServerIP : string;
    L_stAttendServerPort : string;
    L_stSendData : string;
    L_bSending : Boolean;
    L_nFailCount : integer; //송신실패 횟수
    L_bClose : Boolean;
    SendDaemonDataList : TStringList;
    { Private declarations }
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    procedure WriteRegistryKey(aCustomerID,aInstallDate:string);
    Function RegistryKeyCheck(var aCustomerID:string):Boolean;
  public
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;
  public
    { Public declarations }
  published
    Property Monitoring : Boolean read FMonitoring write SetMonitoring;

  end;

var
  fmMain: TfmMain;

implementation
uses
  uDataModule1,
  uDataBaseConfig,
  uLogin,
  uATStateCalc,
  uFDStateCalc,
  uLomosUtil, uATIncode, uATOutcode, uATConfig, uATTypeAdmin, uGradeCode,
  uGradeProgram, uAdmin, uVacation, uHoliday, uEmploy, uATVAcode, uSummary,
  uExtraCodeAdmin, uEmployExtraAdmin, uBatchEmployee, uCompanyCode,
  uCommonSql,uMssql,uPostGreSql,uMDBSql, uDaySummary, uReAtInsert_New,
  uAttendCommon,
  systeminfos, uAtFileSave, uEmployeeBranch, uEmCodeChange, uSTXAtFileSend;
{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
  stKey : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  bRegistryKeyCheck : Boolean;
  ini_fun : TiniFile;
  stKeyCheck : string;
begin
  self.ModuleID := 'Main';

  ExeFolder  := ExtractFileDir(Application.ExeName);
  L_bIsFormShow := False;

  G_bApplicationTerminate := False;
    //여기서 인증 키값을 확인하자.
  bRegistryKeyCheck := RegistryKeyCheck(stSaupId);
  if Not bRegistryKeyCheck then
  begin
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.ini');
    stKeyCheck := ini_fun.ReadString('Config','Key','TRUE');
    if Uppercase(stKeyCheck) = 'FALSE' then  bRegistryKeyCheck := True; 
    ini_fun.free;
  end;
  if Not bRegistryKeyCheck then
  begin
    stKey := GetAuthKey('3');
    if stKey = '' then
    begin
      showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
      ExecFileAndWait(ExeFolder + '\KeyZen.exe 3',true,true);
      stKey := GetAuthKey('3');
    end;
    if stKey = '' then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;

    stSaupId := GetSaupId('');
    bResult  := False;

    if stSaupId <> '' then
    begin
      bResult := CompareKey(stSaupId,stKey);
      if Not bResult then bResult := CompareKey2(stSaupId,stKey);
      if Not bResult then bResult := CompareKey3(stSaupId,stKey);
      if Not bResult then
      begin
        stKey := GetAuthKey1('2');
        if stKey <> '' then
        begin
          bResult := CompareKey(stSaupId,stKey);
          if Not bResult then bResult := CompareKey2(stSaupId,stKey);
          if Not bResult then bResult := CompareKey3(stSaupId,stKey);
        end;
      end;
    end;
    if Not bResult then
    begin
      showmessage('인증키값이 틀립니다.');
      if FileExists(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini') then
      begin
        DeleteFile(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini');
      end;
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;

    if stSaupId = 'Z-00000000' then
    begin
      stDate := GetInstallDate('3');
      stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
      if Not IsDate(stDate) then
      begin
        showmessage('인증키의 유효기간이 만료되었습니다.');
        Application.Terminate;
        G_bApplicationTerminate := True;
        Exit;
      end;
      if stDate < formatDateTime('yyyy-mm-dd',now) then
      begin
        showmessage('인증키의 유효기간이 만료되었습니다.');
        Application.Terminate;
        G_bApplicationTerminate := True;
        Exit;
      end;
    end;
    if Not bRegistryKeyCheck then
    begin
      WriteRegistryKey(stSaupId,stDate);
    end;
  end;
{    //여기서 인증 키값을 확인하자.
  stKey := GetAuthKey('3');
  if stKey = '' then
  begin
    showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
    ExecFileAndWait(ExeFolder + '\KeyZen.exe 3',true,true);
    stKey := GetAuthKey('3');
  end;
  if stKey = '' then
  begin
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  ServerComBuff := '';
  stSaupId := GetSaupId('');
  bResult := False;
  if stSaupId <> '' then bResult := CompareKey(stSaupId,stKey);
  if Not bResult then
  begin
    showmessage('인증키값이 틀립니다.');
    Application.Terminate;
    G_bApplicationTerminate := True;
    Exit;
  end;

  if stSaupId = '0000000000' then
  begin
    stDate := GetInstallDate('1');
    stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
    if Not IsDate(stDate) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;
    if stDate < formatDateTime('yyyy-mm-dd',now) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;
  end;     }
  SendDaemonDataList := TStringList.Create;
  SendDaemonDataList.Clear;
  L_bSending :=  False;
  L_nFailCount := 0;
  L_stSendData := '';
  L_bClose := False;
  L_stDaemonServerIP := '';
  L_stAttendServerPort := '';

  fmMain.Caption := fmMain.Caption + '[' + strBuildInfo + ']';
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  if L_bIsFormShow then Exit;
  ServerConnect.Enabled := True;

  L_bIsFormShow := True; // 한번만 Activate 실행 되도록 막아줌
  TDataBaseConfig.GetObject.DataBaseConnect;
  while Not TDataBaseConfig.GetObject.DBConnected do
  begin
    if TDataBaseConfig.GetObject.Cancel then
    begin
      Close;
      Exit;
    End;
    TDataBaseConfig.GetObject.ShowDataBaseConfig;
  end;

  Master_ID := '';
  Logined := False;
  Privileges := '';

  InitConfigSet;
  GetSentenceRelayConfig;

  FormNameSet;

  MenuViewSetting;

  mn_Relay.Visible := True;
  mn_ThezonRelay.Visible := False;
  mn_AtFileSave.Visible := False;
  mn_ACEATFileSave.Visible := False;
  mn_HizeAT.Visible := False;
  mn_STXAT.Visible := False;
  if SendPersonRelayType = 2 then
  begin
    mn_Relay.Visible := True;
    mn_AtFileSave.Visible := True;
  end else if SendPersonRelayType = 3 then
  begin
    mn_Relay.Visible := True;
    mn_ACEATFileSave.Visible := True;
  end else if SendPersonRelayType = 4 then
  begin
    mn_Relay.Visible := True;
    mn_HizeAT.Visible := True;
  end else if SendPersonRelayType = 5 then
  begin
    mn_Relay.Visible := True;
    mn_STXAT.Visible := True;
  end else
  begin
    mn_ThezonRelay.Visible := True;
  end;


  if G_nSpecialProgram = 1 then
  begin
    CARDLENGTHTYPE := 2;
  end else if G_nSpecialProgram = 2 then
  begin
    CARDLENGTHTYPE := 0;
    IsNumericCardNo := True;
  end else if G_nSpecialProgram = 3 then
  begin
    CARDLENGTHTYPE := 0;
    IsNumericCardNo := True;
  end;

end;

procedure TfmMain.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
  mn_Login.Enabled := not Value;
  Mn_LogOff.Enabled := value;
  if FLogined then
  begin
   StatusBar1.Panels[0].Text := Master_Name;
   StatusBar1.Panels[1].Text := '로그인 완료.';
   if btnMonitor.Enabled then Action_Monitoring.Execute;
  end else
  begin
   StatusBar1.Panels[0].Text := '';
   StatusBar1.Panels[1].Text := '로그아웃.';
   if Monitoring then self.FindClassForm('TfmMonitoring').FindCommand('Close').Execute;
   mn_ATSystem.Visible := False;
  end;
  mn_Relay.Enabled := Value;
end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
  TravelMenuItem(mn_BaseCode,Value); //등록
  TravelMenuItem(mn_Management,Value); //운영관리
  TravelMenuItem(mn_ATReport,Value); //근태보고서
  //TravelMenuItem(mn_ATSystem,Value); //시스템운영자관리

  //ToolBar 관리
  TravelToolBar(ToolBar1,Value);
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  LogoFile : string;
begin
  if G_bApplicationTerminate then Exit;
  LogoFile := ExeFolder + '\..\image\KTREPORTLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  Monitoring := False;

  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width;

end;

procedure TfmMain.mn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.MDIChildShow(FormName: String);
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
    tmpForm.Show;
  end;
{  clsName := FormName;
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
        SetWindowPos(Screen.Forms[i].Handle, 0, 0, 0, 0, 0,
        HWND_TOP );   //WS_EX_TOPMOST
        Screen.Forms[i].Show;
        Screen.Forms[i].WindowState := wsMaximized;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end; }
end;

procedure TfmMain.Action_ATAdminExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDepartATAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmDepartATAdmin').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.TravelMenuItem(MenuItem: TMenuItem; ProgIDs: String);
var
  Loop : Integer;
begin
  For Loop:=0 to Menuitem.Count - 1 do
      TravelmenuItem(MenuITem.Items[Loop],ProgIDs);

  If Pos(MenuItem.Hint,ProgIDs) > 0 then MenuItem.Enabled := True
  Else If MenuItem.Tag = 0 then MenuItem.Enabled:=False;

end;

procedure TfmMain.TravelMenuView(MenuItem: TMenuItem; ProgIDs: String);
var
  Loop : Integer;
begin
  For Loop:=0 to Menuitem.Count - 1 do
      TravelMenuView(MenuITem.Items[Loop],ProgIDs);

  If MenuItem.Tag = 0 then
  begin
    If Pos(MenuItem.Hint,ProgIDs) > 0 then MenuItem.Visible := True
    Else MenuItem.Visible:=False;
  end;
end;

procedure TfmMain.TravelToolBar(ToolBar: TToolBar; ProgIDs: String);
var
  Loop : Integer;
begin
  For Loop:=0 to ToolBar.ButtonCount - 1 do
      TravelToolButton(ToolBar.Buttons[Loop],ProgIDs);
end;

procedure TfmMain.TravelToolButton(ToolButton: TToolButton;
  ProgIDs: String);
begin
  If Pos(ToolButton.Hint,ProgIDs) > 0 then ToolButton.Enabled := True
  Else If ToolButton.Tag = 0 then ToolButton.Enabled:=False;
end;

procedure TfmMain.Action_LoginExecute(Sender: TObject);
begin
   StatusBar1.Panels[1].Text := '로그인 중입니다.' ;

   TLogin.GetObject.ShowLoginDlg;
   Master_ID := TLogin.GetObject.UserID;
   Master_Name := TLogin.GetObject.UserName;
   AdminGrade := Trim(TLogin.GetObject.Grade);
   L_stPrivileges :=TLogin.GetObject.ProgIDs; //권한설정
   Privileges:=L_stPrivileges; //권한설정
   Logined := TLogin.GetObject.Logined;
   //CompanyCode := Trim(TLogin.getobject.CompanyCode);
   //DepartCode := Trim(TLogin.getobject.DepartCode);;

   if IsMaster then  mn_ATSystem.Visible := True;

end;

procedure TfmMain.Action_LogOutExecute(Sender: TObject);
begin
  Master_ID := '';
  Logined := False;
  Privileges := '';

end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width;

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
  stFileServerIP : string;
  stFileServerDir : string;
begin
  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;
  G_nDaemonServerVersion := 0; //데몬서버 버젼이 디폴트 0 이다.
  G_bCardFixedUse := False; //카드고정길이 사용 안함
  G_stCardFixedFillChar := '0';  //카드고정길이 사용시 채움문자
  G_nCardFixedPosition := 0; //채움문자위치 0:앞,1:뒤
  G_nCardFixedLength := 11;  //카드고정길이 KT에서 처음 사용해서 디폴트 11자리
  CARDLENGTHTYPE := 0; //디폴트로 고정 4Byte 사용
  L_stRealReportType := '0';
  IsNumericCardNo := True;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
{  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''ATTEND'')';   }

  with DataModule1.ADOTmpQuery do
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
      if FindField('CO_CONFIGGROUP').AsString = 'ATTEND' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'CARDTYPE' then
        begin
          CARDTYPE := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'ATPRSERVER' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bATtendPrivateServer := TRUE
          else G_bATtendPrivateServer := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'REALREPORT' then
        begin
          L_stRealReportType := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'IOTIMEUSE' then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nAttendIOTimeUse := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'IOTIME' then
        begin
          if isdigit(FindField('CO_CONFIGVALUE').AsString) then
             G_nAttendIOTime := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'COMPANYCD' then
            G_nCompanyCodeType := FindField('CO_CONFIGVALUE').AsInteger;

      end else if FindField('CO_CONFIGGROUP').AsString = 'CARD' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
        begin
          if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then G_bCardFixedUse := True;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLCHAR' then
        begin
          if FindField('CO_CONFIGVALUE').AsString <> '' then
            G_stCardFixedFillChar := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILLPOSI' then  
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nCardFixedPosition := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'FIXEDLEN' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nCardFixedLength := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;
      end else if FindField('CO_CONFIGGROUP').AsString = 'COMMON' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'DAEMON_VER' then
        begin
          if isDigit(FindField('CO_CONFIGVALUE').AsString) then
            G_nDaemonServerVersion := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then
        begin
          G_nSpecialProgram := StrtoInt(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then
        begin
          CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
        end;
      end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'IP' then
        begin
          L_stDaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'ATPORT' then
        begin
          L_stAttendServerPort := FindField('CO_CONFIGVALUE').AsString;
        end;
      end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMONLOG' then
      begin
      end else if FindField('CO_CONFIGGROUP').AsString = 'DATABASE' then
      begin
      end else if FindField('CO_CONFIGGROUP').AsString = 'FIRE' then
      begin
      end else if FindField('CO_CONFIGGROUP').AsString = 'MCUCOMM' then
      begin
      end else if FindField('CO_CONFIGGROUP').AsString = 'MOSTYPE' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'ACCESS' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  AccessUse := True
          else AccessUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'ALARM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  PatrolUse := True
          else PatrolUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'ATTEND' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  AttendUse := True
          else AttendUse := False;
          if FindField('CO_CONFIGCODE').AsString = 'EMPLOYEE' then
            G_nEmployeeType := FindField('CO_CONFIGVALUE').AsInteger;
        end else if FindField('CO_CONFIGCODE').AsString = 'FOOD' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  FoodUse := True
          else FoodUse := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEIP' then
        begin
          stFileServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'FILEDIR' then
        begin
          stFileServerDir := FindField('CO_CONFIGVALUE').AsString;
        end;
      end else if FindField('CO_CONFIGGROUP').AsString = 'PAY' then
      begin
      end else if FindField('CO_CONFIGGROUP').AsString = 'RELAY' then
      begin
        if FindField('CO_CONFIGCODE').AsString = 'PER_SRELAY' then
        begin
          SendPersonRelayType := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;
      end;

      Next;
    end;
  end;
{
  if Trim(stFileServerIP) <> '' then
  begin
    if pos('\',stFileServerIP) = 0 then stFileServerIP := '\\' + stFileServerIP + '\'
    else
    begin
      if copy(stFileServerIP,1,1) <> '\' then stFileServerIP := '\\' + stFileServerIP
      else if copy(stFileServerIP,2,1) <> '\' then stFileServerIP := '\' + stFileServerIP;
      if copy(stFileServerIP,Length(stFileServerIP),1) <> '\' then stFileServerIP := stFileServerIP + '\';
    end;
    if Trim(stFileServerDir) <> '' then
    begin
      FileServerPath := stFileServerIP + stFileServerDir;
    end;
  end else
  begin
  end;    }
  if Trim(stFileServerDir) <> '' then
  begin
    FileServerPath := stFileServerDir;
  end;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    //권한관리쪽에서 보여줄 항목을 셋팅하자
    if DBType = 'MSSQL' then
    begin
      stSql := Mssql.UpdateTB_PROGRAMIDSetVisible;
    end else if DBType = 'PG' then
    begin
      stSql := PostGreSql.UpdateTB_PROGRAMIDSetVisible;
    end else if DBType = 'MDB' then
    begin
      stSql := MDBsql.UpdateTB_PROGRAMIDSetVisible;
    end;
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      //무시
    End;

  end;
  AttendUse := True;
  FoodUse := False;
  AccessUse := False;
  PatrolUse := False;

end;

procedure TfmMain.MenuViewSetting;
var
  stSql : string;
  ViewMenu : string;
begin
  stSql := ' Select * from TB_PROGRAMID ';
  stSql := stSql + ' Where PR_VISIBLE <> ''N'' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      exit;
    End;
    ViewMenu := '';
    while Not Eof do
    begin
      ViewMenu := ViewMenu + Trim(FieldByName('PR_PROGRAMID').AsString) + ';';
      Next;
    end; //while
    
  end;

  if ViewMenu <> '' then    //여기에서 메뉴를 보여주자.
  begin
    TravelMenuView(mn_BaseCode,ViewMenu); //코드관리
    TravelMenuView(mn_Management,ViewMenu); //운영관리
    TravelMenuView(mn_ATReport,ViewMenu); //근태보고서
    //TravelMenuView(mn_ATSystem,ViewMenu); //시스템운영자관리

  end;

end;

procedure TfmMain.Action_PerSonAtReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmPerATReport');

end;

procedure TfmMain.Action_JikakReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmJikakReport');
end;

procedure TfmMain.Action_JotaeReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmJotaeReport');

end;

procedure TfmMain.Action_absenceReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmNonATReport');

end;

procedure TfmMain.N7Click(Sender: TObject);
begin
  fmATStateCalc:= TfmATStateCalc.Create(Self);
  fmATStateCalc.SHowmodal;
  fmATStateCalc.Free;

end;

procedure TfmMain.Action_MonATStateExecute(Sender: TObject);
begin
  MDIChildShow('TfmMonATState');

end;

procedure TfmMain.N29Click(Sender: TObject);
begin
  MDIChildShow('TfmPerATState');

end;

procedure TfmMain.Action_FdAdminExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmFoodAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmFoodAdmin').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.Action_PersonFdReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmPersonFdReport');

end;

procedure TfmMain.Action_D2DFdReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmD2DFdReport');

end;

procedure TfmMain.Action_PersonFDStateExecute(Sender: TObject);
begin
  MDIChildShow('TfmPerFdState');

end;

procedure TfmMain.N12Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmVacation',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmVacation').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.mn_DepartAtAdminClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDepartATAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmDepartATAdmin').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.N8Click(Sender: TObject);
begin
//  MDIChildShow('TfmDepartATReport');
end;

procedure TfmMain.N10Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmATIncode:= TfmATIncode.Create(Self);
  fmATIncode.IsInsertGrade := bInsertGrade;
  fmATIncode.IsUpdateGrade := bUpdateGrade;
  fmATIncode.IsDeleteGrade := bDeleteGrade;
  fmATIncode.SHowmodal;
  fmATIncode.Free;

end;

procedure TfmMain.GetProgramGrade(aProgID: string; var aInsertGrade,
  aUpdateGrade, aDeleteGrade: Boolean);
var
  stSql : string;
begin
  if IsMaster then
  begin
    aInsertGrade := True;
    aUpdateGrade := True;
    aDeleteGrade := True;
    Exit;
  end;
  aInsertGrade := False;
  aUpdateGrade := False;
  aDeleteGrade := False;

  stSql := 'select * from TB_GRADEPROGRAM ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND GR_GRADECODE = ''' + AdminGrade + ''' ';
  stSql := stSql + ' AND PR_PROGRAMID = ''' + aProgID + ''' ';
  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if FindField('GR_INSERT').AsString = 'Y' then aInsertGrade := True;
    if FindField('GR_UPDATE').AsString = 'Y' then aUpdateGrade := True;
    if FindField('GR_DELETE').AsString = 'Y' then aDeleteGrade := True;
  end;
end;

procedure TfmMain.N11Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmATOutcode:= TfmATOutcode.Create(Self);
  fmATOutcode.IsInsertGrade := bInsertGrade;
  fmATOutcode.IsUpdateGrade := bUpdateGrade;
  fmATOutcode.IsDeleteGrade := bDeleteGrade;
  fmATOutcode.SHowmodal;
  fmATOutcode.Free;

end;

procedure TfmMain.N1Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmATConfig:= TfmATConfig.Create(Self);
  fmATConfig.IsInsertGrade := bInsertGrade;
  fmATConfig.IsUpdateGrade := bUpdateGrade;
  fmATConfig.IsDeleteGrade := bDeleteGrade;
  fmATConfig.SHowmodal;
  SendDaemonTimer.Enabled := True;
  SendDaemonDataList.Add('ATTENDCONFIGREFRESH'+ DATADELIMITER + '0000000000000' + DATADELIMITER );
  fmATConfig.Free;
  InitConfigSet;
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
{  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        //(screen.forms[i] as TForm).show;
        {Screen.Forms[i].CloseQuery;
        Screen.Forms[i].Destroy;
        break;}
{        if Screen.ActiveForm = Screen.Forms[i] then
        begin
          Screen.Forms[i].WindowState := wsMaximized;
          Exit;
        end;
        SetWindowPos(Screen.Forms[i].Handle, 0, 0, 0, 0, 0,
        HWND_TOP );   //WS_EX_TOPMOST
        TfmASubForm(Screen.Forms[i]).IsInsertGrade := aInsertGrade;
        TfmASubForm(Screen.Forms[i]).IsUpdateGrade := aUpdateGrade;
        TfmASubForm(Screen.Forms[i]).IsDeleteGrade := aDeleteGrade;
        Screen.Forms[i].Show;
        Screen.Forms[i].WindowState := wsMaximized;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    TfmASubForm(tmpForm).IsInsertGrade := aInsertGrade;
    TfmASubForm(tmpForm).IsUpdateGrade := aUpdateGrade;
    TfmASubForm(tmpForm).IsDeleteGrade := aDeleteGrade;
    tmpForm.Show;
    tmpForm.WindowState := wsMaximized;
  end; }
end;

procedure TfmMain.N9Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmATTypeAdmin:= TfmATTypeAdmin.Create(Self);
  fmATTypeAdmin.IsInsertGrade := bInsertGrade;
  fmATTypeAdmin.IsUpdateGrade := bUpdateGrade;
  fmATTypeAdmin.IsDeleteGrade := bDeleteGrade;
  fmATTypeAdmin.SHowmodal;
  SendDaemonTimer.Enabled := True;
  SendDaemonDataList.Add('ATTENDCONFIGREFRESH'+ DATADELIMITER + '0000000000000' + DATADELIMITER );
  fmATTypeAdmin.Free;

end;

procedure TfmMain.N32Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmGradeCode:= TfmGradeCode.Create(Self);
  fmGradeCode.IsInsertGrade := bInsertGrade;
  fmGradeCode.IsUpdateGrade := bUpdateGrade;
  fmGradeCode.IsDeleteGrade := bDeleteGrade;
  fmGradeCode.SHowmodal;
  fmGradeCode.Free;

end;

procedure TfmMain.N33Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmGradeProgram:= TfmGradeProgram.Create(Self);
  fmGradeProgram.IsInsertGrade := bInsertGrade;
  fmGradeProgram.IsUpdateGrade := bUpdateGrade;
  fmGradeProgram.IsDeleteGrade := bDeleteGrade;
  fmGradeProgram.SHowmodal;
  fmGradeProgram.Free;
end;

procedure TfmMain.N34Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmAdmin:= TfmAdmin.Create(Self);
  fmAdmin.IsInsertGrade := bInsertGrade;
  fmAdmin.IsUpdateGrade := bUpdateGrade;
  fmAdmin.IsDeleteGrade := bDeleteGrade;
  fmAdmin.SHowmodal;
  fmAdmin.Free;
end;

procedure TfmMain.N4Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmDepartATAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmDepartATAdmin').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.N15Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmHoliday:= TfmHoliday.Create(Self);
  fmHoliday.IsInsertGrade := bInsertGrade;
  fmHoliday.IsUpdateGrade := bUpdateGrade;
  fmHoliday.IsDeleteGrade := bDeleteGrade;
  fmHoliday.SHowmodal;
  fmHoliday.Free;

end;

procedure TfmMain.N42Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmATVAcode:= TfmATVAcode.Create(Self);
  fmATVAcode.IsInsertGrade := bInsertGrade;
  fmATVAcode.IsUpdateGrade := bUpdateGrade;
  fmATVAcode.IsDeleteGrade := bDeleteGrade;
  fmATVAcode.SHowmodal;
  fmATVAcode.Free;
end;

procedure TfmMain.N52Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmploy:= TfmEmploy.Create(Self);
  fmEmploy.IsInsertGrade := bInsertGrade;
  fmEmploy.IsUpdateGrade := bUpdateGrade;
  fmEmploy.IsDeleteGrade := bDeleteGrade;
  fmEmploy.SHowmodal;
  fmEmploy.Free;

end;

procedure TfmMain.Action_EmployeeExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmploy:= TfmEmploy.Create(Self);
  fmEmploy.IsInsertGrade := bInsertGrade;
  fmEmploy.IsUpdateGrade := bUpdateGrade;
  fmEmploy.IsDeleteGrade := bDeleteGrade;
  bfmEmployShow := True;
  fmEmploy.SHowmodal;
  bfmEmployShow := False;
  fmEmploy.Free;
end;

procedure TfmMain.Action_MonAtReportExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmMonthATReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmMonthATReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.N14Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmployExtraAdmin:= TfmEmployExtraAdmin.Create(Self);
  fmEmployExtraAdmin.IsInsertGrade := bInsertGrade;
  fmEmployExtraAdmin.IsUpdateGrade := bUpdateGrade;
  fmEmployExtraAdmin.IsDeleteGrade := bDeleteGrade;
  fmEmployExtraAdmin.SHowmodal;
  fmEmployExtraAdmin.Free;

end;

procedure TfmMain.N53Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmBatchEmployee:= TfmBatchEmployee.Create(Self);
  fmBatchEmployee.IsInsertGrade := bInsertGrade;
  fmBatchEmployee.IsUpdateGrade := bUpdateGrade;
  fmBatchEmployee.IsDeleteGrade := bDeleteGrade;
  fmBatchEmployee.SHowmodal;
  fmBatchEmployee.Free;

end;

procedure TfmMain.N47Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 0;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.N48Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 1;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.N49Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 2;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.N50Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 3;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.N51Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 4;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.Action_MonitoringExecute(Sender: TObject);
begin
  MDIChildShow('TfmMonitoring');
end;

procedure TfmMain.CommandArrayCommandsTCommand0Execute(Command: TCommand;
  Params: TStringList);
var
  stMonitor : string;
begin
// MONITOR
  stMonitor := Params.Values['VALUE'];

  if stMonitor = 'TRUE' then Monitoring := True
  else Monitoring := False;
end;

procedure TfmMain.CommandArrayCommandsTCommand1Execute(Command: TCommand;
  Params: TStringList);
begin
//L_stSendData
end;

procedure TfmMain.ServerConnectTimer(Sender: TObject);
begin
  if L_bClose then Exit;
  if btnDaemonConnect.Enabled then
  begin
    btnDaemonConnectClick(self);
  end;

end;

procedure TfmMain.btnDaemonConnectClick(Sender: TObject);
begin
  WinsockPort.Open := False;
  Delay(100);
  if L_bClose then Exit;
  if trim(L_stDaemonServerIP) <> '' then
  begin
    WinsockPort.WsAddress := L_stDaemonServerIP;
    if Trim(L_stAttendServerPort) <> '' then
    begin
      WinsockPort.WsPort := L_stAttendServerPort;
      WinsockPort.Open := True;
    end;
  end;

end;

procedure TfmMain.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
begin
  st:= '';
  for I := 1 to Count do st := st + WinsockPort.GetChar;
  L_stServerComBuff:= L_stServerComBuff + st ;

  repeat
    aData:= Copy(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    Delete(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    nIndex := Pos('R',aData);
    if nIndex < 0 then      Exit;
    if nIndex > 1 then Delete(aData,1,nIndex - 1);
    if Length(aData) < 2 then Exit;

    Try
      //여기에서 데이터 뿌려줌
      if Monitoring then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          self.FindClassForm('TfmMonitoring').FindCommand('Message').Params.Values['Data'] := aData;
          self.FindClassForm('TfmMonitoring').FindCommand('Message').Execute;
        end;
      end;
      if bfmEmployShow then
      begin
        if aData[1] = 'R' then     //기기에서 올라온 데이터 이면
        begin
          //Memo1.Lines.Insert(0,aData);
          self.FindClassForm('TfmEmploy').FindCommand('Message').Params.Values['Data'] := aData;
          self.FindClassForm('TfmEmploy').FindCommand('Message').Execute;
        end;
      end;
    Except
      //
    End;
    Application.ProcessMessages;
  until pos(LINEEND,L_stServerComBuff) = 0;

end;

procedure TfmMain.WinsockPortWsConnect(Sender: TObject);
begin
  bSeverConnected := True;
  btnDaemonConnect.Enabled := False;
  {if Monitoring then
  begin
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'CONNECTED';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
  end; }
  StateCheckTimer.Enabled := True;
end;

procedure TfmMain.WinsockPortWsDisconnect(Sender: TObject);
begin
  bSeverConnected := False;
  if Monitoring then
  begin
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
  end;

  btnDaemonConnect.Enabled := True;
  StateCheckTimer.Enabled := False;
end;

procedure TfmMain.WinsockPortWsError(Sender: TObject;
  ErrCode: Integer);
begin
  bSeverConnected := False;
  if Monitoring then
  begin
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
    self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
  end;
  btnDaemonConnect.Enabled := True;
  StateCheckTimer.Enabled := False;
end;

procedure TfmMain.SetMonitoring(const Value: Boolean);
begin
  FMonitoring := Value;
  if Value then Action_StateSearchExecute(Self);
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Monitoring then self.FindClassForm('TfmMonitoring').FindCommand('Close').Execute;
  L_bClose := True;
  SendDaemonDataList.Clear;

  ServerConnect.Enabled := False;
  SendDaemonTimer.Enabled := False;
  ServerConnect.Enabled := False;
  if WinsockPort.Open then
  begin
    WinsockPort.FlushInBuffer;
    WinsockPort.FlushOutBuffer;
  end;
  WinsockPort.Open := False;

  Delay(1000);
  SendDaemonTimer.Free;
  ServerConnect.Free;
  SendDaemonDataList.Free;
  Delay(500);
  WinsockPort.Free;

end;

procedure TfmMain.Action_StateSearchExecute(Sender: TObject);
var
  stSendData : string;
begin
  SendDaemonTimer.Enabled := True;
  if G_nDaemonServerVersion < 3 then
  begin
    stSendData := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    SendDaemonDataList.Add(stSendData);
  end else if G_nDaemonServerVersion < 7 then
  begin
    stSendData := 'DEVICEALLSTATE_II'+ DATADELIMITER;
    SendDaemonDataList.Add(stSendData);
  end else //if G_nDaemonServerVersion < 7 then
  begin
    stSendData := 'DEVICEALLSTATE_III'+ DATADELIMITER;
    SendDaemonDataList.Add(stSendData);
  end;
//  SendDaemonDataList.Add('STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER );
  if Monitoring then
  begin
    self.FindClassForm('TfmMonitoring').FindCommand('REFRESH').Execute;
  end;

end;

procedure TfmMain.SendDaemonTimerTimer(Sender: TObject);
var
  PastTime : dword;

begin
  if L_bClose then Exit;
  if SendDaemonDataList.Count  < 1 then Exit;
  Try
    if Not WinsockPort.Open then
    begin
      SendDaemonDataList.Clear;
      if Monitoring then
      begin
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['COMMAND'] := 'SERVER';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['VALUE'] := 'DISCONNECTED';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Params.Values['ID'] := '';
        self.FindClassForm('TfmMonitoring').FindCommand('STATE').Execute;
      end;
      //showmessage('데몬에 접속 되어 있지 않습니다.');
      Exit;
    end;

    if L_bSending then Exit;
    L_bSending := True;
    {
    PastTime := GetTickCount + DelayTime;
    while Not RecvAck do
    begin
      if L_bClose then Exit;
      Application.ProcessMessages;
      if GetTickCount > PastTime then Break;  //300밀리동안 응답 없으면 실패로 처리함
    end;

    if Not RecvAck then inc(L_nFailCount) ;

    if L_nFailCount > RETRYCOUNT then
    begin
      L_nFailCount := 0;
      SendDaemonDataList.Delete(0);
    end;
    if SendDaemonDataList.Count  < 1 then
    begin
      L_bSending := False;
      Exit;
    end;    }
    L_stSendData := sendDaemonDataList.Strings[0] + LINEEND;
    SendDaemonDataList.Delete(0);
    //RecvAck := False;
    SendDaemon(L_stSendData);
  Finally
    L_bSending := False;
  End;

end;

procedure TfmMain.SendDaemon(aData: string);
begin
  if L_bClose then Exit;
  Try
    if WinsockPort.Open then WinsockPort.PutString(aData);
  Except
    Exit;
  End;
end;

procedure TfmMain.BtnDeviceStateClick(Sender: TObject);
begin
  Action_StateSearchExecute(self);
  //btnDaemonConnectClick(self);
end;

procedure TfmMain.Action_D2DATReportExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmD2DATReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmD2DATReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.N16Click(Sender: TObject);
begin
  btnDaemonConnectClick(self);
end;

procedure TfmMain.N17Click(Sender: TObject);
begin
  btnDaemonConnectClick(self);
end;

procedure TfmMain.N40Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmD2DATHistoryReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmD2DATHistoryReport').FindCommand('GRADEREFRESH').Execute;

end;

procedure TfmMain.N55Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmSummary:= TfmSummary.Create(Self);
  fmSummary.IsInsertGrade := bInsertGrade;
  fmSummary.IsUpdateGrade := bUpdateGrade;
  fmSummary.IsDeleteGrade := bDeleteGrade;
  fmSummary.SHowmodal;
  fmSummary.Free;

end;

procedure TfmMain.N56Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmD2DNonProcessReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmD2DNonProcessReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.FormNameSet;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  FM001 := '회사코드';
  FM002 := '회사명';
  FM011 := '지점코드';
  FM012 := '지점명';
  FM021 := '부서코드';
  FM022 := '부서명';
  FM031 := '직위코드';
  FM032 := '직위명';
  FM101 := '사번';
  FM102 := '이름';
  FM103 := '사내전화번호';
  FM104 := '입사일';
  FM105 := '퇴사일';
  FM106 := '사원';


  stSql := 'select * from TB_FORMNAME ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    First;
    While Not Eof do
    begin
      if FindField('FM_CODE').AsString = '001' then
      begin
        FM001 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '002' then
      begin
        FM002 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '011' then
      begin
        FM011 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '012' then
      begin
        FM012 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '021' then
      begin
        FM021 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '022' then
      begin
        FM022 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '031' then
      begin
        FM031 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '032' then
      begin
        FM032 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '101' then
      begin
        FM101 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '102' then
      begin
        FM102 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '103' then
      begin
        FM103 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '104' then
      begin
        FM104 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '105' then
      begin
        FM105 := FindField('FM_NAME').asstring;
      end else if FindField('FM_CODE').AsString = '106' then
      begin
        FM106 := FindField('FM_NAME').asstring;
      end;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMain.mn_RealATReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  if L_stRealReportType = '1' then
  begin
    GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
    MDIChildGradeShow('TfmRealD2DATReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
    self.FindClassForm('TfmRealD2DATReport').FindCommand('GRADEREFRESH').Execute;
  end else
  begin
    GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
    MDIChildGradeShow('TfmRealATReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
    self.FindClassForm('TfmRealATReport').FindCommand('GRADEREFRESH').Execute;
  end;
end;

procedure TfmMain.N61Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmDaySummary:= TfmDaySummary.Create(Self);
  fmDaySummary.IsInsertGrade := bInsertGrade;
  fmDaySummary.IsUpdateGrade := bUpdateGrade;
  fmDaySummary.IsDeleteGrade := bDeleteGrade;
  fmDaySummary.SHowmodal;
  fmDaySummary.Free;

end;

procedure TfmMain.mn_ReAtInsertClick(Sender: TObject);
begin
  fmReAtInsert:= TfmReAtInsert.Create(Self);
  fmReAtInsert.SHowmodal;
  fmReAtInsert.Free;

end;

procedure TfmMain.tb_realAtReportClick(Sender: TObject);
begin
  inherited;
  mn_RealATReportClick(sender);
end;

procedure TfmMain.mn_AtFileSaveClick(Sender: TObject);
begin
  inherited;
  fmAtFileSave:= TfmAtFileSave.Create(Self);
  fmAtFileSave.SHowmodal;
  fmAtFileSave.Free;

end;

procedure TfmMain.N63Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmRealATListReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmRealATListReport').FindCommand('GRADEREFRESH').Execute;
end;

procedure TfmMain.mn_ACEATFileSaveClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmAceAtFileSave');

end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
begin
  inherited;
  Action_StateSearchExecute(self);
  StateCheckTimer.Enabled := False;
  
end;

procedure TfmMain.mn_EmployeeBranchClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmployeeBranch:= TfmEmployeeBranch.Create(Self);
  Try
    fmEmployeeBranch.Caption := mn_EmployeeBranch.Caption;
    fmEmployeeBranch.IsInsertGrade := bInsertGrade;
    fmEmployeeBranch.IsUpdateGrade := bUpdateGrade;
    fmEmployeeBranch.IsDeleteGrade := bDeleteGrade;
    fmEmployeeBranch.SHowmodal;
  Finally
    fmEmployeeBranch.Free;
  End;

end;

procedure TfmMain.mn_EmCodeChangeClick(Sender: TObject);
begin
  fmEmCodeChange:= TfmEmCodeChange.Create(Self);
  Try
    fmEmCodeChange.Caption := mn_EmCodeChange.Caption;
    fmEmCodeChange.SHowmodal;
  Finally
    fmEmCodeChange.Free;
  End;

end;

procedure TfmMain.mn_HizeATClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmHizAtFileSave');
  //
end;

function TfmMain.RegistryKeyCheck(var aCustomerID: string): Boolean;
var
  FReg : TRegistry;
  stInstallDate : string;
begin

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    if FReg.OpenKey('Software\Zeron\ZTBMS',True) then
    begin
//showmessage('RegOpen');
      aCustomerID := FReg.ReadString('CustomerID');
      stInstallDate := FReg.ReadString('InstallDate');
//showmessage(aCustomerID);
      if aCustomerID = 'Z-00000000' then
      begin
        stInstallDate := copy(stInstallDate,1,4) + '-' + copy(stInstallDate,5,2) + '-' + copy(stInstallDate,7,2);
        if Not IsDate(stInstallDate) then result := False
        else
        begin
          if stInstallDate < formatDateTime('yyyy-mm-dd',now) then result := False
          else result := True;
        end;
      end else
      begin
        if aCustomerID <> '' then result := True;
      end;
    end else
    begin
//showmessage('Not RegOpen');
      result := False;
    end;
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;
end;

procedure TfmMain.WriteRegistryKey(aCustomerID, aInstallDate: string);
var
  FReg : TRegistry;
begin
  if aInstallDate = '' then aInstallDate := formatDateTime('yyyymmdd' ,Now + 30);

  FReg := TRegistry.Create;
  try
    FReg.RootKey := HKEY_LOCAL_MACHINE;
    FReg.OpenKey('Software\Zeron\ZTBMS',True);
    FReg.WriteString('CustomerID',aCustomerID);
    FReg.WriteString('InstallDate',aInstallDate);
    FReg.CloseKey;
  Finally
    FReg.Free;
  end;
end;

procedure TfmMain.mn_STXATClick(Sender: TObject);
begin
  inherited;
  fmSTXAtFileSend:= TfmSTXAtFileSend.Create(Self);
  fmSTXAtFileSend.SHowmodal;
  fmSTXAtFileSend.Free;
end;

function TfmMain.GetSentenceRelayConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      First;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if FindField('PC_CONFIGCODE').AsString = 'DBTYPE' then
          G_stRelayDBType := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP' then
          G_stRelayDBServerIP := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT' then
          G_stRelayDBServerPort := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID' then
          G_stRelayDBServerUserID := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW' then
          G_stRelayDBServerUserPW := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBNAME' then
          G_stRelayDBServerName := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBTYPE2' then
          G_stRelayDBType2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP2' then
          G_stRelayDBServerIP2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT2' then
          G_stRelayDBServerPort2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID2' then
          G_stRelayDBServerUserID2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW2' then
          G_stRelayDBServerUserPW2 := FindField('PC_CONFIGVALUE').AsString
        else if FindField('PC_CONFIGCODE').AsString = 'DBNAME2' then
          G_stRelayDBServerName2 := FindField('PC_CONFIGVALUE').AsString;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.mn_ThezonRelayClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmTheZonAtFileSave');

end;

procedure TfmMain.mn_ATD2DStatReportClick(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmATD2DStatReport',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmATD2DStatReport').FindCommand('GRADEREFRESH').Execute;

end;

end.
