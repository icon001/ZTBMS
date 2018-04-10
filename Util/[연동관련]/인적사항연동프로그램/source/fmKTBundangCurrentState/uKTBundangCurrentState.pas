unit uKTBundangCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmKTBundangCurrentState = class(TfmASubForm)
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
    procedure KTBundangEventState(aUpdateTime,aEmCode,aCardNo,aEmName,aCardIssuCount,aStartDate,aEndDate,aJijumName,
                               aDepartName,aPosiName,aWorkGubun,aResult:string);
  end;

var
  fmKTBundangCurrentState: TfmKTBundangCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmKTBundangCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'JUNNAMSTATE';

  DisplayList := TStringList.Create;

end;

procedure TfmKTBundangCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('KTBundangState').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('KTBundangState').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmKTBundangCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('KTBundangState').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('KTBundangState').Execute;

end;

procedure TfmKTBundangCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmKTBundangCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmKTBundangCurrentState.BatchDisplay(aData:string);
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
    Delete(aData,1,nPos);
    nPos := PosIndex(';',aData,1);
    Cells[11,1] := copy(aData,1,nPos - 1);
    if Cells[11,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

procedure TfmKTBundangCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfmKTBundangCurrentState.RelayAdoEvent(aSql: string);
begin
end;


procedure TfmKTBundangCurrentState.SearchTimerTimer(Sender: TObject);
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

procedure TfmKTBundangCurrentState.KTBundangEventState(aUpdateTime,aEmCode, aCardNo,
  aEmName, aCardIssuCount, aStartDate, aEndDate, aJijumName, aDepartName,
  aPosiName, aWorkGubun, aResult: string);
var
  stDisplay : string;
begin
  stDisplay := aUpdateTime  + ';';
  stDisplay := stDisplay + aEmCode + ';';
  stDisplay := stDisplay + aCardNo + ';';
  stDisplay := stDisplay + aEmName + ';';
  stDisplay := stDisplay + aCardIssuCount + ';';
  stDisplay := stDisplay + aStartDate + ';';
  stDisplay := stDisplay + aEndDate + ';';
  stDisplay := stDisplay + aJijumName + ';';
  stDisplay := stDisplay + aDepartName + ';';
  stDisplay := stDisplay + aPosiName + ';';
  stDisplay := stDisplay + aWorkGubun + ';';
  stDisplay := stDisplay + aResult + ';';
  DisplayList.Add(stDisplay);
end;

initialization
  RegisterClass(TfmKTBundangCurrentState);
Finalization
  UnRegisterClass(TfmKTBundangCurrentState);

end.
