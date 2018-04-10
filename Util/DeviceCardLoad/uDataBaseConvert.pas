unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rg_targetDBType: TRadioGroup;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_targetUserpw: TEdit;
    ed_targetUserName: TEdit;
    ed_targetDBName: TEdit;
    ed_targetDBPort: TEdit;
    ed_targetDBIP: TEdit;
    btn_Conversion: TSpeedButton;
    btn_Close: TSpeedButton;
    gb_Progress: TGroupBox;
    Gauge2: TGauge;
    targetADOConnection: TADOConnection;
    ADOExecQuery: TADOQuery;
    ed_File: TEdit;
    Label1: TLabel;
    ed_Node: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    ed_Ecu: TEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    rg_Gubun: TRadioGroup;
    ADOSearchQuery: TADOQuery;
    ADOTempQuery1: TADOQuery;
    procedure btn_CloseClick(Sender: TObject);
    procedure rg_targetDBTypeClick(Sender: TObject);
    procedure btn_ConversionClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private

    { Private declarations }
    Function targetAdoConnect : Boolean;
  private
    L_IncNodeNo : integer;
    L_incJijumCode : integer;
    L_stCompanyCode : string;
    L_stBuildingCode : string;
    L_stFloorCode : string;

  public
    { Public declarations }
    procedure DeviceCardLoading;
    Function GetEmployeeNo(aCardNo:string):string;
    Function CheckTB_EMPLOYEE(aEmCode:string):Boolean;
    Function InsertTB_EMPLOYEE(aEmCode:string):Boolean;
    Function GetMaxFdmsID:string;
    Function CheckTB_CARD(aCardNo:string):Boolean;
    Function InsertTB_CARD(aCardNo,aEmCode:string):Boolean;
    Function GetMaxPositionNum:string;
    Function CheckTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo:string):Boolean;
    Function InsertTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo,aDoor1,aDoor2,aArm:string):Boolean;
    Function UpdateTB_DEVICECARDNO(aNodeNo,aEcuID,aCardNo,aDoor1,aDoor2,aArm:string):Boolean;
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

  if Not FileExists(ed_File.Text) then
  begin
    showmessage('카드 데이터를 정확히 입력 하세요.');
    Exit;
  end;

  if Not isDigit(ed_Node.Text) then
  begin
    showmessage('노드번호는 숫자여야 합니다.');
    Exit;
  end;

  if Not isDigit(ed_Ecu.Text) then
  begin
    showmessage('ECU번호는 숫자여야 합니다.');
    Exit;
  end;

  if Length(ed_Ecu.Text) <> 2 then
  begin
    showmessage('ECU 길이는 2자리로 입력하세요.');
    Exit;
  end;

  btn_Conversion.Enabled := False;

  DeviceCardLoading;

  btn_Conversion.Enabled := True;

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
  end else if rg_targetDBType.ItemIndex = 1 then
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + stHost + ';'   ;
    conStr := constr + 'location=' + stDBName + ';';
    conStr := constr + 'User Id='+ stuserID + ';';
    conStr := constr + 'password=' + stuserPW;
  end else if rg_targetDBType.ItemIndex = 2 then
  begin
    stDBName := ExtractFileDir(Application.ExeName) + '\..\DB\ZMOS.mdb';
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + stDBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
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


procedure TForm1.SpeedButton1Click(Sender: TObject);
VAR
  stEcuID : string;
begin
  if OpenDialog1.Execute then
  begin
    ed_File.Text := OpenDialog1.FileName;
  end;
  stEcuID := copy(ed_File.Text,1,Length(ed_File.Text) - 4);
  stEcuID := copy(stEcuID,Length(stEcuID) - 1,2);
  ed_Ecu.Text := stEcuID;
end;

procedure TForm1.DeviceCardLoading;
var
  CardList : TStringList;
  i : integer;
  stCardData : string;
  stEmCode : string;
  stCardNo : string;
  stDoor1 : string;
  stDoor2 : string;
  stArm : string;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := ed_Node.Text;
  stEcuID := ed_Ecu.Text;

  Try
    CardList := TStringList.Create;
    CardList.Delimiter := ',';
    CardList.LoadFromFile(ed_File.Text);
    Gauge2.Progress := 0;
    Gauge2.MaxValue := CardList.Count - 1;
    for i:= 1 to CardList.Count - 1 do
    begin
      Gauge2.Progress := i;
      stEmCode := '';
      stCardData := cardList.Strings[i];
      stCardNo := FindCharCopy(stCardData,0,',');
      if rg_Gubun.ItemIndex = 0 then
      begin
        stEmCode := copy(stCardNo,1,9);
      end else
      begin
        stCardNo := FillZeroNumber2(Hex2Dec64(stCardNo),10);
        //stEmCode := FindCharCopy(stCardData,1,',');//stCardNo; //GetEmployeeNo(FindCharCopy(stCardData,0,','));
        stEmCode := GetMaxFdmsID;
        if isDigit(stEmCode) then stEmCode := FillZeroNumber(strtoint(stEmCode),5);
      end;
      if stEmCode = '' then continue;
      stDoor1 := FindCharCopy(stCardData,2,',');
      stDoor2 := FindCharCopy(stCardData,3,',');
      stArm := FindCharCopy(stCardData,4,',');
      if Not CheckTB_CARD(stCardNo) then
      begin
        InsertTB_CARD(stCardNo,stEmCode);
        if Not CheckTB_EMPLOYEE(stEmCode) then
        begin
          InsertTB_EMPLOYEE(stEmCode);
        end;
      end;
      if Not CheckTB_DEVICECARDNO(stNodeNo,stEcuID,stCardNo) then
      begin
        InsertTB_DEVICECARDNO(stNodeNo,stEcuID,stCardNo,stDoor1,stDoor2,stArm);
      end else
      begin
        UpdateTB_DEVICECARDNO(stNodeNo,stEcuID,stCardNo,stDoor1,stDoor2,stArm);
      end;
      Application.ProcessMessages;
    end;
  Finally
    CardList.Free;
    Gauge2.Progress := 0;
  End;
end;

function TForm1.GetEmployeeNo(aCardNo: string): string;
var
  stSql : string;
begin
  result := '';
  stSql := 'Select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  //향후구현
end;

function TForm1.CheckTB_EMPLOYEE(aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' WHERE CO_COMPANYCODE = ''001'' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with ADOSearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TForm1.InsertTB_EMPLOYEE(aEmCode: string): Boolean;
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
  stSql := stSql + 'FDMS_ID)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''000'',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''' + FormatDateTime('yyyymmdd',now) + ''',';
  stSql := stSql + '''99991231'',';
  stSql := stSql + '' + GetMaxFdmsID + ')';

  with ADOExecQuery do
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

function TForm1.GetMaxFdmsID: string;
var
  stSql : string;
begin
  result := '32';
  stSql := ' Select Max(FDMS_ID) as Fdms_id from TB_EMPLOYEE ';

  with ADOTempQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if FindField('Fdms_id').AsInteger = 0 then Exit;
    result := inttostr( FindField('Fdms_id').AsInteger + 1);
  end;

end;

function TForm1.CheckTB_CARD(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' WHERE CA_CARDNO = '''+ aCardNo +''' ';

  with ADOSearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TForm1.InsertTB_CARD(aCardNo, aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_CARD(';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'POSITIONNUM,';
  stSql := stSql + 'CA_DOORGRADE)';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''1'',';
  stSql := stSql + '''' + aEmCode + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '' + GetMaxPositionNum + ',';
  stSql := stSql + '''Y'')';

  with ADOExecQuery do
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

function TForm1.GetMaxPositionNum: string;
var
  stSql : string;
begin
  result := '1';
  stSql := ' Select Max(positionnum) as positionnum from TB_CARD ';

  with ADOTempQuery1 do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    if FindField('positionnum').AsInteger = 0 then Exit;
    result := inttostr( FindField('positionnum').AsInteger + 1);
  end;

end;

function TForm1.CheckTB_DEVICECARDNO(aNodeNo, aEcuID,
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_DEVICECARDNO ';
  stSql := stSql + ' WHERE AC_NODENO = '+ aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOSearchQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    result := True;
  end;
end;

function TForm1.InsertTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo, aDoor1,
  aDoor2, aArm: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO(';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'DE_DOOR1,';
  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_USEALARM,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK)';
  stSql := stSql + ' Values(';
  stSql := stSql + ''+ aNodeNo +',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aCardNo + ''',';
  stSql := stSql + '''' + aDoor1 + ''',';
  stSql := stSql + '''' + aDoor2 + ''',';
  stSql := stSql + '''Y'',';
  stSql := stSql + '''' + aArm + ''',';
  stSql := stSql + '''0'',';
  stSql := stSql + '''L'',';
  stSql := stSql + '''Y'')';

  with ADOExecQuery do
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

function TForm1.UpdateTB_DEVICECARDNO(aNodeNo, aEcuID, aCardNo, aDoor1,
  aDoor2, aArm: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := ' Update TB_DEVICECARDNO set ';
  stSql := stSql + 'DE_DOOR1 = ''' + aDoor1 + ''',';
  stSql := stSql + 'DE_DOOR2 = ''' + aDoor2 + ''',';
  stSql := stSql + 'DE_USEALARM = ''' + aArm + ''',';
  stSql := stSql + ' WHERE AC_NODENO = '+ aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with ADOExecQuery do
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

end.
