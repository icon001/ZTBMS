unit uSysAirconRelay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  ExtCtrls, Spin, uSubForm, CommandArray;

type
  TfmSysAirconRelay = class(TfmASubForm)
    StatusBar1: TStatusBar;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    Panel1: TPanel;
    sg_Code: TAdvStringGrid;
    Panel2: TPanel;
    Label19: TLabel;
    ed_Relayname: TEdit;
    Label1: TLabel;
    ed_RelayID: TEdit;
    ed_dmscode: TEdit;
    Label3: TLabel;
    se_DeviceCount: TSpinEdit;
    Panel3: TPanel;
    Label4: TLabel;
    cmb_DMS: TComboBox;
    Label2: TLabel;
    cmb_Controler: TComboBox;
    ed_controlerid: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_DMSChange(Sender: TObject);
    procedure cmb_ControlerChange(Sender: TObject);
  private
    State : string;
    L_nTopRow : integer;
    L_nRelayCount : integer;
    DMSCodeList : TStringList;
    ControlerCodeList : TStringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure SearchRelay(aCode:String;aTop:integer=0);
    procedure LoadDMS;
    procedure LoadControler;
  private
    function GetTB_SYSAIRDevice_Count(aDmsCode,aControlerID,aRelayID:string):integer;
    function GetNextRelayID(aDmsCode,aControlerID:string):string;

    function InsertIntoTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID,aName:string):Boolean;
    function InsertIntoTB_SYSAIRCONDEVICE(aNodeNo,aControlerID,aRelayID,aDeviceID,aName:string):Boolean;
    function UpdateTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID,aName:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE(aNodeNo,aControlerID,aRelayID,aDeviceID:string):Boolean;

    function DeleteTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE_Relay(aNodeNo,aControlerID,aRelayID:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSysAirconRelay: TfmSysAirconRelay;

implementation
uses
  uDBModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmSysAirconRelay.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSysAirconRelay.ButtonEnable(aState: string);
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

procedure TfmSysAirconRelay.FormClear;
begin
  ed_RelayID.Text := '';
  ed_Relayname.Text := '';
  ed_dmscode.Text := '';
  ed_ControlerID.Text := '';
  se_DeviceCount.Value := 1;
end;

procedure TfmSysAirconRelay.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_RelayID.Enabled := True;
    ed_Relayname.Enabled := True;
    se_DeviceCount.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_RelayID.Enabled := False;
    ed_Relayname.Enabled := True;
    se_DeviceCount.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_RelayID.Enabled := False;
    ed_Relayname.Enabled := False;
    se_DeviceCount.Enabled := False;
  end else if UpperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_RelayID.Enabled := False;
    ed_Relayname.Enabled := False;
    se_DeviceCount.Enabled := False;
  end;

end;

procedure TfmSysAirconRelay.btn_InsertClick(Sender: TObject);
var
  stNodeNo : string;
  stControlerID : string;
begin
  if cmb_DMS.itemIndex < 0 then Exit;
  if cmb_Controler.itemIndex < 0 then Exit;

  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Code do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 9 then TopRow := RowCount - 9;
      Enabled := False;
    end;
  end;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.itemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.itemIndex];
  stControlerID := copy(stControlerID,4,2);
  ed_RelayID.Text := GetNextRelayID(stNodeNo,stControlerID);
end;

procedure TfmSysAirconRelay.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmSysAirconRelay.btn_DeleteClick(Sender: TObject);
var
  stNodeNo : string;
  stControlerID : string;
begin
  if cmb_DMS.ItemIndex < 0 then Exit;
  if cmb_Controler.ItemIndex < 0 then Exit;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.ItemIndex];
  stControlerID := copy(stControlerID,4,2);
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_SYSAIRCONDEVICE_Relay(stNodeNo,stControlerID,ed_RelayID.Text);
  DeleteTB_SYSAIRCONRELAY(stNodeNo,stControlerID,ed_RelayID.Text);
  SearchRelay('');
end;

procedure TfmSysAirconRelay.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_code do
  begin
    if cells[0,Row] = '' then Exit;
    ed_RelayID.Text := cells[0,Row];
    ed_Relayname.Text := cells[1,Row];
    ed_dmscode.Text := cells[2,Row];
    ed_ControlerID.Text := cells[3,Row];
  end;
  L_nRelayCount := GetTB_SYSAIRDevice_Count(ed_dmscode.Text,ed_ControlerID.Text,ed_RelayID.Text);
  se_DeviceCount.Value := L_nRelayCount;

end;

function TfmSysAirconRelay.GetTB_SYSAIRDevice_Count(aDmsCode,aControlerID,aRelayID: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' select Max(SD_DEVICEID) as id from TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aDmsCode + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if Not isDigit(FindField('id').AsString) then Exit;
    result := strtoint(FindField('id').AsString);
  end; 
end;

procedure TfmSysAirconRelay.SearchRelay(aCode: String; aTop: integer);
var
  stSql : string;
  stNodeNo : string;
  stControlerID : string;
  nRow : integer;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_Code); //스트링그리드 초기화

  if cmb_DMS.ItemIndex < 0 then Exit;
  if cmb_Controler.ItemIndex < 0 then Exit;

  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.ItemIndex];
  stControlerID := copy(stControlerID,4,2);

  stSql := 'select * from TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + stControlerID + ''' ';
  stSql := stSql + ' order by SD_RELAYID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    sg_Code.RowCount := recordcount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_Code do
      begin
        cells[0,nRow] := FindField('SD_RELAYID').AsString;
        cells[1,nRow] := FindField('SD_RELAYNAME').AsString;
        cells[2,nRow] := FindField('SD_NODENO').AsString;
        cells[3,nRow] := FindField('SD_CONTROLERID').AsString;
        if (FindField('SD_NODENO').AsString + FindField('SD_CONTROLERID').AsString + FindField('SD_RELAYID').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      if aTop = 0 then
      begin
        if sg_Code.Row > 9 then sg_Code.TopRow := sg_Code.Row - 9;
      end else
      begin
        sg_Code.TopRow := aTop;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_CodeClick(sg_Code);
end;

procedure TfmSysAirconRelay.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stControlerID : string;
  i : integer;
begin
  inherited;
  if cmb_DMS.itemIndex < 0 then
  begin
    showmessage('DMS 를 선택 해 주세요');
    Exit;
  end;
  if cmb_Controler.itemIndex < 0 then
  begin
    showmessage('중앙제어기를 선택 해 주세요');
    Exit;
  end;
  if Not IsDigit(ed_RelayID.Text) then
  begin
    showmessage('중계기 ID 를 확인해 주세요.');
    Exit;
  end;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.itemIndex];
  stControlerID := ControlerCodeList.Strings[cmb_Controler.itemIndex];
  stControlerID := copy(stControlerID,4,2);

  if State = 'INSERT' then
  begin
    InsertIntoTB_SYSAIRCONRELAY(stNodeNo,stControlerID,ed_RelayID.Text, ed_Relayname.Text);
  end else if State = 'UPDATE' then
  begin
    UpdateTB_SYSAIRCONRELAY(stNodeNo,stControlerID,ed_RelayID.Text, ed_Relayname.Text);
    if se_DeviceCount.Value = L_nRelayCount then
    begin
      SearchRelay(stNodeNo + stControlerID + ed_RelayID.Text,sg_code.TopRow);
      Exit; //변경 내역 없으면 빠져 나감
    end;
  end;
  for i := 0 to se_DeviceCount.Value do
  begin
    InsertIntoTB_SYSAIRCONDEVICE(stNodeNo,stControlerID,ed_RelayID.text, FillZeroNumber(i,2),ed_Relayname.Text + '_' + FillZeroNumber(i,2));
  end;
  if se_DeviceCount.Value < 15 then
  begin
    for i := se_DeviceCount.Value + 1 to 15 do
    begin
      DeleteTB_SYSAIRCONDEVICE(stNodeNo,stControlerID,ed_RelayID.text,FillZeroNumber(i,2));
    end;
  end;
  if State = 'UPDATE' then
     SearchRelay(stNodeNo + stControlerID + ed_RelayID.Text,sg_code.TopRow)
  else SearchRelay(stNodeNo + stControlerID + ed_RelayID.Text);
end;

function TfmSysAirconRelay.GetNextRelayID(aDmsCode,aControlerID:string): string;
var
  stSql : string;
begin
  result := '01';
  stSql := ' select Max(SD_RELAYID) as id from TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aDmsCode + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if Not isDigit(FindField('id').asstring) then Exit;
    result := FillZeroNumber(strtoint(FindField('id').asstring) + 1,2);
  end;
end;

function TfmSysAirconRelay.UpdateTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID,aName:string):Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_SYSAIRCONRELAY set ';
  stSql := stSql + 'SD_RELAYNAME = ''' + aName + ''' ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' +  aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' +  aRelayID + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmSysAirconRelay.DeleteTB_SYSAIRCONDEVICE(aNodeNo,aControlerID,aRelayID,aDeviceID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  stSql := stSql + ' AND SD_DEVICEID = ''' + aDeviceID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconRelay.DeleteTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID:string):Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;


function TfmSysAirconRelay.DeleteTB_SYSAIRCONDEVICE_Relay(aNodeNo,aControlerID,aRelayID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;


procedure TfmSysAirconRelay.btn_CancelClick(Sender: TObject);
begin
  inherited;
  SearchRelay(ed_dmscode.Text + ed_ControlerID.Text + ed_RelayID.Text,sg_Code.TopRow);
end;

procedure TfmSysAirconRelay.FormActivate(Sender: TObject);
begin
  inherited;
  LoadDMS;
  LoadControler;
  SearchRelay('');
end;

procedure TfmSysAirconRelay.FormCreate(Sender: TObject);
begin
  inherited;
  DMSCodeList := TStringList.Create;
  ControlerCodeList := TStringList.Create;
end;

procedure TfmSysAirconRelay.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSCodeList.Free;
  ControlerCodeList.Free;
end;

procedure TfmSysAirconRelay.LoadDMS;
var
  stSql : string;
begin
  DMSCodeList.Clear;
  cmb_DMS.Items.Clear;
  cmb_DMS.ItemIndex := -1;
  
  stSql := 'select * from TB_SYSAIRCONDMS ';
  stSql := stSql + ' order by SD_NODENO ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      DMSCodeList.Add(FillZeroNumber(FindField('SD_NODENO').asinteger,3));
      cmb_DMS.Items.Add(FindField('SD_DMSNAME').AsString);
      Next;
    end;
  end;
  cmb_DMS.ItemIndex := 0;

end;

function TfmSysAirconRelay.InsertIntoTB_SYSAIRCONRELAY(aNodeNo,
  aControlerID, aRelayID, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_SYSAIRCONRELAY( ';
  stSql := stSql + ' SD_NODENO,';
  stSql := stSql + ' SD_CONTROLERID,';
  stSql := stSql + ' SD_RELAYID,';
  stSql := stSql + ' SD_RELAYNAME )';
  stSql := stSql + ' Values(';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + '''' + aControlerID + ''',';
  stSql := stSql + '''' + aRelayID + ''',';
  stSql := stSql + '''' + aName + ''')';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

procedure TfmSysAirconRelay.LoadControler;
var
  stSql : string;
  stNodeNo : string;
begin
  ControlerCodeList.Clear;
  cmb_Controler.Items.Clear;
  cmb_Controler.ItemIndex := -1;
  if cmb_DMS.ItemIndex < 0 then Exit;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];

  stSql := 'select * from TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' order by SD_CONTROLERID ';

  with dmDBModule.ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    While Not Eof do
    begin
      ControlerCodeList.Add(FillZeroNumber(FindField('SD_NODENO').asinteger,3) + FindField('SD_CONTROLERID').AsString);
      cmb_Controler.Items.Add(FindField('SD_CONTROLERNAME').AsString);
      Next;
    end;
  end;
  cmb_Controler.ItemIndex := 0;
end;

procedure TfmSysAirconRelay.cmb_DMSChange(Sender: TObject);
begin
  inherited;
  LoadControler;
  SearchRelay('');
end;

function TfmSysAirconRelay.InsertIntoTB_SYSAIRCONDEVICE(aNodeNo,
  aControlerID, aRelayID, aDeviceID, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_SYSAIRCONDEVICE( ';
  stSql := stSql + ' SD_NODENO,';
  stSql := stSql + ' SD_CONTROLERID,';
  stSql := stSql + ' SD_RELAYID,';
  stSql := stSql + ' SD_DEVICEID,';
  stSql := stSql + ' SD_DEVICENAME )';
  stSql := stSql + ' Values(';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + '''' + aControlerID + ''',';
  stSql := stSql + '''' + aRelayID + ''',';
  stSql := stSql + '''' + aDeviceID + ''',';
  stSql := stSql + '''' + aName + ''')';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmSysAirconRelay.cmb_ControlerChange(Sender: TObject);
begin
  inherited;
  SearchRelay('');
end;

end.
