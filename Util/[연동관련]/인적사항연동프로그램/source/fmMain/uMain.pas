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
    L_stProgramType : string; //1:���ִ�,2:�����뺴�� ,10:STXâ��
    L_stDBType : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP : string; //BataBase ����IP
    L_stDBPort : string; //BataBase ����Port
    L_stDBUserID : string;
    L_stDBUserPW : string;
    L_stDBName : string;
    L_stDBType2 : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP2 : string; //BataBase ����IP
    L_stDBPort2 : string; //BataBase ����Port
    L_stDBUserID2 : string;
    L_stDBUserPW2 : string;
    L_stDBName2 : string;
    L_stServerIP : string; //��ŵ��� ���� IP
    L_stServerPort : string; //��ż��� ��Ʈ

    L_stRelayTime : string;
    L_stLastRelayTime : string; //������ ���� �ð�
    L_stLastRelayDelTime : string; //������ ���� �����ð�
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
    //���ִ뿬��
    Function AjuUniversityRelay(aCount:integer=0):Boolean;
    Function AjuConversionEmployee(aJijumName,aDepartName,aPosiCode,aEmName,aEmCode,aCardSeq,aType,aGubun:string):Boolean;
    Function Delete_MFC_HUB(aSEQNO:integer):Boolean;
  private
    //���ִ����� ����
    Function AjuUniversityDormitoryRelay(aCount:integer=0):Boolean;
    Function AjuDormitoryConversionEmployee(aJijumName,aCophone,aPosiName,aInOutState,aEmCode,aEmName,aCardSeq,aType,aAddr1,aAddr2:string):Boolean;
    Function Delete_MFC_HUB_DORMITORY(aSEQNO:integer):Boolean;
  private
    L_bJNRealTimeStart : Boolean;
    L_bJNGetHospitalInfoStart : Boolean;
    //������ ���� ����
    Function JNRealTimeRelay:Boolean; //ȯ�� ���� ������
    Function JNpatientRelay(aCode,aInDate,aOutDate,aState:string;aLogFile:Boolean=False):Boolean;
    Function JunNamUniversityRelay(aDate:String):Boolean;
    Function JUNNAMConversionEmployee(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime:string):Boolean;
    Function ServerSender(aSendData:string):Boolean;
  private
    //���� ���� ����
    Function YeosuRealTimeRelay:Boolean; //ȯ�� ���� ������
    Function YeosupatientRelay(aCode,aInDate,aOutDate,aState:string;aLogFile:Boolean=False):Boolean;
    Function YeosuRelay(aDate:String):Boolean;
    Function YeosuConversionEmployee(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime:string):Boolean;
  private
    //KT ���ʻ�� ����
    Function KTBundangRelay(aDate:String):Boolean;
    Function KTBundangDelRelay(aDate:String):Boolean;
    Function KTBundangEmployeeCardStop(aDelDate,aEmCode,aCardID,aUserName:string):Boolean;
    Function KTBundangConversionEmployee(aEmCode,aCardNo,aEmName,aCardIssuCont,aStartDate,aEmEndDate,aJijumName,aDepartName,aPosiName,aWorkGubun:string):Boolean;
  private
    //KT ��鵿 ����
    Function KTBundangRelay1(aDate:String):Boolean;
    Function KTBundangDelRelay1(aDate:String):Boolean;
    Function KTBundangEmployeeCardStop1(aDelDate,aEmCode,aCardID,aUserName:string):Boolean;
    Function KTBundangConversionEmployee1(aEmCode,aCardNo,aEmName,aCardIssuCont,aStartDate,aEmEndDate,aJijumName,aDepartName,aPosiName,aWorkGubun:string):Boolean;
  private
    Function GetChosunRelay:Boolean;
    Function ChosunRelay(aTime:string):Boolean;
    Function CHOSUNConversionEmployee(aEmCode,aEmName,aPosiCode,aJijumName,aDepartName,aRegname,aCompanyPhone,aReTireDate,aCardSeq:string):Boolean;
  private
    //�ֿ�������� ����
    Function SSANGYONGAT_Relay:Boolean;
    Function SSANGYONGEmployee_Relay(aDate:string):Boolean;
    Function SSANGYONGConversionEmployee(aEmCode,aEmName,aJijumName,aDepartName,aWorkCode,aInsertTime,aUpdateTime:string):Boolean;
    Function Insert_SSANGYONGAtEvent(aDate,aTime,aEmCode:string):Boolean;
    Function Check_SSANGYONGATEVENT(aDate,aTime,aEmCode:string):Boolean;
  private
    //������ ����
    Function YounSeUniversityRelay(aDate:string):Boolean;
    Function YounSeUniversityEmployee(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aStateText:string;var aOldCardNo:string) : Boolean;
  private
    //������ �װ� ����
    Function HizeAirAttendRelay:Boolean;
    Function Insert_HizeAirAtEvent(aATTYPE,aEMCODE,aATDATE,aACDATE,aACTIME,aJIJUMNAME,aDEPARTCODE,aDEPARTNAME,aEMNAME:string):Boolean;
    Function Check_HizeAirAtEVENT_Key(aATTYPE, aEMCODE, aATDATE:string):Boolean;
    Function Check_HizeAirAtEVENT_Time(aATTYPE, aEMCODE, aATDATE,aACTIME:string):Boolean;
  private
    //����� ����
    Function SeoulUniversityEmployeeRelay:Boolean;
    Function SeoulHumanitiesEmployeeRelay(aLastRelayTime:string):Boolean;
    Function SeoulHumanitiesConversionEmployee(aCardNo,aUserName:string):Boolean;
    Function GetSeoulHumanitiesEmCode(aUserName:string; var aEmCode:string):Boolean;
    Function SeoulUniversityEmployee(aJijumName, aDepartName,aEmployeeGubun, aEmName, aEmCode, aTelNum, aEmail, aAddr1, aAddr2,aEndDate,aEmployeeState,aCampusName: string) : Boolean;
    Function UpdateBSNS031_LOG_Field_String(aSEQ,aFieldName,aValue:string):Boolean;
  private
    //STX���� â��
    Function STXChangWonAttendRelay:Boolean;
    Function Insert_STXChangWonAtEvent(aDate,aTime,aEmCode,aNodeNo,aEcuID,aDoorNo,aDoorName:string):Boolean;
    Function STXChangWonAtState(aDate,aTime,aEmCode,aNodeNo,aEcuID,aDoorNo,aDoorName,aResult:string):Boolean;
    Function Check_STXChangwonATEVENT(aDate,aTime,aEmcode:string):Boolean;
  private
    //����� �ϼ��� ķ�۽� ����
    Function DongYangUniversityRelay:Boolean;
    Function DongYangUniversityEmployee(aJijumCode,aEmCode,aEmName,aRoomNumber,aPosiCode,aRegDate,atoesagb,      //��翩��(1:���)
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
    procedure DefaultHandler(var Message);override;  //����Ʈ���� ����� ����
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
  tbi.Hint := '������� ���� �ý��� ����';
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
  L_dtRelayActionTime := Now; //���� ���� ���� �ѹ� ���� ����.
  if Not dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName) then
  begin
    tbi.Hint := '������� ���� �ý��� ����';
    RelayAdoConnectCheckTimer.Interval := 1000 * 600; //10�п� �ѹ��� üũ ����.
    RelayAdoConnectCheckTimer.Enabled := True;
  end else
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 10; //����� 10�ʿ� �ѹ��� üũ
    //RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '������� ���� �ý��� ����';
  end;
  if L_stProgramType = '5' then
  begin
    if Not dmAdoRelay.AdoRelay1Connected(L_stDBType, L_stDBIP, L_stDBPort,
                      L_stDBUserID, L_stDBUserPW, 'sw_mast') then
    begin
      tbi.Hint := '������� ���� �ý��� ����';
      RelayAdoConnectCheckTimer1.Interval := 1000 * 600; //10�п� �ѹ��� üũ ����.
      RelayAdoConnectCheckTimer1.Enabled := True;
    end else
    begin
      RelayAdoConnectCheckTimer1.Interval := 1000 * 10; //����� 10�ʿ� �ѹ��� üũ
      //RelayAdoConnectCheckTimer.Enabled := True;
      tbi.Hint := '������� ���� �ý��� ����';
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
    RelayAdoConnectCheckTimer.Interval := 1000 * 600;   //���ӽ��н� 10�п� �ѹ��� üũ
    RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '������� ���� �ý��� ����';
  end else
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 10; //����� 10�ʿ� �ѹ��� üũ
    tbi.Hint := '������� ���� �ý��� ����';
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
  L_stProgramType := '1';   //1:���ִ�,2:�����뺴��,3.KT���ʻ��
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
          if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then G_nCARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)  // 0.����4Byte,1.����ASCII,2.KT
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
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '2' then
    begin
       mn_RelayDB.Caption := '��ü����' ;
       mn_GetHospital.Visible := True;
       mn_DeleteHospital.Visible := True;
       RealTimer.Enabled := True;
       SocketConnectCheckTimer.Enabled := True;
    end else if L_stProgramType = '3' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '4' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '5' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '6' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '7' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '8' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '9' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '10' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '11' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '12' then
       mn_RelayDB.Caption := '��ÿ���'
    else if L_stProgramType = '13' then
    begin
       mn_RelayDB.Caption := '��ü����' ;
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
      StatusBar1.Panels[2].Text := '��ü����' + L_stLastRelayTime;
      JunNamUniversityRelay('');
    end else if L_stProgramType = '3' then
    begin
      StatusBar1.Panels[2].Text := '��ÿ���' + L_stLastRelayTime;
      if Not KTBundangRelay(L_stLastRelayTime) then Exit;  //KT���ʻ�� ������
      if Not KTBundangDelRelay(L_stLastRelayDelTime) then Exit;
    end else if L_stProgramType = '4' then
    begin
      StatusBar1.Panels[2].Text := '��ÿ���' + L_stLastRelayTime;
      GetChosunRelay;  //������ ������ ��������
      if Not ChosunRelay(L_stLastRelayTime) then Exit;  //������ �������� ����
    end else if L_stProgramType = '5' then  //��鵿
    begin
      if Not KTBundangDelRelay1(L_stLastRelayDelTime) then Exit;
      if Not KTBundangRelay1(L_stLastRelayTime) then Exit;  //KT��鵿 ������
    end else if L_stProgramType = '6' then  //�ֿ��������
    begin
      StatusBar1.Panels[2].Text := '��ÿ���' + L_stLastRelayTime;
      SSANGYONGAT_Relay;
      SSANGYONGEmployee_Relay(L_stLastRelayTime);
    end else if L_stProgramType = '7' then  //������
    begin
      StatusBar1.Panels[2].Text := '��ÿ���' + L_stLastRelayTime;
      YounSeUniversityRelay(L_stLastRelayTime);  //������ �л�����
    end else if L_stProgramType = '8' then  //������ �װ� ���� ����
    begin
      StatusBar1.Panels[2].Text := '��ÿ���' + FormatDateTime('yyyymmddhhnnss',now);
      HizeAirAttendRelay;
    end else if L_stProgramType = '9' then   //������б� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      SeoulUniversityEmployeeRelay;
      SeoulHumanitiesEmployeeRelay(L_stLastRelayTime);
    end else if L_stProgramType = '10' then   //STXâ��
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      STXChangWonAttendRelay;
    end else if L_stProgramType = '11' then   //����� �ϼ��� ķ�۽�
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      DongYangUniversityRelay;
    end else if L_stProgramType = '12' then   //���ִ� ����� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      AjuUniversityDormitoryRelay;
    end else if L_stProgramType = '13' then   //�������պ��� ����
    begin
      StatusBar1.Panels[2].Text := '��ü����' + L_stLastRelayTime;
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
      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '��������';
      if AjuConversionEmployee(FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                               FindField('HUB_IDDI').AsString,FindField('HUB_NAME').AsString,
                               FindField('HUB_IDNO').AsString,FindField('HUB_ISFG').AsString,
                               FindField('HUB_LSFG').AsString,FindField('HUB_SDCO').AsString) then
      begin
        Delete_MFC_HUB(FindField('HUB_SEQNO').AsInteger);
      end;
      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '�����Ϸ�';
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
  // aType : //0:����,1:�н�
  // aPosiCode : //1: �л�(003),2:����(001),3:�ڻ�(003),4:����(004),5:����(005),8:����(006)
  //aGubun 0:����,1:����,2:����,3:����
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
    '1': stPosiCode := '003';  //�л�
    '2': stPosiCode := '001';  //����
    '3': stPosiCode := '002';  //�ڻ�
    '4': stPosiCode := '004';  //����
    '5': stPosiCode := '005';  //����
    '8': stPosiCode := '006';  //����
  end;
  bCardStateChange := False;
  stCardState := '2';
  if aType = '0' then stCardState := '1';  //aType�� 0 �ΰ�츸 ����

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
                        '','���ִ��б�',aJijumName,aDepartName,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aEmName,
                        '','���ִ��б�',aJijumName,aDepartName,'');
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
                          '','���ִ��б�',aJijumName,aDepartName,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
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

  if stCardState <> '1' then  //������
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
    tbi.Hint := '������� ���� �ý��� ����';
  end else tbi.Hint := '������� ���� �ý��� ����';
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
    tbi.Hint := '������� ���� �ý��� �۾���';
    if L_stProgramType = '1' then
    begin
      if Not AjuUniversityRelay then Exit;  //���ִ� ����
    end else if L_stProgramType = '2' then
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      if Not JunNamUniversityRelay(L_stLastRelayTime) then Exit;  //�����뺴�� ����
    end else if L_stProgramType = '3' then   //���ʻ�� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      if Not KTBundangRelay(L_stLastRelayTime) then Exit;  //KT���ʻ�� ������
      if Not KTBundangDelRelay1(L_stLastRelayDelTime) then Exit;
    end else if L_stProgramType = '4' then   //�������б� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      GetChosunRelay;  //������ ������ ��������
      if Not ChosunRelay(L_stLastRelayTime) then Exit;  //������ �������� ����
    end else if L_stProgramType = '5' then   //KT��鵿 ����
    begin
      KTBundangRelay1(L_stLastRelayTime);  //KT��鵿 ����
      KTBundangDelRelay1(L_stLastRelayDelTime);
    end else if L_stProgramType = '6' then   //�ֿ�������� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      SSANGYONGAT_Relay;
      SSANGYONGEmployee_Relay(L_stLastRelayTime);
    end else if L_stProgramType = '7' then   //������ ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' + L_stLastRelayTime;
      YounSeUniversityRelay(L_stLastRelayTime);  //������ �л�����
    end else if L_stProgramType = '8' then   //������ �װ� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      HizeAirAttendRelay;
    end else if L_stProgramType = '9' then   //������б� ����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      SeoulUniversityEmployeeRelay;
      SeoulHumanitiesEmployeeRelay(L_stLastRelayTime);
    end else if L_stProgramType = '10' then   //STXâ��
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      STXChangWonAttendRelay;
    end else if L_stProgramType = '11' then   //����� �ϼ��� ķ�۽�
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      DongYangUniversityRelay;
    end else if L_stProgramType = '12' then   //���ִ�����
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) ;
      AjuUniversityDormitoryRelay;
    end else if L_stProgramType = '13' then   //��������
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
    tbi.Hint := '������� ���� �ý��� ����';
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
  if L_stProgramType = '1' then //���ִ�
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if L_stProgramType = '2' then //�����뺴��
  begin
    result := FillCharString(aIDNO,'*',16);
  end else if L_stProgramType = '11' then   //����� �ϼ��� ķ�۽�
  begin
    result := FillCharString(aIDNO,'N',14);
    result := result + FillZeroStrNum(aSeq,2);
  end else if L_stProgramType = '12' then   //���ִ� �����
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if L_stProgramType = '13' then //��������
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
  else if L_stProgramType = '2' then //�����뺴��������Ȳ
    MDIChildShow('TfmJUNNAMCurrentState')
  else if L_stProgramType = '3' then //KT�д翬����Ȳ
    MDIChildShow('TfmKTBundangCurrentState')
  else if L_stProgramType = '4' then //chosun�뺴��������Ȳ
    MDIChildShow('TfmCHOSUNCurrentState')
  else if L_stProgramType = '5' then //KT�д翬����Ȳ
    MDIChildShow('TfmKTBundangCurrentState')
  else if L_stProgramType = '6' then //�ֿ��������
    MDIChildShow('TfmSSANGYONGCurrentState')
  else if L_stProgramType = '7' then //������
    MDIChildShow('TfmYounseUniversityCurrentState')
  else if L_stProgramType = '8' then //������ �װ�
    MDIChildShow('TfmHizeAirCurrentState')
  else if L_stProgramType = '9' then //������б�
    MDIChildShow('TfmYounseUniversityCurrentState')
  else if L_stProgramType = '10' then //STXâ��
    MDIChildShow('TfmSTXChangWonCurrentState')
  else if L_stProgramType = '11' then //����� �ϼ��� ķ�۽�
    MDIChildShow('TfmDongyangUniversityCurrentState')
  else if L_stProgramType = '12' then //���ִ� �����
    MDIChildShow('TfmDeviceCurrentState')
  else if L_stProgramType = '13' then //��������
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
  //�ѰǾ� �׽�Ʈ
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
      {����� Ʈ���� ���}

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
    stSql := stSql + ' AND CARD_UPDT <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if (aRegState = '01') and (aEmState = '01') then stCardState := '1';  //�������̸鼭 ���� ī�� �ΰ�츸 ��� ����

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
                      '','�����뺴��','',aDepartName,'');
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
                        '','�����뺴��','',aDepartName,'');
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
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

  if stCardState <> '1' then  //������
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
    stSql := stSql + ' AND a.emp_issue_date <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if length(aCardNo) < 9 then  Exit;  //ī���ȣ�� 9 �ڸ��� �ƴѰ��� �������� ����.
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
  stCardState := '1';  //������ �������� üũ

  if dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then  //KTī��� ����� üũ����. ��� ����� �ƹ� �۾� ���� ����.
  begin
    if stCardState = '1' then Exit; //ī�� ���°� �����̸� ó�� ���� ����.
    //����� ���� �����͸� ó�� ����.
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
                      '','�����뺴��','',aDepartName,'');
    *)
    Exit;
  end else
  begin
    if stCardState <> '1' then Exit; //����� ���µ� ���� �� ����̸� Insert ���ʿ� ����.
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
                        '','KT�д�',aJijumName,aDepartName,'');
  end;

  if Not dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    //����� �ٸ� ī�尡 ������ ���Ѻ���
    if dmDBFunction.CheckTB_CARD_Employee('',aEmCode,stCardNo,stOldCodeNo) then  //ȸ���ڵ�� üũ���� ����.
    begin
      //���� ������� �ٸ� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű�
      dmDBFunction.DeleteTB_DEVICECARDNOCardNo(stCardNo); // �������̺� ���� ����� ī�忡 ���� ��Ⱑ ���� ������ ����
      dmDBFunction.CopyGradeOldCard(stOldCodeNo,stCardNo); //���⼭ ������ ����
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
    stSql := stSql + ' AND dele_date <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if Not dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then Exit;  //�����ȣ�� ������ ���� ������.
  if Length(aDelDate) <> 8 then Exit; //
  UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate);  //�������� �ٲ�����.
  UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode); //����� ��� ������ �ش��ϴ� ī�� ������
  dmDBFunction.InsertIntoTB_EMPHIS(L_stCompanyCode,aEmCode,inttostr(nFdmsID),
                      '2',aCardID,'1',aUserName,
                      '','KT�д�','','',''); //����� �̷� ����

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
  stSql := stSql + ' A.SCV_USRM_STATUS_NM = ''����'',                           ';
  stSql := stSql + ' A.InsertDate = GetDate()                                   ';
  stSql := stSql + ' From KTTeleCop A                                           ';
  stSql := stSql + ' where SCV_USRM_STATUS_NM <> ''����''                       ';
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
    stSql := stSql + ' AND InsertDate <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if (aRegname = '����') then
  begin
    stCardState := '3';  //���� �Ǵ� ���� ���¿����� ���� ���� ����.
    stRgCode := '003';
  end;
  if (aRegname = '����') or (aRegname = '����') then
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
                      '','�������б�','',aDepartName,'');
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
                        '','�������б�','',aDepartName,'');
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo) then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
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

  if stCardState <> '1' then  //������
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
    stSql := stSql + ' AND repl_date <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
    stSql := stSql + ' AND a.emp_issue_date <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if (L_stProgramType = '3') or (L_stProgramType = '5') then  //KT��鵿 ���ʻ��
  begin
    if Not dmAdoRelay.AdoRelay1Connected(L_stDBType, L_stDBIP, L_stDBPort,
                      L_stDBUserID, L_stDBUserPW, 'sw_mast') then
    begin
      RelayAdoConnectCheckTimer1.Enabled := True;
      tbi.Hint := '������� ���� �ý��� ����';
    end else tbi.Hint := '������� ���� �ý��� ����';
  end else
  begin
  //���� �ΰ� ���� �ϴ� ��� üũ
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
  if length(aCardNo) < 9 then  Exit;  //ī���ȣ�� 9 �ڸ��� �ƴѰ��� �������� ����.
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

  stCardState := '1';  //������ �������� üũ

  if dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then  //KTī��� ����� üũ����. ��� ����� �ƹ� �۾� ���� ����.
  begin
    //��������� ���� �ϸ� ī�常 �߰� ����...
    //if stCardState = '1' then Exit; //ī�� ���°� �����̸� ó�� ���� ����.
    //����� ���� �����͸� ó�� ����.
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
                      '','�����뺴��','',aDepartName,'');
    *)
    //Exit;
  end else
  begin
    if stCardState <> '1' then Exit; //����� ���µ� ���� �� ����̸� Insert ���ʿ� ����.
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
                        '','KT�д�',aJijumName,aDepartName,'');
  end;

  if Not dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardStateChange := True;
    //����� �ٸ� ī�尡 ������ ���Ѻ���
    if dmDBFunction.CheckTB_CARD_Employee('',aEmCode,stCardNo,stOldCodeNo) then  //ȸ���ڵ�� üũ���� ����.
    begin
      //���� ������� �ٸ� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű�
      dmDBFunction.DeleteTB_DEVICECARDNOCardNo(stCardNo); // �������̺� ���� ����� ī�忡 ���� ��Ⱑ ���� ������ ����
      dmDBFunction.CopyGradeOldCard(stOldCodeNo,stCardNo); //���⼭ ������ ����
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
  if Not dmDBFunction.CheckTB_EMPLOYEE('',aEmCode,nFdmsID,stWorkCode,stEndDate) then Exit;  //�����ȣ�� ������ ���� ������.
  if Length(aDelDate) <> 8 then Exit; //
  UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate);  //�������� �ٲ�����.
  if aDelDate < formatDateTime('yyyymmdd',now) then
  begin
    UpdateTB_DEVICECARDNO_EmCodeCardStop(aEmCode);
  end else
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode); //����� ��� ������ �ش��ϴ� ī�� ������
  end;
  dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',aCardID,'1',aUserName,
                      '','KT�д�','','',''); //����� �̷� ����

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
  if Length(aEmCode) > 8 then  //��� 8�ڸ� �̻��� ���� ���� ó�� ���� ���� ������...
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
    stSql := stSql + ' AND INP_DDTM <= ''' + stCurrentTime + ''') ' ; //���� �ð� ���� 10����
    stSql := stSql + ' OR (UPDT_DDTM > ''' + aDate + ''' ' ;
    stSql := stSql + ' AND UPDT_DDTM <= ''' + stCurrentTime + ''') ' ; //���� �ð� ���� 10����
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
  if aJijumName = '' then aJijumName := '����';
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
    stCardState := '3';  //���� ���¿����� ���� ���� ����.
    stWorkCode := '2';
  end else if (aWorkCode = '99') then
  begin
    stCardState := '3';  //���� ���¿����� ���� ���� ����.
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
                      '','�ֿ��������','',aDepartName,'');
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
                        '','�ֿ��������','',aDepartName,'');
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo) then
  begin
    if Not dmDBFunction.UpdateTB_CARD(stOldCardNo,'1',stCardState,aEmCode,'001') then Exit;
    if stWorkCode = '3' then  //����
    begin
      dmDBFunction.UpdateTB_DEVICECARDNO_permit(stOldCardNo,'N');
    end else
    begin
      UpdateTB_DEVICECARDNORcvAck(stOldCardNo,'N'); //���� ���� ���� �� ��� ������
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
      stSql := stSql + ' AND UPDATE_DATE <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
          if dmDBModule.DBConnected = False then Exit; //���� ������ ������ ���� �� ��� �׳� ���� ������...
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
  if aJijumName = '' then aJijumName := '�������б�';
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
  if (aStateText='����') or (aStateText='����') then stWorkCode := '3'
  //else if (aStateText='����') or (aStateText='����') then stWorkCode := '2'
  else if (aStateText='��������') then stWorkCode := '4';

//  memo1.Lines.Add('CARD=' + stCardNo + 'Length=' + inttostr(Length(stCardNo)));
  stCardGubun := '1';
  if (aCardType = 'P') or (aCardType = 'C') then //�ö�ƽ ī���̸�
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
    if Length(stCardNo) <> 20 then //Exit; //����� ī�尡 �ƴϴ�...
    begin
      stCardNo := '';
    end else
    begin
      stCardNo := copy(stCardNo,5,16);
      stCardGubun := '2';
    end;
  end else
  begin
    //��ü �Ҹ� ī��
    stCardNo := '';
    //Exit;
  end;

  if (aCardState = '01')then
  begin
    stCardState := '1';  //����
  end else if (aCardState = '02') then
  begin
    stCardState := '2';  //�н�
  end else if (aCardState = '03') then
  begin
    stCardState := '3';  //����
  end;
  if stWorkCode <> '1' then stCardState := '3';   //stWorkCode �� ������ �ƴϸ� ī�� ���� ����.

//  memo1.Lines.Add('CARD=' + stCardNo);
  if dmDBFunction.CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stTemp,stEndDate) then
  begin
    if stWorkCode <> stTemp then bPermitChange := True;   //���� ���°� ������ �Ͼ� ������ ���� ������
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
                      '','������',aJijumName,aDepartName,'');
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
                      '','������',aJijumName,aDepartName,'');
  end;
//  memo1.Lines.Add('TEST2');
  if stCardNo <> '' then
  begin
    //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
    if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo,True) then   //��ϵ� ī�带 ã�´�.
    begin
      if (stOldCardNo <> '') and (stCardNo <> stOldCardNo) then
      begin
        aOldCardNo := stOldCardNo;
        //���� ������� �ٸ� ī�尡 �ִ� ���
        //����ī�� ������ �Ȱ��� �ű�
        dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
      end;
    end else if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo,False) then //�н�,������ ī�带 ã�´�.
    begin
      if stCardNo <> stOldCardNo then
      begin
        aOldCardNo := stOldCardNo;
        //���� ������� ������ ī�尡 �ִ� ���
        //������ ī�� ������ �Ȱ��� �ű�
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

    if bCardStateChange then  //ī����� ���� �� ���
    begin
      //dmDBModule.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
      UpdateTB_DEVICECARDNORcvAck(stCardNo,'N');  //ī�� �����۸� �ϰ� ������ �׳� ��� ����...
    end;

    if Not CheckTB_DEVICECARDNO_CardPermit(stCardNo) then
    begin
      UpdateTB_CARD_NewCard(stCardNo);
    end;
  end;
  if bPermitChange then
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode);  //ī�� �����۸� �ϰ� ������ �׳� ��� ����...
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
    if aATTYPE = '1' then Exit; //����̸� �׳� ���� ������.
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
  if aJijumName = '' then aJijumName := '������б�';
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
    if stWorkCode <> stEmStateCode then bPermitChange := True;   //���� ���°� ������ �Ͼ� ������ ���� ������
    if stEndDate <> aEndDate then bPermitChange := True;         //�������ڰ� ������ �Ͼ���� ���� ������

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
                      '','�����',aJijumName,aDepartName,'');
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
                      '','�����',aJijumName,aDepartName,'');
  end;

  if bPermitChange then
  begin
    UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode);  //ī�� �����۸� �ϰ� ������ �׳� ��� ����...
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
  if (aEmployeeState = '����')
     or (aEmployeeState = '����')
     or (aEmployeeState = '����')
     or (aEmployeeState = '����') then result := '2';
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
    stSql := stSql + ' AND inpu_date <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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

  if aTime < '040000' then  //04�� ���� ��� �����͸� �Ѱ� ����.
  begin
    LogSave(G_stExeFolder + '\..\log\STX' + FormatDateTime('yyyymmdd',now) +'.log','aTime < 040000'+ aTime);
    result := True;
    Exit;
  end;

  if ByteType(aEmCode, 1) <> mbSingleByte then   //�ѱ۷� �����ϴ� ��� ���� ���� ����.
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
//  �ǽð� ����ȭ ����.
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
      ServerSender('SUCESS');   //������ �����Ͱ� ��� ������ ���̴�.
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
  end else if ServerRecvTime + (1 /(24*60)) < now then  //���� �ð��� 1���� �Ѿ�� ������ Ŭ���� �� �� ����
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
  //aCode : ���
  //aInDate : �Կ�����
  //aOutDate : �������
  //aState : C:����� D:�����
  stState := aState;
  if aOutDate > formatDateTime('yyyymmdd',now-1) then stState := 'C'; //���� ����� ����� ������ ������� ó�� ����.
  if stState = 'E' then stState := 'C'; //�����ȯ�ڵ� �Կ�ȯ�ڷ� ����.

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
      //���� ��� �� ���� �Կ� �ѻ��, ���� ������� ������ ���� �� �Ŀ� ���� �ٽ� �Կ����� �ٽ� ����� �ݺ��ȴ�.
      Exit; //���� ������ڰ� �Կ����ں��� �� ���� ��찡 �ִ� ó�� ���� ��� ó�� �� �ʿ䰡 ����.
    end;
    TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate := aInDate;
    TPatientInfo(PatientList.Objects[nIndex]).LeaveDate := aOutDate;
    if(stState = 'D') then
    begin
      if TPatientInfo(PatientList.Objects[nIndex]).LeaveDate >= TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
      begin
        //������ڰ� �Կ����ں��� ���� ��츸 ��� ó������. ==> �̺κ��� ������ ��
        //�̰� ������ڰ� �Կ����� ���� ū ��� ��� ó���� ���� ó����.
        TPatientInfo(PatientList.Objects[nIndex]).State := stState;
      end else
      begin
        if aLogFile then LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',aCode + ' StateChange');
        TPatientInfo(PatientList.Objects[nIndex]).State := 'C';
      end;
    end
    else TPatientInfo(PatientList.Objects[nIndex]).State := stState; //���°� ���� ó�� ����.

  end;
end;

procedure TfmMain.PatientStateChange(Sender: TObject; aPatientNo,
  aHospitalizeDate, aLeaveDate, aState: string);
var
  stCardNo,stCardState : string;
  nIndex,nTempIndex : integer;
  stGradeGroupCode : string;
begin
//���°��� �ٲ�� �̰����� �´�.
//1.����� ��ϵǾ� �ִ��� üũ �Ͽ� ������� �Է�
//2.���Ѻκе�Ϲ� ���� //aState �� ����...

  stCardNo := MakeCardNo(aPatientNo,'0');
  
  if (aState='C') then
  begin
    if dmDBFunction.CheckTB_EMPLOYEE_EmCode(aPatientNo) = 0 then
    begin
      if Not dmDBFunction.InsertIntoTB_EMPLOYEE_Value(aPatientNo, aPatientNo, L_stCompanyCode, L_stJijumCode, '000', L_stPosiCode, '',
        aHospitalizeDate, '99991231', '', '', '', '', '','0', '001', 'N', '0', 'N', 'N', 'N', 'N', '1111111', 'N','1') then
      begin
        nTempIndex := PatientList.IndexOf(aPatientNo);   //�Է� �����̸� �ٽ� �Է� �ϵ��� ����
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
        nTempIndex := PatientList.IndexOf(aPatientNo);   //�Է� �����̸� �ٽ� �Է� �ϵ��� ����
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
    if stGradeGroupCode <> '' then  //���⼭ �׷� ���� ���� ����...
    begin
      dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);
      dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);
      dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');
    end;       
  end else if(aState = 'D') then
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_Permit(stCardNO,'N'); //��� ī�� ������ ���� ó����
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
      ServerSender('SUCESS');   //������ �����Ͱ� ��� ������ ���̴�.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        JNpatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString);

//        Application.ProcessMessages; => �̰��� �߰� �ϸ� RealTimer ���� �޽����� ĸ���� ���� �� ���� ������ �ȵ�...
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
        if DongYangUniversityEmployee(FindField('B_NUMBER').AsString,  //72�����3(���л�1),74�����4(���л�2),73�����1(���л�1),71�����2(���л�2)
                                 FindField('HAGBEON').AsString,      //�й�
                                 FindField('IREUM').AsString,          //�̸�
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBERȣ��  HAGGWA_NAME(�а���)
                                 FindField('SINBUN_GB').AsString,     //�źб���(1:�кλ�, 2:���п���, 3:������, 9:��Ÿ))
                                 FindField('REGDATE').AsString,       //�����
                                 FindField('TOESA_FG').AsString,      //��翩��(1:���)
                                 FindField('TOESA_IL').AsString,      //�������
                                 FindField('HAGJEOG_GB').AsString,     //��������(1:���л�, 2:���л�, 3:������, 4:������)
                                 FindField('CARD_SU').AsString         //ī�� �߱� ����
                                 ) then
        begin
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',now);
            dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
            DongYangUniversityEmployeeEventState(FindField('B_NUMBER').AsString,  //72�����3(���л�1),74�����4(���л�2),73�����1(���л�1),71�����2(���л�2)
                                 FindField('HAGBEON').AsString,      //�й�
                                 FindField('IREUM').AsString,          //�̸�
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBERȣ��  HAGGWA_NAME(�а���)
                                 FindField('SINBUN_GB').AsString,     //�źб���(1:�кλ�, 2:���п���, 3:������, 9:��Ÿ))
                                 FindField('REGDATE').AsString,       //�����
                                 FindField('TOESA_FG').AsString,      //��翩��(1:���)
                                 FindField('TOESA_IL').AsString,      //�������
                                 FindField('HAGJEOG_GB').AsString,     //��������(1:���л�, 2:���л�, 3:������, 4:������)
                                 FindField('CARD_SU').AsString,'sucess');

        end else
        begin
            DongYangUniversityEmployeeEventState(FindField('B_NUMBER').AsString,  //72�����3(���л�1),74�����4(���л�2),73�����1(���л�1),71�����2(���л�2)
                                 FindField('HAGBEON').AsString,      //�й�
                                 FindField('IREUM').AsString,          //�̸�
                                 FindField('HAGGWA_NAME').AsString,      //R_NUMBERȣ��  HAGGWA_NAME(�а���)
                                 FindField('SINBUN_GB').AsString,     //�źб���(1:�кλ�, 2:���п���, 3:������, 9:��Ÿ))
                                 FindField('REGDATE').AsString,       //�����
                                 FindField('TOESA_FG').AsString,      //��翩��(1:���)
                                 FindField('TOESA_IL').AsString,      //�������
                                 FindField('HAGJEOG_GB').AsString,     //��������(1:���л�, 2:���л�, 3:������, 4:������)
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
aJijumCode,  //72�����3(���л�1),74�����4(���л�2),73�����1(���л�1),71�����2(���л�2)
aEmCode,      //�й�
aEmName,          //�̸�
aRoomNumber,      //ȣ��
aPosiCode,     //�źб���(1:�кλ�, 2:���п���, 3:������, 9:��Ÿ))
aRegDate,       //�����
atoesagb,      //��翩��(1:���)
atoesadate,      //�������
ahagjuggb,     //��������(1:���л�, 2:���л�, 3:������, 4:������)
acardseq       //ī��߱����� 
*)
  bCardStateChange := False;
  stCompanyCode := '001';
  stDepartCode := '001'; //001 �л���
  if aJijumCode = '71' then  aJijumCode := '002'  //���л�2
  else if aJijumCode = '72' then  aJijumCode := '006' //���л�1
  else if aJijumCode = '73' then  aJijumCode := '001' //���л�1
  else if aJijumCode = '74' then  aJijumCode := '007' //���л�2
  else aJijumCode := '009'; //��Ÿ
  stCardNo:= MakeCardNo(aEmCode,acardseq);
  stCardState := '1';
  if ahagjuggb <> '1' then stCardState := '3';
  if atoesagb = '1' then stCardState := '3';

  if Trim(aPosiCode) = '�кλ�' then aPosiCode := '001'
  else if Trim(aPosiCode) = '���п���' then aPosiCode := '002'
  else if Trim(aPosiCode) = '������' then aPosiCode := '003'
  else if Trim(aPosiCode) = '��Ÿ' then aPosiCode := '009'
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
                        '','������б�','','','');
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
                          '','������б�','','','');
    end;

    //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
    if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCardNo) then
    begin
      //���� ������� �ٸ� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű�
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
                          '','������б�','��������','','');
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
      ServerSender('SUCESS');   //������ �����Ͱ� ��� ������ ���̴�.
      if recordcount < 1 then Exit;
      While Not Eof do
      begin
        //LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',FindField('ACCEIDNO').AsString + ',' + FindField('ACCEDSDT').AsString + ',' + FindField('ACCESTAT').AsString);
        JNpatientRelay(FindField('ACCEIDNO').AsString,FindField('ACCEADDT').AsString,FindField('ACCEDSDT').AsString,FindField('ACCESTAT').AsString,True);

        ServerSender('SUCESS');   //������ �����Ͱ� ��� ������ ���̴�.
        Application.ProcessMessages; //=> �̰��� �߰� �ϸ� RealTimer ���� �޽����� ĸ���� ���� �� ���� ������ �ȵ�...
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
  // aType : //0:����,1:�н�
  // aPosiName : //����(001),����(002)
  //aCophone : ȣ��
  //aInOutState : 0.�Ի�,1.���,2.��û,3.����,4.���,5.���,6.�̵��,7.�����
  //aAddr1 : �ܰ����, aAddr2 : �а���
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
  if aType = '0' then stCardState := '1';  //aType�� 0 �ΰ�츸 ����

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
                        '','���ִ�����',aJijumName,aCophone,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      dmDBFunction.InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aEmName,
                        '','���ִ�����',aJijumName,aCophone,'');
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
                          '','���ִ�����',aJijumName,aCophone,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCodeNo) then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
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

  if stCardState <> '1' then  //������
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
  //�������� ������ ���۾����� �ϱ�� ��
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
    stSql := stSql + ' AND CARD_UPDT <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 10����
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
  if (aRegState = '01') and (aEmState = '01') then stCardState := '1';  //�������̸鼭 ���� ī�� �ΰ�츸 ��� ����

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
                      '','��������','',aDepartName,'');
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
                        '','��������','',aDepartName,'');
  end;
  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  if dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
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

  if stCardState <> '1' then  //������
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
      ServerSender('SUCESS');   //������ �����Ͱ� ��� ������ ���̴�.
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
  //aCode : ���
  //aInDate : �Կ�����
  //aOutDate : �������
  //aState : C:����� D:�����
  stState := aState;
  if aOutDate > formatDateTime('yyyymmdd',now-1) then stState := 'C'; //���� ����� ����� ������ ������� ó�� ����.
  if stState = 'E' then stState := 'C'; //�����ȯ�ڵ� �Կ�ȯ�ڷ� ����.

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
      //���� ��� �� ���� �Կ� �ѻ��, ���� ������� ������ ���� �� �Ŀ� ���� �ٽ� �Կ����� �ٽ� ����� �ݺ��ȴ�.
      Exit; //���� ������ڰ� �Կ����ں��� �� ���� ��찡 �ִ� ó�� ���� ��� ó�� �� �ʿ䰡 ����.
    end;
    TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate := aInDate;
    TPatientInfo(PatientList.Objects[nIndex]).LeaveDate := aOutDate;
    if(stState = 'D') then
    begin
      if TPatientInfo(PatientList.Objects[nIndex]).LeaveDate >= TPatientInfo(PatientList.Objects[nIndex]).HospitalizeDate then
      begin
        //������ڰ� �Կ����ں��� ���� ��츸 ��� ó������. ==> �̺κ��� ������ ��
        //�̰� ������ڰ� �Կ����� ���� ū ��� ��� ó���� ���� ó����.
        TPatientInfo(PatientList.Objects[nIndex]).State := stState;
      end else
      begin
        if aLogFile then LogSave(G_stExeFolder + '\..\log\Convert' + FormatDateTime('yyyymmdd',now) +'.log',aCode + ' StateChange');
        TPatientInfo(PatientList.Objects[nIndex]).State := 'C';
      end;
    end
    else TPatientInfo(PatientList.Objects[nIndex]).State := stState; //���°� ���� ó�� ����.

  end;
end;

end.
