unit uCardList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Gauges, StdCtrls, Grids, BaseGrid, AdvGrid, Buttons,
  uSubForm, CommandArray,ADODB,ActiveX,iniFiles,ComObj, AdvObj;

type
  TfmCardList = class(TfmASubForm)
    Panel12: TPanel;
    Panel1: TPanel;
    sg_Employ: TAdvStringGrid;
    pan_gauge: TPanel;
    Label2: TLabel;
    Gauge1: TGauge;
    lb_CompanyName: TLabel;
    cmb_Company: TComboBox;
    lb_JijumName: TLabel;
    cmb_Jijum: TComboBox;
    lb_DepartName: TLabel;
    cmb_Depart: TComboBox;
    lb_PosiName: TLabel;
    cmb_Posi: TComboBox;
    cmb_SearchType: TComboBox;
    Label4: TLabel;
    lb_search: TLabel;
    ed_searchText: TEdit;
    cmb_CardRegType: TComboBox;
    GroupBox1: TGroupBox;
    btn_Search: TBitBtn;
    btn_Excel: TSpeedButton;
    btn_Close: TBitBtn;
    SaveDialog1: TSaveDialog;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_CloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_CompanyChange(Sender: TObject);
    procedure cmb_JijumChange(Sender: TObject);
    procedure cmb_SearchTypeChange(Sender: TObject);
    procedure btn_SearchClick(Sender: TObject);
    procedure btn_ExcelClick(Sender: TObject);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
  private
    CompanyCodeList : TStringList;
    JijumCodeList : TStringList;
    PosiCodeList : TStringList;
    DepartCodeList : TStringList;
    EmpTypeCodeList : TStringList;
    { Private declarations }
    procedure ShowCardList;
    Function GetTitle : string;
  public
    { Public declarations }
  end;

var
  fmCardList: TfmCardList;

implementation
uses
  uCompanyCodeLoad,
  uDataModule1,
  uLomosUtil,
  uCommonSql,
  uMssql,
  uMDBSql,
  uPostGreSql,
  uFireBird, uExcelSave;
{$R *.dfm}

procedure TfmCardList.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  CompanyCodeList.Free;
  JijumCodeList.Free;
  PosiCodeList.Free;
  DepartCodeList.Free;
  EmpTypeCodeList.Free;


  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardList';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;
  Action := caFree;

end;

procedure TfmCardList.btn_CloseClick(Sender: TObject);
begin
  close;
end;

procedure TfmCardList.FormCreate(Sender: TObject);
begin
  CompanyCodeList := TStringList.Create;
  JijumCodeList := TStringList.Create;
  PosiCodeList := TStringList.Create;
  DepartCodeList := TStringList.Create;
  EmpTypeCodeList := TStringList.Create;

  GridInitialize(sg_Employ);


end;

procedure TfmCardList.FormShow(Sender: TObject);
var
  stCompanyCode : string;
  stJijumCode : string;
begin

  LoadCompanyCode(CompanyCodeList,cmb_Company);
  stCompanyCode := '000';
  if cmb_Company.ItemIndex > 0 then stCompanyCode := CompanyCodeList.Strings[cmb_Company.ItemIndex];
  LoadJijumCode(stCompanyCode,JijumCodeList,cmb_Jijum);
  stJijumCode := '000';
  if cmb_Jijum.ItemIndex > 0 then stJijumCode := copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3);
  LoadDepartCode(stCompanyCode,stJijumCode,DepartCodeList,cmb_Depart);

  LoadPosiCode(stCompanyCode,PosiCodeList,cmb_Posi);

  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'CardList';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

end;

procedure TfmCardList.cmb_CompanyChange(Sender: TObject);
begin
  LoadJijumCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],JijumCodeList,cmb_Jijum);
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);
  LoadPosiCode(CompanyCodeList.Strings[cmb_Company.ItemIndex],PosiCodeList,cmb_Posi);

end;

procedure TfmCardList.cmb_JijumChange(Sender: TObject);
begin
  LoadDepartCode(copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3),copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3),DepartCodeList,cmb_Depart);

end;

procedure TfmCardList.cmb_SearchTypeChange(Sender: TObject);
begin
  lb_search.Caption := cmb_SearchType.Text;
  if cmb_SearchType.ItemIndex = 0 then
  begin
    cmb_CardRegType.Visible := True;
    ed_searchText.Visible := False;
  end else
  begin
    cmb_CardRegType.Visible := False;
    ed_searchText.Visible := True;
  end;

end;

procedure TfmCardList.btn_SearchClick(Sender: TObject);
begin
  ShowCardList;
end;

procedure TfmCardList.ShowCardList;
var
  stSql : string;
  nRow : integer;
  i : integer;
  TempAdoQuery : TADOQuery;
  stCardState : string;
begin
  GridInitialize(sg_Employ); //스트링그리드 초기화

  if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_CARDJoinTBEmployee
  else if DBType = 'PG' then stSql := PostGreSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'MDB' then stSql := MDBSql.SelectTB_CARDJoinTBEmployee
  else if DBType = 'FB' then stSql := FireBird.SelectTB_CARDJoinTBEmployee
  else Exit;

  if (Not IsMaster) and (CompanyGrade <> '0') then
  begin
    if CompanyGrade = '1' then
    begin
      if cmb_Company.ItemIndex < 1 then
      begin
        if CompanyCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
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
      if cmb_Jijum.ItemIndex > 0 then stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to JijumCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[i],4,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex > 0 then stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
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
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ';
      if cmb_Depart.ItemIndex < 1 then
      begin
        if DepartCodeList.Count < 2 then
        begin
          showmessage('관리할수 있는 권한이 없습니다.');
          Exit;
        end;
        for i:= 1 to DepartCodeList.Count - 1 do
        begin
          if i = 1 then stSql := stSql + ' AND ( '
          else stSql := stSql + ' OR ';
          stSql := stSql + ' b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[i],7,3) + ''' ';
        end;
        stSql := stSql + ')';
      end else stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ';
    end;
  end else
  begin
    if cmb_Depart.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],4,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_DEPARTCODE = ''' + copy(DepartCodeList.Strings[cmb_Depart.ItemIndex],7,3) + ''' ' ;
    end else if cmb_Jijum.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],1,3) + ''' ' ;
      stSql := stSql + ' AND b.CO_JIJUMCODE = ''' + copy(JijumCodeList.Strings[cmb_Jijum.ItemIndex],4,3) + ''' ' ;
    end else if cmb_Company.ItemIndex > 0 then
    begin
      stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + CompanyCodeList.Strings[cmb_Company.ItemIndex] + ''' ' ;
    end;
  end;
  if cmb_Posi.ItemIndex > 0 then
    stSql := stSql + ' AND b.PO_POSICODE = ''' + copy(PosiCodeList.Strings[cmb_Posi.ItemIndex],4,3) + ''' ';

  if cmb_SearchType.ItemIndex = 0 then //카드등록구분
  begin
    if cmb_CardRegType.ItemIndex <> 0 then
    begin
      stSql := stSql + ' AND a.ca_cardtype = ''' + copy(cmb_CardRegType.Text,1,1)  + ''' '
    end;
  end else if cmb_SearchType.ItemIndex = 1 then //카드번호
    stSql := stSql + ' AND a.CA_CARDNO LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 2 then //사번
    stSql := stSql + ' AND b.EM_CODE LIKE ''%' + Trim(ed_searchText.Text)  + '%'' '
  else if cmb_SearchType.ItemIndex = 3 then //이름
    stSql := stSql + ' AND b.EM_NAME LIKE ''%' + Trim(ed_searchText.Text)  + '%'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  TempAdoQuery.DisableControls;

  Try
    btn_Search.Enabled := False;
    btn_Excel.Enabled := False;
    Screen.Cursor:= crHourGlass;
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
      pan_gauge.Visible := True;
      Label2.Caption := '데이터 조회중입니다.';
      Gauge1.Progress := 0;
      Gauge1.MaxValue := RecordCount;
      sg_Employ.RowCount := RecordCount + 1;
      nRow := 1;
      First;
      while Not Eof do
      begin
        with sg_Employ do
        begin
          cells[0,nRow] := FindField('CA_CARDNO').AsString;
          Case FindField('CA_CARDTYPE').asstring[1] of
            '1' : begin stCardState := '1.등록'; end;
            '2' : begin stCardState := '2.분실'; end;
            '3' : begin stCardState := '3.정지'; end;
            '4' : begin stCardState := '4.변경'; end;
          end;
          cells[1,nRow] := stCardState;// FindField('CA_CARDTYPE').AsString;
          cells[2,nRow] := FindField('COMPANYNAME').AsString;
          cells[3,nRow] := FindField('JIJUMNAME').AsString;
          cells[4,nRow] := FindField('DEPARTNAME').AsString;
          cells[5,nRow] := FindField('PO_NAME').AsString;
          cells[6,nRow] := FindField('EM_CODE').AsString;
          cells[7,nRow] := FindField('EM_NAME').AsString;
        end;
        Gauge1.Progress := nRow;
        nRow := nRow + 1;
        Application.ProcessMessages;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
    pan_gauge.Visible := False;
    btn_Search.Enabled := True;
    btn_Excel.Enabled := True;
    Screen.Cursor:= crDefault;
  End;
end;

procedure TfmCardList.btn_ExcelClick(Sender: TObject);
var
  stRefFileName,stSaveFileName:String;
  stPrintRefPath : string;
  nExcelRowStart:integer;
  ini_fun : TiniFile;
  aFileName : string;
  stTitle : string;
begin
  Try
    btn_Excel.Enabled := False;
    btn_Search.Enabled := False;
    Screen.Cursor:= crHourGlass;
    stTitle := GetTitle;
    ini_fun := TiniFile.Create(ExeFolder + '\print.ini');
    stPrintRefPath := ExeFolder + '\..\PrintOutRef\' ;
    stPrintRefPath := ini_fun.ReadString('환경설정','PrintRefPath',stPrintRefPath);
    stRefFileName  := ini_fun.ReadString('카드내역','참조파일','CardList.xls');
    stRefFileName := stPrintRefPath + stRefFileName;
    nExcelRowStart := ini_fun.ReadInteger('카드내역','시작위치',6);
    ini_fun.Free;

    aFileName:='카드내역';
    SaveDialog1.FileName := aFileName;
    if G_nFileFormat = 1 then
    begin
      SaveDialog1.DefaultExt := 'csv';
      SaveDialog1.Filter := 'CSV File(*.csv)|*.csv';
    end else
    begin
      SaveDialog1.DefaultExt := 'xls';
      SaveDialog1.Filter := 'EXCEL File(*.xls)|*.xls';
    end;
    if SaveDialog1.Execute then
    begin
      stSaveFileName := SaveDialog1.FileName;

      if SaveDialog1.FileName <> '' then
      begin
        pan_gauge.Visible := True;
        Screen.Cursor:= crHourGlass;
        if G_nFileFormat = 0 then
          dmExcelSave.ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False,Gauge1)
        else if G_nFileFormat = 1 then
          sg_Employ.SaveToCSV(stSaveFileName);
      end;
    end;
{    SaveDialog1.FileName := aFileName;
    if SaveDialog1.Execute then
    begin
      stSaveFileName := SaveDialog1.FileName;
      if SaveDialog1.FileName <> '' then
        if Not ExcelPrintOut(sg_Employ,stRefFileName,stSaveFileName,True,nExcelRowStart,stTitle,False,False) then
        begin
          Screen.Cursor:= crDefault;
          btn_Excel.Enabled := True;
          Exit;
        end;
    end; }
  Finally
    Screen.Cursor:= crDefault;
    btn_Excel.Enabled := True;
    btn_Search.Enabled := True;
  end;
end;

function TfmCardList.GetTitle: string;
var
  stTemp : string;
begin
  stTemp := '';
  if cmb_Company.ItemIndex > 0 then
  begin
    if stTemp <> '' then stTemp := stTemp + '/';
    stTemp := stTemp + '회사:' + cmb_Company.Text ;
  end;
  if cmb_Jijum.ItemIndex > 0 then
  begin
    if stTemp <> '' then stTemp := stTemp + '/';
    stTemp := stTemp + '지점:' +  cmb_Jijum.Text ;
  end;
  if cmb_Depart.ItemIndex > 0 then
  begin
    if stTemp <> '' then stTemp := stTemp + '/';
    stTemp := stTemp + '부서:' +  cmb_Depart.Text ;
  end;
  if cmb_Posi.ItemIndex > 0 then
  begin
    if stTemp <> '' then stTemp := stTemp + '/';
    stTemp := stTemp + '직위:' +  cmb_Posi.Text ;
  end;
  if cmb_SearchType.ItemIndex > 0 then
  begin
    if ed_searchText.Text <> '' then
    begin
      if stTemp <> '' then stTemp := stTemp + '/';
      stTemp := stTemp + cmb_SearchType.text + ':' +  ed_searchText.Text ;
    end;
  end else
  begin
    if cmb_CardRegType.ItemIndex > 0 then
    begin
      if stTemp <> '' then stTemp := stTemp + '/';
      stTemp := stTemp + cmb_SearchType.text + ':' +  cmb_CardRegType.Text ;
    end;
  end;
  result := stTemp;
end;

procedure TfmCardList.CommandArrayCommandsTCloseExecute(Command: TCommand;
  Params: TStringList);
begin
  inherited;
  Close;
end;

initialization
  RegisterClass(TfmCardList);
Finalization
  UnRegisterClass(TfmCardList);

end.
