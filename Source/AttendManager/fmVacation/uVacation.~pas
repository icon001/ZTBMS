unit uVacation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, PlannerMonthView, Spin,
  Grids, Calendar, BaseGrid, AdvGrid, uSubForm, CommandArray,DateUtils,ADODB,
  ActiveX ;

Const
  ColFixCount = 7;

type
  TfmVacation = class(TfmASubForm)
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label3: TLabel;
    cmb_Company: TComboBox;
    cmb_Jijum: TComboBox;
    cmb_Depart: TComboBox;
    cmb_Posi: TComboBox;
    ed_empNo: TEdit;
    Label4: TLabel;
    Panel12: TPanel;
    Label5: TLabel;
    dt_Date: TDateTimePicker;
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    cbWork: TComboBox;
    StatusBar1: TStatusBar;
    ed_name: TEdit;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure sg_reportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbWorkExit(Sender: TObject);
    procedure cbWorkChange(Sender: TObject);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_JijumChange(Sender: TObject);
    procedure sg_reportExit(Sender: TObject);
    procedure sg_reportCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure dt_DateChange(Sender: TObject);
  private
    L_nCol : integer;
    L_nRow : integer;
    L_nATType : integer; //0:고정근무,1:사원별근무,2:교대근무(여기서는 무급휴가 안됨)
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    DepartCodeList : TStringList;
    PosiCodeList : TStringList;
    EMCodeList : TStringList;  //회사코드 + 사번 리스트
    VAMarkList : TStringList;
    { Private declarations }
    function GetIndex(aCode:string):integer;
    procedure SearchATVacation ;
    Function EMPLOYEEListSearch :Boolean;
    procedure SearchEMVacation;
    procedure LoadVACode(cmb_Box: TComboBox;aGubun:string);
    Function LoadConfig:Boolean;

    Function VacationSave(aCompanyCode,aEmCode,aMonth:string;aDay:integer;aCode:string):Boolean;
    Function CheckTB_ATVACation(aDate,aCompanyCode,aEmCode:string):Boolean;
    Function InsertTB_ATVACation(aDate,aCompanyCode,aEmCode,aCode:string):Boolean;
    Function UpdateTB_ATVACation(aDate,aCompanyCode,aEmCode,aCode:string):Boolean;
    Function DeleteTB_ATVACation(aDate,aCompanyCode,aEmCode:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmVacation: TfmVacation;

implementation

uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad, uMssql, uPostGreSql, uMDBSql;

{$R *.dfm}

procedure TfmVacation.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmVacation.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;
  EMCodeList.Free;
  VAMarkList.Free;

  Action := caFree;
end;

procedure TfmVacation.FormCreate(Sender: TObject);
begin
  sg_Report.ColWidths[6] := 0;
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
  PosiCodeList := TStringList.Create;
  EMCodeList := TStringList.Create;
  VAMarkList := TStringList.Create;

end;

procedure TfmVacation.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;
  dt_DateChange(self);

  GridInitialize(sg_report as TStringGrid);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);
  LoadVACode(cbWork,'0');

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

  //btn_SearchClick(btn_Search);
end;

procedure TfmVacation.btn_SearchClick(Sender: TObject);
begin
  SearchATVacation;
end;

procedure TfmVacation.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  //btn_SearchClick(btn_Search);

end;

procedure TfmVacation.sg_reportSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect : TRect;
begin
  Rect := sg_report.CellRect(ACol, ARow);
{  nCol := ACol;
  nRow := ARow; }
  //콤보박스를 띄워보자.
  if (ACOl >= ColFixCount) then
  begin
    LoadVACode(cbWork,sg_report.Cells[6,ARow]);
    with cbWork do
    begin
       Visible := True;
       Top  := Rect.Top ; //+ 20;
       Left := Rect.Left ; //+ 5;
       //Width := Rect.Right - Rect.Left;
       //Height := (Rect.Bottom - Rect.Top);
       Itemindex := GetIndex(Trim(copy(sg_report.Cells[ACol, ARow],3,6)));
       BringToFront;
       SetFocus;
    end;
  end;
end;

procedure TfmVacation.cbWorkExit(Sender: TObject);
begin
  cbWork.visible := False;
end;

function TfmVacation.GetIndex(aCode: string): integer;
var
  nIndex : integer;
  nPos : integer;
  stCode : string;
begin
  result := 0;
  for nIndex := 1 to cbWork.Items.Count - 1 do
  begin
    nPos := Pos('.',cbWork.Items.Strings[nIndex]);
    if nPos > -1 then
    begin
      stCode := copy(cbWork.Items.Strings[nIndex],1,nPos - 1);
      if aCode = stCode then
      begin
        result := nIndex;
        break;
      end;
    end;
  end;
end;

procedure TfmVacation.cbWorkChange(Sender: TObject);
var
  nPos : integer;
  stCode : string;
  stCodename : string;
  stCompanyCode,stEmCode:string;
begin
  with sg_report do
  begin
    nPos := Pos('.',cbWork.Text);
    if nPos < 1 then
    begin
      stCode := '';
      stCodeName := '';
    end else
    begin
      stCode := copy(cbWork.Text,1,nPos - 1);
      stCodeName := VAMarkList.Strings[cbWork.itemIndex] + '  ' + stCode;
    end;

    stCompanyCode := copy(EMCodeList.Strings[L_nRow - FixedRows],1,3);
    stEMCode := copy(EMCodeList.Strings[L_nRow - FixedRows],4,Length(EMCodeList.Strings[L_nRow - FixedRows]) - 3);
    if Not VacationSave(stCompanyCode,stEMCode,FormatDateTime('yyyymm',dt_Date.Date),L_nCol - ColFixCount + 1,stCode) then Exit;

    if L_nCol >= ColFixCount then
    begin
      cells[L_nCol,L_nRow] := stCodeName;
    end;
  end;
end;

procedure TfmVacation.sg_reportKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;

  with sg_report do
  begin
    if (ColCount -  2) > Col then
      SelectRange(Col + 1,Col + 1,Row,Row);
  end;
end;

procedure TfmVacation.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade or IsUpdateGrade then sg_report.Enabled := True
  else sg_report.Enabled := False;

end;

procedure TfmVacation.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  //btn_SearchClick(Self);

end;

procedure TfmVacation.sg_reportExit(Sender: TObject);
var
  bResult : Boolean;
begin
  with sender as TStringGrid do
  begin
    sg_reportCellChanging(sender,Row,Col,Row,Col,bResult);
  end;

end;

procedure TfmVacation.sg_reportCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  L_nCol := NewCol;
  L_nRow := NewRow;

  with sg_report do
  begin
    if NewCol > 5 then
    begin
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goEditing];
      //sg_report.EditorMode := True;
    end
    else Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing] ;
  end;

end;

procedure TfmVacation.dt_DateChange(Sender: TObject);
var
  lastDay: TDate;
  stLastDay : string;
  i : integer;
begin
  lastDay := EndOfTheMonth(dt_Date.Date);
  stLastDay := FormatDateTime('dd',lastDay);
  for i := 25 to 31 do  //25일보다 작은 달은 없음
  begin
    if i <= strtoint(stLastDay) then sg_report.ColWidths[5+i] := 20
    else sg_report.ColWidths[5+i] := 0;
  end;
end;

procedure TfmVacation.SearchATVacation;
begin
  if EMPLOYEEListSearch then
    SearchEMVacation;
end;

Function TfmVacation.EMPLOYEEListSearch :Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
begin
  result := False;
  RowGridInitialize(sg_Report as TStringGrid);
  EMCodeList.Clear;

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEATJoinBase
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATJoinBase
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATJoinBase
  else Exit;

{  stSql := 'select c.CO_NAME as COMPANY_NAME,d.CO_NAME as JIJUM_NAME,e.CO_NAME as DEPART_NAME,';
  stSql := stSql + ' a.CO_COMPANYCODE,a.EM_CODE,a.EM_NAME,I.PO_NAME,J.PA_GUBUN ';
  stSql := stSql + ' from TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_COMPANY c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' Left Join TB_COMPANY d ';
  stSql := stSql + ' ON (a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = d.CO_JIJUMCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'') ';
  stSql := stSql + ' Left Join TB_COMPANY e ';
  stSql := stSql + ' ON (a.GROUP_CODE = e.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = e.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = e.CO_JIJUMCODE  ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = e.CO_DEPARTCODE  ';
  stSql := stSql + ' AND e.CO_GUBUN = ''3'') ';
  stSql := stSql + ' Left Join TB_POSI I ';
  stSql := stSql + ' ON (a.GROUP_CODE = I.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = I.CO_COMPANYCODE  ';
  stSql := stSql + ' AND a.PO_POSICODE = I.PO_POSICODE)  ';
  stSql := stSql + ' Left Join TB_BASEPAY J ';
  stSql := stSql + ' ON (a.GROUP_CODE = J.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = J.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = J.EM_CODE )';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
}
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
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';
  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with DataModule1.ADOQuery do
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
    sg_report.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin

      with sg_report do
      begin
        Cells[0,nRow] := FindField('COMPANYNAME').AsString;
        Cells[1,nRow] := FindField('JIJUMNAME').AsString;
        Cells[2,nRow] := FindField('DEPARTNAME').AsString;
        Cells[3,nRow] := FindField('PO_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        if L_nATType = 2 then Cells[6,nRow] := '1'  //유급휴가만 Search
        else
        begin
          if FindField('PA_GUBUN').AsString = '' then  Cells[6,nRow] := '0'
          else Cells[6,nRow] := FindField('PA_GUBUN').AsString;
        end;
        EMCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString);
      end;
      nRow := nRow + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
  result := True;

end;

procedure TfmVacation.SearchEMVacation;
var
  stSql : string;
  i :integer;
  nRow : integer;
  nCol : integer;
  stEmCode : string;
begin
  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_EMPLOYEEATVacation(FormatDateTime('yyyymm',dt_Date.Date))
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_EMPLOYEEATVacation(FormatDateTime('yyyymm',dt_Date.Date))
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_EMPLOYEEATVacation(FormatDateTime('yyyymm',dt_Date.Date))
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
  if Trim(ed_empNo.Text) <> '' then
    stSql := stSql + ' AND a.EM_CODE = ''' + Trim(ed_empNo.Text)  + ''' ';
  if Trim(ed_name.Text) <> '' then
    stSql := stSql + ' AND a.EM_NAME LIKE ''' + Trim(ed_name.Text)  + '%'' ';
  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  with DataModule1.ADOQuery do
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

    while Not Eof do
    begin
      stEmCode := FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString;
      nRow := EMCodeList.IndexOf(stEmCode);
      nCol := 0;
      if isDigit(copy(FindField('VA_DATE').AsString,7,2)) then nCol := strtoint(copy(FindField('VA_DATE').AsString,7,2));
      if nRow > -1 then
      begin
        if nCol > 0 then
        begin
          with sg_report do
          begin
            Cells[ColFixCount - 1 + nCol,FixedRows + nRow] := FindField('AT_VAMARK').AsString + '  ' + FindField('AT_VACODE').AsString;
          end;
        end;
      end;
      Next;
      Application.ProcessMessages;
    end;
  end;
end;

procedure TfmVacation.LoadVACode(cmb_Box: TComboBox;aGubun:string);
var
  stSql :string;
  stState : string;
begin
  cmb_Box.Clear;
  VAMarkList.Clear;
  stState := '';

  stSql := ' select * from TB_ATVACODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';
  if aGubun <> '0' then
    stSql := stSql + ' AND AT_VATYPE = ''' + aGubun + ''' ';

  cmb_Box.Items.Add('');
  VAMarkList.Add('');
  cmb_Box.ItemIndex := 0;

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

    While Not Eof do
    begin
      cmb_Box.Items.Add(FindField('AT_VACODE').AsString + '.' + FindField('AT_VANAME').AsString);
      VAMarkList.Add(FindField('AT_VAMARK').AsString);
      if stState <> '' then stState := stState + ',';
      stState := stState + FindField('AT_VAMARK').AsString + ':' + FindField('AT_VANAME').AsString;
      Next;
    end;

  end;
  StatusBar1.Panels[0].Text := '표시형태 : ' + stState;
end;

function TfmVacation.VacationSave(aCompanyCode,aEmCode,aMonth: string; aDay: integer;
  aCode: string): Boolean;
var
  stDate : string;
begin
  result := False;
  stDate := aMonth + FillZeroNumber(aDay,2);
  if aCode = '' then
  begin
    result := DeleteTB_ATVACation(stDate,aCompanyCode,aEmCode);
    exit;
  End;
  
  if CheckTB_ATVACation(stDate,aCompanyCode,aEmCode) then
    result:= UpdateTB_ATVACation(stDate,aCompanyCode,aEmCode,aCode)
  else result:= InsertTB_ATVACation(stDate,aCompanyCode,aEmCode,aCode);

end;

function TfmVacation.CheckTB_ATVACation(aDate, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' select * from TB_ATVACATION ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND VA_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

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
    if recordCount < 1 then Exit;
  end;
  result := True;


end;

function TfmVacation.InsertTB_ATVACation(aDate, aCompanyCode, aEmCode,
  aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATVACATION(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'VA_DATE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'AT_VACODE) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCode + ''') ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmVacation.UpdateTB_ATVACation(aDate, aCompanyCode, aEmCode,
  aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATVACATION set ';
  stSql := stSql + 'AT_VACODE = ''' + aCode + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND VA_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmVacation.DeleteTB_ATVACation(aDate, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Delete From TB_ATVACATION  ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND VA_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmVacation.LoadConfig: Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''ATTEND'' ';
  
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
    if RecordCount > 0 then
    begin
      while Not Eof do
      begin
        if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          L_nATType := FindField('CO_CONFIGVALUE').Asinteger;
        next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

initialization
  RegisterClass(TfmVacation);
Finalization
  UnRegisterClass(TfmVacation);


end.
