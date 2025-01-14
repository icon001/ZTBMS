unit uBuildingAlarmReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, ComCtrls, Buttons, FR_DSet,
  FR_DBSet, FR_Class, DB, ADODB, uSubForm, CommandArray, Menus,iniFiles,ComObj,
  Gauges, ExtCtrls,ActiveX, AdvObj, RzCmboBx;

type
  TfmBuildingAlarmReport = class(TfmASubForm)
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
    lb_Building: TLabel;
    cmb_Building: TComboBox;
    lb_FloorCode: TLabel;
    cmb_Floor: TComboBox;
    cmb_Area: TComboBox;
    lb_AreaCode: TLabel;
    AlarmList: TListBox;
    chk_PCtime: TCheckBox;
    cmb_Position: TRzComboBox;
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
    procedure cmb_BuildingChange(Sender: TObject);
    procedure cmb_FloorChange(Sender: TObject);
    procedure cmb_AreaChange(Sender: TObject);
    procedure cmb_PositionEnter(Sender: TObject);
    procedure cmb_PositionExit(Sender: TObject);
    procedure cmb_PositionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_PositionKeyPress(Sender: TObject; var Key: Char);
    procedure AlarmListDblClick(Sender: TObject);
    procedure AlarmListExit(Sender: TObject);
    procedure AlarmListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    ArmAreaCodeList : TStringList;
    AlarmCodeList : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    L_bKeyPress : Boolean;
    { Private declarations }
    procedure AlarmEventStateCode2Setting(aFromDate,aToDate:string);
    procedure GetAlarmName(aBuildingCode,aFloorCode,aAreaCode:string;cmb_box : TComboBox);
    procedure GetAlarmType(cmb_box : TComboBox;aAlarmGroup:string);
    procedure GetAlarmGroup(cmb_box : TComboBox);

    Function UpdateTB_AlarmEventStatusCode2(aGROUP_CODE,aAL_DATE,aAL_TIME,
                                     aAC_NODENO,aAC_ECUID,aAL_MSGNO,aNewState : string ):Boolean;

    Function GetTitle : String;

    procedure FormNameSet;
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
  public
    { Public declarations }
    procedure AlarmIDView(aAlarmID:string);
    procedure SearchAlarmNameList(aName:string);
  end;

var
  fmBuildingAlarmReport: TfmBuildingAlarmReport;

implementation

uses
    uDataModule1,
    uLomosUtil, uMssql, uPostGreSql, uMDBSql, uFireBird,
    UCommonModule, uExcelSave;

{$R *.dfm}

procedure TfmBuildingAlarmReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'BuildingAlarmReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  ArmAreaCodeList.Free;
  AlarmCodeList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  
  Action := caFree;

end;

procedure TfmBuildingAlarmReport.FormCreate(Sender: TObject);
begin
  ArmAreaCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;

end;

procedure TfmBuildingAlarmReport.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmBuildingAlarmReport.btn_FileSaveClick(Sender: TObject);
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

procedure TfmBuildingAlarmReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('빌딩경보이력보고서','참조파일','BuildingAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('빌딩경보이력보고서','시작위치',6);
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

procedure TfmBuildingAlarmReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmBuildingAlarmReport.GetAlarmName(aBuildingCode,aFloorCode,aAreaCode:string;cmb_box: TComboBox);
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
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
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
      ArmAreaCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger));
      Next;
    end;
  end;


end;

procedure TfmBuildingAlarmReport.GetAlarmType(cmb_box: TComboBox;aAlarmGroup:string);
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

procedure TfmBuildingAlarmReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stAlarmType:string;
  stArmAreaNo : string;
  stModeState : string;
  stDeviceType : string;
  stWhere : string;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  i : integer;
begin

  AlarmEventStateCode2Setting(FormatDateTime('yyyymmdd',dt_FromDate.Date),FormatDateTime('yyyymmdd',dt_ToDate.Date));

  GridInitialize(sg_AlarmReport);

  stNodeNo:='';
  stEcuID:= '';
  stAlarmType:= '';
  stBuildingCode := '';
  stFloorCode := '';
  stAreaCode := '';
  if cmb_Position.ItemIndex > 0 then
  begin
    stNodeNo := inttostr(strtoint(copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],1,3)));
    stEcuID := copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],4,2) ;
    stArmAreaNo := copy(ArmAreaCodeList.Strings[cmb_Position.ItemIndex],6,1) ;
  end else
  begin
    if cmb_Building.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_Building.itemIndex];
    if cmb_Floor.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_Floor.itemIndex];
    if cmb_Area.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_Area.itemIndex];
  end;
  if cmb_AlarmType.ItemIndex > 0 then
  begin
    stAlarmType := AlarmCodeList.Strings[cmb_AlarmType.ItemIndex] ;
  end;

  if DBTYPE = 'MSSQL' then
     stSql := MSSQL.SelectBuildingTB_ALARMEVENTFromArmAreaDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stBuildingCode,stFloorCode,stAreaCode,stAlarmType,chk_PCtime.Checked)
  else if DBTYPE = 'PG' then
     stSql := PostGreSql.SelectBuildingTB_ALARMEVENTFromArmAreaDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stBuildingCode,stFloorCode,stAreaCode,stAlarmType,chk_PCtime.Checked)
  else if DBTYPE = 'MDB' then
     stSql := MDBSql.SelectBuildingTB_ALARMEVENTFromArmAreaDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stBuildingCode,stFloorCode,stAreaCode,stAlarmType,chk_PCtime.Checked)
  else if DBTYPE = 'FB' then
     stSql := FireBird.SelectBuildingTB_ALARMEVENTFromArmAreaDayToDay(FormatDateTime('yyyymmdd',dt_FromDate.Date),
                          FormatDateTime('yyyymmdd',dt_ToDate.Date),stNodeNo,stEcuID,stArmAreaNo,stBuildingCode,stFloorCode,stAreaCode,stAlarmType,chk_PCtime.Checked)
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
  stSql := stSql + ' order by BUILDINGNAME,FLOORNAME,AREANAME,c.AR_NAME DESC,a.AL_DATE DESC,a.AL_TIME DESC ';

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
        cells[0,nRow] := FindField('BUILDINGNAME').AsString ;
        cells[1,nRow] := FindField('FLOORNAME').AsString  ;
        cells[2,nRow] := FindField('AREANAME').AsString  ;
        if FindField('AR_NAME').AsString <> '' then
          cells[3,nRow] := FindField('AR_NAME').AsString
        else cells[3,nRow] := FindField('AC_DEVICENAME').AsString;

        cells[4,nRow] := copy(FindField('AL_DATE').AsString,1,4) + '-' + copy(FindField('AL_DATE').AsString,5,2)
                         + '-' + copy(FindField('AL_DATE').AsString,7,2)
                         + ' ' + copy(FindField('AL_TIME').AsString,1,2)
                         + ':' + copy(FindField('AL_TIME').AsString,3,2)
                         + ':' + copy(FindField('AL_TIME').AsString,5,2);   //발생시각
        cells[5,nRow] := FindField('AL_ZONENO').AsString;
        cells[6,nRow] := FindField('AL_ZONENAME').AsString;
        //cells[3,nRow] := FindField('AL_ALARMSTATUSCODE').AsString;
        cells[7,nRow] := FindField('AL_ALARMDEVICETYPECODE').AsString;
        cells[8,nRow] := FindField('AC_ECUID').AsString;
        cells[9,nRow] := FindField('AL_SUBADDR').AsString;
        if FindField('AL_ALARMMODECODE').AsString = 'D' then cells[10,nRow] := '해제모드'
        else if FindField('AL_ALARMMODECODE').AsString = 'A' then cells[10,nRow] := '경계모드';
//        cells[4,nRow] := FindField('AL_ALARMMODECODE').AsString;
        if FindField('AL_ALARMNAME').AsString <> '' then
          cells[11,nRow] := FindField('AL_ALARMNAME').AsString + '(' + FindField('AL_OPERATOR').AsString + ')'
        else cells[11,nRow] := FindField('AL_ALARMSTATUSCODE').AsString + '(' + FindField('AL_OPERATOR').AsString + ')';
        cells[12,nRow] := FindField('AL_CHECKCODE').AsString;
        cells[13,nRow] := FindField('AL_CHECKMSG').AsString;
        cells[14,nRow] := FindField('AL_CHECKUSER').AsString;
        cells[15,nRow] := MakeDatetimeStr(FindField('AL_UPDATETIME').AsString);
        cells[16,nRow] := MakeDatetimeStr(FindField('AL_INPUTTIME').AsString);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmBuildingAlarmReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmBuildingAlarmReport.btn_ExcelClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('빌딩경보이력보고서','참조파일','BuildingAlarmReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('빌딩경보이력보고서','시작위치',6);
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

function TfmBuildingAlarmReport.GetTitle: String;
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

procedure TfmBuildingAlarmReport.sg_AlarmReportResize(Sender: TObject);
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

procedure TfmBuildingAlarmReport.FormShow(Sender: TObject);
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;
  GetAlarmGroup(cmb_AlarmGroup);
  GetAlarmType(cmb_AlarmType,'');
  LoadBuildingCode(cmb_Building);
  LoadFloorCode('',cmb_Floor);
  LoadAreaCode('','',cmb_Area);
  GetAlarmName('','','',TComboBox(cmb_Position));

  FormNameSet;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'BuildingAlarmReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmBuildingAlarmReport.GetAlarmGroup(cmb_box: TComboBox);
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

procedure TfmBuildingAlarmReport.cmb_AlarmGroupChange(Sender: TObject);
begin
  if cmb_AlarmGroup.ItemIndex > 0 then
    GetAlarmType(cmb_AlarmType,cmb_AlarmGroup.Text)
  else GetAlarmType(cmb_AlarmType,'');

end;

procedure TfmBuildingAlarmReport.AlarmEventStateCode2Setting(aFromDate,
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

function TfmBuildingAlarmReport.UpdateTB_AlarmEventStatusCode2(aGROUP_CODE,
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

procedure TfmBuildingAlarmReport.AlarmIDView(aAlarmID: string);
var
  nAlarmIndex : integer;
begin
  nAlarmIndex := ArmAreaCodeList.IndexOf(aAlarmID);

  if nAlarmIndex < 0 then Exit;
  cmb_Position.ItemIndex := nAlarmIndex;
  btn_SearchClick(self);

end;

procedure TfmBuildingAlarmReport.FormNameSet;
begin
  lb_Building.Caption := FM901;
  lb_FloorCode.Caption := FM911;
  lb_AreaCode.Caption := FM921;

  with sg_AlarmReport do
  begin
    Cells[0,0] := FM901;
    Cells[1,0] := FM911;
    Cells[2,0] := FM921;
  end;

end;

procedure TfmBuildingAlarmReport.LoadAreaCode(aBuildingCode,
  aFloorCode: string; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      AreaCodeList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 2 then
      begin
        if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
        begin
          cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmBuildingAlarmReport.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  cmb_Box.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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

    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade <> 0 then
      begin
        if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
        begin
          cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmBuildingAlarmReport.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
    if Not IsMaster then
    begin
      if BuildingGrade > 1 then
      begin
        if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
        begin
          cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
          cmb_Box.Enabled := False;
        end;
      end
    end;
  end;
end;

procedure TfmBuildingAlarmReport.cmb_BuildingChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_Building.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_Floor);
  stFloorCode := '';
  if cmb_Floor.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_Floor.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_Area);
  stAreaCode := '';
  if cmb_Area.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_Area.itemIndex];

  GetAlarmName(stBuildingCode,stFloorCode,stAreaCode,TComboBox(cmb_Position));
end;

procedure TfmBuildingAlarmReport.cmb_FloorChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_Building.itemindex > -1 then stBuildingCode := BuildingCodeList.Strings[ cmb_Building.itemindex ];
  if cmb_Floor.itemindex > -1 then stFloorCode := FloorCodeList.Strings[ cmb_Floor.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_Area);

  if cmb_Area.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_Area.itemIndex];

  GetAlarmName(stBuildingCode,stFloorCode,stAreaCode,TComboBox(cmb_Position));

end;

procedure TfmBuildingAlarmReport.cmb_AreaChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_Building.itemIndex];
  stFloorCode := '';
  if cmb_Floor.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_Floor.itemIndex];
  stAreaCode := '';
  if cmb_Area.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_Area.itemIndex];

  GetAlarmName(stBuildingCode,stFloorCode,stAreaCode,TComboBox(cmb_Position));

end;

procedure TfmBuildingAlarmReport.cmb_PositionEnter(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;

end;

procedure TfmBuildingAlarmReport.cmb_PositionExit(Sender: TObject);
begin
  inherited;
  if L_bKeyPress then SearchAlarmNameList(cmb_Position.Text);
  if AlarmList.Visible then AlarmList.SetFocus;

end;

procedure TfmBuildingAlarmReport.cmb_PositionKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if L_bKeyPress then SearchAlarmNameList(cmb_Position.Text);
    if AlarmList.Visible then AlarmList.SetFocus;
  end;

end;

procedure TfmBuildingAlarmReport.cmb_PositionKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  L_bKeyPress := True;
end;

procedure TfmBuildingAlarmReport.AlarmListDblClick(Sender: TObject);
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

procedure TfmBuildingAlarmReport.AlarmListExit(Sender: TObject);
begin
  inherited;
  if AlarmList.Visible then AlarmListDblClick(self);

end;

procedure TfmBuildingAlarmReport.AlarmListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then AlarmListDblClick(self);

end;

procedure TfmBuildingAlarmReport.SearchAlarmNameList(aName: string);
var
  stSql : string;
  stBuildingCode,stFloorCode,stAreaCode : string;
begin
  stBuildingCode := '';
  if cmb_Building.itemIndex > 0 then
    stBuildingCode := BuildingCodeList.Strings[cmb_Building.itemIndex];
  stFloorCode := '';
  if cmb_Floor.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_Floor.itemIndex];
  stAreaCode := '';
  if cmb_Area.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_Area.itemIndex];

  L_bKeyPress := False;
  AlarmList.Visible := True;
  AlarmList.Clear;
  stSql := ' Select * from TB_ARMAREA ';
  stSql := stSql + ' Where AR_NAME Like ''%' + aName + '%'' ';
  if (stBuildingCode <> '') and (stBuildingCode <> '000') then stSql := stSql + ' AND LO_DONGCODE = ''' + stBuildingCode + ''' ';
  if (stFloorCode <> '') and (stFloorCode <> '000') then stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
  if (stAreaCode <> '') and (stAreaCode <> '000') then stSql := stSql + ' AND a.LO_AREACODE = ''' + stAreaCode + ''' ';
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

procedure TfmBuildingAlarmReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmBuildingAlarmReport);
Finalization
  UnRegisterClass(TfmBuildingAlarmReport);

end.
