unit uDoorGradeReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Gauges, ExtCtrls, Grids, BaseGrid, AdvGrid,ADODB,ActiveX,
  uSubForm, CommandArray, DB,iniFiles,ComObj, AdvObj;

type
  TfmDoorGradeReport = class(TfmASubForm)
    sg_Report: TAdvStringGrid;
    pan_gauge: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    SaveDialog1: TSaveDialog;
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
    lb_AlarmName: TLabel;
    lb_emType: TLabel;
    cmb_Building: TComboBox;
    cmb_Floor: TComboBox;
    cmb_Area: TComboBox;
    ed_name: TEdit;
    cmb_DoorName: TComboBox;
    cmb_Type: TComboBox;
    cmb_EmType: TComboBox;
    AdoQuery: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sg_ReportResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_BuildingChange(Sender: TObject);
    procedure cmb_FloorChange(Sender: TObject);
    procedure cmb_AreaChange(Sender: TObject);
    procedure cmb_DoorNameChange(Sender: TObject);
    procedure cmb_TypeChange(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    DoorCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure LoadBuildingCode(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadDoorCode(aBuildingCode,aFloorCode,aAreaCode:string;aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadEmpType(aStringList:TStringList;cmb_Box:TComboBox);
    procedure LoadType;
    procedure FormNameSet;
    Function GetTitle : String;
  private
    procedure StringListCreate;
    procedure StringListFree;
  public
    { Public declarations }
  end;

var
  fmDoorGradeReport: TfmDoorGradeReport;

implementation

uses uDataModule1,
     uLomosUtil,
     uMssql,
     uPostGreSql,
     uMDBSql,
     uFireBird, uExcelSave;

{$R *.dfm}

procedure TfmDoorGradeReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['MESSAGE'] := '';
  self.FindSubForm('Main').FindCommand('STATUS').Params.Values['PANEL'] := '1';
  self.FindSubForm('Main').FindCommand('STATUS').Execute;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorGradeReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  StringListFree;
  Action := caFree;
end;

procedure TfmDoorGradeReport.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmDoorGradeReport.LoadAreaCode(aBuildingCode,
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

procedure TfmDoorGradeReport.LoadBuildingCode(aStringList: TStringList;
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

procedure TfmDoorGradeReport.LoadFloorCode(aBuildingCode: string;
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

procedure TfmDoorGradeReport.StringListCreate;
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  DoorCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;
end;

procedure TfmDoorGradeReport.StringListFree;
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  DoorCodeList.Free;
  EmpTypeCodeList.Free;
end;

procedure TfmDoorGradeReport.FormCreate(Sender: TObject);
begin
  StringListCreate;
end;

procedure TfmDoorGradeReport.sg_ReportResize(Sender: TObject);
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

procedure TfmDoorGradeReport.FormShow(Sender: TObject);
var
  nIndex : integer;
begin

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

  LoadDoorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList.Strings[cmb_Area.itemIndex],DoorCodeList,cmb_DoorName);

  LoadType;

  FormNameSet;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorGradeReport';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmDoorGradeReport.LoadDoorCode(aBuildingCode, aFloorCode,
  aAreaCode: string; aStringList: TStringList; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_box.Clear;
  aStringList.Clear;
  cmb_box.Items.Add('전체');
  aStringList.Add('000000');
  cmb_box.ItemIndex := 0;

  stSql := 'Select a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO,a.DO_DOORNONAME,a.DO_VIEWSEQ ';
  stsql := stSql + ' From TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
  stSql := stSql + ' Order by a.DO_VIEWSEQ ';

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
      cmb_Box.Items.Add(FindField('DO_DOORNONAME').AsString);
      aStringList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3)
                       + FindField('AC_ECUID').AsString + FindField('DO_DOORNO').AsString);
      Next;
    end;
  end;
end;

procedure TfmDoorGradeReport.FormNameSet;
begin
  lb_BuildingName.Caption := FM902;
  lb_FloorName.Caption := FM912;
  lb_AreaName.Caption := FM922;
  with sg_Report do
  begin
    cells[0,0] := FM902;
    cells[1,0] := FM912;
    cells[2,0] := FM922;
    cells[4,0] := FM002;
    cells[5,0] := FM012;
    cells[6,0] := FM022;
    cells[7,0] := FM101;
    cells[8,0] := FM102;
  end;

end;

procedure TfmDoorGradeReport.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  stNodeNo,stEcuID,stDoorNO:string;
  stBuildingCode,stFloorCode,stAreaCode:string;
  stEmCode,stEmName,stEmTypeCode:string;
  bDoorGubun : Boolean;
  stDoorGubunCode : string;
  stDoorPosi : string;
  i : integer;
begin
  Try
    btn_Search.enabled := False;
    GridInitialize(sg_Report);

    stNodeNo:='';
    stEcuID:= '';
    stBuildingCode:='';
    stFloorCode:='';
    stAreaCode:='';
    stEmCode:= '';
    stEmName:= '';
    stEmTypeCode := '';
    if cmb_Type.ItemIndex = 0 then //사번
      stEmCode := ed_Name.Text
    else if cmb_Type.ItemIndex = 1 then //이름
      stEmName := ed_Name.Text
    else if cmb_Type.ItemIndex = 2 then //직원구분
    begin
      if cmb_emType.ItemIndex > 0 then stEmTypeCode := EmpTypeCodeList.Strings[cmb_emType.ItemIndex];
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

    if cmb_DoorName.ItemIndex > 0 then
    begin
      stNodeNo := inttostr(strtoint(copy(DoorCodeList.Strings[cmb_DoorName.ItemIndex],1,3)));
      stEcuID := copy(DoorCodeList.Strings[cmb_DoorName.ItemIndex],4,2) ;
      stDoorNO := copy(DoorCodeList.Strings[cmb_DoorName.ItemIndex],6,1) ;
    end;

    if DBTYPE = 'PG' then stSql := PostGreSql.selectTB_DOORJoinFullDoorGrade(stEmCode,stEmName,stEmTypeCode)
    else if DBTYPE = 'MSSQL' then stSql := MSSql.selectTB_DOORJoinFullDoorGrade(stEmCode,stEmName,stEmTypeCode)
    else if DBTYPE = 'FB' then stSql := FireBird.selectTB_DOORJoinFullDoorGrade(stEmCode,stEmName,stEmTypeCode)
    else Exit; //if DBTYPE = 'MDB' then Exit//stSql := MDBSql.selectTB_DOORJoinFullDoorGrade(aBuildingCode,aFloorCode,aAreaCode,stEmCode,stEmName,stEmTypeCode)

    if (isDigit(stNodeNo)) and (stNodeNo <> '000') then
    begin
      stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(stNodeNo));
      stSql := stSql + ' AND a.AC_ECUID = ''' + stEcuID + ''' ';
      stSql := stSql + ' AND a.DO_DOORNO = ''' + stDoorNO + ''' ';
    end else
    begin
      if BuildingGrade = 4 then
      begin
        if DoorCodeList.Count < 2 then
        begin
          showmessage('출입문 조회 권한이 없습니다.');
          Exit;
        end;
        stSql := stSql + ' AND (';
        for i := 1 to DoorCodeList.Count - 1 do
        begin
          if i <> 1 then stSql := stSql + ' OR ';
          stSql := stSql + ' ( ';
          stSql := stSql + ' a.AC_NODENO = ' + copy(doorCodeList.Strings[i],1,3);
          stSql := stSql + ' AND a.AC_ECUID = ''' + copy(doorCodeList.Strings[i],4,2) + ''' ';
          stSql := stSql + ' AND a.DO_DOORNO = ''' + copy(doorCodeList.Strings[i],6,1) + ''' ';
          stSql := stSql + ' ) ';
        end;
        stSql := stSql + ')';
      end else
      begin
        if (stBuildingCode <> '') and (stBuildingCode <> '000') then
        begin
          stSql := stSql + ' AND a.LO_DONGCODE = ''' + stBuildingCode + ''' ';
        end;
        if (stFloorCode <> '') and (stFloorCode <> '000') then
        begin
          stSql := stSql + ' AND a.LO_FLOORCODE = ''' + stFloorCode + ''' ';
        end;
        if (stAreaCode <> '') and (stAreaCode <> '000') then
        begin
          stSql := stSql + ' AND a.LO_AREACODE = ''' + stAreaCode + ''' ';
        end;
      end;
    end;
    stSql := stSql + ' Order by BuildingName,FloorName,AreaName,DO_DOORNONAME ';
//    memo1.Lines.Text := stSql;
//    Exit;
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
        showmessage('데이터가 없습니다.');
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
          cells[0,nRow] := FindField('BuildingName').AsString;
          cells[1,nRow] := FindField('FloorName').AsString;
          cells[2,nRow] := FindField('AreaName').AsString;
          cells[3,nRow] := FindField('DO_DOORNONAME').AsString;
          cells[4,nRow] := FindField('companyName').AsString;
          cells[5,nRow] := FindField('JijumName').AsString;
          cells[6,nRow] := FindField('DepartName').AsString;
          cells[7,nRow] := FindField('EM_CODE').AsString;
          cells[8,nRow] := FindField('em_name').AsString;
          cells[9,nRow] := FindField('CA_CARDNO').AsString;
          cells[10,nRow] := FindField('DE_RCVACK').AsString;
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

procedure TfmDoorGradeReport.cmb_BuildingChange(Sender: TObject);
begin
  LoadFloorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList,cmb_Floor);
  LoadAreaCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList,cmb_Area);
  LoadDoorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList.Strings[cmb_Area.itemIndex],DoorCodeList,cmb_DoorName);
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);

end;

procedure TfmDoorGradeReport.cmb_FloorChange(Sender: TObject);
begin
  LoadAreaCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.ItemIndex],AreaCodeList,cmb_Area);
  LoadDoorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList.Strings[cmb_Area.itemIndex],DoorCodeList,cmb_DoorName);
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);

end;

procedure TfmDoorGradeReport.cmb_AreaChange(Sender: TObject);
begin
  LoadDoorCode(BuildingCodeList.Strings[cmb_Building.ItemIndex],FloorCodeList.Strings[cmb_Floor.itemIndex],AreaCodeList.Strings[cmb_Area.itemIndex],DoorCodeList,cmb_DoorName);
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);

end;

procedure TfmDoorGradeReport.cmb_DoorNameChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(btn_Search);
end;

procedure TfmDoorGradeReport.cmb_TypeChange(Sender: TObject);
begin
  lb_Name.Caption := cmb_Type.Text;
  if cmb_Type.ItemIndex <> 2 then
  begin
    cmb_EmType.Visible := False;
    ed_Name.Visible := True;
  end else
  begin
    cmb_EmType.Visible := True;
    ed_Name.Visible := False;
    LoadEmpType(EmpTypeCodeList,cmb_EmType);
  end;

end;

procedure TfmDoorGradeReport.LoadEmpType(aStringList: TStringList;
  cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  aStringList.Clear;
  cmb_Box.Items.Add('전체');
  aStringList.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' order by RG_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
        cmb_Box.Items.Add(FindField('RG_NAME').AsString);
        aStringList.Add(FindField('RG_CODE').AsString);
        Next;
      end;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDoorGradeReport.LoadType;
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

procedure TfmDoorGradeReport.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  if G_nSearchIndex <> 0 then
  begin
    SaveDialog1.DefaultExt := 'csv';
    SaveDialog1.Filter := 'CSV Files (*.csv)|*.csv|All Files (*.*)|*.*';
    if SaveDialog1.Execute then
    begin
      sg_Report.SaveToCSV(SaveDialog1.FileName);
      showmessage('파일생성 완료');
    end;
    Exit;
  end;
  btn_Excel.Enabled := False;
  Screen.Cursor:= crHourGlass;
  stTitle := GetTitle;
  ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
  stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
  stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
  stRefFileName  := ini_fun.ReadString('출입문별권한보고서','참조파일','DoorGradeReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('출입문별권한보고서','시작위치',6);
  ini_fun.Free;

  aFileName:='출입문별권한보고서';
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
  btn_Excel.Enabled := True; }
end;



function TfmDoorGradeReport.GetTitle: String;
var
  stTitle : string;
begin
  if cmb_Building.ItemIndex > 0 then
    stTitle := stTitle + '빌딩 : ' + cmb_Building.Text ;
  if cmb_Floor.ItemIndex > 0 then
    stTitle := stTitle + ' / 층 : ' + cmb_Floor.text ;
  if cmb_Area.ItemIndex > 0 then
    stTitle := stTitle + ' / 구역 : ' + cmb_Area.text ;
  if cmb_DoorName.ItemIndex > 0 then
  begin
    if stTitle <> '' then stTitle := stTitle + ' / ';
    stTitle := stTitle + '출입문 : ' + cmb_DoorName.text ;
  end;
  if cmb_Type.ItemIndex <> 2 then
  begin
    if stTitle <> '' then stTitle := stTitle + ' / ';
    if Trim(ed_name.Text) <> '' then
      stTitle := stTitle  + lb_Name.Caption + ' : ' + ed_name.text ;
  end else
  begin
    if stTitle <> '' then stTitle := stTitle + ' / ';
    if cmb_EmType.ItemIndex > 0 then
      stTitle := stTitle  + lb_Name.Caption + ' : ' + cmb_EmType.text ;
  end;
  Result := stTitle;

end;

procedure TfmDoorGradeReport.btn_PrintClick(Sender: TObject);
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
  stRefFileName  := ini_fun.ReadString('출입문별권한보고서','참조파일','DoorGradeReport.xls');
  stRefFileName := stPrintRefPath + stRefFileName;
  nExcelRowStart := ini_fun.ReadInteger('출입문별권한보고서','시작위치',6);
  ini_fun.Free;
  
  dmExcelSave.ExcelPrintOut(sg_Report,stRefFileName,stSaveFileName,False,nExcelRowStart,stTitle,False,False,Gauge1);

  btn_Print.Enabled := True;
  Screen.Cursor:= crDefault;

end;

procedure TfmDoorGradeReport.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmDoorGradeReport);
Finalization
  UnRegisterClass(TfmDoorGradeReport);

end.
