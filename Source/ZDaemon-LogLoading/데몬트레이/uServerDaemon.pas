unit uServerDaemon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, StdCtrls, ExtCtrls, ComCtrls,
  ToolWin, ActnList, jpeg, ScktComp, DateUtils,DB,iniFiles,
  DXServerCore, DXString, DXUnicastDataQueue, uSubForm,
  CommandArray, ADODB, LMDCustomComponent, LMDFileCtrl, Gauges,
  FolderDialog,ActiveX, OoMisc, 
  uDataModule1,systeminfos,Registry, FindFile,
  SyncObjs, Buttons,Contnrs, AppEvnts,WinSock  ;

//{$DEFINE TApdWinsockport}
//{$DEFINE TClientSocket}
{$DEFINE TWinSocket}
//{$DEFINE DEBUG}  //

const
  ClientConnectTime = 600000;
  AllSendClientDelayTime = 10;

type

  TfmMain = class(TfmASubForm)
    tbi: TantTaskbarIcon;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    miExit: TMenuItem;
    Timer1: TTimer;
    Timer2: TTimer;

    MainMenu1: TMainMenu;
    N1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    Image1: TImage;
    StatusBar1: TStatusBar;
    RelayCardServerQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    AttendADOTemp: TADOQuery;
    DBProcessTimer: TTimer;
    ApplicationEvents1: TApplicationEvents;
    AdoConnectCheckTimer: TTimer;
    procedure DBProcessTimerTimer(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure miShowClick(Sender: TObject);
    procedure bt_HideClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure Action_ExitExecute(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure AdoConnectCheckTimerTimer(Sender: TObject);

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

  private
    L_bClose : Boolean;
    L_bDBProcessTimerStart : Boolean;
    InOutCardReaderList : TStringList; //입퇴실 카운트 기기 000(노드번호)00(ECUID)0(ReaderNo)
    InOutCountList : TStringList; //입퇴실 카운트 -1(퇴실) 1(입실) 0(사용안함)
    InOutGroupReaderList : TStringList;

    wmTaskbar : word;
    procedure DefaultHandler(var Message);override;  //데몬트레이 사라짐 방지

    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    procedure TimerFree;
    Function FileToDBLoad:Boolean;
    Function FileToDBInsertAlarmEvent(aFileName:string):Boolean;
    Function FileToDBInsertCardAccessEvent(aFileName:string):Boolean;
    Function InsertTB_ALARMEVENT(aTime,aNodeNo,aEcuID,aMsgNo,
                      aSubClass,aSubAddr,aZoneCode,aMode,aPortNo,
                      aStatus,aState,aOper,aNewStateCode,aAlarmView,
                      aAlarmSound,aAlarmGrade,aCheckOk,aCardNo,aCompanyCode,aEmCode:string):string;
    Function DupCheckTB_ALARMEVENT(aTime, aNodeNo, aEcuID,aMsgNo: string): Boolean;
    Function LoadInOutReader : Boolean; //입퇴실 리더 정보를 로드 한다.
    Function UpdateTB_INOUTCOUNT_Add(aDate,aNodeNo,aECUID,aDoorNo,aInOutCount:string):Boolean;
    Function UpdateTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo,aNodeNo,aEcuID,aReaderNo,aTime:string):Boolean;
    Function DeleteTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo:string):Boolean;
    Function InsertTB_INOUTGROUPLIST(aInOutGroupCode,aCardNo,aNodeNo,aEcuID,aReaderNo,aTime:string):Boolean;
    Function CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID, aDoorNo:string):Boolean;

    procedure GetMonitoringTypeConfig;




  end;

var
  fmMain: TfmMain;


implementation
uses
  uDataBaseConfig,
  uLomosUtil,
  udmAdoQuery,
  uCommonSql,
  uMDBSql,
  uPostGreSql,
  uMssql,
  uZeronEventDataBase,
  uZeronEventDataBaseConfig;



{$R *.dfm}



procedure TfmMain.miExitClick(Sender: TObject);
begin
  L_bClose := True;
  Close;

end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  stKey : string;
  stSaupId : string;
  bResult : Boolean;
  stDate : string;
  LogoFile : string;
  ini_fun : TiniFile;
begin

  L_bDBProcessTimerStart := True;
  wmTaskbar := RegisterWindowMessage('TaskbarCreated');
  Master_ID := 'SYSTEM';


  Self.ModuleID := 'Main';
  ExeFolder  := ExtractFileDir(Application.ExeName);
  G_bApplicationTerminate := False;

  InOutCardReaderList := TStringList.Create;
  InOutCountList := TStringList.Create; //입퇴실 카운트 -1(퇴실) 1(입실) 0(사용안함)
  InOutGroupReaderList := TStringList.Create;

  tbi.Visible := True;
  tbi.Hint := '송수신로그서버 정지';
  StatusBar1.Panels[0].Text := '송수신로그서버 정지';
  Timer1.Enabled := False;

  if G_bApplicationTerminate then Exit;

  if FileExists(ExtractFileDir(Application.ExeName) + '\logo.ico') then
  begin
    self.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
    Application.Icon.LoadFromFile(ExtractFileDir(Application.ExeName) + '\logo.ico');
  end;
  LogoFile := ExeFolder + '\..\image\DaemonLogo.JPG';
  if FileExists(LogoFile) then
  Image1.Picture.LoadFromFile(LogoFile);
  DataModule1.OnAdoConnected := DataModuleAdoConnected;

  if not DirectoryExists(ExeFolder + '\LogDB') then
  begin
   if Not CreateDir(ExeFolder + '\LogDB') then
   begin
   end;
  end;

  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TDataBaseConfig.GetObject.DataBaseConnect(False);
  end;
  if Not TDataBaseConfig.GetObject.DBConnected then
  begin
    showmessage('데이터베이스 접속 실패입니다. 데이터베이스 환경설정을 확인하여 주세요.');
    L_bClose := True;
    Application.Terminate;
    Exit;
  end;

  if Not TZeronEventDataBaseConfig.GetObject.DBConnected then
  begin
    Delay(1000);
    TZeronEventDataBaseConfig.GetObject.DataBaseConnect(False);
  end;

  GetMonitoringTypeConfig;

  DBProcessTimer.Enabled := True;
  tbi.Hint := 'FormCreate';

end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  fmCurrentState : TForm;
  fmKTTMonitoring : TForm;
  fmDDNSMonitoring : TForm;
  fmMonitoringState : TForm;
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
    Exit;
  End;

end;

procedure TfmMain.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.bt_HideClick(Sender: TObject);
begin
  Visible := False;
end;

procedure TfmMain.FormActivate(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Timer1.Enabled := True;
  tbi.Hint := 'ZDAEMON_LOGServer 정상(Active)';
end;

//데몬 폼 HIDE
procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Visible:=False;
  Timer1.Enabled:=False;
end;

procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_ExitExecute(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;



procedure TfmMain.Timer2Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Try
    StatusBar1.Panels[4].Text := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  Except
  End;
end;



procedure TfmMain.FormResize(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Width := StatusBar1.Width - StatusBar1.Panels[0].Width - statusBar1.Panels[1].Width - statusbar1.Panels[3].Width - statusbar1.Panels[4].Width - statusbar1.Panels[5].Width - statusbar1.Panels[6].Width;
end;

function TfmMain.InsertTB_ALARMEVENT(aTime, aNodeNo, aEcuID, aMsgNo,
  aSubClass, aSubAddr, aZoneCode, aMode, aPortNo, aStatus, aState,
  aOper,aNewStateCode,aAlarmView,aAlarmSound,aAlarmGrade,aCheckOk,
  aCardNo,aCompanyCode,aEmCode: string): string;
var
  stSql : string;
  stAlNodeNo : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Insert Into TB_ALARMEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AL_DATE,';
  stSql := stSql + 'AL_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_MSGNO,';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE,';
  stSql := stSql + 'AL_SUBADDR,';
  stSql := stSql + 'AL_ZONECODE,';
  stSql := stSql + 'AL_ALARMMODECODE,';
  stSql := stSql + 'AL_ZONENO,';
  stSql := stSql + 'AL_ZONESTATE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE,';
  stSql := stSql + 'AL_OPERATOR,';
  stSql := stSql + 'AL_STATUSCODE2, ';
  stSql := stSql + 'AL_ISALARM,';
  stSql := stSql + 'AL_SOUND,';
  stSql := stSql + 'AL_ALARMGRADE,';
  stSql := stSql + 'AL_INPUTTIME,';
  stSql := stSql + 'AL_CHECKOK, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'EM_CODE) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE +''',';
  stSql := stSql + '''' + copy(aTime,1,8) +''',';
  stSql := stSql + '''' + copy(aTime,9,6) +''',';
  stSql := stSql + aNodeNo +',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMsgNo + ''',';
  stSql := stSql + '''' + aSubClass + ''',';
  stSql := stSql + '''' + aSubAddr + ''',';
  stSql := stSql + '''' + aZoneCode + ''',';
  stSql := stSql + '''' + aMode + ''',';
  stSql := stSql + '''' + aPortNo +''',';
  stSql := stSql + '''' + aState  +''',';
  stSql := stSql + '''' + aStatus +''',';
  stSql := stSql + '''' + aOper + ''',';
  stSql := stSql + '''' + aNewStateCode + ''',';
  stSql := stSql + '''' + aAlarmView[1] + ''',';
  stSql := stSql + '''' + aAlarmSound[1] + ''',';
  stSql := stSql + '' + aAlarmGrade + ',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddhhnnss',Now) + ''',';
  stSql := stSql + '''' + aCheckOk + ''', ';
  stSql := stSql + '''' + aCardNo + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''') ';

  result := stSql;

end;



procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i : integer;
begin
  G_bApplicationTerminate := True;
  Delay(1000);


  L_bDBProcessTimerStart := False;
  DBProcessTimer.Enabled := False;

  InOutCardReaderList.free; //입퇴실 카운트 기기 000(노드번호)00(ECUID)0(ReaderNo)
  InOutCountList.free; //입퇴실 카운트 -1(퇴실) 1(입실) 0(사용안함)
  InOutGroupReaderList.free;



  TimerFree;
  tbi.Visible := False;
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


function TfmMain.DupCheckTB_ALARMEVENT(aTime, aNodeNo, aEcuID,
  aMsgNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;

  stSql := ' select AL_DATE,AL_TIME from TB_ALARMEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aMsgNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;


procedure TfmMain.DataModuleAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  if Not DBConnected then
  begin
    AdoConnectCheckTimer.Enabled := True;
  end;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  tbi.Visible := False;
end;



procedure TfmMain.TimerFree;
begin

  DBProcessTimer.Enabled := False;
  Timer1.Enabled := False;
  Timer2.Enabled := False;
  DBProcessTimer.Free;
  Timer1.Free;
  Timer2.Free;

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


procedure TfmMain.DBProcessTimerTimer(Sender: TObject);
var
  stTemp : string;
  stInOutcode : string;
  stInOutCount : string;
  stInOutGroupCode :string;
  stClientSendData : string;
  stSql : string;
  nInOutIndex : integer;
  nWorkTypeIndex : integer;
  bResult : Boolean;
begin
  inherited;
  DBProcessTimer.Enabled := False;
  Try
    if Not TDataBaseConfig.GetObject.DBConnected then
    begin
      StatusBar1.Panels[2].Text := ' DBConnected Fail';
      Exit;
    end;
    FileToDBLoad;
  Finally
    DBProcessTimer.Enabled := L_bDBProcessTimerStart;
  End;
end;


procedure TfmMain.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
  inherited;
   if Msg.message=WM_USER then
   begin
      if Msg.WParam = SC_MAXIMIZE then
      begin
        tbiDblClick(self);
      end else if Msg.WParam = SC_CLOSE then
      begin
        L_bClose := True;
        Close;
      end;
   end;
end;


function TfmMain.FileToDBLoad: Boolean;
var
	iFindResult: integer;
	srSchRec : TSearchRec;
  EventFileNameList : TStringList;
  i : integer;
  stFileName : string;
  bResult : Boolean;
  stTemp1,stTemp2,stTemp3 : string;

begin
  Try
    EventFileNameList := TStringList.Create;
    iFindResult := FindFirst(ExeFolder + '\LogDB\*.*', faAnyFile - faDirectory, srSchRec);
    while iFindResult = 0 do
    begin
      stTemp1 := FormatDateTime('yyyymmddhhnnss',FileTimeToDateTime(srSchRec.FindData.ftCreationTime));
      stTemp2 := FormatDateTime('yyyymmddhhnnss',Now - 0.00006);
      if stTemp1 < stTemp2  then  //현재 Add 하고 있는 파일은 건드리면 안됨...
      begin
        EventFileNameList.Add(srSchRec.Name);
      end;
      iFindResult := FindNext(srSchRec);
    end;
    FindClose(srSchRec);

    if EventFileNameList.Count < 1 then Exit;
    EventFileNameList.Sort;

    for i := 0 to EventFileNameList.Count - 1 do
    begin
      bResult := False;
      Try
        if UpperCase(copy(EventFileNameList.Strings[i],1,length('CardAccessEvent'))) = UpperCase('CardAccessEvent') then
        begin
          stFileName := ExeFolder + '\LogDB\' + EventFileNameList.Strings[i];
          bResult := FileToDBInsertCardAccessEvent(stFileName);
        end else if UpperCase(copy(EventFileNameList.Strings[i],1,length('AlarmEvent'))) = UpperCase('AlarmEvent') then
        begin
          stFileName := ExeFolder + '\LogDB\' + EventFileNameList.Strings[i];
          bResult := FileToDBInsertAlarmEvent(stFileName);
        end;
      Except
        continue;
      End;
      if bResult then DeleteFile(stFileName);
      StatusBar1.Panels[2].Text := stFileName + ' Load Success';
      sleep(1);
      Application.ProcessMessages;
    end;

  Finally
    EventFileNameList.Free;
  End;
end;

function TfmMain.FileToDBInsertAlarmEvent(aFileName: string): Boolean;
var
  EventList : TStringList;
  stTemp : string;
  i : integer;
  bResult : Boolean;
  stSql : string;
begin
  result := False;
  Try
    EventList := TStringList.Create;
    Try
      EventList.LoadFromFile(aFileName);
    Except
      Exit;
    End;
    if EventList.Count > 0 then
    begin
      for i := 0 to EventList.Count - 1 do
      begin
        Try
          stTemp := EventList.Strings[i];
          bResult := True;
          if Not DupCheckTB_ALARMEVENT(copy(stTemp,1,14),
                              copy(stTemp,15,3),
                              copy(stTemp,18,2),
                              copy(stTemp,20,1)) then
          begin
            stSql := InsertTB_ALARMEVENT(copy(stTemp,1,14), //stTime
                              copy(stTemp,15,3),   //NodeNo
                              copy(stTemp,18,2),   //stEcuID
                              copy(stTemp,20,1),   //stMsgNo
                              copy(stTemp,21,2),   //stSubClass,
                              copy(stTemp,23,2),   //stSubAddr,
                              copy(stTemp,25,2),   //stZoneCode,
                              copy(stTemp,27,1),   //stMode,
                              copy(stTemp,28,2),   //stPortNo,
                              copy(stTemp,30,2),   //stStatus,
                              copy(stTemp,32,1),   //stState,
                              Trim(copy(stTemp,33,20)),  //stOper,
                              copy(stTemp,53,2),   //stNewStateCode,
                              copy(stTemp,55,1),   //stAlarmView,
                              copy(stTemp,56,1),   //stAlarmSound,
                              copy(stTemp,57,1),   //stAlarmGrade,
                              copy(stTemp,58,1),   //stCheckOK,
                              Trim(copy(stTemp,59,20)),  //stCardNo,
                              copy(stTemp,79,3),   //stCompanyCode,
                              Trim(copy(stTemp,82,30)) ); //stEmCode);
              //LogAdd(ExeFolder + '\..\log\AlarmInsert.log','Start' + stSql);
              bResult := DataModule1.ProcessExecSQL(stSql);
              if G_nSmallSetDBRelay = 1 then
              begin
                dmZeronEventDataBase.ProcessExecSQL(stSql);
              end;
              //LogAdd(ExeFolder + '\..\log\AlarmInsert.log','END' + stSql);
          end;
          if Not DupCheckTB_ALARMEVENT(copy(stTemp,1,14),
                              copy(stTemp,15,3),
                              copy(stTemp,18,2),
                              copy(stTemp,20,1)) then bResult := False;
          if Not bResult then LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
          Application.ProcessMessages;
        Except
          LogAdd(ExeFolder + '\db\ErrAlarmEvent.log',stTemp);
        End;
      end;
    end;
  Finally
    EventList.Free;
  End;
  result := True;
end;

function TfmMain.FileToDBInsertCardAccessEvent(aFileName: string): Boolean;
var
  EventList : TStringList;
  stTemp : string;
  i : integer;
  bResult : Boolean;
  stSql : string;
  stInOutcode : string;
  nInOutIndex : integer;
  stInOutCount : string;
  stInOutGroupCode : string;
begin
  result := False;
  Try
    EventList := TStringList.Create;
    Try
      EventList.LoadFromFile(aFileName);
    Except
      Exit;
    End;

    Try
      if EventList.Count > 0 then
      begin
        for i := 0 to EventList.Count - 1 do
        begin
          stTemp := EventList.Strings[i];
          bResult := True;
          if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(copy(stTemp,1,14),strtoint(copy(stTemp,15,3)),copy(stTemp,18,2),copy(stTemp,20,1),Trim(copy(stTemp,21,20))) then
          begin
            stSql := CommonSql.InsertIntoTB_ACCEVENT(
                              copy(stTemp,1,8),    //stDate
                              copy(stTemp,9,6),    //stTime
                              copy(stTemp,15,3),   //inttostr(NodeNo),
                              copy(stTemp,18,2),   //stECUID,
                              copy(stTemp,20,1),   //cDoorNo,
                              Trim(copy(stTemp,21,20)), //stCardNo,
                              copy(stTemp,41,1), //cReaderNo,
                              copy(stTemp,42,1), //cButton,
                              copy(stTemp,43,1), //cPosi,
                              copy(stTemp,44,1), //cInputType,
                              copy(stTemp,45,1), //ReceiveData[37],
                              copy(stTemp,46,1), //ReceiveData[36],
                              copy(stTemp,47,1), //cPermit,
                              copy(stTemp,48,14), //FormatdateTime('yyyymmddHHMMSS',Now),
                              copy(stTemp,62,3), //stCompanyCode,
                              Trim(copy(stTemp,65,30)), //stEmCode,
                              copy(stTemp,95,3), //stJijumCode,
                              copy(stTemp,98,3), //stDepartCode,
                              Trim(copy(stTemp,101,100))); //stEmName);
            //DataModule1.ProcessExecSQL(stSql);
            //bResult := DataModule1.ProcessEventExecSQL(stSql);
            //LogAdd(ExeFolder + '\..\log\CardAccessInsert.log','Start' + stSql);
            bResult := DataModule1.ProcessExecSQL(stSql);
            //LogAdd(ExeFolder + '\..\log\CardAccessInsert.log','END' + stSql);
            if G_nSmallSetDBRelay = 1 then
            begin
              dmZeronEventDataBase.ProcessExecSQL(stSql);
            end;
            Application.ProcessMessages;
          end;

          if InOutCountUse then
          begin
          if isDigit(copy(stTemp,47,1)) then // = #$31) or (cPermit = #$32) then  //승인 허가이면
          begin
            stInOutcode := copy(stTemp,15,5);
            stInOutCode := stInOutCode + copy(stTemp,41,1) ;
            nInOutIndex := InOutCardReaderList.IndexOf(stInOutCode);
            if nInOutIndex > -1 then //입퇴실 사용하는 Count
            begin
              stInOutCount := InOutCountList.Strings[nInOutIndex];
              UpdateTB_INOUTCOUNT_Add(copy(stTemp,1,8),copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,20,1),stInOutCount);
              stInOutGroupCode := InOutGroupReaderList.Strings[nInOutIndex];
              if isDigit(stInOutCount) then
              begin
                if strtoint(stInOutCount) < 0 then
                begin
                  //퇴실
                  DeleteTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)));
                end else
                begin
                  //입실
                  if Not InsertTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                                 copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) ) then
                         UpdateTB_INOUTGROUPLIST(stInOutGroupCode,Trim(copy(stTemp,21,20)),
                                                 copy(stTemp,15,3),copy(stTemp,18,2),copy(stTemp,41,1),copy(stTemp,1,14) );

                end;
              end;
            end;
           end;
          end;
          //카드 최종 사용일자를 남기자.
          stSql := 'Update TB_CARD set ca_lastuse = ''' + FormatDateTIme('yyyymmdd',Now) + ''' ';
          stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
          stSql := stSql + ' AND ca_cardno = ''' + Trim(copy(stTemp,21,20)) + ''' ';
          DataModule1.ProcessExecSQL(stSql);
          if Not dmAdoQuery.DupCheckTB_ACCESS_EVENT(copy(stTemp,1,14),strtoint(copy(stTemp,15,3)),copy(stTemp,18,2),copy(stTemp,20,1),Trim(copy(stTemp,21,20))) then bResult := False; //입력이 안되어 있으면 실패이다.
          if Not bResult then LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
        end;
      end;
    Except
      LogAdd(ExeFolder + '\db\ErrAccessEvent.log',stTemp);
    End;
  Finally
    EventList.Free;
  End;
  result := True;
end;

function TfmMain.LoadInOutReader: Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
  stInOutReader : string;
begin
  Result := False;

  InOutCardReaderList.Clear;
  InOutGroupReaderList.Clear;
  InOutCountList.Clear;

  stSql := 'Select AC_NODENO,AC_ECUID,RE_READERNO,RE_INOUTCOUNT,IO_GROUPCODE from TB_READER where RE_INOUTCOUNT <> 0 ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    With TempAdoQuery do
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
        stInOutReader := FillZeroNumber(FindField('AC_NODENO').AsInteger,3);
        stInOutReader := stInOutReader + FindField('AC_ECUID').AsString;
        stInOutReader := stInOutReader + FindField('RE_READERNO').AsString;
        InOutCardReaderList.Add(stInOutReader);
        InOutCountList.Add(inttostr(FindField('RE_INOUTCOUNT').asinteger));
        InOutGroupReaderList.Add(FindField('IO_GROUPCODE').AsString);
        next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Result := True;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  inherited;
  LoadInOutReader;
end;

function TfmMain.UpdateTB_INOUTCOUNT_Add(aDate, aNodeNo, aECUID, aDoorNo,
  aInOutCount: string): Boolean;
var
  stSql : string;
  stTestTime : string;
begin
  if Not CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID, aDoorNo) then
  begin
    stSql := ' Insert Into TB_INOUTCOUNT( ';
    stSql := stSql + ' GROUP_CODE,' ;
    stSql := stSql + ' IO_DATE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' DO_DOORNO, ';
    stSql := stSql + ' IO_COUNT) ';
    stSql := stSql + ' VALUES( ';
    stSql := stSql + '''' + GROUPCODE + ''', ';
    stSql := stSql + '''' + aDate + ''',';
    stSql := stSql + '' + aNodeNo + ', ';
    stSql := stSql + '''' + aECUID + ''', ';
    stSql := stSql + '''' + aDoorNo + ''', ';
    stSql := stSql + '' + aInOutCount + ') ';
  end else
  begin
    stSql := ' Update TB_INOUTCOUNT set ';
    stSql := stSql + ' IO_COUNT = IO_COUNT + (' + aInOutCount + ') ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ' ;
    stSql := stSql + ' AND IO_DATE = ''' + aDate + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
    stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  end;
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.DeleteTB_INOUTGROUPLIST(aInOutGroupCode,
  aCardNo: string): Boolean;
var
  stSql : string;
  stTestTime : string;
begin
  stSql := ' Delete From TB_INOUTGROUPLIST ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND IO_GROUPCODE = ''' + aInOutGroupCode + '''';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.InsertTB_INOUTGROUPLIST(aInOutGroupCode, aCardNo, aNodeNo,
  aEcuID, aReaderNo, aTime: string): Boolean;
var
  stSql : string;
  stTestTime : string;
begin
  stSql := ' Insert Into TB_INOUTGROUPLIST(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'IO_GROUPCODE,';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'RE_READERNO, ';
  stSql := stSql + 'IO_TIME ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aInOutGroupCode + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '' + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''' + aTime + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_INOUTGROUPLIST(aInOutGroupCode, aCardNo, aNodeNo,
  aEcuID, aReaderNo, aTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_INOUTGROUPLIST set ';
  stSql := stSql + 'AC_NODENO = ' + aNodeNo + ', ';
  stSql := stSql + 'AC_ECUID =''' + aEcuID + ''', ';
  stSql := stSql + 'RE_READERNO =''' + aReaderNo + ''', ';
  stSql := stSql + 'IO_TIME =''' + aTime + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND IO_GROUPCODE = ''' + aInOutGroupCode + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMain.CheckTB_INOUTCOUNT(aDate, aNodeNo, aECUID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select IO_DATE,AC_NODENO,AC_ECUID,DO_DOORNO from TB_INOUTCOUNT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND IO_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    //Sql.Clear;
    Sql.Text :=  stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
  end;
  result := True;
end;

procedure TfmMain.AdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  LogAdd(ExeFolder + '\..\log\ZDaemon_LogServer.log','AdoConnectCheckTimerTimer');
  AdoConnectCheckTimer.Enabled := False;

  TDataBaseConfig.GetObject.DBConnected := False;
  TDataBaseConfig.GetObject.DataBaseConnect(False);
  if Not TDataBaseConfig.GetObject.DBConnected then AdoConnectCheckTimer.Enabled := True;
end;

procedure TfmMain.GetMonitoringTypeConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' Where (CO_CONFIGGROUP = ''MOSTYPE'' ';
  stSql := stSql + ' OR CO_CONFIGGROUP = ''FOOD'') ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      While Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'INOUTCOUNT' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = 'Y' then  InOutCountUse := True
          else InOutCountUse := False;
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

end.



