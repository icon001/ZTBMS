unit uCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, AdvObj;

type
  TfmCurrentState = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_stop: TSpeedButton;
    RadioGroup1: TRadioGroup;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    ed_cmd: TEdit;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    GroupBox1: TGroupBox;
    IP: TLabel;
    ed_ip: TEdit;
    lb_ECUID: TLabel;
    ed_ecuid: TEdit;
    SearchTimer: TTimer;
    PopupMenu1: TPopupMenu;
    mn_DoorOpen: TMenuItem;
    ed_subcmd: TEdit;
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
    procedure RadioGroup1Click(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure SearchTimerTimer(Sender: TObject);
    procedure mn_memoryClearClick(Sender: TObject);
    procedure mn_DoorOpenClick(Sender: TObject);
    procedure AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    DisplayList : TStringList;
    bClear : Boolean;
    bStart : Boolean;


  public
    { Public declarations }
    procedure DisplayStringGrid(aCmd,aTxRx,aIP,aECUID,aData:string;aNodeno:integer);
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
  end;

var
  fmCurrentState: TfmCurrentState;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uServerDaemon;
{$R *.dfm}



procedure TfmCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'CURRENTSTATE';

  DisplayList := TStringList.Create;

  SearchTimer.Enabled := True;

end;

procedure TfmCurrentState.CommandArrayCommandsTCommand0Execute(
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

  DisplayStringGrid(stCmd,stTxRx,stIP,stECUID,stData,strtoint(stNodeNO));


end;

procedure TfmCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Params.Values['상태'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
  SearchTimer.Free;
end;

procedure TfmCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Params.Values['상태'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Execute;

  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);

end;

procedure TfmCurrentState.StringGrideResize(Gride:TStringGrid);
var
  nTotWidth,nColCnt,nColWidth : integer;
  i : integer;
begin
  with Gride do
  begin
    ColCount := 7;

    nTotWidth := Width - 20;

    ColWidths[0] := 100;
    ColWidths[1] := 50;
    ColWidths[2] := 50;
    ColWidths[3] := 100;
    ColWidths[4] := 50;
    ColWidths[5] := nTotWidth - 370;
    ColWidths[6] := 0;

  end;
end;

procedure TfmCurrentState.AdvStringGrid1Resize(Sender: TObject);
begin
  StringGrideResize(AdvStringGrid1);
end;

procedure TfmCurrentState.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmCurrentState.FormActivate(Sender: TObject);
begin
  AdvStringGrid1.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmCurrentState.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);


end;

procedure TfmCurrentState.DisplayStringGrid(aCmd, aTxRx,aIP,aECUID, aData: string;aNodeno:integer);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aCmd + ';';
  stDisplay := stDisplay + aTxRx + ';';
  stDisplay := stDisplay + aIP + ';';
  stDisplay := stDisplay + aECUID + ';';
  stDisplay := stDisplay + aData + ';';
  stDisplay := stDisplay + inttostr(aNodeno) ;
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

procedure TfmCurrentState.btn_FileSaveClick(Sender: TObject);
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

procedure TfmCurrentState.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 3 then
  begin
    ed_cmd.Visible := True;
    ed_subcmd.Visible := True;
  end else
  begin
    ed_cmd.Visible := False;
    ed_subcmd.Visible := False;
  end;
  
  if (RadioGroup1.ItemIndex = 1) or (RadioGroup1.ItemIndex = 2) then
  begin
     AdvPanel1.Height := 89;
     GroupBox1.Visible := True;
     if RadioGroup1.ItemIndex = 1 then
     begin
      lb_ECUID.Visible := False;
      ed_ECUID.Visible := False;
     end else
     begin
      lb_ECUID.Visible := True;
      ed_ECUID.Visible := True;
     end;
  end
  else
  begin
    AdvPanel1.Height := 65;
    GroupBox1.Visible := False;
  end;
end;

procedure TfmCurrentState.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmCurrentState.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmCurrentState.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := True;
end;

procedure TfmCurrentState.BatchDisplay(aData:string);
var
  aCmd : string;
  aTxRx : string;
  aIP : string;
  aECUID : string;
  stData : string;
  stNodeNo : string;
  nPos : integer;
  stSubCmd : string;
begin
  nPos := PosIndex(';',aData,1);
  aCmd := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  aTxRx := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  aIP := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  aECUID := copy(aData,1,nPos - 1);
  Delete(aData,1,nPos);
  nPos := PosIndex(';',aData,1);
  stData := copy(aData,1,nPos - 1);
  stSubCmd := stData[19];
  Delete(aData,1,nPos);
  stNodeNo := aData;

{  aCmd := FindCharCopy(aData,0,';');
  stDisplay := stDisplay + aTxRx + ';';
  stDisplay := stDisplay + aIP + ';';
  stDisplay := stDisplay + aECUID + ';';
  stDisplay := stDisplay + aData; }

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
      if ed_subcmd.Text <> '' then
      begin
        if Pos(stSubCmd, ed_subcmd.Text) = 0 then Exit;
      end;
    end;
    if RowCount >= 1000 then  rowCount := 999;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] := '[' + aTxRx + ']';
    Cells[2,1] :=  aCmd ;
    Cells[3,1] :=  aIP ;
    Cells[4,1] :=  aECUID ;
    Cells[5,1] :=  stData ;
    Cells[6,1] :=  stNodeNo ;
    if aTxRx = 'Rx' then
    begin
      RowColor[1] := $00EACAB6;
    end;
    if aTxRx = 'Er' then RowColor[1] := clYellow;

  end;
end;

//충대 프로젝트에서 ICU-200 도어상태 올라 오는것 처리용
procedure TfmCurrentState.mn_memoryClearClick(Sender: TObject);
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
procedure TfmCurrentState.mn_DoorOpenClick(Sender: TObject);
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

procedure TfmCurrentState.AdvStringGrid1KeyDown(Sender: TObject;
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

initialization
  RegisterClass(TfmCurrentState);
Finalization
  UnRegisterClass(TfmCurrentState);

end.
