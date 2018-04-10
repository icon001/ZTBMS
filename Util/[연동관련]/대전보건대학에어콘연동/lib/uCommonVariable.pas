unit uCommonVariable;

interface
uses
  Classes;
  
const
  STX = #$2;
  ETX = #$3;
  ENQ = #$5;
  ACK = #$6;
  NAK = #$15;
  EOT = #$04;
  CR  = #13;

const
  MAX_COMPORT = 150;
  
Type
  TAdoConnectedEvent = procedure(Sender: TObject;  Connected:Boolean) of object;
  TSocketEvent = procedure(Sender: TObject;  aData1,aData2,aData3:string) of object;
  TAdoEvent = procedure(Sender: TObject;  aData:string) of object;


var
 GROUPCODE : string;
 G_stExeFolder : string;
 G_stDBType : string;
 G_nIDLength : integer = 7;
 G_nCARDLENGTHTYPE : integer = 0; //0.����4Byte,1.����ASCII,2.KT���
 G_nInputCardType : integer = 0;  //0.�ø���-Hex,1.�ø���-Decimal,2.�ø���-HID Decimal,3.ASCII
 G_nSaveCardType : integer = 0;  //0.�ø���-Hex,1.ASCII
 G_nInputDeviceType : integer = 0;    // 0.��ϱ�,1.���ǵ����Ʈ
 G_nCardRegisterPort : integer = 0;   //��ϱ� �ø��� ��Ʈ
 G_bApplicationTerminate : Boolean;   //Application ���� ����
 G_nCardServerPort : integer = 7777;  //���ǵ����Ʈ ������Ʈ
 G_nMonitorSockType : integer;
 IsMaster : Boolean;
 BuildingGrade : integer;
 MasterBuildingCode : string;
 MasterFloorCode : string;
 MasterAreaCode : string;
 Master_ID : string;
 ExeFolder : string;
 SystemAirConDMSList : TStringList;
 ArmAreaDeviceList : TStringList;


implementation

end.
