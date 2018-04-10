unit uHizeAirCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmHizeAirCurrentState = class(TfmASubForm)
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Panel1: TPanel;
    sg_Employee: TAdvStringGrid;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    DBGrid1: TDBGrid;
    Memo1: TMemo;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CloseClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    L_bClose : Boolean;
  public
    { Public declarations }
    procedure CloseForm;

    procedure YounSeUniversityEmployeeEventState(aJijumName,aDepartName,aEmployeeGubun,aEmName,aEmCode,aTelNum,aIssuNum,aCardNo,aCardState,aCardType,aOldCardNo,aResult:string);
    procedure HizeAirATEventState(aATTYPE,aEMCODE,aATDATE,aACDATE,aACTIME,aJIJUMNAME,aDEPARTCODE,aDEPARTNAME,aEMNAME,aResult:string);
  end;

var
  fmHizeAirCurrentState: TfmHizeAirCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmHizeAirCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'HizeState';

  DisplayList := TStringList.Create;

end;

procedure TfmHizeAirCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('HizeState').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('HizeState').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmHizeAirCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('HizeState').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('HizeState').Execute;

end;

procedure TfmHizeAirCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmHizeAirCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmHizeAirCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;
 
procedure TfmHizeAirCurrentState.Button1Click(Sender: TObject);
begin
  inherited;
  Try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := Memo1.Text;
    ADOQuery1.Open;
  Except
    Exit;
  End;
end;


procedure TfmHizeAirCurrentState.YounSeUniversityEmployeeEventState(
  aJijumName, aDepartName, aEmployeeGubun, aEmName, aEmCode, aTelNum,
  aIssuNum, aCardNo, aCardState, aCardType,aOldCardNo, aResult: string);
begin
  with sg_Employee do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := aJijumName;
    Cells[1,1] := aDepartName;
    Cells[2,1] := aEmployeeGubun;
    Cells[3,1] := aEmName;
    Cells[4,1] := aEmCode;
    Cells[5,1] := aTelNum;
    Cells[6,1] := aIssuNum;
    Cells[7,1] := aCardNo;
    Cells[8,1] := aCardState;
    Cells[9,1] := aCardType;
    Cells[10,1] := aOldCardNo;
    Cells[11,1] := aResult;
    if Cells[11,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

procedure TfmHizeAirCurrentState.HizeAirATEventState(aATTYPE, aEMCODE,
  aATDATE, aACDATE, aACTIME, aJIJUMNAME, aDEPARTCODE, aDEPARTNAME, aEMNAME,
  aResult: string);
begin
  with sg_Employee do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := aATTYPE;
    Cells[1,1] := aEMCODE;
    Cells[2,1] := aATDATE;
    Cells[3,1] := aACDATE;
    Cells[4,1] := aACTIME;
    Cells[5,1] := aJIJUMNAME;
    Cells[6,1] := aDEPARTCODE;
    Cells[7,1] := aDEPARTNAME;
    Cells[8,1] := aEMNAME;
    Cells[9,1] := aResult;
    if Cells[9,1] = 'fail' then RowColor[1] := clYellow;
  end;
end;

initialization
  RegisterClass(TfmHizeAirCurrentState);
Finalization
  UnRegisterClass(TfmHizeAirCurrentState);

end.
