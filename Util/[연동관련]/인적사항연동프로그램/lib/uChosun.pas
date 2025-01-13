unit uChosun;

interface

uses
  SysUtils, Classes,ADODB,ActiveX,Forms;

type
  TdmChosun = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
    Function InitPosiCode:Boolean;
    Function GetChosunRelay:Boolean;
    Function ChosunRelay(aTime:string;var aDebug:string):Boolean;
    Function CHOSUNConversionEmployee(aJijumName,aDepartName,aPosiName,aStatus,aEmCode,aEmName,aCardType,aCardNo,aCardRegCnt:string):Boolean;
    Function PosiJijumTableCreate:Boolean;
  end;

var
  dmChosun: TdmChosun;

implementation
uses
  udmAdoRelay,
  uMain, uDBFunction,
  uLomosUtil,
  uCommonVariable,
  uCommon, uDBModule;

{$R *.dfm}

{ TDataModule1 }

function TdmChosun.CHOSUNConversionEmployee(aJijumName, aDepartName,
  aPosiName, aStatus, aEmCode, aEmName, aCardType, aCardNo,
  aCardRegCnt: string): Boolean;
var
  stCompanyCode : string;
  stJijumCode : string;
  stDepartCode : string;
  stPosiCode : string;
  stCardState : string;
  stCardNo : string;
  nFdmsID : integer;
  stOldCardNo : string;
  stOldCardState : string;
  bCardGroupGrade : Boolean;
  stWorkCode,stEndDate : string;
  nIndex : integer;
  nResult : integer;
  stGradeGroupCode : string;
  stPosiGubun : string;
  stCardGubun : string;
  stRgCode : string;
begin
  //aStatus : 0:����(����),1:����(����),2:����(����),3:����,4:����
  //aCardType : 0 : �����,1:rfī��

  bCardGroupGrade := False;

  result := False;
  aCardRegCnt := Trim(aCardRegCnt);
  if not isdigit(aCardRegCnt) then exit;
  
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  aCardType := Trim(aCardType);
  stCardGubun := aCardType;
  if(aCardType='0') then stCardGubun :='2'; //2: ����Ϸ� ����
  if(stCardGubun='1') then
    stCardNo := FillCharString(aEmCode,'N',14,False) + FillZeroStrNum(Trim(aCardRegCnt),2);
  stCompanyCode := '001';
  stJijumCode := dmCommon.GetJijumCode(stCompanyCode,aJijumName);
  if stJijumCode = '000' then
  begin
    if Trim(aJijumName) <> '' then
      dmCommon.CreateJijumCode(stCompanyCode,aJijumName,stJijumCode);
  end;
  stDepartCode := dmCommon.GetDepartCode(stCompanyCode,stJijumCode,aDepartName);
  if stDepartCode = '000' then
  begin
    if Trim(aDepartName) <> '' then
      dmCommon.CreateDepartCode(stCompanyCode,stJijumCode,aDepartName,stDepartCode);
  end;

  stPosiCode := dmCommon.GetPosiCode(stCompanyCode,aPosiName);
  if stPosiCode = '000' then
  begin
    if Trim(aPosiName) <> '' then
      dmCommon.CreatePosiCode(stCompanyCode,aPosiName,stPosiCode);
  end;

  if dmDBFunction.CheckTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode)=1 then
  begin
    dmDBFunction.UpdateTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode, Trim(aPosiName) + '_' + Trim(aJijumName));
  end else
  begin
    dmDBFunction.InsertIntoTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode, Trim(aPosiName) + '_' + Trim(aJijumName));
  end;

  stCardState := '1'; //����
  stRgCode := '001';  //����
  if (Trim(aStatus) = '2') or (Trim(aStatus) = '3') or (Trim(aStatus) = '4') then   //����,����,������ ���
  begin
    stCardState := '3';
    stRgCode := '003';  //����
  end
  else if (Trim(aStatus) = '1') then  //����(����)
  begin
    stRgCode := '002'; //����
  end;

  if dmDBFunction.CheckTB_EMPLOYEE(stCompanyCode,aEmCode,nFdmsID,stWorkCode,stEndDate) then
  begin
    if Not dmDBFunction.UpdateTB_EMPLOYEE(aEmCode,
                    aEmName,
                    stCompanyCode,
                    stJijumCode,
                    stDepartCode,
                    stPosiCode,
                    '',  //CompanyPhone
                    FormatDateTime('yyyymmdd',now),
                    '', //�����
                    '', //�����ȣ
                    '', //�ּ�1
                    '', //�ּ�2
                    '', //����ȭ��ȣ
                    '', //�ڵ���
                    stCardState, //
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','�������б�','',aDepartName,'');
  end else
  begin
    nFdmsID := strtoint(dmCommon.GetFdmsID);
    if Not dmDBFunction.InsertIntoTB_EMPLOYEE(aEmCode,
                      aEmName,
                      '001',
                      stJijumCode,
                      stDepartCode,
                      stPosiCode,
                      '',
                      FormatDateTime('yyyymmdd',now),
                      '99991231',
                      '',
                      '',
                      '',
                      '',
                      '',
                      stCardState,
                      stCardNo,
                      '',
                      inttostr(nFdmsID),
                      stRgCode,
                      '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                        '1',stCardNo,stCardState,aEmName,
                        '','�������б�','',aDepartName,'');
  end;

  result := True;
  if(stCardNo='') then Exit; ///ī�� ��ȣ�� ���� ��� ���� ������.

  //�й��� �ٸ� ī�尡 ������ ���� ī�� ���� ��
  //nResult := dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo);
  nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,aEmCode,stCardNo,stCardGubun,stOldCardNo); //���� Ÿ���� ī�尡 �ִ��� Ȯ������.
  if nResult=1 then
  begin
    //���� ������� �ٸ� ī�尡 �ִ� ���
    //����ī�� ������ �Ȱ��� �ű�
    dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
  end else if nResult = -1 then
  begin
    //���� Ÿ���� ���ٸ� ��ü ī�带 Ȯ���Ѵ�.
    nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCardNo);
    if nResult = 1 then
    begin
      //���� ������� �ٸ� ī�尡 �ִ� ���
      //����ī�� ������ �Ȱ��� �ű�,���� ī�� ������ ���� �ʴ´�.
      dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo,False);
    end;
  end;

  if dmDBFunction.CheckTB_CARD_CardNo(stCardNo,stOldCardState) = 1 then
  begin
    if stCardState <> stOldCardState then bCardGroupGrade := True;
    if Not dmDBFunction.UpdateTB_CARD(stCardNo,stCardGubun,stCardState,aEmCode,stCompanyCode) then Exit;
  end else
  begin
    if Not dmDBFunction.InsertIntoTB_CARD_Value(stCardNo,stCardGubun,stCardState,aEmCode,stCompanyCode) then Exit;
    bCardGroupGrade := True; //ī�带 ���� �߰��ϴ� ���
  end;

  if (stCardState <> '1') then  //������
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end else
  begin
    ///�ű� ī�� ���⼭ ���� ��������.
    if (bCardGroupGrade) then
    begin
      nIndex := MappingCode1List.IndexOf(stCompanyCode + stPosiCode + stJijumCode);
      stGradeGroupCode := '';
      if nIndex > -1 then
      begin
        stGradeGroupCode := MappingCode2List.Strings[nIndex];
      end;
      if stGradeGroupCode <> '' then  //���⼭ �׷� ���� ���� ����...
      begin
        dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);   //�����ϴ� ���� ������Ʈ
        dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);  //���� ���� �߰�
        dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');  //���� �ο��� üũ
      end;
    end;
  end;

  result := True;
end;

function TdmChosun.ChosunRelay(aTime: string;var aDebug:string): Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  TempAdoQuery :TADOQuery;
  nTot,nCur : integer;
begin
  result := False;
  if Not dmAdoRelay.DBConnected then Exit;
  stSql := 'select FORMAT(getDate() - 0.0001,''yyyyMMddHHmmssfff'') as curTime '; //mssql �׽�Ʈ��
  //stSql := 'SELECT TO_CHAR(SYSDATE - INTERVAL ''10'' SECOND, ''YYYYMMDDHH24MISS'') || TO_CHAR(SYSTIMESTAMP, ''FF3'') AS curTime FROM dual';  //����Ŭ�� 10���� �ð� ��������
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        dmAdoRelay.DBConnected := False;
        Exit;
      End;
      Try
        if Not Findfield('curTime').IsNull then
        begin
          stCurrentTime := Findfield('curTime').AsString;
          //stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
          //                 + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
        end else
        begin
          stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
          //stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
          //                  + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
        end;
      Except
          LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','CurTimeChangeError');
          stCurrentTime := formatDateTime('yyyymmddhhnnsszzz',Now );
          //stCurrentTime := copy(stCurrentTime,1,4) + '-' + copy(stCurrentTime,5,2) + '-' + copy(stCurrentTime,7,2)
          //                  + ' ' + copy(stCurrentTime,9,2) + ':' + copy(stCurrentTime,11,2) + ':' + copy(stCurrentTime,13,2) + '.' + copy(stCurrentTime,15,3);
      End;
    end;

    stSql := ' Select HUB_UNNM,HUB_PSNM,HUB_PONM,HUB_SDCO,HUB_IDNO,HUB_NAME,HUB_CARDTYPE,HUB_CARDNO,HUB_ISFG,HUB_UPDT ';
    stSql := stSql + ' from MFC_HUB ';
    stSql := stSql + ' Where HUB_ISFG is not null ' ;
    stSql := stSql + ' AND HUB_UPDT is not null ';
    //stSql := stSql + ' AND ROWNUM <= 10 ';
    if aTime <> '' then
    begin
      stSql := stSql + ' AND HUB_UPDT > ''' + aTime + ''' ' ;
      stSql := stSql + ' AND HUB_UPDT <= ''' + stCurrentTime + ''' ' ; //���� �ð� ���� 1����
    end;
    stSql := stSql + ' order by HUB_UPDT,HUB_ISFG ';
    aDebug := stSql;

    fmMain.Memo1.Text := stSql;
    //Exit;
  
    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := True;
      if recordCount < 1 then Exit;
      nTot := recordCount;
      nCur :=0;
      while Not Eof do
      begin
        if CHOSUNConversionEmployee(FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                                 FindField('HUB_PONM').AsString,FindField('HUB_SDCO').AsString,
                                 FindField('HUB_IDNO').AsString,FindField('HUB_NAME').AsString,
                                 FindField('HUB_CARDTYPE').AsString,FindField('HUB_CARDNO').AsString,
                                 FindField('HUB_ISFG').AsString) then
        begin
          if Not FindField('HUB_UPDT').IsNull then
          begin
            Try
              fmMain.L_stLastRelayTime := FindField('HUB_UPDT').AsString;//formatDateTime('yyyymmddhhnnsszzz',FindField('HUB_UPDT').AsDateTime);
              dmDBFunction.UpdateTB_CONFIG('EMPCONV','LASTTIME',fmMain.L_stLastRelayTime);
            Except
              LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','LastRelayTimeChangeError');
            End;
          end;
          fmMain.CHOSUNEventState(FindField('HUB_IDNO').AsString,FindField('HUB_NAME').AsString,
                                 FindField('HUB_PONM').AsString,FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                                 FindField('HUB_SDCO').AsString, '', '', FindField('HUB_ISFG').AsString,
                                 'sucess');
        end else
        begin
          fmMain.CHOSUNEventState(FindField('HUB_IDNO').AsString,FindField('HUB_NAME').AsString,
                                 FindField('HUB_PONM').AsString,FindField('HUB_UNNM').AsString,FindField('HUB_PSNM').AsString,
                                 FindField('HUB_SDCO').AsString, '', '', FindField('HUB_ISFG').AsString,
                                 'fail');
        end;
        inc(nCur);
        fmMain.StatusBar1.Panels[2].Text := '������Ȳ : ' + inttostr(nCur) +'/' + inttostr(nTot);
        Application.ProcessMessages;
        Next;
      end;
      LogSave(G_stExeFolder + '\..\log\Program' + FormatDateTime('yyyymmdd',now) +'.log','EmConversion ');
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmChosun.GetChosunRelay: Boolean;
begin
  //���� ����� OS������ ������ �� �ʿ䰡 ����.
end;

function TdmChosun.InitPosiCode: Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  TempAdoQuery :TADOQuery;
  stPosiCode : string;
  stCompanyCode : string;
begin
  result := False;
  stCompanyCode :='001';
  if Not dmAdoRelay.DBConnected then
  begin
    fmMain.RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    fmMain.StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    fmMain.AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := ' Select HUB_UNNM,HUB_PSNM,HUB_PONM ';
    stSql := stSql + ' from MFC_HUB ';
    stSql := stSql + ' WHERE hub_updt IS NOT NULL ';
    stSql := stSql + ' group by HUB_UNNM,HUB_PSNM,HUB_PONM ';

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := True;
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        stPosiCode := dmCommon.GetPosiCode(stCompanyCode,FindField('HUB_PONM').AsString);
        if stPosiCode = '000' then
        begin
          if Trim(FindField('HUB_PONM').AsString) <> '' then
            dmCommon.CreatePosiCode(stCompanyCode,FindField('HUB_PONM').AsString,stPosiCode);
        end;
        Application.ProcessMessages;
        Next;
      End;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmChosun.PosiJijumTableCreate: Boolean;
var
  stSql : string;
  nFdmsID : integer;
  stDate : string;
  stCurrentTime : string;
  TempAdoQuery :TADOQuery;
  stPosiCode : string;
  stCompanyCode : string;
  stJijumCode : string;
begin
  result := False;
  stCompanyCode :='001';
  if Not dmAdoRelay.DBConnected then
  begin
    fmMain.RelayAdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  if Not dmDBModule.DBConnected then
  begin
    fmMain.StatusBar1.Panels[2].Text := 'Not dmDBModule.DBConnected ';
    fmMain.AdoConnectCheckTimer.Enabled := True;
    Exit;
  end;
  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := dmAdoRelay.ADOConnection;
    TempAdoQuery.DisableControls;

    stSql := ' Select HUB_UNNM,HUB_PONM ';
    stSql := stSql + ' from MFC_HUB ';
    stSql := stSql + ' WHERE hub_updt IS NOT NULL ';
    stSql := stSql + ' group by HUB_UNNM,HUB_PONM ';

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      result := True;
      if recordCount < 1 then Exit;
      while Not Eof do
      begin
        stPosiCode := dmCommon.GetPosiCode(stCompanyCode,Trim(FindField('HUB_PONM').AsString));
        if stPosiCode = '000' then
        begin
          if Trim(FindField('HUB_PONM').AsString) <> '' then
            dmCommon.CreatePosiCode(stCompanyCode,Trim(FindField('HUB_PONM').AsString),stPosiCode);
        end;
        stJijumCode := dmCommon.GetJijumCode(stCompanyCode,Trim(FindField('HUB_UNNM').AsString ));
        if stJijumCode = '000' then
        begin
          if Trim(FindField('HUB_UNNM').AsString) <> '' then
            dmCommon.CreateJijumCode(stCompanyCode,Trim(FindField('HUB_UNNM').AsString),stJijumCode);
        end;

        if dmDBFunction.CheckTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode)=1 then
        begin
          dmDBFunction.UpdateTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode, Trim(FindField('HUB_PONM').AsString) + '_' + Trim(FindField('HUB_UNNM').AsString));
        end else
        begin
          dmDBFunction.InsertIntoTB_POSIJIJUMMapping(stCompanyCode + stPosiCode + stJijumCode, Trim(FindField('HUB_PONM').AsString) + '_' + Trim(FindField('HUB_UNNM').AsString));
        end;

        Application.ProcessMessages;
        Next;
      End;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.
