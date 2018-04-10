unit uGradeCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX;

type
  TfmGradeCode = class(TfmASubForm)
    Panel1: TPanel;
    Panel2: TPanel;
    sg_GradeCode: TAdvStringGrid;
    Label8: TLabel;
    ed_GradeCode: TEdit;
    Label1: TLabel;
    ed_GradeName: TEdit;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Insert: TSpeedButton;
    StatusBar1: TStatusBar;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_GradeCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_GradeCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    State : string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowGradeCode(aCode:string);
    Function InsertTB_Grade(aGradecode,aGradeName:String):Boolean;
    Function UpdateTB_Grade(aGradecode,aGradeName:String):Boolean;
    Function DeleteTB_Grade(aGradecode:String):Boolean;
  public
    { Public declarations }
  end;

var
  fmGradeCode: TfmGradeCode;

implementation

uses uDataModule1;

{$R *.dfm}

{ TfmGradeCode }

procedure TfmGradeCode.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmGradeCode.FormCreate(Sender: TObject);
begin
  sg_GradeCode.OnDrawCell:=StringGrideDrawCell;

end;

procedure TfmGradeCode.ShowGradeCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_GradeCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);


  stSql := 'select * from TB_GRADE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    with sg_GradeCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('GR_GRADECODE').AsString;
        cells[1,nRow] := FindField('GR_GARDENAME').AsString;
        if FindField('GR_GRADECODE').AsString  = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_GradeCodeClick(sg_GradeCode);

end;

procedure TfmGradeCode.FormActivate(Sender: TObject);
begin
  ShowGradeCode('');
end;

procedure TfmGradeCode.sg_GradeCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_Gradecode.Text := cells[0,Row];
    ed_Gradename.Text := cells[1,Row];

  end;
end;

procedure TfmGradeCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_GradeCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;
  ed_Gradecode.SetFocus;
end;

procedure TfmGradeCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_Gradename.SetFocus;

end;

procedure TfmGradeCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_Grade(ed_Gradecode.Text,ed_GradeName.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_Grade(ed_Gradecode.Text,ed_GradeName.Text);

  if bResult then ShowGradeCode(ed_Gradecode.Text)
  else showmessage('저장실패');
end;

function TfmGradeCode.InsertTB_Grade(aGradecode,
  aGradeName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_GRADE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' GR_GRADECODE,';
  stSql := stSql + ' GR_GARDENAME,';
  stSql := stSql + ' GR_UPDATETIME,';
  stSql := stSql + ' GR_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGradecode + ''',';
  stSql := stSql + '''' + aGradeName + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
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

function TfmGradeCode.UpdateTB_Grade(aGradecode,
  aGradeName: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_GRADE set ';
  stSql := stSql + ' GR_GARDENAME = ''' + aGradeName + ''',';
  stSql := stSql + ' GR_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' GR_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND GR_GRADECODE = ''' + aGradecode + '''';

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

procedure TfmGradeCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_Grade(ed_Gradecode.Text);

  if bResult then ShowGradeCode('')
  else showmessage('삭제실패.');

end;

function TfmGradeCode.DeleteTB_Grade(aGradecode: String): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_GRADE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And GR_GRADECODE = ''' + aGradecode + '''';
  
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

procedure TfmGradeCode.ed_GradeCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_GradeName.SetFocus;
  end;
end;

procedure TfmGradeCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmGradeCode.ButtonEnable(aState: string);
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
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
    if IsInsertGrade then  btn_Insert.Enabled := True;
    if IsUpdateGrade then btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmGradeCode.FormClear;
begin
  ed_Gradecode.Text := '';
  ed_Gradename.Text := '';
end;

procedure TfmGradeCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_GradeCode.Enabled := False;
    ed_Gradecode.Enabled := true;
    ed_Gradename.Enabled  := true;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_GradeCode.Enabled := True;
    ed_Gradecode.Enabled := False;
    ed_Gradename.Enabled  := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_GradeCode.Enabled := False;
    ed_Gradecode.Enabled := False;
    ed_Gradename.Enabled  := true;
  end;
end;

procedure TfmGradeCode.btn_CancelClick(Sender: TObject);
begin
  ShowGradeCode(ed_GradeCode.text);
end;

procedure TfmGradeCode.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

end.
