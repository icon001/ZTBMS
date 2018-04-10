unit uSTXChangWonCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB, AdvObj;

type
  TfmSTXChangWonCurrentState = class(TfmASubForm)
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

    procedure STXChangWonEventState(aDate, aTime, aEmCode, aNodeNo, aEcuID,aDoorNo, aDoorName, aResult:string);
  end;

var
  fmSTXChangWonCurrentState: TfmSTXChangWonCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmSTXChangWonCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'HizeState';

  DisplayList := TStringList.Create;

end;

procedure TfmSTXChangWonCurrentState.FormClose(Sender: TObject;
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

procedure TfmSTXChangWonCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('HizeState').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('HizeState').Execute;

end;

procedure TfmSTXChangWonCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;
end;

procedure TfmSTXChangWonCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmSTXChangWonCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;
 
procedure TfmSTXChangWonCurrentState.Button1Click(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  stSql := trim(Memo1.Text);
  Try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := stSql;
    if(uppercase(copy(stSql,1,length('select'))) = 'SELECT') then
    begin
      ADOQuery1.Open;
    end else
    begin
      ADOQuery1.ExecSQL;
    end;
  Except
    ON E: Exception do
    begin
      showmessage(E.Message + ':' + stSql);
      Exit;
    end;

  End;
end;

procedure TfmSTXChangWonCurrentState.STXChangWonEventState(aDate, aTime,
  aEmCode, aNodeNo, aEcuID, aDoorNo, aDoorName, aResult: string);
begin
  with sg_Employee do
  begin
    if RowCount >= 1000 then  rowCount := 999;

    if Cells[0,1] <> '' then InsertRows(1,1);

    Cells[0,1] := aDate;
    Cells[1,1] := aTime;
    Cells[2,1] := aEmCode;
    Cells[3,1] := aNodeNo;
    Cells[4,1] := aEcuID;
    Cells[5,1] := aDoorNo;
    Cells[6,1] := aDoorName;
    Cells[7,1] := aResult;
    if Cells[7,1] = 'fail' then RowColor[1] := clYellow;
  end;

end;

initialization
  RegisterClass(TfmSTXChangWonCurrentState);
Finalization
  UnRegisterClass(TfmSTXChangWonCurrentState);

end.
