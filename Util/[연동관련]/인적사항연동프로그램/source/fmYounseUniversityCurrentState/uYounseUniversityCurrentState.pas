unit uYounseUniversityCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmYounseUniversityCurrentState = class(TfmASubForm)
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
  end;

var
  fmYounseUniversityCurrentState: TfmYounseUniversityCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmYounseUniversityCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'YONSESTATE';

  DisplayList := TStringList.Create;

end;

procedure TfmYounseUniversityCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  L_bClose := True;
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('YONSESTATE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('YONSESTATE').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmYounseUniversityCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('YONSESTATE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('YONSESTATE').Execute;

end;

procedure TfmYounseUniversityCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmYounseUniversityCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmYounseUniversityCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;
 
procedure TfmYounseUniversityCurrentState.Button1Click(Sender: TObject);
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


procedure TfmYounseUniversityCurrentState.YounSeUniversityEmployeeEventState(
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

initialization
  RegisterClass(TfmYounseUniversityCurrentState);
Finalization
  UnRegisterClass(TfmYounseUniversityCurrentState);

end.
