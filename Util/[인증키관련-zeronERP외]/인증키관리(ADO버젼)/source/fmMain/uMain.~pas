unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, ImgList, ComCtrls, ToolWin,DB,IniFiles,
  antTaskbarIcon, ExtCtrls, MSNPopUp, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPServer,IdSocketHandle, ADODB, uSubForm, CommandArray,Registry,DateUtils,
  IdTCPConnection, IdTCPClient;

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
    mn_managerGubun: TMenuItem;
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
    IdUDPServer1: TIdUDPServer;
    TempQuery: TADOQuery;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    CheckMemoTimer: TTimer;
    ToolButton4: TToolButton;
    Action_MemoSend: TAction;
    ToolButton5: TToolButton;
    Action_Schedule: TAction;
    Image1: TImage;
    CheckScheduleTimer: TTimer;
    checkSchedule: TADOQuery;
    checkMemo: TADOQuery;
    N26: TMenuItem;
    N27: TMenuItem;
    N29: TMenuItem;
    N28: TMenuItem;
    ToolButton6: TToolButton;
    Action_ReceiveTelNum: TAction;
    N30: TMenuItem;
    N31: TMenuItem;
    AdoConnectCheckTimer1: TTimer;
    ADOCheckQuery1: TADOQuery;
    ToolButton7: TToolButton;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    IdTCPClient1: TIdTCPClient;
    ModemTimer: TTimer;
    N35: TMenuItem;
    N36: TMenuItem;
    DisConnectTimer: TTimer;
    N37: TMenuItem;
    N38: TMenuItem;
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
    procedure CheckScheduleTimerTimer(Sender: TObject);
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
  private
    FLogined: Boolean;
    FPrivileges: String;
    L_bClose : Boolean;
    L_stOldData : string;
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
  private
    ModemSendDataList : TStringList;

    Function DBConnect:Boolean;
    procedure DataProcess(aRecvData:string);
    Function GetCustomerName(aTelNo:string;var aCompanyName,aDepartName:string):string;
    Function GetMasterName(aUserID:string):string;
    Function CheckNotConfirmMemo:Boolean;
    Function AdoConnectCheck : Boolean;
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
  Published
    Property Logined : Boolean read FLogined write  SetLogined; //프로퍼티를 생성함으로 Logined라는 변수가 바뀌면 SetLogined 라는 함수가 실행됨
    Property Privileges : String read FPrivileges write SetPrivileges;
  end;

var
  fmMain: TfmMain;
  G_stSendTelNum : string;

implementation
uses
  uDataModule,
  uProgramType,
  uManagerGubun,
  uManagerAdmin,
  uConsultCode,
  uQnaType,
  uLogin,
  uLomosUtil, uSendMemo, uMemoSearch, uSchedule, uScheduleAlarm,
  uMemoSendSearch, uGoodsCode;
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
begin
  if Not Logined then
  begin
    ini_fun := TiniFile.Create(ExeFolder + '\PGKEY.INI');
    if UpperCase(ini_fun.ReadString('CONFIG','AUTOSTART','FALSE')) = 'TRUE' then
    begin
      Logined := True;
      Master_ID := ini_fun.ReadString('CONFIG','USERID','');
      Master_Name := ini_fun.ReadString('CONFIG','USERNAME','');
    end else
    begin
     TLogin.GetObject.ShowLoginDlg;
     Master_ID := TLogin.GetObject.UserID;
     Master_Name := TLogin.GetObject.UserName;
     Logined := TLogin.GetObject.Logined;
    end;
    ini_fun.Free;

    tbi.Visible := True;
    tbi.Hint := '고객관리프로그램';
    HideTimer.Enabled := True;


    IdUDPServer1.Active := False;
    IdUDPServer1.DefaultPort := 194501;
    IdUDPServer1.Active := True;

    if CheckNotConfirmMemo Then
    begin
      MSNPopUp1.Title := '[메모]';
      MSNPopUp1.Text := '확인하지 않은 메모가 있습니다.';
      MSNPopUp1.ShowPopUp;
    end;
  end;
  

end;

function TfmMain.DBConnect: Boolean;
var
  conStr : string;
begin
  result := false;
{  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=sapasswd;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=sa;';
  conStr := constr + 'Initial Catalog=zeron;';
  conStr := constr + 'Data Source=127.0.0.1,1433' ;  }
  conStr := '';
  conStr := constr + 'Provider=SQLOLEDB.1;';
  conStr := constr + 'Password=zeronpass;';
  conStr := constr + 'Persist Security Info=True;';
  conStr := constr + 'User ID=zeron;';
  conStr := constr + 'Initial Catalog=zeron;';
  conStr := constr + 'Data Source=zeron.co.kr' ;

  with DataModule1.ADOConnection1 do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          //ShowMessage('데이터베이스 접속 에러,네트웍 환경을 확인하세요.' );
          Exit;
        end;
    End;
  end;
  result := true;
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
  fmManagerGubun:= TfmManagerGubun.Create(Self);
  fmManagerGubun.SHowmodal;
  fmManagerGubun.Free;

end;

procedure TfmMain.Action_ManagerAdminExecute(Sender: TObject);
begin
  MDIChildShow('TfmManagerAdmin');

{  fmManagerAdmin1:= TfmManagerAdmin1.Create(Self);
  fmManagerAdmin1.L_sCompanyID := '';
  fmManagerAdmin1.ShowModal;
  fmManagerAdmin1.Free;}
end;

procedure TfmMain.N13Click(Sender: TObject);
begin
  fmConsultCode:= TfmConsultCode.Create(Self);
  fmConsultCode.SHowmodal;
  fmConsultCode.Free;

end;

procedure TfmMain.N21Click(Sender: TObject);
begin
  fmQnaType:= TfmQnaType.Create(Self);
  fmQnaType.SHowmodal;
  fmQnaType.Free;

end;

procedure TfmMain.Action_ConsultExecute(Sender: TObject);
begin
  MDIChildShow('TfmCustomerConsulting');
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
  ToolBar1.Enabled := Value;
  N18.Enabled := Not Value;
  N19.Enabled := Value;
  
end;

procedure TfmMain.SetPrivileges(const Value: String);
begin
  FPrivileges := Value;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  LogoFile : string;
begin
  ExeFolder  := ExtractFileDir(Application.ExeName);

  L_bClose := False;
  Logined := False;
  if Not DBConnect then
  begin
    showmessage('인증키를 관리하려면 인터넷망에 접속되어야 합니다.');
    Application.Terminate;
  end;

  ReceiveTelNumber := '';
  DeleteWindowStartRegKey('ZTBMSADMIN');
  CreateWindowStartRegKey('ZTBMSADMIN',Application.ExeName);

  LogoFile := ExeFolder + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  AdoConnectCheckTimer1.Enabled := True;
  ModemSendDataList := TStringList.Create;
  ModemSendDataList.Clear;
end;

procedure TfmMain.N19Click(Sender: TObject);
begin
  Logined := False;
end;

procedure TfmMain.HideTimerTimer(Sender: TObject);
begin
  if L_bClose then Exit;
  Visible:=False;
  HideTimer.Enabled:=False;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModemSendDataList.Clear;
  tbi.Free;
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
  end else
  begin
    Visible := True;
    MDIChildShow('TfmCustomerConsulting');
    self.FindClassForm('TfmCustomerConsulting').FindCommand('REFRESH').Params.Values['TELNUM'] := ReceiveTelNumber;
    self.FindClassForm('TfmCustomerConsulting').FindCommand('REFRESH').Execute;
  end;
end;

procedure TfmMain.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  DataStringStream: TStringStream;
  RecvData : String;
begin
  DataStringStream := TStringStream.Create('');
  try
    DataStringStream.CopyFrom(AData, AData.Size);
    RecvData:=DataStringStream.DataString;
    G_stReceiveIP := ABinding.PeerIP;
  finally
    DataStringStream.Free;
  end;
  if L_stOldData = RecvData then Exit;
  L_stOldData := RecvData;
  DataProcess(RecvData);
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
  MSNPopUp1.ShowPopUp;
end;

function TfmMain.GetCustomerName(aTelNo: string;var aCompanyName,aDepartName:string): string;
var
  stSql : string;
begin
  aCompanyName := '';
  aDepartName := '';
  result := '';
  stSql := ' select b.AM_USERNAME,c.AC_CPNAME,b.AM_DEPARTNAME from ';
  stSql := stSql + ' TB_LASTCUSTOMERID a ';
  stSql := stSql + ' Left Join TB_AUTHMANAGER b ';
  stSql := stSql + ' ON(a.AC_COMPANYID = b.AC_COMPANYID ';
  stSql := stSql + ' AND a.AM_MANAGERID = b.AM_MANAGERID ) ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY c ';
  stsql := stSql + ' ON(b.AC_COMPANYID = c.AC_COMPANYID) ';
  stSql := stSql + ' Where a.CT_TELNO = ''' + aTelNo + ''' ';

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
    result := FindField('AM_USERNAME').AsString;
    aCompanyName := FindField('AC_CPNAME').AsString;
    aDepartName := FindField('AM_DEPARTNAME').AsString;
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
   FReg.RootKey := HKEY_CURRENT_USER;
   FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
   FReg.WriteString(aRegName, aValue);
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
  stExec := ExtractFileDir(Application.ExeName) + '\SmartUpdate.exe';
  IdUDPServer1.Active := False;
  Delay(1000);
  My_RunDosCommand(stExec,True,False);
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
  stSql := ' Select * from TB_AUTHMEMO ';
  stSql := stSql + ' Where AM_RECEIPTID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND AM_CONFIRM = ''N'' ';
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
  fmSchedule:= TfmSchedule.Create(Self);
  fmSchedule.SHow;

end;
//스케줄 체크하여 알람시간 도달시 알람 발생하자.
procedure TfmMain.CheckScheduleTimerTimer(Sender: TObject);
var
  stSql : string;
begin
  CheckScheduleTimer.Enabled := False;

  stSql := ' Select * from TB_SCHEDULE ';
  stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' AND SD_ALARMFINISH <> ''Y'' ';

  with checkSchedule do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      CheckScheduleTimer.Enabled := True;
      Exit;
    End;

    While Not Eof do
    begin
      ScheduleAlarmCheck(
        FindField('SD_DATE').AsString,
        FindField('SD_SCHEDULEID').AsString,
        FindField('SD_FROMTIME').AsString,
        FindField('SD_TOTIME').AsString,
        FindField('SD_SUBJECT').AsString,
        FindField('SD_CONTENT').AsString,
        FindField('SD_ALARMTYPE').AsString,
        FindField('SD_STARTDAY').AsString,
        FindField('SD_STARTTIME').AsString,
        FindField('SD_REPEATTIME').AsString,
        FindField('SD_ALARMTIME').AsString
      );
      Next;
    end;
  end;

  CheckScheduleTimer.Enabled := True;
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
  fmScheduleAlarm:= TfmScheduleAlarm.Create(Self);
  fmScheduleAlarm.dt_Date.Date := EncodeDate(strtoint(copy(aDate,1,4)),strtoint(copy(aDate,5,2)),strtoint(copy(aDate,7,2)));
  fmScheduleAlarm.dt_StartTime.DateTime := EncodeDateTime(2000,01,01,strtoint(copy(aFROMTIME,1,2)),strtoint(copy(aFROMTIME,3,2)),strtoint(copy(aFROMTIME,5,2)),00 );
  fmScheduleAlarm.dt_EndTime.DateTime := EncodeDateTime(2000,01,01,strtoint(copy(aTOTIME,1,2)),strtoint(copy(aTOTIME,3,2)),strtoint(copy(aTOTIME,5,2)),00 );
  fmScheduleAlarm.ed_SCSubject.Text := aSUBJECT;
  fmScheduleAlarm.mem_Memo.Text := aCONTENT;
  fmScheduleAlarm.SHow;

end;

function TfmMain.UpdateTB_SCHEDULEAlarmCheck(aDate, aSCHEDULEID,
  aAlarmTime, aAlarmFinish: string): Boolean;
var
  stsql : string;
begin
  stSql := ' Update TB_SCHEDULE set ';
  if Trim(aAlarmTime) <> '' then  stSql := stSql + 'SD_ALARMTIME = ''' + aAlarmTime + ''',';
  stSql := stSql + ' SD_ALARMFINISH = ''' + aAlarmFinish + ''' ';
  stSql := stSql + ' Where AD_USERID = ''' + Master_ID + ''' ';
  stSql := stsql + ' AND SD_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND SD_SCHEDULEID = ' + aSCHEDULEID ;

  result := DataModule1.ProcessExecSQL(stSql);
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
   FReg.OpenKey('Software\Microsoft\Windows\CurrentVersion\Run',True);
   FReg.DeleteValue(aRegName);
   FReg.CloseKey;
 Finally
  FReg.Free;
 end;
 result := True;
end;

procedure TfmMain.AdoConnectCheckTimer1Timer(Sender: TObject);
begin
  if AdoConnectCheck then Exit;
  AdoConnectCheckTimer1.Enabled := False;
  DBConnect;
  AdoConnectCheckTimer1.Enabled := True;
end;

function TfmMain.AdoConnectCheck: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_AUTHADMIN ';
  With ADOCheckQuery1 do
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

    stSendData := 'MODEMSEND' + DATADELIMITER + '' + DATADELIMITER + LINEEND;
    ModemSendData(stSendData);
    ModemSendData(stSendData);
    ModemSendData(stSendData);
  Finally
    N34.Enabled := True;
  End;
end;

procedure TfmMain.ModemSendData(aData: string);
begin
  ModemSendDataList.Add(aData);
  ModemTimer.Enabled := True;
end;

procedure TfmMain.ModemTimerTimer(Sender: TObject);
var
  stSendData:string;
begin
  ModemTimer.Enabled := False;
  if Not IdTCPClient1.Connected then
  begin
    if G_stReceiveIP = '' then G_stReceiveIP := '192.168.0.90';
    IdTCPClient1.Host := G_stReceiveIP;
    IdTCPClient1.Port := 10001;
    IdTCPClient1.Connect(1000);
    ModemTimer.Enabled := True;
    Exit;
  end;
  if ModemSendDataList.Count < 1 then Exit;

  stSendData := ModemSendDataList.Strings[0];
  ModemSendDataList.Delete(0);

  IdTCPClient1.Write(stSendData);
  ModemTimer.Enabled := True;

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
    DisConnectTimer.Enabled := False;
    stSendData := 'MODEMSEND' + DATADELIMITER + '' + DATADELIMITER + LINEEND;
    ModemSendData(stSendData);
    ModemSendData(stSendData);
    ModemSendData(stSendData);

end;

procedure TfmMain.N37Click(Sender: TObject);
var
  stSendData : string;
begin
  if Not IsDigit(G_stSendTelNum) then Exit;
  stSendData := 'MODEMSEND' + DATADELIMITER + 'ATDT' + G_stSendTelNum + DATADELIMITER + LINEEND;
  ModemSendData(stSendData);
  DisConnectTimer.Enabled := True;

end;

end.
