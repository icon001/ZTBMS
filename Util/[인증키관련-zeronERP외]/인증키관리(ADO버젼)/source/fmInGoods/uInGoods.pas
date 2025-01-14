unit uInGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, DB, ADODB;

type
  TfmInGoods = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    cmb_GoodsList: TComboBox;
    Label2: TLabel;
    ed_GoodsCount: TEdit;
    Label3: TLabel;
    ed_customername: TEdit;
    Label5: TLabel;
    ed_customerphone: TEdit;
    Label6: TLabel;
    ed_customeraddr: TEdit;
    Label7: TLabel;
    ed_customerperson: TEdit;
    btn_Close: TSpeedButton;
    btn_Save: TBitBtn;
    TempQuery: TADOQuery;
    btn_Delete: TBitBtn;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    GoodsCodeList:TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    procedure FormClear;
    procedure InsertTB_GOODSINOUTLIST;
    procedure UpdateTB_GOODSINOUTLIST;
  public
    L_stType : string;
    L_stGoodsSeq : string;
    L_stGoodsCode : string;
    { Public declarations }
  end;

var
  fmInGoods: TfmInGoods;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

procedure TfmInGoods.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmInGoods.LoadGoodsList;
var
  stSql : string;
begin
  cmb_GoodsList.Clear;
  cmb_GoodsList.Items.Add('');
  cmb_GoodsList.ItemIndex := 0;
  GoodsCodeList.Clear;
  GoodsCodeList.Add('');
  stSql := 'select * from TB_GOODSCATALOG ';

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
      GoodsCodeList.Add(FindField('GC_CODE').AsString);
      cmb_GoodsList.Items.Add(FindField('GC_CODE').AsString + '.' + FindField('GC_NAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmInGoods.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  LoadGoodsList;
  dt_Date.Date := Now;
  if L_stType = 'INSERT' then
  begin
    btn_Save.Caption := '입고';
    btn_Delete.Visible := False;
  end else
  begin
    btn_Save.Caption := '수정';
    btn_Delete.Visible := True;
    nIndex := GoodsCodeList.IndexOf(L_stGoodsCode);
    if nIndex > 0 then
    begin
      cmb_GoodsList.ItemIndex := nIndex;
    end;
  end;
end;

procedure TfmInGoods.btn_SaveClick(Sender: TObject);
begin
  if L_stType = 'INSERT' then
  begin
    InsertTB_GOODSINOUTLIST;
  end else
  begin
    UpdateTB_GOODSINOUTLIST;
  end;
end;

procedure TfmInGoods.FormClear;
begin
  cmb_GoodsList.ItemIndex := 0;
  ed_GoodsCount.Text := '1';
  ed_customername.Text := '';
  ed_customerphone.Text := '';
  ed_customeraddr.Text := '';
  ed_customerperson.Text := '';
end;

procedure TfmInGoods.FormCreate(Sender: TObject);
begin
  GoodsCodeList := TStringList.Create;
  GoodsCodeList.Clear;
end;

procedure TfmInGoods.InsertTB_GOODSINOUTLIST;
var
  stSql : string;
  stInDate : string;
  stGoodsCode : string;
  stGoodsCount : string;
begin
  stInDate := FormatDateTime('yyyymmdd',dt_Date.Date);
  if cmb_GoodsList.ItemIndex < 1 then
  begin
    showmessage('입고 물품을 선택하셔야 합니다.');
    Exit;
  end;
  stGoodsCode := copy(cmb_GoodsList.Text,1,3);
  if Not IsDigit(ed_GoodsCount.Text) then
  begin
    showmessage('물품갯수는 숫자만 입력 가능 합니다.');
    Exit;
  end;
  stGoodsCount := ed_GoodsCount.Text;

  stSql := ' Insert Into TB_GOODSINOUTLIST( ';
  stSql := stSql + ' GL_DATE,';
  stSql := stSql + ' GC_CODE,';
  stSql := stSql + ' GL_INOUTGUBUN,';
  stSql := stSql + ' GL_COUNT,';
  stSql := stSql + ' GL_CUSTOMERNAME,';
  stSql := stSql + ' GL_CUSTOMERPHONE,';
  stSql := stSql + ' GL_CUSTOMERADDR,';
  stSql := stSql + ' GL_CUSTOMERPERSON)';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + stInDate + ''',';
  stSql := stSql + '''' + stGoodsCode + ''',';
  stSql := stSql + '''1'',';   //입고
  stSql := stSql + '' + stGoodsCount + ',';
  stSql := stSql + '''' + ed_customername.text + ''',';
  stSql := stSql + '''' + ed_customerphone.Text + ''',';
  stSql := stSql + '''' + ed_customeraddr.Text + ''',';
  stSql := stSql + '''' + ed_customerperson.Text + ''') ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E:Exception do
      begin
        showmessage(E.Message);
        Exit;
      end;
    End;
  end;
  FormClear;
end;

procedure TfmInGoods.btn_DeleteClick(Sender: TObject);
var
  stSql : string;
begin
  stSql := 'Delete From TB_GOODSINOUTLIST ';
  stSql := stSql + ' Where GL_SEQ = ' + L_stGoodsSeq + ' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E:Exception do
      begin
        showmessage(E.Message);
        Exit;
      end;
    End;
  end;
  Close;
end;

procedure TfmInGoods.UpdateTB_GOODSINOUTLIST;
var
  stSql : string;
  stInDate : string;
  stGoodsCode : string;
  stGoodsCount : string;
begin
  stInDate := FormatDateTime('yyyymmdd',dt_Date.Date);
  if cmb_GoodsList.ItemIndex < 1 then
  begin
    showmessage('입고 물품을 선택하셔야 합니다.');
    Exit;
  end;
  stGoodsCode := copy(cmb_GoodsList.Text,1,3);
  if Not IsDigit(ed_GoodsCount.Text) then
  begin
    showmessage('물품갯수는 숫자만 입력 가능 합니다.');
    Exit;
  end;
  stGoodsCount := ed_GoodsCount.Text;

  stSql := ' Update TB_GOODSINOUTLIST set ';
  stSql := stSql + ' GL_DATE = ''' + stInDate + ''',';
  stSql := stSql + ' GC_CODE = ''' + stGoodsCode + ''',';
  stSql := stSql + ' GL_COUNT = ' + stGoodsCount + ',';
  stSql := stSql + ' GL_CUSTOMERNAME = ''' + ed_customername.text + ''',';
  stSql := stSql + ' GL_CUSTOMERPHONE = ''' + ed_customerphone.Text + ''',';
  stSql := stSql + ' GL_CUSTOMERADDR = ''' + ed_customeraddr.Text + ''',';
  stSql := stSql + ' GL_CUSTOMERPERSON = ''' + ed_customerperson.Text + ''' ';
  stSql := stSql + ' Where GL_SEQ = ' + L_stGoodsSeq + ' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      ON E:Exception do
      begin
        showmessage(E.Message);
        Exit;
      end;
    End;
  end;
  Close;
end;

end.
