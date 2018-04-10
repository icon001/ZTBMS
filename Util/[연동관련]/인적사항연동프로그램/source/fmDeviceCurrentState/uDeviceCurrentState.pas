unit uDeviceCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, DBGrids, DB, ADODB;

type
  TfmDeviceCurrentState = class(TfmASubForm)
    AdvPanel2: TAdvPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    btn_Close: TSpeedButton;
    Memo1: TMemo;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RelayADOQuery: TADOQuery;
    btn_Search: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StringGrideResize(Gride:TStringGrid);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
  private
    { Private declarations }
    DisplayList : TStringList;
    bClear : Boolean;
    bStart : Boolean;

    procedure SearchRelayData;
  public
    { Public declarations }
    procedure DisplayStringGrid(aTxRx,aIP,aPacket:string);
    procedure CloseForm;

    procedure BatchDisplay(aData:string);
    procedure RelayAdoEvent(aSql:string);
  end;

var
  fmDeviceCurrentState: TfmDeviceCurrentState;

implementation
uses
  uLomosUtil,
  uMain,
  uCommonVariable,
  udmAdoRelay;
{$R *.dfm}



procedure TfmDeviceCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'DEVICESTATE';

  DisplayList := TStringList.Create;

  SearchRelayData;

end;

procedure TfmDeviceCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('DEVICECURRENTSTATE').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('DEVICECURRENTSTATE').Execute;
  Action := caFree;
  DisplayList.Clear;
  DisplayList.Free;
end;

procedure TfmDeviceCurrentState.FormShow(Sender: TObject);
begin

  self.FindSubForm('Main').FindCommand('DEVICECURRENTSTATE').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('DEVICECURRENTSTATE').Execute;

end;

procedure TfmDeviceCurrentState.StringGrideResize(Gride:TStringGrid);
var
  nTotWidth,nColCnt,nColWidth : integer;
  i : integer;
begin
  with Gride do
  begin
    ColCount := 4;

    nTotWidth := Width - 20;

    ColWidths[0] := 200;
    ColWidths[1] := 100;
    ColWidths[2] := 100;
    ColWidths[3] := nTotWidth - 400;

  end;
end;

procedure TfmDeviceCurrentState.DisplayStringGrid(aTxRx,aIP,aPacket: string);
var
  stDisplay : string;
begin
  if Not bStart then Exit;
  stDisplay := FormatDateTime('yyyy-mm-dd hh:nn:ss',now)  + ';';
  stDisplay := stDisplay + aTxRx + ';';
  stDisplay := stDisplay + aIP + ';';
  stDisplay := stDisplay + aPacket ;
  DisplayList.Add(stDisplay);
  Exit;

end;

procedure TfmDeviceCurrentState.CommandArrayCommandsTCommand1Execute(
  Command: TCommand; Params: TStringList);
begin
  Close;

end;

procedure TfmDeviceCurrentState.CloseForm;
begin
  Close;
end;

procedure TfmDeviceCurrentState.BatchDisplay(aData:string);
begin

end;

procedure TfmDeviceCurrentState.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmDeviceCurrentState.SearchRelayData;
var
  stSql : string;
begin
  stSql := ' Select * from CARD.MFC_HUB ';
  stSql := stSql + ' order by HUB_SEQNO ';

  with RelayADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
  End;
end;

procedure TfmDeviceCurrentState.RelayAdoEvent(aSql: string);
begin
  Memo1.lines.Add(aSql);
//  SearchRelayData;
end;

procedure TfmDeviceCurrentState.btn_SearchClick(Sender: TObject);
begin
  inherited;
  SearchRelayData;
end;

initialization
  RegisterClass(TfmDeviceCurrentState);
Finalization
  UnRegisterClass(TfmDeviceCurrentState);

end.
