unit uAlarmAccessReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  StdCtrls, FR_DSet, FR_DBSet, FR_Class, DB,
  ADODB, Grids, BaseGrid, AdvGrid, Buttons, ComCtrls, uSubForm,
  CommandArray, ExtCtrls,iniFiles, Gauges,ComObj,ActiveX, AdvObj, RzCmboBx;

type
  TfmAlarmAccessReport = class(TfmASubForm)
    sg_Report: TAdvStringGrid;
    AdoQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    Panel1: TPanel;
    GroupBox5: TGroupBox;
    btn_Excel: TSpeedButton;
    btn_Print: TSpeedButton;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    lb_BuildingName: TLabel;
    lb_FloorName: TLabel;
    lb_AreaName: TLabel;
    lb_Name: TLabel;
    cmb_Building: TComboBox;
    cmb_Floor: TComboBox;
    cmb_Area: TComboBox;
    ed_name: TEdit;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    lb_AlarmName: TLabel;
    Label4: TLabel;
    cmb_AccessPermit: TComboBox;
    SaveDialog1: TSaveDialog;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    lb_emType: TLabel;
    cmb_Type: TComboBox;
    cmb_EmType: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    ed_Fromhhmm: TEdit;
    ed_Tohhmm: TEdit;
    cmb_ArmGubun: TComboBox;
    Label5: TLabel;
    AlarmList: TListBox;
    cmb_AlarmName: TRzComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_BuildingChange(Sender: TObject);
    procedure cmb_FloorChange(Sender: TObject);
    procedure cmb_AreaChange(Sender: TObject);
    procedure cmb_AlarmNameChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure sg_ReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_TypeChange(Sender: TObject);
    procedure cmb_AlarmNameEnter(Sender: TObject);
    procedure cmb_AlarmNameExit(Sender: TObject);
    procedure cmb_AlarmNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_AlarmNameKeyPress(Sender: TObject; var Key: Char);
    procedure AlarmListDblClick(Sender: TObject);
    procedure AlarmListExit(Sender: TObject);
    procedure AlarmListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    DeviceCodeList : TStringList;
    PermitCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    ArmGubunCodeList : TStringList;
    L_bKeyPress : Boolean;
    { Private declarations }
    procedure FormNameSet;
    procedure LoadType;
    procedure GetAccessPermit(cmb_box :TComboBox);
    Function GetTitle : String;
    procedure LoadBuildingCode(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadAlarmCode(aBuildingCode,aFloorCode,aAreaCode:string;aStringList:TStringList;cmb_box :TComboBox);
    procedure LoadArmGubunCode(StringList:TStringList;cmb_Box:TComboBox);
  public
    { Public declarations }
    procedure SearchAlarmNameList(aName:string);
  end;

var
  fmAlarmAccessReport: TfmAlarmAccessReport;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uCompanyCodeLoad, uFireBird, uExcelSave;

{$R *.dfm}

procedure TfmAlarmAccessReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmAccessReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  DeviceCodeList.Free;
  PermitCodeList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  EmpTypeCodeList.Free;
  ArmGubunCodeList.Free;

  Action := caFree;

end;

procedure TfmAlarmAccessReport.FormCreate(Sender: TObject);
begin
  DeviceCodeList := TStringList.Create;
  PermitCodeList := TStringList.Create;
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
  ArmGubunCodeList := TStringList.Create;

  LoadArmGubunCode(ArmGubunCodeList,cmb_ArmGubun);

end;

procedure TfmAlarmAccessReport.GetAccessPermit(cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  PermitCodeList.Clear;
  cmb_Box.Items.Add('전체');
  PermitCodeList.Add('');
  cmb_box.ItemIndex := 0;

  stSql := 'select * From TB_PERMITCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
      cmb_Box.Items.Add(FindField('PE_PERMITNAME').AsString);
      PermitCodeList.Add(FindField('PE_PERMITCODE').AsString);
      Next;
    end;
  end;

end;

procedure TfmAlarmAccessReport.LoadAlarmCode(aBuildingCode,aFloorCode,aAreaCode:string;aStringList:TStringList;cmb_box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  aStringList.Clear;
  cmb_box.Items.Add('전체');
  aStringList.Add('00000');
  cmb_box.ItemIndex := 0;

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,a.AR_NAME,a.AR_VIEWSEQ ';
  stsql := stSql + ' From TB_ARMAREA a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if (Not IsMaster) and (BuildingGrade = 4) then
  begin
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
  end else  if aBuildingCode = '000' then
  begin
    if Not IsMaster then
    begin
      if BuildingGrade > 0 then stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if BuildingGrade > 1 then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if BuildingGrade > 2 then stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end;
  end else if aFloorCode = '000' then
  begin
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if Not IsMaster then
    begin
      if BuildingGrade > 1 then stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if BuildingGrade > 2 then stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end;
  end else if aAreaCode = '000' then
  begin
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if Not IsMaster then
    begin
      if BuildingGrade > 2 then stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end;
  end else
  begin
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  stSql := stSql + ' Order by a.AR_VIEWSEQ,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO ';

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
      aStringList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)
                       + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger));
      Next;
    end;
  end;
end;



procedure TfmAlarmAccessReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stArmAreaNo,stPermitCode:string;
  stBuildingCode,stFloorCode,stAreaCode:string;
  stEmCode,stEmName,stEmTypeCode:string;
  bDoorGubun : Boolean;
  stDoorGubunCode : string;
  stDoorPosi : string;
  i : integer;
  stFromhhmm : string;
  stTohhmm : string;
  stArmAreaCode : string;
begin
  Try
    btn_Search.enabled := False;
    GridInitialize(sg_Report);

    stNodeNo:='';
    stEcuID:= '';
    stPermitCode:= '';
    stBuildingCode:='';
    stFloorCode:='';
    stAreaCode:='';
    stEmCode:= '';
    stEmName:= '';
    stEmTypeCode := '';
    stFromhhmm := '0000';
    stTohhmm := '2359';
    stArmAreaCode := '000';
    if isDigit(ed_Fromhhmm.Text) then
    begin
      stFromhhmm := FillZeroStrNum(ed_Fromhhmm.Text,4);
    end;
    if isDigit(ed_Tohhmm.Text) then
    begin
      stTohhmm := FillZeroStrNum(ed_Tohhmm.Text,4);
    end;
    stFromhhmm := stFromhhmm + '00';
    stTohhmm := stTohhmm + '59';
    
    if cmb_Type.ItemIndex = 0 then //사번
      stEmCode := ed_Name.Text
    else if cmb_Type.ItemIndex = 1 then //이름
      stEmName := ed_Name.Text
    else if cmb_Type.ItemIndex = 2 then //직원구분
    begin
      if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];
    end;
    if cmb_ArmGubun.ItemIndex > 0 then //방범구역 구분
    begin
      stArmAreaCode := ArmGubunCodeList.Strings[cmb_ArmGubun.ItemIndex];
    end;

    if cmb_Building.ItemIndex > 0 then
    begin
      stBuildingCode := BuildingCodeList.Strings[cmb_Building.ItemIndex];
    end;
    if cmb_Floor.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_Floor.ItemIndex];
    end;
    if cmb_Area.ItemIndex > 0 then
    begin
      stAreaCode := AreaCodeList.Strings[cmb_Area.ItemIndex];
    end;
    if cmb_AccessPermit.ItemIndex > 0 then
    begin
      stPermitCode := PermitCodeList.Strings[cmb_AccessPermit.ItemIndex] ;
    end;

    if cmb_AlarmName.ItemIndex > 0 then
    begin
      stNodeNo := inttostr(strtoint(copy(DeviceCodeList.Strings[cmb_AlarmName.ItemIndex],1,3)));
      stEcuID := copy(DeviceCodeList.Strings[cmb_AlarmName.ItemIndex],4,2) ;
      stArmAreaNo := copy(DeviceCodeList.Strings[cmb_AlarmName.ItemIndex],6,1) ;
    end;
    if DBTYPE = 'MSSQL' then
       stSql := MSSQL.SelectTB_ACCESSEVENTTOPatrolArea(FormatDateTime('yyyymmdd',dt_FromDate.Date),stFromhhmm,FormatDateTime('yyyymmdd',dt_ToDate.Date),stTohhmm,stPermitCode,stEmCode,stEmName,stEmTypeCode)
    else if DBTYPE = 'PG' then
       stSql := PostGreSql.SelectTB_ACCESSEVENTTOPatrolArea(FormatDateTime('yyyymmdd',dt_FromDate.Date),stFromhhmm,FormatDateTime('yyyymmdd',dt_ToDate.Date),stTohhmm,stPermitCode,stEmCode,stEmName,stEmTypeCode)
    else if DBTYPE = 'FB' then
       stSql := FireBird.SelectTB_ACCESSEVENTTOPatrolArea(FormatDateTime('yyyymmdd',dt_FromDate.Date),stFromhhmm,FormatDateTime('yyyymmdd',dt_ToDate.Date),stTohhmm,stPermitCode,stEmCode,stEmName,stEmTypeCode)
    else Exit;

    if (stArmAreaCode <> '000') and (stArmAreaCode <> '') then
    begin
      stSql := stSql + ' AND d.AG_ARMCODE = ''' + stArmAreaCode + ''' ';
    end;

    if (isDigit(stNodeNo)) and (stNodeNo <> '000') then
    begin
      stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(stNodeNo));
      stSql := stSql + ' AND a.AC_ECUID = ''' + stEcuID + ''' ';
    end else
    begin
      if BuildingGrade = 4 then
      begin
        if Not IsMaster then
        begin
          if DeviceCodeList.Count < 2 then
          begin
            showmessage('방범구역 조회 권한이 없습니다.');
            Exit;
          end;
          stSql := stSql + ' AND (';
          for i := 1 to DeviceCodeList.Count - 1 do
          begin
            if i <> 1 then stSql := stSql + ' OR ';
            stSql := stSql + ' ( ';
            stSql := stSql + ' a.AC_NODENO = ' + copy(deviceCodeList.Strings[i],1,3);
            stSql := stSql + ' AND a.AC_ECUID = ''' + copy(deviceCodeList.Strings[i],4,2) + ''' ';
            stSql := stSql + ' ) ';
          end;
          stSql := stSql + ')';
        end;
      end ;

      if (stBuildingCode <> '') and (stBuildingCode <> '000') then
      begin
        stSql := stSql + ' AND d.LO_DONGCODE = ''' + stBuildingCode + ''' ';
      end;
      if (stFloorCode <> '') and (stFloorCode <> '000') then
      begin
        stSql := stSql + ' AND d.LO_FLOORCODE = ''' + stFloorCode + ''' ';
      end;
      if (stAreaCode <> '') and (stAreaCode <> '000') then
      begin
        stSql := stSql + ' AND d.LO_AREACODE = ''' + stAreaCode + ''' ';
      end;
    end;
    stSql := stSql + ' Order by a.AC_DATE,a.AC_TIME ';
    //memo1.Lines.Text := stSql;
    //Exit;
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
        showmessage('이력이 없습니다.');
        Exit;
      end;
      First;
      nRow := 1;
      pan_gauge.Visible := True;
      Label1.Caption := '데이터 조회중입니다.';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := RecordCount;
      sg_Report.RowCount := RecordCount + 1;
      While Not Eof do
      begin
        with sg_Report  do
        begin
          if FindField('AC_DOORPOSI').AsString = '0' then stDoorPosi := '내부'
          else stDoorPosi := '외부';
          cells[0,nRow] := copy(FindField('AC_DATE').AsString,1,4) + '-' + copy(FindField('AC_DATE').AsString,5,2)
                           + '-' + copy(FindField('AC_DATE').AsString,7,2);
          cells[1,nRow] := copy(FindField('AC_TIME').AsString,1,2)
                           + ':' + copy(FindField('AC_TIME').AsString,3,2)
                           + ':' + copy(FindField('AC_TIME').AsString,5,2);   //발생시각
          cells[2,nRow] := FindField('BuildingName').AsString;
          cells[3,nRow] := FindField('FloorName').AsString;
          cells[4,nRow] := FindField('AreaName').AsString;
          cells[5,nRow] := FindField('AL_ZONENAME').AsString;
          cells[6,nRow] := FindField('AC_READERNO').AsString;
          cells[7,nRow] := stDoorPosi;
          cells[8,nRow] := FindField('CA_CARDNO').AsString;
          cells[9,nRow] := FindField('CO_COMPANYNAME').AsString;
          cells[10,nRow] := FindField('CO_JIJUMNAME').AsString;
          cells[11,nRow] := FindField('CO_DEPARTNAME').AsString;
          cells[12,nRow] := FindField('PO_NAME').AsString;
          cells[13,nRow] := FindField('EM_CODE').AsString;
          cells[14,nRow] := FindField('EM_NAME').AsString;
          cells[15,nRow] := FindField('PE_PERMITNAME').AsString;

        end;
        Gauge1.Progress := nRow;
        nRow := nRow + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;  //}
  Finally
    pan_gauge.Visible := False;
    btn_Search.enabled := True;
  end;

end;

procedure TfmAlarmAccessReport.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='출입 이력 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;

end;

procedure TfmAlarmAccessReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('방범구역별출입보고서','참조파일','AlarmACReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  stSaveFileName := '';
  nExcelRowStart := ini_fun.ReadInteger('방범구역별출입보고서','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmAlarmAccessReport.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색기간 : '+ FormatdateTime('yyyy-mm-dd',dt_FromDate.Date) + '~' + FormatdateTime('yyyy-mm-dd',dt_ToDate.Date);

end;

procedure TfmAlarmAccessReport.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//권한부여
end;

procedure TfmAlarmAccessReport.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAlarmAccessReport.FormNameSet;
begin
  lb_BuildingName.Caption := FM902;
  lb_FloorName.Caption := FM912;
  lb_AreaName.Caption := FM922;
  with sg_Report do
  begin
    cells[2,0] := FM902;
    cells[3,0] := FM912;
    cells[4,0] := FM922;
    cells[9,0] := FM002;
    cells[10,0] := FM012;
    cells[11,0] := FM022;
    cells[12,0] := FM032;
    cells[13,0] := FM101;
    cells[14,0] := FM102;

  end;

end;

procedure TfmAlarmAccessReport.cmb_BuildingChange(Sender: TObject);
begin
  LoadFloorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList,cmb_Floor);
  LoadAreaCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList,cmb_Area);
  LoadAlarmCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList.Strings[cmb_Area.ItemIndex],DeviceCodeList,TComboBox(cmb_AlarmName));
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);
end;

procedure TfmAlarmAccessReport.cmb_FloorChange(Sender: TObject);
begin
  LoadAreaCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList,cmb_Area);
  LoadAlarmCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList.Strings[cmb_Area.ItemIndex],DeviceCodeList,TComboBox(cmb_AlarmName));
  if G_nSearchIndex = 0 then btn_SearchClick(Self);
end;

procedure TfmAlarmAccessReport.cmb_AreaChange(Sender: TObject);
begin
  LoadAlarmCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList.Strings[cmb_Area.ItemIndex],DeviceCodeList,TComboBox(cmb_AlarmName));
  if G_nSearchIndex = 0 then btn_SearchClick(Self);

end;

procedure TfmAlarmAccessReport.cmb_AlarmNameChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then
  begin
    if Not L_bKeyPress then
       btn_SearchClick(Self);
  end;

end;

procedure TfmAlarmAccessReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
{  if SaveDialog1.Execute then
  begin
    stSaveFileName := SaveDialog1.FileName;
    if stSaveFileName <> '' then
    begin
      ExcelIO1.XLSExport(stSaveFileName);
    end;
    showmessage('파일생성 완료');
  end;    }
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('방범구역별출입보고서','참조파일','AlarmACReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('방범구역별출입보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='방범구역별출입보고서';
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
        dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
      else if G_nFileFormat = 1 then
        sg_Report.SaveToCSV(stSaveFileName);
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
      if Not ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
      begin
        Screen.Cursor:= crDefault;
        btn_Excel.Enabled := True;
        Exit;
      end;
      //showmessage('파일생성 완료');
  end;
  Screen.Cursor:= crDefault;
  btn_Excel.Enabled := True;}
end;

function TfmAlarmAccessReport.GetTitle: String;
var
  stTitle : string;
begin
  stTitle := '검색기간 : ' + FormatDateTime('yyyy-mm-dd',dt_FromDate.Date) + ' ~ ' + FormatDateTime('yyyy-mm-dd',dt_ToDate.Date) ;
  if cmb_Building.ItemIndex > 0 then
    stTitle := stTitle + ' / 빌딩 : ' + cmb_Building.Text ;
  if cmb_Floor.ItemIndex > 0 then
    stTitle := stTitle + ' / 층 : ' + cmb_Floor.text ;
  if cmb_Area.ItemIndex > 0 then
    stTitle := stTitle + ' / 구역 : ' + cmb_Area.text ;
  if cmb_AlarmName.ItemIndex > 0 then
    stTitle := stTitle + ' / 방범구역 : ' + cmb_AlarmName.text ;
  if cmb_Type.ItemIndex <> 2 then
  begin
    if Trim(ed_name.Text) <> '' then
      stTitle := stTitle  + ' / ' + lb_Name.Caption + ' : ' + ed_name.text ;
  end else
  begin
    if cmb_EmType.ItemIndex > 0 then
      stTitle := stTitle  + ' / ' + lb_Name.Caption + ' : ' + cmb_EmType.text ;
  end;
  Result := stTitle;
end;


procedure TfmAlarmAccessReport.sg_ReportResize(Sender: TObject);
var
  nTotWidth: integer;
  nWidth : integer;
  nLeft : integer;
begin
  nTotWidth := sg_Report.Width;
  nWidth := pan_gauge.Width;

  nleft := (nTotWidth - nWidth) div 2;
  pan_gauge.Left := nLeft;

end;

procedure TfmAlarmAccessReport.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  dt_FromDate.Date := Now;
  dt_ToDate.Date := Now;

  cmb_Building.Enabled := True;
  cmb_Floor.Enabled := True;
  cmb_Area.Enabled := True;

  LoadBuildingCode(BuildingCodeList,cmb_Building);
  if Not IsMaster then
  begin
    nIndex := 0;
    if BuildingGrade = 4 then
    begin
      cmb_Building.Enabled := False;
    end else if BuildingGrade > 0 then
    begin
      nIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
      cmb_Building.Enabled := False;
    end;
    cmb_Building.ItemIndex := nIndex;
  end;

  LoadFloorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList,cmb_Floor);
  if cmb_Building.ItemIndex > 0 then
  begin
    if Not IsMaster then
    begin
      nIndex := 0;
      if BuildingGrade = 4 then
      begin
        cmb_Floor.Enabled := False;
      end else if BuildingGrade > 1 then
      begin
        nIndex := FloorCodeList.IndexOf(MasterFloorCode);
        cmb_Floor.Enabled := False;
      end;
      cmb_Floor.ItemIndex := nIndex;
    end;
  end;
  LoadAreaCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList,cmb_Area);
  if cmb_Floor.ItemIndex > 0 then
  begin
    if Not IsMaster then
    begin
      nIndex := 0;
      if BuildingGrade = 4 then
      begin
        cmb_Area.Enabled := False;
      end else if BuildingGrade > 2 then
      begin
        nIndex := AreaCodeList.IndexOf(MasterAreaCode);
        cmb_Area.Enabled := False;
      end;
      cmb_Area.ItemIndex := nIndex;
    end;
  end;

  LoadAlarmCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList.Strings[cmb_Area.itemIndex],DeviceCodeList,TComboBox(cmb_AlarmName));

  GetAccessPermit(cmb_AccessPermit);
  LoadType;


  FormNameSet;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'AlarmAccessReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmAlarmAccessReport.LoadType;
begin
  with cmb_Type do
  begin
    Clear;
    Items.Add(FM101); //사번
    Items.Add(FM102); //이름
    Items.Add(FM042); //직원구분
    ItemIndex := 0;
  end;
  cmb_TypeChange(cmb_Type);
end;

procedure TfmAlarmAccessReport.cmb_TypeChange(Sender: TObject);
begin
  lb_Name.Caption := cmb_Type.Text;
  if cmb_Type.ItemIndex = 2 then
  begin
    cmb_EmType.Visible := True;
    ed_Name.Visible := False;
    LoadEmpType(EmpTypeCodeList,cmb_EmType);
  end else
  begin
    cmb_EmType.Visible := False;
    ed_Name.Visible := True;
  end;
end;


procedure TfmAlarmAccessReport.LoadFloorCode(aBuildingCode: string;
  aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  aStringList.Clear;

  cmb_Box.Items.Add('전체');
  aStringList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        aStringList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmAccessReport.LoadBuildingCode(aStringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('전체');
  aStringList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        aStringList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmAccessReport.LoadAreaCode(aBuildingCode,
  aFloorCode: string; aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;

  cmb_Box.Items.Add('전체');
  aStringList.Add('000');
  cmb_Box.ItemIndex := 0;

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

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        aStringList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAlarmAccessReport.LoadArmGubunCode(StringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  StringList.Clear;

  cmb_Box.Items.Add('전체');
  StringList.Add('000');
  cmb_Box.ItemIndex := 0;


  stSql := 'select * from TB_ALARMGUBUNCODE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stsql + ' order by AG_ARMCODE ';

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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('AG_ARMNAME').AsString );
        StringList.Add(FindField('AG_ARMCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAlarmAccessReport.cmb_AlarmNameEnter(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;

end;

procedure TfmAlarmAccessReport.cmb_AlarmNameExit(Sender: TObject);
begin
  inherited;
  if L_bKeyPress then SearchAlarmNameList(cmb_AlarmName.Text);
  if AlarmList.Visible then AlarmList.SetFocus;

end;

procedure TfmAlarmAccessReport.cmb_AlarmNameKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    if L_bKeyPress then SearchAlarmNameList(cmb_AlarmName.Text);
    if AlarmList.Visible then AlarmList.SetFocus;
  end;

end;

procedure TfmAlarmAccessReport.cmb_AlarmNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  L_bKeyPress := True;

end;

procedure TfmAlarmAccessReport.AlarmListDblClick(Sender: TObject);
begin
  inherited;
    if AlarmList.Items.Count < 1 then
    begin
      showmessage('해당 방범구역이 없습니다.');
      cmb_AlarmName.ItemIndex := 0;
      AlarmList.Visible := False;
      Exit;
    end;
    if AlarmList.ItemIndex < 0 then AlarmList.ItemIndex := 0;
    cmb_AlarmName.Text := AlarmList.Items.Strings[AlarmList.ItemIndex];
    cmb_AlarmName.ItemIndex := cmb_AlarmName.Items.IndexOf(cmb_AlarmName.Text);
    AlarmList.Visible := False;

end;

procedure TfmAlarmAccessReport.AlarmListExit(Sender: TObject);
begin
  inherited;
  if AlarmList.Visible then AlarmListDblClick(self);

end;

procedure TfmAlarmAccessReport.AlarmListKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then AlarmListDblClick(self);

end;

procedure TfmAlarmAccessReport.SearchAlarmNameList(aName: string);
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
  stSql := ' Select * from TB_ALARMDEVICE ';
  stSql := stSql + ' Where AL_ZONENAME Like ''%' + aName + '%'' ';
  if (stBuildingCode <> '') and (stBuildingCode <> '000') then stSql := stSql + ' AND LO_DONGCODE = ''' + stBuildingCode + ''' ';
  if (stFloorCode <> '') and (stFloorCode <> '000') then stSql := stSql + ' AND LO_FLOORCODE = ''' + stFloorCode + ''' ';
  if (stAreaCode <> '') and (stAreaCode <> '000') then stSql := stSql + ' AND a.LO_AREACODE = ''' + stAreaCode + ''' ';
  stSql := stSql + ' Order by AL_ZONENAME ';

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
      AlarmList.Items.Add(FindField('AL_ZONENAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmAlarmAccessReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmAlarmAccessReport);
Finalization
  UnRegisterClass(TfmAlarmAccessReport);


end.
