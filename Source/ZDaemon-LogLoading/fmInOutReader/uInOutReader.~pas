unit uInOutReader;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, DB, ADODB,
  uSubForm, CommandArray, RzCmboBx, AdvObj;

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
    procedure sg_InOutReaderSelectionChanged(Sender: TObject; ALeft, ATop,
      ARight, ABottom: Integer);
  private
    DeviceList:TStringList;
    L_nCol,L_nRow : integer;
    INOUTREADERGROUPCodeList : TStringList;
    { Private declarations }
    procedure AlarmDeviceSearch;
    Function UpdateTB_ReaderInOutState(aNodeNo,aEcuID,aReaderNo,aInOutState:string):Boolean;
    Function UpdateTB_ReaderInOutGroupCode(aNodeNo,aEcuID,aReaderNo,aGroupCode:string):Boolean;
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
  INOUTREADERGROUPCodeList := TStringList.Create;
end;

procedure TfmInOutReader.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DeviceList.Free;
  INOUTREADERGROUPCodeList.Free;
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
  GridInit(sg_InOutReader,4);
  if cmb_Device.ItemIndex < 1 then Exit;

  stNodeNo := copy(DeviceList.Strings[cmb_Device.ItemIndex],1,3);
  stEcuID := copy(DeviceList.Strings[cmb_Device.ItemIndex],4,2);

  stSql := 'Select a.*,b.ac_devicename,c.IO_GROUPCODE,c.IO_GROUPNAME from TB_READER a ';
  stSql := stSql + ' Left Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Left Join TB_INOUTREADERGROUP c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.IO_GROUPCODE = c.IO_GROUPCODE) ';
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
        
        Cells[3,nRow] := FindField('IO_GROUPNAME').AsString;
        if Cells[3,nRow] = '' then Cells[3,nRow] := '사용안함';
        Cells[4,nRow] := FindField('do_doorno').AsString;
        Cells[5,nRow] := inttostr(FindField('ac_nodeno').AsInteger);
        Cells[6,nRow] := FindField('ac_ecuid').AsString;
        Cells[7,nRow] := FindField('IO_GROUPCODE').AsString;

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
{  if sg_InoutReader.Cells[0, ARow] = '' then Exit;
  
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
  end  }
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
  stGroupCode : string;
begin
  stNodeNo := sg_InoutReader.Cells[5, L_nRow] ;
  stEcuID := sg_InoutReader.Cells[6, L_nRow] ;
  stReaderNo := sg_InoutReader.Cells[1, L_nRow] ;
  if L_nCol = 2 then
  begin
    if cbCardReader.Text = '퇴실' then stInOutState := '-1'
    else if cbCardReader.Text = '입실' then stInOutState := '1'
    else stInOutState := '0';

    UpdateTB_ReaderInOutState(stNodeNo,stEcuID,stReaderNo,stInOutState);
  end else if L_nCol = 3 then
  begin
    stGroupCode := '000';
    if INOUTREADERGROUPCodeList.Count > cbCardReader.ItemIndex then
    begin
      stGroupCode := INOUTREADERGROUPCodeList.Strings[cbCardReader.ItemIndex];
    end;
    UpdateTB_ReaderInOutGroupCode(stNodeNo,stEcuID,stReaderNo,stGroupCode);
  end;
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

procedure TfmInOutReader.sg_InOutReaderSelectionChanged(Sender: TObject;
  ALeft, ATop, ARight, ABottom: Integer);
var
  Rect: TRect;
  stSql : string;
begin
  if sg_InoutReader.Cells[0, ATop] = '' then Exit;
  
  if ALeft = 2 then
  begin
    Rect := sg_InoutReader.CellRect(ALeft, ATop);
    L_nCol := ALeft;
    L_nRow := ATop;
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
      Text := sg_InoutReader.Cells[ALeft, ATop];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end else if ALeft = 3 then
  begin
    Rect := sg_InoutReader.CellRect(ALeft, ATop);
    L_nCol := ALeft;
    L_nRow := ATop;

    with cbCardReader do
    begin
      //문사용유무
      Clear;
      Items.Add('사용안함');
      ItemIndex := 0;
      Visible := true;
      Left := Rect.Left + 2;
      Top := Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := '사용안함';
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
    INOUTREADERGROUPCodeList.Clear;
    INOUTREADERGROUPCodeList.Add('000');

    stSql := ' Select * from TB_INOUTREADERGROUP ';

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
        cbCardReader.Items.Add(FindField('IO_GROUPNAME').AsString);
        INOUTREADERGROUPCodeList.Add(FindField('IO_GROUPCODE').AsString);
        Next;
      end;
      cbCardReader.Text := sg_InoutReader.Cells[ALeft, ATop];
    end;
  end
end;

function TfmInOutReader.UpdateTB_ReaderInOutGroupCode(aNodeNo, aEcuID,
  aReaderNo, aGroupCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set IO_GROUPCODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND re_readerno = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
