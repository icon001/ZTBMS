unit uKTIssusNReg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Buttons, StdCtrls, Grids, BaseGrid, AdvGrid, ComCtrls,
  uSubForm, CommandArray, DB, ADODB,ActiveX, AdvObj;

type
  TfmKTIssusNReg = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    lb_JijumName: TLabel;
    cmb_Jijum: TComboBox;
    lb_DepartName: TLabel;
    cmb_Depart: TComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TComboBox;
    GroupBox3: TGroupBox;
    cmb_RegGubun: TComboBox;
    Label1: TLabel;
    btn_Search: TBitBtn;
    btn_Close: TSpeedButton;
    btn_Upload: TBitBtn;
    btn_Backup: TSpeedButton;
    sg_Employ: TAdvStringGrid;
    lb_RegDate: TLabel;
    dt_FromDate: TDateTimePicker;
    dt_ToDate: TDateTimePicker;
    ADOQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    StatusBar1: TStatusBar;
    sg_UploadEmployee: TAdvStringGrid;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_SearchClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_RegGubunChange(Sender: TObject);
    procedure sg_EmployCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure btn_BackupClick(Sender: TObject);
    procedure btn_UploadClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    CheckCount : integer;
    { Private declarations }
    procedure AdvStrinGridSetAllCheck(Sender: TObject;bchkState:Boolean);
    function EmployeeFormCheck:Boolean;
    function EmployeeInsert:Boolean;
    Function CheckTB_EMPLOYEE(aCompanyCode,aEmpID:string;var aFdmsID:string):Boolean;
    Function CheckTB_CARDEmployeeNo(aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_CARD(aCardNo:string) : Boolean;
    Function CheckTB_KTCARDISSUE(aEmCode:string;var aCardSeq:string):Boolean;
    Function GetMaxPositionNum : integer;

    Function SaveTB_KTCARDISSUE(aEmCode,aCardSeq:string;aWrite:string = 'N';aWriteDate:string = ''):Boolean;

    Function InsertTB_DEVICECARDNONotExist(aOldCardNO,aNewCardNO:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(aEmpID,aEmpNM,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aCompanyPhone,
                                 aJoinDate,aRetireDate,aZipcode,aAddr1,aAddr2,aHomePhone,aHandphone,
                                 afdmsID,aCardNo,aEmpImg:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate:string):Boolean;

    Function UpdateTB_CARDEmployeeNo(aCompanyCode,aEmCode,aCardNo,aFdmsID:string):Boolean;
    Function UpdateTB_DEVICECARDNOPermitDelete(aOldCardNo:string):Boolean;
    Function UpdateTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate:string):Boolean;

    Function DeleteTB_CARDCardNo(aOldCardNO:string):Boolean;
    Function DeleteTB_DEVICECARDNOCardNo(aCardNo:string):Boolean;

    Function ChangeCardNo(aOldCardNo,aNewCardNo,aCompanyCode,aEmCode,aFdmsID:string):Boolean;

    Function CopyGradeOldCard(aOldCard,aNewCard:string):Boolean;
    Function GetMaxFdmsID:integer;
  public
    { Public declarations }
  end;

var
  fmKTIssusNReg: TfmKTIssusNReg;

implementation
uses
  uCompanyCodeLoad,
  uDataModule1,
  uLomosUtil, uCommonSql;
{$R *.dfm}

procedure TfmKTIssusNReg.btn_CloseClick(Sender: TObject);
begin
  Close;
end;


procedure TfmKTIssusNReg.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTIssusNReg';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  Action := caFree;
end;

procedure TfmKTIssusNReg.btn_SearchClick(Sender: TObject);
var
  stSql :string;
  nRow : integer;
  i : integer;
begin
  CheckCount := 0;

  GridInitialize(sg_Employ,2,True); //스트링그리드 초기화
  stSql := ' select a.*,b.CA_CARDNO,c.CARD_SEQ ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE )';
  stSql := stSql + ' Left Join TB_KTCARDISSUE c ';
  stSql := stSql + ' ON(a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = c.EM_CODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if cmb_RegGubun.ItemIndex = 1 then
  begin
    stSql := stSql + ' AND c.KI_WRITE = ''Y'' ';
    stSql := stSql + ' AND c.KI_WRITEDATE Between ''' + FormatDateTime('yyyymmdd',dt_FromDate.Date) + ''' ';
    stSql := stSql + ' AND ''' + FormatDateTime('yyyymmdd',dt_ToDate.Date) + ''' ';
  end;

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('조회할수 있는 권한이 없습니다.');
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
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        if JijumCodeList.Count < 2 then
        begin
          showmessage('조회할수 있는 권한이 없습니다.');
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
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ';
      if cmb_Jijum.ItemIndex < 1 then
      begin
        showmessage('관리자 소속 코드가 이상합니다.');
        Exit;
      end;
      stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('조회할수 있는 권한이 없습니다.');
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

  stSql := stSql + ' order by a.EM_CODE ';

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
    if recordCount < 1 then Exit;
    sg_Employ.RowCount := recordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_Employ do
      begin
        Cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[1,nRow] := FindField('EM_CODE').AsString;
        Cells[2,nRow] := FindField('EM_NAME').AsString;
        Cells[3,nRow] := FindField('CA_CARDNO').AsString;
        Cells[4,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[5,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[6,nRow] := FindField('PO_POSICODE').AsString;
        Cells[7,nRow] := FindField('EM_COPHONE').AsString;
        Cells[8,nRow] := FindField('EM_HOMEPHONE').AsString;
        Cells[9,nRow] := FindField('EM_HANDPHONE').AsString;
        Cells[10,nRow] := FindField('ZI_ZIPCODE').AsString;
        Cells[11,nRow] := FindField('EM_ADDR1').AsString;
        Cells[12,nRow] := FindField('EM_ADDR2').AsString;
        Cells[13,nRow] := FindField('EM_JOINDATE').AsString;
        Cells[14,nRow] := FindField('EM_RETIREDATE').AsString;
        Cells[15,nRow] := FindField('EM_IMAGE').AsString;
        Cells[15,nRow] := stringReplace(Cells[15,nRow],'\\','\',[rfReplaceAll]);
        if Not FindField('CARD_SEQ').isNull then
          Cells[16,nRow] := inttostr(FindField('CARD_SEQ').AsInteger);
        AddCheckBox(0,nRow,False,False);
      end;
      inc(nRow);
      Next;
    end;
  end;


end;

procedure TfmKTIssusNReg.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;

  dt_FromDate.DateTime := Now;
  dt_ToDate.DateTime := Now;
end;

procedure TfmKTIssusNReg.FormShow(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
  nIndex : integer;
begin
  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  stJijumCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);
  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);
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
  end else
  begin
    if cmb_Company.ItemIndex > -1 then LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  end;
  if cmb_Jijum.ItemIndex > -1 then LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

  CheckCount := 0;
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'KTIssusNReg';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  if G_nSearchIndex = 0 then btn_SearchClick(self);
end;

procedure TfmKTIssusNReg.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmKTIssusNReg.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmKTIssusNReg.cmb_DepartChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmKTIssusNReg.cmb_PosiChange(Sender: TObject);
begin
  if G_nSearchIndex = 0 then btn_SearchClick(self);

end;

procedure TfmKTIssusNReg.cmb_RegGubunChange(Sender: TObject);
begin
  if cmb_RegGubun.ItemIndex <> 1 then
  begin
    lb_RegDate.Visible := False;
    dt_FromDate.Visible := False;
    dt_ToDate.Visible := False;
  end else
  begin
    lb_RegDate.Visible := True;
    dt_FromDate.Visible := True;
    dt_ToDate.Visible := True;
  end;
end;

procedure TfmKTIssusNReg.sg_EmployCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then CheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else CheckCount := 0;
    AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then CheckCount := CheckCount + 1
    else CheckCount := CheckCount - 1 ;
  end;

end;

procedure TfmKTIssusNReg.AdvStrinGridSetAllCheck(Sender: TObject;
  bchkState: Boolean);
var
  i : integer;
begin
    for i:= 1 to (Sender as TAdvStringGrid).RowCount - 1  do
    begin
      (Sender as TAdvStringGrid).SetCheckBoxState(0,i,bchkState);
    end;

end;

procedure TfmKTIssusNReg.btn_BackupClick(Sender: TObject);
var
  stFileName : string;
  i : integer;
  stTemps : Tstrings;
  TempList : TStringList;
  bchkState : Boolean;
begin
  if CheckCount < 1 then
  begin
    showmessage('파일저장할 사원이 선택되지 않았습니다.');
    Exit;
  end;
  SaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
    stFileName:= SaveDialog1.FileName;
  end else Exit;
  btn_Backup.Enabled := False;

  Try
    if CheckCount = (sg_Employ.RowCount - 1) then
    begin
      sg_Employ.SaveToCSV(stFileName);
      showmessage('저장완료');
      Exit;
    end;
    TempList := TStringList.Create;
    TempList.Clear;
    stTemps := sg_Employ.Rows[0];
    stTemps.Delimiter := ',';
    TempList.Add(stTemps.DelimitedText);
    for i := 1 to sg_Employ.RowCount - 1 do
    begin
      sg_Employ.GetCheckBoxState(0,i, bchkState);
      if bchkState then  //체크 되어 있으면 파일등록
      begin
        stTemps := sg_Employ.Rows[i];
        stTemps.Delimiter := ',';
        TempList.Add(stTemps.DelimitedText);
      end;
    end;

    TempList.SaveToFile(stFileName);
    TempList.Free;
    showmessage('저장완료');
  Finally
    btn_Backup.Enabled := True;
  End;

end;

procedure TfmKTIssusNReg.btn_UploadClick(Sender: TObject);
var
  stFile : string;
  i : integer;
begin
  CheckCount := 0;

  GridInitialize(sg_UploadEmployee); //스트링그리드 초기화
  OpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'CSV files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
    stFile:= OpenDialog1.FileName;
    sg_UploadEmployee.LoadFromCSV(stFile);
  end else Exit;

  Try
    if Not EmployeeFormCheck then Exit;
    if Not EmployeeInsert then
    begin
      showmessage('사원정보 입력에 실패했습니다.');
      Exit;
    end;
  Finally
    btn_SearchClick(self);
  End;

end;

function TfmKTIssusNReg.EmployeeFormCheck: Boolean;
var
  i : integer;
  stCompanyCode,stEmployee:string;
begin
  result := False;
  with sg_UploadEmployee do
  begin
    for i := 1 to RowCount - 1 do
    begin
      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(RowCount - 1) + ' 데이터 체크중...';
      if Length(Cells[0,i]) > 3 then
      begin
        showmessage(FM001 + '는 3자리 이내입니다.');
        Exit;
      end;
      if Trim(Cells[0,i])='' then
      begin
        showmessage(FM001 + '는 필수 코드 입니다.');
        Exit;
      end;
      if Not IsDigit(Cells[0,i]) then
      begin
        showmessage(FM001 + '는 숫자로만 등록하세요.');
        Exit;
      end;
      if Length(Trim(Cells[1,i])) = 0 then
      begin
        showmessage(FM101 + '은 필수 코드 입니다.');
        Exit;
      end;
      if Length(Cells[2,i]) > 50 then
      begin
        showmessage(FM102 + '은 50자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[4,i]) > 3 then
      begin
        showmessage(FM011 + '는 3자리 이내입니다.');
        Exit;
      end;
      if (Trim(Cells[4,i]) <> '') and (Not IsDigit(Cells[4,i])) then
      begin
        showmessage(FM011 + '는 숫자로만 등록해주세요.');
        Exit;
      end;
      if Length(Cells[5,i]) > 3 then
      begin
        showmessage(FM021 + '는 3자리 이내입니다.');
        Exit;
      end;
      if (Trim(Cells[5,i]) <> '') and (Not IsDigit(Cells[5,i])) then
      begin
        showmessage(FM021 + '는 숫자로만 등록해주세요.');
        Exit;
      end;
      if Length(Cells[6,i]) > 3 then
      begin
        showmessage(FM031 + '는 3자리 이내입니다.');
        Exit;
      end;
      if (Trim(Cells[6,i]) <> '') and (Not IsDigit(Cells[6,i])) then
      begin
        showmessage(FM031 + '는 숫자로만 등록해주세요.');
        Exit;
      end;
      if Length(Cells[7,i]) > 14 then
      begin
        showmessage(FM103 +'는 14자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[8,i]) > 14 then
      begin
        showmessage('집전화번호는 14자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[9,i]) > 14 then
      begin
        showmessage('핸드폰번호는 14자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[10,i]) > 7 then
      begin
        showmessage('우편번호는 7자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[11,i]) > 50 then
      begin
        showmessage('집주소1는 50자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[12,i]) > 50 then
      begin
        showmessage('집주소2는 50자리 이내입니다.');
        Exit;
      end;
      Cells[12,i] :=  stringReplace(Cells[12,i],'-','',[rfReplaceAll]);
      if Length(Cells[13,i]) > 8 then
      begin
        showmessage(FM104 + '은 8자리 이내입니다.');
        Exit;
      end;
      Cells[13,i] :=  stringReplace(Cells[12,i],'-','',[rfReplaceAll]);
      if Length(Cells[14,i]) > 8 then
      begin
        showmessage(FM105 + '은 8자리 이내입니다.');
        Exit;
      end;
      if Length(Cells[15,i]) > 100 then
      begin
        showmessage('사진위치는은 100자리 이내입니다.');
        Exit;
      end;

    end;
  end;
  result := True;
end;

function TfmKTIssusNReg.EmployeeInsert: Boolean;
var
  i: integer;
  stSql : string;
  stCardNo : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  nfdmsID : Integer;
  stFdmsID : string;
  stEmCode : string;
  stJoinDate : string;
  stRetireDate : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
begin
  result := False;
  DataModule1.ADOConnection.BeginTrans;
  nfdmsID := GetMaxFdmsID;
  with sg_UploadEmployee do
  begin
    for i := 1 to RowCount - 1 do
    begin
      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(RowCount - 1);
      stCompanyCode := Trim(Cells[0,i]);
      stJijumCode := Trim(Cells[4,i]);
      stDepartCode := Trim(Cells[5,i]);
      stEmCode := Trim(Cells[1,i]);
      stPosiCode := Trim(Cells[6,i]);
      stJoinDate := Trim(Cells[13,i]);
      stCardNo := Trim(Cells[3,i]);
      if stJoinDate = '' then stJoinDate := FormatDateTime('yyyymmdd',now);
      stRetireDate := Trim(Cells[14,i]);
      if stRetireDate = '' then stRetireDate := '99991231';

      if Not IsDigit(stCompanyCode) then stCompanyCode := '1';
      if Not IsDigit(stJijumCode) then stJijumCode := '0';
      if Not IsDigit(stDepartCode) then stDepartCode := '0';
      if Not IsDigit(stPosiCode) then stPosiCode := '0';
      stCompanyCode := FillZeroNumber(strtoint(stCompanyCode),3);
      stJijumCode := FillZeroNumber(strtoint(stJijumCode),3);
      stDepartCode := FillZeroNumber(strtoint(stDepartCode),3);
      stPosiCode := FillZeroNumber(strtoint(stPosiCode),3);


      StatusBar1.Panels[0].Text := inttostr(i) + '/' + inttostr(RowCount - 1) + FM106 +'정보 입력중...';
      if Not CheckTB_EMPLOYEE(stCompanyCode,stEmCode,stFdmsID) then
      begin
        inc(nfdmsID);
        stFdmsID := inttostr(nFdmsID);
        InsertIntoTB_EMPLOYEE(stEmCode,Trim(Cells[2,i]),
                              stCompanyCode,stJijumCode,stDepartCode,
                              stPosiCode,Trim(Cells[7,i]),
                              stJoinDate,stRetireDate,Trim(Cells[10,i]),
                              Trim(Cells[11,i]),Trim(Cells[12,i]),
                              Trim(Cells[8,i]),Trim(Cells[9,i]),
                              stFdmsID,stCardNo,Trim(Cells[15,i]));

      end;

      if stCardNo <> '' then
      begin
        if DUPCARDTYPE = 0 then //1인당 카드 한장만 사용시
        begin
          if CheckTB_CARDEmployeeNo(stCompanyCode,stEmCode) then
          begin
            UpdateTB_CARDEmployeeNo(stCompanyCode,stEmCode,stCardNo,stFdmsID);
          end;
        end;
        if Not CheckTB_CARD(stCardNo) then
        begin
          InsertTB_CARD(stCardNo,'1','1',stEmCode,stCompanyCode);
        end;
      end;
      stCompanyName := DataModule1.GetCompanyName(stCompanyCode);
      stJijumName := DataModule1.GetJijumName(stCompanyCode,stJijumCode);
      stDepartName := DataModule1.GetDepartName(stCompanyCode,stJijumCode,stDepartCode);
      stPosiName := DataModule1.GetPosiName(stCompanyCode,stPosiCode);

      stSql := CommonSql.InsertIntoTB_EMPHIS(stCompanyCode,stEmCode,stFdmsID,'1',stCardNo,'1',
                Trim(Cells[2,i]),Trim(Cells[9,i]),stCompanyName,stJijumName,stDepartName,stPosiName);//입력
      result := DataModule1.ProcessExecSQL(stSql);

      stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(stCompanyCode,stEmcode,stCardNo,'KTIssusNReg','1');
      DataModule1.ProcessExecSQL(stSql);

      SaveTB_KTCARDISSUE(stEmCode,Trim(Cells[16,i]));
      Application.ProcessMessages;

    end;
  end;
  DataModule1.ADOConnection.CommitTrans;

  result := True;
end;

function TfmKTIssusNReg.GetMaxFdmsID: integer;
var
  stSql : string;
  nFdms_id : integer;
  TempQuery :TADOQuery;
begin
  result := 31;
  stSql := 'select Max(Fdms_id) as fdms_id from TB_EMPLOYEE ';
  Try
    CoInitialize(nil);
    TempQuery := TADOQuery.Create(nil);
    TempQuery.Connection := DataModule1.ADOConnection;
    TempQuery.DisableControls;
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
      Try
        nFdms_id := FindField('fdms_id').AsInteger;
        if nFdms_id = 0 then Exit;
      Except
        Exit;
      End;
      result := nFdms_id;
    end;
  Finally
    TempQuery.EnableControls;
    TempQuery.Free;
    CoUninitialize;
  End;

end;


function TfmKTIssusNReg.CheckTB_EMPLOYEE(aCompanyCode,
  aEmpID: string;var aFdmsID:string): Boolean;
var
  stSql: string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  aFdmsID := '';
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' +  aCompanyCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if Not FindField('FDMS_ID').IsNull then
        aFdmsID := inttostr(FindField('FDMS_ID').AsInteger);
      Result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmKTIssusNReg.InsertIntoTB_EMPLOYEE(aEmpID, aEmpNM, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aCompanyPhone, aJoinDate,
  aRetireDate, aZipcode, aAddr1, aAddr2, aHomePhone, aHandphone, afdmsID,
  aCardNo, aEmpImg: string): Boolean;
var
  stSql : string;
  stCompanyName,stJijumName,stDepartName,stPosiName : string;
begin
    stSql := ' insert Into TB_EMPLOYEE ';
    stSql := stSql + '( ';
    stSql := stSql + 'GROUP_CODE,';
    stSql := stSql + 'EM_CODE,';
    stSql := stSql + 'CO_COMPANYCODE,';
    stSql := stSql + 'CO_JIJUMCODE,';
    stSql := stSql + 'CO_DEPARTCODE,';
    stSql := stSql + 'PO_POSICODE,';
    stSql := stSql + 'EM_NAME,';
    stSql := stSql + 'EM_COPHONE,';
    stSql := stSql + 'EM_HOMEPHONE,';
    stSql := stSql + 'EM_HANDPHONE,';
    stSql := stSql + 'ZI_ZIPCODE,';
    stSql := stSql + 'EM_ADDR1,';
    stSql := stSql + 'EM_ADDR2,';
    stSql := stSql + 'EM_JOINDATE,';
    stSql := stSql + 'EM_RETIREDATE,';
    if FileExists(aEmpImg) then
    begin
      stSql := stSql + 'EM_IMAGE,';
    end;
    stSql := stSql + 'FDMS_ID,';
    stSql := stSql + 'FDMS_RELAY,';
    stSql := stSql + 'EM_UPDATETIME, ';
    stSql := stSql + 'RG_CODE ) ';
    stSql := stSql + ' VALUES (';
    stSql := stSql + '''' + GROUPCODE + ''', ';
    stSql := stSql + '''' + aEmpID + ''', ';
    stSql := stSql + '''' + aCompanyCode + ''', ';
    stSql := stSql + '''' + aJijumCode + ''', ';
    stSql := stSql + '''' + aDepartCode + ''', ';
    stSql := stSql + '''' + aPosiCode + ''', ';
    stSql := stSql + '''' + aEmpNM + ''', ';
    stSql := stSql + '''' + aCompanyPhone + ''', ';
    stSql := stSql + '''' + aHomePhone + ''', ';
    stSql := stSql + '''' + aHandphone + ''', ';
    stSql := stSql + '''' + aZipcode + ''', ';
    stSql := stSql + '''' + aAddr1 + ''', ';
    stSql := stSql + '''' + aAddr2 + ''', ';
    stSql := stSql + '''' + aJoinDate + ''', ';
    stSql := stSql + '''' + aRetireDate + ''', ';
    if FileExists(aEmpImg) then
    begin
      stSql := stSql + ':EM_IMAGE,';
    end;
    stSql := stSql + afdmsID + ',';
    stSql := stSql + '''N'',';
    stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + '''001'') ';

    with DataModule1.ADOExecQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;
      if FileExists(aEmpImg) then
      begin
        if DBTYPE = 'MSSQL' then Parameters.ParamByName( 'EM_IMAGE' ).LoadFromFile( aEmpImg, ftGraphic )
        else Parameters.ParamByName( 'EM_IMAGE' ).Value := aEmpImg ;
      end;

      Try
        ExecSQL;
      Except
        Exit;
      End;

    end;
    stCompanyName := DataModule1.GetCompanyName(aCompanyCode);
    stJijumName := DataModule1.GetJijumName(aCompanyCode,aJijumCode);
    stDepartName := DataModule1.GetDepartName(aCompanyCode,aJijumCode,aDepartCode);
    stPosiName := DataModule1.GetPosiName(aCompanyCode,aPosiCode);

    stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmpID,afdmsID,'1',aCardNo,'1',
             aEmpNM,aHandphone,stCompanyName,stJijumName,stDepartName,stPosiName);//입력
    DataModule1.ProcessExecSQL(stSql);
    stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmpID,aCardNo,'KTIssusNReg','1');
    DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTIssusNReg.CheckTB_CARDEmployeeNo(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmKTIssusNReg.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
  stMsg : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = '''  + aCardNo + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKTIssusNReg.UpdateTB_CARDEmployeeNo(aCompanyCode, aEmCode,
  aCardNo,aFdmsID: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';
  stSql := stSql + ' AND CA_GUBUN = ''1'' ';
  stSql := stSql + ' AND CA_CARDTYPE = ''1'' ';
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;
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
      if recordCount < 1 then Exit;
      // 아무카드나 한장만 변경하자.
      if FindField('CA_CARDNO').AsString <> aCardNo then
      begin
        DeleteTB_DEVICECARDNOCardNo(aCardNo); // 권한테이블에 새로 등록할 카드에 대한 찌꺼기가 남아 있으면 삭제
        CopyGradeOldCard(FindField('CA_CARDNO').AsString,aCardNo); //여기서 권한을 복사 L_stStopCard -> stCardNo
        UpdateTB_DEVICECARDNOPermitDelete(FindField('CA_CARDNO').AsString);//L_stStopCard 권한 삭제
        ChangeCardNo(FindField('CA_CARDNO').AsString,aCardNo,aCompanyCode,aEmCode,aFdmsID);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmKTIssusNReg.ChangeCardNo(aOldCardNo, aNewCardNo, aCompanyCode,
  aEmCode, aFdmsID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_CARD set CA_CARDNO = ''' + aNewCardNo + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

  //OldCardNo 삭제 처리
  stSql := CommonSql.InsertIntoTB_EMPHIS(aCompanyCode,aEmCode,aFdmsID,'3',aOldCardNo,'2',
           '','','','','','');//입력
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.InsertIntoTB_EMPLOYEECHANGE(aCompanyCode,aEmCode,aOldCardNo,'KTIssusNReg','3');
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTIssusNReg.DeleteTB_CARDCardNo(aOldCardNO: string): Boolean;
var
  stSql :string;
begin

  stSql := ' Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTIssusNReg.CopyGradeOldCard(aOldCard,
  aNewCard: string): Boolean;
begin
  result := InsertTB_DEVICECARDNONotExist(aOldCard,aNewCard);
end;

function TfmKTIssusNReg.InsertTB_DEVICECARDNONotExist(aOldCardNO,
  aNewCardNO: string): Boolean;
var
  stSql : string;
begin
  if Trim(aNewCardNO) = '' then Exit;
    stSql := ' Insert INTO TB_DEVICECARDNO (GROUP_CODE, ';
    stSql := stSql + ' AC_NODENO, ';
    stSql := stSql + ' AC_ECUID, ';
    stSql := stSql + ' CA_CARDNO, ';
    stSql := stSql + ' DE_DOOR1, ';
    stSql := stSql + ' DE_DOOR2, ';
    stSql := stSql + ' DE_USEACCESS, ';
    stSql := stSql + ' DE_USEALARM, ';
    stSql := stSql + ' DE_TIMECODE, ';
    stSql := stSql + ' DE_PERMIT, ';
    stSql := stSql + ' DE_RCVACK, ';
    stSql := stSql + ' DE_UPDATETIME, ';
    stSql := stSql + ' DE_UPDATEOPERATOR) ';
    stSql := stSql + ' select ''' + GROUPCODE + ''', ';
    stSql := stSql + ' b.AC_NODENO, ';
    stSql := stSql + ' b.AC_ECUID, ';
    stSql := stSql + ' ''' + aNewCardNO + ''', ';
    stSql := stSql + ' b.DE_DOOR1, ';
    stSql := stSql + ' b.DE_DOOR2, ';
    stSql := stSql + ' b.DE_USEACCESS, ';
    stSql := stSql + ' b.DE_USEALARM, ';
    stSql := stSql + ' b.DE_TIMECODE, ';
    stSql := stSql + ' b.DE_PERMIT, ';
    stSql := stSql + ' ''N'', ';
    stSql := stSql + ' '''+ formatDateTime('yyyymmddHHMMSS',Now) + ''', ';
    stSql := stSql + ' '''+ Master_ID + ''' ';
    stSql := stSql + ' From TB_DEVICECARDNO B  ';
    stSql := stSql + ' where B.GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND B.CA_CARDNO = ''' + aOldCardNO + ''' ';
    stSql := stSql + ' AND NOT EXISTS ';
    stSql := stSql + ' (SELECT * FROM TB_DEVICECARDNO A ';
    stSql := stSql + ' WHERE A.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND A.AC_NODENO = b.AC_NODENO ';
    stSql := stSql + ' AND A.AC_ECUID = b.AC_ECUID  ';
    stSql := stSql + ' AND A.CA_CARDNO = ''' + aNewCardNO + ''')  ';

    result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTIssusNReg.UpdateTB_DEVICECARDNOPermitDelete(
  aOldCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set DE_PERMIT = ''N'', ';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aOldCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTIssusNReg.InsertTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
var
  stSql : string;
  nPositionNum : integer;
begin
  result := False;
  if Length(aCardNo) = 0 then Exit;
  if Not IsDigit(aCardGubun) then aCardGubun := '1';

  nPositionNum := GetMaxPositionNum;

  stSql := 'Insert Into TB_CARD(GROUP_CODE,CA_CARDNO,CA_GUBUN,CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,CO_COMPANYCODE,CA_UPDATETIME,POSITIONNUM,CA_UPDATEOPERATOR) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' +  GROUPCODE + ''',';
  stSql := stSql + '''' + aCardNo + ''',' ;
  stSql := stSql + '''' + aCardGubun + ''',' ;
  stSql := stSql + '''' + aCardType + ''',' ;
  stSql := stSql + '''' + aEmpID + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + inttostr(nPositionNum) + ',' ;
  stSql := stSql + '''' + MASTER_ID + ''')' ;

  Result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTIssusNReg.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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
      if Not IsDigit(FindField('MaxPosition').AsString) then
      begin
        Exit;
      end;
      result := FindField('MaxPosition').AsInteger + 1;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmKTIssusNReg.DeleteTB_DEVICECARDNOCardNo(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_DEVICECARDNO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmKTIssusNReg.SaveTB_KTCARDISSUE(aEmCode, aCardSeq, aWrite,
  aWriteDate: string): Boolean;
var
  stSql : string;
  stCardSeq : string;
begin
  if Not IsDigit(aCardSeq) then Exit;

  if Trim(aWriteDate)='' then aWriteDate := FormatDateTime('yyyymmdd',Now);

  if Not CheckTB_KTCARDISSUE(aEmCode,stCardSeq) then
    InsertTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate)
  else
  begin
    if strtoint(stCardSeq) < strtoint(aCardSeq) then
      UpdateTB_KTCARDISSUE(aEmCode,aCardSeq,aWrite,aWriteDate)
    else UpdateTB_KTCARDISSUE(aEmCode,stCardSeq,aWrite,aWriteDate);
  end;

end;

function TfmKTIssusNReg.CheckTB_KTCARDISSUE(aEmCode: string;
  var aCardSeq: string): Boolean;
var
  stSql : string;
begin
  aCardSeq := '';
  result := False;
  stSql := ' Select * from TB_KTCARDISSUE ';
  stsql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  With AdoQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then Exit;
    aCardSeq := inttostr(FindField('CARD_SEQ').AsInteger);
    result := True;
  end;

end;

function TfmKTIssusNReg.InsertTB_KTCARDISSUE(aEmCode, aCardSeq, aWrite,
  aWriteDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_KTCARDISSUE(';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' EM_CODE,';
  stSql := stSql + ' CARD_SEQ, ';
  stSql := stSql + ' KI_WRITE, ';
  stSql := stSql + ' KI_WRITEDATE ) ';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + inttostr(strtoint(aCardSeq)) + ',';
  stSql := stSql + '''' + aWrite + ''',';
  stSql := stSql + '''' + aWriteDate + ''')';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmKTIssusNReg.UpdateTB_KTCARDISSUE(aEmCode, aCardSeq, aWrite,
  aWriteDate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_KTCARDISSUE Set ';
  stSql := stSql + ' CARD_SEQ = ' + inttostr(strtoint(aCardSeq)) + ',';
  stSql := stSql + ' KI_WRITE = ''' + aWrite + ''',';
  stSql := stSql + ' KI_WRITEDATE = ''' + aWriteDate + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmKTIssusNReg.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmKTIssusNReg);
Finalization
  UnRegisterClass(TfmKTIssusNReg);

end.
