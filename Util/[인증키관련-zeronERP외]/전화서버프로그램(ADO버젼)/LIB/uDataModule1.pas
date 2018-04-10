{***************************************************************}
{                                                               }
{  uDataModule1.Pas :DB Module1                                 }
{                                                               }
{  Copyright (c) 2005 this70@naver.com                          }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}
unit uDataModule1;




interface

uses
  Controls,
  Dialogs,
  uLomosUtil,
  ComCtrls,
  Messages,
  SysUtils,
  Classes,
  DB,
  dbisamtb, LMDCustomComponent, ADODB,iniFiles,forms,SyncObjs,ActiveX;

const
  Msg_CardNoDownload  = WM_USER + 1004;
  MAXBUFFSIZE = 1024;
  SERVERTIMEOUT = 6000;
  LINEEND = #13;  //Ŭ���̾�Ʈ���� �ѹ����� ���� �˸��� �����Ͱ�
  DATADELIMITER = '^';
  DelayTime = 100;
  RETRYCOUNT = 3;
  DOORCOUNT = 2;  //���� ���Թ� ��� ����
  CARDREADERCOUNT = 8; //���� ī�帮�� ��� ����
  ZONECOUNT = 8;   //���� �� ����
  DOORTYPE  = '1'; //Door Type
  ALARMTYPE = '2'; //ALARM TYPE
  GRADETYPE = '3'; //GRADE TYPE


const
 USE_ENUMPORTS_API = False;
 MAX_COMPORT = 36;       // �ִ� 255 ����
 MAX_LISTCOUNT = 100; //����Ʈ ��� count

const
  MCUBMP = 'MCU.bmp';
  ECUBMP = 'ECU.bmp';
  DOORBMP = 'DOOR.bmp';
  DOOROPEROPEN = 'DOOROPEROPEN.bmp';
  DOOROPERCLOSE = 'DOOROPERCLOSE.bmp';
  DOORNOTOPEROPEN = 'DOORNOTOPEROPEN.bmp';
  DOORNOTOPERCLOSE = 'DOORNOTOPERCLOSE.bmp';
  ALARMBMP = 'ALARM.bmp';
  WATCHALARM = 'WATCHALARM.bmp';
  NOTWATCHALARM = 'NOTWATCHALARM.bmp';
  WARNINGALARM = 'WARNINGALARM.bmp';
  FOODBMP = 'FOOD.bmp';
  ZONEBMP = 'ZONE.bmp';

type
//  TSystemType = (stDoor,stAlarm,stGrade);
  //TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  TDownloadMode = (dmNone,dmTimeSync,dmCardData,dmCheckDoor);

  TDataModule1 = class(TDataModule)
    ADOConnection: TADOConnection;
    ADOQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    ADOExecQuery: TADOQuery;
    ADOConnectionEVENT: TADOConnection;
    ADOConnectionLOG: TADOConnection;
    ADOBackupConnection: TADOConnection;
    ADOTmpQuery: TADOQuery;
    procedure Query_IDAfterPost(DataSet: TDataSet);
    procedure Query_IDBeforeDelete(DataSet: TDataSet);
    procedure Query_IDBeforeEdit(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    isEditMode: Boolean;
    BeforeCardNo: String;
    Function ProcessExecSQL(sqlst:String): Boolean;
    Function ProcessBackupExecSQL(sqlst:String): Boolean;
    Function ProcessEventExecSQL(sqlst:String): Boolean;
    Function ProcessLogExecSQL(sqlst:String): Boolean;
    {SQLLOG����}
    procedure SQLErrorLog(aSQL:string);

    function CheckPermit(aCardNo: String; aNodeNo:integer; aECUID:String; DoorNo: Char;
         var aACType:Char; var aPTType:char; Var aRegCode:Char; Var aTimeCode:Char ): Boolean;
    function GetCardInfofromCardNo(aCardNo:String; var aCo:String; var aSabun: String ):Boolean;
    function DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID,aDoorNo,aCardNo:String):Boolean;
    function DupCheckTB_DEVICE_CARDNO(aCardNo,aNodeNo,aECUID: String):Boolean;
    function DupCheckTB_FOOD_EVENT(aTime:string; aNodeNo:integer;aECUID,aReaderNo,aCardNo:String):Boolean;
    function DupCheckTB_SUBJECTLEVEL(aSubjectCode,aLevelCode:String):Boolean;

    Procedure PermitDeviceCard(aCardNo:String;aPermit:Char);

    function CardPermitCheck(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardPermitDelete(aCardNo,aNodeNo,aECUID,aPermit:String):Boolean;
    function CardRCV_ACKUpdate(aCardNo,aNodeNo,aECUID,aRcv_Ack :String):Boolean;

    function TB_LOWDATAInsert(NodeNO:integer;aIP,aPort,aECUID,aTxRx:string;aCommand:char;aReceiveData:string):Boolean;
    function TB_SYSTEMLOGInsert(aNodeNo,aEcuID,aType,aNumber,aCardNo,aData:string):Boolean;

    Procedure UpdateCompanyName(OldCode,aCode:String; aName:String);
    Procedure UpdateDepartName(OldCode,aCode:String; aName:String);
    Procedure ChangeNewCardNo(OldCardNo,NewCardNo:String);
    class function GetObject:TDataModule1;

  end;

var
  DataModule1: TDataModule1;
  IsServer: Integer;
  CompanyCode: String[10];
  DepartCode: String[3];
  Master_ID : String;
  Master_Name : string;
  AdminGrade : String;
  APP_PATH : String;
  ExeFolder: String;
  IsClientSERVER : integer; //�Ѻ������� �������� ȸ�� ���� ��������
  IsAlarm : Boolean;  //��� ��� ����
  IsAttend : Boolean; //���� �������
//  ATTENDTYPE : String; //���»��Ÿ��(BUTTON/UPDATE/READERNO(1/2))
  FOODDEVICE : String; //READER/DOOR
  FOODGRADE : Integer; // 0: ���,1: ����
  GROUPCODE : String;  //����ڵ�Ϲ�ȣ �Ǵ� �׷챸���ڵ�10�ڸ�
  AttendUse : Boolean; //���� �������
  AccessUse : Boolean; //���� �������
  FoodUse : Boolean;   //�ļ� �������
  PatrolUse : Boolean; //��� �������
  SensorUse : Boolean; //���� �������
  RecvAck : Boolean;   //�۽ŵ����Ϳ� ���� ��������
  IsMaster : Boolean;  //Master ID���� üũ�Ͽ� Master ID�̸� ��� ���� �ο�
  CompanyGrade : String;  //ȸ�� ��� ���� 0: ��ü ȸ�� ,1: �ο��� ȸ��,2:�ο�������,3:�ο��� �μ�
  MasterCompany : string; //����� �Ҽ� ȸ��
  MasterJijum : string;    //����� �Ҽ� ����
  MasterDepart:string;     //����� �Ҽ� �μ�
  ComErrorList : TStringList;
  //Critical_SaveLog:     TCriticalSection;
  ComNodeList: TstringList;  //MCU����Ʈ
  DeviceList: TStringList;   //ECU����Ʈ
  ConnectDeviceList : TStringList; //Connect Device ID


  //SKT ��ǰ���
  bSKTLINK :BOOLEAN;
  DBType : string;
  DBName : string;
  DEVICEALARM : string;
  DEVICEALARMCNT : integer;
  DEVICEALARMFILE : string;
  SERVERALARM : string;
  SERVERALARMCNT : integer;
  SERVERALARMFILE : string;
  CurrentDAlarmCnt : integer;
  CurrentSAlarmCnt : integer;
  nCheckTime : integer;       //��� ������ �Ǵ��ϴ� üũ�ð�
  bDBBackup : Boolean;        //�����
  bApplicationTerminate : Boolean;  //APP ����
  bALARMSHORT : Boolean;   //��Ʈ ���� ��� ����
  bALARMDOWN  : Boolean;   //�ܼ� ���� ��� ����

  //���Žñ��� ��� �ϱ� ���� ���� ���� üũ
  bCardReaderTypeCheck : Boolean; //ī�帮�� Ÿ�� ���� ����
  bDoorInfoSet: Array [0..7] of Boolean;  //���Թ� ���� ���� ����
  bReaderInfoSet: Array [0..7] of Boolean; //ī�帮�� ���� ���� ����
  bPortInfoSet: Array [0..7] of Boolean; //��Ʈ ���� ���� ����
  bfmEmployShow : Boolean;   //������ ȭ�� ����
  bCheckUsedDevice : Boolean; //ECU üũ ���� ����
  bLinKusID : Boolean; //������̵� ��� ���� ����
  bLinKusMuxTel : Boolean; //��� Mux ��ȣ ��� ���� ����
  bSystemInfo : Boolean; //ECU System ���� ��� ���� ����

  bSeverConnected :Boolean; //���� ��������

implementation
uses
uMSDESql;

{$R *.dfm}

{ī�� ������ ���ο��� Ȯ��}
//CheckPermit(aCardNo,DeviceID,aDoorNo,aCardType,aRegCode,aTimeCode)

function TDataModule1.CheckPermit(aCardNo: String;      // ī���ȣ
                                  aNodeNo:integer;      //Node No
                                  aECUID :String;     // ECU ID
                                  DoorNo: Char;         // ��⳻ �� ��ȣ
                                  var aACType:Char;   // ��������(0:���� ��,1:���� ��)
                                  var aPTType:Char;   // �������('0':��� ��, 1: ��� ��)
                                  Var aRegCode:Char;    // ����ڵ�(0:1,2�� 1:1����,2:2����)
                                  Var aTimeCode:Char    // Ÿ���ڵ�
                                  ): Boolean;
var
  aCardPermit: Integer;
  stSql : string;
  TempQuery : TAdoQuery;
begin
  TempQuery := TAdoQuery.Create(nil);
  TempQuery.Connection := AdoConnection;

  Result:= False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempQuery.Free;
      Exit;
    End;

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
      //ī��Ÿ�� Ȯ��
      if (FindField('DE_USEACCESS').asString = 'Y') then  aACType:= '1'   //���Ա��� ��
      else  aACType:= '0';                                             //���Ա��� ��
      if FindField('DE_USEALARM').asString = 'Y' then aPTType:= '1'     //��� ���� ��
      else aPTType := '0';                                             //��� ���� ��

      // ����ڵ� Ȯ��
      if (FindField('DE_DOOR1').asstring = 'Y') and (FindField('DE_DOOR2').asstring = 'Y') then
        aRegCode:= '0'
      else if FindField('DE_DOOR1').asstring = 'Y' then
        aRegCode:= '1'
      else if FindField('DE_DOOR2').asstring = 'Y' then
        aRegCode:= '2'
      else
        aRegCode:= '3';

      // Ÿ�� �ڵ�
      if FindField('DE_TIMECODE').asString <> '' then
        aTimeCode := FindField('DE_TIMECODE').asString[1];

    end;
  end;
  TempQuery.Free;
end;

function TDataModule1.GetCardInfofromCardNo(aCardNo:String;
         var aCo:String; Var aSabun: String ):Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  Result:= False;
  stSql := ' select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount > 0 then
    begin
      aCo:=   Trim(FindField('CO_COMPANYCODE').AsString);
      aSabun:= Trim(FindField('EM_CODE').AsString);
      Result:= True;
    end;
  end;
  TempAdoQuery.Free;
end;



procedure TDataModule1.Query_IDAfterPost(DataSet: TDataSet);
var
  aCardNo: String;
  aPermit: Char;
begin
(*  aCardNo:= Query_ID.FindField('CARD_NO').asString;
  if Query_ID.FindField('CARD_STATE').asString = '1' then aPermit:= 'L'
  else                                                    aPermit:= 'N';
  PermitDeviceCard(aCardNo,aPermit);

  // ������ ������ ���� ī��� �ٸ��� ���� ī���ȣ�� ���� �Ѵ�.
  if (isEditMode = True) and (BeforeCardNo <> aCardNo) then
  begin
    PermitDeviceCard(BeforeCardNo,'N');
    if MessageDlg('����� ����,����,�ļ��������� ī���ȣ�� ��κ��� �Ͻðڽ��ϱ�?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    begin
      ChangeNewCardNo(BeforeCardNo,aCardNo);
      MessageDlg('ī���ȣ ������ �Ϸ� �Ǿ����ϴ�.', mtInformation, [mbOK], 0);
    end;

  end;
*)

end;

Procedure TDataModule1.PermitDeviceCard(aCardNo:String;aPermit:Char);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_DEVICECARDNO ';
  stSql := stSql + ' SET DE_PERMIT = ''' + aPermit + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' WHERE CA_CARDNO = ''' + aCardNo + ''' ';
  ProcessExecSql(stSql);

end;

procedure TDataModule1.Query_IDBeforeDelete(DataSet: TDataSet);
var
  aCardNo: String;
begin
  //UpdateSQL_Query_ID.Apply(ukDelete);
(*  aCardNo:= DataSet.FindField('CARD_NO').asString;
  with CommonQuery do
  begin
    SQL.Clear;
    SQL.Add('delete from TB_CARD');
    SQL.Add('where CARD_NO = :CARD_NO');
    ParambyName('CARD_NO').asString:= aCardNo;
    EXECSQL;
  end;
  PermitDeviceCard(aCardNo,'N'); *)
end;

procedure TDataModule1.Query_IDBeforeEdit(DataSet: TDataSet);
begin
(*  BeforeCardNo:= DataSet.FindField('CARD_NO').asString;  *)
end;

//TB_CARD�� ȸ��� ����
procedure TDataModule1.UpdateCompanyName(OldCode,aCode, aName: String);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_CARD ';
  stSql := stSql + ' SET CO_CODE = ''' + aCode + ''', CO_NAME = ''' + aName + '''';
  stSql := stSql + ' WHERE CO_CODE =  ''' + OldCode + '''';
  ProcessExecSql(stSql);

end;

//TB_CARD�� �μ��� ����
procedure TDataModule1.UpdateDepartName(OldCode,aCode, aName: String);
var
  stSql : string;
begin
  stSql := 'UPDATE TB_CARD ';
  stSql := stSql + ' SET DEPART_CODE = ''' + aCode + ''', DEPART_NAME = ''' + aName + '''';
  stSql := stSql + ' WHERE DEPART_CODE =  ''' + OldCode + '''';

  ProcessExecSql(stSql);

end;
procedure TDataModule1.ChangeNewCardNo(OldCardNo, NewCardNo: String);
var
  stSql : string;
begin
  MessageDlg(OldCardNo + #13 + NewcardNo, mtInformation, [mbOK], 0);
  //���Ե�����
  stSql := 'UPDATE TB_ACCESS_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql := stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';

  ProcessExecSql(stSql);

  //���µ�����
  stSql := ' UPDATE TB_AT_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql :=  stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';
  ProcessExecSql(stSql);


  //�ļ�������
  stSql := ' UPDATE TB_FOOD_EVENT ';
  stSql := stSql + ' SET CARD_NO = ''' + NewCardNo + ''' ';
  stSql :=  stSql + ' WHERE CARD_NO = ''' + OldCardNo + ''' ';
  ProcessExecSql(stSql);
  
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
{var
  conStr : wideString;
  Host : String;
  userID : String;
  userPW : String;
  ini_fun : TiniFile;
  DBName : String;
  ExeFolder : String; }
begin
  ComErrorList := TStringList.Create;
  ComErrorList.Clear;
{    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\ktmos.INI');

    Host  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    userID := ini_fun.ReadString('DBConfig','UserID','sa');
    userPW := ini_fun.ReadString('DBConfig','UserPW','saPasswd');
    DBName := ini_fun.ReadString('DBConfig','DBNAME','KTMOS');
    GROUPCODE := ini_fun.ReadString('COMPANY','GROUPCODE','1234567890');
    ini_fun.free;
    conStr := '';
    conStr := constr + 'Provider=SQLOLEDB.1;';
    conStr := constr + 'Password=' + userPW + ';';
    conStr := constr + 'Persist Security Info=True;';
    conStr := constr + 'User ID=' + userID + ';';
    conStr := constr + 'Initial Catalog=' + DBName + ';';
    conStr := constr + 'Data Source=' + Host;

    ADOConnection.ConnectionString := conStr;
    ADOConnection.LoginPrompt:= false ;
    Try
      ADOConnection.Connected := True;
    Except
      on E : EDatabaseError do
        begin
          // ERROR MESSAGE-BOX DISPLAY
          ShowMessage(E.Message );
          Exit;
        end;
    End;    }
end;

class function TDataModule1.GetObject: TDataModule1;
begin
 If DataModule1 = Nil then DataModule1:= TDataModule1.Create(Nil);
 Result:= DataModule1;

end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
//  DataModule1.Free;
  DataModule1 := Nil;

end;

function TDataModule1.DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID, aDoorNo,
  aCardNo: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(aNodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then result := True;

  end;
  TempAdoQuery.Free;
end;

function TDataModule1.CardPermitCheck(aCardNo, aNodeNo,aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;

  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DE_PERMIT = ''' + aPermit + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;

end;

function TDataModule1.CardPermitDelete(aCardNo, aNodeNo,aECUID,
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

  result := ProcessExecSql(stSql);

end;

function TDataModule1.DupCheckTB_DEVICE_CARDNO(aCardNo,aNodeNo,aECUID: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;
end;

function TDataModule1.CardRCV_ACKUpdate(aCardNo, aNodeNo,aECUID,
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

  result := ProcessExecSql(stSql);

end;

function TDataModule1.DupCheckTB_FOOD_EVENT(aTime:string; aNodeNo:integer;aECUID, aReaderNo,
  aCardNo: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' and AC_NodeNO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if RecordCount > 0 then result := True;

  end;
  TempAdoQuery.Free;
end;


function TDataModule1.DupCheckTB_SUBJECTLEVEL(aSubjectCode,
  aLevelCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := ADOConnection;

  result := False;
  stSql := 'select * from TB_SUBJECTLEVEL ';
  stSql := stSql + ' Where SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + ' AND LEVEL_CODE = :LEVEL_CODE ';

  with TempAdoQuery do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    Parameters.ParamByName('SUBJECT_CODE').Value := aSubjectCode;
    Parameters.ParamByName('LEVEL_CODE').Value := aLevelCode;

    try
      open
    except
      TempAdoQuery.Free;
      exit;
    end;

    if Recordcount > 0 then  result := True;

  end;
  TempAdoQuery.Free;
end;





function TDataModule1.TB_LOWDATAInsert(NodeNO: integer; aIP, aPort,
  aECUID, aTxRx: string; aCommand: char; aReceiveData: string): Boolean;
var
  stSql : string;
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

  result := ProcessExecSql(stSql);

end;

function TDataModule1.ProcessExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    if Not ADOConnection.Connected then ADOConnection.Connected := True;
    ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      SQL.Clear;
      SQL.Text:= sqlst;
      ExecSql;
    end;
  except
    begin
      ADOConnection.Connected := False;
      SQLErrorLog('DBError:'+ sqlst);
      ADOConnection.RollbackTrans;
      ExecQuery.Free;
      CoUninitialize;
      Exit;
    end
  end;
{  ON E: Exception do
    begin
      SQLErrorLog('DBError:'+ SQL.Text);
      ADOConnection.RollbackTrans;
      ExecQuery.Free;
      CoUninitialize;
      Exit;
    end
  end;  }
  ADOConnection.CommitTrans;
  ExecQuery.Free;
  CoUninitialize;
  Result:= True;
end;

procedure TDataModule1.SQLErrorLog(aSQL: string);
Var
  f: TextFile;
  st: string;
  aFileName: String;
begin

//  if SaveLogData < 1 then Exit;
  if Application.Terminated then Exit;
  {$I-}
  //Critical_SaveLog.Acquire;
  aFileName:= ExeFolder + '\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;

function TDataModule1.ProcessEventExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOConnectionEVENT;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

function TDataModule1.ProcessLogExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOConnectionLOG;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

function TDataModule1.TB_SYSTEMLOGInsert(aNodeNo, aEcuID, aType,aNumber,aCardNo,
  aData: string): Boolean;
var
  stSql : string;
begin
    stSql := 'Insert into TB_SYSTEMLOG(';
    stSql := stSql + ' SY_DATE,SY_TIME,SY_CLIENTIP,SY_OPERATOR,SY_LOGDATA, ' ;
    stSql := stSql + ' AC_NODENO,AC_ECUID,AC_TYPE,CA_CARDNO,AC_NUMBER ';
    stSql := stSql + ') ';
    stSql := stSql + 'VALUES(';
    stSql := stSql + '''' + FormatDateTime('yyyymmdd',Now) + ''',';
    stSql := stSql + '''' + FormatDateTime('HHMMSS',Now) + ''',';
    stSql := stSql + '''' + Get_Local_IPAddr + ''',';
    stSql := stSql + '''' + Master_ID + ''',';
    stSql := stSql + '''' + aData + ''',';
    stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
    stSql := stSql + '''' + aEcuID + ''',';
    stSql := stSql + '''' + aType + ''',';
    stSql := stSql + '''' + aCardNo + ''',';
    stSql := stSql + '''' + aNumber + ''' ';
    stSql := stSql + ') ';

    result := ProcessExecSQL(stSql);

end;

function TDataModule1.ProcessBackupExecSQL(sqlst: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
  Result:= False;
  ExecQuery := TADOQuery.Create(nil);
  ExecQuery.Connection := ADOBackupConnection;
  with ExecQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Text:= sqlst;
    try
      ExecSql;
    except
    ON E: Exception do
      begin
        SQLErrorLog('DBError:'+ SQL.Text);
        ExecQuery.Free;
        Exit;
      end
    end;
  end;
  ExecQuery.Free;
  Result:= True;
end;

end.


