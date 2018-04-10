unit uFireGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons,
  uSubForm, CommandArray,ADODB,ActiveX, DB;

type
  TfmFireGroup = class(TfmASubForm)
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel3: TPanel;
    btn_Add: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cmb_Grade: TComboBox;
    sg_FireGroup: TAdvStringGrid;
    GroupBox1: TGroupBox;
    sg_NotFireGroup: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cmb_GradeChange(Sender: TObject);
    procedure sg_NotFireGroupCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure btn_AddClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
  private
    FireGroupList:TStringList;
    { Private declarations }
    procedure LoadFireGroup;
    procedure FireGroupSearch(List:TAdvStringGrid;aFireGroupCode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;aCol:integer;bchkState:Boolean);
    function CheckBoxCount(List:TAdvStringGrid):integer;
    function UpdateTB_FIREGROUP(aNodeNo,aFireGroup:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmFireGroup: TfmFireGroup;

implementation
uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmFireGroup.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmFireGroup.FireGroupSearch(List:TAdvStringGrid;aFireGroupCode:string);
var
  i : integer;
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(List,2,2,True);

  stSql := ' Select a.*,b.AC_MCUIP,b.AC_DEVICENAME from TB_FIREGROUP a ';
  stSql := stSql + ' INNER Join (select * from TB_ACCESSDEVICE where AC_ECUID = ''00'') b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO )';
  stSql := stSql + ' where a.FG_CODE = ''' + aFireGroupCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

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

      with List do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          AddCheckBox(0,nRow,False,False);
          cells[0,nRow] := FindField('AC_MCUIP').AsString;
          cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
          cells[2,nRow] := FindField('AC_NODENO').AsString;
          nRow := nRow + 1;
          Next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFireGroup.FormShow(Sender: TObject);
var
  stFireGroup : string;
begin
  inherited;
  FireGroupSearch(sg_NotFireGroup,'000');
  stFireGroup := FireGroupList.Strings[cmb_Grade.itemIndex];
  FireGroupSearch(sg_FireGroup,stFireGroup);

end;

procedure TfmFireGroup.LoadFireGroup;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  FireGroupList.Clear;

  stSql := ' Select * from TB_FIREGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by FG_CODE ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

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
        cmb_Grade.Items.Add(FindField('FG_NAME').AsString);
        FireGroupList.Add(FindField('FG_CODE').AsString);
        Next;
      end;
      cmb_Grade.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmFireGroup.FormCreate(Sender: TObject);
begin
  inherited;
  FireGroupList:= TStringList.Create;
  LoadFireGroup;
end;

procedure TfmFireGroup.FormDestroy(Sender: TObject);
begin
  inherited;
  FireGroupList.Free;
end;

procedure TfmFireGroup.cmb_GradeChange(Sender: TObject);
var
  stFireGroup : string;
begin
  inherited;
  FireGroupSearch(sg_NotFireGroup,'000');
  stFireGroup := FireGroupList.Strings[cmb_Grade.itemIndex];
  FireGroupSearch(sg_FireGroup,stFireGroup);

end;

procedure TfmFireGroup.sg_NotFireGroupCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  bchkState : Boolean;
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    (Sender as TAdvStringGrid).GetCheckBoxState(ACol,0, bchkState);
    AdvStrinGridSetAllCheck(Sender,ACol,bchkState);
  end;  
end;

procedure TfmFireGroup.AdvStrinGridSetAllCheck(Sender: TObject;
  aCol: integer; bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(aCol,i,bchkState);
    end;
end;

procedure TfmFireGroup.btn_AddClick(Sender: TObject);
var
  i : integer;
  stFireGroup : string;
  bchkState : Boolean;
begin
  if CheckBoxCount(sg_NotFireGroup) = 0 then
  begin
    showmessage('등록할 메인이 선택되어 있지 않습니다.');
    Exit;
  end;

  stFireGroup := FireGroupList.Strings[cmb_Grade.itemIndex];

  with sg_NotFireGroup do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);
      if bchkState then
      begin
        UpdateTB_FIREGROUP(cells[2,i],stFireGroup);
      end;
    end;
  end;
  cmb_GradeChange(self);
end;

function TfmFireGroup.CheckBoxCount(List: TAdvStringGrid): integer;
var
  i : integer;
  bchkState : Boolean;
  nCount : integer;
begin
  result := 0;
  nCount := 0;
  if List.RowCount < 2 then Exit;
  for i := 1 to List.RowCount - 1 do
  begin
    List.GetCheckBoxState(0,i, bchkState);
    if bchkState then nCount := nCount + 1;
  end;
  result := nCount;
end;

function TfmFireGroup.UpdateTB_FIREGROUP(aNodeNo,
  aFireGroup: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_FIREGROUP set FG_CODE = ''' + aFireGroup + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmFireGroup.btn_DeleteClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
begin
  if CheckBoxCount(sg_FireGroup) = 0 then
  begin
    showmessage('삭제할 메인이 선택되어 있지 않습니다.');
    Exit;
  end;

  with sg_FireGroup do
  begin
    for i := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,i, bchkState);
      if bchkState then
      begin
        UpdateTB_FIREGROUP(cells[2,i],'000');
      end;
    end;
  end;
  cmb_GradeChange(self);
end;

end.
