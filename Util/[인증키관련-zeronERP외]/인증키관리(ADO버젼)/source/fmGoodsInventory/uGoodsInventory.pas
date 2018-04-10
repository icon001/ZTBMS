unit uGoodsInventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, DB, ADODB;

type
  TfmGoodsInventory = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_toDate: TDateTimePicker;
    Label1: TLabel;
    btn_Search: TBitBtn;
    btn_Close: TSpeedButton;
    sg_GoodsInventory: TAdvStringGrid;
    TempQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure sg_GoodsInventoryInitialize;
  public
    { Public declarations }
  end;

var
  fmGoodsInventory: TfmGoodsInventory;

implementation
uses
  uDataModule;

{$R *.dfm}

procedure TfmGoodsInventory.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGoodsInventory.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  stSql := ' Select a.GC_CODE,b.GC_NAME, ';
  stSql := stSql + ' sum(a.INCOUNT) as INCOUNT,';
  stSql := stSql + ' sum(a.OUTCOUNT) as OUTCOUNT,';
  stSql := stSql + ' sum(a.NOTINCOUNT) as NOTINCOUNT ';
  stSql := stSql + ' from ( ';
  stSql := stSql + ' select GC_CODE,';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN GL_INOUTGUBUN = ''1'' THEN GL_COUNT ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stsql + ' END AS INCOUNT, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN GL_INOUTGUBUN = ''2'' THEN ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN GL_DELIVERYSTATE <> ''5'' THEN GL_COUNT ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stsql + ' END AS OUTCOUNT, ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN GL_DELIVERYGUBUN = ''2'' THEN ';
  stSql := stSql + ' CASE ';
  stSql := stSql + ' WHEN GL_DELIVERYSTATE = ''4'' THEN GL_COUNT ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stSql + ' END ';
  stSql := stSql + ' ELSE 0 ';
  stSql := stsql + ' END AS NOTINCOUNT ';
  stSql := stSql + ' from TB_GOODSINOUTLIST ';
  stSql := stSql + ' Where GL_DATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
  stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_toDate.Date) + ''' ';
  stSql := stSql + ' ) a ';
  stSql := stSql + ' Left Join TB_GOODSCATALOG b ';
  stSql := stSql + ' ON (a.GC_CODE = b.GC_CODE) ';
  stSql := stSql + ' GROUP BY a.GC_CODE,b.GC_NAME ';

  sg_GoodsInventoryInitialize;

  with sg_GoodsInventory do
  begin
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      nRow :=1 ;
      rowCount := recordCount + 1;
      While Not Eof do
      begin
        cells[0,nRow] := FindField('GC_NAME').AsString;
        cells[1,nRow] := inttostr(FindField('INCOUNT').asinteger);
        cells[2,nRow] := inttostr(FindField('OUTCOUNT').asinteger);
        cells[3,nRow] := inttostr(FindField('NOTINCOUNT').asinteger);
        cells[4,nRow] := inttostr(FindField('INCOUNT').asinteger - FindField('OUTCOUNT').asinteger);
        inc(nRow);
        Next;
      end;
    end;
  end;

end;

procedure TfmGoodsInventory.sg_GoodsInventoryInitialize;
begin
  with sg_GoodsInventory do
  begin
    Clear;
    Rowcount := 2;
    cells[0,0] := '¹°Ç°¸í';
    cells[1,0] := 'ÀÔ°í°¹¼ö';
    cells[2,0] := 'Ãâ°í°¹¼ö';
    cells[3,0] := '¹Ì¼ö°Å°¹¼ö';
    cells[4,0] := 'Àç°í°¹¼ö';

  end;
end;

procedure TfmGoodsInventory.FormShow(Sender: TObject);
begin
  dt_toDate.Date := Now;
  btn_SearchClick(self);
end;

end.
