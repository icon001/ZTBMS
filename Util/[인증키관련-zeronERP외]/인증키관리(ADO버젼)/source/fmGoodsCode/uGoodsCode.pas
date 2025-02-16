unit uGoodsCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,
  uSubForm, CommandArray,ADODB,ActiveX;

type
  TfmGoodsCode = class(TfmASubForm)
    StatusBar1: TStatusBar;
    sg_Code: TAdvStringGrid;
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
    ed_Code: TEdit;
    ed_Name: TEdit;
    Label2: TLabel;
    ed_unit: TEdit;
    Label3: TLabel;
    ed_unitAmt: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowGoodsCode(aCode:string;aTopRow:integer = 1);
    Function DeleteTB_GOODSCATALOG(aCode:string):Boolean;
    Function InsertTB_GOODSCATALOG(aCode,aName,aunit,aunitAmt:string):Boolean;
    Function UpdateTB_GOODSCATALOG(aCode,aName,aunit,aunitAmt:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmGoodsCode: TfmGoodsCode;

implementation
uses
  uDataModule;

{$R *.dfm}

procedure TfmGoodsCode.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmGoodsCode.ButtonEnable(aState: string);
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

procedure TfmGoodsCode.FormClear;
begin
  ed_Code.Text := '';
  ed_Name.Text := '';
  ed_unit.Text := '';
  ed_unitAmt.Text := '';
end;

procedure TfmGoodsCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := true;
    ed_Name.Enabled  := true;
    ed_unit.Enabled := True;
    ed_unitAmt.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
    ed_unit.Enabled := False;
    ed_unitAmt.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
    ed_unit.Enabled := False;
    ed_unitAmt.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := true;
    ed_unit.Enabled := True;
    ed_unitAmt.Enabled := True;
  end;
end;

procedure TfmGoodsCode.FormActivate(Sender: TObject);
begin
   ShowGoodsCode('');

end;

procedure TfmGoodsCode.ShowGoodsCode(aCode: string;aTopRow:integer = 1);
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

  stSql := 'select * from TB_GOODSCATALOG ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection1;

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
      if RecordCount < 1 then exit;

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('GC_CODE').AsString;
          cells[1,nRow] := FindField('GC_NAME').AsString;
          cells[2,nRow] := FindField('GC_UNIT').AsString;
          cells[3,nRow] := FindField('GC_UNITAMT').AsString;
          if FindField('GC_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
        TopRow := aTopRow;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_CodeClick(sg_Code);
end;

procedure TfmGoodsCode.sg_CodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_Code.Text := cells[0,Row];
    ed_Name.Text := cells[1,Row];
    ed_unit.Text := cells[2,Row];
    ed_unitAmt.Text := cells[3,Row];
  end;

end;

procedure TfmGoodsCode.btn_CancelClick(Sender: TObject);
begin
  ShowGoodsCode(ed_Code.Text);

end;

procedure TfmGoodsCode.btn_InsertClick(Sender: TObject);
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
      if RowCount > 10 then TopRow := RowCount - 10;
      Enabled := False;
    end;
  end;

  ed_Code.SetFocus;

end;

procedure TfmGoodsCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_Name.SetFocus;

end;

procedure TfmGoodsCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_GOODSCATALOG(ed_Code.Text,ed_Name.Text,ed_unit.Text,ed_unitAmt.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_GOODSCATALOG(ed_Code.Text,ed_Name.Text,ed_unit.Text,ed_unitAmt.Text);

  if bResult then ShowGoodsCode(ed_Code.Text,sg_Code.TopRow)
  else showmessage('저장실패');
end;

procedure TfmGoodsCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_GOODSCATALOG(ed_Code.Text);

  if bResult then ShowGoodsCode('')
  else showmessage('삭제실패.');

end;

function TfmGoodsCode.DeleteTB_GOODSCATALOG(aCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_GOODSCATALOG ';
  stSql := stSql + ' where GC_CODE = ''' + aCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmGoodsCode.InsertTB_GOODSCATALOG(aCode, aName, aunit,
  aunitAmt: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_GOODSCATALOG( ';
  stSql := stSql + ' GC_CODE,';
  stSql := stSql + ' GC_NAME,';
  stSql := stSql + ' GC_UNIT,';
  stSql := stSql + ' GC_UNITAMT )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aunit + ''',';
  stSql := stSql + '''' + aunitAmt + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmGoodsCode.UpdateTB_GOODSCATALOG(aCode, aName, aunit,
  aunitAmt: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Update TB_GOODSCATALOG set ';
  stSql := stSql + ' GC_NAME = ''' + aName + ''', ';
  stSql := stSql + ' GC_UNIT = ''' + aunit + ''', ';
  stSql := stSql + ' GC_UNITAMT = ''' + aunitAmt + ''' ';
  stSql := stSql + ' where GC_CODE =''' + aCode + '''';

  result := dataModule1.ProcessExecSQL(stSql);

end;

end.
