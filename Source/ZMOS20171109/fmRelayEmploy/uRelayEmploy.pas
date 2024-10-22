unit uRelayEmploy;

{
##################### �������б� ������ ���� ���α׷� ############################
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
    L_nFixedUse : integer; //�������� ��� ���� 0:�̻��,1:���
    L_nFixedLen : integer; //ī����� ���� ����
    L_nFixedChar : string; //ī����� ä����
    Function AdoRelayConnected:Boolean;
    Function InsertRelayProcess:Boolean; //���� �� ��� ������ ����
    Function UpdateRelayProcess:Boolean; //�߰� �� ���� ������ ����
    Function UpdateRelayALL:Boolean; //��ü�� ������Ʈ Ÿ������ ����
    Function UpdateRelayUpdate(aOldType,aNewType:string):Boolean; //Ÿ���� ����
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
    showmessage('DB Type �� ��Ȯ���� �ʽ��ϴ�.');
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
          //ShowMessage('�����ͺ��̽� ���� ����' );
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
    if (Application.MessageBox(PChar('�����͸� ��ü �����Ͻðڽ��ϱ�?'),'����',MB_OKCANCEL) = ID_CANCEL)  then Exit;
    //���⿡�� ��ü �������� �� ī�嵥���� ����
    pan_state.Visible := True;
    Label1.Caption := '���� ��� ���Թ��� ������ �������Դϴ�...';
    Application.ProcessMessages;
    if Not DeleteDoorGradeAll then
    begin
      showmessage('���Թ����� ������ �����߽��ϴ�.');
      pan_state.Visible := False;
      Exit;
    end;
    Label1.Caption := '���� ��� ���������� �������Դϴ�...';
    Application.ProcessMessages;
    if Not DeleteTB_EmployeeAll then
    begin
      showmessage('�������� ������ �����߽��ϴ�.');
      pan_state.Visible := False;
      Exit;
    end;
    Label1.Caption := '���� ��� ī�嵥���͸� �������Դϴ�...';
    Application.ProcessMessages;
    if Not DeleteTB_CARDAll then
    begin
      showmessage('ī�嵥���� ������ �����߽��ϴ�.');
      pan_state.Visible := False;
      Exit;
    end;
    //���� ����
    showEmployee('');
  end;
  pan_state.Visible := True;
  Label1.Caption := '�����Ȳ';
  Application.ProcessMessages;
  if Not AdoRelayConnected then
  begin
    showmessage('�������̺� ���ӿ� �����߽��ϴ�. ����ȯ���� Ȯ���Ͻñ� �ٶ��ϴ�.');
    pan_state.Visible := False;
    Exit;
  end;
  if rg_RelayType.ItemIndex = 0 then
  begin
    DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '���Ա�����ü����');
    UpdateRelayALL;
    InsertRelayProcess;
    UpdateRelayUpdate('R','Y');
  end else
  begin
    DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '���Ա��Ѻ��������Ϳ���');
    UpdateRelayUpdate('N','R');
    UpdateRelayProcess;
    UpdateRelayUpdate('R','Y');
  end;

  showEmployee('');
  showmessage('������ ���� �� �ݵ�� ���� �ο��� �� �ּž� �մϴ�.');
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
    showmessage('����ȯ�� �������� �дµ� �����߽��ϴ�.');
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

  L_nDataBaseType := 1; //MSSQL ����
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
      if Trim(L_stDeleteCode) <> '' then     //��ü �Է¿��� ���� �����ʹ� ��������.
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
      stCardNo1 := FillCharString(stCardNo,L_nFixedChar[1],L_nFixedLen - 2,False); //ó�� ī���ȣ�� ������ ���� �ؾ� ��
      if Trim(FindField('CARDNO2').AsString) <> '' then //����
            stCardNo1 := stCardNo1 + FillCharString(Trim(FindField('CARDNO2').AsString),'0',2,True);
      if Trim(FindField('CARDNO3').AsString) <> '' then //���������
            stCardNo2 := stCardNo + FillCharString(Trim(FindField('CARDNO2').AsString),'0',2,True) + FillCharString(Trim(FindField('CARDNO3').AsString),'0',2,True);
      if L_nCardGubunUse = 1 then //ī�� �����ڵ� ����
      begin
        //�̺κ��� �̻���ϱ�� ó����.
        //if stCardNo1 <> '' then stCardNo1 := '01' + stCardNo1;
        //if stCardNo2 <> '' then stCardNo2 := '02' + stCardNo2;
      end;
      if L_nFixedUse = 1 then //�������� ����
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
          //�������̺� ��� �����ϸ� ī�����̺� �������.
          if stCardNo1 <> '' then //�Ϲ�ī�� ���
          begin
            if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
              inc(nErrCount);
            end;
          end;
          if stCardNo2 <> '' then //�����ī����
          begin
            if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
              inc(nErrCount);
            end;
          end;
        end else
        begin
          // ������� ���°� Ȯ���ϰ� �μ�Ʈ �ߴµ� ���������� �����ѰŴ�.
         { if DUPCARDTYPE = 1 then // 2�� �̻� ī�� ����.
          begin
            if stCardNo1 <> '' then //�Ϲ�ī�� ���
            begin
              if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
                inc(nErrCount);
              end;
            end;
            if stCardNo2 <> '' then //�����ī����
            begin
              if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
                inc(nErrCount);
              end;
            end;
          end else
          begin  }
            LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo + ' �μ�Ʈ ����');
            inc(nErrCount);
          {end;}
        end;
      end else
      begin
          if DUPCARDTYPE = 1 then // 2�� �̻� ī�� ����.
          begin
            if stCardNo1 <> '' then //�Ϲ�ī�� ���
            begin
              if Not InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
                inc(nErrCount);
              end;
            end;
            if stCardNo2 <> '' then //�����ī����
            begin
              if Not InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode) then  //
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_CARD ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ' �μ�Ʈ ����');
                inc(nErrCount);
              end;
            end;
          end else
          begin
            LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE ���̺� :' + stCompanyCode + '/' + stEmCode + '/' + stCardNo + ' �μ�Ʈ ����');
            inc(nErrCount);
          end;
      end;
      Next;
    end;
  end;
  if nErrCount > 0 then
  begin
    btn_Error.Enabled := True;
    showmessage(inttostr(nErrCount) + ' �ǿ��� �Է� ������ �߻��߽��ϴ�.');
  end;
  result := True;
  //��ü������ �о �μ�Ʈ ��
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
    StatusBar1.Panels[0].Text := inttostr(recordCount) + ' �� ��ȸ �Ϸ�';
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
  //��ü������ �о
  //���� ���̺� �ִ��� üũ �� ī���ȣ üũ
  //������ �������� ������Ʈ
  //ī���ȣ ����Ǿ����� ���� ī���ȣ ���ѻ���
  //ī�����̺� ����ī���ȣ ����
  //����ī���ȣ �����ϴ��� üũ
  //�����ϸ� ����� �� �����ͷ� ����
  //�������� ������ ����
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
        //stCardNo1 := stCardNo; //ó�� ī��� ������ �й����� �����Ѵ�.
        stCardNo1 := FillCharString(stCardNo,L_nFixedChar[1],L_nFixedLen - 1,False); //ó�� ī���ȣ�� ������ ���� �ؾ� ��
        if Trim(FindField('CARDNO2').AsString) <> '' then
          stCardNo1 := stCardNo1 + Trim(FindField('CARDNO2').AsString);
        if Trim(FindField('CARDNO3').AsString) <> '' then
          stCardNo2 := stCardNo + Trim(FindField('CARDNO2').AsString) + Trim(FindField('CARDNO3').AsString);
      end;
      if L_nCardGubunUse = 1 then //ī�� �����ڵ� ����
      begin
        //������� �ʱ�� ��
        //if stCardNo1 <> '' then stCardNo1 := '01' + stCardNo1;
        //if stCardNo2 <> '' then stCardNo2 := '02' + stCardNo2;
      end;
      if L_nFixedUse = 1 then //�������� ����
      begin
        if stCardNo1 <> '' then stCardNo1 := FillCharString(stCardNo1,L_nFixedChar[1],L_nFixedLen,False);
        if stCardNo2 <> '' then stCardNo2 := FillCharString(stCardNo2,L_nFixedChar[1],L_nFixedLen,False);
      end;
      if Trim(L_stDeleteCode) <> '' then     //�κ� �Է¿��� ���� �����ʹ� ���ѻ��� �� ī�����̺� ��������.
      begin
        if Trim(FindField('EM_STATE').AsString) = Trim(L_stDeleteCode) then
        begin
          if stCardNo1 <> '' then  //�Ϲ�ī�� ����
          begin
            UpdateTB_DEVICECARDNOCardDelete(stCardNo1); //�ش� ī���� ������ ��������
            DeleteTB_CARDCardNo(stCardNo1); //�ش� ī�带 ��������
          end;
          if stCardNo2 <> '' then //�����ī�� ����
          begin
            UpdateTB_DEVICECARDNOCardDelete(stCardNo2); //�ش� ī���� ������ ��������
            DeleteTB_CARDCardNo(stCardNo2); //�ش� ī�带 ��������
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
      if Not CheckTB_Employee(stCompanyCode,stEmCode) then //������̺� �ִ��� üũ
      begin
        //�ű� ȸ���̸�
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
        if bResult then //�μ�Ʈ �����̸�
        begin
          if stCardNo1 <> '' then
          begin
            if Not CheckTB_CARDCARDNO(stCardNo1) then //�Ϲ�ī���ȣ�� �ִ��� üũ
              InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
            else
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': ī���ȣ �ߺ�');
              inc(nErrCount);
            end;
          end;
          if stCardNo2 <> '' then
          begin
            if Not CheckTB_CARDCARDNO(stCardNo2) then //�Ϲ�ī���ȣ�� �ִ��� üũ
              InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
            else
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': ī���ȣ �ߺ�');
              inc(nErrCount);
            end;
          end;
        end else
        begin
          LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE ���̺� :' + stCompanyCode + '/' + stEmCode + ' �μ�Ʈ ����');
          inc(nErrCount);
        end;
      end else
      begin
        //����� ȸ���̸�
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
          if DUPCARDTYPE = 1 then // 2�� �̻� ī�� ����.
          begin
            if L_nCardGubunUse = 1 then //ī�� �����ڵ� ����
            begin
              if stCardNo1 <> '' then
              begin
                if Not CheckTB_CARDGubunEmpNo(stCompanyCode,stEmCode,'1',stOldCardNo) then //�Ϲ�ī���ȣ�� �ִ��� üũ
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': ���� �Ϲ� ī�� ����');
                  if Not CheckTB_CARDCARDNO(stCardNo1) then //ī���ȣ�� �ִ��� üũ
                    InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                  else
                  begin
                    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': �Ϲ�ī���ȣ �ߺ�');
                    inc(nErrCount);
                  end;
                end else
                begin
                  if Trim(stOldCardNo) <> Trim(stCardNo1) then  //���ο� ī�尡 �ٸ����
                  begin
                    UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //�ش� ī���� ������ ��������
                    DeleteTB_CARDCardNo(stOldCardNo); //�ش� ī�带 ��������
                    if Not CheckTB_CARDCARDNO(stCardNo1) then //ī���ȣ�� �ִ��� üũ
                      InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                    else
                    begin
                      LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': �Ϲ�ī���ȣ �ߺ�');
                      inc(nErrCount);
                    end;
                  end; //������ �׳� ����.
                end;
              end;
              if stCardNo2 <> '' then
              begin
                if Not CheckTB_CARDGubunEmpNo(stCompanyCode,stEmCode,'2',stOldCardNo) then //�����ī���ȣ�� �ִ��� üũ
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': ���� ����� ī�� ����');
                  if Not CheckTB_CARDCARDNO(stCardNo2) then //ī���ȣ�� �ִ��� üũ
                    InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                  else
                  begin
                    LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': �����ī���ȣ �ߺ�');
                    inc(nErrCount);
                  end;
                end else
                begin
                  if Trim(stOldCardNo) <> Trim(stCardNo2) then  //���ο� ī�尡 �ٸ����
                  begin
                    UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //�ش� ī���� ������ ��������
                    DeleteTB_CARDCardNo(stOldCardNo); //�ش� ī�带 ��������
                    if Not CheckTB_CARDCARDNO(stCardNo2) then //ī���ȣ�� �ִ��� üũ
                      InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                    else
                    begin
                      LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo2 + ': �����ī���ȣ �ߺ�');
                      inc(nErrCount);
                    end;
                  end; //������ �׳� ����.
                end;
              end;
            end else  //ī�屸�� �̻���ϸ鼭 2���̻� ����ϴ°��
            begin
              if stCardNo1 <> '' then
              begin
                if Not CheckTB_CARDCARDNO(stCardNo1) then //ī���ȣ�� �ִ��� üũ
                  InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                else
                begin
                  UpdateTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode);
                end;
              end;
              if stCardNo2 <> '' then
              begin
                if Not CheckTB_CARDCARDNO(stCardNo2) then //ī���ȣ�� �ִ��� üũ
                  InsertTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode)
                else
                begin
                  UpdateTB_CARD(stCardNo2,'2','1',stEmCode,stCompanyCode);
                end;
              end;
            end;
          end else  //1�δ� ī���ȣ �ϳ��� ����Ѵٰ� �Ҷ�...
          begin
            if Not CheckTB_CARDEmpNo(stCompanyCode,stEmCode,stOldCardNo) then //ī���ȣ�� �ִ��� üũ
            begin
              LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + ': ����ī�� ����');
              if Not CheckTB_CARDCARDNO(stCardNo1) then //ī���ȣ�� �ִ��� üũ
                InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
              else
              begin
                LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': ī���ȣ �ߺ�');
                inc(nErrCount);
              end;
            end else  //���� ī�尡 ����
            begin
              if Trim(stOldCardNo) <> Trim(stCardNo1) then  //���ο� ī�尡 �ٸ����
              begin
                UpdateTB_DEVICECARDNOCardDelete(stOldCardNo); //�ش� ī���� ������ ��������
                DeleteTB_CARDCardNo(stOldCardNo); //�ش� ī�带 ��������
                if Not CheckTB_CARDCARDNO(stCardNo1) then //ī���ȣ�� �ִ��� üũ
                  InsertTB_CARD(stCardNo1,'1','1',stEmCode,stCompanyCode)
                else
                begin
                  LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log',stCompanyCode + '/' + stEmCode + '/' + stCardNo1 + ': ī���ȣ �ߺ�');
                  inc(nErrCount);
                end;
              end;
            end;
          end;
        end else //������Ʈ �����Ѱ��
        begin
          LogSave(ExeFolder + '\..\log\Relay' + FormatDateTime('yyyymmdd',now) + '.log','TB_EMPLOYEE ���̺� :' + stCompanyCode + '/' + stEmCode + ' ������Ʈ ����');
          inc(nErrCount);
        end;
      end; //������̺� üũ�Ͽ� �ִ� ���,���°��

      Next;
    end;
  end;
  if nErrCount > 0 then
  begin
    showmessage(inttostr(nErrCount) + ' �ǿ��� �Է� ������ �߻��߽��ϴ�.');
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
    cells[3,0] := 'ī���ȣ';
    cells[4,0] := FM011;
    cells[5,0] := FM021;
    cells[6,0] := FM031;
    cells[7,0] := FM103;
    cells[8,0] := '����ȭ��ȣ';
    cells[9,0] := FM107;
    cells[10,0] := '�����ȣ';
    cells[11,0] := FM108;
    cells[12,0] := FM109;
    cells[13,0] := FM104;
    cells[14,0] := FM105;
    cells[15,0] := '������ġ';
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
