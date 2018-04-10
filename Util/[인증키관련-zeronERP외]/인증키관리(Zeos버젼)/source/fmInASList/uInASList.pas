unit uInASList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,ActiveX, uSubForm,
  CommandArray;

type
  TfmInASList = class(TfmASubForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dt_Date: TDateTimePicker;
    ed_customername: TEdit;
    ed_customerphone: TEdit;
    ed_customeraddr: TEdit;
    ed_customerperson: TEdit;
    ed_zip: TEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btn_ASGoodsListAdd: TSpeedButton;
    Label2: TLabel;
    sg_AsGoodList: TAdvStringGrid;
    cmb_Group: TComboBox;
    cmb_GoodsList: TComboBox;
    Label9: TLabel;
    ed_GoodsSerial: TEdit;
    Label10: TLabel;
    mem_etc: TMemo;
    Label15: TLabel;
    btn_Save: TBitBtn;
    btn_Close: TSpeedButton;
    cmb_UserName: TComboBox;
    TempQuery: TZQuery;
    sg_Customer: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ASGoodsListAddClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_GroupChange(Sender: TObject);
    procedure sg_AsGoodListButtonClick(Sender: TObject; ACol,
      ARow: Integer);
    procedure sg_AsGoodListCanEditCell(Sender: TObject; ARow,
      ACol: Integer; var CanEdit: Boolean);
    procedure ed_customernameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sg_CustomerDblClick(Sender: TObject);
  private
    ASGroupCodeList : TStringList;
    GoodsCodeList:TStringList;
    MasterIDList:TStringList;
    { Private declarations }
    procedure LoadGroupCode;
    procedure LoadGoodsList;
    procedure  LoadUserName(cmb_box:TComboBox);
    function GetMaxCode(aDate:string):integer;
    procedure SearchCustomerName(aname:string);
  private
    function InsertTB_ASLIST(aDate,aCode,aCustomername,aCustomerphone,azip,aCustomeraddr,aCustomerperson,aNextID:string):Boolean;
  private
    function CheckTB_ASGOODSList(aDate,aCode,aGoodsCode,aGoodsSerial:string):Boolean;
    function InsertTB_ASGOODSList(aDate,aCode,aGoodsCode,aGoodsSerial,aBadState:string):Boolean;
    procedure ShowASGOODSList;
    function DeleteTB_ASGOODSLIST(aDate,aCode,aGoodsCode,aSerial:string):Boolean;
  public
    { Public declarations }
  public
    L_stType : string;
    L_stDate : string;
    L_nCode : integer; //접수번호
    L_stCompanyCode : string;
    L_bSave : Boolean;
  end;

var
  fmInASList: TfmInASList;

implementation
uses
  uDataModule;

{$R *.dfm}

procedure TfmInASList.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmInASList.FormShow(Sender: TObject);
begin
  dt_Date.Date := now;
  LoadGroupCode;
  LoadGoodsList;
  LoadUserName(cmb_UserName);
end;

procedure TfmInASList.LoadGoodsList;
var
  stSql : string;
  stGroupCode : string;
begin
  cmb_GoodsList.Clear;
  cmb_GoodsList.Items.Add('');
  cmb_GoodsList.ItemIndex := 0;
  GoodsCodeList.Clear;
  GoodsCodeList.Add('');
  stSql := 'select * from TB_GOODSLIST ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  if cmb_Group.ItemIndex > 0 then
  begin
    stGroupCode := ASGroupCodeList.Strings[cmb_Group.ItemIndex];
    stSql := stSql + ' AND AG_CODE = ''' + stGroupCode + ''' ';
  end;

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

procedure TfmInASList.LoadGroupCode;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TZQuery;
begin

  ASGroupCodeList.Clear;
  cmb_Group.Clear;
  ASGroupCodeList.Add('000');
  cmb_Group.Items.Add('전체');
  cmb_Group.ItemIndex := 0;

  stSql := 'select * from TB_ASGROUP ';
  stSql := stSql + ' order by AG_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TZQuery.Create(nil);
    TempAdoQuery.Connection := dmDB.ZConnection1;

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

      while Not Eof do
      begin
        cmb_Group.Items.Add(FindField('AG_NAME').AsString);
        ASGroupCodeList.Add(FindField('AG_CODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmInASList.FormCreate(Sender: TObject);
begin
  ASGroupCodeList := TStringList.Create;
  GoodsCodeList:= TStringList.Create;
  MasterIDList:= TStringList.Create;
  L_nCode := 0;
end;

procedure TfmInASList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if L_nCode > 0 then
  begin
    if Not L_bSave then
    begin
      DeleteTB_ASGOODSLIST(FormatDateTime('yyyymmdd',dt_Date.DateTime),inttostr(L_nCode),'','');
    end;
  end;
  ASGroupCodeList.Free;
  GoodsCodeList.Free;
  MasterIDList.Free;

end;

procedure TfmInASList.LoadUserName(cmb_box: TComboBox);
var
  stSql : string;
begin
  MasterIDList.Clear;
  cmb_box.Clear;
  cmb_box.ItemIndex := -1;
  stSql := ' Select * from TB_MASTER ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  stSql := stsql + ' Order by MA_USERNAME ';

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
    While Not Eof do
    begin
      MasterIDList.Add(FindField('MA_USERID').AsString);
      cmb_box.Items.Add(FindField('MA_USERNAME').AsString);
      Next;
    end;
    cmb_UserName.ItemIndex := MasterIDList.IndexOf(Master_ID);
  end;
end;

procedure TfmInASList.btn_ASGoodsListAddClick(Sender: TObject);
var
  stGoodsCode : string;
begin
  if Trim(ed_GoodsSerial.Text) = '' then
  begin
    showmessage('물품의 시리얼 번호를 입력 하세요.');
    Exit;
  end;
  stGoodsCode := GoodsCodeList.Strings[cmb_GoodsList.itemIndex];
  if stGoodsCode = '' then
  begin
    showmessage('물품명을 선택 하세요.');
    Exit;
  end;
  if stGoodsCode = '000' then
  begin
    showmessage('물품명을 선택 하세요.');
    Exit;
  end;

  if L_nCode = 0 then
  begin
    L_nCode := GetMaxCode(FormatDateTime('yyyymmdd',dt_Date.Date));
  end;
  dt_Date.Enabled := False;
  if CheckTB_ASGOODSList(FormatDateTime('yyyymmdd',dt_Date.Date),inttostr(L_nCode),stGoodsCode,ed_GoodsSerial.Text) then
  begin
    showmessage('같은 물품이 이미 등록 되었습니다.');
    Exit;
  end;

  if InsertTB_ASGOODSList(FormatDateTime('yyyymmdd',dt_Date.Date),inttostr(L_nCode),stGoodsCode,ed_GoodsSerial.Text,mem_etc.Text) then
  begin
    ed_GoodsSerial.Text := '';
    mem_etc.Text := '';
    ShowASGOODSList;
  end else
  begin
    showmessage('저장에 실패 하였습니다.');
  end;


end;

procedure TfmInASList.btn_SaveClick(Sender: TObject);
var
  stNextID : string;
begin
  if ed_customername.Text = '' then
  begin
    showmessage('거래처명을 입력 하세요.');
    Exit;
  end;
  stNextID := MasterIDList.Strings[cmb_UserName.itemIndex];
  if L_nCode = 0 then
  begin
    L_nCode := GetMaxCode(FormatDateTime('yyyymmdd',dt_Date.Date));
  end;
  dt_Date.Enabled := False;
  if InsertTB_ASLIST(FormatDateTime('yyyymmdd',dt_Date.Date),inttostr(L_nCode),ed_customername.Text,
                  ed_customerphone.Text,ed_zip.Text,ed_customeraddr.Text,ed_customerperson.Text,stNextID) then
  begin
    L_bSave := True;
    Close;
  end else
  begin
    showmessage('저장에 실패 하였습니다.');
  end;

end;

function TfmInASList.GetMaxCode(aDate: string): integer;
var
  stSql : string;
begin
  result := 1;
  stSql := ' Select MAX(AL_CODE) as AL_CODE from TB_ASGOODSLIST ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' GROUP BY AL_DATE ';

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
    result := FindField('AL_CODE').AsInteger + 1;
  end;
end;

procedure TfmInASList.cmb_GroupChange(Sender: TObject);
begin
  LoadGoodsList;
end;

function TfmInASList.CheckTB_ASGOODSList(aDate, aCode, aGoodsCode,
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

function TfmInASList.InsertTB_ASGOODSList(aDate, aCode, aGoodsCode,
  aGoodsSerial, aBadState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ASGOODSLIST(';
  stsql := stSql + ' AL_DATE,';
  stsql := stSql + ' AL_CODE,';
  stsql := stSql + ' CO_COMPANYCODE,';
  stsql := stSql + ' GL_CODE,';
  stsql := stSql + ' AG_SERIAL,';
  stsql := stSql + ' AG_BADSTATE,';
  stsql := stSql + ' MA_USERID';
  stsql := stSql + ' ) Values (';
  stsql := stSql + '''' + aDate + ''',';
  stsql := stSql + '' + aCode + ',';
  stsql := stSql + '''' + Master_COMPANYCODE + ''',';
  stsql := stSql + '''' + aGoodsCode + ''',';
  stsql := stSql + '''' + aGoodsSerial + ''',';
  stsql := stSql + '''' + aBadState + ''',';
  stsql := stSql + '''' + Master_ID + ''')';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmInASList.ShowASGOODSList;
var
  stSql :string;
  nRow : integer;
  stGubun : string;
begin
  GridInit(sg_AsGoodList,5);

  stSql := 'select a.*,b.GL_NAME from TB_ASGOODSLIST a ';
  stSql := stSql + ' Left Join TB_GOODSLIST b ';
  stSql := stSql + ' ON ( a.CO_COMPANYCODE = b.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.GL_CODE = b.GL_CODE)  ';
  stSql := stSql + ' Where a.AL_DATE = ''' + FormatDateTime('yyyymmdd',dt_Date.DateTime) + ''' ';
  stSql := stSql + ' AND a.AL_CODE = ' + inttostr(L_nCode) + ' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    sg_AsGoodList.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_AsGoodList do
      begin               
        AddButton(0,nRow,1,1,'X',haFull,vaFull);
        cells[1,nRow] := inttostr(FindField('AL_CODE').asinteger);
        cells[2,nRow] := FindField('GL_NAME').AsString;
        cells[3,nRow] := FindField('AG_SERIAL').AsString;
        cells[4,nRow] := FindField('AG_BADSTATE').AsString;
        cells[5,nRow] := FindField('GL_CODE').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

function TfmInASList.InsertTB_ASLIST(aDate, aCode, aCustomername,
  aCustomerphone, azip, aCustomeraddr, aCustomerperson,
  aNextID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ASLIST(';
  stSql := stSql + ' AL_DATE,';
  stSql := stSql + ' AL_CODE,';
  stSql := stSql + ' AL_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,' ;
  stSql := stSql + ' AL_USERNAME,';
  stSql := stSql + ' AL_TELNUM,' ;
  stSql := stSql + ' AL_ZIPCODE,' ;
  stSql := stSql + ' AL_ADDR,' ;
  stSql := stSql + ' AL_STATE,'  ;
  stSql := stSql + ' AL_INSERTID,' ;
  stSql := stSql + ' AL_NEXTID' ;
  stSql := stSql + ' ) Values (' ;
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '' + aCode + ',';
  stSql := stSql + '''' + aCustomername + ''',';
  stSql := stSql + '''' + Master_COMPANYCODE + ''',';
  stSql := stSql + '''' + aCustomerperson + ''',';
  stSql := stSql + '''' + aCustomerphone + ''',';
  stSql := stSql + '''' + azip + ''',';
  stSql := stSql + '''' + aCustomeraddr + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '''' + aNextID + ''' ) ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmInASList.DeleteTB_ASGOODSLIST(aDate, aCode,aGoodsCode,aSerial: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ASGOODSLIST ';
  stSql := stSql + ' Where AL_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND AL_CODE = ' + aCode + ' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + Master_COMPANYCODE + ''' ';
  if aGoodsCode <> '' then stSql := stSql + ' AND GL_CODE = ''' + aGoodsCode + ''' ';
  if aSerial <> '' then stSql := stSql + ' AND AG_SERIAL = ''' + aSerial + ''' ';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmInASList.sg_AsGoodListButtonClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  inherited;
  with sg_AsGoodList do
  begin
    if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    DeleteTB_ASGOODSLIST(FormatDateTime('yyyymmdd',dt_date.DateTime),cells[1,ARow],Cells[5,ARow],Cells[3,ARow]); 
    ClearRows(ARow,1);
    if rowCount > 2 then RemoveRows(ARow,1);
  end;

end;

procedure TfmInASList.sg_AsGoodListCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  inherited;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmInASList.ed_customernameKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  SearchCustomerName(ed_customername.Text);
end;

procedure TfmInASList.SearchCustomerName(aname: string);
var
  stSql : string;
  nRow : integer;
begin
  sg_Customer.Visible := False;
  if aname = '' then Exit;

  stSql := ' Select * from TB_ASLIST ';
  stSql := stSql + ' Where AL_NAME Like ''%' + aname + '%'' ';

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
    sg_Customer.Visible := True;
    GridInit(sg_Customer,2); //스트링그리드 초기화
    with sg_Customer do
    begin
      RowCount := recordCount + 1;
      nRow := 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('AL_NAME').AsString;
        Cells[1,nRow] := FindField('AL_TELNUM').AsString;
        Cells[2,nRow] := FindField('AL_USERNAME').AsString;
        Cells[3,nRow] := FindField('AL_ZIPCODE').AsString;
        Cells[4,nRow] := FindField('AL_ADDR').AsString;
        inc(nRow);
        next;
      end;
    end;
  end;
end;

procedure TfmInASList.sg_CustomerDblClick(Sender: TObject);
begin
  inherited;
  with sg_Customer do
  begin
    ed_customername.Text := Cells[0,Row];
    ed_customerphone.Text := Cells[1,Row];
    ed_customerperson.Text := Cells[2,Row];
    ed_zip.Text := Cells[3,Row];
    ed_customeraddr.Text := Cells[4,Row];
    visible := False;
  end;

end;

end.
