unit uDoorStateReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, Buttons, AdvPanel,ADODB,
  uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmDoorStateReport = class(TfmASubForm)
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
  fmDoorStateReport: TfmDoorStateReport;

implementation
uses uDataModule1,uLomosUtil,uDevicemodule;
{$R *.dfm}

procedure TfmDoorStateReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmDoorStateReport.FormCreate(Sender: TObject);
begin
  LoadDeviceInfo;
end;

procedure TfmDoorStateReport.LoadDeviceInfo;
var
  stSql : string;
  nRow : integer;
  tempAdoQuery : TADOQuery;
begin
  GridInitialize(AdvStringGrid1);

  stSql := ' select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' order by AC_NODENO,AC_ECUID ';

  nRow := 1;
  Try
    CoInitialize(nil);
    tempAdoQuery := TADOQuery.Create(nil);
    tempAdoQuery.Connection := DataModule1.ADOConnection;
    with tempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      With AdvStringGrid1 do
      begin
        RowCount := RecordCount  + 1;
        while Not Eof do
        begin
          cells[0,nRow] := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;
          cells[1,nRow] := FindField('AC_DEVICENAME').AsString;

          inc(nRow);
          Next;
        end;
      end;
    end;
  Finally
    tempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorStateReport.btn_StateSearchClick(Sender: TObject);
var
  nRow,i : integer;
  stDoorManager1 : string;
  stDoorManager2 : string;
  stDoorPNmode1 : string;
  stDoorPNmode2 : string;
  stDoorOpenState1 : string;
  stDoorOpenState2 : string;
  stDoorFireState1 : string ;
  stDoorFireState2 : string;
begin
  With AdvStringGrid1 do
  begin
      for i:=0 to DeviceList.Count - 1 do
      begin
        if G_bApplicationTerminate then Exit;
        case TDevice(DeviceList.Objects[i]).GetDoorManageMode(1) of
          dmNothing : begin stDoorManager1 := 'Nothing' end;
          dmManager : begin stDoorManager1 := '����' end;
          dmOpen    : begin stDoorManager1 := '������' end;
          dmLock    : begin stDoorManager1 := '�����' end;
          dmMaster  : begin stDoorManager1 := '�����͸��' end;
          else begin stDoorManager1 := 'Nothing' end;
        end;
        case TDevice(DeviceList.Objects[i]).GetDoorManageMode(2) of
          dmNothing : begin stDoorManager2 := 'Nothing' end;
          dmManager : begin stDoorManager2 := '����' end;
          dmOpen    : begin stDoorManager2 := '������' end;
          dmLock    : begin stDoorManager2 := '�����' end;
          dmMaster  : begin stDoorManager2 := '�����͸��' end;
          else begin stDoorManager2 := 'Nothing' end;
        end;
        case TDevice(DeviceList.Objects[i]).GetDoorPNMode(1) of
          pnNothing  : begin stDoorPNmode1 := 'Nothing' end;
          pnPositive : begin stDoorPNmode1 := 'Positive' end;
          pnNegative : begin stDoorPNmode1 := 'Negative' end;
          else begin stDoorPNmode1 := 'Nothing' end;
        end;
        case TDevice(DeviceList.Objects[i]).GetDoorPNMode(2) of
          pnNothing  : begin stDoorPNmode2 := 'Nothing' end;
          pnPositive : begin stDoorPNmode2 := 'Positive' end;
          pnNegative : begin stDoorPNmode2 := 'Negative' end;
          else begin stDoorPNmode2 := 'Nothing' end;
        end;
        case TDevice(DeviceList.Objects[i]).GetDoorState(1) of
          dsNothing : begin stDoorOpenState1 := 'Nothing' end;
          dsClose   : begin stDoorOpenState1 := '����' end;
          dsOpen    : begin stDoorOpenState1 := '����' end;
          dsLongTime: begin stDoorOpenState1 := '��ð�' end;
          dsOpenErr : begin stDoorOpenState1 := '��������' end;
          dsCloseErr: begin stDoorOpenState1 := '��������' end;
          else begin stDoorOpenState1 := 'Nothing' end;
        end;
        case TDevice(DeviceList.Objects[i]).GetDoorState(2) of
          dsNothing : begin stDoorOpenState2 := 'Nothing' end;
          dsClose   : begin stDoorOpenState2 := '����' end;
          dsOpen    : begin stDoorOpenState2 := '����' end;
          dsLongTime: begin stDoorOpenState2 := '��ð�' end;
          dsOpenErr : begin stDoorOpenState2 := '��������' end;
          dsCloseErr: begin stDoorOpenState2 := '��������' end;
          else begin stDoorOpenState2 := 'Nothing' end;
        end;
        if TDevice(DeviceList.Objects[i]).GetDoorFire(1) then stDoorFireState1 := '1'
        else stDoorFireState1 := '0';
        if TDevice(DeviceList.Objects[i]).GetDoorFire(2) then stDoorFireState2 := '1'
        else stDoorFireState2 := '0';
        for nRow := 1 to RowCount - 1 do
        begin
          if Cells[0,nRow] = DeviceList.Strings[i] then
          begin
            Cells[2,nRow] := stDoorPNmode1;
            Cells[3,nRow] := stDoorManager1;
            Cells[4,nRow] := stDoorOpenState1;
            Cells[5,nRow] := stDoorFireState1;
            Cells[6,nRow] := stDoorPNmode2;
            Cells[7,nRow] := stDoorManager2;
            Cells[8,nRow] := stDoorOpenState2;
            Cells[9,nRow] := stDoorFireState2;
            break;
          end;
        end;
      end;
  end;
end;

procedure TfmDoorStateReport.RefreshTimerTimer(Sender: TObject);
begin
  btn_StateSearchClick(self);
  AdvStringGrid1.Refresh;
end;

procedure TfmDoorStateReport.btn_stopClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDoorStateReport.AdvStringGrid1DrawCell(Sender: TObject;
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
      FillRect(Rect);  //�˹����� ĥ�Ѵ�.(�⺻���� ���)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //���ڸ� �ѷ��ش�.. �⺻�� ������
      end;

    End;
  End
  else  begin
    with (Sender as TStringGrid) do
    begin
      if Cells[4,ARow] = 'DisConnected' then
      begin
        Canvas.Brush.Color := clRed; //�̽����̸�
      end
      else Canvas.Brush.Color := clWhite;
      canvas.fillRect(rect);
      canvas.TextRect(Rect, Rect.Left + 3, Rect.Top + 3, cells[ACol, ARow]);
    End;

  end;
end;

initialization
  RegisterClass(TfmDoorStateReport);
Finalization
  UnRegisterClass(TfmDoorStateReport);

end.
