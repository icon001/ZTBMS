unit uAlarmGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, StdCtrls,ADODB,ActiveX,
  uSubForm, CommandArray, AdvObj;

type
  TfmAlarmGroup = class(TfmASubForm)
    Panel7: TPanel;
    sg_Alarm: TAdvStringGrid;
    Panel19: TPanel;
    Panel8: TPanel;
    btn_Insert: TSpeedButton;
    btn_delete: TSpeedButton;
    Panel20: TPanel;
    Panel9: TPanel;
    Panel21: TPanel;
    sg_AlarmGroupcode: TAdvStringGrid;
    btn_Close: TSpeedButton;
    Panel1: TPanel;
    Label1: TLabel;
    cmb_AlarmGroup: TComboBox;
    Button1: TButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_AlarmCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_AlarmGroupcodeCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure cmb_AlarmGroupChange(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_deleteClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    Function InsertTB_ALARMCODEGROUP(aAlarmCode,aGroupName:string):Boolean;
    Function DeleteTB_ALARMCODEGROUP(aAlarmCode,aGroupName:string):Boolean;
  private
    { Private declarations }
    procedure LoadAlarmCode;
    procedure LoadAlarmGroupCode(aAlarmGroupcode:string);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure GetAlarmGroup(aCode:string;cmb_box : TComboBox);
  public
    { Public declarations }
  end;

var
  fmAlarmGroup: TfmAlarmGroup;

implementation

uses uDataModule1, uNewAlarmGroupAdd;

{$R *.dfm}

procedure TfmAlarmGroup.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmGroup.LoadAlarmCode;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_Alarm,2,2,True); //스트링그리드 초기화

  stSql := 'select * from TB_ALARMSTATUSCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Order by AL_ALARMSTATUSCODE ';

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

      with sg_Alarm do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
          cells[1,nRow] := FindField('AL_ALARMNAME').AsString;
          AddCheckBox(0,nRow,False,False);

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

procedure TfmAlarmGroup.FormCreate(Sender: TObject);
begin
  inherited;
  LoadAlarmCode;
  GetAlarmGroup('',cmb_AlarmGroup);
  LoadAlarmGroupCode(cmb_AlarmGroup.Text);
end;

procedure TfmAlarmGroup.sg_AlarmCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmAlarmGroup.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAlarmGroup.sg_AlarmGroupcodeCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  inherited;
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmAlarmGroup.GetAlarmGroup(aCode:string;cmb_box: TComboBox);
var
  stSql:string;
  TempAdoQuery : TADOQuery;
begin
  cmb_box.Clear;
  stSql := ' Select AG_CODE from TB_ALARMCODEGROUP ';
  stSql := stSql + ' Group by AG_CODE ';
  stSql := stSql + ' order by AG_CODE ';

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
      if RecordCount < 1 then Exit;
      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AG_CODE').AsString);
        Next;
      end;
      if aCode = '' then cmb_Box.ItemIndex := 0
      else cmb_Box.Text := aCode;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmGroup.LoadAlarmGroupCode(aAlarmGroupcode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInit(sg_AlarmGroupcode,2,2,True); //스트링그리드 초기화

  stSql := 'select b.* from TB_ALARMCODEGROUP a ';
  stSql := stSql + ' Inner Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AG_CODE = ''' + aAlarmGroupcode + ''' ';
  stSql := stSql + ' Order by a.AL_ALARMSTATUSCODE ';

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

      with sg_AlarmGroupcode do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
          cells[1,nRow] := FindField('AL_ALARMNAME').AsString;
          AddCheckBox(0,nRow,False,False);

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

procedure TfmAlarmGroup.cmb_AlarmGroupChange(Sender: TObject);
begin
  inherited;
  LoadAlarmGroupCode(cmb_AlarmGroup.Text);
end;

procedure TfmAlarmGroup.btn_InsertClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stAlarmCode : string;
  stGroupName : string;
begin
  inherited;
  for i := 1 to sg_Alarm.RowCount - 1 do   //체크되어 있는 코드를 모두 Add 시킴
  begin
    sg_Alarm.GetCheckBoxState(0,i, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stAlarmCode := sg_Alarm.Cells[0,i];
      stGroupName := cmb_AlarmGroup.Text;
      InsertTB_ALARMCODEGROUP(stAlarmCode,stGroupName);
      Application.ProcessMessages;
    end;
  end;
  LoadAlarmGroupCode(cmb_AlarmGroup.Text);
end;

function TfmAlarmGroup.InsertTB_ALARMCODEGROUP(aAlarmCode,
  aGroupName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ALARMCODEGROUP(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AG_CODE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aGroupName + ''',';
  stSql := stSql + '''' + aAlarmCode + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAlarmGroup.btn_deleteClick(Sender: TObject);
var
  i : integer;
  bchkState : Boolean;
  stAlarmCode : string;
  stGroupName : string;
begin
  for i := 1 to sg_AlarmGroupcode.RowCount - 1 do   //체크되어 있는 코드를 모두 Add 시킴
  begin
    sg_AlarmGroupcode.GetCheckBoxState(0,i, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stAlarmCode := sg_AlarmGroupcode.Cells[0,i];
      stGroupName := cmb_AlarmGroup.Text;
      DeleteTB_ALARMCODEGROUP(stAlarmCode,stGroupName);
      Application.ProcessMessages;
    end;
  end;
  LoadAlarmGroupCode(cmb_AlarmGroup.Text);
end;

function TfmAlarmGroup.DeleteTB_ALARMCODEGROUP(aAlarmCode,
  aGroupName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_ALARMCODEGROUP ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND AG_CODE = ''' + aGroupName + '''';
  stSql := stSql + ' AND AL_ALARMSTATUSCODE  = ''' + aAlarmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAlarmGroup.Button1Click(Sender: TObject);
var
  stNewAlarmGroup : string;
begin
  inherited;

  fmNewAlarmGroupName:= TfmNewAlarmGroupName.Create(Self);
  Try
    fmNewAlarmGroupName.SHowmodal;
    stNewAlarmGroup := fmNewAlarmGroupName.L_stGroupName;
  Finally
    fmNewAlarmGroupName.Free;
  End;
  if Trim(stNewAlarmGroup) <> '' then
  begin
    cmb_AlarmGroup.Items.Add(stNewAlarmGroup);
    cmb_AlarmGroup.Sorted := True;
    cmb_AlarmGroup.Text := stNewAlarmGroup;
    cmb_AlarmGroup.ItemIndex := cmb_AlarmGroup.Items.IndexOf(stNewAlarmGroup);
  end;
  LoadAlarmGroupCode(cmb_AlarmGroup.Text);
end;

end.
