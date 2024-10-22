unit uInOutReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, DB, ADODB,
  uSubForm, CommandArray, RzCmboBx;

type
  TfmInOutReader = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_Device: TComboBox;
    sg_InOutReader: TAdvStringGrid;
    btn_Close: TSpeedButton;
    ADOQuery: TADOQuery;
    cbCardReader: TRzComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_DeviceChange(Sender: TObject);
    procedure sg_InOutReaderSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure cbCardReaderExit(Sender: TObject);
    procedure cbCardReaderChange(Sender: TObject);
  private
    DeviceList:TStringList;
    L_nCol,L_nRow : integer;
    { Private declarations }
    procedure AlarmDeviceSearch;
    Function UpdateTB_ReaderInOutState(aNodeNo,aEcuID,aReaderNo,aInOutState:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmInOutReader: TfmInOutReader;

implementation
uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmInOutReader.AlarmDeviceSearch;
var
  stSql : string;
begin
  DeviceList.Clear;
  cmb_Device.Clear;
  DeviceList.Add('');
  cmb_Device.Items.Add('');
  cmb_Device.ItemIndex := 0;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AC_VIEWSEQ ';
  with ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    While Not Eof do
    begin
      cmb_Device.Items.Add(FindField('ac_devicename').AsString);
      DeviceList.Add(FillZeroNumber(FindField('ac_nodeno').AsInteger,3) + FindField('ac_ecuid').AsString);
      Next;
    end;
  end;
  cmb_DeviceChange(self);
end;

procedure TfmInOutReader.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInOutReader.FormCreate(Sender: TObject);
begin
  DeviceList := TStringList.Create;
end;

procedure TfmInOutReader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceList.Free;
end;

procedure TfmInOutReader.FormShow(Sender: TObject);
begin
  AlarmDeviceSearch;
end;

procedure TfmInOutReader.cmb_DeviceChange(Sender: TObject);
var
  stSql : string;
  stNodeNo,stEcuID : string;
  nRow : integer;
begin
  RowGridInitialize(sg_InOutReader);
  if cmb_Device.ItemIndex < 1 then Exit;

  stNodeNo := copy(DeviceList.Strings[cmb_Device.ItemIndex],1,3);
  stEcuID := copy(DeviceList.Strings[cmb_Device.ItemIndex],4,2);

  stSql := 'Select a.*,b.ac_devicename from TB_READER a ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(stNodeNo)) ;
  stSql := stSql + ' AND a.AC_ECUID = ''' + stECUID + ''' ';
  stSql := stSql + ' Order by re_readerno ';

  with AdoQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    nRow := 1;
    with sg_InoutReader do
    begin
      RowCount := recordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('ac_devicename').AsString;
        Cells[1,nRow] := FindField('re_readerno').AsString;

        if FindField('re_inoutcount').AsInteger < 0 then Cells[2,nRow] := '퇴실'
        else if FindField('re_inoutcount').AsInteger = 0 then Cells[2,nRow] := '사용안함'
        else Cells[2,nRow] := '입실';
        
        Cells[3,nRow] := FindField('do_doorno').AsString;
        Cells[4,nRow] := inttostr(FindField('ac_nodeno').AsInteger);
        Cells[5,nRow] := FindField('ac_ecuid').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmInOutReader.sg_InOutReaderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  if sg_InoutReader.Cells[0, ARow] = '' then Exit;
  
  if ACol = 2 then
  begin
    Rect := sg_InoutReader.CellRect(ACol, ARow);
    L_nCol := ACol;
    L_nRow := ARow;
    // 현재 Cell의 좌표를 Rect로 저장
    with cbCardReader do
    begin
      //문사용유무
      Clear;
      Items.Add('사용안함');
      Items.Add('입실');
      Items.Add('퇴실');
      ItemIndex := 0;
      Visible := true;
      Left := Rect.Left + 2;
      Top := Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sg_InoutReader.Cells[ACol, ARow];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end
end;

procedure TfmInOutReader.cbCardReaderExit(Sender: TObject);
begin
  cbCardReader.Visible := False;
end;

procedure TfmInOutReader.cbCardReaderChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stReaderNo : string;
  stInOutState : string;
begin
  stNodeNo := sg_InoutReader.Cells[4, L_nRow] ;
  stEcuID := sg_InoutReader.Cells[5, L_nRow] ;
  stReaderNo := sg_InoutReader.Cells[1, L_nRow] ;
  if cbCardReader.Text = '퇴실' then stInOutState := '-1'
  else if cbCardReader.Text = '입실' then stInOutState := '1'
  else stInOutState := '0';

  UpdateTB_ReaderInOutState(stNodeNo,stEcuID,stReaderNo,stInOutState);
  sg_InoutReader.Cells[L_nCol, L_nRow] := cbCardReader.Text ;
end;

function TfmInOutReader.UpdateTB_ReaderInOutState(aNodeNo, aEcuID, aReaderNo,
  aInOutState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set re_inoutcount = ' + aInOutState + ' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND re_readerno = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
