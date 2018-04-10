unit uZoneStateReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, DB, ADODB, Gauges, ExtCtrls,iniFiles,ComObj, AdvObj;

type
  TfmZoneStateReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_report: TAdvStringGrid;
    AdoQuery: TADOQuery;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    lb_state: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sg_reportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
    procedure FormResize(Sender: TObject);
    procedure sg_reportCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_SearchClick(Sender: TObject);
    procedure CommandArrayCommandsTREMOTEExecute(Command: TCommand;
      Params: TStringList);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    L_bPortState : Boolean;
    L_stPortStateDeviceID : string;
    CheckCount : integer;
    ZoneStateNameList : TStringList;
    ZoneStateCodeList : TStringList;
    procedure HeaderNameSetting;
    procedure SearchDeviceInfo;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure PortStateCheck(aNodeNo,aEcuID:string);
    function EcuPortState_Check(aDeviceID:string):Boolean;
    function ZoneExtendPortState_Check(aDeviceID:string):Boolean;
    procedure ZoneStateCodeLoad;
  public
    { Public declarations }
  end;

var
  fmZoneStateReport: TfmZoneStateReport;

implementation

uses
  uMonitoringCommonVariable,
  uDataModule1,
  uExcelSave,
  uLomosUtil,
  uDeviceState;
  
{$R *.dfm}
procedure TfmZoneStateReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmZoneStateReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ZONESTATEREPORT';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  ZoneStateNameList.Free;
  ZoneStateCodeList.Free;

  Action := caFree;

end;


procedure TfmZoneStateReport.sg_reportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_report.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmZoneStateReport.FormShow(Sender: TObject);
begin
  inherited;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ZONESTATEREPORT';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  HeaderNameSetting;
  CheckCount := 0;
  SearchDeviceInfo;
end;

procedure TfmZoneStateReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

procedure TfmZoneStateReport.FormResize(Sender: TObject);
begin
  inherited;
  btn_Close.Left := width - btn_Close.Width - 50;
  btn_Search.Left := btn_Close.left - btn_Search.Width - 20;
end;

procedure TfmZoneStateReport.HeaderNameSetting;
var
  i,j : integer;
begin
  with sg_report do
  begin
    for i := 0 to 8 do
    begin
      for j:=1 to 8 do
      begin
        cells[4 + i * 8 + j - 1,0] := FillZeroNumber(i,2) + '-' + inttostr(j);
      end;
    end;
  end;
end;

procedure TfmZoneStateReport.SearchDeviceInfo;
var
  stSql : string;
  nRow : integer;
begin
  GridInitialize(sg_report,2,True);

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.AC_DEVICENAME,a.AC_VER,b.ac_mcuip as NodeIP ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join (select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where ac_gubun = ''0'') b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ) ';


  with AdoQuery do
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
      showmessage('기기내역이 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_report.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_report  do
      begin
        cells[0,nRow] := ' ' + FindField('NodeIP').AsString;
        cells[1,nRow] := inttostr(FindField('AC_NodeNo').AsInteger);
        cells[2,nRow] := FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('AC_DEVICENAME').AsString;
        AddCheckBox(0,nRow,False,False);
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmZoneStateReport.sg_reportCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmZoneStateReport.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmZoneStateReport.btn_SearchClick(Sender: TObject);
var
  i,j : integer;
  bchkState : Boolean;
  nCount : integer;
begin
  inherited;
  if CheckCount < 1 then
  begin
    showmessage('조회 할 기기를 선택하여 주세요.');
    Exit;
  end;
  pan_gauge.Visible := True;
  Try
    Gauge1.MaxValue := CheckCount;
    Gauge1.Progress := 0;

    for i := 1 to sg_report.RowCount - 1 do   //체크되어 있는 컨트롤러를 모두 확인하자.
    begin
      for j:= 4  to sg_report.Colcount - 1 do
      begin
        sg_report.Cells[j,i] := '';
        sg_report.ColorsTo[j,i] := clWhite
      end;
      sg_report.GetCheckBoxState(0,i, bchkState);
      if bchkState then  //체크 되어 있으면 존상태 체크
      begin
        inc(nCount);
        //StatusBar1.Panels[0].Text := inttostr(nCount) + '/' + inttostr(CheckCount);
        Gauge1.Progress := nCount;

        Label1.Caption := sg_report.cells[3,i] + ' 기기의 존 상태를 체크 중입니다.';
        PortStateCheck(sg_report.cells[1,i],sg_report.cells[2,i]);
        //Label1.Caption := sg_report.cells[3,i] + ' 기기의 존확장기 존 상태 체크중입니다.';
        //ZoneExtentionPortStateCheck(sg_report.cells[1,i],sg_report.cells[2,i]);

        Application.ProcessMessages;
      end;
    end;
  Finally
    pan_gauge.Visible := False;
  End;
end;

procedure TfmZoneStateReport.PortStateCheck(aNodeNo, aEcuID: string);
var
  i : integer;
  stDeviceID : string;
  nDeviceIndex : integer;
  bResult : Boolean;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
  if(nDeviceIndex < 0) then Exit;
  if Not TDeviceState(DeviceStateList.Objects[nDeviceIndex]).Connected then Exit; //연결 되지 않은 컨트롤러는 상태 체크하지 말자.

  Try
    bResult := False;
    for i := 1 to 3 do
    begin
      if G_bApplicationTerminate then Exit;
      lb_state.Caption := '존 상태 체크중입니다.(' + inttostr(i) + '/3)';
      bResult := EcuPortState_Check(stDeviceID);
      if bResult then Break;
    end;

    if Not bResult then Exit;
    bResult := False;
    for i := 1 to 3 do
    begin
      if G_bApplicationTerminate then Exit;
      lb_state.Caption := '존 확장기 상태 체크중입니다.(' + inttostr(i) + '/3)';
      bResult := ZoneExtendPortState_Check(stDeviceID);
      if bResult then Break;
    end;

  Finally
  End;

end;

function TfmZoneStateReport.EcuPortState_Check(aDeviceID: string): Boolean;
var
  stData : string;
  FirstTickCount : double;
begin
  Result := false;
  //stData := 'SM10';
  L_stPortStateDeviceID := aDeviceID;
  L_bPortState := False;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'PORTSTATE'+ DATADELIMITER + aDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  FirstTickCount := GetTickCount + 1000;
  While Not L_bPortState do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bPortState;

end;

function TfmZoneStateReport.ZoneExtendPortState_Check(
  aDeviceID: string): Boolean;
var
  stData : string;
  FirstTickCount : double;
begin
  Result := false;
  L_stPortStateDeviceID := aDeviceID;
  L_bPortState := False;
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ZEPORTSTATE'+ DATADELIMITER + aDeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
  FirstTickCount := GetTickCount + 1000;
  While Not L_bPortState do
  begin
    Application.ProcessMessages;
    if GetTickCount > FirstTickCount then Break;
  end;
  result := L_bPortState;

end;

procedure TfmZoneStateReport.CommandArrayCommandsTREMOTEExecute(
  Command: TCommand; Params: TStringList);
var
  stDeviceID : string;
  stData : string;
  cCmd : char;
  stCode : string;
  stGubun : string;
  stRealData : string;
  stZoneState : string;
  stZoneStateName : string;
  i,j,nRow : integer;
  nIndex : integer;
begin
  inherited;
  stDeviceID := Params.Values['DEVICEID'];
  stData := Params.Values['DATA'];
  nRow := 0;
  with sg_report do
  begin
    for i:= 1 to RowCount - 1 do
    begin
      if FillZeroStrNum(Cells[1,i],3) + Cells[2,i] = stDeviceID then
      begin
        nRow := i;
        break;
      end;
    end;
  end;
  if nRow = 0 then Exit;

  stRealData := Copy(stData,7 + 12,Length(stData)-(7 + 13));
  cCmd:= stData[17];
  if cCmd <> 'r' then Exit; //원격 설정이 아닌 경우 빠져 나가자.
  stCode:= Copy(stRealData,1,2);
  stGubun := Copy(stRealData,3,2);
  stData := copy(stRealData,5,Length(stRealData) - 4);

  if stCode = 'SM' then
  begin
    if stGubun = '10' then
    begin
      L_bPortState := True;
      stZoneState := copy(stData,2,8);
      for i := 1 to 8 do
      begin
        if i <= Length(stZoneState) then
        begin
          stZoneStateName := '';

          nIndex := ZoneStateCodeList.IndexOf(stZoneState[i]);
          if nIndex > -1 then
            stZoneStateName := ZoneStateNameList.Strings[nIndex];
          sg_report.Cells[3+i,nRow] := stZoneStateName;
          if stZoneState[j] = 'N' then sg_report.ColorsTo[3+i,nRow] := clGreen
          else if UpperCase(stZoneState[j]) = 'U' then sg_report.ColorsTo[3+i,nRow] := clWhite
          else sg_report.ColorsTo[3+i,nRow] := clRed;
        end;
      end;
    end else if stGubun = '11' then
    begin
      L_bPortState := True;
      Delete(stData,1,1); //Dummy Flag 삭제
      for i := 1 to 8 do //존확장기 갯수만큼
      begin
        stZoneState := copy(stData,(i - 1) * (8 + 1) + 1,8 + 1);

        for j := 1 to 8 do
        begin
          if j <= Length(stZoneState) then
          begin
            stZoneStateName := '';

            nIndex := ZoneStateCodeList.IndexOf(stZoneState[j]);
            if nIndex > -1 then
              stZoneStateName := ZoneStateNameList.Strings[nIndex]
            else stZoneStateName := stZoneState[j];

            sg_report.Cells[3+(i*8)+j,nRow] := stZoneStateName;
            if stZoneState[j] = 'N' then sg_report.ColorsTo[3+(i*8)+j,nRow] := clGreen
            else if UpperCase(stZoneState[j]) = 'U' then sg_report.ColorsTo[3+(i*8)+j,nRow] := clWhite
            else sg_report.ColorsTo[3+(i*8)+j,nRow] := clRed;
          end;
        end;

      end;


    end;
  end;

end;

procedure TfmZoneStateReport.ZoneStateCodeLoad;
begin
  if ZoneStateNameList = nil then
    ZoneStateNameList := TStringList.Create;
  if ZoneStateCodeList = nil then
    ZoneStateCodeList := TStringList.Create;
  ZoneStateNameList.Clear;
  ZoneStateNameList.Add('단선');
  ZoneStateNameList.Add('정상');
  ZoneStateNameList.Add('쇼트');
  ZoneStateNameList.Add('통신단선');
  ZoneStateNameList.Add('불량');
  ZoneStateNameList.Add('미등록');

  ZoneStateCodeList.Clear;
  ZoneStateCodeList.Add('P');
  ZoneStateCodeList.Add('N');
  ZoneStateCodeList.Add('S');
  ZoneStateCodeList.Add('?');
  ZoneStateCodeList.Add('*');
  ZoneStateCodeList.Add('u');

end;

procedure TfmZoneStateReport.FormCreate(Sender: TObject);
begin
  inherited;
  ZoneStateCodeLoad;
end;

initialization
  RegisterClass(TfmZoneStateReport);
Finalization
  UnRegisterClass(TfmZoneStateReport);

end.
