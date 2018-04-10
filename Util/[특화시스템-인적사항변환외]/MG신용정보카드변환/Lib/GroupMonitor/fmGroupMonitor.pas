unit fmGroupMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Shader, ComCtrls, StdCtrls, ExtCtrls, ImgList,
  ADODB,AdWnPort,ActiveX, Buttons, ToolWin, Menus,uGroupCommonLib;

const
  LINEEND = #13;  //클라이언트에서 한문장의 끝을 알리는 데이터값
  


type
  TfmMain = class(TForm)
    Panel12: TPanel;
    Splitter5: TSplitter;
    pan_Door: TPanel;
    GroupBox5: TGroupBox;
    IntDoorListView: TListView;
    Shader5: TShader;
    pan_Alarm: TPanel;
    GroupBox6: TGroupBox;
    Shader6: TShader;
    IntAlarmListView: TListView;
    LageDoorList: TImageList;
    stateList: TImageList;
    SmallDoorList: TImageList;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btn_AllPtCancelMode: TSpeedButton;
    btn_AllManageMode: TSpeedButton;
    btn_AllOpenMode: TSpeedButton;
    btn_AllPatrolMode: TSpeedButton;
    PopupMenu_IntAlarm: TPopupMenu;
    Menu_IntAlarmSetting: TMenuItem;
    Menu_IntAlarmDisable: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    PopupMenu_IntiDoor: TPopupMenu;
    pm_intiModeChange: TMenuItem;
    pm_intiOpenMode: TMenuItem;
    pm_intiOperateMode: TMenuItem;
    pm_intiStateCheck: TMenuItem;
    pm_intiDoorOpen: TMenuItem;
    N14: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pm_intiOpenModeClick(Sender: TObject);
    procedure pm_intiOperateModeClick(Sender: TObject);
    procedure pm_intiStateCheckClick(Sender: TObject);
    procedure pm_intiDoorOpenClick(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure btn_AllManageModeClick(Sender: TObject);
    procedure btn_AllOpenModeClick(Sender: TObject);
    procedure btn_AllPatrolModeClick(Sender: TObject);
    procedure Menu_IntAlarmSettingClick(Sender: TObject);
    procedure Menu_IntAlarmDisableClick(Sender: TObject);
    procedure btn_AllPtCancelModeClick(Sender: TObject);
  private
    FOnPopupEvent: TPopupEvent;
    function GetBuildingCode: string;
    procedure SetBuindingCode(Value: string);
    function GetFloorCode: string;
    procedure SetFloorCode(Value: string);
    function GetIsMaster: Boolean;
    procedure SetIsMaster(Value: Boolean);
    function GetGroupCode: string;
    procedure SetGroupCode(Value: string);
    function GetMasterID: string;
    procedure SetMasterID(Value: string);
    function GetAdoConnection: TADOConnection;
    procedure SetAdoConnection(Value: TADOConnection);
    function GetParent: TWinControl;
    procedure SetParent(Value: TWinControl);
    function GetApplication: TApplication;
    procedure SetApplication(Value: TApplication);
    function GetBorderStyle: TFormBorderStyle;
    procedure SetBorderStyle(Value: TFormBorderStyle);
    function GetAlign: TAlign;
    procedure SetAlign(Value: TAlign);
    function GetPopupEvent: TPopupEvent;
    procedure SetPopupEvent(Value: TPopupEvent);

  private
    L_stServerComBuff : string;
    bDeviceMapShow : Boolean;

    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure DisConnectServer;
    procedure DisConnectDoor(aDoorID:string);
    procedure DisConnectAlarm(aAlarmID:string);
    procedure DisplayEvent(aData:string);
    procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aType,aACTION,aData:string);

  private
    DoorCodeList : TStringList;
    AlarmCodeList : TStringList;
    AlarmNoList : TStringList;
    { Private declarations }
    procedure DoorLoad(aBuildingCode,aFloorCode:string; DoorList:TListView);
    procedure AlarmLoad(aBuildingCode,aFloorCode:string; AlarmList:TListView);

  private
    procedure NODEDataProcess(aNodeNo,aTYPE,aACTION,aData:string);
    procedure ECUDataProcess(aNodeNo,aECUID,aTYPE,aACTION,aData:string);
    procedure AlarmDataProcess(aNodeNo,aEcuID,aType,aACTION,aData:string);

    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //출입데이터
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure DEVICEDataProcess(aNodeNo,aECUID,aData:string);

    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //알람 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);

    procedure DisConnectNode(aNodeNo:string);
    procedure DisConnectECU(aEcuID:string);

  public
    L_stBuildingCode : string;
    L_stFloorCode : string;
    L_ADOConnection: TADOConnection;
    L_WinsockPort: TApdWinsockPort;
    L_bClose : Boolean;
    L_IsMaster : Boolean;
    L_stGroupCode : string;
    L_stMasterID : string;
    { Public declarations }
    procedure showmessage(aMessage:string);
    procedure CloseForm;
    procedure FormInitialize;

  published
    property OnPopupEvent: TPopupEvent read FOnPopupEvent write FOnPopupEvent;
    property OnBuildingCode : string read GetBuildingCode write SetBuindingCode;
    property OnFloorCode : string read GetFloorCode write SetFloorCode;
    property OnIsMaster : Boolean read GetIsMaster write SetIsMaster;
    property OnGroupCode : string read GetGroupCode write SetGroupCode;
    property OnMasterID : string read GetMasterID write SetMasterID;
    property AdoConnection :TADOConnection read GetAdoConnection write SetAdoConnection;
    property OnParent:TWinControl read GetParent Write SetParent;
    property OnApplication:TApplication read GetApplication write SetApplication;
    property OnBorderStyle:TFormBorderStyle read GetBorderStyle write SetBorderStyle;
    property OnAlign:TAlign read GetAlign write SetAlign;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uLomosUtil;
{$R *.dfm}

{ TfmMain }

procedure TfmMain.DoorLoad(aBuildingCode, aFloorCode: string;
  DoorList: TListView);
var
  stSql : string;
  stDoorID : string;
  i : integer;
  stCode : string;
  TempAdoQuery :TADOQuery;
begin
  if L_bClose then Exit;
  DoorCodeList.Clear;
  DoorList.Clear;
  //Door정보 로딩
  stSql := ' Select a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_DOOR a ';
  if Not L_IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
    stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + L_stGroupCode + ''' ';
  if Not L_IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + L_stMasterID + ''' ';
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' Group by a.DO_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := L_ADOConnection;
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
    
      First;
      i:=0;
      While Not Eof do
      begin
        if L_bClose then Exit;
        DoorList.Items.Add.Caption:= FindField('DO_DOORNONAME').asString;
        stDoorID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                   + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
        DoorList.Items[I].SubItems.Add(stDoorID);     // 문 ID
        DoorList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
        DoorList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
        DoorList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
        DoorList.Items[I].SubItems.Add(FindField('DO_DOORNO').AsString); //문번호
        DoorList.Items[I].ImageIndex:=2;

        inc(i);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  DoorCodeList.Clear;
  for i:=0 to DoorList.Items.Count - 1 do
  begin
    stCode := DoorList.Items[I].SubItems.Strings[0];
    DoorCodeList.Add(DoorList.Items[I].SubItems.Strings[0]);  //문의 코드를 등록하자
  end;

  if DoorList.ViewStyle = vsList then
  begin
    DoorList.ViewStyle := vsIcon;
    DoorList.Refresh;
    DoorList.ViewStyle := vsList;
  end;

end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  L_bClose := True;
  DoorCodeList.Free;
  AlarmCodeList.Free;
  AlarmNoList.Free;

  Action := caFree;

end;

procedure TfmMain.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st:String;
  I: Integer;
  stReceiveData:String;
  nIndex : integer;
begin
  st:= '';
  for I := 1 to Count do st := st + L_WinsockPort.GetChar;
  L_stServerComBuff:= L_stServerComBuff + st ;

  repeat
    stReceiveData:= Copy(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    Delete(L_stServerComBuff,1,Pos(LINEEND,L_stServerComBuff));
    nIndex := Pos('R',stReceiveData);
    if nIndex < 0 then      continue;
    if nIndex > 1 then Delete(stReceiveData,1,nIndex - 1);
    if Length(Trim(stReceiveData)) < 2 then continue;

    Try
      //여기에서 데이터 뿌려줌
      if stReceiveData[1] = 'R' then     //기기에서 올라온 데이터 이면
      begin
        DisplayEvent(stReceiveData);
      end;
    Except
      //
    End;
    Application.ProcessMessages;
  until pos(LINEEND,L_stServerComBuff) = 0;

end;

procedure TfmMain.WinsockPortWsConnect(Sender: TObject);
begin
//
end;

procedure TfmMain.WinsockPortWsDisconnect(Sender: TObject);
begin
  DisConnectServer;
end;

procedure TfmMain.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
begin
  DisConnectServer;
end;

procedure TfmMain.AlarmLoad(aBuildingCode, aFloorCode: string;
  AlarmList: TListView);
var
  stSql : string;
  stAlarmID : string;
  i : integer;
  stLocate,stBuildingName,stAreaName,stFloorName : string;
  TempAdoQuery :TADOQuery;
begin
  if L_bClose then Exit;
  //pan_Alarm.Visible := False;
  AlarmCodeList.Clear;
  AlarmNoList.Clear;

  AlarmList.Clear;

  //Alarm정보 로딩
  stSql := ' Select a.AL_VIEWSEQ,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE ';
  stSql := stSql + ' From TB_ALARMDEVICE a ';
  if Not L_IsMaster then
  begin
    stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
    stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  end;
  stSql := stSql + ' where a.GROUP_CODE = ''' + L_stGroupCode + ''' ';
  if Not L_IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + L_stMasterID + ''' ';
  if ( aBuildingCode <> '' ) and ( aBuildingCode <> '000' ) then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if ( aFloorCode <> '' ) and ( aFloorCode <> '000' ) then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' Order by a.AL_VIEWSEQ ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := L_ADOConnection;
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
        pan_Alarm.Visible := False;
        Exit;
      end;
      pan_Alarm.Visible := True;

      First;
      i:=0;
      While Not Eof do
      begin
        if L_bClose then Exit;
        //AlarmList.Columns.Add.AutoSize := True;
        AlarmList.Items.Add.Caption:= FindField('AL_ZONENAME').asString;
        stAlarmID:= FillZeroNumber( FindField('AC_NODENO').AsInteger,3)
                   + FindField('AC_ECUID').AsString;// + FillZeroNumber(FindField('AL_DEVICENO').AsInteger,3);
        AlarmList.Items[I].SubItems.Add(stAlarmID);     // 방범 ID
        //AlarmCodeList.Add(stAlarmID);  //방범아이디를 등록하자
        AlarmNoList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +FindField('AC_ECUID').AsString );

        AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3)); //노드번호
        AlarmList.Items[I].SubItems.Add(FindField('AC_MCUID').AsString); //MCUID
        AlarmList.Items[I].SubItems.Add(FindField('AC_ECUID').AsString); //ECUID
        AlarmList.Items[I].SubItems.Add(FillZeroNumber( FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString); //알람아이디
        AlarmList.Items[I].ImageIndex:=2;

        inc(i);
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  AlarmCodeList.Clear;
  for i:=0 to AlarmList.Items.Count - 1 do
  begin
    AlarmCodeList.Add(AlarmList.Items[I].SubItems.Strings[0]);  //경비구역의 코드를 등록하자
  end;
  AlarmList.ViewStyle := vsIcon;
  AlarmList.Refresh;
  AlarmList.ViewStyle := vsList;

end;

procedure TfmMain.DisConnectServer;
var
  i : integer;
  stDoorCode : string;
  stAlarmCode : string;
begin
  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    DisConnectDoor(stDoorCode);
  end;
  for i:=0 to AlarmCodeList.Count - 1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    DisConnectAlarm(stAlarmCode);
  end;

end;

procedure TfmMain.DisConnectDoor(aDoorID: string);
var
  bRefresh:Boolean;
begin
  if DoorCodeList.IndexOf(aDoorID) < 0 then Exit;
  bRefresh := False;

  if IntDoorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex <> 2 then
  begin
    IntDoorListView.Items[DoorCodeList.IndexOf(aDoorID)].ImageIndex:=2;
    bRefresh := True;
  end;
  if IntDoorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex <> -1 then
  begin
    IntDoorListView.Items[DoorCodeList.IndexOf(aDoorID)].StateIndex := -1;
    bRefresh := true;
  end;

  if bRefresh then
  begin
    IntDoorListView.Refresh;
  end;
end;

procedure TfmMain.DisConnectAlarm(aAlarmID: string);
begin
  if AlarmCodeList.IndexOf(aAlarmID) < 0 then Exit;

  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].ImageIndex:=2;
  IntAlarmListView.Items[AlarmCodeList.IndexOf(aAlarmID)].StateIndex := -1;
  IntAlarmListView.Refresh;

end;

procedure TfmMain.DisplayEvent(aData: string);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  aCommand : char;
  MSG_Code: Char;
  stDevice : string; //S:서버,E:ECU,D:Door,
  stTYPE : string;
  stACTION : string;
  nLength : integer;
  stData : string;
begin
  stReceiveData := aData;
  if stReceiveData = 'ALARMREFRESH' then
  begin
    //SearchAlarmList;
    Exit;
  end;
  stDevice := stReceiveData[2];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  stDoorNo := copy(stReceiveData,8,2);
  stReaderNo := copy(stReceiveData,10,2);
  if Not Isdigit(stNodeNo) then Exit;
  if Not Isdigit(stEcuID) then Exit;
  if Not Isdigit(stDoorNo) then Exit;
  if Not Isdigit(stReaderNo) then Exit;
  if Not Isdigit(copy(stReceiveData,15,3)) then Exit;

  stTYPE := copy(stReceiveData,12,2);
  stACTION := copy(stReceiveData,14,1);
  nLength := strtoint(copy(stReceiveData,15,3));
  stData := copy(stReceiveData,18,nLength);

  if stDevice = 'S' then     //서버에서 주는 데이터 처리
  begin
    if UpperCase(stData) = 'RESTART' then
    begin
//      Action_ReloadExecute(Self);
      Exit;
    end;
  end else if stDevice = 'N' then //노드 데이터 처리
  begin
//    NODEDataProcess(stNodeNo,stTYPE,stACTION,stData);
  end else if stDevice = 'E' then //기기 데이터 처리
  begin
//    ECUDataProcess(stNodeNo,stECUID,stTYPE,stACTION,stData);
  end else if stDevice = 'D' then //출입문 데이터 처리
  begin
    DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stType,stACTION,stData);
  end else if stDevice = 'R' then //리더 데이터 처리
  begin
  end else if stDevice = 'A' then //알람 데이터 처리
  begin
//    AlarmDataProcess(stNodeNo,stEcuID,stType,stACTION,stData);
  end;

end;

procedure TfmMain.DoorDataProcess(aNodeNo, aEcuID, aDoorNo, aType, aACTION,
  aData: string);
var
  nIndex : integer;
  cDoorMode : char;
  cDoorMode2 : char;
  cDoorState : char;
  i : integer;
  bRefresh : Boolean;
begin
  bRefresh := False;

  nIndex := DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + aEcuID + inttostr(strtoint(aDoorNo)));

  if nIndex < 0 then Exit; // 관제 권한이 없음
  if aType = 'DV' then
  begin
    if aAction = 'S' then
    begin
      cDoorMode := aData[1];
      cDoorMode2 := aData[2];
      cDoorState := aData[3];

      if cDoorMode2 = '0' then    // Positive 이면
      begin
        Case cDoorMode of
          '0':       //운영모드
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 0;
          end;
          else
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;
      end else
      begin
        Case cDoorMode of
          '0':
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= 1;
          end;
          else
          begin
            if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
            IntdoorListView.Items[nIndex].StateIndex:= -1;
          end;
        end;

      end;

      case cDoorState of
        'C': //닫힘
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //열림
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //에러
          begin
            if IntdoorListView.Items[nIndex].ImageIndex <> 2 then bRefresh := True;
            IntdoorListView.Items[nIndex].ImageIndex:=2;
          end;
        'T'://장시간 열림
          begin
            //stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
          end;
        'U'://해정이상
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
          end;
        'L'://시정이상
          begin
            //stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            //          Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
            //st:= doorListView.Items[nIndex].Caption;
            //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
          end;
      end;
      if bRefresh then
      begin
        IntdoorListView.Refresh;
      end;
    end;
  end;
end;

procedure TfmMain.pm_intiOpenModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntDoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntDoorListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'DOOR','OPENMODE',stDoorID);
  end;

end;

function TfmMain.GetBuildingCode: string;
begin
  result := L_stBuildingCode;
end;

procedure TfmMain.SetBuindingCode(Value: string);
begin
  L_stBuildingCode := Value;
end;

function TfmMain.GetFloorCode: string;
begin
  result := L_stFloorCode;
end;

procedure TfmMain.SetFloorCode(Value: string);
begin
  L_stFloorCode := value;
end;

function TfmMain.GetIsMaster: Boolean;
begin
  result := L_IsMaster;
end;

procedure TfmMain.SetIsMaster(Value: Boolean);
begin
  L_IsMaster := Value;
end;

function TfmMain.GetGroupCode: string;
begin
  result := L_stGroupCode;
end;

procedure TfmMain.SetGroupCode(Value: string);
begin
  L_stGroupCode := Value;
end;

function TfmMain.GetMasterID: string;
begin
  result := L_stMasterID;
end;

procedure TfmMain.SetMasterID(Value: string);
begin
  L_stMasterID := Value;
end;

function TfmMain.GetAdoConnection: TADOConnection;
begin
  result := L_ADOConnection;
end;

procedure TfmMain.SetAdoConnection(Value: TADOConnection);
begin
  L_ADOConnection := Value;
end;

function TfmMain.GetParent: TWinControl;
begin
  result := fmMain.Parent;
end;

procedure TfmMain.SetParent(Value: TWinControl);
begin
  fmMain.Parent := Value;
end;

function TfmMain.GetApplication: TApplication;
begin
  result := Application;
end;

procedure TfmMain.SetApplication(Value: TApplication);
begin
  Application := value;
end;

function TfmMain.GetBorderStyle: TFormBorderStyle;
begin
  result := fmMain.BorderStyle;
end;

procedure TfmMain.SetBorderStyle(Value: TFormBorderStyle);
begin
  fmMain.BorderStyle := Value;
end;

function TfmMain.GetAlign: TAlign;
begin
  result := fmMain.Align;
end;

procedure TfmMain.SetAlign(Value: TAlign);
begin
  fmMain.Align := Value;
end;

function TfmMain.GetPopupEvent: TPopupEvent;
begin

end;

procedure TfmMain.SetPopupEvent(Value: TPopupEvent);
begin

end;

procedure TfmMain.pm_intiOperateModeClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntDoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntDoorListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'DOOR','OPERATEMODE',stDoorID);
  end;

end;

procedure TfmMain.pm_intiStateCheckClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntDoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntDoorListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'STATE','STATECHECK',stDoorID);
  end;

end;

procedure TfmMain.pm_intiDoorOpenClick(Sender: TObject);
var
  stDoorID : string;
begin
  if IntDoorListView.SelCount < 1 then Exit;
  stDoorID:= DoorCodeList[IntDoorListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'DOOR','DOOROPEN',stDoorID);
  end;

end;

procedure TfmMain.N15Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsIcon;

end;

procedure TfmMain.N16Click(Sender: TObject);
begin
  IntDoorListView.ViewStyle := vsList;

end;

procedure TfmMain.showmessage(aMessage: string);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  aCommand : char;
  MSG_Code: Char;
  stDevice : string; //S:서버,E:ECU,D:Door,
  stTYPE : string;
  stACTION : string;
  nLength : integer;
  stData : string;
begin
  Edit1.Text := aMessage;
  stReceiveData := aMessage;
  stDevice := stReceiveData[2];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  stDoorNo := copy(stReceiveData,8,2);
  stReaderNo := copy(stReceiveData,10,2);
  if Not Isdigit(stNodeNo) then Exit;
  if Not Isdigit(stEcuID) then Exit;
  if Not Isdigit(stDoorNo) then Exit;
  if Not Isdigit(stReaderNo) then Exit;
  if Not Isdigit(copy(stReceiveData,15,3)) then Exit;

  stTYPE := copy(stReceiveData,12,2);
  stACTION := copy(stReceiveData,14,1);
  nLength := strtoint(copy(stReceiveData,15,3));
  stData := copy(stReceiveData,18,nLength);

  if stDevice = 'S' then     //서버에서 주는 데이터 처리
  begin
    //
  end else if stDevice = 'N' then //노드 데이터 처리
  begin
    NODEDataProcess(stNodeNo,stTYPE,stACTION,stData);
  end else if stDevice = 'E' then //기기 데이터 처리
  begin
    ECUDataProcess(stNodeNo,stECUID,stTYPE,stACTION,stData);
  end else if stDevice = 'D' then //출입문 데이터 처리
  begin
    DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stType,stACTION,stData);
  end else if stDevice = 'R' then //리더 데이터 처리
  begin
  end else if stDevice = 'A' then //알람 데이터 처리
  begin
    AlarmDataProcess(stNodeNo,stEcuID,stType,stACTION,stData);
  end;
end;


procedure TfmMain.CloseForm;
begin
  Close;
end;

procedure TfmMain.NODEDataProcess(aNodeNo, aTYPE, aACTION, aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectNode('N' + aNodeNo);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      //ConnectNode('N' + aNodeNo);
    end;
  end;

end;

procedure TfmMain.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
  aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      //ConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end;
  end else if aTYPE = 'AC' then //출입 데이터
  begin
    ACDataProcess(aNodeNo,aECUID,aData);
  end else if aTYPE = 'AL' then //전체 데이터
  begin
    DEVICEDataProcess(aNodeNo,aECUID,aData);
  end;

end;

procedure TfmMain.AlarmDataProcess(aNodeNo, aEcuID, aType, aACTION,
  aData: string);
var
  nImageIndex : integer;
  nIndex : integer;
begin
  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + aEcuID );

  if nIndex < 0 then Exit;// 관제 권한이 없음

  if aType = 'DV' then //기기정보
  begin
    if aAction = 'S' then //상태정보
    begin
      nImageIndex := 2;
      case aData[1] of
       'A': begin nImageIndex:= 4; end;
       'D': begin nImageIndex:= 3; end;
       'T': begin nImageIndex:= 6; end;
       'I': begin nImageIndex:= 7; end;
       'P': begin nImageIndex:= 8; end;
      else  begin nImageIndex:= 2; end;
      end;

      IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
    end;
  end else if aType = 'PT' then  //Alarm 발생 전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end else if aType = 'AL' then  //전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end;

end;

procedure TfmMain.DisConnectNode(aNodeNo: string);
var
  i : integer;
begin
  for i := 0 to DoorCodeList.Count - 1 do
  begin
    if copy(aNodeNo,2,3) = copy(DoorCodeList.Strings[i],1,3) then
    begin
      DisConnectDoor(DoorCodeList.Strings[i]);
    end;
  end;

end;

procedure TfmMain.DisConnectECU(aEcuID: string);
var
  i : integer;
begin
  for i := 0 to DoorCodeList.Count - 1 do
  begin
    if copy(aEcuID,2,5) = copy(DoorCodeList.Strings[i],1,5) then
    begin
      DisConnectDoor(DoorCodeList.Strings[i]);
    end;
  end;

end;

procedure TfmMain.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmMain.RcvCardReadData(aNodeNo, aReceiveData: string);
begin
  //처리할 데이터가 없음
end;

procedure TfmMain.DEVICEDataProcess(aNodeNo, aECUID, aData: string);
var
  cCMD :char;
  MSG_Code : char;
  stDoorNo : string;
begin
  cCMD:= aData[17];
  stDoorNo:= aData[21];


  if Pos('COMM ERROR',aData) > 0 then
    DisConnectECU('E' + aNodeNo + aECUID )
  else if Pos('UNUSED',aData) > 0 then DisConnectECU('E' + aNodeNo + aECUID )
  else if cCMD <> 'A' then
  begin
//    ConnectNode('N' + aNodeNo);
//    ConnectECU('E' + aNodeNo + aECUID );
  end;

  // 여기에서 화면에 디스플레이 해 주자... 전문을 분석해서...^^

  case cCMD of
    'A': begin // 알람 데이터
           DeviceRcvAlarmData(aNodeNo,aData);
         end;

    'c': begin      //카드데이터 처리
           //Connected:= True;
           MSG_Code:= aData[19];
           case MSG_Code of
             'E' ://카드 데이터(출입) 처리
                begin
                   RcvCardReadData(aNodeNo,aData);
                end;
             'D' ://문 상태 변경 처리
                begin
                  RcvChangeDoorData(aNodeNo,aData);
                end;
             'c' ://문제어 응답
                begin
                  RcvDoorControl(aNodeNo,aData);
                end;
             'a','b'://출입통제 등록 웅답
                begin
                  //RcvDoorSetup(Self,aData);
                end;
             'l','m','n':// 카드 데이터 등록 응답
                begin
                  //RcvRegCardData(Self,aData);
                end;
           end;
         end;
  end;

end;

procedure TfmMain.DeviceRcvAlarmData(aNodeNo, aReceiveData: string);
begin
//이상 발생시 해당 알람메시지에 이상 표시 할때 처리
end;

procedure TfmMain.RcvChangeDoorData(aNodeNo, aReceiveData: string);
Var
  st: String;
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  nIndex  : Integer;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  stTimeStr: String;
  stTime: String;
  i : integer;
  bRefresh : Boolean;
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  bRefresh := False;
  if Length(aReceiveData) < 40 then    Exit;

//  stMCUID := Copy(aReceiveData,8,7);
  stECUID := Copy(aReceiveData,15,2);
  stDoorNo:= aReceiveData[21];
  nIndex:= DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo);
  //SHowMessage(DeviceID+aDoorNo + #13 + InttoStr(aINdex));
  if nIndex < 0 then    Exit;

  cMsgNo:=    aReceiveData[18];
  cDoorState:= aReceiveData[40];    //문상태
  cDoorMode:=  aReceiveData[37];    //운영/개방
  cDoorMode2:= aReceiveData[36];    //Posi/Nega
  stTime:=     Copy(aReceiveData,24,12);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
      end;
    'U'://해정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
      end;
    'L'://시정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= IntdoorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
      end;
  end;
  if bRefresh then
  begin
    IntdoorListView.Refresh;
  end;
  

end;

procedure TfmMain.RcvDoorControl(aNodeNo, aReceiveData: string);
var
  stECUID: String;
  stDoorNo: String;
  cMsgNo: Char;
  nIndex  : Integer;
  cDoorState: Char;
  cDoorMode: Char;
  cDoorMode2: Char;
  stState : string;
  i : integer;
  bRefresh : Boolean;
begin
  //SHowMessage(ReceiveData);

  bRefresh := False;

//  stMCUID := Copy(aReceiveData,8,7);
  stECUID := Copy(aReceiveData,15,2);
  stDoorNo:= aReceiveData[21];
  nIndex:= DoorCodeList.IndexOf(FillzeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo);
  //SHowMessage(DeviceID+aDoorNo + #13 + InttoStr(aINdex));
  if nIndex < 0 then    Exit;

  cDoorMode2:= aReceiveData[24];    //Posi/Nega
  cDoorMode:=  aReceiveData[25];    //운영/개방
  cDoorState:= aReceiveData[26];    //문상태
  stState := cDoorMode + cDoorState ;
//  MapAction('3',aNodeNo,stECUID,stDoorNo,stState);

  if cDoorMode2 <> '1' then
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if IntdoorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if IntdoorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  if bRefresh then
  begin
    IntdoorListView.Refresh;
  end;

end;

procedure TfmMain.FormInitialize;
begin
  L_bClose :=  False;
  L_stServerComBuff := '';

  DoorCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;
  AlarmNoList := TStringList.Create;

  DoorLoad(L_stBuildingCode,L_stFloorCode,IntDoorListView);
  AlarmLoad(L_stBuildingCode,L_stFloorCode,IntAlarmListView);

end;

procedure TfmMain.btn_AllManageModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  for i := 0 to DoorCodeList.Count - 1 do
  begin
    stDoorID:= DoorCodeList[i];

    if Assigned(FOnPopupEvent) then
    begin
      OnPopupEvent(Self,'DOOR','OPERATEMODE',stDoorID);
    end;
    Delay(10);
  end;

end;

procedure TfmMain.btn_AllOpenModeClick(Sender: TObject);
var
  stDoorID : string;
  i : integer;
begin
  for i := 0 to DoorCodeList.Count - 1 do
  begin
    stDoorID:= DoorCodeList[i];

    if Assigned(FOnPopupEvent) then
    begin
      OnPopupEvent(Self,'DOOR','OPENMODE',stDoorID);
    end;
    Delay(10);
  end;

end;

procedure TfmMain.btn_AllPatrolModeClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  for i := 0 to AlarmCodeList.Count - 1 do
  begin
    stAlarmID:= AlarmCodeList[i];

    if Assigned(FOnPopupEvent) then
    begin
      OnPopupEvent(Self,'ALARM','ALARMSETTING',stAlarmID);
    end;
    Delay(10);
  end;

end;

procedure TfmMain.Menu_IntAlarmSettingClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'ALARM','ALARMSETTING',stAlarmID);
  end;

end;

procedure TfmMain.Menu_IntAlarmDisableClick(Sender: TObject);
var
  stAlarmID : string;
begin
  if IntAlarmListView.SelCount < 1 then Exit;
  stAlarmID:= AlarmCodeList[IntAlarmListView.ItemIndex];

  if Assigned(FOnPopupEvent) then
  begin
    OnPopupEvent(Self,'ALARM','ALARMDISABLE',stAlarmID);
  end;

end;

procedure TfmMain.btn_AllPtCancelModeClick(Sender: TObject);
var
  stAlarmID : string;
  i : integer;
begin
  for i := 0 to AlarmCodeList.Count - 1 do
  begin
    stAlarmID:= AlarmCodeList[i];

    if Assigned(FOnPopupEvent) then
    begin
      OnPopupEvent(Self,'ALARM','ALARMDISABLE',stAlarmID);
    end;
    Delay(10);
  end;

end;

end.
