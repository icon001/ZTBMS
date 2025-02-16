unit uReaderManager;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, ComCtrls, Grids, AdvObj, BaseGrid,
  AdvGrid, uSubForm, CommandArray,ADODB,ActiveX,DB, Menus;

type
  TfmReaderManager = class(TfmASubForm)
    StatusBar1: TStatusBar;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel12: TPanel;
    GroupBox2: TGroupBox;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox14: TGroupBox;
    Label28: TLabel;
    sg_Reader: TAdvStringGrid;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    lb_McuIp: TLabel;
    Label19: TLabel;
    ed_ReaderIp: TEdit;
    ed_Readername: TEdit;
    Label4: TLabel;
    ed_SearchIP: TEdit;
    ed_SearchName: TEdit;
    btn_Search: TSpeedButton;
    Label1: TLabel;
    ed_ReaderPort: TEdit;
    ed_fdmsid: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    Label2: TLabel;
    ed_FPReaderNo: TEdit;
    mn_FPDataAllDelete: TMenuItem;
    Label3: TLabel;
    cmb_ReaderType: TComboBox;
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_ReaderClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure mn_FPDataAllDeleteClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure SearchReader(aCode:string;aTopRow:integer=-1);
    function GetMaxFdmsID : integer;
  public
    { Public declarations }
  end;

var
  fmReaderManager: TfmReaderManager;

implementation

uses
uDataModule1,
uLomosUtil,
uMain,
uSHComModule;

{$R *.dfm}

procedure TfmReaderManager.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := GroupBox8.Width;
  nBlock := (nWidth - 200) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 100 + nLeft;
  btn_Update.Left := 100 + nBlock + nLeft;
  btn_Save.Left := 100 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 100 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 4) + nLeft;
  btn_Close.Left := 100 + (nBlock * 5) + nLeft;

end;



procedure TfmReaderManager.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmReaderManager.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := True;
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmReaderManager.FormClear;
begin
  ed_ReaderIp.Text := '';
  ed_Readername.Text := '';
  ed_ReaderPort.Text := '7005';
  cmb_ReaderType.ItemIndex := 0;
end;

procedure TfmReaderManager.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Reader.Enabled := False;
    ed_ReaderIp.Enabled := True;
    ed_Readername.Enabled := True;
    ed_ReaderPort.Enabled := True;
    ed_FPReaderNo.Enabled := True;
    cmb_ReaderType.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_Reader.Enabled := False;
    ed_ReaderIp.Enabled := True;
    ed_Readername.Enabled := True;
    ed_ReaderPort.Enabled := True;
    ed_FPReaderNo.Enabled := True;
    cmb_ReaderType.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_Reader.Enabled := True;
    ed_ReaderIp.Enabled := False;
    ed_Readername.Enabled := False;
    ed_ReaderPort.Enabled := False;
    ed_FPReaderNo.Enabled := False;
    cmb_ReaderType.Enabled := False;
  end;   
end;

procedure TfmReaderManager.FormCreate(Sender: TObject);
begin
  sg_Reader.ColWidths[3] := 0;
end;

procedure TfmReaderManager.btn_SearchClick(Sender: TObject);
begin
  SearchReader('');
end;

procedure TfmReaderManager.SearchReader(aCode: string; aTopRow: integer);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
  stWhere : string;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInit(sg_Reader,4); //스트링그리드 초기화

  stSql := 'select * from TB_FINGERDEVICE ';
  stWhere :='';
  if ed_SearchIP.Text <> '' then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ' ;
    stWhere :=  stWhere + ' FD_DEVICEIP Like ''%' + ed_SearchIP.Text + '%'' ';
  end;
  if ed_SearchName.Text <> '' then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ' ;
    stWhere := stWhere + ' FD_DEVICENAME Like ''%' + ed_SearchName.Text + '%'' ';
  end;
  stSql := stSql + stWhere;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        sg_ReaderClick(sg_Reader);
        Exit;
      end;

      First;
      sg_Reader.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_Reader do
        begin
          cells[0,nRow] := FindField('FD_DEVICEIP').AsString;
          cells[1,nRow] := FindField('FD_DEVICENAME').AsString;
          cells[2,nRow] := FindField('FD_DEVICEPORT').AsString;
          cells[3,nRow] := FindField('FD_DEVICENO').AsString;
          cells[4,nRow] := FindField('FD_DEVICEID').AsString;
          cells[5,nRow] := FindField('FD_DEVICETYPE').AsString;

          if isDigit(aCode)then
          begin
            if FindField('FD_DEVICEID').AsString = inttostr(strtoint(aCode)) then
            begin
              SelectRows(nRow,1);
            end;
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
    if aTopRow <> 0 then
      sg_Reader.topRow := aTopRow
    else
    begin
      if sg_Reader.row > 7 then sg_Reader.TopRow := sg_Reader.row - 6;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_ReaderClick(sg_Reader);
end;

procedure TfmReaderManager.sg_ReaderClick(Sender: TObject);
begin
  inherited;
  with sg_Reader do
  begin
    State := 'CLICK';
    FormClear;
    FormEnable(State);
    if (cells[4,Row] = '') then exit;
    ButtonEnable(State);
    ed_fdmsid.Text := cells[4,Row];
    ed_ReaderIp.Text  := cells[0,Row];
    ed_Readername.Text  := cells[1,Row];
    ed_ReaderPort.Text  := cells[2,Row];
    ed_FPReaderNo.Text  := cells[3,Row];
    if isDigit(cells[5,Row]) then cmb_ReaderType.ItemIndex  := strtoint(cells[5,Row])
    else cmb_ReaderType.ItemIndex := 0;
  end;
end;

procedure TfmReaderManager.btn_InsertClick(Sender: TObject);
begin
  inherited;
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  ed_ReaderIp.SetFocus;
end;

function TfmReaderManager.GetMaxFdmsID: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;
  stSql := 'select Max(FD_DEVICEID) as FD_DEVICEID from TB_FINGERDEVICE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then  Exit;
      result := FindField('FD_DEVICEID').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmReaderManager.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  ed_ReaderIp.SetFocus;
end;

procedure TfmReaderManager.btn_DeleteClick(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  stSql := ' Delete From TB_FINGERDEVICE where FD_DEVICEID = ' + sg_Reader.Cells[4,sg_Reader.Row] + '';
  DataModule1.ProcessExecSQL(stSql);
  stSql := ' Delete From TB_FINGERDEVICECARD where FD_DEVICEID = ' + sg_Reader.Cells[4,sg_Reader.Row] + ' ';
  DataModule1.ProcessExecSQL(stSql);
  SearchReader('',sg_Reader.TopRow);
end;

procedure TfmReaderManager.btn_CancelClick(Sender: TObject);
begin
  inherited;
  SearchReader(ed_fdmsid.Text,sg_Reader.TopRow);
end;

procedure TfmReaderManager.btn_SaveClick(Sender: TObject);
var
  stSql : string;
begin
  if Not isDigit(ed_FPReaderNo.Text) then
  begin
    showmessage('지문리더 아이디는 숫자입니다.');
    Exit;
  end;
  if UpperCase(State) = 'INSERT' then
  begin
    ed_fdmsid.Text := inttostr(GetMaxFdmsID);
    stSql := ' Insert Into TB_FINGERDEVICE ( ';
    stSql := stSql + ' FD_DEVICEID, ';
    stSql := stSql + ' FD_DEVICEIP, ';
    stSql := stSql + ' FD_DEVICEPORT, ';
    stSql := stSql + ' FD_DEVICENO, ';
    stSql := stSql + ' FD_DEVICENAME, ';
    stSql := stSql + ' FD_DEVICETYPE) ';
    stSql := stSql + ' Values ( ';
    stSql := stSql + ' ' + ed_fdmsid.Text + ',';
    stSql := stSql + '''' + ed_ReaderIp.Text + ''',';
    stSql := stSql + ' ' + ed_ReaderPort.Text + ',';
    stSql := stSql + ' ' + ed_FPReaderNo.Text + ',';
    stSql := stSql + '''' + ed_Readername.Text + ''',';
    stSql := stSql + '' + inttostr(cmb_ReaderType.ItemIndex) + ')';

    if DataModule1.ProcessExecSQL(stSql) then
    begin
      //전체 지문의 데이터를 입력
      stSql := ' Delete From TB_FINGERDEVICECARD where FD_DEVICEID = ' + ed_fdmsid.Text + ' ';
      DataModule1.ProcessExecSQL(stSql);
      stSql := ' Insert Into TB_FINGERDEVICECARD ( ';
      stSql := stSql + ' FD_DEVICEID, ';
      stSql := stSql + ' FP_USERID, ';
      stSql := stSql + ' FP_PERMIT, ';
      stSql := stSql + ' FP_SEND ) ';
      stSql := stSql + ' select ' + ed_fdmsid.Text + ',';
      stSql := stSql + ' FP_USERID,';
      stSql := stSql + ' FP_PERMIT,';
      stSql := stSql + ' ''N'' ';
      stSql := stSql + ' From TB_CARDFINGER ';

      DataModule1.ProcessExecSQL(stSql);
    end;
  end
  else if UpperCase(State) = 'UPDATE' then
  begin
    stSql := ' Update TB_FINGERDEVICE set FD_DEVICEIP = ''' + ed_ReaderIp.Text + ''',';
    stSql := stSql + ' FD_DEVICEPORT = ' + ed_ReaderPort.Text + ', ';
    stSql := stSql + ' FD_DEVICENO = ' + ed_FPReaderNo.Text + ', ';
    stSql := stSql + ' FD_DEVICENAME = ''' + ed_Readername.Text + ''', ';
    stSql := stSql + ' FD_DEVICETYPE = ''' + inttostr(cmb_ReaderType.ItemIndex) + ''', ';
    stSql := stSql + ' FD_CHANGE = ''Y'' ';
    stSql := stSql + ' Where FD_DEVICEID = ' + ed_fdmsid.Text + ' ';
    if DataModule1.ProcessExecSQL(stSql) then
  end;
  SearchReader(ed_fdmsid.Text,sg_Reader.TopRow);
  fmMain.DeviceChange;
end;

procedure TfmReaderManager.FormActivate(Sender: TObject);
begin
  inherited;
  SearchReader('');
end;

procedure TfmReaderManager.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmReaderManager.N1Click(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  stSql := ' Update TB_FINGERDEVICECARD set FP_SEND = ''N'' where FD_DEVICEID = ' + sg_Reader.Cells[4,sg_Reader.Row] + '';
  DataModule1.ProcessExecSQL(stSql);  
end;

procedure TfmReaderManager.mn_FPDataAllDeleteClick(Sender: TObject);
var
  stFPNodeNo : string;
  nIndex : integer;
  Tick: DWORD;
  NowTick: DWORD;
begin
  inherited;
  stFPNodeNo := FillZeroNumber(strtoint(sg_Reader.Cells[4,sg_Reader.Row]),G_nFDDeviceIDLength);
  nIndex := SHNodeList.IndexOf(stFPNodeNo);
  if nIndex < 0 then
  begin
    showmessage('현재 통신 연결이 되어 있지 않아 지문삭제가 안됩니다.(1)');
    Exit;
  end;
  if TFPNode(SHNodeList.Objects[nIndex]).SocketConnected <> Connected then
  begin
    TFPNode(SHNodeList.Objects[nIndex]).Open := True;
  end;

  Tick := GetTickCount + DWORD(2000);
  while TFPNode(SHNodeList.Objects[nIndex]).SocketConnected  <> Connected do
  begin
    NowTick := GetTickCount;
    if Tick < NowTick then break;
    Application.ProcessMessages;
  end;
  if TFPNode(SHNodeList.Objects[nIndex]).SocketConnected <> Connected then
  begin
    showmessage('현재 통신 연결이 되어 있지 않아 지문삭제가 안됩니다.(2)');
    Exit;
  end;
  TFPNode(SHNodeList.Objects[nIndex]).UserAllDelete;
end;

initialization
  RegisterClass(TfmReaderManager);
Finalization
  UnRegisterClass(TfmReaderManager);

end.
