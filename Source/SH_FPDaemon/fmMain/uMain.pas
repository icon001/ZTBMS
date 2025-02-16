unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ImgList, antTaskbarIcon, ExtCtrls, ComCtrls, ToolWin,
  ActnList,AdoDB,DB,ActiveX, uSubForm, CommandArray;

type
  TfmMain = class(TfmASubForm)
    tbi: TantTaskbarIcon;
    imlstIcons: TImageList;
    pmTest: TPopupMenu;
    miShow: TMenuItem;
    Timer1: TTimer;
    N1: TMenuItem;
    mi_Close: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    mn_FormHide: TMenuItem;
    N4: TMenuItem;
    mn_Exit: TMenuItem;
    N12: TMenuItem;
    mn_CardReader: TMenuItem;
    N10: TMenuItem;
    PC1: TMenuItem;
    N19: TMenuItem;
    Menu_ImageList: TImageList;
    ToolBar1: TToolBar;
    btnCurrentState: TToolButton;
    btnDDNSMonitoring: TToolButton;
    ActionList1: TActionList;
    Action_Reader: TAction;
    Action_ReaderMonitoring: TAction;
    StatusBar1: TStatusBar;
    Image1: TImage;
    FPSendTimer: TTimer;
    FpChangCheckTimer: TTimer;
    SyncTimer: TTimer;
    procedure miShowClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure tbiDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mi_CloseClick(Sender: TObject);
    procedure mn_FormHideClick(Sender: TObject);
    procedure Action_ReaderExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FPSendTimerTimer(Sender: TObject);
    procedure FpChangCheckTimerTimer(Sender: TObject);
    procedure Action_ReaderMonitoringExecute(Sender: TObject);
    procedure CommandArrayCommandsTReaderMonitoringExecute(
      Command: TCommand; Params: TStringList);
    procedure SyncTimerTimer(Sender: TObject);
  private
    L_bClose : Boolean;
    L_bShowReaderMonitoring : Boolean;
    L_nSyncTimeSendSeq : integer;
    { Private declarations }
    procedure CARDStateChangeEvent(Sender: TObject;  aFPNo,aUSERID : integer;aNodeName,aFPSEND:string);
    procedure FPCARDEvent(Sender: TObject;  aFPNo : integer;aNodeName,aTxRx,aData:string);
    procedure FPConnected(Sender: TObject;  aFPNo: integer;aNodeIP:string;aNodePort:integer;aNodeName:string;aConnected:integer);
    procedure ChangeFPDataApply;
    Function  GetCardConfig : Boolean;
    Procedure MDIChildShow(FormName:String);
    Function  MDIForm(FormName:string):TForm;
    procedure FPSendData;
  protected
    procedure WMQueryEndSession(var Msg : TWMQueryEndSession); message WM_QueryEndSession;
  public
    { Public declarations }
    procedure DeviceChange;
  end;

var
  fmMain: TfmMain;

implementation
uses
  uDataBaseConfig,
  uDataModule1,
  uLomosUtil,
  uReaderMonitoring,
  uSHComModule;
{$R *.dfm}

procedure TfmMain.miShowClick(Sender: TObject);
begin
  Visible := True;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  if G_bApplicationTerminate then Exit;
  Visible:=False;
  Timer1.Enabled:=False;
end;

procedure TfmMain.tbiDblClick(Sender: TObject);
begin
  miShowClick(miShow);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  stSql : string;
begin

  Self.ModuleID := 'Main';
  
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

  G_bApplicationTerminate := False;

  SHNodeList := TStringList.Create;

  tbi.Visible := True;
  tbi.Hint := '성현 지문리더 데몬';
  tbi.ImageIndex := 0;
  Timer1.Enabled := True;

  stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''N'' ';    //전송 성공하지 않은 지문 데이터는 모두 재전송 하자.
  stSql := stsql + ' Where FP_SEND <> ''Y'' ';

  DataModule1.ProcessExecSQL(stSql);

  GetCardConfig;

  if (fdmsType <> '2') or (fdmsUses <> 'TRUE')  then
  begin
    //성현 DB연동인 경우 여기서 전송하면 안된다.
    FPSendTimer.Enabled := True;
    FpChangCheckTimer.Enabled := True;
  end;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if L_bClose = False then
  Begin
    Visible := False;
    CanClose := False;
    ShowWindow( Application.Handle, SW_HIDE );
  end;
end;

procedure TfmMain.mi_CloseClick(Sender: TObject);
begin
  L_bClose := True;
  Close;
end;

procedure TfmMain.mn_FormHideClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Action_ReaderExecute(Sender: TObject);
begin
  MDIChildShow('TfmReaderManager');
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

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  G_bApplicationTerminate := True;
  FPSendTimer.Enabled := False;
end;

procedure TfmMain.FPSendTimerTimer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := 'FPSendTimerTimer';
  if G_bApplicationTerminate then Exit;
  FPSendTimer.Enabled := False;
  FPSendTimer.Interval := 10 * 1000;
  Try
    FPSendData;
  Finally
    FPSendTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.FPSendData;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nIndex : integer;
  oFPNode : TFPNode;
  stFPNodeNo : string;
  stTemp : string;
begin
  stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''R'' ';
  stSql := stsql + ' Where FP_SEND = ''N'' ';

  DataModule1.ProcessExecSQL(stSql);
  if UpperCase(DBType) = 'MDB' then
  begin
    stSql := 'Select a.*,b.FD_DEVICEIP,b.FD_DEVICEPORT,b.FD_DEVICENAME,b.FD_DEVICENO,b.FD_DEVICETYPE,c.FP_CARDNO,c.FP_DATA from ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' ( ';
    stSql := stSql + ' TB_FINGERDEVICECARD a ';
    stSql := stSql + ' Inner Join TB_FINGERDEVICE b ';
    stSql := stSql + ' ON(a.FD_DEVICEID = b.FD_DEVICEID ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Inner Join TB_CARDFINGER c ';
    stSql := stSql + ' ON(a.FP_USERID = c.FP_USERID ) ';
    stSql := stSql + ' ) ';
    stSql := stSql + ' Where a.FP_SEND = ''R'' ';
    stSql := stSql + ' Order by a.FD_DEVICEID ';
  end else
  begin
    stSql := 'Select a.*,b.FD_DEVICEIP,b.FD_DEVICEPORT,b.FD_DEVICENAME,b.FD_DEVICENO,b.FD_DEVICETYPE,c.FP_CARDNO,c.FP_DATA from TB_FINGERDEVICECARD a ';
    stSql := stSql + ' Inner Join TB_FINGERDEVICE b ';
    stSql := stSql + ' ON(a.FD_DEVICEID = b.FD_DEVICEID ) ';
    stSql := stSql + ' Inner Join TB_CARDFINGER c ';
    stSql := stSql + ' ON(a.FP_USERID = c.FP_USERID ) ';
    stSql := stSql + ' Where a.FP_SEND = ''R'' ';
    stSql := stSql + ' Order by a.FD_DEVICEID ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

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
      while Not Eof do
      begin
        stFPNodeNo := FillZeroNumber(FindField('FD_DEVICEID').AsInteger,G_nFDDeviceIDLength);
        StatusBar1.Panels[2].Text := 'FPSendTimerTimer' + stFPNodeNo;
        nIndex := SHNodeList.IndexOf(stFPNodeNo);
        if nIndex < 0 then
        begin
          oFPNode := TFPNode.Create(nil);
          oFPNode.FPNodeNo := FindField('FD_DEVICEID').AsInteger;
          oFPNode.FPNodeIP := FindField('FD_DEVICEIP').AsString;
          oFPNode.FPNodePort := FindField('FD_DEVICEPORT').AsInteger;
          oFPNode.FPNodeName := FindField('FD_DEVICENAME').AsString;
          if Not FindField('FD_DEVICENO').IsNull then
            oFPNode.FPDeviceID := FindField('FD_DEVICENO').AsInteger
          else oFPNode.FPDeviceID := 1;
          if FindField('FD_DEVICETYPE').IsNull then oFPNode.FPDeviceType := 0
          else oFPNode.FPDeviceType := FindField('FD_DEVICETYPE').AsInteger;
          oFPNode.OnCARDStateChangeEvent := CARDStateChangeEvent; //이벤트를 먼저 설정해서 잡아야 한다.
          oFPNode.OnCARDEvent := FPCARDEvent;
          oFPNode.OnConnected := FPConnected;

          //stTemp := FindField('FP_USERID').AsString;
          //stTemp := FindField('FP_CARDNO').AsString;
          //stTemp := FindField('FP_DATA').AsString;
          //stTemp := FindField('FP_PERMIT').AsString;

          oFPNode.Add_FPData(FindField('FP_USERID').AsInteger,FindField('FP_CARDNO').AsString,FindField('FP_DATA').AsString,FindField('FP_PERMIT').AsString);
          SHNodeList.AddObject(stFPNodeNo,oFPNode);
        end else
        begin
          TFPNode(SHNodeList.Objects[nIndex]).FPNodeIP := FindField('FD_DEVICEIP').AsString;
          TFPNode(SHNodeList.Objects[nIndex]).FPNodePort := FindField('FD_DEVICEPORT').AsInteger;
          TFPNode(SHNodeList.Objects[nIndex]).FPNodeName := FindField('FD_DEVICENAME').AsString;
          if Not FindField('FD_DEVICENO').IsNull then
            TFPNode(SHNodeList.Objects[nIndex]).FPDeviceID := FindField('FD_DEVICENO').AsInteger
          else TFPNode(SHNodeList.Objects[nIndex]).FPDeviceID := 1;
          if FindField('FD_DEVICETYPE').IsNull then TFPNode(SHNodeList.Objects[nIndex]).FPDeviceType := 0
          else TFPNode(SHNodeList.Objects[nIndex]).FPDeviceType := FindField('FD_DEVICETYPE').AsInteger;
          TFPNode(SHNodeList.Objects[nIndex]).Add_FPData(FindField('FP_USERID').AsInteger,FindField('FP_CARDNO').AsString,FindField('FP_DATA').AsString,FindField('FP_PERMIT').AsString);
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMain.CARDStateChangeEvent(Sender: TObject; aFPNo,
  aUSERID: integer; aNodeName,aFPSEND: string);
var
  stSql : string;
begin
  stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''' + aFPSEND + ''' ';
  stSql := stSql + ' Where FD_DEVICEID = ' + inttostr(aFPNo) + ' ';
  stSql := stSql + ' AND FP_USERID = ' + inttostr(aUSERID) + ' ';
  stSql := stSql + ' AND FP_SEND <> ''N'' ';

  if aFPSEND = 'N' then
  begin
    showmessage('어디서 걸리는거여');
  end;

  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMain.FpChangCheckTimerTimer(Sender: TObject);
begin
  Try
    FpChangCheckTimer.Enabled := False;
    ChangeFPDataApply;
  Finally
    FpChangCheckTimer.Enabled := Not G_bApplicationTerminate;
  End;
end;

procedure TfmMain.ChangeFPDataApply;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := ' Update TB_CARDFINGER set FP_CHANGE = ''R'' where FP_CHANGE = ''Y'' '; // 변경된 데이터를 가져오기 위함
  DataModule1.ProcessExecSQL(stSql);
  
  stSql := ' Select * from TB_CARDFINGER where FP_CHANGE = ''R'' ';
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
      if recordCount <1 then Exit;
      while Not Eof do
      begin
        stSql := ' Delete From TB_FINGERDEVICECARD where FP_USERID = ' + FindField('FP_USERID').AsString + '';
        DataModule1.ProcessExecSQL(stSql);

        stSql := ' Insert Into TB_FINGERDEVICECARD ( ';
        stSql := stSql + ' FD_DEVICEID, ';
        stSql := stSql + ' FP_USERID, ';
        stSql := stSql + ' FP_PERMIT, ';
        stSql := stSql + ' FP_SEND ) ';
        stSql := stSql + ' select FD_DEVICEID,';
        stSql := stSql + ' ' + FindField('FP_USERID').AsString + ' ,';
        stSql := stSql + ' ''' + FindField('FP_PERMIT').AsString + ''',';
        stSql := stSql + ' ''N'' ';
        stSql := stSql + ' From TB_FINGERDEVICE ';

        DataModule1.ProcessExecSQL(stSql);

        stSql := ' Update TB_CARDFINGER set FP_CHANGE = ''N'' where FP_CHANGE = ''R'' and FP_USERID = ' + FindField('FP_USERID').AsString + ' ';
        DataModule1.ProcessExecSQL(stSql);

        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmMain.GetCardConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  IsNumericCardNo := True;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := 'select * from TB_CONFIG ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND (CO_CONFIGGROUP = ''DAEMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''COMMON'' ';
    stSql := stSql + ' OR CO_CONFIGGROUP = ''RELAY'') ';

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
        if G_bApplicationTerminate then Exit;
        if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then CARDLENGTHTYPE := strtoint(FindField('CO_CONFIGVALUE').AsString)
        else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '1' then IsNumericCardNo := False;
        end else if FindField('CO_CONFIGCODE').AsString = 'fdmsType' then
        begin
          fdmsType := FindField('CO_CONFIGVALUE').AsString;
        end else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then G_nSpecialProgram := strtoint(FindField('CO_CONFIGVALUE').AsString)
        ;

        Next;
      end;
    end;
    if G_nSpecialProgram = 1 then CARDLENGTHTYPE := 2 // KT 사옥 프로그램인 경우는 무조건 HEX<->ASCII
    else if G_nSpecialProgram = 2 then
    begin
    end else if G_nSpecialProgram = 3 then
    begin
      CARDLENGTHTYPE := 0;
      IsNumericCardNo := True;
    end;

    if CARDLENGTHTYPE <> 0 then IsNumericCardNo := False;  //고정 4바이트 아닌 경우에는 숫자타입 사용하지 말자.

  Finally

    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmMain.Action_ReaderMonitoringExecute(Sender: TObject);
begin
  MDIChildShow('TfmReaderMonitoring');
end;

procedure TfmMain.FPCARDEvent(Sender: TObject; aFPNo: integer; aNodeName,
  aTxRx, aData: string);
var
  fmReaderMonitoring :TForm;
begin

  if L_bShowReaderMonitoring then
  begin
    fmReaderMonitoring := MDIForm('TfmReaderMonitoring');
    if fmReaderMonitoring <> nil then
    begin
      TfmReaderMonitoring(fmReaderMonitoring).DisplayStringGrid(aNodeName,aTxRx,aData);
    end;
  end;
end;

procedure TfmMain.FPConnected(Sender: TObject; aFPNo: integer;
  aNodeIP: string; aNodePort: integer; aNodeName: string;
  aConnected: integer);
var
  fmReaderMonitoring :TForm;
  stData : string;
begin
  if aConnected = Connected then stData := 'Connected'
  else if aConnected = Connecting then stData := 'Connecting'
  else stData := 'DisConnected';

  if L_bShowReaderMonitoring then
  begin
    fmReaderMonitoring := MDIForm('TfmReaderMonitoring');
    if fmReaderMonitoring <> nil then
    begin
      TfmReaderMonitoring(fmReaderMonitoring).DisplayStringGrid(aNodeName,'',stData);
    end;
  end;

end;

procedure TfmMain.CommandArrayCommandsTReaderMonitoringExecute(
  Command: TCommand; Params: TStringList);
var
  stResult : string;
begin
   stResult := Params.Values['SHOW'];
   if stResult = 'TRUE' then L_bShowReaderMonitoring := True
   else L_bShowReaderMonitoring := False;

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

procedure TfmMain.DeviceChange;
begin

end;

procedure TfmMain.WMQueryEndSession(var Msg: TWMQueryEndSession);
begin
    L_bClose := True;
    Close;
    Delay(1000);
    Msg.Result := 1;

end;

procedure TfmMain.SyncTimerTimer(Sender: TObject);
begin
  inherited;
(*  if G_bApplicationTerminate then Exit;
  if SHNodeList.Count < 1 then Exit;
  if L_nSyncTimeSendSeq > SHNodeList.Count - 1 then L_nSyncTimeSendSeq := 0;

  TFPNode(SHNodeList.Objects[L_nSyncTimeSendSeq]).SyncTimeSend;
  inc(L_nSyncTimeSendSeq);
*)
end;

end.
