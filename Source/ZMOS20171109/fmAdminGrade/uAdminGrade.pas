unit uAdminGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls,
  AdvEdit,ADODB, uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmAdminGrade = class(TfmASubForm)
    Panel2: TPanel;
    Splitter1: TSplitter;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    ed_sUserName: TEdit;
    sg_Admin: TAdvStringGrid;
    Panel3: TPanel;
    PageControl1: TPageControl;
    DepartTab: TTabSheet;
    DoorTab: TTabSheet;
    AlarmTab: TTabSheet;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    sg_GradeDepart: TAdvStringGrid;
    Panel4: TPanel;
    btn_DepartGradeInsert: TSpeedButton;
    btn_DepartGradeDelete: TSpeedButton;
    Panel5: TPanel;
    sg_Depart: TAdvStringGrid;
    Panel6: TPanel;
    sg_Door: TAdvStringGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    sg_GradeDoor: TAdvStringGrid;
    Panel9: TPanel;
    Panel10: TPanel;
    sg_Alarm: TAdvStringGrid;
    Panel11: TPanel;
    sg_GradeAlarm: TAdvStringGrid;
    Label18: TLabel;
    cmb_Grade: TComboBox;
    btn_Search: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btn_Close: TSpeedButton;
    btn_DoorGradeInsert: TSpeedButton;
    btn_DoorGradeDelete: TSpeedButton;
    btn_AlarmGradeInsert: TSpeedButton;
    btn_AlarmGradeDelete: TSpeedButton;
    FoodTab: TTabSheet;
    Panel12: TPanel;
    sg_GradeFood: TAdvStringGrid;
    Panel13: TPanel;
    btn_FoodGradeInsert: TSpeedButton;
    btn_FoodGradeDelete: TSpeedButton;
    Panel14: TPanel;
    sg_Food: TAdvStringGrid;
    CompanyTab: TTabSheet;
    Panel15: TPanel;
    sg_Company: TAdvStringGrid;
    Panel16: TPanel;
    btn_CompanyGradeInsert: TSpeedButton;
    btn_CompanyGradeDelete: TSpeedButton;
    Panel17: TPanel;
    sg_GradeCompany: TAdvStringGrid;
    Panel18: TPanel;
    Edit1: TEdit;
    ed_userid: TEdit;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    GroupBox5: TGroupBox;
    Label7: TLabel;
    cmb_Company2: TComboBox;
    Panel26: TPanel;
    GroupBox6: TGroupBox;
    Label5: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    cmb_AreaCode1: TComboBox;
    Panel27: TPanel;
    GroupBox8: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    cmb_BuildingCode2: TComboBox;
    cmb_FloorCode2: TComboBox;
    cmb_AreaCode2: TComboBox;
    Panel28: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cmb_BuildingCode3: TComboBox;
    cmb_FloorCode3: TComboBox;
    cmb_AreaCode3: TComboBox;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    JijumTab: TTabSheet;
    Panel38: TPanel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    cmb_Company1: TComboBox;
    Panel39: TPanel;
    sg_jijum: TAdvStringGrid;
    Panel40: TPanel;
    Panel41: TPanel;
    btn_JijumGradeInsert: TSpeedButton;
    btn_JijumGradeDelete: TSpeedButton;
    Panel42: TPanel;
    Panel43: TPanel;
    sg_Gradejijum: TAdvStringGrid;
    Panel44: TPanel;
    Label12: TLabel;
    cmb_Jijum2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure sg_AdminClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_GradeChange(Sender: TObject);
    procedure ed_sUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure sg_AdminCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_BuildingCode2Change(Sender: TObject);
    procedure cmb_FloorCode2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_Company2Change(Sender: TObject);
    procedure btn_DepartGradeDeleteClick(Sender: TObject);
    procedure btn_DepartGradeInsertClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure cmb_AreaCode2Change(Sender: TObject);
    procedure cmb_BuildingCode3Change(Sender: TObject);
    procedure cmb_FloorCode3Change(Sender: TObject);
    procedure cmb_AreaCode3Change(Sender: TObject);
    procedure cmb_Company1Change(Sender: TObject);
    procedure cmb_Jijum2Change(Sender: TObject);
  private
    { Private declarations }
    GradeCodeList : TStringList;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    sCompanyCodeList : TStringList;
    BuildingCodeList : TStringList;
    sBuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    sFloorCodeList : TStringList;
    sAreaCodeList : TStringList;

    CheckCount : integer;  //현재 체크되어 있는 사용자수

    procedure LoadGradeCode;
    procedure LoadCompanyCode;
    procedure LoadJijumCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure GridInit;
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    procedure CompanySearch;
    procedure JijumSearch;
    procedure DepartSearch;
    procedure DoorSearch;
    procedure AlarmSearch;
    procedure FoodSearch;
    procedure CompanyCodeSearch(sg:TAdvStringGrid);
    procedure CompanyGradeSearch(aUserID:string;sg:TAdvStringGrid);
    procedure JijumCodeSearch(aCompanyCode:string;sg:TAdvStringGrid);
    procedure JijumGradeSearch(aCompanyCode,aUserID:string;sg:TAdvStringGrid);
    procedure DepartCodeSearch(aCompanyCode,aJijumCode:string;sg:TAdvStringGrid);
    procedure DepartGradeSearch(aCompanyCode,aJijumCode,aUserID:string;sg:TAdvStringGrid);
    procedure DoorCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure DoorGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aUserID:string;sg:TAdvStringGrid);
    procedure AlarmCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure AlarmGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aUserID:string;sg:TAdvStringGrid);
    procedure FoodCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg:TAdvStringGrid);
    procedure FoodGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aUserID:string;sg:TAdvStringGrid);
    procedure InsertCompanyGrade;
    procedure InsertJijumGrade;
    procedure InsertDepartGrade;
    procedure InsertDoorGrade;
    procedure InsertAlarmGrade;
    procedure DeleteCompanyGrade;
    procedure DeleteJijumGrade;
    procedure DeleteDepartGrade;
    procedure DeleteDoorGrade;
    procedure DeleteAlarmGrade;
    procedure InsertFoodGrade;
    procedure DeleteFoodGrade;
    Function InsertTB_ADMINCOMPANY(stUserID,stCompanyCode,stJijumCode,stDepartCode,stGrade:string):Boolean;
    Function InsertTB_ADMINDOOR(stUserID,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stECUID,stDoorNo:string):Boolean;
    Function InsertTB_ADMINALARMDEVICE(stUserID,stBuildingCode,stFloorCode,stAreaCode,stAlarmNo:string):Boolean;
    Function InsertTB_ADMINFOOD(aUserID,aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aECUID,aDoorNo:string):Boolean;
    Function DeleteTB_ADMINALARMDEVICE(aAlarmNo,aUserID:string):Boolean;
    Function DeleteTB_ADMINCOMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aUserID:string):Boolean;
    Function DeleteTB_ADMINDOOR(aNodeNo,aECUID,aDoorNo,aUserID:string):Boolean;
    Function DeleteTB_ADMINFOOD(aNodeNo,aECUID,aDoorNo,aUserID:string):Boolean;
  public
    { Public declarations }
    WorkCode : integer;   //0 : 회사권한 1: 출입문 제어권한 2:방범문 제어권한
  end;

var
  fmAdminGrade: TfmAdminGrade;

implementation

uses
  uDataModule1,
  uLomosUtil;
{$R *.dfm}

procedure TfmAdminGrade.FormCreate(Sender: TObject);
begin
  GradeCodeList := TStringList.Create;
  GradeCodeList.Clear;
  CompanyCodeList := TStringList.Create;
  CompanyCodeList.Clear;
  JijumCodeList := TStringList.Create;
  JijumCodeList.Clear;
  sCompanyCodeList := TStringList.Create;
  sCompanyCodeList.Clear;
  BuildingCodeList := TStringList.Create;
  BuildingCodeList.Clear;
  sBuildingCodeList := TStringList.Create;
  sBuildingCodeList.Clear;
  FloorCodeList := TStringList.Create;
  FloorCodeList.Clear;
  AreaCodeList := TStringList.Create;
  AreaCodeList.Clear;
  sFloorCodeList := TStringList.Create;
  sFloorCodeList.Clear;
  sAreaCodeList := TStringList.Create;
  sAreaCodeList.Clear;
  CheckCount := 0;


end;

procedure TfmAdminGrade.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  GradeCodeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  sCompanyCodeList.Free;
  BuildingCodeList.Free;
  sBuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  sFloorCodeList.Free;
  sAreaCodeList.Free;
end;

procedure TfmAdminGrade.LoadGradeCode;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  cmb_Grade.Clear;
  GradeCodeList.Clear;
  stSql := 'select * from TB_GRADE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Grade.Items.Add('전체');
  GradeCodeList.Add('');
  cmb_Grade.ItemIndex := 0;

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
      cmb_Grade.Items.Add(FindField('GR_GARDENAME').AsString);
      GradeCodeList.Add(FindField('GR_GRADECODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.FormActivate(Sender: TObject);
begin
  Panel18.Caption := fmAdminGrade.Caption;
  LoadGradeCode;
  LoadCompanyCode;
  LoadBuildingCode(cmb_BuildingCode1);
  LoadBuildingCode(cmb_BuildingCode2);
  LoadBuildingCode(cmb_BuildingCode3);

  GridInit;
  if G_nSearchIndex = 0 then btn_SearchClick(self);
  if PageControl1.ActivePage.Name  = 'CompanyTab' then CompanySearch
  else if PageControl1.ActivePage.Name  = 'DepartTab' then DepartSearch
  else if PageControl1.ActivePage.Name  = 'DoorTab' then DoorSearch;

end;

procedure TfmAdminGrade.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  sg_Admin.RowCount := 2;
  for i:=0 to sg_Admin.ColCount - 1 do
  begin
    sg_Admin.Cells[i,1] := '';
  end;
  sg_Admin.SetCheckBoxState(0,0,false);
  ed_userid.Text := '';
  
  stSql := 'select * from TB_ADMIN ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AD_MASTER <> ''Y'' ';
  if cmb_Grade.ItemIndex > 0 then
    stSql := stSql + ' AND GR_GRADECODE = ''' + GradeCodeList.Strings[cmb_Grade.ItemIndex] + ''' ';
  if Trim(ed_sUserName.Text) <> '' then
    stSql := stSql + ' AND AD_USERNAME LIKE ''' + Trim(ed_sUserName.Text) + '%'' ';

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

    sg_Admin.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Admin do
      begin
        cells[0,nRow] := FindField('AD_USERID').AsString;
        cells[1,nRow] := FindField('AD_USERNAME').AsString;
        cells[2,nRow] := FindField('GR_GRADECODE').AsString;
        cells[3,nRow] := FindField('AD_USERPW').AsString;
        AddCheckBox(0,nRow,False,False);
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TAdvStringGrid).FixedRows) then
  begin
    //if ACOL = 0 then (Sender as TAdvStringGrid).AddCheckBox(0,0,False,False);

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

procedure TfmAdminGrade.GridInit;
var
  i:integer;
begin
  with sg_Admin do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_Company do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeCompany do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_Jijum do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeJijum do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_Depart do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeDepart do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 2 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_Door do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeDoor do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_Alarm do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeAlarm do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

  with sg_Food do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_GradeFood do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 1 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

  with sg_Admin do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '사용자아이디';
    Cells[1,0] := '사용자명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Company do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '회사코드';
    Cells[1,0] := '회사명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeCompany do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '회사코드';
    Cells[1,0] := '회사명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Jijum do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '지점코드';
    Cells[1,0] := '지점명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeJijum do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '지점코드';
    Cells[1,0] := '지점명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Depart do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '부서코드';
    Cells[1,0] := '부서명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeDepart do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '부서코드';
    Cells[1,0] := '부서명';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Door do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '출입문명칭';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeDoor do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '출입문명칭';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Alarm do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '경비구역명칭';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeAlarm do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '경비구역명칭';
    AddCheckBox(0,0,False,False);
  end;
  with sg_Food do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '식수구역명칭';
    AddCheckBox(0,0,False,False);
  end;
  with sg_GradeFood do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '식수구역명칭';
    AddCheckBox(0,0,False,False);
  end;

end;

procedure TfmAdminGrade.sg_AdminClick(Sender: TObject);
var
  bchkState : Boolean;
begin
  with (Sender as TAdvStringGrid) do
  begin
    GetCheckBoxState(0,Row, bchkState);
    if bchkState then ed_userid.Text := Cells[Col,Row]
    else ed_userid.Text := '';
  end;
  if PageControl1.ActivePage.Name  = 'CompanyTab' then  CompanySearch
  else if PageControl1.ActivePage.Name  = 'JijumTab' then    JijumSearch
  else if PageControl1.ActivePage.Name  = 'DepartTab' then    DepartSearch
  else if PageControl1.ActivePage.Name  = 'DoorTab' then    DoorSearch
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then  AlarmSearch
  else if PageControl1.ActivePage.Name  = 'FoodTab' then FoodSearch;
end;

procedure TfmAdminGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAdminGrade.cmb_GradeChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmAdminGrade.ed_sUserNameKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    if G_nSearchIndex = 0 then btn_SearchClick(self);
  end;
end;

procedure TfmAdminGrade.LoadCompanyCode;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  cmb_Company1.Clear;
  cmb_Company2.Clear;
  CompanyCodeList.Clear;

  stSql := 'select * from TB_COMPANY a ';
//  stSql := stSql + ' Inner Join TB_ADMINCOMPANY b ';
//  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
//  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
//  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
//  stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

  cmb_Company1.Items.Add('전체');
  cmb_Company2.Items.Add('전체');
  CompanyCodeList.Add('');
  cmb_Company1.ItemIndex := 0;
  cmb_Company2.ItemIndex := 0;

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
      cmb_Company1.Items.Add(FindField('CO_NAME').AsString);
      cmb_Company2.Items.Add(FindField('CO_NAME').AsString);
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.sg_AdminCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  bchkState : Boolean;
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    (Sender as TAdvStringGrid).GetCheckBoxState(0,0, bchkState);
    if bchkState then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,bchkState);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmAdminGrade.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  cmb_Box.Clear;
  BuildingCodeList.Clear;

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
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.LoadsBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  cmb_Box.Clear;
  sBuildingCodeList.Clear;

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
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

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
      sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  LoadAreaCode(stBuildingCode,'000',cmb_AreaCode1);
  stFloorCode := '';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);

end;

procedure TfmAdminGrade.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
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

    First;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('LO_NAME').AsString );
      FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.LoadAreaCode(aBuildingCode, aFloorCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
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
      AreaCodeList.Add(FindField('LO_AREACODE').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);

end;


procedure TfmAdminGrade.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmAdminGrade.cmb_BuildingCode2Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode2);
  LoadAreaCode(stBuildingCode,'000',cmb_AreaCode2);
  stFloorCode := '';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);

end;

procedure TfmAdminGrade.cmb_FloorCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode2);
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);

end;

procedure TfmAdminGrade.FormShow(Sender: TObject);
begin
//  PageControl1.ActivePageIndex := WorkCode;
  DoorTab.TabVisible := AccessUse;
  AlarmTab.TabVisible := PatrolUse;
  FoodTab.TabVisible := FoodUse;
  if FoodUse then PageControl1.ActivePage := FoodTab;
  if PatrolUse then PageControl1.ActivePage := AlarmTab;
  if AccessUse then PageControl1.ActivePage := DoorTab;

  if Not IsMaster then
  begin
    if IsInsertGrade then
    begin
      btn_CompanyGradeInsert.Enabled := True;
      btn_DepartGradeInsert.Enabled := True;
      btn_DoorGradeInsert.Enabled := True;
      btn_AlarmGradeInsert.Enabled := True;
      btn_FoodGradeInsert.Enabled := True;
    end else
    begin
      btn_CompanyGradeInsert.Enabled := False;
      btn_DepartGradeInsert.Enabled := False;
      btn_DoorGradeInsert.Enabled := False;
      btn_AlarmGradeInsert.Enabled := False;
      btn_FoodGradeInsert.Enabled := False;
    end;
    if IsDeleteGrade then
    begin
      btn_CompanyGradeDelete.Enabled := True;
      btn_DepartGradeDelete.Enabled := True;
      btn_DoorGradeDelete.Enabled := True;
      btn_AlarmGradeDelete.Enabled := True;
      btn_FoodGradeDelete.Enabled := True;
    end else
    begin
      btn_CompanyGradeDelete.Enabled := False;
      btn_DepartGradeDelete.Enabled := False;
      btn_DoorGradeDelete.Enabled := False;
      btn_AlarmGradeDelete.Enabled := False;
      btn_FoodGradeDelete.Enabled := False;
    end;
  end;
end;

procedure TfmAdminGrade.DepartSearch;
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  stCompanyCode := '';
  if cmb_Company2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company2.ItemIndex];
  stJijumCode := '';
  if cmb_Jijum2.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum2.ItemIndex],4,3);
  DepartCodeSearch(stCompanyCode,stJijumCode,sg_Depart);
  DepartGradeSearch(stCompanyCode,stJijumCode,ed_userid.Text,sg_GradeDepart);

end;

procedure TfmAdminGrade.DepartCodeSearch(aCompanyCode,aJijumCode: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if (aJijumCode <> '') and (aJijumCode <> '000') then
    stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[4,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.DepartGradeSearch(aCompanyCode,aJijumCode, aUserID: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery :TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  if Trim(aUserID) = '' then Exit;

  stSql := 'select a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,b.CO_NAME,b.CO_GUBUN ';
  stSql := stSql + ' from TB_ADMINCOMPANY a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3'' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if (aJijumCode <> '') and (aJijumCode <> '000') then
    stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[4,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.cmb_Company2Change(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_Company2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company2.ItemIndex];
  LoadJijumCode(stCompanyCode,cmb_Jijum2);
  DepartCodeSearch(stCompanyCode,'',sg_Depart);
  DepartGradeSearch(stCompanyCode,'',ed_userid.Text,sg_GradeDepart);

end;

procedure TfmAdminGrade.CheckBoxClick(Sender: TObject; ACol, ARow: Integer;
  State: Boolean);
var
  bchkState : Boolean;
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    (Sender as TAdvStringGrid).GetCheckBoxState(0,0, bchkState);
    AdvStrinGridSetAllCheck(Sender,bchkState);
  end;

end;

procedure TfmAdminGrade.btn_DepartGradeDeleteClick(Sender: TObject);
var
  i : integer;
  bChkState : Boolean;
  stCompanyCode,stBuildingCode,stFloorCode,stAreaCode : string;
  stJijumCode : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('사용자를 선택하여 주세요.');
    Exit;
  end;
  if CheckCount > 1 then
  begin
    showmessage('권한 삭제는 한명씩만 가능합니다. 사용자를 한명만 선택하여 주세요.');
    Exit;
  end;

  for i := 1 to sg_Admin.RowCount - 1 do
  begin
    sg_Admin.GetCheckBoxState(0,i, bchkState);
    if bChkState then
    begin
      ed_userid.Text := sg_Admin.Cells[0,i];
      break;
    end;
  end;

  if PageControl1.ActivePage.Name  = 'CompanyTab' then
  begin
    DeleteCompanyGrade;
    CompanyGradeSearch(ed_userid.Text,sg_GradeCompany);
  end else if PageControl1.ActivePage.Name  = 'JijumTab' then
  begin
    DeleteJijumGrade;
    stCompanyCode := '';
    if cmb_Company1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company1.ItemIndex];
    JijumGradeSearch(stCompanyCode,ed_userid.Text,sg_GradeJijum);
  end else if PageControl1.ActivePage.Name  = 'DepartTab' then
  begin
    DeleteDepartGrade;
    stCompanyCode := '';
    if cmb_Company2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company2.ItemIndex];
    stJijumCode := '';
    if cmb_Jijum2.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum2.ItemIndex],4,3);
    DepartGradeSearch(stCompanyCode,stJijumCode,ed_userid.Text,sg_GradeDepart);
  end else if PageControl1.ActivePage.Name  = 'DoorTab' then
  begin
    DeleteDoorGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
    DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);
  end else if PageControl1.ActivePage.Name  = 'AlarmTab' then
  begin
    DeleteAlarmGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
    AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);
  end else if PageControl1.ActivePage.Name  = 'FoodTab' then
  begin
    DeleteFoodGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode3.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode3.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode3.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
    FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);
  end;
end;

procedure TfmAdminGrade.btn_DepartGradeInsertClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode : string;
  stCompanyCode : string;
  stJijumCode : string;
begin
  if CheckCount < 1 then
  begin
    showmessage('사용자를 선택하여 주세요.');
    Exit;
  end;

  if PageControl1.ActivePage.Name  = 'CompanyTab' then
  begin
    InsertCompanyGrade;
    CompanyGradeSearch(ed_userid.Text,sg_GradeCompany);
  end else if PageControl1.ActivePage.Name  = 'JijumTab' then
  begin
    InsertJijumGrade;
    stCompanyCode := '';
    if cmb_Company1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company1.ItemIndex];
    JijumGradeSearch(stCompanyCode,ed_userid.Text,sg_GradeJijum);
  end else if PageControl1.ActivePage.Name  = 'DepartTab' then
  begin
    InsertDepartGrade;
    stCompanyCode := '';
    if cmb_Company2.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company2.ItemIndex];
    stJijumCode := '';
    if cmb_Jijum2.ItemIndex > 0 then stJijumCode := JijumCodeList.Strings[cmb_Jijum2.ItemIndex];
    DepartGradeSearch(stCompanyCode,stJijumCode,ed_userid.Text,sg_GradeDepart);
  end else if PageControl1.ActivePage.Name  = 'DoorTab' then
  begin
    InsertDoorGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
    DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);
  end else if PageControl1.ActivePage.Name  = 'AlarmTab' then
  begin
    InsertAlarmGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
    AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);
  end else if PageControl1.ActivePage.Name  = 'FoodTab' then
  begin
    InsertFoodGrade;
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode3.itemIndex];
    stFloorCode := '';
    if cmb_FloorCode3.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode3.itemIndex];
    stAreaCode := '';
    if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
    FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);
  end;

end;

procedure TfmAdminGrade.AlarmSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);

  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);

end;

procedure TfmAdminGrade.DoorSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);

  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);

//
end;


procedure TfmAdminGrade.DoorCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select * from TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';

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

    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('DO_DOORNO').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        cells[5,nRow] := FindField('LO_DONGCODE').AsString;
        cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[7,nRow] := FindField('LO_AREACODE').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage.Name  = 'CompanyTab' then CompanySearch
  else if PageControl1.ActivePage.Name  = 'JijumTab' then
  begin
    LoadCompanyCode;
    JijumSearch;
  end else if PageControl1.ActivePage.Name  = 'DepartTab' then
  begin
    LoadCompanyCode;
    LoadJijumCode('',cmb_Jijum2);
    DepartSearch;
  end else if PageControl1.ActivePage.Name  = 'DoorTab' then DoorSearch
  else if PageControl1.ActivePage.Name  = 'AlarmTab' then    AlarmSearch
  else if PageControl1.ActivePage.Name  = 'FoodTab' then    FoodSearch;
end;

procedure TfmAdminGrade.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];
  DoorCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Door);
  DoorGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeDoor);
end;

procedure TfmAdminGrade.DoorGradeSearch(aBuildingCode, aFloorCode,
  aAreaCode, aUserID: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  if Trim(aUserID) = '' then Exit;

  stSql := 'select b.DO_DOORNONAME,a.DO_DOORNO,a.AC_NODENO,a.AC_MCUID,a.AC_ECUID ';
  stSql := stSql + ' from TB_ADMINDOOR a ';
  stSql := stSql + ' Inner Join TB_DOOR b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.DO_DOORNO = b.DO_DOORNO  ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('DO_DOORNONAME').AsString;
        cells[1,nRow] := FindField('DO_DOORNO').AsString;
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.AlarmCodeSearch(aBuildingCode, aFloorCode,
  aAreaCode: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select a.AR_NAME,a.AC_NODENO,a.AC_ECUID,a.AR_AREANO,';
  stSql := stSql + ' b.LO_DONGCODE,b.LO_FLOORCODE,b.LO_AREACODE from TB_ARMAREA a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AR_USE = ''Y'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE = ''' + aAreaCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AR_NAME').AsString;
        cells[1,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger);
        //cells[2,nRow] := FindField('AC_NODENO').AsString;
        cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        cells[5,nRow] := FindField('LO_DONGCODE').AsString;
        cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[7,nRow] := FindField('LO_AREACODE').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.AlarmGradeSearch(aBuildingCode, aFloorCode,
  aAreaCode, aUserID: string; sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  if Trim(aUserID) = '' then Exit;

  stSql := 'select b.AR_NAME,b.AC_NODENO,b.AC_ECUID,b.AR_AREANO ';
  stSql := stSql + ' from TB_ADMINALARMAREA a ';
  stSql := stSql + ' Inner Join TB_ARMAREA b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID  ';
  stSql := stSql + ' AND a.AR_AREANO = b.AR_AREANO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AR_NAME').AsString;
        cells[1,nRow] := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString + inttostr(FindField('AR_AREANO').AsInteger);
        cells[2,nRow] := FindField('AC_NODENO').AsString;
        //cells[3,nRow] := FindField('AC_MCUID').AsString;
        cells[4,nRow] := FindField('AC_ECUID').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.cmb_AreaCode2Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode2.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode2.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode2.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode2.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex];
  AlarmCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Alarm);
  AlarmGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeAlarm);

end;

procedure TfmAdminGrade.InsertAlarmGrade;
var
  UserLoop,AlarmLoop : integer;
  bchkState : Boolean;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stAlarmNo : string;
  stUserID : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for AlarmLoop := 1 to sg_Alarm.RowCount - 1 do
      begin
        sg_Alarm.GetCheckBoxState(0,AlarmLoop, bchkState);
        if bChkState then //경비구역이 체크 되어 있으면 해당 경비구역 Insert;
        begin
          stBuildingCode := sg_Alarm.Cells[5,AlarmLoop];
          stFloorCode := sg_Alarm.Cells[6,AlarmLoop];
          stAreaCode  := sg_Alarm.Cells[7,AlarmLoop];
          stAlarmNo := sg_Alarm.Cells[1,AlarmLoop];
          InsertTB_ADMINALARMDEVICE(stUserID,stBuildingCode,stFloorCode,stAreaCode,stAlarmNo);
        end;
      end;
    end;
  end;
end;

procedure TfmAdminGrade.InsertDepartGrade;
var
  UserLoop,DepartLoop : integer;
  bchkState : Boolean;
  stUserID,stCompanyCode,stJijumCode,stDepartCode,stGrade : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for DepartLoop := 1 to sg_Depart.RowCount - 1 do
      begin
        sg_Depart.GetCheckBoxState(0,DepartLoop, bchkState);
        if bChkState then //부서가 체크 되어 있으면 해당 사람 Insert;
        begin
          stCompanyCode := sg_Depart.Cells[2,DepartLoop];
          stJijumCode := sg_Depart.Cells[3,DepartLoop];
          stDepartCode := sg_Depart.Cells[0,DepartLoop];
          stGrade  := sg_Depart.Cells[4,DepartLoop];
          InsertTB_ADMINCOMPANY(stUserID,stCompanyCode,stJijumCode,stDepartCode,stGrade);
        end;
      end;
    end;
  end;
//
end;

procedure TfmAdminGrade.InsertDoorGrade;
var
  UserLoop,DoorLoop : integer;
  bchkState : Boolean;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stNodeNo,stECUID,stDoorNo : string;
  stUserID : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for DoorLoop := 1 to sg_Door.RowCount - 1 do
      begin
        sg_Door.GetCheckBoxState(0,DoorLoop, bchkState);
        if bChkState then //출입문이 체크 되어 있으면 해당 출입문 Insert;
        begin
          stBuildingCode := sg_Door.Cells[5,DoorLoop];
          stFloorCode := sg_Door.Cells[6,DoorLoop];
          stAreaCode  := sg_Door.Cells[7,DoorLoop];
          stNodeNo := sg_Door.Cells[2,DoorLoop];
          stECUID := sg_Door.Cells[4,DoorLoop];
          stDoorNo := sg_Door.Cells[1,DoorLoop];
          if Trim(stBuildingCode) = '' then stBuildingCode := '000';
          if Trim(stFloorCode) = '' then stFloorCode := '000';
          if Trim(stAreaCode) = '' then stAreaCode := '000';
          InsertTB_ADMINDOOR(stUserID,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stECUID,stDoorNo);
        end;
      end;
    end;
  end;
end;

function TfmAdminGrade.InsertTB_ADMINCOMPANY(stUserID, stCompanyCode,
  stJijumCode,stDepartCode, stGrade: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ADMINCOMPANY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_GUBUN,';
  stSql := stSql + ' AD_UPDATETIME,' ;
  stSql := stSql + ' AD_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + stUserID + ''',';
  stSql := stSql + '''' + stCompanyCode + ''',';
  stSql := stSql + '''' + stJijumCode + ''',';
  stSql := stSql + '''' + stDepartCode + ''',';
  stSql := stSql + '''' + stGrade + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmAdminGrade.InsertTB_ADMINDOOR(stUserID, stBuildingCode,
  stFloorCode, stAreaCode, stNodeNo, stECUID,
  stDoorNo: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ADMINDOOR( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' DO_DOORNO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' AD_UPDATETIME,' ;
  stSql := stSql + ' AD_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + stUserID + ''',';
  stSql := stSql + stNodeNo + ',';
  stSql := stSql + '''' + stDoorNo + ''',';
  stSql := stSql + '''' + stECUID + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmAdminGrade.InsertTB_ADMINALARMDEVICE(stUserID, stBuildingCode,
  stFloorCode, stAreaCode, stAlarmNo: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ADMINALARMAREA( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' AR_AREANO,';
  stSql := stSql + ' AD_UPDATETIME,' ;
  stSql := stSql + ' AD_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + stUserID + ''',';
  stSql := stSql + inttostr(strtoint(copy(stAlarmNo,1,3))) + ',';
  stSql := stSql + '''' + copy(stAlarmNo,4,2) + ''',';
  stSql := stSql + '''' + FillZeroStrNum(copy(stAlarmNo,6,1),2) + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

procedure TfmAdminGrade.DeleteAlarmGrade;
var
  AlarmLoop : integer;
  bchkState : Boolean;
  stAlarmNo : string;
begin
    for AlarmLoop := 1 to sg_GradeAlarm.RowCount - 1 do
    begin
      sg_GradeAlarm.GetCheckBoxState(0,AlarmLoop, bchkState);
      if bChkState then //방범구역가 체크 되어 있으면 해당 권한 삭제
      begin
        stAlarmNo  := sg_GradeAlarm.Cells[1,AlarmLoop];
        DeleteTB_ADMINALARMDEVICE(stAlarmNo,Trim(ed_Userid.Text));
      end;
    end;

end;

procedure TfmAdminGrade.DeleteDepartGrade;
var
  DepartLoop : integer;
  bchkState : Boolean;
  stCompanyCode,stDepartCode,stGubun : string;
  stJijumCode : string;
begin
    for DepartLoop := 1 to sg_GradeDepart.RowCount - 1 do
    begin
      sg_GradeDepart.GetCheckBoxState(0,DepartLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stCompanyCode  := sg_GradeDepart.Cells[2,DepartLoop];
        stJijumCode := sg_GradeDepart.Cells[3,DepartLoop];
        stDepartCode   := sg_GradeDepart.Cells[0,DepartLoop];
        stGubun := sg_GradeDepart.Cells[4,DepartLoop];
        DeleteTB_ADMINCOMPANY(stCompanyCode,stJijumCode,stDepartCode,stGubun,Trim(ed_Userid.Text));
      end;
    end;
end;

procedure TfmAdminGrade.DeleteDoorGrade;
var
  DoorLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNo : string;
begin
    for DoorLoop := 1 to sg_GradeDoor.RowCount - 1 do
    begin
      sg_GradeDoor.GetCheckBoxState(0,DoorLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := sg_GradeDoor.Cells[2,DoorLoop];
        stECUID  := sg_GradeDoor.Cells[4,DoorLoop];
        stDoorNo   := sg_GradeDoor.Cells[1,DoorLoop];
        DeleteTB_ADMINDOOR(stNodeNo,stECUID,stDoorNo,Trim(ed_Userid.Text));
      end;
    end;
end;

function TfmAdminGrade.DeleteTB_ADMINALARMDEVICE(
  aAlarmNo,aUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ADMINALARMAREA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aAlarmNo,1,3))) ;
  stSql := stSql + ' AND AC_ECUID = ''' + copy(aAlarmNo,4,2) + ''' ';
  stSql := stSql + ' AND AR_AREANO = ''' + FillZeroStrNum(copy(aAlarmNo,6,1),2) + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  Result := True;
end;

function TfmAdminGrade.DeleteTB_ADMINCOMPANY(aCompanyCode,aJijumCode, aDepartCode,aGubun,
  aUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ADMINCOMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  Result := True;
end;

function TfmAdminGrade.DeleteTB_ADMINDOOR(aNodeNo, aECUID, aDoorNo,
  aUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ADMINDOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  Result := True;
end;

procedure TfmAdminGrade.FoodSearch;
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode3.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode3.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode3.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);

end;

procedure TfmAdminGrade.FoodCodeSearch(aBuildingCode,aFloorCode,aAreaCode:string;sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select * from TB_FOOD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';

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
        cells[5,nRow] := FindField('LO_DONGCODE').AsString;
        cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[7,nRow] := FindField('LO_AREACODE').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.FoodGradeSearch(aBuildingCode,aFloorCode,aAreaCode,aUserID: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  if Trim(aUserID) = '' then Exit;

  stSql := 'select b.FO_NAME,b.AC_NODENO,b.AC_MCUID,b.AC_ECUID ,b.FO_DOORNO';
  stSql := stSql + ' from TB_ADMINFOOD a ';
  stSql := stSql + ' Inner Join TB_FOOD b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO  ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + ' AND a.FO_DOORNO = b.FO_DOORNO ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then
    stSql := stSql + ' AND b.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then
    stSql := stSql + ' AND b.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then
    stSql := stSql + ' AND b.LO_AREACODE = ''' + aAreaCode + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with DataModule1.GetObject.ADOTmpQuery do
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
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.DeleteFoodGrade;
var
  FoodLoop : integer;
  bchkState : Boolean;
  stNodeNo,stECUID,stDoorNo : string;
begin
    for FoodLoop := 1 to sg_GradeFood.RowCount - 1 do
    begin
      sg_GradeFood.GetCheckBoxState(0,FoodLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stNodeNo  := sg_GradeFood.Cells[1,FoodLoop];
        stECUID  := sg_GradeFood.Cells[3,FoodLoop];
        stDoorNo := sg_GradeFood.Cells[4,FoodLoop];
        DeleteTB_ADMINFOOD(stNodeNo,stECUID,stDoorNo,Trim(ed_Userid.Text));
      end;
    end;

end;

procedure TfmAdminGrade.InsertFoodGrade;
var
  UserLoop,FoodLoop : integer;
  bchkState : Boolean;
  stBuildingCode,stFloorCode,stAreaCode : string;
  stNodeNo,stECUID,stDoorNo : string;
  stUserID : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for FoodLoop := 1 to sg_Food.RowCount - 1 do
      begin
        sg_Food.GetCheckBoxState(0,FoodLoop, bchkState);
        if bChkState then //경비구역이 체크 되어 있으면 해당 경비구역 Insert;
        begin
          stBuildingCode := sg_Food.Cells[5,FoodLoop];
          stFloorCode := sg_Food.Cells[6,FoodLoop];
          stAreaCode  := sg_Food.Cells[7,FoodLoop];
          stNodeNo := sg_Food.Cells[1,FoodLoop];
          stECUID := sg_Food.Cells[3,FoodLoop];
          stDoorNo := sg_Food.Cells[4,FoodLoop];
          InsertTB_ADMINFOOD(stUserID,stBuildingCode,stFloorCode,stAreaCode,stNodeNo,stECUID,stDoorNo);
        end;
      end;
    end;
  end;
end;

function TfmAdminGrade.InsertTB_ADMINFOOD(aUserID, aBuildingCode,
  aFloorCode, aAreaCode, aNodeNo, aECUID,aDoorNo: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ADMINFOOD( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' FO_DOORNO,';
  stSql := stSql + ' AD_UPDATETIME,' ;
  stSql := stSql + ' AD_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aUserID + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aECUID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;

  end;

  result := True;
end;

function TfmAdminGrade.DeleteTB_ADMINFOOD(aNodeNo, aECUID,aDoorNo,
  aUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ADMINFOOD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  with DataModule1.GetObject.ADOExecQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      ExecSQL;
    Except
      Exit;
    End;
  end;
  Result := True;
end;

procedure TfmAdminGrade.CompanySearch;
begin
  CompanyCodeSearch(sg_Company);
  CompanyGradeSearch(ed_userid.Text,sg_GradeCompany);

end;

procedure TfmAdminGrade.CompanyCodeSearch(sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  
end;

procedure TfmAdminGrade.CompanyGradeSearch(aUserID: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  if Trim(aUserID) = '' then Exit;

  stSql := 'select a.CO_COMPANYCODE,b.CO_NAME,b.CO_GUBUN ';
  stSql := stSql + ' from TB_ADMINCOMPANY a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1'' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.InsertCompanyGrade;
var
  UserLoop,CompanyLoop : integer;
  bchkState : Boolean;
  stUserID,stCompanyCode,stDepartCode,stGrade : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for CompanyLoop := 1 to sg_Company.RowCount - 1 do
      begin
        sg_Company.GetCheckBoxState(0,CompanyLoop, bchkState);
        if bChkState then //부서가 체크 되어 있으면 해당 사람 Insert;
        begin
          stCompanyCode := sg_Company.Cells[0,CompanyLoop];
          stGrade  := sg_Company.Cells[2,CompanyLoop];
          InsertTB_ADMINCOMPANY(stUserID,stCompanyCode,'000','000',stGrade);
        end;
      end;
    end;
  end;

end;

procedure TfmAdminGrade.DeleteCompanyGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stCompanyCode,stGUBUN : string;
begin
    for CompanyLoop := 1 to sg_GradeCompany.RowCount - 1 do
    begin
      sg_GradeCompany.GetCheckBoxState(0,CompanyLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stCompanyCode  := sg_GradeCompany.Cells[0,CompanyLoop];
        stGUBUN := sg_GradeCompany.Cells[2,CompanyLoop];
        DeleteTB_ADMINCOMPANY(stCompanyCode,'000','000',stGUBUN,Trim(ed_Userid.Text));
      end;
    end;
end;

procedure TfmAdminGrade.cmb_BuildingCode3Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode3.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode3);
  LoadAreaCode(stBuildingCode,'000',cmb_AreaCode3);
  stFloorCode := '';
  if cmb_FloorCode3.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode3.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);

end;

procedure TfmAdminGrade.cmb_FloorCode3Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode3.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode3.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode3);
  stAreaCode := '';
  if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);

end;

procedure TfmAdminGrade.cmb_AreaCode3Change(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode:string;
begin
  stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode3.itemIndex];
  stFloorCode := '';
  if cmb_FloorCode3.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode3.itemIndex];
  stAreaCode := '';
  if cmb_AreaCode3.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode3.itemIndex];
  FoodCodeSearch(stBuildingCode,stFloorCode,stAreaCode,sg_Food);
  FoodGradeSearch(stBuildingCode,stFloorCode,stAreaCode,ed_Userid.text,sg_GradeFood);

end;

procedure TfmAdminGrade.cmb_Company1Change(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_Company1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company1.ItemIndex];
  JijumCodeSearch(stCompanyCode,sg_Jijum);
  JijumGradeSearch(stCompanyCode,ed_userid.Text,sg_GradeJijum);

end;

procedure TfmAdminGrade.JijumCodeSearch(aCompanyCode: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);
        
        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.JijumGradeSearch(aCompanyCode, aUserID: string;
  sg: TAdvStringGrid);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery :TADOQuery;
begin
  sg.RowCount := 2;
  sg.RemoveCheckBox(0,1);
  for i:= 0 to sg.ColCount - 1 do
  begin
    sg.Cells[i,1] := '';
  end;
  sg.SetCheckBoxState(0,0,False);
  
  if Trim(aUserID) = '' then Exit;

  stSql := 'select a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,b.CO_NAME,b.CO_GUBUN ';
  stSql := stSql + ' from TB_ADMINCOMPANY a ';
  stSql := stSql + ' Inner Join TB_COMPANY b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2'' ';
  if (aCompanyCode <> '') and (aCompanyCode <> '000') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

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
    with sg do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[3,nRow] := FindField('CO_GUBUN').AsString;
        AddCheckBox(0,nRow,False,False);

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.JijumSearch;
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_Company1.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company1.ItemIndex];
  JijumCodeSearch(stCompanyCode,sg_Jijum);
  JijumGradeSearch(stCompanyCode,ed_userid.Text,sg_GradeJijum);

end;

procedure TfmAdminGrade.LoadJijumCode(aCompanyCode:string;cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  cmb_Box.Clear;
  JijumCodeList.Clear;

  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2''';
  if (aCompanyCode = '') or (aCompanyCode = '000') then Exit;
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + '''';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by CO_COMPANYCODE,CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by CO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  JijumCodeList.Add('');
  cmb_Box.ItemIndex := 0;

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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdminGrade.cmb_Jijum2Change(Sender: TObject);
begin
  DepartSearch;
end;

procedure TfmAdminGrade.DeleteJijumGrade;
var
  DepartLoop : integer;
  bchkState : Boolean;
  stCompanyCode,stJijumCode,stGubun : string;
begin
    for DepartLoop := 1 to sg_GradeJijum.RowCount - 1 do
    begin
      sg_GradeJijum.GetCheckBoxState(0,DepartLoop, bchkState);
      if bChkState then //부서코드가 체크 되어 있으면 해당 권한 삭제
      begin
        stCompanyCode  := sg_GradeJijum.Cells[2,DepartLoop];
        stJijumCode   := sg_GradeJijum.Cells[0,DepartLoop];
        stGubun := sg_GradeJijum.Cells[3,DepartLoop];
        DeleteTB_ADMINCOMPANY(stCompanyCode,stJijumCode,'000',stGubun,Trim(ed_Userid.Text));
      end;
    end;
end;

procedure TfmAdminGrade.InsertJijumGrade;
var
  UserLoop,DepartLoop : integer;
  bchkState : Boolean;
  stUserID,stCompanyCode,stJijumCode,stDepartCode,stGrade : string;
begin
  for UserLoop := 1 to sg_Admin.RowCount - 1 do   //체크되어 있는 사용자 모두를 인서트 시킴
  begin
    sg_Admin.GetCheckBoxState(0,UserLoop, bchkState);
    if bchkState then  //체크 되어 있으면 권한 등록
    begin
      stUserID := sg_Admin.Cells[0,UserLoop];
      for DepartLoop := 1 to sg_Jijum.RowCount - 1 do
      begin
        sg_Jijum.GetCheckBoxState(0,DepartLoop, bchkState);
        if bChkState then //부서가 체크 되어 있으면 해당 사람 Insert;
        begin
          stCompanyCode := sg_Jijum.Cells[2,DepartLoop];
          stJijumCode := sg_Jijum.Cells[0,DepartLoop];
          stGrade  := sg_Jijum.Cells[3,DepartLoop];
          InsertTB_ADMINCOMPANY(stUserID,stCompanyCode,stJijumCode,'000',stGrade);
        end;
      end;
    end;
  end;
end;

end.
