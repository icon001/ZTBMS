unit uMapping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, Buttons,
  ExtCtrls, DB, ADODB,ActiveX;

type
  TfmMapping = class(TForm)
    gb_Header: TGroupBox;
    Label2: TLabel;
    cmb_MapType: TComboBox;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    StatusBar1: TStatusBar;
    sg_Code: TAdvStringGrid;
    Label1: TLabel;
    lb_PositionName: TLabel;
    Label3: TLabel;
    cmb_GroupCode: TComboBox;
    ed_MPCode: TEdit;
    lb_gubun: TLabel;
    cmb_Posi: TComboBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_MapTypeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    GroupCodeList : TStringList;
    PosiCodeList : TStringList;
    { Private declarations }
    function LoadGroupCode:Boolean;
    function CheckTB_EMMAPPING(aMPCode:string):Boolean;
    function UpdateTB_EMMAPPING(aMPCode,aDGCode:string):Boolean;
    function DeleteTB_EMMAPPING(aMPCode:string):Boolean;
    function InsertIntoTB_EMMAPPING(aMPCode,aDGCode:string):Boolean;
    procedure LoadingMappingTable(aMapType:string;aTopRow:integer=0;aSelectRow:integer=0);
    procedure LoadingMappingTablePosiJijum(aTopRow:integer=0;aSelectRow:integer=0);
    procedure LoadPosiCode;
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False);
  public
    { Public declarations }
  end;

var
  fmMapping: TfmMapping;

implementation
uses
  uMain,
  uLomosUtil,
  uCommonVariable, uDBModule;
{$R *.dfm}

procedure TfmMapping.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMapping.cmb_MapTypeChange(Sender: TObject);
begin
  if fmMain.L_stProgramType = '4' then LoadingMappingTablePosiJijum
  else LoadingMappingTable(inttostr(cmb_MapType.ItemIndex + 1));
end;

procedure TfmMapping.GridInit(sg: TAdvStringGrid; aCol, aRow: integer;
  bCheckBox: Boolean);
var
  i,j:integer;
begin
  with sg do
  begin
    if bCheckBox then
    begin
      RemoveCheckBox(0,0);
      RemoveCheckBox(0,1);

      AddCheckBox(0,0,False,False);
    end;
    for i:= 0 to ColCount - 1 do
    begin
      for j:= aRow - 1 to RowCount -1 do
      begin
        Cells[i,j] := '';
      end;
    end;
    RowCount := aRow;

    for i := aCol to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
end;

procedure TfmMapping.LoadingMappingTable(aMapType: string;aTopRow:integer=0;aSelectRow:integer=0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Code,2,2,False);
  if aMapType = '1' then
  begin
    stSql := ' select a.PO_NAME as MPNAME,a.CO_COMPANYCODE + a.PO_POSICODE as MPCODE,b.DG_CODE,c.DG_NAME as NAME ' ;
    stSql := stSql + ' from TB_POSI a ';
    stSql := stsql + ' Left Join TB_EMMAPPING b ';
    stSql := stSql + ' ON ( a.CO_COMPANYCODE + a.PO_POSICODE = b.MP_CODE ';
    stSql := stSql + ' AND b.MP_TYPE = ''' + aMapType + ''') ';
    stSql := stsql + ' Left Join TB_DEVICECARDGROUPCODE c ';
    stSql := stSql + ' ON ( b.DG_CODE = c.DG_CODE ) ';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

      if RecordCount < 1 then Exit;
      First;

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('MPNAME').AsString;
          cells[1,nRow] := FindField('NAME').AsString;
          cells[2,nRow] := FindField('MPCODE').AsString;
          cells[3,nRow] := FindField('DG_CODE').AsString;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then TopRow := aTopRow;
        if aSelectRow <> 0 then Row := aSelectRow;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMapping.FormActivate(Sender: TObject);
begin
  LoadGroupCode;
  cmb_MapTypeChange(cmb_MapType);
end;

procedure TfmMapping.sg_CodeClick(Sender: TObject);
begin
  with sg_Code do
  begin
    lb_PositionName.Caption := Cells[0,Row];
    cmb_GroupCode.ItemIndex := GroupCodeList.IndexOf(cells[3,Row]);
    ed_MPCode.Text := cells[2,Row];
  end;
end;

function TfmMapping.LoadGroupCode: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  GroupCodeList.Clear;
  cmb_GroupCode.Items.Clear;
  GroupCodeList.Add('');
  cmb_GroupCode.Items.Add('');

  stSql := 'select * from TB_DEVICECARDGROUPCODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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
      if RecordCount < 1 then
      begin
        Exit;
      end;

      while Not Eof do
      begin
        GroupCodeList.Add( FindField('DG_CODE').AsString);
        cmb_GroupCode.Items.Add(FindField('DG_NAME').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapping.FormCreate(Sender: TObject);
begin
  GroupCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  cmb_MapType.Items.Clear;
  if fmMain.L_stProgramType = '4' then //조선대
  begin
    cmb_MapType.Items.Add('1.구분+단과대');
    lb_gubun.Visible := True;
    cmb_posi.Visible := True;
    gb_Header.Height := 80;
    LoadPosiCode;
  end else
  begin
    cmb_MapType.Items.Add('1.직위코드');
    lb_gubun.Visible := False;
    cmb_posi.Visible := False;
    gb_Header.Height := 50;
  end;
  cmb_MapType.ItemIndex := 0;
end;

procedure TfmMapping.btn_SaveClick(Sender: TObject);
var
  stDGCode : string;
begin
  if ed_MPCode.Text = '' then Exit;
  if cmb_GroupCode.ItemIndex < 0 then Exit;
  stDGCode := GroupCodeList.Strings[cmb_GroupCode.ItemIndex];
  if stDGCode = '' then
  begin
    if CheckTB_EMMAPPING(ed_MPCode.Text) then DeleteTB_EMMAPPING(ed_MPCode.Text);
  end else
  begin
    if CheckTB_EMMAPPING(ed_MPCode.Text) then
    begin
      UpdateTB_EMMAPPING(ed_MPCode.Text,stDGCode);
    end else
    begin
      InsertIntoTB_EMMAPPING(ed_MPCode.Text,stDGCode);
    end;
  end;
  if fmMain.L_stProgramType = '4' then LoadingMappingTablePosiJijum(sg_Code.TopRow,sg_Code.Row)
  else LoadingMappingTable(inttostr(cmb_MapType.ItemIndex + 1),sg_Code.TopRow,sg_Code.Row);
end;

function TfmMapping.InsertIntoTB_EMMAPPING(aMPCode,
  aDGCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_EMMAPPING(MP_TYPE,MP_CODE,DG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + inttostr(cmb_MapType.ItemIndex + 1) + ''', ' ;
  stSql := stSql + '''' + aMPCode + ''', ' ;
  stSql := stSql + '''' + aDGCode + ''') ' ;

  result := dmDBModule.ProcessExecSQL(stSql);
end;

function TfmMapping.UpdateTB_EMMAPPING(aMPCode, aDGCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMMAPPING Set DG_CODE = ''' + aDGCode + ''' ';
  stSql := stSql + ' Where MP_TYPE = ''' + inttostr(cmb_MapType.ItemIndex + 1) + ''' ';
  stSql := stSql + ' AND MP_CODE = ''' + aMPCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);

end;

function TfmMapping.CheckTB_EMMAPPING(aMPCode: string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_EMMAPPING ';
  stSql := stSql + ' Where MP_TYPE = ''' + inttostr(cmb_MapType.ItemIndex + 1) + ''' ';
  stSql := stSql + ' AND MP_CODE = ''' + aMPCode + ''' ';


  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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
      if recordcount < 1 then Exit;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMapping.LoadingMappingTablePosiJijum(aTopRow,
  aSelectRow: integer);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Code,2,2,False);

  stSql := ' select a.PG_NAME as MPNAME,a.PG_CODE as MPCODE,b.DG_CODE,c.DG_NAME as NAME ' ;
  stSql := stSql + ' from TB_POSIJIJUMMapping a ';
  stSql := stsql + ' Left Join TB_EMMAPPING b ';
  stSql := stSql + ' ON ( a.PG_CODE = b.MP_CODE ';
  stSql := stSql + ' AND b.MP_TYPE = ''1'') ';
  stSql := stsql + ' Left Join TB_DEVICECARDGROUPCODE c ';
  stSql := stSql + ' ON ( b.DG_CODE = c.DG_CODE ) ';
  if cmb_Posi.ItemIndex <> 0 then
  begin
    stSql := stSql + ' Where a.PG_CODE Like ''' + PosiCodeList.Strings[cmb_Posi.ItemIndex] + '%''';
  end;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

      if RecordCount < 1 then Exit;
      First;

      with sg_Code do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('MPNAME').AsString;
          cells[1,nRow] := FindField('NAME').AsString;
          cells[2,nRow] := FindField('MPCODE').AsString;
          cells[3,nRow] := FindField('DG_CODE').AsString;

          nRow := nRow + 1;
          Next;
        end;
        if aTopRow <> 0 then TopRow := aTopRow;
        if aSelectRow <> 0 then Row := aSelectRow;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMapping.LoadPosiCode;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  cmb_Posi.Items.Clear;
  PosiCodeList.Clear;
  PosiCodeList.Add('');
  cmb_Posi.Items.Add('전체');
  cmb_Posi.ItemIndex := 0;
  stSql := 'select * from TB_POSI';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmDBModule.ADOConnection;

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

      if RecordCount < 1 then Exit;
      First;

      while Not Eof do
      begin
        PosiCodeList.Add(FindField('CO_COMPANYCODE').asString+FindField('PO_POSICODE').asString);
        cmb_Posi.Items.Add(FindField('PO_NAME').asString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  

end;

function TfmMapping.DeleteTB_EMMAPPING(aMPCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_EMMAPPING ' ;
  stSql := stSql + ' Where MP_CODE = ''' + aMPCode + ''' ';

  result := dmDBModule.ProcessExecSQL(stSql);
end;

end.
