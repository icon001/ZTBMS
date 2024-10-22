unit uCompanyGrade;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, Grids, BaseGrid, AdvGrid, ExtCtrls, StdCtrls,ADODB,ActiveX;

type
  TfmCompanyGrade = class(TForm)
    Panel1: TPanel;
    Panel15: TPanel;
    sg_Company: TAdvStringGrid;
    Panel19: TPanel;
    Panel16: TPanel;
    btn_CompanyGradeInsert: TSpeedButton;
    btn_CompanyGradeDelete: TSpeedButton;
    Panel20: TPanel;
    Panel17: TPanel;
    sg_GradeCompany: TAdvStringGrid;
    Panel21: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    st_Userid: TStaticText;
    st_userName: TStaticText;
    btn_Close: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_CompanyGradeInsertClick(Sender: TObject);
    procedure btn_CompanyGradeDeleteClick(Sender: TObject);
  private
    { Private declarations }
    procedure SearchCompanyCode;
    procedure SearchCompanyGrade(aUserID:string);
    procedure SearchJijumCode;
    procedure SearchJijumGrade(aUserID:string);
    procedure SearchDepartCode;
    procedure SearchDepartGrade(aUserID:string);

    procedure InsertCompanyGrade;
    procedure InsertJijumGrade;
    procedure InsertDepartGrade;
    procedure DeleteCompanyGrade;
    procedure DeleteJijumGrade;
    procedure DeleteDepartGrade;

    Function InsertTB_ADMINCOMPANY(aUserID,aCompanyCode,aJijumCode,aDepartCode,aGrade:string):Boolean;
    Function DeleteTB_ADMINCOMPANY(aCompanyCode,aJijumCode,aDepartCode,aGubun,aUserID:string):Boolean;
  public
    pUserID : string;
    pUserName : string;
    pCompanyCode : string;
    pJijumCode:string;
    pDepartCode:string;
    pCompanyGrade : integer;
    { Public declarations }
  end;

var
  fmCompanyGrade: TfmCompanyGrade;

implementation
uses
  uDataModule1;
{$R *.dfm}

procedure TfmCompanyGrade.FormActivate(Sender: TObject);
begin
  st_Userid.Caption := pUserID;
  st_userName.Caption := pUserName;
  if pCompanyGrade = 1 then //회사권한
  begin
    SearchCompanyCode;
    SearchCompanyGrade(pUserID);
  end else if pCompanyGrade = 2 then //지점권한
  begin
    SearchJijumCode;
    SearchJijumGrade(pUserID);
  end else if pCompanyGrade = 3 then //부서권한
  begin
    SearchDepartCode;
    SearchDepartGrade(pUserID);
  end;
end;

procedure TfmCompanyGrade.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCompanyGrade.SearchCompanyCode;
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with sg_Company do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '회사코드';
    Cells[1,0] := '회사명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyGrade.SearchCompanyGrade(aUserID: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.CO_COMPANYCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''1'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with sg_GradeCompany do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '회사코드';
    Cells[1,0] := '회사명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_COMPANYCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyGrade.SearchDepartCode;
Var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + pCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + pJijumCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with sg_Company do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '부서코드';
    Cells[1,0] := '부서명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyGrade.SearchDepartGrade(aUserID: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.CO_DEPARTCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_DEPARTCODE = b.CO_DEPARTCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + pCompanyCode + ''' ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = ''' + pJijumCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''3'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with sg_GradeCompany do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '부서코드';
    Cells[1,0] := '부서명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_DEPARTCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyGrade.SearchJijumCode;
Var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + pCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  with sg_Company do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '지점코드';
    Cells[1,0] := '지점명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;

  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

procedure TfmCompanyGrade.SearchJijumGrade(aUserID: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select a.CO_JIJUMCODE,b.CO_NAME from TB_ADMINCOMPANY a ';
  stSql := stSql + ' INNER JOIN TB_COMPANY b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.CO_JIJUMCODE = b.CO_JIJUMCODE ';
  stSql := stSql + ' AND a.CO_GUBUN = b.CO_GUBUN ) ';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = ''' + pCompanyCode + ''' ';
  stSql := stSql + ' AND a.CO_GUBUN = ''2'' ';
  stSql := stSql + ' AND a.AD_USERID = ''' + aUserID + ''' ';

  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;
  with sg_GradeCompany do
  begin
    Clear;
    RowCount := 2;
    Cells[0,0] := '지점코드';
    Cells[1,0] := '지점명칭';
    AddCheckBox(0,0,False,False);

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
      if recordCount < 1 then
      begin
        TempAdoQuery.Free;
        CoUninitialize;
        Exit;
      end;
      nRow := 1;
      RowCount := RecordCount + 1;
      While Not Eof do
      begin
        Cells[0,nRow] := FindField('CO_JIJUMCODE').AsString;
        Cells[1,nRow] := FindField('CO_NAME').AsString;
        AddCheckBox(0,nRow,False,False);
        inc(nRow);
        Next;
      end;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;

end;

procedure TfmCompanyGrade.btn_CompanyGradeInsertClick(Sender: TObject);
begin
  if pCompanyGrade = 1 then
  begin
    InsertCompanyGrade;
    SearchCompanyGrade(pUserID);
  end else if pCompanyGrade = 2 then
  begin
    InsertJijumGrade;
    SearchJijumGrade(pUserID);
  end else if pCompanyGrade = 3 then
  begin
    InsertDepartGrade;
    SearchDepartGrade(pUserID);
  end;
end;

procedure TfmCompanyGrade.InsertCompanyGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stCompanyCode: string;
begin
  for CompanyLoop := 1 to sg_Company.RowCount - 1 do
  begin
    sg_Company.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //회사가 체크 되어 있으면 해당 사람 Insert;
    begin
      stCompanyCode := sg_Company.Cells[0,CompanyLoop];
      InsertTB_ADMINCOMPANY(pUserID,stCompanyCode,'000','000','1');
    end;
  end;
end;

function TfmCompanyGrade.InsertTB_ADMINCOMPANY(aUserID, aCompanyCode,
  aJijumCode, aDepartCode, aGrade: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ADMINCOMPANY( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AD_USERID,';
  stSql := stSql + ' CO_COMPANYCODE,';
  stSql := stSql + ' CO_JIJUMCODE,';
  stSql := stSql + ' CO_DEPARTCODE,';
  stSql := stSql + ' CO_GUBUN,';
  stSql := stSql + ' AD_UPDATETIME,' ;
  stSql := stSql + ' AD_UPDATEOPERATOR )' ;
  stSql := stSql + ' values( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aUserID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aGrade + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + '''';
  stSql := stSql + ')';
  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmCompanyGrade.InsertDepartGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stDepartCode: string;
begin
  for CompanyLoop := 1 to sg_Company.RowCount - 1 do
  begin
    sg_Company.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //부서 체크 되어 있으면 해당 사람 Insert;
    begin
      stDepartCode := sg_Company.Cells[0,CompanyLoop];
      InsertTB_ADMINCOMPANY(pUserID,pCompanyCode,pJijumCode,stDepartCode,'3');
    end;
  end;

end;

procedure TfmCompanyGrade.InsertJijumGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stJijumCode: string;
begin
  for CompanyLoop := 1 to sg_Company.RowCount - 1 do
  begin
    sg_Company.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //지점 체크 되어 있으면 해당 사람 Insert;
    begin
      stJijumCode := sg_Company.Cells[0,CompanyLoop];
      InsertTB_ADMINCOMPANY(pUserID,pCompanyCode,stJijumCode,'000','2');
    end;
  end;
end;

procedure TfmCompanyGrade.btn_CompanyGradeDeleteClick(Sender: TObject);
begin
  if pCompanyGrade = 1 then
  begin
    DeleteCompanyGrade;
    SearchCompanyGrade(pUserID);
  end else if pCompanyGrade = 2 then
  begin
    DeleteJijumGrade;
    SearchJijumGrade(pUserID);
  end else if pCompanyGrade = 3 then
  begin
    DeleteDepartGrade;
    SearchDepartGrade(pUserID);
  end;


end;

procedure TfmCompanyGrade.DeleteCompanyGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stCompanyCode: string;
begin
  for CompanyLoop := 1 to sg_GradeCompany.RowCount - 1 do
  begin
    sg_GradeCompany.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //회사코드가 체크 되어 있으면 해당 권한 삭제
    begin
      stCompanyCode  := sg_GradeCompany.Cells[0,CompanyLoop];
      DeleteTB_ADMINCOMPANY(stCompanyCode,'000','000','1',pUserid);
    end;
  end;
end;

procedure TfmCompanyGrade.DeleteDepartGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stDepartCode: string;
begin
  for CompanyLoop := 1 to sg_GradeCompany.RowCount - 1 do
  begin
    sg_GradeCompany.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //회사코드가 체크 되어 있으면 해당 권한 삭제
    begin
      stDepartCode  := sg_GradeCompany.Cells[0,CompanyLoop];
      DeleteTB_ADMINCOMPANY(pCompanyCode,pJijumCode,stDepartCode,'3',pUserid);
    end;
  end;
end;

procedure TfmCompanyGrade.DeleteJijumGrade;
var
  CompanyLoop : integer;
  bchkState : Boolean;
  stJijumCode: string;
begin
  for CompanyLoop := 1 to sg_GradeCompany.RowCount - 1 do
  begin
    sg_GradeCompany.GetCheckBoxState(0,CompanyLoop, bchkState);
    if bChkState then //회사코드가 체크 되어 있으면 해당 권한 삭제
    begin
      stJijumCode  := sg_GradeCompany.Cells[0,CompanyLoop];
      DeleteTB_ADMINCOMPANY(pCompanyCode,stJijumCode,'000','2',pUserid);
    end;
  end;
end;

function TfmCompanyGrade.DeleteTB_ADMINCOMPANY(aCompanyCode, aJijumCode,
  aDepartCode, aGubun, aUserID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete from TB_ADMINCOMPANY ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ' ;
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''' + aGubun + ''' ';
  stSql := stSql + ' AND AD_USERID = ''' + aUserID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

end.
