unit udmAdoQuery;

interface

uses
  SysUtils, Classes, DB, ADODB,ActiveX;

type
  TdmAdoQuery = class(TDataModule)
    ADOQuery1: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    function TB_LOWDATAInsert(NodeNO:integer;aIP,aPort,aECUID,aTxRx:string;aCommand:char;aReceiveData:string):Boolean;

    function TB_ATEVENTIntimeInsert(aDate,aCompanyCode,aEMCode,aAttendCode,aWeekCode,aTime,aAtInCode:string):Boolean;
    function TB_ATEVENTIntimeUpdate(aDate,aCompanyCode,aEMCode,aAttendCode,aWeekCode,aTime,aAtInCode:string):Boolean;
    function TB_ATEVENTOuttimeInsert(aDate,aCompanyCode,aEMCode,aAttendCode,aWeekCode,aTime,aAtOutCode:string):Boolean;
    function TB_ATEVENTBACKtimeInsert(aDate,aCompanyCode,aEMCode,aWeekCode,aTime:string):Boolean;
    function TB_ATEVENTLEAVEtimeInsert(aDate,aCompanyCode,aEMCode,aWeekCode,aTime:string):Boolean;

    function TB_ATEVENTOutTimeUpdate(aDate,aCompanyCode,aEMCode,aTime,aAtOutCode:string):Boolean;
    function TB_ATEVENTBACKtimeUpdate(aDate,aCompanyCode,aEMCode,aTime:string):Boolean;
    function TB_ATEVENTLEAVEtimeUpdate(aDate,aCompanyCode,aEMCode,aTime:string):Boolean;

    function DupCheckTB_DEVICE_CARDNO(aCardNo,aNodeNo,aECUID: String):Boolean;
    function DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID,aDoorNo,aCardNo:String):Boolean;
    function DupCheckTB_FOOD_EVENT(aTime:string; aNodeNo:integer;aECUID,aReaderNo,aCompanyCode,aEmCode:String):Boolean;
    function DupCheckTB_AT_EVENT(aDateStr,aCompanyCode,aEMCode:String):Boolean;
    function DupCheckTB_ATEVENT_ATInOut(aDateStr,aCompanyCode,aEMCode:String; var aVarTime : string):Boolean;

    function CardPermitCheck(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardPermitDelete(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardRCV_ACKUpdate(aCardNo,aNodeNo,aECUID,aRcv_Ack :String):Boolean;
    function CheckPermit(aCardNo: String; aNodeNo:integer; aECUID:String; DoorNo: Char;aRcvPositionNum:string;aUseCardPosition:Boolean;
         var aACType:Char; var aPTType:char; Var aRegCode:Char; Var aTimeCode:Char;var aCardPointionNum:integer;var aValidDate:string ): Boolean;
    Function InsertMDBTB_ACCESSEVENT(
            stGROUP_CODE,stAC_DATE,stAC_TIME,
            stAC_NODENO,stAC_ECUID,
            stDO_DOORNO,stCA_CARDNO,stAC_READERNO,
            stAC_DOORPOSI,stAC_INPUTTYPE,stAC_DOORMODE,
            stAC_PERMITMODE,stPE_PERMITCODE,stAC_INSERTDATE,
            stAC_INSERTOPERATOR:string):Boolean;
    Function  InsertMDBTB_ATEVENT(
            stGROUP_CODE,stAT_DATE,stCA_CARDNO,
            stAT_ATCODE,stAT_DEFAULTINTIME,stAT_DEFAULTOUTTIME,
            stAT_INTIME,stAT_OUTTIME,stAT_INRESULT,
            stAT_OUTRESULT,stAT_INSERTTIME,stAT_INSERTOPERATOR,
            stAT_UPDATETIME,stAT_UPDATEOPERATOR,stAT_DEFAULTLATETIME,
            stAT_HoliyDay,stAT_Night,stAT_CONTENT:string):Boolean;
    Function   InsertMDBTB_FOODEVENT(
            stGROUP_CODE,stFO_DATE,stFO_TIME,
            stAC_NODENO,stAC_ECUID,
            stFO_DOORNO,stCA_CARDNO,stFO_FOODCODE,
            stFO_PERMIT,stFO_INSERTTIME,stFO_INSERTOPERATOR,
            stFO_UPDATETIME,stFO_UPDATEOPERATOR,stFO_CONTENT,
            stFO_FOODAMT : string ) : Boolean;
    Function InsertMDBTB_ALARMEVENT(
            stGROUP_CODE,stAL_DATE,stAL_TIME,stAC_NODENO,stAC_ECUID,
            stAL_MSGNO,stAL_ALARMDEVICETYPECODE,stAL_SUBADDR,
            stAL_ZONECODE,stAL_ALARMMODECODE,stAL_ZONENO,
            stAL_ZONESTATE,stAL_ALARMSTATUSCODE,stAL_ISALARM,
            stAL_OPERATOR,stAL_INPUTTIME,stAL_INPUTOPERATOR,
            stAL_CHECKOK,stAL_CHECKCODE,stAL_CHECKMSG,
            stAL_UPDATETIME,stAL_UPDATEOPERATOR:string):Boolean;
    Function InsertMDBTB_SENSOREVENT(
            stGROUP_CODE,stAL_DATE,stAL_TIME,stAC_NODENO,stAC_ECUID,
            stAL_MSGNO,stAL_ALARMDEVICETYPECODE,stAL_SUBADDR,
            stAL_ZONECODE,stAL_ALARMMODECODE,stAL_ZONENO,
            stAL_ZONESTATE,stAL_ALARMSTATUSCODE,stAL_ISALARM,
            stAL_OPERATOR,stAL_INPUTTIME,stAL_INPUTOPERATOR,
            stAL_CHECKOK,stAL_CHECKCODE,stAL_CHECKMSG,
            stAL_UPDATETIME,stAL_UPDATEOPERATOR:string):Boolean;
    Function         InsertMDBTB_CARD(
            stGROUP_CODE,stCA_CARDNO,stCA_GUBUN,stCA_CARDTYPE,
            stEM_CODE,stCO_COMPANYCODE,stCA_UPDATETIME,
            stCA_UPDATEOPERATOR:string ) : Boolean;
    Function         InsertMDBTB_EMPLOYEE(
            stGROUP_CODE,stEM_CODE,stCO_COMPANYCODE,stCO_DEPARTCODE,
            stPO_POSICODE,stEM_NAME,stEM_COPHONE,stEM_HOMEPHONE,
            stEM_HANDPHONE,stZI_ZIPCODE,stEM_ADDR1,stEM_ADDR2,
            stEM_JOINDATE,stEM_RETIREDATE,stEM_UPDATETIME,
            stEM_UPDATEOPERATOR:string ) : Boolean;
    Function         InsertMDBTB_COMPANY(
            stGROUP_CODE,stCO_COMPANYCODE,stCO_DEPARTCODE,stCO_NAME,
            stCO_GUBUN,stCO_CHARGE,stCO_TELNUM:string):Boolean;
    Function InsertMDBTB_POSI(
            stGROUP_CODE,stPO_POSICODE,stPO_NAME:string):Boolean;
    Function InsertMDBTB_ACCESSDEVICE(
            stGROUP_CODE,stAC_NODENO,stAC_ECUID,stAC_MCUIP,stAC_MCUPORT,
            stAC_LASTCONNECTED,stAC_DEVICENAME,stLO_DONGCODE,stLO_FLOORCODE,
            stLO_AREACODE,stAC_VIEWSEQ,stAC_ACTYPE,stAC_ATTYPE,stAC_FDTYPE,
            stAC_PTTYPE,stAC_TOTWIDTH,stAC_TOTHEIGHT,stAC_CURX,stAC_CURY,
            stAC_LOCATEUSE,stAC_LOCALRELAY:string):Boolean;
    Function InsertMDBTB_DOOR(
            stGROUP_CODE,stAC_NODENO,stAC_ECUID,stDO_DOORNO,
            stDO_DOORNONAME,stDO_LASTMODE,stDO_VIEWSEQ,stDO_TOTWIDTH,
            stDO_TOTHEIGHT,stDO_CURX,stDO_CURY,stDO_LOCATEUSE,stLO_DONGCODE,
            stLO_FLOORCODE,stLO_AREACODE,stRelay_Send:string):Boolean;
    Function InsertMDBTB_ALARMDEVICE(
            stGROUP_CODE,stAC_NODENO,stAC_ECUID,
            stAL_ZONENUM,stAL_ZONENAME,stAL_LASTMODE,stAL_VIEWSEQ,stAL_LOCATEUSE,
            stAL_TOTWIDTH,stAL_TOTHEIGHT,stAL_CURX,stAL_CURY,stLO_DONGCODE,
            stLO_FLOORCODE,stLO_AREACODE:string):Boolean;
    Function InsertMDBTB_FOOD(
            stGROUP_CODE,stAC_NODENO,stAC_ECUID,stFO_DOORNO,stFO_NAME,
            stLO_DONGCODE,stLO_FLOORCODE,stLO_AREACODE,stFO_TOTWIDTH,stFO_TOTHEIGHT,
            stFO_CURX,stFO_CURY,stFO_LOCATEUSE,stFO_AMTPER:string):Boolean;
    Function InsertMDBTB_DEVICECARDNO(
            stGROUP_CODE,stAC_NODENO,stAC_ECUID,stCA_CARDNO,stDE_DOOR1,stDE_DOOR2,
            stDE_USEACCESS,stDE_USEALARM,stDE_TIMECODE,stDE_PERMIT,stDE_RCVACK,stDE_UPDATETIME,
            stDE_UPDATEOPERATOR:string):Boolean;
    Function InsertMDBTB_DEVICECARDNO_HIS(
            stSEQ,stGROUP_CODE,stAC_NODENO,stAC_ECUID,stCA_CARDNO,stDE_DOOR1,stDE_DOOR2,
            stDE_USEACCESS,stDE_USEALARM,stDE_TIMECODE,stDE_PERMIT,stDE_RCVACK,stDE_UPDATETIME,
            stDE_UPDATEOPERATOR,stHIS_OPER:string):Boolean;

            
  end;

var
  dmAdoQuery: TdmAdoQuery;

implementation
uses
  uDataModule1,
  uLomosUtil, uMDBSql, uPostGreSql, uMssql;
{$R *.dfm}

{ TdmAdoQuery }

function TdmAdoQuery.CardPermitCheck(aCardNo, aNodeNo,  aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TAdoQuery;
begin
  result := False;

  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.AdoConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open ;
      except
        exit;
      end;

      if Recordcount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.CardPermitDelete(aCardNo, aNodeNo,  aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
begin

  result := False;
  stSql := 'delete from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmAdoQuery.CardRCV_ACKUpdate(aCardNo, aNodeNo,  aECUID,
  aRcv_Ack: String): Boolean;
var
  stSql : String;
begin
  result := False;
  stSql := 'update TB_DEVICECARDNO ';
  stSql := stSql + 'set DE_RCVACK = ''' + aRcv_Ack + ''' ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  if aRcv_Ack = 'Y' then
    stSql := stSql + ' AND DE_RCVACK = ''S'' '; //송신중인 데이터만 업데이트 하자.

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TdmAdoQuery.CheckPermit(aCardNo: String; aNodeNo: integer; 
  aECUID: String; DoorNo: Char; aRcvPositionNum:string;aUseCardPosition:Boolean;
  var aACType, aPTType, aRegCode,
  aTimeCode: Char;var aCardPointionNum:integer;var aValidDate:string): Boolean;
var
  aCardPermit: Integer;
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin

  Result:= False;
  aACType:= '0';
  aPTType := '0';
  aRegCode:= '5';
  aCardPointionNum := 0;
  //aTimeCode:=#0;
  stSql := 'Select a.*,b.positionnum,c.em_retiredate from TB_DEVICECARDNO a ';
  stSql := stSql + ' Left Join TB_CARD b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.CA_CARDNO = b.CA_CARDNO ) ';
  stSql := stSql + ' Left Join TB_EMPLOYEE c ';
  stSql := stSql + ' ON (b.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND b.CO_COMPANYCODE = c.CO_COMPANYCODE ';
  stSql := stSql + ' AND b.EM_CODE = c.EM_CODE ) ';
  stSql := stSql + ' where a.CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and a.AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and a.AC_NODENO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and a.GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.AdoConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      aRegCode:= '4';
      if RecordCount > 0 then
      begin
        case DoorNo of
          '1':begin
              if (FindField('DE_DOOR1').asString  = 'Y') and
                 (FindField('DE_PERMIT').asString = 'L') then Result:= True;
            end;
          '2':begin
              if (FindField('DE_DOOR2').asString = 'Y') and
                 (FindField('DE_PERMIT').asString = 'L') then Result:= True;
            end;
        end;
        //카드타입 확인
        if (FindField('DE_USEACCESS').asString = 'Y') then  aACType:= '1';   //출입권한 유
        //else  aACType:= '0';                                             //출입권한 무
        if FindField('DE_USEALARM').asString = 'Y' then aPTType:= '1';     //방범 권한 유
        //else aPTType := '0';                                             //방범 권한 무

        // 등록코드 확인
        if (FindField('DE_DOOR1').asstring = 'Y') and (FindField('DE_DOOR2').asstring = 'Y') then
          aRegCode:= '0'
        else if FindField('DE_DOOR1').asstring = 'Y' then
          aRegCode:= '1'
        else if FindField('DE_DOOR2').asstring = 'Y' then
          aRegCode:= '2'
        else
        begin
          aACType:= '0'; //출입권한 없음
          aRegCode:= '3';
        end;

        // 타임 코드
        if FindField('DE_TIMECODE').asString <> '' then
          aTimeCode := FindField('DE_TIMECODE').asString[1];

        Try
          aCardPointionNum := FindField('positionnum').AsInteger;
        Except
          aCardPointionNum := 0;
        End;

        if aUseCardPosition then //위치정보 사용 중이면 위치정보도 체크하자
        begin
          if aCardPointionNum <> 0 then //위치정보가 등록 되어 있으면서....
          begin
            if Not IsDigit(aRcvPositionNum) then result := False  //위치정보 사용하는데 ***** 로 올라 오면 무조건 정보를 다시 내려 보내야 함
            else
            begin
              if strtoint(aRcvPositionNum) <> aCardPointionNum then result := False; //위치정보가 틀려도 다시 다운로드
            end;
          end;
        end;
        aValidDate := Trim(FindField('em_retiredate').asString);
        if Length(aValidDate) <> 8 then aValidDate := '99991231';
        if Not IsDigit(aValidDate) then aValidDate := '99991231';
        Try
          if strtoDate(copy(aValidDate,1,4) + '-' + copy(aValidDate,5,2) + '-' + copy(aValidDate,7,2)) < (Now + 1)  then result := False; //유효기간 만료
        Except
          //
        End;
        aValidDate := copy(aValidDate,3,6); //유효기간
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.DupCheckTB_ACCESS_EVENT(aTimestr: string;
  aNodeNO: integer; aECUID, aDoorNo, aCardNo: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ACCESSEVENTDupCheck(aTimestr,inttostr(aNodeNo),aECUID,aDoorNo,aCardNo)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ACCESSEVENTDupCheck(aTimestr,inttostr(aNodeNo),aECUID,aDoorNo,aCardNo)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_ACCESSEVENTDupCheck(aTimestr,inttostr(aNodeNo),aECUID,aDoorNo,aCardNo)
  else Exit;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    TempAdoQuery.DisableControls;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if Recordcount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TdmAdoQuery.DupCheckTB_ATEVENT_ATInOut(aDateStr, aCompanyCode,
  aEMCode: String; var aVarTime: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  aVarTime := '';
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else Exit;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if recordCount > 0 then
      begin
        aVarTime := FindField('AT_INTIME').AsString;
        result := True;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.DupCheckTB_AT_EVENT(aDateStr, aCompanyCode,aEMCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_ATEVENTDupCheck(aDateStr,aCompanyCode,aEMCode)
  else Exit;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if recordCount > 0 then
      begin
        result := True;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.DupCheckTB_DEVICE_CARDNO(aCardNo, aNodeNo,
  aECUID: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;

      if Recordcount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.DupCheckTB_FOOD_EVENT(aTime: string; aNodeNo: integer;
  aECUID, aReaderNo, aCompanyCode,aEmCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  if DBTYPE = 'MDB' then stSql := MDBSql.SelectTB_FOODEVENTDupCheck(aTime,inttostr(aNodeNo),aECUID,aReaderNo,aCompanyCode,aEmCode)
  else if DBTYPE = 'PG' then stSql := PostGreSql.SelectTB_FOODEVENTDupCheck(aTime,inttostr(aNodeNo),aECUID,aReaderNo,aCompanyCode,aEmCode)
  else if DBTYPE = 'MSSQL' then stSql := MSSQL.SelectTB_FOODEVENTDupCheck(aTime,inttostr(aNodeNo),aECUID,aReaderNo,aCompanyCode,aEmCode)
  else Exit;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionEVENT;
    with TempAdoQuery do
    begin
      Close;
      SQL.Clear;
      Sql.Text := stSql;

      try
        open
      except
        exit;
      end;
      if RecordCount > 0 then   result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TdmAdoQuery.InsertMDBTB_ACCESSDEVICE(stGROUP_CODE, stAC_NODENO,
  stAC_ECUID, stAC_MCUIP, stAC_MCUPORT, stAC_LASTCONNECTED,
  stAC_DEVICENAME, stLO_DONGCODE, stLO_FLOORCODE, stLO_AREACODE,
  stAC_VIEWSEQ, stAC_ACTYPE, stAC_ATTYPE, stAC_FDTYPE, stAC_PTTYPE,
  stAC_TOTWIDTH, stAC_TOTHEIGHT, stAC_CURX, stAC_CURY,
  stAC_LOCATEUSE,stAC_LOCALRELAY: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;
  if stAC_NODENO = '' then Exit;

  if stAC_VIEWSEQ = '' then stAC_VIEWSEQ := '1';
  if stAC_TOTWIDTH = '' then stAC_TOTWIDTH := '0';
  if stAC_TOTHEIGHT = '' then stAC_TOTHEIGHT := '0';
  if stAC_CURX = '' then stAC_CURX := '0';
  if stAC_CURY = '' then stAC_CURY := '0';

  stSql := ' Insert Into TB_ACCESSDEVICE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_MCUIP,';
  stSql := stSql + 'AC_MCUPORT,';
  stSql := stSql + 'AC_LASTCONNECTED,';
  stSql := stSql + 'AC_DEVICENAME,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AC_VIEWSEQ,';
  stSql := stSql + 'AC_ACTYPE,';
  stSql := stSql + 'AC_ATTYPE,';
  stSql := stSql + 'AC_FDTYPE,';
  stSql := stSql + 'AC_PTTYPE,';
  stSql := stSql + 'AC_TOTWIDTH,';
  stSql := stSql + 'AC_TOTHEIGHT,';
  stSql := stSql + 'AC_CURX,';
  stSql := stSql + 'AC_CURY,';
  stSql := stSql + 'AC_LOCATEUSE,';
  stSql := stSql + 'AC_LOCALRELAY) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stAC_MCUIP + ''',';
  stSql := stSql + '''' + stAC_MCUPORT + ''',';
  stSql := stSql + '''' + stAC_LASTCONNECTED + ''',';
  stSql := stSql + '''' + stAC_DEVICENAME + ''',';
  stSql := stSql + '''' + stLO_DONGCODE + ''',';
  stSql := stSql + '''' + stLO_FLOORCODE + ''',';
  stSql := stSql + '''' + stLO_AREACODE + ''',';
  stSql := stSql + stAC_VIEWSEQ + ',';
  stSql := stSql + '''' + stAC_ACTYPE + ''',';
  stSql := stSql + '''' + stAC_ATTYPE + ''',';
  stSql := stSql + '''' + stAC_FDTYPE + ''',';
  stSql := stSql + '''' + stAC_PTTYPE + ''',';
  stSql := stSql + stAC_TOTWIDTH + ',';
  stSql := stSql + stAC_TOTHEIGHT + ',';
  stSql := stSql + stAC_CURX + ',';
  stSql := stSql + stAC_CURY + ',';
  stSql := stSql + '''' + stAC_LOCATEUSE + ''',';
  stSql := stSql + '''' + stAC_LOCALRELAY + ''') ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_ACCESSEVENT(stGROUP_CODE, stAC_DATE,
  stAC_TIME, stAC_NODENO, stAC_ECUID, stDO_DOORNO, stCA_CARDNO,
  stAC_READERNO, stAC_DOORPOSI, stAC_INPUTTYPE, stAC_DOORMODE,
  stAC_PERMITMODE, stPE_PERMITCODE, stAC_INSERTDATE,
  stAC_INSERTOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := false;
  stSql := ' Insert Into TB_ACCESSEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_DATE,';
  stSql := stSql + 'AC_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_READERNO,';
  stSql := stSql + 'AC_DOORPOSI,';
  stSql := stSql + 'AC_INPUTTYPE,';
  stSql := stSql + 'AC_DOORMODE,';
  stSql := stSql + 'AC_PERMITMODE,';
  stSql := stSql + 'PE_PERMITCODE,';
  stSql := stSql + 'AC_INSERTDATE,';
  stSql := stSql + 'AC_INSERTOPERATOR) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAC_DATE + ''',';
  stSql := stSql + '''' + stAC_TIME + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stDO_DOORNO + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + stAC_READERNO + ',';
  stSql := stSql + '''' + stAC_DOORPOSI + ''',';
  stSql := stSql + '''' + stAC_INPUTTYPE + ''',';
  stSql := stSql + '''' + stAC_DOORMODE + ''',';
  stSql := stSql + '''' + stAC_PERMITMODE + ''',';
  stSql := stSql + '''' + stPE_PERMITCODE + ''',';
  stSql := stSql + '''' + stAC_INSERTDATE + ''',';
  stSql := stSql + '''' + stAC_INSERTOPERATOR + ''') ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;
end;

function TdmAdoQuery.InsertMDBTB_ALARMDEVICE(stGROUP_CODE,
  stAC_NODENO, stAC_ECUID, stAL_ZONENUM, stAL_ZONENAME,
  stAL_LASTMODE, stAL_VIEWSEQ, stAL_LOCATEUSE, stAL_TOTWIDTH,
  stAL_TOTHEIGHT, stAL_CURX, stAL_CURY, stLO_DONGCODE, stLO_FLOORCODE,
  stLO_AREACODE: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;
  if stAC_NODENO = '' then Exit;

  if stAL_VIEWSEQ = '' then stAL_VIEWSEQ := '1';
  if stAL_TOTWIDTH = '' then stAL_TOTWIDTH := '0';
  if stAL_TOTHEIGHT = '' then stAL_TOTHEIGHT := '0';
  if stAL_CURX = '' then stAL_CURX := '0';
  if stAL_CURY = '' then stAL_CURY := '0';

  stSql := ' Insert Into TB_ALARMDEVICE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENUM,';
  stSql := stSql + 'AL_ZONENAME,';
  stSql := stSql + 'AL_LASTMODE,';
  stSql := stSql + 'AL_VIEWSEQ,';
  stSql := stSql + 'AL_LOCATEUSE,';
  stSql := stSql + 'AL_TOTWIDTH,';
  stSql := stSql + 'AL_TOTHEIGHT,';
  stSql := stSql + 'AL_CURX,';
  stSql := stSql + 'AL_CURY,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stAL_ZONENUM + ''',';
  stSql := stSql + '''' + stAL_ZONENAME + ''',';
  stSql := stSql + '''' + stAL_LASTMODE + ''',';
  stSql := stSql + stAL_VIEWSEQ + ',';
  stSql := stSql + '''' + stAL_LOCATEUSE + ''',';
  stSql := stSql + stAL_TOTWIDTH + ',';
  stSql := stSql + stAL_TOTHEIGHT + ',';
  stSql := stSql + stAL_CURX + ',';
  stSql := stSql + stAL_CURY + ',';
  stSql := stSql + '''' + stLO_DONGCODE + ''',';
  stSql := stSql + '''' + stLO_FLOORCODE + ''',';
  stSql := stSql + '''' + stLO_AREACODE + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_ALARMEVENT(stGROUP_CODE, stAL_DATE,
  stAL_TIME, stAC_NODENO,stAC_ECUID, stAL_MSGNO, stAL_ALARMDEVICETYPECODE,
  stAL_SUBADDR, stAL_ZONECODE, stAL_ALARMMODECODE, stAL_ZONENO,
  stAL_ZONESTATE, stAL_ALARMSTATUSCODE, stAL_ISALARM, stAL_OPERATOR,
  stAL_INPUTTIME, stAL_INPUTOPERATOR, stAL_CHECKOK, stAL_CHECKCODE,
  stAL_CHECKMSG, stAL_UPDATETIME, stAL_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_ALARMEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AL_DATE,';
  stSql := stSql + 'AL_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_MSGNO,';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE,';
  stSql := stSql + 'AL_SUBADDR,';
  stSql := stSql + 'AL_ZONECODE,';
  stSql := stSql + 'AL_ALARMMODECODE,';
  stSql := stSql + 'AL_ZONENO,';
  stSql := stSql + 'AL_ZONESTATE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE,';
  stSql := stSql + 'AL_ISALARM,';
  stSql := stSql + 'AL_OPERATOR,';
  stSql := stSql + 'AL_INPUTTIME,';
  stSql := stSql + 'AL_INPUTOPERATOR,';
  stSql := stSql + 'AL_CHECKOK,';
  stSql := stSql + 'AL_CHECKCODE,';
  stSql := stSql + 'AL_CHECKMSG,';
  stSql := stSql + 'AL_UPDATETIME,';
  stSql := stSql + 'AL_UPDATEOPERATOR )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAL_DATE + ''',';
  stSql := stSql + '''' + stAL_TIME + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stAL_MSGNO + ''',';
  stSql := stSql + '''' + stAL_ALARMDEVICETYPECODE + ''',';
  stSql := stSql + '''' + stAL_SUBADDR + ''',';
  stSql := stSql + '''' + stAL_ZONECODE + ''',';
  stSql := stSql + '''' + stAL_ALARMMODECODE + ''',';
  stSql := stSql + '''' + stAL_ZONENO + ''',';
  stSql := stSql + '''' + stAL_ZONESTATE + ''',';
  stSql := stSql + '''' + stAL_ALARMSTATUSCODE + ''',';
  stSql := stSql + '''' + stAL_ISALARM + ''',';
  stSql := stSql + '''' + stAL_OPERATOR + ''',';
  stSql := stSql + '''' + stAL_INPUTTIME + ''',';
  stSql := stSql + '''' + stAL_INPUTOPERATOR + ''',';
  stSql := stSql + '''' + stAL_CHECKOK + ''',';
  stSql := stSql + '''' + stAL_CHECKCODE + ''',';
  stSql := stSql + '''' + stAL_CHECKMSG + ''',';
  stSql := stSql + '''' + stAL_UPDATETIME + ''',';
  stSql := stSql + '''' + stAL_UPDATEOPERATOR + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;


end;

function TdmAdoQuery.InsertMDBTB_ATEVENT(stGROUP_CODE, stAT_DATE,
  stCA_CARDNO, stAT_ATCODE, stAT_DEFAULTINTIME, stAT_DEFAULTOUTTIME,
  stAT_INTIME, stAT_OUTTIME, stAT_INRESULT, stAT_OUTRESULT,
  stAT_INSERTTIME, stAT_INSERTOPERATOR, stAT_UPDATETIME,
  stAT_UPDATEOPERATOR, stAT_DEFAULTLATETIME, stAT_HoliyDay, stAT_Night,
  stAT_CONTENT: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
{  CoInitialize(nil);
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOBackupConnection;

  result := False;
  stSql := ' Insert Into TB_ATEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_DATE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'AT_DEFAULTINTIME,';
  stSql := stSql + 'AT_DEFAULTOUTTIME,';
  stSql := stSql + 'AT_INTIME,';
  stSql := stSql + 'AT_OUTTIME,';
  stSql := stSql + 'AT_INRESULT,';
  stSql := stSql + 'AT_OUTRESULT,';
  stSql := stSql + 'AT_INSERTTIME,';
  stSql := stSql + 'AT_INSERTOPERATOR,';
  stSql := stSql + 'AT_UPDATETIME,';
  stSql := stSql + 'AT_UPDATEOPERATOR,';
  stSql := stSql + 'AT_DEFAULTLATETIME,';
  stSql := stSql + 'AT_HoliyDay,';
  stSql := stSql + 'AT_Night,';
  stSql := stSql + 'AT_CONTENT) ';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAT_DATE + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stAT_ATCODE + ''',';
  stSql := stSql + '''' + stAT_DEFAULTINTIME + ''',';
  stSql := stSql + '''' + stAT_DEFAULTOUTTIME + ''',';
  stSql := stSql + '''' + stAT_INTIME + ''',';
  stSql := stSql + '''' + stAT_OUTTIME + ''',';
  stSql := stSql + '''' + stAT_INRESULT + ''',';
  stSql := stSql + '''' + stAT_OUTRESULT + ''',';
  stSql := stSql + '''' + stAT_INSERTTIME + ''',';
  stSql := stSql + '''' + stAT_INSERTOPERATOR + ''',';
  stSql := stSql + '''' + stAT_UPDATETIME + ''',';
  stSql := stSql + '''' + stAT_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + stAT_DEFAULTLATETIME + ''',';
  stSql := stSql + '''' + stAT_HoliyDay + ''',';
  stSql := stSql + '''' + stAT_Night + ''',';
  stSql := stSql + '''' + stAT_CONTENT + ''') ';

  with TempAdoQuery do
  begin
    close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    End;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  result := True;
 }

end;

function TdmAdoQuery.InsertMDBTB_CARD(stGROUP_CODE, stCA_CARDNO,
  stCA_GUBUN, stCA_CARDTYPE, stEM_CODE, stCO_COMPANYCODE, stCA_UPDATETIME,
  stCA_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_CARD(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'CA_GUBUN,';
  stSql := stSql + 'CA_CARDTYPE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CA_UPDATETIME,';
  stSql := stSql + 'CA_UPDATEOPERATOR )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stCA_GUBUN + ''',';
  stSql := stSql + '''' + stCA_CARDTYPE + ''',';
  stSql := stSql + '''' + stEM_CODE + ''',';
  stSql := stSql + '''' + stCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + stCA_UPDATETIME + ''',';
  stSql := stSql + '''' + stCA_UPDATEOPERATOR + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_COMPANY(stGROUP_CODE, stCO_COMPANYCODE,
  stCO_DEPARTCODE, stCO_NAME, stCO_GUBUN, stCO_CHARGE, stCO_TELNUM: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_COMPANY(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'CO_NAME,';
  stSql := stSql + 'CO_GUBUN,';
  stSql := stSql + 'CO_CHARGE,';
  stSql := stSql + 'CO_TELNUM )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + stCO_DEPARTCODE + ''',';
  stSql := stSql + '''' + stCO_NAME + ''',';
  stSql := stSql + '''' + stCO_GUBUN + ''',';
  stSql := stSql + '''' + stCO_CHARGE + ''',';
  stSql := stSql + '''' + stCO_TELNUM + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;


end;


function TdmAdoQuery.InsertMDBTB_DEVICECARDNO(stGROUP_CODE, stAC_NODENO,
  stAC_ECUID, stCA_CARDNO, stDE_DOOR1, stDE_DOOR2,
  stDE_USEACCESS, stDE_USEALARM, stDE_TIMECODE, stDE_PERMIT, stDE_RCVACK,
  stDE_UPDATETIME, stDE_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'DE_DOOR1,';
  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_USEALARM,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stDE_DOOR1 + ''',';
  stSql := stSql + '''' + stDE_DOOR2 + ''',';
  stSql := stSql + '''' + stDE_USEACCESS + ''',';
  stSql := stSql + '''' + stDE_USEALARM + ''',';
  stSql := stSql + '''' + stDE_TIMECODE + ''',';
  stSql := stSql + '''' + stDE_PERMIT + ''',';
  stSql := stSql + '''' + stDE_RCVACK + ''',';
  stSql := stSql + '''' + stDE_UPDATETIME + ''',';
  stSql := stSql + '''' + stDE_UPDATEOPERATOR + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_DEVICECARDNO_HIS(stSEQ, stGROUP_CODE,
  stAC_NODENO, stAC_ECUID, stCA_CARDNO, stDE_DOOR1, stDE_DOOR2,
  stDE_USEACCESS, stDE_USEALARM, stDE_TIMECODE, stDE_PERMIT, stDE_RCVACK,
  stDE_UPDATETIME, stDE_UPDATEOPERATOR, stHIS_OPER: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_DEVICECARDNO_HIS(';
  stSql := stSql + 'SEQ,';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'DE_DOOR1,';
  stSql := stSql + 'DE_DOOR2,';
  stSql := stSql + 'DE_USEACCESS,';
  stSql := stSql + 'DE_USEALARM,';
  stSql := stSql + 'DE_TIMECODE,';
  stSql := stSql + 'DE_PERMIT,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR,';
  stSql := stSql + 'HIS_OPER )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + stSEQ + ',';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stDE_DOOR1 + ''',';
  stSql := stSql + '''' + stDE_DOOR2 + ''',';
  stSql := stSql + '''' + stDE_USEACCESS + ''',';
  stSql := stSql + '''' + stDE_USEALARM + ''',';
  stSql := stSql + '''' + stDE_TIMECODE + ''',';
  stSql := stSql + '''' + stDE_PERMIT + ''',';
  stSql := stSql + '''' + stDE_RCVACK + ''',';
  stSql := stSql + '''' + stDE_UPDATETIME + ''',';
  stSql := stSql + '''' + stDE_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + stHIS_OPER + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_DOOR(stGROUP_CODE, stAC_NODENO,
  stAC_ECUID, stDO_DOORNO, stDO_DOORNONAME, stDO_LASTMODE,
  stDO_VIEWSEQ, stDO_TOTWIDTH, stDO_TOTHEIGHT, stDO_CURX, stDO_CURY,
  stDO_LOCATEUSE, stLO_DONGCODE, stLO_FLOORCODE, stLO_AREACODE,stRelay_Send: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;

  if stAC_NODENO = '' then Exit;

  if stDO_VIEWSEQ = '' then stDO_VIEWSEQ := '1';
  if stDO_TOTWIDTH = '' then stDO_TOTWIDTH := '0';
  if stDO_TOTHEIGHT = '' then stDO_TOTHEIGHT := '0';
  if stDO_CURX = '' then stDO_CURX := '0';
  if stDO_CURY = '' then stDO_CURY := '0';

  stSql := ' Insert Into TB_DOOR(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DO_DOORNONAME,';
  stSql := stSql + 'DO_LASTMODE,';
  stSql := stSql + 'DO_VIEWSEQ,';
  stSql := stSql + 'DO_TOTWIDTH,';
  stSql := stSql + 'DO_TOTHEIGHT,';
  stSql := stSql + 'DO_CURX,';
  stSql := stSql + 'DO_CURY,';
  stSql := stSql + 'DO_LOCATEUSE,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'Relay_Send )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stDO_DOORNO + ''',';
  stSql := stSql + '''' + stDO_DOORNONAME + ''',';
  stSql := stSql + '''' + stDO_LASTMODE + ''',';
  stSql := stSql + stDO_VIEWSEQ + ',';
  stSql := stSql + stDO_TOTWIDTH + ',';
  stSql := stSql + stDO_TOTHEIGHT + ',';
  stSql := stSql + stDO_CURX + ',';
  stSql := stSql + stDO_CURY + ',';
  stSql := stSql + '''' + stDO_LOCATEUSE + ''',';
  stSql := stSql + '''' + stLO_DONGCODE + ''',';
  stSql := stSql + '''' + stLO_FLOORCODE + ''',';
  stSql := stSql + '''' + stLO_AREACODE + ''',';
  stSql := stSql + '''' + stRelay_Send + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;

    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_EMPLOYEE(stGROUP_CODE, stEM_CODE,
  stCO_COMPANYCODE, stCO_DEPARTCODE, stPO_POSICODE, stEM_NAME,
  stEM_COPHONE, stEM_HOMEPHONE, stEM_HANDPHONE, stZI_ZIPCODE, stEM_ADDR1,
  stEM_ADDR2, stEM_JOINDATE, stEM_RETIREDATE, stEM_UPDATETIME,
  stEM_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_EMPLOYEE(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'EM_CODE,';
  stSql := stSql + 'CO_COMPANYCODE,';
  stSql := stSql + 'CO_DEPARTCODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'EM_NAME,';
  stSql := stSql + 'EM_COPHONE,';
  stSql := stSql + 'EM_HOMEPHONE,';
  stSql := stSql + 'EM_HANDPHONE,';
  stSql := stSql + 'ZI_ZIPCODE,';
  stSql := stSql + 'EM_ADDR1,';
  stSql := stSql + 'EM_ADDR2,';
  stSql := stSql + 'EM_JOINDATE,';
  stSql := stSql + 'EM_RETIREDATE,';
  stSql := stSql + 'EM_UPDATETIME,';
  stSql := stSql + 'EM_UPDATEOPERATOR )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stEM_CODE + ''',';
  stSql := stSql + '''' + stCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + stCO_DEPARTCODE + ''',';
  stSql := stSql + '''' + stPO_POSICODE + ''',';
  stSql := stSql + '''' + stEM_NAME + ''',';
  stSql := stSql + '''' + stEM_COPHONE + ''',';
  stSql := stSql + '''' + stEM_HOMEPHONE + ''',';
  stSql := stSql + '''' + stEM_HANDPHONE + ''',';
  stSql := stSql + '''' + stZI_ZIPCODE + ''',';
  stSql := stSql + '''' + stEM_ADDR1 + ''',';
  stSql := stSql + '''' + stEM_ADDR2 + ''',';
  stSql := stSql + '''' + stEM_JOINDATE + ''',';
  stSql := stSql + '''' + stEM_RETIREDATE + ''',';
  stSql := stSql + '''' + stEM_UPDATETIME + ''',';
  stSql := stSql + '''' + stEM_UPDATEOPERATOR + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;


end;

function TdmAdoQuery.InsertMDBTB_FOOD(stGROUP_CODE, stAC_NODENO,
  stAC_ECUID, stFO_DOORNO, stFO_NAME, stLO_DONGCODE,
  stLO_FLOORCODE, stLO_AREACODE, stFO_TOTWIDTH, stFO_TOTHEIGHT, stFO_CURX,
  stFO_CURY, stFO_LOCATEUSE, stFO_AMTPER: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin
  result := False;
  if stAC_NODENO = '' then Exit;

  if stFO_TOTWIDTH = '' then stFO_TOTWIDTH := '0';
  if stFO_TOTHEIGHT = '' then stFO_TOTHEIGHT := '0';
  if stFO_CURX = '' then stFO_CURX := '0';
  if stFO_CURY = '' then stFO_CURY := '0';
  if stFO_AMTPER = '' then stFO_AMTPER := '100';

  stSql := ' Insert Into TB_FOOD(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'FO_NAME,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'FO_TOTWIDTH,';
  stSql := stSql + 'FO_TOTHEIGHT,';
  stSql := stSql + 'FO_CURX,';
  stSql := stSql + 'FO_CURY,';
  stSql := stSql + 'FO_LOCATEUSE,';
  stSql := stSql + 'FO_AMTPER )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stFO_DOORNO + ''',';
  stSql := stSql + '''' + stFO_NAME + ''',';
  stSql := stSql + '''' + stLO_DONGCODE + ''',';
  stSql := stSql + '''' + stLO_FLOORCODE + ''',';
  stSql := stSql + '''' + stLO_AREACODE + ''',';
  stSql := stSql + stFO_TOTWIDTH + ',';
  stSql := stSql + stFO_TOTHEIGHT + ',';
  stSql := stSql + stFO_CURX + ',';
  stSql := stSql + stFO_CURY + ',';
  stSql := stSql + '''' + stFO_LOCATEUSE + ''',';
  stSql := stSql + stFO_AMTPER + ' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;

    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_FOODEVENT(stGROUP_CODE, stFO_DATE,
  stFO_TIME, stAC_NODENO, stAC_ECUID, stFO_DOORNO, stCA_CARDNO,
  stFO_FOODCODE, stFO_PERMIT, stFO_INSERTTIME, stFO_INSERTOPERATOR,
  stFO_UPDATETIME, stFO_UPDATEOPERATOR, stFO_CONTENT, stFO_FOODAMT: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_FOODEVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'FO_DATE,';
  stSql := stSql + 'FO_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'CA_CARDNO,';
  stSql := stSql + 'FO_FOODCODE,';
  stSql := stSql + 'FO_PERMIT,';
  stSql := stSql + 'FO_INSERTTIME,';
  stSql := stSql + 'FO_INSERTOPERATOR,';
  stSql := stSql + 'FO_UPDATETIME,';
  stSql := stSql + 'FO_UPDATEOPERATOR,';
  stSql := stSql + 'FO_CONTENT,';
  stSql := stSql + 'FO_FOODAMT )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stFO_DATE + ''',';
  stSql := stSql + '''' + stFO_TIME + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stFO_DOORNO + ''',';
  stSql := stSql + '''' + stCA_CARDNO + ''',';
  stSql := stSql + '''' + stFO_FOODCODE + ''',';
  stSql := stSql + '''' + stFO_PERMIT + ''',';
  stSql := stSql + '''' + stFO_INSERTTIME + ''',';
  stSql := stSql + '''' + stFO_INSERTOPERATOR + ''',';
  stSql := stSql + '''' + stFO_UPDATETIME + ''',';
  stSql := stSql + '''' + stFO_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + stFO_CONTENT + ''',';
  stSql := stSql + stFO_FOODAMT + ' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.InsertMDBTB_POSI(stGROUP_CODE, stPO_POSICODE,
  stPO_NAME: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  Result := False;
  stSql := ' Insert Into TB_POSI(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'PO_POSICODE,';
  stSql := stSql + 'PO_NAME)';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stPO_POSICODE + ''',';
  stSql := stSql + '''' + stPO_NAME + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;


end;

function TdmAdoQuery.InsertMDBTB_SENSOREVENT(stGROUP_CODE, stAL_DATE,
  stAL_TIME, stAC_NODENO, stAC_ECUID, stAL_MSGNO, stAL_ALARMDEVICETYPECODE,
  stAL_SUBADDR, stAL_ZONECODE, stAL_ALARMMODECODE, stAL_ZONENO,
  stAL_ZONESTATE, stAL_ALARMSTATUSCODE, stAL_ISALARM, stAL_OPERATOR,
  stAL_INPUTTIME, stAL_INPUTOPERATOR, stAL_CHECKOK, stAL_CHECKCODE,
  stAL_CHECKMSG, stAL_UPDATETIME, stAL_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;
  stSql := ' Insert Into TB_SENSOREVENT(';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AL_DATE,';
  stSql := stSql + 'AL_TIME,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AL_ZONENO,';
  stSql := stSql + 'AL_MSGNO,';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE,';
  stSql := stSql + 'AL_SUBADDR,';
  stSql := stSql + 'AL_ZONECODE,';
  stSql := stSql + 'AL_ALARMMODECODE,';
  stSql := stSql + 'AL_ZONESTATE,';
  stSql := stSql + 'AL_ALARMSTATUSCODE,';
  stSql := stSql + 'AL_ISALARM,';
  stSql := stSql + 'AL_OPERATOR,';
  stSql := stSql + 'AL_INPUTTIME,';
  stSql := stSql + 'AL_INPUTOPERATOR,';
  stSql := stSql + 'AL_CHECKOK,';
  stSql := stSql + 'AL_CHECKCODE,';
  stSql := stSql + 'AL_CHECKMSG,';
  stSql := stSql + 'AL_UPDATETIME,';
  stSql := stSql + 'AL_UPDATEOPERATOR )';
  stSql := stSql + ' VALUES( ';
  stSql := stSql + '''' + stGROUP_CODE + ''',';
  stSql := stSql + '''' + stAL_DATE + ''',';
  stSql := stSql + '''' + stAL_TIME + ''',';
  stSql := stSql + stAC_NODENO + ',';
  stSql := stSql + '''' + stAC_ECUID + ''',';
  stSql := stSql + '''' + stAL_ZONENO + ''',';
  stSql := stSql + '''' + stAL_MSGNO + ''',';
  stSql := stSql + '''' + stAL_ALARMDEVICETYPECODE + ''',';
  stSql := stSql + '''' + stAL_SUBADDR + ''',';
  stSql := stSql + '''' + stAL_ZONECODE + ''',';
  stSql := stSql + '''' + stAL_ALARMMODECODE + ''',';
  stSql := stSql + '''' + stAL_ZONESTATE + ''',';
  stSql := stSql + '''' + stAL_ALARMSTATUSCODE + ''',';
  stSql := stSql + '''' + stAL_ISALARM + ''',';
  stSql := stSql + '''' + stAL_OPERATOR + ''',';
  stSql := stSql + '''' + stAL_INPUTTIME + ''',';
  stSql := stSql + '''' + stAL_INPUTOPERATOR + ''',';
  stSql := stSql + '''' + stAL_CHECKOK + ''',';
  stSql := stSql + '''' + stAL_CHECKCODE + ''',';
  stSql := stSql + '''' + stAL_CHECKMSG + ''',';
  stSql := stSql + '''' + stAL_UPDATETIME + ''',';
  stSql := stSql + '''' + stAL_UPDATEOPERATOR + ''' )';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOBackupConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

function TdmAdoQuery.TB_ATEVENTBACKtimeInsert(aDate, aCompanyCode,aEMCode,aWeekCode,
  aTime: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Insert into TB_ATEVENT';
  stSql := stSql + '(GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_WEEKCODE,';
  stSql := stSql + 'AT_BACKTIME,AT_INSERTTIME,AT_INCODE,AT_SUMMARY,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''' + aDate + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + aEMCode + ''',' ;
  stSql := stSql + '''000'',' ;
  stSql := stSql + '''' + aWeekCode + ''',' ;
  stSql := stSql + '''' + aTime + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''000'',' ;
  stSql := stSql + '''N'',' ;
  stSql := stSql + '''SYSTEM'',''SYSTEM'') ' ;

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmAdoQuery.TB_ATEVENTBACKtimeUpdate(aDate, aCompanyCode,aEMCode,
  aTime: string): Boolean;
var
  stSql : string;
begin

  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set AT_BACKTIME = ''' + aTime + ''', ';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR = ''SYSTEM''  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);


end;

function TdmAdoQuery.TB_ATEVENTIntimeInsert(aDate, aCompanyCode,aEMCode, aAttendCode,aWeekCode,
  aTime,aAtInCode:string): Boolean;
var
  stSql : string;

begin

  Result := False;

  stSql := 'Insert into TB_ATEVENT';
  stSql := stSql + '(GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_WEEKCODE,';
  stSql := stSql + 'AT_INTIME,AT_INSERTTIME,AT_INCODE,AT_SUMMARY,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''' + aDate + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + aEMCode + ''',' ;
  stSql := stSql + '''' + aAttendCode + ''',' ;
  stSql := stSql + '''' + aWeekCode + ''',' ;
  stSql := stSql + '''' + aTime + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + aAtInCode + ''',' ;
  stSql := stSql + '''N'',' ;
  stSql := stSql + '''SYSTEM'',''SYSTEM'') ' ;

  result := DataModule1.ProcessEventExecSQL(stSql);


end;

function TdmAdoQuery.TB_ATEVENTIntimeUpdate(aDate, aCompanyCode, aEMCode,
  aAttendCode, aWeekCode, aTime, aAtInCode: string): Boolean;
var
  stSql : string;

begin

  stSql := 'Update TB_ATEVENT set ';
  stSql := stSql + 'AT_ATCODE = ''' + aAttendCode + ''',';
  stSql := stSql + 'AT_WEEKCODE = ''' + aWeekCode + ''',';
  stSql := stSql + 'AT_INTIME = ''' + aTime + ''',';
  stSql := stSql + 'AT_INCODE = ''' + aAtInCode + ''',';
  stSql := stSql + 'AT_SUMMARY = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_DATE = ''' + aDate + ''' ';
  stSql := stsql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmAdoQuery.TB_ATEVENTLEAVEtimeInsert(aDate, aCompanyCode,aEMCode,aWeekCode,
  aTime: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Insert into TB_ATEVENT';
  stSql := stSql + '(GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_WEEKCODE,';
  stSql := stSql + 'AT_LEAVETIME,AT_INSERTTIME,AT_INCODE,AT_SUMMARY,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''' + aDate + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + aEMCode + ''',' ;
  stSql := stSql + '''000'',' ;
  stSql := stSql + '''' + aWeekCode + ''',' ;
  stSql := stSql + '''' + aTime + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''000'',' ;
  stSql := stSql + '''N'',' ;
  stSql := stSql + '''SYSTEM'',''SYSTEM'') ' ;

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmAdoQuery.TB_ATEVENTLEAVEtimeUpdate(aDate, aCompanyCode,aEMCode,
  aTime: string): Boolean;
var
  stSql : string;
begin

  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set AT_LEAVETIME = ''' + aTime + ''', ';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR = ''SYSTEM''  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmAdoQuery.TB_ATEVENTOuttimeInsert(aDate, aCompanyCode,aEMCode, aAttendCode,aWeekCode,
  aTime, aAtOutCode: string): Boolean;
var
  stSql : string;

begin

  Result := False;

  stSql := 'Insert into TB_ATEVENT';
  stSql := stSql + '(GROUP_CODE,AT_DATE,CO_COMPANYCODE,EM_CODE,AT_ATCODE,AT_WEEKCODE,';
  stSql := stSql + 'AT_OUTTIME,AT_INSERTTIME,AT_OUTCODE,AT_SUMMARY,AT_INSERTOPERATOR,AT_UPDATEOPERATOR) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '''' + aDate + ''',' ;
  stSql := stSql + '''' + aCompanyCode + ''',' ;
  stSql := stSql + '''' + aEMCode + ''',' ;
  stSql := stSql + '''' + aAttendCode + ''',' ;
  stSql := stSql + '''' + aWeekCode + ''',' ;
  stSql := stSql + '''' + aTime + ''',' ;
  stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',' ;
  stSql := stSql + '''' + aAtOutCode + ''',' ;
  stSql := stSql + '''N'',' ;
  stSql := stSql + '''SYSTEM'',''SYSTEM'') ' ;

  result := DataModule1.ProcessEventExecSQL(stSql);

end;

function TdmAdoQuery.TB_ATEVENTOutTimeUpdate(aDate,aCompanyCode,aEMCode,aTime,aAtOutCode:string): Boolean;
var
  stSql : string;
begin

  stSql := 'update TB_ATEVENT ';
  stSql := stSql + 'set AT_OUTTIME = ''' + aTime + ''', ';
  stSql := stSql + ' AT_OUTCODE = ''' + aAtOutCode + ''', ';
  stSql := stSql + ' AT_SUMMARY = ''N'', ';
  stSql := stSql + ' AT_UPDATETIME = ''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''', ';
  stSql := stSql + ' AT_UPDATEOPERATOR = ''SYSTEM''  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and AT_DATE = ''' + aDate + ''' ';
  stSql := stSql + ' and CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' and EM_CODE = ''' + aEMCode + ''' ';

  result := DataModule1.ProcessEventExecSQL(stSql);


end;

function TdmAdoQuery.TB_LOWDATAInsert(NodeNO: integer; aIP, aPort,
  aECUID, aTxRx: string; aCommand: char; aReceiveData: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;

begin

  result := False;

  stSql := 'Insert into TB_LOWDATA ';
  stSql := stSql + '(GROUP_CODE,LO_DATE,AC_NODENO,LO_IP,LO_PORT,LO_ECUID,';
  stSql := stSql + 'LO_TXRX,LO_COMMAND,LO_LOWDATA,LO_INSERTTIME) ';
  stSql := stSql + 'Values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + FormatdateTime('yyyymmdd',Now) + ''',';
  stSql := stSql + inttostr(NodeNO) + ',';
  stSql := stSql + '''' + aIP + ''',';
  stSql := stSql + '''' + aPort + ''',';
  stSql := stSql + '''' + aECUID + ''',';
  stSql := stSql + '''' + aTxRx + ''',';
  stSql := stSql + '''' + aCommand + ''',';
  stSql := stSql + '''' + aReceiveData + ''',';
  stSql := stSql + '''' + FormatdateTime('yyyymmddHHMMSS',Now) + ''') ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnectionLOG;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;
      Try
        ExecSql;
      Except
        Exit;
      End;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  result := True;

end;

end.
