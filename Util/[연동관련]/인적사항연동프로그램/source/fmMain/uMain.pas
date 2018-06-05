unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ToolWin, ComCtrls,
  uCommonVariable, StdCtrls,ADOdb,ActiveX, Buttons, uSubForm, CommandArray,
  DB,TlHelp32, OoMisc, AdPort, AdWnPort,
  uData;

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
    N5: TMenuItem;
    mn_Config: TMenuItem;
    AdoConnectCheckTimer: TTimer;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    MenuItem3: TMenuItem;
    Ver011: TMenuItem;
    miExit: TMenuItem;
    mn_RelayDB: TMenuItem;
    N3: TMenuItem;
    RelayTimer: TTimer;
    RelayAdoConnectCheckTimer: TTimer;
    btn_SearchState: TToolButton;
    RelayADOQuery: TADOQuery;
    N2: TMenuItem;
    ADORelayExcut: TADOQuery;
    RelayADOQuery1: TADOQuery;
    RelayAdoConnectCheckTimer1: TTimer;
    N6: TMenuItem;
    mn_GradGroup: TMenuItem;
    mn_GroupGrade: TMenuItem;
    mn_GroupMapping: TMenuItem;
    RealTimer: TTimer;
    ControlSocketPort: TApdWinsockPort;
    SocketConnectCheckTimer: TTimer;
    SendServerTimer: TTimer;
    mn_GetHospital: TMenuItem;
    mn_DeleteHospital: TMenuItem;
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
    procedure mn_ConfigClick(Sender: TObject);
    procedure mn_RelayDBClick(Sender: TObject);
    procedure RelayAdoConnectCheckTimerTimer(Sender: TObject);
    procedure RelayTimerTimer(Sender: TObject);
    procedure btn_SearchStateClick(Sender: TObject);
    procedure CommandArrayCommandsTDEVICECURRENTSTATEExecute(
      Command: TCommand; Params: TStringList);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CommandArrayCommandsTJUNNAMStateExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTKTBundangStateExecute(Command: TCommand;
      Params: TStringList);
    procedure N2Click(Sender: TObject);
    procedure CommandArrayCommandsTCHOSUNStateExecute(Command: TCommand;
      Params: TStringList);
    procedure RelayAdoConnectCheckTimer1Timer(Sender: TObject);
    procedure CommandArrayCommandsTSSANGYONGSTATEExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTYONSESTATEExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTHizeStateExecute(Command: TCommand;
      Params: TStringList);
    procedure mn_GradGroupClick(Sender: TObject);
    procedure mn_GroupGradeClick(Sender: TObject);
    procedure mn_GroupMappingClick(Sender: TObject);
    procedure RealTimerTimer(Sender: TObject);
    procedure ControlSocketPortWsConnect(Sender: TObject);
    procedure ControlSocketPortWsDisconnect(Sender: TObject);
    procedure ControlSocketPortWsError(Sender: TObject; ErrCode: Integer);
    procedure ControlSocketPortTriggerAvail(CP: TObject; Count: Word);
    procedure SocketConnectCheckTimerTimer(Sender: TObject);
    procedure SendServerTimerTimer(Sender: TObject);
    procedure mn_GetHospitalClick(Sender: TObject);
    procedure mn_DeleteHospitalClick(Sender: TObject);
  private
    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bActive : Boolean;
    L_bRelayAction : Boolean;
    FMAPTYPE: string;
    FControlSocketConnected: Boolean;
    { Private declarations }
    procedure PatientStateChange(Sender: TObject; aPatientNo,aHospitalizeDate,aLeaveDate,aState:string);
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure RelayAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure RelayAdoConnected1(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    procedure RelayAdoEvent(Sender: TObject;  aSql : string);
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    procedure JunnamEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult:string);
    procedure YeosuEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult:string);
    procedure KTBundangEventState(aUpdateTime,aEmCode,aCardNo,aEmName,aCardIssuCount,aStartDate,aEndDate,aJijumName,
                               aDepartName,aPosiName,aWorkGubun,aResult:string);
    procedure CHOSUNEventState(aEmCode,aEmName,aPosiCode,aJijumName,aDepartName,aRegname,aCompanyPhone,aReTireDate,aCardSeq,aResult:string);
    procedure SSANGYONGATEventState(aDate,aTime,aEMCode,aResult:string);
    procedure SSANGYONGEmployeeEventState(aEmCode,aEmName,aJijumName,aDepartName,aWorkCode,aInsertTime,aUpdateTime,aResult:string);
    procedure YounSeUniversityEmployeeEventState(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aOldCardNo,aResult:string);
    procedure SeoulUniversityEmployeeEventState(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aOldCardNo,aResult:string);
    procedure HizeAirATEventState(aATTYPE,aEMCODE,aATDATE,aACDATE,aACTIME,aJIJUMNAME,aDEPARTCODE,aDEPARTNAME,aEMNAME,aResult:string);
    procedure SetFControlSocketConnected(const Value: Boolean);
  private
    L_stProgramType : string; //1:아주대,2:전남대병원 ,10:STX창원
    L_stDBType : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP : string; //BataBase 접속IP
    L_stDBPort : string; //BataBase 접속Port
    L_stDBUserID : string;
    L_stDBUserPW : string;
    L_stDBName : string;
    L_stDBType2 : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP2 : string; //BataBase 접속IP
    L_stDBPort2 : string; //BataBase 접속Port
    L_stDBUserID2 : string;
    L_stDBUserPW2 : string;
    L_stDBName2 : string;
    L_stServerIP : string; //통신데몬 서버 IP
    L_stServerPort : string; //통신서버 포트

    L_stRelayTime : string;
    L_stLastRelayTime : string; //마지막 연동 시간
    L_stLastRelayDelTime : string; //마지막 삭제 연동시간
    L_stCompanyCode : string;
    L_stJijumCode : string;
    L_stPosiCode : string;
    L_dtRelayActionTime : TDatetime;
    L_bRelayDB : Boolean;
    L_bShowState : Boolean;
    L_bJUNNAMShowState : Boolean;
    L_bKTBundangShowState : Boolean;
    L_bCHOSUNShowState : Boolean;
    L_bSSANGYONGShowState : Boolean;
    L_bYounseEventShowState : Boolean;
    L_bHizeAirEventShowState : Boolean;
    MappingCode1List : TStringList;
    MappingCode2List : TStringList;
    PatientList : TStringList;
    SendServerList : TStringList;
    procedure LoadConfig;
    Function CheckTB_CONFIG(aGroup,aCode:string):Boolean;
    Function InsertIntoTB_CONFIG(aGroup,aCode,aValue:string):Boolean;
    Function LoadMappingCode:Boolean;
    Function GetMappingType : string;
  private
    //아주대연동
    Function AjuUniversityRelay(aCount:integer=0):Boolean;
    Function AjuConversionEmployee(aJijumName,aDepartName,aPosiCode,aEmName,aEmCode,aCardSeq,aType,aGubun:string):Boolean;
    Function Delete_MFC_HUB(aSEQNO:integer):Boolean;
  private
    //아주대기숙사 연동
    Function AjuUniversityDormitoryRelay(aCount:integer=0):Boolean;
    Function AjuDormitoryConversionEmployee(aJijumName,aCophone,aPosiName,aInOutState,aEmCode,aEmName,aCardSeq,aType,aAddr1,aAddr2:string):Boolean;
    Function Delete_MFC_HUB_DORMITORY(aSEQNO:integer):Boolean;
  private
    L_bJNRealTimeStart : Boolean;
    L_bJNGetHospitalInfoStart : Boolean;
    //전남대 병원 연동
    Function JNRealTimeRelay:Boolean; //환자 정보 연동건
    Function JNpatientRelay(aCode,aInDate,aOutDate,aState:string;aLogFile:Boolean=False):Boolean;
    Function JunNamUniversityRelay(aDate:String):Boolean;
    Function JUNNAMConversionEmployee(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime:string):Boolean;
    Function ServerSender(aSendData:string):Boolean;
  private
    //여수 병원 연동
    Function YeosuRealTimeRelay:Boolean; //환자 정보 연동건
    Function YeosupatientRelay(aCode,aInDate,aOutDate,aState:string;aLogFile:Boolean=False):Boolean;
    Function YeosuRelay(aDate:String):Boolean;
    Function YeosuConversionEmployee(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime:string):Boolean;
  private
    //KT 서초사옥 연동
    Function KTBundangRelay(aDate:String):Boolean;
    Function KTBundangDelRelay(aDate:String):Boolean;
    Function KTBundangEmployeeCardStop(aDelDate,aEmCode,aCardID,aUserName:string):Boolean;
    Function KTBundangConversionEmployee(aEmCode,aCardNo,aEmName,aCardIssuCont,aStartDate,aEmEndDate,aJijumName,aDepartName,aPosiName,aWorkGubun:string):Boolean;
  private
    //KT 우면동 연동
    Function KTBundangRelay1(aDate:String):Boolean;
    Function KTBundangDelRelay1(aDate:String):Boolean;
    Function KTBundangEmployeeCardStop1(aDelDate,aEmCode,aCardID,aUserName:string):Boolean;
    Function KTBundangConversionEmployee1(aEmCode,aCardNo,aEmName,aCardIssuCont,aStartDate,aEmEndDate,aJijumName,aDepartName,aPosiName,aWorkGubun:string):Boolean;
  private
    Function GetChosunRelay:Boolean;
    Function ChosunRelay(aTime:string):Boolean;
    Function CHOSUNConversionEmployee(aEmCode,aEmName,aPosiCode,aJijumName,aDepartName,aRegname,aCompanyPhone,aReTireDate,aCardSeq:string):Boolean;
  private
    //쌍용정보통신 연동
    Function SSANGYONGAT_Relay:Boolean;
    Function SSANGYONGEmployee_Relay(aDate:string):Boolean;
    Function SSANGYONGConversionEmployee(aEmCode,aEmName,aJijumName,aDepartName,aWorkCode,aInsertTime,aUpdateTime:string):Boolean;
    Function Insert_SSANGYONGAtEvent(aDate,aTime,aEmCode:string):Boolean;
    Function Check_SSANGYONGATEVENT(aDate,aTime,aEmCode:string):Boolean;
  private
    //연세대 연동
    Function YounSeUniversityRelay(aDate:string):Boolean;
    Function YounSeUniversityEmployee(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aStateText:string;var aOldCardNo:string) : Boolean;
  private
    //하이즈 항공 연동
    Function HizeAirAttendRelay:Boolean;
    Function Insert_HizeAirAtEvent(aATTYPE,aEMCODE,aATDATE,aACDATE,aACTIME,aJIJUMNAME,aDEPARTCODE,aDEPARTNAME,aEMNAME:string):Boolean;
    Function Check_HizeAirAtEVENT_Key(aATTYPE, aEMCODE, aATDATE:string):Boolean;
    Function Check_HizeAirAtEVENT_Time(aATTYPE, aEMCODE, aATDATE,aACTIME:string):Boolean;
  private
    //서울대 연동
    Function SeoulUniversityEmployeeRelay:Boolean;
    Function SeoulHumanitiesEmployeeRelay(aLastRelayTime:string):Boolean;
    Function SeoulHumanitiesConversionEmployee(aCardNo,aUserName:string):Boolean;
    Function GetSeoulHumanitiesEmCode(aUserName:string; var aEmCode:string):Boolean;
    Function SeoulUniversityEmployee(aJijumName, aDepartName,aEmployeeGubun, aEmName, aEmCode, aTelNum, aEmail, aAddr1, aAddr2,aEndDate,aEmployeeState,aCampusName: string) : Boolean;
    Function UpdateBSNS031_LOG_Field_String(aSEQ,aFieldName,aValue:string):Boolean;
  private
    //STX조선 창원
    Function STXChangWonAttendRelay:Boolean;
    Function Insert_STXChangWonAtEvent(aDate,aTime,aEmCode,aNodeNo,aEcuID,aDoorNo,aDoorName:string):Boolean;
    Function STXChangWonAtState(aDate,aTime,aEmCode,aNodeNo,aEcuID,aDoorNo,aDoorName,aResult:string):Boolean;
    Function Check_STXChangwonATEVENT(aDate,aTime,aEmcode:string):Boolean;
  private
    //동양대 북서울 캠퍼스 연동
    Function DongYangUniversityRelay:Boolean;
    Function DongYangUniversityEmployee(aJijumCode,aEmCode,aEmName,aRoomNumber,aPosiCode,aRegDate,atoesagb,      //퇴사여부(1:퇴사)
                                 atoesadate,ahagjuggb,acardseq:string):Boolean;
    Function DongYangUniversityEmployeeEventState(aJijumCode,aEmCode,aEmName,aRoomNumber,aPosiCode,aRegDate,atoesagb,
                                 atoesadate,ahagjuggb,acardseq,aResult:string):Boolean;
  private
    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function GetRelayCode(aRelayName:string):string;
    Function GetSeoulUniversityEmStateCode(aEmployeeState:string):string;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxPosiCode(aCompanyCode:string):integer;
    Function GetMaxRelayCode:integer;
    Function MakeCardNo( aIDNO,aSeq:string):string;
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName:string; var aDepartCode:string);
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateRelayCode(aCampusName:string; var aRgCode:string);

  private
    Function CheckTB_DEVICECARDNO_CardPermit(aCardNo:string):Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertIntoTB_RELAYGUBUN(aRgCode,aCampusName:string):Boolean;
    Function UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate:string):Boolean;
    Function UpdateTB_CARD_NewCard(aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNORcvAck(aCardNo,aRcvAck:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeCardStop(aEmCode:string):Boolean;
    Function DeleteTB_EMPLOYEE(aEmCode,aCardNo:string):Boolean;


  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지
    function GetPIDfromExeName(name:String):Cardinal;
    procedure KillProcess(name:String);

  public
    ServerRecvTime : TDateTime;
    { Public declarations }
    property   MAPTYPE : string  read FMAPTYPE write FMAPTYPE;
    property ControlSocketConnected : Boolean read FControlSocketConnected write SetFControlSocketConnected;
  end;

var
  fmMain: TfmMain;

implementation

uses
  uLomosUtil,
  uDBFunction,
  uDBModule,
  uDataBaseConfig,
  uConfig,
  udmAdoRelay,
  uDeviceCurrentState,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uFireBird,
  uCommonSql,
  uJUNNAMCurrentState,
  uKTBundangCurrentState,
  uCHOSUNCurrentState,
  uQuery,
  uSSANGYONGCurrentState,
  uYounseUniversityCurrentState,
  uHizeAirCurrentState,
  uSTXChangWonCurrentState,
  uGroupGrade,
  uGroupCode , uMapping,
  uDongyangUniversityCurrentState;

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
  //KillProcess(ExtractFileName(Application.ExeName));
  ServerRecvTime := now - 1;
  MappingCode1List := TStringList.Create;
  MappingCode2List := TStringList.Create;
  SendServerList := TStringList.Create;
  PatientList := TStringList.Create;

  G_stExeFolder  := ExtractFileDir(Application.ExeName);
  ExeFolder := G_stExeFolder;
  L_bApplicationTerminate := False;
  LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion Program Start ');

  tbi.Visible := True;
  tbi.Hint := '사원정보 연동 시스템 정지';
  FirstTimer.Enabled := False;

  LogoFile := G_stExeFolder + '\Logo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);

  dmDBModule.OnAdoConnected := DataModuleAdoConnected;
  dmAdoRelay.OnAdoConnected := RelayAdoConnected;
  dmAdoRelay.OnAdoEvent := RelayAdoEvent;
  dmAdoRelay.OnAdoConnected1 := RelayAdoConnected1;

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
  
  if Not CheckTB_CONFIG('RELAY','EMMAPCODE') then
  begin
    InsertIntoTB_CONFIG('RELAY','EMMAPCODE','1');
  end;

  LoadConfig;
  L_dtRelayActionTime := Now; //시작 되자 마자 한번 연동 하자.
  if Not dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName) then
  begin
    tbi.Hint := '사원정보 연동 시스템 실패';
    RelayAdoConnectCheckTimer.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
    RelayAdoConnectCheckTimer.Enabled := True;
  end else
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 10; //끊기면 10초에 한번씩 체크
    //RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '사원정보 연동 시스템 정상';
  end;
  if L_stProgramType = '5' then
  begin
    if Not dmAdoRelay.AdoRelay1Connected(L_stDBType, L_stDBIP, L_stDBPort,
                      L_stDBUserID, L_stDBUserPW, 'sw_mast') then
    begin
      tbi.Hint := '사원정보 연동 시스템 실패';
      RelayAdoConnectCheckTimer1.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
      RelayAdoConnectCheckTimer1.Enabled := True;
    end else
    begin
      RelayAdoConnectCheckTimer1.Interval := 1000 * 10; //끊기면 10초에 한번씩 체크
      //RelayAdoConnectCheckTimer.Enabled := True;
      tbi.Hint := '사원정보 연동 시스템 정상';
    end;
  end;

  MAPTYPE := GetMappingType;
  LoadMappingCode;

  L_bRelayAction := False;
  RelayTimer.Enabled := True;
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
  TDataBaseConfig.GetObject.DBConnected := DBConnected;
end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  if L_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'AdoConnectCheckTimer';
  AdoConnectCheckTimer.Enabled := False;
  TDataBaseConfig.GetObject.DataBaseConnect;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    StatusBar1.Panels[2].Text := 'DBConnected Fail';
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
  Delay(1000);
//  dmAdoRelay.ADOConnection.Connected := False;
  LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion Program End ');
  MappingCode1List.Free;
  MappingCode2List.Free;
  SendServerList.Free;
  PatientList.Free;

end;

procedure TfmMain.mn_ConfigClick(Sender: TObject);
begin
  fmConfig := TfmConfig.Create(Self);
  fmConfig.ShowModal;
  fmConfig.Free;
  LoadConfig;
  if Not dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName) then
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 600;   //접속실패시 10분에 한번씩 체크
    RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '사원정보 연동 시스템 실패';
  end else
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 10; //끊기면 10초에 한번씩 체크
    tbi.Hint := '사원정보 연동 시스템 정상';
  end;

end;

procedure TfmMain.LoadConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  mn_GetHospital.Visible := False;
  mn_DeleteHospital.Visible := False;

  G_nCARDLENGTHTYPE := 0;
  L_stProgramType := '1';   //1:아주대,2:전남대병원,3.KT서초사옥
  L_stDBType := '3';
  L_stDBIP :='127.0.0.1';
  L_stDBPort := '1521';
  L_stDBUserID := 'SYS';
  L_stDBUserPW := 'orapasswd1';
  L_stDBName :='orcl';
  L_stDBType2 := '3';
  L_stDBIP2 :='127.0.0.1';
  L_stDBPort2 := '1521';
  L_stDBUserID2 := 'SYS';
  L_stDBUserPW2 := 'orapasswd1';
  L_stDBName2 :='orcl';

  L_stRelayTime :='30';
  L_stLastRelayTime := '';
  L_stCompanyCode := '099';
  L_stJijumCode := '000';
  L_stPosiCode := '000';

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
        end else if FindField('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'IP' then  L_stServerIP := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'EMPCONV' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PGTYPE'   then L_stProgramType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then L_stDBType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then L_stDBIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then L_stDBPort := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then L_stDBUserID := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then L_stDBUserPW := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then L_stDBName := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE2'   then L_stDBType2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP2'     then L_stDBIP2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT2'   then L_stDBPort2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID2' then L_stDBUserID2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW2' then L_stDBUserPW2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME2'   then L_stDBName2 := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then L_stRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'LASTTIME'   then L_stLastRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DELTIME'   then L_stLastRelayDelTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then L_stCompanyCode := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'JIJUMCD'   then L_stJijumCode := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'POSICD'   then L_stPosiCode := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'RELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'EMPSPORT' then  L_stServerPORT := FindField('CO_CONFIGVALUE').AsString;
        end;
        Next;
      end;
    end;
     mn_GetHospital.Visible := False;
     mn_DeleteHospital.Visible := False;

    if L_stProgramType = '1' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '2' then
    begin
       mn_RelayDB.Caption := '전체연동' ;
       mn_GetHospital.Visible := True;
       mn_DeleteHospital.Visible := True;
       RealTimer.Enabled := True;
       SocketConnectCheckTimer.Enabled := True;
    end else if L_stProgramType = '3' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '4' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '5' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '6' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '7' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '8' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '9' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '10' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '11' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '12' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '13' then
    begin
       mn_RelayDB.Caption := '전체연동' ;
       mn_GetHospital.Visible := True;
       mn_DeleteHospital.Visible := True;
       RealTimer.Enabled := True;
       SocketConnectCheckTimer.Enabled := True;
    end
    ;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

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

procedure TfmMain.mn_RelayDBClick(Sender: TObject);
begin
  inherited;
  dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName);
  Try
    if L_stProgramType = '1' then
    begin
      AjuUniversityRelay;
    end else if L_stProgramType = '2' then
    begin
      StatusBar1.Panels[2].Text := '전체연동' + L_stLastRelayTime;
      JunNamUniversityRelay('');
    end else if L_stProgramType = '3' then
    begin
      StatusBar1.Panels[2].Text := '즉시연동' + L_stLastRelayTime;
      if Not KTBundangRelay(L_stLastRelayTime) then Exit;  //KT서초사옥 연동건
      if Not KTBundangDelRelay(L_stLastRelayDelTime) then Exit;
    end else if L_stProgramType = '4' then
    begin
      StatusBar1.Panels[2].Text := '즉시연동' + L_stLastRelayTime;
      GetChosunRelay;  //조선대 데이터 가져오기
      if Not ChosunRelay(L_stLastRelayTime) then Exit;  //조선대 인적사항 연동
    end else if L_stProgramType = '5' then  //우면동
    begin
      if Not KTBundangDelRelay1(L_stLastRelayDelTime) then Exit;
      if Not KTBundangRelay1(L_stLastRelayTime) then Exit;  //KT우면동 연동건
    end else if L_stProgramType = '6' then  //쌍용정보통신
    begin
      StatusBar1.Panels[2].Text := '즉시연동' + L_stLastRelayTime;
      SSANGYONGAT_Relay;
      SSANGYONGEmployee_Relay(L_stLastRelayTime);
    end else if L_stProgramType = '7' then  //연세대
    begin
      StatusBar1.Panels[2].Text := '즉시연동' + L_stLastRelayTime;
      YounSeUniversityRelay(L_stLastRelayTime);  //연세대 학생정보
    end else if L_stProgramType = '8' then  //하이즈 항공 근태 연동
    begin
      StatusBar1.Panels[2].Text := '즉시연동' + FormatDateTime('yyyymmddhhnnss',now);
      HizeAirAttendRelay;
    end else if L_stProgramType = '9' then   //서울대학교 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      SeoulUniversityEmployeeRelay;
      SeoulHumanitiesEmployeeRelay(L_stLastRelayTime);
    end else if L_stProgramType = '10' then   //STX창원
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      STXChangWonAttendRelay;
    end else if L_stProgramType = '11' then   //동양대 북서울 캠퍼스
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      DongYangUniversityRelay;
    end else if L_stProgramType = '12' then   //아주대 기숙사 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      AjuUniversityDormitoryRelay;
    end else if L_stProgramType = '13' then   //여수종합병원 연동
    begin
      StatusBar1.Panels[2].Text := '전체연동' + L_stLastRelayTime;
      YeosuRelay('');
    end;
  Finally
  End;

end;

function TfmMain.AjuUniversityRelay(aCount:integer=0):Boolean;
var
  stSql : string;
  nFdmsID : integer;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := ' Select * from CARD.MFC_HUB ';
  if aCount > 0 then stSql := stSql + ' Where RowNum <= ' + inttostr(aCount);
  stSql := stSql + ' order by HUB_SEQNO ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '연동시작';
      if AjuConversionEmployee(FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                               FindField('HUB_IDDI').AsString,FindField('HUB_NAME').AsString,
                               FindField('HUB_IDNO').AsString,FindField('HUB_ISFG').AsString,
                               FindField('HUB_LSFG').AsString,FindField('HUB_SDCO').AsString) then
      begin
        Delete_MFC_HUB(FindField('HUB_SEQNO').AsInteger);
      end;
      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '연동완료';
      Application.ProcessMessages;
      Next;
    end;
  end;

end;

function TfmMain.AjuConversionEmployee(aJijumName, aDepartName, aPosiCode,
  aEmName, aEmCode, aCardSeq, aType,aGubun: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  // aType : //0:정상,1:분실
  // aPosiCode : //1: 학사(003),2:석사(001),3:박사(003),4:교원(004),5:직원(005),8:조교(006)
  //aGubun 0:재학,1:휴학,2:졸업,3:재적
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := '000';
  case aPosiCode[1] of
    '1': stPosiCode := '003';  //학사
    '2': stPosiCode := '001';  //석사
    '3': stPosiCode := '002';  //박사
    '4': stPosiCode := '004';  //교원
    '5': stPosiCode := '005';  //직원
    '8': stPosiCode := '006';  //조교
  end;
  bCardStateChange := False;
  stCardState := '2';
  if aType = '0' then stCardState := '1';  //aType이 0 인경우만 정상

  if length(aEmCode) < 9 then
    aEmCode := FillZeroStrNum(aEmCode,9,True);

  stCardNo := MakeCardNo(aEmCode,aCardSeq);

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if (aGubun = '0') or (aGubun = '1') then
    begin
      if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aEmName,
                        '','아주대학교',aJijumName,aDepartName,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aEmName,
                        '','아주대학교',aJijumName,aDepartName,'');
      result := True;
      Exit;
    end;
  end else
  begin
    if (aGubun = '0') or (aGubun = '1') then
    begin
      nFdmsID := strtoint(GetFdmsID);
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                        aEmName,
                        '001',
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        '',
                        '20000101',
                        '99991231',
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001',
                        '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aEmName,
                          '','아주대학교',aJijumName,aDepartName,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  result := True;
end;

procedure TfmMain.RelayAdoConnected(Sender: TObject; DBConnected: Boolean);
begin
  RelayAdoConnectCheckTimer.Enabled := Not DBConnected;
end;

procedure TfmMain.RelayAdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'RelayAdoConnectCheckTimer';
  RelayAdoConnectCheckTimer.Enabled := False;
  if Not dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName) then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '사원정보 연동 시스템 실패';
  end else tbi.Hint := '사원정보 연동 시스템 정상';
end;

procedure TfmMain.RelayTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  if L_dtRelayActionTime > now then Exit;
  (*if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;  *)
  dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName);
  Try
    RelayTimer.Enabled:=False;
    tbi.Hint := '사원정보 연동 시스템 작업중';
    if L_stProgramType = '1' then
    begin
      if Not AjuUniversityRelay then Exit;  //아주대 연동
    end else if L_stProgramType = '2' then
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      if Not JunNamUniversityRelay(L_stLastRelayTime) then Exit;  //전남대병원 연동
    end else if L_stProgramType = '3' then   //서초사옥 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      if Not KTBundangRelay(L_stLastRelayTime) then Exit;  //KT서초사옥 연동건
      if Not KTBundangDelRelay1(L_stLastRelayDelTime) then Exit;
    end else if L_stProgramType = '4' then   //조선대학교 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      GetChosunRelay;  //조선대 데이터 가져오기
      if Not ChosunRelay(L_stLastRelayTime) then Exit;  //조선대 인적사항 연동
    end else if L_stProgramType = '5' then   //KT우면동 연동
    begin
      KTBundangRelay1(L_stLastRelayTime);  //KT우면동 연동
      KTBundangDelRelay1(L_stLastRelayDelTime);
    end else if L_stProgramType = '6' then   //쌍용정보통신 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      SSANGYONGAT_Relay;
      SSANGYONGEmployee_Relay(L_stLastRelayTime);
    end else if L_stProgramType = '7' then   //연세대 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      YounSeUniversityRelay(L_stLastRelayTime);  //연세대 학생정보
    end else if L_stProgramType = '8' then   //하이즈 항공 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      HizeAirAttendRelay;
    end else if L_stProgramType = '9' then   //서울대학교 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      SeoulUniversityEmployeeRelay;
      SeoulHumanitiesEmployeeRelay(L_stLastRelayTime);
    end else if L_stProgramType = '10' then   //STX창원
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      STXChangWonAttendRelay;
    end else if L_stProgramType = '11' then   //동양대 북서울 캠퍼스
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      DongYangUniversityRelay;
    end else if L_stProgramType = '12' then   //아주대기숙사
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      AjuUniversityDormitoryRelay;
    end else if L_stProgramType = '13' then   //여수병원
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      YeosuRelay(L_stLastRelayTime);
    end;

    if Not isDigit(L_stRelayTime) then  L_stRelayTime := '30';
    L_dtRelayActionTime := IncTime(Now,0,strtoint(L_stRelayTime),0,0);
    //dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
    //                L_stDBUserID, L_stDBUserPW, L_stDBName);
  Finally
    RelayTimer.Enabled:= Not L_bApplicationTerminate;
    tbi.Hint := '사원정보 연동 시스템 정상';
  End;

end;

function TfmMain.Delete_MFC_HUB(aSEQNO: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From CARD.MFC_HUB ';
  stSql := stSql + ' where HUB_SEQNO = ' + inttostr(aSEQNO) ;

  result := dmAdoRelay.ProcessExecSQL(stSql);

end;

function TfmMain.GetJijumCode(aCompanyCode,aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aJijumName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := FindField('CO_JIJUMCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetDepartCode(aCompanyCode,aJijumCode, aDepartName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' Where CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_NAME = ''' + aDepartName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := FindField('CO_DEPARTCODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetMaxDepartCode(aCompanyCode,aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '001';
  stSql := ' Select Max(CO_DEPARTCODE) as departCode from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      if isDigit(FindField('departCode').AsString) then
      begin
        result := FillZeroNumber(strtoint(FindField('departCode').AsString) + 1 ,3);
      end else
      begin
        result := '001';
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.MakeCardNo(aIDNO, aSeq: string): string;
begin
  result := '';
  if L_stProgramType = '1' then //아주대
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if L_stProgramType = '2' then //전남대병원
  begin
    result := FillCharString(aIDNO,'*',16);
  end else if L_stProgramType = '11' then   //동양대 북서울 캠퍼스
  begin
    result := FillCharString(aIDNO,'N',14);
    result := result + FillZeroStrNum(aSeq,2);
  end else if L_stProgramType = '12' then   //아주대 기숙사
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if L_stProgramType = '13' then //여수병원
  begin
    result := FillCharString(aIDNO,'*',16);
  end;
end;

procedure TfmMain.CreateJijumCode(aCompanyCode,aJijumName: string;
  var aJijumCode: string);
var
  nJijumCode : integer;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);

end;

function TfmMain.GetMaxJijumCode(aCompanyCode:string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(CO_JIJUMCODE) as CO_JIJUMCODE from TB_COMPANY ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      if isDigit(FindField('CO_JIJUMCODE').AsString) then
      begin
        result := strtoint(FindField('CO_JIJUMCODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_COMPANY(aCompanyCode, aJijumCode,
  aDepartCode, aGubun, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_NAME,';
  stSql := stSql + ' CO_GUBUN) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGubun + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmMain.CreateDepartCode(aCompanyCode,aJijumCode, aDepartName: string;
  var aDepartCode: string);
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
end;


function TfmMain.GetFdmsID: string;
var
  stSql : string;
  nFdms_id : integer;
  TempAdoQuery : TADOQuery;
begin
  result := '31';
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
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
      if recordCount < 1 then Exit;
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := inttostr(nFdms_id + 1);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


procedure TfmMain.btn_SearchStateClick(Sender: TObject);
begin
  inherited;
  if L_stProgramType = '1' then
    MDIChildShow('TfmDeviceCurrentState')
  else if L_stProgramType = '2' then //전남대병원연동현황
    MDIChildShow('TfmJUNNAMCurrentState')
  else if L_stProgramType = '3' then //KT분당연동현황
    MDIChildShow('TfmKTBundangCurrentState')
  else if L_stProgramType = '4' then //chosun대병원연동현황
    MDIChildShow('TfmCHOSUNCurrentState')
  else if L_stProgramType = '5' then //KT분당연동현황
    MDIChildShow('TfmKTBundangCurrentState')
  else if L_stProgramType = '6' then //쌍용정보통신
    MDIChildShow('TfmSSANGYONGCurrentState')
  else if L_stProgramType = '7' then //연세대
    MDIChildShow('TfmYounseUniversityCurrentState')
  else if L_stProgramType = '8' then //하이즈 항공
    MDIChildShow('TfmHizeAirCurrentState')
  else if L_stProgramType = '9' then //서울대학교
    MDIChildShow('TfmYounseUniversityCurrentState')
  else if L_stProgramType = '10' then //STX창원
    MDIChildShow('TfmSTXChangWonCurrentState')
  else if L_stProgramType = '11' then //동양대 북서울 캠퍼스
    MDIChildShow('TfmDongyangUniversityCurrentState')
  else if L_stProgramType = '12' then //아주대 기숙사
    MDIChildShow('TfmDeviceCurrentState')
  else if L_stProgramType = '13' then //여수병원
    MDIChildShow('TfmJUNNAMCurrentState')
    ;
end;

procedure TfmMain.CommandArrayCommandsTDEVICECURRENTSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bShowState := True
   else L_bShowState := False;

end;

procedure TfmMain.RelayAdoEvent(Sender: TObject; aSql: string);
var
  fmDeviceCurrentState : TForm;
begin
  if L_bShowState then
  begin
    fmDeviceCurrentState := MDIForm('TfmDeviceCurrentState');
    if fmDeviceCurrentState <> nil then
    begin
      TfmDeviceCurrentState(fmDeviceCurrentState).RelayAdoEvent(aSql);
    end;
  end;
end;

procedure TfmMain.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  //한건씩 테스트
  RelayTimer.Enabled := False;
  AjuUniversityRelay(1);
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

function TfmMain.DeleteTB_EMPLOYEE(aEmCode, aCardNo: string): Boolean;
var
  stSql : string;
begin
//  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' where CA_CARDNO = ''' + aCardNo + ''' ';
//  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' FROM TB_DEVICECARDNO A JOIN TB_CARD B ON A.CA_CARDNO = B.CA_CARDNO where B.EM_CODE = ''' + aEmCode + '''  ';
  result := dmDBModule.ProcessExecSQL(stSql);


  stSql := ' Delete From TB_CARD where EM_CODE = ''' + aEmCode + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_EMPLOYEE where EM_CODE = ''' + aEmCode + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.JunNamUniversityRelay(aDate:string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select CARD_GUBN,CARD_HOSP,CARD_IDNO,CARD_JWNO,';
  stSql := stSql + 'CARD_NAME,CARD_SUKR,CARD_ISCT,CARD_STGB,';
  stSql := stSql + 'CARD_STAT,CARD_UPDT from VW_CARD_UMST ';
  if aDate <> '' then
  begin
    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3);
    stSql := stSql + ' Where CARD_UPDT > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND CARD_UPDT <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by CARD_UPDT ';
//  Memo1.Text := stSql;
  
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if JUNNAMConversionEmployee(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString) then
      begin
        if Not FindField('CARD_UPDT').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('CARD_UPDT').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        JunnamEventState(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString,
                               'sucess');
      end else
      begin
        JunnamEventState(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString,
                               'fail');
      end;
      Application.ProcessMessages;
      Next;
    end;
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;


function TfmMain.JUNNAMConversionEmployee(aGubun, aJijumCode, aEmCode,
  aEmCophone, aEmName, aDepartName, aCardSeq, aRegState, aEmState,
  aUpdateTime: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  if aGubun = '' then aGubun := '1';
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  if length(aEmCode) < 7 then
    aEmCode := FillZeroStrNum(aEmCode,7,True);
  stCardNo := aGubun[1] + aEmCode + FillZeroStrNum(aCardSeq,2);
  stCardNo := FillCharString(stCardNo,'*',16,False);
  stCompanyCode := '001';
  aJijumCode := FillZeroStrNum(aJijumCode,3);
  stDepartCode := GetDepartCode(stCompanyCode,aJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,aJijumCode,aDepartName,stDepartCode);
  end;

  bCardStateChange := False;
  stPosiCode := '000';
  stCardState := '2';
  if (aRegState = '01') and (aEmState = '01') then stCardState := '1';  //재직중이면서 정상 카드 인경우만 사용 가능

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    aJijumCode,
                    stDepartCode,
                    stPosiCode,
                    aEmCophone,
                    '20000101',
                    '99991231',
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    '001',
                    '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','전남대병원','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      aJijumCode,
                      stDepartCode,
                      stPosiCode,
                      aEmCophone,
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','전남대병원','',aDepartName,'');
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;
end;

procedure TfmMain.CommandArrayCommandsTJUNNAMStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bJUNNAMShowState := True
   else L_bJUNNAMShowState := False;
end;

procedure TfmMain.JunnamEventState(aGubun, aJijumCode, aEmCode, aEmCophone,
  aEmName, aDepartName, aCardSeq, aRegState, aEmState,
  aUpdateTime,aResult: string);
var
  fmJUNNAMCurrentState : TForm;
begin
  if L_bJUNNAMShowState then
  begin
    fmJUNNAMCurrentState := MDIForm('TfmJUNNAMCurrentState');
    if fmJUNNAMCurrentState <> nil then
    begin
      TfmJUNNAMCurrentState(fmJUNNAMCurrentState).JunnamEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult);
    end;
  end;
end;

function TfmMain.GetPIDfromExeName(name: String): Cardinal;
var
  hSnap : hwnd;
  Found : Boolean;
  pe : ProcessEntry32;
begin
  result := INVALID_HANDLE_VALUE;
  hSnap := CreateToolHelp32SnapShot(TH32CS_SNAPPROCESS,0);
  pe.dwSize := SizeOf(ProcessEntry32);
  Found := Process32First(hSnap,pe);
  while found do begin
   if pos(Uppercase(name),Uppercase(String(PChar(String(pe.szExeFile))))) > 0 then
      begin
        result := pe.th32ProcessID;
        CloseHandle(hSnap);
        exit;
      end;
   Found := Process32Next(hSnap,pe);
  end;
  CloseHandle(hSnap);
end;

procedure TfmMain.KillProcess(name: String);
var
  PID: Cardinal;
  Handle: THandle;
begin
  PID := GetPIDfromExeName(name);
  if PID <> INVALID_HANDLE_VALUE then
  begin
    Handle := OpenProcess(PROCESS_ALL_ACCESS,False,PID);
    TerminateProcess(Handle,0);
    CloseHandle(Handle);
  end;
end;

function TfmMain.CheckTB_DEVICECARDNO_CardPermit(aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ';

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
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_CARD_NewCard(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set CA_DOORGRADE = ''N'' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.KTBundangRelay(aDate: String): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select a.emp_user_id as em_code,a.emp_card_id as ca_cardno,a.emp_user_name as em_name,a.emp_department_2nd_code as co_jijumcode,a.emp_department_3rd_code as co_departcode,';
  stSql := stSql + 'a.emp_position_code as po_posicode,a.emp_issue_count,a.emp_use_period_start as em_startdate,a.emp_use_period_end as em_enddate,';
  stSql := stSql + 'b.dpt_department_2nd_name as co_jijumname,c.dpt_department_3rd_name as co_departname,d.pos_position_name as po_posiname,''ADD'' as workgubun,a.emp_issue_date ';
  stSql := stSql + ' from tbl_employee a ';
(*  stSql := stSql + ' left join tbl_department_1st b ';
  stSql := stSql + ' on(a.emp_department_1st_code = b.dpt_department_1st_code) ';
*)
  stSql := stSql + ' left join tbl_department_2nd b ';
  stSql := stSql + ' on(a.emp_department_1st_code = b.dpt_department_2nd_1st_code ';
  stSql := stSql + ' and a.emp_department_2nd_code = b.dpt_department_2nd_code) ';
  stSql := stSql + ' left join tbl_department_3rd c ';
  stSql := stSql + ' on(a.emp_department_1st_code = c.dpt_department_3rd_1st_code ';
  stSql := stSql + ' and a.emp_department_2nd_code = c.dpt_department_3rd_2nd_code ';
  stSql := stSql + ' and a.emp_department_3rd_code = c.dpt_department_3rd_code ) ';
  stSql := stSql + ' left join tbl_position d ';
  stSql := stSql + ' on(a.emp_position_code = d.pos_position_code) ';
  if aDate <> '' then
  begin
    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3)
    else stDate := stDate + '.' + '000';
    stSql := stSql + ' Where a.emp_issue_date > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND a.emp_issue_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by a.emp_issue_date ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if KTBundangConversionEmployee(FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString) then
      begin
        if Not FindField('emp_issue_date').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('emp_issue_date').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        KTBundangEventState(FindField('emp_issue_date').AsString,FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString,'sucess');
      end else
      begin
        KTBundangEventState(FindField('emp_issue_date').AsString,FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString,'fail');
      end;
      Application.ProcessMessages;
      Next;
    end;
    L_stLastRelayTime := stCurrentTime;
    dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

function TfmMain.KTBundangConversionEmployee(aEmCode, aCardNo, aEmName,
  aCardIssuCont,aStartDate, aEmEndDate, aJijumName, aDepartName, aPosiName,
  aWorkGubun: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  if length(aCardNo) < 9 then  Exit;  //카드번호가 9 자리가 아닌것은 연동하지 말자.
  stCardNo := aCardNo + FillZeroNumber(strtoint(aCardIssuCont),2);
  stCompanyCode := L_stCompanyCode;
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := GetPosiCode(stCompanyCode,aPosiName);
  if stPosiCode = '000' then
  begin
    if Trim(aPosiName) <> '' then
      CreatePosiCode(stCompanyCode,aPosiName,stPosiCode);
  end;

  bCardStateChange := False;
  stCardState := '1';  //무조건 정상으로 체크

  if dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then  //KT카드는 사번만 체크하자. 사번 존재시 아무 작업 하지 말자.
  begin
    if stCardState = '1' then Exit; //카드 상태가 정상이면 처리 하지 말자.
    //여기는 퇴직 데이터만 처리 하자.
    (*
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    stCompanyCode,
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    aEmCophone,
                    aStartDate,
                    aEmEndDate,
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    '001') then Exit;
    dmDBModule.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
    dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','전남대병원','',aDepartName,'');
    *)
    Exit;
  end else
  begin
    if stCardState <> '1' then Exit; //사원이 없는데 퇴직 한 사람이면 Insert 할필요 없다.
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      stCompanyCode,
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      aStartDate,
                      aEmEndDate,
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '002',
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','KT분당',aJijumName,aDepartName,'');
  end;

  if Not dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    //사번에 다른 카드가 있으면 권한복사
    if dmDBFunction.CheckTB_CARD_Employee('',aEmCode,stCardNo,stOldCodeNo) then  //회사코드는 체크하지 말자.
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      dmDBFunction.DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
      dmDBFunction.CopyGradeOldCard(stOldCodeNo,stCardNo); //여기서 권한을 복사
    end;
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,stCompanyCode) then Exit;
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;
end;

function TfmMain.GetPosiCode(aCompanyCode, aPosiName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_NAME = ''' + aPosiName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := FindField('PO_POSICODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.CreatePosiCode(aCompanyCode, aPosiName: string;
  var aPosiCode: string);
var
  nPosiCode : integer;
begin
  nPosiCode := GetMaxPosiCode(aCompanyCode);
  aPosiCode := FillZeroNumber(nPosiCode,3);
  InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName);
end;

function TfmMain.GetMaxPosiCode(aCompanyCode: string): integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(PO_POSICODE) as PO_POSICODE from TB_POSI ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      if isDigit(FindField('PO_POSICODE').AsString) then
      begin
        result := strtoint(FindField('PO_POSICODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_POSI(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_POSI(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' PO_POSICODE,';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMain.KTBundangEventState(aUpdateTime,aEmCode, aCardNo, aEmName,
  aCardIssuCount, aStartDate, aEndDate, aJijumName, aDepartName, aPosiName,
  aWorkGubun, aResult: string);
var
  fmKTBundangCurrentState : TForm;
begin
  if L_bKTBundangShowState then
  begin
    fmKTBundangCurrentState := MDIForm('TfmKTBundangCurrentState');
    if fmKTBundangCurrentState <> nil then
    begin
      TfmKTBundangCurrentState(fmKTBundangCurrentState).KTBundangEventState(aUpdateTime,aEmCode, aCardNo, aEmName,
        aCardIssuCount, aStartDate, aEndDate, aJijumName, aDepartName, aPosiName,  aWorkGubun, aResult);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTKTBundangStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bKTBundangShowState := True
   else L_bKTBundangShowState := False;

end;

function TfmMain.KTBundangDelRelay(aDate: String): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select dele_date,user_iden,card_iden,user_name,repl_date';
  stSql := stSql + ' from tabl_user_dele ';
  if aDate <> '' then
  begin
    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3)
    else stDate := stDate + '.' + '000';
    stSql := stSql + ' Where dele_date > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND dele_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by repl_date ';
  
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if KTBundangEmployeeCardStop(FormatDateTime('yyyymmdd',FindField('dele_date').AsDateTime),FindField('user_iden').AsString,
                               FindField('card_iden').AsString,FindField('user_name').AsString) then
      begin
        if Not FindField('repl_date').IsNull then
        begin
          Try
            L_stLastRelayDelTime := formatDateTime('yyyymmddhhnnsszzz',FindField('repl_date').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','DELTIME',L_stLastRelayDelTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        KTBundangEventState(FindField('dele_date').AsString,FindField('user_iden').AsString,FindField('card_iden').AsString,
                               FindField('user_name').AsString,'','','','','','','DELETE','sucess');
      end else
      begin
        KTBundangEventState(FindField('dele_date').AsString,FindField('user_iden').AsString,FindField('card_iden').AsString,
                               FindField('user_name').AsString,'','','','','','','DELETE','fail');
      end;
      Application.ProcessMessages;
      Next;
    end;
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmDelete ');
  end;
end;

function TfmMain.KTBundangEmployeeCardStop(aDelDate, aEmCode, aCardID,
  aUserName: string): Boolean;
var
  nFdmsID : integer;
  stWorkCode,stEndDate : string;
begin
  result := False;
  if Not dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then Exit;  //사원번호가 없으면 빠져 나가자.
  if Length(aDelDate) <> 8 then Exit; //
  UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate);  //퇴직일자 바꿔주자.
  UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode); //변경된 사번 정보에 해당하는 카드 재전송
  dmDBFunction.InsertIntoTB_EMPHIS(L_stCompanyCode,aEmCode,inttostr(nFdmsID),
                      '2',aCardID,'1',aUserName,
                      '','KT분당','','',''); //변경된 이력 저장

  result := True;
end;

function TfmMain.UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,
  aDelDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set EM_RETIREDATE = ''' + aDelDate + ''' ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNO_EmCodeReSend(
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  if G_stDBType = 'PG' then
  begin
    stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'' ';
    stSql := stSql + ' where TB_DEVICECARDNO.CA_CARDNO IN ( ';
    stSql := stSql + ' Select CA_CARDNO from TB_CARD ';
    stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''') '
  end else
  begin
    stSql := ' Update A set A.DE_RCVACK = ''N'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
    stSql := stSql + ' WHERE A.CA_CARDNO = B.CA_CARDNO ';
    stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';
  end;
  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmMain.N2Click(Sender: TObject);
begin
  inherited;
  fmQuery := TfmQuery.Create(nil);
  fmQuery.Show;
end;

function TfmMain.GetChosunRelay: Boolean;
var
  stSql : string;
begin
  result := False;

  stSql := ' Insert Into KTTeleCop( ';
  stSql := stSql + ' SCV_USRM_ID,   ';
  stSql := stSql + ' SCV_USRM_NM,   ';
  stSql := stSql + ' SCV_USRM_ST_TYPE,';
  stSql := stSql + ' SCV_USRM_OGNZT_NM,';
  stSql := stSql + ' SCV_USRM_OGNZT_CD,';
  stSql := stSql + ' SCV_USRM_SBJT_NM, ';
  stSql := stSql + ' SCV_USRM_SBJT_CD, ';
  stSql := stSql + ' SCV_USRM_GRAD_TP, ';
  stSql := stSql + ' SCV_USRM_STATUS_NM,';
  stSql := stSql + ' SCV_USRM_POSITION, ';
  stSql := stSql + ' SCV_USRM_RETIRE_DATE,';
  stSql := stSql + ' CP_ISSU_CNT,       ';
  stSql := stSql + ' CP_PRINTDATE,      ';
  stSql := stSql + ' InsertDate)        ';
  stSql := stSql + ' select             ';
  stSql := stSql + ' B.SCV_USRM_ID,     ';
  stSql := stSql + ' B.SCV_USRM_NM,     ';
  stSql := stSql + ' B.SCV_USRM_ST_TYPE, ';
  stSql := stSql + ' B.SCV_USRM_OGNZT_NM,';
  stSql := stSql + ' B.SCV_USRM_OGNZT_CD,';
  stSql := stSql + ' B.SCV_USRM_SBJT_NM, ';
  stSql := stSql + ' B.SCV_USRM_SBJT_CD, ';
  stSql := stSql + ' B.SCV_USRM_GRAD_TP, ';
  stSql := stSql + ' B.SCV_USRM_STATUS_NM,';
  stSql := stSql + ' B.SCV_USRM_POSITION, ';
  stSql := stSql + ' B.SCV_USRM_RETIRE_DATE,';
  stSql := stSql + ' B.CP_ISSU_CNT,        ';
  stSql := stSql + ' B.CP_PRINTDATE,       ';
  stSql := stSql + ' GetDate()             ';
  stSql := stSql + ' from [link_server].[KTTeleCop].[dbo].[KTTeleCop] B ';
  stSql := stSql + ' WHERE B.CP_ISSU_CNT IS NOT NULL                    ';
  stSql := stSql + ' AND NOT EXISTS                                     ';
  stSql := stSql + ' (select * from KTTeleCop A                         ';
  stSql := stSql + ' where A.SCV_USRM_ID =B.SCV_USRM_ID                 ';
//  stSql := stSql + ' AND A.CP_ISSU_CNT = B.CP_ISSU_CNT                  ';
  stSql := stSql + ' )                                                  ';

  with ADORelayExcut do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;

  stSql := ' Update A Set                                         ';
  stSql := stSql + ' A.SCV_USRM_ID = B.SCV_USRM_ID,               ';
  stSql := stSql + ' A.SCV_USRM_NM = B.SCV_USRM_NM,               ';
  stSql := stSql + ' A.SCV_USRM_ST_TYPE = B.SCV_USRM_ST_TYPE,     ';
  stSql := stSql + ' A.SCV_USRM_OGNZT_NM = B.SCV_USRM_OGNZT_NM,   ';
  stSql := stSql + ' A.SCV_USRM_OGNZT_CD = B.SCV_USRM_OGNZT_CD,   ';
  stSql := stSql + ' A.SCV_USRM_SBJT_NM = B.SCV_USRM_SBJT_NM,     ';
  stSql := stSql + ' A.SCV_USRM_SBJT_CD = B.SCV_USRM_SBJT_CD,     ';
  stSql := stSql + ' A.SCV_USRM_GRAD_TP = B.SCV_USRM_GRAD_TP,     ';
  stSql := stSql + ' A.SCV_USRM_STATUS_NM = B.SCV_USRM_STATUS_NM, ';
  stSql := stSql + ' A.SCV_USRM_POSITION = B.SCV_USRM_POSITION,   ';
  stSql := stSql + ' A.SCV_USRM_RETIRE_DATE = B.SCV_USRM_RETIRE_DATE,';
  stSql := stSql + ' A.CP_ISSU_CNT = B.CP_ISSU_CNT,               ';
  stSql := stSql + ' A.CP_PRINTDATE = B.CP_PRINTDATE,             ';
  stSql := stSql + ' A.InsertDate = GetDate()                     ';
  stSql := stSql + ' From KTTeleCop A,                            ';
  stSql := stSql + ' [link_server].[KTTeleCop].[dbo].[KTTeleCop] B ';
  stSql := stSql + ' where A.SCV_USRM_ID = B.SCV_USRM_ID           ';
  stSql := stSql + ' AND (A.SCV_USRM_STATUS_NM <> B.SCV_USRM_STATUS_NM ';
  stSql := stSql + ' OR A.CP_ISSU_CNT <> B.CP_ISSU_CNT ) ';

  with ADORelayExcut do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;


  stSql := ' Update A Set                                                       ';
  stSql := stSql + ' A.SCV_USRM_STATUS_NM = ''졸업'',                           ';
  stSql := stSql + ' A.InsertDate = GetDate()                                   ';
  stSql := stSql + ' From KTTeleCop A                                           ';
  stSql := stSql + ' where SCV_USRM_STATUS_NM <> ''졸업''                       ';
  stSql := stSql + ' AND NOT EXISTS                                             ';
  stSql := stSql + ' (select * from [link_server].[KTTeleCop].[dbo].[KTTeleCop] B ';
  stSql := stSql + '  where A.SCV_USRM_ID =B.SCV_USRM_ID)                       ';
  with ADORelayExcut do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;

  result := True;
end;

function TfmMain.ChosunRelay(aTime: string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select SCV_USRM_ID,SCV_USRM_NM,SCV_USRM_ST_TYPE,SCV_USRM_OGNZT_NM,';
  stSql := stSql + 'SCV_USRM_OGNZT_CD,SCV_USRM_SBJT_NM,SCV_USRM_SBJT_CD,SCV_USRM_GRAD_TP,';
  stSql := stSql + 'SCV_USRM_STATUS_NM,SCV_USRM_POSITION,SCV_USRM_RETIRE_DATE,CP_ISSU_CNT,CP_PRINTDATE,InsertDate from KTTeleCop ';
  if aTime <> '' then
  begin
    stDate := copy(aTime,1,4) + '-' + copy(aTime,5,2) + '-' + copy(aTime,7,2);
    stDate := stDate + ' ' + copy(aTime,9,2) + ':' + copy(aTime,11,2) + ':' + copy(aTime,13,2);
    if Length(aTime) > 15 then stDate := stDate + '.' + copy(aTime,15,3);
    stSql := stSql + ' Where InsertDate > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND InsertDate <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by InsertDate,CP_ISSU_CNT ';
//  Memo1.Text := stSql;
  
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if CHOSUNConversionEmployee(FindField('SCV_USRM_ID').AsString,FindField('SCV_USRM_NM').AsString,
                               FindField('SCV_USRM_ST_TYPE').AsString,FindField('SCV_USRM_OGNZT_NM').AsString,
                               FindField('SCV_USRM_SBJT_NM').AsString,FindField('SCV_USRM_STATUS_NM').AsString,
                               FindField('SCV_USRM_POSITION').AsString,FindField('SCV_USRM_RETIRE_DATE').AsString,
                               FindField('CP_ISSU_CNT').AsString) then
      begin
        if Not FindField('InsertDate').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('InsertDate').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        CHOSUNEventState(FindField('SCV_USRM_ID').AsString,FindField('SCV_USRM_NM').AsString,
                               FindField('SCV_USRM_ST_TYPE').AsString,FindField('SCV_USRM_OGNZT_NM').AsString,
                               FindField('SCV_USRM_SBJT_NM').AsString,FindField('SCV_USRM_STATUS_NM').AsString,
                               FindField('SCV_USRM_POSITION').AsString,FindField('SCV_USRM_RETIRE_DATE').AsString,
                               FindField('CP_ISSU_CNT').AsString,
                               'sucess');
      end else
      begin
        CHOSUNEventState(FindField('SCV_USRM_ID').AsString,FindField('SCV_USRM_NM').AsString,
                               FindField('SCV_USRM_ST_TYPE').AsString,FindField('SCV_USRM_OGNZT_NM').AsString,
                               FindField('SCV_USRM_SBJT_NM').AsString,FindField('SCV_USRM_STATUS_NM').AsString,
                               FindField('SCV_USRM_POSITION').AsString,FindField('SCV_USRM_RETIRE_DATE').AsString,
                               FindField('CP_ISSU_CNT').AsString,
                               'fail');
      end;
      Application.ProcessMessages;
      Next;
    end;
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

function TfmMain.CHOSUNConversionEmployee(aEmCode, aEmName, aPosiCode,
  aJijumName, aDepartName, aRegname, aCompanyPhone, aReTireDate,
  aCardSeq: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCardNo : string;
  stRgCode : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCardNo := FillCharString(aEmCode,'N',14,False) + FillZeroStrNum(Trim(aCardSeq),2);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := FillZeroStrNum(aPosiCode,3);
  bCardStateChange := False;
  stCardState := '1';
  stRgCode := '001';
  if (aRegname = '졸업') then
  begin
    stCardState := '3';  //휴직 또는 휴학 상태에서는 권한 삭제 하자.
    stRgCode := '003';
  end;
  if (aRegname = '휴직') or (aRegname = '휴학') then
  begin
    stRgCode := '002';
  end;

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    aCompanyPhone,
                    FormatDateTime('yyyymmdd',now),
                    '99991231',
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','조선대학교','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      aCompanyPhone,
                      FormatDateTime('yyyymmdd',now),
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      stRgCode,
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','조선대학교','',aDepartName,'');
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;
end;

procedure TfmMain.CHOSUNEventState(aEmCode, aEmName, aPosiCode, aJijumName,
  aDepartName, aRegname, aCompanyPhone, aReTireDate, aCardSeq,
  aResult: string);
var
  fmCHOSUNCurrentState : TForm;
begin
  if L_bCHOSUNShowState then
  begin
    fmCHOSUNCurrentState := MDIForm('TfmCHOSUNCurrentState');
    if fmCHOSUNCurrentState <> nil then
    begin
      TfmCHOSUNCurrentState(fmCHOSUNCurrentState).CHOSUNEventState(aEmCode,aEmName,aPosiCode,aJijumName,aDepartName,aRegname,aCompanyPhone,aReTireDate,aCardSeq,aResult);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTCHOSUNStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bCHOSUNShowState := True
   else L_bCHOSUNShowState := False;
end;

function TfmMain.KTBundangDelRelay1(aDate: String): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  nTotCount : integer;
  nCount : integer;
begin
  StatusBar1.Panels[2].Text := 'RelayDel' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +aDate;
  result := False;
  if Not dmAdoRelay.DBConnected1 then
  begin
    RelayAdoConnectCheckTimer1.Enabled := True;
    Exit;
  end;

  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected1 := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select dele_date,user_iden,card_iden,user_name,repl_date';
  stSql := stSql + ' from tabl_user_dele ';
  if aDate <> '' then
  begin
    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3)
    else stDate := stDate + '.' + '000';
    stSql := stSql + ' Where repl_date > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND repl_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by repl_date ';

  with RelayADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected1 := False;
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    nTotCount := recordCount;
    nCount := 0;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if KTBundangEmployeeCardStop1(FormatDateTime('yyyymmdd',FindField('dele_date').AsDateTime),FindField('user_iden').AsString,
                               FindField('card_iden').AsString,FindField('user_name').AsString) then
      begin
        if Not FindField('repl_date').IsNull then
        begin
          Try
            L_stLastRelayDelTime := formatDateTime('yyyymmddhhnnsszzz',FindField('repl_date').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','DELTIME',L_stLastRelayDelTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        KTBundangEventState(FindField('dele_date').AsString,FindField('user_iden').AsString,FindField('card_iden').AsString,
                               FindField('user_name').AsString,'','','','','','','DELETE','sucess');
      end else
      begin
        KTBundangEventState(FindField('dele_date').AsString,FindField('user_iden').AsString,FindField('card_iden').AsString,
                               FindField('user_name').AsString,'','','','','','','DELETE','fail');
        if Not FindField('repl_date').IsNull then
        begin
          L_stLastRelayDelTime := formatDateTime('yyyymmddhhnnsszzz',FindField('repl_date').AsDateTime);
          dmDBFunction.UpdateTB_CONFIG('EMPCONV','DELTIME',L_stLastRelayDelTime);
        end;
      end;
      inc(nCount);
      StatusBar1.Panels[2].Text := inttostr(nCount) + '/' + inttostr(nTotCount);
      Application.ProcessMessages;
      Next;
    end;
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmDelete ');
  end;
end;

function TfmMain.KTBundangRelay1(aDate: String): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  nTotCount : integer;
  nCount : integer;
begin
  StatusBar1.Panels[2].Text := 'RelayAdd' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +aDate;
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select a.emp_user_id as em_code,a.emp_card_id as ca_cardno,a.emp_user_name as em_name,a.emp_department_2nd_code as co_jijumcode,a.emp_department_3rd_code as co_departcode,';
  stSql := stSql + 'a.emp_position_code as po_posicode,a.emp_issue_count,a.emp_use_period_start as em_startdate,a.emp_use_period_end as em_enddate,';
  stSql := stSql + 'b.dpt_department_2nd_name as co_jijumname,c.dpt_department_3rd_name as co_departname,d.pos_position_name as po_posiname,''ADD'' as workgubun,a.emp_issue_date ';
  stSql := stSql + ' from tbl_employee a ';
(*  stSql := stSql + ' left join tbl_department_1st b ';
  stSql := stSql + ' on(a.emp_department_1st_code = b.dpt_department_1st_code) ';
*)
  stSql := stSql + ' left join tbl_department_2nd b ';
  stSql := stSql + ' on(a.emp_department_1st_code = b.dpt_department_2nd_1st_code ';
  stSql := stSql + ' and a.emp_department_2nd_code = b.dpt_department_2nd_code) ';
  stSql := stSql + ' left join tbl_department_3rd c ';
  stSql := stSql + ' on(a.emp_department_1st_code = c.dpt_department_3rd_1st_code ';
  stSql := stSql + ' and a.emp_department_2nd_code = c.dpt_department_3rd_2nd_code ';
  stSql := stSql + ' and a.emp_department_3rd_code = c.dpt_department_3rd_code ) ';
  stSql := stSql + ' left join tbl_position d ';
  stSql := stSql + ' on(a.emp_position_code = d.pos_position_code) ';
  if aDate <> '' then
  begin
(*    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3)
    else stDate := stDate + '.' + '000'; *)
    stSql := stSql + ' Where a.emp_issue_date > ''' + aDate + ''' ' ;
    stSql := stSql + ' AND a.emp_issue_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by a.emp_issue_date ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    nTotCount := recordCount;
    nCount := 0;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if KTBundangConversionEmployee1(FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString) then
      begin
        if Not FindField('emp_issue_date').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('emp_issue_date').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        KTBundangEventState(FindField('emp_issue_date').AsString,FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString,'sucess');
      end else
      begin
        KTBundangEventState(FindField('emp_issue_date').AsString,FindField('em_code').AsString,FindField('ca_cardno').AsString,
                               FindField('em_name').AsString,FindField('emp_issue_count').AsString,
                               FormatDateTime('yyyymmdd',FindField('em_startdate').AsDateTime),FormatDateTime('yyyymmdd',FindField('em_enddate').AsDateTime),FindField('co_jijumname').AsString,
                               FindField('co_departname').AsString,FindField('po_posiname').AsString,
                               FindField('workgubun').AsString,'fail');
      end;
      inc(nCount);
      StatusBar1.Panels[2].Text := inttostr(nCount) + '/' + inttostr(nTotCount);
      Application.ProcessMessages;
      Next;
    end;
    L_stLastRelayTime := stCurrentTime;
    dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

procedure TfmMain.RelayAdoConnectCheckTimer1Timer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'RelayAdoConnectCheckTimer1';
  RelayAdoConnectCheckTimer1.Enabled := False;
  if (L_stProgramType = '3') or (L_stProgramType = '5') then  //KT우면동 서초사옥
  begin
    if Not dmAdoRelay.AdoRelay1Connected(L_stDBType, L_stDBIP, L_stDBPort,
                      L_stDBUserID, L_stDBUserPW, 'sw_mast') then
    begin
      RelayAdoConnectCheckTimer1.Enabled := True;
      tbi.Hint := '사원정보 연동 시스템 실패';
    end else tbi.Hint := '사원정보 연동 시스템 정상';
  end else
  begin
  //세션 두개 연결 하는 경우 체크
  end;

end;

procedure TfmMain.RelayAdoConnected1(Sender: TObject;
  DBConnected: Boolean);
begin
  RelayAdoConnectCheckTimer1.Enabled := Not DBConnected;
end;

function TfmMain.KTBundangConversionEmployee1(aEmCode, aCardNo, aEmName,
  aCardIssuCont, aStartDate, aEmEndDate, aJijumName, aDepartName,
  aPosiName, aWorkGubun: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  if length(aCardNo) < 9 then  Exit;  //카드번호가 9 자리가 아닌것은 연동하지 말자.
  stCardNo := aCardNo + FillZeroNumber(strtoint(aCardIssuCont),2);
  stCompanyCode := '001';
  stJijumCode := '002';
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aJijumName);
  if stDepartCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aJijumName,stDepartCode);
  end;

  stPosiCode := GetPosiCode(stCompanyCode,aPosiName);
  if stPosiCode = '000' then
  begin
    if Trim(aPosiName) <> '' then
      CreatePosiCode(stCompanyCode,aPosiName,stPosiCode);
  end;

  stCardState := '1';  //무조건 정상으로 체크

  if dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then  //KT카드는 사번만 체크하자. 사번 존재시 아무 작업 하지 말자.
  begin
    //사원정보가 존재 하면 카드만 추가 하자...
    //if stCardState = '1' then Exit; //카드 상태가 정상이면 처리 하지 말자.
    //여기는 퇴직 데이터만 처리 하자.
    (*
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    stCompanyCode,
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    aEmCophone,
                    aStartDate,
                    aEmEndDate,
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    '001') then Exit;
    dmDBModule.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
    dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','전남대병원','',aDepartName,'');
    *)
    //Exit;
  end else
  begin
    if stCardState <> '1' then Exit; //사원이 없는데 퇴직 한 사람이면 Insert 할필요 없다.
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      stCompanyCode,
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      aStartDate,
                      aEmEndDate,
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '002',
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','KT분당',aJijumName,aDepartName,'');
  end;

  if Not dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    //사번에 다른 카드가 있으면 권한복사
    if dmDBFunction.CheckTB_CARD_Employee('',aEmCode,stCardNo,stOldCodeNo) then  //회사코드는 체크하지 말자.
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      dmDBFunction.DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
      dmDBFunction.CopyGradeOldCard(stOldCodeNo,stCardNo); //여기서 권한을 복사
    end;
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,stCompanyCode) then Exit;
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;
end;

function TfmMain.KTBundangEmployeeCardStop1(aDelDate, aEmCode, aCardID,
  aUserName: string): Boolean;
var
  nFdmsID : integer;
  stWorkCode,stEndDate : string;
begin
  result := False;
  if Not dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then Exit;  //사원번호가 없으면 빠져 나가자.
  if Length(aDelDate) <> 8 then Exit; //
  UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate);  //퇴직일자 바꿔주자.
  if aDelDate < formatDateTime('yyyymmdd',now) then
  begin
    UpdateTB_DEVICECARDNO_EmCodeCardStop(aEmCode);
  end else
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode); //변경된 사번 정보에 해당하는 카드 재전송
  end;
  dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',aCardID,'1',aUserName,
                      '','KT분당','','',''); //변경된 이력 저장

  result := True;
end;

function TfmMain.UpdateTB_DEVICECARDNO_EmCodeCardStop(
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  if G_stDBType = 'PG' then
  begin
    stSql := ' Update TB_DEVICECARDNO set DE_RCVACK = ''N'',DE_PERMIT=''N'' ';
    stSql := stSql + ' where TB_DEVICECARDNO.CA_CARDNO IN ( ';
    stSql := stSql + ' Select CA_CARDNO from TB_CARD ';
    stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''') '
  end else
  begin
    stSql := ' Update A set A.DE_RCVACK = ''N'',A.DE_PERMIT=''N'' ';
    stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
    stSql := stSql + ' WHERE A.CA_CARDNO = B.CA_CARDNO ';
    stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';
  end;
  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.SSANGYONGAT_Relay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select * From TB_ACCESSEVENT ';
  stSql := stSql + ' Where AC_RELAY is Null ';
  stSql := stSql + ' or AC_RELAY <> ''Y'' ';

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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if Insert_SSANGYONGAtEvent(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString) then
        begin
          stTempSql := ' Update TB_ACCESSEVENT set AC_RELAY = ''Y'' ';
          stTempSql := stTempSql + ' Where GROUP_CODE = ''' + FindField('GROUP_CODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_DATE = ''' + FindField('AC_DATE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_TIME = ''' + FindField('AC_TIME').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_NODENO = ' + FindField('AC_NODENO').AsString + ' ';
          stTempSql := stTempSql + ' AND AC_ECUID = ''' + FindField('AC_ECUID').AsString + ''' ';
          stTempSql := stTempSql + ' AND DO_DOORNO = ''' + FindField('DO_DOORNO').AsString + ''' ';
          stTempSql := stTempSql + ' AND CA_CARDNO = ''' + FindField('CA_CARDNO').AsString + ''' ';
          
          dmDBModule.ProcessExecSQL(stTempSql);
          SSANGYONGATEventState(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString,'sucess');
        end else
        begin
          SSANGYONGATEventState(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString,'fail');
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Insert_SSANGYONGAtEvent(aDate, aTime,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Length(aEmCode) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Length(aEmCode) > 8 then  //사번 8자리 이상인 경우는 연동 처리 하지 말고 빠지자...
  begin
    result := True;
    Exit;
  end;

  result := Check_SSANGYONGATEVENT(aDate,copy(aTime,1,4),aEmCode);
  if result then Exit;
  stSql := ' Insert Into IOSTATUSALL(INDATE,INTIME,ID) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + copy(aTime,1,4) + ''',';
  stSql := stSql + '''' + aEmCode + ''')';
  dmAdoRelay.ProcessExecSQL(stSql);

  result := Check_SSANGYONGATEVENT(aDate,copy(aTime,1,4),aEmCode);
end;

function TfmMain.Check_SSANGYONGATEVENT(aDate, aTime,
  aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select * From IOSTATUSALL ';
  stSql := stSql + ' Where INDATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND INTIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND ID = ''' + aEmCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CommandArrayCommandsTSSANGYONGSTATEExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bSSANGYONGShowState := True
   else L_bSSANGYONGShowState := False;

end;

procedure TfmMain.SSANGYONGATEventState(aDate, aTime, aEMCode,aResult: string);
var
  fmSSANGYONGCurrentState : TForm;
begin
  if L_bSSANGYONGShowState then
  begin
    fmSSANGYONGCurrentState := MDIForm('TfmSSANGYONGCurrentState');
    if fmSSANGYONGCurrentState <> nil then
    begin
      TfmSSANGYONGCurrentState(fmSSANGYONGCurrentState).SSANGYONGATEventState(aDate, aTime, aEMCode,aResult);
    end;
  end;
end;

function TfmMain.SSANGYONGEmployee_Relay(aDate:string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  nTotCount : integer;
  nCount : integer;
begin
  StatusBar1.Panels[2].Text := 'RelayAdd' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +aDate;
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  stSql := 'select sysdate - 0.0001 as curTime from dual ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := stCurrentTime + '000';
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := stCurrentTime + '000';
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := stCurrentTime + '000';
    End;
  end;
  //20130329084449256255
  stSql := ' Select * from EMPINFO ';
  if aDate <> '' then
  begin
    stSql := stSql + ' Where (INP_DDTM > ''' + aDate + ''' ' ;
    stSql := stSql + ' AND INP_DDTM <= ''' + stCurrentTime + ''') ' ; //현재 시간 보다 10초전
    stSql := stSql + ' OR (UPDT_DDTM > ''' + aDate + ''' ' ;
    stSql := stSql + ' AND UPDT_DDTM <= ''' + stCurrentTime + ''') ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by INP_DDTM,UPDT_DDTM ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    nTotCount := recordCount;
    nCount := 0;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if SSANGYONGConversionEmployee(FindField('EMPNO').AsString,FindField('EMP_NM').AsString,
                               FindField('UPP_ORG_NM').AsString,FindField('ORG_NM').AsString,
                               FindField('PSN_FG').AsString,
                               FindField('INP_DDTM').AsString,FindField('UPDT_DDTM').AsString) then
      begin
        Try
          if FindField('INP_DDTM').AsString > FindField('UPDT_DDTM').AsString then
          begin
            L_stLastRelayTime := FindField('INP_DDTM').AsString;
          end else
          begin
            L_stLastRelayTime := FindField('UPDT_DDTM').AsString;
          end;
          StatusBar1.Panels[2].Text := 'UpdateTB_CONFIG(1) - ' + L_stLastRelayTime ;
          dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
        Except
          LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
        End;
        SSANGYONGEmployeeEventState(FindField('EMPNO').AsString,FindField('EMP_NM').AsString,
                               FindField('UPP_ORG_NM').AsString,FindField('ORG_NM').AsString,
                               FindField('PSN_FG').AsString,
                               FindField('INP_DDTM').AsString,FindField('UPDT_DDTM').AsString,'sucess');
      end else
      begin
        SSANGYONGEmployeeEventState(FindField('EMPNO').AsString,FindField('EMP_NM').AsString,
                               FindField('UPP_ORG_NM').AsString,FindField('ORG_NM').AsString,
                               FindField('PSN_FG').AsString,
                               FindField('INP_DDTM').AsString,FindField('UPDT_DDTM').AsString,'fail');
      end;
      inc(nCount);
//      StatusBar1.Panels[2].Text := inttostr(nCount) + '/' + inttostr(nTotCount);
      Application.ProcessMessages;
      Next;
    end;
    L_stLastRelayTime := stCurrentTime;
    StatusBar1.Panels[2].Text := 'UpdateTB_CONFIG(2) - ' + L_stLastRelayTime ;
    dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

function TfmMain.SSANGYONGConversionEmployee(aEmCode, aEmName, aJijumName,
  aDepartName, aWorkCode, aInsertTime, aUpdateTime: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nFdmsID : integer;
  stWorkCode : string;
  stRgCode : string;
  stCardState : string;
  stCardNo : string;
  stOldCardNo : string;
  stPosiCode : string;
  stTemp,stEndDate : string;
begin
  result := False;
  stCardNo := '';
  if aJijumName = '' then aJijumName := '본사';
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := '';
  stCardState := '1';
  stWorkCode := '1';
  stRgCode := '';
  if (aWorkCode = '16')then
  begin
    stCardState := '3';  //휴직 상태에서는 권한 삭제 하자.
    stWorkCode := '2';
  end else if (aWorkCode = '99') then
  begin
    stCardState := '3';  //휴직 상태에서는 권한 삭제 하자.
    stWorkCode := '3';
  end;

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stTemp,stEndDate) then
  begin
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    '',
                    FormatDateTime('yyyymmdd',now),
                    '99991231',
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    stWorkCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','쌍용정보통신','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      FormatDateTime('yyyymmdd',now),
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      stRgCode,
                      stWorkCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','쌍용정보통신','',aDepartName,'');
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo) then
  begin
    if Not dmDBFunction.UpdateTB_CARD(stOldCardNo,'1',stCardState,aEmCode,'001') then Exit;
    if stWorkCode = '3' then  //퇴직
    begin
      dmDBFunction.UpdateTB_DEVICECARDNO_permit(stOldCardNo,'N');
    end else
    begin
      UpdateTB_DEVICECARDNORcvAck(stOldCardNo,'N'); //재직 구분 변경 된 경우 재전송
    end;  
  end;

  result := True;
end;

function TfmMain.UpdateTB_DEVICECARDNORcvAck(aCardNo,
  aRcvAck: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMain.SSANGYONGEmployeeEventState(aEmCode, aEmName, aJijumName,
  aDepartName, aWorkCode, aInsertTime, aUpdateTime, aResult: string);
var
  fmSSANGYONGCurrentState : TForm;
begin
  if L_bSSANGYONGShowState then
  begin
    fmSSANGYONGCurrentState := MDIForm('TfmSSANGYONGCurrentState');
    if fmSSANGYONGCurrentState <> nil then
    begin
      TfmSSANGYONGCurrentState(fmSSANGYONGCurrentState).SSANGYONGEmployeeEventState(aEmCode, aEmName, aJijumName,aDepartName, aWorkCode, aInsertTime, aUpdateTime, aResult);
    end;
  end;
end;

function TfmMain.YounSeUniversityRelay(aDate: string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  nTotCount : integer;
  nCount : integer;
  stOldCardNo : string;
begin
  if L_bRelayAction then Exit;
  Try
    L_bRelayAction := True;
    StatusBar1.Panels[2].Text := 'RelayAdd' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +aDate;
    result := False;
    if Not dmAdoRelay.DBConnected then
    begin
      RelayAdoConnectCheckTimer.Enabled := True;
      Exit;
    end;
    if Not dmDBModule.DBConnected then
    begin
      StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
      AdoConnectCheckTimer.Enabled := True;
      Exit;
    end;
    stSql := 'select sysdate - 0.0001 as curTime from dual ';
    with RelayADOQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmAdoRelay.DBConnected := False;
        Exit;
      End;
      Try
        if Not Findfield('curTime').IsNull then
        begin
          stCurrentTime := formatDateTime('yyyymmddhhnnss',(Findfield('curTime').AsDateTime) );
        end else
        begin
          stCurrentTime := formatDateTime('yyyymmddhhnnss',Now );
        end;
      Except
          LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
          stCurrentTime := formatDateTime('yyyymmddhhnnss',Now );
      End;
    end;
    //20130329084449256255
    stSql := ' Select * from ' + L_stDBName + '.VW_ENT_KT ';
    if aDate <> '' then
    begin
      stSql := stSql + ' Where UPDATE_DATE > ''' + aDate + ''' ' ;
      stSql := stSql + ' AND UPDATE_DATE <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
    end;
    stSql := stSql + ' order by UPDATE_DATE ';

  //  memo1.Text := stSql;
  
    with RelayADOQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmAdoRelay.DBConnected := False;
        Exit;
      End;
      result := True;
      if recordCount < 1 then Exit;
      nTotCount := recordCount;
      nCount := 0;
      Try
        while Not Eof do
        begin
          if G_bApplicationTerminate then Exit;
          if YounSeUniversityEmployee(FindField('CAMP_TEXT').AsString,
                                   FindField('DEPT_TEXT').AsString,
                                   FindField('USER_TYPE_TEXT').AsString,
                                   FindField('USER_NAME').AsString,
                                   FindField('USER_CODE').AsString,
                                   FindField('USER_TEL').AsString,
                                   FindField('ISSUE_NUM').AsString,
                                   FindField('CARD_CSN').AsString,
                                   FindField('STATE_CODE').AsString,
                                   FindField('CARD_TYPE').AsString,
                                   FindField('um_state_text').AsString,
                                   stOldCardNo
                                   ) then
          begin
            YounSeUniversityEmployeeEventState(FindField('CAMP_TEXT').AsString,
                                   FindField('DEPT_TEXT').AsString,
                                   FindField('USER_TYPE_TEXT').AsString,
                                   FindField('USER_NAME').AsString,
                                   FindField('USER_CODE').AsString,
                                   FindField('USER_TEL').AsString,
                                   FindField('ISSUE_NUM').AsString,
                                   FindField('CARD_CSN').AsString,
                                   FindField('STATE_CODE').AsString,
                                   FindField('CARD_TYPE').AsString,
                                   stOldCardNo,'sucess');
          end else
          begin
            YounSeUniversityEmployeeEventState(FindField('CAMP_TEXT').AsString,
                                   FindField('DEPT_TEXT').AsString,
                                   FindField('USER_TYPE_TEXT').AsString,
                                   FindField('USER_NAME').AsString,
                                   FindField('USER_CODE').AsString,
                                   FindField('USER_TEL').AsString,
                                   FindField('ISSUE_NUM').AsString,
                                   FindField('CARD_CSN').AsString,
                                   FindField('STATE_CODE').AsString,
                                   FindField('CARD_TYPE').AsString,
                                   stOldCardNo,'fail');
          end;
          if dmDBModule.DBConnected = False then Exit; //로컬 서버의 세션이 끊어 진 경우 그냥 빠져 나가자...
          Try
            if FindField('UPDATE_DATE').AsString <> '' then
            begin
              stCurrentTime := FindField('UPDATE_DATE').AsString;
              if L_stLastRelayTime <>  stCurrentTime then
              begin
                L_stLastRelayTime := stCurrentTime;
                dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
              end;
            end;
            StatusBar1.Panels[2].Text := 'UpdateTB_CONFIG(1) - ' + L_stLastRelayTime + '(' + inttostr(nCount) + '/' + inttostr(nTotCount)+ ')';
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
          inc(nCount);
    //      StatusBar1.Panels[2].Text := inttostr(nCount) + '/' + inttostr(nTotCount);
          Application.ProcessMessages;
          Next;
        end;
      Except
        Exit;
      End;
      if L_stLastRelayTime <>  stCurrentTime then
      begin
        L_stLastRelayTime := stCurrentTime;
        dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
      end;
      StatusBar1.Panels[2].Text := 'UpdateTB_CONFIG(2) - ' + L_stLastRelayTime + '(' + inttostr(nCount) + '/' + inttostr(nTotCount)+ ')' ;
    end;
  Finally
    L_bRelayAction := False;
  End;
end;

function TfmMain.YounSeUniversityEmployee(aJijumName, aDepartName,
  aEmployeeGubun, aEmName, aEmCode, aTelNum, aIssuNum, aCardNo, aCardState,
  aCardType,aStateText: string;var aOldCardNo:string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nFdmsID : integer;
  stRgCode : string;
  stCardState : string;
  stCardNo : string;
  stOldCardNo : string;
  stPosiCode : string;
  stCardGubun : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
  stTemp : string;
  bPermitChange : Boolean;
begin
  result := False;
  aOldCardNo := '';
  stCardNo := '';
  if aJijumName = '' then aJijumName := '연세대학교';
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := '000';
  stPosiCode := GetPosiCode(stCompanyCode,aEmployeeGubun);
  if stPosiCode = '000' then
  begin
    if Trim(aEmployeeGubun) <> '' then
      CreatePosiCode(stCompanyCode,aEmployeeGubun,stPosiCode);
  end;
  stCardState := '1';
  stRgCode := '000';
  bCardStateChange := False;

  stCardNo := Trim(aCardNo);

  stWorkCode := '1';
  if (aStateText='졸업') or (aStateText='퇴직') then stWorkCode := '3'
  //else if (aStateText='휴학') or (aStateText='휴직') then stWorkCode := '2'
  else if (aStateText='연구수료') then stWorkCode := '4';

//  memo1.Lines.Add('CARD=' + stCardNo + 'Length=' + inttostr(Length(stCardNo)));
  stCardGubun := '1';
  if (aCardType = 'P') or (aCardType = 'C') then //플라스틱 카드이면
  begin
    if Length(stCardNo) = 8 then
    begin
      stCardNo := FillCharString(stCardNo,'*',16);
    end else if isDigit(stCardNo) then
    begin
      stCardNo := Dec2Hex64(strtoint64(stCardNo),8);
      stCardNo := FillCharString(stCardNo,'*',16);
    end else
    begin
      stCardNo := '';
      //Exit;
    end;
    stCardGubun := '1';
  end else if aCardType = 'M' then
  begin
    if Length(stCardNo) <> 20 then //Exit; //모바일 카드가 아니다...
    begin
      stCardNo := '';
    end else
    begin
      stCardNo := copy(stCardNo,5,16);
      stCardGubun := '2';
    end;
  end else
  begin
    //정체 불명 카드
    stCardNo := '';
    //Exit;
  end;

  if (aCardState = '01')then
  begin
    stCardState := '1';  //정상
  end else if (aCardState = '02') then
  begin
    stCardState := '2';  //분실
  end else if (aCardState = '03') then
  begin
    stCardState := '3';  //정지
  end;
  if stWorkCode <> '1' then stCardState := '3';   //stWorkCode 가 정상이 아니면 카드 정지 하자.

//  memo1.Lines.Add('CARD=' + stCardNo);
  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stTemp,stEndDate) then
  begin
    if stWorkCode <> stTemp then bPermitChange := True;   //학적 상태가 변경이 일어 났으면 권한 재전송
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    '',
                    FormatDateTime('yyyymmdd',now),
                    '99991231',
                    '',
                    '',
                    '',
                    '',
                    aTelNum,
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    stWorkCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','연세대',aJijumName,aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      FormatDateTime('yyyymmdd',now),
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      aTelNum,
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      stRgCode,
                      stWorkCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '1',stCardNo,stCardState,aEmName,
                      '','연세대',aJijumName,aDepartName,'');
  end;
//  memo1.Lines.Add('TEST2');
  if stCardNo <> '' then
  begin
    //학번에 다른 카드가 있으면 기존 카드 정지 후
    if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo,True) then   //등록된 카드를 찾는다.
    begin
      if (stOldCardNo <> '') and (stCardNo <> stOldCardNo) then
      begin
        aOldCardNo := stOldCardNo;
        //같은 사번으로 다른 카드가 있는 경우
        //기존카드 권한을 똑같이 옮김
        dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
      end;
    end else if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo,False) then //분실,정지된 카드를 찾는다.
    begin
      if stCardNo <> stOldCardNo then
      begin
        aOldCardNo := stOldCardNo;
        //같은 사번으로 정지된 카드가 있는 경우
        //정지된 카드 권한을 똑같이 옮김
        dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
      end;
    end;
    if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
    begin
      if stCardState <> stOldCardState then bCardStateChange := True;
      if Not dmDBFunction.UpdateTB_CARD(stCardNo,stCardGubun,stCardState,aEmCode,'001') then Exit;
    end else
    begin
      if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,stCardGubun,stCardState,aEmCode,'001') then Exit;
    end;

    if bCardStateChange then  //카드상태 변경 된 경우
    begin
      //dmDBModule.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
      UpdateTB_DEVICECARDNORcvAck(stCardNo,'N');  //카드 재전송만 하고 권한은 그냥 살려 두자...
    end;

    if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
    begin
      UpdateTB_CARD_NewCard(stCardNo);
    end;
  end;
  if bPermitChange then
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode);  //카드 재전송만 하고 권한은 그냥 살려 두자...
  end;

  result := True;
end;

procedure TfmMain.YounSeUniversityEmployeeEventState(aJijumName,
  aDepartName, aEmployeeGubun, aEmName, aEmCode, aTelNum, aIssuNum,
  aCardNo, aCardState, aCardType,aOldCardNo, aResult: string);
var
  fmYounseUniversityCurrentState : TForm;
begin
  if L_bYounseEventShowState then
  begin
    fmYounseUniversityCurrentState := MDIForm('TfmYounseUniversityCurrentState');
    if fmYounseUniversityCurrentState <> nil then
    begin
      TfmYounseUniversityCurrentState(fmYounseUniversityCurrentState).YounSeUniversityEmployeeEventState(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aOldCardNo,aResult);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTYONSESTATEExecute(Command: TCommand;
  Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bYounseEventShowState := True
   else L_bYounseEventShowState := False;

end;

function TfmMain.HizeAirAttendRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select a.*,b.EM_NAME,e.LO_NAME as CO_JIJUMNAME,b.CO_DEPARTCODE,d.CO_NAME as CO_DEPARTNAME From TB_ATLISTEVENT a ';
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = b.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join (select * from TB_COMPANY where CO_GUBUN = ''3'' ) d ';
  stSql := stSql + ' ON( b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = d.CO_DEPARTCODE) ';
  stSql := stSql + ' Left Join (select * from TB_ACCESSDEVICE  ) c ';
  stSql := stSql + ' ON(a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ) ';
  stSql := stSql + ' Left Join (select * from TB_LOCATION where LO_GUBUN = ''0'' ) e ';
  stSql := stSql + ' ON( c.LO_DONGCODE = e.LO_DONGCODE) ';
  stSql := stSql + ' Where a.AT_RELAY is Null ';
  stSql := stSql + ' or a.AT_RELAY <> ''Y'' ';
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';

  if L_bRelayDB then Exit;
  L_bRelayDB := True;

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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if Insert_HizeAirAtEvent(Findfield('AT_ATTYPE').AsString,Findfield('EM_CODE').AsString,Findfield('AT_DATE').AsString,
           Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('CO_JIJUMNAME').AsString,
           Findfield('CO_DEPARTCODE').AsString,Findfield('CO_DEPARTNAME').AsString,Findfield('EM_NAME').AsString) then
        begin
          stTempSql := ' Update TB_ATLISTEVENT set AT_RELAY = ''Y'' ';
          stTempSql := stTempSql + ' Where GROUP_CODE = ''' + FindField('GROUP_CODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_DATE = ''' + FindField('AC_DATE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_TIME = ''' + FindField('AC_TIME').AsString + ''' ';
          stTempSql := stTempSql + ' AND CO_COMPANYCODE = ''' + FindField('CO_COMPANYCODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND EM_CODE = ''' + FindField('EM_CODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_NODENO = ' + FindField('AC_NODENO').AsString + ' ';
          stTempSql := stTempSql + ' AND AC_ECUID = ''' + FindField('AC_ECUID').AsString + ''' ';
          stTempSql := stTempSql + ' AND AT_ATCODE = ''' + FindField('AT_ATCODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AT_ATTYPE = ''' + FindField('AT_ATTYPE').AsString + ''' ';

          dmDBModule.ProcessExecSQL(stTempSql);
          HizeAirATEventState(Findfield('AT_ATTYPE').AsString,Findfield('EM_CODE').AsString,Findfield('AT_DATE').AsString,
           Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('CO_JIJUMNAME').AsString,
           Findfield('CO_DEPARTCODE').AsString,Findfield('CO_DEPARTNAME').AsString,Findfield('EM_NAME').AsString,'sucess');
        end else
        begin
          HizeAirATEventState(Findfield('AT_ATTYPE').AsString,Findfield('EM_CODE').AsString,Findfield('AT_DATE').AsString,
           Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('CO_JIJUMNAME').AsString,
           Findfield('CO_DEPARTCODE').AsString,Findfield('CO_DEPARTNAME').AsString,Findfield('EM_NAME').AsString,'fail');
        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Insert_HizeAirAtEvent(aATTYPE, aEMCODE, aATDATE, aACDATE,
  aACTIME, aJIJUMNAME, aDEPARTCODE, aDEPARTNAME, aEMNAME: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Length(aEmCode) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Length(aATTYPE) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Length(aATDATE) = 0 then
  begin
    result := True;
    Exit;
  end;

  result := Check_HizeAirAtEVENT_Key(aATTYPE, aEMCODE, aATDATE);
  if not result then
  begin
    stSql := ' Insert Into KT_WORK(';
    stSql := stSql + ' REGDATE,';
    stSql := stSql + ' WORKTYPE,';
    stSql := stSql + ' EMPNO,';
    stSql := stSql + ' WORKDT,';
    stSql := stSql + ' REGDT,';
    stSql := stSql + ' REGTM,';
    stSql := stSql + ' AREANAME,';
    stSql := stSql + ' DEPTCODE,';
    stSql := stSql + ' DEPT,';
    stSql := stSql + ' USERNAME) ';
    stSql := stSql + ' Values(';
    stSql := stSql + 'Getdate(),' ;
    stSql := stSql + '''' + aATTYPE + ''',';
    stSql := stSql + '''' + aEMCODE + ''',';
    stSql := stSql + '''' + aATDATE + ''',';
    stSql := stSql + '''' + aACDATE + ''',';
    stSql := stSql + '''' + aACTIME + ''',';
    stSql := stSql + '''' + aJIJUMNAME + ''',';
    stSql := stSql + '''' + aDEPARTCODE + ''',';
    stSql := stSql + '''' + aDEPARTNAME + ''',';
    stSql := stSql + '''' + aEMNAME + ''')';
    dmAdoRelay.ProcessExecSQL(stSql);
  end else
  begin
    if aATTYPE = '1' then Exit; //출근이면 그냥 빠져 나가자.
    stSql := ' Update KT_WORK set ';
    stSql := stSql + ' REGDATE = Getdate(), ';
    stSql := stSql + ' REGDT = ''' + aACDATE + ''',';
    stSql := stSql + ' REGTM = ''' + aACTIME + ''',';
    stSql := stSql + ' AREANAME = ''' + aJIJUMNAME + ''',';
    stSql := stSql + ' DEPTCODE = ''' + aDEPARTCODE + ''',';
    stSql := stSql + ' DEPT = ''' + aDEPARTNAME + ''',';
    stSql := stSql + ' USERNAME = ''' + aEMNAME + ''' ';
    stSql := stSql + ' where WORKTYPE = ''' + aATTYPE + ''' ';
    stSql := stSql + ' AND EMPNO = ''' + aEMCODE + ''' ';
    stSql := stSql + ' AND WORKDT = ''' + aATDATE + ''' ';

    dmAdoRelay.ProcessExecSQL(stSql);
  end;

  result := Check_HizeAirAtEVENT_Time(aATTYPE, aEMCODE, aATDATE,aACTIME);
end;

function TfmMain.Check_HizeAirAtEVENT_Key(aATTYPE, aEMCODE,
  aATDATE: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select * From KT_WORK ';
  stSql := stSql + ' Where WORKTYPE = ''' + aATTYPE + ''' ';
  stSql := stSql + ' AND EMPNO = ''' + aEMCODE + ''' ';
  stSql := stSql + ' AND WORKDT = ''' + aATDATE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Check_HizeAirAtEVENT_Time(aATTYPE, aEMCODE, aATDATE,
  aACTIME: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select * From KT_WORK ';
  stSql := stSql + ' Where WORKTYPE = ''' + aATTYPE + ''' ';
  stSql := stSql + ' AND EMPNO = ''' + aEMCODE + ''' ';
  stSql := stSql + ' AND WORKDT = ''' + aATDATE + ''' ';
  stSql := stSql + ' AND REGTM = ''' + aACTIME + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.HizeAirATEventState(aATTYPE, aEMCODE, aATDATE, aACDATE,
  aACTIME, aJIJUMNAME, aDEPARTCODE, aDEPARTNAME, aEMNAME, aResult: string);
var
  fmHizeAirCurrentState : TForm;
begin
  if L_bHizeAirEventShowState then
  begin
    fmHizeAirCurrentState := MDIForm('TfmHizeAirCurrentState');
    if fmHizeAirCurrentState <> nil then
    begin
      TfmHizeAirCurrentState(fmHizeAirCurrentState).HizeAirATEventState(aATTYPE, aEMCODE, aATDATE, aACDATE,aACTIME, aJIJUMNAME, aDEPARTCODE, aDEPARTNAME, aEMNAME, aResult);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTHizeStateExecute(Command: TCommand;
  Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bHizeAirEventShowState := True
   else L_bHizeAirEventShowState := False; 
end;

function TfmMain.SeoulUniversityEmployeeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  stSql :=  'select a.LOG_SEQ,';
  stSql := stSql + ' e.DEPT_KOR_NM as JIJUMNAME, b.DEPT_KOR_NM as DEPARTNAME,a.PERS_NO as USER_CODE, ';
  stSql := stSql + ' a.PERS_KOR_NM as USER_NAME,a.HANDP_NO as USER_TEL,a.EMAIL,a.ADDR,a.DETA_ADDR, ';
  stSql := stSql + ' a.RETI_DT,a.HOOF_ST_FG,c.KOR_NM as EMPLOYEESTATE,';
  stSql := stSql + ' a.CAMP_FG,d.KOR_NM as CAMPUSNAME,a.USER_FG,f.KOR_NM as EMPLOYEEGUBUN ';
  stSql := stSql + ' from BSNS031_LOG a ';
  stSql := stSql + ' left join BSNS100_LOG b ';
  stSql := stSql + ' on(a.POSI_DEPT_CD = b.DEPT_CD) ';
  stSql := stSql + ' left join BSNS011_LOG c ';
  stSql := stSql + ' on(a.HOOF_ST_FG = c.CMMN_CD) ';
  stSql := stSql + ' left join BSNS011_LOG d ';
  stSql := stSql + ' on(a.CAMP_FG = d.CMMN_CD) ';
  stSql := stSql + ' left join BSNS100_LOG e ';
  stSql := stSql + ' on(a.POSI_BREU_CD = e.DEPT_CD) ';
  stSql := stSql + ' left join BSNS011_LOG f ';
  stSql := stSql + ' on(a.USER_FG = f.CMMN_CD) ';
  stSql := stSql + ' where a.DATA_CONN_ST_CD = ''N'' ';
  stSql := stSql + ' or a.DATA_CONN_ST_CD = ''P'' ';

  if L_bRelayDB then Exit;
  L_bRelayDB := True;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if SeoulUniversityEmployee(FindField('JIJUMNAME').AsString,
                                 FindField('DEPARTNAME').AsString,
                                 FindField('EMPLOYEEGUBUN').AsString,
                                 FindField('USER_NAME').AsString,
                                 FindField('USER_CODE').AsString,
                                 FindField('USER_TEL').AsString,
                                 FindField('EMAIL').AsString,
                                 FindField('ADDR').AsString,
                                 FindField('DETA_ADDR').AsString,
                                 FindField('RETI_DT').AsString,
                                 FindField('EMPLOYEESTATE').AsString,
                                 FindField('CAMPUSNAME').AsString
                                 ) then
        begin
          SeoulUniversityEmployeeEventState(FindField('JIJUMNAME').AsString,
                                 FindField('DEPARTNAME').AsString,
                                 FindField('EMPLOYEEGUBUN').AsString,
                                 FindField('USER_NAME').AsString,
                                 FindField('USER_CODE').AsString,
                                 FindField('USER_TEL').AsString,
                                 FindField('EMAIL').AsString,
                                 FindField('ADDR').AsString,
                                 FindField('DETA_ADDR').AsString,
                                 FindField('RETI_DT').AsString,
                                 FindField('EMPLOYEESTATE').AsString,'sucess');
        end else
        begin
          SeoulUniversityEmployeeEventState(FindField('JIJUMNAME').AsString,
                                 FindField('DEPARTNAME').AsString,
                                 FindField('EMPLOYEEGUBUN').AsString,
                                 FindField('USER_NAME').AsString,
                                 FindField('USER_CODE').AsString,
                                 FindField('USER_TEL').AsString,
                                 FindField('EMAIL').AsString,
                                 FindField('ADDR').AsString,
                                 FindField('DETA_ADDR').AsString,
                                 FindField('RETI_DT').AsString,
                                 FindField('EMPLOYEESTATE').AsString,'fail');
        end;

        UpdateBSNS031_LOG_Field_String(FindField('LOG_SEQ').AsString,'DATA_CONN_ST_CD','S');    
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateBSNS031_LOG_Field_String(aSEQ, aFieldName,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update BSNS031_LOG set ' + aFieldName + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where LOG_SEQ = ' + aSeq + ' ';
  result := dmAdoRelay.ProcessExecSQL(stSql);
end;

function TfmMain.SeoulUniversityEmployee(aJijumName, aDepartName,
  aEmployeeGubun, aEmName, aEmCode, aTelNum, aEmail, aAddr1, aAddr2,
  aEndDate,aEmployeeState,aCampusName: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  nFdmsID : integer;
  stRgCode : string;
  stPosiCode : string;
  stEmStateCode : string;
  stWorkCode,stEndDate : string;
  bPermitChange : Boolean;
begin
  result := False;
  bPermitChange := False;
  if aJijumName = '' then aJijumName := '서울대학교';
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := '000';
  stPosiCode := GetPosiCode(stCompanyCode,aEmployeeGubun);
  if stPosiCode = '000' then
  begin
    if Trim(aEmployeeGubun) <> '' then
      CreatePosiCode(stCompanyCode,aEmployeeGubun,stPosiCode);
  end;

  stRgCode := '000';
  stRgCode := GetRelayCode(aCampusName);
  if stRgCode = '000' then
  begin
    if Trim(aCampusName) <> '' then
      CreateRelayCode(aCampusName,stRgCode);
  end;
  stEmStateCode := GetSeoulUniversityEmStateCode(aEmployeeState);

  if aEndDate = '' then aEndDate := '99991231';
  if length(aAddr1) > 50 then aAddr1 := copy(aAddr1,1,50);
  if length(aAddr2) > 50 then aAddr2 := copy(aAddr2,1,50);

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if stWorkCode <> stEmStateCode then bPermitChange := True;   //학적 상태가 변경이 일어 났으면 권한 재전송
    if stEndDate <> aEndDate then bPermitChange := True;         //퇴직일자가 변경이 일어났으면 권한 재전송

    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    '',
                    FormatDateTime('yyyymmdd',now),
                    aEndDate,
                    '',
                    aAddr1,
                    aAddr2,
                    '',
                    aTelNum,
                    '',
                    '',
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    stEmStateCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2','','',aEmName,
                      '','서울대',aJijumName,aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      FormatDateTime('yyyymmdd',now),
                      aEndDate,
                      '',
                      aAddr1,
                      aAddr2,
                      '',
                      aTelNum,
                      '',
                      '',
                      '',
                      inttostr(nFdmsID),
                      stRgCode,
                      stEmStateCode) then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '1','','',aEmName,
                      '','서울대',aJijumName,aDepartName,'');
  end;

  if bPermitChange then
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode);  //카드 재전송만 하고 권한은 그냥 살려 두자...
  end;

  result := True;
end;

function TfmMain.GetRelayCode(aRelayName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := '000';
  stSql := ' select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where RG_NAME = ''' + aRelayName + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      result := FindField('RG_CODE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CreateRelayCode(aCampusName: string;
  var aRgCode: string);
var
  nRgCode : integer;
begin
  nRgCode := GetMaxRelayCode;
  aRgCode := FillZeroNumber(nRgCode,3);
  InsertIntoTB_RELAYGUBUN(aRgCode,aCampusName);
end;

function TfmMain.GetMaxRelayCode: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := ' Select Max(RG_CODE) as RG_CODE from TB_RELAYGUBUN ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
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
      if recordCount < 1 then Exit;
      if isDigit(FindField('RG_CODE').AsString) then
      begin
        result := strtoint(FindField('RG_CODE').AsString) + 1;
      end else
      begin
        result := 1;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_RELAYGUBUN(aRgCode,
  aCampusName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYGUBUN(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RG_CODE,';
  stSql := stSql + ' RG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aRgCode + ''',';
  stSql := stSql + '''' + aCampusName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.GetSeoulUniversityEmStateCode(
  aEmployeeState: string): string;
begin
  result := '1';
  if (aEmployeeState = '수료')
     or (aEmployeeState = '퇴직')
     or (aEmployeeState = '졸업')
     or (aEmployeeState = '제적') then result := '2';
end;

procedure TfmMain.SeoulUniversityEmployeeEventState(aJijumName,
  aDepartName, aEmployeeGubun, aEmName, aEmCode, aTelNum, aIssuNum,
  aCardNo, aCardState, aCardType, aOldCardNo, aResult: string);
var
  fmYounseUniversityCurrentState : TForm;
begin
  if L_bYounseEventShowState then
  begin
    fmYounseUniversityCurrentState := MDIForm('TfmYounseUniversityCurrentState');
    if fmYounseUniversityCurrentState <> nil then
    begin
      TfmYounseUniversityCurrentState(fmYounseUniversityCurrentState).YounSeUniversityEmployeeEventState(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aOldCardNo,aResult);
    end;
  end;
end;

function TfmMain.SeoulHumanitiesEmployeeRelay(
  aLastRelayTime: string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected1 then
  begin
    if Not dmAdoRelay.AdoRelay1Connected(L_stDBType2, L_stDBIP2, L_stDBPort2,
                      L_stDBUserID2, L_stDBUserPW2, L_stDBName2) then
    begin
      Exit;
    end;
  end;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected1 := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := 'select * from tbl_master_user ';
  if aLastRelayTime <> '' then
  begin
    stDate := copy(aLastRelayTime,1,4) + '-' + copy(aLastRelayTime,5,2) + '-' + copy(aLastRelayTime,7,2);
    stDate := stDate + ' ' + copy(aLastRelayTime,9,2) + ':' + copy(aLastRelayTime,11,2) + ':' + copy(aLastRelayTime,13,2);
    if Length(aLastRelayTime) > 15 then stDate := aLastRelayTime + '.' + copy(aLastRelayTime,15,3)
    else stDate := stDate + '.' + '000';
    stSql := stSql + ' Where inpu_date > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND inpu_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by inpu_date ';

  with RelayADOQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if G_bApplicationTerminate then Exit;
      if SeoulHumanitiesConversionEmployee(FindField('card_iden').AsString,FindField('user_name').AsString) then
      begin
        if Not FindField('inpu_date').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('inpu_date').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
      end else
      begin
      end;
      Application.ProcessMessages;
      Next;
    end;
    L_stLastRelayTime := stCurrentTime;
    dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

function TfmMain.SeoulHumanitiesConversionEmployee(aCardNo,
  aUserName: string): Boolean;
var
  stEmCode : string;
  stCardNo : string;
  stCardState : string;
begin
  result := True;
  if Length(aCardNo) <> 10 then Exit;
  if aCardNo = '0000000000' then Exit;
  if Not GetSeoulHumanitiesEmCode(aUserName,stEmCode) then Exit;
  stCardNo := Dec2Hex64(strtoint64(aCardNo),8);
  stCardNo := copy(stCardNo,7,2) + copy(stCardNo,5,2) + copy(stCardNo,3,2) + copy(stCardNo,1,2);
  stCardNo := FillCharString(stCardNo,'*',16);
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stCardState) = 1 then
  begin
    if stCardState <> '1' then dmDBFunction.UpdateTB_CARD(stCardNo,'1','1',stEmCode,'001');
  end else
  begin
    dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1','1',stEmCode,'001');
  end;
end;

function TfmMain.GetSeoulHumanitiesEmCode(aUserName: string;
  var aEmCode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_JIJUMCODE = ''013'' ';
  stSql := stSql + ' AND EM_NAME = ''' + aUserName + ''' ';

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
      if RecordCount <> 1 then Exit;
      result := True;
      aEmCode := FindField('EM_CODE').AsString;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.STXChangWonAttendRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;

  stSql := 'select a.*,b.DO_DOORNONAME From TB_ATLISTEVENT a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON ( a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Where (a.AT_RELAY is Null ';
  stSql := stSql + ' or a.AT_RELAY <> ''Y'') ';
  stSql := stSql + ' AND a.AT_ATTYPE = ''1'' ';
  stSql := stSql + ' order by a.AC_DATE,a.AC_TIME ';

  if L_bRelayDB then Exit;
  L_bRelayDB := True;

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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin

        if Insert_STXChangWonAtEvent(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString,
           Findfield('AC_NODENO').AsString,Findfield('AC_ECUID').AsString,Findfield('DO_DOORNO').AsString,Findfield('DO_DOORNONAME').AsString) then
        begin
          stTempSql := ' Update TB_ATLISTEVENT set AT_RELAY = ''Y'' ';
          stTempSql := stTempSql + ' Where GROUP_CODE = ''' + FindField('GROUP_CODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_DATE = ''' + FindField('AC_DATE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_TIME = ''' + FindField('AC_TIME').AsString + ''' ';
          stTempSql := stTempSql + ' AND CO_COMPANYCODE = ''' + FindField('CO_COMPANYCODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND EM_CODE = ''' + FindField('EM_CODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AC_NODENO = ' + FindField('AC_NODENO').AsString + ' ';
          stTempSql := stTempSql + ' AND AC_ECUID = ''' + FindField('AC_ECUID').AsString + ''' ';
          stTempSql := stTempSql + ' AND AT_ATCODE = ''' + FindField('AT_ATCODE').AsString + ''' ';
          stTempSql := stTempSql + ' AND AT_ATTYPE = ''' + FindField('AT_ATTYPE').AsString + ''' ';

          dmDBModule.ProcessExecSQL(stTempSql);
          STXChangWonAtState(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString,
           Findfield('AC_NODENO').AsString,Findfield('AC_ECUID').AsString,Findfield('DO_DOORNO').AsString,Findfield('DO_DOORNONAME').AsString,'sucess');
        end else
        begin
           STXChangWonAtState(Findfield('AC_DATE').AsString,Findfield('AC_TIME').AsString,Findfield('EM_CODE').AsString,
           Findfield('AC_NODENO').AsString,Findfield('AC_ECUID').AsString,Findfield('DO_DOORNO').AsString,Findfield('DO_DOORNONAME').AsString,'fail');
        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.Insert_STXChangWonAtEvent(aDate, aTime, aEmCode, aNodeNo,
  aEcuID, aDoorNo, aDoorName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Length(aEmCode) = 0 then
  begin
    LogSave(G_stExeFolder + '\..\log\STX' + FormatDateTime('yyyymmdd',now) +'.log','Length(aEmCode) = 0'+ aEmCode);
    result := True;
    Exit;
  end;

  if aTime < '040000' then  //04시 이후 출근 데이터만 넘겨 주자.
  begin
    LogSave(G_stExeFolder + '\..\log\STX' + FormatDateTime('yyyymmdd',now) +'.log','aTime < 040000'+ aTime);
    result := True;
    Exit;
  end;

  if ByteType(aEmCode, 1) <> mbSingleByte then   //한글로 시작하는 경우 연동 하지 말자.
  begin
    LogSave(G_stExeFolder + '\..\log\STX' + FormatDateTime('yyyymmdd',now) +'.log','ByteType(aEmCode, 1) <> mbSingleByte'+ aEmCode);
    result := True;
    Exit;
  end;

  stSql := ' Insert Into STXGENAFF.stx_osp_employe_g_itf(ATTENDANCE_DATE,USER_NUM,TERMINAL_NO,TERMINAL_NAME,CREATION_DATE,CREATED_BY) ';
  stSql := stSql + ' Values(';
  stSql := stSql + 'to_date(''' + aDate + aTime + ''',''yyyymmddhh24miss''),';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + aDoorNo + ''',';
  stSql := stSql + '''' + aDoorName + ''',';
  stSql := stSql + 'SYSDATE,';
  stSql := stSql + '''KT'')';
  dmAdoRelay.ProcessExecSQL(stSql);

  result := Check_STXChangwonATEVENT(aDate,aTime,aEmCode);
end;

function TfmMain.STXChangWonAtState(aDate, aTime, aEmCode, aNodeNo, aEcuID,
  aDoorNo, aDoorName, aResult: string): Boolean;
var
  fmSTXChangWonCurrentState : TForm;
begin
  if L_bHizeAirEventShowState then
  begin
    fmSTXChangWonCurrentState := MDIForm('TfmSTXChangWonCurrentState');
    if fmSTXChangWonCurrentState <> nil then
    begin
      TfmSTXChangWonCurrentState(fmSTXChangWonCurrentState).STXChangWonEventState(aDate, aTime, aEmCode, aNodeNo, aEcuID,aDoorNo, aDoorName, aResult);
    end;
  end;

end;

function TfmMain.Check_STXChangwonATEVENT(aDate, aTime,
  aEmcode: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select * From STXGENAFF.stx_osp_employe_g_itf ';
  stSql := stSql + ' Where ATTENDANCE_DATE = to_date(''' + aDate + aTime + ''',''yyyymmddhh24miss'') ';
  stSql := stSql + ' AND USER_NUM = ''' + aEmcode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      if recordcount < 1 then Exit;
      //LogSave(G_stExeFolder + '\..\log\STX' + FormatDateTime('yyyymmdd',now) +'.log',stSql);
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.mn_GradGroupClick(Sender: TObject);
begin
  inherited;
  fmGroupCode := TfmGroupCode.Create(nil);
  fmGroupCode.ShowModal;
  fmGroupCode.Free;

end;

procedure TfmMain.mn_GroupGradeClick(Sender: TObject);
begin
  inherited;
  fmGroupGrade := TfmGroupGrade.Create(nil);
  fmGroupGrade.ShowModal;
  fmGroupGrade.Free;

end;

procedure TfmMain.mn_GroupMappingClick(Sender: TObject);
begin
  inherited;
  fmMapping := TfmMapping.Create(nil);
  fmMapping.ShowModal;
  fmMapping.Free;
  MAPTYPE := GetMappingType;
  LoadMappingCode;
end;

function TfmMain.GetMappingType: string;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := '1';
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''RELAY'' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''EMMAPCODE'' ';

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
      if recordCount < 1 then Exit;
      result := FindField('CO_CONFIGVALUE').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_CONFIG(aGroup, aCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''' + aGroup + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCode + ''' ';

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
      if recordCount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.InsertIntoTB_CONFIG(aGroup, aCode,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_CONFIGGROUP,';
  stSql := stSql + ' CO_CONFIGCODE,';
  stSql := stSql + ' CO_CONFIGVALUE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGroup + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aValue + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.LoadMappingCode: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  MappingCode1List.Clear;
  MappingCode2List.Clear;

  stSql := 'select * from TB_EMMAPPING ';
  stSql := stSql + ' Where MP_TYPE = ''' + MAPTYPE + ''' ';

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
      if recordCount < 1 then Exit;

      While Not Eof do
      begin
        MappingCode1List.Add(FindField('MP_CODE').AsString);
        MappingCode2List.Add(FindField('DG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.RealTimerTimer(Sender: TObject);
begin
  inherited;
//  실시간 동기화 하자.
//
  if G_bApplicationTerminate then Exit;
  RealTimer.Enabled := False;
  Try
    if L_stProgramType = '2' then JNRealTimeRelay
    else if L_stProgramType = '13' then YeosuRealTimeRelay;
  Finally
    RealTimer.Enabled := Not G_bApplicationTerminate;
  End;

end;

function TfmMain.JNRealTimeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if L_bJNGetHospitalInfoStart then Exit;

  dmAdoRelay.AdoRelay1Connected(L_stDBType2, L_stDBIP2, L_stDBPort2,
                    L_stDBUserID2, L_stDBUserPW2, L_stDBName2);
  result := False;
  if Not dmAdoRelay.DBConnected1 then Exit;
  L_bJNRealTimeStart:=True;
  stSql := 'select * from pmiaccesv ';
  if L_stDBType2 <> '1' then
  begin
    stSql := stSql + ' where accestat != ''X'' ';
    stSql := stSql + ' and ( (acceaddt  between to_char(to_date(sysdate-1),''yyyymmdd'') and to_char(to_date(sysdate),''yyyymmdd'')) ';
    stSql := stSql + '  or (accedsdt between to_char(to_date(sysdate-1),''yyyymmdd'') and to_char(to_date(sysdate),''yyyymmdd'')) ) ';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection1;
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
      ServerSender('SUCESS');   //연동할 데이터가 없어도 성공한 것이다.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        JNpatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString);

        Application.ProcessMessages;
        Next;
      end;
    End;
  Finally
    L_bJNRealTimeStart:=False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;


end;

procedure TfmMain.ControlSocketPortWsConnect(Sender: TObject);
begin
  inherited;
  ControlSocketConnected := True;
  ServerRecvTime := now;
end;

procedure TfmMain.SetFControlSocketConnected(const Value: Boolean);
begin
  if FControlSocketConnected = Value then Exit;
  FControlSocketConnected := Value;
end;

procedure TfmMain.ControlSocketPortWsDisconnect(Sender: TObject);
begin
  inherited;
  ControlSocketConnected := False;
end;

procedure TfmMain.ControlSocketPortWsError(Sender: TObject;
  ErrCode: Integer);
begin
  inherited;
  ControlSocketConnected := False;
end;

procedure TfmMain.ControlSocketPortTriggerAvail(CP: TObject; Count: Word);
var
  stTemp : string;
  i : integer;
begin
  stTemp:= '';
  ControlSocketConnected := True;
  Try
    for i := 1 to Count do stTemp := stTemp + ControlSocketPort.GetChar;
  Except
    Exit;
  End;
  if stTemp <> '' then
  begin
    ServerRecvTime := now;
  end;
end;

procedure TfmMain.SocketConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if Not ControlSocketConnected then
  begin
    ControlSocketPort.WsAddress := L_stServerIP;
    ControlSocketPort.WsPort := L_stServerPort;
    ControlSocketPort.Open := True;
  end else if ServerRecvTime + (1 /(24*60)) < now then  //수신 시간이 1분을 넘어가면 소켓을 클로즈 후 재 접속
  begin
    ControlSocketPort.Open := False;
    ControlSocketConnected := False;
  end;
end;

function TfmMain.ServerSender(aSendData: string): Boolean;
begin
  SendServerList.Add(aSendData);
  if Not SendServerTimer.Enabled then SendServerTimer.Enabled := True;
end;

procedure TfmMain.SendServerTimerTimer(Sender: TObject);
var
  stSendData : string;
begin
  inherited;
  if G_bApplicationTerminate then Exit;
  if Not ControlSocketConnected then Exit;
  if SendServerList.Count < 1 then Exit;
  stSendData := SendServerList.Strings[0]+ETX;
  SendServerList.Delete(0);
  ControlSocketPort.PutString(stSendData);
end;

function TfmMain.JNpatientRelay(aCode, aInDate, aOutDate,
  aState: string;aLogFile:Boolean=False): Boolean;
var
  nIndex : integer;
  oPatient : TPatientInfo;
  stState : string;
begin
  //aCode : 사번
  //aInDate : 입원일자
  //aOutDate : 퇴원일자
  //aState : C:재원중 D:퇴원중
  stState := aState;
  if aOutDate > formatDateTime('yyyymmdd',now-1) then stState := 'C'; //오늘 퇴원한 사람은 강제로 등록으로 처리 하자.
  if stState = 'E' then stState := 'C'; //가퇴원환자도 입원환자로 본다.

  nIndex := PatientList.IndexOf(aCode);
  if nIndex < 0 then
  begin
    oPatient := TPatientInfo.Create(nil);
    oPatient.PatientNo := aCode;
    oPatient.HospitalizeDate := aInDate;
    oPatient.LeaveDate := aOutDate;
    oPatient.OnStateChange := PatientStateChange;
    PatientList.AddObject(aCode,oPatient);
  end;
  nIndex := PatientList.IndexOf(aCode);
  if nIndex > -1 then
  begin
    if aOutDate < TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
    begin
      //어제 퇴원 후 오늘 입원 한사람, 어제 퇴원으로 권한이 삭제 된 후에 오늘 다시 입원으로 다시 등록이 반복된다.
      Exit; //만약 퇴원일자가 입원일자보다 더 빠른 경우가 있는 처리 건은 퇴원 처리 할 필요가 없다.
    end;
    TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate := aInDate;
    TPatientInfo(PatientList.Objects[nIndex]).LeaveDate := aOutDate;
    if(stState = 'D') then
    begin
      if TPatientInfo(PatientList.Objects[nIndex]).LeaveDate >= TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
      begin
        //퇴원일자가 입원일자보다 작은 경우만 퇴원 처리하자. ==> 이부분이 문제가 됨
        //이걸 퇴원일자가 입원일자 보다 큰 경우 퇴원 처리로 변경 처리함.
        TPatientInfo(PatientList.Objects[nIndex]).State := stState;
      end else
      begin
        if aLogFile then LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',aCode + ' StateChange');
        TPatientInfo(PatientList.Objects[nIndex]).State := 'C';
      end;
    end
    else TPatientInfo(PatientList.Objects[nIndex]).State := stState; //상태값 변경 처리 하자.

  end;
end;

procedure TfmMain.PatientStateChange(Sender: TObject; aPatientNo,
  aHospitalizeDate, aLeaveDate, aState: string);
var
  stCardNo,stCardState : string;
  nIndex,nTempIndex : integer;
  stGradeGroupCode : string;
begin
//상태값이 바뀌면 이곳으로 온다.
//1.사번이 등록되어 있는지 체크 하여 사원정보 입력
//2.권한부분등록및 삭제 //aState 에 따라서...

  stCardNo := MakeCardNo(aPatientNo,'0');
  
  if (aState='C') then
  begin
    if dmDBFunction.CheckTB_EMPLOYEE_EmCode(aPatientNo) = 0 then
    begin
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE_Value(aPatientNo, aPatientNo, L_stCompanyCode, L_stJijumCode, '000', L_stPosiCode, '',
        aHospitalizeDate, '99991231', '', '', '', '', '','0', '001', 'N', '0', 'N', 'N', 'N', 'N', '1111111', 'N','1') then
      begin
        nTempIndex := PatientList.IndexOf(aPatientNo);   //입력 실패이면 다시 입력 하도록 설정
        if( nTempIndex > -1) then
        begin
          PatientList.Delete(nTempIndex);
        end;
        Exit;
      end;
    end;
    if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stCardState) = 0 then
    begin
      if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo, '1','1', aPatientNo, L_stCompanyCode) then
      begin
        nTempIndex := PatientList.IndexOf(aPatientNo);   //입력 실패이면 다시 입력 하도록 설정
        if( nTempIndex > -1) then
        begin
          PatientList.Delete(nTempIndex);
        end;
        Exit;
      end;
    end else if stCardState = '0' then
    begin
      dmDBFunction.UpdateTB_CARD_Field_StringValue(stCardNo,'CA_CARDTYPE','1');
    end;
    nIndex := MappingCode1List.IndexOf(L_stCompanyCode + L_stPosiCode);
    stGradeGroupCode := '';
    if nIndex > -1 then
    begin
      stGradeGroupCode := MappingCode2List.Strings[nIndex];
    end;
    if stGradeGroupCode <> '' then  //여기서 그룹 권한 복사 하자...
    begin
      dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);
      dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);
      dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');
    end;       
  end else if(aState = 'D') then
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_Permit(stCardNO,'N'); //모든 카드 권한을 삭제 처리함
    dmDBFunction.DeleteTB_EMPLOYEE_Key(L_stCompanyCode,aPatientNo);
    dmDBFunction.DeleteTB_CARD_Key(stCardNo);
  end;
  JunnamEventState('0','',aPatientNo,aHospitalizeDate,aLeaveDate,aState,'','','',FormatDateTime('yyyymmddhhnnss',now),'sucess');


end;

procedure TfmMain.mn_GetHospitalClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  while L_bJNRealTimeStart do
  begin
    Delay(10);
    Application.ProcessMessages;
  end;

  dmAdoRelay.AdoRelay1Connected(L_stDBType2, L_stDBIP2, L_stDBPort2,
                    L_stDBUserID2, L_stDBUserPW2, L_stDBName2);
  if Not dmAdoRelay.DBConnected1 then Exit;

  L_bJNGetHospitalInfoStart := True;

  stSql := 'select * from pmiaccesv ';
  if L_stDBType2 <> '1' then
  begin
    stSql := stSql + ' where accestat = ''C'' or accestat = ''E'' ';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection1;
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
      ServerSender('SUCESS');   //연동할 데이터가 없어도 성공한 것이다.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        JNpatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString);

//        Application.ProcessMessages; => 이것을 추가 하면 RealTimer 에서 메시지를 캡쳐해 가서 그 다음 진행이 안됨...
        Next;
      end;
    End;
  Finally
    L_bJNGetHospitalInfoStart:=False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  
end;

function TfmMain.DongYangUniversityRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;

  stSql := 'SELECT a.*,b.B_NUMBER,b.R_NUMBER,b.SINBUN_GB,b.REGDATE,b.TOESA_FG,b.TOESA_IL FROM v_hagjeog_gb a ';
  stSql := stSql + ' left Join v_gisugsa b ';
  stSql := stSql + ' ON ( a.HAGBEON = b.S_NUMBER)  ';
  stSql := stSql + ' Where a.campus_gb=1 ';

  if L_bRelayDB then Exit;
  L_bRelayDB := True;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if DongYangUniversityEmployee(FindField('B_NUMBER').AsString,  //72기숙사3(여학생1),74기숙사4(여학생2),73기숙사1(남학생1),71기숙사2(남학생2)
                                 FindField('HAGBEON').AsString,      //학번
                                 FindField('IREUM').AsString,          //이름
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBER호실  HAGGWA_NAME(학과명)
                                 FindField('SINBUN_GB').AsString,     //신분구분(1:학부생, 2:대학원생, 3:교직원, 9:기타))
                                 FindField('REGDATE').AsString,       //등록일
                                 FindField('TOESA_FG').AsString,      //퇴사여부(1:퇴사)
                                 FindField('TOESA_IL').AsString,      //퇴사일자
                                 FindField('HAGJEOG_GB').AsString,     //학적구분(1:재학생, 2:휴학생, 3:제적생, 4:졸업생)
                                 FindField('CARD_SU').AsString         //카드 발급 차수
                                 ) then
        begin
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',now);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
            DongYangUniversityEmployeeEventState(FindField('B_NUMBER').AsString,  //72기숙사3(여학생1),74기숙사4(여학생2),73기숙사1(남학생1),71기숙사2(남학생2)
                                 FindField('HAGBEON').AsString,      //학번
                                 FindField('IREUM').AsString,          //이름
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBER호실  HAGGWA_NAME(학과명)
                                 FindField('SINBUN_GB').AsString,     //신분구분(1:학부생, 2:대학원생, 3:교직원, 9:기타))
                                 FindField('REGDATE').AsString,       //등록일
                                 FindField('TOESA_FG').AsString,      //퇴사여부(1:퇴사)
                                 FindField('TOESA_IL').AsString,      //퇴사일자
                                 FindField('HAGJEOG_GB').AsString,     //학적구분(1:재학생, 2:휴학생, 3:제적생, 4:졸업생)
                                 FindField('CARD_SU').AsString,'sucess');

        end else
        begin
            DongYangUniversityEmployeeEventState(FindField('B_NUMBER').AsString,  //72기숙사3(여학생1),74기숙사4(여학생2),73기숙사1(남학생1),71기숙사2(남학생2)
                                 FindField('HAGBEON').AsString,      //학번
                                 FindField('IREUM').AsString,          //이름
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBER호실  HAGGWA_NAME(학과명)
                                 FindField('SINBUN_GB').AsString,     //신분구분(1:학부생, 2:대학원생, 3:교직원, 9:기타))
                                 FindField('REGDATE').AsString,       //등록일
                                 FindField('TOESA_FG').AsString,      //퇴사여부(1:퇴사)
                                 FindField('TOESA_IL').AsString,      //퇴사일자
                                 FindField('HAGJEOG_GB').AsString,     //학적구분(1:재학생, 2:휴학생, 3:제적생, 4:졸업생)
                                 FindField('CARD_SU').AsString,'fail');
        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.DongYangUniversityEmployee(aJijumCode, aEmCode, aEmName,
  aRoomNumber, aPosiCode, aRegDate, atoesagb, atoesadate, ahagjuggb,
  acardseq: string): Boolean;
var
  stCompanyCode : string;
  stDepartCode : string;
  stCardNo : string;
  stOldCardNo : string;
  stCardState : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  nFdmsID : integer;
begin
(*
aJijumCode,  //72기숙사3(여학생1),74기숙사4(여학생2),73기숙사1(남학생1),71기숙사2(남학생2)
aEmCode,      //학번
aEmName,          //이름
aRoomNumber,      //호실
aPosiCode,     //신분구분(1:학부생, 2:대학원생, 3:교직원, 9:기타))
aRegDate,       //등록일
atoesagb,      //퇴사여부(1:퇴사)
atoesadate,      //퇴사일자
ahagjuggb,     //학적구분(1:재학생, 2:휴학생, 3:제적생, 4:졸업생)
acardseq       //카드발급차수 
*)
  bCardStateChange := False;
  stCompanyCode := '001';
  stDepartCode := '001'; //001 학생증
  if aJijumCode = '71' then  aJijumCode := '002'  //남학생2
  else if aJijumCode = '72' then  aJijumCode := '006' //여학생1
  else if aJijumCode = '73' then  aJijumCode := '001' //남학생1
  else if aJijumCode = '74' then  aJijumCode := '007' //여학생2
  else aJijumCode := '009'; //기타
  stCardNo:= MakeCardNo(aEmCode,acardseq);
  stCardState := '1';
  if ahagjuggb <> '1' then stCardState := '3';
  if atoesagb = '1' then stCardState := '3';

  if Trim(aPosiCode) = '학부생' then aPosiCode := '001'
  else if Trim(aPosiCode) = '대학원생' then aPosiCode := '002'
  else if Trim(aPosiCode) = '교직원' then aPosiCode := '003'
  else if Trim(aPosiCode) = '기타' then aPosiCode := '009'
  else aPosiCode := '000';
  
  if Not isDate(copy(aRegDate,1,4) + '-' + copy(aRegDate,5,2) + '-' + copy(aRegDate,7,2) ) then aRegDate := '20000101';
  if Not isDate(copy(atoesadate,1,4) + '-' + copy(atoesadate,5,2) + '-' + copy(atoesadate,7,2) ) then atoesadate := '99991231';

  if (stCardState = '1') then
  begin
    if dmDBFunction.CheckTB_EMPLOYEE_CoEmCode(stCompanyCode,aEmCode) = 1 then
    begin
      if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                      aEmName,
                      stCompanyCode,
                      aJijumCode,
                      stDepartCode,
                      aPosiCode,
                      aRoomNumber,
                      aRegDate,
                      atoesadate,
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      '',
                      '',
                      '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,'',
                        '2',stCardNo,stCardState,aEmName,
                        '','동양대학교','','','');
    end else
    begin
      nFdmsID := strtoint(GetFdmsID);
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                        aEmName,
                        stCompanyCode,
                        aJijumCode,
                        stDepartCode,
                        aPosiCode,
                        aRoomNumber,
                        aRegDate,
                        atoesadate,
                        '',
                        '',
                        '',
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001',
                        '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aEmName,
                          '','동양대학교','','','');
    end;

    //학번에 다른 카드가 있으면 기존 카드 정지 후
    if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCardNo) then
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
    end;
  
    if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState)= 1 then
    begin
      if stCardState <> stOldCardState then bCardStateChange := True;
      if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,stCompanyCode) then Exit;
    end else
    begin
      if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
    end;
  end else
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
    dmDBFunction.DeleteTB_EMPLOYEE_Key(stCompanyCode,aEmCode);
    dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,'','3',stCardNo,stCardState,aEmName,
                          '','동양대학교','연동삭제','','');
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;

end;

function TfmMain.DongYangUniversityEmployeeEventState(aJijumCode, aEmCode,
  aEmName, aRoomNumber, aPosiCode, aRegDate, atoesagb, atoesadate,
  ahagjuggb, acardseq, aResult: string): Boolean;
var
  fmDongyangUniversityCurrentState : TForm;
begin
  if L_bYounseEventShowState then
  begin
    fmDongyangUniversityCurrentState := MDIForm('TfmDongyangUniversityCurrentState');
    if fmDongyangUniversityCurrentState <> nil then
    begin
      TfmDongyangUniversityCurrentState(fmDongyangUniversityCurrentState).DongYangUniversityEmployeeEventState(aJijumCode, aEmCode,
  aEmName, aRoomNumber, aPosiCode, aRegDate, atoesagb, atoesadate,ahagjuggb, acardseq, aResult);
    end;
  end;

end;

procedure TfmMain.mn_DeleteHospitalClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  while L_bJNRealTimeStart do
  begin
    Delay(10);
    Application.ProcessMessages;
  end;

  dmAdoRelay.AdoRelay1Connected(L_stDBType2, L_stDBIP2, L_stDBPort2,
                    L_stDBUserID2, L_stDBUserPW2, L_stDBName2);
  if Not dmAdoRelay.DBConnected1 then Exit;

  L_bJNGetHospitalInfoStart := True;

  stSql := 'select * from pmiaccesv ';
  stSql := stSql + ' where accestat = ''D''';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection1;
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
      ServerSender('SUCESS');   //연동할 데이터가 없어도 성공한 것이다.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        //LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',FindField('ACCEIDNO').AsString + ',' + FindField('ACCEDSDT').AsString + ',' + FindField('ACCESTAT').AsString);
        JNpatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString,True);

        ServerSender('SUCESS');   //연동할 데이터가 없어도 성공한 것이다.
        Application.ProcessMessages; //=> 이것을 추가 하면 RealTimer 에서 메시지를 캡쳐해 가서 그 다음 진행이 안됨...
        Next;
      end;
    End;
  Finally
    L_bJNGetHospitalInfoStart:=False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.AjuUniversityDormitoryRelay(aCount: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTempSql : string;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then
  begin
    RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;

  stSql := ' Select * from CARD.MFC_HUB_DORMITORY ';
  if aCount > 0 then stSql := stSql + ' Where RowNum <= ' + inttostr(aCount);
  stSql := stSql + ' order by HUB_SEQNO ';

  if L_bRelayDB then Exit;
  L_bRelayDB := True;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
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
      result := True;
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        if AjuDormitoryConversionEmployee(FindField('HUB_BDNM').AsString,FindField('HUB_ROOM').AsString,
                                 FindField('HUB_GENDER').AsString,FindField('HUB_STATES').AsString,
                                 FindField('HUB_IDNO').AsString,FindField('HUB_NAME').AsString,FindField('HUB_ISFG').AsString,
                                 FindField('HUB_LSFG').AsString,FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString) then
        begin
          Delete_MFC_HUB_DORMITORY(FindField('HUB_SEQNO').AsInteger);
        end;

        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    L_bRelayDB := False;
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.AjuDormitoryConversionEmployee(aJijumName, aCophone,
  aPosiName, aInOutState, aEmCode, aEmName, aCardSeq, aType, aAddr1,
  aAddr2: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;

begin
(*FindField('HUB_BDNM').AsString,FindField('HUB_ROOM').AsString,
                                 FindField('HUB_GENDER').AsString,FindField('HUB_STATES').AsString,
                                 FindField('HUB_IDNO').AsString,FindField('HUB_NAME').AsString,FindField('HUB_ISFG').AsString,
                                 FindField('HUB_LSFG').AsString,FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString
                                 *)
  result := False;
  // aType : //0:정상,1:분실
  // aPosiName : //남자(001),여자(002)
  //aCophone : 호실
  //aInOutState : 0.입사,1.퇴사,2.신청,3.선발,4.등록,5.대기,6.미등록,7.가등록
  //aAddr1 : 단과대명, aAddr2 : 학과명
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  stCompanyCode := '001';
  stJijumCode := GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := '000';


  stPosiCode := GetPosiCode(stCompanyCode,aPosiName); ;
  if stPosiCode = '000' then
  begin
    if Trim(aPosiName) <> '' then
      CreatePosiCode(stCompanyCode,aPosiName,stPosiCode);
  end;

  bCardStateChange := False;
  stCardState := '2';
  if aType = '0' then stCardState := '1';  //aType이 0 인경우만 정상

  if length(aEmCode) < 9 then
    aEmCode := FillZeroStrNum(aEmCode,9,True);

  stCardNo := MakeCardNo(aEmCode,aCardSeq);

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if ((aInOutState = '0') or (aInOutState = '4')) then
    begin
      if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                      aEmName,
                      stCompanyCode,
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      aCophone,
                      FormatDateTime('yyyymmdd',now),
                      '99991231',
                      '',
                      aAddr1,
                      aAddr2,
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aEmName,
                        '','아주대기숙사',aJijumName,aCophone,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aEmName,
                        '','아주대기숙사',aJijumName,aCophone,'');
      result := True;
      Exit;
    end;
  end else
  begin
    if ((aInOutState = '0') or (aInOutState = '4')) then
    begin
      nFdmsID := strtoint(GetFdmsID);
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                        aEmName,
                        stCompanyCode,
                        stJijumCode,
                        stDepartCode,
                        stPosiCode,
                        aCophone,
                        FormatDateTime('yyyymmdd',now),
                        '99991231',
                        '',
                        aAddr1,
                        aAddr2,
                        '',
                        '',
                        stCardState,
                        stCardNo,
                        '',
                        inttostr(nFdmsID),
                        '001',
                        '') then Exit;
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aEmName,
                          '','아주대기숙사',aJijumName,aCophone,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  result := True;
end;

function TfmMain.Delete_MFC_HUB_DORMITORY(aSEQNO: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From CARD.MFC_HUB_DORMITORY ';
  stSql := stSql + ' where HUB_SEQNO = ' + inttostr(aSEQNO) ;

  result := dmAdoRelay.ProcessExecSQL(stSql);

end;

function TfmMain.YeosuRelay(aDate: String): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
begin
  //직원정보 연동은 수작업으로 하기로 함
  result:=True;
  Exit;
  
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select getDate() - 0.0001 as curTime ';
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;
    Try
      if Not Findfield('curTime').IsNull then
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',(Findfield('curTime').AsDateTime) );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                         + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end else
      begin
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      end;
    Except
        LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
        stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
        stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
                          + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
    End;
  end;

  stSql := ' Select CARD_GUBN,CARD_HOSP,CARD_IDNO,CARD_JWNO,';
  stSql := stSql + 'CARD_NAME,CARD_SUKR,CARD_ISCT,CARD_STGB,';
  stSql := stSql + 'CARD_STAT,CARD_UPDT from VW_CARD_UMST ';
  if aDate <> '' then
  begin
    stDate := copy(aDate,1,4) + '-' + copy(aDate,5,2) + '-' + copy(aDate,7,2);
    stDate := stDate + ' ' + copy(aDate,9,2) + ':' + copy(aDate,11,2) + ':' + copy(aDate,13,2);
    if Length(aDate) > 15 then stDate := stDate + '.' + copy(aDate,15,3);
    stSql := stSql + ' Where CARD_UPDT > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND CARD_UPDT <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
  end;
  stSql := stSql + ' order by CARD_UPDT ';
//  Memo1.Text := stSql;
  
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    result := True;
    if recordCount < 1 then Exit;
    while Not Eof do
    begin
      if YeosuConversionEmployee(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString) then
      begin
        if Not FindField('CARD_UPDT').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('CARD_UPDT').AsDateTime);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
          Except
            LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
          End;
        end;
        YeosuEventState(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString,
                               'sucess');
      end else
      begin
        YeosuEventState(FindField('CARD_GUBN').AsString,FindField('CARD_HOSP').AsString,
                               FindField('CARD_IDNO').AsString,FindField('CARD_JWNO').AsString,
                               FindField('CARD_NAME').AsString,FindField('CARD_SUKR').AsString,
                               FindField('CARD_ISCT').AsString,FindField('CARD_STGB').AsString,
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString,
                               'fail');
      end;
      Application.ProcessMessages;
      Next;
    end;
    LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
  end;
end;

function TfmMain.YeosuConversionEmployee(aGubun, aJijumCode, aEmCode,
  aEmCophone, aEmName, aDepartName, aCardSeq, aRegState, aEmState,
  aUpdateTime: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
  stOldCardState : string;
  bCardStateChange : Boolean;
  stWorkCode,stEndDate : string;
begin
  result := False;
  if aGubun = '' then aGubun := '1';
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  if length(aEmCode) < 7 then
    aEmCode := FillZeroStrNum(aEmCode,7,True);
  stCardNo := aGubun[1] + aEmCode + FillZeroStrNum(aCardSeq,2);
  stCardNo := FillCharString(stCardNo,'*',16,False);
  stCompanyCode := '001';
  aJijumCode := FillZeroStrNum(aJijumCode,3);
  stDepartCode := GetDepartCode(stCompanyCode,aJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,aJijumCode,aDepartName,stDepartCode);
  end;

  bCardStateChange := False;
  stPosiCode := '000';
  stCardState := '2';
  if (aRegState = '01') and (aEmState = '01') then stCardState := '1';  //재직중이면서 정상 카드 인경우만 사용 가능

  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    '001',
                    aJijumCode,
                    stDepartCode,
                    stPosiCode,
                    aEmCophone,
                    '20000101',
                    '99991231',
                    '',
                    '',
                    '',
                    '',
                    '',
                    stCardState,
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    '001',
                    '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','여수병원','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      aJijumCode,
                      stDepartCode,
                      stPosiCode,
                      aEmCophone,
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      '001',
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','여수병원','',aDepartName,'');
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
  begin
    UpdateTB_CARD_NewCard(stCardNo);
  end;

  result := True;
end;

procedure TfmMain.YeosuEventState(aGubun, aJijumCode, aEmCode, aEmCophone,
  aEmName, aDepartName, aCardSeq, aRegState, aEmState, aUpdateTime,
  aResult: string);
var
  fmJUNNAMCurrentState : TForm;
begin
  if L_bJUNNAMShowState then
  begin
    fmJUNNAMCurrentState := MDIForm('TfmJUNNAMCurrentState');
    if fmJUNNAMCurrentState <> nil then
    begin
      TfmJUNNAMCurrentState(fmJUNNAMCurrentState).JunnamEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult);
    end;
  end;

end;

function TfmMain.YeosuRealTimeRelay: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if L_bJNGetHospitalInfoStart then Exit;

  dmAdoRelay.AdoRelay1Connected(L_stDBType2, L_stDBIP2, L_stDBPort2,
                    L_stDBUserID2, L_stDBUserPW2, L_stDBName2);
  result := False;
  if Not dmAdoRelay.DBConnected1 then Exit;
  L_bJNRealTimeStart:=True;
  stSql := 'select * from pmiaccev ';
  if L_stDBType2 <> '1' then
  begin
    stSql := stSql + ' where accestat != ''X'' ';
    stSql := stSql + ' and ( (acceaddt  between to_char(to_date(sysdate-1),''yyyymmdd'') and to_char(to_date(sysdate),''yyyymmdd'')) ';
    stSql := stSql + '  or (accedsdt between to_char(to_date(sysdate-1),''yyyymmdd'') and to_char(to_date(sysdate),''yyyymmdd'')) ) ';
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection1;
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
      ServerSender('SUCESS');   //연동할 데이터가 없어도 성공한 것이다.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        YeosupatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString);

        Application.ProcessMessages;
        Next;
      end;
    End;
  Finally
    L_bJNRealTimeStart:=False;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.YeosupatientRelay(aCode, aInDate, aOutDate,
  aState: string; aLogFile: Boolean): Boolean;
var
  nIndex : integer;
  oPatient : TPatientInfo;
  stState : string;
begin
  //aCode : 사번
  //aInDate : 입원일자
  //aOutDate : 퇴원일자
  //aState : C:재원중 D:퇴원중
  stState := aState;
  if aOutDate > formatDateTime('yyyymmdd',now-1) then stState := 'C'; //오늘 퇴원한 사람은 강제로 등록으로 처리 하자.
  if stState = 'E' then stState := 'C'; //가퇴원환자도 입원환자로 본다.

  nIndex := PatientList.IndexOf(aCode);
  if nIndex < 0 then
  begin
    oPatient := TPatientInfo.Create(nil);
    oPatient.PatientNo := aCode;
    oPatient.HospitalizeDate := aInDate;
    oPatient.LeaveDate := aOutDate;
    oPatient.OnStateChange := PatientStateChange;
    PatientList.AddObject(aCode,oPatient);
  end;
  nIndex := PatientList.IndexOf(aCode);
  if nIndex > -1 then
  begin
    if aOutDate < TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
    begin
      //어제 퇴원 후 오늘 입원 한사람, 어제 퇴원으로 권한이 삭제 된 후에 오늘 다시 입원으로 다시 등록이 반복된다.
      Exit; //만약 퇴원일자가 입원일자보다 더 빠른 경우가 있는 처리 건은 퇴원 처리 할 필요가 없다.
    end;
    TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate := aInDate;
    TPatientInfo(PatientList.Objects[nIndex]).LeaveDate := aOutDate;
    if(stState = 'D') then
    begin
      if TPatientInfo(PatientList.Objects[nIndex]).LeaveDate >= TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
      begin
        //퇴원일자가 입원일자보다 작은 경우만 퇴원 처리하자. ==> 이부분이 문제가 됨
        //이걸 퇴원일자가 입원일자 보다 큰 경우 퇴원 처리로 변경 처리함.
        TPatientInfo(PatientList.Objects[nIndex]).State := stState;
      end else
      begin
        if aLogFile then LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',aCode + ' StateChange');
        TPatientInfo(PatientList.Objects[nIndex]).State := 'C';
      end;
    end
    else TPatientInfo(PatientList.Objects[nIndex]).State := stState; //상태값 변경 처리 하자.

  end;
end;

end.
