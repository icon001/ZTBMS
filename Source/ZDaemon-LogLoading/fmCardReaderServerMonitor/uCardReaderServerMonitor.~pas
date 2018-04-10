unit uCardReaderServerMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, StdCtrls, ExtCtrls, Grids, BaseGrid,
  AdvGrid, Buttons, AdvPanel;

type
  TfmCardReaderServerMonitor = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    AdvStringGrid1: TAdvStringGrid;
    rg_Type: TRadioGroup;
    ed_RelayNo: TEdit;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure AdvStringGrid1Resize(Sender: TObject);
    procedure rg_TypeClick(Sender: TObject);
  private
    bClear : Boolean;
    bStart : Boolean;
    { Private declarations }
    procedure DisplayStringGrid(aIP,aRelayNo,aCardData,aData:string);
    procedure StringGrideResize(Gride:TStringGrid);
  public
    { Public declarations }
  end;

var
  fmCardReaderServerMonitor: TfmCardReaderServerMonitor;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmCardReaderServerMonitor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('CARDSERVERSERVER').Params.Values['STATE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('CARDSERVERSERVER').Execute;
  Action := caFree;
end;

procedure TfmCardReaderServerMonitor.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('CARDSERVERSERVER').Params.Values['STATE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('CARDSERVERSERVER').Execute;

  StringGrideResize(AdvStringGrid1);
  btn_ClearClick(Self);
  btn_StartClick(Self);
end;

procedure TfmCardReaderServerMonitor.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stData : string;
  stIP : string;
  stRelayNo : string;
  stCardData : string;
  nLength : integer;
begin
  stIP := Params.Values['IP'];
  stData := Params.Values['Data'];
  stRelayNo := copy(stData,2,4);
  stRelayNo := inttostr(strtoint(stRelayNo));
  nLength := strtoint(copy(stData,6,2));
  stCardData := copy(stData,8,nLength);
  if rg_Type.ItemIndex = 1 then
  begin
    if Not IsDigit(Trim(ed_RelayNo.Text)) then Exit;
    if strtoint(Trim(ed_RelayNo.Text)) <> strtoint(stRelayNo) then Exit;
  end;
  DisplayStringGrid(stIP,stRelayNo,stCardData,stData);

end;

procedure TfmCardReaderServerMonitor.DisplayStringGrid(aIP, aRelayNo,
  aCardData, aData: string);
begin
  if Not bStart then Exit;

  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RowCount >= 100 then  rowCount := 99;

    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] :=  aIP;
    Cells[2,1] :=  aRelayNo ;
    Cells[3,1] :=  aCardData ;
    Cells[4,1] :=  aData ;

  end;
end;

procedure TfmCardReaderServerMonitor.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmCardReaderServerMonitor.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;
end;

procedure TfmCardReaderServerMonitor.btn_ClearClick(Sender: TObject);
begin
  bClear := True;
  GridInitialize(AdvStringGrid1);
end;

procedure TfmCardReaderServerMonitor.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='카드서버 수신 현황조회(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    AdvStringGrid1.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmCardReaderServerMonitor.StringGrideResize(Gride: TStringGrid);
var
  nTotWidth,nColCnt,nColWidth : integer;
  i : integer;
begin
  with Gride do
  begin
    ColCount := 5;

    nTotWidth := Width - 20;

    ColWidths[0] := 120;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := 100;
    ColWidths[4] := nTotWidth - 420;

  end;
end;

procedure TfmCardReaderServerMonitor.AdvStringGrid1Resize(Sender: TObject);
begin
  StringGrideResize(AdvStringGrid1);

end;

procedure TfmCardReaderServerMonitor.rg_TypeClick(Sender: TObject);
begin
  if rg_Type.ItemIndex = 0 then
  begin
    ed_RelayNo.Text := '';
    ed_RelayNo.Visible := False;
  end else
  begin
    ed_RelayNo.Visible := True;
  end;

end;

initialization
  RegisterClass(TfmCardReaderServerMonitor);
Finalization
  UnRegisterClass(TfmCardReaderServerMonitor);

end.
