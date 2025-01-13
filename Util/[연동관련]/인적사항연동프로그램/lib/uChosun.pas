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
  //aStatus : 0:재학(재직),1:휴학(휴직),2:졸업(퇴직),3:제적,4:수료
  //aCardType : 0 : 모바일,1:rf카드

  bCardGroupGrade := False;

  result := False;
  aCardRegCnt := Trim(aCardRegCnt);
  if not isdigit(aCardRegCnt) then exit;
  
  aEmName := StringReplace(aEmName,'''','',[rfReplaceAll]);
  aCardType := Trim(aCardType);
  stCardGubun := aCardType;
  if(aCardType='0') then stCardGubun :='2'; //2: 모바일로 변경
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

  stCardState := '1'; //정상
  stRgCode := '001';  //재직
  if (Trim(aStatus) = '2') or (Trim(aStatus) = '3') or (Trim(aStatus) = '4') then   //졸업,제적,수료인 경우
  begin
    stCardState := '3';
    stRgCode := '003';  //퇴직
  end
  else if (Trim(aStatus) = '1') then  //휴학(휴직)
  begin
    stRgCode := '002'; //휴직
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
                    '', //퇴사일
                    '', //우편번호
                    '', //주소1
                    '', //주소2
                    '', //집전화번호
                    '', //핸드폰
                    stCardState, //
                    stCardNo,
                    '',
                    inttostr(nFdmsID),
                    stRgCode,
                    '') then Exit;
    dmDBFunction.InsertIntoTB_EMPHIS('001',aEmCode,inttostr(nFdmsID),
                      '2',stCardNo,stCardState,aEmName,
                      '','조선대학교','',aDepartName,'');
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
                        '','조선대학교','',aDepartName,'');
  end;

  result := True;
  if(stCardNo='') then Exit; ///카드 번호가 없는 경우 빠져 나가자.

  //학번에 다른 카드가 있으면 기존 카드 정지 후
  //nResult := dmDBFunction.CheckTB_CARD_Employee('001',aEmCode,stCardNo,stOldCardNo);
  nResult := dmDBFunction.CheckTB_CARD_EmployeeGubun(stCompanyCode,aEmCode,stCardNo,stCardGubun,stOldCardNo); //같은 타입의 카드가 있는지 확인하자.
  if nResult=1 then
  begin
    //같은 사번으로 다른 카드가 있는 경우
    //기존카드 권한을 똑같이 옮김
    dmDBFunction.UpdateTB_CARD_Change(stOldCardNo,stCardNo);
  end else if nResult = -1 then
  begin
    //같은 타입이 없다면 전체 카드를 확인한다.
    nResult := dmDBFunction.CheckTB_CARD_Employee(stCompanyCode,aEmCode,stCardNo,stOldCardNo);
    if nResult = 1 then
    begin
      //같은 사번으로 다른 카드가 있는 경우
      //기존카드 권한을 똑같이 옮김,기존 카드 삭제는 하지 않는다.
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
    bCardGroupGrade := True; //카드를 새로 추가하는 경우
  end;

  if (stCardState <> '1') then  //비정상
  begin
    dmDBFunction.UpdateTB_DEVICECARDNO_permit(stCardNo,'N');
  end else
  begin
    ///신규 카드 여기서 권한 적용하자.
    if (bCardGroupGrade) then
    begin
      nIndex := MappingCode1List.IndexOf(stCompanyCode + stPosiCode + stJijumCode);
      stGradeGroupCode := '';
      if nIndex > -1 then
      begin
        stGradeGroupCode := MappingCode2List.Strings[nIndex];
      end;
      if stGradeGroupCode <> '' then  //여기서 그룹 권한 복사 하자...
      begin
        dmDBFunction.UpdateTB_DEVICECARDNOExist(stCardNO,stGradeGroupCode);   //존재하는 권한 업데이트
        dmDBFunction.InsertIntoTB_DEVICECARDNONotExist(stCardNO,stGradeGroupCode);  //없는 권한 추가
        dmDBFunction.UpdateTB_CARDDOORGRADE(stCardNo,'Y');  //권한 부여됨 체크
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
  stSql := 'select FORMAT(getDate() - 0.0001,''yyyyMMddHHmmssfff'') as curTime '; //mssql 테스트용
  //stSql := 'SELECT TO_CHAR(SYSDATE - INTERVAL ''10'' SECOND, ''YYYYMMDDHH24MISS'') || TO_CHAR(SYSTIMESTAMP, ''FF3'') AS curTime FROM dual';  //오라클의 10초전 시간 가져오기
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
      stSql := stSql + ' AND HUB_UPDT <= ''' + stCurrentTime + ''' ' ; //현재 시간 보다 1분전
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
        fmMain.StatusBar1.Panels[2].Text := '연동현황 : ' + inttostr(nCur) +'/' + inttostr(nTot);
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
  //새로 변경된 OS에서는 복사해 올 필요가 없다.
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
