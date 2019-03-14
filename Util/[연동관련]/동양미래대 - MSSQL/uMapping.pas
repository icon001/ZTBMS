unit uMapping;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, AdvObj, BaseGrid, AdvGrid, ComCtrls, Buttons,
  ExtCtrls, DB, ADODB;

type
  TfmMapping = class(TForm)
    GroupBox1: TGroupBox;
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
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    ed_MPCode: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_MapTypeChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    GroupCodeList : TStringList;
    { Private declarations }
    function LoadGroupCode:Boolean;
    function CheckTB_EMMAPPING(aMPCode:string):Boolean;
    function UpdateTB_EMMAPPING(aMPCode,aDGCode:string):Boolean;
    function InsertIntoTB_EMMAPPING(aMPCode,aDGCode:string):Boolean;
    procedure LoadingMappingTable(aMapType:string;aTopRow:integer=0;aSelectRow:integer=0);
    procedure GridInit(sg:TAdvStringGrid;aCol:integer;aRow:integer = 2;bCheckBox:Boolean=False);
  public
    { Public declarations }
  end;

var
  fmMapping: TfmMapping;

implementation
uses
  unit1;
{$R *.dfm}

procedure TfmMapping.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMapping.cmb_MapTypeChange(Sender: TObject);
begin
  LoadingMappingTable(inttostr(cmb_MapType.ItemIndex + 1));
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

  with ADOQuery1 do
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
begin
  GroupCodeList.Clear;
  cmb_GroupCode.Items.Clear;
  GroupCodeList.Add('');
  cmb_GroupCode.Items.Add('¹Ì»ç¿ë');

  stSql := 'select * from TB_DEVICECARDGROUPCODE ';

  Try

    with ADOQuery1 do
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
  End;
end;

procedure TfmMapping.FormCreate(Sender: TObject);
begin
  GroupCodeList := TStringList.Create;
end;

procedure TfmMapping.btn_SaveClick(Sender: TObject);
var
  stDGCode : string;
begin
  if ed_MPCode.Text = '' then Exit;
  if cmb_GroupCode.ItemIndex < 0 then Exit;
  stDGCode := GroupCodeList.Strings[cmb_GroupCode.ItemIndex];
  if CheckTB_EMMAPPING(ed_MPCode.Text) then
  begin
    UpdateTB_EMMAPPING(ed_MPCode.Text,stDGCode);
  end else
  begin
    InsertIntoTB_EMMAPPING(ed_MPCode.Text,stDGCode);
  end;
  LoadingMappingTable(inttostr(cmb_MapType.ItemIndex + 1),sg_Code.TopRow,sg_Code.Row);
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

  with ADOQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    
  end;

end;

function TfmMapping.UpdateTB_EMMAPPING(aMPCode, aDGCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_EMMAPPING Set DG_CODE = ''' + aDGCode + ''' ';
  stSql := stSql + ' Where MP_TYPE = ''' + inttostr(cmb_MapType.ItemIndex + 1) + ''' ';
  stSql := stSql + ' AND MP_CODE = ''' + aMPCode + ''' ';

  with ADOQuery2 do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    
  end;

end;

function TfmMapping.CheckTB_EMMAPPING(aMPCode: string): Boolean;
var
  stSql: string;
begin
  Result := False;
  stSql := 'select * from TB_EMMAPPING ';
  stSql := stSql + ' Where MP_TYPE = ''' + inttostr(cmb_MapType.ItemIndex + 1) + ''' ';
  stSql := stSql + ' AND MP_CODE = ''' + aMPCode + ''' ';


  Try
    with ADOQuery1 do
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
  End;
end;

end.
