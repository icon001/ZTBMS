unit uProductSummary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls,
  StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uSubForm, CommandArray;

type
  TfmProductSummary = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label4: TLabel;
    btn_Close: TSpeedButton;
    btn_Excel: TSpeedButton;
    btn_Search: TBitBtn;
    cmb_GoodsList: TComboBox;
    dt_FromDate: TDateTimePicker;
    dt_toDate: TDateTimePicker;
    sg_List: TAdvStringGrid;
    pan_gauge: TPanel;
    lb_Message: TLabel;
    Gauge1: TGauge;
    TempQuery: TZQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
  private
    GoodsList : TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    procedure SearchSummary;
    procedure SearchList;
  public
    { Public declarations }
  end;

var
  fmProductSummary: TfmProductSummary;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

procedure TfmProductSummary.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmProductSummary.LoadGoodsList;
var
  stSql : string;
  stGroupCode : string;
begin
  cmb_GoodsList.Clear;
  GoodsList.Clear;
  cmb_GoodsList.Items.Add('전체');
  cmb_GoodsList.ItemIndex := 0;
  GoodsList.Add('');

  stSql := 'select * from TB_GOODSLIST ';
  stSql := stSql + ' Where GL_PRODUCTGUBUN = 1 ';
  stSql := stSql + ' Order by GL_CODE ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    while Not Eof do
    begin
      GoodsList.Add(FindField('GL_CODE').AsString);
      cmb_GoodsList.Items.Add(FindField('GL_NAME').AsString);
      Next;
    end;
  end;
end;

procedure TfmProductSummary.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GoodsList.Free;
end;

procedure TfmProductSummary.FormCreate(Sender: TObject);
begin
  GoodsList := TStringList.Create;
  LoadGoodsList;
  dt_FromDate.Date := Now - 31;
  dt_toDate.Date := Now;
end;

procedure TfmProductSummary.SearchList;
var
  stSql : string;
  stCode : string;
  nRow : integer;
begin
  if cmb_GoodsList.ItemIndex > 0 then
  begin
    stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  end else stCode := '';
  stSql := ' Select a.*,b.GL_NAME from TB_PRODUCTLIST a ';
  stSql := stSql + ' Left Join TB_GOODSLIST b ';
  stSql := stSql + ' ON (a.GL_CODE = b.GL_CODE ) ';
  if stCode <> '' then
  begin
    stSql := stSql + ' Where a.GL_CODE = ''' + stCode + ''' ';
  end;
  stSql := stSql + ' Order by a.GL_CODE,a.PL_DATE DESC,a.PL_SEQ DESC';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    nRow := sg_List.RowCount;
    sg_List.RowCount := sg_List.RowCount + RecordCount;
    while Not Eof do
    begin
      with sg_List do
      begin
        Cells[0,nRow] := FindField('GL_NAME').AsString;
        Cells[1,nRow] := DateType(FindField('PL_DATE').AsString);
        if (FindField('PL_GUBUN').AsString = '1') then
        begin
          if (FindField('PL_REQUEST').AsString = '1') or (FindField('PL_REQUEST').AsString = '2') then
          begin
            Cells[2,nRow] := FindField('PL_COUNT').AsString;
            Cells[3,nRow] := '';
          end else if (FindField('PL_ACTION').AsString = '1') or (FindField('PL_ACTION').AsString = '2') then
          begin
            Cells[2,nRow] := '';
            Cells[3,nRow] := FindField('PL_COUNT').AsString;
          end;
        end else if (FindField('PL_GUBUN').AsString = '2') then
        begin
          if (FindField('PL_REQUEST').AsString = '1') or (FindField('PL_REQUEST').AsString = '2') then
          begin
            Cells[4,nRow] := FindField('PL_COUNT').AsString;
            Cells[5,nRow] := '';
          end else if (FindField('PL_ACTION').AsString = '1') or (FindField('PL_ACTION').AsString = '2') then
          begin
            Cells[4,nRow] := '';
            Cells[5,nRow] := FindField('PL_COUNT').AsString;
          end;
        end;
        Cells[6,nRow] := '';
        Cells[7,nRow] :=  FindField('PL_BIGO').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmProductSummary.SearchSummary;
var
  stSql : string;
  stCode : string;
  nRow : integer;
begin
  if cmb_GoodsList.ItemIndex > 0 then
  begin
    stCode := GoodsList.Strings[cmb_GoodsList.ItemIndex];
  end else stCode := '';
  stSql := ' Select a.*,b.GL_NAME from TB_PRODUCTSUM a ';
  stSql := stSql + ' Left Join TB_GOODSLIST b ';
  stSql := stSql + ' ON (a.GL_CODE = b.GL_CODE ) ';
  if stCode <> '' then
  begin
    stSql := stSql + ' Where a.GL_CODE = ''' + stCode + ''' ';
  end;
  stSql := stSql + ' Order by a.GL_CODE';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    nRow := 1;
    sg_List.RowCount := RecordCount + 1;
    while Not Eof do
    begin
      with sg_List do
      begin
        Cells[0,nRow] := FindField('GL_NAME').AsString;
        Cells[1,nRow] := '합계';
        Cells[2,nRow] := FindField('PS_PRODUCTCREATE').AsString;
        Cells[3,nRow] := FindField('PS_PRODUCTCOMPLETE').AsString;
        Cells[4,nRow] := FindField('PS_DELIVERYCREATE').AsString;
        Cells[5,nRow] := FindField('PS_DELIVERYCOMPLETE').AsString;
        Cells[6,nRow] := FindField('PS_PRODUCTSTORECOUNT').AsString;
        Cells[7,nRow] := '';
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmProductSummary.btn_SearchClick(Sender: TObject);
begin
  RowGridInitialize(sg_List);
  SearchSummary;
  SearchList;
end;

end.
