unit uReaderMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, AdvPanel, Grids, AdvObj, BaseGrid, AdvGrid,
  uSubForm, CommandArray;

type
  TfmReaderMonitoring = class(TfmASubForm)
    sg_ComState: TAdvStringGrid;
    AdvPanel1: TAdvPanel;
    btn_stop: TSpeedButton;
    btn_start: TSpeedButton;
    btn_Clear: TSpeedButton;
    btn_FileSave: TSpeedButton;
    btn_Close: TSpeedButton;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
  private
    L_bStart : Boolean;
    L_bClear : Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure DisplayStringGrid(aReaderName,aTxRx,aData:string);
  end;

var
  fmReaderMonitoring: TfmReaderMonitoring;

implementation

{$R *.dfm}

procedure TfmReaderMonitoring.DisplayStringGrid(aReaderName, aTxRx,
  aData: string);
begin
  if Not L_bStart then Exit;

  //여기에서 화면에 뿌려주자.
  with sg_ComState do
  begin

    if RowCount >= 100 then  rowCount := 99;

    if Not L_bClear then InsertRows(1,1);
    L_bClear := False;

    Cells[0,1] := FormatDateTime('HH:MM:SS',now);
    Cells[1,1] := aReaderName;
    Cells[2,1] := aTxRx;
    Cells[3,1] := aData ;

  end;
end;

procedure TfmReaderMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmReaderMonitoring.btn_startClick(Sender: TObject);
begin
  L_bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;
end;

procedure TfmReaderMonitoring.btn_stopClick(Sender: TObject);
begin
  L_bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;
end;

procedure TfmReaderMonitoring.btn_ClearClick(Sender: TObject);
begin
  L_bClear := True;
  GridInitialize(sg_ComState);

end;

procedure TfmReaderMonitoring.FormShow(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('ReaderMonitoring').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('ReaderMonitoring').Execute;
  btn_ClearClick(btn_Clear);
  btn_startClick(btn_start);
end;

procedure TfmReaderMonitoring.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmReaderMonitoring.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='송수신 현황조회(' + FormatDateTime('yyyy-mm-dd',now) + ')';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_ComState.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

initialization
  RegisterClass(TfmReaderMonitoring);
Finalization
  UnRegisterClass(TfmReaderMonitoring);

end.
