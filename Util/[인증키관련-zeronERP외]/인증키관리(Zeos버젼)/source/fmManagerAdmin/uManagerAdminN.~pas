unit uManagerAdminN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls,
  uSubForm, CommandArray, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  Menus, AdvObj;

type
  TfmManagerAdmin = class(TfmASubForm)
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    cmb_Company: TComboBox;
    ed_PersonID: TEdit;
    ed_UserName: TEdit;
    ed_Email1: TEdit;
    ed_Email2: TEdit;
    mem_etc: TMemo;
    GroupBox2: TGroupBox;
    Panel5: TPanel;
    btn_PhoneAdd: TSpeedButton;
    Label2: TLabel;
    cmb_PhoneGubun: TComboBox;
    ed_AddPhone: TEdit;
    sg_Phone: TAdvStringGrid;
    Panel2: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel12: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TBitBtn;
    ed_sUserName: TEdit;
    ed_sManagerPhone: TEdit;
    sg_Code: TAdvStringGrid;
    Label24: TLabel;
    cmb_sCompanyGubun: TComboBox;
    cmb_sCompany: TComboBox;
    Label25: TLabel;
    Label26: TLabel;
    cmb_sJijum: TComboBox;
    cmb_sDepart: TComboBox;
    Label27: TLabel;
    TempQuery: TZQuery;
    cmb_Jijum: TComboBox;
    Label1: TLabel;
    cmb_Depart: TComboBox;
    Label8: TLabel;
    cmbPosiName: TComboBox;
    PopupMenu1: TPopupMenu;
    mn_TelNumUpdate: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem1: TMenuItem;
    N1: TMenuItem;
    ed_zip: TEdit;
    Label9: TLabel;
    Label10: TLabel;
    mn_TelRing: TMenuItem;
    N2: TMenuItem;
    ed_addr: TMemo;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_PhoneButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure sg_PhoneCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btn_PhoneAddClick(Sender: TObject);
    procedure sg_CodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure ed_sUserNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sManagerPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_sCompanyGubunChange(Sender: TObject);
    procedure cmb_sCompanyChange(Sender: TObject);
    procedure cmb_sJijumChange(Sender: TObject);
    procedure cmb_sDepartChange(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure mn_TelNumUpdateClick(Sender: TObject);
    procedure sg_PhoneDblClick(Sender: TObject);
    procedure cmb_CompanyKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_JijumKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_CompanyExit(Sender: TObject);
    procedure cmb_JijumExit(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure ed_AddPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cmb_sCompanyKeyPress(Sender: TObject; var Key: Char);
    procedure cmb_sCompanyExit(Sender: TObject);
    procedure mn_TelRingClick(Sender: TObject);
    procedure ed_sUserNameExit(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    State : string;
    sCompanyGubunList :TStringList;
    sCompanyCodeList :TStringList;
    sJijumCodeList :TStringList;
    sDepartCodeList :TStringList;
    CompanyCodeList :TStringList;
    JijumCodeList :TStringList;
    DepartCodeList :TStringList;
    PhoneGubunList :TStringList;
    L_bVisitEditMode : Boolean;
    L_nSelectCompanyIndex : integer;
    L_nSelectsCompanyIndex : integer;
    L_nSelectJijumIndex : integer;
    L_bKeyPress : Boolean;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

  private
    procedure LoadCompanyGubun(cmb_Box:TComboBox;TempList:TStringList;bAll:Boolean = True);
    procedure LoadCompanyCode(cmb_Box:TComboBox;aCompanyGubunCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadJijumCode(cmb_Box:TComboBox;aCompanyCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadDepartCode(cmb_Box:TComboBox;aCompanyCode,aJijumCode:string;TempList:TStringList;bAll:Boolean = True);
    procedure LoadPosiName;
    procedure LoadPoneGubun;
    procedure PhoneTypeCheck;
    procedure PhoneCall(aTelNum:string);
  private
    procedure ShowPersonList(aPersonID:string;aTop:integer = 1;aShow:Boolean=False);
    procedure searchPhoneList(aPersonID:string);
    function GetMaxPersonID:string;
    function InsertTB_PERSON(aPersonID,aUserName,aCompanyCode,aJijumCode,aDepartCode,aPosiName,aEmail1,aEmail2,aZip,aAddr,aEtc:string):Boolean;
    function InsertTB_RETELNUM(aDate,aTime,aTelNum:string):Boolean;
    function UpdateTB_PERSON(aPersonID,aUserName,aCompanyCode,aJijumCode,aDepartCode,aPosiName,aEmail1,aEmail2,aZip,aAddr,aEtc:string):Boolean;
    function CheckPhonList(aPersonID,aPhoneNum:string):Boolean;
    function GetMaxTelView(aPhoneNum:string):integer;
    function InsertIntoTelNumber(aPhoneNum,aPersonID,aTelGubun,aTelViewSeq:string):Boolean;
    function UpdateTelNumber(aPhoneNum,aPersonID,aTelGubun,aTelViewSeq:string):Boolean;
    function DeleteTB_TELNUM(aPersonID,aPhoneNum:string):Boolean;
    function DeleteTB_TELNUMUSERID(aPersonID:string):Boolean;
    function DeleteTB_PERSON(aPersonID:string):Boolean;
  {
    Function GetManagerID(aCompanyCode:string):string;


    Function InsertTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;

    Function CheckTB_LASTCUSTOMERID(aPhoneNumber:string):Boolean;
    Function InsertTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;

}
  public
    L_sCompanyID : string;
    L_sTelNum : string;
    { Public declarations }
  end;

var
  fmManagerAdmin: TfmManagerAdmin;

implementation
uses
  uDataModule,
  uLomosUtil,
  uSMSSender,
  uTelNumberUpdate,
  uMain;

{$R *.dfm}

procedure TfmManagerAdmin.btn_CloseClick(Sender: TObject);
begin
  close;

end;

procedure TfmManagerAdmin.ButtonEnable(aState: string);
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
    btn_Insert.Enabled := True;
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
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;
end;
procedure TfmManagerAdmin.FormCreate(Sender: TObject);
begin
  L_bVisitEditMode := False;
  mn_TelNumUpdate.Visible := False;
  sCompanyGubunList := TStringList.Create;
  sCompanyCodeList := TStringList.Create;
  sJijumCodeList := TStringList.Create;
  sDepartCodeList := TStringList.Create;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  PhoneGubunList := TStringList.Create;
end;
procedure TfmManagerAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sCompanyGubunList.Free;
  sCompanyCodeList.Free;
  sJijumCodeList.Free;
  sDepartCodeList.Free;
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PhoneGubunList.Free;

  Action := caFree;

end;

procedure TfmManagerAdmin.btn_SearchClick(Sender: TObject);
begin
  ShowPersonList('');

end;

procedure TfmManagerAdmin.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyGubun(cmb_sCompanyGubun,sCompanyGubunList);
  LoadCompanyCode(cmb_sCompany,'000',sCompanyCodeList);
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);

  LoadCompanyCode(cmb_Company,'000',CompanyCodeList,False);
  LoadJijumCode(cmb_Jijum,'000',JijumCodeList,False);
  LoadDepartCode(cmb_Depart,'000','000',DepartCodeList,False);

  LoadPoneGubun;
  ShowPersonList('');
end;

procedure TfmManagerAdmin.btn_InsertClick(Sender: TObject);
var
  nIndex : integer;
  stSelectCompanyID : string;
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_code do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 17 then TopRow := RowCount - 17;
      Enabled := False;
    end;
  end;
  if cmb_sCompany.ItemIndex > 0 then
  begin
    stSelectCompanyID := sCompanyCodeList.Strings[cmb_sCompany.ItemIndex];
    nIndex := CompanyCodeList.IndexOf(stSelectCompanyID);
    if nIndex > -1 then
      cmb_Company.ItemIndex := nIndex;
    LoadJijumCode(cmb_Jijum,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,False);
    LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],'000',DepartCodeList,False);
    if cmb_sJijum.ItemIndex > 0 then
    begin
      cmb_Jijum.ItemIndex := cmb_sJijum.ItemIndex;
      LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList.Strings[cmb_Jijum.itemIndex],DepartCodeList,False);
      if cmb_sDepart.ItemIndex > 0 then  cmb_Depart.ItemIndex := cmb_sDepart.ItemIndex;
    end;
  end;
  ed_PersonID.Text := GetMaxPersonID;
end;


procedure TfmManagerAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_UserName.SetFocus;

end;

procedure TfmManagerAdmin.btn_CancelClick(Sender: TObject);
begin
  if UpperCase(State) = 'INSERT' then
  begin
    DeleteTB_TELNUMUSERID(ed_PersonID.Text);
    ShowPersonList(ed_PersonID.Text,1,True);
  end else
    ShowPersonList(ed_PersonID.Text,sg_Code.TopRow,True);
end;

procedure TfmManagerAdmin.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_TELNUMUSERID(ed_PersonID.Text); //전화번호 모두 삭제
  bResult := DeleteTB_PERSON(ed_PersonID.Text);
  if bResult then ShowPersonList(ed_PersonID.Text,sg_Code.TopRow,True)
  else showmessage('삭제실패.');

end;

procedure TfmManagerAdmin.sg_PhoneButtonClick(Sender: TObject; ACol,
  ARow: Integer);
var
  stTelNum : string;
begin
  if Not L_bVisitEditMode then Exit;
  with sg_Phone do
  begin
    if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    stTelNum := StringReplace(Cells[2,ARow],'-','',[rfReplaceAll]);
    if isdigit(stTelNum) then
    begin
      DeleteTB_TELNUM(ed_PersonID.Text,stTelNum); //해당 전화번호를 삭제
      ClearRows(ARow,1);
      if rowCount > 2 then RemoveRows(ARow,1);
    end;
  end;
end;

procedure TfmManagerAdmin.sg_PhoneCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmManagerAdmin.btn_PhoneAddClick(Sender: TObject);
var
  stTelGubun : string;
  stPhoneNum : string;
  nTelViewSeq : integer;
begin

  stPhoneNum := StringReplace(ed_AddPhone.Text,'-','',[rfReplaceAll]);
  if isdigit(stPhoneNum) then
  begin
    nTelViewSeq := GetMaxTelView(stPhoneNum);
    stTelGubun := '000';
    if cmb_PhoneGubun.itemIndex > -1 then
      stTelGubun := PhoneGubunList.Strings[cmb_PhoneGubun.itemIndex];
    if CheckPhonList(ed_PersonID.Text,stPhoneNum) then
    begin
      UpdateTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end else
    begin
      InsertIntoTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end;
    ed_AddPhone.Text := '';
  end;
  searchPhoneList(ed_PersonID.Text);
end;



procedure TfmManagerAdmin.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPhoneNum : string;
  stTelGubun : string;
  nTelViewSeq : integer;
begin
  stCompanyCode := '000';
  stJijumCode := '000';
  stDepartCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := JijumCodeList.Strings[cmb_Jijum.ItemIndex];
  if cmb_Depart.ItemIndex > 0 then stDepartCode := DepartCodeList.Strings[cmb_Depart.ItemIndex];

  stPhoneNum := StringReplace(ed_AddPhone.Text,'-','',[rfReplaceAll]);
  if isdigit(stPhoneNum) then
  begin
    nTelViewSeq := GetMaxTelView(stPhoneNum);
    stTelGubun := '000';
    if cmb_PhoneGubun.itemIndex > -1 then
      stTelGubun := PhoneGubunList.Strings[cmb_PhoneGubun.itemIndex];
    if CheckPhonList(ed_PersonID.Text,stPhoneNum) then
    begin
      UpdateTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end else
    begin
      InsertIntoTelNumber(stPhoneNum,ed_PersonID.Text,stTelGubun,inttostr(nTelViewSeq));
    end;
  end;

  if UpperCase(State) = 'INSERT' then
  begin
    bResult := InsertTB_PERSON(ed_PersonID.Text,
                               ed_UserName.Text,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               cmbPosiName.Text,
                               ed_Email1.Text,
                               ed_Email2.Text,
                               ed_zip.Text,
                               ed_Addr.Text,
                               mem_etc.Text);
    if bResult then ShowPersonList(ed_PersonID.Text,1,True)
    else showmessage('저장실패');
  end
  else if UpperCase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_PERSON(ed_PersonID.Text,
                               ed_UserName.Text,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               cmbPosiName.Text,
                               ed_Email1.Text,
                               ed_Email2.Text,
                               ed_zip.Text,
                               ed_Addr.Text,
                               mem_etc.Text);
    if bResult then ShowPersonList(ed_PersonID.Text,sg_Code.TopRow,True)
    else showmessage('저장실패');
  end;
end;

procedure TfmManagerAdmin.ed_sUserNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

procedure TfmManagerAdmin.ed_sManagerPhoneKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);
end;


procedure TfmManagerAdmin.FormClear;
begin
  if Trim(L_sCompanyID) = '' then cmb_Company.ItemIndex := 0;
  ed_UserName.Text := '';
  cmbPosiName.Text := '';
  ed_Email1.Text := '';
  ed_Email2.Text := '';
  ed_zip.Text := '';
  ed_Addr.Text := '';
  mem_etc.Text := '';
  cmb_PhoneGubun.ItemIndex := 0;
  ed_AddPhone.Text := '';
  ed_PersonID.Text := '';
  RowGridInitialize(sg_Phone);
  sg_Phone.ClearRows(1,1);
  L_nSelectCompanyIndex := -1;
  L_nSelectJijumIndex := -1;
end;

procedure TfmManagerAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Code.Enabled := False;
    if Trim(L_sCompanyID) = '' then cmb_Company.Enabled := True;
    ed_UserName.ReadOnly := False;
    cmb_Jijum.Enabled := True;
    cmb_Depart.Enabled := True;
    cmbPosiName.Enabled := True;
    ed_Email1.ReadOnly := False;
    ed_Email2.ReadOnly := False;
    ed_zip.ReadOnly := False;
    ed_Addr.ReadOnly := False;
    mem_etc.ReadOnly := False;
    cmb_PhoneGubun.Enabled := True;
    ed_AddPhone.ReadOnly := False;
    btn_PhoneAdd.Enabled := True;
    sg_Phone.Options := sg_Phone.Options + [goEditing];
    //sg_Phone.PopupMenu := PopupMenu1;
    L_bVisitEditMode := True;
    mn_TelNumUpdate.Visible := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Code.Enabled := True;
    cmb_Company.Enabled := False;
    ed_UserName.ReadOnly := True;
    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmbPosiName.Enabled := False;
    ed_Email1.ReadOnly := True;
    ed_Email2.ReadOnly := True;
    ed_zip.ReadOnly := True;
    ed_Addr.ReadOnly := True;
    mem_etc.ReadOnly := True;
    cmb_PhoneGubun.Enabled := False;
    ed_AddPhone.ReadOnly := True;
    btn_PhoneAdd.Enabled := False;
    sg_Phone.Options := sg_Phone.Options - [goEditing];
    //sg_Phone.PopupMenu := nil;
    L_bVisitEditMode := False;
    mn_TelNumUpdate.Visible := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Code.Enabled := True;
    cmb_Company.Enabled := False;
    ed_UserName.ReadOnly := True;
    cmb_Jijum.Enabled := False;
    cmb_Depart.Enabled := False;
    cmbPosiName.Enabled := False;
    ed_Email1.ReadOnly := True;
    ed_Email2.ReadOnly := True;
    ed_zip.ReadOnly := True;
    ed_Addr.ReadOnly := True;
    mem_etc.ReadOnly := True;
    cmb_PhoneGubun.Enabled := False;
    ed_AddPhone.ReadOnly := True;
    btn_PhoneAdd.Enabled := False;
    sg_Phone.Options := sg_Phone.Options - [goEditing];
    //sg_Phone.PopupMenu := nil;
    L_bVisitEditMode := False;
    mn_TelNumUpdate.Visible := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Code.Enabled := False;
    cmb_Company.Enabled := True;
    cmb_Jijum.Enabled := True;
    cmb_Depart.Enabled := True;
    ed_UserName.ReadOnly := False;
    cmbPosiName.Enabled := True;
    ed_Email1.ReadOnly := False;
    ed_Email2.ReadOnly := False;
    ed_zip.ReadOnly := False;
    ed_Addr.ReadOnly := False;
    mem_etc.ReadOnly := False;
    cmb_PhoneGubun.Enabled := True;
    ed_AddPhone.ReadOnly := False;
    btn_PhoneAdd.Enabled := True;
    sg_Phone.Options := sg_Phone.Options + [goEditing];
    //sg_Phone.PopupMenu := PopupMenu1;
    L_bVisitEditMode := True;
    mn_TelNumUpdate.Visible := True;
  end;
end;


procedure TfmManagerAdmin.ShowPersonList(aPersonID: string; aTop:integer = 1;aShow:Boolean=False);
var
  stSql : string;
  nRow : integer;
  stWhere : string;
  stPhone : string;
  i : integer;
begin
  if Not aShow then
  begin
    if State = 'INSERT' then Exit;   //수정이나 추가 중에는 조회 되지 말자
    if State = 'UPDATE' then Exit;
  end;

  GridInit(sg_Code,5); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  stWhere := '';

  if cmb_sCompany.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[cmb_sCompany.ItemIndex] + ''' ';
  end else if cmb_sCompanyGubun.ItemIndex > 0 then
  begin
    if sCompanyCodeList.Count > 1 then
    begin
      if stWhere = '' then stWhere := stWhere + ' Where '
      else stWhere := stWhere + ' AND ';
      stWhere := stWhere + ' (';
      for i := 1 to sCompanyCodeList.Count - 1 do
      begin
        if i <> 1 then stWhere := stWhere + 'OR ';
        stWhere := stWhere + ' a.CO_COMPANYCODE = ''' + sCompanyCodeList.Strings[i] + ''' ';
      end;
      stWhere := stWhere + ' )';
    end;
  end;
  if cmb_sJijum.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.CO_JIJUMCODE = ''' + sJijumCodeList.Strings[cmb_sJijum.ItemIndex] + ''' ';
  end;
  if cmb_sDepart.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := stWhere + ' Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.CO_DEPARTCODE = ''' + sDepartCodeList.Strings[cmb_sDepart.ItemIndex] + ''' ';
  end;

  if Trim(ed_sUserName.Text) <> '' then
  begin
    stWhere := stWhere + ' Where  a.PE_NAME Like ''%' + Trim(ed_sUserName.Text) + '%'' ';
  end;
  stPhone := Trim(ed_sManagerPhone.Text);
  stPhone := StringReplace(stPhone,'-','',[rfReplaceAll]);

  stSql := 'Select a.*,c.CO_NAME,d.CO_JIJUMNAME,e.CO_DEPARTNAME from TB_PERSON a ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' On (a.CO_COMPANYCODE = c.CO_COMPANYCODE)';
  stSql := stSql + ' Left Join TB_JIJUM d ';
  stSql := stSql + ' On (a.CO_COMPANYCODE = d.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE)';
  stSql := stSql + ' Left Join TB_DEPART e ';
  stSql := stSql + ' On (a.CO_COMPANYCODE = e.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE)';
  if stPhone <> '' then
  begin
    stSql := stSql + ' Inner Join ( select PE_CODE from TB_TELNUM ';
    stSql := stSql + ' Where TE_TELNUMBER Like ''%' + stPhone + '%'' ';
    stSql := stSql + ' Group by PE_CODE ) b ';
    stSql := stSql + ' ON (a.PE_CODE = b.PE_CODE) ';
  end else
  begin
    if stWhere <> '' then stSql := stSql + stWhere;
  end;
//  stSql := stSql + ' order by a.PE_NAME ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;
    sg_Code.RowCount := recordCount + 1;
    nRow := 1;
    While Not Eof do
    begin
      With sg_Code do
      begin
        cells[0,nRow] := FindField('PE_NAME').AsString;
        cells[1,nRow] := FindField('CO_NAME').AsString;
        cells[2,nRow] := FindField('CO_JIJUMNAME').AsString;
        cells[3,nRow] := FindField('CO_DEPARTNAME').AsString;
        cells[4,nRow] := FindField('PE_POSITIONNAME').AsString;
        cells[5,nRow] := FindField('PE_CODE').AsString;
        cells[6,nRow] := FindField('PE_EMAIL1').AsString;
        cells[7,nRow] := FindField('PE_EMAIL2').AsString;
        cells[8,nRow] := FindField('PE_MEMO').AsString;
        cells[9,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[10,nRow] := FindField('CO_JIJUMCODE').AsString;
        cells[11,nRow] := FindField('CO_DEPARTCODE').AsString;
        cells[12,nRow] := FindField('PE_ZIPCODE').AsString;
        cells[13,nRow] := FindField('PE_ADDR').AsString;


        if (FindField('PE_CODE').AsString)   = (aPersonID)  then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;
    if aTop = 0 then
    begin
      if sg_Code.Row > 15 then sg_Code.TopRow := sg_Code.row - 14;
    end else
    begin
      sg_Code.TopRow := aTop;
    end;
  end;

  sg_CodeClick(sg_Code);
end;
procedure TfmManagerAdmin.sg_CodeClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Code do
  begin
    if cells[5,Row] = '' then Exit;
    ed_UserName.Text := cells[0,Row];
    LoadPosiName;
    cmbPosiName.Text := cells[4,Row];
    ed_PersonID.Text := cells[5,Row];
    ed_Email1.Text := cells[6,Row];
    ed_Email2.Text := cells[7,Row];
    mem_etc.Text := cells[8,Row];
    nIndex := CompanyCodeList.IndexOf(cells[9,Row]);
    cmb_Company.ItemIndex := nIndex;
    LoadJijumCode(cmb_Jijum,cells[9,Row],JijumCodeList,False);
    nIndex := JijumCodeList.IndexOf(cells[10,Row]);
    cmb_Jijum.ItemIndex := nIndex;
    LoadDepartCode(cmb_Depart,cells[9,Row],cells[10,Row],DepartCodeList,False);
    nIndex := DepartCodeList.IndexOf(cells[11,Row]);
    cmb_Depart.ItemIndex := nIndex;
    ed_zip.Text := cells[12,Row];
    ed_addr.Text := cells[13,Row];

    searchPhoneList(ed_PersonID.Text);
  end;
end;

procedure TfmManagerAdmin.searchPhoneList(aPersonID: string);
var
  stSql :string;
  nRow : integer;
  stGubun : string;
begin
  GridInit(sg_Phone,3);

  stSql := 'select a.*,b.TE_GUBUNNAME from TB_TELNUM a ';
  stSql := stSql + ' Left Join TB_TELGUBUN b ';
  stSql := stSql + ' ON ( a.TE_GUBUN = b.TE_GUBUN ) ';
  stSql := stSql + ' Where a.PE_CODE = ''' + aPersonID + ''' ';

  with TempQuery do
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
    sg_Phone.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Phone do
      begin               
        AddButton(0,nRow,1,1,'X',haFull,vaFull);
        cells[1,nRow] := FindField('TE_GUBUNNAME').AsString;
        cells[2,nRow] := PhoneNumberType(FindField('TE_TELNUMBER').AsString);
        cells[3,nRow] := FindField('TE_GUBUN').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;
{


function TfmManagerAdmin1.InsertTB_CUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CUSTOMERID (';
  stSql := stSql + ' CT_TELNO,';
  stSql := stSql + ' AC_COMPANYID,';
  stSql := stSql + ' AM_MANAGERID,';
  stSql := stSql + ' CT_GUBUN )';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + aPhoneNumber + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);
end;




function TfmManagerAdmin1.UpdateTB_CUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CUSTOMERID set ';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ',';
  stSql := stSql + ' CT_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';
  stSql := stSql + ' AND AC_COMPANYID = ''' + aCompanyCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;






function TfmManagerAdmin1.CheckTB_LASTCUSTOMERID(
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  result := false;

  stSql := ' Select * from TB_LASTCUSTOMERID ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TfmManagerAdmin1.InsertTB_LASTCUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_LASTCUSTOMERID (';
  stSql := stSql + ' CT_TELNO,';
  stSql := stSql + ' AC_COMPANYID,';
  stSql := stSql + ' AM_MANAGERID,';
  stSql := stSql + ' CT_GUBUN )';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + aPhoneNumber + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aGubun + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmManagerAdmin1.UpdateTB_LASTCUSTOMERID(aCompanyCode, aManagerID,
  aPhoneNumber, aGubun: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_LASTCUSTOMERID set ';
  stSql := stSql + ' AC_COMPANYID = ''' + aCompanyCode + ''',';
  stSql := stSql + ' AM_MANAGERID = ' + aManagerID + ',';
  stSql := stSql + ' CT_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

   }

procedure TfmManagerAdmin.LoadCompanyCode(cmb_Box: TComboBox;
  aCompanyGubunCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANY ';
  if aCompanyGubunCode <> '000' then
    stSql := stSql + ' Where CG_CODE = ''' + aCompanyGubunCode + ''' ';
  stSql := stSql + ' order by CO_NAME ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_NAME').AsString );
      TempList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdmin.LoadCompanyGubun(cmb_Box: TComboBox;
  TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_COMPANYGUBUN ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CG_NAME').AsString );
      TempList.Add(FindField('CG_CODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdmin.LoadDepartCode(cmb_Box: TComboBox; aCompanyCode,
  aJijumCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_DEPART ';
  if aJijumCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_DEPARTNAME').AsString );
      TempList.Add(FindField('CO_DEPARTCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdmin.LoadJijumCode(cmb_Box: TComboBox;
  aCompanyCode: string; TempList: TStringList; bAll: Boolean);
var
  stSql : string;
begin
  cmb_Box.Clear;
  TempList.Clear;
  if bAll then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  TempList.Add('000');

  cmb_Box.ItemIndex := 0;
  stSql := 'select * from TB_JIJUM ';
  if aCompanyCode = '000' then Exit;
  stSql := stSql + ' Where CO_COMPANYCODE = ''' + aCompanyCode + ''' ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('CO_JIJUMNAME').AsString );
      TempList.Add(FindField('CO_JIJUMCODE').AsString);
      Next;
    end;
  end;
end;

procedure TfmManagerAdmin.cmb_sCompanyGubunChange(Sender: TObject);
begin
  LoadCompanyCode(cmb_sCompany,sCompanyGubunList.Strings[cmb_sCompanyGubun.itemIndex],sCompanyCodeList);
  LoadJijumCode(cmb_sJijum,'000',sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);
  ShowPersonList('');
end;

procedure TfmManagerAdmin.cmb_sCompanyChange(Sender: TObject);
begin
  inherited;
  if L_bKeyPress then Exit;
  LoadJijumCode(cmb_sJijum,sCompanyCodeList.Strings[cmb_sCompany.itemIndex],sJijumCodeList);
  LoadDepartCode(cmb_sDepart,'000','000',sDepartCodeList);
  ShowPersonList('');

end;

procedure TfmManagerAdmin.cmb_sJijumChange(Sender: TObject);
begin
  inherited;
  LoadDepartCode(cmb_sDepart,sCompanyCodeList.Strings[cmb_sCompany.itemIndex],sJijumCodeList.Strings[cmb_sJijum.itemIndex],sDepartCodeList);
  ShowPersonList('');

end;

procedure TfmManagerAdmin.cmb_sDepartChange(Sender: TObject);
begin
  inherited;
  ShowPersonList('');

end;

procedure TfmManagerAdmin.cmb_CompanyChange(Sender: TObject);
begin
  inherited;
  if cmb_Company.itemIndex < 0 then Exit;
  if L_bKeyPress then Exit;
  L_nSelectCompanyIndex := cmb_Company.ItemIndex;
  LoadJijumCode(cmb_Jijum,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList,False);
  LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],'000',DepartCodeList,False);

end;

procedure TfmManagerAdmin.cmb_JijumChange(Sender: TObject);
begin
  inherited;
  if cmb_Jijum.itemIndex < 0 then Exit;
  if L_bKeyPress then Exit;
  L_nSelectJijumIndex := cmb_Jijum.ItemIndex;
  LoadDepartCode(cmb_Depart,CompanyCodeList.Strings[cmb_Company.itemIndex],JijumCodeList.Strings[cmb_Jijum.itemIndex],DepartCodeList,False);

end;

procedure TfmManagerAdmin.LoadPosiName;
var
  stSql : string;
begin
  cmbPosiName.Clear;

  stSql := 'select PE_POSITIONNAME from TB_PERSON ';
  stSql := stSql + ' Group by PE_POSITIONNAME ';
  stSql := stSql + ' order by PE_POSITIONNAME ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    while Not Eof do
    begin
      cmbPosiName.Items.Add(FindField('PE_POSITIONNAME').AsString);
      Next;
    end;
  end;


end;

procedure TfmManagerAdmin.mn_TelNumUpdateClick(Sender: TObject);
var
  bUpdate : Boolean;
begin
  inherited;
  if Not L_bVisitEditMode then Exit;
  fmTelNumberUpdate:= TfmTelNumberUpdate.Create(Self);
  fmTelNumberUpdate.L_stPersonID := ed_PersonID.Text;
  fmTelNumberUpdate.L_stOldTelNumber := sg_Phone.Cells[2,sg_Phone.Row];
  fmTelNumberUpdate.L_stOldTelGubunCode := sg_Phone.Cells[3,sg_Phone.Row];
  fmTelNumberUpdate.SHowmodal;
  bUpdate := fmTelNumberUpdate.L_bSave;
  fmTelNumberUpdate.Free;

  if bUpdate then
  begin
    searchPhoneList(ed_PersonID.Text);
  end;

end;

procedure TfmManagerAdmin.sg_PhoneDblClick(Sender: TObject);
begin
  mn_TelNumUpdateClick(sender);
end;

function TfmManagerAdmin.DeleteTB_TELNUMUSERID(aPersonID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_TELNUM ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin.GetMaxPersonID: string;
var
  stSql : string;
  nPersonID : int64;
begin
  nPersonID := 1;
  stSql := ' Select Max(PE_CODE) as PE_CODE from TB_PERSON ';

  Try
    with TempQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('PE_CODE').AsString) then
      begin
        nPersonID := strtoint(FindField('PE_CODE').AsString) + 1;
      end;
    end;
  Finally
    result := FillZeroNumber2(nPersonID,10);
  End;

end;

procedure TfmManagerAdmin.LoadPoneGubun;
var
  stSql : string;
begin
  PhoneGubunList.Clear;
  cmb_PhoneGubun.Clear;
  stSql := 'select * from TB_TELGUBUN ';
  stSql := stSql + ' order by TE_GUBUN ';

  with TempQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      cmb_PhoneGubun.Items.Add(FindField('TE_GUBUNNAME').AsString );
      PhoneGubunList.Add(FindField('TE_GUBUN').AsString);
      Next;
    end;
  end;
end;

function TfmManagerAdmin.InsertTB_PERSON(aPersonID, aUserName,
  aCompanyCode, aJijumCode, aDepartCode, aPosiName, aEmail1, aEmail2,
  aZip,aAddr,aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_PERSON( ';
  stSql := stSql + ' PE_CODE,';
  stSql := stSql + ' PE_NAME,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' PE_POSITIONNAME,';
  stSql := stSql + ' PE_EMAIL1,';
  stSql := stSql + ' PE_EMAIL2,';
  stSql := stSql + ' PE_ZIPCODE,';
  stSql := stSql + ' PE_ADDR,';
  stSql := stSql + ' PE_MEMO ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aPersonID + ''', ';
  stSql := stSql + '''' + aUserName + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aJijumCode + ''', ';
  stSql := stSql + '''' + aDepartCode + ''', ';
  stSql := stSql + '''' + aPosiName + ''', ';
  stSql := stSql + '''' + aEmail1 + ''', ';
  stSql := stSql + '''' + aEmail2 + ''', ';
  stSql := stSql + '''' + aZip + ''', ';
  stSql := stSql + '''' + aAddr + ''', ';
  stSql := stSql + '''' + aEtc + ''') ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin.UpdateTB_PERSON(aPersonID, aUserName,
  aCompanyCode, aJijumCode, aDepartCode, aPosiName, aEmail1, aEmail2,
  aZip,aAddr,aEtc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_PERSON Set ';
  stSql := stSql + ' PE_NAME = ''' + aUserName + ''',';
  stSql := stSql + ' CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + ' CO_JIJUMCODE = ''' + aJijumCode + ''',';
  stSql := stSql + ' CO_DEPARTCODE = ''' + aDepartCode + ''',';
  stSql := stSql + ' PE_POSITIONNAME = ''' + aPosiName + ''',';
  stSql := stSql + ' PE_EMAIL1 = ''' + aEmail1 + ''',';
  stSql := stSql + ' PE_EMAIL2 = ''' + aEmail2 + ''',';
  stSql := stSql + ' PE_ZIPCODE = ''' + aZip + ''',';
  stSql := stSql + ' PE_ADDR = ''' + aAddr + ''',';
  stSql := stSql + ' PE_MEMO = ''' + aEtc + ''' ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + '''  ';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin.CheckPhonList(aPersonID,
  aPhoneNum: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_TELNUM ';
  stSql := stSql + ' Where PE_CODE = ''' + aPersonID + ''' ';
  stSql := stSql + ' AND TE_TELNUMBER = ''' + aPhoneNum + ''' ';

  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount > 0 then result := True;
  end;

end;

function TfmManagerAdmin.GetMaxTelView(aPhoneNum: string): integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'Select Max(TE_VIEWSEQ) as TE_VIEWSEQ from TB_TELNUM ';
  stSql := stSql + ' Where TE_TELNUMBER = ''' + aPhoneNum + ''' ';

  With TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if Not FindField('TE_VIEWSEQ').IsNull then result := FindField('TE_VIEWSEQ').AsInteger + 1;
  end;
end;

function TfmManagerAdmin.InsertIntoTelNumber(aPhoneNum, aPersonID,
  aTelGubun, aTelViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_TELNUM( ';
  stSql := stSql + ' TE_TELNUMBER,';
  stSql := stSql + ' TE_GUBUN,';
  stSql := stSql + ' PE_CODE,';
  stSql := stSql + ' TE_VIEWSEQ)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aPhoneNum + ''',';
  stSql := stSql + '''' + aTelGubun + ''',';
  stSql := stSql + '''' + aPersonID + ''',';
  stSql := stSql + '' + aTelViewSeq + ')';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin.UpdateTelNumber(aPhoneNum, aPersonID, aTelGubun,
  aTelViewSeq: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_TELNUM Set ';
  stSql := stSql + ' TE_GUBUN = ''' + aTelGubun + ''',';
  stSql := stSql + ' TE_VIEWSEQ = ' + aTelViewSeq + ' ';
  stSql := stSql + ' Where TE_TELNUMBER = ''' + aPhoneNum + ''' ';
  stSql := stSql + ' AND PE_CODE = ''' + aPersonID + ''',';

  result := dmDB.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin.DeleteTB_TELNUM(aPersonID,
  aPhoneNum: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_TELNUM ';
  stSql := stSql + ' where TE_TELNUMBER = ''' + aPhoneNum + ''' ';
  stSql := stSql + ' AND PE_CODE = ''' + aPersonID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);

end;

function TfmManagerAdmin.DeleteTB_PERSON(aPersonID: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete from TB_PERSON ';
  stSql := stSql + ' where PE_CODE = ''' + aPersonID + ''' ';

  result := dmDB.ProcessExecSQL(stSql);

end;

procedure TfmManagerAdmin.cmb_CompanyKeyPress(Sender: TObject;
  var Key: Char);
var
  i : integer;
  stWriteCompanyName : string;
begin
  inherited;
  stWriteCompanyName := cmb_Company.Text;
  L_bKeyPress := True;
  if Key <> #13 then exit;
  L_bKeyPress := False;
  if L_nSelectCompanyIndex > (cmb_Company.Items.Count - 1) then Exit;
  for i:= L_nSelectCompanyIndex + 1 to cmb_Company.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteCompanyName),UpperCase(cmb_Company.Items.Strings[i])) > 0 then
    begin
      cmb_Company.ItemIndex := i;
      cmb_Company.Text := cmb_Company.Items.Strings[i];
      break;
    end else L_nSelectCompanyIndex := -1;
  end;
  cmb_CompanyChange(Sender);
end;

procedure TfmManagerAdmin.cmb_JijumKeyPress(Sender: TObject;
  var Key: Char);
var
  i : integer;
  stWriteJijumName : string;
begin
  inherited;
  stWriteJijumName := cmb_Jijum.Text;
  L_bKeyPress := True;
  if Key <> #13 then exit;
  L_bKeyPress := False;
  if L_nSelectJijumIndex > (cmb_Jijum.Items.Count - 1) then Exit;
  for i:= L_nSelectJijumIndex + 1 to cmb_Jijum.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteJijumName),UpperCase(cmb_Jijum.Items.Strings[i])) > 0 then
    begin
      cmb_Jijum.ItemIndex := i;
      break;
    end else L_nSelectJijumIndex := -1;
  end;
  cmb_JijumChange(Sender);

end;

procedure TfmManagerAdmin.cmb_CompanyExit(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
  cmb_CompanyChange(Sender);
end;

procedure TfmManagerAdmin.cmb_JijumExit(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
  cmb_JijumChange(Sender);
end;

procedure TfmManagerAdmin.MenuItem1Click(Sender: TObject);
begin
  inherited;
  btn_SaveClick(btn_Save);
end;

procedure TfmManagerAdmin.N1Click(Sender: TObject);
begin
  inherited;
  btn_UpdateClick(btn_Update);
end;

procedure TfmManagerAdmin.ed_AddPhoneKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  PhoneTypeCheck;
end;

procedure TfmManagerAdmin.PhoneTypeCheck;
begin
  if (copy(ed_AddPhone.Text,1,3) = '010') or
     (copy(ed_AddPhone.Text,1,3) = '011') or
     (copy(ed_AddPhone.Text,1,3) = '016') or
     (copy(ed_AddPhone.Text,1,3) = '017') or
     (copy(ed_AddPhone.Text,1,3) = '019') then
  begin
    cmb_PhoneGubun.ItemIndex := 0;
  end else
  begin
    if cmb_PhoneGubun.ItemIndex = 0 then
    cmb_PhoneGubun.ItemIndex := 1;
  end;
end;

procedure TfmManagerAdmin.cmb_sCompanyKeyPress(Sender: TObject;
  var Key: Char);
var
  i : integer;
  stWriteCompanyName : string;
begin
  inherited;
  stWriteCompanyName := cmb_sCompany.Text;
  L_bKeyPress := True;
  if Key <> #13 then exit;
  L_bKeyPress := False;
  if L_nSelectsCompanyIndex > (cmb_sCompany.Items.Count - 1) then Exit;
  for i:= L_nSelectsCompanyIndex + 1 to cmb_sCompany.Items.Count - 1 do
  begin
    if Pos( UpperCase(stWriteCompanyName),UpperCase(cmb_sCompany.Items.Strings[i])) > 0 then
    begin
      cmb_sCompany.ItemIndex := i;
      cmb_sCompany.Text := cmb_sCompany.Items.Strings[i];
      break;
    end else L_nSelectsCompanyIndex := -1;
  end;
  cmb_sCompanyChange(Sender);

end;

procedure TfmManagerAdmin.cmb_sCompanyExit(Sender: TObject);
begin
  inherited;
  L_bKeyPress := False;
  cmb_sCompanyChange(Sender);

end;

procedure TfmManagerAdmin.mn_TelRingClick(Sender: TObject);
var
  stTelNum : string;
begin
  stTelNum := sg_Phone.Cells[2,sg_Phone.Row];
  stTelNum := StringReplace(stTelNum,'-','',[rfReplaceAll]);

  if Not IsDigit(stTelNum) then Exit;

  PhoneCall(stTelNum);

end;

procedure TfmManagerAdmin.PhoneCall(aTelNum: string);
var
  stSendData : string;
begin
  G_stSendTelNum := aTelNum;
  stSendData := 'MODEMSEND' + DATADELIMITER + 'ATDT' + aTelNum + DATADELIMITER + LINEEND;
  fmMain.ModemSendData(stSendData);
  fmMain.DisConnectTimer.Enabled := True;
  InsertTB_RETELNUM(FormatDateTime('yyyymmdd',now),FormatDateTime('hhnnss',now),G_stSendTelNum);
end;

procedure TfmManagerAdmin.ed_sUserNameExit(Sender: TObject);
begin
  inherited;
  btn_SearchClick(Self);

end;

function TfmManagerAdmin.InsertTB_RETELNUM(aDate, aTime,
  aTelNum: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_RESENDTEL( ';
  stSql := stSql + ' MA_USERID,';
  stSql := stSql + ' RT_DATE,';
  stSql := stSql + ' RT_TIME,';
  stSql := stSql + ' RT_TELNO ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + Master_ID + ''', ';
  stSql := stSql + '''' + aDate + ''', ';
  stSql := stSql + '''' + aTime + ''', ';
  stSql := stSql + '''' + aTelNum + ''') ';

  result := dmDB.ProcessExecSQL(stSql);
end;

procedure TfmManagerAdmin.N2Click(Sender: TObject);
begin
  inherited;
  fmSMSSender:= TfmSMSSender.Create(Self);
  fmSMSSender.PhoneNumber := sg_Phone.Cells[2,sg_Phone.Row];
  fmSMSSender.SHowmodal;
  fmSMSSender.Free;
end;

initialization
  RegisterClass(TfmManagerAdmin);
Finalization
  UnRegisterClass(TfmManagerAdmin);

end.
