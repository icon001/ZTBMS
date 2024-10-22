unit uNewAlarmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, FR_DSet,
  FR_DBSet, FR_Class, DB, ADODB, uSubForm, CommandArray, Menus,iniFiles,ComObj,
  Gauges, ExtCtrls,ActiveX, AdvObj;

type
  TfmNewAlarmReport = class(TfmASubForm)
    GroupBox1: TGroupBox;
    sg_AlarmReport: TAdvStringGrid;
    AdoQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    PopupMenu_Alarm: TPopupMenu;
    N12: TMenuItem;
    pan_gauge: TPanel;
    Label5: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
    GroupBox2: TGroupBox;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    GroupBox3: TGroupBox;
    Label3: TLabel;
    cmb_Position: TComboBox;
    Label4: TLabel;
    cmb_AlarmType: TComboBox;
    GroupBox4: TGroupBox;
    btn_Close: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Excel: TSpeedButton;
    Label1: TLabel;
    cmb_ModeState: TComboBox;
    cmb_AlarmGroup: TComboBox;
    Label2: TLabel;
    Label6: TLabel;
    cmb_DeviceType: TComboBox;
    AlarmList: TListBox;
    chk_PCtime: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure btn_SearchClick(Sender: TObject);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_AlarmReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_AlarmGroupChange(Sender: TObject);
    procedure cmb_PositionExit(Sender: TObject);
    procedure cmb_PositionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure AlarmListDblClick(Sender: TObject);
    procedure AlarmListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_PositionKeyPress(Sender: TObject; var Key: Char);
    procedure AlarmListExit(Sender: TObject);
    procedure cmb_PositionEnter(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    ArmAreaCodeList : TStringList;
    AlarmCodeList : TStringList;
    L_bKeyPress : Boolean;
    { Private declarations }
    procedure AlarmEventStateCode2Setting(aFromDate,aToDate:string);
    procedure GetAlarmName(cmb_box : TComboBox);
    procedure GetAlarmType(cmb_box : TComboBox;aAlarmGroup:string);
    procedure GetAlarmGroup(cmb_box : TComboBox);
    procedure GetEmInfoFromOperation(aCardNo:string; var aEmCode,aEmName:string);

    Function UpdateTB_AlarmEventStatusCode2(aGROUP_CODE,aAL_DATE,aAL_TIME,
                                     aAC_NODENO,aAC_ECUID,aAL_MSGNO,aNewState : string ):Boolean;

    Function GetTitle : String;

  public
    { Public declarations }
    procedure AlarmIDView(aAlarmID:string);
    procedure SearchAlarmNameList(aName:string);
  end;

var
  fmNewAlarmReport: TfmNewAlarmReport;

implementation

uses
    uDataModule1,
    uLomosUtil, uMssql, uPostGreSql, uMDBSql, uFireBird,
    UCommonModule, uExcelSave;

{$R *.dfm}

procedure TfmNewAlarmReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NewAlarmReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  ArmAreaCodeList.Free;
  AlarmCodeList.Free;
  Action := caFree;

end;

procedure TfmNewAlarmReport.FormCreate(Sender: TObject);
begin
  ArmAreaCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;

end;

procedure TfmNewAlarmReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmNewAlarmReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='경보 이력 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_AlarmReport.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmNewAlarmReport.btn_PrintClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  stTitle : string;
begin
  btn_Print.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle ;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('경보이력보고서','참조파일','D2DAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('경보이력보고서','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_AlarmReport,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

{  if Not AdoQuery.Active then
  begin
    showmessage('출력할 자료가 없습니다.');
    Exit;
  end;
  frReport1.ShowReport; }

end;

procedure TfmNewAlarmReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmNewAlarmReport.GetAlarmName(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  ArmAreaCodeList.Clear;
  cmb_box.Items.Add('전체');
  ArmAreaCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO  ';
  stSql := stSql + ' from TB_ARMAREA a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
      stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end;

  with DataModule1.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('AR_NAME').AsString);
      ArmAreaCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString  + inttostr(FindField('AR_AREANO').AsInteger) );
      Next;
    end;
  end;


end;

procedure TfmNewAlarmReport.GetAlarmType(cmb_box: TComboBox;aAlarmGroup:string);
var
  stSql:string;
begin
  cmb_box.Clear;
  AlarmCodeList.Clear;
  cmb_box.Items.Add('전체');
  AlarmCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := ' Select a.GROUP_CODE,a.AL_ALARMSTATUSCODE,a.AL_ALARMNAME,';
  stSql := stSql + ' a.AL_ALARMVIEW,a.AL_ALARMGRADE,a.AL_ALARMSOUND ';
  stSql := stSql + ' from TB_ALARMSTATUSCODE a';
  if Trim(aAlarmGroup) <> '' then
  begin
    stSql := stSql + ' INNER Join TB_ALARMCODEGROUP b ';
    stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE ';
    stSql := stSql + ' AND b.AG_CODE = ''' + aAlarmGroup + ''') ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by a.AL_ALARMNAME ';

  with DataModule1.ADOTmpQuery do
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
      cmb_Box.Items.Add(FindField('AL_ALARMNAME').AsString);
      AlarmCodeList.Add(FindField('AL_ALARMSTATUSCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmNewAlarmReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stArmAreaNo,stAlarmType:string;
  stModeState : string;
  stDeviceType : string;
  stWhere : string;
  i : integer;
  stEmCode : string;
  stEmName : string;
begin

  AlarmEventStateCode2Setting(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date));

  GridInit(sg_AlarmReport,16);

  stNodeNo:='';
  stEcuID:= '';
  stArmAreaNo := '';
  stAlarmType:= '';
  if cmb_Position.ItemIndex > 0 then
  begin
    stNodeNo := inttostr(strtoint(copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],1,3)));
    stEcuID := copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
    stArmAreaNo := copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],6,1) ;
  end;
  if cmb_AlarmType.ItemIndex > 0 then
  begin
    stAlarmType := AlarmCodeList.Strings[cmb_AlarmType.ItemIndex] ;
  end;

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,True,chk_PCtime.Checked)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,True,chk_PCtime.Checked)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,True,chk_PCtime.Checked)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectTB_ALARMEVENT_ArmAreaFromDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stAlarmType,True,chk_PCtime.Checked)
  else Exit;


  if cmb_ModeState.ItemIndex = 1 then stSql := stSql + ' AND a.AL_ALARMMODECODE = ''A'' '
  else if cmb_ModeState.ItemIndex = 2 then stSql := stSql + ' AND a.AL_ALARMMODECODE = ''D'' ';

  if cmb_DeviceType.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND a.AL_ALARMDEVICETYPECODE = ''' + cmb_DeviceType.Text + ''' ';
  end;

  if cmb_AlarmType.ItemIndex < 1 then
  begin
    if cmb_AlarmGroup.ItemIndex > 0 then
    begin
      stWhere := '';
      for i := 0 to AlarmCodeList.Count - 1 do
      begin
        if stWhere = '' then stWhere := stWhere + ' AND ( '
        else stWhere := stWhere + ' OR ';
        stWhere := stWhere + ' a.AL_STATUSCODE2 = ''' + AlarmCodeList.Strings[i] + ''' ' ;
        stWhere := stWhere + ' OR a.AL_ALARMSTATUSCODE = ''' + AlarmCodeList.Strings[i] + ''' ' ;
      end;
      if stWhere <> '' then
      begin
        stWhere := stWhere + ') ';
        stSql := stSql + stWhere;
      end;
    end;
  end;
  stSql := stSql + ' order by c.AR_NAME DESC,a.AL_DATE DESC,a.AL_TIME DESC ';

  //memo1.Text := stSql;
  
  with AdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;

    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '조회건수:' + numberformat(inttostr(recordcount)) + '건';
    self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
    self.FindSubForm('Main').FindCommand('STATUS').Execute;

    if RecordCount < 1 then
    begin
      //showmessage('조회할 데이터가 없습니다.');
      Exit;
    end;
    First;
    nRow := 1;
    sg_AlarmReport.RowCount := RecordCount + 1;
    While Not Eof do
    begin
      with sg_AlarmReport  do
      begin
        stEmCode := '';
        stEmName := '';
        if FindField('AR_NAME').AsString <> '' then
          cells[0,nRow] := FindField('AR_NAME').AsString
        else cells[0,nRow] := FindField('AC_DEVICENAME').AsString;

        cells[1,nRow] := copy(FindField('AL_DATE').AsString,1,4) + '-' + copy(FindField('AL_DATE').AsString,5,2)
                         + '-' + copy(FindField('AL_DATE').AsString,7,2)
                         + ' ' + copy(FindField('AL_TIME').AsString,1,2)
                         + ':' + copy(FindField('AL_TIME').AsString,3,2)
                         + ':' + copy(FindField('AL_TIME').AsString,5,2);   //발생시각
        cells[2,nRow] := FindField('AL_ZONENO').AsString;
        cells[3,nRow] := FindField('AL_ZONENAME').AsString;
        //cells[3,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
        cells[4,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
        cells[5,nRow] := FindField('AC_ECUID').AsString;
        cells[6,nRow] := FindField('AL_SUBADDR').AsString;
        if FindField('AL_ALARMMODECODE').AsString = 'D' then cells[7,nRow] := '해제모드'
        else if FindField('AL_ALARMMODECODE').AsString = 'A' then cells[7,nRow] := '경계모드';
//        cells[4,nRow] := FindField('AL_ALARMMODECODE').AsString;
        if FindField('AL_ALARMNAME').AsString <> '' then
          cells[8,nRow] := FindField('AL_ALARMNAME').AsString + '(' + FindField('AL_OPERATOR').AsString + ')'
        else cells[8,nRow] := FindField('AL_ALARMSTATUSCODE').AsString + '(' + FindField('AL_OPERATOR').AsString + ')';
        cells[9,nRow] := '';
        cells[10,nRow] := '';
        if Trim(FindField('ca_cardno').AsString) <> '' then
        begin
          GetEmInfoFromOperation(FindField('ca_cardno').AsString,stEmCode,stEmName);
          cells[9,nRow] := stEmCode;
          cells[10,nRow] := stEmName;
        end;
        (*
        if (FindField('AL_STATUSCODE2').AsString = 'C1') or
           (FindField('AL_STATUSCODE2').AsString = 'A1') then
        begin
          GetEmInfoFromOperation(FindField('AL_OPERATOR').AsString,stEmCode,stEmName);
          cells[8,nRow] := stEmCode;
          cells[9,nRow] := stEmName;
        end;
        *)
        cells[11,nRow] := FindField('AL_CHECKCODE').AsString;
        cells[12,nRow] := FindField('AL_CHECKMSG').AsString;
        cells[13,nRow] := FindField('AL_CHECKUSER').AsString;
        cells[14,nRow] := MakeDatetimeStr(FindField('AL_UPDATETIME').AsString);
        cells[15,nRow] := MakeDatetimeStr(FindField('AL_INPUTTIME').AsString);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmNewAlarmReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmNewAlarmReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('경보이력보고서','참조파일','D2DAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('경보이력보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='경보이력보고서';
  SaveDialog1.FileName := aFileName;
  if G_nFileFormat = 1 then
  begin
    SaveDialog1.DefaultExt := 'csv';
    SaveDialog1.Filter := 'CSV File(*.csv)|*.csv';
  end else
  begin
    SaveDialog1.DefaultExt := 'xls';
    SaveDialog1.Filter := 'EXCEL File(*.xls)|*.xls';
  end;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;

    if SaveDialog1.FileName <> '' then
    begin
      pan_gauge.Visible := True;
      Screen.Cursor:= crHourGlass;
      if G_nFileFormat = 0 then
        dmExcelSave.ExcelPrintOut(sg_AlarmReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_AlarmReport.SaveToCSV(stSaveFileName);
    end;
  end;
  pan_gauge.Visible := False;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;
{  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if SaveDialog1.FileName <> '' then
      if Not ExcelPrintOut(sg_AlarmReport,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;  }
end;

function TfmNewAlarmReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  if cmb_Position.Text <> '' then
    stTitle := stTitle + ' / 방범구역 : ' + cmb_Position.Text ;
  if cmb_AlarmType.Text <> '' then
    stTitle := stTitle + ' / 경보종류 : ' + cmb_AlarmType.Text ;

  Result := stTitle;

end;


procedure TfmNewAlarmReport.sg_AlarmReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_AlarmReport.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmNewAlarmReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GetAlarmName(cmb_Position);
  GetAlarmGroup(cmb_AlarmGroup);
  GetAlarmType(cmb_AlarmType,'');

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'NewAlarmReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmNewAlarmReport.GetAlarmGroup(cmb_box: TComboBox);
var
  stSql:string;
begin
  cmb_box.Clear;
  cmb_box.Items.Add('전체');
  cmb_box.ItemIndex := 0;

  stSql := ' Select AG_CODE from TB_ALARMCODEGROUP ';
  stSql := stSql + ' Group by AG_CODE ';

  with DataModule1.ADOTmpQuery do
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
  end;
end;

procedure TfmNewAlarmReport.cmb_AlarmGroupChange(Sender: TObject);
begin
  if cmb_AlarmGroup.ItemIndex > 0 then
    GetAlarmType(cmb_AlarmType,cmb_AlarmGroup.Text)
  else GetAlarmType(cmb_AlarmType,'');

end;

procedure TfmNewAlarmReport.AlarmEventStateCode2Setting(aFromDate,
  aToDate: string);
var
  stSql : string;
  stNewState : string;
  nTempIndex : integer;
begin
  stSql := ' Select * from TB_ALARMEVENT ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DATE BETWEEN ''' + aFromDate + ''' ';
  stSql := stSql + ' AND ''' + aToDate + ''' ';
  stSql := stSql + ' AND ( ( AL_STATUSCODE2 is NULL ) OR ( AL_STATUSCODE2 = '''' ) ) ';  

  with DataModule1.ADOTmpQuery do
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
    pan_gauge.Visible := True;
    Label5.caption := '데이터 정리중입니다. ';
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    While Not Eof do
    begin
      stNewState := FindField('AL_ALARMSTATUSCODE').AsString;
      if FindField('AL_ALARMSTATUSCODE').AsString = '00' then
      begin
        //Mode Change StateCode
        nTempIndex := AlarmModeNotCardList.IndexOf(FindField('AL_OPERATOR').AsString);
        if nTempIndex > -1 then
        begin
          if FindField('AL_ALARMMODECODE').AsString = 'A' then
            stNewState := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).ALARMSTATUSCODE
          else stNewState := TAlarmStatusCode(AlarmModeNotCardList.Objects[nTempIndex]).DISALARMSTATUSCODE;
        end else
        begin
          if FindField('AL_ALARMMODECODE').AsString = 'A' then stNewState := 'A1'
          else stNewState := 'C1';
        end;
      end else if isDigit(FindField('AL_ZONENO').AsString) then
      begin
        //Alarm StateCode
        nTempIndex := ZoneDetectList.IndexOf(FindField('AL_ALARMSTATUSCODE').AsString);
        if nTempIndex < 0 then
        begin
          stNewState := 'Z' + FindField('AL_ZONESTATE').AsString;
        end;
      end;
      UpdateTB_AlarmEventStatusCode2(FindField('GROUP_CODE').AsString,
                                     FindField('AL_DATE').AsString,
                                     FindField('AL_TIME').AsString,
                                     inttostr(FindField('AC_NODENO').AsInteger),
                                     FindField('AC_ECUID').AsString,
                                     FindField('AL_MSGNO').AsString,
                                     stNewState
                                     );

      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;

    pan_gauge.Visible := False;
    Label5.Visible := True;
  end;

end;

function TfmNewAlarmReport.UpdateTB_AlarmEventStatusCode2(aGROUP_CODE,
  aAL_DATE, aAL_TIME, aAC_NODENO, aAC_ECUID, aAL_MSGNO,
  aNewState: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMEVENT set AL_STATUSCODE2 = ''' + aNewState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AL_DATE = ''' + aAL_DATE + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + aAL_TIME + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aAL_MSGNO + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmNewAlarmReport.AlarmIDView(aAlarmID: string);
var
  nAlarmIndex : integer;
begin
  nAlarmIndex := ArmAreaCodeList.IndexOf(aAlarmID);

  if nAlarmIndex < 0 then Exit;
  cmb_Position.ItemIndex := nAlarmIndex;
  btn_SearchClick(self);

end;

procedure TfmNewAlarmReport.GetEmInfoFromOperation(aCardNo: string;
  var aEmCode, aEmName: string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  aCardNo := Trim(aCardNo);
  if G_nSpecialProgram = 1 then  //KT특화인경우 사번이 올라옴
  begin
    stSql := 'Select a.* from TB_EMPLOYEE a ';
    stSql := stSql + ' INNER JOIN TB_CARD b ';
    stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
    if DBTYPE = 'MSSQL' then
      stSql := stSql + ' AND substring(b.CA_CARDNO,1,9) = ''' + copy(aCardNo,1,9) + ''' '
    else if DBTYPE = 'PG' then
      stSql := stSql + ' AND substring(b.CA_CARDNO,1,9) = ''' + copy(aCardNo,1,9) + ''' '
    else if DBTYPE = 'MDB' then
      stSql := stSql + ' AND Mid(b.CA_CARDNO,1,9) = ''' + copy(aCardNo,1,9) + ''' '
    else if DBTYPE = 'FB' then
      stSql := stSql + ' AND substring(b.CA_CARDNO from 1 for 9) = ''' + copy(aCardNo,1,9) + ''' ' ;
    stSql := stsql + ' )';
    stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  end else
  begin
(*    if CARDLENGTHTYPE = 0 then
    begin
      if Length(aCardNo) = 10 then
         delete(aCardNo,1,2);
      stSql := 'Select a.* from TB_EMPLOYEE a ';
      stSql := stSql + ' INNER JOIN TB_CARD b ';
      stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
      stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
      stSql := stSql + ' AND b.CA_CARDNO = ''' + FillZeroNumber2(Hex2Dec64(aCardNo),10) + ''' ';
      stSql := stsql + ' )';
      stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    end else if CARDLENGTHTYPE = 1 then
    begin
      stSql := 'Select a.* from TB_EMPLOYEE a ';
      stSql := stSql + ' INNER JOIN TB_CARD b ';
      stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
      stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
      stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
      stSql := stsql + ' )';
      stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
    end else Exit;
    *)
      stSql := 'Select a.* from TB_EMPLOYEE a ';
      stSql := stSql + ' INNER JOIN TB_CARD b ';
      stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
      stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
      stSql := stSql + ' AND b.CA_CARDNO = ''' + aCardNo + ''' ';
      stSql := stsql + ' )';
      stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  end;
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
      if recordCount < 1 then
      begin
        Exit;
      end;
      First;
      aEmCode := FindField('EM_CODE').AsString;
      aEmName := FindField('EM_NAME').AsString;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmNewAlarmReport.SearchAlarmNameList(aName: string);
var
  stSql : string;
begin
  L_bKeyPress := False;
  AlarmList.Visible := True;
  AlarmList.Clear;
  stSql := ' Select * from TB_ARMAREA ';
  stSql := stSql + ' Where AR_NAME Like ''%' + aName + '%'' ';
  stSql := stSql + ' Order by AR_NAME ';

  with DataModule1.ADOTmpQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      AlarmList.Visible := False;
      Exit;
    End;
    While Not Eof do
    begin
      AlarmList.Items.Add(FindField('AR_NAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmNewAlarmReport.cmb_PositionExit(Sender: TObject);
begin
  inherited;
  if L_bKeyPress then SearchAlarmNameList(cmb_Position.Text);
  if AlarmList.Visible then AlarmList.SetFocus;
end;

procedure TfmNewAlarmReport.cmb_PositionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if L_bKeyPress then SearchAlarmNameList(cmb_Position.Text);
    if AlarmList.Visible then AlarmList.SetFocus;
  end;
end;

procedure TfmNewAlarmReport.AlarmListDblClick(Sender: TObject);
begin
  inherited;
    if AlarmList.Items.Count < 1 then
    begin
      showmessage('해당 방범구역이 없습니다.');
      cmb_Position.ItemIndex := 0;
      AlarmList.Visible := False;
      Exit;
    end;
    if AlarmList.ItemIndex < 0 then AlarmList.ItemIndex := 0;
    cmb_Position.Text := AlarmList.Items.Strings[AlarmList.ItemIndex];
    cmb_Position.ItemIndex := cmb_Position.Items.IndexOf(cmb_Position.Text);
    AlarmList.Visible := False;

end;

procedure TfmNewAlarmReport.AlarmListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then AlarmListDblClick(self);
end;

procedure TfmNewAlarmReport.cmb_PositionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  L_bKeyPress := True;
end;

procedure TfmNewAlarmReport.AlarmListExit(Sender: TObject);
begin
  inherited;
  if AlarmList.Visible then AlarmListDblClick(self);
end;

procedure TfmNewAlarmReport.cmb_PositionEnter(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
end;

procedure TfmNewAlarmReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmNewAlarmReport);
Finalization
  UnRegisterClass(TfmNewAlarmReport);

end.
