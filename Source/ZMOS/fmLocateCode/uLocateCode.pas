unit uLocateCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, Buttons,Jpeg,DB,
  uSubForm, CommandArray,ADODB, LMDCustomComponent, LMDFileCtrl,ActiveX,
  AdvObj;

type
  TfmLocateCode = class(TfmASubForm)
    PageControl1: TPageControl;
    StatusBar1: TStatusBar;
    BuildingTab: TTabSheet;
    FloorTab: TTabSheet;
    AreaTab: TTabSheet;
    RzOpenDialog1: TOpenDialog;
    GroupBox7: TGroupBox;
    Panel2: TPanel;
    sg_BuildingCode: TAdvStringGrid;
    Panel3: TPanel;
    GroupBox8: TGroupBox;
    lb_sbuildingcode1: TLabel;
    lb_sBuildingName1: TLabel;
    Label3: TLabel;
    btn_BuildingSearch: TSpeedButton;
    ed_BuildingCode: TEdit;
    ed_BuildingName: TEdit;
    Panel4: TPanel;
    imgBuilding: TImage;
    ed_Buildingimg: TEdit;
    Splitter1: TSplitter;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    GroupBox9: TGroupBox;
    lb_sFloorCode2: TLabel;
    lb_sFloorName2: TLabel;
    Label6: TLabel;
    btn_FloorSearch: TSpeedButton;
    lb_sbuildingcode2: TLabel;
    ed_FloorCode: TEdit;
    ed_FloorName: TEdit;
    Panel7: TPanel;
    imgFloor: TImage;
    cmb_sBuildingCode1: TComboBox;
    ed_FloorImg: TEdit;
    Panel5: TPanel;
    GroupBox10: TGroupBox;
    lb_buildingcode2: TLabel;
    cmb_BuildingCode1: TComboBox;
    sg_FloorCode: TAdvStringGrid;
    Splitter2: TSplitter;
    GroupBox6: TGroupBox;
    Panel9: TPanel;
    GroupBox11: TGroupBox;
    lb_sAreaCode3: TLabel;
    lb_sAreaName3: TLabel;
    Label12: TLabel;
    btn_AreaSearch: TSpeedButton;
    lb_sbuildingcode3: TLabel;
    lb_sFloorCode3: TLabel;
    ed_AreaCode: TEdit;
    ed_AreaName: TEdit;
    Panel10: TPanel;
    imgArea: TImage;
    cmb_sBuildingCode2: TComboBox;
    cmb_sFloorCode2: TComboBox;
    ed_AreaImg: TEdit;
    Panel8: TPanel;
    GroupBox12: TGroupBox;
    lb_buildingcode3: TLabel;
    lb_FloorCode3: TLabel;
    cmb_BuildingCode2: TComboBox;
    cmb_FloorCode2: TComboBox;
    sg_AreaCode: TAdvStringGrid;
    Splitter3: TSplitter;
    GroupBox2: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel11: TPanel;
    btn_Cancel: TSpeedButton;
    FileCtrl: TLMDFileCtrl;
    chk_BuildingAuto: TCheckBox;
    chk_FloorAuto: TCheckBox;
    chk_ArearAuto: TCheckBox;
    ADOAutoQuery: TADOQuery;
    procedure FormActivate(Sender: TObject);
    procedure btn_closeClick(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_BuildingCode2Change(Sender: TObject);
    procedure cmb_sBuildingCode2Change(Sender: TObject);
    procedure cmb_FloorCode2Change(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure sg_BuildingCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_BuildingSearchClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_FloorCodeClick(Sender: TObject);
    procedure btn_FloorSearchClick(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure sg_AreaCodeClick(Sender: TObject);
    procedure btn_AreaSearchClick(Sender: TObject);
    procedure btn_ClsoeClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_BuildingCodeChange(Sender: TObject);
    procedure ed_FloorCodeChange(Sender: TObject);
    procedure ed_AreaCodeChange(Sender: TObject);
    procedure chk_BuildingAutoClick(Sender: TObject);
    procedure chk_FloorAutoClick(Sender: TObject);
    procedure chk_ArearAutoClick(Sender: TObject);
    procedure cmb_sBuildingCode1Change(Sender: TObject);
    procedure cmb_sFloorCode2Change(Sender: TObject);
  private
    { Private declarations }
    State : string;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    sFloorCodeList : TStringList;

    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ShowBuildingCode(aBuildingCode:string);
    procedure ShowFloorCode(aBuildingCode,aFloorCode:string);
    procedure ShowAreaCode(aBuildingCode,aFloorCode,aAreaCode:string);
    procedure LoadFloorBuilding;
    procedure LoadAreaBuilding;
    procedure LoadAreaFloor(aBuildingCode:string);
    procedure LoadAreaSearchFloor;
    Function InsertTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,
aName,aFileName,aGubun :string) : Boolean;
    Function UpdateTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,
aName,aFileName,aGubun :string) : Boolean;
    Function DeleteTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,aGubun:string) : Boolean;
    Function GetAutoBuildingCode:string;
    Function GetAutoFloorCode(aBuildingCode:string):string;
    Function GetAutoAreaCode(aBuildingCode,aFloorCode:string):string;

    procedure FormNameSet;
  public
    WorkCode : integer;

    { Public declarations }
  end;

var
  fmLocateCode: TfmLocateCode;

implementation

uses
  uDataModule1,
  uLomosUtil;

{$R *.dfm}

procedure TfmLocateCode.FormActivate(Sender: TObject);
begin
  if (WorkCode < 0) or (WorkCode > 2) then WorkCode := 0;
  PageControl1.ActivePageIndex := WorkCode;

  sg_FloorCode.ColWidths[2] := 0;
  sg_AreaCode.ColWidths[2] := 0;
  sg_AreaCode.ColWidths[3] := 0;
  
//  sg_BuildingCode.OnDrawCell:=StringGrideDrawCell;
//  sg_FloorCode.OnDrawCell:=StringGrideDrawCell;
//  sg_AreaCode.OnDrawCell:=StringGrideDrawCell;
  if WorkCode = 0 then ShowBuildingCode('')
  else if WorkCode = 1 then
  begin
    LoadFloorBuilding;
    ShowFloorCode('','');
  end else if WorkCode = 2 then
  begin
    LoadAreaBuilding;
    LoadAreaFloor('');
    ShowAreaCode('','','');
  end;

end;

procedure TfmLocateCode.btn_closeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLocateCode.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmLocateCode.ShowAreaCode(aBuildingCode,aFloorCode,aAreaCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin

  GridInitialize(sg_FloorCode); //스트링그리드 초기화

  FormClear;
  FormEnable('Search');
  ButtonEnable('Search');

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if cmb_BuildingCode2.ItemIndex < 0 then cmb_BuildingCode2.ItemIndex := 0;

  if cmb_BuildingCode2.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + BuildingCodeList.Strings[cmb_BuildingCode2.ItemIndex] + '''';
    if cmb_FloorCode2.ItemIndex < 0 then cmb_FloorCode2.ItemIndex := 0;
    if cmb_FloorCode2.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + FloorCodeList.Strings[cmb_FloorCode2.ItemIndex] + '''';
      if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end;
    end else
    begin
      if BuildingGrade = 2 then
      begin
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end else if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end;
    end;
  end else
  begin
    if Not IsMaster then
    begin
      if BuildingGrade = 1 then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      end else if BuildingGrade = 2 then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end else if BuildingGrade = 3 then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
        stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
      end;
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
      if RecordCount < 1 then
      begin
        Exit;
      end;

      with sg_AreaCode do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('LO_AREACODE').AsString;
          cells[1,nRow] := FindField('LO_NAME').AsString;
          cells[2,nRow] := FindField('LO_DONGCODE').AsString;
          cells[3,nRow] := FindField('LO_FLOORCODE').AsString;
          if (FindField('LO_DONGCODE').AsString +
              FindField('LO_FLOORCODE').AsString +
              FindField('LO_AREACODE').AsString )  =
             (aBuildingCode + aFloorCode + aAreaCode ) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.free;
    CoUninitialize;
  End;
  sg_AreaCodeClick(sg_AreaCode);
end;

procedure TfmLocateCode.ShowBuildingCode(aBuildingCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_BuildingCode); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if (BuildingGrade > 0) and (BuildingGrade < 4) then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
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

      if RecordCount < 1 then
      begin
        Exit;
      end;

      with sg_BuildingCode do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('LO_DONGCODE').AsString;
          cells[1,nRow] := FindField('LO_NAME').AsString;

          if FindField('LO_DONGCODE').AsString = aBuildingCode then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_BuildingCodeClick(sg_BuildingCode);
end;

procedure TfmLocateCode.ShowFloorCode(aBuildingCode,aFloorCode:string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin

  GridInitialize(sg_FloorCode); //스트링그리드 초기화

  FormClear;
  FormEnable('Search');
  ButtonEnable('Search');

  State := 'SEARCH';

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if cmb_BuildingCode1.ItemIndex < 0 then cmb_BuildingCode1.ItemIndex := 0;
  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex] + '''';
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
    end;
  end else
  begin
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
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
      if RecordCount < 1 then
      begin
        Exit;
      end;

      with sg_FloorCode do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[1,nRow] := FindField('LO_NAME').AsString;
          cells[2,nRow] := FindField('LO_DONGCODE').AsString;
          if (FindField('LO_DONGCODE').AsString + FindField('LO_FLOORCODE').AsString)  = (aBuildingCode + aFloorCode) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
          Next;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_FloorCodeClick(sg_FloorCode);

end;

procedure TfmLocateCode.FormCreate(Sender: TObject);
begin
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
end;

procedure TfmLocateCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  BuildingCodeList.Free;
  FloorCodeList.Free;
  sFloorCodeList.Free;
end;

procedure TfmLocateCode.LoadAreaBuilding;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_BuildingCode2.Clear;
  cmb_sBuildingCode2.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if (BuildingGrade > 0) and (BuildingGrade < 4) then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end;
  end;

  cmb_BuildingCode2.Items.Add('전체');
  cmb_sBuildingCode2.Items.Add('');
  BuildingCodeList.Add('');
  cmb_BuildingCode2.ItemIndex := 0;
  cmb_sBuildingCode2.ItemIndex := 0;

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
        cmb_BuildingCode2.Items.Add(FindField('LO_NAME').AsString );
        cmb_sBuildingCode2.Items.Add(FindField('LO_NAME').AsString );
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if (BuildingGrade > 0) and (BuildingGrade < 4) then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_BuildingCode2.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLocateCode.LoadAreaFloor(aBuildingCode : string);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_FloorCode2.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode  + '''';
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
    end;
  end else
  begin
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
    end;
  end;
  
  cmb_FloorCode2.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_FloorCode2.ItemIndex := 0;

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
        cmb_FloorCode2.Items.Add(FindField('LO_NAME').AsString );
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if (BuildingGrade > 1) and (BuildingGrade < 4) then
        begin
          if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_FloorCode2.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
          end;
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLocateCode.LoadFloorBuilding;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_BuildingCode1.Clear;
  cmb_sBuildingCode1.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if (BuildingGrade > 0) and (BuildingGrade < 4) then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end;
  end;

  cmb_BuildingCode1.Items.Add('전체');
  cmb_sBuildingCode1.Items.Add('');
  BuildingCodeList.Add('');
  cmb_BuildingCode1.ItemIndex := 0;
  cmb_sBuildingCode1.ItemIndex := 0;

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
        cmb_BuildingCode1.Items.Add(FindField('LO_NAME').AsString );
        cmb_sBuildingCode1.Items.Add(FindField('LO_NAME').AsString );
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if (BuildingGrade > 0) and (BuildingGrade < 4) then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_BuildingCode1.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
          end;
        end;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLocateCode.LoadAreaSearchFloor;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_sFloorCode2.Clear;
  sFloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if cmb_sBuildingCode2.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + BuildingCodeList.Strings[cmb_sBuildingCode2.ItemIndex]  + '''';
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
    end;
  end else
  begin
    if Not IsMaster then
    begin
      if (BuildingGrade > 1) and (BuildingGrade < 4) then
      begin
        stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
        stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      end;
    end;
  end;

  cmb_sFloorCode2.Items.Add('');
  sFloorCodeList.Add('');
  cmb_sFloorCode2.ItemIndex := 0;

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
        cmb_sFloorCode2.Items.Add(FindField('LO_NAME').AsString );
        sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmLocateCode.cmb_BuildingCode2Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_BuildingCode2.ItemIndex > -1 then
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.ItemIndex]
  else stBuildingCode := '000';
  LoadAreaFloor(stBuildingCode);
  ShowAreaCode(stBuildingCode,'','');
end;

procedure TfmLocateCode.cmb_sBuildingCode2Change(Sender: TObject);
begin
  LoadAreaSearchFloor;
  if chk_ArearAuto.Checked then chk_ArearAutoClick(self);
end;

procedure TfmLocateCode.cmb_FloorCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_BuildingCode2.ItemIndex > -1 then
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.ItemIndex]
  else stBuildingCode := '000';
  if cmb_FloorCode2.ItemIndex > -1 then
    stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.ItemIndex]
  else stFloorCode := '000';
  ShowAreaCode(stBuildingCode,stFloorCode,'');
end;

procedure TfmLocateCode.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name = 'BuildingTab' then ShowBuildingCode('')
  else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    LoadFloorBuilding;
    ShowFloorCode('','');
  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    LoadAreaBuilding;
    LoadAreaFloor('000');
    ShowAreaCode('','','');
  end;

end;

procedure TfmLocateCode.sg_BuildingCodeClick(Sender: TObject);
var
  stSql : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  bResult : Boolean;
  TempAdoQuery : TADOQuery;
  stImage : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_BuildingCode.Text := cells[0,Row];
    ed_BuildingName.Text := cells[1,Row];
  end;

  MapJpg := TJpegImage.Create;
  MapStream := TMemoryStream.Create;

  stSql := ' select * from TB_LOCATION ' ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + ed_BuildingCode.Text + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      bResult := True;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then
      begin
        if DBType = 'MSSQL' then
        begin
          JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), imgBuilding);
        end else
        begin
          stImage := FindField('LO_CADIMAGE').AsString;
          if FileExists(stImage) then
            imgBuilding.Picture.LoadFromFile(stImage);
        end;
      end;
    end;

  Finally
    TempAdoQuery.Free;
    CoUninitialize;
    MapJpg.Free;
    MapStream.Free;
  End;
end;

procedure TfmLocateCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  if PageControl1.ActivePage.Name = 'BuildingTab' then
  begin
    with sg_BuildingCode do
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

    if chk_BuildingAuto.Checked then chk_BuildingAutoClick(self);
    ed_Buildingcode.SetFocus;
  end else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    with sg_FloorCode do
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
    if cmb_BuildingCode1.ItemIndex > 0 then cmb_sBuildingCode1.ItemIndex := cmb_BuildingCode1.ItemIndex;

    if chk_FloorAuto.Checked then chk_FloorAutoClick(self);
    ed_Floorcode.SetFocus;

  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    with sg_AreaCode do
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
    if cmb_BuildingCode2.ItemIndex > 0 then
    begin
      cmb_sBuildingCode2.ItemIndex := cmb_BuildingCode2.ItemIndex;
      LoadAreaSearchFloor;
      if cmb_FloorCode2.ItemIndex > 0 then cmb_sFloorCode2.ItemIndex := cmb_FloorCode2.ItemIndex;
    end;
    if chk_ArearAuto.Checked then chk_ArearAutoClick(self);
    ed_Areacode.SetFocus;
  end;
end;

procedure TfmLocateCode.btn_BuildingSearchClick(Sender: TObject);
begin
  if DBTYPE <> 'MSSQL' then
  begin
    if FileServerPath = '' then
    begin
      showmessage('MSSQL 서버가 아닌 데이터베이스는 파일서버를 등록하셔야 합니다.');
      Exit;
    end;
  end;
  RzOpenDialog1.Title:= FM901 + ' 도면 찾기';
  RzOpenDialog1.DefaultExt:= 'Jpg';
  RzOpenDialog1.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if RzOpenDialog1.Execute then
  begin
    ed_BuildingImg.Text :=  RzOpenDialog1.FileName;
    if FileExists(ed_BuildingImg.Text) then
    imgBuilding.Picture.LoadFromFile(ed_BuildingImg.Text);
  end;
end;

procedure TfmLocateCode.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
  if PageControl1.ActivePage.Name = 'BuildingTab' then
  begin
    ed_Buildingname.SetFocus;
  end else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    ed_Floorname.SetFocus;
  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    ed_Areaname.SetFocus;
  end;

end;

procedure TfmLocateCode.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  sBuildingCode : string;
  sFloorCode : string;
begin
  if PageControl1.ActivePage.Name = 'BuildingTab' then
  begin
    if Trim(ed_BuildingCode.Text) = '' then
    begin
      showmessage(FM901 + '가 없습니다.');
      ed_BuildingCode.SetFocus;
      exit;
    end;
    if Not IsDigit(ed_BuildingCode.Text) then
    begin
      showmessage(FM901 + '는 숫자만 기재하세요.');
      Exit;
    end;
    ed_BuildingCode.Text := FillZeroNumber(strtoint(ed_BuildingCode.Text),3);
    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_LOCATION(ed_BuildingCode.Text,'000','000',ed_BuildingName.Text,ed_Buildingimg.Text,'0')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_LOCATION(ed_BuildingCode.Text,'000','000',ed_BuildingName.Text,ed_Buildingimg.Text,'0');

    if bResult then ShowBuildingCode(ed_BuildingCode.Text)
    else showmessage('저장실패');
  end else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    if cmb_sBuildingCode1.itemIndex < 1 then
    begin
      showmessage(FM901 + '를 선택하세요.');
      Exit;
    end;
    if Trim(ed_FloorCode.Text) = '' then
    begin
      showmessage(FM911 + '가 없습니다.');
      ed_FloorCode.SetFocus;
      exit;
    end;
    if Not IsDigit(ed_FloorCode.Text) then
    begin
      showmessage(FM911 + '는 숫자만 기재하세요.');
      Exit;
    end;
    ed_FloorCode.Text := FillZeroNumber(strtoint(ed_FloorCode.Text),3);
    if cmb_sBuildingCode1.itemIndex < 0 then cmb_sBuildingCode1.itemIndex := 0;
    sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
    if sBuildingCode = '' then sBuildingCode := '000';

    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_LOCATION(sBuildingCode,ed_FloorCode.Text,'000',ed_FloorName.Text,ed_Floorimg.Text,'1')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_LOCATION(sBuildingCode,ed_FloorCode.Text,'000',ed_FloorName.Text,ed_Floorimg.Text,'1');

    if bResult then ShowFloorCode(sBuildingCode,ed_FloorCode.Text)
    else showmessage('저장실패');
  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    if cmb_sBuildingCode2.itemIndex < 1 then
    begin
      showmessage(FM901 + '를 선택하세요.');
      Exit;
    end;
    if cmb_sFloorCode2.itemIndex < 1 then
    begin
      showmessage(FM911 + '를 선택하세요.');
      Exit;
    end;
    if Trim(ed_AreaCode.Text) = '' then
    begin
      showmessage(FM921 + '가 없습니다.');
      ed_AreaCode.SetFocus;
      exit;
    end;
    if Not IsDigit(ed_AreaCode.Text) then
    begin
      showmessage(FM921 + '는 숫자만 기재하세요.');
      Exit;
    end;
    ed_AreaCode.Text := FillZeroNumber(strtoint(ed_AreaCode.Text),3);
    if cmb_sBuildingCode2.itemIndex < 0 then cmb_sBuildingCode2.itemIndex := 0;
    sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode2.itemIndex];
    if sBuildingCode = '' then sBuildingCode := '000';
    if cmb_sFloorCode2.itemIndex < 0 then cmb_sFloorCode2.itemIndex := 0;
    if sFloorCodeList.Count > 0 then
    begin
      sFloorCode := sFloorCodeList.Strings[cmb_sFloorCode2.itemIndex];
      if sFloorCode = '' then sFloorCode := '000';
    end else sFloorCode := '000';

    if UpperCase(State) = 'INSERT' then
      bResult := InsertTB_LOCATION(sBuildingCode,sFloorCode,ed_AreaCode.Text,ed_AreaName.Text,ed_Areaimg.Text,'2')
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_LOCATION(sBuildingCode,sFloorCode,ed_AreaCode.Text,ed_AreaName.Text,ed_Areaimg.Text,'2');

    if bResult then ShowAreaCode(sBuildingCode,sFloorCode,ed_AreaCode.text)
    else showmessage('저장실패');
  end;
end;

procedure TfmLocateCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  sBuildingCode : string;
  sFloorCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  if PageControl1.ActivePage.Name = 'BuildingTab' then
  begin
    bResult := DeleteTB_LOCATION(ed_BuildingCode.Text,'000','000','0');

    if bResult then ShowBuildingCode('')
    else showmessage('삭제실패');
  end else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
    if sBuildingCode = '' then
    begin
      showmessage(FM901 + '가 잘못 되었습니다.삭제불가!');
      Exit;
    end;
    bResult := DeleteTB_LOCATION(sBuildingCode,ed_FloorCode.Text,'000','1');

    if bResult then ShowFloorCode('','')
    else showmessage('삭제실패');
  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode2.itemIndex];
    if sBuildingCode = '' then
    begin
      showmessage(FM901 + '가 잘못 되었습니다.삭제불가!');
      Exit;
    end;
    sFloorCode := sFloorCodeList.Strings[cmb_sFloorCode2.itemIndex];
    if sFloorCode = '' then
    begin
      showmessage(FM911 + '가 잘못 되었습니다.삭제불가!');
      Exit;
    end;

    bResult := DeleteTB_LOCATION(sBuildingCode,sFloorCode,ed_AreaCode.Text,'2');

    if bResult then ShowAreaCode('','','')
    else showmessage('삭제실패');
  end;

end;

function TfmLocateCode.DeleteTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,aGubun:string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And LO_DONGCODE = ''' + aBuildingCode + '''';
  if (aFloorCode <> '000') and (aFloorCode <> '') then
    stSql := stSql + ' And LO_FLOORCODE = ''' + aFloorCode + '''';
  if (aAreaCode <> '000') and (aAreaCode <> '') then
    stSql := stSql + ' And LO_AREACODE = ''' + aAreaCode + '''';
  //stSql := stSql + ' AND LO_GUBUN = ''' + aGubun + ''' ';
  
  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmLocateCode.InsertTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,
aName,aFileName,aGubun :string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stImg : string;
begin

  result := False;
  stSql := ' Insert Into TB_LOCATION( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' LO_DONGCODE,';
  stSql := stSql + ' LO_FLOORCODE,';
  stSql := stSql + ' LO_AREACODE,';
  stSql := stSql + ' LO_NAME,';
  if FileExists(aFileName) then
  begin
    stSql := stSql + ' LO_CADIMAGE, ';
    stSql := stSql + ' LO_IMAGEUSE, ';
  end;
  stSql := stSql + ' LO_GUBUN )';
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aName  + ''',';
  if FileExists(aFileName) then
  begin
    stSql := stSql + ':PARAM_IMAGE,';
    stSql := stSql + '''Y'',';
  end;
  stSql := stSql + '''' + aGubun + '''';
  stSql := stSql + ')';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      if DBType = 'MSSQL' then
      begin
        if FileExists(aFileName) then
          Parameters.ParamByName( 'PARAM_IMAGE' ).LoadFromFile( aFileName, ftGraphic );
      end else
      begin
        if FileExists(aFileName) then
        begin
          if FileServerPath = '' then
          begin
            showmessage('파일서버 Path가 지정되지 않았습니다. 환경설정에서 파일서버 Path를 지정하세요.');
            Exit;
          end;
          if copy(FileServerPath,length(FileServerPath),1) = '\' then stImg := FileServerPath + aBuildingCode + aFloorCode + aAreaCode + '.jpg'
          else stImg := FileServerPath + '\' + aBuildingCode + aFloorCode + aAreaCode + '.jpg';
          if aFileName <> stImg then
            FileCtrl.CopyFiles(aFileName,stImg);
          Parameters.ParamByName( 'PARAM_IMAGE' ).Value := stImg;
        end;
      end;

      Try
        ExecSQL;
      Except
        Exit;
      End;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TfmLocateCode.UpdateTB_LOCATION(aBuildingCode,aFloorCode,aAreaCode,
aName,aFileName,aGubun :string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stImg : string;
begin
  result := False;
  stSql := ' Update TB_LOCATION set  ';
  stSql := stSql + ' LO_NAME = ''' + aName  + ''' ';
  if FileExists(aFileName) then
  begin
    stSql := stSql + ' ,LO_CADIMAGE = :PARAM_IMAGE, ';
    stSql := stSql + ' LO_IMAGEUSE = ''Y'' ';
  end;
  stSql := stSql + ' Where ';
  stSql := stSql + ' GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''' + aGubun + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      if DBType = 'MSSQL' then
      begin
        if FileExists(aFileName) then
          Parameters.ParamByName( 'PARAM_IMAGE' ).LoadFromFile( aFileName, ftGraphic );
      end else
      begin
        if FileExists(aFileName) then
        begin
          if FileServerPath = '' then
          begin
            showmessage('파일서버 Path가 지정되지 않았습니다. 환경설정에서 파일서버 Path를 지정하세요.');
            Exit;
          end;
          if copy(FileServerPath,length(FileServerPath),1) = '\' then stImg := FileServerPath + aBuildingCode + aFloorCode + aAreaCode + '.jpg'
          else stImg := FileServerPath + '\' + aBuildingCode + aFloorCode + aAreaCode + '.jpg';
          if aFileName <> stImg then
            FileCtrl.CopyFiles(aFileName,stImg);
          Parameters.ParamByName( 'PARAM_IMAGE' ).Value := stImg;
        end;
      end;
      Try
        ExecSQL;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

procedure TfmLocateCode.sg_FloorCodeClick(Sender: TObject);
var
  stSql : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  bResult : Boolean;
  nIndex : integer;
  TempAdoQuery : TADOQuery;
  stImage : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_FloorCode.Text := cells[0,Row];
    ed_FloorName.Text := cells[1,Row];
    nIndex := BuildingCodeList.IndexOf(cells[2,Row]);
    if nIndex > -1 then cmb_sBuildingCode1.ItemIndex := nIndex
    else cmb_sBuildingCode1.ItemIndex := 0;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;

    stSql := ' select * from TB_LOCATION ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND LO_DONGCODE = ''' + cells[2,Row] + ''' ';
    stSql := stSql + ' AND LO_FLOORCODE = ''' + cells[0,Row] + ''' ';
    stSql := stSql + ' AND LO_GUBUN = ''1'' ';

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

      bResult := True;
      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then
      begin
        if DBType = 'MSSQL' then
        begin
          JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), imgFloor);
        end else
        begin
          stImage := FindField('LO_CADIMAGE').AsString;
          if FileExists(stImage) then
            imgFloor.Picture.LoadFromFile(stImage);
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
    MapJpg.Free;
    MapStream.Free;
  End;
end;

procedure TfmLocateCode.btn_FloorSearchClick(Sender: TObject);
begin
  if DBTYPE <> 'MSSQL' then
  begin
    if FileServerPath = '' then
    begin
      showmessage('MSSQL 서버가 아닌 데이터베이스는 파일서버를 등록하셔야 합니다.');
      Exit;
    end;
  end;
  RzOpenDialog1.Title:= FM911 + ' 도면 찾기';
  RzOpenDialog1.DefaultExt:= 'Jpg';
  RzOpenDialog1.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if RzOpenDialog1.Execute then
  begin
    ed_FloorImg.Text :=  RzOpenDialog1.FileName;
    if FileExists(ed_FloorImg.Text) then
    imgFloor.Picture.LoadFromFile(ed_FloorImg.Text);
  end;
end;

procedure TfmLocateCode.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_BuildingCode1.ItemIndex > -1 then
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex]
  else stBuildingCode := '000';
  ShowFloorCode(stBuildingCode,'');
end;

procedure TfmLocateCode.sg_AreaCodeClick(Sender: TObject);
var
  stSql : string;
  MapJpg : TJpegImage;
  MapStream : TMemoryStream;
  BlobField : TBlobField;
  bResult : Boolean;
  nIndex : integer;
  TempAdoQuery :TADOQuery;
  stImage : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_AreaCode.Text := cells[0,Row];
    ed_AreaName.Text := cells[1,Row];
    nIndex := BuildingCodeList.IndexOf(cells[2,Row]);
    if nIndex > -1 then cmb_sBuildingCode2.ItemIndex := nIndex
    else cmb_sBuildingCode2.ItemIndex := 0;
    LoadAreaSearchFloor;
    nIndex := sFloorCodeList.IndexOf(cells[3,Row]);
    if nIndex > -1 then cmb_sFloorCode2.ItemIndex := nIndex
    else cmb_sFloorCode2.ItemIndex := 0;

    MapJpg := TJpegImage.Create;
    MapStream := TMemoryStream.Create;

    stSql := ' select * from TB_LOCATION ' ;
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND LO_DONGCODE = ''' + cells[2,Row] + ''' ';
    stSql := stSql + ' AND LO_FLOORCODE = ''' + cells[3,Row] + ''' ';
    stSql := stSql + ' AND LO_AREACODE = ''' + cells[0,Row] + ''' ';
    stSql := stSql + ' AND LO_GUBUN = ''2'' ';

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
      if RecordCount > 0 then
      begin
        if DBType = 'MSSQL' then
        begin
          JPEGLoadFromDB(FieldByName('LO_CADIMAGE'), imgArea);
        end else
        begin
          stImage := FindField('LO_CADIMAGE').AsString;
          if FileExists(stImage) then
            imgArea.Picture.LoadFromFile(stImage);
        end;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
    MapJpg.Free;
    MapStream.Free;
  End;
end;

procedure TfmLocateCode.btn_AreaSearchClick(Sender: TObject);
begin
  if DBTYPE <> 'MSSQL' then
  begin
    if FileServerPath = '' then
    begin
      showmessage('MSSQL 서버가 아닌 데이터베이스는 파일서버를 등록하셔야 합니다.');
      Exit;
    end;
  end;
  RzOpenDialog1.Title:= FM921 + ' 도면 찾기';
  RzOpenDialog1.DefaultExt:= 'Jpg';
  RzOpenDialog1.Filter := 'Jpg files (*.Jpg)|*.Jpg';
  if RzOpenDialog1.Execute then
  begin
    ed_AreaImg.Text :=  RzOpenDialog1.FileName;
    if FileExists(ed_AreaImg.Text) then
    imgArea.Picture.LoadFromFile(ed_AreaImg.Text);
  end;
end;

procedure TfmLocateCode.btn_ClsoeClick(Sender: TObject);
begin
  Close;
end;

procedure TfmLocateCode.FormClear;
begin
  //빌딩코드 폼 Clear
  ed_BuildingCode.Text := '';
  ed_BuildingName.Text := '';
  ed_Buildingimg.Text := '';
  imgBuilding.Picture.Graphic := nil;

  //층코드 폼 Clear
  cmb_sBuildingCode1.ItemIndex := 0;
  ed_Floorcode.Text := '';
  ed_Floorname.Text := '';
  imgFloor.Picture := nil;

  //구역코드 폼 Clear
  cmb_sBuildingCode2.ItemIndex := 0;
  cmb_sFloorCode2.ItemIndex := 0;
  ed_Areacode.Text := '';
  ed_Areaname.Text := '';
  imgArea.Picture := nil;


end;

procedure TfmLocateCode.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    //빌딩코드 폼
    sg_BuildingCode.Enabled := False; //클릭 못하게 막는다.
    ed_Buildingcode.Enabled := true;
    ed_Buildingname.Enabled  := true;
    chk_BuildingAuto.Enabled := True;
    btn_BuildingSearch.Enabled := True;

    //층코드 폼
    sg_FloorCode.Enabled := False;
    cmb_sBuildingCode1.Enabled := True;
    ed_Floorcode.Enabled := true;
    chk_FloorAuto.Enabled := True;
    ed_Floorname.Enabled  := true;
    btn_FloorSearch.Enabled := True;

    //구역코드 폼
    sg_AreaCode.Enabled := False;
    cmb_sBuildingCode2.Enabled := True;
    cmb_sFloorCode2.Enabled := True;
    ed_Areacode.Enabled := true;
    chk_ArearAuto.Enabled := True;
    ed_Areaname.Enabled  := true;
    btn_AreaSearch.Enabled := True;

  end else if upperCase(aState) = 'SEARCH' then
  begin
    //빌딩코드 폼
    sg_BuildingCode.Enabled := True; //클릭하도록 푼다.
    ed_BuildingCode.Enabled := False;
    ed_BuildingName.Enabled := False;
    chk_BuildingAuto.Enabled := False;
    btn_BuildingSearch.Enabled := False;

    //층코드 폼
    sg_FloorCode.Enabled := True;
    cmb_sBuildingCode1.Enabled := False;
    ed_Floorcode.Enabled := False;
    chk_FloorAuto.Enabled := False;
    ed_Floorname.Enabled  := False;
    btn_FloorSearch.Enabled := False;

    //구역코드 폼
    sg_AreaCode.Enabled := True;
    cmb_sBuildingCode2.Enabled := False;
    cmb_sFloorCode2.Enabled := False;
    ed_Areacode.Enabled := False;
    chk_ArearAuto.Enabled := False;
    ed_Areaname.Enabled  := False;
    btn_AreaSearch.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    //빌딩코드 폼
    sg_BuildingCode.Enabled := True; //클릭하도록 푼다.
    ed_BuildingCode.Enabled := False;
    ed_BuildingName.Enabled := False;
    chk_BuildingAuto.Enabled := False;
    btn_BuildingSearch.Enabled := False;

    //층코드 폼
    sg_FloorCode.Enabled := True;
    cmb_sBuildingCode1.Enabled := False;
    ed_Floorcode.Enabled := False;
    chk_FloorAuto.Enabled := False;
    ed_Floorname.Enabled  := False;
    btn_FloorSearch.Enabled := False;

    //구역코드 폼
    sg_AreaCode.Enabled := True;
    cmb_sBuildingCode2.Enabled := False;
    cmb_sFloorCode2.Enabled := False;
    ed_Areacode.Enabled := False;
    chk_ArearAuto.Enabled := False;
    ed_Areaname.Enabled  := False;
    btn_AreaSearch.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    //빌딩코드 폼
    sg_BuildingCode.Enabled := False; //클릭 못하게 막는다.
    ed_BuildingCode.Enabled := False;
    ed_BuildingName.Enabled := True;
    chk_BuildingAuto.Enabled := False;
    btn_BuildingSearch.Enabled := True;

    //층코드 폼
    sg_FloorCode.Enabled := False;
    cmb_sBuildingCode1.Enabled := False;
    ed_Floorcode.Enabled := False;
    chk_FloorAuto.Enabled := False;
    ed_Floorname.Enabled  := True;
    btn_FloorSearch.Enabled := True;

    //구역코드 폼
    sg_AreaCode.Enabled := False;
    cmb_sBuildingCode2.Enabled := False;
    cmb_sFloorCode2.Enabled := False;
    ed_Areacode.Enabled := False;
    chk_ArearAuto.Enabled := False;
    ed_Areaname.Enabled  := True;
    btn_AreaSearch.Enabled := True;
  end;
end;

procedure TfmLocateCode.ButtonEnable(aState: string);
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
    if IsInsertGrade then btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
    if PageControl1.ActivePage = BuildingTab then
    begin
      if ( BuildingGrade > 0 ) and (BuildingGrade < 4) then btn_Insert.Enabled := False;
    end else if PageControl1.ActivePage = FloorTab then
    begin
      if ( BuildingGrade > 1 ) and (BuildingGrade < 4) then btn_Insert.Enabled := False;
    end else if PageControl1.ActivePage = AreaTab then
    begin
      if ( BuildingGrade = 3) then btn_Insert.Enabled := False;
    end;
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
    if PageControl1.ActivePage = BuildingTab then
    begin
      if ( BuildingGrade > 0 ) and (BuildingGrade < 4) then
      begin
        btn_Insert.Enabled := False;
        btn_Update.Enabled := False;
        btn_Delete.Enabled := False;
      end;
    end else if PageControl1.ActivePage = FloorTab then
    begin
      if ( BuildingGrade > 1 ) and (BuildingGrade < 4) then
      begin
        btn_Insert.Enabled := False;
        btn_Update.Enabled := False;
        btn_Delete.Enabled := False;
      end;
    end else if PageControl1.ActivePage = AreaTab then
    begin
      if ( BuildingGrade = 3) then
      begin
        btn_Insert.Enabled := False;
        btn_Update.Enabled := False;
        btn_Delete.Enabled := False;
      end;
    end;
  end;
end;

procedure TfmLocateCode.btn_CancelClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if PageControl1.ActivePage.Name = 'BuildingTab' then ShowBuildingCode(ed_BuildingCode.text)
  else if PageControl1.ActivePage.Name  = 'FloorTab' then
  begin
    if cmb_sBuildingCode1.ItemIndex > -1 then
      stBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode1.ItemIndex]
    else stBuildingCode := '000';
    ShowFloorCode(stBuildingCode,ed_FloorCode.Text);
  end else if PageControl1.ActivePage.Name  = 'AreaTab' then
  begin
    if cmb_BuildingCode2.ItemIndex > -1 then
      stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.ItemIndex]
    else stBuildingCode := '000';
    if cmb_FloorCode2.ItemIndex > -1 then
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.ItemIndex]
    else stFloorCode := '000';

    ShowAreaCode(stBuildingCode,stFloorCode,ed_AreaCode.Text);
  end;

end;

procedure TfmLocateCode.FormShow(Sender: TObject);
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

  FormNameSet;
end;

procedure TfmLocateCode.ed_BuildingCodeChange(Sender: TObject);
begin
  if ed_BuildingCode.Text = '' then exit;
  if Not isDigit(ed_BuildingCode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;

end;

procedure TfmLocateCode.ed_FloorCodeChange(Sender: TObject);
begin
  if ed_FloorCode.Text = '' then exit;
  if Not isDigit(ed_FloorCode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;

end;

procedure TfmLocateCode.ed_AreaCodeChange(Sender: TObject);
begin
  if ed_AreaCode.Text = '' then exit;
  if Not isDigit(ed_AreaCode.Text) then
  begin
    showmessage('코드는 숫자로만 등록하세요');
    Exit;
  end;

end;

procedure TfmLocateCode.chk_BuildingAutoClick(Sender: TObject);
begin
  if chk_BuildingAuto.Checked then ed_BuildingCode.Text := GetAutoBuildingCode;
end;

procedure TfmLocateCode.chk_FloorAutoClick(Sender: TObject);
var
  sBuildingCode : string;
begin
  if cmb_sBuildingCode1.itemIndex < 0 then cmb_sBuildingCode1.itemIndex := 0;
  sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
  if sBuildingCode = '' then sBuildingCode := '000';
  if chk_FloorAuto.Checked then ed_FloorCode.Text := GetAutoFloorCode(sBuildingCode);
end;

procedure TfmLocateCode.chk_ArearAutoClick(Sender: TObject);
var
  sBuildingCode : string;
  sFloorCode : string;
begin
  if cmb_sBuildingCode2.itemIndex < 0 then cmb_sBuildingCode2.itemIndex := 0;
  sBuildingCode := BuildingCodeList.Strings[cmb_sBuildingCode2.itemIndex];
  if sBuildingCode = '' then sBuildingCode := '000';
  if cmb_sFloorCode2.itemIndex < 0 then cmb_sFloorCode2.itemIndex := 0;
  if sFloorCodeList.Count > 0 then
  begin
    sFloorCode := sFloorCodeList.Strings[cmb_sFloorCode2.itemIndex];
    if sFloorCode = '' then sFloorCode := '000';
  end else sFloorCode := '000';
  if chk_ArearAuto.Checked then ed_AreaCode.Text := GetAutoAreaCode(sBuildingCode,sFloorCode);
end;

function TfmLocateCode.GetAutoAreaCode(aBuildingCode,aFloorCode:string): string;
var
  stSql : string;
begin
  result := '001';
  stSql := 'select Max(LO_AREACODE) as LO_AREACODE from TB_LOCATION ';
  stSql := stSql + ' Where LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  with ADOAutoQuery do
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
    if FindField('LO_AREACODE').AsString = '' then Exit;
    result := FillZeroNumber(strtoint(FindField('LO_AREACODE').AsString) + 1,3);
  end;

end;

function TfmLocateCode.GetAutoBuildingCode: string;
var
  stSql : string;
begin
  result := '001';
  stSql := 'select Max(LO_DONGCODE) as LO_DONGCODE from TB_LOCATION ';
  stSql := stSql + ' Where LO_GUBUN = ''0'' ';

  with ADOAutoQuery do
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
    if FindField('LO_DONGCODE').AsString = '' then Exit;
    result := FillZeroNumber(strtoint(FindField('LO_DONGCODE').AsString) + 1,3);
  end;

end;

function TfmLocateCode.GetAutoFloorCode(aBuildingCode:string): string;
var
  stSql : string;
begin
  result := '001';
  stSql := 'select Max(LO_FLOORCODE) as LO_FLOORCODE from TB_LOCATION ';
  stSql := stSql + ' Where LO_DONGCODE = ''' + aBuildingCode + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  with ADOAutoQuery do
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
    if FindField('LO_FLOORCODE').AsString = '' then Exit;
    result := FillZeroNumber(strtoint(FindField('LO_FLOORCODE').AsString) + 1,3);
  end;
end;

procedure TfmLocateCode.cmb_sBuildingCode1Change(Sender: TObject);
begin
    if chk_FloorAuto.Checked then chk_FloorAutoClick(self);
end;

procedure TfmLocateCode.cmb_sFloorCode2Change(Sender: TObject);
begin
    if chk_ArearAuto.Checked then chk_ArearAutoClick(self);
end;

procedure TfmLocateCode.FormNameSet;
begin
  BuildingTab.Caption := FM901 + '관리';
  FloorTab.Caption := FM911 + '관리';
  AreaTab.Caption := FM921 + '관리';

  lb_sbuildingcode1.Caption := FM901;
  lb_buildingcode2.Caption := FM901;
  lb_sbuildingcode2.Caption := FM901;
  lb_buildingcode3.Caption := FM901;
  lb_sbuildingcode3.Caption := FM901;
  lb_sBuildingName1.Caption := FM902;
  lb_sFloorCode2.Caption := FM911;
  lb_FloorCode3.Caption := FM911;
  lb_sFloorCode3.Caption := FM911;
  lb_sFloorName2.Caption := FM912;
  lb_sAreaCode3.Caption := FM921;
  lb_sAreaName3.Caption := FM922;


  with sg_BuildingCode do
  begin
    Cells[0,0] := FM901;
    Cells[1,0] := FM902;
  end;

  with sg_FloorCode do
  begin
    Cells[0,0] := FM911;
    Cells[1,0] := FM912;
  end;

  with sg_AreaCode do
  begin
    Cells[0,0] := FM921;
    Cells[1,0] := FM922;
  end;

end;

end.


