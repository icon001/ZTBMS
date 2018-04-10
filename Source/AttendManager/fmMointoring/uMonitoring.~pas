unit uMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, uSubForm, CommandArray, StdCtrls, ImgList,
  ToolPanels, Shader, ActnList, Menus, Grids, BaseGrid, AdvGrid,Clipbrd,
  Buttons,ADODB,ActiveX, AdvObj;

type
  TfmMonitoring = class(TfmASubForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    PageControl1: TPageControl;
    tbDEVICE: TTabSheet;
    PageControl2: TPageControl;
    AttendTab: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
    toolslist: TImageList;
    SocketWatchTimer: TTimer;
    GroupBox7: TGroupBox;
    Shader7: TShader;
    sg_Attend: TAdvStringGrid;
    Panel19: TPanel;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Panel20: TPanel;
    Image1: TImage;
    Label7: TLabel;
    cmb_Company: TComboBox;
    Label8: TLabel;
    cmb_Jijum: TComboBox;
    Label17: TLabel;
    cmb_Depart: TComboBox;
    Label20: TLabel;
    cmb_Posi: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    st_Company: TStaticText;
    st_Jijum: TStaticText;
    st_Depart: TStaticText;
    st_Posi: TStaticText;
    st_EmNo: TStaticText;
    st_Name: TStaticText;
    Label9: TLabel;
    st_InTime: TStaticText;
    st_LeaveTime: TStaticText;
    Label10: TLabel;
    st_BackTime: TStaticText;
    Label11: TLabel;
    st_OutTime: TStaticText;
    Label12: TLabel;
    Label13: TLabel;
    st_Date: TStaticText;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure SocketWatchTimerTimer(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
    procedure Action_ReloadExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure sg_AttendClick(Sender: TObject);
  private
    { Private declarations }
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList : TStringList;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    CompanyCodeList : TStringList; //회사코드를 가지고 있다.
    JijumCodeList : TStringList; //지점코드를 가지고 있다.
    DepartCodeList : TStringList; //부서코드를 가지고 있다.
    PosiCodeList : TStringList; //직위코드를 가지고 있다.

    procedure DisConnectServer;
    procedure ConnectServer;
    procedure DisConnectNode(aNodeNo:string);
    procedure ConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure ConnectECU(aECUID:string);
    procedure RcvCardReadData(aNodeNo,aReceiveData:string); //카드리딩 데이터 처리
    Function GetUserInfo(aCardNo:string; var stUserName,stCompanyName,stDepartName,stEmID:string):Boolean;
    procedure InsertAttendList(aTime,aDeviceName,aState,aCompanyName,aJijumName,
              aDepartName,aPosiName,aEmID,aEmName,aCompanyCode:string;List:TAdvStringGrid);


    procedure ClearEmpInfo;
    procedure DeviceConnectStatus(aReceiveData:string);
    procedure NodeConnectStatus(aReceiveData:string);

    procedure NODEDataProcess(aNodeNo,aTYPE,aACTION,aData:string);
    procedure ECUDataProcess(aNodeNo,aECUID,aTYPE,aACTION,aData:string);
    Function GetCardEmployeeInfo(aPrimary:string;
                           var aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyName,aJijumName,
                           aDepartName,aPosiName,aEmCode,aEmName:string):Boolean;
    Function GetPassEmployeeInfo(aPrimary:string;
                           var aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyName,aJijumName,
                           aDepartName,aPosiName,aEmCode,aEmName:string):Boolean;
    Function GetEcuName(aNodeNo,aEcuID:string):string;

    procedure   DisplayATState(aTime,aDeviceName,aATType,aState,aCompanyName,aJijumName,
                 aDepartName,aPosiName,aEmCode,aEmName,aPrimary,
                 aCompanyCode,aJijumCode,aDepartCode,aPosiCode:string);
  private
    procedure DeviceAllStateCheckReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
    procedure DeviceStateCheckIIIReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string;Sender:Tobject);
  public
    { Public declarations }
  end;

var
  fmMonitoring: TfmMonitoring;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad,
  uLomosUtil, uMDBSql, uMssql, uPostGreSql;
  
{$R *.dfm}




procedure TfmMonitoring.FormCreate(Sender: TObject);
begin

  DeviceCodeList := TStringList.Create;
  DeviceStateList := TStringList.Create;
  DeviceCaptionList := TStringList.Create;
  DeviceLastTimeList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;


  GridInit(sg_Attend,12);
end;

procedure TfmMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;
  DeviceCodeList.Free;
  DeviceStateList.Free;
  DeviceCaptionList.Free;
  DeviceLastTimeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  
  Action := caFree;

end;

procedure TfmMonitoring.Action_DeviceLoadExecute(Sender: TObject);
var
  aTreeView   : TTreeview;
  vTreeView : TTreeview;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stSql : string;
  stParentCode : string;
  stLocationCaption : string;
  nIndex : integer;
  TempAdoQuery :TADOQuery;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  DeviceCodeList.Clear;
  DeviceStateList.Clear;
  DeviceCaptionList.Clear;
  DeviceLastTimeList.Clear;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

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

  //MCU LAN 정보 조회
  stSql := ' Select a.AC_NODENO,a.AC_ECUID,a.AC_MCUIP,a.AC_MCUPORT ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ATTYPE = ''1'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_GUBUN = ''0'' ';
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_ECUID,a.AC_MCUIP,a.AC_MCUPORT ';
  stSql := stSql + ' Order by a.AC_NODENO ';

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

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    First;
    While Not Eof do
    begin
      stLocationCaption := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + ':' + FindField('AC_MCUIP').AsString + ':' + FindField('AC_MCUPORT').AsString;
      DeviceCodeList.Add('N' + FillZeroNumber(FindField('AC_NODENO').AsInteger,3));
      DeviceStateList.Add('D');
      DeviceCaptionList.Add(stLocationCaption);
      DeviceLastTimeList.Add(FormatDateTime('yyyy-mm-dd HH:MM:SS',Now));   //LAN의 접속시간 체크하자...
      bNode:= aTreeView.Items.AddChild(aNode,stLocationCaption);
      bNode.ImageIndex:=3;
      bNode.SelectedIndex:=3;
      bNode.StateIndex:= -1;

      Next;
    end;
    aNode.Expanded := True;
  end;

  //ECU정보 로딩
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_DEVICENAME';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_ATTYPE = ''1'' ';
  stSql := stSql + ' Group by a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_DEVICENAME ';
  stSql := stSql + ' Order by a.AC_NODENO ';

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

    First;
    While Not Eof do
    begin
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
        bNode.Expanded := True;
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMonitoring.SocketWatchTimerTimer(Sender: TObject);
var
  i : integer;
  dtLastTime : TDatetime;
  dtTimeOut : TDatetime;
  stNodeNo : string;
begin
// 소켓의 마지막 접속시간을 계산하자.
  for i:= 1 to DeviceLastTimeList.Count - 1 do
  begin
    dtLastTime := strToDateTime(DeviceLastTimeList.Strings[i]);
    dtTimeOut:= IncTime(dtLastTime,0,0,15,0);
    if Now > dtTimeOut then
    begin
      // 여기에서 해당 노드의 이미지를 변경해 주자.
      stNodeNo := DeviceCodeList.Strings[i];
      if (stNodeNo[1] = 'N') then
        DisConnectNode(stNodeNo);
    end;
  end;

end;

procedure TfmMonitoring.DisConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stECUCode : string;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aNodeNo);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  
  aTreeView := TreeView_Device;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 3 then aNode.ImageIndex:=3;
  if aNode.SelectedIndex <> 3 then  aNode.SelectedIndex:=3;
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

end;

procedure TfmMonitoring.ConnectNode(aNodeNo: string);
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
  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode = Nil then Exit;
  aNode.ImageIndex:=2;
  aNode.SelectedIndex:=2;
  aNode.StateIndex:= -1;

end;


procedure TfmMonitoring.ConnectECU(aECUID: string);
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
  aNode:= GetNodeByText(aTreeView,stCaption,True);
  if aNode = Nil then Exit;
  if aNode.ImageIndex <> 4 then aNode.ImageIndex:=4;
  if aNode.SelectedIndex <> 4 then aNode.SelectedIndex:=4;
  aNode.StateIndex:= -1;

end;

procedure TfmMonitoring.DisConnectECU(aECUID: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stDoorCode : string;
  stAlarmCode : string;
  nIndex : integer;
begin
  nIndex := DeviceCodeList.IndexOf(aECUID);
  if nIndex < 0 then Exit;
  if DeviceStateList.Strings[nIndex] = 'D' then exit;
  DeviceStateList.Strings[nIndex] := 'D';
  stCaption := DeviceCaptionList.Strings[nIndex];

  aTreeView := TreeView_Device;

  aNode:= GetNodeByText(aTreeView,stCaption,False);
  if aNode.ImageIndex <> 5 then aNode.ImageIndex:=5;
  if aNode.SelectedIndex <> 5 then aNode.SelectedIndex:=5;
  aNode.StateIndex:= -1;

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
  stTYPE : string;
  stACTION:string;
  nLength : integer;
  stData : string;
  stDevice : string;
begin
//'R'  //기기 수신'R' 송신 'S'
//'E'  //SERVER 'S',ECU 'E',Door 'D',Reader 'R'
//000  //NodeNo
//00   //ECUID
//00    //DoorNo
//00    //ReaderNo
//'AT' //타입 출입'AC',식수 'FD',서버 'SR',기기 'DV'
//'C'  //카드 'C' 버튼 'B',  'R' 서버 재시작
//000   //Length
//DATA

  stReceiveData := Params.Values['Data'];
{  if Pos('CONNECTED',UpperCase(stReceiveData)) = 0 then
  begin
    stReceiveData := stReceiveData;
  end;}
  stDevice := stReceiveData[2];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  stDoorNo := copy(stReceiveData,8,2);
  stReaderNo := copy(stReceiveData,10,2);
  stTYPE := copy(stReceiveData,12,2);
  stACTION := copy(stReceiveData,14,1);
  nLength := strtoint(copy(stReceiveData,15,3));
  stData := copy(stReceiveData,18,nLength);

  if stDevice = 'S' then     //서버에서 주는 데이터 처리
  begin
    if stACTION = 'S' then
    begin
      DeviceAllStateCheckReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stTYPE,stACTION,stData);
    end else if stACTION = 'N' then
    begin
      DeviceStateCheckIIIReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stTYPE,stACTION,stData,self);
    end;
  end else if stDevice = 'N' then //노드 데이터 처리
  begin
    NODEDataProcess(stNodeNo,stTYPE,stACTION,stData);
  end else if stDevice = 'E' then //기기 데이터 처리
  begin
    ECUDataProcess(stNodeNo,stECUID,stTYPE,stACTION,stData);
  end else if stDevice = 'D' then //출입문 데이터 처리
  begin
  end else if stDevice = 'R' then //리더 데이터 처리
  begin
  end;
{
  if copy(stReceiveData,1,7) = 'RESTART' then
  begin
    Action_ReloadExecute(Self);
    Exit;
  end;
  if stReceiveData[1] = 'C' then
  begin
    if stReceiveData[2] = 'N' then
      NodeConnectStatus(stReceiveData)
    else
      DeviceConnectStatus(stReceiveData);
    Exit;
  end;
  if Length(stReceiveData) < 17 then Exit;
  stNodeNo := copy(stReceiveData,1,3);
  Delete(stReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;

  aCommand:= stReceiveData[17];

//  stMCUID:=    Copy(stReceiveData,8,7);
  stECUID:=    Copy(stReceiveData,15,2);


  if Pos('COMM ERROR',stReceiveData) > 0 then
    DisConnectECU('E' + stNodeNo + stECUID )
  else if Pos('UNUSED',stReceiveData) > 0 then DisConnectECU('E' + stNodeNo + stECUID )
  else if aCommand <> 'A' then
  begin
    ConnectNode('N' + stNodeNo);
    ConnectECU('E' + stNodeNo + stECUID );
  end;
}
  // 여기에서 화면에 디스플레이 해 주자... 전문을 분석해서...^^   {TO DO }
{
  case aCommand of
    'c': begin      //카드데이터 처리
           //Connected:= True;
           MSG_Code:= stReceiveData[19];
           case MSG_Code of
             'E' ://카드 데이터(출입) 처리
                begin
                   RcvCardReadData(stNodeNo,stReceiveData);
                end;
             'D' ://문 상태 변경 처리
                begin
                  //RcvChangeDoorData(stNodeNo,stReceiveData);
                end;
             'c' ://문제어 응답
                begin
                  //RcvDoorControl(stNodeNo,stReceiveData);
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
  end; }
end;



procedure TfmMonitoring.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmMonitoring.RcvCardReadData(aNodeNo, aReceiveData: string);
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
  stUserName,stCompanyName,stDepartName,stEmID : string;
begin
  if Length(aReceiveData) < 49 then Exit;

//  stMCUID :=    Copy(aReceiveData,8,7);
  stECUID :=    Copy(aReceiveData,15,2);
  stDoorNo:=     aReceiveData[21];
  stReaderNo:=   aReceiveData[22];
  stTime:= Copy(aReceiveData,24,12);
  stTime:= copy(FormatDateTime('yyyymmdd',Now),1,2) + stTime;

  stTemp := Copy(aReceiveData,44,8);
  stCardNo:= DecodeCardNo(stTemp);
  
  if stCardNo = '0000000000' then Exit;
  GetUserInfo(stCardNo,stUserName,stCompanyName,stDepartName,stEmID);

  if not IsDigit(stTime) then Exit;
  stTime:= Copy(stTime,1,4)+'-'+
          Copy(stTime,5,2)+'-'+
          Copy(stTime,7,2)+' '+
          Copy(stTime,9,2)+':'+
          Copy(stTime,11,2)+':'+
          Copy(stTime,13,2);

  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + stECUID + stDoorNo;


end;

function TfmMonitoring.GetUserInfo(aCardNo: string; var stUserName,
  stCompanyName, stDepartName, stEmID: string): Boolean;
var
  stSql : string;
  nIndex : integer;
begin
  Result := False;
  stUserName := '';
  stCompanyName := '';
  stDepartName := '';
  stEmID := '';

  stSql := ' select b.EM_NAME,b.CO_COMPANYCODE,b.CO_DEPARTCODE,b.PO_POSICODE,b.EM_CODE from TB_CARD a ';
  stSql := stSql + ' Left Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aCardNo + ''' ';

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

    if Recordcount < 1 then Exit;
    stUserName := FindField('EM_NAME').AsString ;
    nIndex := CompanyCodeList.IndexOf(FindField('CO_COMPANYCODE').AsString);
    stEmID := FindField('EM_CODE').AsString ;
  end;

  Result := True;
end;


procedure TfmMonitoring.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
begin
  Action_ReloadExecute(Self);
end;

procedure TfmMonitoring.Action_ReloadExecute(Sender: TObject);
begin
  Action_DeviceLoadExecute(Self);
end;

procedure TfmMonitoring.ClearEmpInfo;
begin
  Image1.Picture.Graphic := nil;
  st_Company.Caption := '';
  st_Jijum.Caption := '';
  st_Depart.Caption := '';
  st_Posi.Caption := '';
  st_EmNo.Caption := '';
  st_Name.Caption := '';
  st_Date.Caption := '';
  st_InTime.Caption := '';
  st_LeaveTime.Caption := '';
  st_BackTime.Caption := '';
  st_OutTime.Caption := '';
end;


procedure TfmMonitoring.FormShow(Sender: TObject);
begin
  Action_DeviceLoadExecute(Self);

  self.FindSubForm('Main').FindCommand('MONITOR').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('MONITOR').Execute;


end;


procedure TfmMonitoring.DeviceConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
  stECUID : string;
  stDoorNo : string;

begin
  Delete(aReceiveData,1,1); //처음 맨 앞자리는 R OR C
  stNodeNo := copy(aReceiveData,1,3);
  Delete(aReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;

//  stMCUID:=    Copy(aReceiveData,1,7);
  stECUID:=    Copy(aReceiveData,8,2);

  if Pos('DisConnected',aReceiveData) > -1 then
  begin
    if stECUID = '00' then DisConnectNode('N' + stNodeNo)
    else DisConnectECU('E' + stNodeNo + stECUID );
  end else
  begin
    if stECUID = '00' then ConnectNode('N' + stNodeNo)
    else ConnectECU('E' + stNodeNo + stECUID );
  end;

end;

procedure TfmMonitoring.NodeConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
begin
  Delete(aReceiveData,1,2); //처음 맨 앞자리는 CN
  stNodeNo := copy(aReceiveData,1,3);
  if Not Isdigit(stNodeNo) then Exit;

  if Pos('DISCONNECTED',UpperCase(aReceiveData)) > -1 then
  begin
    DisConnectNode('N' + stNodeNo);
  end else
  begin
    ConnectNode('N' + stNodeNo);
  end;

end;

procedure TfmMonitoring.ConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
begin
  aTreeView := TreeView_Device;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> 0 then
  begin
    aNode.ImageIndex:=0;
    aNode.StateIndex:=0;
    aNode.SelectedIndex := 0;
  end;

end;

procedure TfmMonitoring.DisConnectServer;
var
  aTreeView   : TTreeview;
  aNode   : TTreeNode;
  i : integer;
begin
  aTreeView := TreeView_Device;
  aNode := aTreeView.Items[0];
  if aNode.ImageIndex <> 14 then
  begin
    aNode.ImageIndex:=14;
    aNode.SelectedIndex := 14;
    aNode.StateIndex:=-1;
    //여기에서 모든 노드 DisConnect 로 표시하자.
    for i :=0 to DeviceCodeList.Count - 1 do
    begin
      if copy(DeviceCodeList.Strings[i],1,1) = 'N' then
      begin
        DisConnectNode(DeviceCodeList.Strings[i]);
      end;
    end;
  end;
  aTreeView.Refresh;

end;


procedure TfmMonitoring.InsertAttendList(aTime, aDeviceName, aState,
  aCompanyName, aJijumName, aDepartName, aPosiName, aEmID, aEmName,
  aCompanyCode: string; List: TAdvStringGrid);
begin

  with List do
  begin
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if List.RowCount >= MAX_LISTCOUNT then
    begin
      List.RemoveRows(List.RowCount-1,1);
    end;
    Cells[0,1] := aTime;   //발생시간
    Cells[1,1] := aDeviceName; //기기명칭
    Cells[2,1] := aState; //상태
    Cells[3,1] := aCompanyName; //회사명
    Cells[4,1] := aJijumName; //지점명
    Cells[5,1] := aDepartName; //부서명
    Cells[6,1] := aPosiName; //직위명
    Cells[7,1] := aEmID ; //사번
    Cells[8,1] := aEmName ; //이름
    Cells[9,1] := aCompanyCode; //회사코드
{    if Not Isdigit(aPermitCode) then
    begin
      RowColor[1] := clFuchsia;
    end; }
  end;

end;

procedure TfmMonitoring.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadPosiCode('',PosiCodeList,cmb_Posi);
  
  cmb_Company.ItemIndex := 0;
  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmMonitoring.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmMonitoring.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmMonitoring.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
var
  stValue : string;
  stCmd : string;
  stID : string;
begin
//STATE
  stCmd := Params.Values['COMMAND'];
  stValue := Params.Values['VALUE'];
  stID := Params.Values['ID'];

  if UpperCase(stCmd) = 'SERVER' then
  begin
    if pos('DISCONNECTED',upperCase(stValue)) > 0 then
    begin
      DisConnectServer;
    end else if pos('CONNECTED',upperCase(stValue)) > 0 then
    begin
      ConnectServer;
    end;
  end;
end;

procedure TfmMonitoring.ECUDataProcess(aNodeNo, aECUID, aTYPE, aACTION,
  aData: string);
var
  stTime : string;
  stDeviceName : string;
  stState:string;
  stCompanyCode,stJijumCode,stDepartCode,stPosiCode:string;
  stCompanyName,stJijumName,stDepartName,stPosiName:string;
  stEmCode,stEmName:string;
  stPrimary:string;
  stCardNo : string;
  stATType : string;
  stAtOutGubun : string; // 0: 출근/퇴근,1:외출/복귀
  stAttendType : string; // 1: 출근/외출,2:퇴근/복귀
begin
  if aTYPE = 'AT' then
  begin
    stTime := copy(aData,1,14);
    stATType := aData[15];
    stPrimary := copy(aData,16,Length(aData) - 15);
    stCardNo := FindCharCopy(stPrimary,0,';');
    stAtOutGubun := FindCharCopy(stPrimary,1,';');
    stAttendType := FindCharCopy(stPrimary,2,';');
    stDeviceName := GetEcuName(aNodeNo,aEcuID);
    if stATType = INBUTTON then stATType := '출근'
    else if stATType = OUTBUTTON then stATType := '퇴근'
    else if stATType = LEAVEBUTTON then stATType := '외근'
    else if stATType = BACKBUTTON then stATType := '복귀';
    if stAtOutGubun <> '' then
    begin
      if stAtOutGubun = '0' then
      begin
        if stAttendType = '1' then stATType := '출근'
        else if stAttendType = '2' then stATType := '퇴근';
      end else if stAtOutGubun = '1' then
      begin
        if stAttendType = '1' then stATType := '외근'
        else if stAttendType = '2' then stATType := '복귀';
      end;
    end;

    if aACTION  = 'C' then
    begin
      stState := '카드';
      if Not GetCardEmployeeInfo(stCardNo,
                             stCompanyCode,stJijumCode,stDepartCode,stPosiCode,
                             stCompanyName,stJijumName,
                             stDepartName,stPosiName,stEmCode,stEmName) then
      begin
        stState := '미등록카드';
      end;
    end else if aACTION = 'B' then
    begin
      stState := '버튼';
      if Not GetPassEmployeeInfo(stCardNo,
                             stCompanyCode,stJijumCode,stDepartCode,stPosiCode,
                             stCompanyName,stJijumName,
                             stDepartName,stPosiName,stEmCode,stEmName) then
      begin
        stState := '미등록번호';
      end;
    end else
    begin
      stState := '미등록';
    end;
    DisplayATState(stTime,stDeviceName,stATType,stState,stCompanyName,stJijumName,
                   stDepartName,stPosiName,stEmCode,stEmName,stCardNo,
                   stCompanyCode,stJijumCode,stDepartCode,stPosiCode);
  end else if aTYPE = 'DV' then  //Device상태
  begin
    if UpperCase(aData) = 'DISCONNECTED' then
    begin
      DisConnectECU('E' + aNodeNo + aECUID );
    end else if UpperCase(aData) = 'CONNECTED' then
    begin
      ConnectECU('E' + aNodeNo + aECUID);
    end;
  end;

end;

function TfmMonitoring.GetCardEmployeeInfo(aPrimary: string;
  var aCompanyCode,aJijumCode,aDepartCode,aPosiCode, aCompanyName, aJijumName, aDepartName, aPosiName,
  aEmCode, aEmName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aCompanyCode:='';
  aJijumCode:='';
  aDepartCode:='';
  aPosiCode:='';
  aCompanyName:='';
  aJijumName:='';
  aDepartName:='';
  aPosiName:='';
  aEmCode:='';
  aEmName:='';

  Result := False;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if DBTYPE = 'MSSQL' then stSql := MSSql.SelectTB_CARDJoinTBEmployee
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else Exit;
  stSql := stSql + ' AND a.CA_CARDNO = ''' + aPrimary + ''' ';


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
    if recordCount > 0 then
    begin
      result := True;
      aCompanyCode:=FindField('CO_COMPANYCODE').AsString;
      aJijumCode:=FindField('CO_JIJUMCODE').AsString;
      aDepartCode:=FindField('CO_DEPARTCODE').AsString;
      aPosiCode:=FindField('PO_POSICODE').AsString;
      aCompanyName:=FindField('COMPANYNAME').AsString;
      aJijumName:=FindField('JIJUMNAME').AsString;
      aDepartName:=FindField('DEPARTNAME').AsString;
      aPosiName:=FindField('PO_NAME').AsString;
      aEmCode:=FindField('EM_CODE').AsString;
      aEmName:=FindField('EM_NAME').AsString;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMonitoring.GetEcuName(aNodeNo, aEcuID: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := '';
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

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
    if recordCount > 0 then
    begin
      result := FindField('AC_DEVICENAME').AsString;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmMonitoring.GetPassEmployeeInfo(aPrimary: string;
  var aCompanyCode,aJijumCode,aDepartCode,aPosiCode, aCompanyName, aJijumName, aDepartName, aPosiName,
  aEmCode, aEmName: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aCompanyCode:='';
  aJijumCode:='';
  aDepartCode:='';
  aPosiCode:='';
  aCompanyName:='';
  aJijumName:='';
  aDepartName:='';
  aPosiName:='';
  aEmCode:='';
  aEmName:='';

  Result := False;
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEJoinBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEJoinBase
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEJoinBase
  else Exit;
  {
  stSql := 'select b.CO_COMPANYCODE,c.CO_NAME as COMPANYNAME,';
  stSql := stSql + ' b.CO_JIJUMCODE,d.CO_NAME as JIJUMNAME,';
  stSql := stSql + ' b.CO_DEPARTCODE,e.CO_NAME as DEPARTNAME,';
  stSql := stSql + ' b.PO_POSICODE,f.PO_NAME,';
  stSql := stSql + ' b.EM_CODE,b.EM_NAME ';
  stSql := stSql + ' From TB_EMPLOYEE b ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON(b.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Left Join TB_POSI f ';
  stSql := stSql + ' ON(b.GROUP_CODE = f.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = f.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.PO_POSICODE = f.PO_POSICODE ) ';
  stSql := stSql + ' Where b.GROUP_CODE = ''' + GROUPCODE + ''' '; }
  stSql := stSql + ' AND a.EM_PASS = ''' + aPrimary + ''' ';

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
    if recordCount > 0 then
    begin
      result := True;
      aCompanyCode:=FindField('CO_COMPANYCODE').AsString;
      aJijumCode:=FindField('CO_JIJUMCODE').AsString;
      aDepartCode:=FindField('CO_DEPARTCODE').AsString;
      aPosiCode:=FindField('PO_POSICODE').AsString;
      aCompanyName:=FindField('COMPANYNAME').AsString;
      aJijumName:=FindField('JIJUMNAME').AsString;
      aDepartName:=FindField('DEPARTNAME').AsString;
      aPosiName:=FindField('PO_NAME').AsString;
      aEmCode:=FindField('EM_CODE').AsString;
      aEmName:=FindField('EM_NAME').AsString;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMonitoring.DisplayATState(aTime, aDeviceName,aATType, aState,
  aCompanyName, aJijumName, aDepartName, aPosiName, aEmCode, aEmName,
  aPrimary, aCompanyCode, aJijumCode, aDepartCode, aPosiCode: string);
var
  nIndex : integer;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
begin
  if cmb_Company.ItemIndex = 0 then
  begin
    nIndex := CompanyCodeList.IndexOf(aCompanyCode);
    if (Not IsMaster) and (strtoint(CompanyGrade) > 0) then
      if nIndex < 0 then Exit;
  end else
  begin
    if CompanyCodeList.Strings[cmb_Company.ItemIndex] <> aCompanyCode then Exit; //해당 회사 코드가 아니면.
    if cmb_Jijum.ItemIndex = 0 then
    begin
      if (Not IsMaster) and (strtoint(CompanyGrade) > 1) then
      begin
        nIndex := JijumCodeList.IndexOf(aCompanyCode + aJijumCode );
        if nIndex < 0 then Exit;
      end;
    end else
    begin
      if copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) <> aCompanyCode then Exit; //해당 회사 코드가 아니면.
      if copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) <> aJijumCode then Exit; //해당 지점 코드가 아니면.

      if cmb_Depart.ItemIndex = 0 then
      begin
        if (Not IsMaster) and (strtoint(CompanyGrade) > 2) then
        begin
          nIndex := DepartCodeList.IndexOf(aCompanyCode + aJijumCode + aDepartCode);
          if nIndex < 0 then Exit;
        end;
      end else
      begin
        if copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) <> aCompanyCode then Exit; //해당 회사 코드가 아니면.
        if copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) <> aJijumCode then Exit; //해당 지점 코드가 아니면.
        if copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) <> aDepartCode then Exit; //해당 지점 코드가 아니면.
      end;
    end;
  end;


  with sg_Attend do
  begin
    if Cells[0,1] <> '' then InsertRows(1,1);
    Cells[0,1] := aTime;
    Cells[1,1] := aDeviceName;
    Cells[2,1] := aATType;
    Cells[3,1] := aCompanyName;
    Cells[4,1] := aJijumName;
    Cells[5,1] := aDepartName;
    Cells[6,1] := aPosiName;
    Cells[7,1] := aEmCode;
    Cells[8,1] := aEmName;
    Cells[9,1] := aState;
    Cells[10,1] := aPrimary;
    Cells[11,1] := aCompanyCode;
    Row:=1;
  end;
  sg_AttendClick(sg_Attend);

end;

procedure TfmMonitoring.NODEDataProcess(aNodeNo, aTYPE, aACTION,
  aData: string);
begin
  if aTYPE = 'DV' then  //Device상태
  begin
    if UpperCase(aData) = 'DISCONNECTED' then
    begin
      DisConnectNode('N' + aNodeNo);
    end else if UpperCase(aData) = 'CONNECTED' then
    begin
      ConnectNode('N' + aNodeNo);
    end;
  end;

end;

procedure TfmMonitoring.sg_AttendClick(Sender: TObject);
var
  stSql : string;
  stCompanyCode : string;
  stEmCode : string;
  stDate : string;
  TempAdoQuery : TADOQuery;
begin
  if sg_Attend.Row < sg_Attend.FixedRows then Exit;
  ClearEmpInfo;
  stCompanyCode := sg_Attend.Cells[11,sg_Attend.Row];
  stEmCode := sg_Attend.Cells[7,sg_Attend.Row];
  stDate := copy(sg_Attend.Cells[0,sg_Attend.Row],1,8);
  if stCompanyCode = '' then Exit;
  if stEmCode = '' then Exit;

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  if DBTYPE = 'MDB' then stSql := MDBSQL.SelectTB_EMPLOYEEJoinATEVENTDay(stDate,stCompanyCode,stEmCode)
  else if DBTYPE = 'PG' then stSql :=  PostGreSql.SelectTB_EMPLOYEEJoinATEVENTDay(stDate,stCompanyCode,stEmCode)
  else if DBTYPE = 'MSSQL' then stSql :=  MSSQL.SelectTB_EMPLOYEEJoinATEVENTDay(stDate,stCompanyCode,stEmCode)
  else Exit;


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
    First;
    if Not FindField('EM_IMAGE').IsNull then begin
      if DBType = 'MSSQL' then
      begin
        JPEGLoadFromDB(FieldByName('EM_IMAGE'), Image1);
      end else begin
        if FileExists(FindField('EM_IMAGE').AsString) then
          Image1.Picture.LoadFromFile(FindField('EM_IMAGE').AsString);
      end;
    end;
    st_Company.Caption := FindField('CO_COMPANYNAME').AsString;
    st_Jijum.Caption := FindField('CO_JIJUMNAME').AsString;
    st_Depart.Caption := FindField('CO_DEPARTNAME').AsString;
    st_Posi.Caption := FindField('PO_NAME').AsString;
    st_EmNo.Caption := FindField('EM_CODE').AsString;
    st_Name.Caption := FindField('EM_NAME').AsString;
    st_Date.Caption := copy(stDate,1,4) + '-' + copy(stDate,5,2) + '-' + copy(stDate,7,2);
    st_InTime.Caption := FindField('AT_INTIME').AsString;
    st_LeaveTime.Caption := FindField('AT_LEAVETIME').AsString;
    st_BackTime.Caption := FindField('AT_BACKTIME').AsString;
    st_OutTime.Caption := FindField('AT_OUTTIME').AsString;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmMonitoring.DeviceAllStateCheckReceive(aNodeNo, aEcuID,
  aDoorNo, aReaderNo, aDataType, aControlType, aDeviceData: string);
var
  stNodeNo : string;
begin
  if aControlType <> 'S' then Exit;
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),3);

  case aDeviceData[1] of  //DeviceConnected State
    'C' : begin
            if aEcuID = '00' then
            begin
              ConnectNode('N' + stNodeNo);
              ConnectECU('E' + stNodeNo + aEcuID);
            end else
            begin
              ConnectECU('E' + stNodeNo + aEcuID);
            end;
          end;
    'D' : begin
            if aEcuID = '00' then
            begin
              DisConnectNode('N' + stNodeNo);
              DisConnectECU('E' + stNodeNo + aEcuID);
            end else
            begin
              DisConnectECU('E' + stNodeNo + aEcuID);
            end;
          end;
    else begin
            if aEcuID = '00' then
            begin
              DisConnectNode('N' + stNodeNo);
            end else
            begin
              DisConnectECU('E' + stNodeNo + aEcuID);
            end;
         end;
  end;

end;

procedure TfmMonitoring.DeviceStateCheckIIIReceive(aNodeNo, aEcuID,
  aDoorNo, aReaderNo, aDataType, aControlType, aDeviceData: string;
  Sender: Tobject);
var
  i : integer;
  nPacketSize : integer;
  stEcuPacket : string;
  stNodeNo : string;
  stEcuID : string;
  stDeviceConnect : string;
begin
  if aControlType <> 'N' then Exit;

  stNodeNo := FillZeroNumber(strtoint(aNodeNo),3);
  nPacketSize := BINARYPACKETSIZE div 8; //8비트가 한패킷
  for i := 0 to MAXECUCOUNT do
  begin
    stEcuPacket := copy(aDeviceData,(i * nPacketSize) + 1,nPacketSize);
    stEcuPacket := Ascii2Hex(stEcuPacket);
    stEcuPacket := HexToBinary(stEcuPacket);
    stEcuID := FillZeroNumber(i,2);
    stDeviceConnect := copy(stEcuPacket,1,2);
    if stDeviceConnect = '01' then
    begin
      if stEcuID = '00' then
      begin
        ConnectNode('N' + stNodeNo);
        ConnectECU('E' + stNodeNo + stEcuID);
      end else
      begin
        ConnectECU('E' + stNodeNo + stEcuID);
      end;
    end else
    begin
      if stEcuID = '00' then
      begin
        DisConnectNode('N' + stNodeNo);
      end else
      begin
        DisConnectECU('E' + stNodeNo + stEcuID);
      end;
    end;
  end;
end;

initialization
  RegisterClass(TfmMonitoring);
Finalization
  UnRegisterClass(TfmMonitoring);

end.
