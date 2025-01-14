unit uChungNamCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmChungNamCurrentState = class(TfmASubForm)
    AdvPanel2: TAdvPanel;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    AdvStringGrid1: TAdvStringGrid;
    SearchTimer: TTimer;
    Memo1: TMemo;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CloseClick(Sender: TObject);
    procedure SearchTimerTimer(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    L_bClose : Boolean;
  public
    { Public declarations }
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
    procedure RelayAdoEvent(aSql:string);
    procedure ChungnamEventState(aEmID,aEmName,aJijumName,aDepartName,aPosiName,aHandphone,aStateCode:string);
  end;

var
  fmChungNamCurrentState: TfmChungNamCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmChungNamCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'JUNNAMSTATE';

  DisplayList := TStringList.Create;

end;

procedure TfmChungNamCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  SearchTimer.Enabled := False;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('ChungNAMState').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('ChungNAMState').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmChungNamCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('ChungNAMState').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('ChungNAMState').Execute;

end;

procedure TfmChungNamCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmChungNamCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmChungNamCurrentState.BatchDisplay(aData:string);
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

procedure TfmChungNamCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfmChungNamCurrentState.RelayAdoEvent(aSql: string);
begin
end;

procedure TfmChungNamCurrentState.ChungnamEventState(aEmID,aEmName,aJijumName,aDepartName,aPosiName,aHandphone,aStateCode: string);
begin
  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
    Cells[1,1] := aEmID;
    Cells[2,1] := aEmName;
    Cells[3,1] := aJijumName;
    Cells[4,1] := aDepartName;
    Cells[5,1] := aPosiName;
    Cells[6,1] := aHandphone;
    Cells[7,1] := aStateCode;
  end;

end;

procedure TfmChungNamCurrentState.SearchTimerTimer(Sender: TObject);
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

procedure TfmChungNamCurrentState.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := Memo1.Text;
  Try
    ADOQuery1.Open ;
  Except
    Exit;
  End;
end;

initialization
  RegisterClass(TfmChungNamCurrentState);
Finalization
  UnRegisterClass(TfmChungNamCurrentState);

end.
