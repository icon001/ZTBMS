unit dllFunction;


interface

uses
  StdCtrls,
  RzButton,
  Gauges,
  ExtCtrls,
  Spin;


type
  DllStr = string[100];

  function Convrtstr2Time(ast: string):TDatetime; external 'Util.dll';
  function strToTimeFormat(aTime:string):string; external 'Util.dll';
  function Dec2Hex(N: LongInt; A: Byte): string; external 'Util.dll';
  function Dec2Hex64(N: int64; A: Byte): string; external 'Util.dll';
  function Hex2Ascii(St: String): String; external 'Util.dll';
  function Hex2Dec(const S: string): Longint; external 'Util.dll';
  function Hex2Dec64(const S: string): int64; external 'Util.dll';
  Function Hex2DecStr(S:String):String; external 'Util.dll';
  Function HexToBinary(Hexadecimal: string): string; external 'Util.dll';
  function ToHexStrNoSpace(st:string):String; external 'Util.dll';
  function FillZeroStrNum(aNo:String; aLength:Integer;bFront:Boolean = True): string;external 'Util.dll';
  function FillZeroNumber(aNo:LongInt; aLength:Integer): string;external 'Util.dll';
  function FillZeroNumber2(aNo:INt64; aLength:Integer): string; external 'Util.dll';
  function SetStrlength(st : String; aLength : Integer) : String; external 'Util.dll';
  function Isdigit(st: string):Boolean;external 'Util.dll';
  function IncTime(ATime: TDateTime; Hours, Minutes, Seconds,
                   MSecs: Integer): TDateTime;  external 'Util.dll';
  Function FindCharCopy(SourceStr : String; Index : integer; aChar:Char) : String; external 'Util.dll';
  function posCount(SubStr,S:string):integer;  external 'Util.dll';
  function PosIndex(SubStr,S:string;nIndex:integer):integer; external 'Util.dll';
  Function MakeCSData(aData: string;nCSType:integer):String; external 'Util.dll';
  function EncodeData(aKey:Byte; aData: String): String; external 'Util.dll';
  function EncodeCardNo(aCardNo: string): String; external 'Util.dll';
  function DecodeCardNo(aCardNo: string): String; external 'Util.dll';

  function PacketCreate(aProgramType:integer;aLen,aVer,aDeviceID,aCmd,aData,aMsgNo:string):string; external 'Util.dll';
  function PacketFormatCheck(aData: String;aProgramType:integer; var aLeavePacketData,
                             aPacketData: String): integer; external 'Util.dll';

  //Edit 찾는 함수
  Function TravelEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TEdit;external 'Util.dll';
  //SpinEdit 찾는 함수
  Function TravelSpinEditItem(GroupBox:TGroupBox;stName:string; no:Integer):TSpinEdit;external 'Util.dll';
  //RzBitBtn 찾는 함수
  Function TravelRzBitBtnItem(GroupBox:TGroupBox;stName:string; no:Integer):TRzBitBtn;external 'Util.dll';
  //CheckBox 찾는 함수
  Function TravelCheckBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TCheckBox;external 'Util.dll';
  //ComboBox 찾는 함수
  Function TravelComboBoxItem(GroupBox:TGroupBox;stName:string; no:Integer):TComboBox;external 'Util.dll';
  //Label 찾는 함수
  Function TravelLabelItem(GroupBox:TGroupBox;stName:string; no:Integer):TLabel;external 'Util.dll';
  //Gauge 찾는 함수
  Function TravelGaugeItem(GroupBox:TGroupBox;stName:string; no:Integer):TGauge;external 'Util.dll';
  //TStaticText 찾는 함수
  Function TravelTStaticTextItem(GroupBox:TGroupBox;stName:string; no:Integer):TStaticText;external 'Util.dll';
  //TPanel 찾는 함수
  Function TravelTPanelItem(GroupBox:TGroupBox;stName:string; no:Integer):TPanel;external 'Util.dll';

  procedure My_RunDosCommand(Command : string; nShow : Boolean = False; bWait:Boolean = True);external 'Util.dll';

implementation

end.
