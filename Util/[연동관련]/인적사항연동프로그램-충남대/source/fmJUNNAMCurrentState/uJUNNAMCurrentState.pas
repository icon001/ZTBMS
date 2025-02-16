unit uJUNNAMCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmJUNNAMCurrentState = class(TfmASubForm)
    AdvPanel2: TAdvPanel;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    AdvStringGrid1: TAdvStringGrid;
    SearchTimer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CloseClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    L_bClose : Boolean;
  public
    { Public declarations }
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
    procedure RelayAdoEvent(aSql:string);
    procedure JunnamEventState(aGubun,aJijumCode,aEmCode,aEmCophone,aEmName,aDepartName,
                               aCardSeq,aRegState,aEmState,aUpdateTime,aResult:string);
  end;

var
  fmJUNNAMCurrentState: TfmJUNNAMCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmJUNNAMCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'JUNNAMSTATE';

  DisplayList := TStringList.Create;

end;

procedure TfmJUNNAMCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('JUNNAMState').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('JUNNAMState').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmJUNNAMCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('JUNNAMState').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('JUNNAMState').Execute;

end;

procedure TfmJUNNAMCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmJUNNAMCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmJUNNAMCurrentState.BatchDisplay(aData:string);
var
  nPos : integer;
begin

  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    nPos := PosIndex(';',aData,1);
    Cells[0,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[1,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[2,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[3,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[4,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[5,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[6,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[7,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[8,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[9,1] := copy(aData,1,nPos - 1);
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[10,1] := copy(aData,1,nPos - 1);
    if Cells[10,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

procedure TfmJUNNAMCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfmJUNNAMCurrentState.RelayAdoEvent(aSql: string);
begin
end;

procedure TfmJUNNAMCurrentState.JunnamEventState(aGubun, aJijumCode,
  aEmCode, aEmCophone, aEmName, aDepartName, aCardSeq, aRegState, aEmState,
  aUpdateTime,aResult: string);
var
  stDisplay : string;
begin
  stDisplay := aUpdateTime  + ';';
  stDisplay := stDisplay + aGubun + ';';
  stDisplay := stDisplay + aJijumCode + ';';
  stDisplay := stDisplay + aEmCode + ';';
  stDisplay := stDisplay + aEmCophone + ';';
  stDisplay := stDisplay + aEmName + ';';
  stDisplay := stDisplay + aDepartName + ';';
  stDisplay := stDisplay + aCardSeq + ';';
  stDisplay := stDisplay + aRegState + ';';
  stDisplay := stDisplay + aEmState + ';';
  stDisplay := stDisplay + aResult + ';';
  DisplayList.Add(stDisplay);

end;

procedure TfmJUNNAMCurrentState.SearchTimerTimer(Sender: TObject);
begin
  inherited;
  SearchTimer.Enabled := False;
  if DisplayList.Count > 0 then
  begin
    BatchDisplay(DisplayList.Strings[0]);
    DisplayList.Delete(0);
  end;
  SearchTimer.Enabled := Not L_bClose;

end;

initialization
  RegisterClass(TfmJUNNAMCurrentState);
Finalization
  UnRegisterClass(TfmJUNNAMCurrentState);

end.
