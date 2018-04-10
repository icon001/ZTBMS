unit uManagerAdminN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls,
  uSubForm, CommandArray;

type
  TfmManagerAdmin1 = class(TfmASubForm)
    Panel3: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    cmb_CompanyCode2: TComboBox;
    ed_ManagerID: TEdit;
    ed_ManagerName: TEdit;
    ed_PosiName: TEdit;
    ed_DepartName: TEdit;
    ed_Email1: TEdit;
    ed_Email2: TEdit;
    cmb_managerGubun: TComboBox;
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
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btn_Search: TBitBtn;
    cmb_CompanyCode1: TComboBox;
    ed_sManagerName: TEdit;
    ed_sManagerPhone: TEdit;
    ADOQuery1: TADOQuery;
    TempQuery: TADOQuery;
    cmb_Depart: TComboBox;
    Label9: TLabel;
    sg_Manager: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure cmb_CompanyCode2Change(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure sg_PhoneButtonClick(Sender: TObject; ACol, ARow: Integer);
    procedure sg_PhoneCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure btn_PhoneAddClick(Sender: TObject);
    procedure sg_ManagerClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure cmb_CompanyCode1Change(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure ed_sManagerNameKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_sManagerPhoneKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    State : string;
    CompanyCodeList :TStringList;
    ManagerGubunCodeList : TStringList;
    L_bVisitEditMode : Boolean;
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure  LoadCompanyCode(cmb_box:TComboBox;bTotal:Boolean);
    procedure LoadManagerGubunCode(cmb_Box:TComboBox);
    procedure LoadDepartName(aCompanyCode:string;cmb_Box:TComboBox);

  private
    procedure ShowManagerList(aCompanyCode,aManagerID:string;aTop:integer = 1);
    procedure searchPhoneList(aCompanyCode,aManagerID:string);
    Function GetManagerID(aCompanyCode:string):string;

    Function DeleteTB_AUTHMANAGER(aCompanyCode,aManagerID:string):Boolean;
    Function DeleteTB_CUSTOMERID(aPhone:string):Boolean;
    Function DeleteTB_CUSTOMERIDMangerID(aCompanyCode,aManagerID:string):Boolean;

    Function CheckTB_CUSTOMERID(aCompanyCode,aPhoneNumber:string):Boolean;
    Function InsertTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_CUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;

    Function CheckTB_LASTCUSTOMERID(aPhoneNumber:string):Boolean;
    Function InsertTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;
    Function UpdateTB_LASTCUSTOMERID(aCompanyCode,aManagerID,aPhoneNumber,aGubun:string):Boolean;

    Function InsertTB_AUTHMANAGER(aCompanyCode,aManagerID,
                                  aManagerName,aDepartName,
                                  aPosiName,aEmail1,aEmail2,
                                  aManagerGubunCode,aetc:string):Boolean;
    Function UpdateTB_AUTHMANAGER(aCompanyCode,aManagerID,
                                  aManagerName,aDepartName,
                                  aPosiName,aEmail1,aEmail2,
                                  aManagerGubunCode,aetc:string):Boolean;

  public
    L_sCompanyID : string;
    L_sTelNum : string;
    { Public declarations }
  end;

var
  fmManagerAdmin1: TfmManagerAdmin1;

implementation
uses
  uDataModule,
  uLomosUtil;

{$R *.dfm}

procedure TfmManagerAdmin1.btn_CloseClick(Sender: TObject);
begin
  close;

end;

procedure TfmManagerAdmin1.ButtonEnable(aState: string);
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

function TfmManagerAdmin1.CheckTB_CUSTOMERID(aCompanyCode,
  aPhoneNumber: string): Boolean;
var
  stSql : string;
begin
  result := false;

  stSql := ' Select * from TB_CUSTOMERID ';
  stSql := stSql + ' Where CT_TELNO = ''' + aPhoneNumber + ''' ';
  stSql := stSql + ' AND AC_COMPANYID = ''' + aCompanyCode + ''' ';

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

function TfmManagerAdmin1.DeleteTB_AUTHMANAGER(aCompanyCode,
  aManagerID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_AUTHMANAGER ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin1.DeleteTB_CUSTOMERID(aPhone: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_CUSTOMERID ';
  stSql := stSql + ' where CT_TELNO = ''' + aPhone + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmManagerAdmin1.DeleteTB_CUSTOMERIDMangerID(aCompanyCode,
  aManagerID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_CUSTOMERID ';
  stSql := stSql + ' where AC_COMPANYID = ''' + aCompanyCode + '''';
  stSql := stSql + ' AND AM_MANAGERID = ''' + aManagerID + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmManagerAdmin1.FormClear;
begin
  if Trim(L_sCompanyID) = '' then cmb_CompanyCode2.ItemIndex := 0;
  ed_ManagerName.Text := '';
  ed_DepartName.Text := '';
  ed_PosiName.Text := '';
  ed_Email1.Text := '';
  ed_Email2.Text := '';
  cmb_managerGubun.ItemIndex := 0;
  mem_etc.Text := '';
  cmb_PhoneGubun.ItemIndex := 0;
  ed_AddPhone.Text := '';
  ed_ManagerID.Text := '';
  RowGridInitialize(sg_Phone);
  sg_Phone.ClearRows(1,1);
end;

procedure TfmManagerAdmin1.FormCreate(Sender: TObject);
begin
  L_bVisitEditMode := False;
  CompanyCodeList := TStringList.Create;
  ManagerGubunCodeList := TStringList.Create;
end;

procedure TfmManagerAdmin1.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Manager.Enabled := False;
    if Trim(L_sCompanyID) = '' then cmb_CompanyCode2.Enabled := True;
    ed_ManagerName.Enabled := True;
    ed_DepartName.Enabled := True;
    ed_PosiName.Enabled := True;
    ed_Email1.Enabled := True;
    ed_Email2.Enabled := True;
    cmb_managerGubun.Enabled := True;
    mem_etc.Enabled := True;
    cmb_PhoneGubun.Enabled := True;
    ed_AddPhone.Enabled := True;
    btn_PhoneAdd.Enabled := True;
    sg_Phone.Options := sg_Phone.Options + [goEditing];
    L_bVisitEditMode := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Manager.Enabled := True;
    cmb_CompanyCode2.Enabled := False;
    ed_ManagerName.Enabled := False;
    ed_DepartName.Enabled := False;
    ed_PosiName.Enabled := False;
    ed_Email1.Enabled := False;
    ed_Email2.Enabled := False;
    cmb_managerGubun.Enabled := False;
    mem_etc.Enabled := False;
    cmb_PhoneGubun.Enabled := False;
    ed_AddPhone.Enabled := False;
    btn_PhoneAdd.Enabled := False;
    sg_Phone.Options := sg_Phone.Options - [goEditing];
    L_bVisitEditMode := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Manager.Enabled := True;
    cmb_CompanyCode2.Enabled := False;
    ed_ManagerName.Enabled := False;
    ed_DepartName.Enabled := False;
    ed_PosiName.Enabled := False;
    ed_Email1.Enabled := False;
    ed_Email2.Enabled := False;
    cmb_managerGubun.Enabled := False;
    mem_etc.Enabled := False;
    cmb_PhoneGubun.Enabled := False;
    ed_AddPhone.Enabled := False;
    btn_PhoneAdd.Enabled := False;
    sg_Phone.Options := sg_Phone.Options - [goEditing];
    L_bVisitEditMode := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Manager.Enabled := False;
    cmb_CompanyCode2.Enabled := False;
    ed_ManagerName.Enabled := True;
    ed_DepartName.Enabled := True;
    ed_PosiName.Enabled := True;
    ed_Email1.Enabled := True;
    ed_Email2.Enabled := True;
    cmb_managerGubun.Enabled := True;
    mem_etc.Enabled := True;
    cmb_PhoneGubun.Enabled := True;
    ed_AddPhone.Enabled := True;
    btn_PhoneAdd.Enabled := True;
    sg_Phone.Options := sg_Phone.Options + [goEditing];
    L_bVisitEditMode := True;
  end;
end;

function TfmManagerAdmin1.GetManagerID(aCompanyCode: string): string;
var
  stSql : string;
begin
  result := '1';
  stSql := 'select Max(AM_MANAGERID) as AM_MANAGERID from TB_AUTHMANAGER ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';

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
    result := inttostr(FindField('AM_MANAGERID').AsInteger + 1 );
  end;

end;

function TfmManagerAdmin1.InsertTB_AUTHMANAGER(aCompanyCode, aManagerID,
  aManagerName, aDepartName, aPosiName, aEmail1, aEmail2,
  aManagerGubunCode, aetc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert into TB_AUTHMANAGER(';
  stSql := stSql + 'AC_COMPANYID,';
  stSql := stSql + 'AM_MANAGERID,';
  stSql := stSql + 'AM_USERNAME,';
  stSql := stSql + 'AM_DEPARTNAME,';
  stSql := stSql + 'AM_POSI,';
  stSql := stSql + 'AM_EMAIL1,';
  stSql := stSql + 'AM_EMAIL2,';
  stSql := stSql + 'AM_ETC,';
  stSql := stSql + 'AM_GUBUN) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + aManagerID + ',';
  stSql := stSql + '''' + aManagerName + ''',';
  stSql := stSql + '''' + aDepartName + ''',';
  stSql := stSql + '''' + aPosiName + ''',';
  stSql := stSql + '''' + aEmail1 + ''',';
  stSql := stSql + '''' + aEmail2 + ''',';
  stSql := stSql + '''' + aetc + ''',';
  stSql := stSql + '''' + aManagerGubunCode + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

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

procedure TfmManagerAdmin1.LoadCompanyCode(cmb_box: TComboBox;
  bTotal: Boolean);
var
  stSql : string;
begin
  CompanyCodeList.Clear;
  CompanyCodeList.Add('');
  cmb_box.Clear;
  if bTotal then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHCOMPANY ';
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
      CompanyCodeList.Add(FindField('AC_COMPANYID').AsString);
      cmb_Box.Items.Add(FindField('AC_CPNAME').AsString);
      Next;
    end;

  end;

end;

procedure TfmManagerAdmin1.LoadManagerGubunCode(cmb_Box: TComboBox);
var
  stSql : string;
begin
  ManagerGubunCodeList.Clear;
  ManagerGubunCodeList.Add('');
  cmb_box.Clear;
  cmb_Box.Items.Add('');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_AUTHMANAGERGUBUN ';
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
      ManagerGubunCodeList.Add(FindField('AG_GUBUN').AsString);
      cmb_Box.Items.Add(FindField('AG_NAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmManagerAdmin1.searchPhoneList(aCompanyCode,
  aManagerID: string);
var
  stSql :string;
  nRow : integer;
  stGubun : string;
begin
  RowGridInitialize(sg_Phone);

  stSql := 'select * from TB_CUSTOMERID ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID ;

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
        Case FindField('CT_GUBUN').AsString[1] of
          '1' : stGubun := '휴대폰';
          '2' : stGubun := '사무실전화';
          '3' : stGubun := 'FAX';
          '4' : stGubun := '집전화';
          else stGubun := '기타';
        end;
        cells[1,nRow] := stGubun;
        cells[2,nRow] := FindField('CT_TELNO').AsString;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;

end;

procedure TfmManagerAdmin1.ShowManagerList(aCompanyCode,
  aManagerID: string; aTop: integer);
var
  stSql : string;
  nRow : integer;
  stWhere : string;
  stPhone : string;
begin
  GridInitialize(sg_Manager); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  stWhere := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AC_COMPANYID = ''' + CompanyCodeList.Strings[cmb_CompanyCode1.itemIndex] + ''' ';
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_DEPARTNAME = ''' + cmb_Depart.Text + ''' ';
  end;
  if Trim(ed_sManagerName.Text) <> '' then
  begin
    if stWhere = '' then stWhere := 'Where '
    else stWhere := stWhere + ' AND ';
    stWhere := stWhere + ' a.AM_USERNAME Like ''%' + Trim(ed_sManagerName.Text) + '%'' ';
  end;
  stPhone := Trim(ed_sManagerPhone.Text);
  stPhone := StringReplace(stPhone,'-','',[rfReplaceAll]);

  stSql := 'Select a.*,c.AC_CPNAME from TB_AUTHMANAGER a ';
  stSql := stSql + ' Left Join TB_AUTHCOMPANY c ';
  stSql := stSql + ' On (a.AC_COMPANYID = c.AC_COMPANYID)';
  if stPhone <> '' then
  begin
    stSql := stSql + ' Inner Join ( select AC_COMPANYID,AM_MANAGERID from TB_CUSTOMERID ';
    stSql := stSql + ' Where CT_TELNO Like ''%' + stPhone + '%'' ';
    stSql := stSql + ' Group by AC_COMPANYID,AM_MANAGERID ) b ';
    stSql := stSql + ' ON (a.AC_COMPANYID = b.AC_COMPANYID ';
    stSql := stSql + ' AND a.AM_MANAGERID = b.AM_MANAGERID) ';
  end;

  if stWhere <> '' then stSql := stSql + stWhere;

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
    sg_Manager.RowCount := recordCount + 1;
    nRow := 1;
    While Not Eof do
    begin
      With sg_Manager do
      begin
        cells[0,nRow] := FindField('AC_CPNAME').AsString;
        cells[1,nRow] := FindField('AM_DEPARTNAME').AsString;
        cells[2,nRow] := FindField('AM_POSI').AsString;
        cells[3,nRow] := FindField('AM_USERNAME').AsString;
        cells[4,nRow] := FindField('AC_COMPANYID').AsString;
        cells[5,nRow] := FindField('AM_MANAGERID').AsString;
        cells[6,nRow] := FindField('AM_EMAIL1').AsString;
        cells[7,nRow] := FindField('AM_EMAIL2').AsString;
        cells[8,nRow] := FindField('AM_ETC').AsString;
        cells[9,nRow] := FindField('AM_GUBUN').AsString;


        if (FindField('AC_COMPANYID').AsString + FindField('AM_MANAGERID').AsString)   = (aCompanyCode + aManagerID)  then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_ManagerClick(sg_Manager);
end;

function TfmManagerAdmin1.UpdateTB_AUTHMANAGER(aCompanyCode, aManagerID,
  aManagerName, aDepartName, aPosiName, aEmail1, aEmail2,
  aManagerGubunCode, aetc: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_AUTHMANAGER set ';
  stSql := stSql + 'AM_USERNAME = ''' + aManagerName + ''',';
  stSql := stSql + 'AM_DEPARTNAME = ''' + aDepartName + ''',';
  stSql := stSql + 'AM_POSI = ''' + aPosiName + ''',';
  stSql := stSql + 'AM_EMAIL1 = ''' + aEmail1 + ''',';
  stSql := stSql + 'AM_EMAIL2 = ''' + aEmail2 + ''',';
  stSql := stSql + 'AM_ETC = ''' + aetc + ''',';
  stSql := stSql + 'AM_GUBUN = ''' + aManagerGubunCode + ''' ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND AM_MANAGERID = ' + aManagerID;

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

procedure TfmManagerAdmin1.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  ManagerGubunCodeList.Free;

end;

procedure TfmManagerAdmin1.btn_SearchClick(Sender: TObject);
begin
  ShowManagerList('','');

end;

procedure TfmManagerAdmin1.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  LoadCompanyCode(cmb_CompanyCode1,True);
  LoadCompanyCode(cmb_CompanyCode2,False);
  LoadManagerGubunCode(cmb_managerGubun);
  LoadDepartName('',cmb_Depart);

  if Trim(L_sCompanyID) <> '' then
  begin
    nIndex := CompanyCodeList.IndexOf(L_sCompanyID);
    if nIndex > 0 then
    begin
      cmb_CompanyCode1.ItemIndex := nIndex;
      cmb_CompanyCode1.Enabled := False;
      cmb_CompanyCode2.ItemIndex := nIndex;
    end;
  end;
  btn_SearchClick(self);

  if Trim(L_sTelNum) <> '' then
  begin
    btn_InsertClick(btn_Insert);
    ed_AddPhone.Text := L_sTelNum;
  end;

end;

procedure TfmManagerAdmin1.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Manager do
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

  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    cmb_CompanyCode2.ItemIndex := cmb_CompanyCode1.ItemIndex;
    ed_ManagerID.Text := GetManagerID(CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex]);
  end;
end;

procedure TfmManagerAdmin1.cmb_CompanyCode2Change(Sender: TObject);
begin
  if cmb_CompanyCode2.ItemIndex > 0 then
  begin
    ed_ManagerID.Text := GetManagerID(CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex]);
  end;

end;

procedure TfmManagerAdmin1.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);
  ed_ManagerName.SetFocus;

end;

procedure TfmManagerAdmin1.btn_CancelClick(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_CompanyCode2.ItemIndex > 0 then
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex];
  if UpperCase(State) = 'INSERT' then
  begin
    DeleteTB_CUSTOMERIDMangerID(stCompanyCode,ed_ManagerID.Text);
  end;
  ShowManagerList(stCompanyCode,ed_ManagerID.Text);
end;

procedure TfmManagerAdmin1.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  stCompanyCode : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  stCompanyCode := '';
  if cmb_CompanyCode2.ItemIndex > 0 then
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex];

  bResult := DeleteTB_AUTHMANAGER(stCompanyCode,ed_ManagerID.Text);

  if bResult then ShowManagerList(stCompanyCode,ed_ManagerID.Text)
  else showmessage('삭제실패.');
end;

procedure TfmManagerAdmin1.sg_PhoneButtonClick(Sender: TObject; ACol,
  ARow: Integer);
begin
  if Not L_bVisitEditMode then Exit;
  with sg_Phone do
  begin
    if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    DeleteTB_CUSTOMERID(Cells[2,ARow]); //해당 전화번호를 삭제
    ClearRows(ARow,1);
    if rowCount > 2 then RemoveRows(ARow,1);
  end;
end;

procedure TfmManagerAdmin1.sg_PhoneCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  if Not L_bVisitEditMode then Exit;
  if ACol = 0 then canEDIT := True
  else  canEDIT := False;

end;

procedure TfmManagerAdmin1.btn_PhoneAddClick(Sender: TObject);
var
  stCompanyCode : string;
  stPhoneNumber : string;
begin
  if cmb_CompanyCode2.ItemIndex < 1 then
  begin
    showmessage('회사를 선택해 주세요');
    Exit;
  end;
  stCompanyCode := '';
  if cmb_CompanyCode2.ItemIndex > 0 then
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.itemIndex];

  stPhoneNumber := stringReplace(ed_AddPhone.Text,'-','',[rfReplaceAll]);
  stPhoneNumber := stringReplace(stPhoneNumber,' ','',[rfReplaceAll]);
  if Trim(stPhoneNumber) = '' then
  begin
    Exit;
  end;
  if Not CheckTB_CUSTOMERID(stCompanyCode,stPhoneNumber) then
     InsertTB_CUSTOMERID(stCompanyCode,ed_ManagerID.Text,stPhoneNumber,copy(cmb_PhoneGubun.Text,1,1))
  else UpdateTB_CUSTOMERID(stCompanyCode,ed_ManagerID.Text,stPhoneNumber,copy(cmb_PhoneGubun.Text,1,1));

  if Not CheckTB_LASTCUSTOMERID(stPhoneNumber) then
     InsertTB_LASTCUSTOMERID(stCompanyCode,ed_ManagerID.Text,stPhoneNumber,copy(cmb_PhoneGubun.Text,1,1))
  else UpdateTB_LASTCUSTOMERID(stCompanyCode,ed_ManagerID.Text,stPhoneNumber,copy(cmb_PhoneGubun.Text,1,1));

  searchPhoneList(stCompanyCode,ed_ManagerID.Text);
end;

procedure TfmManagerAdmin1.sg_ManagerClick(Sender: TObject);
var
  nIndex : integer;
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_Manager do
  begin
    if cells[5,Row] = '' then Exit;
    nIndex := CompanyCodeList.IndexOf(cells[4,Row]);
    cmb_CompanyCode2.ItemIndex := nIndex;
    ed_ManagerID.Text := cells[5,Row];
    ed_ManagerName.Text := cells[3,Row];
    ed_DepartName.Text := cells[1,Row];
    ed_PosiName.Text := cells[2,Row];
    cmb_managerGubun.ItemIndex := ManagerGubunCodeList.IndexOf(cells[9,Row]);
    ed_Email1.Text := cells[6,Row];
    ed_Email2.Text := cells[7,Row];
    mem_etc.Text := cells[8,Row];

    searchPhoneList(cells[4,Row],cells[5,Row]);
  end;
end;

procedure TfmManagerAdmin1.btn_SaveClick(Sender: TObject);
var
  bResult : Boolean;
  stCompanyCode : string;
  stManagerGubunCode : string;
begin
//
  if cmb_CompanyCode2.ItemIndex < 1 then
  begin
    showmessage('회사코드를 선택하세요.');
    Exit;
  end;
  stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode2.ItemIndex];
  stManagerGubunCode := '';
  if cmb_managerGubun.ItemIndex > 0 then
    stManagerGubunCode := ManagerGubunCodeList.Strings[cmb_managerGubun.ItemIndex];
  if UpperCase(State) = 'INSERT' then
  begin
    bResult := InsertTB_AUTHMANAGER(stCompanyCode,
                                    ed_ManagerID.Text,
                                    ed_ManagerName.Text,
                                    ed_DepartName.Text,
                                    ed_PosiName.Text,
                                    ed_Email1.Text,
                                    ed_Email2.Text,
                                    stManagerGubunCode,
                                    mem_etc.Text
                                    );
  end
  else if UpperCase(State) = 'UPDATE' then
  begin
    bResult := UpdateTB_AUTHMANAGER(stCompanyCode,
                                    ed_ManagerID.Text,
                                    ed_ManagerName.Text,
                                    ed_DepartName.Text,
                                    ed_PosiName.Text,
                                    ed_Email1.Text,
                                    ed_Email2.Text,
                                    stManagerGubunCode,
                                    mem_etc.Text
                                    );
  end;
  if bResult then ShowManagerList(stCompanyCode,ed_ManagerID.Text)
  else showmessage('저장실패');
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

procedure TfmManagerAdmin1.LoadDepartName(aCompanyCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
begin
  cmb_Box.Clear;
  cmb_Box.Items.Add('전체');
  cmb_Box.ItemIndex := 0;
  if aCompanyCode = '' then Exit;
  stSql := 'Select AM_DEPARTNAME From TB_AUTHMANAGER ';
  stSql := stSql + ' Where AC_COMPANYID = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' GROUP BY AM_DEPARTNAME ';

  with TempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AM_DEPARTNAME').AsString);
      Next;
    end;
  end;

end;

procedure TfmManagerAdmin1.cmb_CompanyCode1Change(Sender: TObject);
var
  stCompanyCode : string;
begin
  stCompanyCode := '';
  if cmb_CompanyCode1.ItemIndex > 0 then
  begin
    stCompanyCode := CompanyCodeList.Strings[cmb_CompanyCode1.ItemIndex];
  end;
  LoadDepartName(stCompanyCode,cmb_Depart);
  btn_SearchClick(Self);
end;

procedure TfmManagerAdmin1.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmManagerAdmin1.ed_sManagerNameKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

procedure TfmManagerAdmin1.ed_sManagerPhoneKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  btn_SearchClick(Self);

end;

end.
