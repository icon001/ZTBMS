unit uFoodState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, Grids, BaseGrid, AdvGrid, StdCtrls, uSubForm,
  CommandArray, RzButton, DB, ADODB, LMDCustomComponent, LMDWaveComp,
  Shader, ComCtrls, ImgList,ActiveX, AdvObj;

const
 MAX_LISTCOUNT = 100; //리스트 출력 count

type
  TfmFoodState = class(TfmASubForm)
    Panel1: TPanel;
    btn_Connectstat: TSpeedButton;
    StaticText1: TStaticText;
    ConnectImage: TImage;
    DisconnectImage: TImage;
    btn_close: TRzBitBtn;
    ADOTemp: TADOQuery;
    ServerConTimer: TTimer;
    wave_NonPay: TLMDWaveComp;
    Wave_Alarm: TLMDWaveComp;
    Panel2: TPanel;
    sg_Food: TAdvStringGrid;
    PageControl1: TPageControl;
    tbDEVICE: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
    Splitter1: TSplitter;
    toolslist: TImageList;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_closeClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCommand2Execute(Command: TCommand;
      Params: TStringList);
    procedure FormCreate(Sender: TObject);
    procedure CommandArrayCommandsTCommand3Execute(Command: TCommand;
      Params: TStringList);
    procedure sg_FoodDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure ServerConTimerTimer(Sender: TObject);
    procedure Action_DeviceLoadExecute(Sender: TObject);
    procedure CommandArrayCommandsTCommand4Execute(Command: TCommand;
      Params: TStringList);
  private
    DeviceCodeList : TStringList; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
    DeviceStateList : TStringList;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
    DeviceCaptionList : TStringList; //기기명을 가지고 있다.
    DeviceLastTimeList : TStringList; //마지막 접속시간을 가지고 있다.
    { Private declarations }
    procedure InsertFoodList(stFoodData:string);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer);

  private
    procedure ConnectServer;
    procedure DisConnectServer;
    procedure ConnectNode(aNodeNo:string);
    procedure ConnectECU(aECUID:string);
    procedure DisConnectNode(aNodeNo:string);
    procedure DisConnectECU(aECUID:string);
    procedure DeviceConnectStatus(aReceiveData:string);
    procedure NodeConnectStatus(aReceiveData:string);

  public
    { Public declarations }
  end;

var
  fmFoodState: TfmFoodState;

implementation
uses
  uDataModule1,
  uLomosUtil, uMDBSql, uPostGreSql, uMssql;

{$R *.dfm}

procedure TfmFoodState.FormShow(Sender: TObject);
begin

  btn_Connectstat.Caption := '[DISCONNECT]';
  ServerConTimer.Enabled := True;
  Action_DeviceLoadExecute(Self);
  btn_Connectstat.Glyph := DisConnectImage.Picture.Bitmap;
  self.FindSubForm('Main').FindCommand('PORTCONNECT').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('PORTCONNECT').Execute;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'fmFoodState';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmFoodState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMCLOSE').Params.Values['VALUE'] := 'fmFoodState';
  self.FindSubForm('Main').FindCommand('FORMCLOSE').Execute;

  ServerConTimer.Enabled := False;
  ServerConTimer.Free;
  
  DeviceCodeList.Free; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
  DeviceStateList.Free;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
  DeviceCaptionList.Free; //기기명을 가지고 있다.
  DeviceLastTimeList.Free; //마지막 접속시간을 가지고 있다.


  Action := caFree;

end;

procedure TfmFoodState.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFoodState.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  btn_Connectstat.Caption := '[CONNECT]';
  btn_Connectstat.Glyph := ConnectImage.Picture.Bitmap;
  ServerConTimer.Enabled := False;
  ConnectServer;
end;

procedure TfmFoodState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  btn_Connectstat.Caption := '[DISCONNECT]';
  btn_Connectstat.Glyph := DisConnectImage.Picture.Bitmap;
  ServerConTimer.Enabled := True;
  DisConnectServer;
end;

procedure TfmFoodState.CommandArrayCommandsTCommand2Execute(
  Command: TCommand; Params: TStringList);
var
  stRecvData : string;
begin
  stRecvData := Params.Values['VALUE'];
  case stRecvData[1] of
  'F':
    begin
      InsertFoodList(stRecvData);
    end;
  'P':
    begin
    end;
  end;
end;

procedure TfmFoodState.InsertFoodList(stFoodData: string);
var
  stTime,stDevice,stReaderNo,stCardNo : string;
  stCompanyName,stJijumName,stDepartName,stEM_CODE,stUserName:string;
  stPermitName,stNonPay:string;
  stCompanyCode,stJijumCode,stDepartCode,stPermitCode,stNonPayCode:string;
  stSql : string;
begin
  stTime := FindCharCopy(stFoodData,1,';');
  stDevice := FindCharCopy(stFoodData,2,';');
  stReaderNo := FindCharCopy(stFoodData,3,';');
  stCardNo := FindCharCopy(stFoodData,4,';');
  stPermitCode := FindCharCopy(stFoodData,5,';');
  stCompanyName:='';
  stJijumName := '';
  stDepartName:='';
  stEM_CODE:='';
  stUserName:='';
  stCompanyCode:='';
  stJijumCode := '';
  stDepartCode:='';
  if stPermitCode = 'D' then
  begin
    wave_NonPay.Play;
  end else if stPermitCode = 'N' then
  begin
    Wave_Alarm.Play;
  end;
  if stPermitCode = 'D' then
  begin
    stNonPay := '미납';
    stNonPayCode := 'Y';
    stPermitCode := 'Y';
  end else
  begin
    stNonPay := '';
    stNonPayCode := 'N';
  end;
  if stPermitCode = 'Y' then stPermitName := '승인'
  else if stPermitCode = 'E' then stPermitName := 'DBError'
  else stPermitName := '미승인';

  if DBTYPE = 'MDB' then stSql :=MDBSql.SelectTB_CARDJoinTBEmployee
  else if DBTYPE = 'PG' then stSql :=PostGreSql.SelectTB_CARDJoinTBEmployee
  else if DBTYPE = 'MSSQL' then stSql :=MSsql.SelectTB_CARDJoinTBEmployee
  else Exit;
  stSql := stSql + ' AND a.CA_CARDNO = ''' + stCardNo + ''' ';
  
{  stSql := 'select b.*,c.CO_NAME as Company_Name,d.CO_NAME as Depart_Name from TB_CARD a ' ;
  stSql := stSql + ' Inner Join TB_EMPLOYEE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON(c.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND c.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON(d.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND d.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND d.CO_DEPARTCODE = b.CO_DEPARTCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' where a.CA_CARDNO = ''' + stCardNo + ''' '; }
  with AdoTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
      if recordCount > 0 then
      begin
        stCompanyName:=FindField('COMPANYNAME').AsString;
        stJijumName:=FindField('JIJUMNAME').AsString;
        stDepartName:=FindField('DEPARTNAME').AsString;
        stEM_CODE:=FindField('EM_CODE').AsString;
        stUserName:=FindField('EM_NAME').AsString;
        stCompanyCode:=FindField('CO_COMPANYCODE').AsString;
        stJijumCode:=FindField('CO_JIJUMCODE').AsString;
        stDepartCode:=FindField('CO_DEPARTCODE').AsString;
      end;
    Except
    End;
  end;
  with sg_Food do
  begin
    if Cells[0,1] <> '' then   InsertRows(1,1);

    if RowCount >= MAX_LISTCOUNT then
    begin
      RemoveRows(RowCount-1,1);
    end;
    Cells[0,1] := stPermitCode; //승인코드
    Cells[1,1] := stNonPayCode; //미납코드
    Cells[2,1] := stTime;   //발생시간
    Cells[3,1] := stDevice; //기기번호
    Cells[4,1] := stReaderNo; //리더번호
    Cells[5,1] := stCardNo; //카드번호
    Cells[6,1] := stCompanyName; //회사명
    Cells[7,1] := stJijumName; //부서명
    Cells[8,1] := stDepartName; //부서명
    Cells[9,1] := stEM_CODE; //번호
    Cells[10,1] := stUserName ; //이름
    Cells[11,1] := stPermitName ; //승인유무
    Cells[12,1] := stCompanyCode ; //학급코드
    Cells[13,1] := stDepartCode; //구분코드
  end;
end;

procedure TfmFoodState.GridInit(sg: TAdvStringGrid; aCol: integer);
var
  i:integer;
begin
  with sg do
  begin
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

end;

procedure TfmFoodState.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create; // 기기코드를 가지고 있다. (N:노드(3자리),E:ECU(9자리))
  DeviceStateList := TStringList.Create;  //기기의 상태정보를 가지고 있다. (C:Connect,D:Disconnect);
  DeviceCaptionList := TStringList.Create; //기기명을 가지고 있다.
  DeviceLastTimeList := TStringList.Create; //마지막 접속시간을 가지고 있다.

  GridInit(sg_Food,12);
  sg_Food.ColWidths[0] := 0;
  sg_Food.ColWidths[1] := 0;

end;

procedure TfmFoodState.CommandArrayCommandsTCommand3Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmFoodState.sg_FoodDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  stCell:string;
begin
  with TStringGrid(Sender) do
  begin
    stCell := cells[ACol, ARow];
    if ARow > (FixedRows - 1) then
    begin
      if Cells[0,ARow] = 'N' then
      begin
        Canvas.Brush.Color := clRed; //미승인이면
      end
      else if Cells[0,ARow] = 'E' then
      begin
        Canvas.Brush.Color := clBlue; //DB Error 
      end
      else if Cells[1,ARow] = 'Y' then
      begin
        Canvas.Brush.Color := clYellow; //미승인이면
      end
      else Canvas.Brush.Color := clWhite;
      canvas.fillRect(rect);
      canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 3, cells[ACol, ARow]);
    end;
  end;
end;

procedure TfmFoodState.ServerConTimerTimer(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('PORTCONNECT').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('PORTCONNECT').Execute;
end;

procedure TfmFoodState.Action_DeviceLoadExecute(Sender: TObject);
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
  stSql := stSql + ' AND b.AC_FDTYPE = ''1'' ) ';
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
  end;

  //ECU정보 로딩
  stSql := ' Select a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.AC_DEVICENAME';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_FDTYPE = ''1'' ';
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
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmFoodState.DisConnectNode(aNodeNo: string);
var
  aTreeView   : TTreeview;
  aNode,bNode,cNode   : TTreeNode;
  stCaption : string;
  i : integer;
  stECUCode : string;
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

procedure TfmFoodState.DisConnectECU(aECUID: string);
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

procedure TfmFoodState.ConnectECU(aECUID: string);
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

procedure TfmFoodState.ConnectNode(aNodeNo: string);
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

procedure TfmFoodState.ConnectServer;
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

procedure TfmFoodState.DisConnectServer;
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

procedure TfmFoodState.DeviceConnectStatus(aReceiveData: string);
var
  stNodeNo : string;
  stECUID : string;
  stDoorNo : string;

begin
  Delete(aReceiveData,1,1); //처음 맨 앞자리는 R OR C
  stNodeNo := copy(aReceiveData,1,3);
  Delete(aReceiveData,1,3); //데몬에서 붙여온 Node 번호
  if Not Isdigit(stNodeNo) then Exit;
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

procedure TfmFoodState.NodeConnectStatus(aReceiveData: string);
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

procedure TfmFoodState.CommandArrayCommandsTCommand4Execute(
  Command: TCommand; Params: TStringList);
var
  stReceiveData: string;
  stNodeNo,stECUID,stDoorNo,stReaderNo : string;
begin
  stReceiveData := Params.Values['VALUE'];
  stNodeNo := copy(stReceiveData,3,3);
  stECUID := copy(stReceiveData,6,2);
  if Not Isdigit(stNodeNo) then Exit;
  if Not Isdigit(stEcuID) then Exit;

  if Pos('DISCONNECTED',UpperCase(stReceiveData)) > 0 then
  begin
    if stECUID <> '00' then
      DisConnectECU('E' + FillZeroNumber(strtoint(stNodeNo),3) + stECUID)
    else DisConnectNode('N' + stNodeNo);
  end else if Pos('CONNECTED',UpperCase(stReceiveData)) > 0 then
  begin
    if stECUID = '00' then ConnectNode('N' + stNodeNo);
    ConnectECU('E' + FillZeroNumber(strtoint(stNodeNo),3) + stECUID)
  end;

end;

initialization
  RegisterClass(TfmFoodState);
Finalization
  UnRegisterClass(TfmFoodState);

end.
