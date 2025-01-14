unit uOutGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, DB, ADODB;

type
  TfmOutGoods = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    cmb_GoodsList: TComboBox;
    ed_GoodsCount: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_customername: TEdit;
    ed_customerphone: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    ed_customeraddr: TEdit;
    ed_customerperson: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    ed_DELIVERYCOMPANY: TEdit;
    Label9: TLabel;
    ed_DELIVERYNUM: TEdit;
    Label10: TLabel;
    cmb_DELIVERYGUBUN: TComboBox;
    Label11: TLabel;
    cmb_ProcessState: TComboBox;
    btn_Save: TBitBtn;
    btn_Delete: TBitBtn;
    btn_Close: TSpeedButton;
    TempQuery: TADOQuery;
    cmb_Certifi: TComboBox;
    Label12: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    GoodsCodeList:TStringList;
    CertiCodeList:TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    procedure LoadCertiCodeList;
    procedure InsertTB_GOODSINOUTLIST;
    procedure UpdateTB_GOODSINOUTLIST;
    procedure FormClear;
  public
    L_stType : string;
    L_stGoodsSeq : string;
    L_stGoodsCode : string;
    L_stCERTICode : string;
    { Public declarations }
  end;

var
  fmOutGoods: TfmOutGoods;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

{ TfmOutGoods }

procedure TfmOutGoods.LoadGoodsList;
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

procedure TfmOutGoods.FormCreate(Sender: TObject);
begin
  dt_Date.Date := Now;
  GoodsCodeList := TStringList.Create;
  GoodsCodeList.Clear;
  CertiCodeList := TStringList.Create;
  CertiCodeList.Clear;
end;

procedure TfmOutGoods.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmOutGoods.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  LoadGoodsList;
  LoadCertiCodeList;
  if L_stType = 'INSERT' then
  begin
    btn_Save.Caption := '출고';
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
    nIndex := CertiCodeList.IndexOf( L_stCERTICode);
    if nIndex > 0 then
    begin
      cmb_Certifi.ItemIndex := nIndex;
    end;
  end;
end;

procedure TfmOutGoods.btn_SaveClick(Sender: TObject);
begin
  if L_stType = 'INSERT' then
  begin
    InsertTB_GOODSINOUTLIST;
  end else
  begin
    UpdateTB_GOODSINOUTLIST;
  end;

end;

procedure TfmOutGoods.InsertTB_GOODSINOUTLIST;
var
  stSql : string;
  stOutDate : string;
  stGoodsCode : string;
  stGoodsCount : string;
  stCeritCode : string;
begin
  stOutDate := FormatDateTime('yyyymmdd',dt_Date.Date);
  if cmb_GoodsList.ItemIndex < 1 then
  begin
    showmessage('출고 물품을 선택하셔야 합니다.');
    Exit;
  end;
  stGoodsCode := copy(cmb_GoodsList.Text,1,3);
  if Not IsDigit(ed_GoodsCount.Text) then
  begin
    showmessage('물품갯수는 숫자만 입력 가능 합니다.');
    Exit;
  end;
  stGoodsCount := ed_GoodsCount.Text;

  stCeritCode := '';
  if cmb_Certifi.itemIndex > 0 then
  stCeritCode := CertiCodeList.Strings[cmb_Certifi.itemIndex];

  stSql := ' Insert Into TB_GOODSINOUTLIST( ';
  stSql := stSql + ' GL_DATE,';
  stSql := stSql + ' GC_CODE,';
  stSql := stSql + ' GL_INOUTGUBUN,';
  stSql := stSql + ' GL_COUNT,';
  stSql := stSql + ' GL_CUSTOMERNAME,';
  stSql := stSql + ' GL_CUSTOMERPHONE,';
  stSql := stSql + ' GL_CUSTOMERADDR,';
  stSql := stSql + ' GL_CUSTOMERPERSON,';
  stSql := stSql + ' GL_DELIVERYGUBUN,';
  stSql := stSql + ' GL_DELIVERYSTATE,';
  stSql := stSql + ' GL_DELIVERYCOMPANY,';
  stSql := stSql + ' GL_DELIVERYNUM , ';
  stSql := stSql + ' GC_CERTICODE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + stOutDate + ''',';
  stSql := stSql + '''' + stGoodsCode + ''',';
  stSql := stSql + '''2'',';   //출고
  stSql := stSql + '' + stGoodsCount + ',';
  stSql := stSql + '''' + ed_customername.text + ''',';
  stSql := stSql + '''' + ed_customerphone.Text + ''',';
  stSql := stSql + '''' + ed_customeraddr.Text + ''',';
  stSql := stSql + '''' + ed_customerperson.Text + ''', ';
  stSql := stSql + '''' + copy(cmb_DELIVERYGUBUN.text,1,1) + ''', ';
  stSql := stSql + '''' + copy(cmb_ProcessState.text,1,1) + ''', ';
  stSql := stSql + '''' + ed_DELIVERYCOMPANY.text + ''', ';
  stSql := stSql + '''' + ed_DELIVERYNUM.text + ''', ';
  stSql := stSql + '''' + stCeritCode + ''') ';

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

procedure TfmOutGoods.UpdateTB_GOODSINOUTLIST;
var
  stSql : string;
  stOutDate : string;
  stGoodsCode : string;
  stGoodsCount : string;
  stCeritCode : string;
begin
  stOutDate := FormatDateTime('yyyymmdd',dt_Date.Date);
  if cmb_GoodsList.ItemIndex < 1 then
  begin
    showmessage('출고 물품을 선택하셔야 합니다.');
    Exit;
  end;
  stGoodsCode := copy(cmb_GoodsList.Text,1,3);
  if Not IsDigit(ed_GoodsCount.Text) then
  begin
    showmessage('물품갯수는 숫자만 입력 가능 합니다.');
    Exit;
  end;
  stGoodsCount := ed_GoodsCount.Text;
  stCeritCode := '';
  if cmb_Certifi.itemIndex > 0 then
  stCeritCode := CertiCodeList.Strings[cmb_Certifi.itemIndex];

  stSql := ' Update TB_GOODSINOUTLIST set ';
  stSql := stSql + ' GL_DATE = ''' + stOutDate + ''',';
  stSql := stSql + ' GC_CODE = ''' + stGoodsCode + ''',';
  stSql := stSql + ' GL_COUNT = ' + stGoodsCount + ',';
  stSql := stSql + ' GL_CUSTOMERNAME = ''' + ed_customername.text + ''',';
  stSql := stSql + ' GL_CUSTOMERPHONE = ''' + ed_customerphone.Text + ''',';
  stSql := stSql + ' GL_CUSTOMERADDR = ''' + ed_customeraddr.Text + ''',';
  stSql := stSql + ' GL_CUSTOMERPERSON = ''' + ed_customerperson.Text + ''', ';
  stSql := stSql + ' GL_DELIVERYGUBUN = ''' + copy(cmb_DELIVERYGUBUN.text,1,1) + ''',';
  stSql := stSql + ' GL_DELIVERYSTATE = ''' + copy(cmb_ProcessState.text,1,1) + ''',';
  stSql := stSql + ' GL_DELIVERYCOMPANY = ''' + ed_DELIVERYCOMPANY.text + ''',';
  stSql := stSql + ' GL_DELIVERYNUM = ''' + ed_DELIVERYNUM.text + ''', ';
  stSql := stSql + ' GC_CERTICODE = ''' + stCeritCode + ''' ';
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

procedure TfmOutGoods.FormClear;
begin
  cmb_GoodsList.ItemIndex := 0;
  cmb_DELIVERYGUBUN.ItemIndex := 1;
  cmb_ProcessState.ItemIndex := 1;
  ed_GoodsCount.Text := '1';
  ed_customername.Text := '';
  ed_customerphone.Text := '';
  ed_customeraddr.Text := '';
  ed_customerperson.Text := '';
  ed_DELIVERYCOMPANY.Text := '';
  ed_DELIVERYNUM.Text := '';
end;

procedure TfmOutGoods.btn_DeleteClick(Sender: TObject);
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

procedure TfmOutGoods.LoadCertiCodeList;
var
  stSql : string;
begin
  cmb_Certifi.Clear;
  cmb_Certifi.Items.Add('');
  cmb_Certifi.ItemIndex := 0;
  CertiCodeList.Clear;
  CertiCodeList.Add('');
  stSql := 'select * from TB_GOODSCERTIFICATE ';

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
      CertiCodeList.Add(FindField('GC_CERTICODE').AsString);
      cmb_Certifi.Items.Add(FindField('GC_CERTINAME').AsString) ;
      Next;
    end;
  end;
end;

end.
