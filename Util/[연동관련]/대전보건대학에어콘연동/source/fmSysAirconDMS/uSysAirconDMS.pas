unit uSysAirconDMS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  ExtCtrls, Spin, uSubForm, CommandArray;

type
  TfmSysAirconDMS = class(TfmASubForm)
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
    ed_dmsname: TEdit;
    Label1: TLabel;
    ed_dmsip: TEdit;
    Label2: TLabel;
    ed_dmsport: TEdit;
    ed_dmscode: TEdit;
    Label3: TLabel;
    se_ControlerCount: TSpinEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    State : string;
    L_nTopRow : integer;
    L_nControlerCount : integer;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure SearchDMS(aCode:String;aTop:integer=0);
  private
    function GetTB_SYSAIRCONCONTROLER_Count(aDmsCount:string):integer;
    function GetDMSNextNodeNo:string;

    function InsertIntoTB_SYSAIRCONDMS(aNodeNo,aName,aIP,aPort:string):Boolean;
    function InsertIntoTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID,aControlerName:string):Boolean;
    function UpdateTB_SYSAIRCONDMS(aNodeNo,aName,aIP,aPort:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE_CONTROLER(aNodeNo,aControlerID:string):Boolean;
    function DeleteTB_SYSAIRCONRELAY_CONTROLER(aNodeNo,aControlerID:string):Boolean;
    function DeleteTB_SYSAIRCONCONTROLER(aNodeNo,aControlerID:string):Boolean;
    function DeleteTB_SYSAIRCONDEVICE_DMS(aNodeNo:string):Boolean;
    function DeleteTB_SYSAIRCONRELAY_DMS(aNodeNo:string):Boolean;
    function DeleteTB_SYSAIRCONCONTROLER_DMS(aNodeNo:string):Boolean;
    function DeleteTB_SYSAIRCONDMS(aNodeNo:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmSysAirconDMS: TfmSysAirconDMS;

implementation
uses
  uDBModule,
  uLomosUtil;
{$R *.dfm}

procedure TfmSysAirconDMS.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSysAirconDMS.ButtonEnable(aState: string);
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

procedure TfmSysAirconDMS.FormClear;
begin
  ed_dmsip.Text := '';
  ed_dmsport.Text := '11000';
  ed_dmsname.Text := '';
  ed_dmscode.Text := '';
  se_ControlerCount.Value := 1;
end;

procedure TfmSysAirconDMS.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_dmsip.Enabled := True;
    ed_dmsport.Enabled := True;
    ed_dmsname.Enabled := True;
    se_ControlerCount.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_dmsip.Enabled := True;
    ed_dmsport.Enabled := True;
    ed_dmsname.Enabled := True;
    se_ControlerCount.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_dmsip.Enabled := False;
    ed_dmsport.Enabled := False;
    ed_dmsname.Enabled := False;
    se_ControlerCount.Enabled := False;
  end else if UpperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_dmsip.Enabled := False;
    ed_dmsport.Enabled := False;
    ed_dmsname.Enabled := False;
    se_ControlerCount.Enabled := False;
  end;

end;

procedure TfmSysAirconDMS.btn_InsertClick(Sender: TObject);
begin
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

end;

procedure TfmSysAirconDMS.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmSysAirconDMS.btn_DeleteClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_SYSAIRCONDEVICE_DMS(ed_dmscode.Text);
  DeleteTB_SYSAIRCONRELAY_DMS(ed_dmscode.Text);
  DeleteTB_SYSAIRCONCONTROLER_DMS(ed_dmscode.Text);
  DeleteTB_SYSAIRCONDMS(ed_dmscode.Text);
  SearchDMS('');
end;

procedure TfmSysAirconDMS.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_code do
  begin
    if cells[3,Row] = '' then Exit;
    ed_dmsip.Text := cells[0,Row];
    ed_dmsname.Text := cells[1,Row];
    ed_dmsport.Text := cells[2,Row];
    ed_dmscode.Text := cells[3,Row];
  end;
  L_nControlerCount := GetTB_SYSAIRCONCONTROLER_Count(ed_dmscode.Text);
  se_ControlerCount.Value := L_nControlerCount;

end;

function TfmSysAirconDMS.GetTB_SYSAIRCONCONTROLER_Count(
  aDmsCount: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := ' select Max(SD_CONTROLERID) as id from TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + aDmsCount + ' ';

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

procedure TfmSysAirconDMS.SearchDMS(aCode: String; aTop: integer);
var
  stSql : string;
  nRow : integer;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_Code); //스트링그리드 초기화

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
    sg_Code.RowCount := recordcount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_Code do
      begin
        cells[0,nRow] := FindField('SD_IP').AsString;
        cells[1,nRow] := FindField('SD_DMSNAME').AsString;
        cells[2,nRow] := FindField('SD_PORT').AsString;
        cells[3,nRow] := FindField('SD_NODENO').AsString;
        if (FindField('SD_NODENO').AsString)  = aCode then
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

procedure TfmSysAirconDMS.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  i : integer;
begin
  inherited;
  if ed_dmsip.Text = '' then
  begin
    showmessage('DMS IP 를 확인해 주세요.');
    Exit;
  end;
  
  if State = 'INSERT' then
  begin
    stNodeNo := GetDMSNextNodeNo;
    InsertIntoTB_SYSAIRCONDMS(stNodeNo,ed_dmsname.Text,ed_dmsip.Text,ed_dmsport.Text);
  end else if State = 'UPDATE' then
  begin
    stNodeNo := ed_dmscode.Text;
    UpdateTB_SYSAIRCONDMS(stNodeNo,ed_dmsname.Text,ed_dmsip.Text,ed_dmsport.Text);
    if se_ControlerCount.Value = L_nControlerCount then
    begin
      SearchDMS(stNodeNo,sg_code.TopRow);
      Exit; //변경 내역 없으면 빠져 나감
    end;
  end;
  for i := 0 to se_ControlerCount.Value do
  begin
    InsertIntoTB_SYSAIRCONCONTROLER(stNodeNo,FillZeroNumber(i,2),ed_dmsname.Text + '_' + FillZeroNumber(i,2));
  end;
  if se_ControlerCount.Value < 15 then
  begin
    for i := se_ControlerCount.Value + 1 to 15 do
    begin
      DeleteTB_SYSAIRCONDEVICE_CONTROLER(stNodeNo,FillZeroNumber(i,2));
      DeleteTB_SYSAIRCONRELAY_CONTROLER(stNodeNo,FillZeroNumber(i,2));
      DeleteTB_SYSAIRCONCONTROLER(stNodeNo,FillZeroNumber(i,2));
    end;
  end;
  if State = 'UPDATE' then
     SearchDMS(stNodeNo,sg_code.TopRow)
  else SearchDMS(stNodeNo);
end;

function TfmSysAirconDMS.GetDMSNextNodeNo: string;
var
  stSql : string;
begin
  result := '1';
  stSql := ' select Max(SD_NODENO) as id from TB_SYSAIRCONDMS ';

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
    result := inttostr(FindField('id').asinteger + 1);
  end;
end;

function TfmSysAirconDMS.InsertIntoTB_SYSAIRCONDMS(aNodeNo, aName, aIP,
  aPort: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_SYSAIRCONDMS(SD_NODENO,SD_DMSNAME,SD_IP,SD_PORT) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + ' ' + aNodeNo + ',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aIP + ''',';
  stSql := stSql + '''' + aPort + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.UpdateTB_SYSAIRCONDMS(aNodeNo, aName, aIP,
  aPort: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_SYSAIRCONDMS set ';
  stSql := stSql + 'SD_DMSNAME = ''' + aName + ''',';
  stSql := stSql + 'SD_IP = ''' + aIP + ''',';
  stSql := stSql + 'SD_PORT = ''' + aPort + ''' ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmSysAirconDMS.InsertIntoTB_SYSAIRCONCONTROLER(aNodeNo,
  aControlerID, aControlerName: string): Boolean;
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

function TfmSysAirconDMS.DeleteTB_SYSAIRCONCONTROLER(aNodeNo,
  aControlerID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONDEVICE_CONTROLER(aNodeNo,
  aControlerID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONRELAY_CONTROLER(aNodeNo,
  aControlerID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND SD_CONTROLERID = ''' + aControlerID + ''' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONCONTROLER_DMS(aNodeNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONCONTROLER ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONDEVICE_DMS(aNodeNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDEVICE ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONDMS(aNodeNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONDMS ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmSysAirconDMS.DeleteTB_SYSAIRCONRELAY_DMS(aNodeNo:string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_SYSAIRCONRELAY ';
  stSql := stSql + ' Where SD_NODENO = ' + aNodeNo + ' ';
  result := dmDBModule.ProcessExecSQL(stSql);

end;

procedure TfmSysAirconDMS.btn_CancelClick(Sender: TObject);
begin
  inherited;
  SearchDMS(ed_dmscode.Text,sg_Code.TopRow);
end;

procedure TfmSysAirconDMS.FormActivate(Sender: TObject);
begin
  inherited;
  SearchDMS('');
end;

end.
