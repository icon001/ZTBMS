unit uEmployExtraAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, StdCtrls, Buttons, ComCtrls, ExtCtrls,
  uSubForm, CommandArray,ADODB, DB,ActiveX;

type
  TfmEmployExtraAdmin = class(TfmASubForm)
    Panel12: TPanel;
    Panel2: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    StatusBar1: TStatusBar;
    Panel3: TPanel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label21: TLabel;
    btn_Close: TSpeedButton;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_EmpNo: TEdit;
    ed_EmpNM: TEdit;
    btn_Search: TBitBtn;
    cmb_Jijum: TComboBox;
    sg_Employ: TAdvStringGrid;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    rg_ExtraType: TRadioGroup;
    PageControl1: TPageControl;
    WeekDayTab: TTabSheet;
    SaturdayTab: TTabSheet;
    HolidayTab: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ed_WEarlyAmt: TEdit;
    Label13: TLabel;
    ed_WExtendAmt: TEdit;
    Label14: TLabel;
    ed_WNightAmt: TEdit;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    ed_SEarlyAmt: TEdit;
    Label19: TLabel;
    Label20: TLabel;
    ed_SExtendAmt: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    ed_SNightAmt: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    ed_HEarlyAmt: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    ed_HExtendAmt: TEdit;
    Label28: TLabel;
    Label29: TLabel;
    ed_HNightAmt: TEdit;
    Label30: TLabel;
    st_Companyname: TStaticText;
    st_jijumName: TStaticText;
    st_DepartName: TStaticText;
    st_PositionName: TStaticText;
    st_EmNo: TStaticText;
    st_EmNm: TStaticText;
    chk_Extra: TCheckBox;
    ed_CompanyCode: TEdit;
    ADOQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure sg_EmployClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
  private
    State : string;
    bATTypePay : Boolean;
    bSaturDay :Boolean;
    ChangATType : integer; //교대근무타입 0:고정근무타입,1:사원별근무타입,2:교대근무타입

    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    { Private declarations }
    procedure ShowEmployee(aCode:string);
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure GetATTypeConfig;

    Function CheckTB_ATEMPEXTRA(aCompanyCode,aEmCode:string):Boolean;
    Function DeleteTB_ATEMPEXTRA(aCompanyCode,aEmCode:string):Boolean;
    Function UpdateTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,aWEarlyAmt,aWExtendAmt,
                        aWNightAmt,aSEarlyAmt,aSExtendAmt,
                        aSNightAmt,aHEarlyAmt,aHExtendAmt,
                        aHNightAmt:string):Boolean;
    Function InsertIntoTB_ATEMPEXTRA(aCompanyCode,aEmCode,
                        aExtraType,aWEarlyAmt,aWExtendAmt,
                        aWNightAmt,aSEarlyAmt,aSExtendAmt,
                        aSNightAmt,aHEarlyAmt,aHExtendAmt,
                        aHNightAmt:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmEmployExtraAdmin: TfmEmployExtraAdmin;

implementation
uses uDataModule1,
     uLomosUtil,
     uCompanyCodeLoad, uMssql, uPostGreSql, uMDBSql;

{$R *.dfm}

procedure TfmEmployExtraAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmEmployExtraAdmin.FormCreate(Sender: TObject);
begin

  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;

  State := '';
  GridInit(sg_Employ,6);
end;

procedure TfmEmployExtraAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
end;

procedure TfmEmployExtraAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  PageControl1.ActivePageIndex := 0;
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadPosiCode('',PosiCodeList,cmb_Posi);

  GridInit(sg_Employ,6);
  FormClear;

  btn_Update.Enabled := False;
  btn_Save.Enabled := False;
  btn_Delete.Enabled := False;

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

  btn_SearchClick(Self);
end;

procedure TfmEmployExtraAdmin.FormShow(Sender: TObject);
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

  GetATTypeConfig;
  if bSaturDay then  SaturdayTab.TabVisible := True
  else SaturdayTab.TabVisible := False;
end;

procedure TfmEmployExtraAdmin.btn_SearchClick(Sender: TObject);
begin
  ShowEmployee('');
end;

procedure TfmEmployExtraAdmin.ShowEmployee(aCode: string);
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
begin
  RowGridInitialize(sg_Employ); //스트링그리드 초기화

  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  if DBTYPE = 'MSSQL' then stSql :=  Mssql.SelectTB_EMPLOYEEATJoinExtraBase
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATJoinExtraBase
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATJoinExtraBase
  else Exit;

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
          stSql := stSql + ' a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[i] + ''' ';
        end;
        stSql := stSql + ')'; 
      end else stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '2' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
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
          stSql := stSql + ' a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end else if CompanyGrade = '3' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 회사코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 지점코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
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
          stSql := stSql + ' a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' '; 
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;

  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND a.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';
  if Trim(ed_EmpNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_EmpNo.Text)  + ''' ';
  if Trim(ed_EmpNM.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_EmpNM.Text)  + '%'' ';

  if chk_Extra.Checked then
  begin
    stSql := stSql + ' AND NOT EXISTS (SELECT EM_CODE FROM TB_ATEMPEXTRA G WHERE G.GROUP_CODE = a.GROUP_CODE AND G.CO_COMPANYCODE = a.CO_COMPANYCODE AND G.EM_CODE = a.EM_CODE ) ';
  end;

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

    sg_Employ.RowCount := RecordCount + 1;
    nRow := 1;
    First;
    while Not Eof do
    begin
      with sg_Employ do
      begin
        cells[0,nRow] := FindField('COMPANYNAME').AsString;
        cells[1,nRow] := FindField('JIJUMNAME').AsString;
        cells[2,nRow] := FindField('DEPARTNAME').AsString;
        cells[3,nRow] := FindField('PO_NAME').AsString;
        cells[4,nRow] := FindField('EM_CODE').AsString;
        cells[5,nRow] := FindField('EM_NAME').AsString;
        cells[6,nRow] := FindField('CO_COMPANYCODE').AsString;
        cells[7,nRow] := FindField('EX_TYPE').AsString;
        cells[8,nRow] := FindField('EX_WEARLYAMT').AsString;
        cells[9,nRow] := FindField('EX_WEXTENDAMT').AsString;
        cells[10,nRow] := FindField('EX_WNIGHTAMT').AsString;
        cells[11,nRow] := FindField('EX_SEARLYAMT').AsString;
        cells[12,nRow] := FindField('EX_SEXTENDAMT').AsString;
        cells[13,nRow] := FindField('EX_SNIGHTAMT').AsString;
        cells[14,nRow] := FindField('EX_HEARLYAMT').AsString;
        cells[15,nRow] := FindField('EX_HEXTENDAMT').AsString;
        cells[16,nRow] := FindField('EX_HNIGHTAMT').AsString;

        if (FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString)  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      nRow := nRow + 1;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  sg_EmployClick(sg_Employ);


end;

procedure TfmEmployExtraAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(Self);

end;

procedure TfmEmployExtraAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmEmployExtraAdmin.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmEmployExtraAdmin.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmEmployExtraAdmin.ButtonEnable(aState: string);
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

procedure TfmEmployExtraAdmin.FormClear;
begin
  ed_CompanyCode.Text := '';
  st_Companyname.Caption := '';
  st_jijumName.Caption := '';
  st_DepartName.Caption := '';
  st_PositionName.Caption := '';
  st_EmNo.Caption := '';
  st_EmNm.Caption := '';
  rg_ExtraType.ItemIndex := -1;
  ed_WEarlyAmt.Text := '0';
  ed_WExtendAmt.Text := '0';
  ed_WNightAmt.Text := '0';
  ed_SEarlyAmt.Text := '0';
  ed_SExtendAmt.Text := '0';
  ed_SNightAmt.Text := '0';
  ed_HNightAmt.Text := '0';
end;

procedure TfmEmployExtraAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_Employ.Enabled := False;
    rg_ExtraType.Enabled := True;
    ed_WEarlyAmt.Enabled := True;
    ed_WExtendAmt.Enabled := True;
    ed_WNightAmt.Enabled := True;
    ed_SEarlyAmt.Enabled := True;
    ed_SExtendAmt.Enabled := True;
    ed_SNightAmt.Enabled := True;
    ed_HEarlyAmt.Enabled := True;
    ed_HExtendAmt.Enabled := True;
    ed_HNightAmt.Enabled := True;

  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_Employ.Enabled := True;
    rg_ExtraType.Enabled := False;
    ed_WEarlyAmt.Enabled := False;
    ed_WExtendAmt.Enabled := False;
    ed_WNightAmt.Enabled := False;
    ed_SEarlyAmt.Enabled := False;
    ed_SExtendAmt.Enabled := False;
    ed_SNightAmt.Enabled := False;
    ed_HEarlyAmt.Enabled := False;
    ed_HExtendAmt.Enabled := False;
    ed_HNightAmt.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_Employ.Enabled := True;
    rg_ExtraType.Enabled := False;
    ed_WEarlyAmt.Enabled := False;
    ed_WExtendAmt.Enabled := False;
    ed_WNightAmt.Enabled := False;
    ed_SEarlyAmt.Enabled := False;
    ed_SExtendAmt.Enabled := False;
    ed_SNightAmt.Enabled := False;
    ed_HEarlyAmt.Enabled := False;
    ed_HExtendAmt.Enabled := False;
    ed_HNightAmt.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_Employ.Enabled := False;
    rg_ExtraType.Enabled := True;
    ed_WEarlyAmt.Enabled := True;
    ed_WExtendAmt.Enabled := True;
    ed_WNightAmt.Enabled := True;
    ed_SEarlyAmt.Enabled := True;
    ed_SExtendAmt.Enabled := True;
    ed_SNightAmt.Enabled := True;
    ed_HEarlyAmt.Enabled := True;
    ed_HExtendAmt.Enabled := True;
    ed_HNightAmt.Enabled := True;
  end;
end;

procedure TfmEmployExtraAdmin.sg_EmployClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with sg_Employ do
  begin
    ed_CompanyCode.Text := Cells[6,Row];
    st_Companyname.Caption := Cells[0,Row];
    st_jijumName.Caption := Cells[1,Row];
    st_DepartName.Caption := Cells[2,Row];
    st_PositionName.Caption := Cells[3,Row];
    st_EmNo.Caption := Cells[4,Row];
    st_EmNm.Caption := Cells[5,Row];
    if Not IsDigit(Trim(Cells[7,Row])) then rg_ExtraType.ItemIndex := 0
    else rg_ExtraType.ItemIndex := strtoint(Cells[7,Row]);
    if Trim(Cells[8,Row]) = '' then ed_WEarlyAmt.Text := '0'
    else ed_WEarlyAmt.Text := Cells[8,Row];
    if Trim(Cells[9,Row]) = '' then ed_WExtendAmt.Text := '0'
    else ed_WExtendAmt.Text := Cells[9,Row];
    if Trim(Cells[10,Row]) = '' then ed_WNightAmt.Text := '0'
    else ed_WNightAmt.Text := Cells[10,Row];
    if Trim(Cells[11,Row]) = '' then ed_SEarlyAmt.Text := '0'
    else ed_SEarlyAmt.Text := Cells[11,Row];
    if Trim(Cells[12,Row]) = '' then ed_SExtendAmt.Text := '0'
    else ed_SExtendAmt.Text := Cells[12,Row];
    if Trim(Cells[13,Row]) = '' then ed_SNightAmt.Text := '0'
    else ed_SNightAmt.Text := Cells[13,Row];
    if Trim(Cells[14,Row]) = '' then ed_HEarlyAmt.Text := '0'
    else ed_HEarlyAmt.Text := Cells[14,Row];
    if Trim(Cells[15,Row]) = '' then ed_HExtendAmt.Text := '0'
    else ed_HExtendAmt.Text := Cells[15,Row];
    if Trim(Cells[16,Row]) = '' then ed_HNightAmt.Text := '0'
    else ed_HNightAmt.Text := Cells[16,Row];
  end;
end;

procedure TfmEmployExtraAdmin.GetATTypeConfig;
var
  stSql : string;
begin
  bATTypePay := True;
  bSaturDay := True;

  stSql := ' select * from TB_CONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ( (CO_CONFIGGROUP = ''ATTEND'' AND CO_CONFIGCODE = ''SATURDAY'') ';
  stSql := stSql + ' OR (CO_CONFIGGROUP = ''ATTEND'' AND CO_CONFIGCODE = ''ATTYPE'')  ';
  stSql := stSql + ' OR (CO_CONFIGGROUP = ''PAY'' AND CO_CONFIGCODE = ''ATTYPEPAY'') ) ';

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
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
      begin
        if FindField('CO_CONFIGVALUE').AsInteger =  1 then bSaturDay := True
        else bSaturDay := False;
      end
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
      begin
        ChangATType := FindField('CO_CONFIGVALUE').AsInteger;
      end
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then
      begin
        if FindField('CO_CONFIGVALUE').AsInteger =  0 then bATTypePay := True
        else bATTypePay := False;
      end;
      Next;
    end;
  end;

end;

procedure TfmEmployExtraAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';

  FormEnable(State);
  ButtonEnable(State);

end;

procedure TfmEmployExtraAdmin.btn_CancelClick(Sender: TObject);
begin
  ShowEmployee(ed_CompanyCode.Text + st_EmNo.Caption);

end;

procedure TfmEmployExtraAdmin.btn_DeleteClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  DeleteTB_ATEMPEXTRA(ed_CompanyCode.Text,st_EmNo.Caption);
  ShowEmployee(ed_CompanyCode.Text + st_EmNo.Caption);
end;

function TfmEmployExtraAdmin.DeleteTB_ATEMPEXTRA(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_ATEMPEXTRA ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmEmployExtraAdmin.btn_SaveClick(Sender: TObject);
var
  nExtraType : integer;
  stWEarlyAmt :string;
  stWExtendAmt :string;
  stWNightAmt :string;
  stSEarlyAmt :string;
  stSExtendAmt :string;
  stSNightAmt :string;
  stHEarlyAmt :string;
  stHExtendAmt :string;
  stHNightAmt :string;
begin

  if rg_ExtraType.ItemIndex < 0 then nExtraType := 0
  else nExtraType := rg_ExtraType.ItemIndex;
  stWEarlyAmt := ed_WEarlyAmt.Text;
  stWEarlyAmt := StringReplace(stWEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stWEarlyAmt) then stWEarlyAmt := '0';
  stWExtendAmt := ed_WExtendAmt.Text;
  stWExtendAmt := StringReplace(stWExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stWExtendAmt) then stWExtendAmt := '0';
  stWNightAmt := ed_WNightAmt.Text;
  stWNightAmt := StringReplace(stWNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stWNightAmt) then stWNightAmt := '0';

  stSEarlyAmt := ed_SEarlyAmt.Text;
  stSEarlyAmt := StringReplace(stSEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stSEarlyAmt) then stSEarlyAmt := '0';
  stSExtendAmt := ed_SExtendAmt.Text;
  stSExtendAmt := StringReplace(stSExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stSExtendAmt) then stSExtendAmt := '0';
  stSNightAmt := ed_SNightAmt.Text;
  stSNightAmt := StringReplace(stSNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stSNightAmt) then stSNightAmt := '0';

  stHEarlyAmt := ed_HEarlyAmt.Text;
  stHEarlyAmt := StringReplace(stHEarlyAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stHEarlyAmt) then stHEarlyAmt := '0';
  stHExtendAmt := ed_HExtendAmt.Text;
  stHExtendAmt := StringReplace(stHExtendAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stHExtendAmt) then stHExtendAmt := '0';
  stHNightAmt := ed_HNightAmt.Text;
  stHNightAmt := StringReplace(stHNightAmt,',','',[rfReplaceAll]);
  if Not IsDigit(stHNightAmt) then stHNightAmt := '0';

  if CheckTB_ATEMPEXTRA(ed_CompanyCode.Text,st_EmNo.Caption) then
  begin
    UpdateTB_ATEMPEXTRA(ed_CompanyCode.Text,st_EmNo.Caption,
                        inttostr(nExtraType),
                        stWEarlyAmt,
                        stWExtendAmt,
                        stWNightAmt,
                        stSEarlyAmt,
                        stSExtendAmt,
                        stSNightAmt,
                        stHEarlyAmt,
                        stHExtendAmt,
                        stHNightAmt);

  end else
  begin
    InsertIntoTB_ATEMPEXTRA(ed_CompanyCode.Text,st_EmNo.Caption,
                        inttostr(nExtraType),
                        stWEarlyAmt,
                        stWExtendAmt,
                        stWNightAmt,
                        stSEarlyAmt,
                        stSExtendAmt,
                        stSNightAmt,
                        stHEarlyAmt,
                        stHExtendAmt,
                        stHNightAmt);
  end;
  ShowEmployee(ed_CompanyCode.Text + st_EmNo.Caption);
end;

function TfmEmployExtraAdmin.CheckTB_ATEMPEXTRA(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_ATEMPEXTRA ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  With AdoQuery do
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

  end;
  result := True;

end;

function TfmEmployExtraAdmin.InsertIntoTB_ATEMPEXTRA(aCompanyCode, aEmCode,
  aExtraType, aWEarlyAmt, aWExtendAmt, aWNightAmt, aSEarlyAmt, aSExtendAmt,
  aSNightAmt, aHEarlyAmt, aHExtendAmt, aHNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Insert Into TB_ATEMPEXTRA(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' EX_TYPE,';
  stSql := stSql + ' EX_WEARLYAMT,';
  stSql := stSql + ' EX_WEXTENDAMT,';
  stSql := stSql + ' EX_WNIGHTAMT,';
  stSql := stSql + ' EX_SEARLYAMT,';
  stSql := stSql + ' EX_SEXTENDAMT,';
  stSql := stSql + ' EX_SNIGHTAMT,';
  stSql := stSql + ' EX_HEARLYAMT,';
  stSql := stSql + ' EX_HEXTENDAMT,';
  stSql := stSql + ' EX_HNIGHTAMT ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''', ';
  stSql := stSql + '''' + aCompanyCode + ''', ';
  stSql := stSql + '''' + aEmCode + ''', ';
  stSql := stSql + '''' + aExtraType + ''', ';
  stSql := stSql + '''' + aWEarlyAmt + ''', ';
  stSql := stSql + '''' + aWExtendAmt + ''', ';
  stSql := stSql + '''' + aWNightAmt + ''', ';
  stSql := stSql + '''' + aSEarlyAmt + ''', ';
  stSql := stSql + '''' + aSExtendAmt + ''', ';
  stSql := stSql + '''' + aSNightAmt + ''', ';
  stSql := stSql + '''' + aHEarlyAmt + ''', ';
  stSql := stSql + '''' + aHExtendAmt + ''', ';
  stSql := stSql + '''' + aHNightAmt + ''') ';

  Result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmEmployExtraAdmin.UpdateTB_ATEMPEXTRA(aCompanyCode, aEmCode,
  aExtraType, aWEarlyAmt, aWExtendAmt, aWNightAmt, aSEarlyAmt, aSExtendAmt,
  aSNightAmt, aHEarlyAmt, aHExtendAmt, aHNightAmt: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Update TB_ATEMPEXTRA set ';
  stSql := stSql + ' EX_TYPE = ''' + aExtraType + ''', ';
  stSql := stSql + ' EX_WEARLYAMT = ''' + aWEarlyAmt + ''', ';
  stSql := stSql + ' EX_WEXTENDAMT = ''' + aWExtendAmt + ''', ';
  stSql := stSql + ' EX_WNIGHTAMT = ''' + aWNightAmt + ''', ';
  stSql := stSql + ' EX_SEARLYAMT = ''' + aSEarlyAmt + ''', ';
  stSql := stSql + ' EX_SEXTENDAMT = ''' + aSExtendAmt + ''', ';
  stSql := stSql + ' EX_SNIGHTAMT = ''' + aSNightAmt + ''', ';
  stSql := stSql + ' EX_HEARLYAMT = ''' + aHEarlyAmt + ''', ';
  stSql := stSql + ' EX_HEXTENDAMT = ''' + aHExtendAmt + ''', ';
  stSql := stSql + ' EX_HNIGHTAMT = ''' + aHNightAmt + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE =''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Result := DataModule1.ProcessExecSQL(stSql);
end;

end.
