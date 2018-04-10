unit uDepartATAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, FR_DSet, FR_DBSet, FR_Class, DB, ADODB;

type
  TfmDepartATAdmin = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    Label5: TLabel;
    btn_Print: TSpeedButton;
    btn_FileSave: TSpeedButton;
    cmb_Company: TComboBox;
    cmb_Depart: TComboBox;
    dt_startDate: TDateTimePicker;
    ADOQuery: TADOQuery;
    frReport1: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    SaveDialog1: TSaveDialog;
    cbWork: TComboBox;
    ADOTempQuery: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure btn_PrintClick(Sender: TObject);
    procedure frReport1GetValue(const ParName: String;
      var ParValue: Variant);
    procedure sg_reportColChanging(Sender: TObject; OldCol,
      NewCol: Integer; var Allow: Boolean);
    procedure sg_reportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbWorkExit(Sender: TObject);
    procedure cbWorkChange(Sender: TObject);
    procedure cbWorkKeyPress(Sender: TObject; var Key: Char);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure sg_reportEditChange(Sender: TObject; ACol, ARow: Integer;
      Value: String);
    procedure sg_reportCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
  private
    nCol : integer;
    nRow : integer;
    { Private declarations }
    Procedure LoadCompanyCode(cmb_Box: TComboBox);
    Procedure LoadDepartCode(aCompanyCode: string;cmb_Box: TComboBox);
    procedure LoadInCode(cmb_Box: TComboBox);
    procedure LoadOutCode(cmb_Box: TComboBox);
    function GetIndex(aCode:string):integer;

    function InsertTB_ATEVENTInCode(aCompanyCode,aCardNo,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTInCode(aCompanyCode,aCardNo,aDate,aCode:string):Boolean;
    function InsertTB_ATEVENTOutCode(aCompanyCode,aCardNo,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTOutCode(aCompanyCode,aCardNo,aDate,aCode:string):Boolean;
    function DupCheckTB_ATEVENT(aCompanyCode,aCardNo,aDate:string):Boolean;

    procedure SaveInTime(aCompanyCode,aCardNo,aDate,aData:string);
    procedure SaveOutTime(aCompanyCode,aCardNo,aDate,aData:string);
    procedure SaveBigo(aCompanyCode,aCardNo,aDate,aData:string);
    function InsertTB_ATEVENTBigo(aCompanyCode,aCardNo,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTBigo(aCompanyCode,aCardNo,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTInTime(aCompanyCode,aCardNo,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTInTime(aCompanyCode,aCardNo,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTOutTime(aCompanyCode,aCardNo,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTOutTime(aCompanyCode,aCardNo,aDate,aData:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmDepartATAdmin: TfmDepartATAdmin;
  CompanyCodeList : TStringList;
  DepartCodeList : TStringList;

implementation

uses uDataModule1;

{$R *.dfm}

procedure TfmDepartATAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;

end;

procedure TfmDepartATAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  DepartCodeList.Free;

  Action := caFree;

end;

procedure TfmDepartATAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
end;

procedure TfmDepartATAdmin.LoadCompanyCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  CompanyCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1''';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE ';

  cmb_Box.Items.Add('전체');
  CompanyCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      CompanyCodeList.Add(FindField('CO_COMPANYCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.LoadDepartCode(aCompanyCode: string;
  cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  DepartCodeList.Clear;

  stSql := ' select a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE from TB_COMPANY a ';
  if Not IsMaster then
  begin
    stSql := stSql + ' Inner JOIN TB_ADMINCOMPANY b ';
    stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
    stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
    stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
    stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2''';
  if (aCompanyCode <> '000') and (aCompanyCode <> '') then
    stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  if Not IsMaster then
    stSql := stSql + ' AND b.AD_USERID = ''' + Master_ID + '''';
  stSql := stSql + ' GROUP BY a.CO_NAME,a.CO_COMPANYCODE,a.CO_DEPARTCODE ';

  cmb_Box.Items.Add('전체');
  DepartCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('CO_NAME').AsString);
      DepartCodeList.Add(FindField('CO_COMPANYCODE').AsString + FindField('CO_DEPARTCODE').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.FormActivate(Sender: TObject);
var
  i : integer;
begin
  dt_startDate.Date := Now;
  LoadCompanyCode(cmb_Company);
  LoadDepartCode('',cmb_Depart);
  for i := 9 to sg_Report.ColCount - 1 do
  begin
    sg_Report.ColWidths[i] := 0;
  end;
  sg_Report.Enabled := False;
end;

procedure TfmDepartATAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadDepartCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],cmb_Depart);
end;

procedure TfmDepartATAdmin.btn_SearchClick(Sender: TObject);
var
  stSql : string;
  i : integer;
  nRow : integer;
begin
  GridInitialize(sg_Report);
  sg_Report.Enabled := False;

  stSql := 'Select SubString(a.AT_DATE,1,4) + ''-'' + SubString(a.AT_DATE,5,2) + ''-'' + SubString(a.AT_DATE,7,2) as AT_DATE,';
  stSql := stSql + 'SubString(a.AT_INTIME,9,2) + '':'' + SubString(a.AT_INTIME,11,2) + '':'' + SubString(a.AT_INTIME,13,2) as AT_INTIME, ' ;
  stSql := stSql + 'SubString(a.AT_OUTTIME,9,2) + '':'' + SubString(a.AT_OUTTIME,11,2) + '':'' + SubString(a.AT_OUTTIME,13,2) as AT_OUTTIME, ';
  stSql := stSql + ' a.AT_INCODE,c.AT_INNAME as AT_INRESULT, ';
  stSql := stSql + ' a.AT_OUTCODE,d.AT_OUTNAME as AT_OUTRESULT, ';
  stSql := stSql + ' a.AT_CONTENT,b.CA_CARDNO,b.CO_COMPANYCODE,b.COMPANY_NAME, ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.DEPART_NAME,b.PO_POSICODE,b.PO_NAME, ';
  stSql := stSql + ' b.EM_CODE,b.EM_NAME ';
  stSql := stSql + ' From ';
  stSql := stSql + ' ( select a.CA_CARDNO,a.GROUP_CODE,a.CO_COMPANYCODE,a.EM_CODE,  ';
  stSql := stSql + ' b.CO_DEPARTCODE,b.EM_NAME,c.CO_NAME as COMPANY_NAME,d.CO_NAME as DEPART_NAME,  ';
  stSql := stSql + ' b.PO_POSICODE,e.PO_NAME,a.CA_CARDTYPE  ';
  stSql := stSql + ' from TB_CARD a  ';
  stSql := stSql + ' INNER JOIN TB_EMPLOYEE b  ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE) ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY c  ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND c.CO_GUBUN = ''1'') ';
  stSql := stSql + ' LEFT JOIN TB_COMPANY d  ';
  stSql := stSql + ' ON (b.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = d.CO_COMPANYCODE  ';
  stSql := stSql + ' AND b.CO_DEPARTCODE = d.CO_DEPARTCODE  ';
  stSql := stSql + ' AND d.CO_GUBUN = ''2'')  ';
  stSql := stSql + ' LEFT JOIN TB_POSI e  ';
  stSql := stSql + ' ON (b.GROUP_CODE = e.GROUP_CODE  ';
  stSql := stSql + ' AND b.PO_POSICODE = e.PO_POSICODE) ) b ';
  stSql := stSql + ' Left Join TB_ATEVENT a ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO  ';
  stSql := stSql + ' AND a.AT_DATE = ''' + FormatDateTime('yyyymmdd',dt_startDate.Date) + ''') ';
  stSql := stSql + ' Left Join TB_ATINCODE c ';
  stSql := stsql + ' ON ( a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_INCODE = c.AT_INCODE ) ';
  stSql := stSql + ' Left Join TB_ATOUTCODE d ';
  stSql := stSql + ' ON ( a.GROUP_CODE = d.GROUP_CODE ';
  stSql := stSql + ' AND a.AT_OUTCODE = d.AT_OUTCODE ) ';
  stSql := stSql + ' Where b.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND b.CA_CARDTYPE = ''1'' ';
  if cmb_Company.ItemIndex > 0 then stSql := stSql + ' AND  b.CO_COMPANYCODE = ''' + copy(CompanyCodeList.Strings[cmb_Company.ItemIndex],1,3) + ''' ';
  if cmb_Depart.ItemIndex > 0 then
  begin
    stSql := stSql + ' AND  b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ';
  end else
  begin
    if Not IsMaster then
    begin
      if DepartCodeList.Count > 1 then
      begin
        for i := 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' ( b.CO_COMPANYCODE = ''' + Copy(DepartCodeList.Strings[i],1,3) + ''' ';
          stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + Copy(DepartCodeList.Strings[i],4,3) + ''') ';
        end;
        stSql := stSql + ' ) ';
      end else
      begin
        showmessage('조회 가능한 부서 권한이 없습니다. 권한을 확인하세요.');
        Exit;
      end;
    end;
  end;

  stSql := stSql + ' Order By b.CO_COMPANYCODE,b.CO_DEPARTCODE,b.EM_CODE ';

  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      showmessage('조회에 실패하였습니다');
      Exit;
    End;

    if RecordCount < 1 then
    begin
      showmessage('조회데이터가 없습니다.');
      Exit;
    end;

    sg_Report.RowCount := RecordCount + 1 ;
    nRow := 1;

    while Not Eof do
    begin
      with sg_Report do
      begin
        Cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[1,nRow] := FindField('DEPART_NAME').AsString;
        Cells[2,nRow] := FindField('EM_CODE').AsString;
        Cells[3,nRow] := FindField('EM_NAME').AsString;
        Cells[4,nRow] := FindField('AT_INTIME').AsString;
        Cells[5,nRow] := FindField('AT_OUTTIME').AsString;
        Cells[6,nRow] := FindField('AT_INRESULT').AsString;
        Cells[7,nRow] := FindField('AT_OUTRESULT').AsString;
        Cells[8,nRow] := FindField('AT_CONTENT').AsString;
        Cells[9,nRow] := FindField('CA_CARDNO').AsString;
        Cells[10,nRow] := FindField('AT_INCODE').AsString;
        Cells[11,nRow] := FindField('AT_OUTCODE').AsString;
        Cells[12,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[13,nRow] := FindField('CA_CARDNO').AsString;
      end;

      inc(nRow);
      Next;
    end;

  end;
  if IsInsertGrade then sg_Report.Enabled := True;


end;

procedure TfmDepartATAdmin.btn_FileSaveClick(Sender: TObject);
var
  aFileName: String;
  sDate: String;
  eDate: String;
begin
  Screen.Cursor:= crHourGlass;
  aFileName:='부서별 근태 보고서';
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  SaveDialog1.FileName := aFileName;
  if SaveDialog1.Execute then
  begin
    sg_Report.SaveToCSV(SaveDialog1.FileName);
  end;
  Screen.Cursor:= crDefault;
end;

procedure TfmDepartATAdmin.btn_PrintClick(Sender: TObject);
begin
  if Not AdoQuery.Active then
  begin
    showmessage('조회 후 출력하세요.');
    Exit;
  end;
  frReport1.ShowReport;

end;

procedure TfmDepartATAdmin.frReport1GetValue(const ParName: String;
  var ParValue: Variant);
begin
 if AnsiCompareText(ParName, 'aDAY') = 0 then
    ParValue := '검색날짜 : '+ FormatdateTime('yyyy-mm-dd',dt_startDate.Date) ;

end;

procedure TfmDepartATAdmin.sg_reportColChanging(Sender: TObject; OldCol,
  NewCol: Integer; var Allow: Boolean);
begin
  with sg_report do
  begin
    if NewCol > 3 then
    begin
      Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing,goEditing];
      //sg_report.EditorMode := True;
    end
    else Options := [goFixedVertLine,goFixedHorzLine,goVertLine,goHorzLine,goRangeSelect,goDrawFocusSelected,goColSizing] ;
  end;

end;

procedure TfmDepartATAdmin.sg_reportSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect : TRect;
begin
  Rect := sg_report.CellRect(ACol, ARow);
{  nCol := ACol;
  nRow := ARow; }
  //콤보박스를 띄워보자.
  if (ACOl >= 6) AND (ACOL <= 7) then
  begin
    if ACol = 6 then LoadInCode(cbWork)
    else LoadOutCode(cbWork);
    with cbWork do
    begin
       Visible := True;
       Top  := Rect.Top ; //+ 20;
       Left := Rect.Left ; //+ 5;
       Width := Rect.Right - Rect.Left;
       //Height := (Rect.Bottom - Rect.Top);
       Itemindex := GetIndex(sg_report.Cells[ACol + 4 , ARow]);
       BringToFront;
       SetFocus;
    end;
  end else if ACol > 3 then
  begin
    //sg_report.EditMode := True;
    //sg_report.EditorMode := True;
  end;
end;

procedure TfmDepartATAdmin.LoadInCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add('');
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
      cmb_Box.Items.Add(FindField('AT_INCODE').AsString + '.' + FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.LoadOutCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  cmb_Box.Items.Add('');
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
      cmb_Box.Items.Add(FindField('AT_OUTCODE').AsString + '.' + FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.cbWorkExit(Sender: TObject);
begin
  cbWork.visible := False;
end;

function TfmDepartATAdmin.GetIndex(aCode: string): integer;
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

procedure TfmDepartATAdmin.cbWorkChange(Sender: TObject);
var
  nPos : integer;
  stCode : string;
  stCodename : string;
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
      stCodeName := copy(cbWork.Text,nPos + 1,Length(cbWork.Text) - nPos);
    end;
    cells[nCol,nRow] := stCodeName;
    cells[nCol + 4 ,nRow] := stCode;
    if nCol = 6 then
    begin
      if Not DupCheckTB_ATEVENT(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date)) then
        InsertTB_ATEVENTInCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode)
      else UpdateTB_ATEVENTInCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode);
    end else if nCol = 7 then
    begin
      if Not DupCheckTB_ATEVENT(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date)) then
        InsertTB_ATEVENTOutCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode)
      else UpdateTB_ATEVENTOutCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode);
    end;
  end;
end;

function TfmDepartATAdmin.InsertTB_ATEVENTInCode(aCompanyCode, aCardNo,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CA_CARDNO,AT_ATCODE,AT_INCODE,AT_INSERTOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTOutCode(aCompanyCode, aCardNo,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CA_CARDNO,AT_ATCODE,AT_OUTCODE,AT_INSERTOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTInCode(aCompanyCode, aCardNo,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTOutCode(aCompanyCode, aCardNo,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmDepartATAdmin.cbWorkKeyPress(Sender: TObject; var Key: Char);
var
  nPos : integer;
  stCode : string;
  stCodename : string;
  bCanCel : Boolean;
begin
  if Key <> #13 then exit;
  Key := #0;

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
      stCodeName := copy(cbWork.Text,nPos + 1,Length(cbWork.Text) - nPos);
    end;
    cells[nCol,nRow] := stCodeName;
    cells[nCol + 4 ,nRow] := stCode;
    if nCol = 6 then
    begin
      if Not DupCheckTB_ATEVENT(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date)) then
        InsertTB_ATEVENTInCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode)
      else UpdateTB_ATEVENTInCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode);
    end else if nCol = 7 then
    begin
      if Not DupCheckTB_ATEVENT(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date)) then
        InsertTB_ATEVENTOutCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode)
      else UpdateTB_ATEVENTOutCode(cells[12,nRow],Cells[13,nRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),stCode);
    end;
  end;
  cbWork.Visible := False;
  //sg_report.SelectedCells[nCol + 2,nRow];
  sg_report.SelectRange(nCol + 1,nCol + 1,nRow,nRow);
  sg_report.SetFocus;     //여기에서 nCol 이 증가 된다.
  sg_reportSelectCell(sg_report, nCol,nRow,bCanCel);
//  ARow: Integer; var CanSelect: Boolean)

end;

function TfmDepartATAdmin.DupCheckTB_ATEVENT(aCompanyCode, aCardNo,
  aDate: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOTempQuery do
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

procedure TfmDepartATAdmin.sg_reportKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;

  with sg_report do
  begin
    {if Col > 3 then
    begin
      if Not EditorMode then
      begin
        EditorMode := True;
        Exit;
      end;
    end;   }

    SelectRange(Col + 1,Col + 1,Row,Row);
//    nCol := Col + 1;
    //sg_report.SetFocus;
  end;

end;

procedure TfmDepartATAdmin.sg_reportEditChange(Sender: TObject; ACol,
  ARow: Integer; Value: String);
begin
  with sg_report do
  begin
    if ACol = 4 then SaveInTime(cells[12,ARow],Cells[13,ARow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[ACol,ARow])
    else if ACol = 5 then SaveOutTime(cells[12,ARow],Cells[13,ARow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[ACol,ARow])
    else if ACol = 8 then SaveBigo(cells[12,ARow],Cells[13,ARow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[ACol,ARow]);
  end;

end;

procedure TfmDepartATAdmin.SaveBigo(aCompanyCode, aCardNo, aDate,
  aData: string);
begin
  if Not DupCheckTB_ATEVENT(aCompanyCode,aCardNo,aDate) then
    InsertTB_ATEVENTBigo(aCompanyCode,aCardNo,aDate,aData)
  else UpdateTB_ATEVENTBigo(aCompanyCode,aCardNo,aDate,aData);

end;

procedure TfmDepartATAdmin.SaveInTime(aCompanyCode, aCardNo, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aCardNo,aDate) then
    InsertTB_ATEVENTInTime(aCompanyCode,aCardNo,aDate,aData)
  else UpdateTB_ATEVENTInTime(aCompanyCode,aCardNo,aDate,aData);

end;

procedure TfmDepartATAdmin.SaveOutTime(aCompanyCode, aCardNo, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aCardNo,aDate) then
    InsertTB_ATEVENTOutTime(aCompanyCode,aCardNo,aDate,aData)
  else UpdateTB_ATEVENTOutTime(aCompanyCode,aCardNo,aDate,aData);

end;

function TfmDepartATAdmin.InsertTB_ATEVENTBigo(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CA_CARDNO,AT_ATCODE,AT_CONTENT,AT_INSERTOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aData + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTInTime(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CA_CARDNO,AT_ATCODE,AT_INTIME,AT_INSERTOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTOutTime(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CA_CARDNO,AT_ATCODE,AT_OUTTIME,AT_INSERTOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTBigo(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_CONTENT = ''' + aData + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTInTime(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTOutTime(aCompanyCode, aCardNo,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmDepartATAdmin.sg_reportCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
  nCol := NewCol;
  nRow := NewRow;
  with sg_report do
  begin
    if OldCol = 4 then SaveInTime(cells[12,OldRow],Cells[13,OldRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[OldCol,OldRow])
    else if OldCol = 5 then SaveOutTime(cells[12,OldRow],Cells[13,OldRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[OldCol,OldRow])
    else if OldCol = 8 then SaveBigo(cells[12,OldRow],Cells[13,OldRow],FormatDateTime('yyyymmdd',dt_StartDate.Date),Cells[OldCol,OldRow]);
  end;

end;

procedure TfmDepartATAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  if IsInsertGrade then sg_report.Enabled := True
  else sg_report.Enabled := False;

end;

initialization
  RegisterClass(TfmDepartATAdmin);
Finalization
  UnRegisterClass(TfmDepartATAdmin);

end.
