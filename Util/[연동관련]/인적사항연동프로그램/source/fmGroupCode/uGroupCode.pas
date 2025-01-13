unit uGroupCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, StdCtrls, Buttons,
  ExtCtrls,uSubForm, CommandArray,ActiveX,ADODB;

type
  TfmGroupCode = class(TfmASubForm)
    Panel12: TPanel;
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
    StatusBar1: TStatusBar;
    sg_Code: TAdvStringGrid;
    procedure FormResize(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure ButtonEnable(aState:string);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ShowGroupCode(aCode : string);
    Function GetAutoCode:string;
  public
    Function InsertTB_DEVICECARDGROUPCODE(acode,aName:String):Boolean;
    Function UpdateTB_DEVICECARDGROUPCODE(acode,aName:String):Boolean;
    Function DeleteTB_DEVICECARDGROUPCODE(aCode:String):Boolean;
    { Public declarations }
  end;

var
  fmGroupCode: TfmGroupCode;

implementation
uses
  uCommonVariable,
  uDBModule,
  uLomosUtil;

{$R *.dfm}

procedure TfmGroupCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Width;
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

procedure TfmGroupCode.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_code.Text := GetAutoCode;
end;

function TfmGroupCode.GetAutoCode: string;
var
  stSql : string;
  nSeq : integer;
  TempAdoQuery : TADOQuery;
begin
  nSeq := 1;
  stSql := 'select Max(DG_CODE) as DG_CODE from TB_DEVICECARDGROUPCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

procedure TfmGroupCode.FormActivate(Sender: TObject);
begin
  ShowGroupCode('');
end;

procedure TfmGroupCode.ShowGroupCode(aCode: string);
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

  stSql := 'select * from TB_DEVICECARDGROUPCODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

procedure TfmGroupCode.btn_InsertClick(Sender: TObject);
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

procedure TfmGroupCode.FormClear;
begin
  ed_code.Text := '';
  ed_Name.Text := '';
end;

procedure TfmGroupCode.FormEnable(aState: string);
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

procedure TfmGroupCode.ButtonEnable(aState: string);
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

procedure TfmGroupCode.sg_CodeClick(Sender: TObject);
begin
  inherited;
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

procedure TfmGroupCode.btn_UpdateClick(Sender: TObject);
begin
  inherited;
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_Name.SetFocus;

end;

procedure TfmGroupCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_DEVICECARDGROUPCODE(ed_Code.Text,ed_Name.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_DEVICECARDGROUPCODE(ed_Code.Text,ed_Name.Text);

  if bResult then ShowGroupCode(ed_Code.Text)
  else showmessage('저장실패');
end;

function TfmGroupCode.DeleteTB_DEVICECARDGROUPCODE(aCode: String): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDGROUPCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And DG_CODE = ''' + aCode + '''';
  
  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmGroupCode.InsertTB_DEVICECARDGROUPCODE(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICECARDGROUPCODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'DG_CODE,';
  stSql := stSql + 'DG_NAME) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + acode + ''',';
  stSql := stSql + '''' + aName + ''')';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmGroupCode.UpdateTB_DEVICECARDGROUPCODE(acode,
  aName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DEVICECARDGROUPCODE set ';
  stSql := stSql + ' DG_NAME = ''' + aName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND DG_CODE = ''' + acode + '''';

  result := dmDBModule.ProcessExecSQL(stSql);
end;



procedure TfmGroupCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_DEVICECARDGROUPCODE(ed_code.Text);

  if bResult then ShowGroupCode(ed_Code.Text)
  else showmessage('삭제실패.');
end;

procedure TfmGroupCode.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmGroupCode.btn_CancelClick(Sender: TObject);
begin
  inherited;
  ShowGroupCode(ed_Code.Text);   
end;

end.
