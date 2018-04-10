unit uATVAcode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, ExtCtrls,
  CommandArray, uSubForm,ADODB,ActiveX, DB;

type
  TfmATVAcode = class(TfmASubForm)
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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ed_code: TEdit;
    ed_name: TEdit;
    cmb_Type: TComboBox;
    sg_Code: TAdvStringGrid;
    Label5: TLabel;
    ed_mark: TEdit;
    chk_AutoCode: TCheckBox;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure ed_codeExit(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
    procedure ed_codeChange(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure LoadATVACodeType;
    procedure ShowATVACode(aCode:string);
    function InsertTB_ATVACODE(acode,aname,aType,aMark:string):Boolean;
    function UpdateTB_ATVACODE(acode,aname,aType,aMark:string):Boolean;
    function DeleteTB_ATVACODE(acode:string):Boolean;

    function GetAutoATVACode:string;
  public
    { Public declarations }
  end;

var
  fmATVAcode: TfmATVAcode;

implementation

uses
  uDataModule1,
  uLomosUtil, uCommonSql;

{$R *.dfm}

{ TfmATVAcode }

procedure TfmATVAcode.ButtonEnable(aState: string);
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

function TfmATVAcode.DeleteTB_ATVACODE(acode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_ATVACODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_VACODE = ''' + aCode + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATVAcode.FormClear;
begin
  ed_code.Text := '';
  ed_name.Text := '';
  cmb_Type.ItemIndex := -1;

end;

procedure TfmATVAcode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_code.Enabled := True;
    chk_AutoCode.Enabled := true;
    ed_name.Enabled := True;
    cmb_Type.Enabled := True;
    ed_mark.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_code.Enabled := False;
    chk_AutoCode.Enabled := False;
    ed_name.Enabled := False;
    cmb_Type.Enabled := False;
    ed_mark.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_code.Enabled := False;
    chk_AutoCode.Enabled := False;
    ed_name.Enabled := False;
    cmb_Type.Enabled := False;
    ed_mark.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_code.Enabled := False;
    chk_AutoCode.Enabled := False;
    ed_name.Enabled := True;
    cmb_Type.Enabled := True;
    ed_mark.Enabled := TRUE;
  end;
end;

function TfmATVAcode.InsertTB_ATVACODE(acode, aname,
  aType,aMark: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_ATVACODE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AT_VACODE,';
  stSql := stSql + ' AT_VANAME,';
  stSql := stSql + ' AT_VATYPE,';
  stSql := stSql + ' AT_VAMARK,';
  stSql := stSql + ' AT_SYSTEM ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + acode + ''', ';
  stSql := stSql + '''' + aname + ''', ';
  stSql := stSql + '''' + aType + ''', ';
  stSql := stSql + '''' + aMark + ''', ';
  stSql := stSql + '''N'') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmATVAcode.LoadATVACodeType;
var
  stSql : string;
  stStr : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Type.Clear;
  cmb_Type.Clear;

  stSql := 'Select * from TB_ATVACODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AT_SYSTEM = ''Y'' ';
  stSql := stSql + ' order by AT_VATYPE ';

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
      stStr := FindField('AT_VATYPE').AsString + '.' + FindField('AT_VANAME').AsString;

      cmb_Type.Items.Add(stStr);
      Next;
    end;
    cmb_Type.ItemIndex := -1;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmATVAcode.ShowATVACode(aCode: string);
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

  stSql := 'Select * from TB_ATVACODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';
  stSql := stSql + ' order by AT_VACODE ';

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
        cells[0,nRow] := FindField('AT_VACODE').AsString;
        cells[1,nRow] := FindField('AT_VANAME').AsString;
        cells[2,nRow] := FindField('AT_VATYPE').AsString;
        cells[3,nRow] := FindField('AT_SYSTEM').AsString;
        cells[4,nRow] := FindField('AT_VAMARK').AsString;
        if (FindField('AT_VACODE').AsString )  = aCode then
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

function TfmATVAcode.UpdateTB_ATVACODE(acode, aname,
  aType,aMark: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATVACODE set ';
  stSql := stSql + ' AT_VANAME = ''' + aname + ''',';
  stSql := stSql + ' AT_VATYPE = ''' + aType + ''', ';
  stSql := stSql + ' AT_VAMARK = ''' + aMark + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_VACODE = ''' + aCode + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATVAcode.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmATVAcode.FormShow(Sender: TObject);
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
  LoadATVACodeType;
  ShowATVACode('');
end;

procedure TfmATVAcode.FormCreate(Sender: TObject);
begin
  sg_Code.ColWidths[3] := 0;
//  sg_Code.ColWidths[4] := 0;

end;

procedure TfmATVAcode.btn_InsertClick(Sender: TObject);
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
  if chk_AutoCode.Checked then ed_Code.Text := GetAutoATVACode;
  ed_code.SetFocus;
end;

procedure TfmATVAcode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmATVAcode.btn_CancelClick(Sender: TObject);
begin
  ShowATVACode(ed_code.Text);

end;

procedure TfmATVAcode.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if Trim(ed_code.Text) = '' then
  begin
    showmessage('휴가코드가 없습니다.');
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
    showmessage('휴가코드 Type 가 선택되지 않았습니다.');
    Exit;
  end;
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_ATVACODE(ed_code.Text,ed_name.Text,copy(cmb_Type.Text,1,1),ed_Mark.text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_ATVACODE(ed_code.Text,ed_name.Text,copy(cmb_Type.Text,1,1),ed_Mark.text);

  if bResult then ShowATVACode(ed_code.Text)
  else showmessage('저장실패');
end;

procedure TfmATVAcode.btn_DeleteClick(Sender: TObject);
var
  bResult : Boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  bResult := DeleteTB_ATVACODE(ed_code.Text);

  if bResult then ShowATVACode(ed_code.Text)
  else showmessage('삭제실패.');
end;

procedure TfmATVAcode.sg_CodeClick(Sender: TObject);
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
    ed_Mark.Text := cells[4,Row];
  end;
end;

procedure TfmATVAcode.ed_codeExit(Sender: TObject);
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

procedure TfmATVAcode.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_Code.Text := GetAutoATVACode;

end;

function TfmATVAcode.GetAutoATVACode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 11;
  stSql := CommonSql.GetMaxATVACode;
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
      if IsDigit(FindField('AT_VACODE').AsString) then
      begin
        nSeq := strtoint(FindField('AT_VACODE').AsString) + 1;
        if nSeq < 11 then nSeq := 11;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmATVAcode.ed_codeChange(Sender: TObject);
begin
  if ed_code.Text = '' then exit;
  if Not isDigit(ed_code.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;

end;

end.
