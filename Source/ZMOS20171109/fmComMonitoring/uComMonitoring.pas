unit uComMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, ExtCtrls, AdvPanel, uSubForm,
  CommandArray, AdvObj;

type
  TfmComMonitoring = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    sg_ComState: TAdvStringGrid;
    btn_Close: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    bStart : Boolean;
    bClear : Boolean;
    { Private declarations }
    procedure DisplayStringGrid(aTxRx,aData:string;StringGrid:TStringGrid);
  public
    { Public declarations }
  end;

var
  fmComMonitoring: TfmComMonitoring;

implementation

{$R *.dfm}

procedure TfmComMonitoring.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmComMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ComMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  Action := caFree;

end;

procedure TfmComMonitoring.FormActivate(Sender: TObject);
begin
  bClear := True;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'ComMonitoring';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  btn_startClick(Self)

end;

procedure TfmComMonitoring.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
var
  stRxTx : string;
  stData : string;
begin
  stRxTx :=  Params.Values['RXTX'];
  stData :=  Params.Values['DATA'];

  DisplayStringGrid(stRxTx,stData,sg_ComState);
end;

procedure TfmComMonitoring.btn_startClick(Sender: TObject);
begin
  bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;

end;

procedure TfmComMonitoring.btn_stopClick(Sender: TObject);
begin
  bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmComMonitoring.btn_ClearClick(Sender: TObject);
begin
  bClear := True;
  GridInitialize(sg_ComState);
end;

procedure TfmComMonitoring.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='클라이언트 통신상태확인(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_ComState.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmComMonitoring.DisplayStringGrid(aTxRx, aData: string;
  StringGrid: TStringGrid);
begin
  if Not bStart then Exit;

  //여기에서 화면에 뿌려주자.
  with StringGrid as TAdvStringGrid do
  begin

    if RowCount >= 100 then  rowCount := 99;
    
    if Not bClear then InsertRows(1,1);
    bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] := '[' + aTxRx + ']';
    Cells[2,1] :=  aData ;

  end;
end;

procedure TfmComMonitoring.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmComMonitoring);
Finalization
  UnRegisterClass(TfmComMonitoring);

end.
