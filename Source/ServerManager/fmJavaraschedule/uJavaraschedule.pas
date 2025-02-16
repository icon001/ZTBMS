unit uJavaraschedule;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, Spin, RzPanel,
  RzRadGrp, ExtCtrls, ComCtrls,ADODB,ActiveX, uSubForm, CommandArray;

type
  TfmJavaraschedule = class(TfmASubForm)
    Panel57: TPanel;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox4: TGroupBox;
    Splitter2: TSplitter;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label2: TLabel;
    Label4: TLabel;
    lb_sBuilding1: TLabel;
    lb_sFloorCode1: TLabel;
    lb_sAreaCode1: TLabel;
    Label12: TLabel;
    Group_CardReaderNo: TRzCheckGroup;
    ed_DoorControlTime: TSpinEdit;
    cmb_CardReaderType: TComboBox;
    cmb_sBuildingCode1: TComboBox;
    cmb_sFloorCode1: TComboBox;
    cmb_sAreaCode1: TComboBox;
    ed_TotWidth: TEdit;
    ed_TotHeight: TEdit;
    ed_CurX: TEdit;
    ed_CurY: TEdit;
    btnDoorPosition: TBitBtn;
    chk_DoorReg: TCheckBox;
    Panel5: TPanel;
    sg_Door: TAdvStringGrid;
    Label7: TLabel;
    cmbJavarSchUse: TComboBox;
    GroupBox1: TGroupBox;
    cmbHolidayStartHH: TComboBox;
    Label8: TLabel;
    cmbHolidayStartMM: TComboBox;
    Label9: TLabel;
    Label13: TLabel;
    cmbHolidayEndHH: TComboBox;
    Label10: TLabel;
    cmbHolidayEndMM: TComboBox;
    Label11: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    GroupBox11: TGroupBox;
    lb_Building1: TLabel;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_BuildingCode: TComboBox;
    cmb_FloorCode: TComboBox;
    cmb_AreaCode: TComboBox;
    cmbWeekStartHH: TComboBox;
    cmbWeekStartMM: TComboBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    cmbWeekEndHH: TComboBox;
    Label17: TLabel;
    cmbWeekEndMM: TComboBox;
    Label18: TLabel;
    cmbSaturdayStartHH: TComboBox;
    cmbSaturdayStartMM: TComboBox;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    cmbSaturdayEndHH: TComboBox;
    Label22: TLabel;
    cmbSaturdayEndMM: TComboBox;
    Label23: TLabel;
    cmbSundayStartHH: TComboBox;
    cmbSundayStartMM: TComboBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    cmbSundayEndHH: TComboBox;
    Label27: TLabel;
    cmbSundayEndMM: TComboBox;
    Label28: TLabel;
    ed_nodeno: TEdit;
    ed_ecuid: TEdit;
    ed_doorno: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure cmb_AreaCodeChange(Sender: TObject);
    procedure sg_DoorClick(Sender: TObject);
    procedure cmbJavarSchUseChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    { Private declarations }
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadJavara(aBuildingCode,aFloorCode,aAreaCode,aDoorID:string;sg:TAdvStringGrid;aTop :integer = 0);
    procedure FormInitialize;
  private
    function CheckTB_JAVARASCHEDULE(anodeno,aecuid,adoorno:string):Boolean;
    function UpdateTB_JAVARASCHEDULE(anodeno,aecuid,adoorno,aJavarSchUse,
                                aWeekstartTime,aWeekEndTime,aSaturdaystartTime,aSaturdayEndTime,
                                aSundaystartTime,aSundayEndTime,aHolidaystartTime,aHolidayEndTime,
                                aSendState:string):Boolean;
    function InsertTB_JAVARASCHEDULE(anodeno,aecuid,adoorno,aJavarSchUse,
                                aWeekstartTime,aWeekEndTime,aSaturdaystartTime,aSaturdayEndTime,
                                aSundaystartTime,aSundayEndTime,aHolidaystartTime,aHolidayEndTime,
                                aSendState:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmJavaraschedule: TfmJavaraschedule;

implementation

uses
  uDataModule1,
  uMDBSql,
  uPostGreSql,
  uMssql,
  uFireBird,
  uLomosUtil;

{$R *.dfm}

procedure TfmJavaraschedule.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmJavaraschedule.LoadBuildingCode(cmb_Box: TComboBox);
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmJavaraschedule.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;

  FormInitialize;
end;

procedure TfmJavaraschedule.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
end;

procedure TfmJavaraschedule.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmJavaraschedule.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmJavaraschedule.FormShow(Sender: TObject);
begin
  LoadBuildingCode(cmb_BuildingCode);
  LoadFloorCode('000',cmb_FloorCode);
  LoadAreaCode('000','000',cmb_AreaCode);
  LoadJavara('000', '000','000','',sg_Door);

end;

procedure TfmJavaraschedule.cmb_BuildingCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadJavara(stBuildingCode, stFloorCode,stAreaCode,'',sg_Door);
end;

procedure TfmJavaraschedule.cmb_FloorCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadJavara(stBuildingCode, stFloorCode,stAreaCode,'',sg_Door);
end;

procedure TfmJavaraschedule.cmb_AreaCodeChange(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
  stFloorCode := '';
  if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  stAreaCode := '';
  if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadJavara(stBuildingCode, stFloorCode,stAreaCode,'',sg_Door);
end;

procedure TfmJavaraschedule.LoadJavara(aBuildingCode, aFloorCode,
  aAreaCode,aDoorID: string; sg: TAdvStringGrid;aTop :integer = 0);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery :TADOQuery;
begin
  FormInitialize;
  
  if aBuildingCode = '' then aBuildingCode := '000';
  if aFloorCode = '' then aFloorCode := '000';
  if aAreaCode = '' then aAreaCode := '000';

  //GridInit(sg,1);

  stSql := ' select a.*,c.SchUse,c.WeekStartTime,c.WeekEndTime,c.SaturdayStartTime,c.SaturdayEndTime,c.SundayStartTime,c.SundayEndTime,c.HolidayStartTime,c.HolidayEndTime ' ;
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND b.AC_JAVARATYPE = ''1'')  ';
  stSql := stSql + ' Left Join TB_JAVARASCHEDULE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO) ';
  if aBuildingCode <> '000' then
  begin
    stSql := stSql + ' Where a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if aFloorCode <> '000' then
    begin
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if aAreaCode <> '000' then stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
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

      if RecordCount < 1 then Exit;
      First;

      with sg do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
          cells[1,nRow] := FindField('AC_NODENO').AsString;
          cells[2,nRow] := FindField('AC_ECUID').AsString;
          cells[3,nRow] := FindField('DO_DOORNO').AsString;
          cells[4,nRow] := FindField('SchUse').AsString;
          cells[5,nRow] := FindField('WeekStartTime').AsString;
          cells[6,nRow] := FindField('WeekEndTime').AsString;
          cells[7,nRow] := FindField('SaturdayStartTime').AsString;
          cells[8,nRow] := FindField('SaturdayEndTime').AsString;
          cells[9,nRow] := FindField('SundayStartTime').AsString;
          cells[10,nRow] := FindField('SundayEndTime').AsString;
          cells[11,nRow] := FindField('HolidayStartTime').AsString;
          cells[12,nRow] := FindField('HolidayEndTime').AsString;
          if aDoorID = (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
                        FindField('AC_ECUID').AsString +
                        FindField('DO_DOORNO').AsString) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
      if aTop <> 0 then
        sg_Door.topRow := aTop
      else
      begin
        if sg_Door.row > 7 then sg_Door.TopRow := sg_Door.row - 6;
      end;
      sg_DoorClick(sg_Door);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmJavaraschedule.FormInitialize;
var
  i : integer;
begin
  btn_Save.Enabled := False;
  cmbJavarSchUse.ItemIndex := 0;
  cmbJavarSchUseChange(cmbJavarSchUse);
  ed_nodeno.Text := '';
  ed_ecuid.Text := '';
  ed_doorno.Text := '';
  cmbWeekStartHH.Clear;
  cmbWeekEndHH.Clear;
  cmbSaturdayStartHH.Clear;
  cmbSaturdayEndHH.Clear;
  cmbSundayStartHH.Clear;
  cmbSundayEndHH.Clear;
  cmbHolidayStartHH.Clear;
  cmbHolidayEndHH.Clear;
  for i := 0 to 24 do
  begin
    cmbWeekStartHH.Items.Add(FillZeroNumber(i,2));
    cmbWeekEndHH.Items.Add(FillZeroNumber(i,2));
    cmbSaturdayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbSaturdayEndHH.Items.Add(FillZeroNumber(i,2));
    cmbSundayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbSundayEndHH.Items.Add(FillZeroNumber(i,2));
    cmbHolidayStartHH.Items.Add(FillZeroNumber(i,2));
    cmbHolidayEndHH.Items.Add(FillZeroNumber(i,2));
  end;
  cmbWeekStartHH.ItemIndex := 0;
  cmbWeekEndHH.ItemIndex := 0;
  cmbSaturdayStartHH.ItemIndex := 0;
  cmbSaturdayEndHH.ItemIndex := 0;
  cmbSundayStartHH.ItemIndex := 0;
  cmbSundayEndHH.ItemIndex := 0;
  cmbHolidayStartHH.ItemIndex := 0;
  cmbHolidayEndHH.ItemIndex := 0;

  cmbWeekStartMM.Clear;
  cmbWeekEndMM.Clear;
  cmbSaturdayStartMM.Clear;
  cmbSaturdayEndMM.Clear;
  cmbSundayStartMM.Clear;
  cmbSundayEndMM.Clear;
  cmbHolidayStartMM.Clear;
  cmbHolidayEndMM.Clear;
  for i := 0 to 5 do
  begin
    cmbWeekStartMM.Items.Add(inttostr(i) + '0');
    cmbWeekEndMM.Items.Add(inttostr(i) + '0');
    cmbSaturdayStartMM.Items.Add(inttostr(i) + '0');
    cmbSaturdayEndMM.Items.Add(inttostr(i) + '0');
    cmbSundayStartMM.Items.Add(inttostr(i) + '0');
    cmbSundayEndMM.Items.Add(inttostr(i) + '0');
    cmbHolidayStartMM.Items.Add(inttostr(i) + '0');
    cmbHolidayEndMM.Items.Add(inttostr(i) + '0');
  end;
  cmbWeekStartMM.ItemIndex := 0;
  cmbWeekEndMM.ItemIndex := 0;
  cmbSaturdayStartMM.ItemIndex := 0;
  cmbSaturdayEndMM.ItemIndex := 0;
  cmbSundayStartMM.ItemIndex := 0;
  cmbSundayEndMM.ItemIndex := 0;
  cmbHolidayStartMM.ItemIndex := 0;
  cmbHolidayEndMM.ItemIndex := 0;

end;

procedure TfmJavaraschedule.sg_DoorClick(Sender: TObject);
begin
  inherited;
  FormInitialize;
  with sg_Door do
  begin
    if cells[1,Row] = '' then Exit;
    ed_nodeno.Text := cells[1,Row];
    ed_ecuid.Text := cells[2,Row];
    ed_doorno.Text := cells[3,Row];
    if isDigit(cells[4,Row]) then cmbJavarSchUse.ItemIndex := strtoint(cells[4,Row])
    else cmbJavarSchUse.ItemIndex := 0;
    cmbJavarSchUseChange(sender);
    if cells[5,Row] <> '' then
    begin
      cmbWeekStartHH.Text := copy(cells[5,Row],1,2);
      cmbWeekStartMM.Text := copy(cells[5,Row],3,2);
    end;
    if cells[6,Row] <> '' then
    begin
      cmbWeekEndHH.Text := copy(cells[6,Row],1,2);
      cmbWeekEndMM.Text := copy(cells[6,Row],3,2);
    end;
    if cells[7,Row] <> '' then
    begin
      cmbSaturdayStartHH.Text := copy(cells[7,Row],1,2);
      cmbSaturdayStartMM.Text := copy(cells[7,Row],3,2);
    end;
    if cells[8,Row] <> '' then
    begin
      cmbSaturdayEndHH.Text := copy(cells[8,Row],1,2);
      cmbSaturdayEndMM.Text := copy(cells[8,Row],3,2);
    end;
    if cells[9,Row] <> '' then
    begin
      cmbSundayStartHH.Text := copy(cells[9,Row],1,2);
      cmbSundayStartMM.Text := copy(cells[9,Row],3,2);
    end;
    if cells[10,Row] <> '' then
    begin
      cmbSundayEndHH.Text := copy(cells[10,Row],1,2);
      cmbSundayEndMM.Text := copy(cells[10,Row],3,2);
    end;
    if cells[11,Row] <> '' then
    begin
      cmbHolidayStartHH.Text := copy(cells[11,Row],1,2);
      cmbHolidayStartMM.Text := copy(cells[11,Row],3,2);
    end;
    if cells[12,Row] <> '' then
    begin
      cmbHolidayEndHH.Text := copy(cells[12,Row],1,2);
      cmbHolidayEndMM.Text := copy(cells[12,Row],3,2);
    end;
  end;
  btn_Save.Enabled := True;
end;

procedure TfmJavaraschedule.cmbJavarSchUseChange(Sender: TObject);
begin
  inherited;
  if cmbJavarSchUse.ItemIndex = 0 then GroupBox1.Visible := False
  else GroupBox1.Visible := True;
end;

procedure TfmJavaraschedule.btn_SaveClick(Sender: TObject);
var
  stWeekstartTime : string;
  stWeekEndTime : string;
  stSaturdaystartTime : string;
  stSaturdayEndTime : string;
  stSundaystartTime : string;
  stSundayEndTime : string;
  stHolidaystartTime : string;
  stHolidayEndTime : string;
  bResult : Boolean;
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stWeekstartTime := cmbWeekStartHH.Text + cmbWeekStartMM.Text;
  stWeekEndTime := cmbWeekEndHH.Text + cmbWeekEndMM.Text;
  stSaturdaystartTime := cmbSaturdayStartHH.Text + cmbSaturdayStartMM.Text;
  stSaturdayEndTime := cmbSaturdayEndHH.Text + cmbSaturdayEndMM.Text;
  stSundaystartTime := cmbSundayStartHH.Text + cmbSundayStartMM.Text;
  stSundayEndTime := cmbSundayEndHH.Text + cmbSundayEndMM.Text;
  stHolidaystartTime := cmbHolidayStartHH.Text + cmbHolidayStartMM.Text;
  stHolidayEndTime := cmbHolidayEndHH.Text + cmbHolidayEndMM.Text;

  if (Length(stWeekstartTime) <> 4) or
     (Length(stWeekEndTime) <> 4) or
     (Length(stSaturdaystartTime) <> 4) or
     (Length(stSaturdayEndTime) <> 4) or
     (Length(stSundaystartTime) <> 4) or
     (Length(stSundayEndTime) <> 4) or
     (Length(stHolidaystartTime) <> 4) or
     (Length(stHolidayEndTime) <> 4) then
  begin
    showmessage('시간은 두자리 숫자여야 합니다.');
    Exit;
  end;
  if (Not isDigit(stWeekstartTime)) or
     (Not isDigit(stWeekEndTime)) or
     (Not isDigit(stSaturdaystartTime)) or
     (Not isDigit(stSaturdayEndTime)) or
     (Not isDigit(stSundaystartTime)) or
     (Not isDigit(stSundayEndTime)) or
     (Not isDigit(stHolidaystartTime)) or
     (Not isDigit(stHolidayEndTime)) then
  begin
    showmessage('시간은 두자리 숫자여야 합니다.');
    Exit;
  end;

  if (strtoint(stWeekEndTime) < strtoint(stWeekstartTime)) or
     (strtoint(stSaturdayEndTime) < strtoint(stSaturdaystartTime)) or
     (strtoint(stSundayEndTime) < strtoint(stSundaystartTime)) or
     (strtoint(stHolidayEndTime) < strtoint(stHolidaystartTime)) then
  begin
    showmessage('종료시간은 시작시간보다 작을수 없습니다.');
    Exit;
  end;


  if CheckTB_JAVARASCHEDULE(ed_nodeno.Text,ed_ecuid.Text,ed_doorno.Text) then
  begin
    bResult := UpdateTB_JAVARASCHEDULE(ed_nodeno.Text,ed_ecuid.Text,ed_doorno.Text,inttostr(cmbJavarSchUse.ItemIndex),
                            stWeekstartTime,stWeekEndTime,stSaturdaystartTime,stSaturdayEndTime,
                            stSundaystartTime,stSundayEndTime,stHolidaystartTime,stHolidayEndTime,'N');
  end else
  begin
    bResult := InsertTB_JAVARASCHEDULE(ed_nodeno.Text,ed_ecuid.Text,ed_doorno.Text,inttostr(cmbJavarSchUse.ItemIndex),
                            stWeekstartTime,stWeekEndTime,stSaturdaystartTime,stSaturdayEndTime,
                            stSundaystartTime,stSundayEndTime,stHolidaystartTime,stHolidayEndTime,'N');
  end;

  if bResult then
  begin
    stBuildingCode := '';
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode.itemindex ];
    stFloorCode := '';
    if cmb_FloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
    LoadJavara(stBuildingCode, stFloorCode,stAreaCode,FillZeroNumber(strtoint(ed_nodeno.Text),3) + ed_ecuid.Text + ed_doorno.Text,sg_Door);
  end else showmessage('저장실패');
end;

function TfmJavaraschedule.CheckTB_JAVARASCHEDULE(anodeno, aecuid,
  adoorno: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := False;
  stSql := 'Select * from TB_JAVARASCHEDULE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + anodeno + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aecuid + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + adoorno + ''' ';

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
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmJavaraschedule.InsertTB_JAVARASCHEDULE(anodeno, aecuid,
  adoorno, aJavarSchUse, aWeekstartTime, aWeekEndTime, aSaturdaystartTime,
  aSaturdayEndTime, aSundaystartTime, aSundayEndTime, aHolidaystartTime,
  aHolidayEndTime, aSendState: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'Insert Into TB_JAVARASCHEDULE ( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' SchUse,';
  stSql := stSql + ' WeekStartTime,';
  stSql := stSql + ' WeekEndTime,';
  stSql := stSql + ' SaturdayStartTime,';
  stSql := stSql + ' SaturdayEndTime,';
  stSql := stSql + ' SundayStartTime,';
  stSql := stSql + ' SundayEndTime,';
  stSql := stSql + ' HolidayStartTime,';
  stSql := stSql + ' HolidayEndTime,';
  stSql := stSql + ' SendState) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '' + anodeno + ',';
  stSql := stSql + '''' + aecuid + ''',';
  stSql := stSql + '''' + adoorno + ''',';
  stSql := stSql + '''' + aJavarSchUse + ''',';
  stSql := stSql + '''' + aWeekstartTime + ''',';
  stSql := stSql + '''' + aWeekEndTime + ''',';
  stSql := stSql + '''' + aSaturdaystartTime + ''',';
  stSql := stSql + '''' + aSaturdayEndTime + ''',';
  stSql := stSql + '''' + aSundaystartTime + ''',';
  stSql := stSql + '''' + aSundayEndTime + ''',';
  stSql := stSql + '''' + aHolidaystartTime + ''',';
  stSql := stSql + '''' + aHolidayEndTime + ''',';
  stSql := stSql + '''' + aSendState + ''')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmJavaraschedule.UpdateTB_JAVARASCHEDULE(anodeno, aecuid,
  adoorno, aJavarSchUse, aWeekstartTime, aWeekEndTime, aSaturdaystartTime,
  aSaturdayEndTime, aSundaystartTime, aSundayEndTime, aHolidaystartTime,
  aHolidayEndTime, aSendState: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  stSql := 'Update TB_JAVARASCHEDULE set ';
  stSql := stSql + ' SchUse = ''' + aJavarSchUse + ''',';
  stSql := stSql + ' WeekStartTime = ''' + aWeekstartTime + ''',';
  stSql := stSql + ' WeekEndTime = ''' + aWeekEndTime + ''',';
  stSql := stSql + ' SaturdayStartTime = ''' + aSaturdaystartTime + ''',';
  stSql := stSql + ' SaturdayEndTime = ''' + aSaturdayEndTime + ''',';
  stSql := stSql + ' SundayStartTime = ''' + aSundaystartTime + ''',';
  stSql := stSql + ' SundayEndTime = ''' + aSundayEndTime + ''',';
  stSql := stSql + ' HolidayStartTime = ''' + aHolidaystartTime + ''',';
  stSql := stSql + ' HolidayEndTime = ''' + aHolidayEndTime + ''',';
  stSql := stSql + ' SendState = ''' + aSendState + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + anodeno + '';
  stSql := stSql + ' AND AC_ECUID = ''' + aecuid + '''';
  stSql := stSql + ' AND DO_DOORNO = ''' + adoorno + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

end.
