unit uCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids;

type
  TfmCurrentState = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    btn_stop: TSpeedButton;
    RadioGroup1: TRadioGroup;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    ed_cmd: TEdit;
    btn_FileSave: TSpeedButton;
    SaveDialog1: TSaveDialog;
    sg_Event: TAdvStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGrideResize(Gride:TStringGrid);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure sg_EventResize(Sender: TObject);
  private
    { Private declarations }
    bClear : Boolean;
    bStart : Boolean;

    procedure DisplayStringGrid(aRxTx,aECUID,aMsgNo,aCMD,aLength,aData:string;StringGrid:TStringGrid);
    
  public
    { Public declarations }
  end;

var
  fmCurrentState: TfmCurrentState;

implementation
uses uDataModule1;
{$R *.dfm}



procedure TfmCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'CURRENTSTATE';

end;

procedure TfmCurrentState.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stRxTx: string;
  stECUID : string;
  stMsgNo : string;
  stCMD : string;
  stLength : string;
  stData : string;
begin
  stRxTx := Params.Values['RXTX'];
  stECUID := Params.Values['ECUID'];
  stMsgNo := Params.Values['MSGNO'];
  stCMD := Params.Values['CMD'];
  stLength := Params.Values['LENGTH'];
  stData := Params.Values['DATA'];

  DisplayStringGrid(stRxTx,stECUID,stMsgNo,stCMD,stLength,stData,sg_Event);


end;

procedure TfmCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Params.Values['상태'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Execute;
  Action := caFree;

end;

procedure TfmCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Params.Values['상태'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('CURRENTSTATE').Execute;

  StringGrideResize(sg_Event);
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
    ColCount := 8;

    nTotWidth := Width - 20;

    ColWidths[0] := 200;
    ColWidths[1] := 100;
    ColWidths[2] := 50;
    ColWidths[3] := 50;
    ColWidths[4] := 50;
    ColWidths[5] := 100;
    ColWidths[6] := 100;
    ColWidths[7] := nTotWidth - 650;

  end;
end;

procedure TfmCurrentState.StringGrideDrawCell(Sender: TObject; ACol,
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

  end;
end;

procedure TfmCurrentState.FormActivate(Sender: TObject);
begin
  sg_Event.OnDrawCell:=StringGrideDrawCell;
end;

procedure TfmCurrentState.btn_ClearClick(Sender: TObject);
var
  i:integer;
begin
  bClear := True;
  GridInitialize(sg_Event);


end;

procedure TfmCurrentState.DisplayStringGrid(aRxTx,aECUID,aMsgNo,aCMD,aLength,aData: string;StringGrid:TStringGrid);
begin
  if Not bStart then Exit;

  //여기에서 화면에 뿌려주자.
  with StringGrid as TAdvStringGrid do
  begin
    if RadioGroup1.ItemIndex = 1 then  //명령어별 조회
    begin
      if Pos(aCmd, ed_cmd.Text) = 0 then Exit;
    end;
    if RowCount > MAX_LISTCOUNT then  rowCount := MAX_LISTCOUNT;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;
    Cells[0,1] := FormatDateTime('yyyy-mm-dd HH:MM:SS',Now);
    Cells[1,1] := aRxTx;
    Cells[2,1] := aECUID;
    Cells[3,1] := aMsgNo;
    Cells[4,1] := aCMD;
    Cells[5,1] := aLength;
    Cells[6,1] := aData;

    if aRxTx = '[RX]' then RowColor[1] := clYellow;

  end;
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
    sg_Event.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmCurrentState.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 1 then ed_cmd.Visible := True
  else ed_cmd.Visible := False;
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

procedure TfmCurrentState.sg_EventResize(Sender: TObject);
begin
  StringGrideResize(sg_Event);

end;

initialization
  RegisterClass(TfmCurrentState);
Finalization
  UnRegisterClass(TfmCurrentState);

end.
