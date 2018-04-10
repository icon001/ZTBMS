unit uAlaramReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, DB, ADODB,
  uSubForm, CommandArray, RzCmboBx, AdvObj;

type
  TfmAlaramReader = class(TfmASubForm)
    pan_header: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_AlaramDevice: TComboBox;
    sg_AlarmReader: TAdvStringGrid;
    btn_Close: TSpeedButton;
    ADOQuery: TADOQuery;
    cbCardReader: TRzComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_AlaramDeviceChange(Sender: TObject);
    procedure sg_AlarmReaderSelectCell(Sender: TObject; ACol,
      ARow: Integer; var CanSelect: Boolean);
    procedure cbCardReaderExit(Sender: TObject);
    procedure cbCardReaderChange(Sender: TObject);
  private
    AlarmDeviceList:TStringList;
    L_nCol,L_nRow : integer;
    { Private declarations }
    procedure AlarmDeviceSearch;
    Function UpdateTB_ReaderDoorUse(aNodeNo,aEcuID,aReaderNo,aReaderUse:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAlaramReader: TfmAlaramReader;

implementation
uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmAlaramReader.AlarmDeviceSearch;
var
  stSql : string;
begin
  AlarmDeviceList.Clear;
  cmb_AlaramDevice.Clear;
  AlarmDeviceList.Add('');
  cmb_AlaramDevice.Items.Add('');
  cmb_AlaramDevice.ItemIndex := 0;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by AL_VIEWSEQ ';
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
      cmb_AlaramDevice.Items.Add(FindField('al_zonename').AsString);
      AlarmDeviceList.Add(FillZeroNumber(FindField('ac_nodeno').AsInteger,3) + FindField('ac_ecuid').AsString);
      Next;
    end;
  end;
  cmb_AlaramDeviceChange(self);
end;

procedure TfmAlaramReader.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlaramReader.FormCreate(Sender: TObject);
begin
  AlarmDeviceList := TStringList.Create;
end;

procedure TfmAlaramReader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AlarmDeviceList.Free;
end;

procedure TfmAlaramReader.FormShow(Sender: TObject);
begin
  AlarmDeviceSearch;
end;

procedure TfmAlaramReader.cmb_AlaramDeviceChange(Sender: TObject);
var
  stSql : string;
  stNodeNo,stEcuID : string;
  nRow : integer;
begin
  RowGridInitialize(sg_AlarmReader);
  if cmb_AlaramDevice.ItemIndex < 1 then Exit;

  stNodeNo := copy(AlarmDeviceList.Strings[cmb_AlaramDevice.ItemIndex],1,3);
  stEcuID := copy(AlarmDeviceList.Strings[cmb_AlaramDevice.ItemIndex],4,2);

  stSql := 'Select a.*,b.al_zonename from TB_READER a ';
  stSql := stSql + ' Left Join TB_ALARMDEVICE b ';
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
    with sg_AlarmReader do
    begin
      RowCount := recordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('al_zonename').AsString;
        Cells[1,nRow] := FindField('re_readerno').AsString;
        Cells[2,nRow] := FindField('re_use').AsString;
        Cells[3,nRow] := FindField('do_doorno').AsString;
        Cells[4,nRow] := inttostr(FindField('ac_nodeno').AsInteger);
        Cells[5,nRow] := FindField('ac_ecuid').AsString;

        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmAlaramReader.sg_AlarmReaderSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  if sg_AlarmReader.Cells[0, ARow] = '' then Exit;
  
  if ACol = 2 then
  begin
    Rect := sg_AlarmReader.CellRect(ACol, ARow);
    L_nCol := ACol;
    L_nRow := ARow;
    // 현재 Cell의 좌표를 Rect로 저장
    with cbCardReader do
    begin
      //문사용유무
      Clear;
      Items.Add('N:사용안함');
      Items.Add('Y:사용');
      ItemIndex := 1;
      Visible := true;
      Left := Rect.Left + 2;
      Top := Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      if sg_AlarmReader.Cells[ACol, ARow] = 'Y' then Text := 'Y:사용'
      else Text := 'N:사용안함';
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end
end;

procedure TfmAlaramReader.cbCardReaderExit(Sender: TObject);
begin
  cbCardReader.Visible := False;
end;

procedure TfmAlaramReader.cbCardReaderChange(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stReaderNo : string;
  stReaderUse : string;
begin
  stNodeNo := sg_AlarmReader.Cells[4, L_nRow] ;
  stEcuID := sg_AlarmReader.Cells[5, L_nRow] ;
  stReaderNo := sg_AlarmReader.Cells[1, L_nRow] ;
  stReaderUse := copy(cbCardReader.Text,1,1);
  if stReaderUse <> 'Y' then stReaderUse := 'N';
  UpdateTB_ReaderDoorUse(stNodeNo,stEcuID,stReaderNo,stReaderUse);
  sg_AlarmReader.Cells[L_nCol, L_nRow] := stReaderUse ;
end;

function TfmAlaramReader.UpdateTB_ReaderDoorUse(aNodeNo, aEcuID, aReaderNo,
  aReaderUse: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set re_use = ''' + aReaderUse + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND re_readerno = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
