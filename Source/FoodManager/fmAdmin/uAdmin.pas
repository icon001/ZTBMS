unit uAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ExtCtrls, ComCtrls,ADODB,
  uSubForm, CommandArray,ActiveX, AdvObj;

type
  TfmAdmin = class(TfmASubForm)
    Panel1: TPanel;
    Label8: TLabel;
    Label1: TLabel;
    ed_Userid: TEdit;
    ed_UserName: TEdit;
    Label3: TLabel;
    ed_UserPw: TEdit;
    StatusBar1: TStatusBar;
    GroupBox2: TGroupBox;
    chk_Master: TCheckBox;
    Label4: TLabel;
    cmb_Grade: TComboBox;
    Label5: TLabel;
    cmb_companyGrade: TComboBox;
    GroupBox3: TGroupBox;
    cmb_Company: TComboBox;
    Label6: TLabel;
    Label21: TLabel;
    cmb_Jijum: TComboBox;
    Label7: TLabel;
    cmb_Depart: TComboBox;
    btn_CompanyGrade: TSpeedButton;
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
    Panel12: TPanel;
    btn_Building: TSpeedButton;
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
    procedure btn_BuildingClick(Sender: TObject);
  private
    { Private declarations }
    GradeCodeList : TStringList;
    State : string;
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    bCompanyGrade : Boolean;

    procedure LoadCompanyCode(cmb_Box:TComboBox);
    procedure LoadJijumCode(aCompanyCode:string;cmb_Box:TComboBox);
    procedure LoadDepartCode(aCompanyCode,aJijumCode:string;cmb_Box:TComboBox);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure LoadGradeCode;
    procedure AdminSearch(aCode,aUserName:string);
    Function InsertTB_Admin(auserid,ausername,auserPw,aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode:string):Boolean;
    Function UpdateTB_Admin(auserid,ausername,auserPw,aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode:string):Boolean;
    Function DeleteTB_Admin(auserid : string) : Boolean;
  public
    { Public declarations }
  end;

var
  fmAdmin: TfmAdmin;

implementation

uses
uDataModule1,
uLomosUtil,
uCompanyGrade, uAdminDoorGrade;

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
    cmb_Grade.ItemIndex := 1;
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

end;

procedure TfmAdmin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GradeCodeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;

end;

procedure TfmAdmin.FormActivate(Sender: TObject);
begin
  LoadCompanyCode(cmb_Company);
  LoadJijumCode('',cmb_Jijum);
  LoadDepartCode('','',cmb_Depart);

  LoadGradeCode;
  GridInit(sg_Admin,3);
  //sg_Admin.ColWidths[2] := 0;
  //sg_Admin.ColWidths[3] := 0;
  AdminSearch('',ed_sUsername.Text);
  ed_sUsername.SetFocus;

end;

procedure TfmAdmin.AdminSearch(aCode,aUserName: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  GridInitialize(sg_Admin); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'select * from TB_ADMIN ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if Trim(aUserName) <> '' then
    stSql := stSql + ' AND AD_USERNAME like ''' + Trim(aUserName) + '%'' ';

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

    with sg_Admin do
    begin
      RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        cells[0,nRow] := FindField('AD_USERID').AsString;
        cells[1,nRow] := FindField('AD_USERNAME').AsString;
        cells[2,nRow] := FindField('AD_USERPW').AsString;
        cells[3,nRow] := FindField('GR_GRADECODE').AsString;
        cells[4,nRow] := FindField('AD_MASTER').AsString;
        cells[5,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[6,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[7,nRow] := FindField('CO_DEPARTCODE').AsString;
        if FindField('AD_USERID').AsString = aCode then
        begin
          SelectRows(nRow,1);
        end;

        nRow := nRow + 1;
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
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
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
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

  if UpperCase(State) = 'INSERT' then
    bResult := InsertTB_Admin(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],stMaster,stCompanyCode,stJijumCode,stDepartCode)
  else if UpperCase(State) = 'UPDATE' then
    bResult := UpdateTB_Admin(ed_userid.Text,ed_username.Text,ed_userPw.Text,GradeCodeList.Strings[cmb_Grade.ItemIndex],stMaster,stCompanyCode,stJijumCode,stDepartCode);

  if bResult then AdminSearch(ed_userid.Text,ed_sUserName.text)
  else showmessage('저장실패');
end;

function TfmAdmin.InsertTB_Admin(auserid, ausername, auserPw,
  aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode: string): Boolean;
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
  stSql := stSql + ' AD_UPDATEOPERATER )' ;
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

function TfmAdmin.UpdateTB_Admin(auserid, ausername, auserPw,
  aGradeCode,aMaster,aCompanyCode,aJijumCode,aDepartCode: string): Boolean;
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
  stSql := stSql + ' AD_UPDATEOPERATER = ''' + Master_ID + ''' ';
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

  bResult := DeleteTB_Admin(ed_UserId.Text);

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
    nIndex := GradeCodeList.IndexOf( cells[3,Row]);
    if nIndex > -1 then
      cmb_Grade.ItemIndex := nIndex
    else cmb_Grade.ItemIndex := 0;
    if cells[4,Row] = 'Y' then
    begin
      chk_Master.Checked := True;
    end else
    begin
      if Not IsDigit(cells[4,Row]) then cmb_companyGrade.ItemIndex := 0
      else cmb_companyGrade.ItemIndex := strtoint(cells[4,Row]);
    end;
    if Cells[5,Row] <> '' then
    begin
      nIndex := CompanyCodeList.IndexOf(Cells[5,Row]);
      if nIndex > -1 then cmb_Company.ItemIndex := nIndex;
    end;
    LoadJijumCode(Cells[5,Row],cmb_Jijum);
    if Cells[6,Row] <> '' then
    begin
      nIndex := JijumCodeList.IndexOf(Cells[5,Row] + Cells[6,Row]);
      if nIndex > -1 then cmb_Jijum.ItemIndex := nIndex;
    end;
    LoadDepartCode(Cells[5,Row],Cells[5,Row],cmb_Depart);
    if Cells[7,Row] <> '' then
    begin
      nIndex := DepartCodeList.IndexOf(Cells[5,Row] + Cells[6,Row] + Cells[7,Row]);
      if nIndex > -1 then cmb_Depart.ItemIndex := nIndex;
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
  if cmb_Grade.Items.Count > 0 then cmb_Grade.ItemIndex := 1;
  cmb_companyGrade.ItemIndex := 0;
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
    btn_Building.Enabled := True;
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
    btn_Building.Enabled := True;
    if chk_Master.Checked then
    begin
      cmb_Grade.Enabled  := False;
      cmb_companyGrade.Enabled := False;
      btn_CompanyGrade.Enabled := False;
    end;
    if cmb_companyGrade.ItemIndex = 0 then btn_CompanyGrade.Enabled := False
    else btn_CompanyGrade.Enabled := True;
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
  GridInit(sg_Admin,3);
end;

procedure TfmAdmin.chk_MasterClick(Sender: TObject);
begin
  if chk_Master.Checked then
  begin
    cmb_Grade.ItemIndex := 0;
    cmb_companyGrade.ItemIndex := 0;
    cmb_Grade.Enabled  := False;
    cmb_companyGrade.Enabled := False;
  end else
  begin
    cmb_Grade.Enabled  := True;
    cmb_companyGrade.Enabled := True;
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

procedure TfmAdmin.btn_BuildingClick(Sender: TObject);
begin
  inherited;
  fmAdminDoorGrade:= TfmAdminDoorGrade.Create(Self);
  Try
    fmAdminDoorGrade.Caption := btn_Building.Caption;
    fmAdminDoorGrade.IsInsertGrade := True;
    fmAdminDoorGrade.IsUpdateGrade := True;
    fmAdminDoorGrade.IsDeleteGrade := True;
    fmAdminDoorGrade.WorkCode := 3;
    fmAdminDoorGrade.ed_userid.text := ed_Userid.text;
    fmAdminDoorGrade.SHowmodal;
  Finally
    fmAdminDoorGrade.Free;
  End;

end;

end.
