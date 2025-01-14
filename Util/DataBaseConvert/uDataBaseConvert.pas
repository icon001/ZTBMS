unit uDataBaseConvert;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Gauges, DB, ADODB,ActiveX;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    rg_orgDBType: TRadioGroup;
    rg_targetDBType: TRadioGroup;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    ed_orgDBIP: TEdit;
    ed_orgDBPort: TEdit;
    ed_orgDBName: TEdit;
    ed_orgUserName: TEdit;
    ed_orgUserPw: TEdit;
    cmb_table: TComboBox;
    ed_targetUserpw: TEdit;
    ed_targetUserName: TEdit;
    ed_targetDBName: TEdit;
    ed_targetDBPort: TEdit;
    ed_targetDBIP: TEdit;
    btn_Conversion: TSpeedButton;
    btn_Close: TSpeedButton;
    gb_Progress: TGroupBox;
    Label12: TLabel;
    lb_table: TLabel;
    Gauge1: TGauge;
    Gauge2: TGauge;
    OrgADOConnection: TADOConnection;
    targetADOConnection: TADOConnection;
    orgADOQuery: TADOQuery;
    targetADOQuery: TADOQuery;
    Memo1: TMemo;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    ed_NodeNo: TEdit;
    chk_Company: TCheckBox;
    ed_CompanyCode: TEdit;
    chk_Building: TCheckBox;
    ed_BuildingCode: TEdit;
    Label14: TLabel;
    ed_JijumCode: TEdit;
    chk_Floor: TCheckBox;
    ed_FloorCode: TEdit;
    orgProcessADOQuery: TADOQuery;
    orgADOExeQuery: TADOQuery;
    OrgTempADOQuery: TADOQuery;
    Label15: TLabel;
    btnStop: TSpeedButton;
    procedure btn_CloseClick(Sender: TObject);
    procedure rg_orgDBTypeClick(Sender: TObject);
    procedure rg_targetDBTypeClick(Sender: TObject);
    procedure btn_ConversionClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
  private

    { Private declarations }
    Function OrgAdoConnect:Boolean;
    Function targetAdoConnect : Boolean;
  private
    L_IncNodeNo : integer;
    L_incJijumCode : integer;
    L_stCompanyCode : string;
    L_stBuildingCode : string;
    L_stFloorCode : string;
    L_bStop : Boolean;
    function targetProcessExec(aSql:string):Boolean;
    procedure AlterTB_ACCESSDEVICE_NameChange;
    procedure AlterTB_ACCESSDEVICE_JAVARATypeAdd;
    procedure AlterTB_ACCESSDEVICE_MCUIDChange;
    procedure AlterTB_ACCESSDEVICE_VerChange;
    procedure AlterTB_ACCESSDEVICE_CARDREADERTYPEChange;
    procedure AlterTB_ALARMDEVICE_INDEXChange;
    Function AllTableConvert:Boolean;
    Function TB_ACCESSDEVICEConvert:Boolean;
    Function TB_ACCESSEVENTConvert:Boolean;
    Function TB_ACCESSEVENTConvertProcess(aStartPoint,aEndPoint:integer):Boolean;
    Function updateOrgTB_ACCESSEVENTRelay(aGROUP_CODE,aAC_DATE,aAC_TIME,
        aAC_NODENO,aAC_ECUID,aDO_DOORNO,aCA_CARDNO,aRelay:string):Boolean;
    Function TB_ALARMDEVICEConvert:Boolean;
    Function TB_ALARMEVENTConvert:Boolean;
    Function TB_ALARMEVENTConvertProcess:Boolean;
    Function updateOrgTB_ALARMVENTRelay(aGROUP_CODE,aAL_DATE,aAL_TIME,
        aAC_NODENO,aAC_ECUID,aAL_MSGNO,aRelay:string):Boolean;
    Function TB_CARDConvert:Boolean;
    Function TB_CARDConvertProcess(aStartPoint,aEndPoint:integer):Boolean;
    Function updateOrgTB_CARDRelay(aGROUP_CODE,aCA_CARDNO,aRelay:string):Boolean;
    Function TB_COMPANYConvert:Boolean;
    Function TB_CONFIGConvert:Boolean;
    Function TB_DEVICECARDNOConvert:Boolean;
    Function TB_DEVICECARDNOConvertProcess(aStartPoint,aEndPoint:integer):Boolean;
    Function updateOrgTB_DEVICECARDNORelay(aGROUP_CODE,aNodeNo,aEcuId,aCardNo,aRelay:string):Boolean;
    Function TB_DOORConvert:Boolean;
    Function TB_EMPHISConvert:Boolean;
    Function TB_EMPHISConvertProcess(aStartPoint,aEndPoint:integer):Boolean;
    Function updateOrgTB_EMPHISRelay(aSeq,aRelay:string):Boolean;
    Function TB_EMPLOYEEConvert:Boolean;
    Function TB_EMPLOYEEConvertProcess(aStartPoint,aEndPoint:integer):Boolean;
    Function updateOrgTB_EMPLOYEERelay(aGroupCode,aCompanyCode,aEmCode,aRelay:string):Boolean;
    Function TB_KTCARDISSUEConvert:Boolean;
    Function TB_LOCATIONConvert:Boolean;
    Function TB_POSIConvert:Boolean;
    Function TB_READERConvert:Boolean;
    Function TB_ZONEDEVICEConvert:Boolean;
    Function TB_ATEVENTConvert:Boolean;
    Function TB_ATEVENTConvertProcess:Boolean;
    Function tb_atmonthextraConvert:Boolean;
    Function tb_atmonthsummaryConvert:Boolean;
    Function tb_foodeventConvert : Boolean;
    Function tb_foodeventConvertProcess:Boolean;
    Function TB_DEVICESCHEDULEConvert:Boolean;
    Function TB_ARMAREAConvert : Boolean;

    Function InsertIntoTB_ARMAREA(aGroup_Code,aAC_NODENO,aAc_ecuid,aAR_AREANO,aAR_NAME,aAR_USE,aAr_lastmode,aAr_viewseq,
        aAr_locateuse,aAr_totwidth,aAr_totheight,aAr_curx,aAr_cury,aLo_dongcode,aLo_floorcode,aLo_areacode,aAr_update,
        aAr_telno,aAr_memo,aAg_armcode,aAr_memload,aAr_disarmcheckuse,aAr_disarmchecktime1from,aAr_disarmchecktime1to,
        aAr_change,aAr_relaycode:string):Boolean;

    Function  InsertIntoTB_ATEVENT(aGROUP_CODE,aAt_date,aco_companycode,
        aem_code,aca_gubun,aca_cardno,aat_atcode,aat_weekcode,
        aat_defaultintime,aat_defaultouttime,aat_intime,aat_leavetime,
        aat_backtime,aat_outtime,aat_inresult,aat_outresult,aat_inserttime,
        aat_insertoperator,aat_updatetime,aat_updateoperator,
        aat_defaultlatetime,aat_holiyday,aat_night,aat_content,
        aat_incode,aat_outcode,aat_summary:string):Boolean;
    Function  updateOrgTB_ATRelay(aGROUP_CODE,aat_date,aco_companycode,aem_code,aRelay:string):Boolean;
    Function InsertIntotb_atmonthextra(aGROUP_CODE,aat_month,aco_companycode,
        aem_code,aat_extraname,aat_extraamt:string):Boolean;
    Function InsertIntotb_atmonthsummary(agroup_code,aat_month,aco_companycode,
        aem_code,aat_startdate,aat_enddate:string;
        aat_totdaycount,aat_holidaycount,aat_attenddaycount,aat_incount,
        aat_jikagcount,aat_jotaecount,aat_nonatcount,aat_payvacount,
        aat_nonpayvacount,aat_leavecount,aat_backcount,aat_infrommm,
        aat_workmm,aat_extendmm,aat_nightmm,aat_holidaymm,
        aat_realattimemm,aat_infromamt,aat_workamt,aat_extendamt,
        aat_nightamt,aat_holidayamt:integer):Boolean;
    Function InsertIntotb_foodevent(aGROUP_CODE,afo_date,afo_time,aac_nodeno,
        afo_doorno,aco_companycode,aem_code,afo_foodcode,afo_permit,
        afo_inserttime,afo_insertoperator,afo_updatetime,afo_updateoperator,
        aac_mcuid,aac_ecuid,afo_content,afo_foodamt:string ):Boolean;
    Function updateOrgtb_foodeventRelay(aGROUP_CODE,afo_date,afo_time,
        aac_nodeno,afo_doorno,aco_companycode,aem_code,afoRelay:string):Boolean;
  private
    Function InsertIntoTB_ACCESSDEVICE(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aAC_DEVICENAME,aAC_VIEWSEQ,
        aAC_ACTYPE,aAC_ATTYPE,aAC_FDTYPE,aAC_PTTYPE,aLO_DONGCODE,aLO_FLOORCODE,
        aLO_AREACODE,aAC_LOCATEUSE,aAC_TOTWIDTH,aAC_TOTHEIGHT,aAC_CURX,aAC_CURY,
        aAC_LOCALRELAY,aAC_MCUIP,aAC_MCUPORT,aAC_MCUID,aAC_SUBNET,aAC_GATEWAY,
        aAC_CARDREADERTYPE,aAC_VER,aAC_FTPUSE,aAC_CONNECTED,aAC_LASTCONNECTED,
        aAC_NETTYPE,aAC_COMPORT,aAC_GUBUN,aSEND_ACK,aJavaraType:string
        ):Boolean;
    Function InsertIntoTB_ACCESSEVENT(
        aGROUP_CODE,aAC_DATE,aAC_TIME,aAC_NODENO,aAC_ECUID,aDO_DOORNO,aCA_CARDNO,
        aAC_READERNO,aAC_BUTTONNO,aAC_DOORPOSI,aAC_INPUTTYPE,aAC_DOORMODE,
        aAC_PERMITMODE,aPE_PERMITCODE,aAC_INSERTDATE,aAC_INSERTOPERATOR,aAC_MCUID:string):Boolean;
    Function InsertIntoTB_ALARMDEVICE(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aAL_ZONENUM,aAL_ZONENAME,aAL_LASTMODE,
        aAL_VIEWSEQ,aAC_MCUID,aAL_LOCATEUSE,aAL_TOTWIDTH,aAL_TOTHEIGHT,aAL_CURX,
        aAL_CURY,aLO_DONGCODE,aLO_FLOORCODE,aLO_AREACODE,aSEND_ACK:string):Boolean;
    Function InsertIntoTB_ALARMEVENT(
        aGROUP_CODE,aAL_DATE,aAL_TIME,aAC_NODENO,aAC_ECUID,aAL_MSGNO,
        aAL_ALARMDEVICETYPECODE,aAL_SUBADDR,aAL_ZONECODE,aAL_ALARMMODECODE,
        aAL_ZONENO,aAL_ZONESTATE,aAL_ALARMSTATUSCODE,aAL_ISALARM,aAL_OPERATOR,
        aAL_INPUTTIME,aAL_INPUTOPERATOR,aAL_CHECKOK,aAL_CHECKCODE,
        aAL_CHECKMSG,aAL_UPDATETIME,aAL_UPDATEOPERATOR:string):Boolean;
    Function InsertIntoTB_CARD(
        aGROUP_CODE,aCA_CARDNO,aCA_GUBUN,aCA_CARDTYPE,aCO_COMPANYCODE,
        aEM_CODE,aCA_LASTUSE,aCA_UPDATETIME,aCA_UPDATEOPERATOR,
        aCA_STATUS,aPOSITIONNUM:string ) : Boolean;
    Function InsertIntoTB_COMPANY(
        aGROUP_CODE,aCO_COMPANYCODE,aCO_JIJUMCODE,aCO_DEPARTCODE,aCO_NAME,
        aCO_GUBUN,aCO_CHARGE,aCO_TELNUM,aCO_UPDATECHECK:string):Boolean;
    Function InsertIntoTB_CONFIG(
        aGROUP_CODE,aco_configgroup,aco_configcode,aco_configvalue,aco_configdetail:string):Boolean;
    Function InsertIntoTB_DEVICECARDNO(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aCA_CARDNO,aDE_DOOR1,aDE_DOOR2,
        aDE_DOOR3,aDE_DOOR4,aDE_DOOR5,aDE_DOOR6,aDE_DOOR7,aDE_DOOR8,
        aDE_ARARM0,aDE_ARARM1,aDE_ARARM2,aDE_ARARM3,aDE_ARARM4,aDE_ARARM5,aDE_ARARM6,aDE_ARARM7,aDE_ARARM8,
        aDE_USEACCESS,aDE_USEALARM,aDE_TIMECODE,aDE_PERMIT,aDE_RCVACK,
        aDE_UPDATETIME,aDE_UPDATEOPERATOR,aAC_MCUID:string):Boolean;
    Function InsertIntoTB_DOOR(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aDO_DOORNO,aDO_DOORNONAME,
        aDO_LASTMODE,aAC_MCUID,aDO_VIEWSEQ,aDO_TOTWIDTH,aDO_TOTHEIGHT,
        aDO_CURX,aDO_CURY,aDO_LOCATEUSE,aLO_DONGCODE,aLO_FLOORCODE,
        aLO_AREACODE,aFPMS_ID,aDO_LOCALRELAY,aDO_STATEREVERSE,aRelay_Send,
        aDO_DOORTYPE,aDO_SCHUSE,aDO_CONTROLTIME,aDO_CARDREADERTYPE,
        aDO_MODE,aDO_FIRE,aDO_LASTSTATE,aDO_LASTPOSI,aSEND_ACK,aFDMS_ID,
        aFDMS_RELAY:string):Boolean;
    Function InsertIntoTB_EMPHIS(
        aGROUP_CODE,aCO_COMPANYCODE,aEM_CODE,aFDMS_ID,aMODE,aSEND_STATUS,
        aCA_CARDNO,aCA_CARDTYPE,aSEND_STATUS2,aEH_INSERTTIME:string):Boolean;
    Function InsertIntoTB_EMPLOYEE(
        aGROUP_CODE,aCO_COMPANYCODE,aEM_CODE,aCO_JIJUMCODE,aCO_DEPARTCODE,
        aPO_POSICODE,aEM_NAME,aEM_COPHONE,aEM_HOMEPHONE,aEM_HANDPHONE,
        aZI_ZIPCODE,aEM_ADDR1,aEM_ADDR2,aEM_JOINDATE,aEM_RETIREDATE,aEM_PASS,
        aAT_ATCODE,aEM_UPDATETIME,aEM_UPDATEOPERATOR,aFDMS_ID,aFDMS_RELAY,
        aRG_CODE:string):Boolean;
    Function InsertIntoTB_KTCARDISSUE(
        aGROUP_CODE,aEM_CODE,aCARD_SEQ:string):Boolean;
    Function InsertIntoTB_LOCATION(
        aGROUP_CODE,aLO_DONGCODE,aLO_FLOORCODE,aLO_AREACODE,
        aLO_NAME,aLO_GUBUN:string):Boolean;
    Function InsertIntoTB_POSI(
        aGROUP_CODE,aCO_COMPANYCODE,aPO_POSICODE,aPO_NAME,aPO_UPDATECHECK:string):Boolean;
    Function InsertIntoTB_READER(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aRE_READERNO,aDO_DOORNO,
        aRE_USE,aSEND_ACK:string):Boolean;
    Function InsertIntoTB_ZONEDEVICE(
        aGROUP_CODE,aAC_NODENO,aAC_ECUID,aAL_ZONENUM,aAL_ZONENAME,
        aAL_LOCATEUSE,aAL_TOTWIDTH,aAL_TOTHEIGHT,aAL_CURX,aAL_CURY,
        aLO_DONGCODE,aLO_FLOORCODE,aLO_AREACODE,aAL_ZONETYPE,
        aAL_WATCHTYPE,aSEND_ACK,aAL_ZONEUSE,aAL_ZONESTOP:string):Boolean;
    Function InsertIntoTB_DEVICESCHEDULE(aGROUP_CODE,aAC_NODENO,aAC_ECUID,
        aDO_DOORNO,aDE_DAYCODE,aDE_CELL1TIME,aDE_CELL1MODE,aDE_CELL2TIME,aDE_CELL2MODE,
        aDE_CELL3TIME,aDE_CELL3MODE,aDE_CELL4TIME,aDE_CELL4MODE,aDE_CELL5TIME,aDE_CELL5MODE,
        aDE_UPDATETIME,aDE_UPDATEOPERATOR,aDE_RCVACK,aAC_MCUID:string):Boolean;
    Function TargetTableDelete(aTableName:string):Boolean;

    Function CheckTB_ACCESSEVENT_RELAY:Boolean;
    Function CheckTB_ALARMEVENT_RELAY:Boolean;
    Function CheckTB_ATEVENT_RELAY:Boolean;
    Function CheckTB_FOODEVENT_RELAY:Boolean;
    Function CheckTB_CARD_RELAY:Boolean;
    Function CheckTB_EMPHIS_RELAY:Boolean;
    Function AlterTB_ACCESSEVENT_RELAY:Boolean;
    Function AlterTB_ALARMEVENT_RELAY:Boolean;
    Function AlterTB_ATEVENT_RELAY:Boolean;
    Function AlterTB_FOODEVENT_RELAY:Boolean;
    Function AlterTB_CARD_RELAY:Boolean;
    Function AlterTB_EMPHIS_RELAY:Boolean;
    Function AlterTB_EMPLOYEE_RELAY:Boolean;
    Function AlterTB_DEVICECARDNO_RELAY:Boolean;
    Function TableVersionInitialize:Boolean;
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

procedure TForm1.rg_orgDBTypeClick(Sender: TObject);
begin
  if rg_orgDBType.ItemIndex = 0 then
  begin
    ed_orgDBPort.Text := '1433';
    ed_orgDBPort.Visible := True;
    ed_orgUserName.Text := 'sa';
    ed_orgUserPw.Text := 'sapasswd123@@';
  end else
  begin
    ed_orgDBPort.Text := '5432';
    ed_orgDBPort.Visible := False;
    ed_orgUserName.Text := 'postgres';
    ed_orgUserPw.Text := 'postgres';
  end;
end;

procedure TForm1.rg_targetDBTypeClick(Sender: TObject);
begin
  if rg_targetDBType.ItemIndex = 0 then
  begin
    ed_targetDBPort.Text := '1433';
    ed_targetDBPort.Visible := True;
    ed_targetUserName.Text := 'sa';
    ed_targetUserPw.Text := 'sapasswd123@@';
  end else
  begin
    ed_targetDBPort.Text := '5432';
    ed_targetDBPort.Visible := False;
    ed_targetUserName.Text := 'postgres';
    ed_targetUserPw.Text := 'postgres';
  end;

end;

procedure TForm1.btn_ConversionClick(Sender: TObject);
begin
  if Not isDigit(ed_NodeNo.Text) then
  begin
    showmessage('기기번호 증가는 숫자만 입력 가능합니다.');
    Exit;
  end;
  L_IncNodeNo := strtoint(ed_NodeNo.Text);
  if chk_Company.Checked then
  begin
    if Not isDigit(ed_CompanyCode.Text) then
    begin
      showmessage('회사코드는 숫자만 입력 가능합니다.');
      Exit;
    end;
    L_stCompanyCode := FillZeroNumber(strtoint(ed_CompanyCode.Text),3);
  end;
  if Not isDigit(ed_jijumcode.Text) then
  begin
    showmessage('지점코드 증가는 숫자만 가능합니다.');
    Exit;
  end;
  L_incJijumCode := strtoint(ed_jijumcode.Text);
  
  if chk_Building.Checked then
  begin
    if Not isDigit(ed_BuildingCode.Text) then
    begin
      showmessage('빌딩코드는 숫자만 입력 가능합니다.');
      Exit;
    end;
    L_stBuildingCode := FillZeroNumber(strtoint(ed_BuildingCode.Text),3);
  end;
  if Not OrgAdoConnect then
  begin
    showmessage('원본데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;
  if Not targetAdoConnect then
  begin
    showmessage('타겟데이터베이스 접속환경을 확인하세요.');
    Exit;
  end;

  if (Application.MessageBox(PChar('타겟테이블의 기존 정보가 모두 삭제됩니다.계속하시겠습니까?'),'경고',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  btn_Conversion.Enabled := False;
  L_bStop := False;
  btnStop.Enabled := True;
  AlterTB_ACCESSDEVICE_NameChange;
  AlterTB_ACCESSDEVICE_JAVARATypeAdd;
  AlterTB_ACCESSDEVICE_MCUIDChange;
  AlterTB_ACCESSDEVICE_CARDREADERTYPEChange;
  AlterTB_ALARMDEVICE_INDEXChange;


  if cmb_table.ItemIndex = 0 then AllTableConvert
  else if cmb_table.ItemIndex = 1 then TB_ACCESSDEVICEConvert
  else if cmb_table.ItemIndex = 2 then TB_ACCESSEVENTConvert
  else if cmb_table.ItemIndex = 3 then TB_ALARMDEVICEConvert
  else if cmb_table.ItemIndex = 4 then TB_ALARMEVENTConvert
  else if cmb_table.ItemIndex = 5 then TB_CARDConvert
  else if cmb_table.ItemIndex = 6 then TB_COMPANYConvert
  else if cmb_table.ItemIndex = 7 then TB_CONFIGConvert
  else if cmb_table.ItemIndex = 8 then TB_DEVICECARDNOConvert
  else if cmb_table.ItemIndex = 9 then TB_DOORConvert
  else if cmb_table.ItemIndex = 10 then TB_EMPHISConvert
  else if cmb_table.ItemIndex = 11 then TB_EMPLOYEEConvert
  else if cmb_table.ItemIndex = 12 then TB_KTCARDISSUEConvert
  else if cmb_table.ItemIndex = 13 then TB_LOCATIONConvert
  else if cmb_table.ItemIndex = 14 then TB_POSIConvert
  else if cmb_table.ItemIndex = 15 then TB_READERConvert
  else if cmb_table.ItemIndex = 16 then TB_ZONEDEVICEConvert
  else if cmb_table.ItemIndex = 17 then TB_ATEVENTConvert
  else if cmb_table.ItemIndex = 18 then tb_atmonthextraConvert
  else if cmb_table.ItemIndex = 19 then tb_atmonthsummaryConvert
  else if cmb_table.ItemIndex = 20 then tb_foodeventConvert
  else if cmb_table.ItemIndex = 21 then TB_DEVICESCHEDULEConvert
  else if cmb_table.ItemIndex = 22 then TB_ARMAREAConvert
  ;
  btn_Conversion.Enabled := True;
  btnStop.Enabled := False;


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
  stHost  := ed_orgDBIP.Text;
  stPort := ed_orgDBPort.Text;
  stuserID := ed_orgUserName.Text;
  stuserPW := ed_orgUserPw.Text;  //saPasswd
  stDBName := ed_orgDBName.Text;
  if rg_orgDBType.ItemIndex = 0 then
  begin
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + stuserPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + stuserID + ';';
    conStr := constr + 'Initial Catalog=' + stDBName + ';';
    conStr := constr + 'Data Source=' + stHost  + ',' + stPort;
  end else if rg_orgDBType.ItemIndex = 1 then
  begin
    conStr := 'Provider=PostgreSQL OLE DB Provider;';
    conStr := constr + 'Data Source=' + stHost + ';'   ;
    conStr := constr + 'location=' + stDBName + ';';
    conStr := constr + 'User Id='+ stuserID + ';';
    conStr := constr + 'password=' + stuserPW;
//    conStr := 'Driver={PostgreSQL};';
//    conStr := constr + 'Server=' + stHost +  ';'   ;
//    conStr := constr + 'Port=' + stPort +  ';'   ;
//    conStr := constr + 'Database=' + stDBName + ';';
//    conStr := constr + 'User Id='+ stuserID + ';';
//    conStr := constr + 'password=' + stuserPW;
  end else if rg_orgDBType.ItemIndex = 2 then  //MDBFile
  begin
    conStr := 'Provider=Microsoft.Jet.OLEDB.4.0;';
    conStr := conStr + 'Data Source=' + ExtractFileDir(Application.ExeName) + '\ZMOS.mdb' + ';';
    conStr := conStr + 'Persist Security Info=True;';
    conStr := conStr + 'Jet OLEDB:Database ';
  end;
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

function TForm1.AllTableConvert: Boolean;
begin
  Gauge1.MaxValue := 18;
  Gauge1.Progress := 0;
  TB_ACCESSDEVICEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_ACCESSEVENTConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_ALARMDEVICEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_ALARMEVENTConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_CARDConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_COMPANYConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_CONFIGConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_DEVICECARDNOConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_DOORConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_EMPHISConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_EMPLOYEEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_KTCARDISSUEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_LOCATIONConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_POSIConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_READERConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_ZONEDEVICEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_DEVICESCHEDULEConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TB_ARMAREAConvert;
  Gauge1.Progress := Gauge1.Progress + 1;
  TableVersionInitialize;
end;

function TForm1.TB_ACCESSDEVICEConvert: Boolean;
var
  stSql : string;
  nViewSeq : integer;
  nTotWith : integer;
  nTotHeigh : integer;
  nCurX : integer;
  nCurY : integer;
  nDaemonGubun : integer;
  stBuildingCode : string;
  stFloorCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_ACCESSDEVICE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_ACCESSDEVICE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      nViewSeq := 0;
      nTotWith := 0;
      nTotHeigh := 0;
      nCurX := 0;
      nCurY := 0;
      nDaemonGubun := 0;

      stBuildingCode := FindField('LO_DONGCODE').AsString;
      if chk_Building.Checked then
        stBuildingCode := L_stBuildingCode;
      stFloorCode := FindField('LO_FLOORCODE').AsString;
      if chk_Floor.Checked then stFloorCode := L_stFloorCode;

      if not FindField('AC_VIEWSEQ').IsNull then
        nViewSeq := FindField('AC_VIEWSEQ').AsInteger;
      if not FindField('AC_TOTWIDTH').IsNull then
        nTotWith := FindField('AC_TOTWIDTH').AsInteger;
      if not FindField('AC_TOTHEIGHT').IsNull then
        nTotHeigh := FindField('AC_TOTHEIGHT').AsInteger;
      if not FindField('AC_CURX').IsNull then
        nCurX := FindField('AC_CURX').AsInteger;
      if not FindField('AC_CURY').IsNull then
        nCurY := FindField('AC_CURY').AsInteger;

      (*Try
        if not FindField('AC_DAEMONGUBUN').IsNull then
          nDaemonGubun := FindField('AC_DAEMONGUBUN').AsInteger;
      Except
      End;    *)

      InsertIntoTB_ACCESSDEVICE(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('AC_DEVICENAME').AsString,
        inttostr(nViewSeq),
        FindField('AC_ACTYPE').AsString,
        FindField('AC_ATTYPE').AsString,
        FindField('AC_FDTYPE').AsString,
        FindField('AC_PTTYPE').AsString,
        stBuildingCode,
        stFloorCode,
        FindField('LO_AREACODE').AsString,
        FindField('AC_LOCATEUSE').AsString,
        inttostr(nTotWith),
        inttostr(nTotHeigh),
        inttostr(nCurX),
        inttostr(nCurY),
        FindField('AC_LOCALRELAY').AsString,
        FindField('AC_MCUIP').AsString,
        FindField('AC_MCUPORT').AsString,
        FindField('AC_MCUID').AsString,
        FindField('AC_SUBNET').AsString,
        FindField('AC_GATEWAY').AsString,
        FindField('AC_CARDREADERTYPE').AsString,
        FindField('AC_VER').AsString,
        FindField('AC_FTPUSE').AsString,
        FindField('AC_CONNECTED').AsString,
        FindField('AC_LASTCONNECTED').AsString,
        FindField('AC_NETTYPE').AsString,
        FindField('AC_COMPORT').AsString,
        FindField('AC_GUBUN').AsString,
        FindField('SEND_ACK').AsString,
        FindField('AC_JAVARATYPE').AsString
        );
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_ACCESSEVENTConvert: Boolean;
var
  stSql : string;
  nStartPoint,nEndPoint : integer;
  i : integer;
  nLoopCount : integer;
begin
  if rg_orgDBType.ItemIndex = 2 then Exit;
  result := False;
  //if Not CheckTB_ACCESSEVENT_RELAY then
  //begin
    if Not AlterTB_ACCESSEVENT_RELAY then
    begin
    //  showmessage('TB_ACCESSEVENT 테이블 AC_RELAY 필드 추가 실패');
    //  Exit;
    end;
  //end; }
  lb_table.Caption := 'TB_ACCESSEVENT';
  //TargetTableDelete(lb_table.Caption);
  stSql := 'Update TB_ACCESSEVENT set AC_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;

  stSql := 'select count(*) as cnt from TB_ACCESSEVENT ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := FindField('cnt').AsInteger;

    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      if(L_bStop) then Exit;
      nStartPoint := i * 1000;
      nEndPoint := ((i+1) * 1000) - 1;
      if nStartPoint > FindField('cnt').AsInteger then break;
      if nEndPoint > FindField('cnt').AsInteger then nEndPoint := FindField('cnt').AsInteger;
      TB_ACCESSEVENTConvertProcess(nStartPoint,nEndPoint);
      if rg_orgDBType.ItemIndex = 0 then Break;
    end;


  end;
  result := True;
end;

function TForm1.TB_ALARMDEVICEConvert: Boolean;
var
  stSql : string;
  nViewSeq : integer;
  nTotWith : integer;
  nTotHeigh : integer;
  nCurX : integer;
  nCurY : integer;
  nOutDelay : integer;
  nInDelay : integer;
  nRemoteRingCnt : integer;
  stBuildingCode : string;
  stFloorCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_ALARMDEVICE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_ALARMDEVICE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      nViewSeq := 0;
      nTotWith := 0;
      nTotHeigh := 0;
      nCurX := 0;
      nCurY := 0;
      nOutDelay := 0;
      nInDelay := 0;
      nRemoteRingCnt := 0;
      stBuildingCode := FindField('LO_DONGCODE').AsString;
      if chk_Building.Checked then
        stBuildingCode := L_stBuildingCode;
      stFloorCode := FindField('LO_FLOORCODE').AsString;
      if chk_Floor.Checked then stFloorCode := L_stFloorCode;

      if not FindField('AL_VIEWSEQ').IsNull then
        nViewSeq := FindField('AL_VIEWSEQ').AsInteger;
      if not FindField('AL_TOTWIDTH').IsNull then
        nTotWith := FindField('AL_TOTWIDTH').AsInteger;
      if not FindField('AL_TOTHEIGHT').IsNull then
        nTotHeigh := FindField('AL_TOTHEIGHT').AsInteger;
      if not FindField('AL_CURX').IsNull then
        nCurX := FindField('AL_CURX').AsInteger;
      if not FindField('AL_CURY').IsNull then
        nCurY := FindField('AL_CURY').AsInteger;
      InsertIntoTB_ALARMDEVICE(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('AL_ZONENUM').AsString,
        FindField('AL_ZONENAME').AsString,
        FindField('AL_LASTMODE').AsString,
        inttostr(nViewSeq),
        FindField('AC_MCUID').AsString,
        FindField('AL_LOCATEUSE').AsString,
        inttostr(nTotWith),
        inttostr(nTotHeigh),
        inttostr(nCurX),
        inttostr(nCurY),
        stBuildingCode,
        stFloorCode,
        FindField('LO_AREACODE').AsString,
        FindField('SEND_ACK').AsString
        );
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_ALARMEVENTConvert: Boolean;
var
  stSql : string;
  i : integer;
  nLoopCount : integer;
begin
  if rg_orgDBType.ItemIndex = 2 then Exit;
  result := False;
  //if Not CheckTB_ALARMEVENT_RELAY then
  //begin
    if Not AlterTB_ALARMEVENT_RELAY then
    begin
      //showmessage('TB_ALARMEVENT 테이블 AL_RELAY 필드 추가 실패');
      //Exit;
    end;
  //end;
  lb_table.Caption := 'TB_ALARMEVENT';
  stSql := 'Update TB_ALARMEVENT set AC_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;
  //TargetTableDelete(lb_table.Caption);
  stSql := 'select count(*) as cnt from TB_ALARMEVENT ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := findField('cnt').AsInteger;
    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      if (i * 1000) > FindField('cnt').AsInteger then break;
      TB_ALARMEVENTConvertProcess;
    end;

  end;
  result := True;
end;

function TForm1.TB_CARDConvert: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  nLoopCount : integer;
  i : integer;
  nStartPoint : integer;
  nEndPoint : integer;
begin
  result := False;
  //if Not CheckTB_CARD_RELAY then
  //begin
    if Not AlterTB_CARD_RELAY then
    begin
    //  showmessage('TB_CARD 테이블 CA_RELAY 필드 추가 실패');
    //  Exit;
    end;
  stSql := 'Update TB_CARD set CA_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;
  //end;
  lb_table.Caption := 'TB_CARD';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select count(*) as cnt from TB_CARD ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := FindField('cnt').AsInteger;

    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      nStartPoint := i * 1000;
      nEndPoint := ((i+1) * 1000) - 1;
      if nStartPoint > FindField('cnt').AsInteger then break;
      if nEndPoint > FindField('cnt').AsInteger then nEndPoint := FindField('cnt').AsInteger;
      TB_CARDConvertProcess(nStartPoint,nEndPoint);
      //if rg_orgDBType.ItemIndex = 0 then Break;
    end;


  end;
  result := True;

{  stSql := 'select * from TB_CARD ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;

      InsertIntoTB_CARD(
        FindField('GROUP_CODE').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('CA_GUBUN').AsString,
        FindField('CA_CARDTYPE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        FindField('CA_LASTUSE').AsString,
        FindField('CA_UPDATETIME').AsString,
        FindField('CA_UPDATEOPERATOR').AsString,
        FindField('CA_STATUS').AsString,
        FindField('POSITIONNUM').AsString
        );
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;   }
end;

function TForm1.TB_COMPANYConvert: Boolean;
var
  stSql : string;
  stCompanyCode : string;
  stJijumCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_COMPANY';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_COMPANY ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      stJijumCode := FindField('CO_JIJUMCODE').AsString;
      if isDigit(stJijumCode) then
      begin
        stJijumCode := FillZeroNumber(strtoint(stJijumCode) + L_incJijumCode,3);
      end;

      InsertIntoTB_COMPANY(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        stJijumCode,
        FindField('CO_DEPARTCODE').AsString,
        FindField('CO_NAME').AsString,
        FindField('CO_GUBUN').AsString,
        FindField('CO_CHARGE').AsString,
        FindField('CO_TELNUM').AsString,
        FindField('CO_UPDATECHECK').AsString);
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_CONFIGConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'TB_CONFIG';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_CONFIG ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntoTB_CONFIG(
        FindField('GROUP_CODE').AsString,
        FindField('co_configgroup').AsString,
        FindField('co_configcode').AsString,
        FindField('co_configvalue').AsString,
        FindField('co_configdetail').AsString);
      Gauge2.Progress := Gauge2.Progress + 1;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_DEVICECARDNOConvert: Boolean;
var
  stSql : string;
  nLoopCount : integer;
  nStartPoint : integer;
  nEndPoint : integer;
  i : integer;
begin
  result := False;
  //if Not CheckTB_CARD_RELAY then
  //begin
    if Not AlterTB_DEVICECARDNO_RELAY then
    begin
    //  showmessage('TB_CARD 테이블 CA_RELAY 필드 추가 실패');
    //  Exit;
    end;
  //end;
  lb_table.Caption := 'TB_DEVICECARDNO';
  TargetTableDelete(lb_table.Caption);
  stSql := 'Update TB_DEVICECARDNO set DC_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;

  stSql := 'select count(*) as cnt from TB_DEVICECARDNO ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := FindField('cnt').AsInteger;

    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      if(L_bStop) then Exit;
      nStartPoint := i * 1000;
      nEndPoint := ((i+1) * 1000) - 1;
      if nStartPoint > FindField('cnt').AsInteger then break;
      if nEndPoint > FindField('cnt').AsInteger then nEndPoint := FindField('cnt').AsInteger;
      TB_DEVICECARDNOConvertProcess(nStartPoint,nEndPoint);
      //if rg_orgDBType.ItemIndex = 0 then Break;
    end;


  end;
  result := True;

{


  stSql := 'select * from TB_DEVICECARDNO ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      InsertIntoTB_DEVICECARDNO(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('DE_DOOR1').AsString,
        FindField('DE_DOOR2').AsString,
        FindField('DE_USEACCESS').AsString,
        FindField('DE_USEALARM').AsString,
        FindField('DE_TIMECODE').AsString,
        FindField('DE_PERMIT').AsString,
        FindField('DE_RCVACK').AsString,
        FindField('DE_UPDATETIME').AsString,
        FindField('DE_UPDATEOPERATOR').AsString,
        FindField('AC_MCUID').AsString);
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;   }
end;

function TForm1.TB_DOORConvert: Boolean;
var
  stSql : string;
  nViewSeq : integer;
  nTotWith :integer;
  nTotHeigh :integer;
  nCurX :integer;
  nCurY :integer;
  nFpmsid : integer;
  stControlTime :string;
  nFdmsId : integer;
  stBuildingCode : string;
  stFloorCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_DOOR';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_DOOR ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      nViewSeq := 0;
      nTotWith := 0;
      nTotHeigh := 0;
      nCurX := 0;
      nCurY := 0;
      nFpmsid := 0;
      stControlTime := '0';
      nFdmsId := 0;

      stBuildingCode := FindField('LO_DONGCODE').AsString;
      if chk_Building.Checked then
        stBuildingCode := L_stBuildingCode;
      stFloorCode := FindField('LO_FLOORCODE').AsString;
      if chk_Floor.Checked then stFloorCode := L_stFloorCode;

      if not FindField('DO_VIEWSEQ').IsNull then
        nViewSeq := FindField('DO_VIEWSEQ').AsInteger;
      if not FindField('DO_TOTWIDTH').IsNull then
        nTotWith := FindField('DO_TOTWIDTH').AsInteger;
      if not FindField('DO_TOTHEIGHT').IsNull then
        nTotHeigh := FindField('DO_TOTHEIGHT').AsInteger;
      if not FindField('DO_CURX').IsNull then
        nCurX := FindField('DO_CURX').AsInteger;
      if not FindField('DO_CURY').IsNull then
        nCurY := FindField('DO_CURY').AsInteger;
      if not FindField('FPMS_ID').IsNull then
        nFpmsid := FindField('FPMS_ID').AsInteger;
      if not FindField('DO_CONTROLTIME').IsNull then
        stControlTime := FindField('DO_CONTROLTIME').asString;
      if not FindField('FDMS_ID').IsNull then
        nFdmsId := FindField('FDMS_ID').AsInteger;
      InsertIntoTB_DOOR(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('DO_DOORNO').AsString,
        FindField('DO_DOORNONAME').AsString,
        FindField('DO_LASTMODE').AsString,
        FindField('AC_MCUID').AsString,
        inttostr(nViewSeq),
        inttostr(nTotWith),
        inttostr(nTotHeigh),
        inttostr(nCurX),
        inttostr(nCurY),
        FindField('DO_LOCATEUSE').AsString,
        stBuildingCode,
        stFloorCode,
        FindField('LO_AREACODE').AsString,
        inttostr(nFpmsid),
        FindField('DO_LOCALRELAY').AsString,
        FindField('DO_STATEREVERSE').AsString,
        FindField('Relay_Send').AsString,
        FindField('DO_DOORTYPE').AsString,
        FindField('DO_SCHUSE').AsString,
        stControlTime,
        FindField('DO_CARDREADERTYPE').AsString,
        FindField('DO_MODE').AsString,
        FindField('DO_FIRE').AsString,
        FindField('DO_LASTSTATE').AsString,
        FindField('DO_LASTPOSI').AsString,
        FindField('SEND_ACK').AsString,
        inttostr(nFdmsId),
        FindField('FDMS_RELAY').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_EMPHISConvert: Boolean;
var
  stSql : string;
  nFdmsId : integer;
  stCompanyCode : string;
  nLoopCount : integer;
  i : integer;
  nStartPoint : integer;
  nEndPoint : integer;
begin
  result := False;
  //if Not CheckTB_EMPHIS_RELAY then
  //begin
    if Not AlterTB_EMPHIS_RELAY then
    begin
      //showmessage('TB_EMPHIS 테이블 EH_RELAY 필드 추가 실패');
      //Exit;
    end;
  //end;
  lb_table.Caption := 'TB_EMPHIS';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select count(*) as cnt from TB_EMPHIS ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := FindField('cnt').AsInteger;

    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      nStartPoint := i * 1000;
      nEndPoint := ((i+1) * 1000) - 1;
      if nStartPoint > FindField('cnt').AsInteger then break;
      if nEndPoint > FindField('cnt').AsInteger then nEndPoint := FindField('cnt').AsInteger;
      TB_EMPHISConvertProcess(nStartPoint,nEndPoint);
      if rg_orgDBType.ItemIndex = 0 then Break;
    end;


  end;
  result := True;

{  stSql := 'select * from TB_EMPHIS order by  SEQ ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      nFdmsId := 0;
      if not FindField('FDMS_ID').IsNull then
        nFdmsId := FindField('FDMS_ID').AsInteger;
      InsertIntoTB_EMPHIS(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        inttostr(nFdmsId),
        FindField('MODE').AsString,
        FindField('SEND_STATUS').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('CA_CARDTYPE').AsString,
        FindField('SEND_STATUS2').AsString,
        FindField('EH_INSERTTIME').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;  }
end;

function TForm1.TB_EMPLOYEEConvert: Boolean;
var
  stSql : string;
  nFdmsId :integer;
  stCompanyCode : string;
  stJijumCode : string;
  nLoopCount : integer;
  i : integer;
  nStartPoint : integer;
  nEndPoint : integer;
begin
  result := False;
  //if Not CheckTB_EMPLOYEE_RELAY then
  //begin
    if Not AlterTB_EMPLOYEE_RELAY then
    begin
      //showmessage('TB_EMPHIS 테이블 EH_RELAY 필드 추가 실패');
      //Exit;
    end;
  //end;
  lb_table.Caption := 'TB_EMPLOYEE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'Update TB_EMPLOYEE set EM_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;
  stSql := 'select count(*) as cnt from TB_EMPLOYEE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := FindField('cnt').AsInteger;

    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      nStartPoint := i * 1000;
      nEndPoint := ((i+1) * 1000) - 1;
      if nStartPoint > FindField('cnt').AsInteger then break;
      if nEndPoint > FindField('cnt').AsInteger then nEndPoint := FindField('cnt').AsInteger;
      TB_EMPLOYEEConvertProcess(nStartPoint,nEndPoint);
      //if rg_orgDBType.ItemIndex = 0 then Break;
    end;

  end;
  result := True;


{
  stSql := 'select * from TB_EMPLOYEE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      stJijumCode := FindField('CO_JIJUMCODE').AsString;
      if isDigit(stJijumCode) then
      begin
        stJijumCode := FillZeroNumber(strtoint(stJijumCode) + L_incJijumCode,3);
      end;
      nFdmsId := 0;
      if not FindField('FDMS_ID').IsNull then
        nFdmsId := FindField('FDMS_ID').AsInteger;
      InsertIntoTB_EMPLOYEE(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        stJijumCode,
        FindField('CO_DEPARTCODE').AsString,
        FindField('PO_POSICODE').AsString,
        FindField('EM_NAME').AsString,
        FindField('EM_COPHONE').AsString,
        FindField('EM_HOMEPHONE').AsString,
        FindField('EM_HANDPHONE').AsString,
        FindField('ZI_ZIPCODE').AsString,
        FindField('EM_ADDR1').AsString,
        FindField('EM_ADDR2').AsString,
        FindField('EM_JOINDATE').AsString,
        FindField('EM_RETIREDATE').AsString,
        FindField('EM_PASS').AsString,
        FindField('AT_ATCODE').AsString,
        FindField('EM_UPDATETIME').AsString,
        FindField('EM_UPDATEOPERATOR').AsString,
        inttostr(nFdmsId),
        FindField('FDMS_RELAY').AsString,
        FindField('RG_CODE').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True; }
end;

function TForm1.TB_KTCARDISSUEConvert: Boolean;
var
  stSql : string;
  nCardSeq : integer;
begin
  result := False;
  lb_table.Caption := 'TB_KTCARDISSUE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_KTCARDISSUE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      nCardSeq := 0;
      if not FindField('CARD_SEQ').IsNull then
        nCardSeq := FindField('CARD_SEQ').AsInteger;
      InsertIntoTB_KTCARDISSUE(
        FindField('GROUP_CODE').AsString,
        FindField('EM_CODE').AsString,
        inttostr(nCardSeq));

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_LOCATIONConvert: Boolean;
var
  stSql : string;
  stBuildingCode : string;
  stFloorCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_LOCATION';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_LOCATION ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      stBuildingCode := FindField('LO_DONGCODE').AsString;
      if chk_Building.Checked then
        stBuildingCode := L_stBuildingCode;
      stFloorCode := FindField('LO_FLOORCODE').AsString;
      if chk_Floor.Checked then stFloorCode := L_stFloorCode;

      InsertIntoTB_LOCATION(
        FindField('GROUP_CODE').AsString,
        stBuildingCode,
        stFloorCode,
        FindField('LO_AREACODE').AsString,
        FindField('LO_NAME').AsString,
        FindField('LO_GUBUN').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_POSIConvert: Boolean;
var
  stSql : string;
  stCompanyCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_POSI';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_POSI ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;

      InsertIntoTB_POSI(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        FindField('PO_POSICODE').AsString,
        FindField('PO_NAME').AsString,
        FindField('PO_UPDATECHECK').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_READERConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'TB_READER';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_READER ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntoTB_READER(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('RE_READERNO').AsString,
        FindField('DO_DOORNO').AsString,
        FindField('RE_USE').AsString,
        FindField('SEND_ACK').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.TB_ZONEDEVICEConvert: Boolean;
var
  stSql : string;
  nTotWith :integer;
  nTotHeigh :integer;
  nCurX :integer;
  nCurY :integer;
  stBuildingCode : string;
  stFloorCode : string;
begin
  result := False;
  lb_table.Caption := 'TB_ZONEDEVICE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_ZONEDEVICE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      nTotWith := 0;
      nTotHeigh := 0;
      nCurX := 0;
      nCurY := 0;
      stBuildingCode := FindField('LO_DONGCODE').AsString;
      if chk_Building.Checked then
        stBuildingCode := L_stBuildingCode;
      stFloorCode := FindField('LO_FLOORCODE').AsString;
      if chk_Floor.Checked then stFloorCode := L_stFloorCode;

      if not FindField('AL_TOTWIDTH').IsNull then
        nTotWith := FindField('AL_TOTWIDTH').AsInteger;
      if not FindField('AL_TOTHEIGHT').IsNull then
        nTotHeigh := FindField('AL_TOTHEIGHT').AsInteger;
      if not FindField('AL_CURX').IsNull then
        nCurX := FindField('AL_CURX').AsInteger;
      if not FindField('AL_CURY').IsNull then
        nCurY := FindField('AL_CURY').AsInteger;

      InsertIntoTB_ZONEDEVICE(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('AL_ZONENUM').AsString,
        FindField('AL_ZONENAME').AsString,
        FindField('AL_LOCATEUSE').AsString,
        inttostr(nTotWith),
        inttostr(nTotHeigh),
        inttostr(nCurX),
        inttostr(nCurY),
        stBuildingCode,
        stFloorCode,
        FindField('LO_AREACODE').AsString,
        FindField('AL_ZONETYPE').AsString,
        FindField('AL_WATCHTYPE').AsString,
        FindField('SEND_ACK').AsString,
        FindField('AL_ZONEUSE').AsString,
        FindField('AL_ZONESTOP').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_ACCESSDEVICE(aGROUP_CODE, aAC_NODENO,
  aAC_ECUID, aAC_DEVICENAME, aAC_VIEWSEQ, aAC_ACTYPE, aAC_ATTYPE,
  aAC_FDTYPE, aAC_PTTYPE, aLO_DONGCODE, aLO_FLOORCODE, aLO_AREACODE,
  aAC_LOCATEUSE, aAC_TOTWIDTH, aAC_TOTHEIGHT, aAC_CURX, aAC_CURY,
  aAC_LOCALRELAY, aAC_MCUIP, aAC_MCUPORT, aAC_MCUID, aAC_SUBNET,
  aAC_GATEWAY, aAC_CARDREADERTYPE, aAC_VER, aAC_FTPUSE, aAC_CONNECTED,
  aAC_LASTCONNECTED, aAC_NETTYPE, aAC_COMPORT, aAC_GUBUN, aSEND_ACK,aJavaraType: string): Boolean;
var
  stSql : string;
begin
  if Trim(aAC_TOTWIDTH) = '' then aAC_TOTWIDTH := '0';
  if Trim(aAC_TOTHEIGHT) = '' then aAC_TOTHEIGHT := '0';
  if Trim(aAC_CURX) = '' then aAC_CURX := '0';
  if Trim(aAC_CURY) = '' then aAC_CURY := '0';

  stSql := ' Insert Into TB_ACCESSDEVICE( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_DEVICENAME,';
  stSql := stSql + 'AC_VIEWSEQ,';
  stSql := stSql + 'AC_ACTYPE,';
  stSql := stSql + 'AC_ATTYPE,';
  stSql := stSql + 'AC_FDTYPE,';
  stSql := stSql + 'AC_PTTYPE,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AC_LOCATEUSE,';
  stSql := stSql + 'AC_TOTWIDTH,';
  stSql := stSql + 'AC_TOTHEIGHT,';
  stSql := stSql + 'AC_CURX,';
  stSql := stSql + 'AC_CURY,';
  stSql := stSql + 'AC_LOCALRELAY,';
  stSql := stSql + 'AC_MCUIP,';
  stSql := stSql + 'AC_MCUPORT,';
  stSql := stSql + 'AC_MCUID,';
  stSql := stSql + 'AC_SUBNET,';
  stSql := stSql + 'AC_GATEWAY,';
  stSql := stSql + 'AC_CARDREADERTYPE,';
  stSql := stSql + 'AC_VER,';
  stSql := stSql + 'AC_FTPUSE,';
  stSql := stSql + 'AC_CONNECTED,';
  stSql := stSql + 'AC_LASTCONNECTED,';
  stSql := stSql + 'AC_NETTYPE,';
  stSql := stSql + 'AC_COMPORT,';
  stSql := stSql + 'AC_GUBUN,';
  stSql := stSql + 'AC_JAVARATYPE,';
  stSql := stSql + 'SEND_ACK) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aAC_DEVICENAME + ''',';
  stSql := stSql + '''' + aAC_VIEWSEQ + ''',';
  stSql := stSql + '''' + aAC_ACTYPE + ''',';
  stSql := stSql + '''' + aAC_ATTYPE + ''',';
  stSql := stSql + '''' + aAC_FDTYPE + ''',';
  stSql := stSql + '''' + aAC_PTTYPE + ''',';
  stSql := stSql + '''' + aLO_DONGCODE + ''',';
  stSql := stSql + '''' + aLO_FLOORCODE + ''',';
  stSql := stSql + '''' + aLO_AREACODE + ''',';
  stSql := stSql + '''' + aAC_LOCATEUSE + ''',';
  stSql := stSql + '' + aAC_TOTWIDTH + ',';
  stSql := stSql + '' + aAC_TOTHEIGHT + ',';
  stSql := stSql + '' + aAC_CURX + ',';
  stSql := stSql + '' + aAC_CURY + ',';
  stSql := stSql + '''' + aAC_LOCALRELAY + ''',';
  stSql := stSql + '''' + aAC_MCUIP + ''',';
  stSql := stSql + '''' + aAC_MCUPORT + ''',';
  stSql := stSql + '''' + aAC_MCUID + ''',';
  stSql := stSql + '''' + aAC_SUBNET + ''',';
  stSql := stSql + '''' + aAC_GATEWAY + ''',';
  stSql := stSql + '''' + aAC_CARDREADERTYPE + ''',';
  stSql := stSql + '''' + aAC_VER + ''',';
  stSql := stSql + '''' + aAC_FTPUSE + ''',';
  stSql := stSql + '''' + aAC_CONNECTED + ''',';
  stSql := stSql + '''' + aAC_LASTCONNECTED + ''',';
  stSql := stSql + '''' + aAC_NETTYPE + ''',';
  stSql := stSql + '''' + aAC_COMPORT + ''',';
  stSql := stSql + '''' + aAC_GUBUN + ''',';
  stSql := stSql + '''' + aJavaraType + ''',';
  stSql := stSql + '''' + aSEND_ACK + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_ACCESSEVENT(aGROUP_CODE, aAC_DATE, aAC_TIME,
  aAC_NODENO, aAC_ECUID, aDO_DOORNO, aCA_CARDNO, aAC_READERNO,
  aAC_BUTTONNO, aAC_DOORPOSI, aAC_INPUTTYPE, aAC_DOORMODE, aAC_PERMITMODE,
  aPE_PERMITCODE, aAC_INSERTDATE, aAC_INSERTOPERATOR,
  aAC_MCUID: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_ACCESSEVENT( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_DATE, ';
  stSql := stSql + 'AC_TIME, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'DO_DOORNO, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'AC_READERNO, ';
  stSql := stSql + 'AC_BUTTONNO, ';
  stSql := stSql + 'AC_DOORPOSI, ';
  stSql := stSql + 'AC_INPUTTYPE, ';
  stSql := stSql + 'AC_DOORMODE, ';
  stSql := stSql + 'AC_PERMITMODE, ';
  stSql := stSql + 'PE_PERMITCODE, ';
  stSql := stSql + 'AC_INSERTDATE, ';
  stSql := stSql + 'AC_INSERTOPERATOR, ';
  stSql := stSql + 'AC_MCUID )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aAC_DATE + ''',';
  stSql := stSql + '''' + aAC_TIME + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aDO_DOORNO + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aAC_READERNO + ''',';
  stSql := stSql + '''' + aAC_BUTTONNO + ''',';
  stSql := stSql + '''' + aAC_DOORPOSI + ''',';
  stSql := stSql + '''' + aAC_INPUTTYPE + ''',';
  stSql := stSql + '''' + aAC_DOORMODE + ''',';
  stSql := stSql + '''' + aAC_PERMITMODE + ''',';
  stSql := stSql + '''' + aPE_PERMITCODE + ''',';
  stSql := stSql + '''' + aAC_INSERTDATE + ''',';
  stSql := stSql + '''' + aAC_INSERTOPERATOR + ''',';
  stSql := stSql + '''' + aAC_MCUID + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_ALARMDEVICE(aGROUP_CODE, aAC_NODENO,
  aAC_ECUID, aAL_ZONENUM, aAL_ZONENAME, aAL_LASTMODE, aAL_VIEWSEQ,
  aAC_MCUID, aAL_LOCATEUSE, aAL_TOTWIDTH, aAL_TOTHEIGHT, aAL_CURX,
  aAL_CURY, aLO_DONGCODE, aLO_FLOORCODE, aLO_AREACODE,
  aSEND_ACK: string): Boolean;
var
  stSql : string;
begin
  if Trim(aAL_VIEWSEQ) = '' then aAL_VIEWSEQ := '0';
  if Trim(aAL_TOTWIDTH) = '' then aAL_TOTWIDTH := '0';
  if Trim(aAL_TOTHEIGHT) = '' then aAL_TOTHEIGHT := '0';
  if Trim(aAL_CURX) = '' then aAL_CURX := '0';
  if Trim(aAL_CURY) = '' then aAL_CURY := '0';

  stSql := ' Insert Into TB_ALARMDEVICE( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'AL_ZONENUM, ';
  stSql := stSql + 'AL_ZONENAME, ';
  stSql := stSql + 'AL_LASTMODE, ';
  stSql := stSql + 'AL_VIEWSEQ, ';
  stSql := stSql + 'AC_MCUID, ';
  stSql := stSql + 'AL_LOCATEUSE, ';
  stSql := stSql + 'AL_TOTWIDTH, ';
  stSql := stSql + 'AL_TOTHEIGHT, ';
  stSql := stSql + 'AL_CURX, ';
  stSql := stSql + 'AL_CURY, ';
  stSql := stSql + 'LO_DONGCODE, ';
  stSql := stSql + 'LO_FLOORCODE, ';
  stSql := stSql + 'LO_AREACODE, ';
  stSql := stSql + 'SEND_ACK ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aAL_ZONENUM + ''',';
  stSql := stSql + '''' + aAL_ZONENAME + ''',';
  stSql := stSql + '''' + aAL_LASTMODE + ''',';
  stSql := stSql + '' + aAL_VIEWSEQ + ',';
  stSql := stSql + '''' + aAC_MCUID + ''',';
  stSql := stSql + '''' + aAL_LOCATEUSE + ''',';
  stSql := stSql + '' + aAL_TOTWIDTH + ',';
  stSql := stSql + '' + aAL_TOTHEIGHT + ',';
  stSql := stSql + '' + aAL_CURX + ',';
  stSql := stSql + '' + aAL_CURY + ',';
  stSql := stSql + '''' + aLO_DONGCODE + ''',';
  stSql := stSql + '''' + aLO_FLOORCODE + ''',';
  stSql := stSql + '''' + aLO_AREACODE + ''',';
  stSql := stSql + '''' + aSEND_ACK + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_ALARMEVENT(aGROUP_CODE, aAL_DATE, aAL_TIME,
  aAC_NODENO, aAC_ECUID, aAL_MSGNO, aAL_ALARMDEVICETYPECODE, aAL_SUBADDR,
  aAL_ZONECODE, aAL_ALARMMODECODE, aAL_ZONENO, aAL_ZONESTATE,
  aAL_ALARMSTATUSCODE, aAL_ISALARM, aAL_OPERATOR, aAL_INPUTTIME,
  aAL_INPUTOPERATOR, aAL_CHECKOK, aAL_CHECKCODE, aAL_CHECKMSG,
  aAL_UPDATETIME, aAL_UPDATEOPERATOR: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_ALARMEVENT( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AL_DATE, ';
  stSql := stSql + 'AL_TIME, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'AL_MSGNO, ';
  stSql := stSql + 'AL_ALARMDEVICETYPECODE, ';
  stSql := stSql + 'AL_SUBADDR, ';
  stSql := stSql + 'AL_ZONECODE, ';
  stSql := stSql + 'AL_ALARMMODECODE, ';
  stSql := stSql + 'AL_ZONENO, ';
  stSql := stSql + 'AL_ZONESTATE, ';
  stSql := stSql + 'AL_ALARMSTATUSCODE, ';
  stSql := stSql + 'AL_ISALARM, ';
  stSql := stSql + 'AL_OPERATOR, ';
  stSql := stSql + 'AL_INPUTTIME, ';
  stSql := stSql + 'AL_INPUTOPERATOR, ';
  stSql := stSql + 'AL_CHECKOK, ';
  stSql := stSql + 'AL_CHECKCODE, ';
  stSql := stSql + 'AL_CHECKMSG, ';
  stSql := stSql + 'AL_UPDATETIME, ';
  stSql := stSql + 'AL_UPDATEOPERATOR ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aAL_DATE + ''',';
  stSql := stSql + '''' + aAL_TIME + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aAL_MSGNO + ''',';
  stSql := stSql + '''' + aAL_ALARMDEVICETYPECODE + ''',';
  stSql := stSql + '''' + aAL_SUBADDR + ''',';
  stSql := stSql + '''' + aAL_ZONECODE + ''',';
  stSql := stSql + '''' + aAL_ALARMMODECODE + ''',';
  stSql := stSql + '''' + aAL_ZONENO + ''',';
  stSql := stSql + '''' + aAL_ZONESTATE + ''',';
  stSql := stSql + '''' + aAL_ALARMSTATUSCODE + ''',';
  stSql := stSql + '''' + aAL_ISALARM + ''',';
  stSql := stSql + '''' + aAL_OPERATOR + ''',';
  stSql := stSql + '''' + aAL_INPUTTIME + ''',';
  stSql := stSql + '''' + aAL_INPUTOPERATOR + ''',';
  stSql := stSql + '''' + aAL_CHECKOK + ''',';
  stSql := stSql + '''' + aAL_CHECKCODE + ''',';
  stSql := stSql + '''' + aAL_CHECKMSG + ''',';
  stSql := stSql + '''' + aAL_UPDATETIME + ''',';
  stSql := stSql + '''' + aAL_UPDATEOPERATOR + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_CARD(aGROUP_CODE, aCA_CARDNO, aCA_GUBUN,
  aCA_CARDTYPE, aCO_COMPANYCODE, aEM_CODE, aCA_LASTUSE, aCA_UPDATETIME,
  aCA_UPDATEOPERATOR, aCA_STATUS, aPOSITIONNUM: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_CARD( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'CA_GUBUN, ';
  stSql := stSql + 'CA_CARDTYPE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'EM_CODE, ';
  stSql := stSql + 'CA_LASTUSE, ';
  stSql := stSql + 'CA_UPDATETIME, ';
  stSql := stSql + 'CA_UPDATEOPERATOR, ';
  stSql := stSql + 'CA_STATUS, ';
  stSql := stSql + 'POSITIONNUM ) ';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aCA_GUBUN + ''',';
  stSql := stSql + '''' + aCA_CARDTYPE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aEM_CODE + ''',';
  stSql := stSql + '''' + aCA_LASTUSE + ''',';
  stSql := stSql + '''' + aCA_UPDATETIME + ''',';
  stSql := stSql + '''' + aCA_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + aCA_STATUS + ''',';
  stSql := stSql + '''' + aPOSITIONNUM + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_COMPANY(aGROUP_CODE, aCO_COMPANYCODE,
  aCO_JIJUMCODE, aCO_DEPARTCODE, aCO_NAME, aCO_GUBUN, aCO_CHARGE,
  aCO_TELNUM, aCO_UPDATECHECK: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_COMPANY( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'CO_JIJUMCODE, ';
  stSql := stSql + 'CO_DEPARTCODE, ';
  stSql := stSql + 'CO_NAME, ';
  stSql := stSql + 'CO_GUBUN, ';
  stSql := stSql + 'CO_CHARGE, ';
  stSql := stSql + 'CO_TELNUM, ';
  stSql := stSql + 'CO_UPDATECHECK )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aCO_JIJUMCODE + ''',';
  stSql := stSql + '''' + aCO_DEPARTCODE + ''',';
  stSql := stSql + '''' + aCO_NAME + ''',';
  stSql := stSql + '''' + aCO_GUBUN + ''',';
  stSql := stSql + '''' + aCO_CHARGE + ''',';
  stSql := stSql + '''' + aCO_TELNUM + ''',';
  stSql := stSql + '''' + aCO_UPDATECHECK + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.InsertIntoTB_DEVICECARDNO(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aCA_CARDNO, aDE_DOOR1, aDE_DOOR2, aDE_DOOR3,aDE_DOOR4,aDE_DOOR5,aDE_DOOR6,aDE_DOOR7,aDE_DOOR8,
  aDE_ARARM0,aDE_ARARM1,aDE_ARARM2,aDE_ARARM3,aDE_ARARM4,aDE_ARARM5,aDE_ARARM6,aDE_ARARM7,aDE_ARARM8,aDE_USEACCESS, aDE_USEALARM,
  aDE_TIMECODE, aDE_PERMIT, aDE_RCVACK, aDE_UPDATETIME, aDE_UPDATEOPERATOR,
  aAC_MCUID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICECARDNO( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'DE_DOOR1, ';
  stSql := stSql + 'DE_DOOR2, ';
  stSql := stSql + 'DE_DOOR3, ';
  stSql := stSql + 'DE_DOOR4, ';
  stSql := stSql + 'DE_DOOR5, ';
  stSql := stSql + 'DE_DOOR6, ';
  stSql := stSql + 'DE_DOOR7, ';
  stSql := stSql + 'DE_DOOR8, ';
  stSql := stSql + 'DE_ALARM0, ';
  stSql := stSql + 'DE_ALARM1, ';
  stSql := stSql + 'DE_ALARM2, ';
  stSql := stSql + 'DE_ALARM3, ';
  stSql := stSql + 'DE_ALARM4, ';
  stSql := stSql + 'DE_ALARM5, ';
  stSql := stSql + 'DE_ALARM6, ';
  stSql := stSql + 'DE_ALARM7, ';
  stSql := stSql + 'DE_ALARM8, ';
  stSql := stSql + 'DE_USEACCESS, ';
  stSql := stSql + 'DE_USEALARM, ';
  stSql := stSql + 'DE_TIMECODE, ';
  stSql := stSql + 'DE_PERMIT, ';
  stSql := stSql + 'DE_RCVACK, ';
  stSql := stSql + 'DE_UPDATETIME, ';
  stSql := stSql + 'DE_UPDATEOPERATOR, ';
  stSql := stSql + 'AC_MCUID )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aDE_DOOR1 + ''',';
  stSql := stSql + '''' + aDE_DOOR2 + ''',';
  stSql := stSql + '''' + aDE_DOOR3 + ''',';
  stSql := stSql + '''' + aDE_DOOR4 + ''',';
  stSql := stSql + '''' + aDE_DOOR5 + ''',';
  stSql := stSql + '''' + aDE_DOOR6 + ''',';
  stSql := stSql + '''' + aDE_DOOR7 + ''',';
  stSql := stSql + '''' + aDE_DOOR8 + ''',';
  stSql := stSql + '''' + aDE_ARARM0 + ''',';
  stSql := stSql + '''' + aDE_ARARM1 + ''',';
  stSql := stSql + '''' + aDE_ARARM2 + ''',';
  stSql := stSql + '''' + aDE_ARARM3 + ''',';
  stSql := stSql + '''' + aDE_ARARM4 + ''',';
  stSql := stSql + '''' + aDE_ARARM5 + ''',';
  stSql := stSql + '''' + aDE_ARARM6 + ''',';
  stSql := stSql + '''' + aDE_ARARM7 + ''',';
  stSql := stSql + '''' + aDE_ARARM8 + ''',';
  stSql := stSql + '''' + aDE_USEACCESS + ''',';
  stSql := stSql + '''' + aDE_USEALARM + ''',';
  stSql := stSql + '''' + aDE_TIMECODE + ''',';
  stSql := stSql + '''' + aDE_PERMIT + ''',';
  stSql := stSql + '''' + aDE_RCVACK + ''',';
  stSql := stSql + '''' + aDE_UPDATETIME + ''',';
  stSql := stSql + '''' + aDE_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + aAC_MCUID + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_DOOR(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aDO_DOORNO, aDO_DOORNONAME, aDO_LASTMODE, aAC_MCUID, aDO_VIEWSEQ,
  aDO_TOTWIDTH, aDO_TOTHEIGHT, aDO_CURX, aDO_CURY, aDO_LOCATEUSE,
  aLO_DONGCODE, aLO_FLOORCODE, aLO_AREACODE, aFPMS_ID, aDO_LOCALRELAY,
  aDO_STATEREVERSE, aRelay_Send, aDO_DOORTYPE, aDO_SCHUSE, aDO_CONTROLTIME,
  aDO_CARDREADERTYPE, aDO_MODE, aDO_FIRE, aDO_LASTSTATE, aDO_LASTPOSI,
  aSEND_ACK, aFDMS_ID, aFDMS_RELAY: string): Boolean;
var
  stSql : string;
begin
  if Trim(aDO_VIEWSEQ) = '' then aDO_VIEWSEQ := '0';
  if Trim(aDO_TOTWIDTH) = '' then aDO_TOTWIDTH := '0';
  if Trim(aDO_TOTHEIGHT) = '' then aDO_TOTHEIGHT := '0';
  if Trim(aDO_CURX) = '' then aDO_CURX := '0';
  if Trim(aDO_CURY) = '' then aDO_CURY := '0';
  if Trim(aFPMS_ID) = '' then aFPMS_ID := '0';
  if Trim(aDO_CONTROLTIME) = '' then aDO_CONTROLTIME := '0';
  if Trim(aFDMS_ID) = '' then aFDMS_ID := '0';

  stSql := ' Insert Into TB_DOOR( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'DO_DOORNO, ';
  stSql := stSql + 'DO_DOORNONAME, ';
  stSql := stSql + 'DO_LASTMODE, ';
  stSql := stSql + 'AC_MCUID, ';
  stSql := stSql + 'DO_VIEWSEQ, ';
  stSql := stSql + 'DO_TOTWIDTH, ';
  stSql := stSql + 'DO_TOTHEIGHT, ';
  stSql := stSql + 'DO_CURX, ';
  stSql := stSql + 'DO_CURY, ';
  stSql := stSql + 'DO_LOCATEUSE, ';
  stSql := stSql + 'LO_DONGCODE, ';
  stSql := stSql + 'LO_FLOORCODE, ';
  stSql := stSql + 'LO_AREACODE, ';
  stSql := stSql + 'FPMS_ID, ';
  stSql := stSql + 'DO_LOCALRELAY, ';
  stSql := stSql + 'DO_STATEREVERSE, ';
  stSql := stSql + 'Relay_Send, ';
  stSql := stSql + 'DO_DOORTYPE, ';
  stSql := stSql + 'DO_SCHUSE, ';
  stSql := stSql + 'DO_CONTROLTIME, ';
  stSql := stSql + 'DO_CARDREADERTYPE, ';
  stSql := stSql + 'DO_MODE, ';
  stSql := stSql + 'DO_FIRE, ';
  stSql := stSql + 'DO_LASTSTATE, ';
  stSql := stSql + 'DO_LASTPOSI, ';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'FDMS_ID, ';
  stSql := stSql + 'FDMS_RELAY )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aDO_DOORNO + ''',';
  stSql := stSql + '''' + aDO_DOORNONAME + ''',';
  stSql := stSql + '''' + aDO_LASTMODE + ''',';
  stSql := stSql + '''' + aAC_MCUID + ''',';
  stSql := stSql + '' + aDO_VIEWSEQ + ',';
  stSql := stSql + '' + aDO_TOTWIDTH + ',';
  stSql := stSql + '' + aDO_TOTHEIGHT + ',';
  stSql := stSql + '' + aDO_CURX + ',';
  stSql := stSql + '' + aDO_CURY + ',';
  stSql := stSql + '''' + aDO_LOCATEUSE + ''',';
  stSql := stSql + '''' + aLO_DONGCODE + ''',';
  stSql := stSql + '''' + aLO_FLOORCODE + ''',';
  stSql := stSql + '''' + aLO_AREACODE + ''',';
  stSql := stSql + '' + aFPMS_ID + ',';
  stSql := stSql + '''' + aDO_LOCALRELAY + ''',';
  stSql := stSql + '''' + aDO_STATEREVERSE + ''',';
  stSql := stSql + '''' + aRelay_Send + ''',';
  stSql := stSql + '''' + aDO_DOORTYPE + ''',';
  stSql := stSql + '''' + aDO_SCHUSE + ''',';
  stSql := stSql + '''' + aDO_CONTROLTIME + ''',';
  stSql := stSql + '''' + aDO_CARDREADERTYPE + ''',';
  stSql := stSql + '''' + aDO_MODE + ''',';
  stSql := stSql + '''' + aDO_FIRE + ''',';
  stSql := stSql + '''' + aDO_LASTSTATE + ''',';
  stSql := stSql + '''' + aDO_LASTPOSI + ''',';
  stSql := stSql + '''' + aSEND_ACK + ''',';
  stSql := stSql + '' + aFDMS_ID + ',';
  stSql := stSql + '''' + aFDMS_RELAY + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_EMPHIS(aGROUP_CODE, aCO_COMPANYCODE, aEM_CODE,
  aFDMS_ID, aMODE, aSEND_STATUS, aCA_CARDNO, aCA_CARDTYPE, aSEND_STATUS2,
  aEH_INSERTTIME: string): Boolean;
var
  stSql : string;
begin
  if Trim(aFDMS_ID) = '' then aFDMS_ID := '0';

  stSql := ' Insert Into TB_EMPHIS( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'EM_CODE, ';
  stSql := stSql + 'FDMS_ID, ';
  stSql := stSql + 'MODE, ';
  stSql := stSql + 'SEND_STATUS, ';
  stSql := stSql + 'CA_CARDNO, ';
  stSql := stSql + 'CA_CARDTYPE, ';
  stSql := stSql + 'SEND_STATUS2, ';
  stSql := stSql + 'EH_INSERTTIME )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aEM_CODE + ''',';
  stSql := stSql + '' + aFDMS_ID + ',';
  stSql := stSql + '''' + aMODE + ''',';
  stSql := stSql + '''' + aSEND_STATUS + ''',';
  stSql := stSql + '''' + aCA_CARDNO + ''',';
  stSql := stSql + '''' + aCA_CARDTYPE + ''',';
  stSql := stSql + '''' + aSEND_STATUS2 + ''',';
  stSql := stSql + '''' + aEH_INSERTTIME + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_EMPLOYEE(aGROUP_CODE, aCO_COMPANYCODE,
  aEM_CODE, aCO_JIJUMCODE, aCO_DEPARTCODE, aPO_POSICODE, aEM_NAME,
  aEM_COPHONE, aEM_HOMEPHONE, aEM_HANDPHONE, aZI_ZIPCODE, aEM_ADDR1,
  aEM_ADDR2, aEM_JOINDATE, aEM_RETIREDATE, aEM_PASS, aAT_ATCODE,
  aEM_UPDATETIME, aEM_UPDATEOPERATOR, aFDMS_ID, aFDMS_RELAY,
  aRG_CODE: string): Boolean;
var
  stSql : string;
begin
  if Trim(aFDMS_ID) = '' then aFDMS_ID := '0';

  stSql := ' Insert Into TB_EMPLOYEE( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'EM_CODE, ';
  stSql := stSql + 'CO_JIJUMCODE, ';
  stSql := stSql + 'CO_DEPARTCODE, ';
  stSql := stSql + 'PO_POSICODE, ';
  stSql := stSql + 'EM_NAME, ';
  stSql := stSql + 'EM_COPHONE, ';
  stSql := stSql + 'EM_HOMEPHONE, ';
  stSql := stSql + 'EM_HANDPHONE, ';
  stSql := stSql + 'ZI_ZIPCODE, ';
  stSql := stSql + 'EM_ADDR1, ';
  stSql := stSql + 'EM_ADDR2, ';
  stSql := stSql + 'EM_JOINDATE, ';
  stSql := stSql + 'EM_RETIREDATE, ';
  stSql := stSql + 'EM_PASS, ';
  stSql := stSql + 'AT_ATCODE, ';
  stSql := stSql + 'EM_UPDATETIME, ';
  stSql := stSql + 'EM_UPDATEOPERATOR, ';
  stSql := stSql + 'FDMS_ID, ';
  stSql := stSql + 'FDMS_RELAY, ';
  stSql := stSql + 'RG_CODE)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aEM_CODE + ''',';
  stSql := stSql + '''' + aCO_JIJUMCODE + ''',';
  stSql := stSql + '''' + aCO_DEPARTCODE + ''',';
  stSql := stSql + '''' + aPO_POSICODE + ''',';
  stSql := stSql + '''' + aEM_NAME + ''',';
  stSql := stSql + '''' + aEM_COPHONE + ''',';
  stSql := stSql + '''' + aEM_HOMEPHONE + ''',';
  stSql := stSql + '''' + aEM_HANDPHONE + ''',';
  stSql := stSql + '''' + aZI_ZIPCODE + ''',';
  stSql := stSql + '''' + aEM_ADDR1 + ''',';
  stSql := stSql + '''' + aEM_ADDR2 + ''',';
  stSql := stSql + '''' + aEM_JOINDATE + ''',';
  stSql := stSql + '''' + aEM_RETIREDATE + ''',';
  stSql := stSql + '''' + aEM_PASS + ''',';
  stSql := stSql + '''' + aAT_ATCODE + ''',';
  stSql := stSql + '''' + aEM_UPDATETIME + ''',';
  stSql := stSql + '''' + aEM_UPDATEOPERATOR + ''',';
  stSql := stSql + '' + aFDMS_ID + ',';
  stSql := stSql + '''' + aFDMS_RELAY + ''',';
  stSql := stSql + '''' + aRG_CODE + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_KTCARDISSUE(aGROUP_CODE, aEM_CODE,
  aCARD_SEQ: string): Boolean;
var
  stSql : string;
begin
  if Trim(aCARD_SEQ) = '' then aCARD_SEQ := '0';

  stSql := ' Insert Into TB_KTCARDISSUE( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'EM_CODE, ';
  stSql := stSql + 'CARD_SEQ)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aEM_CODE + ''',';
  stSql := stSql + '' + aCARD_SEQ + ')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_LOCATION(aGROUP_CODE, aLO_DONGCODE,
  aLO_FLOORCODE, aLO_AREACODE, aLO_NAME, aLO_GUBUN: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_LOCATION( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'LO_DONGCODE, ';
  stSql := stSql + 'LO_FLOORCODE, ';
  stSql := stSql + 'LO_AREACODE, ';
  stSql := stSql + 'LO_NAME, ';
  stSql := stSql + 'LO_GUBUN)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aLO_DONGCODE + ''',';
  stSql := stSql + '''' + aLO_FLOORCODE + ''',';
  stSql := stSql + '''' + aLO_AREACODE + ''',';
  stSql := stSql + '''' + aLO_NAME + ''',';
  stSql := stSql + '''' + aLO_GUBUN + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_POSI(aGROUP_CODE, aCO_COMPANYCODE,
  aPO_POSICODE, aPO_NAME, aPO_UPDATECHECK: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_POSI( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'CO_COMPANYCODE, ';
  stSql := stSql + 'PO_POSICODE, ';
  stSql := stSql + 'PO_NAME, ';
  stSql := stSql + 'PO_UPDATECHECK)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aCO_COMPANYCODE + ''',';
  stSql := stSql + '''' + aPO_POSICODE + ''',';
  stSql := stSql + '''' + aPO_NAME + ''',';
  stSql := stSql + '''' + aPO_UPDATECHECK + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_READER(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aRE_READERNO, aDO_DOORNO, aRE_USE, aSEND_ACK: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_READER( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'RE_READERNO, ';
  stSql := stSql + 'DO_DOORNO, ';
  stSql := stSql + 'RE_USE, ';
  stSql := stSql + 'SEND_ACK)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aAC_NODENO + ''',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aRE_READERNO + ''',';
  stSql := stSql + '''' + aDO_DOORNO + ''',';
  stSql := stSql + '''' + aRE_USE + ''',';
  stSql := stSql + '''' + aSEND_ACK + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_ZONEDEVICE(aGROUP_CODE, aAC_NODENO, aAC_ECUID,
  aAL_ZONENUM, aAL_ZONENAME, aAL_LOCATEUSE, aAL_TOTWIDTH, aAL_TOTHEIGHT,
  aAL_CURX, aAL_CURY, aLO_DONGCODE, aLO_FLOORCODE, aLO_AREACODE,
  aAL_ZONETYPE, aAL_WATCHTYPE, aSEND_ACK, aAL_ZONEUSE,
  aAL_ZONESTOP: string): Boolean;
var
  stSql : string;
begin
  if Trim(aAL_TOTWIDTH) = '' then aAL_TOTWIDTH := '0';
  if Trim(aAL_TOTHEIGHT) = '' then aAL_TOTHEIGHT := '0';
  if Trim(aAL_CURX) = '' then aAL_CURX := '0';
  if Trim(aAL_CURY) = '' then aAL_CURY := '0';

  stSql := ' Insert Into TB_ZONEDEVICE( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'AC_NODENO, ';
  stSql := stSql + 'AC_ECUID, ';
  stSql := stSql + 'AL_ZONENUM, ';
  stSql := stSql + 'AL_ZONENAME, ';
  stSql := stSql + 'AL_LOCATEUSE, ';
  stSql := stSql + 'AL_TOTWIDTH, ';
  stSql := stSql + 'AL_TOTHEIGHT, ';
  stSql := stSql + 'AL_CURX, ';
  stSql := stSql + 'AL_CURY, ';
  stSql := stSql + 'LO_DONGCODE, ';
  stSql := stSql + 'LO_FLOORCODE, ';
  stSql := stSql + 'LO_AREACODE, ';
  stSql := stSql + 'AL_ZONETYPE, ';
  stSql := stSql + 'AL_WATCHTYPE, ';
  stSql := stSql + 'SEND_ACK, ';
  stSql := stSql + 'AL_ZONEUSE, ';
  stSql := stSql + 'AL_ZONESTOP)';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '' + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aAL_ZONENUM + ''',';
  stSql := stSql + '''' + aAL_ZONENAME + ''',';
  stSql := stSql + '''' + aAL_LOCATEUSE + ''',';
  stSql := stSql + '' + aAL_TOTWIDTH + ',';
  stSql := stSql + '' + aAL_TOTHEIGHT + ',';
  stSql := stSql + '' + aAL_CURX + ',';
  stSql := stSql + '' + aAL_CURY + ',';
  stSql := stSql + '''' + aLO_DONGCODE + ''',';
  stSql := stSql + '''' + aLO_FLOORCODE + ''',';
  stSql := stSql + '''' + aLO_AREACODE + ''',';
  stSql := stSql + '''' + aAL_ZONETYPE + ''',';
  stSql := stSql + '''' + aAL_WATCHTYPE + ''',';
  stSql := stSql + '''' + aSEND_ACK + ''',';
  stSql := stSql + '''' + aAL_ZONEUSE + ''',';
  stSql := stSql + '''' + aAL_ZONESTOP + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.TB_ACCESSEVENTConvertProcess(aStartPoint,
  aEndPoint: integer): Boolean;
var
  stSql : string;
  nCount : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_ACCESSEVENT ';
  stSql := stSql + ' where ac_relay is null ';
  stSql := stSql + ' OR ac_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      InsertIntoTB_ACCESSEVENT(
        FindField('GROUP_CODE').AsString,
        FindField('AC_DATE').AsString,
        FindField('AC_TIME').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('DO_DOORNO').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('AC_READERNO').AsString,
        FindField('AC_BUTTONNO').AsString,
        FindField('AC_DOORPOSI').AsString,
        FindField('AC_INPUTTYPE').AsString,
        FindField('AC_DOORMODE').AsString,
        FindField('AC_PERMITMODE').AsString,
        FindField('PE_PERMITCODE').AsString,
        FindField('AC_INSERTDATE').AsString,
        FindField('AC_INSERTOPERATOR').AsString,
        FindField('AC_MCUID').AsString
        );
      updateOrgTB_ACCESSEVENTRelay(FindField('GROUP_CODE').AsString,
        FindField('AC_DATE').AsString,
        FindField('AC_TIME').AsString,
        inttostr(FindField('AC_NODENO').AsInteger),
        FindField('AC_ECUID').AsString,
        FindField('DO_DOORNO').AsString,
        FindField('CA_CARDNO').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Label15.Caption := inttostr(aStartPoint);
      Next;
    end;
  end;
end;

function TForm1.updateOrgTB_ACCESSEVENTRelay(aGROUP_CODE, aAC_DATE,
  aAC_TIME, aAC_NODENO, aAC_ECUID, aDO_DOORNO, aCA_CARDNO,
  aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ACCESSEVENT set AC_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AC_DATE = ''' + aAC_DATE + ''' ';
  stSql := stSql + ' AND AC_TIME = ''' + aAC_TIME + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDO_DOORNO + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCA_CARDNO + ''' ';

  with orgADOExeQuery do
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

function TForm1.TB_ALARMEVENTConvertProcess: Boolean;
var
  stSql : string;
  nCount : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_ALARMEVENT ';
  stSql := stSql + ' where al_relay is null ';
  stSql := stSql + ' OR al_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      InsertIntoTB_ALARMEVENT(
        FindField('GROUP_CODE').AsString,
        FindField('AL_DATE').AsString,
        FindField('AL_TIME').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('AL_MSGNO').AsString,
        FindField('AL_ALARMDEVICETYPECODE').AsString,
        FindField('AL_SUBADDR').AsString,
        FindField('AL_ZONECODE').AsString,
        FindField('AL_ALARMMODECODE').AsString,
        FindField('AL_ZONENO').AsString,
        FindField('AL_ZONESTATE').AsString,
        FindField('AL_ALARMSTATUSCODE').AsString,
        FindField('AL_ISALARM').AsString,
        FindField('AL_OPERATOR').AsString,
        FindField('AL_INPUTTIME').AsString,
        FindField('AL_INPUTOPERATOR').AsString,
        FindField('AL_CHECKOK').AsString,
        FindField('AL_CHECKCODE').AsString,
        FindField('AL_CHECKMSG').AsString,
        FindField('AL_UPDATETIME').AsString,
        FindField('AL_UPDATEOPERATOR').AsString
        );
      updateOrgTB_ALARMVENTRelay(
        FindField('GROUP_CODE').AsString,
        FindField('AL_DATE').AsString,
        FindField('AL_TIME').AsString,
        inttostr(FindField('AC_NODENO').AsInteger),
        FindField('AC_ECUID').AsString,
        FindField('AL_MSGNO').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;

end;

function TForm1.updateOrgTB_ALARMVENTRelay(aGROUP_CODE, aAL_DATE, aAL_TIME,
  aAC_NODENO, aAC_ECUID, aAL_MSGNO, aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ALARMEVENT set AL_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AL_DATE = ''' + aAL_DATE + ''' ';
  stSql := stSql + ' AND AL_TIME = ''' + aAL_TIME + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aAC_NODENO + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aAC_ECUID + ''' ';
  stSql := stSql + ' AND AL_MSGNO = ''' + aAL_MSGNO + ''' ';

  with orgADOExeQuery do
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

function TForm1.TB_ATEVENTConvert: Boolean;
var
  stSql : string;
  i : integer;
  nLoopCount : integer;
begin
  if rg_orgDBType.ItemIndex = 2 then Exit;
  result := False;
  //if Not CheckTB_ATEVENT_RELAY then
  //begin
    if Not AlterTB_ATEVENT_RELAY then
    begin
      //showmessage('TB_ATEVENT 테이블 AT_RELAY 필드 추가 실패');
      //Exit;
    end;
  //end;
  lb_table.Caption := 'TB_ATEVENT';
  //TargetTableDelete(lb_table.Caption);
  stSql := 'Update TB_ATEVENT set AT_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;
  stSql := 'select count(*) as cnt from TB_ATEVENT ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := findField('cnt').AsInteger;
    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      if (i * 1000) > FindField('cnt').AsInteger then break;
      TB_ATEVENTConvertProcess;
    end;

  end;
  result := True;
end;

function TForm1.tb_atmonthextraConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'tb_atmonthextra';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from tb_atmonthextra ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntotb_atmonthextra(
        FindField('GROUP_CODE').AsString,
        FindField('at_month').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        FindField('at_extraname').AsString,
        inttostr(FindField('at_extraamt').AsInteger));

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.tb_atmonthsummaryConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'tb_atmonthsummary';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from tb_atmonthsummary ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntotb_atmonthsummary(
        FindField('group_code').AsString,
        FindField('at_month').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        FindField('at_startdate').AsString,
        FindField('at_enddate').AsString,
        FindField('at_totdaycount').AsInteger,
        FindField('at_holidaycount').AsInteger,
        FindField('at_attenddaycount').AsInteger,
        FindField('at_incount').AsInteger,
        FindField('at_jikagcount').AsInteger,
        FindField('at_jotaecount').AsInteger,
        FindField('at_nonatcount').AsInteger,
        FindField('at_payvacount').AsInteger,
        FindField('at_nonpayvacount').AsInteger,
        FindField('at_leavecount').AsInteger,
        FindField('at_backcount').AsInteger,
        FindField('at_infrommm').AsInteger,
        FindField('at_workmm').AsInteger,
        FindField('at_extendmm').AsInteger,
        FindField('at_nightmm').AsInteger,
        FindField('at_holidaymm').AsInteger,
        FindField('at_realattimemm').AsInteger,
        FindField('at_infromamt').AsInteger,
        FindField('at_workamt').AsInteger,
        FindField('at_extendamt').AsInteger,
        FindField('at_nightamt').AsInteger,
        FindField('at_holidayamt').AsInteger);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.tb_foodeventConvert: Boolean;
var
  stSql : string;
  i : integer;
  nLoopCount : integer;
begin
  result := False;
  //if Not CheckTB_FOODEVENT_RELAY then
  //begin
    if Not AlterTB_FOODEVENT_RELAY then
    begin
      //showmessage('TB_FOODEVENT 테이블 FO_RELAY 필드 추가 실패');
      //Exit;
    end;
  //end;
  lb_table.Caption := 'tb_foodevent';
  //TargetTableDelete(lb_table.Caption);
  stSql := 'Update TB_FOODEVENT set FO_RELAY = ''N'' ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except

    End;
  end;
  stSql := 'select count(*) as cnt from tb_foodevent ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := findField('cnt').AsInteger;
    nLoopCount := (FindField('cnt').AsInteger div 1000) + 1;
    for i := 0 to nLoopCount do
    begin
      if (i * 1000) > FindField('cnt').AsInteger then break;
      tb_foodeventConvertProcess;
    end;

  end;
  result := True;
end;

function TForm1.TB_ATEVENTConvertProcess: Boolean;
var
  stSql : string;
  nCount : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_ATEVENT ';
  stSql := stSql + ' where at_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      InsertIntoTB_ATEVENT(
        FindField('GROUP_CODE').AsString,
        FindField('at_date').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        FindField('ca_gubun').AsString,
        FindField('ca_cardno').AsString,
        FindField('at_atcode').AsString,
        FindField('at_weekcode').AsString,
        FindField('at_defaultintime').AsString,
        FindField('at_defaultouttime').AsString,
        FindField('at_intime').AsString,
        FindField('at_leavetime').AsString,
        FindField('at_backtime').AsString,
        FindField('at_outtime').AsString,
        FindField('at_inresult').AsString,
        FindField('at_outresult').AsString,
        FindField('at_inserttime').AsString,
        FindField('at_insertoperator').AsString,
        FindField('at_updatetime').AsString,
        FindField('at_updateoperator').AsString,
        FindField('at_defaultlatetime').AsString,
        FindField('at_holiyday').AsString,
        FindField('at_night').AsString,
        FindField('at_content').AsString,
        FindField('at_incode').AsString,
        FindField('at_outcode').AsString,
        FindField('at_summary').AsString );
      updateOrgTB_ATRelay(
        FindField('GROUP_CODE').AsString,
        FindField('at_date').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.InsertIntoTB_ATEVENT(aGROUP_CODE, aAt_date,
  aco_companycode, aem_code, aca_gubun, aca_cardno, aat_atcode,
  aat_weekcode, aat_defaultintime, aat_defaultouttime, aat_intime,
  aat_leavetime, aat_backtime, aat_outtime, aat_inresult, aat_outresult,
  aat_inserttime, aat_insertoperator, aat_updatetime, aat_updateoperator,
  aat_defaultlatetime, aat_holiyday, aat_night, aat_content, aat_incode,
  aat_outcode, aat_summary: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into TB_ATEVENT( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'At_date, ';
  stSql := stSql + 'co_companycode, ';
  stSql := stSql + 'em_code, ';
  stSql := stSql + 'ca_gubun, ';
  stSql := stSql + 'ca_cardno, ';
  stSql := stSql + 'at_atcode, ';
  stSql := stSql + 'at_weekcode, ';
  stSql := stSql + 'at_defaultintime, ';
  stSql := stSql + 'at_defaultouttime, ';
  stSql := stSql + 'at_intime, ';
  stSql := stSql + 'at_leavetime, ';
  stSql := stSql + 'at_backtime, ';
  stSql := stSql + 'at_outtime, ';
  stSql := stSql + 'at_inresult, ';
  stSql := stSql + 'at_outresult, ';
  stSql := stSql + 'at_inserttime, ';
  stSql := stSql + 'at_insertoperator, ';
  stSql := stSql + 'at_updatetime, ';
  stSql := stSql + 'at_updateoperator, ';
  stSql := stSql + 'at_defaultlatetime, ';
  stSql := stSql + 'at_holiyday, ';
  stSql := stSql + 'at_night, ';
  stSql := stSql + 'at_content, ';
  stSql := stSql + 'at_incode, ';
  stSql := stSql + 'at_outcode, ';
  stSql := stSql + 'at_summary )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE+ ''',';
  stSql := stSql + '''' + aAt_date+ ''',';
  stSql := stSql + '''' + aco_companycode + ''',';
  stSql := stSql + '''' + aem_code + ''',';
  stSql := stSql + '''' + aca_gubun + ''',';
  stSql := stSql + '''' + aca_cardno + ''',';
  stSql := stSql + '''' + aat_atcode + ''',';
  stSql := stSql + '''' + aat_weekcode + ''',';
  stSql := stSql + '''' + aat_defaultintime + ''',';
  stSql := stSql + '''' + aat_defaultouttime + ''',';
  stSql := stSql + '''' + aat_intime + ''',';
  stSql := stSql + '''' + aat_leavetime + ''',';
  stSql := stSql + '''' + aat_backtime + ''',';
  stSql := stSql + '''' + aat_outtime + ''',';
  stSql := stSql + '''' + aat_inresult + ''',';
  stSql := stSql + '''' + aat_outresult + ''',';
  stSql := stSql + '''' + aat_inserttime + ''',';
  stSql := stSql + '''' + aat_insertoperator + ''',';
  stSql := stSql + '''' + aat_updatetime + ''',';
  stSql := stSql + '''' + aat_updateoperator + ''',';
  stSql := stSql + '''' + aat_defaultlatetime + ''',';
  stSql := stSql + '''' + aat_holiyday + ''',';
  stSql := stSql + '''' + aat_night + ''',';
  stSql := stSql + '''' + aat_content + ''',';
  stSql := stSql + '''' + aat_incode + ''',';
  stSql := stSql + '''' + aat_outcode + ''',';
  stSql := stSql + '''' + aat_summary + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.updateOrgTB_ATRelay(aGROUP_CODE, aat_date, aco_companycode,
  aem_code, aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_ATEVENT set AT_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND at_date = ''' + aat_date + ''' ';
  stSql := stSql + ' AND co_companycode = ''' + aco_companycode + ''' ';
  stSql := stSql + ' AND em_code = ''' + aem_code + ''' ';

  with orgADOExeQuery do
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

function TForm1.InsertIntotb_atmonthextra(aGROUP_CODE, aat_month,
  aco_companycode, aem_code, aat_extraname, aat_extraamt: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into tb_atmonthextra( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'at_month, ';
  stSql := stSql + 'co_companycode, ';
  stSql := stSql + 'em_code, ';
  stSql := stSql + 'at_extraname, ';
  stSql := stSql + 'at_extraamt )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE+ ''',';
  stSql := stSql + '''' + aat_month+ ''',';
  stSql := stSql + '''' + aco_companycode + ''',';
  stSql := stSql + '''' + aem_code + ''',';
  stSql := stSql + '''' + aat_extraname + ''',';
  stSql := stSql + '' + aat_extraamt + ')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.InsertIntotb_atmonthsummary(agroup_code, aat_month,
  aco_companycode, aem_code, aat_startdate, aat_enddate: string;
  aat_totdaycount, aat_holidaycount, aat_attenddaycount, aat_incount,
  aat_jikagcount, aat_jotaecount, aat_nonatcount, aat_payvacount,
  aat_nonpayvacount, aat_leavecount, aat_backcount, aat_infrommm,
  aat_workmm, aat_extendmm, aat_nightmm, aat_holidaymm, aat_realattimemm,
  aat_infromamt, aat_workamt, aat_extendamt, aat_nightamt,
  aat_holidayamt: integer): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into tb_atmonthsummary( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'at_month, ';
  stSql := stSql + 'co_companycode, ';
  stSql := stSql + 'em_code, ';
  stSql := stSql + 'at_startdate, ';
  stSql := stSql + 'at_enddate, ';
  stSql := stSql + 'at_totdaycount, ';
  stSql := stSql + 'at_holidaycount, ';
  stSql := stSql + 'at_attenddaycount, ';
  stSql := stSql + 'at_incount, ';
  stSql := stSql + 'at_jikagcount, ';
  stSql := stSql + 'at_jotaecount, ';
  stSql := stSql + 'at_nonatcount, ';
  stSql := stSql + 'at_payvacount, ';
  stSql := stSql + 'at_nonpayvacount, ';
  stSql := stSql + 'at_leavecount, ';
  stSql := stSql + 'at_backcount, ';
  stSql := stSql + 'at_infrommm, ';
  stSql := stSql + 'at_workmm, ';
  stSql := stSql + 'at_extendmm, ';
  stSql := stSql + 'at_nightmm, ';
  stSql := stSql + 'at_holidaymm, ';
  stSql := stSql + 'at_realattimemm, ';
  stSql := stSql + 'at_infromamt, ';
  stSql := stSql + 'at_workamt, ';
  stSql := stSql + 'at_extendamt, ';
  stSql := stSql + 'at_nightamt, ';
  stSql := stSql + 'at_holidayamt )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aat_month + ''',';
  stSql := stSql + '''' + aco_companycode + ''',';
  stSql := stSql + '''' + aem_code + ''',';
  stSql := stSql + '''' + aat_startdate + ''',';
  stSql := stSql + '''' + aat_enddate + ''',';
  stSql := stSql + '' + inttostr(aat_totdaycount) + ',';
  stSql := stSql + '' + inttostr(aat_holidaycount) + ',';
  stSql := stSql + '' + inttostr(aat_attenddaycount) + ',';
  stSql := stSql + '' + inttostr(aat_incount) + ',';
  stSql := stSql + '' + inttostr(aat_jikagcount) + ',';
  stSql := stSql + '' + inttostr(aat_jotaecount) + ',';
  stSql := stSql + '' + inttostr(aat_nonatcount) + ',';
  stSql := stSql + '' + inttostr(aat_payvacount) + ',';
  stSql := stSql + '' + inttostr(aat_nonpayvacount) + ',';
  stSql := stSql + '' + inttostr(aat_leavecount) + ',';
  stSql := stSql + '' + inttostr(aat_backcount) + ',';
  stSql := stSql + '' + inttostr(aat_infrommm) + ',';
  stSql := stSql + '' + inttostr(aat_workmm) + ',';
  stSql := stSql + '' + inttostr(aat_extendmm) + ',';
  stSql := stSql + '' + inttostr(aat_nightmm) + ',';
  stSql := stSql + '' + inttostr(aat_holidaymm) + ',';
  stSql := stSql + '' + inttostr(aat_realattimemm) + ',';
  stSql := stSql + '' + inttostr(aat_infromamt) + ',';
  stSql := stSql + '' + inttostr(aat_workamt) + ',';
  stSql := stSql + '' + inttostr( aat_extendamt) + ',';
  stSql := stSql + '' + inttostr(aat_nightamt) + ',';
  stSql := stSql + '' + inttostr(aat_holidayamt) + ')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.tb_foodeventConvertProcess: Boolean;
var
  stSql : string;
  nCount : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from tb_foodevent ';
  stSql := stSql + ' where fo_relay is null ';
  stSql := stSql + ' OR fo_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      InsertIntotb_foodevent(
        FindField('GROUP_CODE').AsString,
        FindField('fo_date').AsString,
        FindField('fo_time').AsString,
        inttostr(FindField('ac_nodeno').AsInteger),
        FindField('fo_doorno').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        FindField('fo_foodcode').AsString,
        FindField('fo_permit').AsString,
        FindField('fo_inserttime').AsString,
        FindField('fo_insertoperator').AsString,
        FindField('fo_updatetime').AsString,
        FindField('fo_updateoperator').AsString,
        FindField('ac_mcuid').AsString,
        FindField('ac_ecuid').AsString,
        FindField('fo_content').AsString,
        inttostr(FindField('fo_foodamt').AsInteger) );
      updateOrgtb_foodeventRelay(
        FindField('GROUP_CODE').AsString,
        FindField('fo_date').AsString,
        FindField('fo_time').AsString,
        inttostr(FindField('ac_nodeno').AsInteger),
        FindField('fo_doorno').AsString,
        FindField('co_companycode').AsString,
        FindField('em_code').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.InsertIntotb_foodevent(aGROUP_CODE, afo_date, afo_time,
  aac_nodeno, afo_doorno, aco_companycode, aem_code, afo_foodcode,
  afo_permit, afo_inserttime, afo_insertoperator, afo_updatetime,
  afo_updateoperator, aac_mcuid, aac_ecuid, afo_content,
  afo_foodamt: string): Boolean;
var
  stSql : string;
begin

  stSql := ' Insert Into tb_foodevent( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'fo_date, ';
  stSql := stSql + 'fo_time, ';
  stSql := stSql + 'ac_nodeno, ';
  stSql := stSql + 'fo_doorno, ';
  stSql := stSql + 'co_companycode, ';
  stSql := stSql + 'em_code, ';
  stSql := stSql + 'fo_foodcode, ';
  stSql := stSql + 'fo_permit, ';
  stSql := stSql + 'fo_inserttime, ';
  stSql := stSql + 'fo_insertoperator, ';
  stSql := stSql + 'fo_updatetime, ';
  stSql := stSql + 'fo_updateoperator, ';
  stSql := stSql + 'ac_mcuid, ';
  stSql := stSql + 'ac_ecuid, ';
  stSql := stSql + 'fo_content, ';
  stSql := stSql + 'fo_foodamt )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + afo_date + ''',';
  stSql := stSql + '''' + afo_time + ''',';
  stSql := stSql + '' + aac_nodeno + ',';
  stSql := stSql + '''' + afo_doorno + ''',';
  stSql := stSql + '''' + aco_companycode + ''',';
  stSql := stSql + '''' + aem_code + ''',';
  stSql := stSql + '''' + afo_foodcode + ''',';
  stSql := stSql + '''' + afo_permit + ''',';
  stSql := stSql + '''' + afo_inserttime + ''',';
  stSql := stSql + '''' + afo_insertoperator + ''',';
  stSql := stSql + '''' + afo_updatetime + ''',';
  stSql := stSql + '''' + afo_updateoperator + ''',';
  stSql := stSql + '''' + aac_mcuid + ''',';
  stSql := stSql + '''' + aac_ecuid + ''',';
  stSql := stSql + '''' + afo_content + ''',';
  stSql := stSql + '' + afo_foodamt + ')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.updateOrgtb_foodeventRelay(aGROUP_CODE, afo_date, afo_time,
  aac_nodeno, afo_doorno, aco_companycode, aem_code,
  afoRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update tb_foodevent set fo_RELAY = ''' + afoRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND fo_date = ''' + afo_date + ''' ';
  stSql := stSql + ' AND fo_time = ''' + afo_time + ''' ';
  stSql := stSql + ' AND ac_nodeno = ' + aac_nodeno + ' ';
  stSql := stSql + ' AND fo_doorno = ''' + afo_doorno + ''' ';
  stSql := stSql + ' AND co_companycode = ''' + aco_companycode + ''' ';
  stSql := stSql + ' AND em_code = ''' + aem_code + ''' ';

  with orgADOExeQuery do
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

function TForm1.InsertIntoTB_CONFIG(aGROUP_CODE, aco_configgroup,
  aco_configcode, aco_configvalue, aco_configdetail: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_CONFIG( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'co_configgroup, ';
  stSql := stSql + 'co_configcode, ';
  stSql := stSql + 'co_configvalue, ';
  stSql := stSql + 'co_configdetail )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + '''' + aco_configgroup + ''',';
  stSql := stSql + '''' + aco_configcode + ''',';
  stSql := stSql + '''' + aco_configvalue + ''',';
  stSql := stSql + '''' + aco_configdetail + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.TargetTableDelete(aTableName: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From ' + aTableName ;
  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;
end;

function TForm1.AlterTB_ACCESSEVENT_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_ACCESSEVENT ADD AC_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_ACCESSEVENT_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(AC_RELAY) as AC_RELAY From TB_ACCESSEVENT ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('AC_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TForm1.AlterTB_ALARMEVENT_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_ALARMEVENT ADD AL_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_ALARMEVENT_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(AL_RELAY) as AL_RELAY From TB_ALARMEVENT ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('AL_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TForm1.AlterTB_ATEVENT_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_ATEVENT ADD AT_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_ATEVENT_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(AT_RELAY) as AT_RELAY From TB_ATEVENT ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('AT_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;
end;

function TForm1.AlterTB_FOODEVENT_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_FOODEVENT ADD FO_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_FOODEVENT_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(FO_RELAY) as FO_RELAY From TB_FOODEVENT ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('FO_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;
end;

function TForm1.AlterTB_CARD_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_CARD ADD CA_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_CARD_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(CA_RELAY) as CA_RELAY From TB_CARD ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('CA_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;
end;

function TForm1.TB_CARDConvertProcess(aStartPoint,
  aEndPoint: integer): Boolean;
var
  stSql : string;
  nCount : integer;
  stCompanyCode : string;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_CARD ';
  stSql := stSql + ' where ca_relay is null ';
  stSql := stSql + ' OR ca_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      InsertIntoTB_CARD(
        FindField('GROUP_CODE').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('CA_GUBUN').AsString,
        FindField('CA_CARDTYPE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        FindField('CA_LASTUSE').AsString,
        FindField('CA_UPDATETIME').AsString,
        FindField('CA_UPDATEOPERATOR').AsString,
        FindField('CA_STATUS').AsString,
        FindField('POSITIONNUM').AsString
        );
      updateOrgTB_CARDRelay(FindField('GROUP_CODE').AsString,
        FindField('CA_CARDNO').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.updateOrgTB_CARDRelay(aGROUP_CODE, aCA_CARDNO,
  aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_CARD set CA_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCA_CARDNO + ''' ';

  with orgADOExeQuery do
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

function TForm1.AlterTB_EMPHIS_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_EMPHIS ADD EH_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.CheckTB_EMPHIS_RELAY: Boolean;
var
  stSql : string;
  stTemp : string;
begin
  result := False;
  stSql := ' Select Max(EH_RELAY) as EH_RELAY From TB_EMPHIS ';
  with OrgTempADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Try
      stTemp := FindField('EH_RELAY').AsString;
    Except
      Exit;
    End;
    result := True;
  end;

end;

function TForm1.TB_EMPHISConvertProcess(aStartPoint,
  aEndPoint: integer): Boolean;
var
  stSql : string;
  nCount : integer;
  stCompanyCode : string;
  nFdmsId : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_EMPHIS ';
  stSql := stSql + ' where eh_relay is null ';
  stSql := stSql + ' OR eh_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      nFdmsId := 0;
      if not FindField('FDMS_ID').IsNull then
        nFdmsId := FindField('FDMS_ID').AsInteger;
      InsertIntoTB_EMPHIS(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        inttostr(nFdmsId),
        FindField('MODE').AsString,
        FindField('SEND_STATUS').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('CA_CARDTYPE').AsString,
        FindField('SEND_STATUS2').AsString,
        FindField('EH_INSERTTIME').AsString);

      updateOrgTB_EMPHISRelay(inttostr(FindField('SEQ').AsInteger),
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.updateOrgTB_EMPHISRelay(aSeq, aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_EMPHIS set EH_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where SEQ = ''' + aSeq + ''' ';

  with orgADOExeQuery do
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

function TForm1.AlterTB_EMPLOYEE_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_EMPLOYEE ADD EM_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.TB_EMPLOYEEConvertProcess(aStartPoint,
  aEndPoint: integer): Boolean;
var
  stSql : string;
  nCount : integer;
  stCompanyCode : string;
  stJijumCode : string;
  nFdmsId : integer;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_EMPLOYEE ';
  stSql := stSql + ' where em_relay is null ';
  stSql := stSql + ' OR em_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      stCompanyCode := FindField('CO_COMPANYCODE').AsString;
      if chk_Company.Checked then
        stCompanyCode := L_stCompanyCode;
      stJijumCode := FindField('CO_JIJUMCODE').AsString;
      if isDigit(stJijumCode) then
      begin
        stJijumCode := FillZeroNumber(strtoint(stJijumCode) + L_incJijumCode,3);
      end;
      nFdmsId := 0;
      if not FindField('FDMS_ID').IsNull then
        nFdmsId := FindField('FDMS_ID').AsInteger;
      InsertIntoTB_EMPLOYEE(
        FindField('GROUP_CODE').AsString,
        stCompanyCode,
        FindField('EM_CODE').AsString,
        stJijumCode,
        FindField('CO_DEPARTCODE').AsString,
        FindField('PO_POSICODE').AsString,
        FindField('EM_NAME').AsString,
        FindField('EM_COPHONE').AsString,
        FindField('EM_HOMEPHONE').AsString,
        FindField('EM_HANDPHONE').AsString,
        FindField('ZI_ZIPCODE').AsString,
        FindField('EM_ADDR1').AsString,
        FindField('EM_ADDR2').AsString,
        FindField('EM_JOINDATE').AsString,
        FindField('EM_RETIREDATE').AsString,
        FindField('EM_PASS').AsString,
        FindField('AT_ATCODE').AsString,
        FindField('EM_UPDATETIME').AsString,
        FindField('EM_UPDATEOPERATOR').AsString,
        inttostr(nFdmsId),
        FindField('FDMS_RELAY').AsString,
        FindField('RG_CODE').AsString);

      updateOrgTB_EMPLOYEERelay(FindField('GROUP_CODE').AsString,stCompanyCode,
        FindField('EM_CODE').AsString,'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.updateOrgTB_EMPLOYEERelay(aGroupCode,aCompanyCode, aEmCode,
  aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_EMPLOYEE set EM_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGroupCode + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  with orgADOExeQuery do
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

function TForm1.AlterTB_DEVICECARDNO_RELAY: Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'ALTER TABLE TB_DEVICECARDNO ADD DC_RELAY char(1) NULL ';

  with orgADOExeQuery do
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

function TForm1.TB_DEVICECARDNOConvertProcess(aStartPoint,
  aEndPoint: integer): Boolean;
var
  stSql : string;
  nCount : integer;
  stCompanyCode : string;
begin
  nCount := 1000;
  stSql := 'select ';
  if rg_orgDBType.ItemIndex = 0 then stSql := stSql + ' top ' + inttostr(nCount);
  stSql := stSql + ' * from TB_DEVICECARDNO ';
  stSql := stSql + ' where dc_relay is null ';
  stSql := stSql + ' OR dc_relay <> ''Y'' ';
  if rg_orgDBType.ItemIndex = 1 then stSql := stSql + ' LIMIT ' + inttostr(nCount) + ' OFFSET 0 ' ;
  with orgProcessADOQuery do
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
      if(L_bStop) then Exit;
      InsertIntoTB_DEVICECARDNO(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('CA_CARDNO').AsString,
        FindField('DE_DOOR1').AsString,
        FindField('DE_DOOR2').AsString,
        FindField('DE_DOOR3').AsString,
        FindField('DE_DOOR4').AsString,
        FindField('DE_DOOR5').AsString,
        FindField('DE_DOOR6').AsString,
        FindField('DE_DOOR7').AsString,
        FindField('DE_DOOR8').AsString,
        FindField('DE_ALARM0').AsString,
        FindField('DE_ALARM1').AsString,
        FindField('DE_ALARM2').AsString,
        FindField('DE_ALARM3').AsString,
        FindField('DE_ALARM4').AsString,
        FindField('DE_ALARM5').AsString,
        FindField('DE_ALARM6').AsString,
        FindField('DE_ALARM7').AsString,
        FindField('DE_ALARM8').AsString,
        FindField('DE_USEACCESS').AsString,
        FindField('DE_USEALARM').AsString,
        FindField('DE_TIMECODE').AsString,
        FindField('DE_PERMIT').AsString,
        FindField('DE_RCVACK').AsString,
        FindField('DE_UPDATETIME').AsString,
        FindField('DE_UPDATEOPERATOR').AsString,
        FindField('AC_MCUID').AsString);

      updateOrgTB_DEVICECARDNORelay(FindField('GROUP_CODE').AsString,
        inttostr(FindField('AC_NODENO').AsInteger + L_IncNodeNo),
        FindField('AC_ECUID').AsString,
        FindField('CA_CARDNO').AsString,
        'Y');
      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
end;

function TForm1.updateOrgTB_DEVICECARDNORelay(aGROUP_CODE, aNodeNo, aEcuId,
  aCardNo, aRelay: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Update TB_DEVICECARDNO set DC_RELAY = ''' + aRelay + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + aGROUP_CODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';

  with orgADOExeQuery do
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

function TForm1.TB_DEVICESCHEDULEConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'TB_DEVICESCHEDULE';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_DEVICESCHEDULE ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntoTB_DEVICESCHEDULE(
        FindField('GROUP_CODE').AsString,
        inttostr(FindField('ac_nodeno').AsInteger),
        FindField('ac_ecuid').AsString,
        FindField('do_doorno').AsString,
        FindField('de_daycode').AsString,
        FindField('de_cell1time').AsString,
        FindField('de_cell1mode').AsString,
        FindField('de_cell2time').AsString,
        FindField('de_cell2mode').AsString,
        FindField('de_cell3time').AsString,
        FindField('de_cell3mode').AsString,
        FindField('de_cell4time').AsString,
        FindField('de_cell4mode').AsString,
        FindField('de_cell5time').AsString,
        FindField('de_cell5mode').AsString,
        FindField('de_updatetime').AsString,
        FindField('de_updateoperator').AsString,
        FindField('de_rcvack').AsString,
        FindField('ac_mcuid').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;

function TForm1.InsertIntoTB_DEVICESCHEDULE(aGROUP_CODE, aAC_NODENO,
  aAC_ECUID, aDO_DOORNO, aDE_DAYCODE, aDE_CELL1TIME, aDE_CELL1MODE,
  aDE_CELL2TIME, aDE_CELL2MODE, aDE_CELL3TIME, aDE_CELL3MODE,
  aDE_CELL4TIME, aDE_CELL4MODE, aDE_CELL5TIME, aDE_CELL5MODE,
  aDE_UPDATETIME, aDE_UPDATEOPERATOR, aDE_RCVACK,
  aAC_MCUID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICESCHEDULE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DE_DAYCODE,';
  stSql := stSql + 'DE_CELL1TIME,';
  stSql := stSql + 'DE_CELL1MODE,';
  stSql := stSql + 'DE_CELL2TIME,';
  stSql := stSql + 'DE_CELL2MODE,';
  stSql := stSql + 'DE_CELL3TIME,';
  stSql := stSql + 'DE_CELL3MODE,';
  stSql := stSql + 'DE_CELL4TIME,';
  stSql := stSql + 'DE_CELL4MODE,';
  stSql := stSql + 'DE_CELL5TIME,';
  stSql := stSql + 'DE_CELL5MODE,';
  stSql := stSql + 'DE_UPDATETIME,';
  stSql := stSql + 'DE_UPDATEOPERATOR,';
  stSql := stSql + 'DE_RCVACK,';
  stSql := stSql + 'AC_MCUID )';
  stSql := stSql + ' VALUES(';
  stSql := stSql + '''' + aGROUP_CODE + ''',';
  stSql := stSql + aAC_NODENO + ',';
  stSql := stSql + '''' + aAC_ECUID + ''',';
  stSql := stSql + '''' + aDO_DOORNO + ''',';
  stSql := stSql + '''' + aDE_DAYCODE + ''',';
  stSql := stSql + '''' + aDE_CELL1TIME + ''',';
  stSql := stSql + '''' + aDE_CELL1MODE + ''',';
  stSql := stSql + '''' + aDE_CELL2TIME + ''',';
  stSql := stSql + '''' + aDE_CELL2MODE + ''',';
  stSql := stSql + '''' + aDE_CELL3TIME + ''',';
  stSql := stSql + '''' + aDE_CELL3MODE + ''',';
  stSql := stSql + '''' + aDE_CELL4TIME + ''',';
  stSql := stSql + '''' + aDE_CELL4MODE + ''',';
  stSql := stSql + '''' + aDE_CELL5TIME + ''',';
  stSql := stSql + '''' + aDE_CELL5MODE + ''',';
  stSql := stSql + '''' + aDE_UPDATETIME + ''',';
  stSql := stSql + '''' + aDE_UPDATEOPERATOR + ''',';
  stSql := stSql + '''' + aDE_RCVACK + ''',';
  stSql := stSql + '''' + aAC_MCUID + ''')';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

function TForm1.TableVersionInitialize: Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_CONFIG set CO_CONFIGVALUE = ''0'' ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''COMMON''';
  stSql := stSql + ' AND CO_CONFIGCODE = ''TABLE_VER''';

  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(stSql);
    End;
  end;
  result := True;

end;

procedure TForm1.AlterTB_ACCESSDEVICE_NameChange;
var
  stSql : string;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_CARDREADERTYPE varchar(10) ';
  end else
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_CARDREADERTYPE TYPE varchar(10) ';
  end;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      //memo1.Lines.Add(stSql);
    End;
  end;

end;

procedure TForm1.AlterTB_ACCESSDEVICE_JAVARATypeAdd;
var
  stSql : string;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_JAVARATYPE varchar(1)  DEFAULT ''0'' NULL ';
  end else
  begin
    stSql := 'ALTER TABLE TB_ACCESSDEVICE ADD AC_JAVARATYPE varchar(1) DEFAULT ''0''  NULL ';
  end;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      //memo1.Lines.Add(stSql);
    End;
  end;
end;

procedure TForm1.AlterTB_ACCESSDEVICE_MCUIDChange;
var
  stSql : string;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_MCUID varchar(30) ';
  end else
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_MCUID TYPE varchar(30) ';
  end;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      //memo1.Lines.Add(stSql);
    End;
  end;
end;

procedure TForm1.AlterTB_ACCESSDEVICE_VerChange;
var
  stSql : string;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_VER varchar(100) ';
  end else
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_VER TYPE varchar(100) ';
  end;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      //memo1.Lines.Add(stSql);
    End;
  end;
end;

procedure TForm1.AlterTB_ACCESSDEVICE_CARDREADERTYPEChange;
var
  stSql : string;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_VER varchar(100) ';
  end else
  begin
    stSql := 'alter table TB_ACCESSDEVICE alter column  AC_VER TYPE varchar(100) ';
  end;

  with targetADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      ExecSql;
    Except
      //memo1.Lines.Add(stSql);
    End;
  end;
end;

procedure TForm1.AlterTB_ALARMDEVICE_INDEXChange;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  if (rg_targetDBType.ItemIndex =0) then
  begin
    stSql := 'alter table tb_alarmdevice alter column al_zonenum varchar(2) NOT NULL ';
    targetProcessExec(stSql);
    stSql := ' ALTER TABLE TB_ALARMDEVICE ADD DEFAULT ''00'' FOR AL_ZONENUM ';
    targetProcessExec(stSql);

    stSql := 'alter table TB_ALARMEVENT alter column AL_ZONECODE varchar(2) NOT NULL ';
    targetProcessExec(stSql);
    stSql := ' ALTER TABLE TB_ALARMEVENT ADD DEFAULT ''00'' FOR AL_ZONECODE ';
    targetProcessExec(stSql);

    Try
      CoInitialize(nil);
      TempAdoQuery := TADOQuery.Create(nil);
      TempAdoQuery.Connection := targetADOConnection;
      TempAdoQuery.DisableControls;
      with TempAdoQuery do
      begin
        Close;
        //sql.Clear;
        stSql := 'select name from sysobjects where xtype= ''PK'' and parent_obj=(select id from sysobjects where name = ''tb_alarmdevice'')';
        sql.Text := stSql;
        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if recordcount > 0 then
        begin
          stSql := 'ALTER TABLE tb_alarmdevice DROP ' + FindField('name').AsString ;
          targetProcessExec(stSql);
        end;
        Close;
        //sql.Clear;
        stSql := 'select name from sysobjects where xtype= ''PK'' and parent_obj=(select id from sysobjects where name = ''tb_alarmevent'')';
        sql.Text := stSql;
        Try
          Open;
        Except
          //에러처리
          Exit;
        End;
        if recordcount > 0 then
        begin
          stSql := 'ALTER TABLE tb_alarmevent DROP ' + FindField('name').AsString ;
          targetProcessExec(stSql);
        end;
      End;
    Finally
      TempAdoQuery.EnableControls;
      TempAdoQuery.Free;
      CoUninitialize;
    End;
    stSql := 'alter table tb_alarmdevice add constraint PK_alarmdevice PRIMARY KEY (GROUP_CODE,AC_NODENO,AC_ECUID,AL_ZONENUM)';
    targetProcessExec(stSql);
    stSql := 'alter table tb_alarmevent add constraint PK_alarmevent PRIMARY KEY (group_code, al_date, al_time, ac_nodeno, ac_ecuid, al_msgno,AL_ZONECODE)';
    targetProcessExec(stSql);
  end else
  begin
    stSql := 'ALTER TABLE tb_alarmdevice ALTER COLUMN al_zonenum SET DEFAULT ''00'' ';
    targetProcessExec(stSql);
    stSql := 'ALTER TABLE tb_alarmdevice ALTER COLUMN al_zonenum SET NOT NULL ';
    targetProcessExec(stSql);
    stSql := 'alter table tb_alarmdevice drop constraint tb_alarmdevice_pkey ';
    targetProcessExec(stSql);
    stSql := 'alter table tb_alarmdevice add primary key (GROUP_CODE,AC_NODENO,AC_ECUID,AL_ZONENUM)';
    targetProcessExec(stSql);
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ZONECODE SET DEFAULT ''00'' ';
    targetProcessExec(stSql);
    stSql := 'ALTER TABLE TB_ALARMEVENT ALTER COLUMN AL_ZONECODE SET NOT NULL ';
    targetProcessExec(stSql);
    stSql := 'alter table TB_ALARMEVENT drop constraint tb_alarmevent_pkey ';
    targetProcessExec(stSql);
    stSql := 'alter table TB_ALARMEVENT add primary key (group_code, al_date, al_time, ac_nodeno, ac_ecuid, al_msgno,AL_ZONECODE)';
    targetProcessExec(stSql);
  end;




end;

function TForm1.targetProcessExec(aSql: string): Boolean;
begin
  result := False;
  with targetADOQuery do
  begin
    Close;
    Sql.Text := aSql;
    Try
      ExecSql;
    Except
      memo1.Lines.Add(aSql);
      Exit;
    End;
  end;
  result := True;
end;

function TForm1.TB_ARMAREAConvert: Boolean;
var
  stSql : string;
begin
  result := False;
  lb_table.Caption := 'TB_ARMAREA';
  TargetTableDelete(lb_table.Caption);
  stSql := 'select * from TB_ARMAREA ';
  with orgADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    Gauge2.Progress := 0;
    Gauge2.MaxValue := recordcount;
    while Not Eof do
    begin
      if(L_bStop) then Exit;
      InsertIntoTB_ARMAREA(
        FindField('group_code').AsString,
        FindField('AC_NODENO').AsString,
        FindField('ac_ecuid').AsString,
        FindField('AR_AREANO').AsString,
        FindField('AR_NAME').AsString,
        FindField('AR_USE').AsString,
        FindField('ar_lastmode').AsString,
        FindField('ar_viewseq').AsString,
        FindField('ar_locateuse').AsString,
        FindField('ar_totwidth').AsString,
        FindField('ar_totheight').AsString,
        FindField('ar_curx').AsString,
        FindField('ar_cury').AsString,
        FindField('lo_dongcode').AsString,
        FindField('lo_floorcode').AsString,
        FindField('lo_areacode').AsString,
        FindField('ar_update').AsString,
        FindField('ar_telno').AsString,
        FindField('ar_memo').AsString,
        FindField('ag_armcode').AsString,
        FindField('ar_memload').AsString,
        FindField('ar_disarmcheckuse').AsString,
        FindField('ar_disarmchecktime1from').AsString,
        FindField('ar_disarmchecktime1to').AsString,
        FindField('ar_change').AsString,
        FindField('ar_relaycode').AsString);

      Gauge2.Progress := Gauge2.Progress + 1;
      Application.ProcessMessages;
      Next;
    end;
  end;
  result := True;
end;


function TForm1.InsertIntoTB_ARMAREA(aGroup_Code, aAC_NODENO, aAc_ecuid,
  aAR_AREANO, aAR_NAME, aAR_USE, aAr_lastmode, aAr_viewseq, aAr_locateuse,
  aAr_totwidth, aAr_totheight, aAr_curx, aAr_cury, aLo_dongcode,
  aLo_floorcode, aLo_areacode, aAr_update, aAr_telno, aAr_memo,
  aAg_armcode, aAr_memload, aAr_disarmcheckuse, aAr_disarmchecktime1from,
  aAr_disarmchecktime1to, aAr_change, aAr_relaycode: string): Boolean;
var
  stSql : string;
begin

  if Not isdigit(aAr_disarmcheckuse) then aAr_disarmcheckuse := '0';

  stSql := ' Insert Into TB_ARMAREA( ';
  stSql := stSql + 'GROUP_CODE, ';
  stSql := stSql + 'ac_nodeno, ';
  stSql := stSql + 'ac_ecuid, ';
  stSql := stSql + 'ar_areano, ';
  stSql := stSql + 'ar_name, ';
  stSql := stSql + 'ar_use, ';
  stSql := stSql + 'ar_lastmode, ';
  stSql := stSql + 'ar_viewseq, ';
  stSql := stSql + 'ar_locateuse, ';
  stSql := stSql + 'ar_totwidth, ';
  stSql := stSql + 'ar_totheight, ';
  stSql := stSql + 'ar_curx, ';
  stSql := stSql + 'ar_cury, ';
  stSql := stSql + 'lo_dongcode, ';
  stSql := stSql + 'lo_floorcode, ';
  stSql := stSql + 'lo_areacode, ';
  stSql := stSql + 'ar_update, ';
  stSql := stSql + 'ar_telno, ';
  stSql := stSql + 'ar_memo, ';
  stSql := stSql + 'ag_armcode, ';
  stSql := stSql + 'ar_memload, ';
  stSql := stSql + 'ar_disarmcheckuse, ';
  stSql := stSql + 'ar_disarmchecktime1from, ';
  stSql := stSql + 'ar_disarmchecktime1to, ';
  stSql := stSql + 'ar_change, ';
  stSql := stSql + 'ar_relaycode )';
  stSql := stSql + ' Values( ';
  stSql := stSql + '''' + aGroup_Code+ ''',';
  stSql := stSql + '' + aAC_NODENO+ ',';
  stSql := stSql + '''' + aAc_ecuid + ''',';
  stSql := stSql + '''' + aAR_AREANO + ''',';
  stSql := stSql + '''' + aAR_NAME + ''',';
  stSql := stSql + '''' + aAR_USE + ''',';
  stSql := stSql + '''' + aAr_lastmode + ''',';
  stSql := stSql + '' + aAr_viewseq + ',';
  stSql := stSql + '''' + aAr_locateuse + ''',';
  stSql := stSql + '' + aAr_totwidth + ',';
  stSql := stSql + '' + aAr_totheight + ',';
  stSql := stSql + '' + aAr_curx + ',';
  stSql := stSql + '' + aAr_cury + ',';
  stSql := stSql + '''' + aLo_dongcode + ''',';
  stSql := stSql + '''' + aLo_floorcode + ''',';
  stSql := stSql + '''' + aLo_areacode + ''',';
  stSql := stSql + '''' + aAr_update + ''',';
  stSql := stSql + '''' + aAr_telno + ''',';
  stSql := stSql + '''' + aAr_memo + ''',';
  stSql := stSql + '''' + aAg_armcode + ''',';
  stSql := stSql + '''' + aAr_memload + ''',';
  stSql := stSql + '' + aAr_disarmcheckuse + ',';
  stSql := stSql + '''' + aAr_disarmchecktime1from + ''',';
  stSql := stSql + '''' + aAr_disarmchecktime1to + ''',';
  stSql := stSql + '''' + aAr_change + ''',';
  stSql := stSql + '''' + aAr_relaycode + ''')';


  targetProcessExec(stSql);
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  L_bStop := True;
end;

end.
