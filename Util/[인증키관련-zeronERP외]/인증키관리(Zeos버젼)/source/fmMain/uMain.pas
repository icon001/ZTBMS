unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList, ComCtrls, ToolWin,DB,IniFiles,
  antTaskbarIcon, ExtCtrls, MSNPopUp, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer,IdSocketHandle, ADODB, uSubForm, CommandArray,Registry,DateUtils,
  IdTCPConnection, IdTCPClient, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, StdCtrls, OoMisc, AdPort, AdWnPort, IdUDPClient;

type
  TfmMain = class(TfmASubForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_Close: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    ToolBar1: TToolBar;
    btn_TotClose: TToolButton;
    btn_TotCancel: TToolButton;
    Menu_ImageList: TImageList;
    ActionList1: TActionList;
    Action_CompanyAdmin: TAction;
    Action_CustoumerKey: TAction;
    N2: TMenuItem;
    mn_pgtype: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Action_ManagerAdmin: TAction;
    ToolButton1: TToolButton;
    N11: TMenuItem;
    N12: TMenuItem;
    ToolButton2: TToolButton;
    Action_ConsultReport: TAction;
    StatusBar1: TStatusBar;
    N7: TMenuItem;
    N8: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    ToolButton3: TToolButton;
    Action_Consult: TAction;
    tbi: TantTaskbarIcon;
    ImageList1: TImageList;
    HideTimer: TTimer;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    Ver011: TMenuItem;
    MSNPopUp1: TMSNPopUp;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    CheckMemoTimer: TTimer;
    ToolButton4: TToolButton;
    Action_MemoSend: TAction;
    Action_Schedule: TAction;
    Image1: TImage;
    CheckAsListTimer: TTimer;
    N26: TMenuItem;
    N27: TMenuItem;
    N29: TMenuItem;
    N28: TMenuItem;
    ToolButton6: TToolButton;
    Action_ReceiveTelNum: TAction;
    N30: TMenuItem;
    N31: TMenuItem;
    AdoConnectCheckTimer1: TTimer;
    ToolButton7: TToolButton;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    ModemTimer: TTimer;
    N35: TMenuItem;
    DisConnectTimer: TTimer;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N36: TMenuItem;
    mn_CompanyGubun: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N52: TMenuItem;
    N53: TMenuItem;
    TempQuery: TZQuery;
    ToolButton5: TToolButton;
    N50: TMenuItem;
    N51: TMenuItem;
    Action_GoodASList: TAction;
    AS1: TMenuItem;
    ConnectCheckQuery: TZQuery;
    checkMemo: TZQuery;
    chkASList: TZQuery;
    N54: TMenuItem;
    WinsockPort1: TApdWinsockPort;
    ConnectCheckTimer1: TTimer;
    IdUDPServer1: TIdUDPServer;
    IdUDPClient1: TIdUDPClient;
    PacketClearTimer: TTimer;
    N55: TMenuItem;
    ToolButton8: TToolButton;
    N56: TMenuItem;
    N57: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    ToolButton9: TToolButton;
    N67: TMenuItem;
    N68: TMenuItem;
    N69: TMenuItem;
    N70: TMenuItem;
    N71: TMenuItem;
    N72: TMenuItem;
    N73: TMenuItem;
    procedure mn_CloseClick(Sender: TObject);
    procedure Action_CompanyAdminExecute(Sender: TObject);
    procedure Action_CustoumerKeyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mn_pgtypeClick(Sender: TObject);
    procedure mn_managerGubunClick(Sender: TObject);
    procedure Action_ManagerAdminExecute(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure Action_ConsultExecute(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure HideTimerTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItem2Click(Sender: TObject);
    procedure miShowClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure MSNPopUp1URLClick(Sender: TObject; URL: String);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N23Click(Sender: TObject);
    procedure Action_ConsultReportExecute(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure CheckMemoTimerTimer(Sender: TObject);
    procedure Action_MemoSendExecute(Sender: TObject);
    procedure Action_ScheduleExecute(Sender: TObject);
    procedure CheckAsListTimerTimer(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure Action_ReceiveTelNumExecute(Sender: TObject);
    procedure AdoConnectCheckTimer1Timer(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure ModemTimerTimer(Sender: TObject);
    procedure N35Click(Sender: TObject);
    procedure DisConnectTimerTimer(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure mn_CompanyGubunClick(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N53Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure Action_GoodASListExecute(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure WinsockPort1WsConnect(Sender: TObject);
    procedure WinsockPort1WsDisconnect(Sender: TObject);
    procedure WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
    procedure ConnectCheckTimer1Timer(Sender: TObject);
    procedure WinsockPort1TriggerAvail(CP: TObject; Count: Word);
    procedure PacketClearTimerTimer(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N59Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
  public
    FLogined: Boolean;
    FPrivileges: String;
    L_bClose : Boolean;
    L_stOldData : string;
    FServerConnected: Boolean;
    L_bApplicationTerminate : Boolean;
    DataPacketList : TStringList;
    { Private declarations }
    procedure SetLogined(const Value: Boolean);
    procedure SetPrivileges(const Value: String);
    Function CreateWindowStartRegKey(aRegName,aValue:string):Boolean;
    Function DeleteWindowStartRegKey(aRegName:string):Boolean;

    procedure ScheduleAlarmCheck(aDate,aSCHEDULEID,aFROMTIME,aTOTIME,aSUBJECT,
        aCONTENT,aALARMTYPE,aSTARTDAY,aSTARTTIME,aREPEATTIME,aALARMTIME:string);

    procedure ScheduleAlarmShow(aDate,aSCHEDULEID,aFROMTIME,aTOTIME,aSUBJECT,
                      aCONTENT, aALARMTYPE, aSTARTDAY, aSTARTTIME,
                      aREPEATTIME, aALARMTIME:string);
    Function UpdateTB_SCHEDULEAlarmCheck(aDate,aSCHEDULEID,aAlarmTime,aAlarmFinish:string):Boolean;
    procedure SetServerConnected(const Value: Boolean);
    procedure DBDisConnect(Sender: TObject);
  Public
    ModemSendDataList : TStringList;
  private
    ServerComBuff : string;

    procedure DataProcess(aRecvData:string);
    Function GetCustomerName(aTelNo:string;var aCompanyName,aDepartName:string):string;
    Function GetMasterName(aUserID:string):string;
    Function CheckNotConfirmMemo:Boolean;
    Function CheckASList : Boolean;
    Function CheckProductProcess : Boolean;
    Function AdoConnectCheck : Boolean;
    procedure LoadTB_Config;
  protected
{Detecting Windows Shutdown
To detect Windows Shutdown, you must trap WM_EndSession message. These steps should be taken: Declare a message handling
procedure in your Form's Private section: }
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
{Detecting Windows shutdown
When Windows is shutting down, it sends a WM_QueryEndSession to all open applications. To detect (and prevent shutdown), you must
define a message handler to this message. Put this definition on the private section of the main form:}
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;
    //procedure WndProc(var Message: TMessage); override;
    procedure WndProc(var Msg: TMessage); override;
  public
    { Public declarations }
    Procedure MDIChildShow(FormName:String);
    procedure ModemSendData(aData:string);
    procedure CustomerConsultingView(aTelNumber : string);
    
  Published
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;

    property ServerConnected : Boolean read FServerConnected write SetServerConnected;
  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;

  end;

var
  fmMain: TfmMain;
  G_stSendTelNum : string;


implementation
uses
  uDataModule,
  uLogin,
  uLomosUtil,
  uProgramType, uConsultCode, uQnaType, uAsGroupCode, uGoodsCode,
  uCompanyGubun, uCompanyCode, uJijumCode, uDepartCode, uTelGubunCode,
  uCotrolerType, uCotrolerRomType, uCardReaderType, uManagerAdminN,
  uSendMemo, uMemoSearch, uMemoSendSearch, uMasterID, uDeviceName,
  uDeviceModelCode, uDeviceType, uErrorList, uProcessTime, uErrorTarget,
  uDeviceFunctionGroup,uDeviceFunctionCode,
  uStartReg;
  
{$R *.dfm}

procedure TfmMain.mn_CloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.Action_CompanyAdminExecute(Sender: TObject);
begin
  MDIChildShow('TfmCompanyAdmin');
end;

procedure TfmMain.Action_CustoumerKeyExecute(Sender: TObject);
begin
  MDIChildShow('TfmCustomerKeyCreate');
end;

procedure TfmMain.FormShow(Sender: TObject);
var
  ini_fun : TiniFile;
  stPasswd : string;
begin
  if Not Logined then
  begin
    ini_fun := TiniFile.Create(ExeFolder + '\PGKEY.INI');
    if UpperCase(ini_fun.ReadString('CONFIG','AUTOSTART','FALSE')) = 'TRUE' then
    begin
      Master_ID := ini_fun.ReadString('CONFIG','USERID','');
      stPasswd := ini_fun.ReadString('CONFIG','USERPW','');
      if TLogin.GetObject.LoginUser(Master_ID,stPasswd) then
      begin
         Master_ID := TLogin.GetObject.UserID;
         Master_Name := TLogin.GetObject.UserName;
         Master_CompanyCode := TLogin.GetObject.MasterCompanyCode;
         Logined := TLogin.GetObject.Logined;
      end else
      begin
         TLogin.GetObject.ShowLoginDlg;
         Master_ID := TLogin.GetObject.UserID;
         Master_Name := TLogin.GetObject.UserName;
         Master_CompanyCode := TLogin.GetObject.MasterCompanyCode;
         Logined := TLogin.GetObject.Logined;
      end;
    end else
    begin
     TLogin.GetObject.ShowLoginDlg;
     Master_ID := TLogin.GetObject.UserID;
     Master_Name := TLogin.GetObject.UserName;
     Master_CompanyCode := TLogin.GetObject.MasterCompanyCode;
     Logined := TLogin.GetObject.Logined;
    end;
    ini_fun.Free;
    if Not Logined then
    begin
      Application.Terminate;
      Exit;
    end;

    tbi.Visible := True;
    tbi.Hint := '고객관리프로그램';
    HideTimer.Enabled := True;

    IdUDPServer1.Active := False;
    IdUDPServer1.DefaultPort := 12345;
    IdUDPServer1.Active := True;


    if CheckNotConfirmMemo Then
    begin
      MSNPopUp1.Title := '[메모]';
      MSNPopUp1.Text := '확인하지 않은 메모가 있습니다.';
      MSNPopUp1.ShowPopUp;
    end;
    if CheckASList Then
    begin
      MSNPopUp1.Title := '[AS처리]';
      MSNPopUp1.Text := 'AS처리할 내역이 존재 합니다.';
      MSNPopUp1.ShowPopUp;
    end;
  end;
  ModemTimer.Enabled := True;
  

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

procedure TfmMain.mn_pgtypeClick(Sender: TObject);
begin
  fmProgramType:= TfmProgramType.Create(Self);
  fmProgramType.SHowmodal;
  fmProgramType.Free;

end;

procedure TfmMain.mn_managerGubunClick(Sender: TObject);
begin
{  fmManagerGubun:= TfmManagerGubun.Create(Self);
  fmManagerGubun.SHowmodal;
  fmManagerGubun.Free;
}
end;

procedure TfmMain.Action_ManagerAdminExecute(Sender: TObject);
begin
  MDIChildShow('TfmManagerAdmin');
end;

procedure TfmMain.N13Click(Sender: TObject);
begin
  fmQnaCode:= TfmQnaCode.Create(Self);
  fmQnaCode.SHowmodal;
  fmQnaCode.Free;
end;

procedure TfmMain.N21Click(Sender: TObject);
begin
  fmConsultCode:= TfmConsultCode.Create(Self);
  fmConsultCode.SHowmodal;
  fmConsultCode.Free;

end;

procedure TfmMain.Action_ConsultExecute(Sender: TObject);
begin
  CustomerConsultingView('');
end;

procedure TfmMain.N18Click(Sender: TObject);
begin
   TLogin.GetObject.ShowLoginDlg;
   Master_ID := TLogin.GetObject.UserID;
   Master_Name := TLogin.GetObject.UserName;
   Logined := TLogin.GetObject.Logined;
end;

procedure TfmMain.SetLogined(const Value: Boolean);
begin
  FLogined := Value;
  N2.Enabled := Value;
  N3.Enabled := Value;
  N11.Enabled := Value;
  N14.Enabled := Value;
  N32.Enabled := Value;
  N38.Enabled := Value;
  N50.Enabled := Value;
  ToolBar1.Enabled := Value;
  N18.Enabled := Not Value;
  N19.Enabled := Value;
  btn_TotClose.Visible := True;
  ToolButton1.Visible := True;
  btn_TotCancel.Visible := True;
  ToolButton3.Visible := True;
  ToolButton4.Visible := True;
  ToolButton2.Visible := True;
  ToolButton6.Visible := True;
  ToolButton7.Visible := True;
  ToolButton5.Visible := True;
  ToolButton8.Visible := True;
  if Master_CompanyCode <> '00001' then
  begin
    btn_TotClose.Visible := False;
    ToolButton1.Visible := False;
    btn_TotCancel.Visible := False;
    ToolButton3.Visible := False;
    ToolButton4.Visible := False;
    ToolButton2.Visible := False;
    ToolButton6.Visible := False;
    ToolButton7.Visible := False;
    ToolButton5.Visible := False;
    ToolButton8.Visible := False;
    N2.Enabled := False;
    N3.Enabled := False;
    N11.Enabled := False;
    N19.Enabled := False;
    N32.Enabled := False;
    N38.Enabled := False;
    N50.Enabled := False;
  end;

  if Master_CompanyCode = '00031' then
  begin
    ToolButton8.Visible := True;
  end;
  
end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  LogoFile : string;
begin
  wmTaskbar := RegisterWindowMessage('TaskbarCreated');

  ExeFolder  := ExtractFileDir(Application.ExeName);

  L_bClose := False;
  Logined := False;
  dmDB.ZConnection1.AfterDisconnect := DBDisConnect;
//  if Not dmDB.DBConnect('zeron.co.kr','3306','zerp','zeron','zeronpass') then
  if Not dmDB.DBConnect('zeron.co.kr','3307','zerp','zeron','zeronpass') then
  begin
    showmessage('인증키를 관리하려면 인터넷망에 접속되어야 합니다.');
    Application.Terminate;
  end;

  ReceiveTelNumber := '';
  DeleteWindowStartRegKey('ZTBMSADMIN');
{  DeleteWindowStartRegKey('ZERONADMIN');
  CreateWindowStartRegKey('ZERONADMIN',Application.ExeName);
}
  LogoFile := ExeFolder + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  ModemSendDataList := TStringList.Create;
  ModemSendDataList.Clear;
  DataPacketList := TStringList.Create;

  AdoConnectCheckTimer1.Enabled := True;
  CheckAsListTimer.Enabled := True;
  LoadTB_Config;
  //ConnectCheckTimer1.Enabled := True;
end;

procedure TfmMain.N19Click(Sender: TObject);
begin
  Logined := False;
end;

procedure TfmMain.HideTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  Visible:=False;
  HideTimer.Enabled:=False;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  L_bApplicationTerminate := True;
  ModemSendDataList.Clear;
  DataPacketList.Clear;
  ModemSendDataList.Free;
  DataPacketList.Free;
  tbi.Free;
  IdUDPServer1.Active := False;
end;

procedure TfmMain.MenuItem2Click(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  SetForegroundWindow(Application.Handle);
  Visible := True;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
   SetForegroundWindow(Application.Handle);
   Visible := True;
end;

procedure TfmMain.MSNPopUp1URLClick(Sender: TObject; URL: String);
begin
  SetForegroundWindow(Application.Handle);
  if MSNPopUp1.Title = '[메모]' then
  begin
    fmMemoSearch:= TfmMemoSearch.Create(Self);
    fmMemoSearch.SHow;
  end else if MSNPopUp1.Title = '[AS처리]' then
  begin
    Visible := True;
    MDIChildShow('TfmGOODSASList');
    self.FindClassForm('TfmGOODSASList').FindCommand('AS').Execute;
  end else if MSNPopUp1.Title = '[생산처리]' then
  begin
    Visible := True;
    MDIChildShow('TfmProductList');
  end else
  begin
    Visible := True;
    CustomerConsultingView(ReceiveTelNumber);
  end;
end;

procedure TfmMain.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
  stData : string;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
    //G_stServerIP := ABinding.PeerIP;
  finally
    DataStringStream.Free;
  end;
  ServerComBuff:= ServerComBuff + RecvData ;
  if pos(#$3,ServerComBuff) > 0 then
  begin
    if L_bApplicationTerminate then Exit;
    stData:= Copy(ServerComBuff,1,Pos(#$3,ServerComBuff));
    ServerComBuff := '';
    //if L_stOldData = aData then Exit;
    L_stOldData := stData;
    DataProcess(stData);
  end;
  PacketClearTimer.Enabled := True;
//  if L_stOldData = RecvData then Exit;
//  L_stOldData := RecvData;
//  DataProcess(RecvData);
end;

procedure TfmMain.DataProcess(aRecvData: string);
var
  stSql : string;
  TempList : TStringList;
  nPos : integer;
  i : integer;
  stTelNo :string;
  stUserID : string;
  stCustomerName : string;
  stCompanyName : string;
  stDepartName : string;
begin
  if DataPacketList.IndexOf(aRecvData) > -1 then Exit;
  DataPacketList.Add(aRecvData);
  TempList := TStringList.Create;
  TempList.Delimiter := ',';
  TempList.DelimitedText := aRecvData;
  stTelNo := '';
  stUserID := '';
  if Pos('MEMO',aRecvData) > 0 then  //전송된 메모
  begin
    For i:=0 to TempList.Count - 1 do
    begin
      if Pos('USERID',TempList.Strings[i]) > 0 then  //USERID
      begin
        nPos := Pos('=',TempList.Strings[i]);
        if nPos > 0 then
          stUserID := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
      end else if Pos('SENDID',TempList.Strings[i]) > 0 then  //SENDID;
      begin
        nPos := Pos('=',TempList.Strings[i]);
        if nPos > 0 then
          stTelNo := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
      end;
    end;
    if Master_ID <> stUserID then Exit;
    MSNPopUp1.Title := '[메모]';
    stCustomerName := GetMasterName(stTelNo);
    MSNPopUp1.Text := stTelNo + #10#13 + '[' + stCustomerName + ']' + '님' + #10#13 + '으로 부터 메모가 왔습니다.';
  end else if Pos('SEND',aRecvData) > 0 then  //전송된 메시지
  begin
    For i:=0 to TempList.Count - 1 do
    begin
      if Pos('USERID',TempList.Strings[i]) > 0 then  //USERID
      begin
        nPos := Pos('=',TempList.Strings[i]);
        if nPos > 0 then
          stUserID := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
      end else if Pos('TELNUM',TempList.Strings[i]) > 0 then  //TELNUM;
      begin
        nPos := Pos('=',TempList.Strings[i]);
        if nPos > 0 then
          stTelNo := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
      end;
    end;
    if Master_ID <> stUserID then Exit;
    MSNPopUp1.Title := '[전송]';
    stCustomerName := GetCustomerName(stTelNo,stCompanyName,stDepartName);
    MSNPopUp1.Text := stTelNo + #10#13
                      + '[' + stCompanyName + ']' + #10#13
                      + '[' + stDepartName + ']' + #10#13
                      + '[' + stCustomerName + ']' ; //+ '님' + #10#13 + '으로 부터 전화가 왔습니다.';
  end else
  begin
    For i:=0 to TempList.Count - 1 do
    begin
      if Pos('NMBR',TempList.Strings[i]) > 0 then
      begin
        nPos := Pos('=',TempList.Strings[i]);
        if nPos > 0 then
          stTelNo := Trim(copy(TempList.Strings[i],nPos + 1,Length(TempList.Strings[i]) - nPos));
      end;
    end;
    if stTelNo = '' then Exit;
    MSNPopUp1.Title := '[전화]';
    stCustomerName := GetCustomerName(stTelNo,stCompanyName,stDepartName);
    MSNPopUp1.Text := stTelNo + #10#13
                      + '[' + stCompanyName + ']' + #10#13
                      + '[' + stDepartName + ']' + #10#13
                      + '[' + stCustomerName + ']' ; //+ '님' + #10#13 + '으로 부터 전화가 왔습니다.';
  end;


  ReceiveTelNumber := stTelNo;
  MSNPopUp1.ClosePopUps;

  MSNPopUp1.ShowPopUp;
end;

function TfmMain.GetCustomerName(aTelNo: string;var aCompanyName,aDepartName:string): string;
var
  stSql : string;
begin
  aCompanyName := '';
  aDepartName := '';
  result := '';
  stSql := ' select b.PE_NAME,c.CO_NAME,d.CO_JIJUMNAME from ';
  stSql := stSql + ' (select aa.* from TB_TELNUM aa ';
  stSql := stSql + ' Inner Join (select TE_TELNUMBER,MAX(TE_VIEWSEQ) as TE_VIEWSEQ ';
  stSql := stSql + ' From TB_TELNUM Group by TE_TELNUMBER ) bb ';
  stSql := stSql + ' ON (aa.TE_TELNUMBER = bb.TE_TELNUMBER ';
  stSql := stSql + ' AND aa.TE_VIEWSEQ = bb.TE_VIEWSEQ ) ';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Left Join TB_PERSON b ';
  stSql := stSql + ' ON(a.PE_CODE = b.PE_CODE) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stsql := stSql + ' ON(b.CO_COMPANYCODE = c.CO_COMPANYCODE) ';
  stSql := stSql + ' Left Join TB_JIJUM d ';
  stsql := stSql + ' ON(b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stsql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE) ';
  stSql := stSql + ' Where a.TE_TELNUMBER = ''' + aTelNo + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('PE_NAME').AsString;
    aCompanyName := FindField('CO_NAME').AsString;
    aDepartName := FindField('CO_JIJUMNAME').AsString;
  end;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    Exit;
  End;  

end;

function TfmMain.CreateWindowStartRegKey(aRegName,
  aValue: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   //if Not FReg.OpenKey('SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run',True) then
   //begin
      FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
      FReg.WriteString(aRegName, aValue);
   //end else
   //begin
   //   FReg.WriteString(aRegName, aValue);
   //end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

procedure TfmMain.N23Click(Sender: TObject);
var
  stExec:string;
begin
  IdUDPServer1.Active := False;
  tbi.Visible := False;
  stExec := ExtractFileDir(Application.ExeName) + '\SmartUpdate.exe';
  //showmessage(stExec);
  Delay(1000);
  My_RunDosCommand(stExec,False,False);
  Close;
end;

procedure TfmMain.Action_ConsultReportExecute(Sender: TObject);
begin
  MDIChildShow('TfmConsultReport');
end;

procedure TfmMain.WMEndSession(var Msg: TWMEndSession);
begin
  if Msg.EndSession = True then
  begin
//
  end;

end;

procedure TfmMain.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
//  if MessageDlg('Close Windows ?', mtConfirmation, [mbYes,mbNo], 0) = mrNo then
//    Msg.Result := 0
//  else
    L_bClose := True;
    Close;
    Delay(1000);
    Msg.Result := 1;

end;

procedure TfmMain.WndProc(var Msg: TMessage);
begin
  inherited;
    if Msg.WParam = SC_MINIMIZE then
    begin
      Close;
    end;
end;

function TfmMain.GetMasterName(aUserID: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := ' select * from TB_AUTHADMIN ';
  stsql := stSql + ' Where AD_USERID = ''' + aUserID + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := FindField('AD_USERNAME').AsString;
  end;

end;

procedure TfmMain.N25Click(Sender: TObject);
begin
  fmMemoSearch:= TfmMemoSearch.Create(Self);
  fmMemoSearch.SHow;    
end;

function TfmMain.CheckNotConfirmMemo: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_USERMEMO ';
  stSql := stSql + ' Where UM_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND UM_CONFIRM = ''N'' ';
  With checkMemo do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmMain.CheckMemoTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  CheckMemoTimer.Interval := 60000;
    if CheckNotConfirmMemo Then
    begin
      MSNPopUp1.Title := '[메모]';
      MSNPopUp1.Text := '확인하지 않은 메모가 있습니다.';
      MSNPopUp1.ShowPopUp;
    end;
end;

procedure TfmMain.Action_MemoSendExecute(Sender: TObject);
begin
  fmSendMemo:= TfmSendMemo.Create(Self);
  fmSendMemo.SHow; 
end;

procedure TfmMain.Action_ScheduleExecute(Sender: TObject);
begin
{  fmSchedule:= TfmSchedule.Create(Self);
  fmSchedule.SHow; }

end;
//스케줄 체크하여 알람시간 도달시 알람 발생하자.
procedure TfmMain.CheckAsListTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  CheckAsListTimer.Interval := 60000;
  if CheckASList Then
  begin
    MSNPopUp1.Title := '[AS처리]';
    MSNPopUp1.Text := 'AS처리할 내역이 존재 합니다.';
    MSNPopUp1.ShowPopUp;
  end;
  if CheckProductProcess then
  begin
    MSNPopUp1.Title := '[생산처리]';
    MSNPopUp1.Text := '생산관리처리할 내역이 존재 합니다.';
    MSNPopUp1.ShowPopUp;
  end;
end;

procedure TfmMain.ScheduleAlarmCheck(aDate, aSCHEDULEID, aFROMTIME,
  aTOTIME, aSUBJECT, aCONTENT, aALARMTYPE, aSTARTDAY, aSTARTTIME,
  aREPEATTIME, aALARMTIME: string);
var
  alarmDate : TDateTime;
  alarmStartDate : TDateTime;
  alarmShowTime : TDateTime;
  i : integer;
begin
  alarmDate := EncodeDateTime(strtoint(copy(aDate,1,4)),strtoint(copy(aDate,5,2)),strtoint(copy(aDate,7,2)),
                              strtoint(copy(aFROMTIME,1,2)),strtoint(copy(aFROMTIME,3,2)),strtoint(copy(aFROMTIME,5,2)),00);

  if Now > alarmDate then Exit;  //알람 발생일 보다 더 늦게 컴퓨터를 켰다.

  alarmStartDate := alarmDate  - strtoint(aSTARTDAY);
  alarmStartDate := ( alarmStartDate * 24.0 * 60.0 ) - ( strtoint(aSTARTTIME) * 60); //알람 시작 시간전
  alarmStartDate := alarmStartDate / (24.0 * 60.0);

  if alarmStartDate > now then Exit;  //알람 발생시작 시간이 현재보다 크면 빠져나감

  if aALARMTYPE = '0' then //한번 알람
  begin
    ScheduleAlarmShow(aDate,aSCHEDULEID,aFROMTIME,aTOTIME,aSUBJECT,
                      aCONTENT, aALARMTYPE, aSTARTDAY, aSTARTTIME,
                      aREPEATTIME, aALARMTIME);
    UpdateTB_SCHEDULEAlarmCheck(aDate,aSCHEDULEID,FormatDateTime('yyyymmddhhnnss',now),'Y');
  end else  //반복알람
  begin
    if Trim(aALARMTIME) <> '' then
    begin
      alarmShowTime := EncodeDateTime(strtoint(copy(aALARMTIME,1,4)),strtoint(copy(aALARMTIME,5,2)),strtoint(copy(aALARMTIME,7,2)),
                              strtoint(copy(aALARMTIME,9,2)),strtoint(copy(aALARMTIME,11,2)),strtoint(copy(aALARMTIME,13,2)),00); //최종 알람 발생 시간
      i := 1;
      while alarmStartDate < alarmDate do   //알람발생시간이 알람시간보다 작을때까지 계속 돌자.
      begin
        if alarmStartDate < alarmShowTime then    //알람 발생 시간이 최종 알람 시간 보다 작은 경우 다음 알람 발생 시간을 찾는다.
        begin
          alarmStartDate := ( alarmStartDate * 24.0 * 60.0 ) + ( i * strtoint(aREPEATTIME) * 60); //다음 알람 발생 시작 시간
          alarmStartDate := alarmStartDate / (24.0 * 60.0);
          if alarmStartDate > alarmDate then  //다음 구간이 알람사간 보다 크면 알람 발생을 중단한다.
          begin
            UpdateTB_SCHEDULEAlarmCheck(aDate,aSCHEDULEID,'','Y');
            Exit;
          end;
        end else //알람 발생 시간이 최종 알람 시간보다 큰경우 알람 발생 시간이 현재 보다 큰지 확인한다.
        begin
          if alarmStartDate > now then Exit; //알람 발생 시간이 아직 안되었다.
          break;
        end;
        inc(i);
      end;
    end;
    ScheduleAlarmShow(aDate,aSCHEDULEID,aFROMTIME,aTOTIME,aSUBJECT,
                      aCONTENT, aALARMTYPE, aSTARTDAY, aSTARTTIME,
                      aREPEATTIME, aALARMTIME);
    UpdateTB_SCHEDULEAlarmCheck(aDate,aSCHEDULEID,FormatDateTime('yyyymmddhhnnss',now),'N');
  end;
end;

procedure TfmMain.ScheduleAlarmShow(aDate, aSCHEDULEID, aFROMTIME, aTOTIME,
  aSUBJECT, aCONTENT, aALARMTYPE, aSTARTDAY, aSTARTTIME, aREPEATTIME,
  aALARMTIME: string);
begin
{  MSNPopUp1.Title := '[예약스케줄]';
  MSNPopUp1.Text := '스케줄 알람이 발생하였습니다.';
  MSNPopUp1.ShowPopUp;   }
{  fmScheduleAlarm:= TfmScheduleAlarm.Create(Self);
  fmScheduleAlarm.dt_Date.Date := EncodeDate(strtoint(copy(aDate,1,4)),strtoint(copy(aDate,5,2)),strtoint(copy(aDate,7,2)));
  fmScheduleAlarm.dt_StartTime.DateTime := EncodeDateTime(2000,01,01,strtoint(copy(aFROMTIME,1,2)),strtoint(copy(aFROMTIME,3,2)),strtoint(copy(aFROMTIME,5,2)),00 );
  fmScheduleAlarm.dt_EndTime.DateTime := EncodeDateTime(2000,01,01,strtoint(copy(aTOTIME,1,2)),strtoint(copy(aTOTIME,3,2)),strtoint(copy(aTOTIME,5,2)),00 );
  fmScheduleAlarm.ed_SCSubject.Text := aSUBJECT;
  fmScheduleAlarm.mem_Memo.Text := aCONTENT;
  fmScheduleAlarm.SHow;
}
end;

function TfmMain.UpdateTB_SCHEDULEAlarmCheck(aDate, aSCHEDULEID,
  aAlarmTime, aAlarmFinish: string): Boolean;
var
  stsql : string;
begin
{  stSql := ' Update TB_SCHEDULE set ';
  if Trim(aAlarmTime) <> '' then  stSql := stSql + 'SD_ALARMTIME = ''' + aAlarmTime + ''',';
  stSql := stSql + ' SD_ALARMFINISH = ''' + aAlarmFinish + ''' ';
  stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''' ';
  stSql := stsql + ' AND SD_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND SD_SCHEDULEID = ' + aSCHEDULEID ;

  result := DataModule1.ProcessExecSQL(stSql);   }
end;

procedure TfmMain.N28Click(Sender: TObject);
begin
  fmMemoSendSearch:= TfmMemoSendSearch.Create(Self);
  fmMemoSendSearch.SHow;

end;

procedure TfmMain.Action_ReceiveTelNumExecute(Sender: TObject);
begin
  MDIChildShow('TfmReceiveTelNum');
end;

function TfmMain.DeleteWindowStartRegKey(aRegName: string): Boolean;
var
  FReg : TRegistry;
begin
  FReg := TRegistry.Create;
 try
   FReg.RootKey := HKEY_LOCAL_MACHINE;
   if Not FReg.OpenKey('SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Run',True) then
   begin
    FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
    FReg.DeleteValue(aRegName);
   end else
   begin
    FReg.DeleteValue(aRegName);
    FReg.CloseKey;
    FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
    FReg.DeleteValue(aRegName);
   end;
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

procedure TfmMain.AdoConnectCheckTimer1Timer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  if AdoConnectCheck then Exit;
  AdoConnectCheckTimer1.Enabled := False;
  dmDB.DBConnect('zeron.able.or.kr','3306','zerp','zeron','zeronpass');
  AdoConnectCheckTimer1.Enabled := True; 
end;

function TfmMain.AdoConnectCheck: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_MASTER ';
  With ConnectCheckQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmMain.ToolButton7Click(Sender: TObject);
begin
  MDIChildShow('TfmGOODSCATALOG');
end;

procedure TfmMain.N33Click(Sender: TObject);
begin
  MDIChildShow('TfmGOODSCATALOG');
end;

procedure TfmMain.N34Click(Sender: TObject);
var
  stSendData : string;
begin
  Try
    N34.Enabled := False;

    stSendData := 'MODEMSEND' + DATADELIMITER + '' + DATADELIMITER;
    ModemSendData(stSendData);
  Finally
    N34.Enabled := True;
  End;
end;

procedure TfmMain.ModemSendData(aData: string);
begin
  ModemSendDataList.Add(aData);
end;

procedure TfmMain.ModemTimerTimer(Sender: TObject);
var
  stSendData:string;
begin
  if L_bApplicationTerminate then Exit;
  ModemTimer.Enabled := False;
  Try
    {if Not WinsockPort1.Open then
    begin
      if G_stServerIP = '' then G_stServerIP := '192.168.0.90';
      if Not isDigit(G_stServerPort) then G_stServerPort := '4981';
      WinsockPort1.WsAddress := G_stServerIP;
      WinsockPort1.WsPort := G_stServerPort;
      WinsockPort1.Open := True;
      Exit;
    end; }
    if ModemSendDataList.Count < 1 then Exit;

    stSendData := ModemSendDataList.Strings[0] + LINEEND;
    ModemSendDataList.Delete(0);

    IdUDPClient1.Broadcast(stSendData ,23456);
    //WinsockPort1.PutString(stSendData);
  Finally
    ModemTimer.Enabled := Not L_bApplicationTerminate;
  End;

end;

procedure TfmMain.N35Click(Sender: TObject);
begin
  fmGoodsCode:= TfmGoodsCode.Create(Self);
  fmGoodsCode.SHowmodal;
  fmGoodsCode.Free;

end;

procedure TfmMain.DisConnectTimerTimer(Sender: TObject);
var
  stSendData : string;
begin
  if L_bApplicationTerminate then Exit;
    DisConnectTimer.Enabled := False;
    stSendData := 'MODEMSEND' + DATADELIMITER + '' + DATADELIMITER;
    ModemSendData(stSendData);

end;

procedure TfmMain.N37Click(Sender: TObject);
var
  stSendData : string;
begin
  MDIChildShow('TfmReSendTelNum');
{  if Not IsDigit(G_stSendTelNum) then Exit;
  stSendData := 'MODEMSEND' + DATADELIMITER + 'ATDT' + G_stSendTelNum + DATADELIMITER;
  ModemSendData(stSendData);
  DisConnectTimer.Enabled := True;  }
end;

procedure TfmMain.N39Click(Sender: TObject);
begin
  fmASGroupCode:= TfmASGroupCode.Create(Self);
  fmASGroupCode.SHowmodal;
  fmASGroupCode.Free;
end;

procedure TfmMain.mn_CompanyGubunClick(Sender: TObject);
begin
  fmCompanyGubun:= TfmCompanyGubun.Create(Self);
  fmCompanyGubun.SHowmodal;
  fmCompanyGubun.Free;

end;

procedure TfmMain.N43Click(Sender: TObject);
begin
  fmCompanyCode:= TfmCompanyCode.Create(Self);
  fmCompanyCode.SHowmodal;
  fmCompanyCode.Free;

end;

procedure TfmMain.N44Click(Sender: TObject);
begin
  fmJijumCode:= TfmJijumCode.Create(Self);
  fmJijumCode.SHowmodal;
  fmJijumCode.Free; 
end;

procedure TfmMain.N45Click(Sender: TObject);
begin
  fmDepartCode:= TfmDepartCode.Create(Self);
  fmDepartCode.SHowmodal;
  fmDepartCode.Free;  
end;

procedure TfmMain.N53Click(Sender: TObject);
begin
  fmTelGubunCode:= TfmTelGubunCode.Create(Self);
  fmTelGubunCode.SHowmodal;
  fmTelGubunCode.Free;
end;

procedure TfmMain.N47Click(Sender: TObject);
begin
  fmControlerType:= TfmControlerType.Create(Self);
  fmControlerType.SHowmodal;
  fmControlerType.Free;

end;

procedure TfmMain.N48Click(Sender: TObject);
begin
  fmControlerRomType:= TfmControlerRomType.Create(Self);
  fmControlerRomType.SHowmodal;
  fmControlerRomType.Free;

end;

procedure TfmMain.N49Click(Sender: TObject);
begin
  fmCardReaderType:= TfmCardReaderType.Create(Self);
  fmCardReaderType.SHowmodal;
  fmCardReaderType.Free;

end;

procedure TfmMain.N51Click(Sender: TObject);
begin
  fmMasterID:= TfmMasterID.Create(Self);
  fmMasterID.SHowmodal;
  fmMasterID.Free;

end;

procedure TfmMain.CustomerConsultingView(aTelNumber: string);
begin
  MDIChildShow('TfmCustomerConsulting');
  if aTelNumber <> '' then
  begin
    self.FindClassForm('TfmCustomerConsulting').FindCommand('REFRESH').Params.Values['TELNUM'] := aTelNumber;
    self.FindClassForm('TfmCustomerConsulting').FindCommand('REFRESH').Execute;
  end;

end;

procedure TfmMain.Action_GoodASListExecute(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmGOODSASList');

end;

function TfmMain.CheckASList: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql:= 'Select * from TB_ASLIST ';
  stSql := stSql + ' where AL_NEXTID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND AL_CONFIRM <> ''Y'' ';
  stSql := stSql + ' AND AL_STATE <> ''9'' ';

  with chkASList do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    result := True;
  end;
end;

procedure TfmMain.N54Click(Sender: TObject);
begin
  inherited;
  N23Click(self);
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
      tbi.Hint := '고객관리프로그램';
    end;
  end;//with

end;

procedure TfmMain.SetServerConnected(const Value: Boolean);
begin
  if FServerConnected = Value then Exit;
  FServerConnected := Value;
end;

procedure TfmMain.WinsockPort1WsConnect(Sender: TObject);
begin
  inherited;
  ServerConnected := True;
end;

procedure TfmMain.WinsockPort1WsDisconnect(Sender: TObject);
begin
  inherited;
  ServerConnected := False;

end;

procedure TfmMain.WinsockPort1WsError(Sender: TObject; ErrCode: Integer);
begin
  inherited;
  ServerConnected := False;
  ErrCode := 0;
end;

procedure TfmMain.ConnectCheckTimer1Timer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  if ServerConnected then Exit;
{  WinsockPort1.Open := False;
  if G_stServerIP = '' then G_stServerIP := '192.168.0.90';
  if Not isDigit(G_stServerPort) then G_stServerPort := '4981';
  WinsockPort1.WsAddress := G_stServerIP;
  WinsockPort1.WsPort := G_stServerPort;
  WinsockPort1.Open := True;   }
end;

procedure TfmMain.LoadTB_Config;
var
  stSql : string;
begin
  G_stServerPort := '4981';
  G_stServerIP := '192.168.0.90';
  stSql := 'Select * From TB_CONFIG ';

  with dmDB.ZTempQuery do
  begin
    close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      if FindField('CO_CODE').AsString = 'SERVERPORT' then
      begin
        G_stServerPort := FindField('CO_VALUE').AsString;
      end else if FindField('CO_CODE').AsString = 'SERVERIP' then
      begin
        G_stServerIP := FindField('CO_VALUE').AsString;
      end;
      Next;
    end;
  end;
  if Not IsDigit(G_stServerPort) then G_stServerPort := '4981';
end;

procedure TfmMain.WinsockPort1TriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  aData:String;
  nIndex : integer;
  stTemp : string;
begin
  st:= '';
  ServerConnected := True;
  Try
    for I := 1 to Count do st := st + WinsockPort1.GetChar;
  Except
    Exit;
  End;
  ServerComBuff:= ServerComBuff + st ;
  if pos(#$3,ServerComBuff) > 0 then
  begin
    if L_bApplicationTerminate then Exit;
    aData:= Copy(ServerComBuff,1,Pos(#$3,ServerComBuff));
    ServerComBuff := '';
    //if L_stOldData = aData then Exit;
    L_stOldData := aData;
    DataProcess(aData);
  end;

end;

procedure TfmMain.PacketClearTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  DataPacketList.Clear;
  PacketClearTimer.Enabled := False;
end;

procedure TfmMain.DBDisConnect(Sender: TObject);
begin
end;

procedure TfmMain.ToolButton8Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmProductList');
end;

procedure TfmMain.N55Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmProductList');

end;

function TfmMain.CheckProductProcess: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql:= 'Select * from TB_PRODUCTLIST ';
  stSql := stSql + ' where PL_REQUEST = ''1'' ';
  stSql := stSql + ' OR PL_ACTION = ''1'' ';

  with chkASList do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    while Not Eof do
    begin
      if Master_ProductAccept = 1 then
      begin
        if FindField('PL_GUBUN').AsString = '1' then
        begin
          if FindField('PL_REQUEST').AsString = '1' then result := True;
        end;
      end else if Master_ProductAccept = 2 then
      begin
        if FindField('PL_GUBUN').AsString = '1' then
        begin
          if FindField('PL_ACTION').AsString = '1' then result := True;
        end;
      end;
      if Master_DeliveryAccept = 1 then
      begin
        if FindField('PL_GUBUN').AsString = '2' then
        begin
          if FindField('PL_REQUEST').AsString = '1' then result := True;
        end;
      end else if Master_DeliveryAccept = 2 then
      begin
        if FindField('PL_GUBUN').AsString = '2' then
        begin
          if FindField('PL_ACTION').AsString = '1' then result := True;
        end;
      end;
      Next;
    end;
  end;
end;

procedure TfmMain.N56Click(Sender: TObject);
begin
  inherited;
  fmDeviceName:= TfmDeviceName.Create(Self);
  fmDeviceName.SHowmodal;
  fmDeviceName.Free;

end;

procedure TfmMain.N57Click(Sender: TObject);
begin
  inherited;
  fmDeviceModelCode:= TfmDeviceModelCode.Create(Self);
  fmDeviceModelCode.SHowmodal;
  fmDeviceModelCode.Free;

end;

procedure TfmMain.N58Click(Sender: TObject);
begin
  inherited;
  fmDeviceType:= TfmDeviceType.Create(Self);
  fmDeviceType.SHowmodal;
  fmDeviceType.Free;

end;

procedure TfmMain.N59Click(Sender: TObject);
begin
  inherited;
  fmErrorList:= TfmErrorList.Create(Self);
  fmErrorList.SHowmodal;
  fmErrorList.Free;

end;

procedure TfmMain.N60Click(Sender: TObject);
begin
  inherited;
  fmProcessTime:= TfmProcessTime.Create(Self);
  fmProcessTime.SHowmodal;
  fmProcessTime.Free;

end;

procedure TfmMain.N61Click(Sender: TObject);
begin
  inherited;
  fmErrorTarget:= TfmErrorTarget.Create(Self);
  fmErrorTarget.SHowmodal;
  fmErrorTarget.Free;

end;

procedure TfmMain.N66Click(Sender: TObject);
begin
  inherited;
  DeleteWindowStartRegKey('ZeronClientServer');
end;

procedure TfmMain.N65Click(Sender: TObject);
begin
  inherited;
  CreateWindowStartRegKey('ZeronClientServer',Application.ExeName);
end;

procedure TfmMain.ToolButton9Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmSMSReceiveReport');

end;

procedure TfmMain.N68Click(Sender: TObject);
begin
  inherited;
  fmDeviceFunctionGroup:= TfmDeviceFunctionGroup.Create(Self);
  fmDeviceFunctionGroup.SHowmodal;
  fmDeviceFunctionGroup.Free;

end;

procedure TfmMain.N69Click(Sender: TObject);
begin
  inherited;
  fmDeviceFunctionCode:= TfmDeviceFunctionCode.Create(Self);
  fmDeviceFunctionCode.SHowmodal;
  fmDeviceFunctionCode.Free;

end;

procedure TfmMain.N71Click(Sender: TObject);
begin
  inherited;
  MDIChildShow('TfmControlerInfomation');

end;

procedure TfmMain.N72Click(Sender: TObject);
begin
  inherited;
  fmStartReg := TfmStartReg.Create(self);
  fmStartReg.ShowModal;
  fmStartReg.Free;
end;

end.
