unit uATIncode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, BaseGrid, AdvGrid, ComCtrls, Buttons, StdCtrls,
  uSubForm, CommandArray,ADODB,ActiveX, DB;

type
  TfmATIncode = class(TfmASubForm)
    Panel11: TPanel;
    GroupBox2: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sg_Code: TAdvStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    ed_code: TEdit;
    ed_name: TEdit;
    Label3: TLabel;
    cmb_Type: TComboBox;
    Label4: TLabel;
    chk_AutoATInCode: TCheckBox;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_codeExit(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure chk_AutoATInCodeClick(Sender: TObject);
    procedure ed_codeChange(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure LoadATInCodeType;
    procedure ShowATInCode(aCode:string);
    function InsertTB_ATINCODE(acode,aname,aType:string):Boolean;
    function UpdateTB_ATINCODE(acode,aname,aType:string):Boolean;
    function DeleteTB_ATINCODE(acode:string):Boolean;

    function GetAutoATInCode:string;
  public
    { Public declarations }
  end;

var
  fmATIncode: TfmATIncode;

implementation

uses
  uDataModule1,
  uLomosUtil, uCommonSql;

{$R *.dfm}

procedure TfmATIncode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmATIncode.ButtonEnable(aState: string);
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
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
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
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end;

end;

procedure TfmATIncode.FormClear;
begin
  ed_code.Text := '';
  ed_name.Text := '';
  cmb_Type.ItemIndex := -1;
end;

procedure TfmATIncode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_code.Enabled := True;
    chk_AutoATInCode.Enabled := True;
    ed_name.Enabled := True;
    cmb_Type.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_code.Enabled := False;
    chk_AutoATInCode.Enabled := False;
    ed_name.Enabled := False;
    cmb_Type.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_code.Enabled := False;
    chk_AutoATInCode.Enabled := False;
    ed_name.Enabled := False;
    cmb_Type.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_code.Enabled := False;
    chk_AutoATInCode.Enabled := False;
    ed_name.Enabled := True;
    cmb_Type.Enabled := True;
  end;
end;

procedure TfmATIncode.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;
  LoadATInCodeType;
  ShowATInCode('');

end;

procedure TfmATIncode.FormCreate(Sender: TObject);
begin
  sg_Code.ColWidths[3] := 0;
  sg_Code.ColWidths[4] := 0;
end;

procedure TfmATIncode.LoadATInCodeType;
var
  stSql : string;
  stStr : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Type.Clear;
  cmb_Type.Clear;

  stSql := 'Select * from TB_ATINCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AT_SYSTEM = ''Y'' ';
  stSql := stSql + ' order by AT_INTYPE ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      stStr := FindField('AT_INTYPE').AsString + '.' + FindField('AT_INNAME').AsString;

      cmb_Type.Items.Add(stStr);
      Next;
    end;
    cmb_Type.ItemIndex := -1;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmATIncode.ShowATInCode(aCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'Select * from TB_ATINCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';
  stSql := stSql + ' order by AT_INCODE ';

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    nRow := 1;
    sg_Code.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_Code do
      begin
        cells[0,nRow] := FindField('AT_INCODE').AsString;
        cells[1,nRow] := FindField('AT_INNAME').AsString;
        cells[2,nRow] := FindField('AT_INTYPE').AsString;
        cells[3,nRow] := FindField('AT_SYSTEM').AsString;
        cells[4,nRow] := FindField('AT_INRESULT').AsString;
        if (FindField('AT_INCODE').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;

  end;

  TempAdoQuery.Free;
  CoUninitialize;
  sg_CodeClick(sg_Code);

end;

procedure TfmATIncode.btn_InsertClick(Sender: TObject);
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
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;
  if chk_AutoATInCode.Checked then chk_AutoATInCodeClick(self);
  ed_code.SetFocus;
end;

procedure TfmATIncode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmATIncode.btn_CancelClick(Sender: TObject);
begin
  ShowATInCode(ed_code.Text);
end;

procedure TfmATIncode.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_code.Text) = '' then
  begin
    showmessage('출근코드가 없습니다.');
    Exit;
  end;
  if Not IsDigit(ed_code.Text) then
  begin
    showmessage('코드는 숫자만 입력하세요.');
    ed_code.SetFocus;
    Exit;
  end;
  if IsDigit(ed_code.Text) then
  begin
    if strtoint(ed_code.Text) <= 10 then
    begin
      showmessage('001~010 까지는 시스템 코드이므로 사용할 수 없습니다.');
      Exit;
    end;
  end;
  if cmb_Type.ItemIndex < 0 then
  begin
    showmessage('출근코드 Type 가 선택되지 않았습니다.');
    Exit;
  end;
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_ATINCODE(ed_code.Text,ed_name.Text,copy(cmb_Type.Text,1,1))
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_ATINCODE(ed_code.Text,ed_name.Text,copy(cmb_Type.Text,1,1));

  if bResult then ShowATInCode(ed_code.Text)
  else showmessage('저장실패');
end;

function TfmATIncode.DeleteTB_ATINCODE(acode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_INCODE = ''' + aCode + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmATIncode.InsertTB_ATINCODE(acode, aname,
  aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATINCODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_INCODE,';
  stSql := stSql + ' AT_INNAME,';
  stSql := stSql + ' AT_INTYPE,';
  stSql := stSql + ' AT_SYSTEM ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + acode + ''', ';
  stSql := stSql + '''' + aname + ''', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '''N'') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmATIncode.UpdateTB_ATINCODE(acode, aname,
  aType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATINCODE set ';
  stSql := stSql + ' AT_INNAME = ''' + aname + ''',';
  stSql := stSql + ' AT_INTYPE = ''' + aType + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_INCODE = ''' + aCode + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATIncode.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  bResult := DeleteTB_ATINCODE(ed_code.Text);

  if bResult then ShowATInCode(ed_code.Text)
  else showmessage('삭제실패.');

end;

procedure TfmATIncode.ed_codeExit(Sender: TObject);
begin
  if IsDigit(ed_Code.Text) then
  begin
    if strtoint(ed_Code.Text) <= 10 then
    begin
      showmessage(ed_Code.Text + ' 는 시스템이 이미 사용중인 코드입니다. 다른 코드를 입력해 주세요.');
      ed_Code.Text := '';
      Exit;
    end;
  end;

end;

procedure TfmATIncode.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_code.Text := cells[0,Row];
    ed_name.Text := cells[1,Row];
    if IsDigit(cells[2,Row]) then
      cmb_Type.ItemIndex := strtoint(cells[2,Row]) - 1;
  end;

end;

procedure TfmATIncode.chk_AutoATInCodeClick(Sender: TObject);
begin
  if chk_AutoATInCode.Checked then ed_Code.Text := GetAutoATInCode;

end;

function TfmATIncode.GetAutoATInCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 11;
  stSql := CommonSql.GetMaxATInCode;
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('AT_INCODE').AsString) then
      begin
        nSeq := strtoint(FindField('AT_INCODE').AsString) + 1;
        if nSeq < 11 then nSeq := 11;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmATIncode.ed_codeChange(Sender: TObject);
begin
  if ed_code.Text = '' then exit;
  if Not isDigit(ed_code.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;

end;

end.
