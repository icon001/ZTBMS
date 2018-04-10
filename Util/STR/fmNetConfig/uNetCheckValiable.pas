unit uNetCheckValiable;

interface
const
  IDCHECK = 1;                //ID Check
  DEVICETYPECHECK = 2;        //ECU/ICU Check
  USEDEVICECHECK = 3;         //���Ȯ���üũ
  DEVICEVERSIONCHECK = 4;     //������üũ
  SERIALWIZNET = 5;           //������
  SYSINFOCHECK = 6;           //�ý�������
  ALARMSTATECHECK = 7;        //�������üũ
  ALARMCONTROL = 8;           //�˶�����
  DOORSYSTEMCHECK = 9;        //���Թ��ý���üũ
  LOCKSTATECHECK = 10;        //�� ���� üũ
  ZONESENSECHECK = 11;        //�˶� ���� üũ
  CARDREADERTYPE = 12;        //ī�帮�� Ÿ�� 
  CARDREADERINFO = 13;        //ī�帮�� ����
  CARDREADERVERSION = 14;     //ī�帮�� ��������
  FIRERECOVERY = 15;          //ȭ�纹��
  DOORCONTROL = 16;           //���Թ�����
  PORTSTATE = 17;             //���� ��Ʈ�� ��Ʈ/�ܼ�üũ
  WIZNETMODULECHECK = 18;     //����� ����
  ECUSTATE = 19;              //Ȯ��� ��Ż���
  CARDLIST = 20;              //���ī�帮��Ʈ
  CARDDOWNLOADACK = 21;          //ī��ٿ�ε�
  CARDLISTCANCEL = 22;        //ī�帮��Ʈ ��ȸ ���
  SCHEDULE = 23;              //������ ��ȸ
  HOLIDAY = 24;               //Ư����
  TIME = 25;                  //�ð�
  USECDMACHECK = 26;          //CDMA��� ���� üũ
  conCCCInfoCHECK = 27;           //CCC ���� üũ
  conCCCTimeIntervalCheck = 28;
  conCCCStartTimeCheck = 29;

var
  G_bDeviceResponse: Array [0..100] of Boolean; //��� ���� ���� ���� ����
  G_bCardReaderResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bCardReaderVersionResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bPortResponse: Array [0..768] of Boolean; //��Ʈ ���� ���� ����

implementation

end.
