unit uTimerIni;

interface

uses
  SysUtils, Classes;

type
  TdtmTimerIni = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmTimerIni: TdtmTimerIni;
  G_nConnectTimerInterval : Integer = 1000 ;      //(1000)
  G_nSendTimerInterval : Integer = 5 ;          //(5)
  G_nSendClientTimerInterval : integer = 5 ;  //Ŭ���̾�Ʈ ���� Ÿ�̸� (5)
  G_nStateCheckTimerInterval : integer = 200 ;  //��� ���� Ÿ�̸�(200)
  G_nCardAutoDownTimerInterval : integer = 2000 ; //ī�� �ڵ� �ٿ�ε� Ÿ�̸� DB���� �޸� �ε� Ÿ�̸�(2000)
  G_nDeviceInfoSearchTimerInterval : integer = 2000 ;   //��� �ڵ� ��ȸ (2000)
  G_nHolidaySendTimerInterval : integer = 1000 ;  //(1000)
  G_nG_nDeviceInfoSendTimerInterval : integer = 60000 ; //������ ����(60000)
  G_nFoodTimerInterval : integer = 1000 ; //�ļ��ڵ� üũ Ÿ�̸�(1000)
  G_nFTPSendTimerInterval : integer = 10000; //FTP���� Ÿ�̸�(10000)



implementation

{$R *.dfm}

end.
