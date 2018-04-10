unit uAccessStateCode1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmAccessStateCode = class(TfmASubForm)
    Panel2: TPanel;
    sg_AccessStateCode: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Insert: TSpeedButton;
    ed_AccessStateCode: TEdit;
    ed_AccessStateName: TEdit;
    StatusBar1: TStatusBar;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sg_AccessStateCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_AccessStateCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    State : string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowAccessStateCode(aCode:string);
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

{ TfmAccessStateCode }

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

procedure TfmAccessStateCode.FormActivate(Sender: TObject);
begin
 sg_AccessStateCode.OnDrawCell:=StringGrideDrawCell;
 ShowAccessStateCode('');
end;

procedure TfmAccessStateCode.ShowAccessStateCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_AccessStateCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_PERMITCODE ';
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

    with sg_AccessStateCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('PE_PERMITCODE').AsString;
        cells[1,nRow] := FindField('PE_PERMITNAME').AsString;
        if FindField('PE_PERMITCODE').AsString  = aCode then
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
  sg_AccessStateCodeClick(sg_AccessStateCode);
end;

procedure TfmAccessStateCode.sg_AccessStateCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_AccessStateCode.Text := cells[0,Row];
    ed_AccessStateName.Text := cells[1,Row];

  end;

end;

procedure TfmAccessStateCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_AccessStateCode do
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

  ed_AccessStateCode.SetFocus;
end;

procedure TfmAccessStateCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_AccessStateName.SetFocus;

end;

procedure TfmAccessStateCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin
  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_PERMITCODE(ed_AccessStateCode.Text,ed_AccessStateName.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_PERMITCODE(ed_AccessStateCode.Text,ed_AccessStateName.Text);

  if bResult then ShowAccessStateCode(ed_AccessStateCode.Text)
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
  
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmAccessStateCode.InsertTB_PERMITCODE(aAccessStatecode,
  aAccessStateName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERMITCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' PE_PERMITCODE,';
  stSql := stSql + ' PE_PERMITNAME )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aAccessStatecode + ''',';
  stSql := stSql + '''' + aAccessStateName + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmAccessStateCode.UpdateTB_PERMITCODE(aAccessStatecode,
  aAccessStateName: String): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PERMITCODE set ';
  stSql := stSql + ' PE_PERMITNAME = ''' + aAccessStateName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND PE_PERMITCODE = ''' + aAccessStatecode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAccessStateCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_PERMITCODE(ed_AccessStateCode.Text);

  if bResult then ShowAccessStateCode('')
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

procedure TfmAccessStateCode.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAccessStateCode.ButtonEnable(aState: string);
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

procedure TfmAccessStateCode.FormClear;
begin
  ed_AccessStateCode.Text := '';
  ed_AccessStateName.Text := '';
end;

procedure TfmAccessStateCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_AccessStateCode.Enabled := False;
    ed_AccessStateCode.Enabled := true;
    ed_AccessStateName.Enabled  := true;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_AccessStateCode.Enabled := True;
    ed_AccessStateCode.Enabled := False;
    ed_AccessStateName.Enabled  := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_AccessStateCode.Enabled := False;
    ed_AccessStateCode.Enabled := False;
    ed_AccessStateName.Enabled  := true;
  end;
end;

procedure TfmAccessStateCode.FormShow(Sender: TObject);
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

procedure TfmAccessStateCode.btn_CancelClick(Sender: TObject);
begin
  ShowAccessStateCode(ed_AccessStateCode.text);

end;

procedure TfmAccessStateCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmAccessStateCode.Width;
  nBlock := (nWidth - 20) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 10 + nLeft;
  btn_Update.Left := 10 + nBlock + nLeft;
  btn_Save.Left := 10 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 10 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 10 + (nBlock * 4) + nLeft;
  btn_Close.Left := 10 + (nBlock * 5) + nLeft;

end;

end.
