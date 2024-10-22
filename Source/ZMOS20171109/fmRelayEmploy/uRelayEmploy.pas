unit uRelayEmploy;

{
##################### 삼육대학교 연동을 위한 프로그램 ############################
}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, ExtCtrls, StdCtrls, Gauges, Grids,
  BaseGrid, AdvGrid, Buttons, ComCtrls, DB, ADODB,ActiveX, AdvObj;

type
  TfmRelayEmploy = class(TfmASubForm)
    GroupBox1: TGroupBox;
    rg_RelayType: TRadioGroup;
    Panel6: TPanel;
    StatusBar1: TStatusBar;
    btn_Close: TSpeedButton;
    btn_Relay: TSpeedButton;
    sg_Employ: TAdvStringGrid;
    pan_state: TPanel;
    Label1: TLabel;
    Gauge1: TGauge;
    ADOQuery: TADOQuery;
    RelayConnection: TADOConnection;
    RelayQuery1: TADOQuery;
    RelayExeQuery: TADOQuery;
    ADOTempQuery: TADOQuery;
    btn_Error: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure btn_RelayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sg_EmployResize(Sender: TObject);
    procedure btn_ErrorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure showEmployee(aCode:string);
    Function DeleteDoorGradeAll:Boolean;
    Function DeleteTB_EmployeeAll:Boolean;
    Function DeleteTB_CARDAll:Boolean;
    Function GetRelayConfig : Boolean;
  private
    L_nDataBaseType : integer;
    L_stServerIP:string;
    L_stServerPort:string;
    L_stUserID : string;
    L_stUserPW : string;
    L_stDataBaseName : string;
    L_stQuery : string;
    L_stUpdateQuery : string;
    L_stAllUpdateQuery : string;
    L_stRegCode : string;
    L_stDeleteCode : string;
    L_nCardGubunUse : integer;
    L_nFixedUse : integer; //고정길이 사용 유무 0:미사용,1:사용
    L_nFixedLen : integer; //카드길이 고정 길이
    L_nFixedChar : string; //카드고정 채움문자
    Function AdoRelayConnected:Boolean;
    Function InsertRelayProcess:Boolean; //삭제 후 모든 데이터 적용
    Function UpdateRelayProcess:Boolean; //추가 및 수정 데이터 적용
    Function UpdateRelayALL:Boolean; //전체를 업데이트 타입으로 변경
    Function UpdateRelayUpdate(aOldType,aNewType:string):Boolean; //타입을 변경
  private
    Function CheckTB_Employee(aCompanyCode,aEmCode:string):Boolean;
    Function CheckTB_CARDEmpNo(aCompanyCode,aEmCode:string;var aOldCardNo:string):Boolean;
    Function CheckTB_CARDGubunEmpNo(aCompanyCode,aEmCode,aGubun:string;var aOldCardNo:string):Boolean;
    Function CheckTB_CARDCARDNO(aCardNo:string):Boolean;
    Function InsertTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function UpdateTB_CARD(aCardNo,aCardGubun,aCardType,aEmpID,aCompanyCode:string) : Boolean;
    Function InsertTB_EMPLOYEEBasic(aEmpID,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpNM,aCompanyPhone,
                                 aHomePhone,aHandphone,aZipcode,aAddr1,aAddr2,aJoinDate,aRetireDate:string):Boolean;
    Function UpdateTB_EMPLOYEEBasic(aEmpID,aCompanyCode,aJijumCode,aDepartCode,aPosiCode,aEmpNM,aCompanyPhone,
                                 aHomePhone,aHandphone,aZipcode,aAddr1,aAddr2,aJoinDate,aRetireDate:string):Boolean;
    Function UpdateTB_DEVICECARDNOCardDelete(aCardNo:string):Boolean;
    Function DeleteTB_CARDCardNo(aCardNo:string):Boolean;

    Function GetMaxPositionNum : integer;
  private
    procedure sg_EmployHeaderSet;
  public
    { Public declarations }
  end;

var
  fmRelayEmploy: TfmRelayEmploy;

implementation

uses
  uDataModule1,
  uLomosUtil;
  
{$R *.dfm}

function TfmRelayEmploy.AdoRelayConnected: Boolean;
var
  conStr : string;
begin
  result := False;
  if L_nDataBaseType = 1 then    //MSSQL
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + L_stUserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + L_stUserID + ';';
    conStr := constr + 'Initial Catalog=' + L_stDataBaseName + ';';
    conStr := constr + 'Data Source=' + L_stServerIP  + ',' + L_stServerPort;
  end else if L_nDataBaseType = 2 then  //PostGreSql
  begin
    conStr := 'Provider=PostgreSQL.1;';
    conStr := constr + 'Data Source=' + L_stServerIP + ',' + L_stServerPort + ';';
    conStr := constr + 'location=' + L_stDataBaseName + ';';
    conStr := constr + 'User Id='+ L_stUserID + ';';
    conStr := constr + 'password=' + L_stUserPW;
  end else if L_nDataBaseType = 0 then   //MDB
  begin
  {      //if DBName = '' then
    DBName := stExeFolder + '\..\DB\ZMOS.mdb';
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + DBName + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
    //if stuserPW <> '' then  conStr := conStr + ' Password=' + stuserPW;  }
  end else
  begin
    showmessage('DB Type 이 정확하지 않습니다.');
    Exit;
  end;

  with RelayConnection do
  begin
    Connected := False;
    ConnectionString := conStr;
    LoginPrompt:= false ;
    Try
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
          //ShowMessage('데이터베이스 접속 에러' );
          Exit;
        end;
    End;
    CursorLocation := clUseServer;
  end;
  result := True;
end;

procedure TfmRelayEmploy.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmRelayEmploy.btn_RelayClick(Sender: TObject);
begin
  if rg_RelayType.ItemIndex = 0 then
  begin
    if (Application.MessageBox(PChar('데이터를 전체 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    //여기에서 전체 인적사항 및 카드데이터 삭제
    pan_state.Visible := True;
    Label1.Caption := '현재 모든 출입문의 권한을 삭제중입니다...';
    Application.ProcessMessages;
    if Not DeleteDoorGradeAll then
    begin
      showmessage('출입문권한 삭제에 실패했습니다.');
      pan_state.Visible := False;
      Exit;
    end;
    Label1.Caption := '현재 모든 인적사항을 삭제중입니다...';
    Application.ProcessMessages;
    if Not DeleteTB_EmployeeAll then
    begin
      showmessage('인적사항 삭제에 실패했습니다.');
      pan_state.Visible := False;
      Exit;
    end;
    Label1.Caption := '현재 모든 카드데이터를 삭제중입니다...';
    Application.ProcessMessages;
    if Not DeleteTB_CARDAll then
    begin
      showmessage('카드데이터 삭제에 실패했습니다.');
      pan_state.Visible := False;
      Exit;
    end;
    //권한 삭제
    showEmployee('');
  end;
  pan_state.Visible := True;
  Label1.Caption := '진행상황';
  Application.ProcessMessages;
  if Not AdoRelayConnected then
  begin
    showmessage('연동테이블 접속에 실패했습니다. 접속환경을 확인하시기 바랍니다.');
    pan_state.Visible := False;
    Exit;
  end;
  if rg_RelayType.ItemIndex = 0 then
  begin
    DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '출입권한전체연동');
    UpdateRelayALL;
    InsertRelayProcess;
    UpdateRelayUpdate('R','Y');
  end else
  begin
    DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '출입권한변동데이터연동');
    UpdateRelayUpdate('N','R');
    UpdateRelayProcess;
    UpdateRelayUpdate('R','Y');
  end;

  showEmployee('');
  showmessage('데이터 연동 후 반드시 권한 부여를 해 주셔야 합니다.');
end;

function TfmRelayEmploy.CheckTB_CARDCARDNO(aCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  with ADOTempQuery do
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

function TfmRelayEmploy.CheckTB_CARDEmpNo(aCompanyCode, aEmCode: string;
  var aOldCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode + ''' ';

  with ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aOldCardNo := FindField('CA_CARDNO').AsString;
    result := True;
  end;

end;

function TfmRelayEmploy.CheckTB_CARDGubunEmpNo(aCompanyCode, aEmCode,
  aGubun: string; var aOldCardNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'select * from TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode + ''' ';
  stSql := stSql + ' AND CA_GUBUN = ''' + aGubun + ''' ';

  with ADOTempQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    aOldCardNo := FindField('CA_CARDNO').AsString;
    result := True;
  end;
end;

function TfmRelayEmploy.CheckTB_Employee(aCompanyCode,
  aEmCode: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Select * from TB_EMPLOYEE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmcode + ''' ';

  with ADOTempQuery do
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

function TfmRelayEmploy.DeleteDoorGradeAll: Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set ';
  stSql := stSql + ' DE_PERMIT = ''N'' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmRelayEmploy.DeleteTB_CARDAll: Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmRelayEmploy.DeleteTB_CARDCardNo(aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_CARD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmRelayEmploy.DeleteTB_EmployeeAll: Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_EMPLOYEE ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmRelayEmploy.FormShow(Sender: TObject);
begin
  if Not IsDeleteGrade then
  begin
    rg_RelayType.ItemIndex := 1;
    rg_RelayType.Enabled := False;
  end  else
  begin
//    rg_RelayType.ItemIndex := 0;
    rg_RelayType.Enabled := True;
  end;

  if IsInsertGrade then btn_Relay.Enabled := True
  else btn_Relay.Enabled := False;


  if Not GetRelayConfig then
  begin
    showmessage('연동환경 설정값을 읽는데 실패했습니다.');
    btn_Relay.Enabled := False;
    Exit;
  end;
  showEmployee('');
end;

function TfmRelayEmploy.GetRelayConfig: Boolean;
var
  stSql : string;
begin
  result := False;
  L_stUpdateQuery := '';
  L_stAllUpdateQuery := '';
  L_stRegCode := '';
  L_stDeleteCode := '';

  L_nDataBaseType := 1; //MSSQL 연동
  L_stServerIP := '210.94.230.2';
  L_stServerPort := '1433';
  L_stUserID := 'SA';
  L_stUserPW := 'lotecs@9240';
  L_stDataBaseName := 'UMCS';
  L_stQuery := ' SELECT ';
  L_stQuery := L_stQuery + '''1'' AS EM_STATE, ';
  L_stQuery := L_stQuery + 'CHTO_IDNO AS CARDNO1, ';
  L_stQuery := L_stQuery + 'CHTO_ISFG AS CARDNO2, ';
  L_stQuery := L_stQuery + 'CHTO_ISCM AS CARDNO3, ';
  L_stQuery := L_stQuery + 'CHTO_IDNO AS EM_CODE, ';
  L_stQuery := L_stQuery + '''001'' AS CO_COMPANYCODE, ';
  L_stQuery := L_stQuery + 'CHTO_BDCD AS CO_JIJUMCODE, ';
  L_stQuery := L_stQuery + '''NOT'' AS CO_DEPARTCODE, ';
  L_stQuery := L_stQuery + '''NOT'' AS PO_POSICODE, ';
  L_stQuery := L_stQuery + 'CHTO_NMKR AS EM_NAME, ';
  L_stQuery := L_stQuery + ''''' AS EM_COPHONE, ';
  L_stQuery := L_stQuery + ''''' AS EM_HOMEPHONE, ';
  L_stQuery := L_stQuery + ''''' AS EM_HANDPHONE, ';
  L_stQuery := L_stQuery + ''''' AS ZI_ZIPCODE, ';
  L_stQuery := L_stQuery + ''''' AS EM_ADDR1, ';
  L_stQuery := L_stQuery + ''''' AS EM_ADDR2, ';
  L_stQuery := L_stQuery + ''''' AS EM_JOINDATE, ';
  L_stQuery := L_stQuery + ''''' AS EM_RETIREDATE  ';
  L_stQuery := L_stQuery + 'FROM UMCS_CHTO ';
  L_stQuery := L_stQuery + 'WHERE CHTO_REIS = ''R'' ';

  L_stUpdateQuery := 'UPDATE UMCS_CHTO SET CHTO_REIS = '':NEWVALUE'' ';
  L_stUpdateQuery := L_stUpdateQuery + ' WHERE CHTO_REIS = '':OLDVALUE'' ';

  L_stAllUpdateQuery := 'UPDATE UMCS_CHTO SET CHTO_REIS = '':NEWVALUE'' ';

  L_stRegCode := '1' ;
  L_stDeleteCode := '';
  L_nFixedLen := 16;
  L_nFixedUse := 1;
  L_nFixedChar := '0';

  stSql := 'select * from TB_PERRELAYCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with AdoQuery do
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
      if FindField('PC_CONFIGCODE').AsString = 'DBTYPE' then
        L_nDataBaseType := strtoint(FindField('PC_CONFIGVALUE').AsString)
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERIP' then
        L_stServerIP := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBSERVERPORT' then
        L_stServerPort := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERID' then
        L_stUserID := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUSERPW' then
        L_stUserPW := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBNAME' then
        L_stDataBaseName := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBQuery' then
        L_stQuery := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBUPDATEQUERY' then
        L_stUpdateQuery := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DBALLUPDATEQUERY' then
        L_stAllUpdateQuery := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'LIVECODE' then
        L_stRegCode := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'DELETECODE' then
        L_stDeleteCode := FindField('PC_CONFIGVALUE').AsString
      else if FindField('PC_CONFIGCODE').AsString = 'CARDGUBUNCODE' then
        L_nCardGubunUse := strtoint(FindField('PC_CONFIGVALUE').AsString)
      else if FindField('PC_CONFIGCODE').AsString = 'CARDFIXUSE' then
        L_nFixedUse := strtoint(FindField('PC_CONFIGVALUE').AsString)
      else if FindField('PC_CONFIGCODE').AsString = 'CARDFIXLEN' then
      begin
        if IsDigit(FindField('PC_CONFIGVALUE').AsString) then
          L_nFixedLen := strtoint(FindField('PC_CONFIGVALUE').AsString);
      end
      else if FindField('PC_CONFIGCODE').AsString = 'CARDFIXCHAR' then
        L_nFixedChar := FindField('PC_CONFIGVALUE').AsString;


      Next;
    end;
    result := True;
  end;
end;

function TfmRelayEmploy.InsertRelayProcess: Boolean;
var
  stCardNo : string;
  stCardNo1 : string;
  stCardNo2 : string;
  stEmCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  nErrCount : integer;
begin
  result := False;
  nErrCount := 0;
  with RelayQuery1 do
  begin
    Close;
    Sql.Text := L_stQuery;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
      if Trim(L_stDeleteCode) <> '' then     //전체 입력에서 삭제 데이터는 무시하자.
      begin
        if Trim(FindField('EM_STATE').AsString) = Trim(L_stDeleteCode) then
        begin
          Next;
          Continue;
        end;
      end;
      stCardNo1 := '';
      stCardNo2 := '';
      stCardNo := Trim(FindField('CARDNO1').AsString);
      stCardNo1 := FillCharString(stCardNo,L_nFixedChar[1],L_nFixedLen - 2,False); //처음 카드번호는 무조건 존재 해야 함
      if Trim(FindField('CARDNO2').AsString) <> '' then //차수
            stCardNo1 := stCardNo1 + FillCharString(Trim(FindField('CARDNO2').AsString),'0',2,True);
      if Trim(FindField('CARDNO3').AsString) <> '' then //모바일차수
            stCardNo2 := stCardNo + FillCharString(Trim(FindField('CARDNO2').AsString),'0',2,True) + FillCharString(Trim(FindField('CARDNO3').AsString),'0',2,True);
      if L_nCardGubunUse = 1 then //카드 구분코드 사용시
      begin
        //이부분은 미사용하기로 처리함.
        //if stCardNo1 <> '' then stCardNo1 := '01' + stCardNo1;
        //if stCardNo2 <> '' then stCardNo2 := '02' + stCardNo2;
      end;
      if L_nFixedUse = 1 then //고정길이 사용시
      begin
        if stCardNo1 <> '' then stCardNo1 := FillCharString(stCardNo1,L_nFixedChar[1],L_nFixedLen,False);
        if stCardNo2 <> '' then stCardNo2 := FillCharString(stCardNo2,L_nFixedChar[1],L_nFixedLen,False);
      end;
      stEmCode := Trim(FindField('EM_CODE').AsString);
      stCompanyCode := FillZeroStrNum(Trim(FindField('CO_COMPANYCODE').AsString),3);
      if UpperCase(Trim(FindField('CO_JIJUMCODE').AsString)) <> 'NOT' then
        stJijumCode := FillZeroStrNum(Trim(FindField('CO_JIJUMCODE').AsString),3);
      if UpperCase(Trim(FindField('CO_DEPARTCODE').AsString)) <> 'NOT' then
        stDepartCode := FillZeroStrNum(Trim(FindField('CO_DEPARTCODE').AsString),3);
      if UpperCase(Trim(FindField('PO_POSICODE').AsString)) <> 'NOT' then
        stPosiCode := FillZeroStrNum(Trim(FindField('PO_POSICODE').AsString),3);
      if Not CheckTB_Employee(stCompanyCode,stEmCode) then
      begin
        if InsertTB_EMPLOYEEBasic(stEmCode,
                             stCompanyCode,
                             stJijumCode,
                             stDepartCode,
                             stPosiCode,
                             Trim(FindField('EM_NAME').AsString),
                             Trim(FindField('EM_COPHONE').AsString),
                             Trim(FindField('EM_HOMEPHONE').AsString),
                             Trim(FindField('EM_HANDPHONE').AsString),
                             Trim(FindField('ZI_ZIPCODE').AsString),
                             Trim(FindField('EM_ADDR1').AsString),
                             Trim(FindField('EM_ADDR2').AsString),
                             Trim(FindField('EM_JOINDATE').AsString),
                             Trim(FindField('EM_RETIREDATE').AsString)) then
        begin
          //인적테이블 등록 성공하면 카드테이블 등록하자.
          if stCardNo1 <> '' then //일반카드 등록
          begin
            if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
              inc(nErrCount);
            end;
          end;
          if stCardNo2 <> '' then //모바일카드등록
          begin
            if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
              inc(nErrCount);
            end;
          end;
        end else
        begin
          // 사원정보 없는거 확인하고 인서트 했는데 실패했으면 실패한거다.
         { if DUPCARDTYPE = 1 then // 2장 이상 카드 사용시.
          begin
            if stCardNo1 <> '' then //일반카드 등록
            begin
              if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
                inc(nErrCount);
              end;
            end;
            if stCardNo2 <> '' then //모바일카드등록
            begin
              if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
                inc(nErrCount);
              end;
            end;
          end else
          begin  }
            LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo + ' 인서트 실패');
            inc(nErrCount);
          {end;}
        end;
      end else
      begin
          if DUPCARDTYPE = 1 then // 2장 이상 카드 사용시.
          begin
            if stCardNo1 <> '' then //일반카드 등록
            begin
              if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
                inc(nErrCount);
              end;
            end;
            if stCardNo2 <> '' then //모바일카드등록
            begin
              if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' 인서트 실패');
                inc(nErrCount);
              end;
            end;
          end else
          begin
            LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE 테이블 :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo + ' 인서트 실패');
            inc(nErrCount);
          end;
      end;
      Next;
    end;
  end;
  if nErrCount > 0 then
  begin
    btn_Error.Enabled := True;
    showmessage(inttostr(nErrCount) + ' 건에서 입력 오류가 발생했습니다.');
  end;
  result := True;
  //전체데이터 읽어서 인서트 끝
end;

function TfmRelayEmploy.InsertTB_CARD(aCardNo, aCardGubun, aCardType,
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

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmRelayEmploy.InsertTB_EMPLOYEEBasic(aEmpID, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aEmpNM, aCompanyPhone, aHomePhone,
  aHandphone, aZipcode, aAddr1, aAddr2, aJoinDate,
  aRetireDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  if UpperCase(aJijumCode) <> 'NOT' then
    stSql := stSql + 'CO_JIJUMCODE,';
  if UpperCase(aDepartCode) <> 'NOT' then
    stSql := stSql + 'CO_DEPARTCODE,';
  if UpperCase(aPosiCode) <> 'NOT' then
    stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  if UpperCase(aCompanyPhone) <> 'NOT' then
    stSql := stSql + 'EM_COPHONE,';
  if UpperCase(aHomePhone) <> 'NOT' then
    stSql := stSql + 'EM_HOMEPHONE,';
  if UpperCase(aHandphone) <> 'NOT' then
    stSql := stSql + 'EM_HANDPHONE,';
  if UpperCase(aZipcode) <> 'NOT' then
    stSql := stSql + 'ZI_ZIPCODE,';
  if UpperCase(aAddr1) <> 'NOT' then
    stSql := stSql + 'EM_ADDR1,';
  if UpperCase(aAddr2) <> 'NOT' then
    stSql := stSql + 'EM_ADDR2,';
  if UpperCase(aJoinDate) <> 'NOT' then
    stSql := stSql + 'EM_JOINDATE,';
  if UpperCase(aRetireDate) <> 'NOT' then
    stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR ) ';
  stSql := stSql + 'VALUES ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aEmpID + ''',';
  stSql := stSql + '''' + aCompanyCode + ''',';
  if UpperCase(aJijumCode) <> 'NOT' then
    stSql := stSql + '''' + aJijumCode + ''',';
  if UpperCase(aDepartCode) <> 'NOT' then
    stSql := stSql + '''' + aDepartCode + ''',';
  if UpperCase(aPosiCode) <> 'NOT' then
    stSql := stSql + '''' + aPosiCode + ''',';
  stSql := stSql + '''' + aEmpNM + ''',';
  if UpperCase(aCompanyPhone) <> 'NOT' then
    stSql := stSql + '''' + aCompanyPhone + ''',';
  if UpperCase(aHomePhone) <> 'NOT' then
    stSql := stSql + '''' + aHomePhone + ''',';
  if UpperCase(aHandphone) <> 'NOT' then
    stSql := stSql + '''' + aHandphone + ''',';
  if UpperCase(aZipcode) <> 'NOT' then
    stSql := stSql + '''' + aZipcode + ''',';
  if UpperCase(aAddr1) <> 'NOT' then
    stSql := stSql + '''' + aAddr1 + ''',';
  if UpperCase(aAddr2) <> 'NOT' then
    stSql := stSql + '''' + aAddr2 + ''',';
  if UpperCase(aJoinDate) <> 'NOT' then
    stSql := stSql + '''' + aJoinDate + ''',';
  if UpperCase(aRetireDate) <> 'NOT' then
    stSql := stSql + '''' + aRetireDate + ''',';
  stSql := stSql + '''001'',';
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + '''' + Master_ID + ''' )';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmRelayEmploy.showEmployee(aCode: string);
var
  stSql :string;
  nRow : integer;
begin
  pan_state.Visible := False;
  GridInitialize(sg_Employ);
  stSql := ' select a.*,b.CA_CARDNO ';
  stSql := stSql + ' From TB_EMPLOYEE a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CO_COMPANYCODE = b.CO_COMPANYCODE ';
  stSql := stSql + ' AND a.EM_CODE = b.EM_CODE )';
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
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
    StatusBar1.Panels[0].Text := inttostr(recordCount) + ' 건 조회 완료';
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
      end;
      inc(nRow);
      Next;
    end;
  end;

end;

function TfmRelayEmploy.UpdateRelayALL: Boolean;
var
  stSql : string;
begin
  result := False;
  if Trim(L_stAllUpdateQuery) = '' then Exit;
  stSql := StringReplace(L_stAllUpdateQuery,':NEWVALUE','R',[rfReplaceAll]);

  with RelayExeQuery do
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

function TfmRelayEmploy.UpdateRelayProcess: Boolean;
var
  nErrCount : integer;
  bResult : Boolean;
  stCardNo : string;
  stCardNo1 : string;
  stCardNo2 : string;
  stOldCardNo : string;
  stEmCode : string;
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
begin
  //전체데이터 읽어서
  //현재 테이블에 있는지 체크 및 카드번호 체크
  //있으면 인적사항 업데이트
  //카드번호 변경되었으면 기존 카드번호 권한삭제
  //카드테이블에 기존카드번호 삭제
  //현재카드번호 존재하는지 체크
  //존재하면 사번만 이 데이터로 변경
  //존재하지 않으면 삽입
  nErrCount := 0;
  result := False;
  with RelayQuery1 do
  begin
    Close;
    Sql.Text := L_stQuery;
    Try
      Open;
    Except
      Exit;
    End;
  
    Gauge1.MaxValue := recordCount;
    Gauge1.Progress := 0;
    while Not Eof do
    begin
      Gauge1.Progress := Gauge1.Progress + 1;
      Application.ProcessMessages;
      bResult := False;
      stCardNo := Trim(FindField('CARDNO1').AsString);
      stCardNo1 := '';
      stCardNo2 := '';
      if stCardNo <> '' then
      begin
        //stCardNo1 := stCardNo; //처음 카드는 무조건 학번으로 셋팅한다.
        stCardNo1 := FillCharString(stCardNo,L_nFixedChar[1],L_nFixedLen - 1,False); //처음 카드번호는 무조건 존재 해야 함
        if Trim(FindField('CARDNO2').AsString) <> '' then
          stCardNo1 := stCardNo1 + Trim(FindField('CARDNO2').AsString);
        if Trim(FindField('CARDNO3').AsString) <> '' then
          stCardNo2 := stCardNo + Trim(FindField('CARDNO2').AsString) + Trim(FindField('CARDNO3').AsString);
      end;
      if L_nCardGubunUse = 1 then //카드 구분코드 사용시
      begin
        //사용하지 않기로 함
        //if stCardNo1 <> '' then stCardNo1 := '01' + stCardNo1;
        //if stCardNo2 <> '' then stCardNo2 := '02' + stCardNo2;
      end;
      if L_nFixedUse = 1 then //고정길이 사용시
      begin
        if stCardNo1 <> '' then stCardNo1 := FillCharString(stCardNo1,L_nFixedChar[1],L_nFixedLen,False);
        if stCardNo2 <> '' then stCardNo2 := FillCharString(stCardNo2,L_nFixedChar[1],L_nFixedLen,False);
      end;
      if Trim(L_stDeleteCode) <> '' then     //부분 입력에서 삭제 데이터는 권한삭제 및 카드테이블 삭제하자.
      begin
        if Trim(FindField('EM_STATE').AsString) = Trim(L_stDeleteCode) then
        begin
          if stCardNo1 <> '' then  //일반카드 삭제
          begin
            UpdateTB_DEVICECARDNOCardDelete(stCardNo1); //해당 카드의 권한을 삭제하자
            DeleteTB_CARDCardNo(stCardNo1); //해당 카드를 삭제하자
          end;
          if stCardNo2 <> '' then //모바일카드 삭제
          begin
            UpdateTB_DEVICECARDNOCardDelete(stCardNo2); //해당 카드의 권한을 삭제하자
            DeleteTB_CARDCardNo(stCardNo2); //해당 카드를 삭제하자
          end;
          Next;
          Continue;
        end;
      end;

      stEmCode := Trim(FindField('EM_CODE').AsString);
      stCompanyCode := FillZeroStrNum(Trim(FindField('CO_COMPANYCODE').AsString),3);
      if UpperCase(Trim(FindField('CO_JIJUMCODE').AsString)) <> 'NOT' then
        stJijumCode := FillZeroStrNum(Trim(FindField('CO_JIJUMCODE').AsString),3);
      if UpperCase(Trim(FindField('CO_DEPARTCODE').AsString)) <> 'NOT' then
        stDepartCode := FillZeroStrNum(Trim(FindField('CO_DEPARTCODE').AsString),3);
      if UpperCase(Trim(FindField('PO_POSICODE').AsString)) <> 'NOT' then
        stPosiCode := FillZeroStrNum(Trim(FindField('PO_POSICODE').AsString),3);
      if Not CheckTB_Employee(stCompanyCode,stEmCode) then //사원테이블에 있는지 체크
      begin
        //신규 회원이면
        bResult := InsertTB_EMPLOYEEBasic(stEmCode,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               stPosiCode,
                               Trim(FindField('EM_NAME').AsString),
                               Trim(FindField('EM_COPHONE').AsString),
                               Trim(FindField('EM_HOMEPHONE').AsString),
                               Trim(FindField('EM_HANDPHONE').AsString),
                               Trim(FindField('ZI_ZIPCODE').AsString),
                               Trim(FindField('EM_ADDR1').AsString),
                               Trim(FindField('EM_ADDR2').AsString),
                               Trim(FindField('EM_JOINDATE').AsString),
                               Trim(FindField('EM_RETIREDATE').AsString)) ;
        if bResult then //인서트 성공이면
        begin
          if stCardNo1 <> '' then
          begin
            if Not CheckTB_CARDCARDNO(stCardNo1) then //일반카드번호가 있는지 체크
              InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
            else
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': 카드번호 중복');
              inc(nErrCount);
            end;
          end;
          if stCardNo2 <> '' then
          begin
            if Not CheckTB_CARDCARDNO(stCardNo2) then //일반카드번호가 있는지 체크
              InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
            else
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': 카드번호 중복');
              inc(nErrCount);
            end;
          end;
        end else
        begin
          LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE 테이블 :' + stCompanyCode + '/' + stEmCode + ' 인서트 실패');
          inc(nErrCount);
        end;
      end else
      begin
        //변경된 회원이면
        bResult := UpdateTB_EMPLOYEEBasic(stEmCode,
                               stCompanyCode,
                               stJijumCode,
                               stDepartCode,
                               stPosiCode,
                               Trim(FindField('EM_NAME').AsString),
                               Trim(FindField('EM_COPHONE').AsString),
                               Trim(FindField('EM_HOMEPHONE').AsString),
                               Trim(FindField('EM_HANDPHONE').AsString),
                               Trim(FindField('ZI_ZIPCODE').AsString),
                               Trim(FindField('EM_ADDR1').AsString),
                               Trim(FindField('EM_ADDR2').AsString),
                               Trim(FindField('EM_JOINDATE').AsString),
                               Trim(FindField('EM_RETIREDATE').AsString)) ;
        if bResult then
        begin
          if DUPCARDTYPE = 1 then // 2장 이상 카드 사용시.
          begin
            if L_nCardGubunUse = 1 then //카드 구분코드 사용시
            begin
              if stCardNo1 <> '' then
              begin
                if Not CheckTB_CARDGubunEmpNo(stCompanyCode,stEmCode,'1',stOldCardNo) then //일반카드번호가 있는지 체크
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': 기존 일반 카드 없음');
                  if Not CheckTB_CARDCARDNO(stCardNo1) then //카드번호가 있는지 체크
                    InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                  else
                  begin
                    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': 일반카드번호 중복');
                    inc(nErrCount);
                  end;
                end else
                begin
                  if Trim(stOldCardNo) <> Trim(stCardNo1) then  //새로운 카드가 다른경우
                  begin
                    UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //해당 카드의 권한을 삭제하자
                    DeleteTB_CARDCardNo(stOldCardNo); //해당 카드를 삭제하자
                    if Not CheckTB_CARDCARDNO(stCardNo1) then //카드번호가 있는지 체크
                      InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                    else
                    begin
                      LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': 일반카드번호 중복');
                      inc(nErrCount);
                    end;
                  end; //같으면 그냥 놔둠.
                end;
              end;
              if stCardNo2 <> '' then
              begin
                if Not CheckTB_CARDGubunEmpNo(stCompanyCode,stEmCode,'2',stOldCardNo) then //모바일카드번호가 있는지 체크
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': 기존 모바일 카드 없음');
                  if Not CheckTB_CARDCARDNO(stCardNo2) then //카드번호가 있는지 체크
                    InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                  else
                  begin
                    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': 모바일카드번호 중복');
                    inc(nErrCount);
                  end;
                end else
                begin
                  if Trim(stOldCardNo) <> Trim(stCardNo2) then  //새로운 카드가 다른경우
                  begin
                    UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //해당 카드의 권한을 삭제하자
                    DeleteTB_CARDCardNo(stOldCardNo); //해당 카드를 삭제하자
                    if Not CheckTB_CARDCARDNO(stCardNo2) then //카드번호가 있는지 체크
                      InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                    else
                    begin
                      LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': 모바일카드번호 중복');
                      inc(nErrCount);
                    end;
                  end; //같으면 그냥 놔둠.
                end;
              end;
            end else  //카드구분 미사용하면서 2장이상 사용하는경우
            begin
              if stCardNo1 <> '' then
              begin
                if Not CheckTB_CARDCARDNO(stCardNo1) then //카드번호가 있는지 체크
                  InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                else
                begin
                  UpdateTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode);
                end;
              end;
              if stCardNo2 <> '' then
              begin
                if Not CheckTB_CARDCARDNO(stCardNo2) then //카드번호가 있는지 체크
                  InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                else
                begin
                  UpdateTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode);
                end;
              end;
            end;
          end else  //1인당 카드번호 하나만 사용한다고 할때...
          begin
            if Not CheckTB_CARDEmpNo(stCompanyCode,stEmCode,stOldCardNo) then //카드번호가 있는지 체크
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': 기존카드 없음');
              if Not CheckTB_CARDCARDNO(stCardNo1) then //카드번호가 있는지 체크
                InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
              else
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': 카드번호 중복');
                inc(nErrCount);
              end;
            end else  //기존 카드가 존재
            begin
              if Trim(stOldCardNo) <> Trim(stCardNo1) then  //새로운 카드가 다른경우
              begin
                UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //해당 카드의 권한을 삭제하자
                DeleteTB_CARDCardNo(stOldCardNo); //해당 카드를 삭제하자
                if Not CheckTB_CARDCARDNO(stCardNo1) then //카드번호가 있는지 체크
                  InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                else
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': 카드번호 중복');
                  inc(nErrCount);
                end;
              end;
            end;
          end;
        end else //업데이트 실패한경우
        begin
          LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE 테이블 :' + stCompanyCode + '/' + stEmCode + ' 업데이트 실패');
          inc(nErrCount);
        end;
      end; //사원테이블 체크하여 있는 경우,없는경우

      Next;
    end;
  end;
  if nErrCount > 0 then
  begin
    showmessage(inttostr(nErrCount) + ' 건에서 입력 오류가 발생했습니다.');
  end;
  result := True;
end;

function TfmRelayEmploy.UpdateRelayUpdate(aOldType,
  aNewType: string): Boolean;
var
  stSql : string;
begin
  result := False;
  if Trim(L_stUpdateQuery) = '' then Exit;
  stSql := StringReplace(L_stUpdateQuery,':NEWVALUE',aNewType,[rfReplaceAll]);
  stSql := StringReplace(stSql,':OLDVALUE',aOldType,[rfReplaceAll]);

  with RelayExeQuery do
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

function TfmRelayEmploy.UpdateTB_CARD(aCardNo, aCardGubun, aCardType,
  aEmpID, aCompanyCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CARD set ';
  stSql := stSql + 'CA_GUBUN = ''' + aCardGubun + ''',';
  stSql := stSql + 'CA_CARDTYPE = ''' + aCardType + ''',';
  stSql := stSql + 'EM_CODE = ''' + aEmpID + ''',';
  stSql := stSql + 'CO_COMPANYCODE = ''' + aCompanyCode + ''',';
  stSql := stSql + 'CA_MEMLOAD = ''N'',';
  stSql := stSql + 'CA_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'CA_UPDATEOPERATOR = ''' + MASTER_ID + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' +  GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ' ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmRelayEmploy.UpdateTB_DEVICECARDNOCardDelete(
  aCardNo: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_DEVICECARDNO set ';
  stSql := stSql + ' DE_PERMIT = ''N'' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmRelayEmploy.UpdateTB_EMPLOYEEBasic(aEmpID, aCompanyCode,
  aJijumCode, aDepartCode, aPosiCode, aEmpNM, aCompanyPhone, aHomePhone,
  aHandphone, aZipcode, aAddr1, aAddr2, aJoinDate,
  aRetireDate: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_EMPLOYEE set ';
  if UpperCase(aJijumCode) <> 'NOT' then
    stSql := stSql + 'CO_JIJUMCODE = ''' + aJijumCode + ''',';
  if UpperCase(aDepartCode) <> 'NOT' then
    stSql := stSql + 'CO_DEPARTCODE = ''' + aDepartCode + ''',';
  if UpperCase(aPosiCode) <> 'NOT' then
    stSql := stSql + 'PO_POSICODE = ''' + aPosiCode + ''',';
  stSql := stSql + 'EM_NAME = ''' + aEmpNM + ''',';
  if UpperCase(aCompanyPhone) <> 'NOT' then
    stSql := stSql + 'EM_COPHONE = ''' + aCompanyPhone + ''',';
  if UpperCase(aHomePhone) <> 'NOT' then
    stSql := stSql + 'EM_HOMEPHONE = ''' + aHomePhone + ''',';
  if UpperCase(aHandphone) <> 'NOT' then
    stSql := stSql + 'EM_HANDPHONE = ''' + aHandphone + ''',';
  if UpperCase(aZipcode) <> 'NOT' then
    stSql := stSql + 'ZI_ZIPCODE = ''' + aZipcode + ''',';
  if UpperCase(aAddr1) <> 'NOT' then
    stSql := stSql + 'EM_ADDR1 = ''' + aAddr1 + ''',';
  if UpperCase(aAddr2) <> 'NOT' then
    stSql := stSql + 'EM_ADDR2 = ''' + aAddr2 + ''',';
  if UpperCase(aJoinDate) <> 'NOT' then
    stSql := stSql + 'EM_JOINDATE = ''' + aJoinDate + ''',';
  if UpperCase(aRetireDate) <> 'NOT' then
    stSql := stSql + 'EM_RETIREDATE = ''' + aRetireDate + ''',';
  stSql := stSql + 'EM_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
  stSql := stSql + 'EM_UPDATEOPERATOR = ''' + Master_ID + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmpID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmRelayEmploy.sg_EmployResize(Sender: TObject);
var
  nTemp : integer;
  nTemp2 : integer;
begin
  nTemp := fmRelayEmploy.Width div 2;
  nTemp2 := pan_state.Width div 2;
  pan_state.Left := nTemp - nTemp2;
  nTemp := fmRelayEmploy.Height div 2;
  nTemp2 := pan_state.Height div 2;
  pan_state.Top := nTemp - nTemp2;
end;

procedure TfmRelayEmploy.btn_ErrorClick(Sender: TObject);
begin
  ExecFileAndWait('notepad.exe "' + ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log"',False,False);
end;

procedure TfmRelayEmploy.FormCreate(Sender: TObject);
begin
  sg_EmployHeaderSet;

end;

procedure TfmRelayEmploy.sg_EmployHeaderSet;
begin
  with sg_Employ do
  begin
    cells[0,0] := FM001;
    cells[1,0] := FM101;
    cells[2,0] := FM102;
    cells[3,0] := '카드번호';
    cells[4,0] := FM011;
    cells[5,0] := FM021;
    cells[6,0] := FM031;
    cells[7,0] := FM103;
    cells[8,0] := '집전화번호';
    cells[9,0] := FM107;
    cells[10,0] := '우편번호';
    cells[11,0] := FM108;
    cells[12,0] := FM109;
    cells[13,0] := FM104;
    cells[14,0] := FM105;
    cells[15,0] := '사진위치';
  end;
end;

function TfmRelayEmploy.GetMaxPositionNum: integer;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  result := 1;

  stSql := 'Select Max(PositionNum) as MaxPosition From TB_CARD ';

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
    if Not IsDigit(FindField('MaxPosition').AsString) then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;
    result := FindField('MaxPosition').AsInteger + 1;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
end;

end.
