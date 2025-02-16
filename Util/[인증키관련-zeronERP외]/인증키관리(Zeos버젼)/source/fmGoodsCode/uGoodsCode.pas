unit uGoodsCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,
  uSubForm, CommandArray,ADODB,ActiveX,ZConnection,ZAbstractRODataset,
  ZAbstractDataset, ZDataset, DB, AdvObj;

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
    cmb_Group: TComboBox;
    Label4: TLabel;
    ed_StoreCount: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    cmb_Company: TComboBox;
    Panel2: TPanel;
    Label7: TLabel;
    cmb_sCompany: TComboBox;
    cmb_sCompanyGubun: TComboBox;
    Label24: TLabel;
    TempQuery: TZQuery;
    ed_companyCode: TEdit;
    chk_ProductGubun: TCheckBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_sCompanyGubunChange(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
  private
    State : string;
    ASGroupCodeList : TStringList;
    sCompanyGubunList :TStringList;
    sCompanyCodeList :TStringList;
    CompanyCodeList :TStringList;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowGoodsCode(aCode:string;aTopRow:integer = 1);
    Function DeleteTB_GOODSLIST(aCompanyCode,aCode:string):Boolean;
    Function InsertTB_GOODSLIST(aCompanyCode,aCode,aName,aunit,aunitAmt,aGroupCode,aStoreCount,aProductGubun:string):Boolean;
    Function UpdateTB_GOODSLIST(aCompanyCode,aCode,aName,aunit,aunitAmt,aGroupCode,aStoreCount,aProductGubun:string):Boolean;

    Function GetMaxCode(aCompanyCode:string):string;
    procedure LoadCompanyGubun(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True);
    procedure LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadGroupCode;
  public
    { Public declarations }
  end;

var
  fmGoodsCode: TfmGoodsCode;

implementation
uses
  uDataModule,
  uLomosUtil;

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
  cmb_Company.ItemIndex := 0;
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
    cmb_Company.Enabled := True;
    ed_Code.Enabled := true;
    ed_Name.Enabled  := true;
    ed_unit.Enabled := True;
    ed_unitAmt.Enabled := True;
    cmb_Group.Enabled := True;
    ed_StoreCount.Enabled := True;
    chk_ProductGubun.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    cmb_Company.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
    ed_unit.Enabled := False;
    ed_unitAmt.Enabled := False;
    cmb_Group.Enabled := False;
    ed_StoreCount.Enabled := False;
    chk_ProductGubun.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    cmb_Company.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := False;
    ed_unit.Enabled := False;
    ed_unitAmt.Enabled := False;
    cmb_Group.Enabled := False;
    ed_StoreCount.Enabled := False;
    chk_ProductGubun.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    cmb_Company.Enabled := False;
    ed_Code.Enabled := False;
    ed_Name.Enabled  := true;
    ed_unit.Enabled := True;
    ed_unitAmt.Enabled := True;
    cmb_Group.Enabled := True;
    ed_StoreCount.Enabled := True;
    chk_ProductGubun.Enabled := True;
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
  TempAdoQuery : TZQuery;
  stWhere : string;
begin
  GridInit(sg_Code,4); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select a.*,b.CO_NAME from TB_GOODSLIST a ';
  stSql := stSql + ' Left Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stWhere := '';
  if cmb_sCompany.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';
  end else if cmb_sCompanyGubun.ItemIndex > 0 then
  begin
    if sCompanyCodeList.Count > 1 then
    begin
      if stWhere = '' then stWhere := stWhere + ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' (';
      for i := 1 to sCompanyCodeList.Count - 1 do
      begin
        if i <> 1 then stWhere := stWhere + 'OR ';
        stWhere := stWhere + ' a.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[i] + ''' ';
      end;
      stWhere := stWhere + ' )';
    end;
  end;
  stSql := stSql + stWhere;
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

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('CO_NAME').AsString;
          cells[1,nRow] := FindField('GL_CODE').AsString;
          cells[2,nRow] := FindField('GL_NAME').AsString;
          cells[3,nRow] := FindField('GL_UNIT').AsString;
          cells[4,nRow] := FindField('GL_AMT').AsString;
          cells[5,nRow] := FindField('AG_CODE').AsString;
          cells[6,nRow] := FindField('GL_STORECOUNT').AsString;
          cells[7,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[8,nRow] := FindField('GL_PRODUCTGUBUN').AsString;
          if FindField('CO_COMPANYCODE').AsString + FindField('GL_CODE').AsString  = aCode then
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
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[1,Row] = '' then exit;
    ed_companyCode.Text := cells[7,Row];
    nIndex := CompanyCodeList.IndexOf(cells[7,Row]);
    cmb_Company.ItemIndex := nIndex;
    ed_Code.Text := cells[1,Row];
    ed_Name.Text := cells[2,Row];
    ed_unit.Text := cells[3,Row];
    ed_unitAmt.Text := cells[4,Row];
    nIndex := ASGroupCodeList.IndexOf(cells[5,row]);
    cmb_Group.ItemIndex := nIndex;
    ed_StoreCount.Text := cells[6,Row];
    if cells[8,Row] = '1' then chk_ProductGubun.Checked := True
    else chk_ProductGubun.Checked := False;
  end;

end;

procedure TfmGoodsCode.btn_CancelClick(Sender: TObject);
begin
  ShowGoodsCode(ed_companyCode.Text + ed_Code.Text);

end;

procedure TfmGoodsCode.btn_InsertClick(Sender: TObject);
var
  stCompanyCode : string;
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
  stCompanyCode := '000';
  if cmb_sCompany.itemindex > 0 then
  stCompanyCode := sCompanyCodeList.Strings[cmb_sCompany.itemindex];

  cmb_Company.ItemIndex := CompanyCodeList.IndexOf(stCompanyCode);
  
  ed_Code.Text := GetMaxCode(stCompanyCode);
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
  stGroupCode : string;
  stStoreCount : string;
  stCompanyCode : string;
  stProductGubun : string;
begin
  stGroupCode := '000';
  stStoreCount := '0';
  stCompanyCode := '000';
  stProductGubun := '0';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Group.ItemIndex > -1 then stGroupCode := ASGroupCodeList.Strings[cmb_Group.ItemIndex];
  if isDigit(ed_StoreCount.Text)  then stStoreCount := ed_StoreCount.Text;
  if chk_ProductGubun.Checked then stProductGubun := '1';

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_GOODSLIST(stCompanyCode,ed_Code.Text,ed_Name.Text,ed_unit.Text,ed_unitAmt.Text,stGroupCode,stStoreCount,stProductGubun)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_GOODSLIST(stCompanyCode,ed_Code.Text,ed_Name.Text,ed_unit.Text,ed_unitAmt.Text,stGroupCode,stStoreCount,stProductGubun);

  if bResult then ShowGoodsCode(stCompanyCode + ed_Code.Text,sg_Code.TopRow)
  else showmessage('저장실패');
end;

procedure TfmGoodsCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_GOODSLIST(ed_companyCode.Text, ed_Code.Text);

  if bResult then ShowGoodsCode('')
  else showmessage('삭제실패.');

end;

function TfmGoodsCode.DeleteTB_GOODSLIST(aCompanyCode,aCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_GOODSLIST ';
  stSql := stSql + ' where CO_COMPANYCODE = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND GL_CODE = ''' + aCode + '''';

  result := dmDB.ProcessExecSQL(stSql);

end;

function TfmGoodsCode.InsertTB_GOODSLIST(aCompanyCode,aCode, aName, aunit,
  aunitAmt,aGroupCode,aStoreCount,aProductGubun: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_GOODSLIST( ';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' GL_CODE,';
  stSql := stSql + ' GL_NAME,';
  stSql := stSql + ' AG_CODE,';
  stSql := stSql + ' GL_UNIT,';
  stSql := stSql + ' GL_AMT ,' ;
  stSql := stSql + ' GL_STORECOUNT,' ;
  stSql := stSql + ' GL_PRODUCTGUBUN )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aGroupCode + ''',';
  stSql := stSql + '''' + aunit + ''',';
  stSql := stSql + '''' + aunitAmt + ''',';
  stSql := stSql + '' + aStoreCount + ',';
  stSql := stSql + '' + aProductGubun + '';
  stSql := stSql + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmGoodsCode.UpdateTB_GOODSLIST(aCompanyCode,aCode, aName, aunit,
  aunitAmt,aGroupCode,aStoreCount,aProductGubun: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Update TB_GOODSLIST set ';
  stSql := stSql + ' GL_NAME = ''' + aName + ''', ';
  stSql := stSql + ' AG_CODE = ''' + aGroupCode + ''', ';
  stSql := stSql + ' GL_UNIT = ''' + aunit + ''', ';
  stSql := stSql + ' GL_AMT = ''' + aunitAmt + ''', ';
  stSql := stSql + ' GL_STORECOUNT = ''' + aStoreCount + ''', ';
  stSql := stSql + ' GL_PRODUCTGUBUN = ''' + aProductGubun + ''' ';
  stSql := stSql + ' where CO_COMPANYCODE =''' + aCompanyCode + '''';
  stSql := stSql + ' AND GL_CODE =''' + aCode + '''';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmGoodsCode.LoadGroupCode;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TZQuery;
begin

  ASGroupCodeList.Clear;
  cmb_Group.Clear;

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

procedure TfmGoodsCode.FormCreate(Sender: TObject);
begin
  inherited;
  ASGroupCodeList := TStringList.Create;
  sCompanyGubunList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
end;

procedure TfmGoodsCode.FormDestroy(Sender: TObject);
begin
  inherited;
  ASGroupCodeList.Free;
  sCompanyGubunList.Free;
  sCompanyCodeList.Free;
  CompanyCodeList.Free;
end;

function TfmGoodsCode.GetMaxCode(aCompanyCode:string): string;
var
  stSql : string;
  TempAdoQuery : TZQuery;
begin
  result := '0000000000';

  stSql := 'select Max(GL_CODE) as GL_CODE from TB_GOODSLIST ';
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      End;
      if RecordCount < 1 then
      begin
        Exit;
      end;
      if FindField('GL_CODE').IsNull then
      begin
        result := '1';
      end else if isdigit(FindField('GL_CODE').AsString) then
      begin
        result := inttostr(strtoint(FindField('GL_CODE').AsString) + 1);
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmGoodsCode.FormShow(Sender: TObject);
begin
  inherited;
  LoadCompanyGubun(cmb_sCompanyGubun,sCompanyGubunList);
  LoadCompanyCode(cmb_sCompany,'000',sCompanyCodeList);

  LoadCompanyCode(cmb_Company,'000',CompanyCodeList,False);
  LoadGroupCode;

end;

procedure TfmGoodsCode.LoadCompanyCode(cmb_Box: TComboBox;
  aCompanyGubunCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANY ';
  if aCompanyGubunCode <> '000' then
    stSql := stSql + ' Where CG_CODE = ''' + aCompanyGubunCode + ''' ';
  stSql := stSql + ' order by CO_COMPANYCODE ';

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
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmGoodsCode.LoadCompanyGubun(cmb_Box: TComboBox;
  TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANYGUBUN ';

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
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CG_NAME').AsString );
      TempList.Add(FindField('CG_CODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmGoodsCode.cmb_sCompanyGubunChange(Sender: TObject);
begin
  inherited;
  LoadCompanyCode(cmb_sCompany,sCompanyGubunList.Strings[cmb_sCompanyGubun.itemIndex],sCompanyCodeList);
  ShowGoodsCode('');

end;

procedure TfmGoodsCode.cmb_CompanyChange(Sender: TObject);
var
  stCompanyCode : string;
begin
  inherited;
  if State = 'INSERT' then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_Company.itemindex];
    ed_Code.Text := GetMaxCode(stCompanyCode);
  end;
end;

procedure TfmGoodsCode.cmb_sCompanyChange(Sender: TObject);
begin
  inherited;
  ShowGoodsCode('');
end;

end.
