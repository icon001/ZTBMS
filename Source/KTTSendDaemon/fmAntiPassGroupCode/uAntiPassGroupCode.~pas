unit uAntiPassGroupCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, StdCtrls,
  AdvSmoothLabel, AdvEdit, AdvGlowButton,ActiveX,ADODB, uSubForm,
  CommandArray, Menus;

type
  TfmAntiPassGroupCode = class(TfmASubForm)
    Panel1: TPanel;
    lb_List: TLabel;
    sg_List: TAdvStringGrid;
    AdvSmoothLabel1: TAdvSmoothLabel;
    btn_Add: TAdvGlowButton;
    btn_Delete: TAdvGlowButton;
    ed_AntiGroupName: TAdvEdit;
    ed_Code: TAdvEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure sg_ListClick(Sender: TObject);
    procedure sg_ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchAntiGroupCode(aCode:string);
  public
    { Public declarations }
  end;

var
  fmAntiPassGroupCode: TfmAntiPassGroupCode;

implementation
uses
  UCommonModule,
  uDataModule1,
  uCommonSql,
  uLomosUtil;
{$R *.dfm}

procedure TfmAntiPassGroupCode.FormActivate(Sender: TObject);
begin
  SearchAntiGroupCode('');
end;

procedure TfmAntiPassGroupCode.SearchAntiGroupCode(aCode: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  nRow : integer;
begin
  GridInit(sg_List,1,2);

  stSql := ' Select * from TB_ANTIGROUPCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery  do
    begin
      Close;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then
      begin
        Exit;
      end;

      sg_List.RowCount := recordCount + 1;
      nRow := 1;

      While Not Eof do
      begin
        if G_bApplicationTerminate then Exit;
        with sg_List do
        begin
          Cells[0,nRow] := FindField('AG_NAME').AsString;
          Cells[1,nRow] := FindField('AG_CODE').AsString;
          Cells[2,nRow] := FindField('AG_ANTINO').AsString;

          if FindField('AG_CODE').AsString  = aCode then
          begin
            SelectRows(nRow,1);
          end;

        end;
        Application.ProcessMessages;
        inc(nRow);
        Next;
      end;
      sg_ListClick(self);
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAntiPassGroupCode.sg_ListClick(Sender: TObject);
begin
  inherited;
  with sg_List do
  begin
    ed_AntiGroupName.Text := cells[0,Row];
    ed_Code.Text := cells[1,Row];
  end;   
end;

procedure TfmAntiPassGroupCode.sg_ListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if (Key = 40) or (Key = 13) then
  begin
    if sg_List.Row = sg_List.RowCount - 1 then
    begin
      if sg_List.Cells[1,sg_List.Row] <> '' then
      begin
        sg_List.AddRow;
        sg_List.SelectRows(sg_List.RowCount - 1,1);
        sg_ListClick(sg_List);
      end;
    end;
  end;

end;

procedure TfmAntiPassGroupCode.N1Click(Sender: TObject);
begin
  inherited;
    if sg_List.Cells[1,sg_List.RowCount - 1] <> '' then
    begin
      sg_List.AddRow;
      sg_List.SelectRows(sg_List.RowCount - 1,1);
      sg_ListClick(sg_List);
    end;

end;

procedure TfmAntiPassGroupCode.btn_AddClick(Sender: TObject);
var
  stAntiGroupCode : string;
  stSql : string;
begin
  inherited;
  stAntiGroupCode := ed_Code.Text;
  if Not isDigit(ed_Code.Text) then
  begin
    stAntiGroupCode := CommonModule.GetNextTB_ANTIGROUPCODE_ID;
    stSql := CommonSql.InsertIntoTB_ANTIGROUPCODE_All(stAntiGroupCode,ed_AntiGroupName.text,'1');
    DataModule1.ProcessExecSQL(stSql);
  end else
  begin
    stSql := CommonSql.UpdateTB_ANTIGROUPCODE_Field_StringValue(stAntiGroupCode,'AG_NAME',ed_AntiGroupName.text);
    DataModule1.ProcessExecSQL(stSql);
    stSql := CommonSql.UpdateTB_ANTIGROUPCODE_Field_StringValue(stAntiGroupCode,'AG_ANTINO','1');
    DataModule1.ProcessExecSQL(stSql);
  end;
  SearchAntiGroupCode(stAntiGroupCode);

end;

procedure TfmAntiPassGroupCode.btn_DeleteClick(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  if Not isDigit(ed_Code.Text) then
  begin
    SearchAntiGroupCode('');
    Exit;
  end;
  stSql := CommonSql.DeleteTB_ANTIGROUPCODE_Value(ed_Code.Text);
  DataModule1.ProcessExecSQL(stSql);
  SearchAntiGroupCode('');   
end;

end.
