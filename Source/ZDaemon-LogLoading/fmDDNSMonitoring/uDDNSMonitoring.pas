unit uDDNSMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd;

type
  TfmDDNSMonitoring = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SearchTimer: TTimer;
    rg_kttGubun: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGrideResize(Gride:TStringGrid);
    procedure AdvStringGrid1Resize(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure SearchTimerTimer(Sender: TObject);
    procedure mn_memoryClearClick(Sender: TObject);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    bClear : Boolean;
    bStart : Boolean;


  public
    { Public declarations }
    procedure DisplayStringGrid(aGubun, aIP,aData,aTemp: string);
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
  end;

var
  fmDDNSMonitoring: TfmDDNSMonitoring;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uServerDaemon,
  uKTTDDNS;
{$R *.dfm}



procedure TfmDDNSMonitoring.FormCreate(Sender: TObject);
begin

  DisplayList := TStringList.Create;

  SearchTimer.Enabled := True;

end;

procedure TfmDDNSMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stCmd : string;
  stData : string;
  stTxRx : string;
  stIP : string;
  stECUID : string;
  stNodeNO : string;
begin
  stCmd := Params.Values['Cmd'];
  stData := Params.Values['Data'];
  stTxRx := Params.Values['TxRx'];
  stIP := Params.Values['IP'];
  stECUID := Params.Values['ECUID'];
  stNodeNO := Params.Values['NODENO'];

  //DisplayStringGrid(stCmd,stTxRx,stIP,stECUID,stData,strtoint(stNodeNO));


end;

procedure TfmDDNSMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('DDNSMINITORING').Params.Values['상태'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('DDNSMINITORING').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
  SearchTimer.Free;
end;

procedure TfmDDNSMonitoring.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('DDNSMINITORING').Params.Values['상태'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('DDNSMINITORING').Execute;

  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);

end;

procedure TfmDDNSMonitoring.StringGrideResize(Gride:TStringGrid);
var
  nTotWidth,nColCnt,nColWidth : integer;
  i : integer;
begin
  with Gride do
  begin
    ColCount := 5;

    nTotWidth := Width - 20;

    ColWidths[0] := 150;
    ColWidths[1] := 150;
    ColWidths[2] := 150;
    ColWidths[3] := nTotWidth - 370;
    ColWidths[4] := 0;

  end;
end;

procedure TfmDDNSMonitoring.AdvStringGrid1Resize(Sender: TObject);
begin
  StringGrideResize(AdvStringGrid1);
end;

procedure TfmDDNSMonitoring.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
{  if (AROW < (Sender as TStringGrid).FixedRows) then
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
  End
  else if Acol <> 5 then
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

  end;  }
end;

procedure TfmDDNSMonitoring.FormActivate(Sender: TObject);
begin
  AdvStringGrid1.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmDDNSMonitoring.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);


end;

procedure TfmDDNSMonitoring.DisplayStringGrid(aGubun, aIP,aData,aTemp: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aGubun + ',';
  stDisplay := stDisplay + aIP + ',';
  stDisplay := stDisplay + aData + ',';
  stDisplay := stDisplay + aTemp + ',';
  DisplayList.Add(stDisplay);
  Exit;
{
  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RadioGroup1.ItemIndex = 1 then  //ip 체크
    begin
      if aIP <> Trim(ed_IP.Text) then Exit;
    end else if RadioGroup1.ItemIndex = 2 then
    begin
      if aIP <> Trim(ed_IP.Text) then Exit;
      if aECUID <> Trim(ed_ECUID.Text) then Exit;
    end else if RadioGroup1.ItemIndex = 3 then
    begin
      if Pos(aCmd, ed_cmd.Text) = 0 then Exit;
    end;
    if RowCount >= 100 then  rowCount := 99;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] := '[' + aTxRx + ']';
    Cells[2,1] :=  aCmd ;
    Cells[3,1] :=  aIP ;
    Cells[4,1] :=  aECUID ;
    Cells[5,1] :=  aData ;
    if aTxRx = 'Er' then RowColor[1] := clYellow;

  end;   }
end;

procedure TfmDDNSMonitoring.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='실시간 송수신 현황조회(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    AdvStringGrid1.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmDDNSMonitoring.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmDDNSMonitoring.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmDDNSMonitoring.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmDDNSMonitoring.CloseForm;
begin
  Close;
end;

procedure TfmDDNSMonitoring.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := True;
end;

procedure TfmDDNSMonitoring.BatchDisplay(aData:string);
var
  stGubun : string;
  stIP : string;
  stData : string;
  stTemp : string;
  nPos : integer;
begin
  nPos := PosIndex(',',aData,1);
  stGubun := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(',',aData,1);
  stIP := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(',',aData,1);
  stData := copy(aData,1,nPos - 1);

{  aCmd := FindCharCopy(aData,0,';');
  stDisplay := stDisplay + aTxRx + ';';
  stDisplay := stDisplay + aIP + ';';
  stDisplay := stDisplay + aECUID + ';';
  stDisplay := stDisplay + aData; }

  if rg_kttGubun.ItemIndex = 1 then
  begin
    if (stGubun = 'QRx') or (stGubun = 'QTx') then
    begin
    end else
    begin
      Exit;
    end;
  end else if rg_kttGubun.ItemIndex = 2 then
  begin
    if (stGubun = 'RRx') or (stGubun = 'RTx') then
    begin
    end else
    begin
      Exit;
    end;
  end;

  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RowCount >= 1000 then  rowCount := 999;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
    Cells[1,1] := '[' + stGubun + ']';
    Cells[2,1] :=  stIP ;
    Cells[3,1] :=  stData ;
    Cells[4,1] :=  stTemp ;
    //if (stGubun = 'pRx') or (stGubun = 'pTx') or (stGubun = 'PAM') then
    if (stGubun = 'RRx') or (stGubun = 'RTx') then
    begin
      RowColor[1] := $00FFFFCC;
    end;

  end;
end;

//충대 프로젝트에서 ICU-200 도어상태 올라 오는것 처리용
procedure TfmDDNSMonitoring.mn_memoryClearClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  with AdvStringGrid1 do
  begin
    stNodeNo := Cells[6,Row];
    stEcuID := Cells[4,Row];

    if stEcuID = '00' then
    begin
      showmessage('메인컨트롤러는 메모리 지움 할수 없습니다.');
      Exit;
    end;
    fmMain.Control_MemoryClear(stNodeNo,stEcuID);
  end;
end;

//충대 프로젝트에서 ICU-200 도어상태 올라 오는것 처리용
procedure TfmDDNSMonitoring.mn_DoorOpenClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stSendData : string;
begin
  with AdvStringGrid1 do
  begin
    stNodeNo := Cells[6,Row];
    stEcuID := Cells[4,Row];

    if stEcuID = '00' then
    begin
      showmessage('메인컨트롤러는 개방모드 변경 할 수 없습니다.');
      Exit;
    end;
    stSendData := FillZeronumber(strtoint(stNodeNo),3) + stEcuID + '1';
    fmMain.Control_DoorModeChange(stSendData,'1');
    stSendData := FillZeronumber(strtoint(stNodeNo),3) + stEcuID + '2';
    fmMain.Control_DoorModeChange(stSendData,'1');
  end;
end;

procedure TfmDDNSMonitoring.AdvStringGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    with Sender as TAdvStringGrid do
    begin
      st:= Cells[col,Row];
      if st <> '' then ClipBoard.SetTextBuf(PChar(st));
    end;
  end;

end;

procedure TfmDDNSMonitoring.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmKTTDDNS.MYIP := '192.168.0.109';
end;

initialization
  RegisterClass(TfmDDNSMonitoring);
Finalization
  UnRegisterClass(TfmDDNSMonitoring);

end.
