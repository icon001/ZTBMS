unit uPCommon;

interface

uses
  SysUtils, Classes;

type
  TDataModule2 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;
  Rcv_MsgNo     : Char;
  Send_MsgNo    : Integer;
  ComBuff       : String;   // ������ ���ſ�
  IsConfigMCU   : Boolean;  // MCU �������ΰ�?
  RegCardMode   : Boolean;  // ī���� ���
  ErrorMessage : string; //��� ���� ������
  IsStop        : Boolean;  //���μ��� ����

    bMCUIDCheck : Boolean; //MCUIDCheck ����
    bUsedDeviceCheck : Boolean; //Ȯ����� ���� üũ
    bUsedAlarmCheck : Boolean; //�˶�ǥ�ñ� üũ
    bLinkusIDCheck : Boolean;  //�ý��۾��̵� üũ
    bLinksTelNoCheck :Boolean;  //��� ���� ��ȭ��ȣ üũ
    bRingCountCheck : Boolean;  //��ȭ �Ŵ� Ƚ�� üũ
    bControlDialTime : Boolean; //�������� Dial Time
    bWiznetCheck : Boolean;     //IP �� üũ
    bSysInfoCheck : Boolean;    //�ý������� üũ
    bSysInfo2Check : Boolean;   //���Թ�����üũ
    bPortCheck : Boolean;       //��Ʈüũ
    bCardReaderCheck : Boolean; //������ üũ
    bCardReaderTypeCheck : Boolean; //������ Ÿ�� üũ
    bVERCheck : Boolean; //����üũ
    bReaderVERCheck : Boolean;  //������ ���� üũ
    bSearch : Boolean;   //��ȸ �� ���ȯ�� üũ �ؾߵ�
    bErrorCheck : Boolean; //��� ����
    bECUStatusCheck : Boolean; //MCU�϶� ECU üũ �ϱ� ����
    bECUCommState : Boolean;// ECU ��Ż��� üũ�ϱ� ����
    bReaderCOMCheck : Boolean; //������ ��Ż��� üũ�ϱ� ����
    bIndicatorCheck : Boolean; //��Ȳǥ�� üũ�ϱ� ����
    bSended : Boolean; //�۽������� üũ
    DelayTime : integer;
    ComCheckDelayTime : integer;
    LoopCount : integer ; //���� ��� Ƚ��
    LANTime : integer;
    LANLoop : integer;

implementation

{$R *.dfm}
end.
 