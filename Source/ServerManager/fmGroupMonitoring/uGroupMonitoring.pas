unit uGroupMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AdvPageControl, ExtCtrls, Shader, ComCtrls, StdCtrls, Menus,
  ImgList, MPlayer, Grids, BaseGrid, AdvGrid, uSubForm, CommandArray,
  ActnList,ADODB,AdWnPort, DB,ActiveX,uGroupCommonLib, AdvObj;

type
  TfmGroupMonitoring = class(TfmASubForm)
    toolslist: TImageList;
    Popup_Locate: TPopupMenu;
    Menu_CurLocate: TMenuItem;
    mn_LocationMap: TMenuItem;
    Popup_Device: TPopupMenu;
    MenuItem7: TMenuItem;
    Menu_DeviceAllCardDown: TMenuItem;
    Menu_DeviceCardDown: TMenuItem;
    Menu_DeviceTimeSync: TMenuItem;
    Menu_DeviceReboot: TMenuItem;
    PageControl1: TPageControl;
    tbLOCATE: TTabSheet;
    GroupBox2: TGroupBox;
    TreeView_Location: TTreeView;
    Shader2: TShader;
    TreeView_LocationCode: TTreeView;
    tbDEVICE: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Splitter6: TSplitter;
    Panel2: TPanel;
    AdvPageControl1: TAdvPageControl;
    AdvPageControl2: TAdvPageControl;
    AdvTabSheet3: TAdvTabSheet;
    AdvTabSheet4: TAdvTabSheet;
    sg_Access: TAdvStringGrid;
    MediaPlayer1: TMediaPlayer;
    sg_Alarm: TAdvStringGrid;
    SmallDoorList: TImageList;
    stateList: TImageList;
    LageDoorList: TImageList;
    ActionList1: TActionList;
    Action_LoctionLoad: TAction;
    Action_DeviceLoad: TAction;
    ADOQuery: TADOQuery;
    Action_Reload: TAction;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_LoctionLoadExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTGRADEREFRESHExecute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTREFRESHExecute(Command: TCommand;
      Params: TStringList);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mn_LocationMapClick(Sender: TObject);
    procedure TreeView_LocationClick(Sender: TObject);
    procedure Menu_DeviceAllCardDownClick(Sender: TObject);
    procedure Menu_DeviceCardDownClick(Sender: TObject);
    procedure Menu_DeviceTimeSyncClick(Sender: TObject);
    procedure Menu_DeviceRebootClick(Sender: TObject);
  private
    DoorPopupEvent : TPopupEvent;
    procedure DoorPopupClick(Sender: TObject;  aType,aCmd,aDevice: string);
  private
    L_bClose : Boolean;
    L_bFirst : Boolean;
    { Private declarations }
    procedure LoadCompanyCode;
    procedure LoadJijumCode;
    procedure LoadDepartCode;

    function GetFlooreName(aBuildingCode,aFloorCode:string):string;
    procedure SearchAlarmList;
    function GetPortName(aNodeNo,aECUID,aPortNo:string):String;
    Function GetStatusCode(aStatusCode:string;var aStatusName :string;aAlarmSound:integer) : integer;
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2:string):Boolean;
    Function GetPermitState(aPermit:string):string;
    Function GetDoorLocationName(aDeviceCode:string;var aDoorName:string):string;
    function GetAlarmLocate(aNodeNo,aECUID:string;aAlarmName:string):string;

    procedure sg_AccessHeaderNameSet;
    procedure Form_Initialize;
    procedure GridSetting;
  private
    procedure   InsertAlarmList(aTime, //시간
                  aLocateName, //위치정보
                  aAlarmName, //경계구역명칭
                  aDeviceID,  //주장치번호[메시지번호]
                  aDeviceType,         //발생기기[번호]
                  aStatusCode,  //이벤트코드
                  aStatusName,
                  aAlaramCode:string;
                  aAlarmSound:integer;
                  List:TAdvStringGrid);  //이벤트 내용
    procedure InsertDOORList(aPermitCode,aPermit,aTime,aLocationName,aDoorName,aCardNo,aUserName,
              aCompanyName,aJijumName,aDepertName,aEmID,aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2:string;List:TAdvStringGrid);
    procedure DllSendMessage(aMessage:string);

  private
    procedure NODEDataProcess(aNodeNo,aTYPE,aACTION,aData:string);
    procedure ECUDataProcess(aNodeNo,aECUID,aTYPE,aACTION,aData:string);
    procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aType,aACTION,aData:string);
    procedure AlarmDataProcess(aNodeNo,aEcuID,aType,aACTION,aData:string);
    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure ACDataProcess(aNodeNo,aECUID,aData:string); //출입데이터
    procedure DEVICEDataProcess(aNodeNo,aECUID,aData:string);
    procedure DeviceRcvAlarmData(aNodeNo,aReceiveData: string); //알람 데이터 처리
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    procedure RcvChangeDoorData(aNodeNo,aReceiveData:string); //상태변경 데이터 처리
    procedure RcvDoorControl(aNodeNo,aReceiveData:string);

  public

    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList : TStringList;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    DoorCodeList : TStringList;   // Door코드를 가지고 있다
    intDoorCodeList : TStringList;   // Door코드를 가지고 있다
    DoorLocateList : TStringList; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmCodeList : TStringList;  //방범 코드를 가지고 있다.
    intAlarmCodeList : TStringList;  //방범 코드를 가지고 있다.
    AlarmNoList : TStringList;
    SensorCodeList : TStringList;  //센서 코드를 가지고 있다.
    AlarmLocateList : TStringList; //방범기기의 위치정보를 가지고 있다. (000000000위치정보)
    FoodCodeList : TStringList;   //식수 코드를 가지고 있다.
    FoodCodeNameList : TStringList; //식수명을 가지고 있다.
    FoodLocateList : TStringList;  //식수기기의 위치정보를 가지고 있다.(000000000위치정보)
    CompanyCodeList : TStringList; //회사코드를 가지고 있다.
    CompanyNameList : TStringList; //회사명칭을 가지고 있다.
    JijumCodeList : TStringList; //지점코드를 가지고 있다.
    JijumNameList : TStringList; //지점명칭을 가지고 있다.
    DepartCodeList : TStringList; //부서코드를 가지고 있다.
    DepartNameList : TStringList; //부서명칭을 가지고 있다.
    LocationMapList : TStringList; //LocationMap을 가지고 있다.

    MonitorGroupList : TStringList; //층코드별 Tab 위치를 가지고 있다.
    DllHandleArray: Array of integer; //Dll 생성 정보를 가지고 있다

    DoorIndexArray: Array of integer; //출입문 리스트 순서 배열
    relDoorIndexArray:Array of integer; //실제 위치

    AlarmIndexArray: Array of integer; //알람 리스트 순서 배열
    relAlarmIndexArray:Array of integer; //실제 위치


    procedure GroupLoader;
    procedure DllHandleFree;
  public
    { Public declarations }
    procedure ShowMessage(aMessage:string);
  end;

var
  fmGroupMonitoring: TfmGroupMonitoring;

implementation


uses
  uMDBSql,
  uPostGreSql,
  uMssql,
  uDataModule1,
  uLomosUtil,
  uMain, uLocationMap, uFireBird,
  uMonitoringCommonVariable;
{
Procedure ShowFloor(App:TApplication;Parent:TWinControl;aBuildingCode,aFloorCode,aGroup_code,aMasterID:string;IsMaster:Boolean;ADOConnection: TADOConnection;WinsockPort: TApdWinsockPort);
          External 'GroupMonitor.dll';
}

{$R *.dfm}


procedure TfmGroupMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    L_bClose := True;
    self.FindSubForm('Main').FindCommand('GROUPMONITOR').Params.Values['VALUE'] := 'FALSE';
    self.FindSubForm('Main').FindCommand('GROUPMONITOR').Execute;

    DeviceCodeList.Free; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList.Free;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList.Free; //기기명을 가지고 있다.
    DeviceLastTimeList.Free; //마지막 접속시간을 가지고 있다.
    DoorCodeList.Free;   // Door코드를 가지고 있다
    intDoorCodeList.Free;   // Door코드를 가지고 있다
    DoorLocateList.Free; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmCodeList.Free;  //방범 코드를 가지고 있다.
    intAlarmCodeList.Free;  //방범 코드를 가지고 있다.
    AlarmNoList.Free;
    SensorCodeList.Free;  //센서 코드를 가지고 있다.
    AlarmLocateList.Free; //방범기기의 위치정보를 가지고 있다. (000000000위치정보)
    FoodCodeList.Free;   //식수 코드를 가지고 있다.
    FoodCodeNameList.Free; //식수명을 가지고 있다.
    FoodLocateList.Free;  //식수기기의 위치정보를 가지고 있다.(000000000위치정보)
    CompanyCodeList.Free; //회사코드를 가지고 있다.
    CompanyNameList.Free; //회사명칭을 가지고 있다.
    JijumCodeList.Free; //지점코드를 가지고 있다.
    JijumNameList.Free; //지점명칭을 가지고 있다.
    DepartCodeList.Free; //부서코드를 가지고 있다.
    DepartNameList.Free; //부서명칭을 가지고 있다.
    LocationMapList.Free; //LocationMap을 가지고 있다.

    MonitorGroupList.Free;

    DllHandleFree;

    Action := caFree;
end;

procedure TfmGroupMonitoring.Action_LoctionLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  vNode1,vNode2,vNode3 : TTreeNode;
  stSql : string;
  stLocationCode,stLocationCaption : string;
  stParentCode : string;
begin
  if L_bClose then Exit;

  aTreeView := TreeView_Location;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  vTreeView := TreeView_LocationCode;   //위치 코드 등록으로 현재 상태를 파악하기 위함
  vTreeView.ReadOnly := True;
  vTreeView.Items.Clear;

  aNode:= aTreeView.Items.Add(nil,'위치');
  aNode.ImageIndex:=11;
  aNode.SelectedIndex:=11;
  aNode.StateIndex:= -1;
  vNode1 := vTreeView.Items.Add(nil,'000000000');

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectDongLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectDongLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectDongLocation
  else if DBTYPE = 'FB' then stSql := FireBird.SelectDongLocation
  else Exit;

  with DataModule1.GetObject.ADOQuery do
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
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '0' then  //빌딩 등록
      begin
        bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
        bNode.ImageIndex:=7;
        bNode.SelectedIndex:=7;
        bNode.StateIndex:= -1;
        vNode2 := vTreeView.Items.AddChild(vNode1,stLocationCode);
      end;
      Application.ProcessMessages;
      Next;
    end;
    aNode.Expanded := True;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectFloorLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectFloorLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectFloorLocation
  else if DBTYPE = 'FB' then stSql := FireBird.SelectFloorLocation
  else Exit;

  with DataModule1.GetObject.ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    //if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stParentCode := FindField('LO_DONGCODE').AsString + '000000';
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '1' then  //층 등록
      begin
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=8;
            cNode.SelectedIndex:=8;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then
          begin
            vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
          end;
          vNode1.Expanded := True;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectAreaLocation
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectAreaLocation
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectAreaLocation
  else if DBTYPE = 'FB' then stSql := FireBird.SelectAreaLocation
  else Exit;

  with DataModule1.GetObject.ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    //if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + '000';
      stLocationCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
      stLocationCaption := FindField('LO_NAME').AsString;
      if FindField('LO_GUBUN').AsString = '2' then  //구역 등록
      begin
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=9;
            cNode.SelectedIndex:=9;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if AccessUse then
  begin
    //출입문정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.DO_DOORNO,b.DO_DOORNONAME ';
    stSql := stSql + ' From TB_DOOR b ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
        stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
        stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )' ;
      end;
    end;
    stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
    begin
      if BuildingGrade = 1 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      end else if BuildingGrade = 2 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end else if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
    end;
    stSql := stSql + ' Order by b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE';

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCode := 'D1' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString ;
        stLocationCaption := FindField('DO_DOORNONAME').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=10;
            cNode.SelectedIndex:=10;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

  if PatrolUse then
  begin
    //경비구역 정보 로딩
    stSql := ' Select b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE, ';
    stSql := stSql + ' b.AC_NODENO,b.AC_MCUID,b.AC_ECUID,b.AL_ZONENAME ';
    stSql := stSql + ' From TB_ALARMDEVICE b ';
    if Not IsMaster then
    begin
      if BuildingGrade = 4 then
      begin
        stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE a ';
        stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
        stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
        stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
      end;
    end;
    stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
    if Not IsMaster then
    begin
      if BuildingGrade = 1 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      end else if BuildingGrade = 2 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end else if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
    end;
    stSql := stSql + ' Order by b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE';

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stParentCode := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString  + FindField('LO_AREACODE').AsString ;
        stLocationCode := 'D2' + FillzeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString  ;
        stLocationCaption := FindField('AL_ZONENAME').AsString;
        vNode1:= GetNodeByText(vTreeView,stParentCode,True);
        if vNode1 <> nil then
        begin
          bNode := aTreeView.Items.Item[vNode1.AbsoluteIndex];
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=12;
            cNode.SelectedIndex:=12;
            cNode.StateIndex:= -1;
          end;
          vNode2:= vTreeView.Items.Item[vNode1.AbsoluteIndex];
          if vNode2 <> nil then vNode3:= vTreeView.Items.AddChild(vNode2,stLocationCode);
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;


end;

procedure TfmGroupMonitoring.FormShow(Sender: TObject);
begin
    DeviceCodeList := TStringList.Create; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList := TStringList.Create;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList := TStringList.Create; //기기명을 가지고 있다.
    DeviceLastTimeList := TStringList.Create; //마지막 접속시간을 가지고 있다.
    DoorCodeList := TStringList.Create;   // Door코드를 가지고 있다
    intDoorCodeList := TStringList.Create;   // Door코드를 가지고 있다
    DoorLocateList := TStringList.Create; // Door의 위치정보를 가지고 있다. (000000000위치정보)
    AlarmCodeList := TStringList.Create;  //방범 코드를 가지고 있다.
    intAlarmCodeList := TStringList.Create;  //방범 코드를 가지고 있다.
    AlarmNoList := TStringList.Create;
    SensorCodeList := TStringList.Create;  //센서 코드를 가지고 있다.
    AlarmLocateList := TStringList.Create; //방범기기의 위치정보를 가지고 있다. (000000000위치정보)
    FoodCodeList := TStringList.Create;   //식수 코드를 가지고 있다.
    FoodCodeNameList := TStringList.Create; //식수명을 가지고 있다.
    FoodLocateList := TStringList.Create;  //식수기기의 위치정보를 가지고 있다.(000000000위치정보)
    CompanyCodeList := TStringList.Create; //회사코드를 가지고 있다.
    CompanyNameList := TStringList.Create; //회사명칭을 가지고 있다.
    JijumCodeList := TStringList.Create; //지점코드를 가지고 있다.
    JijumNameList := TStringList.Create; //지점명칭을 가지고 있다.
    DepartCodeList := TStringList.Create; //부서코드를 가지고 있다.
    DepartNameList := TStringList.Create; //부서명칭을 가지고 있다.
    LocationMapList := TStringList.Create; //LocationMap을 가지고 있다.

    MonitorGroupList := TStringList.Create;

    TreeView_Location.Items.Clear;
    TreeView_Device.Items.Clear;

    SetLength(DoorIndexArray,sg_Access.ColCount);
    SetLength(relDoorIndexArray,sg_Access.ColCount);
    
    SetLength(AlarmIndexArray,sg_Alarm.ColCount);
    SetLength(relAlarmIndexArray,sg_Alarm.ColCount);

    sg_Alarm.ColWidths[7] := 0;
    sg_Access.ColWidths[3] := 0;
    sg_Access.ColWidths[10] := 0;

    sg_AccessHeaderNameSet;
    Form_Initialize;
    GridSetting; //그리드를 사용자 환경에 맞게 셋팅함

    GroupLoader; //Dll Loader
end;

procedure TfmGroupMonitoring.Action_DeviceLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stSql : string;
  stParentCode : string;
  stLocationCaption : string;
  nIndex : integer;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  DeviceCodeList.Clear;
  DeviceStateList.Clear;
  DeviceCaptionList.Clear;
  DeviceLastTimeList.Clear;
  DoorCodeList.Clear;
  AlarmCodeList.Clear;

  aNode:= aTreeView.Items.Add(nil,'서버');
  if bSeverConnected then
  begin
    aNode.ImageIndex:=0;
    aNode.SelectedIndex:=0;
  end else
  begin
    aNode.ImageIndex:=14;
    aNode.SelectedIndex:=14;
  end;
  aNode.StateIndex:= -1;
  DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));
  DeviceCodeList.Add('00000');
  DeviceStateList.Add('D');
  DeviceCaptionList.Add('서버');

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectMCUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectMCUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectMCUDeviceLoad
  else if DBTYPE = 'FB' then stSql := FireBird.SelectMCUDeviceLoad
  else Exit;

  with DataModule1.GetObject.ADOQuery do
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
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + ':' + FindField('AC_MCUIP').AsString + ':' + FindField('AC_MCUPORT').AsString;
      DeviceCodeList.Add('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN의 접속시간 체크하자...
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      bNode.ImageIndex:=3;
      bNode.SelectedIndex:=3;
      bNode.StateIndex:= -1;

      Application.ProcessMessages;
      Next;
    end;
  end;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectECUDeviceLoad
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectECUDeviceLoad
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectECUDeviceLoad
  else if DBTYPE = 'FB' then stSql := FireBird.SelectECUDeviceLoad
  else Exit;


  with DataModule1.GetObject.ADOQuery do
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
    First;
    While Not Eof do
    begin
      if L_bClose then Exit;
      stLocationCaption := FindField('AC_ECUID').asstring + ':' + FindField('AC_DEVICENAME').asstring;
      DeviceCodeList.Add('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring);
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //ECU의 접속시간 체크하자...
      nIndex := DeviceCodeList.IndexOf('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      if nIndex > -1 then
      begin
        stParentCode := DeviceCaptionList.Strings[nIndex] ;
        bNode:= GetNodeByText(aTreeView,stParentCode,True);
        if bNode <> nil then
        begin
          cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
          cNode.ImageIndex:=5;
          cNode.SelectedIndex:=5;
          cNode.StateIndex:= -1;
        end;
      end;
      Application.ProcessMessages;
      Next;
    end;
  end;

  if AccessUse then
  begin
    if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_DOORJoinAdmin('','','',False)
    else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_DOORJoinAdmin('','','',False)
    else Exit;

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stLocationCaption := FindField('DO_DOORNO').asstring + ':' + FindField('DO_DOORNONAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
        DeviceStateList.Add('D');
        DeviceCaptionList.Add(stLocationCaption);
        DoorCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring + FindField('DO_DOORNO').asstring);
        nIndex := DeviceCodeList.IndexOf('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring);
        if nIndex > -1 then
        begin
          stParentCode := DeviceCaptionList.Strings[nIndex] ;
          bNode:= GetNodeByText(aTreeView,stParentCode,True);
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=10;
            cNode.SelectedIndex:=10;
            cNode.StateIndex:= -1;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

  if PatrolUse then
  begin
    //경비구역 로딩
    if DBTYPE = 'MDB' then stSql := MDBSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'MSSQL' then stSql := MSSql.selectTB_ARMAREJoinAdmin('','','')
    else if DBTYPE = 'FB' then stSql := FireBird.selectTB_ARMAREJoinAdmin('','','')
    else Exit;

    with DataModule1.GetObject.ADOQuery do
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
      First;
      While Not Eof do
      begin
        if L_bClose then Exit;
        stLocationCaption :=  FindField('AL_ZONENAME').asstring;
        DeviceCodeList.Add('D' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring );
        DeviceStateList.Add('D');
        DeviceCaptionList.Add(stLocationCaption);
        AlarmCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)+FindField('AC_ECUID').asstring);
        nIndex := DeviceCodeList.IndexOf('E' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asstring);
        if nIndex > -1 then
        begin
          stParentCode := DeviceCaptionList.Strings[nIndex] ;
          bNode:= GetNodeByText(aTreeView,stParentCode,True);
          if bNode <> nil then
          begin
            cNode:= aTreeView.Items.AddChild(bNode,stLocationCaption);
            cNode.ImageIndex:=12;
            cNode.SelectedIndex:=12;
            cNode.StateIndex:= -1;
          end;
        end;
        Application.ProcessMessages;
        Next;
      end;
    end;
  end;

end;

procedure TfmGroupMonitoring.GroupLoader;
var
  stsql : string;
  TabSheet : TAdvTabSheet;
  iDllHandle : integer;
  DllShowFloor : procedure (App:TApplication;Parent:TWinControl;aBuildingCode,aFloorCode,aGroup_code,aMasterID:string;IsMaster:Boolean;ADOConnection: TADOConnection;popupEvent:TPopupEvent;aTabNo:string);
  //Get_DllGroupForm : function (App:TApplication;Parent:TWinControl):IDllGroupForm;
  //DllGroupForm : IDllGroupForm;
  nCount : integer;
  TempAdoQuery :TADOQuery;
begin
  stSql := ' Select aa.LO_DONGCODE,aa.LO_FLOORCODE From ';
  stSql := stSql +  ' ( Select b.LO_DONGCODE,b.LO_FLOORCODE ';
  stSql := stSql + ' From TB_DOOR b ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR a ';
      stSql := stSql + ' ON (a.GROUP_CODE =  b.GROUP_CODE ' ;
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )' ;
    end;
  end;
  stSql := stSql + ' where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND b.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND b.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND b.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND a.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ' Union All ';
  stSql := stSql + ' Select c.LO_DONGCODE,c.LO_FLOORCODE ';
  stSql := stSql + ' From TB_ALARMDEVICE c ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMDEVICE d ';
      stSql := stSql + ' ON (c.GROUP_CODE =  d.GROUP_CODE ' ;
      stSql := stSql + ' AND c.AC_NODENO = d.AC_NODENO  ';
      stSql := stSql + ' AND c.AC_ECUID = d.AC_ECUID ) ';
    end;
  end;
  stSql := stSql + ' where c.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND c.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND c.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND c.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND d.AD_USERID = ''' + Master_ID + ''' ';
  end;
  stSql := stSql + ') aa ';
  stSql := stSql + ' GROUP BY aa.LO_DONGCODE,aa.LO_FLOORCODE ';
  stSql := stSql + ' Order BY aa.LO_DONGCODE,aa.LO_FLOORCODE ';

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
      if recordCount < 1 then exit;
      MonitorGroupList.Clear;
      SetLength(DllHandleArray,recordCount);
      nCount := 0;
      While Not Eof do
      begin
        TabSheet := TAdvTabSheet.Create(nil);
        TabSheet.AdvPageControl := AdvPageControl1;
        TabSheet.Caption := GetFlooreName(FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString);
        MonitorGroupList.AddObject(FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString,TabSheet);
        iDllHandle := LoadLibrary('GroupMonitor.dll');
        DllHandleArray[nCount] := iDllHandle;
        if iDllHandle > 32 then //Dll Load 성공시
        begin
          @DllShowFloor := getProcAddress(iDllHandle,'ShowFloor');
          //@Get_DllGroupForm := getProcAddress(iDllHandle,'Get_DllGroupForm');
          if @DllShowFloor <> nil then //함수를 잘 가져온 경우
          begin
            DoorPopupEvent := DoorPopupClick;
            DllShowFloor(Application,TabSheet,FindField('LO_DONGCODE').AsString,FindField('LO_FLOORCODE').AsString,GROUPCODE,Master_ID,IsMaster,DataModule1.ADOConnection,DoorPopupEvent,inttostr(nCount));
{            DllGroupForm := Get_DllGroupForm(Application,TabSheet);
//            DllGroupForm.OnParent := TabSheet;
            DllGroupForm.OnBuildingCode := FindField('LO_DONGCODE').AsString;
            DllGroupForm.OnFloorCode := FindField('LO_FLOORCODE').AsString;
            DllGroupForm.OnIsMaster := IsMaster;
            DllGroupForm.OnGroupCode := GROUPCODE;
            DllGroupForm.OnMasterID := Master_ID;
            DllGroupForm.AdoConnection := DataModule1.ADOConnection;
//            DllGroupForm.OnApplication := Application;
            DllGroupForm.Show; }
          end;
        end;
        inc(nCount);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmGroupMonitoring.GetFlooreName(aBuildingCode,
  aFloorCode: string): string;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
  stSql := 'select b.lo_name as buildingname, a.lo_name as FloorName ';
  stSql := stSql + ' From TB_LOCATION a ';
  stSql := stsql + ' Left Join TB_LOCATION b ';
  stsql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_GUBUN = ''0'') ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stsql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stsql := stsql + ' AND a.LO_GUBUN = ''1'' ';

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
      if recordcount < 1 then Exit;

      result := FindField('buildingname').AsString + ' - ' + FindField('FloorName').AsString;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.DllHandleFree; //Dll Free 하지 않아도 된다고 함
var
  i : integer;
  DllFormClose : procedure (aTabNo:string);
begin
  if DllHandleArray = nil then Exit;
  for i := LOW(DllHandleArray) to HIGH(DllHandleArray) do
  begin
    if DllHandleArray[i] >= 32 then
    begin
      @DllFormClose := getProcAddress(DllHandleArray[i],'FormClose');
      //@Get_DllGroupForm := getProcAddress(iDllHandle,'Get_DllGroupForm');
      if @DllFormClose <> nil then //함수를 잘 가져온 경우
      begin
        DllFormClose(inttostr(i));
      end;
//      FreeLibrary(DllHandleArray[i]);
    end;
  end;
{  for i:= 0 to MonitorGroupList.Count - 1 do
  begin
    if MonitorGroupList.Objects[i] <> nil then
      TAdvTabSheet(MonitorGroupList.Objects[i]).Free;
  end;
}
end;

procedure TfmGroupMonitoring.DoorPopupClick(Sender: TObject; aType, aCmd,
  aDevice: string);
begin
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := aCmd+ DATADELIMITER + aDevice + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if UpperCase(aType) = 'DOOR' then
    DataModule1.TB_SYSTEMLOGInsert(copy(aDevice,1,3),copy(aDevice,4,2),DOORTYPE,'0','0000000000',aCmd)
  else if UpperCase(aType) = 'ALARM' then
    DataModule1.TB_SYSTEMLOGInsert(copy(aDevice,1,3),copy(aDevice,4,2),ALARMTYPE,'0','0000000000',aCmd);
end;

procedure TfmGroupMonitoring.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmGroupMonitoring.CommandArrayCommandsTGRADEREFRESHExecute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade or IsUpdateGrade  then
  begin
  end
  else
  begin
    TreeView_Device.PopupMenu := nil;
  end;
end;

procedure TfmGroupMonitoring.CommandArrayCommandsTREFRESHExecute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmGroupMonitoring.Action_ReloadExecute(Sender: TObject);
begin

  LoadCompanyCode;
  LoadJijumCode;

  LoadDepartCode;

  Action_DeviceLoadExecute(Self);
  Action_LoctionLoadExecute(Self);

//  DllHandleFree;
//  GroupLoader;

{  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;
}
end;

procedure TfmGroupMonitoring.FormActivate(Sender: TObject);
begin
  if L_bFirst then
  begin
    L_bFirst := False;
    self.FindSubForm('Main').FindCommand('GROUPMONITOR').Params.Values['VALUE'] := 'TRUE';
    self.FindSubForm('Main').FindCommand('GROUPMONITOR').Execute;
    if ALARMVIEW = 'QUERY' then
    begin
      SearchAlarmList;
    end;
  end;

end;

procedure TfmGroupMonitoring.SearchAlarmList;
var
  stSql : string;
  nRow : integer;
  stTime,stLocate,stAlarmName : string;
  stEcuID,stDeviceType : string;
  stStatusCode,stStatusName : string;
  stPortName,stGRADE : string;
  nIndex : integer;
  TempAdoQuery :TADOQuery;
  stDate : string;
begin
  GridInitialize(sg_Alarm);
  stDate := FormatDateTime('yyyymmdd',now - G_nAlarmRefreshDate);

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'MSSQL' then stSql := MsSql.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_ALARMEVENTFromALARMCatch(stDate)
  else Exit;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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
      nRow := 1;
      if recordCount < 1 then Exit;
      sg_Alarm.RowCount := recordCount + 1;
      while Not Eof do
      begin
        nIndex := AlarmCodeList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString );

        if nIndex > -1 then
        begin
          stTime :=  copy(FindField('AL_DATE').AsString,1,4) + '-' +
                     copy(FindField('AL_DATE').AsString,5,2) + '-' +
                     copy(FindField('AL_DATE').AsString,7,2) + ' ' +
                     copy(FindField('AL_TIME').AsString,1,2) + ':' +
                     copy(FindField('AL_TIME').AsString,3,2) + ':' +
                     copy(FindField('AL_TIME').AsString,5,2);
          stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
//          stAlarmName:= AlarmListView.Items[nIndex].Caption; // 경계구역 명
          stEcuID := FindField('AC_ECUID').AsString;
          stDeviceType:=  FindField('AL_ALARMDEVICETYPECODE').AsString +'['+ FindField('AL_SUBADDR').AsString + ']';
          stStatusCode := FindField('AL_ALARMSTATUSCODE').AsString;
          stStatusName := FindField('AL_ALARMNAME').AsString;
          if stStatusName = '' then stStatusName := stStatusCode;
          if IsDigit(FindField('AL_ZONENO').AsString) then
          begin
            stPortName := GetPortName(inttostr(FindField('AC_NodeNo').asinteger),FindField('AC_ECUID').AsString,FindField('AL_ZONENO').AsString );
            if stPortName = '' then stPortName := FindField('AL_ZONENO').AsString;
            stStatusName := '[' + stPortName + ']' + stStatusName;    //어떤 조건으로 감지 되었는지 표시
          end;
          stGRADE := inttostr(FindField('AL_ALARMGRADE').AsInteger);

          with sg_Alarm do
          begin
            Cells[0,nRow] :=  stTime;
            Cells[1,nRow] :=  stLocate;
            Cells[2,nRow] :=  stAlarmName;
            Cells[3,nRow] :=  stEcuID;
            Cells[4,nRow] :=  stDeviceType;
            Cells[5,nRow] :=  stStatusCode;
            Cells[6,nRow] :=  stStatusName;
            Cells[7,nRow] :=  stGRADE;
            Cells[8,nRow] :=  FillZeroNumber(FindField('AC_NODENO').asInteger,3)+
                              stEcuID +
                              FillSpace(FindField('AL_ALARMDEVICETYPECODE').AsString,2) +
                              FillSpace(FindField('al_subaddr').AsString,2) +
                              FillSpace(FindField('al_zonecode').AsString,2) +
                              FillSpace(FindField('al_zoneno').AsString,2) +
                              FillSpace(FindField('al_alarmstatuscode').AsString,2)
                              ;
            if stGRADE = '2' then
            begin
              RowColor[nRow] := clYellow;
            end else if stGRADE = '3' then
            begin
              RowColor[nRow] := clRed;
            end;
          end;
          inc(nRow);
        end else
        begin
          sg_Alarm.RowCount := sg_Alarm.RowCount - 1;
        end;
        next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.FormCreate(Sender: TObject);
begin
  L_bFirst := True;
  L_bClose := False;
end;

function TfmGroupMonitoring.GetPortName(aNodeNo, aECUID,
  aPortNo: string): String;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '' ;

  stSql := 'select a.AL_ZONENAME from TB_ZONEDEVICE a ';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND a.AC_ECUID = ''' + aECUID + '''  ';
  stSql := stSql + ' AND a.AL_ZONENUM = ''' + inttostr(strtoint(aPortNo)) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0  then result := FindField('AL_ZONENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.ShowMessage(aMessage: string);
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
  stReceiveData := aMessage;
  if stReceiveData = 'ALARMREFRESH' then
  begin
    SearchAlarmList;
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
      Action_ReloadExecute(Self);
      Exit;
    end;
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
  DllSendMessage(aMessage);
end;

procedure TfmGroupMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
  aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectNode('N' + aNodeNo);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      ConnectNode('N' + aNodeNo);
    end;
  end;

end;

procedure TfmGroupMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE,
  aACTION, aData: string);
begin
  if aTYPE = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aData)) > 0 then
    begin
      DisConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end else if Pos('CONNECTED',UpperCase(aData)) > 0 then
    begin
      ConnectECU('E' + FillZeroNumber(strtoint(aNodeNo),3) + aECUID);
    end;
  end else if aTYPE = 'AC' then //출입 데이터
  begin
    ACDataProcess(aNodeNo,aECUID,aData);
  end else if aTYPE = 'AL' then //전체 데이터
  begin
    DEVICEDataProcess(aNodeNo,aECUID,aData);
  end;

end;

procedure TfmGroupMonitoring.DoorDataProcess(aNodeNo, aEcuID, aDoorNo,
  aType, aACTION, aData: string);
var
  nIndex : integer;
  cDoorMode : char;
  cDoorMode2 : char;
  cDoorState : char;
  i : integer;
  bRefresh : Boolean;
begin
  bRefresh := False;
  //여기에서 DLL 로 데이터 전송하자.
{
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
            if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=0;
            if PatrolUse then
              IntdoorListView.Items[nIndex].ImageIndex:=0;
          end;
        'O': //열림
          begin
            if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=1;
            if PatrolUse then
              IntdoorListView.Items[nIndex].ImageIndex:=1;
          end;
        'E': //에러
          begin
            if doorListView.Items[nIndex].ImageIndex <> 2 then bRefresh := True;
            doorListView.Items[nIndex].ImageIndex:=2;
            if PatrolUse then
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
        doorListView.Refresh;
        if PatrolUse then IntdoorListView.Refresh;
      end;

      //위치 정보 보기의 Map 에 상태 표시
      for i := 0 to LocationMapList.Count - 1 do
      begin
        TfmLocationMap(LocationMapList.Objects[i]).DoorStateChange(aNodeNo,aEcuID,aDoorNo,cDoorMode,cDoorState,cDoorMode2);
      end;
    end;
  end;  }
end;

procedure TfmGroupMonitoring.AlarmDataProcess(aNodeNo, aEcuID, aType,
  aACTION, aData: string);
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
      {   //여기에서 DLL 로 상태전송하자
      nImageIndex := 2;
      case aData[1] of
       'A': begin nImageIndex:= 4; end;
       'D': begin nImageIndex:= 3; end;
       'T': begin nImageIndex:= 6; end;
       'I': begin nImageIndex:= 7; end;
       'P': begin nImageIndex:= 8; end;
      else  begin nImageIndex:= 2; end;
      end;

      AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
      IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
      }
    end;
  end else if aType = 'PT' then  //Alarm 발생 전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end else if aType = 'AL' then  //전체전문
  begin
    DeviceRcvAlarmData(aNodeNo,aData);
  end;

end;

procedure TfmGroupMonitoring.DisConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stECUCode : string;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
  bRefresh : Boolean;
begin
  if TreeView_Device.Items.Count < 1 then Exit;
  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  
  aTreeView := TreeView_Device;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 3 then
  begin
    aNode.ImageIndex:=3;
    bRefresh := True;
  end;
  if aNode.SelectedIndex <> 3 then
  begin
    aNode.SelectedIndex:=3;
    bRefresh := True;
  end;
  aNode.StateIndex:= -1;

  for i:=0 to DeviceCodeList.Count - 1 do
  begin
    stECUCode := DeviceCodeList.Strings[i];
    if copy(stECUCode,1,1) = 'E' then //ECU코드이면
    begin
      //해당노드의 ECU인지 체크해서 해당 ECU이면 이미지 변경
      if copy(stECUCode,2,3) = copy(aNodeNo,2,3) then
      begin
        DisConnectECU(stECUCode);

      end;
    end;
  end;
  if bRefresh then aTreeView.Refresh;

end;

procedure TfmGroupMonitoring.ConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  if DeviceStateList.Strings[nIndex] = 'C' then Exit;
  stCaption := DeviceCaptionList.Strings[nIndex];
  DeviceStateList.Strings[nIndex] := 'C';

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=2;
  aNode.SelectedIndex:=2;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;
end;

procedure TfmGroupMonitoring.DisConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
  bRefresh : Boolean;
begin
  bRefresh := False;
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 5 then
  begin
    aNode.ImageIndex:=5;
    bRefresh := True;
  end;
  if aNode.SelectedIndex <> 5 then
  begin
    aNode.SelectedIndex:=5;
    bRefresh := True;
  end;
  aNode.StateIndex:= -1;
{   //DLL 에 DisConnect 전송
  for i:=0 to DoorCodeList.Count - 1 do
  begin
    stDoorCode := DoorCodeList.Strings[i];
    if copy(stDoorCode,1,5) = copy(aECUID,2,5) then //해당ECU의 도어이면 모두 물음표처리
    begin
      DisConnectDoor(stDoorCode);
    end;
  end;
}
{ //DLL 에 DisConnect 전송
  for i:=0 to AlarmCodeList.Count -1 do
  begin
    stAlarmCode := AlarmCodeList.Strings[i];
    if Copy(stAlarmCode,1,5) = copy(aECUID,2,5) then //해당ECU의 Alam이면 물음표
    begin
      DisConnectAlarm(stAlarmCode);
    end;
  end;
}
  if bRefresh then aTreeView.Refresh;
end;

procedure TfmGroupMonitoring.ConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  stDoorID : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  DeviceLastTimeList.Strings[nIndex] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
  if DeviceStateList.Strings[nIndex] = 'C' then exit;

  stCaption := DeviceCaptionList.Strings[nIndex];
  DeviceStateList.Strings[nIndex] := 'C';
  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;
  aTreeView.Refresh;
end;

procedure TfmGroupMonitoring.ACDataProcess(aNodeNo, aECUID, aData: string);
begin
  RcvCardReadData(aNodeNo,aData);
end;

procedure TfmGroupMonitoring.DEVICEDataProcess(aNodeNo, aECUID,
  aData: string);
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
    ConnectNode('N' + aNodeNo);
    ConnectECU('E' + aNodeNo + aECUID );
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

procedure TfmGroupMonitoring.DeviceRcvAlarmData(aNodeNo,
  aReceiveData: string);
var
  stECUID : string;
  stMsgNo,stTime,stSubClass,stSubAddr,stZoneCode,stMode:string;
  stStatusCode,stStatusName,stPortNo,stState,stOperator : string;
  nResult : integer;
  nIndex : integer;
  stLocate,stAlarmName,stModeStr : string;
  nImageIndex : integer;
  stDeviceType : string;
  i : integer;
  bZoneSensor : Boolean; // 감지 상태 유무
  stPortName : string;
  nAlarmSound : integer;
begin

//  stMCUID := copy(aReceiveData,8,7);
  stECUID := copy(aReceiveData,15,2);
  stMsgNo    := aReceiveData[18];
  stTime     := copy(aReceiveData,20,14);
  stSubClass := copy(aReceiveData,34,2);
  stSubAddr  := copy(aReceiveData,36,2);
  stZoneCode := copy(aReceiveData,38,2);
  stMode     := aReceiveData[40];
  stStatusCode   := copy(aReceiveData,41,2);
  stPortNo   := copy(aReceiveData,43,2);
  stState    := aReceiveData[45];
  stOperator := copy(aReceiveData,46,10);


  stMode:= UpperCase(stMode);
  if (IsDigit(stTime)= False) or
     (IsDigit(stECUID) = False) then    Exit;

  stTime:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
            Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);

   //nResult: 0:정상,1:알람,-1미등록
  nResult:= GetStatusCode(stStatusCode,stStatusName,nAlarmSound);
  if stPortNo <> '**' then    //포트 감지 인경우 무조건 뿌리자.
  begin
    nResult := 1;
    nAlarmSound := 1;
    if stStatusName = '' then stStatusName := stStatusCode;
    stPortName := GetPortName(aNodeNo,stECUID,stPortNo);
    stStatusName := '[' + stPortName + ']' + stStatusName;    //어떤 조건으로 감지 되었는지 표시
  end;

  stDeviceType:=  stSubCLass +'['+ stSubAddr + ']';

  {존 모드별 아이콘 변경}
  nImageIndex := 2;
  case stMode[1] of
   'A': begin nImageIndex:= 4; stModeStr:= '경계모드[A]' end;
   'D': begin nImageIndex:= 3; stModeStr:= '해제모드[D]' end;
   'T': begin nImageIndex:= 6; stModeStr:= '시험모드[T]' end;
   'I': begin nImageIndex:= 7; stModeStr:= '등록모드[I]' end;
   'P': begin nImageIndex:= 8; stModeStr:= '순회모드[P]' end;
  else  begin nImageIndex:= 3; stModeStr:= '미등록모드['+stMode[1]+']' end;
  end;

  if stStatusName = '' then  stStatusName:= stSubCLass + stSubAddr + ' '+ stStatusName;

  stStatusName := stStatusName + '/' + stModeStr;


  nIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(aNodeNo),3) + stECUID );

  if nIndex < 0 then Exit;// 관제 권한이 없음

  if nAlarmSound = 1 then
  begin
    if PTAlarmUse then
    begin
      if Not fmMain.Monitoring then
      begin
        if FileExists(PTAlaramFile) then
        begin
          MediaPlayer1.FileName := PTAlaramFile;
          MediaPlayer1.Open;
          MediaPlayer1.play;
        end;
      end;
    end;
  end;

  stLocate := GetAlarmLocate(FillZeroNumber(strtoint(aNodeNo),3),stECUID,stAlarmName);
//  stLocate := AlarmLocateList.Strings[nIndex]; //경계구역 위치
//  stAlarmName:= AlarmListView.Items[nIndex].Caption; // 경계구역 명

//  AlarmListView.Items[nIndex].SubItems[2]:= stMode;
//  IntAlarmListView.Items[nIndex].SubItems[2]:= stMode;
//  AlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);
//  IntAlarmListView.Items[nIndex].SubItems[3]:= InttoStr(nResult);

//  AlarmListView.Items[nIndex].ImageIndex:= nImageIndex;
//  IntAlarmListView.Items[nIndex].ImageIndex:= nImageIndex;

{  //통신이상은 경계 아이콘에 표시 하지 않는다.
  if stStatusCode <> 'NF' then
  begin
    if nResult = 1 then
    begin
      AlarmListView.Items[nIndex].StateIndex:= 3;
      IntAlarmListView.Items[nIndex].StateIndex:= 3;
    end
    else
    begin
      AlarmListView.Items[nIndex].StateIndex:= -1;
      IntAlarmListView.Items[nIndex].StateIndex:= -1;
    end;
  end;

  //위치 정보 보기의 Map 에 알람 표시
  for i := 0 to LocationMapList.Count - 1 do
  begin
    TfmLocationMap(LocationMapList.Objects[i]).AlaramStateChange(aNodeNo,stECUID,stPortNo,stMode,inttostr(nResult));
  end;
}
  if nResult < 1 then Exit; //정상인 경우 빠져 나감


  if ALARMVIEW = 'REAL' then
  begin
    InsertAlarmList(stTime, //시간
                  stLocate, //위치정보
                  stAlarmName, //경계구역명칭
                  stECUID +'['+stMsgNo+']',  //기기번호[메시지번호]
                  stDeviceType,         //기기타입[번호]
                  stStatusCode + '/' + stPortNo,  //이벤트코드
                  stStatusName,
                  FillZeroNumber(strtoint(aNodeNo),3) + stECUID,
                  nAlarmSound,
                  sg_Alarm);  //이벤트 내용
    end
    else if ALARMVIEW = 'QUERY' then
    begin
      Delay(200);
      SearchAlarmList;
    end;


end;

procedure TfmGroupMonitoring.RcvCardReadData(aNodeNo,
  aReceiveData: string);
var
  stECUID,stDoorNo,stReaderNo : string;
  stPermit,stPermitCode,stLocate : string;
  stDeviceID : string;
  stMosGubun : string;
  stDoorName,stLocationName : string;
  nIndex : integer;
  stTime : string;
  stTemp : string;
  stCardNo : string;
  stUserName,stCompanyName,stJijumName,stDepartName,stEmID : string;
  stHandPhone,stCompanyPhone,stAddr1,stAddr2 : string;
  nCardNoLen : integer;
  bExitButton : Boolean;
  cInputType : char;
  nCardNo : int64;
begin
  if Length(aReceiveData) < 49 then Exit;

  stUserName := '';
  stCompanyName := '';
  stJijumName := '';
  stDepartName := '';
  stEmID := '';
  bExitButton := False;
//  stMCUID :=    Copy(aReceiveData,8,7);
  stECUID :=    Copy(aReceiveData,15,2);
  stDoorNo:=     aReceiveData[21];
  stReaderNo:=   aReceiveData[22];
  cInputType:=   aReceiveData[38];
  stTime:= Copy(aReceiveData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;

  nCardNoLen := strtoint(Copy(aReceiveData,42,2));
  if CARDLENGTHTYPE = 0 then  //고정길이 타입이면
  begin
    stTemp := Copy(aReceiveData,44,8);
    if nSpecialProgram = 3 then  //KTTELECOP 스피드게이트용 3자리만 사용.
    begin
      stCardNo := DecodeCardNo(stTemp,8,True);
      stCardNo := copy(stCardNo,1,6) + '00';
      nCardNo:= Hex2Dec64(stCardNo);
      stCardNo:= FillZeroNumber2(nCardNo,10);
      if stCardNo = '0000000000' then bExitButton := True;
    end else
    begin
      if IsNumericCardNo then
      begin
        stCardNo:= DecodeCardNo(stTemp);
        if stCardNo = '0000000000' then bExitButton := True;
      end
      else
      begin
        stCardNo:= DecodeCardNo(stTemp,8,True);
        if FillZeroNumber(Hex2Dec64(stCardNo),10) = '0000000000' then bExitButton := True;
      end;
    end;
  end else
  begin
    if nCardNoLen = 0 then Exit;
    stCardNo:= Copy(aReceiveData,44,nCardNoLen);
    stTemp := FillZeroNumber(0,nCardNoLen);
    if stCardNo = stTemp then bExitButton := True; //Exit 버튼 눌른것임

    if Not bExitButton then
    begin
      if CARDLENGTHTYPE = 1 then
      begin
        if IsNumericCardNo then stCardNo:= inttostr(Hex2Dec64(stCardNo));
      end else if CARDLENGTHTYPE = 2 then
      begin
        stCardNo := Hex2Ascii(stCardNo);
      end;
    end;
  end;

//  if stCardNo = '0000000000' then Exit;

  if not IsDigit(stTime) then Exit;
  stTime:= Copy(stTime,1,4)+'-'+
          Copy(stTime,5,2)+'-'+
          Copy(stTime,7,2)+' '+
          Copy(stTime,9,2)+':'+
          Copy(stTime,11,2)+':'+
          Copy(stTime,13,2);

  if Not bExitButton then GetUserInfo(stCardNo,stUserName,stCompanyName,stJijumName,stDepartName,stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2);


  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo;
  nIndex := DoorCodeList.IndexOf(stDeviceID);
  if nIndex < 0 then //식수 데이터 이거나 출입관제 권한이 없음
  begin
    Exit;
  end else
  begin
    stMosGubun := 'DOOR';
    stLocationName := GetDoorLocationName(stDeviceID,stDoorName);
  end;
  //카드승인유무체크
  stPermitCode:= aReceiveData[39];
  stPermit := GetPermitState(stPermitCode);

  if ACAlarmUse then
  begin
    if Not Isdigit(stPermitCode) then
    begin
      if FileExists(ACAlaramFile) then
      begin
        MediaPlayer1.FileName := ACAlaramFile;
        MediaPlayer1.Open;
        MediaPlayer1.play;
      end;
    end;
  end;
  if bExitButton then
  begin
    if G_nAccessEventSearch = 1 then Exit;  //카드 이벤트만 조회시 빠져 나감
    case cInputtype of
      'R': begin
           stUserName :=  '원격제어';
           stPermit := '원격제어열림';
           end;
      'P': begin
           stUserName :=  '전화';
           stPermit := '전화제어열림';
           end;
      'B': begin
           stUserName := '퇴실버튼';
           stPermit := '퇴실버튼열림';
           end;
    else stUserName:= cInputType;
    end;
  end;
  InsertDOORList(stPermitCode,stPermit,stTime,stLocationName,stDoorName,stCardNo,stUserName,
  stCompanyName,stJijumName,stDepartName,stEmID,stDeviceID,stHandPhone,stCompanyPhone,stAddr1,stAddr2,sg_Access);

end;

procedure TfmGroupMonitoring.RcvChangeDoorData(aNodeNo,
  aReceiveData: string);
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
{ //DLL 에 상태 전송

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
        if doorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;


  case cDoorState of
    'C': //닫힘
      begin
        if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        stTimeStr:= '20'+ Copy(stTime,1,2)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '장시간 열림');
      end;
    'U'://해정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문열기 실패');
      end;
    'L'://시정이상
      begin
        stTimeStr:= Copy(stTime,1,4)+'-'+Copy(stTime,5,2)+'-'+Copy(stTime,7,2) +' '+
                  Copy(stTime,9,2)+':'+Copy(stTime,11,2)+':'+Copy(stTime,13,2);
        st:= doorListView.Items[nIndex].Caption;
        //Process_ListBox_AlarmEvent(TimeStr,DeviceID+'-'+aMsgNo, st + '문닫기 실패');
      end;
  end;
  if bRefresh then
  begin
    doorListView.Refresh;
    if PatrolUse then IntdoorListView.Refresh;
  end;
  
}
end;

procedure TfmGroupMonitoring.RcvDoorControl(aNodeNo, aReceiveData: string);
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
{ //DLL 에 데이터 전송
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
        if doorListView.Items[nIndex].StateIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 0;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;
  end else
  begin
    Case cDoorMode of
      '0':
      begin
        if doorListView.Items[nIndex].StateIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= 1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= 1;
      end;
      '1':
      begin
        if doorListView.Items[nIndex].StateIndex <> -1 then bRefresh := True;
        doorListView.Items[nIndex].StateIndex:= -1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].StateIndex:= -1;
      end;
    end;

  end;

  case cDoorState of
    'C': //닫힘
      begin
        if doorListView.Items[nIndex].ImageIndex <> 0 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=0;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=0;
      end;
    'O': //열림
      begin
        if doorListView.Items[nIndex].ImageIndex <> 1 then bRefresh := True;
        doorListView.Items[nIndex].ImageIndex:=1;
        if PatrolUse then
          IntdoorListView.Items[nIndex].ImageIndex:=1;
      end;
  end;
  if bRefresh then
  begin
    doorListView.Refresh;
    if PatrolUse then IntdoorListView.Refresh;
  end;
}
end;

function TfmGroupMonitoring.GetStatusCode(aStatusCode: string;
  var aStatusName: string; aAlarmSound: integer): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  Result:= -1;
  aStatusName := '';
  aAlarmSound := 0;

  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND  AL_ALARMSTATUSCODE = ''' + aStatusCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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
      aStatusName := FindField('AL_ALARMNAME').AsString ;
      if FindField('AL_ALARMVIEW').AsInteger > 0 then Result := 1
      else Result := 0;
      if FindField('AL_ALARMSOUND').AsInteger > 0 then aAlarmSound := 1
      else aAlarmSound := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.InsertAlarmList(aTime, aLocateName,
  aAlarmName, aDeviceID, aDeviceType, aStatusCode, aStatusName,
  aAlaramCode: string; aAlarmSound: integer; List: TAdvStringGrid);
begin

  with List do
  begin

    if Cells[AlarmIndexArray[0],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if aAlarmSound > 0 then
    begin
      RowColor[1] := clRed;
    end;
    Cells[AlarmIndexArray[0],1] := aTime;   //발생시간
    Cells[AlarmIndexArray[1],1] := copy(aLocateName,10,length(aLocateName)-9); //위치
    Cells[AlarmIndexArray[2],1] := aAlarmName; //경계구역
    Cells[AlarmIndexArray[3],1] := aDeviceID; //주장치번호
    Cells[AlarmIndexArray[4],1] := aDeviceType; //기기번호
    Cells[AlarmIndexArray[5],1] := aStatusCode; //발생코드
    Cells[AlarmIndexArray[6],1] := aStatusName; //이벤트내용
    Cells[AlarmIndexArray[7],1] := aAlaramCode; //AlarmCode
  end;

end;

function TfmGroupMonitoring.GetUserInfo(aCardNo: string; var stUserName,
  stCompanyName, stJijumName, stDepartName, stEmID,stHandPhone,stCompanyPhone,stAddr1,stAddr2: string): Boolean;
var
  stSql : string;
  nIndex : integer;
  TempAdoQuery :TADOQuery;
begin
  Result := False;
  stUserName := '';
  stCompanyName := '';
  stJijumName := '';
  stDepartName := '';
  stEmID := '';

  stSql := ' select b.EM_NAME,b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.PO_POSICODE,b.EM_CODE,b.EM_COPHONE,b.EM_HANDPHONE,b.EM_ADDR1,b.EM_ADDR2 from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      if Recordcount < 1 then Exit;
      stUserName := FindField('EM_NAME').AsString ;
      nIndex := CompanyCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString);
      if nIndex > -1 then
        stCompanyName := CompanyNameList.Strings[nIndex] ;
      nIndex := JijumCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      if nIndex > -1 then
        stJijumName := JijumNameList.Strings[nIndex] ;
      nIndex := DepartCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      if nIndex > -1 then
        stDepartName := DepartNameList.Strings[nIndex] ;
      stEmID := FindField('EM_CODE').AsString ;
      stHandPhone := FindField('EM_HANDPHONE').AsString ;
      stCompanyPhone := FindField('EM_COPHONE').AsString ;
      stAddr1 := FindField('EM_ADDR1').AsString ;
      stAddr2 := FindField('EM_ADDR2').AsString ;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

  Result := True;
end;

function TfmGroupMonitoring.GetPermitState(aPermit: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := '미등록코드';
  stSql := ' Select * from TB_PERMITCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PE_PERMITCODE = ''' + aPermit + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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

      Result := FindField('PE_PERMITNAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.InsertDOORList(aPermitCode, aPermit, aTime,
  aLocationName, aDoorName, aCardNo, aUserName, aCompanyName, aJijumName,aDepertName,
  aEmID, aDoorID,aHandPhone,aCompanyPhone,aAddr1,aAddr2: string; List: TAdvStringGrid);
var
  nCol: integer;
begin

  with List do
  begin
    if Cells[DoorIndexArray[5],1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    List.SelectedCells[1,1];
    if Not Isdigit(aPermitCode) then
    begin
      RowColor[1] := clFuchsia;
    end;
      Cells[DoorIndexArray[0],1] := aTime;   //발생시간
      Cells[DoorIndexArray[1],1] := copy(aLocationName,10,length(aLocationName)-9); //위치
      Cells[DoorIndexArray[2],1] := aDoorName; //출입문
      Cells[DoorIndexArray[3],1] := aPermitCode; //승인상태 코드
      Cells[DoorIndexArray[4],1] := aPermit; //승인상태
      Cells[DoorIndexArray[5],1] := aCardNo; //카드번호
      Cells[DoorIndexArray[6],1] := aUserName; //이름
      Cells[DoorIndexArray[7],1] := aCompanyName ; //회사명
      Cells[DoorIndexArray[8],1] := aJijumName ; //지점명
      Cells[DoorIndexArray[9],1] := aDepertName ; //부서명
      Cells[DoorIndexArray[10],1] := aEmID; //사번
      Cells[DoorIndexArray[11],1] := aDoorID; //출입문
      Cells[DoorIndexArray[12],1] := aHandPhone; //핸드폰
      Cells[DoorIndexArray[13],1] := aCompanyPhone; //사내전화번호
      Cells[DoorIndexArray[14],1] := aAddr1; //주소1
      Cells[DoorIndexArray[15],1] := aAddr2; //주소2

  end;

end;

procedure TfmGroupMonitoring.sg_AccessHeaderNameSet;
begin
  with sg_Access do
  begin
    cells[0,0] := '발생일자';
    cells[1,0] := '위치';
    cells[2,0] := '출입문';
    cells[3,0] := '승인코드';
    cells[4,0] := '승인상태';
    cells[5,0] := '카드번호';
    cells[6,0] := '출입자명';
    cells[7,0] := FM002;
    cells[8,0] := FM012;
    cells[9,0] := FM101;
  end;

end;

procedure TfmGroupMonitoring.Form_Initialize;
begin
//
end;

procedure TfmGroupMonitoring.GridSetting;
var
  i : integer;
begin
  for i:=0 to sg_Access.ColCount - 1 do
  begin
    DoorIndexArray[i] := i;
    relDoorIndexArray[i] := i;
  end;
  for i:=0 to sg_Alarm.ColCount - 1 do
  begin
    AlarmIndexArray[i] := i;
    relAlarmIndexArray[i] := i;
  end;

end;

procedure TfmGroupMonitoring.LoadCompanyCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CompanyCodeList.Clear;
  CompanyNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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
      First;
      While Not Eof do
      begin
        CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
        CompanyNameList.Add(FindField('CO_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmGroupMonitoring.LoadJijumCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  JijumCodeList.Clear;
  JijumNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE,CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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
      First;
      While Not Eof do
      begin
        JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString );
        JijumNameList.Add(FindField('CO_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmGroupMonitoring.LoadDepartCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  DepartCodeList.Clear;
  DepartNameList.Clear;

  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE,CO_JIJUMCODE,CO_DEPARTCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
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
      First;
      While Not Eof do
      begin
        DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString );
        DepartNameList.Add(FindField('CO_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmGroupMonitoring.GetDoorLocationName(
  aDeviceCode: string;var aDoorName:string): string;
var
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stSql : string;
  stLocationName : string;
  stDoorName : string;
  TempAdoQuery :TADOQuery;
begin
  stLocationName := '';
  stDoorName := '';
  stNodeNo := Copy(aDeviceCode,1,3);
  stEcuID := Copy(aDeviceCode,4,2);
  stDoorNo := Copy(aDeviceCode,6,1);

  stSql := ' select a.DO_DOORNONAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,b.lo_name as BuildingName,c.LO_NAME as FloorName,d.LO_NAME as AreaName  ';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Left Join TB_LOCATION b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = c.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = c.LO_FLOORCODE ';
  stSql := stSql + ' AND c.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = d.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = d.LO_AREACODE ';
  stSql := stSql + ' AND d.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND a.AC_ECUID = ''' + stEcuID + ''' ';
  stSql := stSql + ' AND a.DO_DOORNO = ''' + stDoorNo + ''' ';

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
      if recordCount < 1 then exit;

      stLocationName := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString;
      if Trim(FindField('BuildingName').AsString) <> '' then stLocationName := stLocationName + FindField('BuildingName').AsString;
      if Trim(FindField('FloorName').AsString) <> '' then stLocationName := stLocationName + '-' + FindField('FloorName').AsString;
      if Trim(FindField('AreaName').AsString) <> '' then stLocationName := stLocationName + '-' + FindField('AreaName').AsString;
      stDoorName := FindField('DO_DOORNONAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    result := stLocationName;
    aDoorName := stDoorName;
  End;


end;

procedure TfmGroupMonitoring.mn_LocationMapClick(Sender: TObject);
var
  stLocateID : string;
  stBuildingCode,stFloorCode,stSectorCode:string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  stBuildingCode := copy(stLocateID,1,3);
  stFloorCode := copy(stLocateID,4,3);
  stSectorCode := copy(stLocateID,7,3);
  
  if LocationMapList.IndexOf(stBuildingCode + stFloorCode + stSectorCode ) > -1 then
  begin
    TfmLocationMap(LocationMapList.Objects[LocationMapList.IndexOf(stBuildingCode + stFloorCode + stSectorCode )]).SetFocus;
    Exit;
  end;
  fmLocationMap:= TfmLocationMap.Create(Self);
  fmLocationMap.DeviceNameList := TStringList.Create;
  fmLocationMap.LocationDeviceList := TStringList.Create;
  fmLocationMap.LocationImageList := TStringList.Create;
  fmLocationMap.aBuildingCode := stBuildingCode;
  fmLocationMap.aFloorCode := stFloorCode;
  fmLocationMap.aSectorCode := stSectorCode;
  fmLocationMap.L_stCreateForm := 'TfmGroupMonitoring';
  LocationMapList.AddObject(stBuildingCode + stFloorCode + stSectorCode,fmLocationMap );
  TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).Show;
  TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).LocationMapShow;
  TfmLocationMap(LocationMapList.Objects[LocationMapList.count - 1]).bActive := True;
{  Delay(100);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'STATECHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  if PatrolUse then
  begin
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMCHECK'+ DATADELIMITER + '0000000000000' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;
  end;
}
end;

procedure TfmGroupMonitoring.TreeView_LocationClick(Sender: TObject);
var
  stLocateID : string;
begin
  stLocateID := TreeView_LocationCode.Items.Item[TreeView_Location.Selected.AbsoluteIndex].Text;
  if stLocateID[1] = 'D' then TreeView_Location.PopupMenu:= nil
  else TreeView_Location.PopupMenu:= Popup_Locate;

end;

procedure TfmGroupMonitoring.Menu_DeviceAllCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  if (Application.MessageBox(PChar('전체권한 전송시 현재 기기의 권한이 모두 삭제 됩니다. 전체권한 전송하시겠습니까?'),'전송',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'Y' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  DataModule1.TB_SYSTEMLOGInsert('0','00','0','0',stDeviceID , '권한재전송');
{
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Params.Values['VALUE'] := stDeviceID + 'A';
  self.FindSubForm('Main').FindCommand('CARDDOWNLOAD').Execute;
}
end;

procedure TfmGroupMonitoring.Menu_DeviceCardDownClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CARDDOWNLOAD'+ DATADELIMITER + stDeviceID + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmGroupMonitoring.Menu_DeviceTimeSyncClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'TIMESYNC'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmGroupMonitoring.Menu_DeviceRebootClick(Sender: TObject);
var
  stDeviceID: string;
  stCaption : string;
begin
  stCaption := TreeView_Device.Selected.Text;
  stDeviceID := DeviceCodeList.Strings[ DeviceCaptionList.IndexOf(stCaption)];
  Delete(stDeviceID,1,1);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'REBOOT'+ DATADELIMITER + stDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

function TfmGroupMonitoring.GetAlarmLocate(aNodeNo, aECUID,
  aAlarmName: string): string;
var
  stSql : string;
  stLocationName : string;
  stAlarmName : string;
  TempAdoQuery :TADOQuery;
begin
  stLocationName := '';
  stAlarmName := '';

  stSql := ' select a.AL_ZONENAME,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,b.lo_name as BuildingName,c.LO_NAME as FloorName,d.LO_NAME as AreaName  ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  stSql := stSql + ' Left Join TB_LOCATION b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = b.LO_DONGCODE ';
  stSql := stSql + ' AND b.LO_GUBUN = ''0'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = c.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = c.LO_FLOORCODE ';
  stSql := stSql + ' AND c.LO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_LOCATION d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.LO_DONGCODE = d.LO_DONGCODE ';
  stSql := stSql + ' AND a.LO_FLOORCODE = d.LO_FLOORCODE ';
  stSql := stSql + ' AND a.LO_AREACODE = d.LO_AREACODE ';
  stSql := stSql + ' AND d.LO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';

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
      if recordCount < 1 then exit;

      stLocationName := FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString + FindField('LO_AREACODE').AsString;
      if Trim(FindField('BuildingName').AsString) <> '' then stLocationName := stLocationName + FindField('BuildingName').AsString;
      if Trim(FindField('FloorName').AsString) <> '' then stLocationName := stLocationName + '-' + FindField('FloorName').AsString;
      if Trim(FindField('AreaName').AsString) <> '' then stLocationName := stLocationName + '-' + FindField('AreaName').AsString;
      stAlarmName := FindField('AL_ZONENAME').AsString;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    result := stLocationName;
    aAlarmName := stAlarmName;
  End;

end;

procedure TfmGroupMonitoring.DllSendMessage(aMessage: string);
var
  i : integer;
  DllShowMessage : procedure (aMessage,aTabNo:string);
begin
  if DllHandleArray = nil then Exit;
  for i := LOW(DllHandleArray) to HIGH(DllHandleArray) do
  begin
    if DllHandleArray[i] >= 32 then
    begin
      @DllShowMessage := getProcAddress(DllHandleArray[i],'ShowMessage');
      if @DllShowMessage <> nil then //함수를 잘 가져온 경우
      begin
        DllShowMessage(aMessage,inttostr(i));
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfmGroupMonitoring);
Finalization
  UnRegisterClass(TfmGroupMonitoring);

end.
