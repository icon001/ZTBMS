unit uMonitoringDataProcess;

interface
  uses Forms,SysUtils,ActiveX,ADODB,Graphics;

  procedure DaemonReceiveDataProcess(aData:string;Sender:Tobject);
  procedure DeviceAllFireRecovery;
  procedure NODEDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  procedure ECUDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  procedure AlarmDataProcess(aNodeNo,aEcuID,aArmAreaNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  procedure DeviceAllStateCheckReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
  procedure DeviceStateCheckIIIReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string;Sender:Tobject);
  procedure MonitorAlarmRefresh;

  procedure DaemonRestart;
  procedure DaemonLive;
implementation

uses
  uLomosUtil,
  uMonitoringCommonVariable,
  uDeviceState,
  uDataModule1,
  UCommonModule,
  uMDBSql,
  uPostGreSql,
  uMssql,
  uFireBird,
  udmServerToMonitor;
  
procedure DaemonReceiveDataProcess(aData:string;Sender:Tobject);
var
  stReceiveType : string; //'N'(노드),'E'(기기),'D'(도어),'A'(알람),'S'(데몬제어-재시작등)
  stNodeNo : string;
  stEcuID : string;
  stDoorNo : string;
  stReaderNo : string;
  stDataType : string;    // 'CR'(카드리더등록),'PT'(방범데이터),'AC'(출입데이터),'AT'(근태데이터),'SV'(데몬서버데이터),'DV'(기기데이터)
  stControlType: string;  //'C'(카드데이터 또는 'DV' 인경우 CONNECT 상태),'R'(원격제어),'S'(상태-출입문,알람),'F'(FTP다운로드 상태)
  stDataLength : string;
  stDeviceData : string;
begin
  if aData[1] <> 'R' then Exit; //정상 수신 데이터가 아니다.
  stReceiveType := aData[2];
  stNodeNo := copy(aData,3,3);
  stEcuID := copy(aData,6,2);
  stDoorNo := copy(aData,8,2);
  if Not IsDigit(stDoorNo) then stDoorNo := '0';
  stDoorNo := inttostr(strtoint(stDoorNo));
  stReaderNo := copy(aData,10,2);
  if Not IsDigit(stReaderNo) then stReaderNo := '0';
  stReaderNo := inttostr(strtoint(stReaderNo));
  
  stDataType := copy(aData,12,2);
  stControlType := aData[14];
  stDataLength := copy(aData,15,3);
  if Not IsDigit(stDataLength) then Exit;
  stDeviceData := copy(aData,18,strtoint(stDataLength));

  if Pos('FIRERECOVERY',stDeviceData) > 0 then
  begin
    DeviceAllFireRecovery;
    Exit;
  end;

  if stReceiveType = '' then Exit;
  case stReceiveType[1] of
    'S' : begin
            if Pos('RESTART',UpperCase(stDeviceData)) > 0  then
            begin
              DaemonRestart;
            end else if Pos('ALARMREFRESH',UpperCase(stDeviceData)) > 0  then
            begin
              MonitorAlarmRefresh;  
            end else if stControlType = 'S' then
            begin
              DeviceAllStateCheckReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);  
            end else if stControlType = 'N' then
            begin
              DeviceStateCheckIIIReceive(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData,Sender);
            end else if stDataType = 'BR' then
            begin
              if stDeviceData = 'DAEMONLIVE' then DaemonLive;
            end;
          end;
    'N' : begin
            NODEDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);  
          end;
    'E' : begin
            ECUDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);   
          end;
    'D' : begin
            DoorDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);  
          end;
    'A' : begin
            AlarmDataProcess(stNodeNo,stEcuID,stDoorNo,stReaderNo,stDataType,stControlType,stDeviceData);  
          end;
    else begin
          end;
  end;

end;

procedure DeviceAllFireRecovery;
var
  i : integer;
begin
  if DaemonState <> nil then
    DaemonState.FireRecovery;
    
  if DoorStateList = nil then Exit;

  for i:= 0 to DoorStateList.Count - 1 do
  begin
    if Assigned(DoorStateList.Objects[i]) then
    begin
      TDoorState(DoorStateList.Objects[i]).DoorFire := False;
    end;
  end;
end;

procedure NODEDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
var
  stDeviceID : string;
  stNodeNo : string;
  nIndex : integer;
  nNodeIndex : integer;
  i : integer;
  stEcuID : string; //해당 노드의 확장기 리스트
begin
  stNodeNo := FillZeroNumber(strtoint(aNodeNo),3);
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  nNodeIndex := NodeList.IndexOf(stNodeNo);
  if nNodeIndex < 0 then Exit;
  
  if DeviceStateList = nil then Exit;

  if aDataType = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aDeviceData)) > 0 then
    begin
      TNodeState(NodeList.Objects[nNodeIndex]).NodeConnected := False;
      for i := 0 to TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.Count - 1 do
      begin
        stEcuID := TNodeState(NodeList.Objects[nNodeIndex]).NodeDeviceList.Strings[i];
        nIndex := DeviceStateList.IndexOf(stEcuID);
        if nIndex > -1 then
        begin
          TDeviceState(DeviceStateList.Objects[nIndex]).Connected := False;
        end;
      end;
    end else if Pos('CONNECTED',UpperCase(aDeviceData)) > 0 then
    begin
      TNodeState(NodeList.Objects[nNodeIndex]).NodeConnected := True;
      nIndex := DeviceStateList.IndexOf(stDeviceID);
      if nIndex > -1 then
      begin
        TDeviceState(DeviceStateList.Objects[nIndex]).Connected := True;
      end;
    end;
  end;

end;

procedure ECUDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
var
  stDeviceID : string;
  nIndex : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if DeviceStateList = nil then Exit;

  if aDataType = 'DV' then
  begin
    if Pos('DISCONNECTED',UpperCase(aDeviceData)) > 0 then
    begin
      nIndex := DeviceStateList.IndexOf(stDeviceID);
      if nIndex > -1 then
      begin
        TDeviceState(DeviceStateList.Objects[nIndex]).Connected := False;
      end;
    end else if Pos('CONNECTED',UpperCase(aDeviceData)) > 0 then
    begin
      nIndex := DeviceStateList.IndexOf(stDeviceID);
      if nIndex > -1 then
      begin
        TDeviceState(DeviceStateList.Objects[nIndex]).Connected := True;
      end;
    end;
  end else if aDataType = 'AC' then //출입 데이터
  begin
    nIndex := DeviceStateList.IndexOf(stDeviceID);
    if nIndex > -1 then
    begin
      TDeviceState(DeviceStateList.Objects[nIndex]).LastAccessData := aDeviceData;
    end;
  end else if aDataType = 'ST' then //SetupData
  begin
    nIndex := DeviceStateList.IndexOf(stDeviceID);
    if nIndex > -1 then
    begin
      TDeviceState(DeviceStateList.Objects[nIndex]).DeviceSetupData := aDeviceData;
    end;

  end else if aDataType = 'AL' then //전체 데이터 --올라오지 않음
  begin
    //DEVICEDataProcess(aNodeNo,aECUID,aData);
  end;
end;

procedure DoorDataProcess(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
var
  nIndex : integer;
  stDoorID : string;
  nDoorNo : integer;
begin
  if Not isDigit(aDoorNo) then Exit;
  nDoorNo := strtoint(aDoorNo);

  stDoorID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID + inttostr(nDoorNo);

  if DoorStateList = nil then Exit;

  nIndex := DoorStateList.IndexOf(stDoorID);
  if nIndex < 0 then Exit;

  if aDataType = 'DV' then
  begin
    if aControlType = 'S' then
    begin
      case aDeviceData[1] of  //운영개방
        '0' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmManager;    //운영
              end;
        '1' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmOpen;   //개방
              end;
        '2' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmLock;   //폐쇄
              end;
        '3' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmMaster;   //마스터모드
              end;
        else begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorManageMode := dmNothing;   //모름
             end;
      end;
      case aDeviceData[2] of  //Posi Nega
        '0' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorCardMode := pnPositive;  //Posi
              end;
        '1' : begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorCardMode := pnNegative;  //Posi
              end;
        else  begin
                TDoorState(DoorStateList.Objects[nIndex]).DoorCardMode := pnNothing;  //Posi
              end;
      end;
      case aDeviceData[3] of  //DoorState
        'C': //닫힘
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsClose;
          end;
        'O': //열림
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsOpen;
          end;
        'E': //에러
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsNothing;
          end;
        'T','D'://장시간 열림
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsLongTime;
          end;
        'U':    //해정이상
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsOpenErr;
          end;
        'L':    //시정이상
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsCloseErr;
          end;
        else
          begin
            TDoorState(DoorStateList.Objects[nIndex]).DoorDSState := dsNothing;
          end;
      end;

    end else if aControlType = 'F' then
    begin
        if aDeviceData[1] = 'F' then
        begin
          TDoorState(DoorStateList.Objects[nIndex]).DoorFire := True;
        end else
        begin
          TDoorState(DoorStateList.Objects[nIndex]).DoorFire := False;
        end;
    end;
  end;
end;

procedure AlarmDataProcess(aNodeNo,aEcuID,aArmAreaNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
var
  stDeviceID : string;
  nIndex : integer;
  nArmAreaIndex : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;

  if DeviceStateList = nil then Exit;
  
  nIndex := DeviceStateList.IndexOf(stDeviceID);
  if nIndex < 0 then Exit;
  nArmAreaIndex := ArmAreaStateList.IndexOf(stDeviceID + aArmAreaNo);

  if aDataType = 'DV' then //기기정보
  begin
    if aControlType = 'S' then //상태정보
    begin
      case UpperCase(aDeviceData)[1] of
       'A': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmArm;
       end;
       'D': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmDisarm;
       end;
       'T': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmTest;
       end;
       'I': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmInit;
       end;
       'P': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmPatrol;
       end;
       'E': begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmJaejung;
       end;
      else
        begin
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := cmNothing;
        end;
      end;
    end;
  end else if aDataType = 'PT' then  //Alarm 발생 전체전문
  begin
    TDeviceState(DeviceStateList.Objects[nIndex]).LastAlarmData := aDeviceData;
  end else if aDataType = 'AL' then  //전체전문
  begin
    //- 사용안함
    //DeviceRcvAlarmData(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData);
  end;
end;

procedure MonitorAlarmRefresh;
var
  stSql : string;
  stDeviceID : string;
  nDeviceIndex : integer;
  stTime : string;
  bAlarmView,bAlarmSound : Boolean;
  nRecordCount : integer;
  TempAdoQuery :TADOQuery;
  nColor : integer;
begin
  G_bAlarmRefreshStart := True;
  if DaemonState <> nil then
    DaemonState.AlaramRefresh; //모니터 화면 AlarmList Clear;

  if DeviceStateList = nil then Exit;

  while G_bAlarmRefreshStart do
  begin
    delay(10);
    Application.ProcessMessages;
  end;

  //if DBType = 'MSSQL' then stSql := ' Select top 1000 '
  //else
  stSql := ' Select ';
  stSql := stSql + ' a.*,b.AL_COLOR from TB_ALARMEVENT a ';
  stSql := stSql + ' Left Join TB_ALARMSTATUSCODE b ';
  stSql := stSql + ' ON(a.AL_ALARMSTATUSCODE = b.AL_ALARMSTATUSCODE )  ';
//  stSql := stSql + ' OR a.AL_STATUSCODE2 = b.AL_ALARMSTATUSCODE )
  stSql := stSql + ' Where a.AL_CHECKOK = ''N'' ';
//  stSql := stSql + ' AND b.AL_ALARMVIEW = 1 ';    //침입신호가 조회 안되는 치명적인 단점 발생
//  stSql := stSql + ' AND b.AL_ALARMSOUND = 1 ';
  stSql := stSql + ' AND a.AL_ISALARM = 1 ';
  stSql := stSql + ' AND a.AL_SOUND = 1 ';
  stSql := stSql + ' AND a.AL_DATE > ''' + FormatDateTime('yyyymmdd',now - G_nAlarmRefreshDate) + ''' ';
  stSql := stSql + ' Order by a.AL_ALARMGRADE,a.AL_DATE,a.AL_TIME ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordCount < 1 then Exit;
      nRecordCount := recordCount;
      First;
      while Not Eof do
      begin
        stDeviceID := FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString ;
        nDeviceIndex := DeviceStateList.IndexOf(stDeviceID);
        if nDeviceIndex > -1 then
        begin
          stTime := FindField('AL_DATE').AsString + FindField('AL_TIME').AsString;
          bAlarmView := False;
          if Not FindField('AL_ISALARM').IsNull then
          begin
            if FindField('AL_ISALARM').AsString <> '0' then bAlarmView := True;
          end;
          bAlarmSound := False;
          if Not FindField('AL_SOUND').IsNull then
          begin
            if FindField('AL_SOUND').AsString <> '0' then bAlarmSound := True;
          end;
          if FindField('AL_COLOR').IsNull then nColor := clRed
          else nColor := FindField('AL_COLOR').AsInteger;
          TDeviceState(DeviceStateList.Objects[nDeviceIndex]).DBAlarmStateChange(
            FindField('AC_NODENO').AsInteger,
            FindField('AC_ECUID').AsString,
            'A',
            FindField('AL_MSGNO').AsString,
            stTime,
            FindField('AL_ALARMDEVICETYPECODE').AsString,
            FindField('AL_SUBADDR').AsString,
            FindField('AL_ZONECODE').AsString,
            FindField('AL_ALARMMODECODE').AsString,
            FindField('AL_ALARMSTATUSCODE').AsString,
            FindField('AL_ZONENO').AsString,
            FindField('AL_ZONESTATE').AsString,
            FindField('AL_OPERATOR').AsString,
            FindField('AL_STATUSCODE2').AsString,
            bAlarmView,
            bAlarmSound,
            inttostr(nColor)
            );
        end;

        next;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure DaemonRestart;
begin
  if DaemonState <> nil then
      DaemonState.Restart;
end;

procedure DaemonLive;
begin
  if DaemonState <> nil then
      DaemonState.Live;
end;

procedure DeviceAllStateCheckReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string);
var
  stDeviceID : string;
  stDoorID : string;
  nIndex : integer;
  nDoorIndex : integer;
begin
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + aEcuID;
  if aControlType <> 'S' then Exit;

  if DeviceStateList = nil then Exit;

  nIndex := DeviceStateList.IndexOf(stDeviceID);
  if nIndex > -1 then
  begin
    case aDeviceData[1] of  //DeviceConnected State
      'C' : begin TDeviceState(DeviceStateList.Objects[nIndex]).Connected := True end;
      'D' : begin TDeviceState(DeviceStateList.Objects[nIndex]).Connected := False end;
      else begin TDeviceState(DeviceStateList.Objects[nIndex]).Connected := False end;
    end;
    if TDeviceState(DeviceStateList.Objects[nIndex]).GetAlarmMode(0) = cmNothing then
    begin
      case aDeviceData[2] of //Device Watch Mode
        'N' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmNothing) end;
        'A' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmArm) end;
        'D' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmDisarm) end;
        'P' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmPatrol) end;
        'I' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmInit) end;
        'T' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmTest) end;
        'E' : begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmJaejung) end;
        else begin TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,cmNothing) end;
      end;
    end;
  end;

  stDoorID := stDeviceID + '1';
  nDoorIndex := DoorStateList.IndexOf(stDoorID);
  if nDoorIndex > -1 then
  begin
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmNothing then
    begin
      case aDeviceData[3] of //Door1 Manage Mode
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
        'M' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmManager end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmOpen end;
        'L' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmLock end;
        'S' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmMaster end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNothing then
    begin
      case aDeviceData[5] of //Door1 Card Mode
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNothing end;
        'P' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnPositive end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNegative end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsNothing then
    begin
      case aDeviceData[7] of //Door1 Open State
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsNothing end;
        'C' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsClose end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsOpen end;
        'L' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsLongTime end;
        'P' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsOpenErr end;
        'S' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsCloseErr end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState = lsNothing then
    begin
      case aDeviceData[9] of //Door1 Lock State
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsNothing end;
        'C' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsClose end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsOpen end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsNothing end;
      end;
    end;
    case aDeviceData[11] of //Door1 Fire State
      'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := False end;
      'F' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := True end;
      else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := False end;
    end;
  end;

  stDoorID := stDeviceID + '2';
  nDoorIndex := DoorStateList.IndexOf(stDoorID);
  if nDoorIndex > -1 then
  begin
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmNothing then
    begin
      case aDeviceData[4] of //Door2 Manage Mode
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
        'M' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmManager end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmOpen end;
        'L' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmLock end;
        'S' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmMaster end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := dmNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNothing then
    begin
      case aDeviceData[6] of //Door2 Card Mode
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNothing end;
        'P' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnPositive end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNegative end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := pnNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsNothing then
    begin
      case aDeviceData[8] of //Door2 Open State
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsNothing end;
        'C' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsClose end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsOpen end;
        'L' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsLongTime end;
        'P' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsOpenErr end;
        'S' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsCloseErr end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := dsNothing end;
      end;
    end;
    if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState = lsNothing then
    begin
      case aDeviceData[10] of //Door2 Lock State
        'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsNothing end;
        'C' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsClose end;
        'O' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsOpen end;
        else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := lsNothing end;
      end;
    end;
    case aDeviceData[12] of //Door1 Fire State
      'N' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := False end;
      'F' : begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := True end;
      else begin TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := False end;
    end;
  end;

end;

procedure DeviceStateCheckIIIReceive(aNodeNo,aEcuID,aDoorNo,aReaderNo,aDataType,aControlType,aDeviceData:string;Sender:Tobject);
var
  stDeviceID : string;
  nIndex : integer;
  nArmAreaIndex : integer;
  nDoorIndex : integer;
  lsLockState : TNodeLockState;
  i : integer;
  nPacketSize : integer;
  stEcuPacket : string;
  msDeviceState : TDeviceMonitorState;
begin
  if aControlType <> 'N' then Exit;

  if DeviceStateList = nil then Exit;

  Try
    lsLockState := TNodeLockState.Create(nil);
    if G_nMonitorSockType = 0 then
      nPacketSize := BINARYPACKETSIZE div 8      //ASCII 8비트가 한패킷
    else nPacketSize := BINARYPACKETSIZE div 4; //HEX 4비트가 한패킷
    for i := 0 to MAXECUCOUNT do
    begin
      stEcuPacket := copy(aDeviceData,(i * nPacketSize) + 1,nPacketSize);
      if G_nMonitorSockType = 0 then
        stEcuPacket := Ascii2Hex(stEcuPacket);  //ASCII 값으로 오면 HEX 로 변환
      stEcuPacket := HexToBinary(stEcuPacket);
      //TEST2015
      lsLockState.EcuStateAdd(FillZeroNumber(i,2),stEcuPacket);
      msDeviceState := lsLockState.GetEcuObject(i);
      stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + FillZeroNumber(i,2);
      nIndex := DeviceStateList.IndexOf(stDeviceID);
      if nIndex < 0 then continue;
      TDeviceState(DeviceStateList.Objects[nIndex]).Connected := msDeviceState.Connected;
      nArmAreaIndex := ArmAreaStateList.IndexOf(stDeviceID + '0');
      if G_nDaemonServerVersion < 8 then
      begin
        if TDeviceState(DeviceStateList.Objects[nIndex]).GetAlarmMode(0) = cmNothing then
        begin
          TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,msDeviceState.WatchMode);
          if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := msDeviceState.WatchMode;
        end;

        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '1');
        if nDoorIndex > -1 then
        begin
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := msDeviceState.DoorManageMode1;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := msDeviceState.DoorPNMode1;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := msDeviceState.DoorState1;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState = lsNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := msDeviceState.DoorLockMode1;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := msDeviceState.Door1Fire;
        end;
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '2');
        if nDoorIndex > -1 then
        begin
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode = dmNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := msDeviceState.DoorManageMode2;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode = pnNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := msDeviceState.DoorPNMode2;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState = dsNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := msDeviceState.DoorState2;
          if TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState = lsNothing then TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := msDeviceState.DoorLockMode2;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := msDeviceState.Door2Fire;
        end;
      end else
      begin
        TDeviceState(DeviceStateList.Objects[nIndex]).SetAlarmMode(0,msDeviceState.WatchMode);
        if nArmAreaIndex > -1 then TArmAreaState(ArmAreaStateList.Objects[nArmAreaIndex]).AlarmMode := msDeviceState.WatchMode;
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '1');
        if nDoorIndex > -1 then
        begin
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := msDeviceState.DoorManageMode1;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := msDeviceState.DoorPNMode1;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := msDeviceState.DoorState1;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := msDeviceState.DoorLockMode1;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := msDeviceState.Door1Fire;
        end;
        nDoorIndex := DoorStateList.IndexOf(stDeviceID + '2');
        if nDoorIndex > -1 then
        begin
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorManageMode := msDeviceState.DoorManageMode2;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorCardMode := msDeviceState.DoorPNMode2;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorDSState := msDeviceState.DoorState2;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorLockState := msDeviceState.DoorLockMode2;
          TDoorState(DoorStateList.Objects[nDoorIndex]).DoorFire := msDeviceState.Door2Fire;
        end;
      end;
    end;
  Finally
    lsLockState.Free;
  End;

end;
end.
