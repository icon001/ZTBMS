unit uMain;
 
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Planner, PlanSimpleEdit, ExtCtrls, OoMisc, AdPort, AdWnPort,
  ActnList, ImgList, Menus, ComCtrls, ToolWin, uSubForm,
  CommandArray, OleCtrls, SHDocVw,iniFiles,Registry,ADODB,ActiveX
  ;

type
  TfmMain = class(TfmASubForm)
    Image1: TImage;
    ToolBar1: TToolBar;
    btnFoodAdmin: TToolButton;
    btnFoodReport: TToolButton;
    btnD2DFDReport: TToolButton;
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
    WinsockPort: TApdWinsockPort;
    SendDaemonTimer: TTimer;
    SaveDialog1: TSaveDialog;
    SimpleItemEditor1: TSimpleItemEditor;
    mn_FoodReport: TMenuItem;
    mn_FoodAdmin: TMenuItem;
    mn_FdAdmin: TMenuItem;
    N20: TMenuItem;
    N22: TMenuItem;
    Action_Login: TAction;
    Action_LogOut: TAction;
    Action_FdAdmin: TAction;
    Action_PersonFdReport: TAction;
    Action_D2DFdReport: TAction;
    Action_PersonFDstatistical: TAction;
    N13: TMenuItem;
    N15: TMenuItem;
    N30: TMenuItem;
    mn_system: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    ToolButton1: TToolButton;
    Action_FDMonitoring: TAction;
    mn_reg: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N1: TMenuItem;
    N5: TMenuItem;
    N9: TMenuItem;
    N21: TMenuItem;
    StateCheckTimer: TTimer;
    AliveTimer: TTimer;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    Panel1: TPanel;
    WebBrowser1: TWebBrowser;
    mn_FoodCountReport: TMenuItem;
    N16: TMenuItem;
    N27: TMenuItem;
    mn_FoodReInsert: TMenuItem;
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
    procedure Action_D2DATReportExecute(Sender: TObject);
    procedure Action_absenceReportExecute(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure Action_MonATStateExecute(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure Action_FdAdminExecute(Sender: TObject);
    procedure Action_PersonFdReportExecute(Sender: TObject);
    procedure Action_D2DFdReportExecute(Sender: TObject);
    procedure Action_PersonFDstatisticalExecute(Sender: TObject);
    procedure Action_StateSearchExecute(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure mn_DepartAtAdminClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure N15Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure Action_FDMonitoringExecute(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure StateCheckTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SendDaemonTimerTimer(Sender: TObject);
    procedure AliveTimerTimer(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure mn_FoodCountReportClick(Sender: TObject);
    procedure mn_FoodReInsertClick(Sender: TObject);
  private
    L_bClose : Boolean;
    FLogined: Boolean;
    FPrivileges: String;
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    Procedure TravelMenuItem(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelMenuView(MenuItem:TMenuItem;ProgIDs:String);
    Procedure TravelToolBar(ToolBar:TToolBar;ProgIDs:String);
    Procedure TravelToolButton(ToolButton:TToolButton;ProgIDs:String);
    procedure InitConfigSet;
    Procedure MenuViewSetting;
    Function  GetFoodConfig : Boolean;
    procedure GetProgramGrade(aProgID:string;var aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    procedure FoodTableVersionCheck;
    function GetFoodVersion:integer;
    function FoodTable1VeriosionMake:Boolean;
    Function InsertIntoTB_PROGRAMGROUP(aGroupCode,aGroupName,aGubun:string):Boolean;
    Function InsertIntoTB_PROGRAMID(aProgramID,aGroupCode,aProgramName,aVisible,aSeq,aGubun:string):Boolean;
  private
    bFoodStateShow : Boolean;
    ServerComBuff : string;
    stPrivileges:String;
    IsFormShow : Boolean;
    DaemonServerIP : string;
    DaemonServerPort : string;
    FoodServerPort : string;               //식수서버포트
    L_stCustomerID : string;
    bApplicationTerminate : boolean;
    SendDaemonDataList : TStringList;
    { Private declarations }
    Procedure MDIChildShow(FormName:String);
    Procedure MDIChildGradeShow(FormName:String;aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;
    //서버에서 수신된 데이터 처리
    Procedure RevFromServer(aData:String);
    Procedure SendDaemon(aData:string);
    Function RegistryKeyCheck(var aCustomerID:string):Boolean;
    procedure WriteRegistryKey(aCustomerID,aInstallDate:string);
  public
    L_bZeronConnected : Boolean;
    L_bWebComplete : Boolean;
    Function  AuthSiteConnect: Boolean;
    { Public declarations }
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
  uLomosUtil,
  uATIncode,
  uATOutcode,
  uATConfig,
  uCardAdmin,
  uMDBSql,
  uMssql,
  uPostGreSql, uAdmin, uGradeCode, uGradeProgram, uCompanyCode, uEmploy,
  uFoodCode, uFoodConfig,uFoodEventInsert,
  uFoodReInsert;
{$R *.dfm}

procedure TfmMain.FormCreate(Sender: TObject);
var
  stKey1 : string;
  stKey2 : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  bAuthConnect : Boolean;
  bOffLineAuth : Boolean;
  ini_fun : TiniFile;
  bRegistryKeyCheck : Boolean;
begin
  L_bClose := False;
  SendDaemonDataList := TStringList.Create;
  SendDaemonDataList.Clear;

  self.ModuleID := 'Main';

  ExeFolder  := ExtractFileDir(Application.ExeName);
  IsFormShow := False;

  bApplicationTerminate := False;

  bAuthConnect := AuthSiteConnect;
  bRegistryKeyCheck := RegistryKeyCheck(L_stCustomerID);
  if Not bRegistryKeyCheck then
  begin

    bOffLineAuth := GetOffLineAuthState('4');
      //여기서 인증 키값을 확인하자.
    stKey1 := GetAuthKey('4');
    if stKey1 = '' then
    begin
      showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
      ExecFileAndWait(ExeFolder + '\KeyZen.exe 4',true,true);
      stKey1 := GetAuthKey('4');
    end;
    if stKey1 = '' then
    begin
      Application.Terminate;
      G_bApplicationTerminate := True;
      Exit;
    end;

    stSaupId := GetSaupId('');
    bResult  := False;

    if bAuthConnect or Not bOffLineAuth then   //인터넷 연결 되었거나 온라인 인증 받은 경우
    begin
      if stSaupId <> '' then
      begin
        bResult := CompareKey(stSaupId,stKey1);
        if Not bResult then bResult := CompareKey2(stSaupId,stKey1);
        if Not bResult then bResult := CompareKey3(stSaupId,stKey1);
        if Not bResult then
        begin
          stKey2 := GetAuthKey1('4');
          if stKey2 <> '' then
          begin
            bResult := CompareKey(stSaupId,stKey2);
            if Not bResult then bResult := CompareKey2(stSaupId,stKey2);
            if Not bResult then bResult := CompareKey3(stSaupId,stKey2);
          end;
        end;
      end;
    end;

    if Not bResult then
    begin
      bOffLineAuth := GetOffLineAuthState('4');
      if Not bAuthConnect and bOffLineAuth then   //OffLine 모드에서 인증 받은 경우
      begin
        bResult := CompareOffLineKey(stSaupId,stKey1,'4');
      end;
      if Not bResult then
      begin
        if bAuthConnect and bOffLineAuth then
        begin
          showmessage('인증키값을 온라인으로 다시 한번 인증받으세요.');
          ExecFileAndWait(ExeFolder + '\KeyZen.exe 4',true,true);
        end else
        begin
          showmessage('인증키값이 틀립니다.');
          if FileExists(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini') then
          begin
            //DeleteFile(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini');
          end;
          Application.Terminate;
          G_bApplicationTerminate := True;
          Close;
          Exit;
        end;
      end;
    end;

    L_stCustomerID := stSaupId;

    if stSaupId = 'Z-00000000' then
    begin
      stDate := GetInstallDate('4');
      stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
      if Not IsDate(stDate) then
      begin
        showmessage('인증키의 유효기간이 만료되었습니다.');
        Application.Terminate;
        G_bApplicationTerminate := True;
        Close;
        Exit;
      end;
      if stDate < formatDateTime('yyyy-mm-dd',now) then
      begin
        showmessage('인증키의 유효기간이 만료되었습니다.');
        Application.Terminate;
        G_bApplicationTerminate := True;
        Close;
        Exit;
      end;
    end;
  end;
  if Not bRegistryKeyCheck then
  begin
    WriteRegistryKey(L_stCustomerID,stDate);
  end;

(*
  bOffLineAuth := GetOffLineAuthState('4');

    //여기서 인증 키값을 확인하자.
  stKey1 := GetAuthKey('4');
  if stKey1 = '' then
  begin
    showMessage('프로그램 설치후 프로그램 인증을 받으셔야 사용 가능 합니다.');
    ExecFileAndWait(ExeFolder + '\KeyZen.exe 4',true,true);
    stKey1 := GetAuthKey('4');
  end;
  if stKey1 = '' then
  begin
    Application.Terminate;
    bApplicationTerminate := True;
    Exit;
  end;

  stSaupId := GetSaupId('');
  bResult  := False;

  if bAuthConnect or Not bOffLineAuth then   //인터넷 연결 되었거나 온라인 인증 받은 경우
  begin
    if stSaupId <> '' then
    begin
      bResult := CompareKey(stSaupId,stKey1);
      if Not bResult then bResult := CompareKey2(stSaupId,stKey1);
      if Not bResult then bResult := CompareKey3(stSaupId,stKey1);
      if Not bResult then
      begin
        stKey2 := GetAuthKey1('4');
        if stKey2 <> '' then
        begin
          bResult := CompareKey(stSaupId,stKey2);
          if Not bResult then bResult := CompareKey2(stSaupId,stKey2);
          if Not bResult then bResult := CompareKey3(stSaupId,stKey2);
        end;
      end;
    end;
  end;

  if Not bResult then
  begin
    bOffLineAuth := GetOffLineAuthState('4');
    if Not bAuthConnect and bOffLineAuth then   //OffLine 모드에서 인증 받은 경우
    begin
      bResult := CompareOffLineKey(stSaupId,stKey1,'4');
    end;
    if Not bResult then
    begin
      if bAuthConnect and bOffLineAuth then
      begin
        showmessage('인증키값을 온라인으로 다시 한번 인증받으세요.');
        ExecFileAndWait(ExeFolder + '\KeyZen.exe 4',true,true);
      end else
      begin
        showmessage('인증키값이 틀립니다.');
        if FileExists(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini') then
        begin
          //DeleteFile(ExtractFileDir(Application.ExeName) + '\' + 'Key.ini');
        end;
        Application.Terminate;
        bApplicationTerminate := True;
        Close;
        Exit;
      end;
    end;
  end;

  if stSaupId = 'Z-00000000' then
  begin
    stDate := GetInstallDate('4');
    stDate := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
    if Not IsDate(stDate) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      bApplicationTerminate := True;
      Exit;
    end;
    if stDate < formatDateTime('yyyy-mm-dd',now) then
    begin
      showmessage('인증키의 유효기간이 만료되었습니다.');
      Application.Terminate;
      bApplicationTerminate := True;
      Exit;
    end;
  end;
*)

  Panel1.Left := -1000;

  ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');
  G_nFoodAdminGrade := ini_fun.ReadInteger('FOOD','AdminGrade',0);
  ini_fun.free;

end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if Not bApplicationTerminate then
  begin
    if IsFormShow then Exit;
    IsFormShow := True; // 한번만 Activate 실행 되도록 막아줌
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
    FoodTableVersionCheck;

    InitConfigSet;
    MenuViewSetting;

    btnFoodAdmin.Visible := True;
    btnFoodReport.Visible := true;
    btnD2DFDReport.Visible := True;
    mn_FoodAdmin.Visible := True;
    mn_FoodReport.Visible := True;
    mn_reg.Visible := True;
    mn_system.Visible := True;
    ToolButton1.Visible := True;
    N30.Visible := True;
    mn_FoodCountReport.Visible := False;
    //mn_FoodState.Visible := True;

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
    end else if G_nSpecialProgram = 5 then   //송호대학교
    begin
      ToolButton1.Visible := False;  //잔반 모니터링은 별도로 빠져 나감
      N30.Visible := False;
      mn_FoodCountReport.Visible := True;
      FOODGRADE := 0;
    end;
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
  end else
  begin
   StatusBar1.Panels[0].Text := '';
   StatusBar1.Panels[1].Text := '로그아웃.';
  end;
end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
  TravelMenuItem(mn_reg,Value); //등록
  TravelMenuItem(mn_FoodAdmin,Value); //식수관리
  TravelMenuItem(mn_FoodReport,Value); //식수보고서
  TravelMenuItem(mn_system,Value); //시스템관리

  //TravelMenuItem(mn_FoodState,Value); //식수통계

  //ToolBar 관리
  TravelToolBar(ToolBar1,Value);
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  LogoFile : string;
begin
  if Not bApplicationTerminate then
  begin
    LogoFile := ExeFolder + '\..\image\KTREPORTLogo.JPG';
    if FileExists(LogoFile) then
    Image1.Picture.LoadFromFile(LogoFile);

    StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width;
  end;
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
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
      begin
        Screen.Forms[i].Show;
        Exit;
      end;
    end;

    tmpFormClass := TFormClass(tmpClass);
    tmpForm := tmpFormClass.Create(Self);
    tmpForm.Show;
  end;
end;

procedure TfmMain.Action_ATAdminExecute(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  MDIChildGradeShow('TfmPerATAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
  self.FindClassForm('TfmPerATAdmin').FindCommand('GRADEREFRESH').Execute;
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
   stPrivileges :=TLogin.GetObject.ProgIDs; //권한설정
   Privileges:=stPrivileges; //권한설정
   Logined := TLogin.GetObject.Logined;
   //CompanyCode := Trim(TLogin.getobject.CompanyCode);
   //DepartCode := Trim(TLogin.getobject.DepartCode);;

end;

procedure TfmMain.Action_LogOutExecute(Sender: TObject);
begin
  Master_ID := '';
  Logined := False;
  Privileges := '';

end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  if bApplicationTerminate then Exit;
  StatusBar1.Panels[1].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - StatusBar1.Panels[2].Width;

end;

procedure TfmMain.InitConfigSet;
var
  stSql : string;
  stFileServerIP : string;
  stFileServerDir :string;
begin
  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;
  SensorUse := False;
  bALARMSHORT := True;
  bALARMDOWN := True;
  CARDLENGTHTYPE := 0; //디폴트로 고정 4Byte 사용
  IsNumericCardNo := True; //카드번호 숫자타입 사용/미사용
  DUPCARDTYPE := 0; //1인당 한장의 카드 사용 원칙
  G_bCardFixedUse := False; //카드고정길이 사용 안함
  G_stCardFixedFillChar := '0';  //카드고정길이 사용시 채움문자
  G_nCardFixedPosition := 0; //채움문자위치 0:앞,1:뒤
  G_nCardFixedLength := 11;  //카드고정길이 KT에서 처음 사용해서 디폴트 11자리
  CardAutoDownLoadUse := False; //카드 자동 다운로드
  G_nCardReaderType := 0; //0.범용,1.스마트원

  FoodServerPort := '3432';
  dmDBFoodEvent.FoodYesterDayTime := '0400';

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''ALARM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''CARD'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''MCUCOMM'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''FOOD'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'')';

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
      end else if FindField('CO_CONFIGCODE').AsString = 'FOOD' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = 'Y' then  FoodUse := True
        else FoodUse := False;
      end else if FindField('CO_CONFIGCODE').AsString = 'SENSOR' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = 'Y' then  SensorUse := True
        else SensorUse := False;
      end else if FindField('CO_CONFIGCODE').AsString = 'SHORT' then
      begin
        if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMSHORT := FALSE;
      end else if FindField('CO_CONFIGCODE').AsString = 'DOWN' then
      begin
        if FindField('CO_CONFIGVALUE').AsString <> '1' then bALARMDOWN := FALSE;
      end else if FindField('CO_CONFIGCODE').AsString = 'FILEIP' then
      begin
        stFileServerIP := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FILEDIR' then
      begin
        stFileServerDir := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'ALARMVIEW' then
      begin
        ALARMVIEW := UpperCase(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then
      begin
        G_nSpecialProgram := StrtoInt(FindField('CO_CONFIGVALUE').AsString);
      end else if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
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
      end
      else if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
      else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then DUPCARDTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
      else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
      end else if FindField('CO_CONFIGCODE').AsString = 'CARDAUTO' then
      begin
        if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then CardAutoDownLoadUse := True;
      end else if FindField('CO_CONFIGCODE').AsString = 'IP' then
      begin
        DaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'PORT' then
      begin
        DaemonServerPort := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODDEVICE' then
      begin
        FOODDEVICE := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODGRADE' then
      begin
        FOODGRADE := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end else if ( FindField('CO_CONFIGCODE').AsString = 'READERTYPE') then
      begin
        if isDigit(FindField('CO_CONFIGVALUE').AsString) then
          G_nCardReaderType := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end
      else if FindField('CO_CONFIGCODE').AsString = 'FOODPORT' then FoodServerPort := FindField('CO_CONFIGVALUE').AsString
      else if (FindField('CO_CONFIGGROUP').AsString = 'FOOD') AND (FindField('CO_CONFIGCODE').AsString = 'YSDAYTIME') then
      begin
          dmDBFoodEvent.FoodYesterDayTime := FindField('CO_CONFIGVALUE').AsString;
      end else if (FindField('CO_CONFIGGROUP').AsString = 'FOOD') AND (FindField('CO_CONFIGCODE').AsString = 'DUPEVENT') then
      begin
        if isdigit(FindField('CO_CONFIGVALUE').AsString) then
          dmDBFoodEvent.FoodDupEvent := strtoint(FindField('CO_CONFIGVALUE').AsString);
      end;

      Next;
 //     Application.ProcessMessages;
    end;
  end;

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
  AttendUse := False;
  FoodUse := True;
  AccessUse := False;
  PatrolUse := False;


end;
{
procedure TfmMain.InitConfigSet;
var
  stSql : string;
begin
  AccessUse := False;
  PatrolUse := False;
  AttendUse := False;
  FoodUse := False;
  FoodServerPort := '3432';

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where  GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''DAEMON'')';

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
      end else if FindField('CO_CONFIGCODE').AsString = 'FOOD' then
      begin
        if FindField('CO_CONFIGVALUE').AsString = 'Y' then  FoodUse := True
        else FoodUse := False;
      end else if FindField('CO_CONFIGCODE').AsString = 'IP' then
      begin
        DaemonServerIP := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'PORT' then
      begin
        DaemonServerPort := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODDEVICE' then
      begin
        FOODDEVICE := FindField('CO_CONFIGVALUE').AsString;
      end else if FindField('CO_CONFIGCODE').AsString = 'FOODGRADE' then
      begin
        FOODGRADE := FindField('CO_CONFIGVALUE').AsInteger;
      end
      else if FindField('CO_CONFIGCODE').AsString = 'FOODPORT' then FoodServerPort := FindField('CO_CONFIGVALUE').AsString ;

      Next;
    end;
  end;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    if DBTYPE = 'MDB' then stSql := MDBSql.UpdateTB_PROGRAMIDSetVisible
    else if DBTYPE = 'PG' then stSql := PostGreSql.UpdateTB_PROGRAMIDSetVisible
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.UpdateTB_PROGRAMIDSetVisible
    else Exit;;
    {//권한관리쪽에서 보여줄 항목을 셋팅하자
    stSql := 'update TB_PROGRAMID  Set PR_VISIBLE = TB_CONFIG.CO_CONFIGVALUE ' ;
    stSql := stSql + ' FROM TB_PROGRAMID  ';
    stSql := stSql + ' INNER JOIN TB_CONFIG ';
    stSql := stSql + ' ON (TB_PROGRAMID.CO_CONFIGCODE = TB_CONFIG.CO_CONFIGCODE';
    stSql := stSql + ' AND TB_CONFIG.CO_CONFIGGROUP = ''MOSTYPE'' )';
    stSql := stSql + ' where TB_PROGRAMID.PR_VISIBLE <> ''D'' ';
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      //무시
    End;

  end;
  AttendUse := False;
  FoodUse := True;
  AccessUse := False;
  PatrolUse := False;

end;    }

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
    TravelMenuView(mn_reg,ViewMenu); //등록
    TravelMenuView(mn_FoodAdmin,ViewMenu); //식수관리
    TravelMenuView(mn_FoodReport,ViewMenu); //식수보고서
    TravelMenuView(mn_system,ViewMenu); //시스템
    //TravelMenuView(mn_FoodState,ViewMenu); //식수통계

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

procedure TfmMain.Action_D2DATReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmD2DATReport');

end;

procedure TfmMain.Action_absenceReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmNonATReport');

end;

procedure TfmMain.N7Click(Sender: TObject);
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
  GetProgramGrade(mn_FdAdmin.Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
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

procedure TfmMain.Action_PersonFDstatisticalExecute(Sender: TObject);
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
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 1;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;
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
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.WorkCode := 0;
  fmCompanyCode.IsInsertGrade := bInsertGrade;
  fmCompanyCode.IsUpdateGrade := bUpdateGrade;
  fmCompanyCode.IsDeleteGrade := bDeleteGrade;
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;


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
  fmATConfig.Free;
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
  clsName := FormName;
  tmpClass := FindClass(clsName);
  if tmpClass <> nil then
  begin
    for i := 0 to Screen.FormCount - 1 do
    begin
      if Screen.Forms[i].ClassNameIs(clsName) then
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

procedure TfmMain.N30Click(Sender: TObject);
begin
  MDIChildShow('TfmFoodState');
end;

procedure TfmMain.CommandArrayCommandsTCommand0Execute(Command: TCommand;
  Params: TStringList);
var
  stValue:string;
begin
  stValue := Params.Values['VALUE'];
  if stValue = 'TRUE' then
  begin
    WinsockPort.Open := False;
    if Trim(DaemonServerIP) = '' then DaemonServerIP := '127.0.0.1';
    //if Trim(DaemonServerPort) = '' then DaemonServerPort := '1024';
    WinsockPort.WsAddress := DaemonServerIP;
    WinsockPort.WsPort := FoodServerPort;
    Try
      WinsockPort.Open := True;
    Except
      Exit;
    End;
  end else
  begin
    WinsockPort.Open := False;
  end;
end;

procedure TfmMain.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
begin
  st:= '';
  for I := 1 to Count do st := st + WinsockPort.GetChar;
  ServerComBuff:= ServerComBuff + st;


  repeat
    aData:= Copy(ServerComBuff,1,Pos(#13,ServerComBuff));
    RevFromServer(aData);
    Delete(ServerComBuff,1,Pos(#13,ServerComBuff));
  until pos(#13,ServerComBuff) = 0;

end;

procedure TfmMain.WinsockPortWsConnect(Sender: TObject);
begin
  if bFoodStateShow then
  begin
    self.FindClassForm('TfmFoodState').FindCommand('Connect').Execute;
    StateCheckTimer.Enabled := True;
  end;
  AliveTimer.Enabled := True;

end;

procedure TfmMain.WinsockPortWsDisconnect(Sender: TObject);
begin
  if bFoodStateShow then self.FindClassForm('TfmFoodState').FindCommand('DisConnect').Execute;
  AliveTimer.Enabled := False;
end;

procedure TfmMain.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
begin
  if bFoodStateShow then self.FindClassForm('TfmFoodState').FindCommand('DisConnect').Execute;
  AliveTimer.Enabled := False;
end;

procedure TfmMain.RevFromServer(aData: String);
begin
  if Length(aData) < 10 then
  begin
    Exit;
  end;
  case aData[1] of
    'F':// 서버로부터 식수 데이터 받은 경우
      begin
          if bFoodStateShow then
          begin
            self.FindClassForm('TfmFoodState').FindCommand('FOODRECV').Params.Values['VALUE'] := aData;
            self.FindClassForm('TfmFoodState').FindCommand('FOODRECV').Execute;
          end;
          if bfmEmployShow then
          begin
            self.FindClassForm('TfmEmploy').FindCommand('Message').Params.Values['VALUE'] := aData;
            self.FindClassForm('TfmEmploy').FindCommand('Message').Execute;
          end;
      end;
     'P': //서버 제어 상태 받은 경우
      begin
          if bFoodStateShow then
          begin
            self.FindClassForm('TfmFoodState').FindCommand('FOODRECV').Params.Values['VALUE'] := aData;
            self.FindClassForm('TfmFoodState').FindCommand('FOODRECV').Execute;
          end;
          if bfmEmployShow then
          begin
            self.FindClassForm('TfmEmploy').FindCommand('Message').Params.Values['VALUE'] := aData;
            self.FindClassForm('TfmEmploy').FindCommand('Message').Execute;
          end;
      end;
     'R': //기기상태 받은 경우
      begin
          if bFoodStateShow then
          begin
            self.FindClassForm('TfmFoodState').FindCommand('DEVICESTATE').Params.Values['VALUE'] := aData;
            self.FindClassForm('TfmFoodState').FindCommand('DEVICESTATE').Execute;
          end;
      end;
    else
      begin
      end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTCommand1Execute(Command: TCommand;
  Params: TStringList);
var
  stValue:string;
begin
  stValue := Params.Values['VALUE'];
  if stValue = 'fmFoodState' then bFoodStateShow := True;
end;

procedure TfmMain.CommandArrayCommandsTCommand2Execute(Command: TCommand;
  Params: TStringList);
var
  stValue:string;
begin
  stValue := Params.Values['VALUE'];
  if stValue = 'fmFoodState' then bFoodStateShow := False;
end;

procedure TfmMain.N15Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  if FOODGRADE = 0 then //기기에 권한 등록
  begin
    fmCardAdmin:= TfmCardAdmin.Create(Self);
    fmCardAdmin.IsInsertGrade := bInsertGrade;
    fmCardAdmin.IsUpdateGrade := bUpdateGrade;
    fmCardAdmin.IsDeleteGrade := bDeleteGrade;
    fmCardAdmin.SHowmodal;
    fmCardAdmin.Free;
  end else
  begin
    MDIChildGradeShow('TfmFoodGradeAdmin',bInsertGrade,bUpdateGrade,bDeleteGrade);
    self.FindClassForm('TfmFoodGradeAdmin').FindCommand('GRADEREFRESH').Execute;
  end;
  

end;

procedure TfmMain.FoodTableVersionCheck;
var
  nFoodTableVersion : integer;
begin
  nFoodTableVersion := GetFoodVersion;
  if nFoodTableVersion < 1 then FoodTable1VeriosionMake;

end;

function TfmMain.GetFoodVersion: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''FOOD'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER'' ';
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
    Try
      result := strtoint(FindField('CO_CONFIGVALUE').AsString);
    Except
      Exit;
    End;
  end;
end;

function TfmMain.FoodTable1VeriosionMake: Boolean;
var
  stSql : string;
begin
  InsertIntoTB_PROGRAMGROUP('FOBASECODE','식수-등록','FOOD');
  InsertIntoTB_PROGRAMGROUP('FOMANAGER','식수-운영관리','FOOD');
  InsertIntoTB_PROGRAMGROUP('FOREPORT','식수-식수보고서','FOOD');
  InsertIntoTB_PROGRAMGROUP('FOSYSTEM','식수-시스템관리','FOOD');
  InsertIntoTB_PROGRAMID('FOA00','FOBASECODE','운영관리','D','1','FOOD');
  InsertIntoTB_PROGRAMID('FOA01i','FOBASECODE','조직도등록','Y','2','FOOD');
  InsertIntoTB_PROGRAMID('FOA02i','FOBASECODE','개인등록','Y','3','FOOD');
  InsertIntoTB_PROGRAMID('FOB00','FOMANATGER','운영관리','D','11','FOOD');
  InsertIntoTB_PROGRAMID('FOB01i','FOMANAGER','식수권한관리','Y','12','FOOD');
  InsertIntoTB_PROGRAMID('FOB02i','FOMANAGER','개인별식수관리','Y','13','FOOD');
  InsertIntoTB_PROGRAMID('FOB03s','FOMANAGER','식수현황모니터링','Y','14','FOOD');
  InsertIntoTB_PROGRAMID('FOC00','FOREPORT','식수보고서','D','21','FOOD');
  InsertIntoTB_PROGRAMID('FOC01r','FOREPORT','개인별식수보고서','Y','22','FOOD');
  InsertIntoTB_PROGRAMID('FOC02r','FOREPORT','개인별식수통계','Y','23','FOOD');
  InsertIntoTB_PROGRAMID('FOD00','FOSYSTEM','시스템관리','D','31','FOOD');
  InsertIntoTB_PROGRAMID('FOD01i','FOSYSTEM','권한등급관리','Y','32','FOOD');
  InsertIntoTB_PROGRAMID('FOD02i','FOSYSTEM','시스템운영자관리','Y','33','FOOD');

  stSql := ' Insert Into TB_CONFIG(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CO_CONFIGGROUP,';
  stSql := stSql + 'CO_CONFIGCODE,';
  stSql := stSql + 'CO_CONFIGVALUE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''FOOD'',';
  stSql := stSql + '''TABLE_VER'',';
  stSql := stSql + '''1'')';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.InsertIntoTB_PROGRAMGROUP(aGroupCode, aGroupName,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_PROGRAMGROUP(GROUP_CODE,PR_GROUPCODE,PR_GROUPCODENAME,';
  stSql := stSql + 'PR_VISIBLE,GUBUN)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGroupCode + ''',';
  stSql := stSql + '''' + aGroupName + ''',';
  stSql := stSql + '''Y'',';
  stSql := stSql + '''' + aGubun + ''') ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.InsertIntoTB_PROGRAMID(aProgramID, aGroupCode,
  aProgramName, aVisible, aSeq, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PROGRAMID(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PR_PROGRAMID,';
  stSql := stSql + 'PR_GROUPCODE,';
  stSql := stSql + 'PR_PROGRAMNAME,';
  stSql := stSql + 'PR_VISIBLE,';
  stSql := stSql + 'PR_VIEWSEQ,';
  stSql := stSql + 'CO_CONFIGCODE,';
  stSql := stSql + 'PR_ENABLE ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aProgramID + ''', ';
  stSql := stSql + '''' + aGroupCode + ''', ';
  stSql := stSql + '''' + aProgramName +''', ';
  stSql := stSql + '''' + aVisible + ''', ';
  stSql := stSql + aSeq + ', ';
  stSql := stSql + '''' + aGubun + ''', ';
  stSql := stSql + '''Y'') ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.N6Click(Sender: TObject);
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

procedure TfmMain.Action_FDMonitoringExecute(Sender: TObject);
begin
  MDIChildShow('TfmFoodState');
  StateCheckTimer.Enabled := True;
end;

procedure TfmMain.N14Click(Sender: TObject);
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

procedure TfmMain.N17Click(Sender: TObject);
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

procedure TfmMain.N18Click(Sender: TObject);
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

procedure TfmMain.N19Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TMenuItem(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmEmploy:= TfmEmploy.Create(Self);
  fmEmploy.IsInsertGrade := bInsertGrade;
  fmEmploy.IsUpdateGrade := bUpdateGrade;
  fmEmploy.IsDeleteGrade := bDeleteGrade;
  bfmEmployShow := True;
  fmEmploy.SHowmodal;
  bfmEmployShow := False;
  fmEmploy.Free;
end;

procedure TfmMain.StateCheckTimerTimer(Sender: TObject);
begin
  StateCheckTimer.Enabled := False;
  Action_StateSearchExecute(Self);

end;

procedure TfmMain.Action_StateSearchExecute(Sender: TObject);
var
  stSendData : string;
begin
  stSendData := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  SendDaemonDataList.Add(stSendData);
  SendDaemonTimer.Enabled := True;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if bFoodStateShow then
  begin
    self.FindClassForm('TfmFoodState').FindCommand('Formclose').Execute;
  end;
  L_bClose := True;
  SendDaemonTimer.Enabled := False;
  StateCheckTimer.Enabled := False;
  AliveTimer.Enabled := False;
  SendDaemonTimer.Free;
  StateCheckTimer.Free;
//  AliveTimer.Free;
  SendDaemonDataList.Free;
end;

procedure TfmMain.SendDaemonTimerTimer(Sender: TObject);
var
  PastTime : dword;
  stSendData : string;
begin
  if SendDaemonDataList.Count  < 1 then Exit;
  if Not WinsockPort.Open then
  begin
    SendDaemonDataList.Clear;
  end;
  SendDaemonTimer.Enabled := False;
  if L_bClose then Exit;

  stSendData := sendDaemonDataList.Strings[0] + LINEEND;
  sendDaemonDataList.Delete(0);

  SendDaemon(stSendData);
  SendDaemonTimer.Enabled := True;
end;

procedure TfmMain.SendDaemon(aData: string);
begin
  if L_bClose then Exit;
  if WinsockPort.Open then WinsockPort.PutString(aData);
end;

procedure TfmMain.AliveTimerTimer(Sender: TObject);
begin
  SendDaemonDataList.Add('ALIVE');
end;

procedure TfmMain.N9Click(Sender: TObject);
var
  bInsertGrade : Boolean;
  bUpdateGrade : Boolean;
  bDeleteGrade : Boolean;
begin
  GetProgramGrade(TAction(Sender).Hint,bInsertGrade,bUpdateGrade,bDeleteGrade);
  fmFoodCode:= TfmFoodCode.Create(Self);
  fmFoodCode.IsInsertGrade := bInsertGrade;
  fmFoodCode.IsUpdateGrade := bUpdateGrade;
  fmFoodCode.IsDeleteGrade := bDeleteGrade;
  fmFoodCode.SHowmodal;
  fmFoodCode.Free;
end;

procedure TfmMain.N24Click(Sender: TObject);
begin
  fmFoodConfig:= TfmFoodConfig.Create(Self);
  fmFoodConfig.SHowmodal;
  fmFoodConfig.Free;
end;

procedure TfmMain.CommandArrayCommandsTCommand3Execute(Command: TCommand;
  Params: TStringList);
var
  stValue:string;
begin
  stValue := Params.Values['VALUE'];
  StatusBar1.Panels[1].Text := stValue ;
end;

procedure TfmMain.N25Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmD2DFdState');

end;

procedure TfmMain.N26Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmD2DDepartFDState');

end;

function TfmMain.AuthSiteConnect: Boolean;
var
  conStr : string;
  FirstTickCount : double;
begin
  result := False;
  conStr := 'http://zeron.co.kr/ztbmskey/connectcheck.html';
  L_bWebComplete := False;
  L_bZeronConnected := False;
  WebBrowser1.Navigate(conStr);
  FirstTickCount := GetTickCount + 1000;
  while Not L_bWebComplete do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Exit;
  end;

  result := L_bZeronConnected;
end;

procedure TfmMain.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  stHTML : string;
begin
  inherited;
  If LowerCase(URL) = LowerCase('http://zeron.co.kr/ztbmskey/connectcheck.html') Then
  Begin
    stHTML := WebBrowser1.OleObject.Document.Body.InnerHTML;
    if UpperCase(stHTML) = 'OK' then
      L_bZeronConnected := True;
  end;
  L_bWebComplete := True;

end;

procedure TfmMain.mn_FoodCountReportClick(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmFoodCountReport');
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
      aCustomerID := FReg.ReadString('CustomerID');
      stInstallDate := FReg.ReadString('InstallDate');
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

procedure TfmMain.mn_FoodReInsertClick(Sender: TObject);
begin
  inherited;
  GetFoodConfig;
  fmFoodReInsert := TfmFoodReInsert.create(self);
  fmFoodReInsert.showmodal;
  fmFoodReInsert.free;
end;

function TfmMain.GetFoodConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  Result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    dmDBFoodEvent.StringListClear;

    stSql := 'select * from TB_FOODCODE ';
    stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
    with TempAdoQuery do
    begin
      Close;
      //Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;

      First;
      while Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        dmDBFoodEvent.FoodCodeAdd(FindField('FO_FOODCODE').AsString,FindField('FO_STARTTIME').AsString,FindField('FO_ENDTIME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  Result := True;
end;

end.
