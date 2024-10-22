unit uAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmAdmin = class(TfmASubForm)
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel4: TPanel;
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    Label2: TLabel;
    ed_sUserName: TEdit;
    Panel2: TPanel;
    sg_Admin: TAdvStringGrid;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    Label3: TLabel;
    ed_Userid: TEdit;
    ed_UserName: TEdit;
    ed_UserPw: TEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    btn_CompanyGrade: TSpeedButton;
    chk_Master: TCheckBox;
    cmb_Grade: TComboBox;
    cmb_companyGrade: TComboBox;
    GroupBox3: TGroupBox;
    lb_CompanyName: TLabel;
    lb_JijumName: TLabel;
    lb_DepartName: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    Panel12: TPanel;
    Label6: TLabel;
    cmb_Building: TComboBox;
    btn_Building: TSpeedButton;
    lb_BuildingCode: TLabel;
    cmb_AdminBuildingCode: TComboBox;
    lb_FloorCode: TLabel;
    cmb_AdminFloorCode: TComboBox;
    cmb_AdminAreaCode: TComboBox;
    lb_AreaCode: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_AdminClick(Sender: TObject);
    procedure ed_sUserNameKeyPress(Sender: TObject; var Key: Char);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chk_MasterClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure btn_CompanyGradeClick(Sender: TObject);
    procedure cmb_companyGradeChange(Sender: TObject);
    procedure Panel3Resize(Sender: TObject);
    procedure cmb_BuildingChange(Sender: TObject);
    procedure btn_BuildingClick(Sender: TObject);
    procedure cmb_AdminBuildingCodeChange(Sender: TObject);
    procedure cmb_AdminFloorCodeChange(Sender: TObject);
  private
    { Private declarations }
    GradeCodeList : TStringList;
    State : string;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList : TStringList;
    bCompanyGrade : Boolean;

    procedure FormNameSet;
    procedure LoadCompanyCode(cmb_Box:TComboBox);
    procedure LoadJijumCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure LoadDepartCode(aCompanyCode,aJijumCode:string;cmb_Box:TComboBox);
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure LoadGradeCode;
    procedure AdminSearch(aCode,aUserName:string);
    Function InsertTB_Admin(auserid,ausername,auserPw,aGradeCode,aMaster,
                            aCompanyCode,aJijumCode,aDepartCode,aBuildingGrade,
                            aDongCode,aFloorCode,aAreaCode:string):Boolean;
    Function UpdateTB_Admin(auserid,ausername,auserPw,aGradeCode,aMaster,
                            aCompanyCode,aJijumCode,aDepartCode,aBuildingGrade,
                            aDongCode,aFloorCode,aAreaCode:string):Boolean;
    Function DeleteTB_Admin(auserid : string) : Boolean;
    Function DeleteTB_AdminGrade(aUserID:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAdmin: TfmAdmin;

implementation

uses
uDataModule1,
uLomosUtil,
uCompanyGrade, uAdminGrade, uAdminDoorGrade,
uDBFunction;

{$R *.dfm}

{ TfmAdmin }

procedure TfmAdmin.LoadGradeCode;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  GradeCodeList.Clear;
  cmb_Grade.Clear;
  GradeCodeList.Add('');
  cmb_Grade.Items.Add('');

  stSql := ' select * from TB_GRADE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + '''';

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

    cmb_Grade.ItemIndex := 0;

    if Recordcount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      GradeCodeList.Add(FindField('GR_GRADECODE').AsString);
      cmb_Grade.Items.Add(FindField('GR_GARDENAME').AsString);
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdmin.FormCreate(Sender: TObject);
begin
  GradeCodeList := TStringList.Create;
  
//  sg_Admin.OnDrawCell:=StringGrideDrawCell;

  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  
  BuildingCodeList := TStringList.Create;
  FloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;

end;

procedure TfmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GradeCodeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;

end;

procedure TfmAdmin.FormActivate(Sender: TObject);
var
  stBuildingCode,stFloorCode : string;
begin
  Panel12.Caption := fmAdmin.Caption;
  LoadCompanyCode(cmb_Company);
  LoadJijumCode('',cmb_Jijum);
  LoadDepartCode('','',cmb_Depart);

  LoadBuildingCode(cmb_AdminBuildingCode);
  stBuildingCode := '';
  if cmb_AdminBuildingCode.ItemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_AdminBuildingCode.ItemIndex];
  LoadFloorCode(stBuildingCode,cmb_AdminFloorCode);
  stFloorCode := '';
  if cmb_AdminFloorCode.ItemIndex > -1 then stFloorCode := copy(FloorCodeList.Strings[cmb_AdminFloorCode.ItemIndex],1,3);
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AdminAreaCode);

  LoadGradeCode;
  //sg_Admin.ColWidths[2] := 0;
  //sg_Admin.ColWidths[3] := 0;
  GridInit(sg_Admin,4);
  AdminSearch('',ed_sUsername.Text);
  ed_sUsername.SetFocus;

  FormNameSet;
end;

procedure TfmAdmin.AdminSearch(aCode,aUserName: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Admin); //스트링그리드 초기화

  sg_Admin.ColWidths[2] := 0;
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ADMIN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Trim(aUserName) <> '' then
    stSql := stSql + ' AND AD_USERNAME like ''' + Trim(aUserName) + '%'' ';

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

      with sg_Admin do
      begin
        RowCount := RecordCount + 1;
        nRow := 1;
        while Not Eof do
        begin
          cells[0,nRow] := FindField('AD_USERID').AsString;
          cells[1,nRow] := FindField('AD_USERNAME').AsString;
          cells[2,nRow] := FindField('AD_USERPW').AsString;
          cells[3,nRow] := '****';
          cells[4,nRow] := FindField('GR_GRADECODE').AsString;
          cells[5,nRow] := FindField('AD_MASTER').AsString;
          cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
          cells[7,nRow] := FindField('CO_JIJUMCODE').AsString;
          cells[8,nRow] := FindField('CO_DEPARTCODE').AsString;
          cells[9,nRow] := FindField('AD_BUILDINGGRADE').AsString;
          cells[10,nRow] := FindField('LO_DONGCODE').AsString;
          cells[11,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[12,nRow] := FindField('LO_AREACODE').AsString;
          if FindField('AD_USERID').AsString = aCode then
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
  sg_AdminClick(sg_Admin);
end;

procedure TfmAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAdmin.btn_SearchClick(Sender: TObject);
begin
  AdminSearch('',ed_sUsername.Text);
end;

procedure TfmAdmin.StringGrideDrawCell(Sender: TObject; ACol,
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

procedure TfmAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);

  ed_UserName.SetFocus;

end;

procedure TfmAdmin.btn_SaveClick(Sender: TObject);
var
  bResult : boolean;
  stMaster : string;
  stCompanyCode,stJijumCode,stDepartCode : string;
  stBuildingGrade:string;
  stDongCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  stBuildingGrade := '4';
  stDongCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_companyGrade.ItemIndex > 1 then
  begin
    if Not bCompanyGrade then
    begin
      if UpperCase(State) = 'INSERT' then
      begin
        showmessage('회사권한관리를 해 주세요.');
        Exit;
      end;
    end;
    if cmb_Company.ItemIndex = 0 then
    begin
      showmessage('소속의 회사코드를 선택하세요.');
      Exit;
    end;
    if cmb_companyGrade.ItemIndex > 2 then
    begin
      if cmb_Jijum.ItemIndex = 0 then
      begin
        showmessage('소속의 지점코드를 선택하세요.');
        Exit;
      end;
    end;
    if cmb_companyGrade.ItemIndex > 3 then
    begin
      if cmb_Depart.ItemIndex = 0 then
      begin
        showmessage('소속의 부서코드를 선택하세요.');
        Exit;
      end;
    end;
  end;
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    stCompanyCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3);
    stJijumCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3);
    stDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  end;

  if chk_Master.Checked then stMaster := 'Y'
  else stMaster := inttostr(cmb_companyGrade.itemIndex);


  if cmb_Building.ItemIndex > -1 then stBuildingGrade := inttostr(cmb_Building.ItemIndex);
  if cmb_AdminBuildingCode.ItemIndex > 0 then stDongCode := BuildingCodeList.Strings[cmb_AdminBuildingCode.ItemIndex];
  if cmb_AdminFloorCode.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_AdminFloorCode.ItemIndex];
  if cmb_AdminAreaCode.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AdminAreaCode.ItemIndex];

  if cmb_Building.ItemIndex = 1 then
  begin
    if cmb_AdminBuildingCode.ItemIndex < 1 then
    begin
      showmessage('관리할수 있는 ' + FM901 + '을 선택하세요');
      Exit;
    end;
  end else if cmb_Building.ItemIndex = 2 then
  begin
    if cmb_AdminFloorCode.ItemIndex < 1 then
    begin
      showmessage('관리할수 있는 ' + FM911 + '을 선택하세요');
      Exit;
    end;
  end else if cmb_Building.ItemIndex = 3 then
  begin
    if cmb_AdminAreaCode.ItemIndex < 1 then
    begin
      showmessage('관리할수 있는 ' + FM921 + '을 선택하세요');
      Exit;
    end;
  end;

  if G_bPWLengthUse then
  begin
    if Length(ed_UserPw.Text) < G_nPWLength then
    begin
      showmessage('비밀번호는 ' + inttostr(G_nPWLength) + '자 이상 사용 하셔야 합니다.');
      Exit;
    end;
  end;
  if G_bPWCharUse then
  begin
    if Not SpecialCharUse(ed_UserPw.Text) then
    begin
      showmessage('비밀번호는 숫자/문자/특수문자(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')를 포함하셔야 합니다.');
      Exit;
    end;
    if Not IntegerCharUse(ed_UserPw.Text) then
    begin
      showmessage('비밀번호는 숫자/문자/특수문자(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')를 포함하셔야 합니다.');
      Exit;
    end;
    if Not StringCharUse(ed_UserPw.Text) then
    begin
      showmessage('비밀번호는 숫자/문자/특수문자(`~!@#$%^&*()-_=+|\/?:;.,<>{}[]"'')를 포함하셔야 합니다.');
      Exit;
    end;
  end;

  if UpperCase(State) = 'INSERT' then
  begin
    bResult := InsertTB_Admin(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],
                              stMaster,stCompanyCode,stJijumCode,stDepartCode,stBuildingGrade,stDongCode,stFloorCode,stAreaCode);
    dmDBFunction.InsertIntoTB_LOGINCREATEHIS(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],
                              stMaster,stCompanyCode,stJijumCode,stDepartCode,stBuildingGrade,stDongCode,stFloorCode,stAreaCode,'1');
  end else if UpperCase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_Admin(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],
                              stMaster,stCompanyCode,stJijumCode,stDepartCode,stBuildingGrade,stDongCode,stFloorCode,stAreaCode);
    dmDBFunction.InsertIntoTB_LOGINCREATEHIS(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],
                              stMaster,stCompanyCode,stJijumCode,stDepartCode,stBuildingGrade,stDongCode,stFloorCode,stAreaCode,'2');
  end;

  if bResult then AdminSearch(ed_userid.Text,ed_sUserName.text)
  else showmessage('저장실패');
end;

function TfmAdmin.InsertTB_Admin(auserid, ausername, auserPw,
  aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode,aBuildingGrade,
  aDongCode,aFloorCode,aAreaCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_ADMIN( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' AD_USERPW,';
  stSql := stSql + ' AD_USERNAME,';
  stSql := stSql + ' GR_GRADECODE,';
  stSql := stSql + ' AD_MASTER, ';
  stSql := stSql + ' CO_COMPANYCODE, ';
  stSql := stSql + ' CO_JIJUMCODE, ';
  stSql := stSql + ' CO_DEPARTCODE, ';
  stSql := stSql + ' AD_UPDATETIME,';
  stSql := stSql + ' AD_UPDATEOPERATER,';
  stSql := stSql + ' AD_BUILDINGGRADE,';
  stSql := stSql + ' LO_DONGCODE,';
  stSql := stSql + ' LO_FLOORCODE,';
  stSql := stSql + ' LO_AREACODE )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + auserid + ''',';
  stSql := stSql + '''' + auserPw + ''',';
  stSql := stSql + '''' + ausername + ''',';
  stSql := stSql + '''' + aGradeCode + ''',';
  stSql := stSql + '''' + aMaster + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''',';
  stSql := stSql + '''' + aBuildingGrade + ''',';
  stSql := stSql + '''' + aDongCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + '''';
  stSql := stSql + ')';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmAdmin.UpdateTB_Admin(auserid, ausername, auserPw,
  aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode,aBuildingGrade,
  aDongCode,aFloorCode,aAreaCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_ADMIN set ';
  stSql := stSql + ' AD_USERPW = ''' + auserPw + ''',';
  stSql := stSql + ' AD_USERNAME = ''' + ausername + ''',';
  stSql := stSql + ' GR_GRADECODE = ''' + aGradeCode + ''',';
  stSql := stSql + ' AD_MASTER = ''' + aMaster + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + ' CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + ' AD_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + ' AD_UPDATEOPERATER = ''' + Master_ID + ''', ';
  stSql := stSql + ' AD_BUILDINGGRADE = ''' + aBuildingGrade + ''', ';
  stSql := stSql + ' LO_DONGCODE = ''' + aDongCode + ''', ';
  stSql := stSql + ' LO_FLOORCODE = ''' + aFloorCode + ''', ';
  stSql := stSql + ' LO_AREACODE  = ''' + aAreaCode + ''' ';
  stSql := stSql + ' where GROUP_CODE =''' + GROUPCODE + '''';
  stSql := stSql + ' AND AD_USERID = ''' + auserid + '''';

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

procedure TfmAdmin.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  dmDBFunction.InsertIntoTB_LOGINCREATEHIS(ed_userid.Text,ed_username.Text,ed_userPw.Text,'','','','','','','','','','3');
  bResult := DeleteTB_Admin(ed_UserId.Text);
  DeleteTB_AdminGrade(ed_UserId.Text);
  if bResult then AdminSearch('',ed_sUserName.text)
  else showmessage('삭제실패.');

end;

function TfmAdmin.DeleteTB_Admin(auserid: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_ADMIN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AD_USERID = ''' + auserid + '''';
  
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

procedure TfmAdmin.sg_AdminClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;
    ed_userid.Text := cells[0,Row];
    ed_username.Text := cells[1,Row];
    ed_userPw.Text := cells[2,Row];
    nIndex := GradeCodeList.IndexOf( cells[4,Row]);
    if nIndex > -1 then
      cmb_Grade.ItemIndex := nIndex
    else cmb_Grade.ItemIndex := 0;
    if cells[5,Row] = 'Y' then
    begin
      chk_Master.Checked := True;
    end else
    begin
      if Not IsDigit(cells[5,Row]) then cmb_companyGrade.ItemIndex := 0
      else cmb_companyGrade.ItemIndex := strtoint(cells[5,Row]);
    end;
    if Cells[6,Row] <> '' then
    begin
      nIndex := CompanyCodeList.IndexOf(Cells[6,Row]);
      if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
    end;
    LoadJijumCode(Cells[6,Row],cmb_Jijum);
    if Cells[7,Row] <> '' then
    begin
      nIndex := JijumCodeList.IndexOf(Cells[6,Row] + Cells[7,Row]);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
    end;
    LoadDepartCode(Cells[6,Row],Cells[7,Row],cmb_Depart);
    if Cells[8,Row] <> '' then
    begin
      nIndex := DepartCodeList.IndexOf(Cells[6,Row] + Cells[7,Row] + Cells[8,Row]);
      if nIndex > -1 then cmb_Depart.ItemIndex := nIndex;
    end;
    if isDigit(Cells[9,Row]) then
    begin
      cmb_Building.ItemIndex := strtoint(Cells[9,Row]);
    end;
    if BuildingCodeList.IndexOf(cells[10,Row]) > -1 then
    begin
      cmb_AdminBuildingCode.ItemIndex := BuildingCodeList.IndexOf(cells[10,Row]);
    end;
    if cmb_AdminBuildingCode.ItemIndex > 0 then
    begin
      LoadFloorCode(cells[10,Row],cmb_AdminFloorCode);
      if FloorCodeList.IndexOf(cells[11,Row]) > -1 then
      begin
        cmb_AdminFloorCode.ItemIndex := FloorCodeList.IndexOf(cells[11,Row]);
      end;
      if cmb_AdminFloorCode.ItemIndex > 0 then
      begin
        LoadAreaCode(cells[10,Row],cells[11,Row],cmb_AdminAreaCode);
        if AreaCodeList.IndexOf(cells[12,Row]) > -1 then
        begin
          cmb_AdminAreaCode.ItemIndex := AreaCodeList.IndexOf(cells[12,Row]);
        end;
      end;
    end;

  end;

end;

procedure TfmAdmin.ed_sUserNameKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    AdminSearch('',ed_sUsername.Text);
  end;
end;

procedure TfmAdmin.ButtonEnable(aState: string);
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

procedure TfmAdmin.FormClear;
begin
  ed_UserID.Text := '';
  ed_UserName.Text := '';
  ed_UserPW.Text := '';
  cmb_Company.ItemIndex := 0;
  cmb_Jijum.ItemIndex := 0;
  cmb_Depart.ItemIndex := 0;
  cmb_Grade.ItemIndex := 0;
  cmb_companyGrade.ItemIndex := 0;
  cmb_Building.ItemIndex := 0;
  cmb_AdminBuildingCode.ItemIndex := 0;
  cmb_AdminBuildingCodeChange(cmb_AdminBuildingCode);
  chk_Master.Checked := False;
end;

procedure TfmAdmin.FormEnable(aState: string);
begin
  bCompanyGrade := False;
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Admin.Enabled := False;
    ed_UserID.Enabled := true;
    ed_UserName.Enabled  := true;
    ed_UserPW.Enabled := true;
    cmb_Company.Enabled := true;
    cmb_Jijum.Enabled := true;
    cmb_Depart.Enabled := True;
    cmb_Grade.Enabled  := true;
    chk_Master.Enabled := True;
    cmb_companyGrade.Enabled := True;
    btn_CompanyGrade.Enabled := True;
    cmb_Building.Enabled := True;
    cmb_AdminBuildingCode.Enabled := True;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Admin.Enabled := True;
    ed_UserID.Enabled := False;
    ed_UserName.Enabled  := False;
    ed_UserPW.Enabled := False;
    cmb_Company.Enabled := False;
    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmb_Grade.Enabled  := False;
    chk_Master.Enabled := False;
    cmb_companyGrade.Enabled := False;
    btn_CompanyGrade.Enabled := False;
    cmb_Building.Enabled := False;
    cmb_AdminBuildingCode.Enabled := False;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Admin.Enabled := True;
    ed_UserID.Enabled := False;
    ed_UserName.Enabled  := False;
    ed_UserPW.Enabled := False;
    cmb_Company.Enabled := False;
    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmb_Grade.Enabled  := False;
    chk_Master.Enabled := False;
    cmb_companyGrade.Enabled := False;
    btn_CompanyGrade.Enabled := False;
    cmb_Building.Enabled := False;
    cmb_AdminBuildingCode.Enabled := False;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Admin.Enabled := False;
    ed_UserID.Enabled := False;
    ed_UserName.Enabled  := true;
    ed_UserPW.Enabled := true;
    cmb_Company.Enabled := True;
    cmb_Jijum.Enabled := True;
    cmb_Depart.Enabled := True;
    cmb_Grade.Enabled  := true;
    chk_Master.Enabled := True;
    cmb_companyGrade.Enabled := True;
    cmb_Building.Enabled := True;
    if chk_Master.Checked then
    begin
      cmb_Grade.Enabled  := False;
      cmb_companyGrade.Enabled := False;
      btn_CompanyGrade.Enabled := False;
      cmb_Building.Enabled := False;
      btn_Building.Enabled := False;
    end;
    if cmb_companyGrade.ItemIndex = 0 then btn_CompanyGrade.Enabled := False
    else btn_CompanyGrade.Enabled := True;
    if cmb_Building.ItemIndex = 0 then
    begin
      cmb_AdminBuildingCode.Enabled := False;
      cmb_AdminFloorCode.Enabled := False;
      cmb_AdminAreaCode.Enabled := False;
      btn_Building.Enabled := False;
    end else if cmb_Building.ItemIndex = 1 then
    begin
      cmb_AdminBuildingCode.Enabled := True;
      cmb_AdminFloorCode.Enabled := False;
      cmb_AdminAreaCode.Enabled := False;
      btn_Building.Enabled := False;
    end else if cmb_Building.ItemIndex = 2 then
    begin
      cmb_AdminBuildingCode.Enabled := True;
      cmb_AdminFloorCode.Enabled := True;
      cmb_AdminAreaCode.Enabled := False;
      btn_Building.Enabled := False;
    end else if cmb_Building.ItemIndex = 3 then
    begin
      cmb_AdminBuildingCode.Enabled := True;
      cmb_AdminFloorCode.Enabled := True;
      cmb_AdminAreaCode.Enabled := True;
      btn_Building.Enabled := False;
    end else if cmb_Building.ItemIndex = 4 then
    begin
      cmb_AdminBuildingCode.Enabled := False;
      cmb_AdminFloorCode.Enabled := False;
      cmb_AdminAreaCode.Enabled := False;
      btn_Building.Enabled := True;
    end;

  end;
end;

procedure TfmAdmin.btn_CancelClick(Sender: TObject);
begin
  AdminSearch(ed_Userid.Text, ed_sUserName.text);
end;

procedure TfmAdmin.FormShow(Sender: TObject);
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

end;

procedure TfmAdmin.chk_MasterClick(Sender: TObject);
begin
  if chk_Master.Checked then
  begin
    cmb_Grade.ItemIndex := 0;
    cmb_companyGrade.ItemIndex := 0;
    cmb_Grade.Enabled  := False;
    cmb_companyGrade.Enabled := False;
    cmb_Building.ItemIndex := 0;
    cmb_BuildingChange(cmb_Building);
    cmb_AdminBuildingCode.ItemIndex := 0;
    cmb_AdminBuildingCodeChange(cmb_AdminBuildingCode);
    cmb_Building.Enabled := False;
  end else
  begin
    cmb_Grade.Enabled  := True;
    cmb_companyGrade.Enabled := True;
    cmb_Building.Enabled := True;
  end;

end;

procedure TfmAdmin.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Admin do
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

  ed_UserID.SetFocus;
end;

procedure TfmAdmin.LoadCompanyCode(cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  CompanyCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

  cmb_Box.Items.Add('');
  CompanyCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmAdmin.LoadDepartCode(aCompanyCode, aJijumCode: string;
  cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  cmb_Box.Clear;
  DepartCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3''';
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if (aJijumCode <> '000') and (aJijumCode <> '') then
    stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + aJijumCode + ''' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;


  cmb_Box.Items.Add('');
  DepartCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmAdmin.LoadJijumCode(aCompanyCode: string; cmb_Box: TComboBox);
var
  stSql :string;
  TempAdoQuery : TADOQuery;
  i : integer;
begin
  cmb_Box.Clear;
  JijumCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  if G_nCompanySearchIndex = 0 then
  begin
    stSql := stSql + ' Order by a.CO_COMPANYCODE,a.CO_JIJUMCODE ';
  end else
  begin
    stSql := stSql + ' Order by a.CO_NAME ';
  end;

  cmb_Box.Items.Add('');
  JijumCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      JijumCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_JIJUMCODE').AsString);
      Next;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmAdmin.cmb_CompanyChange(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,cmb_Jijum);
  LoadDepartCode(stCompanyCode,'',cmb_Depart);

end;

procedure TfmAdmin.cmb_JijumChange(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin
  stCompanyCode := '';
  stJijumCode := '';
  if cmb_Jijum.ItemIndex > 0 then
  begin
    stCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3);
    stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  LoadDepartCode(stCompanyCode,stJijumCode,cmb_Depart);

end;

procedure TfmAdmin.btn_CompanyGradeClick(Sender: TObject);
begin
  if cmb_companyGrade.ItemIndex > 1 then
  begin
    if cmb_Company.ItemIndex < 1 then
    begin
      showmessage('소속의 회사코드를 선택해 주셔야 합니다.');
      Exit;
    end;
  end;
  if cmb_companyGrade.ItemIndex > 2 then
  begin
    if cmb_Jijum.ItemIndex < 1 then
    begin
      showmessage('소속의 지점코드를 선택해 주셔야 합니다.');
      Exit;
    end;
  end;
  if cmb_companyGrade.ItemIndex > 3 then
  begin
    if cmb_Depart.ItemIndex < 1 then
    begin
      showmessage('소속의 부서코드를 선택해 주셔야 합니다.');
      Exit;
    end;
  end;
  fmCompanyGrade:= TfmCompanyGrade.Create(Self);
  fmCompanyGrade.pUserID := ed_Userid.Text;
  fmCompanyGrade.pUserName := ed_UserName.Text;
  fmCompanyGrade.pCompanyGrade := cmb_companyGrade.ItemIndex;
  fmCompanyGrade.pCompanyCode := '';
  fmCompanyGrade.pJijumCode := '';
  fmCompanyGrade.pDepartCode := '';
  if cmb_Company.ItemIndex > 0 then
    fmCompanyGrade.pCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Jijum.ItemIndex > 0 then
  begin
    fmCompanyGrade.pCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3);
    fmCompanyGrade.pJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    fmCompanyGrade.pCompanyCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3);
    fmCompanyGrade.pJijumCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3);
    fmCompanyGrade.pDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  end;

  fmCompanyGrade.SHowmodal;
  fmCompanyGrade.Free;
  bCompanyGrade := True;

end;

procedure TfmAdmin.cmb_companyGradeChange(Sender: TObject);
begin
  if cmb_companyGrade.ItemIndex > 0 then btn_CompanyGrade.Enabled := True
  else btn_CompanyGrade.Enabled := False;
end;

procedure TfmAdmin.FormNameSet;
begin
  lb_CompanyName.Caption := FM002;
  lb_JijumName.Caption := FM012;
  lb_DepartName.Caption := FM022;

  lb_BuildingCode.Caption := FM902;
  lb_FloorCode.Caption := FM912;
  lb_AreaCode.Caption := FM922;
  
  cmb_Building.Clear;
  cmb_Building.Items.Add('0.전체권한');
  cmb_Building.Items.Add('1.' + FM903);
  cmb_Building.Items.Add('2.' + FM913);
  cmb_Building.Items.Add('3.' + FM923);
  cmb_Building.Items.Add('4.' + FM933);

end;

function TfmAdmin.DeleteTB_AdminGrade(aUserID: string): Boolean;
var
  stSql : string;
begin

  result := False;
  stSql := 'Delete From TB_ADMINCOMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AD_USERID = ''' + aUserID + '''';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_ADMINDOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AD_USERID = ''' + aUserID + '''';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_ADMINALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AD_USERID = ''' + aUserID + '''';

  result := DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_ADMINFOOD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' And AD_USERID = ''' + aUserID + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAdmin.Panel3Resize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := Panel3.Width;
  nBlock := (nWidth - 100) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 50 + nLeft;
  btn_Update.Left := 50 + nBlock + nLeft;
  btn_Save.Left := 50 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 50 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 50 + (nBlock * 4) + nLeft;
  btn_Close.Left := 50 + (nBlock * 5) + nLeft;

end;

procedure TfmAdmin.cmb_BuildingChange(Sender: TObject);
begin
  if cmb_Building.ItemIndex = 0 then
  begin
    cmb_AdminBuildingCode.Enabled := False;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if cmb_Building.ItemIndex = 1 then
  begin
    cmb_AdminBuildingCode.Enabled := True;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if cmb_Building.ItemIndex = 2 then
  begin
    cmb_AdminBuildingCode.Enabled := True;
    cmb_AdminFloorCode.Enabled := True;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := False;
  end else if cmb_Building.ItemIndex = 3 then
  begin
    cmb_AdminBuildingCode.Enabled := True;
    cmb_AdminFloorCode.Enabled := True;
    cmb_AdminAreaCode.Enabled := True;
    btn_Building.Enabled := False;
  end else if cmb_Building.ItemIndex = 4 then
  begin
    cmb_AdminBuildingCode.Enabled := False;
    cmb_AdminFloorCode.Enabled := False;
    cmb_AdminAreaCode.Enabled := False;
    btn_Building.Enabled := True;
  end;

end;

procedure TfmAdmin.btn_BuildingClick(Sender: TObject);
begin
  if cmb_Building.ItemIndex = 4 then
  begin
    fmAdminDoorGrade:= TfmAdminDoorGrade.Create(Self);
    Try
      fmAdminDoorGrade.Caption := btn_Building.Caption;
      fmAdminDoorGrade.IsInsertGrade := True;
      fmAdminDoorGrade.IsUpdateGrade := True;
      fmAdminDoorGrade.IsDeleteGrade := True;
      fmAdminDoorGrade.ed_userid.text := ed_Userid.text;
      fmAdminDoorGrade.SHowmodal;
      Exit;
    Finally
      fmAdminDoorGrade.Free;
    End;

  end;
  {
  if cmb_companyGrade.ItemIndex > 2 then
  begin
    if cmb_Jijum.ItemIndex < 1 then
    begin
      showmessage('소속의 지점코드를 선택해 주셔야 합니다.');
      Exit;
    end;
  end;
  if cmb_companyGrade.ItemIndex > 3 then
  begin
    if cmb_Depart.ItemIndex < 1 then
    begin
      showmessage('소속의 부서코드를 선택해 주셔야 합니다.');
      Exit;
    end;
  end;
  fmCompanyGrade:= TfmCompanyGrade.Create(Self);
  fmCompanyGrade.pUserID := ed_Userid.Text;
  fmCompanyGrade.pUserName := ed_UserName.Text;
  fmCompanyGrade.pCompanyGrade := cmb_companyGrade.ItemIndex;
  fmCompanyGrade.pCompanyCode := '';
  fmCompanyGrade.pJijumCode := '';
  fmCompanyGrade.pDepartCode := '';
  if cmb_Company.ItemIndex > 0 then
    fmCompanyGrade.pCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Jijum.ItemIndex > 0 then
  begin
    fmCompanyGrade.pCompanyCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3);
    fmCompanyGrade.pJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    fmCompanyGrade.pCompanyCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3);
    fmCompanyGrade.pJijumCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3);
    fmCompanyGrade.pDepartCode := copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3);
  end;

  fmCompanyGrade.SHowmodal;
  fmCompanyGrade.Free;
  bCompanyGrade := True; }

end;

procedure TfmAdmin.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

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

  cmb_Box.Items.Add('');
  BuildingCodeList.Add('000');
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

      if RecordCount < 1 then
      begin
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdmin.LoadAreaCode(aBuildingCode, aFloorCode: string;
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

  cmb_Box.Items.Add('');
  AreaCodeList.Add('000');
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

      if RecordCount < 1 then
      begin
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmAdmin.LoadFloorCode(aBuildingCode: string;
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

  cmb_Box.Items.Add('');
  FloorCodeList.Add('000');
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

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAdmin.cmb_AdminBuildingCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := '';
  if cmb_AdminBuildingCode.ItemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_AdminBuildingCode.ItemIndex];
  LoadFloorCode(stBuildingCode,cmb_AdminFloorCode);
  stFloorCode := '';
  if cmb_AdminFloorCode.ItemIndex > -1 then stFloorCode := copy(FloorCodeList.Strings[cmb_AdminFloorCode.ItemIndex],1,3);
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AdminAreaCode);

end;

procedure TfmAdmin.cmb_AdminFloorCodeChange(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := '';
  if cmb_AdminBuildingCode.ItemIndex > -1 then stBuildingCode := BuildingCodeList.Strings[cmb_AdminBuildingCode.ItemIndex];
  stFloorCode := '';
  if cmb_AdminFloorCode.ItemIndex > -1 then stFloorCode := copy(FloorCodeList.Strings[cmb_AdminFloorCode.ItemIndex],1,3);
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AdminAreaCode);

end;

end.
