unit uDepartATAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, Grids, BaseGrid, AdvGrid, uSubForm,
  CommandArray, FR_DSet, FR_DBSet, FR_Class, DB, ADODB, Menus;

type
  TfmDepartATAdmin = class(TfmASubForm)
    GroupBox3: TGroupBox;
    sg_report: TAdvStringGrid;
    GroupBox1: TGroupBox;
    btn_Search: TSpeedButton;
    btn_Close: TSpeedButton;
    ADOQuery: TADOQuery;
    SaveDialog1: TSaveDialog;
    ADOTempQuery: TADOQuery;
    Label5: TLabel;
    dt_Date: TDateTimePicker;
    Label1: TLabel;
    cmb_Company: TComboBox;
    Label2: TLabel;
    cmb_Jijum: TComboBox;
    Label17: TLabel;
    cmb_Depart: TComboBox;
    Label20: TLabel;
    cmb_Posi: TComboBox;
    Label21: TLabel;
    cmb_AtIntype: TComboBox;
    cmb_AtOuttype: TComboBox;
    Label22: TLabel;
    ed_empNo: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    ed_name: TEdit;
    ADOEventQuery: TADOQuery;
    PopupMenu1: TPopupMenu;
    mn_AtUpdate: TMenuItem;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_FileSaveClick(Sender: TObject);
    procedure sg_reportColChanging(Sender: TObject; OldCol,
      NewCol: Integer; var Allow: Boolean);
    procedure sg_reportSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbWorkChange(Sender: TObject);
    procedure cbWorkKeyPress(Sender: TObject; var Key: Char);
    procedure sg_reportKeyPress(Sender: TObject; var Key: Char);
    procedure sg_reportCellChanging(Sender: TObject; OldRow, OldCol,
      NewRow, NewCol: Integer; var Allow: Boolean);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_DepartChange(Sender: TObject);
    procedure cmb_PosiChange(Sender: TObject);
    procedure cmb_AtIntypeChange(Sender: TObject);
    procedure cmb_AtOuttypeChange(Sender: TObject);
    procedure sg_reportExit(Sender: TObject);
    procedure sg_reportCellsChanged(Sender: TObject; R: TRect);
    procedure mn_AtUpdateClick(Sender: TObject);
    procedure sg_reportMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sg_reportMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    nCol : integer;
    nRow : integer;
    MouseX : integer;
    MouseY : integer;
    ATCodeList : TStringList;
    { Private declarations }
    Function SearchATEvent(aCode:string) : Boolean;
    Procedure Load_ATInCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    Procedure Load_ATOutCode(cmb_Box:TComboBox;bAllShow:Boolean = False);
    procedure LoadATCode(cmb_Box: TComboBox);
    procedure LoadInCode(cmb_Box: TComboBox);
    procedure LoadOutCode(cmb_Box: TComboBox);
    function GetIndex(aCode:string):integer;

    function InsertTB_ATEVENTATCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTATCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function InsertTB_ATEVENTInCode(aCompanyCode,aEmcode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTInCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function InsertTB_ATEVENTOutCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function UpdateTB_ATEVENTOutCode(aCompanyCode,aEmCode,aDate,aCode:string):Boolean;
    function DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate:string):Boolean;

    procedure SaveInTime(aCompanyCode,aEmCode,aDate,aData:string);
    procedure SaveOutTime(aCompanyCode,aEmCode,aDate,aData:string);
    procedure SaveBigo(aCompanyCode,aEmCode,aDate,aData:string);
    function InsertTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function InsertTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;
    function UpdateTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData:string):Boolean;

  public
    { Public declarations }
  end;

var
  fmDepartATAdmin: TfmDepartATAdmin;
  CompanyCodeList : TStringList;
  JijumCodeList : TStringList;
  DepartCodeList : TStringList;
  PosiCodeList : TStringList;
  ATINCodeList : TStringList;
  ATINTypeList : TStringList;
  ATOutCodeList : TStringList;
  ATOutTypeList : TStringList;

implementation

uses
  uDataModule1,
  uCompanyCodeLoad,
  uMssql,
  uPostGreSql,
  uMDBSql,
  uLomosUtil,
  uAttendUpdate,
  uAttendCommon;

{$R *.dfm}

procedure TfmDepartATAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmDepartATAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CompanyCodeList.Free;
  JijumCodeList.Free;
  DepartCodeList.Free;
  PosiCodeList.Free;

  ATCodeList.Free;

  ATINCodeList.Free;
  ATINTypeList.Free;
  ATOutCodeList.Free;
  ATOutTypeList.Free;

  Action := caFree;

end;

procedure TfmDepartATAdmin.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  DepartCodeList := TstringList.Create;
  PosiCodeList := TStringList.Create;

  ATCodeList := TStringList.Create;
  
  ATINCodeList := TstringList.Create;
  ATINTypeList := TstringList.Create;
  ATOutCodeList := TstringList.Create;
  ATOutTypeList := TstringList.Create;

end;

procedure TfmDepartATAdmin.FormActivate(Sender: TObject);
var
  nIndex : integer;
begin
  dt_Date.Date := Now;

  GridInit(sg_report as TStringGrid,11);

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  LoadJijumCode('',JijumCodeList,cmb_Jijum);
  LoadDepartCode('','',DepartCodeList,cmb_Depart);

  Load_ATInCode(cmb_AtIntype,True);
  Load_ATOutCode(cmb_AtOuttype,True);

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

  btn_SearchClick(btn_Search);
end;

procedure TfmDepartATAdmin.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);
  btn_SearchClick(btn_Search);
end;

procedure TfmDepartATAdmin.btn_SearchClick(Sender: TObject);
begin
  SearchATEvent('');

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

procedure TfmDepartATAdmin.sg_reportColChanging(Sender: TObject; OldCol,
  NewCol: Integer; var Allow: Boolean);
begin
  with sg_report do
  begin
    if NewCol > 5 then
    begin
      if IsMaster or IsInsertGrade or IsUpdateGrade  then
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
{  Rect := sg_report.CellRect(ACol, ARow);
  nCol := ACol;
  nRow := ARow;
  if IsMaster or IsInsertGrade or IsUpdateGrade  then
  begin
    //콤보박스를 띄워보자.
    if (ACOl = 6) OR (ACOL = 9) OR (ACOL = 10) then
    begin
      if ACol = 6 then LoadATCode(cbWork)
      else if ACol = 9 then LoadInCode(cbWork)
      else if ACol = 10 then LoadOutCode(cbWork);
      with cbWork do
      begin
         Visible := True;
         Top  := Rect.Top ; //+ 20;
         Left := Rect.Left ; //+ 5;
         Width := Rect.Right - Rect.Left;
         //Height := (Rect.Bottom - Rect.Top);
         if ACOl = 6 then Itemindex := ATCodeList.IndexOf(sg_report.Cells[16 , ARow])
         else
            Itemindex := GetIndex(sg_report.Cells[ACol + 4 , ARow]);
         BringToFront;
         SetFocus;
      end;
    end else if ACol > 5 then
    begin
      //sg_report.EditMode := True;
      //sg_report.EditorMode := True;
    end;
  end;   }
end;

procedure TfmDepartATAdmin.LoadInCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;

  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

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
  stSql := stSql + ' AND AT_SYSTEM <> ''Y'' ';

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

function TfmDepartATAdmin.GetIndex(aCode: string): integer;
{var
  nIndex : integer;
  nPos : integer;
  stCode : string; }
begin
{  result := 0;
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
  end;  }
end;

procedure TfmDepartATAdmin.cbWorkChange(Sender: TObject);
{var
  nPos : integer;
  stCode : string;
  stCodename : string;}
begin
{  with sg_report do
  begin
    nPos := Pos('.',cbWork.Text);
    if nPos < 1 then
    begin
      stCode := '';
      stCodeName := cbWork.Text;
    end else
    begin
      stCode := copy(cbWork.Text,1,nPos - 1);
      stCodeName := copy(cbWork.Text,nPos + 1,Length(cbWork.Text) - nPos);
    end;
    cells[nCol,nRow] := stCodeName;
    if nCol = 6 then cells[16,nRow] := AtCodeList.Strings[cbWork.itemIndex]
    else
      cells[nCol + 4 ,nRow] := stCode;
    if nCol = 6 then
    begin
      if Not DupCheckTB_ATEVENT(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date)) then
        InsertTB_ATEVENTATCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),cells[16,nRow])
      else UpdateTB_ATEVENTATCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),cells[16,nRow]);
    end else if nCol = 9 then
    begin
      if Not DupCheckTB_ATEVENT(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date)) then
        InsertTB_ATEVENTInCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode)
      else UpdateTB_ATEVENTInCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode);
    end else if nCol = 10 then
    begin
      if Not DupCheckTB_ATEVENT(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date)) then
        InsertTB_ATEVENTOutCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode)
      else UpdateTB_ATEVENTOutCode(cells[15,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode);
    end;
  end; }
end;

function TfmDepartATAdmin.InsertTB_ATEVENTInCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTOutCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_OUTCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTInCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTOutCode(aCompanyCode, aEmCode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmDepartATAdmin.cbWorkKeyPress(Sender: TObject; var Key: Char);
{var
  nPos : integer;
  stCode : string;
  stCodename : string;
  bCanCel : Boolean;   }
begin
{  if Key <> #13 then exit;
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
    if nCol = 8 then
    begin
      if Not DupCheckTB_ATEVENT(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date)) then
        InsertTB_ATEVENTInCode(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode)
      else UpdateTB_ATEVENTInCode(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode);
    end else if nCol = 9 then
    begin
      if Not DupCheckTB_ATEVENT(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date)) then
        InsertTB_ATEVENTOutCode(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode)
      else UpdateTB_ATEVENTOutCode(cells[14,nRow],Cells[4,nRow],FormatDateTime('yyyymmdd',dt_Date.Date),stCode);
    end;
  end;
  cbWork.Visible := False;
  //sg_report.SelectedCells[nCol + 2,nRow];
  sg_report.SelectRange(nCol + 1,nCol + 1,nRow,nRow);
  sg_report.SetFocus;     //여기에서 nCol 이 증가 된다.
  sg_reportSelectCell(sg_report, nCol,nRow,bCanCel);
//  ARow: Integer; var CanSelect: Boolean)
}
end;

function TfmDepartATAdmin.DupCheckTB_ATEVENT(aCompanyCode, aEmCode,
  aDate: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_ATEVENT ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOEventQuery do
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
    if (ColCount -  2) > Col then
      SelectRange(Col + 1,Col + 1,Row,Row);
//    nCol := Col + 1;
    //sg_report.SetFocus;
  end;

end;

procedure TfmDepartATAdmin.SaveBigo(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTBigo(aCompanyCode,aEmCode,aDate,aData);

end;

procedure TfmDepartATAdmin.SaveInTime(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Length(aData) > 6 then aData := copy(aData,1,6)
  else aData := FillZeroStrNum(aData,6,False);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTInTime(aCompanyCode,aEmCode,aDate,aData);

end;

procedure TfmDepartATAdmin.SaveOutTime(aCompanyCode, aEmCode, aDate,
  aData: string);
begin
  aData := StringReplace(aData,':','',[rfReplaceAll]);
  aData := StringReplace(aData,'-','',[rfReplaceAll]);
  if Length(aData) > 6 then aData := copy(aData,1,6)
  else aData := FillZeroStrNum(aData,6,False);
  if Not DupCheckTB_ATEVENT(aCompanyCode,aEmCode,aDate) then
    InsertTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData)
  else UpdateTB_ATEVENTOutTime(aCompanyCode,aEmCode,aDate,aData);

end;

function TfmDepartATAdmin.InsertTB_ATEVENTBigo(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_CONTENT,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';
  
  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTInTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_INTIME,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.InsertTB_ATEVENTOutTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_INCODE,AT_OUTTIME,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aDate + aData + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTBigo(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_CONTENT = ''' + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTInTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_INTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTOutTime(aCompanyCode, aEmCode,
  aDate, aData: string): Boolean;
var
  stSql:string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_OUTTIME = ''' + aDate + aData + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

procedure TfmDepartATAdmin.sg_reportCellChanging(Sender: TObject; OldRow,
  OldCol, NewRow, NewCol: Integer; var Allow: Boolean);
begin
{
  nCol := NewCol;
  nRow := NewRow;
  with sg_report do
  begin
    if OldCol = 7 then SaveInTime(cells[15,OldRow],Cells[4,OldRow],FormatDateTime('yyyymmdd',dt_Date.Date),Cells[OldCol,OldRow])
    else if OldCol = 8 then SaveOutTime(cells[15,OldRow],Cells[4,OldRow],FormatDateTime('yyyymmdd',dt_Date.Date),Cells[OldCol,OldRow])
    else if OldCol = 11 then SaveBigo(cells[15,OldRow],Cells[4,OldRow],FormatDateTime('yyyymmdd',dt_Date.Date),Cells[OldCol,OldRow]);
  end;
}
end;

procedure TfmDepartATAdmin.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
//  if IsInsertGrade or IsUpdateGrade  then sg_report.Enabled := True
//  else sg_report.Enabled := False;

end;

function TfmDepartATAdmin.SearchATEvent(aCode: string): Boolean;
var
  stSql : string;
  i :integer;
  nRow : integer;
  stInTime,stOutTime : string;
  stTemp : string;
  bCardType : Boolean;
begin
  result := False;

  bCardType := False;
  if G_nEmployeeType = 1 then bCardType := True;

  RowGridInitialize(sg_Report);
  if DBTYPE = 'MSSQL' then stSql :=  Mssql.SelectTB_ATEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_Date.Date),bCardType)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_Date.Date),bCardType)
  else if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTFromDayBase(FormatDateTime('yyyymmdd',dt_Date.Date),bCardType)
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

  if cmb_AtIntype.ItemIndex > 0 then //출근 타입 선택시
  begin
    if ATINCodeList.Strings[cmb_AtIntype.ItemIndex] = '003' then //결근 선택시
    begin
      stSql := stSql + ' AND ( f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
      stSql := stSql + ' OR f.AT_INCODE IS NULL ) ';
    end else stSql := stSql + ' AND f.AT_INCODE = ''' + ATINCodeList.Strings[cmb_AtIntype.ItemIndex]  + ''' ';
  end;
  if cmb_AtOuttype.ItemIndex > 0 then //퇴근 타입 선택시
  begin
    stSql := stSql + ' AND f.AT_OUTCODE = ''' + ATOUTCodeList.Strings[cmb_AtOuttype.ItemIndex]  + ''' ';
  end;

  stSql := stSql + ' Order By a.CO_COMPANYCODE,a.CO_JIJUMCODE,a.CO_DEPARTCODE,a.EM_CODE ';

  //memo1.Lines.Text := stSql;
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
      stInTime := copy(FindField('AT_INTIME').AsString,9,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,11,2) + ':' +
                  copy(FindField('AT_INTIME').AsString,13,2) ;
      stOutTime := copy(FindField('AT_OUTTIME').AsString,9,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,11,2) + ':' +
                   copy(FindField('AT_OUTTIME').AsString,13,2) ;

      with sg_report do
      begin
        Cells[0,nRow] := FindField('COMPANY_NAME').AsString;
        Cells[1,nRow] := FindField('JIJUM_NAME').AsString;
        Cells[2,nRow] := FindField('DEPART_NAME').AsString;
        Cells[3,nRow] := FindField('PO_NAME').AsString;
        Cells[4,nRow] := FindField('EM_CODE').AsString;
        Cells[5,nRow] := FindField('EM_NAME').AsString;
        Cells[6,nRow] := FindField('AT_CODENAME').AsString;
        Cells[7,nRow] := stInTime;
        Cells[8,nRow] := stOutTime;
        Cells[9,nRow] := FindField('JIKAK').AsString;
        Cells[10,nRow] := FindField('Jotae').AsString;
        Cells[11,nRow] := FindField('AT_CONTENT').AsString;
        //Cells[12,nRow] := FindField('CA_CARDNO').AsString;
        Cells[13,nRow] := FindField('AT_INCODE').AsString;
        Cells[14,nRow] := FindField('AT_OUTCODE').AsString;
        Cells[15,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[16,nRow] := FindField('AT_ATCODE').AsString;
        if FindField('CO_COMPANYCODE').AsString + FindField('EM_CODE').AsString = aCode then
        begin
          SelectRows(nRow,1);
        end;

      end;
      nRow := nRow + 1;
      Next;
      Application.ProcessMessages;
    end;
  end;
  result := True;
  //sg_reportClick(sg_Report);

end;

procedure TfmDepartATAdmin.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  btn_SearchClick(Self);

end;

procedure TfmDepartATAdmin.cmb_DepartChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmDepartATAdmin.cmb_PosiChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmDepartATAdmin.cmb_AtIntypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmDepartATAdmin.cmb_AtOuttypeChange(Sender: TObject);
begin
  btn_SearchClick(Self);

end;

procedure TfmDepartATAdmin.Load_ATInCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
var
  stSql : string;
begin
  ATINCodeList.Clear;
  ATINTypeList.Clear;
  cmb_Box.Clear;
  stSql := ' select * from TB_ATINCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATINCodeList.Add('');
  ATINTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

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

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATINCodeList.Add(FindField('AT_INCODE').AsString);
      ATINTypeList.Add(FindField('AT_INTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_INNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.Load_ATOutCode(cmb_Box: TComboBox;
  bAllShow: Boolean);
var
  stSql : string;
begin
  ATOutCodeList.Clear;
  ATOutTypeList.Clear;
  cmb_Box.Clear;

  stSql := ' select * from TB_ATOUTCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if bAllShow then cmb_Box.Items.Add('전체')
  else cmb_Box.Items.Add('');
  ATOutCodeList.Add('');
  ATOutTypeList.Add('3');
  cmb_Box.ItemIndex := 0;

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

    if RecordCount < 1 then Exit;
    First;
    While Not Eof do
    begin
      ATOUTCodeList.Add(FindField('AT_OUTCODE').AsString);
      ATOUTTypeList.Add(FindField('AT_OUTTYPE').AsString);
      cmb_Box.Items.Add(FindField('AT_OUTNAME').AsString);
      Next;
    end;

  end;
end;

procedure TfmDepartATAdmin.sg_reportExit(Sender: TObject);
var
  bResult : Boolean;
begin
{
  with sender as TStringGrid do
  begin
    sg_reportCellChanging(sender,Row,Col,Row,Col,bResult);
  end;
}
end;

procedure TfmDepartATAdmin.LoadATCode(cmb_Box: TComboBox);
var
  stSql :string;
begin
  cmb_Box.Clear;
  ATCodeList.Clear;

  stSql := ' select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  ATCodeList.Add('');
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
      cmb_Box.Items.Add(FindField('AT_CODENAME').AsString);
      ATCodeList.Add(FindField('AT_ATCODE').AsString);
      Next;
    end;

  end;
end;

function TfmDepartATAdmin.InsertTB_ATEVENTATCode(aCompanyCode, aEmcode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + ' GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_SUMMARY,AT_INSERTTIME,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aDate + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aCode + ''',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + MASTER_ID + ''',';
  stSql := stSql + '''' + MASTER_ID + ''')';

  result := DataModule1.ProcessEventExecSQL(stSql);
end;

function TfmDepartATAdmin.UpdateTB_ATEVENTATCode(aCompanyCode, aEmcode,
  aDate, aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATEVENT set ';
  stSql := stSql + ' AT_ATCODE = ''' + aCode + ''',';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddhhnnss',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR =''' + MASTER_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

procedure TfmDepartATAdmin.sg_reportCellsChanged(Sender: TObject;
  R: TRect);
var
  bResult : Boolean;
begin
{  with sender as TStringGrid do
  begin
    sg_reportCellChanging(sender,Row,Col,Row,Col,bResult);
  end;
}
end;

procedure TfmDepartATAdmin.mn_AtUpdateClick(Sender: TObject);
begin
  if Not( IsMaster or IsInsertGrade or IsUpdateGrade ) then Exit;
  with sg_report do
  begin
    if Cells[4,Row] = '' then exit;
    fmAttendUpdate:= TfmAttendUpdate.Create(Self);
    fmAttendUpdate.CompanyName := Cells[0,Row];
    fmAttendUpdate.JijumName := Cells[1,Row];
    fmAttendUpdate.DepartName := Cells[2,Row];
    fmAttendUpdate.EMCODE := Cells[4,Row];
    fmAttendUpdate.EMName := Cells[5,Row];
    fmAttendUpdate.ATType := Cells[16,Row];
    fmAttendUpdate.InTime := Cells[7,Row];
    fmAttendUpdate.OutTime := Cells[8,Row];
    fmAttendUpdate.InType := Cells[13,Row];
    fmAttendUpdate.OutType := Cells[14,Row];
    fmAttendUpdate.Etc := Cells[11,Row];
    fmAttendUpdate.companyCode := Cells[15,Row];
    fmAttendUpdate.ATDATE := FormatDateTime('yyyymmdd',dt_Date.date);
    fmAttendUpdate.SHowmodal;
    if fmAttendUpdate.SaveResult then
    begin
      Cells[6,Row] := fmAttendUpdate.ATTypeName;
      Cells[16,Row] := fmAttendUpdate.ATType;
      Cells[7,Row] := fmAttendUpdate.InTime;
      Cells[8,Row] := fmAttendUpdate.OutTime;
      Cells[9,Row] := fmAttendUpdate.InTypeName;
      Cells[10,Row] := fmAttendUpdate.OutTypeName;
      Cells[13,Row] := fmAttendUpdate.InType;
      Cells[14,Row] := fmAttendUpdate.OutType;
      Cells[11,Row] := fmAttendUpdate.Etc;
    end;
    fmAttendUpdate.Free;
  end;

end;

procedure TfmDepartATAdmin.sg_reportMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  tpPos   : TPoint;
  nCol,nRow : integer;
begin
  inherited;
  sg_report.MouseToCell(MouseX,MouseY,nCol,nRow);
  if nRow < 0 then Exit;
  sg_report.SelectRows(nRow,1);
  //sg_report.SelectRange(nCol,nCol,nRow,nRow);
  if (Button = mbRight) then
  begin  // 마우스 오른쪽버튼이 눌렸다면.popUp ..
    if IsMaster or IsInsertGrade or IsUpdateGrade then
    begin
      GetCursorPos(tpPos);
      PopupMenu1.Popup(tpPos.X, tpPos.Y);
    end;
  end;
end;

procedure TfmDepartATAdmin.sg_reportMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
     MouseX := X;
     MouseY := Y;
end;

initialization
  RegisterClass(TfmDepartATAdmin);
Finalization
  UnRegisterClass(TfmDepartATAdmin);

end.
