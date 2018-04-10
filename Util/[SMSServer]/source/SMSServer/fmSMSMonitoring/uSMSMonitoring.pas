unit uSMSMonitoring;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Buttons, ExtCtrls, AdvPanel, StdCtrls,
  uSubForm, CommandArray, AdvObj;

type
  TfmSMSMonitoring = class(TfmASubForm)
    AdvPanel1: TAdvPanel;
    AdvStringGrid1: TAdvStringGrid;
    btn_start: TBitBtn;
    btn_stop: TBitBtn;
    btn_Clear: TBitBtn;
    btn_Close: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_startClick(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure btn_ClearClick(Sender: TObject);
  private
    L_bStart : Boolean;
    L_bClear : Boolean;
    { Private declarations }
  public
    { Public declarations }
    procedure SMSSendEvent(aUserID, aSubject,aSmsMessage, aCallBackUrl, aCallback, aSendername, aDestNumber, aCdrID, aResult:string);
  end;

var
  fmSMSMonitoring: TfmSMSMonitoring;

implementation

uses
  uCommonVariable;
  
{$R *.dfm}

procedure TfmSMSMonitoring.FormActivate(Sender: TObject);
begin
  self.FindSubForm('Main').FindCommand('SMSMONITOR').Params.Values['VALUE'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('SMSMONITOR').Execute;
  WindowState := wsMaximized;
  btn_startClick(sender);
end;

procedure TfmSMSMonitoring.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if G_bApplicationTerminate then Exit;
  self.FindSubForm('Main').FindCommand('SMSMONITOR').Params.Values['VALUE'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('SMSMONITOR').Execute;
  Action := caFree;

end;

procedure TfmSMSMonitoring.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSMSMonitoring.btn_startClick(Sender: TObject);
begin
  L_bStart := True;
  btn_start.Enabled := False;
  btn_stop.Enabled := True;

end;

procedure TfmSMSMonitoring.btn_stopClick(Sender: TObject);
begin
  inherited;
  L_bStart := False;
  btn_start.Enabled := True;
  btn_stop.Enabled := False;

end;

procedure TfmSMSMonitoring.btn_ClearClick(Sender: TObject);
begin
  L_bClear := True;
  GridInitialize(AdvStringGrid1);

end;

procedure TfmSMSMonitoring.SMSSendEvent(aUserID, aSubject, aSmsMessage,
  aCallBackUrl, aCallback, aSendername, aDestNumber, aCdrID,
  aResult: string);
begin
  if Not L_bStart then Exit;
  //여기에서 화면에 뿌려주자.
  with AdvStringGrid1 do
  begin
    if RowCount >= 10000 then  rowCount := 9999;
    
    if Not L_bClear then InsertRows(1,1);
    L_bClear := False;

    Cells[0,1] := FormatDateTime('yyyy-mm-dd hh:nn:ss',now);
    Cells[1,1] := aCallback;
    Cells[2,1] := aDestNumber;
    Cells[3,1] :=  aSmsMessage ;
    Cells[4,1] :=  aResult ;
    if UpperCase(aResult) <> 'OK' then RowColor[1] := clYellow;

  end;
end;

initialization
  RegisterClass(TfmSMSMonitoring);
Finalization
  UnRegisterClass(TfmSMSMonitoring);

end.
