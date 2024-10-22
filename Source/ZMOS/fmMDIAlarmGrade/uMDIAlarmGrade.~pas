unit uMDIAlarmGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls, Buttons,
  uSubForm, CommandArray, Gauges,iniFiles,ComObj, Menus, AdvObj;

type
  TfmMDIAlarmGrade = class(TfmASubForm)
    StatusBar1: TStatusBar;
    pn_Employ: TPanel;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    Splitter2: TSplitter;
    Panel3: TPanel;
    Splitter3: TSplitter;
    Panel4: TPanel;
    sg_Card: TAdvStringGrid;
    sg_GradeCard: TAdvStringGrid;
    btn_GradeInsert: TSpeedButton;
    btn_GradeDelete: TSpeedButton;
    Panel5: TPanel;
    GroupBox2: TGroupBox;
    lb_CompanyName: TLabel;
    lb_DepartName: TLabel;
    lb_PosiName: TLabel;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    Panel12: TPanel;
    cmb_Jijum: TComboBox;
    lb_JijumName: TLabel;
    Panel14: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    SaveDialog1: TSaveDialog;
    PopupMenu1: TPopupMenu;
    N8: TMenuItem;
    N9: TMenuItem;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    ed_searchText: TEdit;
    Label4: TLabel;
    cmb_SearchType: TComboBox;
    cmb_regGubun1: TComboBox;
    lb_search: TLabel;
    GroupBox3: TGroupBox;
    lb_Building1: TLabel;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_BuildingCode: TComboBox;
    cmb_FloorCode: TComboBox;
    cmb_AreaCode: TComboBox;
    Label3: TLabel;
    cmb_Alarm: TComboBox;
    btn_DoorSearch: TButton;
    gb_DoorSearch: TGroupBox;
    sg_Alarm: TAdvStringGrid;
    Label5: TLabel;
    ed_AlarmSearchName: TEdit;
    btn_Search: TBitBtn;
    btn_Close: TBitBtn;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_BuildingCodeChange(Sender: TObject);
    procedure cmb_FloorCodeChange(Sender: TObject);
    procedure cmb_AreaCodeChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure btn_GradeInsertClick(Sender: TObject);
    procedure sg_CardCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_GradeDeleteClick(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure ed_EmpNoKeyPress(Sender: TObject; var Key: Char);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure ed_searchTextKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_regGubun1Change(Sender: TObject);
    procedure btn_DoorSearchClick(Sender: TObject);
    procedure sg_AlarmDblClick(Sender: TObject);
    procedure ed_AlarmSearchNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_AlarmChange(Sender: TObject);
    procedure ed_searchTextKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList1 : TStringList;
    PosiCodeList1 : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    AlarmCodeList : TStringList;
    CheckCount : integer;
    EmpTypeCodeList : TStringList;
    WorkGubunCodeList :TStringList;
    { Private declarations }
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadAlarmCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);
    procedure AlarmCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure PersonSearch;
    procedure GetDepartCodeList;
    procedure AlarmNotGradeSearch;
    procedure AlarmGradeSearch;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure InsertAlarmGrade;
    procedure DeleteAlarmGrade;

    Function CheckTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID : String):Boolean;
    Function InsertTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aCardNo,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun: string):Boolean;
    Function UpdateTB_CARDDOORGRADE(aCardNo,aDoorGrade:string):Boolean;

    procedure FormNameSet;
  public
    { Public declarations }
    procedure GradeSetting(aInsertGrade,aUpdateGrade,aDeleteGrade:Boolean);
  end;

var
  fmMDIAlarmGrade: TfmMDIAlarmGrade;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql, uFireBird, udmAdoQuery, uExcelSave, uJavara;

{$R *.dfm}

procedure TfmMDIAlarmGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMDIAlarmGrade.FormCreate(Sender: TObject);
begin
    CompanyCodeList := TStringList.Create;
    JijumCodeList := TStringList.Create;
    DepartCodeList := TStringList.Create;
    PosiCodeList := TStringList.Create;
    DepartCodeList1 := TStringList.Create;
    PosiCodeList1 := TStringList.Create;
    BuildingCodeList := TStringList.Create;
    FloorCodeList := TStringList.Create;
    AreaCodeList := TStringList.Create;
    EmpTypeCodeList := TStringList.Create;
    AlarmCodeList := TStringList.Create;
    WorkGubunCodeList := TStringList.Create;

    GridInit(sg_Alarm,1,2,False);

    CheckCount := 0;

end;

procedure TfmMDIAlarmGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    CompanyCodeList.Free;
    JijumCodeList.Free;
    DepartCodeList.Free;
    PosiCodeList.Free;
    DepartCodeList1.Free;
    PosiCodeList1.Free;
    BuildingCodeList.Free;
    FloorCodeList.Free;
    AreaCodeList.Free;
    EmpTypeCodeList.Free;
    AlarmCodeList.Free;
    WorkGubunCodeList.Free;

    self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'MDIAlarmGrade';
    self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
    self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

    Action := caFree;

end;


procedure TfmMDIAlarmGrade.FormShow(Sender: TObject);
var
  nIndex : integer;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin

  if Not IsMaster then
  begin
    if IsInsertGrade then btn_GradeInsert.Enabled := True
    else btn_GradeInsert.Enabled := False;
    if IsDeleteGrade then btn_GradeDelete.Enabled := True
    else btn_GradeDelete.Enabled := False;
  end;

  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,cmb_Jijum);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.itemIndex],PosiCodeList,cmb_Posi);

  LoadEmpSearchType(cmb_SearchType);

  LoadBuildingCode(cmb_BuildingCode);
  if cmb_BuildingCode.ItemIndex > 0 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  if cmb_FloorCode.itemIndex > -1 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.itemIndex > -1 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];


  if Not IsMaster then
  begin
    if strtoint(CompanyGrade) > 1 then
    begin
      nIndex := CompanyCodeList.IndexOf(MasterCompany);
      if nIndex > -1 then
      begin
        cmb_Company.ItemIndex := nIndex;
        LoadJijumCode(CompanyCodeList.Strings[nIndex],JijumCodeList,cmb_Jijum);
      end;
      cmb_Company.Enabled := False;
      LoadPosiCode(MasterCompany,PosiCodeList,cmb_Posi);
    end;
    if strtoint(CompanyGrade) > 2 then
    begin
      nIndex := JijumCodeList.IndexOf(MasterCompany + MasterJijum);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
      cmb_Jijum.Enabled := False;
    end;
  end;
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  FormNameSet;
  Panel12.Caption := fmMDIAlarmGrade.Caption;
  
  LoadAlarmCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Alarm);

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'MDIAlarmGrade';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  if G_nSearchIndex = 0 then btn_SearchClick(sender);

end;

procedure TfmMDIAlarmGrade.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(sender);
end;

procedure TfmMDIAlarmGrade.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
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

procedure TfmMDIAlarmGrade.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
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
end;

procedure TfmMDIAlarmGrade.LoadFloorCode(aBuildingCode: string;
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

procedure TfmMDIAlarmGrade.cmb_BuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode.itemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  if cmb_FloorCode.itemIndex > -1 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.itemIndex > -1 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadAlarmCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Alarm);
  btn_SearchClick(self);
end;

procedure TfmMDIAlarmGrade.cmb_FloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode.itemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  if cmb_FloorCode.itemIndex > -1 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.itemIndex > -1 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadAlarmCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Alarm);
  btn_SearchClick(self);
end;

procedure TfmMDIAlarmGrade.AlarmCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO ';
  stSql := stSql + ' from TB_ARMAREA a ';
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';   }
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
      stSql := stSql + ' AND a.AR_AREANO = c.AR_AREANO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  stSql := stSql + ' AND a.AR_NAME Like ''%' + ed_AlarmSearchName.Text + '%'' ';
  stSql := stSql + ' order by a.AR_NAME ';

  with DataModule1.GetObject.ADOTmpQuery do
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
        cells[0,nRow] := FindField('AR_NAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
//        cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('AR_AREANO').AsString;
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmMDIAlarmGrade.cmb_AreaCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode.itemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  if cmb_FloorCode.itemIndex > -1 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  if cmb_AreaCode.itemIndex > -1 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  LoadAlarmCode(stBuildingCode,stFloorCode,stAreaCode,cmb_Alarm);
  btn_SearchClick(self);
end;

procedure TfmMDIAlarmGrade.btn_SearchClick(Sender: TObject);
begin
  AlarmNotGradeSearch;
  AlarmGradeSearch;
end;

procedure TfmMDIAlarmGrade.PersonSearch;
var
  stSql : string;
  nRow : integer;
  i : integer;
  bWhereSearch : Boolean;
begin
  GridInit(sg_Card,7,2,True);
  bWhereSearch := False;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDAdminJoinBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_CARDAdminJoinBase
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_CARDAdminJoinBase
  else if DBTYPE = 'FB' then stSql := FireBird.SelectTB_CARDAdminJoinBase
  else Exit;

  if cmb_SearchType.ItemIndex = 6 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_CARDTYPE = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 7 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.RG_CODE = ''' + EmpTypeCodeList.Strings[cmb_regGubun1.itemIndex] + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 8 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_GUBUN = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else
  begin
    if Trim(ed_searchText.Text) <> '' then
    begin
      if cmb_SearchType.ItemIndex < 0 then cmb_SearchType.ItemIndex := 0;
      bWhereSearch := True;

      if cmb_SearchType.ItemIndex = 0 then //사번
        stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 1 then //이름
        stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 2 then //사내전화번호
        stSql := stSql + ' AND b.em_cophone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 3 then //집전화번호
        stSql := stSql + ' AND b.em_homephone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 4 then //휴대폰번호
        stSql := stSql + ' AND b.em_handphone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 5 then //카드번호
        stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 9 then //주소1
        stSql := stSql + ' AND b.EM_ADDR1 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 10 then //주소2
        stSql := stSql + ' AND b.EM_ADDR2 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    end;
  end;

  if Not bWhereSearch then
  begin
    if (Not IsMaster) and (CompanyGrade <> '0') then
    begin
      if CompanyGrade = '1' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          if CompanyCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 회사 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to CompanyCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
          end;
          stSql := stSql + ')'; 
        end else stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '2' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          if JijumCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 지점 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to JijumCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '3' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 지점코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex < 1 then
        begin
          if DepartCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 부서 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to DepartCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end;
    end else
    begin
      if cmb_Depart.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
      end else if cmb_Jijum.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
      end else if cmb_Company.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
      end;
    end;
    if cmb_Posi.ItemIndex > 0 then
      stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  end;
  stSql := stSql + ' order by b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.EM_CODE';

  with DataModule1.GetObject.ADOTmpQuery do
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
    sg_Card.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Card do
      begin
        cells[0,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[1,nRow] := FindField('EM_CODE').AsString;
        cells[2,nRow] := FindField('EM_NAME').AsString;
        cells[3,nRow] := FindField('CA_CARDNO').AsString;
        cells[4,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[5,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[6,nRow] := FindField('PO_NAME').AsString;
        cells[7,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[9,nRow] := FindField('PO_POSICODE').AsString;
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;



procedure TfmMDIAlarmGrade.GetDepartCodeList;
var
  stSql : String;
begin
  DepartCodeList.Clear;
  DepartCodeList.Add('');

  if Not IsMaster then
  begin
    stSql := 'Select * from ';
    stSql := stSql + ' TB_ADMINCOMPANY  ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AD_USERID = ''' + Master_ID + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  end else
  begin
    stSql := 'Select * from ';
    stSql := stSql + ' TB_COMPANY  ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND CO_GUBUN = ''2'' ';
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
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;


procedure TfmMDIAlarmGrade.AlarmGradeSearch;
var
  stSql : string;
  nRow : integer;
  i : integer;
  stAC_NODENO,stAC_ECUID,stArmAreaNo : string;
  bWhereSearch : Boolean;
begin
  Panel9.Caption := '등록카드';
  bWhereSearch := False;

  GridInit(sg_GradeCard,9,2,True);
  if cmb_Alarm.ItemIndex < 0 then Exit;

  stAC_NODENO := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],1,3);
  stAC_ECUID := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],4,2);
  stArmAreaNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],6,1);
  if (stAC_NODENO = '')
    Or (stAC_ECUID = '')  then Exit;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDFromArmAreaGradeJoinBase(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_CARDFromArmAreaGradeJoinBase(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDFromArmAreaGradeJoinBase(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDFromArmAreaGradeJoinBase(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else Exit;

  if cmb_SearchType.ItemIndex = 6 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_CARDTYPE = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 7 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.RG_CODE = ''' + EmpTypeCodeList.Strings[cmb_regGubun1.itemIndex] + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 8 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_GUBUN = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else
  begin
    if Trim(ed_searchText.Text) <> '' then
    begin
      if cmb_SearchType.ItemIndex < 0 then cmb_SearchType.ItemIndex := 0;
      bWhereSearch := True;

      if cmb_SearchType.ItemIndex = 0 then //사번
        stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 1 then //이름
        stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 2 then //사내전화번호
        stSql := stSql + ' AND b.em_cophone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 3 then //집전화번호
        stSql := stSql + ' AND b.em_homephone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 4 then //휴대폰번호
        stSql := stSql + ' AND b.em_handphone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 5 then //카드번호
        stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 9 then //주소1
        stSql := stSql + ' AND b.EM_ADDR1 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 10 then //주소2
        stSql := stSql + ' AND b.EM_ADDR2 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    end;
  end;

  if Not bWhereSearch then
  begin
    if (Not IsMaster) and (CompanyGrade <> '0') then
    begin
      if CompanyGrade = '1' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          if CompanyCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 회사 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to CompanyCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
          end;
          stSql := stSql + ')'; 
        end else stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '2' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          if JijumCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 지점 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to JijumCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '3' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 지점코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex < 1 then
        begin
          if DepartCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 부서 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to DepartCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end;
    end else
    begin
      if cmb_Depart.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
      end else if cmb_Jijum.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
      end else if cmb_Company.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
      end;
    end;
    if cmb_Posi.ItemIndex > 0 then
      stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  end;
  stSql := stSql + ' order by b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.EM_CODE';


  with DataModule1.GetObject.ADOTmpQuery do
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
    Panel9.Caption := '등록카드(' + inttostr(RecordCount) + ')';
    sg_GradeCard.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_GradeCard do
      begin
        cells[0,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[1,nRow] := FindField('EM_CODE').AsString;
        cells[2,nRow] := FindField('EM_NAME').AsString;
        cells[3,nRow] := FindField('CA_CARDNO').AsString;
        cells[4,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[5,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[6,nRow] := FindField('PO_NAME').AsString;
        cells[7,nRow] := FindField('DE_RCVACK').AsString;
        cells[8,nRow] := FindField('CA_LASTUSE').AsString;
        cells[9,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[10,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[11,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[12,nRow] := FindField('PO_POSICODE').AsString;
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmMDIAlarmGrade.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(sender);
end;

procedure TfmMDIAlarmGrade.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(sender);
end;

procedure TfmMDIAlarmGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmMDIAlarmGrade.btn_GradeInsertClick(Sender: TObject);
begin
  if cmb_Alarm.ItemIndex < 0 then
  begin
    showmessage('출입문을 선택하여 주세요.');
    Exit;
  end;
  pan_gauge.Visible := True;
  btn_GradeInsert.Enabled := False;
  InsertAlarmGrade;

  btn_GradeInsert.Enabled := True;
  pan_gauge.Visible := False;
  AlarmNotGradeSearch;
  AlarmGradeSearch;
end;

procedure TfmMDIAlarmGrade.InsertAlarmGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stArmAreaNo : string;
  stCardNo : string;
  bResult : Boolean;
  i : integer;
begin
  i:=1;
  if cmb_Alarm.ItemIndex < 0 then Exit;

  stNodeNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],1,3);
  stECUID := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],4,2);
  stArmAreaNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],6,1);

  Gauge1.MaxValue := sg_Card.RowCount - 1;
  Gauge1.Progress := 0;
  for UserLoop := 1 to sg_Card.RowCount - 1 do
  begin
    sg_Card.GetCheckBoxState(0,UserLoop, bchkState);
    if bChkState then //체크 되어 있으면 해당 출입구역 Insert;
    begin
      stCardNo := sg_Card.Cells[3,UserLoop];
      bResult := CheckTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID);
      if Not bResult then
         InsertTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stArmAreaNo,'0','L','Y','ALARM')
      else UpdateTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stArmAreaNo,'0','L','Y','ALARM');
      UpdateTB_CARDDOORGRADE(stCardNo,'Y');
      DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,ALARMTYPE,stArmAreaNo,stCardNo , '경계권한등록');
    end;
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Card.RowCount - 1);
    Gauge1.Progress := i;
    inc(i);
    Application.ProcessMessages;
  end;
end;


function TfmMDIAlarmGrade.CheckTB_DEVICECARDNO(aCardNo, aNodeNo,
  aECUID: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

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
  end;
  result := True;
end;

function TfmMDIAlarmGrade.InsertTB_DEVICECARDNO(aCardNo, aNodeNo,
  aECUID, aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCardNo) = '' then Exit;
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  if aGubun = 'DOOR' then
  begin
    stSql := stSql + 'DE_DOOR' + aDoorNO + ',';
    stSql := stSql + 'DE_USEACCESS,';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + 'DE_DOOR1,';
    stSql := stSql + 'DE_DOOR2,';
    stSql := stSql + 'DE_USEACCESS,';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + 'DE_ALARM' + aDoorNO + ',';
    if aDoorNO = '0' then stSql := stSql + 'DE_USEALARM,';
  end;
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  if aGubun = 'DOOR' then
  begin
    stSql := stSql + '''' + aValue + ''',';
    stSql := stSql + '''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + '''' + aValue + ''',';
    if aDoorNO = '0' then stSql := stSql + '''' + aValue + ''',';
  end;
  stSql := stSql + '''' + aTimCode + ''',';
  stSql := stSql + '''' + aPermit + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''') ';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    
  end;

  Result := True;
end;

function TfmMDIAlarmGrade.UpdateTB_DEVICECARDNO(aCardNo, aNodeNo,
  aECUID, aDoorNO, aTimCode, aPermit, aValue, aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO Set ';
  if aGubun = 'DOOR' then
  begin
    stSql := stSql + 'DE_DOOR' + aDoorNO + ' = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + 'DE_DOOR1 = ''' + aValue + ''',';
    stSql := stSql + 'DE_DOOR2 = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';  }
  end else if aGubun = 'ALARM' then
  begin
    stSql := stSql + 'DE_ALARM' + aDoorNO + ' = ''' + aValue + ''',';
    if aDoorNo = '0' then stSql := stSql + 'DE_USEALARM = ''' + aValue + ''',';
  end;
  stSql := stSql + 'DE_TIMECODE = ''' + aTimCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''N'',';
  stSql := stSql + 'DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO =''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO =' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';

  with DataModule1.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSql;
    Except
      Exit;
    End;
    
  end;

  Result := True;


end;

procedure TfmMDIAlarmGrade.sg_CardCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmMDIAlarmGrade.btn_GradeDeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stCompanyCode,stBuildingCode,stFloorCode,stAreaCode : string;
begin
  if cmb_Alarm.ItemIndex < 0 then
  begin
    showmessage('기기를 선택하여 주세요.');
    Exit;
  end;

  btn_GradeDelete.Enabled := False;
  pan_gauge.Visible := True;
  DeleteAlarmGrade;

  dmAdoQuery.NotGradePermitDelete;

  btn_GradeDelete.Enabled := True;
  pan_gauge.Visible := False;
  AlarmNotGradeSearch;
  AlarmGradeSearch;

end;

procedure TfmMDIAlarmGrade.DeleteAlarmGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stArmAreaNo : string;
  stCardNo : string;
  bResult : Boolean;
  i : integer;
begin
  i:=1;
  if cmb_Alarm.ItemIndex < 0 then Exit;

  stNodeNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],1,3);
  stECUID := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],4,2);
  stArmAreaNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],6,1);
  Gauge1.MaxValue := sg_GradeCard.RowCount - 1;
  Gauge1.Progress := 0;
  for UserLoop := 1 to sg_GradeCard.RowCount - 1 do
  begin
    sg_GradeCard.GetCheckBoxState(0,UserLoop, bchkState);
    if bChkState then //출입문코드가 체크 되어 있으면 해당 권한 삭제
    begin
      stCardNo := sg_GradeCard.Cells[3,UserLoop];
      UpdateTB_DEVICECARDNO(stCardNo,stNodeNo,stECUID,stArmAreaNo,'0','L','N','ALARM');
      DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,ALARMTYPE,stArmAreaNo,stCardNo,'(D)경계권한삭제');
    end;
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_GradeCard.RowCount - 1);
    Gauge1.Progress := i;
    inc(i);
    Application.ProcessMessages;
  end;
end;


procedure TfmMDIAlarmGrade.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(nil);

end;

procedure TfmMDIAlarmGrade.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;
  lb_PosiName.Caption := FM032;
//  lb_sabun.Caption := FM101;
//  lb_Name.Caption := FM102;

  lb_Building1.Caption := FM901;
  lb_FloorCode1.Caption := FM911;
  lb_AreaCode1.Caption := FM921;

  with sg_Card do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM101;
    Cells[2,0] := FM102;
    Cells[4,0] := FM012;
    Cells[5,0] := FM022;
    Cells[6,0] := FM032;

  end;
  with sg_GradeCard do
  begin
    Cells[0,0] := FM002;
    Cells[1,0] := FM101;
    Cells[2,0] := FM102;
    Cells[4,0] := FM012;
    Cells[5,0] := FM022;
    Cells[6,0] := FM032;

  end;

end;

function TfmMDIAlarmGrade.UpdateTB_CARDDOORGRADE(aCardNo,
  aDoorGrade: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set CA_DOORGRADE = ''' + aDoorGrade + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIAlarmGrade.Panel1Resize(Sender: TObject);
begin
  Panel3.Width := (Panel1.Width - panel4.Width) div 2;

end;

procedure TfmMDIAlarmGrade.ed_EmpNoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    btn_SearchClick(Self);
  end;

end;

procedure TfmMDIAlarmGrade.N8Click(Sender: TObject);
begin
  AdvStrinGridSetAllCheck(sg_Card,True);
end;

procedure TfmMDIAlarmGrade.N9Click(Sender: TObject);
begin
  btn_GradeInsertClick(self);
end;

procedure TfmMDIAlarmGrade.cmb_SearchTypeChange(Sender: TObject);
begin
  lb_search.Caption := cmb_SearchType.Text;

  if cmb_SearchType.ItemIndex > 5 then
  begin
    cmb_regGubun1.Visible := True;
    ed_searchText.Visible := False;
    if cmb_SearchType.ItemIndex = 6 then LoadRegGubun(cmb_regGubun1)
    else if cmb_SearchType.ItemIndex = 7 then LoadEmpType(EmpTypeCodeList,cmb_regGubun1)
    else if cmb_SearchType.ItemIndex = 8 then LoadCardGubun(cmb_regGubun1)
    else if cmb_SearchType.ItemIndex = 11 then LoadWorkGubun(WorkGubunCodeList,cmb_regGubun1,'전체') //LoadCardGubun(cmb_regGubun1)
    else
    begin
      cmb_regGubun1.Visible := False;
      ed_searchText.Visible := True;
    end;
  end else
  begin
    cmb_regGubun1.Visible := False;
    ed_searchText.Visible := True;
  end;

end;

procedure TfmMDIAlarmGrade.ed_searchTextKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin
    btn_SearchClick(self);
  end;

end;

procedure TfmMDIAlarmGrade.cmb_regGubun1Change(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);

end;

procedure TfmMDIAlarmGrade.LoadAlarmCode(aBuildingCode, aFloorCode,
  aAreaCode: string; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  AlarmCodeList.Clear;

  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,a.AR_VIEWSEQ ';
  stSql := stSql + ' from TB_ARMAREA a ';
{  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';   }
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO  ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID  ';
      stSql := stSql + ' AND a.AR_AREANO = c.AR_AREANO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
  stSql := stSql + ' order by a.AR_VIEWSEQ,a.AR_NAME ';

  cmb_Box.ItemIndex := -1;

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
      cmb_Box.Items.Add(FindField('AR_NAME').AsString );
      AlarmCodeList.Add(FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger));
      Next;
    end;

    if cmb_Box.Items.Count > 0 then cmb_Box.ItemIndex := 0; 
  end;
end;

procedure TfmMDIAlarmGrade.btn_DoorSearchClick(Sender: TObject);
begin
  inherited;
  ed_AlarmSearchName.Text := '';
  gb_DoorSearch.Visible := True;
end;

procedure TfmMDIAlarmGrade.sg_AlarmDblClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stArmAreaNo : string;
  nIndex : integer;
begin
  inherited;
  with sg_Alarm do
  begin
    stNodeNo := cells[1,Row];
    stEcuID := cells[3,Row];
    stArmAreaNo := cells[4,Row]
  end;
  nIndex := AlarmCodeList.IndexOf(FillZerostrNum(stNodeNo,3) + stEcuID + inttostr(strtoint(stArmAreaNo)) );
  if nIndex > -1 then
  begin
    cmb_Alarm.ItemIndex := nIndex;
    btn_SearchClick(self);
  end;
  ed_AlarmSearchName.Text := '';
  ed_AlarmSearchName.SetFocus;
  GridInit(sg_Alarm,1,2,False);
  gb_DoorSearch.Visible := False;
end;

procedure TfmMDIAlarmGrade.ed_AlarmSearchNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode.itemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode.itemIndex];
  LoadFloorCode(stBuildingCode,cmb_FloorCode);
  if cmb_FloorCode.itemIndex > -1 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode);
  if cmb_AreaCode.itemIndex > -1 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
end;

procedure TfmMDIAlarmGrade.AlarmNotGradeSearch;
var
  stSql : string;
  nRow : integer;
  i : integer;
  stAC_NODENO,stAC_ECUID,stArmAreaNo : string;
  bWhereSearch : Boolean;
begin
  Panel14.Caption := '미등록카드';
  bWhereSearch := False;

  GridInit(sg_Card,9,2,True);
  if cmb_Alarm.ItemIndex < 0 then Exit;

  stAC_NODENO := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],1,3);
  stAC_ECUID := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],4,2);
  stArmAreaNo := copy(AlarmCodeList.Strings[cmb_Alarm.ItemIndex],6,1);

  if (stAC_NODENO = '')
    Or (stAC_ECUID = '')  then Exit;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDFromArmAreaGradeNotIn(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_CARDFromArmAreaGradeNotIn(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDFromArmAreaGradeNotIn(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDFromArmAreaGradeNotIn(stAC_NODENO,stAC_ECUID,stArmAreaNo)
  else Exit;

  if cmb_SearchType.ItemIndex = 6 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_CARDTYPE = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 7 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.RG_CODE = ''' + EmpTypeCodeList.Strings[cmb_regGubun1.itemIndex] + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 8 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND a.CA_GUBUN = ''' + copy(cmb_regGubun1.Text,1,1) + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 11 then
  begin
    if cmb_regGubun1.ItemIndex > 0 then
    begin
      bWhereSearch := True;
      stSql := stSql + ' AND b.WG_CODE = ''' + WorkGubunCodeList.Strings[cmb_regGubun1.ItemIndex] + ''' '
    end;
  end else
  begin
    if Trim(ed_searchText.Text) <> '' then
    begin
      if cmb_SearchType.ItemIndex < 0 then cmb_SearchType.ItemIndex := 0;
      bWhereSearch := True;

      if cmb_SearchType.ItemIndex = 0 then //사번
        stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 1 then //이름
        stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 2 then //사내전화번호
        stSql := stSql + ' AND b.em_cophone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 3 then //집전화번호
        stSql := stSql + ' AND b.em_homephone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 4 then //휴대폰번호
        stSql := stSql + ' AND b.em_handphone LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 5 then //카드번호
        stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 9 then //주소1
        stSql := stSql + ' AND b.EM_ADDR1 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
      else if cmb_SearchType.ItemIndex = 10 then //주소2
        stSql := stSql + ' AND b.EM_ADDR2 LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';
    end;
  end;

  if Not bWhereSearch then
  begin
    if (Not IsMaster) and (CompanyGrade <> '0') then
    begin
      if CompanyGrade = '1' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          if CompanyCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 회사 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to CompanyCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
          end;
          stSql := stSql + ')'; 
        end else stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '2' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          if JijumCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 지점 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to JijumCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end else if CompanyGrade = '3' then
      begin
        if cmb_Company.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 회사코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
        if cmb_Jijum.ItemIndex < 1 then
        begin
          showmessage('관리자 소속 지점코드가 이상합니다.');
          Exit;
        end;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
        if cmb_Depart.ItemIndex < 1 then
        begin
          if DepartCodeList.Count < 2 then
          begin
            showmessage('관리할수 있는 부서 권한이 없습니다.');
            Exit;
          end;
          for i:= 1 to DepartCodeList.Count - 1 do
          begin
            if i = 1 then stSql := stSql + ' AND ( '
            else stSql := stSql + ' OR ';
            stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
          end;
          stSql := stSql + ')';
        end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
      end;
    end else
    begin
      if cmb_Depart.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
      end else if cmb_Jijum.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
        stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
      end else if cmb_Company.ItemIndex > 0 then
      begin
        stSql := stSql + ' AND b.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
      end;
    end;
    if cmb_Posi.ItemIndex > 0 then
      stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  end;
  stSql := stSql + ' order by b.CO_COMPANYCODE,b.CO_JIJUMCODE,b.CO_DEPARTCODE,b.EM_CODE';


  with DataModule1.GetObject.ADOTmpQuery do
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
    Panel14.Caption := '미등록카드(' + inttostr(RecordCount) + ')';
    sg_Card.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Card do
      begin
        cells[0,nRow] := FindField('CO_COMPANYNAME').AsString;
        cells[1,nRow] := FindField('EM_CODE').AsString;
        cells[2,nRow] := FindField('EM_NAME').AsString;
        cells[3,nRow] := FindField('CA_CARDNO').AsString;
        cells[4,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[5,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[6,nRow] := FindField('PO_NAME').AsString;
        cells[8,nRow] := FindField('CA_LASTUSE').AsString;
        cells[9,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[10,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[11,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[12,nRow] := FindField('PO_POSICODE').AsString;
        AddCheckBox(0,nRow,False,False);

      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
end;

procedure TfmMDIAlarmGrade.cmb_AlarmChange(Sender: TObject);
begin
  inherited;
  btn_SearchClick(self);
end;

procedure TfmMDIAlarmGrade.ed_searchTextKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  btn_SearchClick(self);

end;

procedure TfmMDIAlarmGrade.GradeSetting(aInsertGrade, aUpdateGrade,
  aDeleteGrade: Boolean);
begin
  btn_GradeInsert.Enabled := True;
  btn_GradeDelete.Enabled := True;
  if Not IsMaster then
  begin
    if aInsertGrade or aUpdateGrade then
    begin
      btn_GradeInsert.Enabled := True;
    end else
    begin
      btn_GradeInsert.Enabled := False;
    end;
    if aDeleteGrade then
    begin
      btn_GradeDelete.Enabled := True;
    end else
    begin
      btn_GradeDelete.Enabled := False;
    end;
  end;
end;

procedure TfmMDIAlarmGrade.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmMDIAlarmGrade);
Finalization
  UnRegisterClass(TfmMDIAlarmGrade);

end.
