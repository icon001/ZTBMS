unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB, FolderDialog,
  Grids, DBGrids;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rg_targetDBType: TRadioGroup;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_orgDB: TEdit;
    ed_targetUserpw: TEdit;
    ed_targetUserName: TEdit;
    ed_targetDBName: TEdit;
    ed_targetDBPort: TEdit;
    ed_targetDBIP: TEdit;
    btn_Conversion: TSpeedButton;
    btn_Close: TSpeedButton;
    gb_Progress: TGroupBox;
    Gauge1: TGauge;
    OrgADOConnection: TADOConnection;
    targetADOConnection: TADOConnection;
    orgADOQuery: TADOQuery;
    targetADOQuery: TADOQuery;
    Button1: TButton;
    FolderDialog1: TFolderDialog;
    Gauge2: TGauge;
    Label2: TLabel;
    Label3: TLabel;
    targetSearchADOQuery: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    orgidADOQuery: TADOQuery;
    btn_depart: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure rg_targetDBTypeClick(Sender: TObject);
    procedure btn_ConversionClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btn_departClick(Sender: TObject);
  private

    { Private declarations }
    Function OrgAdoConnect:Boolean;
    Function targetAdoConnect : Boolean;
  private
    Procedure CreateCompanyCode(aCompanyCode,aCompanyName:string);
    Procedure CreateJijumCode;
    Procedure CreatePosiCode;
    Procedure CreateRelayCode;

    Procedure CardDataConversion;

    Function ConvertHexCardNo(aOrgHexCardNo:string):string;

  private
    Function CheckTB_CompanyCode(aCompanyCode,aJijumCode,aGubun:string):Boolean;
    Function UpdateTB_CompanyCode(aCompanyCode,aJijumCode,aGubun,aCompanyName:string):Boolean;
    Function InsertTB_CompanyCode(aCompanyCode,aJijumCode,aGubun,aCompanyName:string):Boolean;

    Function CheckTB_PosiCode(aCompanyCode,aPosiCode:string):Boolean;
    Function UpdateTB_PosiCode(aCompanyCode,aPosiCode,aPosiName:string):Boolean;
    Function InsertTB_PosiCode(aCompanyCode,aPosiCode,aPosiName:string):Boolean;

    Function DeleteTB_RelayGubun:Boolean;
    Function InsertTB_RelayGubun(aRelayCode,aRelayname:string):Boolean;

    Function GetRelayCode(aRelayName:string):string;

    Function InsertTB_Employee(aCompanyCode,aEmCode,aJijumCode,aDepartCode,aPosiCode,aEmName,aJoinDate,aRetireDate,aFdmsID,aRelayCode:string):Boolean;
    Function InsertTB_CardNo(aCardNo,aCompanyCode,aEmCode:string):Boolean;

  private
    Function GetMaxJijumCode: integer;
    procedure CreateNullDepartCode(aStartJijumCode:integer);
    procedure createNullDepartEmployee;
    Function getJijumCode(aJijumName:string):string;
    Function updateTB_Employee(aEmCode,aJijumCode:string):Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  uLomosUtil;
{$R *.dfm}

procedure TForm1.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.rg_targetDBTypeClick(Sender: TObject);
begin
  if rg_targetDBType.ItemIndex = 0 then
  begin
    ed_targetDBPort.Text := '1433';
    ed_targetDBPort.Visible := True;
    ed_targetUserName.Text := 'sa';
    ed_targetUserPw.Text := 'sapasswd';
  end else
  begin
    ed_targetDBPort.Text := '5432';
    ed_targetDBPort.Visible := False;
    ed_targetUserName.Text := 'postgres';
    ed_targetUserPw.Text := '1';
  end;

end;

procedure TForm1.btn_ConversionClick(Sender: TObject);
begin
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;

  btn_Conversion.Enabled := False;

  Gauge2.MaxValue := 5;
  Gauge2.Progress := 0;
  CreateCompanyCode('001','KT텔레캅');
  Gauge2.Progress := 1;
  CreateJijumCode;
  Gauge2.Progress := 2;
  CreatePosiCode;
  Gauge2.Progress := 3;
  CreateRelayCode;
  Gauge2.Progress := 4;

  CardDataConversion;
  Gauge2.Progress := 5;

  btn_Conversion.Enabled := True;

end;

function TForm1.OrgAdoConnect: Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  stDBName : string;
begin
  result := False;
  if ed_orgDB.Text = '' then Exit;
  conStr := constr + 'Provider=Microsoft.Jet.OLEDB.4.0;';
  conStr := constr + 'Data Source=' + ed_orgDB.Text + ';';
  conStr := constr + 'Persist Security Info=False;';
  conStr := constr + 'Extended Properties=Paradox 7.x';

  with OrgADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;
  result := True;

end;

function TForm1.targetAdoConnect: Boolean;
var
  conStr : wideString;
  stHost : String;
  stPort : String;
  stuserID : String;
  stuserPW : String;
  stDBName : string;
begin
  result := False;
  stHost  := ed_targetDBIP.Text;
  stPort := ed_targetDBPort.Text;
  stuserID := ed_targetUserName.Text;
  stuserPW := ed_targetUserPw.Text;  //saPasswd
  stDBName := ed_targetDBName.Text;
  if rg_targetDBType.ItemIndex = 0 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + stuserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + stuserID + ';';
    conStr := constr + 'Initial Catalog=' + stDBName + ';';
    conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
  end else
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + stHost + ';'   ;
    conStr := constr + 'location=' + stDBName + ';';
    conStr := constr + 'User Id='+ stuserID + ';';
    conStr := constr + 'password=' + stuserPW;
  end;
  with targetADOConnection do
  begin
    Connected := False;
    Try
      ConnectionString := conStr;
      LoginPrompt:= false ;
      Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
      else
        begin
          ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
    //CursorLocation := clUseClient;
  end;
  result := True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  FolderDialog1.Title := '파라독스 DB 폴더 찾기';

  if FolderDialog1.Execute then
  begin
    ed_orgDB.Text := FolderDialog1.Directory;
    if Not OrgAdoConnect then
    begin
      showmessage('원본데이터베이스 접속환경을 확인하세요.');
      Exit;
    end;
    orgidADOQuery.Close;
    orgidADOQuery.SQL.Text := 'select * from tbl_id order by f_name';
    orgidADOQuery.Open;
  end;

end;

procedure TForm1.CardDataConversion;
var
  stSql: string;
  stOrgCardNo : string;
  stOrgHexCardNo : string;
  stNewHexCardNo : string;
  stCardNo : string;
  stEmCode : string;
  stEmName : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stRelayCode : string;
  bCardNo: int64;
  nFdmsID : integer;
begin
  nFdmsID := 31;
  stSql := ' Select * from tbl_id ';

  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    stCompanyCode := '001';
    stDepartCode := '000';
    Label3.Caption := '카드';
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    While Not Eof do
    begin
      stOrgCardNo := FindField('f_id').AsString;
      if Not isDigit(stOrgCardNo) then
      begin
        Next;
        continue;
      end;
      if Length(stOrgCardNo) <> 10 then
      begin
        stOrgCardNo := FillZeroStrNum(stOrgCardNo,10);
      end;
      stOrgHexCardNo := Dec2Hex(strtoint(copy(stOrgCardNo,1,5)),4) + Dec2Hex(strtoint(copy(stOrgCardNo,6,5)),4);
      if length(stOrgHexCardNo) < 8 then
      begin
        stOrgHexCardNo := FillZeroStrNum(stOrgHexCardNo,8);
      end;
      stNewHexCardNo := ConvertHexCardNo(stOrgHexCardNo);
      bCardNo:= Hex2Dec64(stNewHexCardNo);
      stCardNo:= FillZeroNumber2(bCardNo,10);
      stEmCode := FindField('f_code').AsString;
      stEmName := FindField('f_name').AsString;
      if isDigit(FindField('f_depart_no').AsString) then
      begin
        stJijumCode := FillZeroNumber(strtoint(FindField('f_depart_no').AsString),3);
      end else stJijumCode := '000';
      if isDigit(FindField('f_degree_no').AsString) then
      begin
        stPosiCode := FillZeroNumber(strtoint(FindField('f_degree_no').AsString),3);
      end else stPosiCode := '000';
      stRelayCode := GetRelayCode(FindField('f_part').AsString);

      InsertTB_Employee('001',stEmCode,stJijumCode,'000',stPosiCode,stEmName,formatDateTime('yyyymmdd',now),'99991231',inttostr(nFdmsID),stRelayCode);
      InsertTB_CardNo(stCardNo,'001',stEmCode);


      inc(nFdmsID);
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;

end;

procedure TForm1.CreateCompanyCode(aCompanyCode, aCompanyName: string);
begin
  if CheckTB_CompanyCode(aCompanyCode,'000','1') then
  begin
    UpdateTB_CompanyCode(aCompanyCode,'000','1',aCompanyName);
  end else
  begin
    InsertTB_CompanyCode(aCompanyCode,'000','1',aCompanyName);
  end;

end;

procedure TForm1.CreateJijumCode;
var
  stSql: string;
  stJijumCode : string;
begin
  stSql := ' Select f_depart_no,f_depart from tbl_id ';
  stSql := stSql + ' group by f_depart_no,f_depart ';

  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Label3.Caption := '지점';
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    While Not Eof do
    begin
      if isDigit(FindField('f_depart_no').AsString) then
      begin
        stJijumCode := FillZeroNumber( strtoint(FindField('f_depart_no').AsString),3);
        if CheckTB_CompanyCode('001',stJijumCode,'2') then
        begin
          UpdateTB_CompanyCode('001',stJijumCode,'2',FindField('f_depart').AsString);
        end else
        begin
          InsertTB_CompanyCode('001',stJijumCode,'2',FindField('f_depart').AsString);
        end;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

end;

procedure TForm1.CreatePosiCode;
var
  stSql: string;
  stPosiCode : string;
begin
  stSql := ' Select f_degree_no,f_degree from tbl_id ';
  stSql := stSql + ' group by f_degree_no,f_degree ';

  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Label3.Caption := '직위';
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    While Not Eof do
    begin
      if isDigit(FindField('f_degree_no').AsString) then
      begin
        stPosiCode := FillZeroNumber( strtoint(FindField('f_degree_no').AsString),3);
        if CheckTB_PosiCode('001',stPosiCode) then
        begin
          UpdateTB_PosiCode('001',stPosiCode,FindField('f_degree').AsString);
        end else
        begin
          InsertTB_PosiCode('001',stPosiCode,FindField('f_degree').AsString);
        end;
      end;
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

end;

procedure TForm1.CreateRelayCode;
var
  stSql: string;
  nCode : integer;
  stRelayCode : string;
begin
  if Application.MessageBox('직원구분테이블을 삭제 후 작업합니다.계속하시겠습니까?','경고',MB_YESNO) = ID_NO then Exit;

  DeleteTB_RelayGubun;
  stSql := ' Select f_part from tbl_id ';
  stSql := stSql + ' group by f_part ';
  stSql := stSql + ' order by f_part desc ';

  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    nCode := 1;
    Label3.Caption := '구분';
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    While Not Eof do
    begin
      stRelayCode := FillZeroNumber(nCode,3);
      inc(nCode);
      InsertTB_RelayGubun(stRelayCode,FindField('f_part').AsString);
      Gauge1.Progress := Gauge1.Progress + 1;
      Next;
    end;
  end;

end;

function TForm1.CheckTB_CompanyCode(aCompanyCode,aJijumCode,aGubun: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Select * from TB_COMPANY ';
  stSql := stSql + ' where co_companyCode = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and co_jijumCode = ''' + aJijumCode + ''' ';
  stSql := stSql + ' and co_gubun = ''' + aGubun + ''' ';

  with targetSearchADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;

    result := True;

  end;

end;

function TForm1.InsertTB_CompanyCode(aCompanyCode,aJijumCode,aGubun,
  aCompanyName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_Company(co_companyCode,co_jijumcode,co_name,co_gubun) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aCompanyName + ''',';
  stSql := stSql + '''' + aGubun + ''') ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;


end;

function TForm1.UpdateTB_CompanyCode(aCompanyCode,aJijumCode,aGubun,
  aCompanyName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_Company set ';
  stSql := stSql + 'co_name = ''' + aCompanyName + ''' ';
  stSql := stSql + ' Where co_companyCode = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND co_jijumCode = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND co_gubun = ''' + aGubun + ''' ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;

end;

function TForm1.CheckTB_PosiCode(aCompanyCode, aPosiCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Select * from TB_posi ';
  stSql := stSql + ' where co_companyCode = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and po_posiCode = ''' + aPosiCode + ''' ';

  with targetSearchADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount < 1 then Exit;

    result := True;

  end;
end;

function TForm1.InsertTB_PosiCode(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_Posi(co_companyCode,po_posicode,po_name) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aPosiName + ''') ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;
end;

function TForm1.UpdateTB_PosiCode(aCompanyCode, aPosiCode,
  aPosiName: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_Posi set ';
  stSql := stSql + 'po_name = ''' + aPosiName + ''' ';
  stSql := stSql + ' Where co_companyCode = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND po_posiCode = ''' + aPosiCode + ''' ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;

end;

function TForm1.DeleteTB_RelayGubun: Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Delete from TB_RELAYGUBUN ';
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;


end;

function TForm1.InsertTB_RelayGubun(aRelayCode,
  aRelayname: string): Boolean;
var
  stSql : string;
begin
  result := False;
  
  stSql := 'Insert Into TB_RELAYGUBUN (rg_code,rg_name) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aRelayCode + ''',';
  stSql := stSql + '''' + aRelayName + ''') ';
  
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
  end;
  result := True;

end;

function TForm1.GetRelayCode(aRelayName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := 'select * from TB_RELAYGUBUN ';
  stSql := stSql + ' Where rg_name = ''' + aRelayName + ''' ';

  with targetSearchADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;

    result := FindField('rg_code').AsString;
  end;

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//      showmessage( Dec2Hex(strtoint(copy(Edit1.text,1,5)),4) + Dec2Hex(strtoint(copy(Edit1.text,6,5)),4));

end;

function TForm1.ConvertHexCardNo(aOrgHexCardNo: string): string;
begin
  result := copy(aOrgHexCardNo,7,2) + copy(aOrgHexCardNo,5,2) + copy(aOrgHexCardNo,3,2) + copy(aOrgHexCardNo,1,2);
end;

function TForm1.InsertTB_CardNo(aCardNo, aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_CARD(CA_CARDNO,CO_COMPANYCODE,EM_CODE,CA_GUBUN,CA_CARDTYPE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''1'') ';

  With targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TForm1.InsertTB_Employee(aCompanyCode, aEmCode, aJijumCode,
  aDepartCode, aPosiCode, aEmName, aJoinDate, aRetireDate, aFdmsID,
  aRelayCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_JIJUMCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'FDMS_ID,';
  stSql := stSql + 'RG_CODE) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aCompanyCode + ''',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + aJijumCode + ''',';
  stSql := stSql + '''' + aDepartCode + ''',';
  stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmName + ''',';
  stSql := stSql + '''' + aJoinDate + ''',';
  stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '' + aFdmsID + ',';
  stSql := stSql + '''' + aRelayCode + ''')';

  With targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      Exit;
    End;
    result := True;
  end;
end;

procedure TForm1.btn_departClick(Sender: TObject);
var
  nJijumCode : integer;
begin
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;

  nJijumCode := GetMaxJijumCode + 1;

  CreateNullDepartCode(nJijumCode);

  createNullDepartEmployee;
  showmessage('작업완료');



end;

function TForm1.GetMaxJijumCode: integer;
var
  stSql : string;
begin
  result := 0;
  stSql := 'select max(co_jijumCode) as code from tb_company ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    end;
    if recordCount < 1 then Exit;
    if Not isDigit(FindField('code').AsString) then Exit;
    result := strtoint(FindField('code').AsString);
  end;


end;

procedure TForm1.CreateNullDepartCode(aStartJijumCode: integer);
var
  stSql : string;
  stJijumCode : string;
begin
  stSql := ' select f_depart from tbl_id ';
  stSql := stSql + ' where f_depart_no = '''' ';
  stSql := stSql + ' or f_depart_no is null ';
  stSql := stSql + ' group by f_depart ';

  with orgidADOQuery do
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
      stJijumCode := FillZeroNumber( aStartJijumCode,3);
      if CheckTB_CompanyCode('001',stJijumCode,'2') then
      begin
        UpdateTB_CompanyCode('001',stJijumCode,'2',FindField('f_depart').AsString);
      end else
      begin
        InsertTB_CompanyCode('001',stJijumCode,'2',FindField('f_depart').AsString);
      end;

      inc(aStartJijumCode);
      Next;
    end;
  end;

end;

procedure TForm1.createNullDepartEmployee;
var
  stSql : string;
  stJijumCode : string;
begin
  stSql := 'select * from  tbl_id ';
  stSql := stSql + ' where f_depart_no = '''' ';
  stSql := stSql + ' or f_depart_no is null ';

  with orgidADOQuery do
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
      stJijumCode := getJijumCode(FindField('f_depart').AsString);

      updateTB_Employee(FindField('f_code').AsString,stJijumCode);

      Next;
    end;
  end;

end;

function TForm1.getJijumCode(aJijumName: string): string;
var
  stSql : string;
begin
  result := '000';
  stSql := ' select * from TB_COMPANY ';
  stSql := stSql + ' where co_gubun = ''2'' ';
  stSql := stSql + ' and co_companycode = ''001''' ;
  stSql := stSql + ' and co_name = ''' + aJijumName + ''' ';

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordcount <  1 then Exit;
    result := FindField('co_jijumcode').AsString;
  end;

end;

function TForm1.updateTB_Employee(aEmCode, aJijumCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' update TB_EMPLOYEE set co_jijumcode = ''' + aJijumCode + ''' ';
  stSql := stSql + ' Where co_companycode = ''001'' ';
  stSql := stSql + ' and em_code = ''' + aEmCode + ''' ';

  with targetSearchADOQuery do
  begin
    Close;
    Sql.Text :=  stSql;
    Try
      Execsql;
    Except
      Exit;
    End;
  end;
  result := true;
end;

end.
