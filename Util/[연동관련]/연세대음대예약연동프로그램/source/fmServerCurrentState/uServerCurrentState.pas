unit uServerCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd;

type
  TfmServerCurrentState = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    SearchTimer: TTimer;
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
    procedure AdvStringGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    DisplayList : TStringList;
    bClear : Boolean;
    bStart : Boolean;


  public
    { Public declarations }
    procedure DisplayStringGrid(aCmd,aTxRx,aIP,aECUID,aData:string);
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
  end;

var
  fmServerCurrentState: TfmServerCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable;
{$R *.dfm}



procedure TfmServerCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'CURRENTSTATE';

  DisplayList := TStringList.Create;

  SearchTimer.Enabled := True;

end;

procedure TfmServerCurrentState.CommandArrayCommandsTCommand0Execute(
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

  DisplayStringGrid(stCmd,stTxRx,stIP,stECUID,stData);


end;

procedure TfmServerCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('SERVERCURRENTSTATE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('SERVERCURRENTSTATE').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
  SearchTimer.Free;
end;

procedure TfmServerCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('SERVERCURRENTSTATE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('SERVERCURRENTSTATE').Execute;

  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);

end;

procedure TfmServerCurrentState.StringGrideResize(Gride:TStringGrid);
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

procedure TfmServerCurrentState.AdvStringGrid1Resize(Sender: TObject);
begin
  StringGrideResize(AdvStringGrid1);
end;

procedure TfmServerCurrentState.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmServerCurrentState.FormActivate(Sender: TObject);
begin
  AdvStringGrid1.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmServerCurrentState.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);


end;

procedure TfmServerCurrentState.DisplayStringGrid(aCmd, aTxRx,aIP,aECUID, aData: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := aCmd + ';';
  stDisplay := stDisplay + aTxRx + ';';
  stDisplay := stDisplay + aIP + ';';
  stDisplay := stDisplay + aECUID + ';';
  stDisplay := stDisplay + aData ;
  DisplayList.Add(stDisplay);
  Exit;

end;

procedure TfmServerCurrentState.btn_FileSaveClick(Sender: TObject);
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

procedure TfmServerCurrentState.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmServerCurrentState.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmServerCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmServerCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmServerCurrentState.SearchTimerTimer(Sender: TObject);
begin
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := True;
end;

procedure TfmServerCurrentState.BatchDisplay(aData:string);
var
  aCmd : string;
  aTxRx : string;
  aIP : string;
  aECUID : string;
  stData : string;
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
  stData := aData;
  stSubCmd := stData[19];


  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin

    if RowCount >= 1000 then  rowCount := 999;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] := '[' + aTxRx + ']';
    Cells[2,1] :=  aCmd ;
    Cells[3,1] :=  aIP ;
    Cells[4,1] :=  aECUID ;
    Cells[5,1] :=  stData ;
    if UpperCase(aTxRx) = 'RX' then
    begin
      RowColor[1] := $00EACAB6;
    end;
    if aTxRx = 'Er' then RowColor[1] := clYellow;

  end;
end;

procedure TfmServerCurrentState.AdvStringGrid1KeyDown(Sender: TObject;
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
  RegisterClass(TfmServerCurrentState);
Finalization
  UnRegisterClass(TfmServerCurrentState);

end.
