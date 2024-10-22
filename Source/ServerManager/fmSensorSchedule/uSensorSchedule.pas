unit uSensorSchedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, ExtCtrls, Grids, BaseGrid, AdvGrid,
  StdCtrls, ComCtrls, Buttons,ADODB,ActiveX;

type
  TfmSensorSchedule = class(TfmASubForm)
    Panel12: TPanel;
    GroupBox6: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel2: TPanel;
    Panel1: TPanel;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    Label1: TLabel;
    cmb_Alarm: TComboBox;
    cmb_Sensor: TComboBox;
    sg_SensorSch: TAdvStringGrid;
    Splitter2: TSplitter;
    Panel3: TPanel;
    cmb_Alarm1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    cmb_Sensor1: TComboBox;
    Label4: TLabel;
    Label5: TLabel;
    ed_startTime: TEdit;
    ed_EndTime: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    ed_AlarmNo: TEdit;
    ed_schCode: TEdit;
    Label8: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_AlarmChange(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_Alarm1Change(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_SensorChange(Sender: TObject);
    procedure sg_SensorSchClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    AlarmCodeList:TStringList;
    State : string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure LoadAlarmCode(cmb_Box:TComboBox);
    procedure LoadSensorCode(aAlarmCode:string;cmb_Box:TComboBox);
    procedure ShowSensorSchedule(aCode:string);
    Function DeleteTB_ZONESCHEDULE(aAlarmNo,aSensorNo,aschCode:string):Boolean;
    Function MultiCheckSchedule(aAlarmNo,astartTime,aEndTime:string):Boolean;
    Function CheckScheduleTime(aAlarmNo,aSensorNo,aSchCode,astartTime,aEndTime:string):Boolean;
    Function UpdateTB_ZONESCHEDULE(aAlarmNo,aSensorNo,aSchCode,astartTime,aEndTime:string):Boolean;
    Function MultiInsertTB_ZONESCHEDULE(aAlarmNo,aStartTime,aEndTime:string):Boolean;
    Function InsertTB_ZONESCHEDULE(aAlarmNo,aSensorNo,aSchCode,aStartTime, aEndTime:string):Boolean;
    procedure InsertProcess;
    procedure UpdateProcess;
    Function GetScheduleCode:integer;
  public
    { Public declarations }
  end;

var
  fmSensorSchedule: TfmSensorSchedule;

implementation
uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmSensorSchedule.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSensorSchedule.FormCreate(Sender: TObject);
begin
  AlarmCodeList := TStringList.Create;

  LoadAlarmCode(cmb_Alarm);
  cmb_Alarm.ItemIndex := 0;
  LoadSensorCode('',cmb_Sensor);
  cmb_Sensor.ItemIndex := 0;

  LoadAlarmCode(cmb_Alarm1);
  cmb_Alarm1.ItemIndex := -1;
  LoadSensorCode('',cmb_Sensor1);
  cmb_Sensor1.ItemIndex := -1;

  sg_SensorSch.ColWidths[5] := 0;
  sg_SensorSch.ColWidths[6] := 0;
end;

procedure TfmSensorSchedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  AlarmCodeList.Free;
end;

procedure TfmSensorSchedule.LoadAlarmCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('전체방범기기');
  AlarmCodeList.Clear;
  AlarmCodeList.Add('');

  stSql := 'select a.AL_ZONENAME,a.AC_NODENO,a.AC_ECUID from TB_ALARMDEVICE a';
  stSql := stSql + ' Inner Join TB_ZONEDEVICE b ';
  stSql := stSql + ' ON( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND b.AL_ZONEUSE = ''Y'')';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' GROUP BY a.AC_NODENO,a.AC_ECUID,a.AL_ZONENAME ';

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
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString);
      AlarmCodeList.Add(FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  
end;

procedure TfmSensorSchedule.cmb_AlarmChange(Sender: TObject);
begin
  LoadSensorCode(AlarmCodeList.Strings[cmb_Alarm.itemIndex], cmb_Sensor);
  cmb_Sensor.ItemIndex := 0;
  ShowSensorSchedule('');
end;

procedure TfmSensorSchedule.ButtonEnable(aState: string);
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

procedure TfmSensorSchedule.FormClear;
begin
  cmb_Alarm1.ItemIndex := -1;
  cmb_Sensor1.ItemIndex := -1;
  ed_startTime.Text := '';
  ed_EndTime.Text := '';
  ed_AlarmNo.Text := '';
end;

procedure TfmSensorSchedule.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    cmb_Alarm1.Enabled := True;
    cmb_Sensor1.Enabled := True;
    ed_startTime.Enabled := True;
    ed_EndTime.Enabled := True;
    sg_SensorSch.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    cmb_Alarm1.Enabled := False;
    cmb_Sensor1.Enabled := False;
    ed_startTime.Enabled := False;
    ed_EndTime.Enabled := False;
    sg_SensorSch.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    cmb_Alarm1.Enabled := False;
    cmb_Sensor1.Enabled := False;
    ed_startTime.Enabled := True;
    ed_EndTime.Enabled := True;
    sg_SensorSch.Enabled := False;
  end;
end;

procedure TfmSensorSchedule.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  cmb_Alarm1.ItemIndex := cmb_Alarm.ItemIndex;
  cmb_Alarm1Change(nil);
  
end;

procedure TfmSensorSchedule.cmb_Alarm1Change(Sender: TObject);
begin
  LoadSensorCode(AlarmCodeList.Strings[cmb_Alarm1.itemIndex], cmb_Sensor1);
  cmb_Sensor1.ItemIndex := 0;

end;

procedure TfmSensorSchedule.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmSensorSchedule.ShowSensorSchedule(aCode: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_SensorSch); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := ' select a.*,b.AL_ZONENAME,c.AL_ZONENAME as AL_ALARMNAME ';
  stSql := stSql + ' from TB_ZONESCHEDULE a ';
  stSql := stSql + ' Inner Join TB_ZONEDEVICE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.AL_ZONENUM = b.AL_ZONENUM) ';
  stSql := stSql + ' Inner Join TB_ALARMDEVICE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID )';
  stSql := stSql + ' WHERE a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_Alarm.ItemIndex > 0 then
  begin
    Try
      stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],1,3))) ;
      stSql := stSql + ' AND a.AC_ECUID = ''' + copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],4,2) + ''' ' ;
    Except
      showmessage('방범기기코드가 잘못되었습니다.');
      Exit;
    End;
    if cmb_Sensor.ItemIndex > 0 then
      stSql := stSql + ' AND a.AL_ZONENUM = ''' + copy(cmb_Sensor.Text,1,1) + ''' ';
  end;

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

    with sg_SensorSch do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AL_ZONENAME').AsString;
        cells[1,nRow] := FindField('AL_ALARMNAME').AsString;
        cells[2,nRow] := FindField('AL_ZONENUM').AsString;
        cells[3,nRow] := FindField('ZO_STARTTIME').AsString;
        cells[4,nRow] := FindField('ZO_ENDTIME').AsString;
        cells[5,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString;
        cells[6,nRow] := FindField('ZO_SCHNUM').AsString;
        if (cells[5,nRow] + FindField('AL_ZONENUM').AsString )  = aCode then
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

procedure TfmSensorSchedule.LoadSensorCode(aAlarmCode:string;cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('0.전체');
  if (aAlarmCode = '') or (aAlarmCode = '000') then Exit;

  stSql := 'select AC_NODENO,AC_ECUID, AL_ZONENUM, AL_ZONENAME from TB_ZONEDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_ZONEUSE = ''Y'' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmCode,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmCode,4,2) + ''' ';

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
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AL_ZONENUM').AsString + '.' + FindField('AL_ZONENAME').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmSensorSchedule.FormShow(Sender: TObject);
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
  ShowSensorSchedule('');
end;

procedure TfmSensorSchedule.cmb_SensorChange(Sender: TObject);
begin
  ShowSensorSchedule('');
end;

procedure TfmSensorSchedule.sg_SensorSchClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    Try
      cmb_Alarm1.ItemIndex := AlarmCodeList.IndexOf(FillZeroNumber(strtoint(cells[5,Row]),3));
      LoadSensorCode(cells[5,Row],cmb_Sensor1);
      cmb_Sensor1.ItemIndex := strtoint(cells[2,Row]);
    Except
      showmessage('방범기기 코드에 문제가 있습니다.');
      Exit;
    End;

    ed_startTime.Text := cells[3,Row];
    ed_EndTime.Text := cells[4,Row];
    ed_AlarmNo.Text := cells[5,Row];
    ed_schCode.Text := cells[6,Row];

  end;

end;

procedure TfmSensorSchedule.btn_CancelClick(Sender: TObject);
begin
  if isDigit(ed_AlarmNo.text) then  ShowSensorSchedule(ed_AlarmNo.text + copy(cmb_Sensor1.Text,1,1))
  else ShowSensorSchedule('');
end;

procedure TfmSensorSchedule.btn_DeleteClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  if DeleteTB_ZONESCHEDULE(ed_AlarmNo.Text,copy(cmb_Sensor1.text,1,1),ed_schCode.Text) then
     ShowSensorSchedule('');
end;

function TfmSensorSchedule.DeleteTB_ZONESCHEDULE(aAlarmNo, aSensorNo,
  aschCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Not isDigit(aAlarmNo) then
  begin
    showmessage('방범기기번호가 잘못되어 삭제할 수 없습니다.');
    Exit;
  end;
  if Not isDigit(aSensorNo) then
  begin
    showmessage('센서번호가 잘못되어 삭제할 수 없습니다.');
    Exit;
  end;
  if Not isDigit(aschCode) then
  begin
    showmessage('알수 없는 스케줄 입니다.');
    Exit;
  end;

  stSql := 'Delete From TB_ZONESCHEDULE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3)));
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aSensorNo + ''' ';
  stSql := stSql + ' AND ZO_SCHNUM = ' + inttostr(strtoint(aschCode));

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmSensorSchedule.btn_SaveClick(Sender: TObject);
begin
  if UpperCase(State) = 'INSERT' then  InsertProcess
  else if UpperCase(State) = 'UPDATE' then  UpdateProcess;

end;

function TfmSensorSchedule.CheckScheduleTime(aAlarmNo, aSensorNo,aSchCode,
  astartTime, aEndTime: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;

  stSql := ' select * from ';
  stSql := stSql + ' TB_ZONESCHEDULE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3)));
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(strtoint(aSensorNo)) + ''' ';
  stSql := stSql + ' AND ( ( ZO_STARTTIME <= ''' + astartTime + ''' ' ;
  stSql := stSql + '         AND  ZO_ENDTIME >=''' + astartTime + ''') ' ;
  stSql := stSql + '    OR ( ZO_STARTTIME <= ''' + aEndTime + ''' ' ;
  stSql := stSql + '         AND  ZO_ENDTIME >=''' + aEndTime + ''') ' ;
  stSql := stSql + '      ) ' ;
  if aSchCode <> '' then
    stSql := stSql + ' AND ZO_SCHNUM <> ' + aSchCode ;

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
    if RecordCount < 1 then result := True;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmSensorSchedule.UpdateTB_ZONESCHEDULE(aAlarmNo, aSensorNo,
  aSchCode, astartTime, aEndTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ZONESCHEDULE ';
  stSql := stSql + ' set ZO_STARTTIME = ''' + astartTime + ''',' ;
  stSql := stSql + ' ZO_ENDTIME = ''' + aEndTime + ''',' ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3)));
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(strtoint(aSensorNo)) + ''' ';
  stSql := stSql + ' AND ZO_SCHNUM <> ' + aSchCode ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmSensorSchedule.InsertProcess;
var
  stSql : string;
  nSchCode : integer;
begin
  if cmb_Alarm1.ItemIndex = 0 then  //전체기기에 모두 적용하는 경우
  begin
    if Not MultiCheckSchedule('',ed_startTime.text,ed_EndTime.text) then
    begin
      showmessage('현재 중복된 시간의 스케줄 등록이 되어 있는 장비가 있습니다. 기존 스케줄을 확인해 주세요.');
      Exit;
    end;
    if Not MultiInsertTB_ZONESCHEDULE('',ed_startTime.text,ed_EndTime.text) then
    begin
      showmessage('스케줄 등록에 실패했습니다.');
      Exit;
    end;
    ShowSensorSchedule('');
    Exit;
  end;
  if cmb_Sensor1.ItemIndex = 0 then  //전체센서에 모두 적용하는 경우
  begin
    if Not MultiCheckSchedule(AlarmCodeList.Strings[cmb_Alarm1.ItemIndex],ed_startTime.text,ed_EndTime.text) then
    begin
      showmessage('현재 중복된 시간의 스케줄 등록이 되어 있는 장비가 있습니다. 기존 스케줄을 확인해 주세요.');
      Exit;
    end;
    if Not MultiInsertTB_ZONESCHEDULE(AlarmCodeList.Strings[cmb_Alarm1.ItemIndex],ed_startTime.text,ed_EndTime.text) then
    begin
      showmessage('스케줄 등록에 실패했습니다.');
      Exit;
    end;
    ShowSensorSchedule('');
    Exit;
  end;
  if Not CheckScheduleTime(AlarmCodeList.Strings[cmb_Alarm1.ItemIndex],copy(cmb_Sensor1.Text,1,1),'', ed_startTime.Text,ed_EndTime.text) then
  begin
    showmessage('현재 중복된 시간의 스케줄 등록이 되어 있습니다. 기존 스케줄을 확인해 주세요.');
    Exit;
  end;
  nSchCode := GetScheduleCode;
  if Not InsertTB_ZONESCHEDULE(AlarmCodeList.Strings[cmb_Alarm1.ItemIndex],
                    copy(cmb_Sensor1.Text,1,1),
                    inttostr(nSchCode),
                    ed_startTime.Text, ed_EndTime.text) then
  begin
    showmessage('스케줄 등록에 실패했습니다.');
    Exit;
  end;
  ShowSensorSchedule(AlarmCodeList.Strings[cmb_Alarm1.ItemIndex] + copy(cmb_Sensor1.Text,1,1));
end;

procedure TfmSensorSchedule.UpdateProcess;
begin
  if Not IsDigit(ed_AlarmNo.Text) then
  begin
    showmessage('방범기기코드가 잘못되었습니다.');
    Exit;
  end;
  if Not IsDigit(copy(cmb_Sensor1.Text,1,1)) then
  begin
    showmessage('센서번호가 잘못되었습니다.');
    Exit;
  end;

  if Not CheckScheduleTime(ed_AlarmNo.Text,copy(cmb_Sensor1.Text,1,1),ed_schCode.Text, ed_startTime.Text,ed_EndTime.text) then
  begin
    showmessage('현재 중복된 시간의 스케줄 등록이 되어 있습니다. 기존 스케줄을 확인해 주세요.');
    Exit;
  end;
  if UpdateTB_ZONESCHEDULE(ed_AlarmNo.Text,copy(cmb_Sensor1.Text,1,1),ed_schCode.Text, ed_startTime.Text,ed_EndTime.text) then
  begin
    ShowSensorSchedule(ed_AlarmNo.text + copy(cmb_Sensor1.Text,1,1));
  end else showmessage('데이터 업데이트에 실패했습니다.');

end;

function TfmSensorSchedule.MultiCheckSchedule(aAlarmNo,astartTime,aEndTime:string): Boolean;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
begin
  result := False;

  stSql := ' select * from TB_ZONEDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_ZONEUSE = ''Y'' ';
  if aAlarmNo <> ''  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3)));
    stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  end;

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

    While Not Eof do
    begin
      if Not CheckScheduleTime(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString ,
                        FindField('AL_ZONENUM').AsString,
                        '',astartTime, aEndTime) then
      begin
        result := False;
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      Next;
    end;
  end;
  result := True;
  TempAdoQuery.Free;
  CoUninitialize;

end;

function TfmSensorSchedule.MultiInsertTB_ZONESCHEDULE(aAlarmNo, aStartTime,
  aEndTime: string): Boolean;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
  nSchCode : integer;
begin
  result := False;
  nSchCode := GetScheduleCode;

  stSql := ' select * from TB_ZONEDEVICE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_ZONEUSE = ''Y'' ';
  if aAlarmNo <> ''  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3)));
    stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  end;

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
    DataModule1.ADOConnection.BeginTrans;
    While Not Eof do
    begin
      if Not InsertTB_ZONESCHEDULE(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString,
                        FindField('AL_ZONENUM').AsString,
                        inttostr(nSchCode),
                        astartTime, aEndTime) then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        result := False;
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      inc(nSchCode);
      Next;
    end;
  end;
  DataModule1.ADOConnection.CommitTrans;
  result := True;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmSensorSchedule.GetScheduleCode: integer;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
begin
  result := 1;

  stSql := ' select Max(ZO_SCHNUM) as ZO_SCHNUM from TB_ZONESCHEDULE ';

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
    if recordCount > 0 then
    begin
      if Not FindField('ZO_SCHNUM').IsNull then result := FindField('ZO_SCHNUM').AsInteger + 1;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

function TfmSensorSchedule.InsertTB_ZONESCHEDULE(aAlarmNo, aSensorNo,
  aSchCode, aStartTime, aEndTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ZONESCHEDULE (';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' AL_ZONENUM,';
  stSql := stSql + ' ZO_SCHNUM,';
  stSql := stSql + ' ZO_STARTTIME,';
  stSql := stSql + ' ZO_ENDTIME )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + inttostr(strtoint(copy(aAlarmNo,1,3))) + ', ';;
  stSql := stSql + '''' + copy(aAlarmNo,4,2) + ''',';
  stSql := stSql + '''' + inttostr(strtoint(aSensorNo)) + ''',';
  stSql := stSql + inttostr(strtoint(aSchCode)) + ', ';;
  stSql := stSql + '''' + astartTime + ''',' ;
  stSql := stSql + '''' + aEndTime + ''' ) ' ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmSensorSchedule.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := fmSensorSchedule.Width;
  nBlock := (nWidth - 60) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 30 + nLeft;
  btn_Update.Left := 30 + nBlock + nLeft;
  btn_Save.Left := 30 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 30 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 30 + (nBlock * 4) + nLeft;
  btn_Close.Left := 30 + (nBlock * 5) + nLeft;

end;

end.
