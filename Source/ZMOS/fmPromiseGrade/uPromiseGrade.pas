unit uPromiseGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, BaseGrid, AdvGrid, Buttons,
  uSubForm, CommandArray, AdvObj;

type
  TfmPromiseGrade = class(TfmASubForm)
    Panel1: TPanel;
    Splitter1: TSplitter;
    Panel2: TPanel;
    GroupBox2: TGroupBox;
    sg_GradePromise: TAdvStringGrid;
    Panel3: TPanel;
    StatusBar1: TStatusBar;
    btn_Insert: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    PageControl1: TPageControl;
    DoorTab: TTabSheet;
    Panel6: TPanel;
    sg_Door: TAdvStringGrid;
    AlarmTab: TTabSheet;
    Panel7: TPanel;
    FoodTab: TTabSheet;
    Panel11: TPanel;
    Panel4: TPanel;
    Label1: TLabel;
    ed_promise: TEdit;
    sg_Alarm: TAdvStringGrid;
    sg_Food: TAdvStringGrid;
    Panel12: TPanel;
    btn_Update: TSpeedButton;
    btn_Cancel: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sg_DoorCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure sg_DoorClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_GradePromiseClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    BuildingCodeList1 : TStringList;
    FloorCodeList1 : TStringList;
    AreaCodeList1 : TStringList;
    BuildingCodeList2 : TStringList;
    FloorCodeList2 : TStringList;
    AreaCodeList2 : TStringList;
    BuildingCodeList3 : TStringList;
    FloorCodeList3 : TStringList;
    AreaCodeList3 : TStringList;
    State:string;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure LoadBuildingCode(var aList:TStringList;cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;var aList:TStringList;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;var aList:TStringList;cmb_Box:TComboBox);
    procedure DoorCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure AlarmCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure FoodCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure fmInitialize;
    procedure InsertDoorGradePromise;
    procedure InsertAlarmGradePromise;
    procedure InsertFoodGradePromise;
    procedure SearchGradePromise(aCode:string);
    procedure DeleteGradePromise;
    Function CheckTB_DEVICECARDNO_PROMISE(aPromise,aNodeNo,aECUID : String):Boolean;
    Function InsertTB_DEVICECARDNO_PROMISE(aPromise,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun:string):Boolean;
    Function UpdateTB_DEVICECARDNO_PROMISE(aPromise,aNodeNo,aECUID,aDoorNO,aTimCode,aPermit,aValue,aGubun: string):Boolean;
//    procedure GridInit(sg:TAdvStringGrid;aCol:integer);
    procedure SetGrade;
    procedure SetDoorGrid;
    procedure SetAlarmGrid;
    procedure SetFoodGrid;
    Function CheckGrade(aNodeNo,aECUID,aDOORNO,aPromise,aGUBUN:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmPromiseGrade: TfmPromiseGrade;

implementation

uses
  uDataModule1,
  uLomosUtil, uJavara;

{$R *.dfm}

procedure TfmPromiseGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmPromiseGrade.LoadAreaCode(aBuildingCode, aFloorCode: string;
  var aList: TStringList; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  aList.Clear;

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

  cmb_Box.Items.Add('전체');
  aList.Add('');
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
      aList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmPromiseGrade.LoadBuildingCode(var aList: TStringList;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  aList.Clear;

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

  cmb_Box.Items.Add('전체');
  aList.Add('');
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
      aList.Add(FindField('LO_DONGCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmPromiseGrade.LoadFloorCode(aBuildingCode: string;
  var aList: TStringList; cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  aList.Clear;

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

  cmb_Box.Items.Add('전체');
  aList.Add('');
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
      aList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmPromiseGrade.FormCreate(Sender: TObject);
begin
    BuildingCodeList1 := TStringList.Create;
    FloorCodeList1 := TStringList.Create;
    AreaCodeList1 := TStringList.Create;
    BuildingCodeList2 := TStringList.Create;
    FloorCodeList2 := TStringList.Create;
    AreaCodeList2 := TStringList.Create;
    BuildingCodeList3 := TStringList.Create;
    FloorCodeList3 := TStringList.Create;
    AreaCodeList3 := TStringList.Create;

end;

procedure TfmPromiseGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    BuildingCodeList1.Destroy;
    FloorCodeList1.Destroy;
    AreaCodeList1.Destroy;
    BuildingCodeList2.Destroy;
    FloorCodeList2.Destroy;
    AreaCodeList2.Destroy;
    BuildingCodeList3.Destroy;
    FloorCodeList3.Destroy;
    AreaCodeList3.Destroy;

end;

procedure TfmPromiseGrade.FormShow(Sender: TObject);
begin
  PageControl1.ActivePageIndex:=0;
  fmInitialize;
  GridInit(sg_Door,1,2,True);
  GridInit(sg_Food,1,2,True);
  GridInit(sg_Alarm,1,2,True);
  DoorCodeSearch('000','000','000',sg_Door);
  AlarmCodeSearch('000','000','000',sg_Alarm);
  FoodCodeSearch('000','000','000',sg_Food);
  SearchGradePromise('');
  if Not FoodUse then FoodTab.TabVisible := False;
  if PatrolUse then
  begin
    AlarmTab.TabVisible := True;
  end else
  begin
    AlarmTab.TabVisible := False;
  end;

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

procedure TfmPromiseGrade.DoorCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  stSql := ' select a.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.DO_VIEWSEQ ' ;
  stSql := stSql + ' from TB_DOOR a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO )';
    end;
  end;
  stSql := stsql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
  stSql := stSql + ' AND c.AC_FDTYPE <> ''1'' )';  //식수타입은 조회 하지 말자
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
      if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
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
  stSql := stSql + ' order by a.DO_VIEWSEQ ';
  
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
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
        cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('DO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGrade.AlarmCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO ';
  stSql := stSql + ' from TB_ARMAREA a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINALARMAREA c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
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
        cells[4,nRow] := inttostr(FindField('AR_AREANO').AsInteger);
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGrade.FoodCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  sg.SetCheckBoxState(0,0,False);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  stSql := 'select a.FO_NAME,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID,a.FO_DOORNO ';
  stSql := stSql + ' from TB_FOOD a ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINFOOD b ';
      stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
      stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
      if BuildingGrade = 4 then stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + ''' ';
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
        cells[0,nRow] := FindField('FO_NAME').AsString;
        cells[1,nRow] := FindField('AC_NODENO').AsString;
        cells[2,nRow] := FindField('AC_MCUID').AsString;
        cells[3,nRow] := FindField('AC_ECUID').AsString;
        cells[4,nRow] := FindField('FO_DOORNO').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
end;

procedure TfmPromiseGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmPromiseGrade.fmInitialize;
begin
  AdvStrinGridSetAllCheck(sg_Door,False);
  AdvStrinGridSetAllCheck(sg_Alarm,False);
  AdvStrinGridSetAllCheck(sg_Food,False);
  sg_Door.Enabled := False;
  sg_Alarm.Enabled := False;
  sg_Food.Enabled := False;
  ed_promise.Text := '';
  ed_promise.Enabled := False;
  btn_Save.Enabled := False;
  btn_Delete.Enabled := False;
end;

procedure TfmPromiseGrade.sg_DoorCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    AdvStrinGridSetAllCheck(Sender,State);
  end;

end;

procedure TfmPromiseGrade.sg_DoorClick(Sender: TObject);
begin
  if ed_promise.Text = '' then Exit;
  with (Sender as TAdvStringGrid) do
  begin
    if Row = 0 then Exit;
    if Col = 0 then btn_Save.Enabled := True;
  end;
end;

procedure TfmPromiseGrade.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  ed_promise.SetFocus;
end;

procedure TfmPromiseGrade.btn_SaveClick(Sender: TObject);
begin
  InsertDoorGradePromise;
  if PatrolUse then
    InsertAlarmGradePromise;
  if FoodUse then
    InsertFoodGradePromise;
  SearchGradePromise(ed_promise.text);
end;

procedure TfmPromiseGrade.InsertAlarmGradePromise;
var
  AlarmLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stArmAreaNo : string;
  stPromise : string;
  bResult : Boolean;
  i : integer;
  stPermit : string;
begin
  i:=1;
  stPromise := ed_promise.Text;
  if Trim(stPromise) = '' then Exit;
  for AlarmLoop := 1 to sg_Alarm.RowCount - 1 do   //체크되어 있는 기기 모두를 인서트 시킴
  begin
    sg_Alarm.GetCheckBoxState(0,AlarmLoop, bchkState);
    if bchkState then stPermit := 'Y'
    else stPermit := 'N';
    stNodeNo:= sg_Alarm.Cells[1,AlarmLoop];
    stECUID:= sg_Alarm.Cells[3,AlarmLoop];
    stArmAreaNo := sg_Alarm.Cells[4,AlarmLoop];
    if stNodeNo = '' then break;
    bResult := CheckTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID);
    if Not bResult then
       InsertTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stArmAreaNo,'0','L',stPermit,'ALARM')
    else UpdateTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stArmAreaNo,'0','L',stPermit,'ALARM');
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Alarm.RowCount);
    inc(i);
    Application.ProcessMessages;
  end;
end;

procedure TfmPromiseGrade.InsertDoorGradePromise;
var
  DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stPromise : string;
  bResult : Boolean;
  i : integer;
  stPermit : string;
begin
  i:=1;
  stPromise := ed_promise.Text;
  if Trim(stPromise) = '' then Exit;

  for DoorLoop := 1 to sg_Door.RowCount - 1 do   //체크되어 있는 기기 모두를 인서트 시킴
  begin
    sg_Door.GetCheckBoxState(0,DoorLoop, bchkState);
    if bchkState then stPermit := 'Y'
    else stPermit := 'N';
    stNodeNo:= sg_Door.Cells[1,DoorLoop];
    stECUID:= sg_Door.Cells[3,DoorLoop];
    stDoorNO := sg_Door.Cells[4,DoorLoop];
    if stNodeNo = '' then break;
    bResult := CheckTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID);
    if Not bResult then
       InsertTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR')
    else UpdateTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR');
    if dmJavara.JavaraCheck(strtoint(stNodeNo),stECUID) then  //자바라 타입이면 무조건 2번 출입문에 권한 동일 부여
    begin
      UpdateTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,'2','0','L',stPermit,'DOOR');
    end;
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Door.RowCount);
    inc(i);
    Application.ProcessMessages;
  end;
end;

procedure TfmPromiseGrade.InsertFoodGradePromise;
var
  FoodLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNO : string;
  stPromise : string;
  bResult : Boolean;
  i : integer;
  stPermit : string;
begin
  i:=1;
  stPromise := ed_promise.Text;
  if Trim(stPromise) = '' then Exit;
  for FoodLoop := 1 to sg_Food.RowCount - 1 do   //체크되어 있는 기기 모두를 인서트 시킴
  begin
    sg_Food.GetCheckBoxState(0,FoodLoop, bchkState);
    if bchkState then stPermit := 'Y'
    else stPermit := 'N';
    stNodeNo:= sg_Food.Cells[1,FoodLoop];
    stECUID:= sg_Food.Cells[3,FoodLoop];
    stDoorNO := sg_Food.Cells[4,FoodLoop];
    if stNodeNo = '' then break;
    bResult := CheckTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID);
    if Not bResult then
       InsertTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR')
    else UpdateTB_DEVICECARDNO_PROMISE(stPromise,stNodeNo,stECUID,stDoorNO,'0','L',stPermit,'DOOR');
    StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(sg_Food.RowCount);
    inc(i);
    Application.ProcessMessages;
  end;
end;

function TfmPromiseGrade.CheckTB_DEVICECARDNO_PROMISE(aPromise, aNodeNo,
   aECUID: String): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DEVICECARDNO_PROMISE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PR_NAME = ''' + aPromise + ''' ';
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

function TfmPromiseGrade.InsertTB_DEVICECARDNO_PROMISE(aPromise, aNodeNo,
   aECUID, aDoorNO, aTimCode, aPermit, aValue,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO_PROMISE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PR_NAME,';
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
  stSql := stSql + '''' + aPromise + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  if UpperCase(aGubun) = 'DOOR' then
  begin
    stSql := stSql + '''' + aValue + ''',';
    stSql := stSql + '''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';
    stSql := stSql + '''Y'',';  }
  end else if UpperCase(aGubun) = 'ALARM' then
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

function TfmPromiseGrade.UpdateTB_DEVICECARDNO_PROMISE(aPromise, aNodeNo,
  aECUID, aDoorNO, aTimCode, aPermit, aValue,
  aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO_PROMISE Set ';
  if UpperCase(aGubun) = 'DOOR' then
  begin
    stSql := stSql + 'DE_DOOR' + aDoorNO + ' = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';
{  end else if aGubun = 'FOOD' then
  begin
    stSql := stSql + 'DE_DOOR1 = ''' + aValue + ''',';
    stSql := stSql + 'DE_DOOR2 = ''' + aValue + ''',';
    stSql := stSql + 'DE_USEACCESS = ''Y'',';  }
  end else if UpperCase(aGubun) = 'ALARM' then
  begin
    stSql := stSql + 'DE_ALARM' + aDoorNO + ' = ''' + aValue + ''',';
    if aDoorNO = '0' then stSql := stSql + 'DE_USEALARM = ''' + aValue + ''',';
  end;
  stSql := stSql + 'DE_TIMECODE = ''' + aTimCode + ''',';
  stSql := stSql + 'DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + 'DE_RCVACK = ''N'',';
  stSql := stSql + 'DE_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'DE_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PR_NAME =''' + aPromise + ''' ';
  stSql := stSql + ' AND AC_NODENO =' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
{  with DataModule1.ADOExecQuery do
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

  Result := True;  }

end;

procedure TfmPromiseGrade.btn_DeleteClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
  DeleteGradePromise;
  SearchGradePromise('');
end;

procedure TfmPromiseGrade.DeleteGradePromise;
var
  stSql : string;
begin
  stSql := ' Delete From TB_DEVICECARDNO_PROMISE  ';
  stSql := stSql + ' Where GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND PR_NAME =''' + ed_promise.Text + ''' ';

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

end;

procedure TfmPromiseGrade.SearchGradePromise(aCode:string);
var
  stSql : string;
  i : integer;
  nRow : integer;
begin
  RowGridInitialize(sg_GradePromise); //스트링그리드 초기화
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select PR_NAME from TB_DEVICECARDNO_PROMISE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' Group by PR_NAME ';

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
    if recordCount < 1 then Exit;
    sg_GradePromise.RowCount := recordCount + 1;
    nRow := 1;
    with sg_GradePromise do
    begin
      While Not Eof do
      begin
        cells[0,nRow] := FindField('PR_NAME').AsString;
        if (FindField('PR_NAME').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;

end;


procedure TfmPromiseGrade.sg_GradePromiseClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_GradePromise do
  begin
    ed_promise.Text := Cells[0,Row];
  end;
  SetGrade;
  //btn_UpdateClick(btn_Update);

end;

procedure TfmPromiseGrade.SetGrade;
begin
  if Trim(ed_Promise.Text) = '' then Exit;
  SetDoorGrid;
  SetAlarmGrid;
  SetFoodGrid;
end;

procedure TfmPromiseGrade.SetAlarmGrid;
var
  i : integer;
  bCheck : Boolean;
begin
  with sg_Alarm do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[1,i] = '' then Break;
      bCheck := CheckGrade(cells[1,i],Cells[3,i],Cells[4,i],ed_promise.Text,'ALARM');
      SetCheckBoxState(0,i,bCheck);
    end;
  end;
end;

procedure TfmPromiseGrade.SetDoorGrid;
var
  i : integer;
  bCheck : Boolean;
begin
  with sg_Door do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[1,i] = '' then Break;
      bCheck := CheckGrade(cells[1,i],Cells[3,i],Cells[4,i],ed_promise.Text,'DOOR');
      SetCheckBoxState(0,i,bCheck);
    end;
  end;
end;

procedure TfmPromiseGrade.SetFoodGrid;
var
  i : integer;
  bCheck : Boolean;
begin
  with sg_Food do
  begin
    for i := 1 to RowCount - 1 do
    begin
      if Cells[1,i] = '' then Break;
      bCheck := CheckGrade(cells[1,i],Cells[3,i],Cells[4,i],ed_promise.Text,'DOOR');
      SetCheckBoxState(0,i,bCheck);
    end;
  end;
end;

function TfmPromiseGrade.CheckGrade(aNodeNo, aECUID, aDOORNO,aPromise,
  aGUBUN: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql :=  'select * from TB_DEVICECARDNO_PROMISE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND PR_NAME = ''' + aPromise + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''L'' ';

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
    if recordcount < 1 then Exit;
    if UpperCase(aGUBUN) = 'DOOR' then
    begin
      Try
        if FindField('DE_DOOR' + aDOORNO).AsString = 'Y' then result := True;
      Except
        Exit;
      End;
    end else
    begin
      Try
        if FindField('DE_ALARM' + aDOORNO).AsString = 'Y' then result := True;
      Except
        Exit;
      End;
    end;
  end;
end;

procedure TfmPromiseGrade.ButtonEnable(aState: string);
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

procedure TfmPromiseGrade.FormClear;
begin
  AdvStrinGridSetAllCheck(sg_Door,False);
  AdvStrinGridSetAllCheck(sg_Alarm,False);
  AdvStrinGridSetAllCheck(sg_Food,False);
  ed_promise.Text := '';

end;

procedure TfmPromiseGrade.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_GradePromise.Enabled := False;
    sg_Door.Enabled := True;
    sg_Alarm.Enabled := True;
    sg_Food.Enabled := True;
    ed_promise.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_GradePromise.Enabled := True;
    sg_Door.Enabled := True;
    sg_Alarm.Enabled := True;
    sg_Food.Enabled := True;
    ed_promise.Enabled := True;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_GradePromise.Enabled := False;
    sg_Door.Enabled := True;
    sg_Alarm.Enabled := True;
    sg_Food.Enabled := True;
    ed_promise.Enabled := False;
  end;
end;

procedure TfmPromiseGrade.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
//  FormClear;
  FormEnable(State);
  ButtonEnable(State);
end;

procedure TfmPromiseGrade.btn_CancelClick(Sender: TObject);
begin
  SearchGradePromise(ed_promise.text);
end;

procedure TfmPromiseGrade.FormActivate(Sender: TObject);
begin
  Panel12.Caption := fmPromiseGrade.Caption;

end;

end.
