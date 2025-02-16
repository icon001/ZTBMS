unit uSysAirconControler;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  ExtCtrls, Spin, uSubForm, CommandArray;

type
  TfmSysAirconControler = class(TfmASubForm)
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
    ed_Controlername: TEdit;
    Label1: TLabel;
    ed_ControlerID: TEdit;
    ed_dmscode: TEdit;
    Label3: TLabel;
    se_RelayCount: TSpinEdit;
    Panel3: TPanel;
    Label4: TLabel;
    cmb_DMS: TComboBox;
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
  private
    State : string;
    L_nTopRow : integer;
    L_nRelayCount : integer;
    DMSCodeList : TStringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure SearchControler(aCode:String;aTop:integer=0);
    procedure LoadDMS;
  private
    function GetTB_SYSAIRRELAY_Count(aDmsCode,aControlerID:string):integer;
    function GetNextControlerID(aDmsCode:string):string;

    function InsertIntoTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID,aName:string):Boolean;
    function InsertIntoTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID,aControlerName:string):Boolean;
    function UpdateTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID,aControlerName:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE_RELAY(aNodeNo,aControlerID,aRelayID:string):Boolean;
    function DeleteTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID:string):Boolean;
    function DeleteTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE_CONTROLER(aNodeNo,aControlerID:string):Boolean;
    function DeleteTB_SYSAIRCONRELAY_CONTROLER(aNodeNo,aControlerID:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSysAirconControler: TfmSysAirconControler;

implementation
uses
  uDBModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmSysAirconControler.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSysAirconControler.ButtonEnable(aState: string);
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

procedure TfmSysAirconControler.FormClear;
begin
  ed_ControlerID.Text := '';
  ed_Controlername.Text := '';
  ed_dmscode.Text := '';
  se_RelayCount.Value := 1;
end;

procedure TfmSysAirconControler.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_ControlerID.Enabled := True;
    ed_Controlername.Enabled := True;
    se_RelayCount.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_ControlerID.Enabled := False;
    ed_Controlername.Enabled := True;
    se_RelayCount.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_ControlerID.Enabled := False;
    ed_Controlername.Enabled := False;
    se_RelayCount.Enabled := False;
  end else if UpperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_ControlerID.Enabled := False;
    ed_Controlername.Enabled := False;
    se_RelayCount.Enabled := False;
  end;

end;

procedure TfmSysAirconControler.btn_InsertClick(Sender: TObject);
var
  stNodeNo : string;
begin
  if cmb_DMS.itemIndex < 0 then Exit;
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
  ed_ControlerID.Text := GetNextControlerID(stNodeNo);
end;

procedure TfmSysAirconControler.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmSysAirconControler.btn_DeleteClick(Sender: TObject);
var
  stNodeNo : string;
begin
  if cmb_DMS.ItemIndex < 0 then Exit;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.ItemIndex];
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_SYSAIRCONDEVICE_CONTROLER(stNodeNo,ed_ControlerID.Text);
  DeleteTB_SYSAIRCONRELAY_CONTROLER(stNodeNo,ed_ControlerID.Text);
  DeleteTB_SYSAIRCONCONTROLER(stNodeNo,ed_ControlerID.Text);
  SearchControler('');
end;

procedure TfmSysAirconControler.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_code do
  begin
    if cells[0,Row] = '' then Exit;
    ed_ControlerID.Text := cells[0,Row];
    ed_Controlername.Text := cells[1,Row];
    ed_dmscode.Text := cells[2,Row];
  end;
  L_nRelayCount := GetTB_SYSAIRRELAY_Count(ed_dmscode.Text,ed_ControlerID.Text);
  se_RelayCount.Value := L_nRelayCount;

end;

function TfmSysAirconControler.GetTB_SYSAIRRELAY_Count(aDmsCode,aControlerID: string): integer;
var
  stSql : string;
begin
  result := 0;
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
    if Not isDigit(FindField('id').AsString) then Exit;
    result := strtoint(FindField('id').AsString);
  end; 
end;

procedure TfmSysAirconControler.SearchControler(aCode: String; aTop: integer);
var
  stSql : string;
  stNodeNo : string;
  nRow : integer;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_Code); //스트링그리드 초기화

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
    sg_Code.RowCount := recordcount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_Code do
      begin
        cells[0,nRow] := FindField('SD_CONTROLERID').AsString;
        cells[1,nRow] := FindField('SD_CONTROLERNAME').AsString;
        cells[2,nRow] := FindField('SD_NODENO').AsString;
        if (FindField('SD_NODENO').AsString + FindField('SD_CONTROLERID').AsString)  = aCode then
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

procedure TfmSysAirconControler.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  i : integer;
begin
  inherited;
  if cmb_DMS.itemIndex < 0 then
  begin
    showmessage('DMS 를 선택 해 주세요');
    Exit;
  end;
  if Not IsDigit(ed_ControlerID.Text) then
  begin
    showmessage('제어기 ID 를 확인해 주세요.');
    Exit;
  end;
  stNodeNo := DMSCodeList.Strings[cmb_DMS.itemIndex];

  if State = 'INSERT' then
  begin
    InsertIntoTB_SYSAIRCONCONTROLER(stNodeNo,ed_ControlerID.Text, ed_Controlername.Text);
  end else if State = 'UPDATE' then
  begin
    UpdateTB_SYSAIRCONCONTROLER(stNodeNo,ed_ControlerID.Text, ed_Controlername.Text);
    if se_RelayCount.Value = L_nRelayCount then
    begin
      SearchControler(ed_dmscode.Text + ed_ControlerID.Text,sg_code.TopRow);
      Exit; //변경 내역 없으면 빠져 나감
    end;
  end;
  for i := 0 to se_RelayCount.Value do
  begin
    InsertIntoTB_SYSAIRCONRELAY(stNodeNo,ed_ControlerID.Text,FillZeroNumber(i,2),ed_Controlername.Text + '_' + FillZeroNumber(i,2));
  end;
  if se_RelayCount.Value < 15 then
  begin
    for i := se_RelayCount.Value + 1 to 15 do
    begin
      DeleteTB_SYSAIRCONDEVICE_RELAY(stNodeNo,ed_ControlerID.Text,FillZeroNumber(i,2));
      DeleteTB_SYSAIRCONRELAY(stNodeNo,ed_ControlerID.Text,FillZeroNumber(i,2));
    end;
  end;
  if State = 'UPDATE' then
     SearchControler(ed_dmscode.Text + ed_ControlerID.Text,sg_code.TopRow)
  else SearchControler(stNodeNo + ed_ControlerID.Text);
end;

function TfmSysAirconControler.GetNextControlerID(aDmsCode:string): string;
var
  stSql : string;
begin
  result := '01';
  stSql := ' select Max(SD_CONTROLERID) as id from TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + aDmsCode + ' ';

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

function TfmSysAirconControler.UpdateTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID,aControlerName:string):Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_SYSAIRCONCONTROLER set ';
  stSql := stSql + 'SD_CONTROLERNAME = ''' + aControlerName + ''' ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' +  aControlerID + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmSysAirconControler.InsertIntoTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID,aControlerName:string):Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_SYSAIRCONCONTROLER( ';
  stSql := stSql + ' SD_NODENO,';
  stSql := stSql + ' SD_CONTROLERID,';
  stSql := stSql + ' SD_CONTROLERNAME )';
  stSql := stSql + ' Values(';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + '''' + aControlerID + ''',';
  stSql := stSql + '''' + aControlerName + ''')';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconControler.DeleteTB_SYSAIRCONCONTROLER(aNodeNo,
  aControlerID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconControler.DeleteTB_SYSAIRCONDEVICE_RELAY(aNodeNo,aControlerID,aRelayID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconControler.DeleteTB_SYSAIRCONRELAY(aNodeNo,aControlerID,aRelayID:string):Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  stSql := stSql + ' AND SD_RELAYID = ''' + aRelayID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;


function TfmSysAirconControler.DeleteTB_SYSAIRCONDEVICE_CONTROLER(aNodeNo,aControlerID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;


function TfmSysAirconControler.DeleteTB_SYSAIRCONRELAY_CONTROLER(aNodeNo,aControlerID:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmSysAirconControler.btn_CancelClick(Sender: TObject);
begin
  inherited;
  SearchControler(ed_dmscode.Text + ed_ControlerID.Text,sg_Code.TopRow);
end;

procedure TfmSysAirconControler.FormActivate(Sender: TObject);
begin
  inherited;
  LoadDMS;
  SearchControler('');
end;

procedure TfmSysAirconControler.FormCreate(Sender: TObject);
begin
  inherited;
  DMSCodeList := TStringList.Create;
end;

procedure TfmSysAirconControler.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DMSCodeList.Free;
end;

procedure TfmSysAirconControler.LoadDMS;
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

function TfmSysAirconControler.InsertIntoTB_SYSAIRCONRELAY(aNodeNo,
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

procedure TfmSysAirconControler.cmb_DMSChange(Sender: TObject);
begin
  inherited;
  SearchControler('');
end;

end.
