unit uDeviceCurrentState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ToolPanels, ComCtrls, AdvPageControl, Shader,
  StdCtrls, AdvEdit, AdvEdBtn, PlannerDatePicker, AdvCombo, Grids,
  BaseGrid, AdvGrid, AdvPanel, Buttons, uSubForm, CommandArray, RzGrids,
  Menus,Clipbrd, AdvObj,DB,ADOdb,ActiveX;

type
  TfmDeviceCurrentState = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvPanel2: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand1Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    bClear : Boolean;
    bStart : Boolean;


  public
    { Public declarations }
    procedure CloseForm;

  end;

var
  fmDeviceCurrentState: TfmDeviceCurrentState;

implementation
uses
  uLomosUtil,
  uDBModule,
  uCommonVariable,
  udmSystemAirCon;
{$R *.dfm}



procedure TfmDeviceCurrentState.FormCreate(Sender: TObject);
begin
  Self.ModuleID := 'DEVICESTATE';
  btn_SearchClick(self);
end;

procedure TfmDeviceCurrentState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;


procedure TfmDeviceCurrentState.btn_CloseClick(Sender: TObject);
begin
  Close;
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


procedure TfmDeviceCurrentState.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
  stTemp : string;
  nIndex : integer;
  stDeviceID : string;
begin
  inherited;
  GridInitialize(AdvStringGrid1);
  stSql := ' Select a.*,b.AL_ZONENAME from TB_SYSAIRCONDEVICE a ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE b ';
  stSql := stSql + ' ON(a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordcount < 1 then exit;
      AdvStringGrid1.RowCount := recordcount + 1;
      nRow := 1;
      while Not eof do
      begin
        with AdvStringGrid1 do
        begin
          cells[0,nRow] := FindField('SD_DEVICENAME').AsString;
          stTemp := '';
          nIndex := SystemAirConDMSList.IndexOf(FillZeroNumber(FindField('SD_NODENO').AsInteger,3));
          if nIndex > -1 then
          begin
            stDeviceID := FindField('SD_CONTROLERID').AsString +  FindField('SD_RELAYID').AsString + FindField('SD_DEVICEID').AsString;
            case TDMSNode(SystemAirConDMSList.Objects[nIndex]).GetAirconDevice_PowerMode(stDeviceID) of
              pmNothing : begin
                stTemp := '알수없음';
              end;
              pmOff : begin
                stTemp := 'OFF';
              end;
              pmOn : begin
                stTemp := 'ON';
              end;
            end;
          end;
          cells[1,nRow] := stTemp;
          cells[2,nRow] := FindField('AL_ZONENAME').AsString;
          stTemp := '';
          nIndex := ArmAreaDeviceList.IndexOf(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString);
          if nIndex > -1 then
          begin
            case TArmAreaDevice(ArmAreaDeviceList.Objects[nIndex]).WatchMode of
              cmNothing : begin
                stTemp := '알수없음';
              end;
              cmArm : begin
                stTemp := '경계중';
              end;
              cmDisarm : begin
                stTemp := '해제중';
              end;
              cmPatrol : begin
                stTemp := '순찰중';
              end;
              cmInit : begin
                stTemp := '초기화';
              end;
              cmTest : begin
                stTemp := '테스트';
              end;
              cmJaejung : begin
                stTemp := '재중경계';
              end;

            end;
          end;
          cells[3,nRow] := stTemp;
        end;
        nRow := nRow +  1;
        Next;
      end;
    end
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;



end;

procedure TfmDeviceCurrentState.FormActivate(Sender: TObject);
begin
  inherited;
  Windowstate := wsMaximized;
end;

initialization
  RegisterClass(TfmDeviceCurrentState);
Finalization
  UnRegisterClass(TfmDeviceCurrentState);

end.
