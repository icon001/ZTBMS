unit uCardSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ComCtrls, uSubForm,
  CommandArray, DB, ADODB, AdvObj;

type
  TfmCardSearch = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmb_CompanyCode: TComboBox;
    ed_empId: TEdit;
    ed_empName: TEdit;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    sg_Card: TAdvStringGrid;
    StatusBar1: TStatusBar;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure sg_CardDblClick(Sender: TObject);
    procedure ed_empIdKeyPress(Sender: TObject; var Key: Char);
    procedure ed_empNameKeyPress(Sender: TObject; var Key: Char);
  private
    CompanyCodeList : TStringList;
    { Private declarations }
  public
    SelectCardNo : string;
    { Public declarations }
  end;

var
  fmCardSearch: TfmCardSearch;

implementation

uses
  uCompanyCodeLoad,
  uDataModule1;
{$R *.dfm}

procedure TfmCardSearch.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCardSearch.FormShow(Sender: TObject);
begin
  LoadCompanyCode(CompanyCodeList,cmb_CompanyCode)
end;

procedure TfmCardSearch.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
end;

procedure TfmCardSearch.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
end;

procedure TfmCardSearch.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
begin
  GridInitialize(sg_Card);

  stSql := ' Select b.CA_CARDNO,c.CO_NAME as CompanyName,d.CO_NAME as JijumName,';
  stSql := stSql + ' e.CO_NAME as DepartName,a.EM_CODE,a.EM_NAME from TB_Employee a ';
  stSql := stSql + ' Inner Join TB_CARD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ) ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'' ) ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE ';
  stSql := stSql + ' AND d.CO_GUBUN = ''3'' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  if cmb_CompanyCode.ItemIndex > 0 then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_CompanyCode.ItemIndex] + ''' ';
  if ed_empId.Text <> '' then
    stSql := stSql + ' AND a.EM_CODE like ''%' + ed_empid.Text + '%'' ';
  if ed_empName.Text <> '' then
    stSql := stSql + ' AND a.EM_NAME like ''%' + ed_empName.Text + '%'' ';

  with ADOQuery do
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
      showmessage('조회 데이터가 없습니다.');
      Exit;
    end;

    with sg_Card do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CA_CARDNO').AsString;
        cells[1,nRow] := FindField('CompanyName').AsString;
        cells[2,nRow] := FindField('JijumName').AsString;
        cells[3,nRow] := FindField('DepartName').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;

end;

procedure TfmCardSearch.sg_CardDblClick(Sender: TObject);
begin
  SelectCardNo := sg_Card.Cells[0,sg_Card.Row];
  Close;
end;

procedure TfmCardSearch.ed_empIdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(self);
  end;

end;

procedure TfmCardSearch.ed_empNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(self);
  end;

end;

end.
