unit uSSANGYONGCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmSSANGYONGCurrentState = class(TfmASubForm)
    AdvPanel2: TAdvPanel;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    AdvStringGrid1: TAdvStringGrid;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    sg_Employee: TAdvStringGrid;
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

    procedure SSANGYONGATEventState(aDate, aTime, aEMCode,aResult:string);
    procedure SSANGYONGEmployeeEventState(aEmCode,aEmName,aJijumName,aDepartName,aWorkCode,aInsertTime,aUpdateTime,aResult:string);
  end;

var
  fmSSANGYONGCurrentState: TfmSSANGYONGCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmSSANGYONGCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'SSANGYONGSTATE';

  DisplayList := TStringList.Create;

end;

procedure TfmSSANGYONGCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('SSANGYONGSTATE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('SSANGYONGSTATE').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmSSANGYONGCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('SSANGYONGSTATE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('SSANGYONGSTATE').Execute;

end;

procedure TfmSSANGYONGCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmSSANGYONGCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmSSANGYONGCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;


procedure TfmSSANGYONGCurrentState.SSANGYONGATEventState(aDate, aTime,
  aEMCode, aResult: string);
begin
  with AdvStringGrid1 do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := aDate;
    Cells[1,1] := aTime;
    Cells[2,1] := aEMCode;
    Cells[3,1] := aResult;
    if Cells[3,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

procedure TfmSSANGYONGCurrentState.Button1Click(Sender: TObject);
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

procedure TfmSSANGYONGCurrentState.SSANGYONGEmployeeEventState(aEmCode,
  aEmName, aJijumName, aDepartName, aWorkCode, aInsertTime, aUpdateTime,
  aResult: string);
begin
  with sg_Employee do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := aEmCode;
    Cells[1,1] := aEmName;
    Cells[2,1] := aJijumName;
    Cells[3,1] := aDepartName;
    Cells[4,1] := aWorkCode;
    Cells[5,1] := aInsertTime;
    Cells[6,1] := aUpdateTime;
    Cells[7,1] := aResult;
    if Cells[7,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

initialization
  RegisterClass(TfmSSANGYONGCurrentState);
Finalization
  UnRegisterClass(TfmSSANGYONGCurrentState);

end.
