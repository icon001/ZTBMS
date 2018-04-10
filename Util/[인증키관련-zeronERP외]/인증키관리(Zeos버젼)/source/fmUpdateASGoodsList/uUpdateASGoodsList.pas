unit uUpdateASGoodsList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset;

type
  TfmUpdateASGoodsList = class(TForm)
    GroupBox2: TGroupBox;
    btn_Save: TBitBtn;
    btn_Close: TSpeedButton;
    mem_etc: TMemo;
    ed_GoodsSerial: TEdit;
    cmb_GoodsList: TComboBox;
    Label10: TLabel;
    Label15: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    cmb_state: TComboBox;
    mem_Actionstate: TMemo;
    Label1: TLabel;
    TempQuery: TZQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    GoodsCodeList : TStringList;
    { Private declarations }
    procedure LoadGoodsList;
    function CheckTB_ASGOODSList(aDate,aCode,aGoodsCode,aGoodsSerial:string):Boolean;
  public
    { Public declarations }
    L_stDate : string;
    L_stCode : string;
    L_stGoodsCode : string;
    L_stState : string;
    L_stCompanyCode : string;
    L_stSerial : string;
  end;

var
  fmUpdateASGoodsList: TfmUpdateASGoodsList;

implementation
uses uDataModule;

{$R *.dfm}

procedure TfmUpdateASGoodsList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmUpdateASGoodsList.LoadGoodsList;
var
  stSql : string;
begin
  cmb_GoodsList.Clear;
  cmb_GoodsList.Items.Add('');
  cmb_GoodsList.ItemIndex := 0;
  GoodsCodeList.Clear;
  GoodsCodeList.Add('');
  stSql := 'select * from TB_GOODSLIST ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + L_stCompanyCode + ''' ';

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
      GoodsCodeList.Add(FindField('GL_CODE').AsString);
      cmb_GoodsList.Items.Add(FindField('GL_NAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmUpdateASGoodsList.FormCreate(Sender: TObject);
begin
  GoodsCodeList := TStringList.Create;
end;

procedure TfmUpdateASGoodsList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GoodsCodeList.Free;
end;

procedure TfmUpdateASGoodsList.FormShow(Sender: TObject);
var
  i : integer;
begin
  LoadGoodsList;

  cmb_GoodsList.ItemIndex := GoodsCodeList.IndexOf(L_stGoodsCode);
  for i := 0 to cmb_state.Items.Count - 1 do
  begin
    if copy(cmb_state.Items.Strings[i],1,1) = copy(L_stState,1,1) then
    begin
      cmb_state.ItemIndex := i;
      break;
    end;
  end;
  ed_GoodsSerial.Text := L_stSerial;

end;

procedure TfmUpdateASGoodsList.btn_SaveClick(Sender: TObject);
var
  stSql : string;
  stGoodsCode : string;
begin
  if cmb_GoodsList.ItemIndex < 1 then
  begin
    showmessage('물품명을 선택 하세요.');
    Exit;
  end;
  if ed_GoodsSerial.Text = '' then
  begin
    showmessage('시리얼번호를 입력하세요.');
    Exit;
  end;
  if cmb_state.ItemIndex < 0 then
  begin
    showmessage('처리상태를 입력하세요.');
    Exit;
  end;
  stGoodsCode := GoodsCodeList.Strings[cmb_GoodsList.ItemIndex];
  if (L_stGoodsCode <> stGoodsCode) or ( L_stSerial <> ed_GoodsSerial.Text ) then
  begin
    if CheckTB_ASGOODSList(L_stDate,L_stCode,stGoodsCode,ed_GoodsSerial.Text) then
    begin
      showmessage('같은 물품이 이미 등록 되었습니다.');
      Exit;
    end;
  end;

  stSql := ' Update TB_ASGOODSLIST set ';
  stSql := stSql + ' GL_CODE = ''' + stGoodsCode + ''',';
  stSql := stSql + ' AG_SERIAL = ''' + ed_GoodsSerial.Text + ''',';
  stSql := stSql + ' AG_BADSTATE = ''' + mem_etc.Text + ''',';
  stSql := stSql + ' AG_STATE = ''' + copy(cmb_state.Text,1,1) + ''',';
  stSql := stSql + ' AG_ACTIONSTATE = ''' + mem_Actionstate.Text + ''', ';
  stSql := stSql + ' AG_LASTDATE = ''' + FormatDateTime('yyyymmdd',now) + ''', ';
  stSql := stSql + ' MA_USERID = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where AL_DATE = ''' + L_stDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + L_stCode + ' ';
  stSql := stSql + ' AND GL_CODE = ''' + L_stGoodsCode + ''' ';
  stSql := stSql + ' AND AG_SERIAL = ''' + L_stSerial + ''' ';

  if dmDB.ProcessExecSQL(stSql) then Close
  else showmessage('저장에 실패하였습니다.');

end;

function TfmUpdateASGoodsList.CheckTB_ASGOODSList(aDate, aCode, aGoodsCode,
  aGoodsSerial: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Select * from TB_ASGOODSLIST ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' AND AL_CODE = ' + aCode ;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  stSql := stSql + ' AND GL_CODE = ''' + aGoodsCode + ''' ';
  stSql := stSql + ' AND AG_SERIAL = ''' + aGoodsSerial + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    result := True;
  end;
end;

end.
