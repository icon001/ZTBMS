unit uControlerInformationAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ExtCtrls, Grids, AdvObj, BaseGrid, AdvGrid,
  DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,ActiveX, uSubForm,
  CommandArray, Menus;

type
  TfmControlerInformationAdmin = class(TfmASubForm)
    Label7: TLabel;
    cmb_ControlerType: TComboBox;
    Label1: TLabel;
    cmb_RomType: TComboBox;
    btn_Add: TBitBtn;
    btn_Close: TSpeedButton;
    sg_List: TAdvStringGrid;
    Panel1: TPanel;
    TempQuery: TZQuery;
    pmDelete: TPopupMenu;
    miShow: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_AddClick(Sender: TObject);
    procedure miShowClick(Sender: TObject);
  private
    ControlerTypeList : TStringList;
    RomTypeList : TStringList;
    { Private declarations }
    procedure LoadControlType;
    procedure LoadRomType;
    procedure SereachTB_DEVICEFUNCTIONMAPPING;
  public
    { Public declarations }
  end;

var
  fmControlerInformationAdmin: TfmControlerInformationAdmin;

implementation

uses
  uDataModule;

{$R *.dfm}

{ TfmControlerInformationAdmin }

procedure TfmControlerInformationAdmin.LoadControlType;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TZQuery;
begin

  ControlerTypeList.Clear;
  cmb_ControlerType.Clear;

  stSql := 'select * from TB_DEVICETYPE ';
  stSql := stSql + ' order by DE_DEVICETYPE ';

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
        cmb_ControlerType.Items.Add(FindField('DE_NAME').AsString);
        ControlerTypeList.Add(FindField('DE_DEVICETYPE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmControlerInformationAdmin.LoadRomType;
var
  stSql : string;
  i : integer;
  TempAdoQuery : TZQuery;
begin

  RomTypeList.Clear;
  cmb_RomType.Clear;

  stSql := 'select * from TB_DEVICEROM ';
  stSql := stSql + ' order by DE_ROMTYPE ';

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
        cmb_RomType.Items.Add(FindField('DE_ROMNAME').AsString);
        RomTypeList.Add(FindField('DE_ROMTYPE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmControlerInformationAdmin.FormCreate(Sender: TObject);
begin
  ControlerTypeList := TStringList.Create;
  RomTypeList := TStringList.Create;
  
  LoadControlType;
  LoadRomType;
  cmb_ControlerType.ItemIndex := 0;
  cmb_RomType.ItemIndex := 0;
  SereachTB_DEVICEFUNCTIONMAPPING;
end;

procedure TfmControlerInformationAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  ControlerTypeList.free;
  RomTypeList.free;

end;

procedure TfmControlerInformationAdmin.SereachTB_DEVICEFUNCTIONMAPPING;
var
  stSql : string;
  nRow : integer;
  stTemp : string;
begin
  GridInit(sg_List,2);
  stSql := 'select a.*,b.DE_NAME,c.DE_ROMNAME from TB_DEVICEFUNCTIONMAPPING a ';
  stSql := stSql + ' Left Join TB_DEVICETYPE b ';
  stSql := stSql + ' ON(a.DE_DEVICETYPE = b.DE_DEVICETYPE) ';
  stSql := stSql + ' Left Join TB_DEVICEROM c ';
  stSql := stSql + ' ON(a.DE_ROMTYPE = c.DE_ROMTYPE) ';
  stSql := stSql + ' order by a.DE_DEVICETYPE,a.DE_ROMTYPE';

  with sg_List do
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
      if recordCount = 0 then Exit;
      nRow :=1 ;

      rowCount := recordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('DE_NAME').AsString;
        Cells[1,nRow] := FindField('DE_ROMNAME').AsString;
        Cells[2,nRow] := FindField('DE_DEVICETYPE').AsString;
        Cells[3,nRow] := FindField('DE_ROMTYPE').AsString;

        inc(nRow);
        Next;
      end;
    end;

  end;

end;

procedure TfmControlerInformationAdmin.btn_CloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfmControlerInformationAdmin.btn_AddClick(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  stSql := 'Insert Into TB_DEVICEFUNCTIONMAPPING(DE_DEVICETYPE,DE_ROMTYPE) ';
  stSql := stSql + ' Values(''' + ControlerTypeList.Strings[cmb_ControlerType.ItemIndex] + ''',''' + RomTypeList.Strings[cmb_RomType.ItemIndex] + ''' ) ';
  dmDB.ProcessExecSQL(stSql);
  SereachTB_DEVICEFUNCTIONMAPPING;
end;

procedure TfmControlerInformationAdmin.miShowClick(Sender: TObject);
var
  stSql : string;
begin
  inherited;
  if (Application.MessageBox(PChar(sg_List.Cells[0,sg_List.Row] + sg_List.Cells[1,sg_List.Row] +' 데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  stSql := 'Delete From TB_DEVICEFUNCTIONMAPPING ';
  stSql := stSql + ' Where DE_DEVICETYPE = ''' + sg_List.Cells[2,sg_List.Row] + ''' ';
  stSql := stSql + ' AND DE_ROMTYPE = ''' + sg_List.Cells[3,sg_List.Row] + ''' ';

  dmDB.ProcessExecSQL(stSql);
  SereachTB_DEVICEFUNCTIONMAPPING;
end;

end.
