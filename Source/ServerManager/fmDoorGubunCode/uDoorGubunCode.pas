unit uDoorGubunCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, StdCtrls, Buttons, Grids, BaseGrid,
  AdvGrid, ExtCtrls, ComCtrls,ADODB,ActiveX, AdvObj;

type
  TfmDoorGubunCode = class(TfmASubForm)
    StatusBar1: TStatusBar;
    Panel12: TPanel;
    Panel2: TPanel;
    sg_Code: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Insert: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    ed_code: TEdit;
    ed_Name: TEdit;
    chk_AutoCode: TCheckBox;
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_codeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure ShowDoorGubunCode(aCode : string);
    procedure ButtonEnable(aState:string);
    procedure FormClear;
    procedure FormEnable(aState:string);
  private
    Function InsertTB_DOORGUBUN(acode,aName:String):Boolean;
    Function UpdateTB_DOORGUBUN(acode,aName:String):Boolean;
    Function DeleteTB_DOORGUBUN(aCode:String):Boolean;
    Function GetAutoCode:string;

  public
    { Public declarations }
  end;

var
  fmDoorGubunCode: TfmDoorGubunCode;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmDoorGubunCode.FormActivate(Sender: TObject);
begin
  ShowDoorGubunCode('');
end;

procedure TfmDoorGubunCode.ShowDoorGubunCode(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Code); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_DOORGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
        Exit;
      end;

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('DG_CODE').AsString;
          cells[1,nRow] := FindField('DG_NAME').AsString;
          if FindField('DG_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmDoorGubunCode.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_code.Text := cells[0,Row];
    ed_Name.Text := cells[1,Row];
  end;

end;

procedure TfmDoorGubunCode.btn_InsertClick(Sender: TObject);
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
  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
  ed_Code.SetFocus;
end;

procedure TfmDoorGubunCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_Name.SetFocus;

end;

procedure TfmDoorGubunCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_DOORGUBUN(ed_Code.Text,ed_Name.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_DOORGUBUN(ed_Code.Text,ed_Name.Text);

  if bResult then ShowDoorGubunCode(ed_Code.Text)
  else showmessage('저장실패');
end;

function TfmDoorGubunCode.DeleteTB_DOORGUBUN(aCode: String): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DOORGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And DG_CODE = ''' + aCode + '''';
  
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorGubunCode.InsertTB_DOORGUBUN(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DOORGUBUN( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'DG_CODE,';
  stSql := stSql + 'DG_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + acode + ''',';
  stSql := stSql + '''' + aName + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDoorGubunCode.UpdateTB_DOORGUBUN(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOORGUBUN set ';
  stSql := stSql + ' DG_NAME = ''' + aName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND DG_CODE = ''' + acode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmDoorGubunCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_DOORGUBUN(ed_code.Text);

  if bResult then ShowDoorGubunCode(ed_Code.Text)
  else showmessage('삭제실패.');
end;

procedure TfmDoorGubunCode.ed_codeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_Name.SetFocus;
  end;

end;

procedure TfmDoorGubunCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDoorGubunCode.ButtonEnable(aState: string);
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

procedure TfmDoorGubunCode.FormClear;
begin
  ed_code.Text := '';
  ed_Name.Text := '';
end;

procedure TfmDoorGubunCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := true;
    ed_Name.Enabled  := true;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := true;
  end;
end;

procedure TfmDoorGubunCode.FormShow(Sender: TObject);
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

end;

procedure TfmDoorGubunCode.btn_CancelClick(Sender: TObject);
begin
  ShowDoorGubunCode(ed_Code.Text);
end;

procedure TfmDoorGubunCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmDoorGubunCode.Width;
  nBlock := (nWidth - 20) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 10 + nLeft;
  btn_Update.Left := 10 + nBlock + nLeft;
  btn_Save.Left := 10 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 10 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 10 + (nBlock * 4) + nLeft;
  btn_Close.Left := 10 + (nBlock * 5) + nLeft;

end;

procedure TfmDoorGubunCode.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_code.Text := GetAutoCode;

end;

function TfmDoorGubunCode.GetAutoCode: string;
var
  stSql : string;
  nSeq : integer;
  TempAdoQuery : TADOQuery;
begin
  nSeq := 1;
  stSql := 'select Max(DG_CODE) as DG_CODE from TB_DOORGUBUN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
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
        result := FillZeroNumber(nSeq,3);
        Exit;
      End;
      if RecordCount < 1 then
      begin
        result := FillZeroNumber(nSeq,3);
        Exit;
      end;

      if recordCount > 0 then
      begin
        if IsDigit(FindField('DG_CODE').AsString) then
        begin
          nSeq := strtoint(FindField('DG_CODE').AsString) + 1;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := FillZeroNumber(nSeq,3);
end;

end.
