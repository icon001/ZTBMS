unit uCommonVariable;

interface

uses Classes,Graphics,Messages;

const
  con_LocalCompanyImageIndex = 0;
  con_LocalEmployeeImageIndex = 1;
  con_LocalBuildingImageIndex = 2;
  con_LocalPosiImageIndex = 3;

const
  con_CMDArmAreaName = 1;

const
  con_DoorLogType = '1';
  con_ArmAreaLogType = '2';


var
  G_bAccessMonitoringUse : Boolean = True; //���Ը���͸�
  G_bACMonitorEventSoundOnUse : Boolean; //���� ���� ����͸� �˶� �߻�
  G_bAlarmEventLengthUse : Boolean; //�˶��̺�Ʈ ó���� ���� ���� ���
  G_bAlarmEventMessageUse : Boolean; //�˶��̺�Ʈ �߻��� �޽��� �ڽ� ���
  G_bAlarmEventSoundOnUse : Boolean; //�˶��̺�Ʈ �߻��� �˶� ���� ���
  G_bAlarmMonitoringUse : Boolean = TRUE; //�˶� ����͸� �������
//  G_bAlarmRefreshStart : Boolean;    //QUERY Ÿ�Կ��� �˶� �������� �������� ���� �˶� �߻� ��Ű�� ����
  G_bApplicationTerminate : Boolean;
  G_bAutoFdmsCardNo : Boolean;       //���� ���� ī���ȣ ����
  G_bCardAutoDownLoadUse : Boolean; //ī�� �ڵ� �ٿ�ε�
  G_bCardGradeCopyUse : Boolean;    //ī����� ����
  G_bCardLengthFixedUse : Boolean; //ī�� ���� ���� ���
  G_bCardLogSave : Boolean;        //ī�嵥���� log���� ��������
  G_bCardTypeNumeric : Boolean; //���� 4Byte �� ī�� ǥ�� ���� Ÿ�� ����
  G_bCardPositionUse : Boolean; //ī�� ��ġ���� �������
  G_bDeviceCommLogSave : Boolean; //����� ��ŵ����� ��������
  G_bDeviceServerUse : Boolean;  //��Ⱑ ���� ���� �����ϴ°�?
  G_bDoorAccessEventSoundOnUse : Boolean; //�̽��� ���� �̺�Ʈ �߻��� �˶��߻�
  G_bDoorColseModeUse : Boolean;  //���Թ� ��� ��� �������
  G_bDoorLongTimeOpenAlarmEventUse : Boolean; //��ð� ���� �߻��� �̺�Ʈ �߻�
  G_bDoorFireMessageView : Boolean; //ȭ��� ������ �ڽ� ���̱�
  G_bDoorFireRecoveryUse : Boolean; //ȭ�纹�� �������
  G_bDoorFireRelayUse : Boolean;    //ȭ��� Ÿ �ý��� ���� ��� ����
  G_bDoorOpenModeOpenStateUse : Boolean;  //������� ���Թ� ���� ǥ��
  G_bExitButtonEventUse : Boolean;              //��ǹ�ư �̷��� ��������� ����
  G_bFTPZeronServerUse : Boolean;
  G_bInOutCountUse : Boolean;       //��Ǻ��� ��� ����
  G_bIsMaster : Boolean;  //Master ����
  G_bKTDupCardReg : Boolean;    // KT ī�� �߱޽� ���� �̻� ī�� �߱�
  G_bMonitorIntroView : Boolean;  //����͸� ���� ǥ��
  G_bTypeAccessUse : Boolean; //���� �������
  G_bTypeAttendUse : Boolean; //���� �������
  G_bTypeFoodUse : Boolean;   //�ļ� �������
  G_bTypePatrolUse : Boolean; //��� �������
  G_bTypeSensorUse : Boolean; //���� �������

  G_nAccessEventSearch : integer = 1; //0:��ư,��� �̺�Ʈ ��ȸ,1:ī���̺�Ʈ�� ��ȸ
  G_nAckSendType : integer;          //ACK �ٷ� ����(-1),First ����(0)
  G_nAdminBuildingGrade : integer; //0:��ü,1:����,2:��,3:����,4:���Թ�����
  G_nAdminCompanyGrade : integer;  //0.��ü����
  G_nAdminClassCodeLength : integer = 3;  //������ ����ڵ����
  G_nAlarmEventLength : integer;   //��� �̺�Ʈ ī�� ����
  G_nAlarmRefreshDate : integer = 2;  //QUERY Ÿ���� �˶� �̺�Ʈ ��ȸ�� 2���� ������ ������ ��ȸ ����.
  G_nAlarmSoundCount : integer = 1;   //�˶��߻� Ƚ��
  G_nAreaCodeLength : integer = 3;
  G_nAttendWorkingType : integer = 3;      //0:�����ٹ�1:�����,2:����ٹ�,3:ȥ��
  G_nBlinkCount : integer = 10;
  G_nBuildingCodeLength : integer = 3;
  G_nBuildingSearchIndex : integer;  //��ġ������ȸ�� �ڵ�� 0,��Ī�� 1
  G_nBuildingStep : integer = 0;    //������ ����͸��� �������� 0:����,1:��,2:����
  G_nEmployeeDupCard : integer = 0; //0:1�δ� 1���� ī�� �߱�,1:1�δ� ������ ī�� �߱�
  G_nCardCreatePort : integer; // �߱ޱ� ��Ʈ
  G_nCardFixedLength : integer = 16;     //���� ����
  G_nCardFixedPosition : integer = 1; //ä������ġ 0:��,1:��
  G_nCardGroupLength : integer = 3;
  G_nCardLengthType : integer = 0; //ī���ȣ Ÿ�� 0:����4Byte, 1:����, 2:HEX<->ASCII(KT),3:����(����)
  G_nCardRegisterPort : integer;   //��ϱ���Ʈ
  G_nColorEmGroup : integer = clYellow;
  G_nColorEmployee : integer = clWhite;
  G_nCompanyCodeLength : integer = 3;
  G_nCompanySearchIndex : integer;      //ȸ������ ��ȸ�� ��Ʈ ���� �ڵ�� 0,��Ī�� 1
  G_nDaemonGubun : integer;             //���󱸺� ���� n���� ����� ���ս�
  G_nDaemonServerVersion : integer = 0; //��ŵ��� ����
  G_nDefaultDoorCount : integer = 2;  //�ʱ���� ����Ʈ ���Թ� ����
  G_nDefaultReaderCount : integer = 8; //�ʱ���� ����Ʈ ��������
  G_nDefaultZoneCount : integer = 8; //�ʱ���� ����Ʈ ������
  G_nDeviceCardGroupLength : integer = 3; //�׷��ڵ� ����
  G_nDoorFireMessageTime : integer;  //ȭ��� �޽��� �ڽ� ��ȸ �ð�
  G_nFireRelayNumber : integer = 6; //ȭ�纹���� ������ ��ȣ
  G_nFireRelayTime : integer = 2;    //ȭ�纹���� ������ ���� �ð�(��)
  G_nFloorCodeLength : integer = 3;
  G_nFoodGradePosition : integer = 0; //�ļ��������� 0:���,1:����
  G_nFPMSLength : integer = 4; //������ȣ ����
  G_nIDLength : integer = 7;          //��Ʈ�ѷ� ID ����
  G_nMultiDaemon : integer = 0;     //���������� 0: ���� �ܵ� ���� 1:��Ƽ����(���� �ȵ�)
  G_nMultiSocket : integer = 0;
  G_nMonitorGubun : integer;        //����͸� ��ﶧ Ÿ��
  G_nMoitorLoginStart : integer;    //�α��ν� ����͸� ȭ�� ����� ����  0 ���,1 �ȶ��
  G_nMonitorSockType : integer = 0;   //����� ���� Ÿ�� 0.TCP 1.DB
  G_nNodeCodeLength : integer = 3;
  G_nMaxComPort : integer = 40;
  G_nMaxECUCount : integer = 63;
  G_nPatrolCardType : integer = 0;
  G_nPersonRelayType : integer = 0; //�������� ����������� 0:��������,1:������ ����,2:KT���ʻ��,3:����� ,4:LOMOS,5:������
  G_nPosiCodeLength : integer = 3;
  G_nProgramType : integer = 0; //0 : KTTelecop,1:S-TEC
  G_nRelayGubunCodeLength : integer = 3;  //��������ڵ� ����
  G_nReportSearchIndex : integer; // ���� ��ȸ�� ȭ�� �˻� ��ư Ŭ�� �� ��ȸ ����
  G_nScheduleDevice : integer;    //������ 0:��Ʈ�ѷ���ü����,1:PC������
  G_nSocketReciveTime : integer = 100; //���� ���� Ÿ��
  G_nSpecialProgram : integer = 0;  //Ưȭ���� 0: ����,1:KT���ʻ��,2:RUC(��������),3:KTTELECOP(�ڸ���Ʋ��),4:��Ȳǥ��

  G_stACMonitorAlaramFile : string; //�������� �˶�����
  G_stACMonitorEventCode : string; //�������� ����͸����� �˶��߻��ڵ�
  G_stAdminAreaCode : string; //���� �����ڵ�
  G_stAdminBuildingCode : string; //���� �����ڵ�
  G_stAdminCompanyCode : string; //���� ȸ���ڵ�
  G_stAdminDepartCode : string; //���� �μ��ڵ�
  G_stAdminFloorCode : string; //���� ���ڵ�
  G_stAdminJijumCode : string; //���� �����ڵ�
  G_stAdminUserID : string; //������ �α��� ���̵�
  G_stAdminUserName : string; //������ ��
  G_stAlarmEventAlaramFile : string; //�˶��̺�Ʈ �߻� ����
  G_stAlarmViewType : string; //REAL:�ǽð� �˶�,QUERY:DB Type
  G_stBuildingStep : string;
  G_stCardFixedFillChar : string;
  G_stDaemonControlPort : string;
  G_stDaemonEventPort : string;
  G_stDaemonFoodPort : string;
  G_stDaemonFTPPort : string;
  G_stDaemonServerIP : string;
  G_stDaemonServerPort : string;
  G_stDaemonStatePort : string;
  G_stDefaultRelayCode : string;   //����Ʈ ���� �ڵ�
  G_stDoorFireStateCode : string = 'FI';  //ȭ�� �߻� �޽��� �ڵ�
  G_stDoorLongTimeStateCode : string;   //���Թ� ��ð� ���� �ڵ�
  G_stExeFolder : string;
  G_stFileServerIP : string; //�̹��� ���� ����
  G_stFileServerDir : string;
  G_stFireStatus : string = 'FI';
  G_stFoodDeviceType : string;  //DOOR/READER ����
  G_stGroupCode : string;
  G_stMapBuildingAlarmEventIconFile : string;
  G_stMapBuildingArmModeIconFile : string;
  G_stMapBuildingDisArmModeIconFile : string;
  G_stMapBuildingFireIconFile : string;
  G_stMapBuildingNormalEventIconFile : string;
  G_stKT3MPServerIP : string;
  G_stKT3MPServerPort : string;
  G_stKT3MPGatewayID : string;
  G_stKT3MPDeviceID : string;
  G_stKT3MPDevicePW : string;
  G_stKTSmallSetDBTYPE : string;
  G_stKTSmallSetDBIP : string;
  G_stKTSmallSetDBPort : string;
  G_stKTSmallSetDBUserID : string;
  G_stKTSmallSetDBUserPW : string;
  G_stKTSmallSetDBName : string;
  G_stKTSmallSetDBPollingTime:string;
  G_stPatrolMapFile : string;
  G_stRelayKHUAddDate : string; //����� ������¥
  G_stRelayKHUCARDDate : string; //�����ī�忬����¥
  G_stRelayKHUDelDate : string; //����� ���� ���� ��¥

implementation

end.
