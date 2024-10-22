unit uEmType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX, DB, AdvObj;

type
  TfmEmType = class(TfmASubForm)
    Panel2: TPanel;
    sg_EmTypeCode: TAdvStringGrid;
    Panel1: TPanel;
    lb_Code: TLabel;
    lb_name: TLabel;
    StatusBar1: TStatusBar;
    Panel12: TPanel;
    ed_EmpTypeCode: TEdit;
    ed_EmpTypeName: TEdit;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    chk_AutoCode: TCheckBox;
    ADOQuery: TADOQuery;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sg_EmTypeCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_EmpTypeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
  private
    { Private declarations }
    State : string;
    L_nTopRow : integer;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowEmpTypeCode(aCode:string;aTopRow:integer=1);
    Function InsertTB_RELAYGUBUN(aEmpTypecode,aEmpTypeName:String):Boolean;
    Function UpdateTB_RELAYGUBUN(aEmpTypecode,aEmpTypeName:String):Boolean;
    Function DeleteTB_RELAYGUBUN(aEmpTypecode:String):Boolean;
    Function GetAutoEmpTypeCode:string;
    procedure FormNameSet;
  public
    { Public declarations }
  end;

var
  fmEmType: TfmEmType;

implementation

uses
  uDataModule1,
  uAccessStateCode1,
  uLomosUtil;

{$R *.dfm}

{ TfmAccessStateCode }

procedure TfmEmType.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End;

end;

procedure TfmEmType.FormActivate(Sender: TObject);
begin
 ShowEmpTypeCode('');
end;

procedure TfmEmType.ShowEmpTypeCode(aCode:string;aTopRow:integer=1);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_EmTypeCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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

    with sg_EmTypeCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('RG_CODE').AsString;
        cells[1,nRow] := FindField('RG_NAME').AsString;
        if FindField('RG_CODE').AsString  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
      if aTopRow = 0 then
      begin
        if Row > 7 then TopRow := Row - 6;
      end else
      begin
        TopRow := aTopRow;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_EmTypeCodeClick(sg_EmTypeCode);
end;

procedure TfmEmType.sg_EmTypeCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_EmpTypeCode.Text := cells[0,Row];
    ed_EmpTypeName.Text := cells[1,Row];

  end;

end;

procedure TfmEmType.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_EmTypeCode do
  begin
    L_nTopRow := TopRow;
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 7 then TopRow := RowCount - 7;
      Enabled := False;
    end;
  end;

  ed_EmpTypeCode.SetFocus;
  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
end;

procedure TfmEmType.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_EmpTypeName.SetFocus;
  L_nTopRow := sg_EmTypeCode.TopRow;

end;

procedure TfmEmType.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_RELAYGUBUN(ed_EmpTypeCode.Text,ed_EmpTypeName.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_RELAYGUBUN(ed_EmpTypeCode.Text,ed_EmpTypeName.Text);

  if bResult then
  begin
    if UpperCase(State) = 'INSERT' then
      ShowEmpTypeCode(ed_EmpTypeCode.Text)
    else if UpperCase(State) = 'UPDATE' then
      ShowEmpTypeCode(ed_EmpTypeCode.Text,sg_EmTypeCode.TopRow);
  end else showmessage('저장실패');
end;

function TfmEmType.DeleteTB_RELAYGUBUN(
  aEmpTypecode: String): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_RELAYGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And RG_CODE = ''' + aEmpTypecode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmType.InsertTB_RELAYGUBUN(aEmpTypecode,aEmpTypeName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_RELAYGUBUN( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' RG_CODE,';
  stSql := stSql + ' RG_NAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpTypecode + ''',';
  stSql := stSql + '''' + aEmpTypeName + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmType.UpdateTB_RELAYGUBUN(aEmpTypecode,aEmpTypeName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_RELAYGUBUN set ';
  stSql := stSql + ' RG_NAME = ''' + aEmpTypeName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND RG_CODE = ''' + aEmpTypecode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmType.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_RELAYGUBUN(ed_EmpTypeCode.Text);

  if bResult then ShowEmpTypeCode('')
  else showmessage('삭제실패.');
end;

procedure TfmEmType.ed_EmpTypeCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_EmpTypeName.SetFocus;
  end;

end;

procedure TfmEmType.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmType.ButtonEnable(aState: string);
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmEmType.FormClear;
begin
  ed_EmpTypeCode.Text := '';
  ed_EmpTypeName.Text := '';
end;

procedure TfmEmType.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_EmTypeCode.Enabled := False;
    ed_EmpTypeCode.Enabled := true;
    ed_EmpTypeName.Enabled  := true;
    chk_AutoCode.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_EmTypeCode.Enabled := True;
    ed_EmpTypeCode.Enabled := False;
    ed_EmpTypeName.Enabled  := False;
    chk_AutoCode.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_EmTypeCode.Enabled := True;
    ed_EmpTypeCode.Enabled := False;
    ed_EmpTypeName.Enabled  := False;
    chk_AutoCode.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_EmTypeCode.Enabled := False;
    ed_EmpTypeCode.Enabled := False;
    ed_EmpTypeName.Enabled  := true;
    chk_AutoCode.Enabled := False;
  end;
end;

procedure TfmEmType.FormShow(Sender: TObject);
begin
  Panel12.Caption := fmEmType.Caption;
  FormNameSet;
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

procedure TfmEmType.btn_CancelClick(Sender: TObject);
begin
  ShowEmpTypeCode(ed_EmpTypeCode.text);

end;

procedure TfmEmType.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmEmType.Width;
  nBlock := (nWidth - 20) div 3; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 10 + nLeft;
  btn_Update.Left := 10 + nBlock + nLeft;
  btn_Save.Left := 10 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 10 + nLeft;
  btn_Cancel.Left := 10 + nBlock + nLeft;
  btn_Close.Left := 10 + (nBlock * 2) + nLeft;

end;

procedure TfmEmType.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_EmpTypeCode.Text := GetAutoEmpTypeCode;
end;

function TfmEmType.GetAutoEmpTypeCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 1;
  stSql := 'select Max(RG_CODE) as RG_CODE from TB_RELAYGUBUN ';
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
      if IsDigit(FindField('RG_CODE').AsString) then
      begin
        nSeq := strtoint(FindField('RG_CODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmEmType.FormNameSet;
begin

  with sg_EmTypeCode do
  begin
    Cells[0,0] := FM041;
    Cells[1,0] := FM042;
  end;

  lb_Code.Caption := FM041;
  lb_name.Caption := FM042;

end;

end.
