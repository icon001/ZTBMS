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
  G_nSendClientTimerInterval : integer = 5 ;  //클라이언트 전송 타이머 (5)
  G_nStateCheckTimerInterval : integer = 200 ;  //장비 상태 타이머(200)
  G_nCardAutoDownTimerInterval : integer = 2000 ; //카드 자동 다운로드 타이머 DB에서 메모리 로딩 타이머(2000)
  G_nDeviceInfoSearchTimerInterval : integer = 2000 ;   //장비 코드 조회 (2000)
  G_nHolidaySendTimerInterval : integer = 1000 ;  //(1000)
  G_nG_nDeviceInfoSendTimerInterval : integer = 60000 ; //스케줄 전송(60000)
  G_nFoodTimerInterval : integer = 1000 ; //식수코드 체크 타이머(1000)
  G_nFTPSendTimerInterval : integer = 10000; //FTP전송 타이머(10000)



implementation

{$R *.dfm}

end.
