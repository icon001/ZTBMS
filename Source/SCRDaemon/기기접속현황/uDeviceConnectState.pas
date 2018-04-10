unit uDeviceConnectState;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, Buttons, AdvPanel,ADODB,
  uSubForm, CommandArray,ActiveX;

type
  TfmDeviceConnectState = class(TfmASubForm)
    Panel10: TPanel;
    AdvPanel1: TAdvPanel;
    btn_stop: TSpeedButton;
    btn_StateSearch: TSpeedButton;
    AdvStringGrid1: TAdvStringGrid;
    RefreshTimer: TTimer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_StateSearchClick(Sender: TObject);
    procedure RefreshTimerTimer(Sender: TObject);
    procedure btn_stopClick(Sender: TObject);
    procedure AdvStringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
  private
    { Private declarations }
    procedure LoadDeviceInfo;
  public
    { Public declarations }
  end;

var
  fmDeviceConnectState: TfmDeviceConnectState;

implementation
uses uDataModule1,uLomosUtil;
{$R *.dfm}

procedure TfmDeviceConnectState.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmDeviceConnectState.FormCreate(Sender: TObject);
begin
  LoadDeviceInfo;
end;

procedure TfmDeviceConnectState.LoadDeviceInfo;
var
  stSql : string;
  nRow : integer;
  tempAdoQuery : TADOQuery;
begin
  GridInitialize(AdvStringGrid1);
  CoInitialize(nil);
  tempAdoQuery := TADOQuery.Create(nil);
  tempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := ' select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' order by AC_NODENO,AC_ECUID ';

  nRow := 1;
  with tempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      tempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    With AdvStringGrid1 do
    begin
      RowCount := RecordCount  + 1;
      while Not Eof do
      begin
        cells[0,nRow] := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;
        cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
        cells[2,nRow] := FindField('AC_MCUIP').AsString;
        cells[3,nRow] := FindField('AC_MCUPORT').AsString;
        cells[4,nRow] := 'DisConnected';

        inc(nRow);
        Next;
      end;
    end;
  end;

  tempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmDeviceConnectState.btn_StateSearchClick(Sender: TObject);
var
  nRow,i : integer;
begin
  With AdvStringGrid1 do
  begin
    for nRow := 1 to RowCount - 1 do
    begin
      cells[4,nRow] := 'DisConnected';
    end;
    for i := 0 to ConnectDeviceList.Count - 1 do
    begin
      for nRow := 1 to RowCount - 1 do
      begin
        if Cells[0,nRow] = ConnectDeviceList.Strings[i] then
        begin
          cells[4,nRow] := 'Connected';
          break;
        end;
      end;
    end;
  end;
end;

procedure TfmDeviceConnectState.RefreshTimerTimer(Sender: TObject);
begin
  btn_StateSearchClick(self);
  AdvStringGrid1.Refresh;
end;

procedure TfmDeviceConnectState.btn_stopClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDeviceConnectState.AdvStringGrid1DrawCell(Sender: TObject;
  ACol, ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End
  else  begin
    with (Sender as TStringGrid) do
    begin
      if Cells[4,ARow] = 'DisConnected' then
      begin
        Canvas.Brush.Color := clRed; //미승인이면
      end
      else Canvas.Brush.Color := clWhite;
      canvas.fillRect(rect);
      canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 3, cells[ACol, ARow]);
    End;

  end;
end;

initialization
  RegisterClass(TfmDeviceConnectState);
Finalization
  UnRegisterClass(TfmDeviceConnectState);

end.
