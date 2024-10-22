unit uAlarmStateCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmAlarmStateCode = class(TfmASubForm)
    Panel2: TPanel;
    sg_AlarmStateCode: TAdvStringGrid;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    btn_Delete: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Insert: TSpeedButton;
    ed_AlarmStateCode: TEdit;
    ed_AlarmStateName: TEdit;
    Label2: TLabel;
    cmb_AlarmGrade: TComboBox;
    chk_Event: TCheckBox;
    StatusBar1: TStatusBar;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    btn_Cancel: TSpeedButton;
    chk_Alarm: TCheckBox;
    panColor: TPanel;
    ColorDialog1: TColorDialog;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormActivate(Sender: TObject);
    procedure sg_AlarmStateCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure ed_AlarmStateCodeKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure panColorClick(Sender: TObject);
    procedure chk_AlarmClick(Sender: TObject);
  private
    { Private declarations }
    State : string;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowAlarmStateCode(aCode:string);
    Function InsertTB_ALARMSTATUSCODE(aAlarmStateCode,aAlarmStateName,aAlarmCheck,aAlarmGrade,aAlarmSound,aColor:string):Boolean;
    Function UpdateTB_ALARMSTATUSCODE(aAlarmStateCode,aAlarmStateName,aAlarmCheck,aAlarmGrade,aAlarmSound,aColor:string):Boolean;
    Function DeleteTB_ALARMSTATUSCODE(aAlarmStateCode:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAlarmStateCode: TfmAlarmStateCode;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

{ TfmAlarmStateCode }

procedure TfmAlarmStateCode.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmAlarmStateCode.FormActivate(Sender: TObject);
begin
 sg_AlarmStateCode.OnDrawCell:=StringGrideDrawCell;
 sg_AlarmStateCode.ColWidths[2] := 0;
 sg_AlarmStateCode.ColWidths[3] := 0;
 sg_AlarmStateCode.ColWidths[4] := 0;
 sg_AlarmStateCode.ColWidths[5] := 0;
 sg_AlarmStateCode.ColWidths[6] := 0;
 ShowAlarmStateCode('');

end;

procedure TfmAlarmStateCode.ShowAlarmStateCode(aCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_AlarmStateCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by AL_ALARMSTATUSCODE ';

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

    with sg_AlarmStateCode do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
        cells[1,nRow] := FindField('AL_ALARMNAME').AsString;
        cells[2,nRow] := FindField('AL_ALARMVIEW').AsString;
        cells[3,nRow] := FindField('AL_ALARMGRADE').AsString;
        cells[4,nRow] := FindField('AL_ALARMSOUND').AsString;
        cells[5,nRow] := FindField('AL_GUBUN').AsString;
        cells[6,nRow] := inttostr(FindField('AL_COLOR').AsInteger);
        if FindField('AL_ALARMSTATUSCODE').AsString  = aCode then
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
  sg_AlarmStateCodeClick(sg_AlarmStateCode);
end;

procedure TfmAlarmStateCode.sg_AlarmStateCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_AlarmStateCode.Text := cells[0,Row];
    ed_AlarmStateName.Text := cells[1,Row];
    if strtoint(cells[2,Row]) > 0 then chk_Event.Checked := True
    else chk_Event.Checked := False;
    Try
      if strtoint(cells[4,Row]) > 0 then chk_Alarm.Checked := True
      else chk_Alarm.Checked := False;
    Except
      chk_Alarm.Checked := False;
    End;
    panColor.Visible := chk_Alarm.Checked;
    if isdigit(cells[6,Row]) then
      panColor.Color := strtoint(cells[6,Row]);

    cmb_AlarmGrade.ItemIndex := cmb_AlarmGrade.Items.IndexOf(cells[3,Row]);

  end;

end;

procedure TfmAlarmStateCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_AlarmStateCode do
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

  ed_AlarmStateCode.SetFocus;
end;

procedure TfmAlarmStateCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_AlarmStateName.SetFocus;

end;

procedure TfmAlarmStateCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  stEventCheck : string;
  stAlarm : string;
  stColor : string;
begin

  if chk_Event.Checked then stEventCheck := '1'
  else stEventCheck := '0';

  if chk_Alarm.Checked then stAlarm := '1'
  else stAlarm := '0';

  stColor := inttostr(panColor.Color);

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_ALARMSTATUSCODE(ed_AlarmStateCode.Text,ed_AlarmStateName.Text,stEventCheck,cmb_AlarmGrade.Text,stAlarm,stColor)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_ALARMSTATUSCODE(ed_AlarmStateCode.Text,ed_AlarmStateName.Text,stEventCheck,cmb_AlarmGrade.Text,stAlarm,stColor);

  if bResult then ShowAlarmStateCode(ed_AlarmStateCode.Text)
  else showmessage('저장실패');
end;

procedure TfmAlarmStateCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  bResult := DeleteTB_ALARMSTATUSCODE(ed_AlarmStateCode.Text);

  if bResult then ShowAlarmStateCode('')
  else showmessage('삭제실패.');

end;

function TfmAlarmStateCode.DeleteTB_ALARMSTATUSCODE(
  aAlarmStateCode: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_ALARMSTATUSCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AL_ALARMSTATUSCODE = ''' + aAlarmStateCode + '''';
  
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

function TfmAlarmStateCode.InsertTB_ALARMSTATUSCODE(aAlarmStateCode,
  aAlarmStateName, aAlarmCheck, aAlarmGrade,aAlarmSound,aColor: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_ALARMSTATUSCODE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AL_ALARMSTATUSCODE,';
  stSql := stSql + ' AL_ALARMNAME,';
  stSql := stSql + ' AL_ALARMVIEW,';
  stSql := stSql + ' AL_ALARMSOUND, ';
  stSql := stSql + ' AL_ALARMGRADE,' ;
  stSql := stSql + ' AL_COLOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aAlarmStateCode + ''',';
  stSql := stSql + '''' + aAlarmStateName + ''',';
  stSql := stSql +  aAlarmCheck + ',';
  stSql := stSql +  aAlarmSound + ',';
  stSql := stSql +  aAlarmGrade + ',';
  stSql := stSql +  aColor ;
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmAlarmStateCode.UpdateTB_ALARMSTATUSCODE(aAlarmStateCode,
  aAlarmStateName, aAlarmCheck, aAlarmGrade,aAlarmSound,aColor: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_ALARMSTATUSCODE set ';
  stSql := stSql + ' AL_ALARMNAME = ''' + aAlarmStateName + ''', ';
  stSql := stSql + ' AL_ALARMVIEW = ' + aAlarmCheck + ', ';
  stSql := stSql + ' AL_ALARMSOUND = ' + aAlarmSound + ', ';
  stSql := stSql + ' AL_ALARMGRADE = ' + aAlarmGrade + ', ';
  stSql := stSql + ' AL_COLOR = ' + aColor ;
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND AL_ALARMSTATUSCODE = ''' + aAlarmStateCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAlarmStateCode.ed_AlarmStateCodeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    ed_AlarmStateName.SetFocus;
  end;

end;

procedure TfmAlarmStateCode.btn_CloseClick(Sender: TObject);
begin
Close;
end;

procedure TfmAlarmStateCode.ButtonEnable(aState: string);
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

procedure TfmAlarmStateCode.FormClear;
begin
  ed_AlarmStateCode.Text := '';
  ed_AlarmStateName.Text := '';
  chk_Event.Checked := False;
  chk_Alarm.Checked := False;
  panColor.Visible := False;
  cmb_AlarmGrade.ItemIndex := 0;
end;

procedure TfmAlarmStateCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_AlarmStateCode.Enabled := False;
    ed_AlarmStateCode.Enabled := true;
    ed_AlarmStateName.Enabled  := true;
    chk_Event.Enabled := true;
    chk_Alarm.Enabled := True;
    panColor.Enabled := True;
    cmb_AlarmGrade.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_AlarmStateCode.Enabled := True;
    ed_AlarmStateCode.Enabled := False;
    ed_AlarmStateName.Enabled  := False;
    chk_Event.Enabled := False;
    chk_Alarm.Enabled := False;
    panColor.Enabled := False;
    cmb_AlarmGrade.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_AlarmStateCode.Enabled := False;
    ed_AlarmStateCode.Enabled := False;
    ed_AlarmStateName.Enabled  := true;
    chk_Event.Enabled := true;
    chk_Alarm.Enabled := True;
    panColor.Enabled := True;
    cmb_AlarmGrade.Enabled := True;
  end;
end;

procedure TfmAlarmStateCode.btn_CancelClick(Sender: TObject);
begin
  ShowAlarmStateCode(ed_AlarmStateCode.text);
end;

procedure TfmAlarmStateCode.FormShow(Sender: TObject);
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

procedure TfmAlarmStateCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmAlarmStateCode.Width;
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

procedure TfmAlarmStateCode.panColorClick(Sender: TObject);
begin
  inherited;
  ColorDialog1.Color := panColor.Color;
  if ColorDialog1.Execute then
  begin
    panColor.Color := ColorDialog1.Color;
  end;
end;

procedure TfmAlarmStateCode.chk_AlarmClick(Sender: TObject);
begin
  inherited;
  panColor.Visible := chk_Alarm.Checked;
end;

end.
