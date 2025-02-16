unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ToolWin, ComCtrls,
  uCommonVariable, StdCtrls,ADOdb,ActiveX, Buttons, uSubForm, CommandArray,
  DB,TlHelp32;

type
  TEmTypeCode = class(Tcomponent)
  private
    FEmTypeCode: string;
    FEmTypeName: string;
  public
    property EmTypecode : string read FEmTypeCode write FEmTypeCode;
    property EmTypeName : string read FEmTypeName write FEmTypeName;
  end;
  TPosiCode = class(Tcomponent)
  private
    FPosiCode: string;
    FPosiName: string;
  public
    property Posicode : string read FPosiCode write FPosiCode;
    property PosiName : string read FPosiName write FPosiName;
  end;
  TDepartCode = class(Tcomponent)
  private
    FDepartCode: string;
    FDepartName: string;
  public
    property Departcode : string read FDepartCode write FDepartCode;
    property DepartName : string read FDepartName write FDepartName;
  end;
  TJijumCode = class(TComponent)
  private
    DepartNameList : TStringList;
    FJijumCode: string;
    FJijumName: string;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  public
    function SetDepartCodeName(aDepartCode,aDepartName:string):Boolean;
    function GetDepartCode(aDepartName:string):string;
    
    property jijumcode : string read FJijumCode write FJijumCode;
    property JijumName : string read FJijumName write FJijumName;
  end;


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
    procedure CommandArrayCommandsTChungNAMStateExecute(Command: TCommand;
      Params: TStringList);
  private
    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bActive : Boolean;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    EmTypeCodeList : TStringList;
    RegCodeList : TStringList;
    { Private declarations }
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure RelayAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    procedure RelayAdoEvent(Sender: TObject;  aSql : string);
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
    procedure JunnamEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult:string);
    procedure KTBundangEventState(aUpdateTime,aEmCode,aCardNo,aEmName,aCardIssuCount,aStartDate,aEndDate,aJijumName,
                               aDepartName,aPosiName,aWorkGubun,aResult:string);
    procedure ChungnamEventState(aEmID,aEmName,aJijumName,aDepartName,aPosiName,aHandphone,aStateCode:string);
  private
    L_stProgramType : string; //1:아주대,2:전남대병원,3,4:충남대
    L_stDBType : string; //1:MSSQL,2:PostGresql,3:ORACLE,4:MDB
    L_stDBIP : string; //BataBase 접속IP
    L_stDBPort : string; //BataBase 접속Port
    L_stDBUserID : string;
    L_stDBUserPW : string;
    L_stDBName : string;
    L_stRelayTime : string;
    L_stLastRelayTime : string; //마지막 연동 시간
    L_stLastRelayDelTime : string; //마지막 삭제 연동시간
    L_stCompanyCode : string;
    L_dtRelayActionTime : TDatetime;
    L_bRelayDB : Boolean;
    L_bShowState : Boolean;
    L_bJUNNAMShowState : Boolean;
    L_bKTBundangShowState : Boolean;
    L_bCHUNGNAMShowState : Boolean;
    procedure LoadConfig;
  private
    //아주대병원연동
    Function AjuUniversityRelay(aCount:integer=0):Boolean;
    Function AjuConversionEmployee(aJijumName,aDepartName,aPosiCode,aEmName,aEmCode,aCardSeq,aType,aGubun:string):Boolean;
    Function Delete_MFC_HUB(aSEQNO:integer):Boolean;
    //동양 미래대 연동 --아주대와 동일함
    Function DongYangUniversityRelay(aCount:integer=0):Boolean;
    Function DongYangConversionEmployee(aJijumName,aDepartName,aPosiCode,aEmName,aEmCode,aCardSeq,aType,aGubun,aCardNo:string):Boolean;
    Function DongYangDelete_MFC_HUB(aSEQNO:integer):Boolean;
  private
    //전남대 병원 연동
    Function JunNamUniversityRelay(aDate:String):Boolean;
    Function JUNNAMConversionEmployee(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aJijumName:string):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
  private
    Function KTBundangRelay(aDate:String):Boolean;
    Function KTBundangDelRelay(aDate:String):Boolean;
    Function KTBundangEmployeeCardStop(aDelDate,aEmCode,aCardID,aUserName:string):Boolean;
    Function KTBundangConversionEmployee(aEmCode,aCardNo,aEmName,aCardIssuCont,aStartDate,aEmEndDate,aJijumName,aDepartName,aPosiName,aWorkGubun:string):Boolean;
  private
    Function ChungNamRelay(aDate:String):Boolean;
    procedure PersonCnuDataConversion(aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpTypeCode,
                             aEmCode,aSeq,aEmName,aPhoneNumber,aStateCode,aJijumName,aDepartName,aPosiName:string);
  private
    Function GetFdmsID:string;
    Function GetMaxPositionNum : integer;
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName,aJijumName:string):string;
    Function GetPosiCode(aCompanyCode,aPosiName:string):string;
    Function GetEmpTypeCode(aEmTypeName:string):string;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxPosiCode(aCompanyCode:string):integer;
    Function GetMaxEmTypeCode : integer;
    Function MakeCardNo( aIDNO,aSeq:string):string;
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName,aJijumName:string; var aDepartCode:string);
    procedure CreatePosiCode(aCompanyCode,aPosiName:string;var aPosiCode:string);
    procedure CreateEmTypeCode(aName:string;var aEmpTypeCode:string);

  private
    Function ChecktTB_CARD_Employee(aCompanyCode,aEmCode,aCardNo:string;var aOldCardNo:string):boolean;
    Function CheckTB_DEVICECARDNO_CardPermit(aCardNo:string):Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function CheckTB_CARDEMPCODE(aCompanyCode,aEmpID:string):Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string; var aFdmsID:integer):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_EMPHISCardStop(aCardNo:string):Boolean;
    Function InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,afdmsID,aMode,aCardNo,aCardType,aEmName,aHandPhone,aCompanyName,aJijumName,aDepartName,aPosiName:string):Boolean;
    Function InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertIntoTB_RELAYGUBUN(aRgCode,aRgName:string):Boolean;

    Function UpdateTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aRegGubun,aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string;aDoorGrade:string='') : Boolean;
    Function UpdateTB_CARD_Change(aOldCardNo,aNewCardNo:string):Boolean;
    Function UpdateTB_CARD_NewCard(aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO_permit(aCardNo,aPermit:string):Boolean; //모든 카드 권한을 삭제 처리함
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;
    Function DeleteTB_DEVICECARDNO_EmCode(aCompanyCode,aEmCode:string):Boolean;
    Function UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode:string):Boolean;
    Function DeleteTB_EMPLOYEE(aEmCode,aCardNo:string):Boolean;

    Function CopyGradeOldCard(aOldCardNO,aNewCardNO:string):Boolean;

  private
    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지
    function GetPIDfromExeName(name:String):Cardinal;
    procedure KillProcess(name:String);

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
  uChungNamCurrentState;

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

  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  EmTypeCodeList := TStringList.Create;
  RegCodeList := TStringList.Create;

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
var
  i : integer;
begin
  G_bApplicationTerminate := True;
  Delay(1000);
  if JijumCodeList.Count > 0 then
  begin
    for i := JijumCodeList.Count - 1 downto 0 do
    begin
      TJijumCode(JijumCodeList.Objects[i]).Free;
    end;
  end;
  JijumCodeList.Free;
  if PosiCodeList.Count > 0 then
  begin
    for i := PosiCodeList.Count - 1 downto 0 do
    begin
      TPosiCode(PosiCodeList.Objects[i]).Free;
    end;
  end;
  PosiCodeList.Free;
  if EmTypeCodeList.Count > 0 then
  begin
    for i := EmTypeCodeList.Count - 1 downto 0 do
    begin
      TEmTypeCode(EmTypeCodeList.Objects[i]).Free;
    end;
  end;
  EmTypeCodeList.Free;
  RegCodeList.free;

  //  dmAdoRelay.ADOConnection.Connected := False;
  LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion Program End ');

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
  G_nCARDLENGTHTYPE := 0;
  L_stProgramType := '1';   //1:아주대,2:전남대병원,3.KT서초사옥,4.충남대
  L_stDBType := '3';
  L_stDBIP :='127.0.0.1';
  L_stDBPort := '1521';
  L_stDBUserID := 'SYS';
  L_stDBUserPW := 'orapasswd1';
  L_stDBName :='orcl';
  L_stRelayTime :='30';
  L_stLastRelayTime := '';
  L_stCompanyCode := '099';

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
        end else if FindField('CO_CONFIGGROUP').AsString = 'EMPCONV' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'PGTYPE'   then L_stProgramType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then L_stDBType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then L_stDBIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then L_stDBPort := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then L_stDBUserID := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then L_stDBUserPW := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then L_stDBName := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then L_stRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'LASTTIME'   then L_stLastRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DELTIME'   then L_stLastRelayDelTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then L_stCompanyCode := FindField('CO_CONFIGVALUE').AsString;
        end;
        Next;
      end;
    end;
    
    if L_stProgramType = '1' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '2' then
       mn_RelayDB.Caption := '전체연동'
    else if L_stProgramType = '3' then
       mn_RelayDB.Caption := '즉시연동'
    else if L_stProgramType = '4' then
       mn_RelayDB.Caption := '즉시연동'
    ;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  
  if L_stProgramType = '4' then
  begin
    RegCodeList.Add('APS111.10');  //재직상태
    RegCodeList.Add('SET06.CEASE');  //휴학생
    RegCodeList.Add('SET06.HOLD');  //재학생
    RegCodeList.Add('SET06.COMPL');  //수료생
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
  if L_bRelayDB then Exit;
  Try
    L_bRelayDB := True;
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
      if Not ChungNamRelay(L_stLastRelayTime) then Exit;  //충남대학교 연동건
    end else if L_stProgramType = '5' then
    begin
      DongYangUniversityRelay;  //동양미래대학교연동건
    end;
  Finally
    L_bRelayDB := False;
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
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName,stDepartCode);
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
  stCardState := '2';
  if aType = '0' then stCardState := '1';  //aType이 0 인경우만 정상

  if length(aEmCode) < 9 then
    aEmCode := FillZeroStrNum(aEmCode,9,True);

  stCardNo := MakeCardNo(aEmCode,aCardSeq);

  if CheckTB_EMPLOYEE('001',aEmCode,nFdmsID) then
  begin
    if (aGubun = '0') or (aGubun = '1') then
    begin
      if Not UpdateTB_EMPLOYEE(aEmCode,
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
                      '001') then Exit;
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aEmName,
                        '','아주대학교',aJijumName,aDepartName,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
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
      if Not InsertTB_EMPLOYEE(aEmCode,
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
                        '001') then Exit;
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aEmName,
                          '','아주대학교',aJijumName,aDepartName,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if ChecktTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if CheckTB_CARD(stCardNo) then
  begin
    if Not UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not InsertTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
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
  if L_stProgramType = '4' then   //충남대
  begin
    if copy(L_stLastRelayTime,1,8) = Formatdatetime('yyyymmdd',now - 1) then Exit; //어제 까지 연동 되었으면 빠져 나가자.
  end;
  if Not dmAdoRelay.DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
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
      if Not KTBundangDelRelay(L_stLastRelayDelTime) then Exit;
    end else if L_stProgramType = '4' then   //충남대학교 연동
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      if Not ChungNamRelay(L_stLastRelayTime) then Exit;  //충남대학교 연동건
    end else if L_stProgramType = '5' then
    begin
      StatusBar1.Panels[2].Text := 'RelayTimerTimer' + FormatDateTime('yyyymmddhhnnss',Now) + '-' +L_stLastRelayTime;
      DongYangUniversityRelay;  //동양미래대학교연동건
    end;

    if Not isDigit(L_stRelayTime) then  L_stRelayTime := '30';
    L_dtRelayActionTime := IncTime(Now,0,strtoint(L_stRelayTime),0,0);
    dmAdoRelay.AdoRelayConnected(L_stDBType, L_stDBIP, L_stDBPort,
                    L_stDBUserID, L_stDBUserPW, L_stDBName);
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
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  result := '000';

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    result := TJijumCode(JijumCodeList.Objects[nIndex]).jijumcode;
    Exit;
  end;

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
      //메모리 적재
      nIndex := JijumCodeList.IndexOf(aJijumName);
      if nIndex < 0 then
      begin
        oJijumCode := TJijumCode.Create(nil);
        oJijumCode.jijumcode := FindField('CO_JIJUMCODE').AsString;
        oJijumCode.JijumName := aJijumName;
        JijumCodeList.AddObject(aJijumName,oJijumCode);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetDepartCode(aCompanyCode,aJijumCode, aDepartName,aJijumName: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
begin
  result := '000';
  if aJijumName <> '' then
  begin
    nIndex := JijumCodeList.IndexOf(aJijumName);
    if nIndex > -1 then
    begin
      result := TJijumCode(JijumCodeList.Objects[nIndex]).GetDepartCode(aDepartName);
      if result <> '' then Exit;
      result := '000';
    end;
  end;
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
      if nIndex > -1 then
      begin
        TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(FindField('CO_DEPARTCODE').AsString,aDepartName);
      end;
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
var
  i : integer;
  nLength : integer;
begin
  result := '';
  if L_stProgramType = '1' then //아주대
  begin
    result := FillZeroStrNum(aIDNO,13,False) + FillZeroStrNum(aSeq,3,False);
  end else if L_stProgramType = '4' then //아주대
  begin
    nLength:= Length(aIDNO);
    for i := nLength + 1 to 13 do
    begin
      aIDNO := aIDNO + 'N';  
    end;
    //nLength:= Length(aIDNO);
    if Not isDigit(aSeq) then aSeq := '0';
    result := aIDNO + FillZeroNumber(strtoint(aSeq),2);
  end;
end;

procedure TfmMain.CreateJijumCode(aCompanyCode,aJijumName: string;
  var aJijumCode: string);
var
  nJijumCode : integer;
  nIndex : integer;
  oJijumCode : TJijumCode;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);

  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex < 0 then
  begin
    oJijumCode := TJijumCode.Create(nil);
    oJijumCode.jijumcode := aJijumCode;
    oJijumCode.JijumName := aJijumName;
    JijumCodeList.AddObject(aJijumName,oJijumCode);
  end;

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

procedure TfmMain.CreateDepartCode(aCompanyCode,aJijumCode, aDepartName,aJijumName: string;
  var aDepartCode: string);
var
  nIndex : integer;
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
  if aJijumName = '' then Exit;
  nIndex := JijumCodeList.IndexOf(aJijumName);
  if nIndex > -1 then
  begin
    TJijumCode(JijumCodeList.Objects[nIndex]).SetDepartCodeName(aDepartCode,aDepartName);
  end;
end;

function TfmMain.CheckTB_EMPLOYEE(aCompanyCode, aEmCode: string;
  var aFdmsID: integer): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := ' Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
      aFdmsID := FindField('FDMS_ID').AsInteger;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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

function TfmMain.InsertIntoTB_EMPHIS(aCompanyCode, aEmCode, afdmsID, aMode,
  aCardNo, aCardType, aEmName, aHandPhone, aCompanyName, aJijumName,
  aDepartName, aPosiName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPHIS(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  if afdmsID <> '' then
    stSql := stSql + ' FDMS_ID,';
  stSql := stSql + ' MODE, ';
  stSql := stSql + ' SEND_STATUS, ';
  stSql := stSql + ' CA_CARDNO, ';
  stSql := stSql + ' CA_CARDTYPE, ';
  stSql := stSql + ' SEND_STATUS2,';
  stSql := stSql + ' EH_INSERTTIME, ';
  stSql := stSql + ' EM_NAME, ';
  stSql := stSql + ' EM_HANDPHONE, ';
  stSql := stSql + ' COMPANY_NAME, ';
  stSql := stSql + ' JIJUM_NAME, ';
  stSql := stSql + ' DEPART_NAME, ';
  stSql := stSql + ' PO_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''1234567890'',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  if afdmsID <> '' then
    stSql := stSql + afdmsID + ',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCardType + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aHandPhone + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun,
  aCardNo, aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'RG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  stSql := stSql + '''' + aCompanyPhone + ''',';
  stSql := stSql + '''' + aHomePhone + ''',';
  stSql := stSql + '''' + aHandphone + ''',';
  stSql := stSql + '''' + aZipcode + ''',';
  stSql := stSql + '''' + aAddr1 + ''',';
  stSql := stSql + '''' + aAddr2 + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '' + afdmsId + ',';
  stSql := stSql + '''' + aEmTypeCode + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, aRegGubun,
  aCardNo, aEmpImg, afdmsId, aEmTypeCode: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Update TB_EMPLOYEE set ';
  stSql := stSql + 'CO_JIJUMCODE =''' + aJijumCode + ''',';
  stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  if aHandphone <> '' then stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  stSql := stSql + 'RG_CODE = ''' + aEmTypeCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.InsertTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then
  begin
    result := True;
    Exit;
  end;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''SYSTEM'')' ;

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_CARD(aCardNo, aCardGubun, aCardType, aEmpID,
  aCompanyCode: string;aDoorGrade:string=''): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  if aDoorGrade <> '' then stSql := stSql + 'CA_DOORGRADE = ''' + aDoorGrade + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

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

function TfmMain.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';

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
      if RecordCount > 0 then Result := True;
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
  else if L_stProgramType = '4' then //충남대
    MDIChildShow('TfmChungNamCurrentState');

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

function TfmMain.ChecktTB_CARD_Employee(aCompanyCode, aEmCode,
  aCardNo: string;var aOldCardNo:string): boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmCode + ''' ';
  if aCompanyCode <> '' then stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';  //등록된 카드 중에서

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
      While Not Eof do
      begin
        if FindField('CA_CARDNO').AsString <> aCardNo then
        begin
          aOldCardNo := FindField('CA_CARDNO').AsString;
          result := True;
          Exit;
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

function TfmMain.UpdateTB_CARD_Change(aOldCardNo,
  aNewCardNo: string): Boolean;
var
  stSql : string;
  bResult : Boolean;
begin
  Result := False;
  if aOldCardNo = '' then Exit;
  DeleteTB_DEVICECARDNOCardNo(aNewCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
  CopyGradeOldCard(aOldCardNo,aNewCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
  bResult := UpdateTB_DEVICECARDNO_permit(aOldCardNo,'N'); //모든 카드 권한을 삭제 처리함
  //if Not bResult then Exit;

  stSql := ' delete from  TB_CARD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' +  aOldCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

  InsertTB_EMPHISCardStop(aOldCardNo);
end;

function TfmMain.DeleteTB_DEVICECARDNOCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.CopyGradeOldCard(aOldCardNO, aNewCardNO: string): Boolean;
var
  stSql : string;
begin
  if Trim(aNewCardNO) = '' then Exit;
    stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' CA_CARDNO, ';
    stSql := stSql + ' DE_DOOR1, ';
    stSql := stSql + ' DE_DOOR2, ';
    stSql := stSql + ' DE_USEACCESS, ';
    stSql := stSql + ' DE_USEALARM, ';
    stSql := stSql + ' DE_TIMECODE, ';
    stSql := stSql + ' DE_PERMIT, ';
    stSql := stSql + ' DE_RCVACK, ';
    stSql := stSql + ' DE_UPDATETIME, ';
    stSql := stSql + ' DE_UPDATEOPERATOR) ';
    stSql := stSql + ' select ''' + GROUPCODE + ''', ';
    stSql := stSql + ' b.AC_NODENO, ';
    stSql := stSql + ' b.AC_ECUID, ';
    stSql := stSql + ' ''' + aNewCardNO + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCardNO + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';

    result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNO_permit(aCardNo,
  aPermit: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' DE_PERMIT = ''' + aPermit + ''', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.InsertTB_EMPHISCardStop(aCardNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stCompanyCode : string;
  stEmpID : string;
  stfdmsID : string;
  stCardType : string;
  stEmpNM : string;
  stHandphone : string;
  stCompanyName : string;
  stJijumName : string;
  stDepartName : string;
  stPosiName : string;
begin
  if G_stDBType = 'MSSQL' then stSql := MSSQL.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if G_stDBType = 'FB' then stSql := FireBird.SelectTB_CARDJoinTBEmployee
  else Exit;
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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
      if RecordCount = 0 then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').asstring;
      stEmpID := FindField('EM_CODE').asstring;
      stfdmsID := FindField('FDMS_ID').asstring;
      stCardType := FindField('CA_CARDTYPE').asstring;
      stEmpNM := FindField('EM_NAME').asstring;
      stHandphone := FindField('EM_HANDPHONE').asstring;
      stCompanyName := FindField('COMPANYNAME').asstring;
      stJijumName := FindField('JIJUMNAME').asstring;
      stDepartName := FindField('DEPARTNAME').asstring;
      stPosiName := FindField('PO_NAME').asstring;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmpID,stfdmsID,'2',aCardNo,stCardType,
           stEmpNM,stHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//입력
  result := dmDBModule.ProcessExecSQL(stSql);

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
  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'',DE_RCVACK = ''N'' where CA_CARDNO = ''' + aCardNo + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_CARD where CA_CARDNO = ''' + aCardNo + ''' ';
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
                               FindField('CARD_STGB').AsString,FindField('CARD_UPDT').AsString,'') then
      begin
        if Not FindField('CARD_UPDT').IsNull then
        begin
          Try
            L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',FindField('CARD_UPDT').AsDateTime);
            UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
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

function TfmMain.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.JUNNAMConversionEmployee(aGubun, aJijumCode, aEmCode,
  aEmCophone, aEmName, aDepartName, aCardSeq, aRegState, aEmState,
  aUpdateTime,aJijumName: string): Boolean;
var
  stCardNo : string;
  stCompanyCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  nFdmsID : integer;
  stOldCodeNo : string;
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
  stDepartCode := GetDepartCode(stCompanyCode,aJijumCode,aDepartName,aJijumName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,aJijumCode,aDepartName,aJijumName,stDepartCode);
  end;

  stPosiCode := '000';
  stCardState := '2';
  if (aRegState = '01') and (aEmState = '01') then stCardState := '1';  //재직중이면서 정상 카드 인경우만 사용 가능

  if CheckTB_EMPLOYEE('001',aEmCode,nFdmsID) then
  begin
    if Not UpdateTB_EMPLOYEE(aEmCode,
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
                    '001') then Exit;
    InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','전남대병원','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(GetFdmsID);
    if Not InsertTB_EMPLOYEE(aEmCode,
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
                      '001') then Exit;
    InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','전남대병원','',aDepartName,'');
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if ChecktTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if CheckTB_CARD(stCardNo) then
  begin
    if Not UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not InsertTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
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
            UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
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
    UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
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
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName,stDepartCode);
  end;

  stPosiCode := GetPosiCode(stCompanyCode,aPosiName);
  if stPosiCode = '000' then
  begin
    if Trim(aPosiName) <> '' then
      CreatePosiCode(stCompanyCode,aPosiName,stPosiCode);
  end;

  stCardState := '1';  //무조건 정상으로 체크

  if CheckTB_EMPLOYEE('',aEmCode,nFdmsID) then  //KT카드는 사번만 체크하자. 사번 존재시 아무 작업 하지 말자.
  begin
    if stCardState = '1' then Exit; //카드 상태가 정상이면 처리 하지 말자.
    //여기는 퇴직 데이터만 처리 하자.
    (*
    if Not UpdateTB_EMPLOYEE(aEmCode,
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
    UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
    InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','전남대병원','',aDepartName,'');
    *)
    Exit;
  end else
  begin
    if stCardState <> '1' then Exit; //사원이 없는데 퇴직 한 사람이면 Insert 할필요 없다.
    nFdmsID := strtoint(GetFdmsID);
    if Not InsertTB_EMPLOYEE(aEmCode,
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
                      '002') then Exit;
    InsertIntoTB_EMPHIS(stCompanyCode,aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','KT분당',aJijumName,aDepartName,'');
  end;

  if Not CheckTB_CARD(stCardNo) then
  begin
    //사번에 다른 카드가 있으면 권한복사
    if ChecktTB_CARD_Employee('',aEmCode,stCardNo,stOldCodeNo) then  //회사코드는 체크하지 말자.
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김
      DeleteTB_DEVICECARDNOCardNo(stCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
      CopyGradeOldCard(stOldCodeNo,stCardNo); //여기서 권한을 복사
    end;
    if Not InsertTB_CARD(stCardNo,'1',stCardState,aEmCode,stCompanyCode) then Exit;
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
  nIndex : integer;
  oPosiCode : TPosiCode;
begin
  result := '000';

  nIndex := PosiCodeList.IndexOf(aPosiName);
  if nIndex > -1 then
  begin
    result := TPosiCode(PosiCodeList.Objects[nIndex]).Posicode;
    Exit;
  end;

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
      if nIndex < 0 then
      begin
        oPosiCode := TPosiCode.Create(nil);
        oPosiCode.Posicode := FindField('PO_POSICODE').AsString;
        oPosiCode.PosiName := aPosiName;
        PosiCodeList.AddObject(aPosiName,oPosiCode);
      end;
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
  oPosiCode : TPosiCode;
  nIndex : integer;
begin
  nPosiCode := GetMaxPosiCode(aCompanyCode);
  aPosiCode := FillZeroNumber(nPosiCode,3);
  InsertIntoTB_POSI(aCompanyCode,aPosiCode,aPosiName);
  nIndex := PosiCodeList.IndexOf(aPosiName);
  if nIndex < 0 then
  begin
    oPosiCode := TPosiCode.Create(nil);
    oPosiCode.Posicode := aPosiCode;
    oPosiCode.PosiName := aPosiName;
    PosiCodeList.AddObject(aPosiName,oPosiCode);
  end;
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
    stSql := stSql + ' Where repl_date > ''' + stDate + ''' ' ;
    stSql := stSql + ' AND repl_date <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 10초전
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
            UpdateTB_CONFIG('EMPCONV','DELTIME',L_stLastRelayDelTime);
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
begin
  result := False;
  if Not CheckTB_EMPLOYEE('',aEmCode,nFdmsID) then Exit;  //사원번호가 없으면 빠져 나가자.
  if Length(aDelDate) <> 8 then Exit; //
  UpdateTB_EMPLOYEE_EmCodeEndTime(aEmCode,aDelDate);  //퇴직일자 바꿔주자.
  UpdateTB_DEVICECARDNO_EmCodeReSend(aEmCode); //변경된 사번 정보에 해당하는 카드 재전송
  InsertIntoTB_EMPHIS(L_stCompanyCode,aEmCode,inttostr(nFdmsID),
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

function TfmMain.ChungNamRelay(aDate: String): Boolean;
var
  stSql : string;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode : string;
  stEmpTypeCode,stStateCode : string;
  nIndex : integer;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;

  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRUNC(TRET_DT) as TRET_DT  from VW_KT_USR ';
  stSql := stSql + ' where TRUNC(TRET_DT) > TO_DATE(''' + copy(aDate,7,2) + '/' + copy(aDate,5,2) + '/' + copy(aDate,1,4) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' AND TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' Order by TRET_DT';
  if L_stDBType = '1' then  //테스트용
  begin
    stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRET_DT  from VW_KT_USR ';
    stSql := stSql + ' Order by TRET_DT';
  end;

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      stCompanyCode := '001';
      stJijumCode := GetJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString);
      if stJijumCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_L').AsString) <> '' then
          CreateJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString,stJijumCode);
      end;
      stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString);
      if stDepartCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_M').AsString) <> '' then
          CreateDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString,stDepartCode);
      end;
      stPosiCode := GetPosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString);
      if stPosiCode = '000' then
      begin
        if Trim(FindField('STTS_DIV_CD_NM').AsString) <> '' then
          CreatePosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString,stPosiCode);
      end;
      stEmpTypeCode := GetEmpTypeCode(FindField('ST_CD_NM').AsString);
      if stEmpTypeCode = '000' then
      begin
        if Trim(FindField('ST_CD_NM').AsString) <> '' then
          CreateEmTypeCode(FindField('ST_CD_NM').AsString,stEmpTypeCode);
      end;
      stStateCode := '3'; //정지
      nIndex := RegCodeList.indexof(FindField('ST_CD').AsString);
      if nIndex > -1 then stStateCode := '1';
      if FindField('ST_CD').AsString = '' then stStateCode := '1';
      if FindField('ST_CD').IsNull then stStateCode := '1';

      PersonCnuDataConversion(stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmpTypeCode,
                           FindField('ID').AsString,'0',FindField('NM').AsString,FindField('CELL_NO').AsString,stStateCode,
                           FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString);

      ChungNamEventState(FindField('ID').AsString,FindField('NM').AsString,FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString,
                         FindField('CELL_NO').AsString,FindField('ST_CD').AsString);
      Application.ProcessMessages;
      Next;
    end;
  end;

  stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRUNC(TRET_DT) as TRET_DT  from VW_KT_APS ';
  stSql := stSql + ' where TRUNC(TRET_DT) > TO_DATE(''' + copy(aDate,7,2) + '/' + copy(aDate,5,2) + '/' + copy(aDate,1,4) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' AND TRUNC(TRET_DT) < TO_DATE(''' + formatdateTime('dd/mm/yyyy',now) + ''',''dd/mm/yyyy'')';
  stSql := stSql + ' Order by TRET_DT';
  
  if L_stDBType = '1' then  //테스트용
  begin
    stSql := 'select ORGN_NM_L,ORGN_NM_M,STTS_DIV_CD_NM,ID,NM,CELL_NO,ST_CD,ST_CD_NM,TRET_DT  from VW_KT_APS ';
    stSql := stSql + ' Order by TRET_DT';
  end;
  
  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      stCompanyCode := '001';
      stJijumCode := GetJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString);
      if stJijumCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_L').AsString) <> '' then
          CreateJijumCode(stCompanyCode,FindField('ORGN_NM_L').AsString,stJijumCode);
      end;
      stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString);
      if stDepartCode = '000' then
      begin
        if Trim(FindField('ORGN_NM_M').AsString) <> '' then
          CreateDepartCode(stCompanyCode,stJijumCode,FindField('ORGN_NM_M').AsString,FindField('ORGN_NM_L').AsString,stDepartCode);
      end;
      stPosiCode := GetPosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString);
      if stPosiCode = '000' then
      begin
        if Trim(FindField('STTS_DIV_CD_NM').AsString) <> '' then
          CreatePosiCode(stCompanyCode,FindField('STTS_DIV_CD_NM').AsString,stPosiCode);
      end;
      stEmpTypeCode := GetEmpTypeCode(FindField('ST_CD_NM').AsString);
      if stEmpTypeCode = '000' then
      begin
        if Trim(FindField('ST_CD_NM').AsString) <> '' then
          CreateEmTypeCode(FindField('ST_CD_NM').AsString,stEmpTypeCode);
      end;
      stStateCode := '1'; //직원은 모두 등록 상태로 처리하자.
      //nIndex := RegCodeList.indexof(FindField('ST_CD').AsString);
      //if nIndex > -1 then stStateCode := '1';
      //if FindField('ST_CD').AsString = '' then stStateCode := '1';
      //if FindField('ST_CD').IsNull then stStateCode := '1';
      PersonCnuDataConversion(stCompanyCode,stJijumCode,stDepartCode,stPosiCode,stEmpTypeCode,
                           FindField('ID').AsString,'0',FindField('NM').AsString,FindField('CELL_NO').AsString,stStateCode,
                           FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString);

      ChungNamEventState(FindField('ID').AsString,FindField('NM').AsString,FindField('ORGN_NM_L').AsString,FindField('ORGN_NM_M').AsString,FindField('STTS_DIV_CD_NM').AsString,
                         FindField('CELL_NO').AsString,FindField('ST_CD').AsString);

      Application.ProcessMessages;
      Next;
    end;
  end;
  L_stLastRelayTime := formatDateTime('yyyymmddhhnnsszzz',Now - 1);
  UpdateTB_CONFIG('EMPCONV','LASTTIME',L_stLastRelayTime);
  Result := True;
end;

{ TJijumCode }

constructor TJijumCode.Create(AOwner: TComponent);
begin
  inherited;
  DepartNameList := TStringList.Create;
end;

destructor TJijumCode.Destroy;
var
  i : integer;
begin
  if DepartNameList.Count > 0 then
  begin
    for i := DepartNameList.Count - 1 downto 0 do
    begin
      TDepartCode(DepartNameList.Objects[i]).Free;
    end;
  end;
  DepartNameList.Free;
  inherited;
end;

function TJijumCode.GetDepartCode(aDepartName: string): string;
var
  nIndex : integer;
begin
  result := '';
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex < 0 then Exit;
  result := TDepartCode(DepartNameList.Objects[nIndex]).Departcode;
end;

function TJijumCode.SetDepartCodeName(aDepartCode,
  aDepartName: string): Boolean;
var
  nIndex : integer;
  oDepartCode : TDepartCode;
begin
  result := False;
  nIndex := DepartNameList.IndexOf(aDepartName);
  if nIndex > -1 then Exit;
  oDepartCode := TDepartCode.Create(nil);
  oDepartCode.Departcode := aDepartCode;
  oDepartCode.DepartName := aDepartName;
  DepartNameList.AddObject(aDepartName,oDepartCode);
  result := True;
end;

function TfmMain.GetEmpTypeCode(aEmTypeName: string): string;
var
  stSql : string;
  nIndex : integer;
  oEmTypeCode : TEmTypeCode;
  TempAdoQuery : TADOQuery;
begin
  result := '000';

  nIndex := EmTypeCodeList.IndexOf(aEmTypeName);
  if nIndex > -1 then
  begin
    result := TEmTypeCode(EmTypeCodeList.Objects[nIndex]).EmTypecode;
    Exit;
  end;

  stSql := ' select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where RG_NAME = ''' + aEmTypeName + ''' ';

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
      //메모리 적재
      nIndex := EmTypeCodeList.IndexOf(aEmTypeName);
      if nIndex < 0 then
      begin
        oEmTypeCode := TEmTypeCode.Create(nil);
        oEmTypeCode.EmTypeCode := FindField('RG_CODE').AsString;
        oEmTypeCode.EmTypeName := aEmTypeName;
        EmTypeCodeList.AddObject(aEmTypeName,oEmTypeCode);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMain.CreateEmTypeCode(aName: string;
  var aEmpTypeCode: string);
var
  nEmTypeCode : integer;
  oEmTypeCode : TEmTypeCode;
  nIndex : integer;
begin
  nEmTypeCode := GetMaxEmTypeCode;
  aEmpTypeCode := FillZeroNumber(nEmTypeCode,3);
  InsertIntoTB_RELAYGUBUN(aEmpTypeCode,aName);
  nIndex := EmTypeCodeList.IndexOf(aName);
  if nIndex < 0 then
  begin
    oEmTypeCode := TEmTypeCode.Create(nil);
    oEmTypeCode.EmTypecode := aEmpTypeCode;
    oEmTypeCode.EmTypeName := aName;
    EmTypeCodeList.AddObject(aName,oEmTypeCode);
  end;
end;

function TfmMain.GetMaxEmTypeCode: integer;
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
  aRgName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RELAYGUBUN(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'RG_CODE,';
  stSql := stSql + 'RG_NAME) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aRgCode + ''',';
  stSql := stSql + '''' + aRgName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMain.PersonCnuDataConversion(aCompanyCode, aJijumCode,
  aDepartCode, aPosiCode, aEmpTypeCode, aEmCode, aSeq, aEmName,
  aPhoneNumber, aStateCode, aJijumName, aDepartName, aPosiName: string);
var
  stSql : string;
  stCardNo : string;
  stRegGubun : string;
  nFdmsID : integer;
  stTemp : string;
begin

  if Length(aEmCode) <> 9 then aEmCode := FillZeroStrNum(aEmCode,9,True);

  stCardNo := MakeCardNo(aEmCode,aSeq);
  stRegGubun := aStateCode;
  if CheckTB_EMPLOYEE(aCompanyCode,aEmCode,nFdmsID) then
  begin
    if aStateCode <> '3' then
    begin
      UpdateTB_EMPLOYEE(aEmCode,
                      aEmName,
                      aCompanyCode,
                      aJijumCode,
                      aDepartCode,
                      aPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      aPhoneNumber,
                      stRegGubun,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      aEmpTypeCode);
      InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(nFdmsID),'2',stCardNo,aStateCode,aEmName,'','충남대',aJijumName,aDepartName,aPosiName);
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(nFdmsID),'3',stCardNo,aStateCode,aEmName,'','충남대',aJijumName,aDepartName,aPosiName);
    end;
  end else
  begin
    if aStateCode <> '3' then
    begin
      nFdmsID := strtoint(GetFdmsID);
      InsertTB_EMPLOYEE(aEmCode,
                      aEmName,
                      aCompanyCode,
                      aJijumCode,
                      aDepartCode,
                      aPosiCode,
                      '',
                      '20000101',
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      aPhoneNumber,
                      stRegGubun,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      aEmpTypeCode);
      InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,inttostr(nFdmsID),'1',stCardNo,'1',aEmName,'','충남대',aJijumName,aDepartName,aPosiName);
    end;
  end;
  if aStateCode <> '3' then
  begin
    if Not CheckTB_CARDEMPCODE(aCompanyCode,aEmCode) then   //카드가 없는 경우
    begin
      InsertTB_CARD(stCardNo,'3',stRegGubun,aEmCode,aCompanyCode);
    end;
  end else
  begin
    if CheckTB_CARDEMPCODE(aCompanyCode,aEmCode) then
    begin
      DeleteTB_DEVICECARDNO_EmCode(aCompanyCode,aEmCode);
    end;
  end;

end;

function TfmMain.CheckTB_CARDEMPCODE(aCompanyCode,
  aEmpID: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' where EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

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
      if RecordCount > 0 then Result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

Function TfmMain.DeleteTB_DEVICECARDNO_EmCode(aCompanyCode,
  aEmCode: string):Boolean;
var
  stSql : string;
begin
  stSql := ' Update A set A.DE_PERMIT = ''N'',A.DE_RCVACK = ''N'' ';
  stSql := stSql + ' From TB_DEVICECARDNO A,TB_CARD B ';
  stSql := stSql + ' WHERE A.GROUP_CODE = B.GROUP_CODE ';
  stSql := stSql + ' AND A.CA_CARDNO = B.CA_CARDNO ';
  stSql := stSql + ' AND B.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND B.EM_CODE = ''' + aEmCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMain.ChungnamEventState(aEmID,aEmName,aJijumName,aDepartName,aPosiName,aHandphone,aStateCode: string);
var
  fmChungNamCurrentState : TForm;
begin
  if L_bChungNamShowState then
  begin
    fmChungNamCurrentState := MDIForm('TfmChungNamCurrentState');
    if fmChungNamCurrentState <> nil then
    begin
      TfmChungNamCurrentState(fmChungNamCurrentState).ChungnamEventState(aEmID,aEmName,aJijumName,aDepartName,aPosiName,aHandphone,aStateCode);
    end;
  end;
end;

procedure TfmMain.CommandArrayCommandsTChungNAMStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bChungNAMShowState := True
   else L_bChungNAMShowState := False; 
end;

function TfmMain.DongYangConversionEmployee(aJijumName, aDepartName,
  aPosiCode, aEmName, aEmCode, aCardSeq, aType, aGubun,aCardNo: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCodeNo : string;
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
  stDepartCode := GetDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,aJijumName,stDepartCode);
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
  stCardState := '2';
  if aType = '0' then stCardState := '1';  //aType이 0 인경우만 정상

  //if length(aEmCode) < 9 then
  //  aEmCode := FillZeroStrNum(aEmCode,9,True);

  if Pos('$', aCardNo) = 0 then aCardNo := '$' + aCardNo
  else aCardNo := aCardNo;
  stCardNo := FillZeroNumber(StrToInt64Def(aCardNo, 0),10);

  if CheckTB_EMPLOYEE('001',aEmCode,nFdmsID) then
  begin
    if (aGubun = '0') or (aGubun = '1') then
    begin
      if Not UpdateTB_EMPLOYEE(aEmCode,
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
                      '001') then Exit;
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '2',stCardNo,stCardState,aEmName,
                        '','동양미래대학교',aJijumName,aDepartName,'');
    end else
    begin
      DeleteTB_EMPLOYEE(aEmCode,stCardNo);
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '3',stCardNo,stCardState,aEmName,
                        '','동양미래대학교',aJijumName,aDepartName,'');
      result := True;
      Exit;
    end;
  end else
  begin
    if (aGubun = '0') or (aGubun = '1') then
    begin
      nFdmsID := strtoint(GetFdmsID);
      if Not InsertTB_EMPLOYEE(aEmCode,
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
                        '001') then Exit;
      InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                          '1',stCardNo,stCardState,aEmName,
                          '','동양미래대학교',aJijumName,aDepartName,'');
    end else
    begin
      result := True;
      Exit;
    end;
  end;
  //학번에 다른 카드가 있으면 기존 카드 정지 후
  if ChecktTB_CARD_Employee('001',aEmCode,stCardNo,stOldCodeNo) then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    UpdateTB_CARD_Change(stOldCodeNo,stCardNo);
  end;
  if CheckTB_CARD(stCardNo) then
  begin
    if Not UpdateTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end else
  begin
    if Not InsertTB_CARD(stCardNo,'1',stCardState,aEmCode,'001') then Exit;
  end;

  if stCardState <> '1' then  //비정상
  begin
    UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end;

  result := True;
end;

function TfmMain.DongYangDelete_MFC_HUB(aSEQNO: integer): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From CARD.MFC_HUB ';
  stSql := stSql + ' where HUB_SEQNO = ' + inttostr(aSEQNO) ;

  result := dmAdoRelay.ProcessExecSQL(stSql);

end;

function TfmMain.DongYangUniversityRelay(aCount: integer): Boolean;
var
  stSql : string;
  nFdmsID : integer;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := ' Select * from MFC_HUB ';
  //if aCount > 0 then stSql := stSql + ' Where RowNum <= ' + inttostr(aCount);
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
      if DongYangConversionEmployee(FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                               FindField('HUB_IDDI').AsString,FindField('HUB_NAME').AsString,
                               FindField('HUB_IDNO').AsString,FindField('HUB_ISFG').AsString,
                               FindField('HUB_LSFG').AsString,FindField('HUB_SDCO').AsString,
                               FindField('HUB_CHIPSERN0').AsString) then
      begin
        //DongYangDelete_MFC_HUB(FindField('HUB_SEQNO').AsInteger);
      end;
      //StatusBar1.Panels[2].Text := FindField('HUB_UNNM').AsString + '연동완료';
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

end.
