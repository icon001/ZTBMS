unit uAccessStateCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls;

type
  TfmAccessStateCode = class(TForm)
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_AccessDelete: TSpeedButton;
    btn_AccessSave: TSpeedButton;
    btn_AccessUpdate: TSpeedButton;
    btn_AccessInsert: TSpeedButton;
    ed_AccessStateCode: TEdit;
    ed_AccessStateName: TEdit;
    GroupBox1: TGroupBox;
    Panel2: TPanel;
    sg_AccessStateCode: TAdvStringGrid;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_AccessStateCodeClick(Sender: TObject);
    procedure btn_AccessInsertClick(Sender: TObject);
    procedure btn_AccessUpdateClick(Sender: TObject);
    procedure btn_AccessSaveClick(Sender: TObject);
    procedure btn_AccessDeleteClick(Sender: TObject);
    procedure ed_AccessStateCodeKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    AccessState : string;

    procedure ShowAccessStateCode;
    Function InsertTB_PERMITCODE(aAccessStatecode,aAccessStateName:String):Boolean;
    Function UpdateTB_PERMITCODE(aAccessStatecode,aAccessStateName:String):Boolean;
    Function DeleteTB_PERMITCODE(aAccessStatecode:String):Boolean;
  public
    { Public declarations }
  end;

var
  fmAccessStateCode: TfmAccessStateCode;

implementation

uses uDataModule1;

{$R *.dfm}

{ TfmfmAccessStateCode }

procedure TfmAccessStateCode.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End;

end;

procedure TfmAccessStateCode.FormCreate(Sender: TObject);
begin
  sg_AccessStateCode.OnDrawCell:=StringGrideDrawCell;

end;

procedure TfmAccessStateCode.ShowAccessStateCode;
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  with sg_AccessStateCode do   //스트링그리드 초기화
  begin
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;


  ed_AccessStateCode.Enabled := False;
  ed_AccessStateName.Enabled := False;
  btn_AccessUpdate.Enabled := False;
  btn_AccessSave.Enabled := False;
  btn_AccessDelete.Enabled := False;
  AccessState := '';
  ed_AccessStateCode.Text := '';
  ed_AccessStateName.Text := '';

  stSql := 'select * from TB_PERMITCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with DataModule1.GetObject.ADOTmpQuery do
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

    with sg_AccessStateCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('PE_PERMITCODE').AsString;
        cells[1,nRow] := FindField('PE_PERMITNAME').AsString;

        nRow := nRow + 1;
        Next;
      end;
    end;

  end;
end;

procedure TfmAccessStateCode.FormActivate(Sender: TObject);
begin
//  ShowAccessStateCode;
end;

procedure TfmAccessStateCode.sg_AccessStateCodeClick(Sender: TObject);
begin
  AccessState := '';
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_AccessStateCode.Text := cells[0,Row];
    ed_AccessStateName.Text := cells[1,Row];

  end;
  ed_AccessStateCode.Enabled := False;
  ed_AccessStateName.Enabled := False;
  btn_Accessupdate.Enabled := True;
  btn_AccessSave.Enabled := False;
  btn_Accessdelete.Enabled := True;
end;

procedure TfmAccessStateCode.btn_AccessInsertClick(Sender: TObject);
begin
  AccessState := 'Insert';
  ed_AccessStateCode.Text := '';
  ed_AccessStateName.Text := '';
  ed_AccessStateCode.Enabled := true;
  ed_AccessStateName.Enabled  := true;

  btn_Accessupdate.Enabled := false;
  btn_AccessSave.Enabled := True;
  btn_Accessdelete.Enabled := False;
  ed_AccessStateCode.SetFocus;
end;

procedure TfmAccessStateCode.btn_AccessUpdateClick(Sender: TObject);
begin
  ed_AccessStateName.Enabled := true;
  btn_AccessSave.Enabled := True;
  AccessState := 'Update';
  ed_AccessStateName.SetFocus;

end;

procedure TfmAccessStateCode.btn_AccessSaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if AccessState = 'Insert' then
    bResult := InsertTB_PERMITCODE(ed_AccessStateCode.Text,ed_AccessStateName.Text)
  else if AccessState = 'Update' then
    bResult := UpdateTB_PERMITCODE(ed_AccessStateCode.Text,ed_AccessStateName.Text);

  if bResult then ShowAccessStateCode
  else showmessage('저장실패');
end;

function TfmAccessStateCode.DeleteTB_PERMITCODE(
  aAccessStatecode: String): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_PERMITCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And PE_PERMITCODE = ''' + aAccessStatecode + '''';
  
  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;
  result := True;
end;

function TfmAccessStateCode.InsertTB_PERMITCODE(aAccessStatecode,
  aAccessStateName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,';
  stSql := stSql + ' PE_PERMITNAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aAccessStatecode + ''',';
  stSql := stSql + '''' + aAccessStateName + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmAccessStateCode.UpdateTB_PERMITCODE(aAccessStatecode,
  aAccessStateName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_PERMITCODE set ';
  stSql := stSql + ' PE_PERMITNAME = ''' + aAccessStateName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND PE_PERMITCODE = ''' + aAccessStatecode + '''';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

procedure TfmAccessStateCode.btn_AccessDeleteClick(Sender: TObject);
var
  bResult : boolean;
begin

  bResult := DeleteTB_PERMITCODE(ed_AccessStateCode.Text);

  if bResult then ShowAccessStateCode
  else showmessage('삭제실패.');

end;

procedure TfmAccessStateCode.ed_AccessStateCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_AccessStateName.SetFocus;
  end;

end;

end.
