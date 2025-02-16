unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ToolWin, ComCtrls,
  uCommonVariable, StdCtrls,ADOdb,ActiveX, Buttons, uSubForm, CommandArray,
  DB,TlHelp32;

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
    N6: TMenuItem;
    EmployeeAdoConnectCheckTimer: TTimer;
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
    procedure CommandArrayCommandsTDEVICECURRENTSTATEExecute(
      Command: TCommand; Params: TStringList);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CommandArrayCommandsTJUNNAMStateExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTKTBundangStateExecute(Command: TCommand;
      Params: TStringList);
    procedure EmployeeAdoConnectCheckTimerTimer(Sender: TObject);
    procedure N6Click(Sender: TObject);
  private
    L_bApplicationTerminate : Boolean;
    L_bClose : Boolean;
    L_bActive : Boolean;
    { Private declarations }
    Procedure DataModuleAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure EmployeeAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    Procedure RelayAdoConnected(Sender: TObject;  DBConnected: Boolean); //AdoConnected
    procedure RelayAdoEvent(Sender: TObject;  aSql : string);
    Function  MDIForm(FormName:string):TForm;
    Procedure MDIChildShow(FormName:String);
  private
    L_nCARDLENGTHTYPE : integer;
    L_nSpecialProgram : integer;
    L_bIsNumericCardNo : Boolean;
    L_stEmployeeDBIP : string;
    L_stEmployeeDBPort : string;
    L_stEmployeeDBUserID : string;
    L_stEmployeeDBUserPW : string;
    L_stEmployeeDBName : string;
    L_stDBType : string; //
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
  private
    Function AccessEventReserveSeverSend:Boolean;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function CheckTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo:string):integer;
    Function CheckTB_DEVICECARDNO_isNotDoorGrade(aNodeNo, aEcuID, aDoorNo,aCardNo:string):integer;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmCode:string; var aFdmsID:integer;var aEmName:string):Boolean;
    Function CheckTB_YSReserveDOOR(aKey,aDoorNo,aGrade,aCardNo:string):integer;
    Function CheckTB_YSReserveDoor_EndTime(aKey,aDoorNo,aCardNo,aStartTime:string):integer;
    procedure CreateDepartCode(aCompanyCode,aJijumCode,aDepartName:string; var aDepartCode:string);
    procedure CreateJijumCode(aCompanyCode,aJijumName:string;var aJijumCode:string);
    Function DeleteTB_EMPLOYEE(aCompanyCode,aEmCode:string):Boolean;
    Function DoorGradeSetting(aNodeNo,aEcuID,aDoorNo,aCardNo,aGrade:string):Boolean;
    Function GetCardConfig : Boolean;
    Function GetDepartCode(aCompanyCode,aJijumCode,aDepartName:string):string;
    Function GetEmployeeInfo(aEmCode:string;var aJijumName,aDepartName,aEmName:string):Boolean;
    Function GetFdmsID:string;
    Function GetJijumCode(aCompanyCode,aJijumName:string):string;
    Function GetMaxDepartCode(aCompanyCode,aJijumCode:string):string;
    Function GetMaxJijumCode(aCompanyCode:string):integer;
    Function GetMaxPositionNum : integer;
    Function GetReserveServerToLocalServer(aKey,aEmCode,aEmName,aDoorID,aStartTime,aEndTime,aCardNo,aJijumName,aDepartName,aUsed:string):Boolean;

    Function InsertReservLog(aKey,aEmCode,aCardNo,aDoorCode,aAccessTime,aState:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aName:string):Boolean;
    Function InsertTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,aDoorNo, aCardNo:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 aCardNo,aEmpImg,afdmsId,aEmTypeCode:string):Boolean;
    Function InsertIntoTB_YSReserveHis(aKey,aEmCode,aEmName,aDoorID,aStartTime,aEndTime,aCardNo,aJijumName,aDepartName,aUsed:string):Boolean;
    Function InsertIntoTB_YSReserveDOOR(aKey,aDoorNo,aGrade,aCardNo,aTime,aWorkType:string):Boolean;
    procedure LoadConfig;
    Function ReserveGradeSetting:Boolean;
    Function ReserveServerUsedUpdate(akey,aUsed:string):Boolean;
    Function UpdateTB_ACCESSEVENT_AC_RELAY(aDate,aTime,aNodeNo,aEcuID,aDoorNo,aCardNo,aAcRelay:string):Boolean;
    Function UpdateTB_CARD(aCardNo,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    Function UpdateTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,aDoorNo, aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO_DoorPermitDelete(aNodeNo, aEcuID,aDoorNo, aCardNo:string):Boolean;
    Function UpdateTB_DEVICECARDNO_PermitDelete(aNodeNo, aEcuID, aCardNo:string):Boolean;
    Function UpdateTB_EMPLOYEE(aCompanyCode,aEmCode,aEmName,aJijumCode,aDepartCode:string):Boolean;
    Function UpdateTB_YSReserveDOOR(aKey,aDoorNo,aGrade,aCardNo,aTime,aWorkType:string):Boolean;
    Function UpdateTB_YSReserveDOOR_WorkType(aKey,aDoorNo,aGrade,aCardNo,aWorkType:string):Boolean;
    Function UpdateTB_YSReserveDoor_EndTime(aKey,aDoorID,aCardNo,aStartTime,aWorkType:string):Boolean;
    Function YSReserveRelay:Boolean;
    Function YSReserveRelayOK(aKey:string):Boolean;
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
  udmAdoEmployee,
  uDataBaseConfig,
  uConfig,
  udmAdoRelay,
  uDeviceCurrentState,
  uDoorAdmin,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uFireBird,
  uCommonSql,
  uJUNNAMCurrentState,
  uKTBundangCurrentState;

{$R *.dfm}

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

function TfmMain.CheckTB_DEVICECARDNO(aNodeNo, aEcuID,
  aCardNo: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
      result := 0;
      if RecordCount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_DEVICECARDNO_isNotDoorGrade(aNodeNo, aEcuID,
  aDoorNo, aCardNo: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
  i : integer;
  bCheck : Boolean;
begin
  Result := -1;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
      if RecordCount < 1 then Exit;
      bCheck := False;
      for i := 1 to 8 do
      begin
        if strtoint(aDoorNo) <> i then
        begin
          if FindField('DE_DOOR' + inttostr(i)).AsString = 'Y' then
          begin
            bCheck := True;
            break;
          end;
        end;
      end;
      if Not bCheck then
      begin
        if FindField('DE_USEALARM').AsString = 'Y' then bCheck := True;
      end;
      if Not bCheck then
      begin
        for i := 0 to 8 do
        begin
          if strtoint(aDoorNo) <> i then
          begin
            if FindField('DE_ALARM' + inttostr(i)).AsString = 'Y' then
            begin
              bCheck := True;
              break;
            end;
          end;
        end;
      end;
      if bCheck then result := 1
      else result := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.CheckTB_EMPLOYEE(aCompanyCode, aEmCode: string;
  var aFdmsID: integer;var aEmName:string): Boolean;
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
      aEmName := FindField('EM_NAME').AsString;
      result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.CheckTB_YSReserveDOOR(aKey, aDoorNo, aGrade,
  aCardNo: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_YSReserveDOOR ';
  stSql := stSql + ' where YR_KEY = ' + aKey + ' ';
  stSql := stSql + ' AND YR_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND YR_REGGUBUN = ''' + aGrade + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.DoorGradeSetting(aNodeNo, aEcuID, aDoorNo, aCardNo,
  aGrade: string): Boolean;
var
  stSql : string;
  nResult : integer;
begin
  result := False;
  if aGrade = '0' then   //권한 삭제 처리
  begin
    (*nResult := CheckTB_DEVICECARDNO_isNotDoorGrade(aNodeNo, aEcuID, aDoorNo,aCardNo);//-1.테이블에 데이터 없음(무시),0.권한테이블에 해당 출입문 외에는 권한 없음,1.해당 출입문 외에 권한 있음
    if nResult = 1 then
    begin
      result := UpdateTB_DEVICECARDNO_DoorPermitDelete(aNodeNo, aEcuID,aDoorNo, aCardNo);
    end else if nResult = 0 then
    begin
      result := UpdateTB_DEVICECARDNO_PermitDelete(aNodeNo, aEcuID, aCardNo);
    end; *)
    result := UpdateTB_DEVICECARDNO_PermitDelete(aNodeNo, aEcuID, aCardNo);   //전체 권한 삭제로 변경
  end else if aGrade = '1' then //권한 등록 처리
  begin
    if CheckTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo) = 1 then
    begin
      result := UpdateTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,aDoorNo, aCardNo);
    end else
    begin
      result := InsertTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,aDoorNo, aCardNo);
    end;
  end;
end;

function TfmMain.GetCardConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;

    L_nCARDLENGTHTYPE := 0;    //0 4Byte
    L_bIsNumericCardNo := True; //카드번호 숫자타입 사용/미사용
    L_nSpecialProgram := 0;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';

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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then
          L_nCARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then L_bIsNumericCardNo := False;
        end
        else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then L_nSpecialProgram := strtoint(FindField('CO_CONFIGVALUE').AsString);
        Next;
      end;
      if L_nSpecialProgram = 1 then L_nCARDLENGTHTYPE := 2;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

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

function TfmMain.GetReserveServerToLocalServer(aKey, aEmCode, aEmName,
  aDoorID, aStartTime, aEndTime, aCardNo, aJijumName,
  aDepartName,aUsed: string): Boolean;
var
  nFdmsID:integer;
  stFdmsID : string;
  stJijumName,stDepartName,stEmName : string;
  stJijumCode,stDepartCode : string;
begin
  InsertIntoTB_YSReserveHis(aKey,aEmCode,aEmName,aDoorID,aStartTime,aEndTime,aCardNo,aJijumName,aDepartName,aUsed);
  if (UpperCase(aUsed) = 'N') or (UpperCase(aUsed) = 'Y') then
  begin
    if CheckTB_YSReserveDoor_EndTime(aKey,aDoorID,aCardNo,aStartTime) > 0 then  //종료 시간이 시작 시간보다 큰 경우에는 연동 완료 처리 해서 종료 시간이 내려가지 않도록 처리함
    begin
      UpdateTB_YSReserveDoor_EndTime(aKey,aDoorID,aCardNo,aStartTime,'Y');
    end;
    if CheckTB_YSReserveDOOR(aKey,aDoorID,'1',aCardNo) = 1 then
    begin
      UpdateTB_YSReserveDOOR(aKey,aDoorID,'1',aCardNo,aStartTime,'N');
    end else
    begin
      InsertIntoTB_YSReserveDOOR(aKey,aDoorID,'1',aCardNo,aStartTime,'N');
    end;
    if CheckTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo) = 1 then
    begin
      UpdateTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo,aEndTime,'N');
    end else
    begin
      InsertIntoTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo,aEndTime,'N');
    end;
  end else
  begin
    if CheckTB_YSReserveDOOR(aKey,aDoorID,'1',aCardNo) = 1 then UpdateTB_YSReserveDOOR(aKey,aDoorID,'1',aCardNo,aStartTime,'Y'); //시작시간은 전송 완료 처리
    if CheckTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo) = 1 then UpdateTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo,FormatDateTime('yyyymmddhhnnss',now),'N')  //현재시간 종료 처리
    else InsertIntoTB_YSReserveDOOR(aKey,aDoorID,'0',aCardNo,FormatDateTime('yyyymmddhhnnss',now),'N');
  end;
  stFdmsID := '';
  if Not CheckTB_EMPLOYEE('001',aEmCode,nFdmsID,stEmName) then
  begin
    stFdmsID := GetFdmsID;
    GetEmployeeInfo(aEmCode,stJijumName,stDepartName,stEmName);
    stJijumCode := GetJijumCode('001',stJijumName);
    if stJijumCode = '000' then
    begin
      if Trim(stJijumName) <> '' then
        CreateJijumCode('001',stJijumName,stJijumCode);
    end;
    stDepartCode := GetDepartCode('001',stJijumCode,stDepartName);
    if stDepartCode = '000' then
    begin
      if Trim(stDepartName) <> '' then
        CreateDepartCode('001',stJijumCode,stDepartName,stDepartCode);
    end;
    InsertTB_EMPLOYEE(aEmCode,stEmName,'001',stJijumCode,stDepartCode,'000','',FormatDateTime('yyyymmdd',now),'99991231','','','','','',aCardNo,'',stFdmsID,'001');
  end else
  begin
    if stEmName = '' then
    begin
      GetEmployeeInfo(aEmCode,stJijumName,stDepartName,stEmName);
      stJijumCode := GetJijumCode('001',stJijumName);
      if stJijumCode = '000' then
      begin
        if Trim(stJijumName) <> '' then
          CreateJijumCode('001',stJijumName,stJijumCode);
      end;
      stDepartCode := GetDepartCode('001',stJijumCode,stDepartName);
      if stDepartCode = '000' then
      begin
        if Trim(stDepartName) <> '' then
          CreateDepartCode('001',stJijumCode,stDepartName,stDepartCode);
      end;
      UpdateTB_EMPLOYEE('001',aEmCode,stEmName,stJijumCode,stDepartCode);
    end;
  end;

  if CheckTB_CARD(aCardNo) then
  begin
    UpdateTB_CARD(aCardNo,'1',aEmCode,'001');
  end else
  begin
    InsertTB_CARD(aCardNo,'1','1',aEmCode,'001')
  end;   
  result := True;
end;

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

  dmAdoEmployee.OnAdoConnected := EmployeeAdoConnected;
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
    tbi.Hint := '예약 시스템 접속 실패';
    RelayAdoConnectCheckTimer.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
    RelayAdoConnectCheckTimer.Enabled := True;
  end else
  begin
    RelayAdoConnectCheckTimer.Interval := 1000 * 60; //끊기면 1분에 한번씩 체크
    //RelayAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '예약 시스템 접속 성공';
  end;
  if Not dmADOEmployee.AdoEmployeeConnected('MSSQL', L_stEmployeeDBIP, L_stEmployeeDBPort,
                    L_stEmployeeDBUserID, L_stEmployeeDBUserPW, L_stEmployeeDBName) then
  begin
    EmployeeAdoConnectCheckTimer.Interval := 1000 * 600; //10분에 한번씩 체크 하자.
    EmployeeAdoConnectCheckTimer.Enabled := True;
  end else
  begin
    EmployeeAdoConnectCheckTimer.Interval := 1000 * 60; //끊기면 1분에 한번씩 체크
  end;


  RelayTimer.Enabled := True;
  GetCardConfig;
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
  TDataBaseConfig.GetObject.DBConnected := False;
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
begin
  G_bApplicationTerminate := True;
  Delay(1000);
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
  L_stDBType := 'mysql';
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
        end else if FindField('CO_CONFIGGROUP').AsString = 'RESERVE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DBTYPE'   then L_stDBType := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then L_stDBIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then L_stDBPort := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then L_stDBUserID := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then L_stDBUserPW := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then L_stDBName := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME'   then L_stRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'LASTTIME'   then L_stLastRelayTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DELTIME'   then L_stLastRelayDelTime := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'COCODE'   then L_stCompanyCode := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGGROUP').AsString = 'EMRELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DBIP'     then L_stEmployeeDBIP := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBPORT'   then L_stEmployeeDBPort := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERID' then L_stEmployeeDBUserID := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBUSERPW' then L_stEmployeeDBUserPW := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'DBNAME'   then L_stEmployeeDBName := FindField('CO_CONFIGVALUE').AsString ;
        end;
        Next;
      end;
    end;
    
    mn_RelayDB.Caption := '즉시연동';
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
  if L_bRelayDB then Exit;
  Try
    L_bRelayDB := True;
    YSReserveRelay;
    ReserveGradeSetting;
  Finally
    L_bRelayDB := False;
  End;

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
    LogSave(G_stExeFolder + '\..\log\RelayConnected' + FormatDateTime('yyyymmdd',now) +'.log','RelayConnected Faile ');
  end else tbi.Hint := '사원정보 연동 시스템 정상';
end;

procedure TfmMain.RelayTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  if L_dtRelayActionTime > now then Exit;

  Try
    RelayTimer.Enabled:=False;
    if Not dmAdoRelay.DBConnected then
    begin
      tbi.Hint := '예약시스템 접속 실패';
      RelayAdoConnectCheckTimer.Enabled := True;
      Exit;
    end;
    tbi.Hint := '예약정보 연동 시스템 작업중';
    YSReserveRelay;
    ReserveGradeSetting;
    AccessEventReserveSeverSend;

    if Not isDigit(L_stRelayTime) then  L_stRelayTime := '5';
    L_dtRelayActionTime := IncTime(Now,0,0,strtoint(L_stRelayTime),0);
    tbi.Hint := '예약정보 연동 완료';
  Finally
    RelayTimer.Enabled:= Not L_bApplicationTerminate;
  End;

end;


function TfmMain.InsertTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, 
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

function TfmMain.UpdateTB_CARD(aCardNo, aCardType, aEmpID,
  aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

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


procedure TfmMain.CommandArrayCommandsTJUNNAMStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bJUNNAMShowState := True
   else L_bJUNNAMShowState := False;
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


procedure TfmMain.CommandArrayCommandsTKTBundangStateExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['VALUE'];
   if stResult = 'TRUE' then L_bKTBundangShowState := True
   else L_bKTBundangShowState := False;

end;

function TfmMain.YSReserveRelay: Boolean;
var
  stSql : string;
  stStartTime : string;
  stEndTime : string;
  stCardNo : string;
begin
  stSql := ' select * from booking_tbl ';
  stSql := stSql + ' where state is null ';
  stSql := stSql + ' OR state = ''N'' ';
  stSql := stSql + ' OR state = ''n'' ';

  with dmAdoRelay.RelaySearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      dmAdoRelay.DBConnected := False;
      Exit;
    End;

    if recordcount < 1 then Exit;
    while Not Eof do
    begin
      //FindField('login_name').AsString
      stStartTime := FormatDateTime('yyyymmddhhnnss',FindField('begin_time').AsDateTime );
      //stStartTime := FormatDateTime('yyyymmddhhnnss',FindField('begin_time').AsDateTime - ((1 / (24 * 6)));
//      stStartTime := stringReplace(stStartTime,' ','',[rfReplaceAll]);
//      stStartTime := stringReplace(stStartTime,'-','',[rfReplaceAll]);
//      stStartTime := stringReplace(stStartTime,':','',[rfReplaceAll]);
      stEndTime := FormatDateTime('yyyymmddhhnnss',FindField('finish_time').AsDateTime);
//      stEndTime := FindField('finish_time').AsString;
//      stEndTime := stringReplace(stEndTime,' ','',[rfReplaceAll]);
//      stEndTime := stringReplace(stEndTime,'-','',[rfReplaceAll]);
//      stEndTime := stringReplace(stEndTime,':','',[rfReplaceAll]);
      stCardNo := FindField('user_no').AsString;

      if L_nCARDLENGTHTYPE = 0 then            //4Byte
      begin
        stCardNo := copy(stCardNo,1,8);
        if L_bIsNumericCardNo then
        begin
          stCardNo := inttostr(Hex2Dec64(stCardNo));
          stCardNo := FillZeroStrnum(stCardNo,10);
        end;
      end else if L_nCARDLENGTHTYPE = 1 then   //16Byte
      begin
        //stCardNo := FillZeroStrnum(stCardNo,8);
        stCardNo := FillCharString(stCardNo,'*',16);
      end else if L_nCARDLENGTHTYPE = 2 then   //KT사옥
      begin
        stCardNo := FillZeroStrnum(stCardNo,8);
        stCardNo := stCardNo + '0';
        stCardNo := FillCharString(stCardNo,'*',11);
      end;

      GetReserveServerToLocalServer(FindField('booking_no').AsString,FindField('member_id').AsString,'',FindField('code_no').AsString,
                                    stStartTime,stEndTime,stCardNo,'','',FindField('is_used').AsString);

      YSReserveRelayOK(FindField('booking_no').AsString);
      Next;
    end;
  end;
  
end;

function TfmMain.InsertIntoTB_YSReserveHis(aKey, aEmCode, aEmName, aDoorID,
  aStartTime, aEndTime, aCardNo, aJijumName, aDepartName,aUsed: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_YSReserveHis( ';
  stSql := stSql + ' YR_KEY,';        //키
  stSql := stSql + ' EM_CODE,'; //사번
  stSql := stSql + ' EM_NAME,';     //이름
  stSql := stSql + ' YR_DOORNO,';       //출입문아이디
  stSql := stSql + ' YR_STARTTIME,';    //시작시간
  stSql := stSql + ' YR_ENDTIME,';      //종료시간
  stSql := stSql + ' CA_CARDNO,';    //카드번호
  stSql := stSql + ' IS_USED,';    //사용상태
  stSql := stSql + ' CO_JIJUMNAME,';      //단과대명
  stSql := stSql + ' CO_DEPARTNAME,';  //학과명
  stSql := stSql + ' YR_InsertTime)';    //외출조작버튼
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aKey + ',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aDoorID + ''',';
  stSql := stSql + '''' + aStartTime + ''',';
  stSql := stSql + '''' + aEndTime + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aUsed + ''',';
  stSql := stSql + '''' + aJijumName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + formatDateTime('yyyymmddhhnnsszzz',now) + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);

end;


function TfmMain.UpdateTB_YSReserveDOOR(aKey, aDoorNo, aGrade, aCardNo,
  aTime, aWorkType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_YSReserveDOOR ';
  stSql := stSql + ' Set YR_TIME = ''' + aTime + ''', ';
  stSql := stSql + ' YR_WORKTYPE = ''' + aWorkType + ''', ';
  stSql := stSql + ' YR_UpdateTime = ''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''' ';
  stSql := stSql + ' where YR_KEY = ' + aKey + ' ';
  stSql := stSql + ' AND YR_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND YR_REGGUBUN = ''' + aGrade + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.InsertIntoTB_YSReserveDOOR(aKey, aDoorNo, aGrade, aCardNo,
  aTime, aWorkType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_YSReserveDOOR( ';
  stSql := stSql + ' YR_KEY,';        //키
  stSql := stSql + ' YR_DOORNO,';    //출입문아이디
  stSql := stSql + ' YR_REGGUBUN,';     //등록구분.,0.삭제,1.등록
  stSql := stSql + ' CA_CARDNO,';       //카드번호
  stSql := stSql + ' YR_TIME,';    //시간
  stSql := stSql + ' YR_WORKTYPE,';      //작업구분 'N'.미작업,'Y'.작업완료
  stSql := stSql + ' YR_UpdateTime)';    //작업시간
  stSql := stSql + ' Values( ';
  stSql := stSql + '' + aKey + ',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aGrade + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aTime + ''',';
  stSql := stSql + '''' + aWorkType + ''',';
  stSql := stSql + '''' + formatDateTime('yyyymmddhhnnsszzz',now) + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.YSReserveRelayOK(aKey: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update booking_tbl set state = ''Y''  ';
  stSql := stSql + ' where booking_no = ' + aKey + ' ';

  result := dmAdoRelay.ProcessExecSQL(stSql);
end;

function TfmMain.ReserveGradeSetting: Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := True;
  stSql := 'select a.*,b.AC_NODENO,b.AC_ECUID,b.DO_DOORNO from TB_YSReserveDOOR a ';
  stSql := stSql + ' Left Join TB_DOOR b ';
  stSql := stSql + ' ON(a.YR_DOORNO = b.YR_DOORNO ) ';
  stSql := stSql + ' where a.YR_WORKTYPE = ''N'' ';
  stSql := stSql + ' AND substring(a.YR_TIME,1,12) <= ''' + FormatDateTime('yyyymmddhhnn',now) + ''' ';
  stSql := stSql + ' Order by a.YR_TIME ';

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
        dmDBModule.DBConnected := False;
        Exit;
      End;
      if RecordCount < 1 then Exit;
      While Not Eof do
      begin
        if FindField('DO_DOORNO').AsString <> '' then
        begin
          if FindField('CA_CARDNO').AsString <> '' then
          begin
            if DoorGradeSetting(FindField('AC_NODENO').AsString,FindField('AC_ECUID').AsString,FindField('DO_DOORNO').AsString,FindField('CA_CARDNO').AsString,FindField('YR_REGGUBUN').AsString)  then
            begin
              UpdateTB_YSReserveDOOR_WorkType(FindField('YR_KEY').AsString,FindField('YR_DOORNO').AsString,FindField('YR_REGGUBUN').AsString,FindField('CA_CARDNO').AsString,'Y');
              //ReserveServerUsedUpdate(FindField('YR_KEY').AsString,'y');
            end else
            begin
              UpdateTB_YSReserveDOOR_WorkType(FindField('YR_KEY').AsString,FindField('YR_DOORNO').AsString,FindField('YR_REGGUBUN').AsString,FindField('CA_CARDNO').AsString,'E');
            end;
          end else
          begin
            UpdateTB_YSReserveDOOR_WorkType(FindField('YR_KEY').AsString,FindField('YR_DOORNO').AsString,FindField('YR_REGGUBUN').AsString,FindField('CA_CARDNO').AsString,'C');
          end;
        end else
        begin
          UpdateTB_YSReserveDOOR_WorkType(FindField('YR_KEY').AsString,FindField('YR_DOORNO').AsString,FindField('YR_REGGUBUN').AsString,FindField('CA_CARDNO').AsString,'D');
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

function TfmMain.UpdateTB_YSReserveDOOR_WorkType(aKey, aDoorNo, aGrade,
  aCardNo, aWorkType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_YSReserveDOOR ';
  stSql := stSql + ' Set YR_WORKTYPE = ''' + aWorkType + ''', ';
  stSql := stSql + ' YR_UpdateTime = ''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''' ';
  stSql := stSql + ' where YR_KEY = ' + aKey + ' ';
  stSql := stSql + ' AND YR_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND YR_REGGUBUN = ''' + aGrade + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;


function TfmMain.UpdateTB_DEVICECARDNO_PermitDelete(aNodeNo, aEcuID,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.UpdateTB_DEVICECARDNO_DoorPermitDelete(aNodeNo, aEcuID,
  aDoorNo, aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_DOOR' + inttostr(strtoint(aDoorNo)) + '  = ''N'', ';
  stSql := stSql + ' DE_USEALARM = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,aDoorNo,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDNO set DE_DOOR' + inttostr(strtoint(aDoorNo)) + '  = ''Y'', ';
  stSql := stSql + ' DE_USEACCESS = ''Y'', ';
  stSql := stSql + ' DE_PERMIT = ''L'', ';
  stSql := stSql + ' DE_USEALARM = ''Y'',' ;
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.InsertTB_DEVICECARDNO_DoorPermitADD(aNodeNo, aEcuID,
  aDoorNo, aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICECARDNO( ';
  stSql := stSql + ' GROUP_CODE,' ;
  stSql := stSql + ' AC_NODENO,' ;
  stSql := stSql + ' AC_ECUID,' ;
  stSql := stSql + ' CA_CARDNO,' ;
  stSql := stSql + ' DE_DOOR' + inttostr(strtoint(aDoorNo)) +  ',' ;
  stSql := stSql + ' DE_USEACCESS,' ;
  stSql := stSql + ' DE_PERMIT,' ;
  stSql := stSql + ' DE_USEALARM,' ;
  stSql := stSql + ' DE_RCVACK )' ;
  stSql := stSql + ' Values(';
  stSql := stSql + ' ''1234567890'',';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + ' ''' + aEcuID + ''',';
  stSql := stSql + ' ''' + aCardNo + ''',';
  stSql := stSql + ' ''Y'',';
  stSql := stSql + ' ''Y'',';
  stSql := stSql + ' ''L'',';
  stSql := stSql + ' ''Y'',';
  stSql := stSql + ' ''N'')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmMain.EmployeeAdoConnectCheckTimerTimer(Sender: TObject);
begin
  inherited;
  if L_bApplicationTerminate then Exit;
  StatusBar1.Panels[2].Text := 'EmployeeAdoConnectCheckTimerTimer';
  EmployeeAdoConnectCheckTimer.Enabled := False;
  if Not dmADOEmployee.AdoEmployeeConnected('MSSQL', L_stEmployeeDBIP, L_stEmployeeDBPort,
                    L_stEmployeeDBUserID, L_stEmployeeDBUserPW, L_stEmployeeDBName) then
  begin
    EmployeeAdoConnectCheckTimer.Enabled := True;
    tbi.Hint := '사원정보 연결 실패';
  end else tbi.Hint := '사원정보 연결 정상';

end;

procedure TfmMain.EmployeeAdoConnected(Sender: TObject;
  DBConnected: Boolean);
begin
  EmployeeAdoConnectCheckTimer.Enabled := Not DBConnected;
end;

function TfmMain.GetDepartCode(aCompanyCode, aJijumCode,
  aDepartName: string): string;
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

function TfmMain.GetJijumCode(aCompanyCode, aJijumName: string): string;
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

procedure TfmMain.CreateDepartCode(aCompanyCode, aJijumCode,
  aDepartName: string; var aDepartCode: string);
begin
  aDepartCode := GetMaxDepartCode(aCompanyCode,aJijumCode);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,aDepartCode,'3',aDepartName);
end;

procedure TfmMain.CreateJijumCode(aCompanyCode, aJijumName: string;
  var aJijumCode: string);
var
  nJijumCode : integer;
begin
  nJijumCode := GetMaxJijumCode(aCompanyCode);
  aJijumCode := FillZeroNumber(nJijumCode,3);
  InsertIntoTB_COMPANY(aCompanyCode,aJijumCode,'000','2',aJijumName);

end;

function TfmMain.GetMaxDepartCode(aCompanyCode,
  aJijumCode: string): string;
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

function TfmMain.GetMaxJijumCode(aCompanyCode: string): integer;
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

function TfmMain.GetEmployeeInfo(aEmCode: string; var aJijumName,
  aDepartName, aEmName: string): Boolean;
var
  stSql : string;
begin
  aJijumName := '';
  aDepartName := '';
  aEmName := '';
  result := False;
  if Not dmADOEmployee.DBConnected then Exit;
  stSql := ' Select a.EM_NAME,b.CO_NAME as CO_JIJUMNAME,c.CO_NAME as CO_DEPARTNAME ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = c.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = c.CO_DEPARTCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Where a.EM_CODE = ''' + aEmCode + ''' ';

  with dmADOEmployee.ADOQuery do
  begin
    Close;
    Sql.text := stSql;
    Try
      Open;
    Except
      dmADOEmployee.DBConnected := False;
      Exit;
    End;
    if recordcount < 1 then Exit;
    aJijumName := FindField('CO_JIJUMNAME').asString;
    aDepartName := FindField('CO_DEPARTNAME').asString;
    aEmName := FindField('EM_NAME').asString;
  end;
end;

function TfmMain.DeleteTB_EMPLOYEE(aCompanyCode, aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_EMPLOYEE ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMain.UpdateTB_EMPLOYEE(aCompanyCode, aEmCode, aEmName,
  aJijumCode, aDepartCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMPLOYEE set EM_NAME = ''' + aEmName + ''', ';
  stSql := stSql + ' CO_JIJUMCODE = ''' + aJijumCode + ''', ';
  stSql := stSql + ' CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

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

function TfmMain.ReserveServerUsedUpdate(akey, aUsed: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update booking_tbl set is_used = ''' + aUsed + ''' ';
  stSql := stSql + ' Where booking_no = ' + akey + '';
  stSql := stSql + ' AND ( is_used = ''n'' or is_used = ''N'' )';

  result := dmAdoRelay.ProcessExecSQL(stSql);
end;

function TfmMain.AccessEventReserveSeverSend: Boolean;
var
  stSql : string;
  stCardNo,stReserveDoorCode,stAccessTime,stState : string;
  TempAdoQuery : TAdoQuery;
begin
  result := False;
  stSql := ' Select a.*,b.YR_DOORNO from TB_ACCESSEVENT a ';
  stSql := stSql + ' Left Join TB_DOOR b ';
  stSql := stSql + ' ON (a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  stSql := stSql + ' Where ( a.AC_RELAY is Null ';
  stSql := stSql + ' OR a.AC_RELAY = ''N'') ';

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
      if RecordCount < 1 then Exit;

      While Not Eof do
      begin
        stCardNo := FindField('CA_CARDNO').AsString;
(*        if L_nCARDLENGTHTYPE = 0 then            //4Byte
        begin
          if L_bIsNumericCardNo then
          begin
            stCardNo := dec2Hex(strtoint64(stCardNo),8);
            stCardNo := FillZeroStrNum(stCardNo,8);
          end;
        end else if L_nCARDLENGTHTYPE = 1 then   //16Byte
        begin
          if stCardNo[9] = '*' then stCardNo := copy(stCardNo,1,8);
        end else if L_nCARDLENGTHTYPE = 2 then   //KT사옥
        begin
          stCardNo := copy(stCardNo,1,8);
        end;  *)
        stReserveDoorCode := FindField('YR_DOORNO').AsString;
        stAccessTime := FindField('AC_DATE').asstring + FindField('AC_TIME').asstring;
        stAccessTime := MakeDatetimeStr(stAccessTime);
        if stReserveDoorCode <> '' then
        begin
          if isDigit(FindField('PE_PERMITCODE').AsString) then stState := 'y' //출입 승인 카드에 대해서만
          else stState := 'n';
          InsertReservLog('1',FindField('EM_CODE').AsString,stCardNo,stReserveDoorCode,stAccessTime,stState);

          if dmAdoRelay.CheckReservLog('1',FindField('EM_CODE').AsString,stCardNo,stReserveDoorCode,stAccessTime) = 1 then
          begin
            UpdateTB_ACCESSEVENT_AC_RELAY(FindField('AC_DATE').asstring,FindField('AC_TIME').asstring,FindField('AC_NODENO').asstring,
                                        FindField('AC_ECUID').asstring,FindField('DO_DOORNO').asstring,FindField('CA_CARDNO').asstring,'Y');
          end;
        end else
        begin
          UpdateTB_ACCESSEVENT_AC_RELAY(FindField('AC_DATE').asstring,FindField('AC_TIME').asstring,FindField('AC_NODENO').asstring,
                                      FindField('AC_ECUID').asstring,FindField('DO_DOORNO').asstring,FindField('CA_CARDNO').asstring,'Y');
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

function TfmMain.UpdateTB_ACCESSEVENT_AC_RELAY(aDate, aTime, aNodeNo,
  aEcuID, aDoorNo, aCardNo, aAcRelay: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSEVENT set ';
  stSql := stSql + 'AC_RELAY = ''' + aAcRelay + '''';
  stSql := stSql + ' Where AC_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AC_TIME = ''' + aTime + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMain.InsertReservLog(aKey, aEmCode, aCardNo, aDoorCode,
  aAccessTime,aState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into login_log_tbl( ';
  stSql := stSql + ' booking_no,';
  stSql := stSql + ' member_id,';
  stSql := stSql + ' user_no,';
  stSql := stSql + ' code_no,';
  stSql := stSql + ' login_time, ';
  stSql := stSql + ' insert_time, ';
  stSql := stSql + ' state )';
  stSql := stSql + ' Values( ';
  stSql := stSql + ' ' + aKey + ',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aDoorCode + ''',';
  stSql := stSql + '''' + aAccessTime + ''',';
  stSql := stSql + 'now(),';
  stSql := stSql + '''' + aState + ''')';

  result := dmAdoRelay.ProcessExecSQL(stSql);
end;

procedure TfmMain.N6Click(Sender: TObject);
begin
  inherited;
  fmDoorAdmin := TfmDoorAdmin.Create(nil);
  fmDoorAdmin.ShowModal;
  fmDoorAdmin.Free;
end;


function TfmMain.CheckTB_YSReserveDoor_EndTime(aKey,aDoorNo,aCardNo,
  aStartTime: string): integer;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := -1;
  stSql := 'select * from TB_YSReserveDOOR ';
  stSql := stSql + ' where YR_KEY < ' + aKey + ' ';
  stSql := stSql + ' AND YR_REGGUBUN = ''0'' ';
  stSql := stSql + ' AND YR_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND YR_TIME >= ''' + aStartTime + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

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
      result := 0;
      if recordcount < 1 then Exit;
      result := 1;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMain.UpdateTB_YSReserveDoor_EndTime(aKey, aDoorID,aCardNo, aStartTime,
  aWorkType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_YSReserveDOOR ';
  stSql := stSql + ' Set YR_WORKTYPE = ''' + aWorkType + ''', ';
  stSql := stSql + ' YR_UpdateTime = ''' + FormatDateTime('yyyymmddhhnnsszzz',now) + ''' ';
  stSql := stSql + ' where YR_KEY < ' + aKey + ' ';
  stSql := stSql + ' AND YR_REGGUBUN = ''0'' ';
  stSql := stSql + ' AND YR_DOORNO = ''' + aDoorID + ''' ';
  stSql := stSql + ' AND YR_TIME >= ''' + aStartTime + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
