unit uAlarmManageCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,ADODB,
  ActiveX, DB, uSubForm, CommandArray, AdvObj;

type
  TfmAlarmManageCode = class(TfmASubForm)
    Panel2: TPanel;
    sg_AlarmCheckCode: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_update: TSpeedButton;
    btn_Insert: TSpeedButton;
    ed_AlarmCheckCode: TEdit;
    ed_AlarmCheckName: TEdit;
    StatusBar1: TStatusBar;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    chk_AutoCode: TCheckBox;
    ADOQuery: TADOQuery;
    btn_Cancel: TSpeedButton;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sg_AlarmCheckCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_updateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure ed_AlarmCheckCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure chk_AutoCodeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
    State : string;

    procedure ShowAlarmCheckCode(aCode:string);
    Function InsertTB_ALARMCHECKCODE(aAlarmCheckCode,aAlarmCheckName:string):Boolean;
    Function UpdateTB_ALARMCHECKCODE(aAlarmCheckCode,aAlarmCheckName:string):Boolean;
    Function DeleteTB_ALARMCHECKCODE(aAlarmCheckCode:string):Boolean;
    Function GetAutoAlarmCheckCode:string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
  public
    { Public declarations }
  end;

var
  fmAlarmManageCode: TfmAlarmManageCode;

implementation

uses
  uDataModule1,
  uCommonSql,
  uLomosUtil;

{$R *.dfm}

{ TfmAlarmManageCode }

procedure TfmAlarmManageCode.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmAlarmManageCode.FormActivate(Sender: TObject);
begin
 sg_AlarmCheckCode.OnDrawCell:=StringGrideDrawCell;
 ShowAlarmCheckCode('');

end;

procedure TfmAlarmManageCode.ShowAlarmCheckCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  with sg_AlarmCheckCode do   //스트링그리드 초기화
  begin
    RowCount := 2;
    for i:= 0 to ColCount - 1 do
    begin
      Cells[i,1] := '';
    end;
  end;
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ALARMCHECKCODE ';
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

    with sg_AlarmCheckCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ALARMCHECKCODE').AsString;
        cells[1,nRow] := FindField('AL_ALARMCHECKCODENAME').AsString;
        if (FindField('AL_ALARMCHECKCODE').AsString)  = aCode then
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
end;

procedure TfmAlarmManageCode.sg_AlarmCheckCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_AlarmCheckCode.Text := cells[0,Row];
    ed_AlarmCheckName.Text := cells[1,Row];

  end;

end;

procedure TfmAlarmManageCode.btn_InsertClick(Sender: TObject);
begin

  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_AlarmCheckCode do
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

  if chk_AutoCode.Checked then chk_AutoCodeClick(self);
  ed_AlarmCheckCode.SetFocus;
end;

procedure TfmAlarmManageCode.btn_updateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

  ed_AlarmCheckName.SetFocus;

end;

procedure TfmAlarmManageCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
begin

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_ALARMCHECKCODE(ed_AlarmCheckCode.Text,ed_AlarmCheckName.Text)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_ALARMCHECKCODE(ed_AlarmCheckCode.Text,ed_AlarmCheckName.Text);

  if bResult then ShowAlarmCheckCode(ed_AlarmCheckCode.Text)
  else showmessage('저장실패');
end;

procedure TfmAlarmManageCode.btn_deleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_ALARMCHECKCODE(ed_AlarmCheckCode.Text);

  if bResult then ShowAlarmCheckCode('')
  else showmessage('삭제실패.');
end;

function TfmAlarmManageCode.DeleteTB_ALARMCHECKCODE(
  aAlarmCheckCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_ALARMCHECKCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AL_ALARMCHECKCODE = ''' + aAlarmCheckCode + '''';
  
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

function TfmAlarmManageCode.InsertTB_ALARMCHECKCODE(aAlarmCheckCode,
  aAlarmCheckName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_ALARMCHECKCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMCHECKCODE,';
  stSql := stSql + ' AL_ALARMCHECKCODENAME)';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aAlarmCheckCode + ''',';
  stSql := stSql + '''' + aAlarmCheckName + '''';
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

function TfmAlarmManageCode.UpdateTB_ALARMCHECKCODE(aAlarmCheckCode,
  aAlarmCheckName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_ALARMCHECKCODE set ';
  stSql := stSql + ' AL_ALARMCHECKCODENAME = ''' + aAlarmCheckName + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND AL_ALARMCHECKCODE = ''' + aAlarmCheckCode + '''';

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

procedure TfmAlarmManageCode.ed_AlarmCheckCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_AlarmCheckName.SetFocus;
  end;

end;

procedure TfmAlarmManageCode.btn_CloseClick(Sender: TObject);
begin
Close;
end;

procedure TfmAlarmManageCode.chk_AutoCodeClick(Sender: TObject);
begin
  if chk_AutoCode.Checked then ed_AlarmCheckCode.Text := GetAutoAlarmCheckCode;
end;

function TfmAlarmManageCode.GetAutoAlarmCheckCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  nSeq := 1;
  stSql := CommonSql.GetMaxAlarmCheckCode;
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('AL_ALARMCHECKCODE').AsString) then
      begin
        nSeq := strtoint(FindField('AL_ALARMCHECKCODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmAlarmManageCode.FormClear;
begin
  ed_AlarmCheckCode.Text := '';
  ed_AlarmCheckName.Text := '';
end;

procedure TfmAlarmManageCode.ButtonEnable(aState: string);
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

procedure TfmAlarmManageCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    ed_AlarmCheckCode.Enabled := True;
    ed_AlarmCheckName.Enabled := True;
    chk_AutoCode.Enabled := True;
    sg_AlarmCheckCode.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    ed_AlarmCheckCode.Enabled := False;
    ed_AlarmCheckName.Enabled := False;
    chk_AutoCode.Enabled := False;
    sg_AlarmCheckCode.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    ed_AlarmCheckCode.Enabled := False;
    ed_AlarmCheckName.Enabled := True;
    chk_AutoCode.Enabled := False;
    sg_AlarmCheckCode.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    ed_AlarmCheckCode.Enabled := False;
    ed_AlarmCheckName.Enabled := False;
    chk_AutoCode.Enabled := False;
    sg_AlarmCheckCode.Enabled := True;
  end;
end;

procedure TfmAlarmManageCode.btn_CancelClick(Sender: TObject);
begin
  ShowAlarmCheckCode(ed_AlarmCheckCode.text);

end;

procedure TfmAlarmManageCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmAlarmManageCode.Width;
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
