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
  dbisamtb, LMDCustomComponent, ADODB,iniFiles,forms,SyncObjs,
  OleCtrls,ActiveX;

  //��� ����� ���� ����ϸ鼭 �������� ����
const
  ERR_DEVICE_0001   = '��� �̻�';
  ERR_DEVICE_0002   = '�̵�� ��� ';
  ERR_PROTOCOL_0001 = 'STX���� ������';
  ERR_PROTOCOL_0002 = '���� �ȵ� Ŀ�ǵ�';
  ERR_PROTOCOL_0003 = 'ERROR Ŀ�ǵ�';
  ERR_DB_0001       = 'DB���� ����';
  ERR_PACKET_0001   = 'Packet�� ������ ����';
  ERR_PACKET_0002   = 'Packet ���������';

const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  CR  = #13;

const
  Msg_CardNoDownload  = WM_USER + 1004;
  MAXBUFFSIZE = 1024;
  SERVERTIMEOUT = 6000;
  LINEEND = #13;  //Ŭ���̾�Ʈ���� �ѹ����� ���� �˸��� �����Ͱ�
  DATADELIMITER = '^';
  DelayTime = 300;
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
  //���� ��ư
  INBUTTON = '1'; //��ٹ�ư
  OUTBUTTON = '2'; //��ٹ�ư
  LEAVEBUTTON = '3'; //�����ư
  BACKBUTTON = '4'; //���͹�ư

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

const  //ServerControlSystem
  CARDEVENT = -3;
  NOTSERVERCONNECTED = -2;
  NOTRESULTED = -1;
  NOTAUTH = 0;
  AUTH = 1;
  NOTDEVICESEND = 2;
  NOTDEVICECONNECT = 3;
  SUCCESSDEVICESEND = 4;
  SUCCESSDEVICERESULT = 5;
  SERVEREVENT = 6;


type
//  TSystemType = (stDoor,stAlarm,stGrade);
  //TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  TDownloadMode = (dmNone,dmTimeSync,dmCardData,dmCheckDoor);
  //�����
  TWatchMode = (cmNothing,cmArm, cmDisarm,cmPatrol,cmInit,cmTest);
  TDoorManageMode = (dmNothing,dmManager,dmOpen,dmLock);   //�/���� ��� /���
  TDoorState = (dsNothing,dsClose,dsOpen,dsLongTime,dsOpenErr,dsCloseErr);        //����/���� ����
  TDoorPNMode = (pnNothing,pnPositive,pnNegative);   //Positive/Negative ����
  TNetworkMode = (nmRemote,nmLocal);
  // ����dtAc,���dtPt,����dtAt,�ļ�dtFd
  TDeviceType = (dtNothing,dtAc,dtAt,dtPt,dtFd);
  TRegType = (rtAppend,rtDelete,rtCheck);
  TCardtype = (ctnothing,ctAccess, ctAlarm, ctBoth);
  TNotifyReceive = procedure(Sender: TObject;  ReceiveData: string; NodeNo : integer) of object;
  TAlarmEvent = procedure(Sender: TObject;  Cmd,ReceiveData: string; NodeNo : integer) of object;
  TNodeConnect = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer) of object;
  TConnectType = procedure(Sender: TObject;  Value:Boolean; NodeNo : integer;aEcuID:string) of object;
  TDoorManageModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorManageType:TDoorManageMode) of object;
  TDoorPNModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorPNType:TDoorPNMode) of object;
  TDoorStateChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;aDoorStateType:TDoorState) of object;
  TWatchModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID:string;aWachMode:TWatchMode) of object;
  TDoorModeChangeType = procedure(Sender: TObject; NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState) of object;
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;
  TBarcodeEvent = procedure(Sender: TObject;aBarCode,aNodeNo,aEcuID,aDoorNo,aReaderNo:string) of object;


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
    FOnAdoConnected: TAdoConnectedEvent;
    { Private declarations }
  public
    { Public declarations }
    isEditMode: Boolean;
    BeforeCardNo: String;


    Function ProcessExecSQL(aSql:String;bUpdateResult:Boolean=False): Boolean;
    Function ProcessEventExecSQL(aSql:String): Boolean;
    Function ProcessLogExecSQL(aSql:String): Boolean;
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


    Function GetCompanyName(aCompanyCode:string):string;
    Function GetJijumName(aCompanyCode,aJijumCode:string):string;
    Function GetDepartName(aCompanyCode,aJijumCode,aDepartCode:string):string;
    Function GetPosiName(aCompanyCode,aPosiCode:string):string;
    Function GetFdmsID(aCompanyCode,aEmCode:string):string;

    //ȭ�� �߻� üũ
    Function CheckFireOrgin:Boolean;

    class function GetObject:TDataModule1;

  published
    property OnAdoConnected:      TAdoConnectedEvent read FOnAdoConnected       write FOnAdoConnected;
  end;

var
  DataModule1: TDataModule1;
  IsServer: Integer;
  //CompanyCode: String[10];
  //DepartCode: String[3];
  Master_ID : String;
  Master_Name : string;
  AdminGrade : String;
  //APP_PATH : String;
  ExeFolder: String;
  FileServerPath:string;
  IsClientSERVER : integer; //�Ѻ������� �������� ȸ�� ���� ��������
//  IsAlarm : Boolean;  //��� ��� ����  PatrolUse �κ���
//  IsAttend : Boolean; //���� �������   AttendUse �κ���
//  ATTENDTYPE : String; //���»��Ÿ��(BUTTON/UPDATE/READERNO(1/2))
  UseCardPosition : Boolean; //ī�� ��ġ���� �������
  G_bACEventFull  : Boolean; //�����̺�Ʈ ��ü ������� ����
  G_nFTPUse : integer;       //��ü���� ���۽� 0 FTP �ٿ�ε� 1.F �ٿ�ε�
  G_nMultiDaemon : integer;       //���������� 0: ���� �ܵ� ���� 1:��Ƽ����
  G_nDaemonGubun : integer;       //���� ������ 1~N
  UseDeviceServer : Boolean;              //����� ������ �����
  UseStateShow : Boolean;       //��Ȳǥ�ñ�� ����Ұ����� ����
  UseFTPZeronServer : Boolean;
  HidCardType : integer;        //0:���� ī��,1: HID �Ųٷ� ������ ī�� 
  G_nDaemonServerVersion : integer; //���󼭹� ����

  //Client ���α׷� ȯ�漳��
  ACAlarmUse : Boolean; //���� �̽��� �˶� �������
  LongDoorOpenAlarmUse : Boolean; //��ð� ������ �˶� ��� ����
  ACAlaramFile : string; //�˶� �߻� ����
  PTAlarmUse : Boolean; //��� �̻� �� �˶� �������
  PTAlarmMessageUse:Boolean; //�� �̻�� �˶� �޽��� �������
  PTAlaramFile : string; //��� �˶� �߻� ����
  G_bACIntroView : Boolean;  // ���� ���� ǥ�� ����
  G_bColseModeView : Boolean;  //����� ��� ����
  G_bFireMessageView : Boolean; //ȭ�� �޽��� ǥ�� ����
  G_stFireState : string;  //ȭ�����
  G_nFireTime : integer;   //ȭ�� �޽��� ��ȸ �ð� ��
  G_dtFireMessageTime : Cardinal;
  G_nLoginMoitorStart: integer; //�α��ν� ����͸� ����
  G_nMonitorGubun : integer; //����͸� �� ��ü����͸� 0,�׷캰����͸� 1
  G_nSearchIndex : integer; //��â ��ȸ�� �⺻����ȸ 0,��ȸ����1

  FOODDEVICE : String; //READER/DOOR
  FOODGRADE : Integer; // 0: ���,1: ����
  GROUPCODE : String;  //����ڵ�Ϲ�ȣ �Ǵ� �׷챸���ڵ�10�ڸ�
  CARDTYPE : string;   //ī��Ÿ�� 1:�������ī�� 2:��������ī��
  CARDLENGTHTYPE : integer; //ī���ȣ Ÿ�� 0:����4Byte 1:����20Byte 2:HEX<->ASCII
  DUPCARDTYPE : integer;    //0:1�δ� 1���� ī�� �߱�,1:1�δ� ������ ī�� �߱�
  PersonRelayType : integer; //�������� ����������� 0:��������,1:������ ����,2:KT���ʻ��,3:����� ,4:LOMOS
  SendPersonRelayType : integer; //������ ����������� 0:��������,1:������ ����,2:KT���ʻ��,3:����� ,4:LOMOS
  IsNumericCardNo : Boolean;  //ī���ȣ ����Ÿ�� True
  IsCardGradCopy : Boolean;   //ī����� ���� ��� ����
  G_nAccessEventSearch : integer;   //�����̺�Ʈ ��ȸ�� �������� �� ��ǹ�ư ��ȸ�� 0,ī�嵥���͸� ��ȸ�� 1
  ALARMVIEW : string;   //REAL : �ǽð� ��ȸ, QUERY : ���� ��ȸ
  AttendUse : Boolean; //���� �������
  AccessUse : Boolean; //���� �������
  FoodUse : Boolean;   //�ļ� �������
  PatrolUse : Boolean; //��� �������
  SensorUse : Boolean; //���� �������
  InOutCountUse : Boolean; //�Խ� ī���� �������
  RecvAck : Boolean;   //�۽ŵ����Ϳ� ���� ��������
  IsMaster : Boolean;  //Master ID���� üũ�Ͽ� Master ID�̸� ��� ���� �ο�
  CompanyGrade : String;  //ȸ�� ��� ���� 0: ��ü ȸ�� ,1: �ο��� ȸ��,2:�ο�������,3:�ο��� �μ�
  MasterCompany : string; //����� �Ҽ� ȸ��
  MasterJijum : string;    //����� �Ҽ� ����
  MasterDepart:string;     //����� �Ҽ� �μ�
  BuildingGrade : integer; //0:��ü,1:����,2:��,3:����,4:���Թ�����
  MasterBuildingCode:string; //����� ��������
  MasterFloorCode:string;    //����� ������
  MasterAreaCode:string;     //����� ����
  ComErrorList : TStringList;
  //Critical_SaveLog:     TCriticalSection;
  ComNodeList: TstringList;  //MCU����Ʈ
  DeviceList: TStringList;   //ECU����Ʈ
  ConnectDeviceList : TStringList; //Connect Device ID
  DisplayList : TStringList; //Display ����Ʈ
  BarCodeList : TStringList; //���ڵ� ����Ʈ
  G_stSoundCode: Array [0..9] of String;  //�����ڵ� ����Ʈ

  DeviceClientNodeList: TstringList;  //DeviceClient ��� MCU����Ʈ
  DeviceClientDeviceList: TStringList;   //DeviceClient ��� ECU����Ʈ
  DeviceConnectList : TList;


  //�������� ���� ����
  fdmsUses : String;   //�����ν� ��� ����
  fdmsPath : string;   //���Ͽ� �����ν� DB Path
  fdmsPW   : string;   //���Ͽ� �����ν� ���� Pw
  fdmsType : string;   //'0' ����,'1' ���Ͽ�
  fdmsNo : integer;    //���� ��ȣ ����

  //Card Reader ���� ����
  IsCardReaderServer : Boolean;

  //***************** �������׿��� ȯ��
  G_stRelayDBType : string;
  G_stRelayDBServerIP : string;
  G_stRelayDBServerPort :string;
  G_stRelayDBServerUserID : string;
  G_stRelayDBServerUserPW : string;
  G_stRelayDBServerName : string;
  G_stRelayDBType2 : string;
  G_stRelayDBServerIP2 : string;
  G_stRelayDBServerPort2 :string;
  G_stRelayDBServerUserID2 : string;
  G_stRelayDBServerUserPW2 : string;
  G_stRelayDBServerName2 : string;
  G_stRelayKHUAddDate : string;  //����� �Է� ������ ��¥
  G_stRelayKHUCARDDate : string;  //����� ī�� ���� ������ ��¥
  G_stRelayKHUDelDate : string;  //����� ���� ������ ��¥
  G_nSCSRelayServer : integer; //0:Kyunghee Campus,1:KT�����ī,2:��õ�����

  //******************ī�� �������� ��� ȯ��
  G_bCardFixedUse : Boolean;   //ī����� ��� ����
  G_stCardFixedFillChar : string; //ī������� ä����
  G_nCardFixedPosition : integer; //ä������ġ 0:��,1:��
  G_nCardFixedLength : integer;   //ī��������� 

  //SKT ��ǰ���
  bSKTLINK :BOOLEAN;
  DBType : string;
  DBName : string;
  DBServer : string;
  DBUser : string;
  DBUserPw : string;
  DBPort : string;
  
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
  CardAutoDownLoadUse :Boolean; //ī���ڵ��ٿ�ε� �������

  nSpecialProgram : integer;  //Ưȭ���� 0: ����,1:KT���ʻ��

  NETTYPE : string;  //TCPIP or COM

  //Form Name
  FM001 : string;  //ȸ���ڵ�
  FM002 : string;  //ȸ���
  FM011 : string;  //�����ڵ�
  FM012 : string;  //������
  FM021 : string;  //�μ��ڵ�
  FM022 : string;  //�μ���
  FM031 : string;  //�����ڵ�
  FM032 : string;  //������
  FM040 : string;  //��������
  FM041 : string;  //�����ڵ�
  FM042 : string;  //�����ڵ��Ī
  FM101 : string;  //���
  FM102 : string;  //�̸�
  FM103 : string;  //�系��ȭ��ȣ
  FM104 : string;  //�Ի���
  FM105 : string;  //�����
  FM106 : string;  //���
  FM901 : string;  //�����ڵ�
  FM902 : string;  //������Ī
  FM903 : string;  //��������
  FM911 : string;  //���ڵ�
  FM912 : string;  //����Ī
  FM913 : string;  //������
  FM921 : string;  //�����ڵ�
  FM922 : string;  //������Ī
  FM923 : string;  //��������
  FM933 : string;  //���Թ�����

  SendCardTime : Cardinal;    //������ ī����Žð�

  G_nProcessCount : integer;    //��� ���μ��� ����
  G_nMaxProcessCount : integer; //�ִ� ���μ��� ����
  useProcessCount : Boolean;    //���μ��� ���� ���

  FCS : TCriticalSection;
  FCSSocket : TCriticalSection;


  //ServerControlSystem
  ReaderNOShow : Boolean;
  ReaderLocationShow : Boolean;
  ApproveCodeShow : Boolean;
  CardModeShow : Boolean;

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
  TempAdoQuery : TAdoQuery;
begin

  Result:= False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + ' where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
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
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.GetCardInfofromCardNo(aCardNo:String;
         var aCo:String; Var aSabun: String ):Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result:= False;
  stSql := ' select * from TB_CARD ';
  stSql := stSql + ' Where CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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

      if RecordCount > 0 then
      begin
        aCo:=   Trim(FindField('CO_COMPANYCODE').AsString);
        aSabun:= Trim(FindField('EM_CODE').AsString);
        Result:= True;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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
  FCS := TCriticalSection.Create;
  FCSSocket := TCriticalSection.Create;
  
  ComErrorList := TStringList.Create;
  ComErrorList.Clear;
{    ExeFolder  := ExtractFileDir(Application.ExeName);
    ini_fun := TiniFile.Create(ExeFolder + '\zmos.INI');

    Host  := ini_fun.ReadString('DBConfig','Host','127.0.0.1');
    userID := ini_fun.ReadString('DBConfig','UserID','sa');
    userPW := ini_fun.ReadString('DBConfig','UserPW','saPasswd');
    DBName := ini_fun.ReadString('DBConfig','DBNAME','ZMOS');
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
//  DataBase.Free;     //������� �⵿��Ű�� ���ؼ��̹Ƿ� �̶��� �����ϸ� �ȵ�
  FCS.Free;
  FCSSocket.Free;
  DataModule1 := Nil;

end;

function TDataModule1.DupCheckTB_ACCESS_EVENT(aTimestr:string; aNodeNO:integer; aECUID, aDoorNo,
  aCardNo: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'Select * from TB_ACCESSEVENT ';
  stSql := stSql + ' where AC_DATE = ''' + copy(aTimestr,1,8) + '''';
  stSql := stSql + ' AND AC_TIME = ''' + copy(aTimestr,9,6) + '''';
  stSql := stSql + ' AND AC_NODENO = ' + intTostr(aNodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''';
  stSql := stSql + ' and DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' AND GROUP_CODE = ''' + GROUPCODE + '''';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.CardPermitCheck(aCardNo, aNodeNo,aECUID,
  aPermit: String): Boolean;
var
  stSql : String;
  TempAdoQuery : TADOQuery;
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
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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

  result := False;
  stSql := 'Select * from TB_DEVICECARDNO ';
  stSql := stSql + 'where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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

  result := False;
  stSql := 'Select * from TB_FOODEVENT ';
  stSql := stSql + ' where FO_DATE = ''' + copy(aTime,1,8) + ''' ';
  stSql := stSql + ' AND FO_TIME = ''' + copy(aTime,9,6) + ''' ';
  stSql := stSql + ' and AC_NodeNO = ' + inttostr(aNodeNo) ;
  stSql := stSql + ' and AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' and FO_DOORNO = ''' + aReaderNo + ''' ';
  stSql := stSql + ' and CA_CARDNO = ''' + aCardNo + ''' ';
  stSql := stSql + ' and GROUP_CODE = ''' + GROUPCODE + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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

      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TDataModule1.DupCheckTB_SUBJECTLEVEL(aSubjectCode,
  aLevelCode: String): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  result := False;
  stSql := 'select * from TB_SUBJECTLEVEL ';
  stSql := stSql + ' Where SUBJECT_CODE = :SUBJECT_CODE ';
  stSql := stSql + ' AND LEVEL_CODE = :LEVEL_CODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := ADOConnection;
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
        exit;
      end;

      if Recordcount > 0 then  result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
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

function TDataModule1.ProcessExecSQL(aSql: String;bUpdateResult:Boolean=False): Boolean;
var
  ExecQuery :TADOQuery;
  nResult : integer;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnection;
      if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnection.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnection.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End;
}   //������Ű��
  Result:= False;
  //OleInitialize(nil);
  Try
    //FCS.Enter;
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnection;
    ExecQuery.DisableControls;
    //if DBTYPE = 'MDB' then ADOConnection.BeginTrans;
    with ExecQuery do
    begin
      Close;
      //SQL.Clear;
      SQL.Text:= aSql;
      try
        nResult := ExecSQL;
      except
      ON E: Exception do
        begin

//          ADOConnection.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnection.Connected := True;
          SQLErrorLog('DBError('+ E.Message + ')' + aSql);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;

          //ExecQuery.Free;
          //OleUninitialize;
          //ADOConnection.RollbackTrans;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
  End;
  //if DBTYPE = 'MDB' then ADOConnection.CommitTrans;

  if bUpdateResult then
  begin
    if nResult > 0 then Result := True
    else
    begin
      Result := False;
      SQLErrorLog('DBError:'+ aSql);
    end;
  end else
  begin
    Result:= True;
  end;
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
  aFileName:= ExeFolder + '\..\log\DBerr'+ FormatDateTIme('yyyymmdd',Now)+'.log';
  AssignFile(f, aFileName);
  Append(f);
  if IOResult <> 0 then Rewrite(f);
  st := FormatDateTIme('hh:nn:ss:zzz">"   ',Now) + #13#10 + aSQL;
  WriteLn(f,st);
  System.Close(f);
  //Critical_SaveLog.Release;
  {$I+}
end;

function TDataModule1.ProcessEventExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnectionEVENT;
      if DBTYPE = 'MDB' then ADOConnectionEVENT.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnectionEVENT.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnectionEVENT.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End;   }     //������Ű��
  Result:= False;
  //FCS.Enter;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnectionEVENT;
    ExecQuery.DisableControls;
    with ExecQuery do
    begin
      Close;
  //    SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSql;
      except
      ON E: Exception do
        begin
//          ADOConnectionEVENT.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnectionEVENT.Connected := True;
          SQLErrorLog('DBError:'+ SQL.Text);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.EnableControls;
    ExecQuery.Free;
    CoUninitialize;
    //FCS.Leave;
  End;
  Result:= True; 
end;

function TDataModule1.ProcessLogExecSQL(aSql: String): Boolean;
var
  ExecQuery :TADOQuery;
begin
{  Result:= True;
  CoInitialize(nil);
  ExecQuery := TADOQuery.Create(nil);
  Try
    With ExecQuery do
    begin
      Connection := ADOConnectionLOG;
      if DBTYPE = 'MDB' then ADOConnectionLOG.BeginTrans;
      Close;
      SQL.Text:= sqlst;
      Try
        ExecSQL;
      Except
        if DBTYPE = 'MDB' then ADOConnectionLOG.RollbackTrans;
        Result := False;
        SQLErrorLog('DBError:'+ sqlst);
      End;
      if DBTYPE = 'MDB' then ADOConnectionLOG.CommitTrans;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
  End; }
  Result:= False;
  //FCS.Enter;
  Try
    CoInitialize(nil);
    ExecQuery := TADOQuery.Create(nil);
    ExecQuery.Connection := ADOConnectionLOG;
    with ExecQuery do
    begin
      Close;
  //    SQL.Clear;
      SQL.Text:= aSql;
      try
        ExecSql;
      except
      ON E: Exception do
        begin
//          ADOConnectionLOG.Connected := False;
//          ADOConnection.ConnectionTimeout := 1;
//          ADOConnectionLOG.Connected := True;
          SQLErrorLog('DBError:'+ SQL.Text);
          if Pos('no connection to the server',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('server closed the connection',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('connection dead',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end else if Pos('������ �����߽��ϴ�',E.Message) > 0 then
          begin
            if Assigned(FOnAdoConnected) then
            begin
              OnAdoConnected(Self,False);
            end;
          end;
          Exit;
        end
      end;
    end;
  Finally
    ExecQuery.Free;
    CoUninitialize;
    //FCS.Leave;
  End;
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


function TDataModule1.GetCompanyName(aCompanyCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''1'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.GetDepartName(aCompanyCode, aJijumCode,
  aDepartCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_DEPARTCODE = ''' + aDepartCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''3'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TDataModule1.GetJijumName(aCompanyCode,
  aJijumCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_COMPANY ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND CO_JIJUMCODE = ''' + aJijumCode + ''' ';
  stSql := stSql + ' AND CO_GUBUN = ''2'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        result := FindField('CO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.GetPosiName(aCompanyCode, aPosiCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '';
  stSql := 'select * from TB_POSI ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND PO_POSICODE = ''' + aPosiCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        result := FindField('PO_NAME').AsString;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TDataModule1.CheckFireOrgin: Boolean;
var
  aCardPermit: Integer;
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin

  Result:= False;
  stSql := 'Select * from TB_CURRENTDAEMON ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' and CU_STATECODE = ''FIREORIGIN'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        if UpperCase(FindField('CU_STATEVALUE').AsString) = 'TRUE' then result := True;
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;


function TDataModule1.GetFdmsID(aCompanyCode, aEmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TAdoQuery;
begin
  result := '31';
  stSql := 'select * from TB_EMPLOYEE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_COMPANYCODE = ''' + aCompanyCode + ''' ';
  stSql := stSql + ' AND EM_CODE = ''' + aEmCode + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TAdoQuery.Create(nil);
    TempAdoQuery.Connection := AdoConnection;
    TempAdoQuery.DisableControls;
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

      if RecordCount > 0 then
      begin
        result := inttostr(FindField('FDMS_ID').asinteger);
      end;
    end;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

end.

