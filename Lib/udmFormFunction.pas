unit udmFormFunction;

interface

uses
  SysUtils, Classes,ADODB,StdCtrls,AdvGrid,
  DB,ActiveX;

type
  TdmFormFunction = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure LoadDoorGubun(cmb_box :TComboBox;CodeList : TStringList;aAll:Boolean=True;aAllStr:string='전체');
  end;

var
  dmFormFunction: TdmFormFunction;

implementation

uses uDataModule1;

{$R *.dfm}

{ TdmFormFunction }

procedure TdmFormFunction.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;
end;

procedure TdmFormFunction.LoadDoorGubun(cmb_box: TComboBox;
  CodeList: TStringList;aAll:Boolean=True;aAllStr:string='전체');
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  if CodeList = nil then CodeList := TStringList.Create;

  cmb_box.Clear;
  CodeList.Clear;
  if aAll then
  begin
    cmb_Box.Items.Add(aAllStr);
    CodeList.Add('');
    cmb_box.ItemIndex := 0;
  end;


  stSql := 'select * From TB_DOORGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('DG_NAME').AsString);
        CodeList.Add(FindField('DG_CODE').AsString);
        Next;
      end;
      cmb_box.ItemIndex := 0;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  end;

end;


end.
