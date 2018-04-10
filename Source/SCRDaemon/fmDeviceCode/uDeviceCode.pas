unit uDeviceCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, Buttons,
  Spin, uSubForm, CommandArray, DB, ADODB,WinSpool, OoMisc, AdStatLt,
  AdPort, AdWnPort;

const
  nDelayTime = 3000;

type
  TfmDeviceCode = class(TfmASubForm)
    PageControl1: TPageControl;
    MCUTab: TTabSheet;
    ECUTab: TTabSheet;
    StatusBar1: TStatusBar;
    AlarmTab: TTabSheet;
    GroupBox2: TGroupBox;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label22: TLabel;
    ed_EcuName: TEdit;
    Panel5: TPanel;
    sg_ECUCode: TAdvStringGrid;
    Splitter2: TSplitter;
    GroupBox16: TGroupBox;
    Splitter4: TSplitter;
    Panel4: TPanel;
    GroupBox17: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    cmb_sFloorCode4: TComboBox;
    cmb_sMeetingRoomCode4: TComboBox;
    cmb_sMCUCode4: TComboBox;
    cmb_sECUCode4: TComboBox;
    ed_AlarmName4: TEdit;
    Panel7: TPanel;
    GroupBox18: TGroupBox;
    Label41: TLabel;
    Label44: TLabel;
    cmb_DeviceCode: TComboBox;
    cmb_AreaCode4: TComboBox;
    sg_AlarmCode: TAdvStringGrid;
    ed_AlarmNo4: TSpinEdit;
    Label45: TLabel;
    Label46: TLabel;
    ed_AlarmViewSeq: TEdit;
    Label10: TLabel;
    ed_Ecuno: TSpinEdit;
    ed_NodeNo4: TEdit;
    ADONode: TADOQuery;
    ADOECU: TADOQuery;
    ADOQuery: TADOQuery;
    ADOExec: TADOQuery;
    ADOLink: TADOQuery;
    Panel12: TPanel;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Label2: TLabel;
    cmb_ComPort: TComboBox;
    btn_Rs232ConTest: TSpeedButton;
    btn_RSetting: TSpeedButton;
    st_Connected: TStaticText;
    Off_Timer: TTimer;
    ed_gubun: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    sg_Event: TAdvStringGrid;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_ECUCodeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure cmb_ComPortChange(Sender: TObject);
    procedure btn_RSettingClick(Sender: TObject);
    procedure btn_Rs232ConTestClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    MCUCodeList : TStringList;
    DeviceCodeList : TStringList;
    sMeetingRoomCodeList : TStringList;
    sFloorCodeList : TStringList;
    sMCUCodeList : TStringList;
    sECUCodeList : TStringList;
    ComPortList : TStringList;

    State : string;
    PrevECUNO : integer;
    StopConnection : Boolean; //연결 해제 버튼시 True
    bConnected : Boolean;
    ComBuff : string;  //수신된 메시지 버퍼
    Rcv_MsgNo     : Char;
    Send_MsgNo    : Integer;

    procedure FormClear;
    procedure ButtonEnable(aState:string);
    procedure FormEnable(aState:string);
    function GetFloorName(aFloorCode:string):string;
    procedure LoadsFloorCode(cmb_Box:TComboBox);
    procedure LoadsMeetingRoomCode(aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadDeviceCode(cmb_Box:TComboBox);
    procedure LoadsECUCode(aMCUCode,aGubun:string;cmb_Box:TComboBox);
    procedure MCUSearch(aNodeNo:string);
    procedure ECUSearch(aNodeNo,aEcuID:String);
    Function InsertTB_ACCESSDEVICE(aNodeNo,aEcuID,aMcuIp,aMcuPort,aName,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aComPort,aGubun:string):Boolean;
    Function UpdateTB_ACCESSDEVICE(aNodeNo,aEcuID,aMcuIp,aMcuPort,aName,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aComPort:string):Boolean;
    Function UpdateECUIDFromECU(aMCUID,aPrevECUNO,aCurEcuno:string):Boolean;

    Function DeleteTB_ACCESSDEVICE(aNodeNo,aEcuID:string):Boolean;
    Function DeleteTB_ALARMDEVICE(aECUID,aAlarmNo : string):Boolean;
    Function CheckNode(aNodeNo:string):Boolean;
    Function DupCheckMCU(aMcuIp,aMcuPort:string):Boolean;
    Function DupCheckECU(aNodeNo,aEcuNo:string):Boolean;
    Function DeleteNODEECUALL(aNodeNo:string):Boolean;
    Function DeleteECU(aNodeNo,aEcuID:string):Boolean;
    procedure ECUSave;

    Function WinsockPortOpen(aType:string):Boolean;
    Procedure CommNodeSend(Sender: TObject;  SendData: string;NodeNO : integer);  //MCU에 Send 되는 모든 데이터를 실시간으로 조회 할 수 있도록 처리
    Procedure CommNodeReceve(Sender: TObject;  ReceiveData: string;NodeNO : integer);  //MCU에서 Recv 되는 모든 데이터를 접속되어 있는 클라이언트에 전송

  public
    { Public declarations }
    WorkCode : integer;
  Published
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

  end;

var
  fmDeviceCode: TfmDeviceCode;
  bEnQRecv : Boolean;

implementation
uses
  uLomosUtil,
  uDataModule1,
  uServerDaemon,
  uSerialModule;

{$R *.dfm}

{ TfmDeviceCode }


{ TfmDeviceCode }


procedure TfmDeviceCode.btn_CloseClick(Sender: TObject);
begin
//  self.FindSubForm('Main').FindCommand('DEVICE').Execute;
  Close;
end;

procedure TfmDeviceCode.FormActivate(Sender: TObject);
var
  i : integer;
begin
  if (WorkCode < 0) or (WorkCode > 3) then WorkCode := 0;
  PageControl1.ActivePageIndex := WorkCode;

  with sg_ECUCode do
  begin
    OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  MCUSearch('');

end;

procedure TfmDeviceCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    MCUCodeList.Free ;
    DeviceCodeList.Free ;
    sMeetingRoomCodeList.Free ;
    sFloorCodeList.Free ;
    sMCUCodeList.Free ;
    sECUCodeList.Free ;
    ComPortList.Free;
end;

procedure TfmDeviceCode.FormCreate(Sender: TObject);
var
  nCount : integer;
  i : integer;
begin
  MCUCodeList := TStringList.Create ;
  DeviceCodeList := TStringList.Create ;
  sMeetingRoomCodeList := TStringList.Create ;
  sFloorCodeList := TStringList.Create ;
  sMCUCodeList := TStringList.Create ;
  sECUCodeList := TStringList.Create ;
  ComPortList := TStringList.Create;
  ComPortList.Clear;
  nCount := GetSerialPortList(ComPortList);
  cmb_ComPort.Clear;
  btn_Rs232ConTest.Enabled := False;
  if nCount > 0 then
  begin
    for i:= 0 to nCount - 1 do
    begin
      cmb_ComPort.items.Add(ComPortList.Strings[i]);
    end;
    cmb_ComPort.ItemIndex := 0;
    btn_Rs232ConTest.Enabled := True;
  end;
  
end;


procedure TfmDeviceCode.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End; 
end;

procedure TfmDeviceCode.LoadsFloorCode(cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  stSql := 'select TM_FLOOR from V_MEETINGROOM_CODE Group by TM_FLOOR ';
  cmb_Box.Items.Add('');
  sFloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  with ADOLink do
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
      cmb_Box.Items.Add(FindField('TM_FLOOR').AsString );
      sFloorCodeList.Add(FindField('TM_FLOOR').AsString);
      Next;
    end;
  end;
end;

procedure TfmDeviceCode.LoadsMeetingRoomCode(aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  sMeetingRoomCodeList.Clear;

  stSql := 'select * from V_MEETINGROOM_CODE ';

  if (aFloorCode <> '') And (aFloorCode <> '00000000000')  then
  begin
    stSql := stSql + ' WHERE TM_FLOOR = ''' + aFloorCode + '''';
  end ;

  cmb_Box.Items.Add('');
  sMeetingRoomCodeList.Add('00000000000');
  cmb_Box.ItemIndex := 0;

  with ADOLink do
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
      cmb_Box.Items.Add(FindField('TM_MEETCODE_NAME').AsString );
      sMeetingRoomCodeList.Add(FindField('TM_MEETCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmDeviceCode.LoadDeviceCode(cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  DeviceCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';


  cmb_Box.Items.Add('전체');
  DeviceCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
      DeviceCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
end;

procedure TfmDeviceCode.LoadsECUCode(aMCUCode, aGubun: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  sECUCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aGubun <> 'FOOD' then
    stSql := stSql + ' AND AC_FDTYPE <> ''1'' '
  else stSql := stSql + ' AND AC_FDTYPE = ''1'' ';

  if (aMCUCode <> '') And (aMCUCode <> '0000000000')  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aMCUCode,1,3))) ;
  end;


  cmb_Box.Items.Add('');
  sECUCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
      sECUCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) +  FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
end;


function TfmDeviceCode.GetFloorName(aFloorCode: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'select * from V_MEETINGROOM_CODE where TM_MEETCODE = ''' + aFloorCode + ''' ';

  with ADOLink do
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
    result := FindField('TM_FLOOR').AsString;
  end;
end;

procedure TfmDeviceCode.PageControl1Change(Sender: TObject);
begin
  with PageControl1 do
  begin
    if ActivePage.Name = 'MCUTab' then    //MCU 관리
    begin
      MCUSearch('');
    end  else if ActivePage.Name = 'ECUTab' then //ECU 관리
    begin
      ECUSearch('000','');
    end;
  end;
end;

procedure TfmDeviceCode.MCUSearch(aNodeNo:string);
var
  stSql : string;
  i : integer;
begin

  FormClear;
  FormEnable('SAVE');
  ButtonEnable('SAVE');

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';
  stSql := stSql + ' AND AC_NETTYPE = ''RS232'' ';

  with DataModule1.GetObject.ADOTmpQuery do
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
    if cmb_ComPort.Items.Count < 1 then Exit;
    for i := 0 to cmb_ComPort.Items.Count - 1 do
    begin
      if DecodeCommportName(cmb_ComPort.Items.Strings[i]) = FindField('AC_COMPORT').asinteger then
      begin
        cmb_ComPort.ItemIndex := i;
        break;
      end;
    end;
  end;

end;

procedure TfmDeviceCode.ECUSearch(aNodeNo,aEcuID: String);
var
  stSql : string;
  nRow : integer;
begin
  sg_ECUCode.Clear;
  sg_ECUCode.Cells[0,0] := '리더번호';
  sg_ECUCode.Cells[1,0] := '리더명칭';
  sg_ECUCode.Cells[2,0] := '구분';
  sg_ECUCode.RowCount := 2;

  FormClear;
  FormEnable('SAVE');
  ButtonEnable('SAVE');

  stSql := ' select a.* from TB_ACCESSDEVICE a ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  with DataModule1.GetObject.ADOTmpQuery do
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
    sg_ECUCode.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_ECUCode do
      begin
        cells[0,nRow] := FindField('AC_ECUID').AsString;
        cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        cells[2,nRow] := FindField('AC_Gubun').AsString;

        if aEcuID = (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString) then
        begin
          SelectRows(nRow,1);  
        end;

        nRow := nRow + 1;
      end;
      Next;
    end;

  end;
end;


procedure TfmDeviceCode.sg_ECUCodeClick(Sender: TObject);
var
  stMCUID : string;
  stFloorName :string;
begin
  State := '';
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_ECUNO.Value  := strtoint(cells[0,Row]);
    PrevEcuNo := strtoint(cells[0,Row]);
    ed_ECUNAME.Text  := cells[1,Row];
    ed_gubun.Text  := cells[2,Row];

  end;
  FormEnable('CLICK');
  ButtonEnable('CLICK');
end;

procedure TfmDeviceCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  stNodeNo : string;
  stMCUCode,stECUID : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  if ed_gubun.Text = '0' then
  begin
    if (Application.MessageBox(PChar('통신포트의 기준이 되는 리더입니다. 이 리더를 삭제하면 모든 리더가 삭제 됩니다.'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    DeleteNODEECUALL('001');
    Exit;
  end;
  stECUID := '001' +
             FillZeroNumber(ed_Ecuno.Value,2);
  bResult := DeleteECU('001',FillZeroNumber(ed_Ecuno.Value,2));
  if bResult then
  begin
    ECUSearch('001','');
  end else showmessage('삭제실패.');

end;

procedure TfmDeviceCode.btn_InsertClick(Sender: TObject);
var
  stSql : string;
  stMCUID : string;
  stECUID : string;
begin

  FormClear;
  FormEnable('INSERT');
  ButtonEnable('INSERT');


  stSql := 'select MAX(AC_ECUID) as AC_ECUID from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = 1 ';

  with DataModule1.GetObject.ADOTmpQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      showmessage('테이블에 이상이 있습니다.');
      Exit;
    End;

    if RecordCount > 0 then ed_Ecuno.Value := FieldByName('AC_ECUID').asinteger + 1
    else ed_Ecuno.Value := 1;
  end;
  State := 'Insert';

  with sg_ECUCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := False;
    end;
  end;
  ed_EcuName.SetFocus;

end;

procedure TfmDeviceCode.btn_UpdateClick(Sender: TObject);
begin

  FormEnable('UPDATE');
  ButtonEnable('UPDATE');
  State := 'Update';
  ed_EcuName.SetFocus;

end;

function TfmDeviceCode.DeleteECU(aNodeNo,aEcuID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 기기 삭제
  stSql := 'Delete from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ' ;
  Result := DataModule1.ProcessExecSQL(stSql);

end;


function TfmDeviceCode.DeleteNODEECUALL(aNodeNo: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;

  with ADOECU do
  begin
    close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then
    begin
      Result := True;
      Exit;
    end;
    while Not Eof do
    begin
      Result := DeleteECU(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)
                               , FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Next;
    end;
  end;
 
end;

function TfmDeviceCode.DeleteTB_ACCESSDEVICE(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Delete From TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' +  aEcuID + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceCode.DeleteTB_ALARMDEVICE(aECUID,aAlarmNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aECUID,1,3))) ;
  stSql := stSql + ' AND AC_MCUID = ''' + copy(aECUID,4,7) + ''' ' ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aECUID,11,2) + ''' ' ;
  stSql := stSql + ' AND AL_ZONENUM = ' + aAlarmNo ;

  with DataModule1.GetObject.ADOExecQuery do
  begin
    close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;

  end;
  result := True;
end;


function TfmDeviceCode.DupCheckECU(aNodeNo, aEcuNo: string): Boolean;
var
  stSql :string;
begin
  Result := False;
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuNo + ''' ';

  with DataModule1.GetObject.ADOTmpQuery do
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

  end;
  Result := True;
end;

function TfmDeviceCode.DupCheckMCU(aMcuIp, aMcuPort: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := ' Select * from  TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_MCUIP = ''' + Trim(aMcuIp) + ''' ';
  stSql := stSql + ' AND AC_MCUPORT = ''' + Trim(aMcuPort) + ''' ';

  with DataModule1.GetObject.ADOTmpQuery do
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
  end;

  Result := True;
end;

procedure TfmDeviceCode.btn_SaveClick(Sender: TObject);
begin
  ECUSave;
end;


procedure TfmDeviceCode.ECUSave;
var
  stAC,stFd,stPt,stAT : string;
  bResult : Boolean;
  stMCUID,stNodeNo,stECUID : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
begin
    stAC := '1';
    stFd := '0';
    stPt := '0';
    stAT := '1';
    DataModule1.ADOConnection.BeginTrans;
    if upperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckECU('001',FillZeroNumber(ed_Ecuno.Value,2));
      if bResult then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := InsertTB_ACCESSDEVICE('1',
                                       FillZeroNumber(ed_Ecuno.Value,2),
                                       '',
                                       '',
                                       ed_EcuName.Text,
                                       stAC,
                                       stFd,
                                       stPt,
                                       stAt,
                                       '0',
                                       '1');
    end
    else if upperCase(State) = 'UPDATE' then
    begin
      if PrevECUNO <> ed_ecuno.Value then   //ECU ID 변경 된경우
      begin
        bResult := DupCheckECU(copy(stMCUID,1,3),FillZeroNumber(ed_Ecuno.Value,2));
        if bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('이미 등록되어 있는 장비 입니다.');
          Exit;
        end;
        bResult := UpdateECUIDFromECU(stMCUID,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('ECU의 ECUID변경 작업 실패');
          Exit;
        end;
      end;
      bResult := UpdateTB_ACCESSDEVICE('001',
                                     FillZeroNumber(ed_Ecuno.Value,2),
                                     '',
                                     '',
                                     ed_EcuName.Text,
                                     stAC,
                                     stFd,
                                     stPt,
                                     stAt,
                                     '0');
    end;

    if bResult then
    begin
      DataModule1.ADOConnection.CommitTrans;
      ECUSearch('1','001' + FillZeroNumber(ed_Ecuno.Value,2));
    end else
    begin
      DataModule1.ADOConnection.RollbackTrans;
      showmessage('저장실패');
    end;

end;

function TfmDeviceCode.InsertTB_ACCESSDEVICE(aNodeNo, aEcuID,
  aMcuIp, aMcuPort, aName, aMcuAC, aMcuFd, aMcuPt,
  aMcuAt,aComPort,aGubun: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ACCESSDEVICE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_MCUIP,';
  stSql := stSql + 'AC_MCUPORT,';
  stSql := stSql + 'AC_DEVICENAME,';
  stSql := stSql + 'AC_ACTYPE,';
  stSql := stSql + 'AC_ATTYPE,';
  stSql := stSql + 'AC_FDTYPE,';
  stSql := stSql + 'AC_PTTYPE,';
  stSql := stSql + 'AC_NETTYPE,';
  stSql := stSql + 'AC_COMPORT,';
  stSql := stSql + 'AC_GUBUN,';
  stSql := stSql + 'SEND_ACK )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMcuIp + ''',';
  stSql := stSql + '''' + aMcuPort + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aMcuAC + ''',';
  stSql := stSql + '''' + aMcuAt + ''',';
  stSql := stSql + '''' + aMcuFd + ''',';
  stSql := stSql + '''' + aMcuPt + ''',';
  stSql := stSql + '''' + NETTYPE + ''',';
  stSql := stSql + '''' + aComPort + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''N'' ) ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceCode.UpdateECUIDFromECU( aMCUID,aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ECU의 ECU ID변경
  stSql := 'Update TB_ACCESSDEVICE Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aMCUID,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  With AdoExec do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Execsql;
    Except
      Exit;
    End;
  end;

  Result := True;
end;


function TfmDeviceCode.UpdateTB_ACCESSDEVICE(aNodeNo,  aEcuID,
  aMcuIp, aMcuPort, aName, aMcuAC, aMcuFd, aMcuPt,
  aMcuAt,aComPort: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aMcuIp + ''',';
  stSql := stSql + 'AC_MCUPORT = ''' + aMcuPort + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + 'AC_ACTYPE = ''' + aMcuAC + ''',';
  stSql := stSql + 'AC_ATTYPE = ''' + aMcuAt + ''',';
  stSql := stSql + 'AC_FDTYPE = ''' + aMcuFd + ''',';
  stSql := stSql + 'AC_PTTYPE = ''' + aMcuPt + ''', ';
  stSql := stSql + 'AC_NETTYPE = ''' + NETTYPE + ''', ';
  stSql := stSql + 'AC_COMPORT = ''' + aComPort + ''', ';
  stSql := stSql + 'SEND_ACK = ''N'' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);


end;

procedure TfmDeviceCode.btn_CancelClick(Sender: TObject);
begin
  ECUSearch('1','001' + FillZeroNumber(ed_Ecuno.Value,2));
end;

procedure TfmDeviceCode.FormClear;
begin
  ed_Ecuno.Value := 1;
  ed_EcuName.Text := '';
end;

procedure TfmDeviceCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
    sg_ECUCode.Enabled := False;
  end else if upperCase(aState) = 'UPDATE'  then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := True;
    btn_Cancel.Enabled := True;
    sg_ECUCode.Enabled := False;
  end else if upperCase(aState) = 'CLICK'  then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Delete.Enabled := True;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    sg_ECUCode.Enabled := True;
  end else if upperCase(aState) = 'SAVE'  then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    sg_ECUCode.Enabled := True;
  end else if upperCase(aState) = 'CANCEL'  then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    sg_ECUCode.Enabled := True;
  end;

end;

procedure TfmDeviceCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_Ecuno.Enabled := True;
    ed_EcuName.Enabled := True;
  end else if upperCase(aState) = 'UPDATE'  then
  begin
    ed_Ecuno.Enabled := False;
    ed_EcuName.Enabled := True;
  end else if upperCase(aState) = 'CLICK'  then
  begin
    ed_Ecuno.Enabled := False;
    ed_EcuName.Enabled := False;
  end else if upperCase(aState) = 'SAVE'  then
  begin
    ed_Ecuno.Enabled := False;
    ed_EcuName.Enabled := False;
  end else if upperCase(aState) = 'CANCEL'  then
  begin
    ed_Ecuno.Enabled := False;
    ed_EcuName.Enabled := False;
  end;

end;


function TfmDeviceCode.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmDeviceCode.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmDeviceCode.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

procedure TfmDeviceCode.cmb_ComPortChange(Sender: TObject);
begin
  btn_Rs232ConTest.Enabled := True;
end;

procedure TfmDeviceCode.btn_RSettingClick(Sender: TObject);
var
  nPort : integer;
begin
  if cmb_ComPort.ItemIndex < 0 then
  begin
    showmessage('시리얼 포트를 선택하셔야 합니다.');
    Exit;
  end;
  nPort := DecodeCommportName(cmb_ComPort.Text);
  if CheckNode('1') then
  begin
    UpdateTB_ACCESSDEVICE('1',STARTREADER,'','3000','COM'+inttostr(nPort),'1','0','0','1',inttostr(nPort));
  end else
  begin
    InsertTB_ACCESSDEVICE('1',STARTREADER,'','3000','COM'+inttostr(nPort),'1','0','0','1',inttostr(nPort),'0');
  end;

end;

function TfmDeviceCode.CheckNode(aNodeNo: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := ' Select * from  TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NodeNo = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_GUBUN = ''0'' ' ;

  with DataModule1.GetObject.ADOTmpQuery do
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
  end;

  Result := True;
end;

procedure TfmDeviceCode.btn_Rs232ConTestClick(Sender: TObject);
var
  stDeviceID : string;
  FirstTickCount: Longint;
begin
  st_Connected.Color := clBtnFace;
  Screen.Cursor:= crHourGlass;
  StopConnection := False;
  btn_Rs232ConTest.Enabled := False;
  if Not SerialModule.WinsockPort.Open then
  begin
    if Not WinsockPortOpen(NETTYPE) then
    begin
      st_Connected.Caption := 'DisConnected';
      btn_Rs232ConTest.Enabled := True;
      Screen.Cursor:= crDefault;
    end;
  end;
  SerialModule.OnSendData :=         CommNodeSend;
  SerialModule.OnRcvData :=         CommNodeReceve;

  bEnQRecv := False;
  SerialModule.SendPacket(STARTREADER,ENQCMD,'');

  FirstTickCount := GetTickCount + nDelayTime; //3초 대기
  While Not bEnQRecv do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;  //3000밀리동안 응답 없으면 실패로 처리함
  end;

  if Not bEnQRecv then
  begin
    st_Connected.Caption := 'DisConnected';
    btn_Rs232ConTest.Enabled := True;
    Screen.Cursor:= crDefault;
    showmessage('기기 응답이 없습니다.');
    Exit;
  end;

  st_Connected.Caption := 'Connected';
  st_Connected.Color := clYellow;
  Screen.Cursor:= crDefault;

  btn_Rs232ConTest.Enabled := True;

end;

function TfmDeviceCode.WinsockPortOpen(aType: string): Boolean;
begin
  result := False;
  Send_MsgNo:= 0;
  Rcv_MsgNo:='0';
  ComBuff:= '';
  with SerialModule.WinsockPort do
  begin
    SerialModule.ApdSLController1.Monitoring:= False;
    bConnected := False;
    OPen:= False;
    
    DeviceLayer:= dlWin32;
    Baud:= 38400;
    ComNumber := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex]);
    try
      SerialModule.ApdSLController1.Monitoring:= True;
      OPen:= True;
    except
      ShowMessage('통신포트 를 확인하세요');
      Exit;
    end;
    Delay(100);

  end;
  result := True;
end;


procedure TfmDeviceCode.FormShow(Sender: TObject);
begin
  Send_MsgNo:= 0;
end;

procedure TfmDeviceCode.CommNodeSend(Sender: TObject; SendData: string;
  NodeNO: integer);
begin
  with sg_Event do
  begin
    if rowCount > MAX_LISTCOUNT  then
    begin
      rowCount := MAX_LISTCOUNT;
    end;
    if Cells[0,1] <> '' then InsertRows(1,1);
    Cells[0,1] := '[TX]';
    Cells[1,1] := Dec2Hex(Ord(copy(SendData,2,1)[1]),2);
    Cells[2,1] := Dec2Hex(Ord(copy(SendData,3,1)[1]),2);
    Cells[3,1] := Dec2Hex(Ord(copy(SendData,4,1)[1]),2);
    Cells[4,1] := Dec2Hex(Ord(copy(SendData,5,1)[1]),2);
    Cells[5,1] := copy(SendData,6,strtoint(Cells[4,1]));

  end;
end;

procedure TfmDeviceCode.CommNodeReceve(Sender: TObject;
  ReceiveData: string; NodeNO: integer);
var
  cTemp:Char;
  stEcuID : string;
begin
  cTemp := ReceiveData[2];
  stEcuID := Dec2Hex(Ord(cTemp),2);
  if stEcuID = STARTREADER then  bEnQRecv := True;

  with sg_Event do
  begin
    if rowCount > MAX_LISTCOUNT  then
    begin
      rowCount := MAX_LISTCOUNT;
    end;
    if Cells[0,1] <> '' then InsertRows(1,1);
    Cells[0,1] := '[RX]';
    Cells[1,1] := Dec2Hex(Ord(copy(ReceiveData,2,1)[1]),2);
    Cells[2,1] := Dec2Hex(Ord(copy(ReceiveData,3,1)[1]),2);
    Cells[3,1] := Dec2Hex(Ord(copy(ReceiveData,4,1)[1]),2);
    Cells[4,1] := Dec2Hex(Ord(copy(ReceiveData,5,1)[1]),2);
    Cells[5,1] := copy(ReceiveData,6,strtoint(Cells[4,1]));

  end;
end;

end.
