unit uCommonVariable;

interface
const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  CR  = #13;
  
const
  MAX_COMPORT = 100;       // 최대 255 까지
  
Type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;


var
 GROUPCODE : string;
 G_stExeFolder : string;
 G_stDBType : string;
 G_nCardRegisterPort : integer; //카드 등록기 포트번호

implementation

end.
