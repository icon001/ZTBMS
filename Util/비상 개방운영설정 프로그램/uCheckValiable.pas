unit uCheckValiable;

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
  MACINFO = 30;
  DOORSTATECHECK = 31;        //���Թ�����üũ
  DEVICECODECHECK = 32;        //����ڵ� ��ȸ
  KTTSYSTEMID = 33;           //�����ý��۾��̵�
  KTTTELNUM = 34;             //�������ڴ���ȭ��ȣ
  KTTRINGCOUNT = 35;             //�������ڴ���ȭ��ȣ
  DEVICERESET = 36;           //��Ʈ�ѷ� ����
  ARMDSCHECK = 37;            //���� DSüũ
  ARMRELAYTYPE = 38;          //���� ������Ÿ��
  ALERTLAMPSIREN = 39;             //���˶��÷������̷�
  ALERTLAMPTIME = 40;             //
  ALERTSIRENTIME = 41;             //
  USEDVRCHECK = 42;            //DVR��� ���� üũ
  DVRInfoCHECK = 43;            //DVR����
  CARDREADERTELNUMBERCHECK = 44;            //ī�帮�� ��ȭ��ȣ üũ
  SYSTEMFUNCTION = 45;            //����� üũ
  FTPFUNCTION = 46;               //FTP��� üũ

var
  G_bDeviceResponse: Array [0..100] of Boolean; //��� ���� ���� ���� ����
  G_bCardReaderResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bCardReaderVersionResponse: Array [0..512] of Boolean; //ī�帮�� ���� ���� ����
  G_bPortResponse: Array [0..768] of Boolean; //��Ʈ ���� ���� ����
  G_stDeviceType: Array [0..100] of string; //��� Ÿ��

implementation

end.
