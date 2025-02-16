{*******************************************************}
{                                                       }
{         화일명: DoorSchReg.PAS                        }
{         설  명: 문 스케쥴 지정화면                    }
{         작성일: 2004.12.08                            }
{         작성자: 전진운                                }
{         Copyright (c)                                 }
{                                                       }
{*******************************************************}
unit DoorSchReg;

interface

uses
  uLomosUtil,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, dbisamtb, RzButton, StdCtrls, RzRadGrp, RzDBRGrp, ExtCtrls,
  RzPanel, ADODB, uSubForm, CommandArray,ActiveX, ComCtrls, Gauges, Grids,
  AdvObj, BaseGrid, AdvGrid, AdvGroupBox, AdvScrollBox, AdvCombo, AdvEdit,
  AdvPanel;

type


  {DoorMode 스케쥴 저장용 Record}
  TTimeSch = record
    xGrade: Char;
    xTime: TDateTime;
  end;


  TDoorscheduleRegForm = class(TfmASubForm)
    Query_Sch: TADOQuery;
    Query_Door: TADOQuery;
    Panel57: TPanel;
    Panel58: TPanel;
    RzGroupBox4: TRzGroupBox;
    GroupBox1: TGroupBox;
    lb_Building1: TLabel;
    cmb_BuildingCode1: TComboBox;
    cmb_FloorCode1: TComboBox;
    lb_FloorCode1: TLabel;
    lb_AreaCode1: TLabel;
    cmb_AreaCode1: TComboBox;
    Label31: TLabel;
    cmb_Type: TComboBox;
    sg_DoorList: TAdvStringGrid;
    Splitter1: TSplitter;
    btnClose: TRzBitBtn;
    Panel8: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    RzGroupBox1: TRzGroupBox;
    PaintBox1: TPaintBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    pan_Week: TPanel;
    pan_W1: TPanel;
    Panel4: TPanel;
    pan_W4: TPanel;
    Panel5: TPanel;
    pan_W5: TPanel;
    pan_W3: TPanel;
    Panel13: TPanel;
    pan_W2: TPanel;
    Panel15: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel2: TPanel;
    RzGroupBox2: TRzGroupBox;
    PaintBox2: TPaintBox;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    pan_saturday: TPanel;
    pan_sa1: TPanel;
    Panel10: TPanel;
    pan_sa4: TPanel;
    Panel16: TPanel;
    pan_sa5: TPanel;
    pan_sa3: TPanel;
    Panel19: TPanel;
    pan_sa2: TPanel;
    Panel21: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel3: TPanel;
    RzGroupBox3: TRzGroupBox;
    PaintBox3: TPaintBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    pan_sunday: TPanel;
    pan_su1: TPanel;
    Panel24: TPanel;
    pan_su4: TPanel;
    Panel26: TPanel;
    pan_su5: TPanel;
    pan_su3: TPanel;
    Panel29: TPanel;
    pan_su2: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel6: TPanel;
    RzDBRadioGroup1: TRzDBRadioGroup;
    PaintBox4: TPaintBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    pan_Holiday: TPanel;
    pan_h1: TPanel;
    Panel46: TPanel;
    pan_h4: TPanel;
    Panel48: TPanel;
    pan_h5: TPanel;
    pan_h3: TPanel;
    Panel51: TPanel;
    pan_h2: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel59: TPanel;
    Panel7: TPanel;
    btnSave: TRzBitBtn;
    RzDBRadioGroup2: TRzDBRadioGroup;
    PaintBox5: TPaintBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    pan_Holiday2: TPanel;
    pan_h21: TPanel;
    Panel11: TPanel;
    pan_h24: TPanel;
    Panel14: TPanel;
    pan_h25: TPanel;
    pan_h23: TPanel;
    Panel20: TPanel;
    pan_h22: TPanel;
    Panel23: TPanel;
    Panel25: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel30: TPanel;
    Panel44: TPanel;
    RzDBRadioGroup3: TRzDBRadioGroup;
    PaintBox6: TPaintBox;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    pan_Holiday3: TPanel;
    pan_h31: TPanel;
    Panel49: TPanel;
    pan_h34: TPanel;
    Panel52: TPanel;
    pan_h35: TPanel;
    pan_h33: TPanel;
    Panel62: TPanel;
    pan_h32: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    TabSheet2: TTabSheet;
    PageControl2: TPageControl;
    tb_week: TTabSheet;
    gb_Week: TAdvGroupBox;
    Label166: TLabel;
    Label167: TLabel;
    Label168: TLabel;
    Label169: TLabel;
    Label170: TLabel;
    Label171: TLabel;
    Label172: TLabel;
    Label173: TLabel;
    Label174: TLabel;
    Label175: TLabel;
    Label176: TLabel;
    Label177: TLabel;
    Label178: TLabel;
    Label179: TLabel;
    Label180: TLabel;
    Label181: TLabel;
    Label182: TLabel;
    Label183: TLabel;
    Label184: TLabel;
    Label185: TLabel;
    Label186: TLabel;
    Label187: TLabel;
    Label188: TLabel;
    Label189: TLabel;
    Label190: TLabel;
    Label191: TLabel;
    Label192: TLabel;
    Label193: TLabel;
    Label194: TLabel;
    Label195: TLabel;
    Label196: TLabel;
    Label197: TLabel;
    Label198: TLabel;
    Label199: TLabel;
    Label200: TLabel;
    ed_week1shh: TAdvEdit;
    ed_week1smm: TAdvEdit;
    ed_week1ehh: TAdvEdit;
    ed_week1emm: TAdvEdit;
    cmb_week1mode: TAdvComboBox;
    ed_week2shh: TAdvEdit;
    ed_week2smm: TAdvEdit;
    ed_week2ehh: TAdvEdit;
    ed_week2emm: TAdvEdit;
    cmb_week2mode: TAdvComboBox;
    ed_week3shh: TAdvEdit;
    ed_week3smm: TAdvEdit;
    ed_week3ehh: TAdvEdit;
    ed_week3emm: TAdvEdit;
    cmb_week3mode: TAdvComboBox;
    ed_week4shh: TAdvEdit;
    ed_week4smm: TAdvEdit;
    ed_week4ehh: TAdvEdit;
    ed_week4emm: TAdvEdit;
    cmb_week4mode: TAdvComboBox;
    ed_week5shh: TAdvEdit;
    ed_week5smm: TAdvEdit;
    ed_week5ehh: TAdvEdit;
    ed_week5emm: TAdvEdit;
    cmb_week5mode: TAdvComboBox;
    tb_weekend: TTabSheet;
    gb_Weekend: TAdvGroupBox;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label134: TLabel;
    Label135: TLabel;
    Label136: TLabel;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Label141: TLabel;
    Label142: TLabel;
    Label143: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Label146: TLabel;
    Label147: TLabel;
    Label148: TLabel;
    Label149: TLabel;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Label164: TLabel;
    Label165: TLabel;
    ed_weekend1shh: TAdvEdit;
    ed_weekend1smm: TAdvEdit;
    ed_weekend1ehh: TAdvEdit;
    ed_weekend1emm: TAdvEdit;
    cmb_weekend1mode: TAdvComboBox;
    ed_weekend2shh: TAdvEdit;
    ed_weekend2smm: TAdvEdit;
    ed_weekend2ehh: TAdvEdit;
    ed_weekend2emm: TAdvEdit;
    cmb_weekend2mode: TAdvComboBox;
    ed_weekend3shh: TAdvEdit;
    ed_weekend3smm: TAdvEdit;
    ed_weekend3ehh: TAdvEdit;
    ed_weekend3emm: TAdvEdit;
    cmb_weekend3mode: TAdvComboBox;
    ed_weekend4shh: TAdvEdit;
    ed_weekend4smm: TAdvEdit;
    ed_weekend4ehh: TAdvEdit;
    ed_weekend4emm: TAdvEdit;
    cmb_weekend4mode: TAdvComboBox;
    ed_weekend5shh: TAdvEdit;
    ed_weekend5smm: TAdvEdit;
    ed_weekend5ehh: TAdvEdit;
    ed_weekend5emm: TAdvEdit;
    cmb_weekend5mode: TAdvComboBox;
    tb_sunday: TTabSheet;
    gb_sunday: TAdvGroupBox;
    Label96: TLabel;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    ed_sun1shh: TAdvEdit;
    ed_sun1smm: TAdvEdit;
    ed_sun1ehh: TAdvEdit;
    ed_sun1emm: TAdvEdit;
    cmb_sun1mode: TAdvComboBox;
    ed_sun2shh: TAdvEdit;
    ed_sun2smm: TAdvEdit;
    ed_sun2ehh: TAdvEdit;
    ed_sun2emm: TAdvEdit;
    cmb_sun2mode: TAdvComboBox;
    ed_sun3shh: TAdvEdit;
    ed_sun3smm: TAdvEdit;
    ed_sun3ehh: TAdvEdit;
    ed_sun3emm: TAdvEdit;
    cmb_sun3mode: TAdvComboBox;
    ed_sun4shh: TAdvEdit;
    ed_sun4smm: TAdvEdit;
    ed_sun4ehh: TAdvEdit;
    ed_sun4emm: TAdvEdit;
    cmb_sun4mode: TAdvComboBox;
    ed_sun5shh: TAdvEdit;
    ed_sun5smm: TAdvEdit;
    ed_sun5ehh: TAdvEdit;
    ed_sun5emm: TAdvEdit;
    cmb_sun5mode: TAdvComboBox;
    tb_holiday1: TTabSheet;
    gb_Holiday1: TAdvGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label80: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    Label94: TLabel;
    Label95: TLabel;
    ed_holiday11shh: TAdvEdit;
    ed_holiday11smm: TAdvEdit;
    ed_holiday11ehh: TAdvEdit;
    ed_holiday11emm: TAdvEdit;
    cmb_holiday11mode: TAdvComboBox;
    ed_holiday12shh: TAdvEdit;
    ed_holiday12smm: TAdvEdit;
    ed_holiday12ehh: TAdvEdit;
    ed_holiday12emm: TAdvEdit;
    cmb_holiday12mode: TAdvComboBox;
    ed_holiday13shh: TAdvEdit;
    ed_holiday13smm: TAdvEdit;
    ed_holiday13ehh: TAdvEdit;
    ed_holiday13emm: TAdvEdit;
    cmb_holiday13mode: TAdvComboBox;
    ed_holiday14shh: TAdvEdit;
    ed_holiday14smm: TAdvEdit;
    ed_holiday14ehh: TAdvEdit;
    ed_holiday14emm: TAdvEdit;
    cmb_holiday14mode: TAdvComboBox;
    ed_holiday15shh: TAdvEdit;
    ed_holiday15smm: TAdvEdit;
    ed_holiday15ehh: TAdvEdit;
    ed_holiday15emm: TAdvEdit;
    cmb_holiday15mode: TAdvComboBox;
    tb_holiday2: TTabSheet;
    gb_Holiday2: TAdvGroupBox;
    Label201: TLabel;
    Label202: TLabel;
    Label203: TLabel;
    Label204: TLabel;
    Label205: TLabel;
    Label206: TLabel;
    Label207: TLabel;
    Label208: TLabel;
    Label209: TLabel;
    Label210: TLabel;
    Label211: TLabel;
    Label212: TLabel;
    Label213: TLabel;
    Label214: TLabel;
    Label215: TLabel;
    Label216: TLabel;
    Label217: TLabel;
    Label218: TLabel;
    Label219: TLabel;
    Label220: TLabel;
    Label221: TLabel;
    Label222: TLabel;
    Label223: TLabel;
    Label224: TLabel;
    Label225: TLabel;
    Label226: TLabel;
    Label227: TLabel;
    Label228: TLabel;
    Label229: TLabel;
    Label230: TLabel;
    Label231: TLabel;
    Label232: TLabel;
    Label233: TLabel;
    Label234: TLabel;
    Label235: TLabel;
    ed_holiday21shh: TAdvEdit;
    ed_holiday21smm: TAdvEdit;
    ed_holiday21ehh: TAdvEdit;
    ed_holiday21emm: TAdvEdit;
    cmb_holiday21mode: TAdvComboBox;
    ed_holiday22shh: TAdvEdit;
    ed_holiday22smm: TAdvEdit;
    ed_holiday22ehh: TAdvEdit;
    ed_holiday22emm: TAdvEdit;
    cmb_holiday22mode: TAdvComboBox;
    ed_holiday23shh: TAdvEdit;
    ed_holiday23smm: TAdvEdit;
    ed_holiday23ehh: TAdvEdit;
    ed_holiday23emm: TAdvEdit;
    cmb_holiday23mode: TAdvComboBox;
    ed_holiday24shh: TAdvEdit;
    ed_holiday24smm: TAdvEdit;
    ed_holiday24ehh: TAdvEdit;
    ed_holiday24emm: TAdvEdit;
    cmb_holiday24mode: TAdvComboBox;
    ed_holiday25shh: TAdvEdit;
    ed_holiday25smm: TAdvEdit;
    ed_holiday25ehh: TAdvEdit;
    ed_holiday25emm: TAdvEdit;
    cmb_holiday25mode: TAdvComboBox;
    tb_holiday3: TTabSheet;
    gb_Holiday3: TAdvGroupBox;
    lb_Section11: TLabel;
    lb_StartHH11: TLabel;
    lb_StartMM11: TLabel;
    Label87: TLabel;
    lb_EndMM11: TLabel;
    lb_EndHH11: TLabel;
    lb_Mode11: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    ed_holiday31shh: TAdvEdit;
    ed_holiday31smm: TAdvEdit;
    ed_holiday31ehh: TAdvEdit;
    ed_holiday31emm: TAdvEdit;
    cmb_holiday31mode: TAdvComboBox;
    ed_holiday32shh: TAdvEdit;
    ed_holiday32smm: TAdvEdit;
    ed_holiday32ehh: TAdvEdit;
    ed_holiday32emm: TAdvEdit;
    cmb_holiday32mode: TAdvComboBox;
    ed_holiday33shh: TAdvEdit;
    ed_holiday33smm: TAdvEdit;
    ed_holiday33ehh: TAdvEdit;
    ed_holiday33emm: TAdvEdit;
    cmb_holiday33mode: TAdvComboBox;
    ed_holiday34shh: TAdvEdit;
    ed_holiday34smm: TAdvEdit;
    ed_holiday34ehh: TAdvEdit;
    ed_holiday34emm: TAdvEdit;
    cmb_holiday34mode: TAdvComboBox;
    ed_holiday35shh: TAdvEdit;
    ed_holiday35smm: TAdvEdit;
    ed_holiday35ehh: TAdvEdit;
    ed_holiday35emm: TAdvEdit;
    cmb_holiday35mode: TAdvComboBox;
    AdvPanel1: TAdvPanel;
    btn_TextSave: TRzBitBtn;
    AdvPanel2: TAdvPanel;
    lb_SelectDoor: TLabel;
    procedure Panel3MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel2DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel2DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel2Resize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure Panel2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PaintBox2Paint(Sender: TObject);
    procedure PaintBox3Paint(Sender: TObject);
    procedure Panel8DblClick(Sender: TObject);
    procedure Panel8DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel8DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel8Resize(Sender: TObject);
    procedure Panel22DblClick(Sender: TObject);
    procedure Panel22DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel22DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel22Resize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bsSkinButton4Click(Sender: TObject);
    procedure Panel31Click(Sender: TObject);
    procedure Panel35Click(Sender: TObject);
    procedure Panel39Click(Sender: TObject);
    procedure Panel44DblClick(Sender: TObject);
    procedure Panel44DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Panel44DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure Panel44Resize(Sender: TObject);
    procedure Panel53Click(Sender: TObject);
    procedure PaintBox4Paint(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure Panel25Click(Sender: TObject);
    procedure Panel65Click(Sender: TObject);
    procedure PaintBox5Paint(Sender: TObject);
    procedure PaintBox6Paint(Sender: TObject);
    procedure pan_h21DblClick(Sender: TObject);
    procedure pan_h21DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pan_h21DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pan_h21Resize(Sender: TObject);
    procedure pan_h31DblClick(Sender: TObject);
    procedure pan_h31DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure pan_h31DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure pan_h31Resize(Sender: TObject);
    procedure sg_DoorListClick(Sender: TObject);
    procedure sg_DoorListCheckBoxClick(Sender: TObject; ACol,
      ARow: Integer; State: Boolean);
    procedure CommandArrayCommandsTCommand0Execute(Command: TCommand;
      Params: TStringList);
    procedure CommandArrayCommandsTCloseExecute(Command: TCommand;
      Params: TStringList);
    procedure cmb_TypeChange(Sender: TObject);
    procedure ed_week1ehhKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed_week2shhKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_TextSaveClick(Sender: TObject);
  private
    BuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    AreaCodeList :TStringList;
    DoorGubunCodeList : TStringList;
    L_nDoorCheckCount : integer;
    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure SearchScheduleDoor(aCode:string='';aTopRow:integer=0);
    procedure DoorLoad(aBuildingCode,aFloorCode,aAreaCode,aDoorGubun:string;aCode:string='';aTopRow:integer=0);
    procedure GetDoorSchTime(aNodeNo,aEcuID,aDoorNo:string;var aWeek ,aWeekend,aHoliday,aHoliday1,aHoliday2,aHoliday3:string);
  private
    { Private declarations }
    function LoadScheduleFormDB(aNodeNo,aECUID,DoorNo: string):Boolean;
    Procedure CheckFields1(Sender : TObject);
    Procedure CheckFields2(Sender : TObject);
    Procedure CheckFields3(Sender : TObject);
    Procedure CheckFields4(Sender : TObject);
    Procedure CheckFields5(Sender : TObject);
    Procedure CheckFields6(Sender : TObject);
    Procedure ScheduleDataSend(aNodeNo,aECUID,aDoorNO:string);
    procedure CreateSchedule(aNodeNo,aECUID,aDOORNO:string);
    function checkTB_DEVICESCHEDULE(aNodeNo,aECUID,aDOORNO:string;aDAYCODE:integer):Boolean;
    function TextWeekScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
    function TextWeekendScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
    function TextsundayScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
    function Textholiday1ScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
    function Textholiday2ScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
    function Textholiday3ScheduleSave(aNodeNo,aECUID,aDoorNO:string):Boolean;
  public
    { Public declarations }
     DoorsList: TStringList;
     Procedure DbUpDate(aNodeNo,aECUID,aDoorNo,aDayCode:String;aSch:array of TTimeSch );

  end;

var
  DoorscheduleRegForm: TDoorscheduleRegForm;
  timePanels1 : Array[0..4] of TPanel; {평일}
  timePanels2 : Array[0..4] of TPanel; {토요일}
  timePanels3 : Array[0..4] of TPanel; {일요일}
  timePanels4 : Array[0..4] of TPanel; {휴일1}
  timePanels5 : Array[0..4] of TPanel; {휴일2}
  timePanels6 : Array[0..4] of TPanel; {휴일3}

  xData1 : Array[0..4] of TTimeSch; {평일}
  xData2 : Array[0..4] of TTimeSch; {토요일}
  xData3 : Array[0..4] of TTimeSch; {일요일}
  xData4 : Array[0..4] of TTimeSch; {휴일1}
  xData5 : Array[0..4] of TTimeSch; {휴일2}
  xData6 : Array[0..4] of TTimeSch; {휴일3}

//  DoorList: TStringList;

implementation

{$R *.dfm}
uses
  uDatamodule1,
  udmFormFunction,
  uMain;

procedure TDoorscheduleRegForm.Panel3MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
  if Sender is TPanel then
  if TPanel(Sender).Tag= 2 then
  Begin

    With TPanel(TPanel(Sender).Parent) do
    Begin
      if Width + x > 0 then
        Width := Width + x;
    end;
  end;
end;


procedure TDoorscheduleRegForm.Panel2DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields1(Sender);
end;

procedure TDoorscheduleRegForm.Panel2DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      if TPanel(Sender).Width = 0 then TPanel(Sender).Width := 5; 
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields1(Sender);
    end;
end;

Procedure TDoorscheduleRegForm.CheckFields1(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    if TimePanels1[a].Width < 2 then
    begin
      TimePanels1[a].Width := 5;
      showmessage('타임구간이 1 보다 작을 수 없습니다.');
      Exit;
    end;
    ox := pan_Week.Width - 2;
    bx := timePanels1[a].Left+TimePanels1[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label1.Caption := st; Label1.Left := bx-07; end;
      1 : Begin Label2.Caption := st; Label2.Left := bx-07; end;
      2 : Begin Label3.Caption := st; Label3.Left := bx-07; end;
      3 : Begin Label4.Caption := st; Label4.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields2(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := pan_saturday.Width - 2;
    bx := timePanels2[a].Left+TimePanels2[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label5.Caption := st; Label5.Left := bx-07; end;
      1 : Begin Label7.Caption := st; Label7.Left := bx-07; end;
      2 : Begin Label8.Caption := st; Label8.Left := bx-07; end;
      3 : Begin Label9.Caption := st; Label9.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields3(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := pan_sunday.Width - 2;
    bx := timePanels3[a].Left+TimePanels3[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label11.Caption := st; Label11.Left := bx-07; end;
      1 : Begin Label12.Caption := st; Label12.Left := bx-07; end;
      2 : Begin Label13.Caption := st; Label13.Left := bx-07; end;
      3 : Begin Label14.Caption := st; Label14.Left := bx-07; end;
    end;
  end;
end;

Procedure TDoorscheduleRegForm.CheckFields4(Sender : TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := pan_Holiday.Width - 2;
    bx := timePanels4[a].Left+TimePanels4[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label16.Caption := st; Label16.Left := bx-07; end;
      1 : Begin Label17.Caption := st; Label17.Left := bx-07; end;
      2 : Begin Label18.Caption := st; Label18.Left := bx-07; end;
      3 : Begin Label19.Caption := st; Label19.Left := bx-07; end;
    end;
  end;
end;



procedure TDoorscheduleRegForm.Panel2Resize(Sender: TObject);
begin
  CheckFields1(Sender);
end;


procedure TDoorscheduleRegForm.FormCreate(Sender: TObject);
begin
  sg_DoorList.ColWidths[0] := 20;
  L_nDoorCheckCount := 0;
  
  timePanels1[0] := pan_W1;
  timePanels1[1] := pan_W2;
  timePanels1[2] := pan_W3;
  timePanels1[3] := pan_W4;
  timePanels1[4] := pan_W5;

  timePanels2[0] := pan_sa1;
  timePanels2[1] := pan_sa2;
  timePanels2[2] := pan_sa3;
  timePanels2[3] := pan_sa4;
  timePanels2[4] := pan_sa5;

  timePanels3[0] := pan_su1;
  timePanels3[1] := pan_su2;
  timePanels3[2] := pan_su3;
  timePanels3[3] := pan_su4;
  timePanels3[4] := pan_su5;

  timePanels4[0] := pan_h1;
  timePanels4[1] := pan_h2;
  timePanels4[2] := pan_h3;
  timePanels4[3] := pan_h4;
  timePanels4[4] := pan_h5;

  timePanels5[0] := pan_h21;
  timePanels5[1] := pan_h22;
  timePanels5[2] := pan_h23;
  timePanels5[3] := pan_h24;
  timePanels5[4] := pan_h25;

  timePanels6[0] := pan_h31;
  timePanels6[1] := pan_h32;
  timePanels6[2] := pan_h33;
  timePanels6[3] := pan_h34;
  timePanels6[4] := pan_h35;


  BuildingCodeList := TStringList.Create ;
  FloorCodeList := TStringList.Create ;
  AreaCodeList := TStringList.Create ;
//  DoorList := TstringList.Create;
  DoorGubunCodeList := TstringList.Create;
  PageControl1.ActivePageIndex := 0;
  PageControl2.ActivePageIndex := 0;
end;

procedure TDoorscheduleRegForm.PaintBox1Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox1.Width := pan_Week.ClientRect.Right;
  dx := pan_Week.Width - 2;
  With PaintBox1.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox1.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox1.Height);
      LineTo(x,PaintBox1.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox1.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox1.Height);
    LineTo(x,PaintBox1.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.Panel2DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clPurple then bColor := clGreen
  else if aColor = clAqua then bColor := clRed
  else if aColor = clRed then bColor := clPurple;
  TPanel(Sender).Color := bColor;
  CheckFields1(Sender);
end;

{DB에서 스케줄을 읽어 온다}
function TDoorscheduleRegForm.LoadScheduleFormDB(aNodeNo,aECUID,DoorNo: string):Boolean;
var
  I: Integer;
  stSql : string;
  oComboBox : TComboBox;
  oEdit : TEdit;

function Convrtstr2Time(ast: string):TDatetime;
var
  aHour: Word;
  aMin: word;
begin
  Convrtstr2Time:= 0;
  if length(ast) < 4 then Exit;
  aHour:= StrtoInt(Copy(ast,1,2));
  if aHour >= 24 then aHour := 0;
  aMin:= StrtoInt(Copy(ast,3,2));
  Convrtstr2Time:= Encodetime(aHour,aMin,00,00);
end;

begin

  LoadScheduleFormDB:= False;
  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + DoorNo + ''' ';
  with Query_Sch do
  begin
    Close;
    SQL.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;


    if RecordCount > 0 then
    begin
      LoadScheduleFormDB:= True;
      First;
      while Not Eof do
      begin
        if findField('DE_DAYCODE').AsString = '0' then
        begin
          {평일}
          xData1[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData1[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData1[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData1[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData1[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData1[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData1[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData1[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData1[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData1[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_Week),'cmb_week1mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Week),'cmb_week2mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Week),'cmb_week3mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Week),'cmb_week4mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Week),'cmb_week5mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week1ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week1emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week2shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week2smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week2ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week2emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week3shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week3smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week3ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week3emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week4shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week4smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week4ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week4emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week5shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Week),'ed_week5smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          
        end else if findField('DE_DAYCODE').AsString = '1' then
        begin
          {툐요일}
          xData2[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData2[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData2[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData2[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData2[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData2[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData2[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData2[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData2[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData2[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_Weekend),'cmb_weekend1mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Weekend),'cmb_weekend2mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Weekend),'cmb_weekend3mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Weekend),'cmb_weekend4mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Weekend),'cmb_weekend5mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend1ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend1emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend2shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend2smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend2ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend2emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend3shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend3smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend3ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend3emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend4shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend4smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend4ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend4emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend5shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Weekend),'ed_weekend5smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);

        end else if findField('DE_DAYCODE').AsString = '2' then
        begin
          {일요일}
          xData3[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData3[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData3[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData3[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData3[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData3[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData3[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData3[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData3[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData3[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_sunday),'cmb_sun1mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_sunday),'cmb_sun2mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_sunday),'cmb_sun3mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_sunday),'cmb_sun4mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_sunday),'cmb_sun5mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun1ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun1emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun2shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun2smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun2ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun2emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun3shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun3smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun3ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun3emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun4shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun4smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun4ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun4emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun5shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_sunday),'ed_sun5smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);

        end else if findField('DE_DAYCODE').AsString = '3' then
        begin
          {휴일}
          xData4[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData4[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData4[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData4[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData4[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData4[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData4[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData4[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData4[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData4[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday1),'cmb_holiday11mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday1),'cmb_holiday12mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday1),'cmb_holiday13mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday1),'cmb_holiday14mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday1),'cmb_holiday15mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday11ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday11emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday12shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday12smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday12ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday12emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday13shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday13smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday13ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday13emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday14shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday14smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday14ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday14emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday15shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday1),'ed_holiday15smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);

        end else if findField('DE_DAYCODE').AsString = '4' then
        begin
          {휴일2}
          xData5[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData5[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData5[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData5[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData5[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData5[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData5[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData5[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData5[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData5[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday2),'cmb_holiday21mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday2),'cmb_holiday22mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday2),'cmb_holiday23mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday2),'cmb_holiday24mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday2),'cmb_holiday25mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday21ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday21emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday22shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday22smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday22ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday22emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday23shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday23smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday23ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday23emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday24shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday24smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday24ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday24emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday25shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday2),'ed_holiday25smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);

        end else if findField('DE_DAYCODE').AsString = '5' then
        begin
          {휴일2}
          xData6[0].xGrade:= FindField('DE_CELL1MODE').asString[1];
          xData6[0].xTime:= Convrtstr2Time(FindField('DE_CELL1TIME').asString);
          xData6[1].xGrade:= FindField('DE_CELL2MODE').asString[1];
          xData6[1].xTime:= Convrtstr2Time(FindField('DE_CELL2TIME').asString);
          xData6[2].xGrade:= FindField('DE_CELL3MODE').asString[1];
          xData6[2].xTime:= Convrtstr2Time(FindField('DE_CELL3TIME').asString);
          xData6[3].xGrade:= FindField('DE_CELL4MODE').asString[1];
          xData6[3].xTime:= Convrtstr2Time(FindField('DE_CELL4TIME').asString);
          xData6[4].xGrade:= FindField('DE_CELL5MODE').asString[1];
          xData6[4].xTime:= Convrtstr2Time(FindField('DE_CELL5TIME').asString);

          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday3),'cmb_holiday31mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL1MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday3),'cmb_holiday32mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL2MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday3),'cmb_holiday33mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL3MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday3),'cmb_holiday34mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL4MODE').AsInteger;
          oComboBox := TravelComboBoxItem(TGroupBox(gb_Holiday3),'cmb_holiday35mode',-1);
          if oComboBox <> nil then oComboBox.ItemIndex := FindField('DE_CELL5MODE').AsInteger;

          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday31ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday31emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday32shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday32smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL1TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday32ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday32emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday33shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday33smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL2TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday33ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday33emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday34shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday34smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL3TIME').asString,3,2);

          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday34ehh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday34emm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday35shh',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,1,2);
          oEdit := TravelEditItem(TGroupBox(gb_Holiday3),'ed_holiday35smm',-1);
          if oEdit <> nil then oEdit.Text := copy(FindField('DE_CELL4TIME').asString,3,2);

        end;
        Next;
      end;
    end else
    begin
      CreateSchedule(aNodeNo,aECUID,DOORNO);


      //ShowMessage('스케줄 데이터가 생성 되었습니다.');
    end;
  end;
end;

procedure TDoorscheduleRegForm.FormShow(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;  
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorscheduleRegForm';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'TRUE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

  stBuildingCode := '000';
  stFloorCode    := '000';
  stAreaCode     := '000';
  LoadBuildingCode(cmb_BuildingCode1);
  if cmb_BuildingCode1.ItemIndex > 0 then
  begin
    stBuildingCode := BuildingCodeList.Strings[cmb_BuildingCode1.ItemIndex];
    LoadFloorCode(stBuildingCode,cmb_FloorCode1);
    if cmb_FloorCode1.ItemIndex > 0 then
    begin
      stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.ItemIndex];
      LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
      if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.ItemIndex];
    end;
  end;

  dmFormFunction.LoadDoorGubun(TComboBox(cmb_Type),DoorGubunCodeList);
  DoorLoad(stBuildingCode,stFloorCode,stAreaCode,'');

end;

procedure TDoorscheduleRegForm.PaintBox2Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox2.Width := pan_saturday.ClientRect.Right;
  dx := pan_saturday.Width - 2;
  With PaintBox2.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox2.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox2.Height);
      LineTo(x,PaintBox2.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox2.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox2.Height);
    LineTo(x,PaintBox2.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.PaintBox3Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox3.Width := pan_sunday.ClientRect.Right;
  dx := pan_sunday.Width - 2;
  With PaintBox3.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox3.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox3.Height);
      LineTo(x,PaintBox3.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox3.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox3.Height);
    LineTo(x,PaintBox3.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.PaintBox4Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox4.Width := pan_Holiday.ClientRect.Right;
  dx := pan_Holiday.Width - 2;
  With PaintBox4.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox4.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox4.Height);
      LineTo(x,PaintBox4.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox4.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox4.Height);
    LineTo(x,PaintBox4.Height-y);
  end;
end;


procedure TDoorscheduleRegForm.Panel8DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields2(Sender);

end;

procedure TDoorscheduleRegForm.Panel8DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields2(Sender);
    end;
end;

procedure TDoorscheduleRegForm.Panel8DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields2(Sender);
end;

procedure TDoorscheduleRegForm.Panel8Resize(Sender: TObject);
begin
  CheckFields2(Sender);
end;

procedure TDoorscheduleRegForm.Panel22DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.Panel22DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields3(Sender);
    end;
end;

procedure TDoorscheduleRegForm.Panel22DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.Panel22Resize(Sender: TObject);
begin
  CheckFields3(Sender);
end;

procedure TDoorscheduleRegForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['VALUE'] := 'DoorscheduleRegForm';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Params.Values['SHOW'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('FORMSHOW').Execute;

//  self.FindSubForm('Main').FindCommand('SCHEDULE').Execute;
  DoorsList.Free;
  BuildingCodeList.Free;
  FloorCodeList.Free;
  AreaCodeList.Free;
  
  Action := caFree;
end;

procedure TDoorscheduleRegForm.bsSkinButton4Click(Sender: TObject);
begin
  CLose;
end;

{평일 초기화 버튼}
procedure TDoorscheduleRegForm.Panel31Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData1[0].xGrade := '0'      ; xData1[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData1[1].xGrade := '0'      ; xData1[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData1[2].xGrade := '0'      ; xData1[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData1[3].xGrade := '0'      ; xData1[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData1[4].xGrade := '0'      ; xData1[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }

  for a := 0 to 4 do
  Begin
    timePanels1[a].Align := alNone;
    timePanels1[a].Width := 10;
    timePanels1[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels1[a].Align := alClient
    else          timePanels1[a].Align := alLeft;
  end;

  r := 0;
  ox := pan_Week.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels1[a].Color := clAqua;
    Case xData1[a].xGrade of
      '0': timePanels1[a].Color := clAqua;
      '1': timePanels1[a].Color := clGreen;
      '2': timePanels1[a].Color := clRed;
    end;
    if a = 0 then r := xData1[a].xTime
    else          r := xData1[a].xTime-xData1[a-1].xTime;

    timePanels1[a].Width := Round((ox) * (r));
  end;
  CheckFields1(timePanels1[0]);

end;

{반휴일 초기화 버튼}
procedure TDoorscheduleRegForm.Panel35Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData2[0].xGrade := '0'      ; xData2[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData2[1].xGrade := '0'      ; xData2[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData2[2].xGrade := '0'      ; xData2[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData2[3].xGrade := '0'      ; xData2[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData2[4].xGrade := '0'      ; xData2[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }

  for a := 0 to 4 do
  Begin
    timePanels2[a].Align := alNone;
    timePanels2[a].Width := 10;
    timePanels2[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels2[a].Align := alClient
    else          timePanels2[a].Align := alLeft;
  end;

  r := 0;
  ox := pan_saturday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels2[a].Color := clAqua;
    Case xData2[a].xGrade of
      '0': timePanels2[a].Color := clAqua;
      '1': timePanels2[a].Color := clGreen;
      '2': timePanels2[a].Color := clRed;
    end;
    if a = 0 then r := xData2[a].xTime
    else          r := xData2[a].xTime-xData2[a-1].xTime;

    timePanels2[a].Width := Round((ox) * (r));
  end;
  CheckFields2(timePanels2[0]);

end;

{일요일 초기화 버튼}
procedure TDoorscheduleRegForm.Panel39Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData3[0].xGrade := '0'      ; xData3[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData3[1].xGrade := '0'      ; xData3[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData3[2].xGrade := '0'      ; xData3[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData3[3].xGrade := '0'      ; xData3[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData3[4].xGrade := '0'      ; xData3[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }


  for a := 0 to 4 do
  Begin
    timePanels3[a].Align := alNone;
    timePanels3[a].Width := 10;
    timePanels3[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels3[a].Align := alClient
    else          timePanels3[a].Align := alLeft;
  end;

  r := 0;
  ox := Pan_sunday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels3[a].Color := clAqua;
    Case xData3[a].xGrade of
      '0': timePanels3[a].Color := clAqua;
      '1': timePanels3[a].Color := clGreen;
      '2': timePanels3[a].Color := clRed;
    end;
    if a = 0 then r := xData3[a].xTime
    else          r := xData3[a].xTime-xData3[a-1].xTime;

    timePanels3[a].Width := Round((ox) * (r));
  end;
  CheckFields3(timePanels3[0]);

end;
{휴일 초기화 버튼}
procedure TDoorscheduleRegForm.Panel53Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData4[0].xGrade := '0'      ; xData4[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData4[1].xGrade := '0'      ; xData4[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData4[2].xGrade := '0'      ; xData4[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData4[3].xGrade := '0'      ; xData4[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData4[4].xGrade := '0'      ; xData4[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }

  for a := 0 to 4 do
  Begin
    timePanels4[a].Align := alNone;
    timePanels4[a].Width := 10;
    timePanels4[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels4[a].Align := alClient
    else          timePanels4[a].Align := alLeft;
  end;

  r := 0;
  ox := pan_Holiday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels4[a].Color := clAqua;
    Case xData4[a].xGrade of
      '0': timePanels4[a].Color := clAqua;
      '1': timePanels4[a].Color := clGreen;
      '2': timePanels4[a].Color := clRed;
    end;
    if a = 0 then r := xData4[a].xTime
    else          r := xData4[a].xTime-xData4[a-1].xTime;

    timePanels4[a].Width := Round((ox) * (r));
  end;
  CheckFields4(timePanels4[0]);
end;

{변경된 스케쥴 정보 저장}
procedure TDoorscheduleRegForm.Panel44DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields4(Sender);
end;

procedure TDoorscheduleRegForm.Panel44DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields4(Sender);
    end;
end;
procedure TDoorscheduleRegForm.Panel44DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields4(Sender);
end;

procedure TDoorscheduleRegForm.Panel44Resize(Sender: TObject);
begin
  CheckFields4(Sender);
end;




procedure TDoorscheduleRegForm.btnSaveClick(Sender: TObject);
var
  ox: Integer;
  //a: Integer;
  bx  : Real;
  ff  : TDateTime;
  aPortNo: Integer;
  i,j: Integer;
  stNodeNo,stECUID,stDoorNO : string;
  nPosition : integer;
  bchkState : Boolean;

begin

  if L_nDoorCheckCount < 1 then
  begin
    showmessage('스케줄 적용할 출입문이 선택되지 않았습니다.');
    Exit;
  end;
  Screen.Cursor:= crHourGlass;

  ox := pan_Week.Width - 2;
  for nPosition := 0 to 4 do
  Begin
    //showmessage(inttostr(nPosition));
    {평일}
         if timePanels1[nPosition].Color = clGreen then xData1[nPosition].xGrade :='1' //1개방
    else if timePanels1[nPosition].Color = clAqua  then xData1[nPosition].xGrade :='0' //0운영
    else if timePanels1[nPosition].Color = clRed   then xData1[nPosition].xGrade :='2' //2 폐쇄
    else if timePanels1[nPosition].Color = clPurple   then xData1[nPosition].xGrade :='3';//3 마스터
    bx := timePanels1[nPosition].Left+TimePanels1[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData1[nPosition].xTime := ff;

     {토요일}
         if timePanels2[nPosition].Color = clGreen then xData2[nPosition].xGrade :='1'
    else if timePanels2[nPosition].Color = clAqua  then xData2[nPosition].xGrade :='0'
    else if timePanels2[nPosition].Color = clRed   then xData2[nPosition].xGrade :='2' //2 폐쇄
    else if timePanels2[nPosition].Color = clPurple   then xData2[nPosition].xGrade :='3';//3 마스터
    bx := timePanels2[nPosition].Left+TimePanels2[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData2[nPosition].xTime := ff;

    {일요일}
         if timePanels3[nPosition].Color = clGreen then xData3[nPosition].xGrade :='1'
    else if timePanels3[nPosition].Color = clAqua  then xData3[nPosition].xGrade :='0'
    else if timePanels3[nPosition].Color = clRed   then xData3[nPosition].xGrade :='2'//2 폐쇄
    else if timePanels3[nPosition].Color = clPurple   then xData3[nPosition].xGrade :='3';//3 마스터
    bx := timePanels3[nPosition].Left+TimePanels3[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData3[nPosition].xTime := ff;

    {휴일1}
         if timePanels4[nPosition].Color = clGreen then xData4[nPosition].xGrade :='1'
    else if timePanels4[nPosition].Color = clAqua  then xData4[nPosition].xGrade :='0'
    else if timePanels4[nPosition].Color = clRed   then xData4[nPosition].xGrade :='2'//2 폐쇄
    else if timePanels4[nPosition].Color = clPurple   then xData4[nPosition].xGrade :='3';//3 마스터
    bx := timePanels4[nPosition].Left+TimePanels4[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData4[nPosition].xTime := ff;

    {휴일2}
         if timePanels5[nPosition].Color = clGreen then xData5[nPosition].xGrade :='1'
    else if timePanels5[nPosition].Color = clAqua  then xData5[nPosition].xGrade :='0'
    else if timePanels5[nPosition].Color = clRed   then xData5[nPosition].xGrade :='2'//2 폐쇄
    else if timePanels5[nPosition].Color = clPurple   then xData5[nPosition].xGrade :='3';//3 마스터
    bx := timePanels5[nPosition].Left+TimePanels5[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData5[nPosition].xTime := ff;

    {휴일3}
         if timePanels6[nPosition].Color = clGreen then xData6[nPosition].xGrade :='1'
    else if timePanels6[nPosition].Color = clAqua  then xData6[nPosition].xGrade :='0'
    else if timePanels6[nPosition].Color = clRed   then xData6[nPosition].xGrade :='2'//2 폐쇄
    else if timePanels6[nPosition].Color = clPurple   then xData6[nPosition].xGrade :='3';//3 마스터
    bx := timePanels6[nPosition].Left+TimePanels6[nPosition].Width-1;
    ff := Round(12*24 * bx/ox);
    ff := ff /(12*24);
    xData6[nPosition].xTime := ff;

  end;

  with sg_DoorList do
  begin
    for j := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,j, bchkState);
      if bChkState then //체크 되어 있으면 해당 출입구역 Insert;
      begin
        stNodeNo := inttostr(strtoint(copy(Cells[14,j],1,3)));
        stECUID := copy(Cells[14,j],4,2);
        stDoorNO := copy(Cells[14,j],6,1);
        CreateSchedule(stNodeNo,stECUID,stDoorNO);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'0',xData1);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'1',xData2);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'2',xData3);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'3',xData4);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'4',xData5);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'5',xData6);
        ScheduleDataSend(stNodeNo,stECUID,stDoorNO); //데이터 전송
        DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,'0000000000' , '스케줄변경')
      end;
      Application.ProcessMessages;
    end;

  end;

(*
  if lbDoor.ItemIndex = 0 then
  begin

    if MessageDlg('등록된 문전체 스케쥴을 수정 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      for I:= 1 to lbDoor.Count - 1 do
      begin
      end;
    end else
    begin
      Exit;
    end;

  end else
  begin
    for I:= 1 to lbDoor.Count - 1 do
    begin
      if lbDoor.Selected[I] then
      begin
        stNodeNo := inttostr(strtoint(copy(DoorList.Strings[I],1,3)));
        stECUID := copy(DoorList.Strings[I],4,2);
        stDoorNO := copy(DoorList.Strings[I],6,1);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'0',xData1);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'1',xData2);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'2',xData3);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'3',xData4);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'4',xData5);
        DbUpDate(stNodeNo,stECUID,stDoorNO,'5',xData6);
        ScheduleDataSend(stNodeNo,stECUID,stDoorNO); //데이터 전송
        DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,'0000000000' , '스케줄변경')
      end;
    end;
  end;
*)
  Screen.Cursor:= crDefault;
  ShowMessage('적용 되었습니다.');
  //ShowMsg('스케쥴데이터를 전송 했습니다.',3000);
  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'SCHEDULETIMER'+ DATADELIMITER + '000000000000' + DATADELIMITER + 'N' + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

  SearchScheduleDoor(sg_DoorList.Cells[14,sg_DoorList.Row],sg_DoorList.TopRow);
end;


Procedure TDoorscheduleRegForm.DbUpDate(aNodeNo,aECUID,aDoorNo,aDayCode:String;aSch:array of TTimeSch );
var
  stSql : string;
begin
  if aSch[0].xTime = aSch[1].xTime then aSch[0].xGrade := aSch[1].xGrade;
  if aSch[1].xTime = aSch[2].xTime then aSch[1].xGrade := aSch[2].xGrade;
  if aSch[2].xTime = aSch[3].xTime then aSch[2].xGrade := aSch[3].xGrade;
  if aSch[3].xTime = aSch[4].xTime then aSch[3].xGrade := aSch[4].xGrade;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + Formatdatetime('hhnn',aSch[0].xTime) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + aSch[0].xGrade + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + Formatdatetime('hhnn',aSch[1].xTime) + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + aSch[1].xGrade + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + Formatdatetime('hhnn',aSch[2].xTime) + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + aSch[2].xGrade + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + Formatdatetime('hhnn',aSch[3].xTime) + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + aSch[3].xGrade + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + Formatdatetime('hhnn',aSch[4].xTime) + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + aSch[4].xGrade + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''' + aDayCode + ''' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
  end;

end;

procedure TDoorscheduleRegForm.btnCloseClick(Sender: TObject);
begin
  Close;
end;

Procedure TDoorscheduleRegForm.ScheduleDataSend(aNodeNo,aECUID,aDoorNO:string);
var
  st:         string;
  aDeviceID:  String;
  aDoor:      Char;
  aDoorIndex: Integer;
  aDay:       Char;
  aData:      String;
  aIndex:     Integer;
  stSql : string;

begin

{  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNO + ''' ';

  with Query_Sch do
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
//      aDeviceID:= FindField('DEVICE_ID').asString;
      First;
      While not eof do
      begin
        aDoor:= FindField('DO_DOORNO').asString[1];
        aDay := FindField('DE_DAYCODE').asString[1];
        aData:= FindField('DE_CELL5TIME').asString + FindField('DE_CELL1MODE').asString+
                FindField('DE_CELL1TIME').asString + FindField('DE_CELL2MODE').asString+
                FindField('DE_CELL2TIME').asString + FindField('DE_CELL3MODE').asString+
                FindField('DE_CELL3TIME').asString + FindField('DE_CELL4MODE').asString+
                FindField('DE_CELL4TIME').asString + FindField('DE_CELL5MODE').asString;

         aDevice:= fmMain.GetDevice(FillZeroNumber(strtoint(aNodeNo),3) + aECUID );
         if aDevice <> nil then
         begin
            aDevice.SendDoorSchadule(aDoor,aDay,aData);
         end;
         Next;
      end;
    end;
  end;
  //ShowMessage('스케줄 전송을 실행 했습니다.');  } 
end;

procedure TDoorscheduleRegForm.LoadBuildingCode(cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  cmb_Box.Enabled := True;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  if Not IsMaster then
  begin
    if BuildingGrade <> 0 then
    begin
      stSql := stSql + ' AND LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
    end
  end;
  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_DONGCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  BuildingCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        BuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade <> 0 then
        begin
          if BuildingCodeList.IndexOf(MasterBuildingCode) > 0 then
          begin
            cmb_Box.ItemIndex := BuildingCodeList.IndexOf(MasterBuildingCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TDoorscheduleRegForm.LoadAreaCode(aBuildingCode,
  aFloorCode: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AreaCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''2'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if (aFloorCode <> '') And (aFloorCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 2 then
    begin
      stSql := stSql + ' AND LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_AREACODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;


  cmb_Box.Items.Add('전체');
  AreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;

      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        AreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade > 2 then
        begin
          if AreaCodeList.IndexOf(MasterAreaCode) > 0 then
          begin
            cmb_Box.ItemIndex := AreaCodeList.IndexOf(MasterAreaCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TDoorscheduleRegForm.LoadFloorCode(aBuildingCode: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  cmb_Box.Clear;
  FloorCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';
  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;

  if Not IsMaster then
  begin
    if BuildingGrade > 1 then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
    end
  end;

  if G_nBuildingSearchIndex = 0 then
  begin
    stSql := stSql + ' Order by LO_FLOORCODE ';
  end else
  begin
    stSql := stSql + ' Order by LO_NAME ';
  end;

  cmb_Box.Items.Add('전체');
  FloorCodeList.Add('');
  cmb_Box.ItemIndex := 0;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      First;
      While Not Eof do
      begin
        cmb_Box.Items.Add(FindField('LO_NAME').AsString );
        FloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
      if Not IsMaster then
      begin
        if BuildingGrade > 1 then
        begin
          if FloorCodeList.IndexOf(MasterFloorCode) > 0 then
          begin
            cmb_Box.ItemIndex := FloorCodeList.IndexOf(MasterFloorCode);
            cmb_Box.Enabled := False;
          end;
        end
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TDoorscheduleRegForm.DoorLoad(aBuildingCode,aFloorCode,aAreaCode,aDoorGubun:string;aCode:string='';aTopRow:integer=0);
Var
  a : Integer;
  r : TDateTime;
  ox  : Integer;
  st: string;
  aDoorType: Integer;
  stSql : string;
  nRow : integer;
  stWeek,stweekend,stholiday,stholiday1,stholiday2,stholiday3:string;
begin

  GridInit(sg_DoorList,8,2,True);
//  DoorList.Clear;

  stSql := 'Select a.DO_DOORNONAME,a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO';
  stSql := stSql + ' from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON ( a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + '      AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + '      AND a.AC_ECUID = b.AC_ECUID ';
  stSql := stSql + '      AND b.AC_ACTYPE = ''1'') ';
  if Not IsMaster then
  begin
    if BuildingGrade = 4 then
    begin
      stSql := stSql + ' Inner Join TB_ADMINDOOR c ';
      stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
      stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
      stSql := stSql + ' AND a.AC_ECUID = c.AC_ECUID ';
      stSql := stSql + ' AND a.DO_DOORNO = c.DO_DOORNO ) ';
    end;
  end;
  stSql := stSql + ' Where a.GROUP_CODE = ''' + GROUPCODE + '''';
  stSql := stSql + ' AND a.DO_SCHUSE = ''1'' ';
  if aDoorGubun <> '' then stSql := stSql + ' AND a.DO_GUBUN = ''' + aDoorGubun + ''' ';
  if Not IsMaster then
  begin
    if BuildingGrade = 1 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 2 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end else if BuildingGrade = 3 then
    begin
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' '
      else
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + MasterBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' '
      else
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + MasterFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' '
      else
        stSql := stSql + ' AND a.LO_AREACODE = ''' + MasterAreaCode + ''' ';
    end else
    begin
      if BuildingGrade = 4 then stSql := stSql + ' AND c.AD_USERID = ''' + Master_ID + ''' ';
      if (aBuildingCode <> '') and (aBuildingCode <> '000') then
        stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
      if (aFloorCode <> '') and (aFloorCode <> '000') then
        stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
      if (aAreaCode <> '') and (aAreaCode <> '000') then
        stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
    end;
  end else
  begin
    if (aBuildingCode <> '') and (aBuildingCode <> '000') then
      stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
    if (aFloorCode <> '') and (aFloorCode <> '000') then
      stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
    if (aAreaCode <> '') and (aAreaCode <> '000') then
      stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  end;
//  lbDoor.Clear;
  with Query_Door do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;
    if recordCount < 1 then Exit;
    nRow := 1;
    sg_DoorList.RowCount := recordCount + 1;
    with sg_DoorList do
    begin
      while not eof do
      begin
        st:= FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').asString + FindField('DO_DOORNO').asString;
        AddCheckBox(0,nRow,False,False);
        GetDoorSchTime(FindField('AC_NODENO').AsString,FindField('AC_ECUID').asString,FindField('DO_DOORNO').asString,stweek ,stweekend,stholiday,stholiday1,stholiday2,stholiday3);
        Cells[1,nRow] := FindField('DO_DOORNONAME').asString;
        Cells[2,nRow] := stweek;
        Cells[3,nRow] := stweekend;
        Cells[4,nRow] := stholiday;
        Cells[5,nRow] := stholiday1;
        Cells[6,nRow] := stholiday2;
        Cells[7,nRow] := stholiday3;
        Cells[14,nRow] := st;

        if st = aCode then
        begin
          SelectRows(nRow,1);
        end;
        inc(nRow);
        Next;
      end;
      if aTopRow <> 0 then
      begin
        TopRow := aTopRow;
      end;

    end;

  end;

  sg_DoorListClick(Self);
  Screen.Cursor:= crDefault;
end;

procedure TDoorscheduleRegForm.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stDoorGubun : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  stDoorGubun := '';

  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  if cmb_FloorCode1.ItemIndex > 0 then stFloorCode := FloorCodeList.Strings[cmb_FloorCode1.itemIndex];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.ItemIndex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex];

  if cmb_Type.ItemIndex > 0 then stDoorGubun := DoorGubunCodeList.Strings[cmb_Type.ItemIndex];
  DoorLoad(stBuildingCode,stFloorCode,stAreaCode,stDoorGubun);
end;

procedure TDoorscheduleRegForm.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stDoorGubun : string;
begin
  stBuildingCode := '000';
  stFloorCode := '000';
  stAreaCode := '000';
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemindex];

  if cmb_Type.ItemIndex > 0 then stDoorGubun := DoorGubunCodeList.Strings[cmb_Type.ItemIndex];
  DoorLoad(stBuildingCode,stFloorCode,stAreaCode,stDoorGubun);

end;

procedure TDoorscheduleRegForm.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stDoorGubun : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then Exit;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex < 0 then Exit;
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex < 0 then Exit;
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];

  if cmb_Type.ItemIndex > 0 then stDoorGubun := DoorGubunCodeList.Strings[cmb_Type.ItemIndex];
  DoorLoad(stBuildingCode,stFloorCode,stAreaCode,stDoorGubun);
end;

procedure TDoorscheduleRegForm.CreateSchedule(aNodeNo, aECUID,
  aDOORNO: string);
var
  i : integer;
  stSql : string;
begin

  for I:= 0 to 5 do
  begin
    if Not checkTB_DEVICESCHEDULE(aNodeNo,aECUID,aDOORNO,i) then
    begin
      stSql := ' Insert Into TB_DEVICESCHEDULE ';
      stSql := stSql + '( GROUP_CODE,AC_NODENO,AC_ECUID,DO_DOORNO,DE_DAYCODE,';
      stSql := stSql + ' DE_CELL1TIME,DE_CELL1MODE,DE_CELL2TIME,DE_CELL2MODE,';
      stSql := stSql + ' DE_CELL3TIME,DE_CELL3MODE,DE_CELL4TIME,DE_CELL4MODE,';
      stSql := stSql + ' DE_CELL5TIME,DE_CELL5MODE,DE_UPDATETIME,DE_UPDATEOPERATOR,';
      stSql := stSql + ' DE_RCVACK ) ';
      stSql := stSql + ' Values(''' + GROUPCODE + ''',';
      stSql := stSql + aNodeNo + ',';
      stSql := stSql + '''' + aECUID + ''',';
      stSql := stSql + '''' + aDOORNO + ''',';
      stSql := stSql + '''' + inttostr(I) + ''',';
      stSql := stSql + '''0500'',';
      if i = 0 then stSql := stSql + '''1'','
      else stSql := stSql + '''0'',';
      stSql := stSql + '''1200'',';
      if i = 0 then stSql := stSql + '''1'','
      else stSql := stSql + '''0'',';
      stSql := stSql + '''1300'',';
      if i = 0 then stSql := stSql + '''1'','
      else stSql := stSql + '''0'',';
      stSql := stSql + '''1800'',';
      if i = 0 then stSql := stSql + '''1'','
      else stSql := stSql + '''0'',';
      stSql := stSql + '''0000'',';
      if i = 0 then stSql := stSql + '''1'','
      else stSql := stSql + '''0'',';
      stSql := stSql + '''' + FormatDateTime('yyyymmddHHMMSS',Now) + ''',';
      stSql := stSql + '''' + Master_ID + ''',';
      stSql := stSql + '''N'')';

      DataModule1.ProcessExecSQL(stSql);
    end;

  end;
end;

function TDoorscheduleRegForm.checkTB_DEVICESCHEDULE(aNodeNo, aECUID,
  aDOORNO: string;aDAYCODE:integer): Boolean;
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  result := False;

  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDOORNO + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''' + inttostr(aDayCode) + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TDoorscheduleRegForm.CheckFields5(Sender: TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := pan_Holiday2.Width - 2;
    bx := timePanels5[a].Left+TimePanels5[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label21.Caption := st; Label21.Left := bx-07; end;
      1 : Begin Label22.Caption := st; Label22.Left := bx-07; end;
      2 : Begin Label23.Caption := st; Label23.Left := bx-07; end;
      3 : Begin Label24.Caption := st; Label24.Left := bx-07; end;
    end;
  end;
end;

procedure TDoorscheduleRegForm.CheckFields6(Sender: TObject);
Var
  a : Integer;
  ox : Real;
  ax : Real;
  bx : Integer;
  st : String;
  t  : string;
  ff : TDateTime;
  Hour, Min, Sec, MSec: Word;
Begin
  if TPanel(Sender).Color = clRed then TPanel(Sender).Caption := '폐쇄'
  else if TPanel(Sender).Color = clGreen then TPanel(Sender).Caption := '개방'
  else if TPanel(Sender).Color = clAqua then TPanel(Sender).Caption := '운영'
  else if TPanel(Sender).Color = clPurple then TPanel(Sender).Caption := '마스터';
  for a := 0 to ComponentCount - 1 do
  Begin
    if Components[a] is TPanel then
      if Tpanel(Components[a]).Tag= 2 then
        Tpanel(Components[a]).Color := Tpanel(Tpanel(Components[a]).Parent).Color;
  end;

  for a := 0 to 4 do
  Begin
    ox := pan_Holiday3.Width - 2;
    bx := timePanels6[a].Left+TimePanels6[a].Width-1;
    ff := (bx/ox);
    ff := Round(12*24 * ff);
    ff := ff /(12*24);
    DecodeTime(ff,Hour, Min, Sec, MSec);
    t := IntToStr(Hour);  if Length(t) = 1 then t := '0' + t;
    st := IntToStr(Min);  if Length(st) = 1 then st := '0' + st;
    st := t + ':' + st;
    Case a of
      0 : Begin Label26.Caption := st; Label26.Left := bx-07; end;
      1 : Begin Label27.Caption := st; Label27.Left := bx-07; end;
      2 : Begin Label28.Caption := st; Label28.Left := bx-07; end;
      3 : Begin Label29.Caption := st; Label29.Left := bx-07; end;
    end;
  end;
end;

procedure TDoorscheduleRegForm.Panel25Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData5[0].xGrade := '0'      ; xData5[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData5[1].xGrade := '0'      ; xData5[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData5[2].xGrade := '0'      ; xData5[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData5[3].xGrade := '0'      ; xData5[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData5[4].xGrade := '0'      ; xData5[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }

  for a := 0 to 4 do
  Begin
    timePanels5[a].Align := alNone;
    timePanels5[a].Width := 10;
    timePanels5[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels5[a].Align := alClient
    else          timePanels5[a].Align := alLeft;
  end;

  r := 0;
  ox := pan_Holiday2.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels5[a].Color := clAqua;
    Case xData5[a].xGrade of
      '0': timePanels5[a].Color := clAqua;
      '1': timePanels5[a].Color := clGreen;
      '2': timePanels5[a].Color := clRed;
    end;
    if a = 0 then r := xData5[a].xTime
    else          r := xData5[a].xTime-xData5[a-1].xTime;

    timePanels5[a].Width := Round((ox) * (r));
  end;
  CheckFields5(timePanels5[0]);
end;

procedure TDoorscheduleRegForm.Panel65Click(Sender: TObject);
var
  a: Integer;
  r: TDatetime;
  ox: INteger;
begin
  xData6[0].xGrade := '0'      ; xData6[0].xTime := (05.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData6[1].xGrade := '0'      ; xData6[1].xTime := (12.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData6[2].xGrade := '0'      ; xData6[2].xTime := (13.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }
  xData6[3].xGrade := '0'      ; xData6[3].xTime := (18.0*3600.0 + 30.0*60.0) /(24*3600); { 평일 Default 값 }
  xData6[4].xGrade := '0'      ; xData6[4].xTime := (21.0*3600.0 + 00.0*60.0) /(24*3600); { 평일 Default 값 }

  for a := 0 to 4 do
  Begin
    timePanels6[a].Align := alNone;
    timePanels6[a].Width := 10;
    timePanels6[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then timePanels6[a].Align := alClient
    else          timePanels6[a].Align := alLeft;
  end;

  r := 0;
  ox := pan_Holiday3.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels6[a].Color := clAqua;
    Case xData6[a].xGrade of
      '0': timePanels6[a].Color := clAqua;
      '1': timePanels6[a].Color := clGreen;
      '2': timePanels6[a].Color := clRed;
    end;
    if a = 0 then r := xData6[a].xTime
    else          r := xData6[a].xTime-xData6[a-1].xTime;

    timePanels6[a].Width := Round((ox) * (r));
  end;
  CheckFields6(timePanels6[0]);
end;

procedure TDoorscheduleRegForm.PaintBox5Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox5.Width := pan_Holiday2.ClientRect.Right;
  dx := pan_Holiday2.Width - 2;
  With PaintBox5.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox5.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox5.Height);
      LineTo(x,PaintBox5.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox5.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox5.Height);
    LineTo(x,PaintBox5.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.PaintBox6Paint(Sender: TObject);
Var
  st  : String;
  x,y : Integer;
  r   : TRect;
  a,b : Integer;
  rr  : Real;
  dx : Integer;
  dy : Integer;
begin
  PaintBox6.Width := pan_Holiday3.ClientRect.Right;
  dx := pan_Holiday3.Width - 2;
  With PaintBox6.Canvas do
  Begin
    Pen.Color := clGray;
    Pen.Width := 1;
    r := ClientRect;
    FillRect(r);
    dy := PaintBox6.Height;
    for a := 0 to 23 do
    for b := 0 to 11 do
    Begin
      if b = 0 then y := dy
      else if b = 6 then y := dy div 2
      else y := dy div 4;
      rr := (a*12 + b)/(24*12);
      x := Round(dx * rr);
      MoveTo(x,PaintBox6.Height);
      LineTo(x,PaintBox6.Height-y);
      if b = 0 then
      Begin
        st := IntToStr(a);
        TextOut(x+2,0,st);
      end;
    end;
    y := PaintBox6.Height;
    rr := 1;
    x := Round(dx * rr);
    MoveTo(x,PaintBox6.Height);
    LineTo(x,PaintBox6.Height-y);
  end;
end;

procedure TDoorscheduleRegForm.pan_h21DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields5(Sender);
end;

procedure TDoorscheduleRegForm.pan_h21DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields5(Sender);
    end;
end;

procedure TDoorscheduleRegForm.pan_h21DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields5(Sender);

end;

procedure TDoorscheduleRegForm.pan_h21Resize(Sender: TObject);
begin
  inherited;
  CheckFields5(Sender);

end;

procedure TDoorscheduleRegForm.pan_h31DblClick(Sender: TObject);
Var
  aColor : TColor;
  bColor : TColor;
begin
  aColor := TPanel(Sender).Color;
  if aColor = clGreen then bColor := clAqua
  else if aColor = clRed then bColor := clGreen
  else if aColor = clAqua then bColor := clRed;
  TPanel(Sender).Color := bColor;
  CheckFields6(Sender);
end;

procedure TDoorscheduleRegForm.pan_h31DragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
  inherited;
  if (Sender is TPanel) then
    if Tpanel(Source).Tag = 1 then
    Begin
      TPanel(Sender).Color := Tpanel(Source).Color;
      CheckFields6(Sender);
    end;

end;

procedure TDoorscheduleRegForm.pan_h31DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if (Sender is TPanel) then Accept := Tpanel(Source).Tag = 1;
  CheckFields6(Sender);
end;

procedure TDoorscheduleRegForm.pan_h31Resize(Sender: TObject);
begin
  inherited;
  CheckFields6(Sender);
end;

procedure TDoorscheduleRegForm.sg_DoorListClick(Sender: TObject);
var
  a : Integer;
  r : TDateTime;
  ox  : Integer;
  aPortNo: Integer;
  aACUCode: String;
  stTemp : string;
  stNodeNO,stECUID,stDOORNO : string;
begin
  if sg_DoorList.Row < 1 then Exit;
  stTemp := sg_DoorList.Cells[14,sg_DoorList.Row];
  stNodeNO := inttostr(strtoint(copy(stTemp,1,3)));
  stECUID := copy(stTemp,4,2);
  stDoorNo := copy(stTemp,6,1);
  lb_SelectDoor.Caption := '선택된 출입문 : ' + sg_DoorList.Cells[1,sg_DoorList.Row];
  if Not LoadScheduleFormDB(stNodeNO,stECUID,stDoorNo) then LoadScheduleFormDB(stNodeNO,stECUID,stDoorNo);

  for a:= 0 to 4 do
  Begin
    timePanels1[a].Align := alNone;
    timePanels1[a].Width := 10;
    timePanels1[a].Left := 700;

    timePanels2[a].Align := alNone;
    timePanels2[a].Width := 10;
    timePanels2[a].Left := 700;

    timePanels3[a].Align := alNone;
    timePanels3[a].Width := 10;
    timePanels3[a].Left := 700;

    timePanels4[a].Align := alNone;
    timePanels4[a].Width := 10;
    timePanels4[a].Left := 700;

    timePanels5[a].Align := alNone;
    timePanels5[a].Width := 10;
    timePanels5[a].Left := 700;

    timePanels6[a].Align := alNone;
    timePanels6[a].Width := 10;
    timePanels6[a].Left := 700;
  end;

  for a := 0 to 4 do
  Begin
    if a = 4 then
    begin
      timePanels1[a].Align := alClient;
      timePanels2[a].Align := alClient;
      timePanels3[a].Align := alClient;
      timePanels4[a].Align := alClient;
      timePanels5[a].Align := alClient;
      timePanels6[a].Align := alClient;
    end else
    begin
      timePanels1[a].Align := alLeft;
      timePanels2[a].Align := alLeft;
      timePanels3[a].Align := alLeft;
      timePanels4[a].Align := alLeft;
      timePanels5[a].Align := alLeft;
      timePanels6[a].Align := alLeft;
    end;
  end;

  r := 0;
  ox := pan_Week.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels1[a].Color := clAqua;
    Case xData1[a].xGrade of
      '0' : timePanels1[a].Color := clAqua;
      '1' : timePanels1[a].Color := clGreen;
      '2' : timePanels1[a].Color := clRed;
      '3' : timePanels1[a].Color := clPurple;
    end;
    if a = 0 then r := xData1[a].xTime
             else r := xData1[a].xTime-xData1[a-1].xTime;

    timePanels1[a].Width := Round((ox) * (r));
  end;
  CheckFields1(timePanels1[0]);

  r := 0;
  ox := pan_saturday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels2[a].Color := clAqua;
    Case xData2[a].xGrade of
      '0' : timePanels2[a].Color := clAqua;
      '1' : timePanels2[a].Color := clGreen;
      '2' : timePanels2[a].Color := clRed;
      '3' : timePanels2[a].Color := clPurple;
    end;
    if a = 0 then r := xData2[a].xTime
             else r := xData2[a].xTime-xData2[a-1].xTime;

    timePanels2[a].Width := Round((ox) * (r));
  end;
  CheckFields2(timePanels2[0]);

  r := 0;
  ox := Pan_sunday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels3[a].Color := clAqua;
    Case xData3[a].xGrade of
      '0' : timePanels3[a].Color := clAqua;
      '1' : timePanels3[a].Color := clGreen;
      '2' : timePanels3[a].Color := clRed;
      '3' : timePanels3[a].Color := clPurple;
    end;
    if a = 0 then r := xData3[a].xTime
             else r := xData3[a].xTime-xData3[a-1].xTime;

    timePanels3[a].Width := Round((ox) * (r));
  end;
  CheckFields3(timePanels3[0]);

  r := 0;
  ox := pan_Holiday.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels4[a].Color := clAqua;
    Case xData4[a].xGrade of
      '0' : timePanels4[a].Color := clAqua;
      '1' : timePanels4[a].Color := clGreen;
      '2' : timePanels4[a].Color := clRed;
      '3' : timePanels4[a].Color := clPurple;
    end;
    if a = 0 then r := xData4[a].xTime
             else r := xData4[a].xTime-xData4[a-1].xTime;

    timePanels4[a].Width := Round((ox) * (r));
  end;
  CheckFields4(timePanels4[0]);


  r := 0;
  ox := pan_Holiday2.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels5[a].Color := clAqua;
    Case xData5[a].xGrade of
      '0' : timePanels5[a].Color := clAqua;
      '1' : timePanels5[a].Color := clGreen;
      '2' : timePanels5[a].Color := clRed;
      '3' : timePanels5[a].Color := clPurple;
    end;
    if a = 0 then r := xData5[a].xTime
             else r := xData5[a].xTime-xData5[a-1].xTime;

    timePanels5[a].Width := Round((ox) * (r));
  end;
  CheckFields5(timePanels5[0]);


  r := 0;
  ox := pan_Holiday3.Width - 2;
  for a := 0 to 4 do
  Begin
    timePanels6[a].Color := clAqua;
    Case xData6[a].xGrade of
      '0' : timePanels6[a].Color := clAqua;
      '1' : timePanels6[a].Color := clGreen;
      '2' : timePanels6[a].Color := clRed;
      '3' : timePanels6[a].Color := clPurple;
    end;
    if a = 0 then r := xData6[a].xTime
             else r := xData6[a].xTime-xData6[a-1].xTime;

    timePanels6[a].Width := Round((ox) * (r));
  end;
  CheckFields6(timePanels6[0]);

end;

procedure TDoorscheduleRegForm.sg_DoorListCheckBoxClick(Sender: TObject;
  ACol, ARow: Integer; State: Boolean);
begin
  if ARow = 0 then //전체선택 또는 해제
  begin
    if State then L_nDoorCheckCount := (Sender as TAdvStringGrid).RowCount - 1
    else L_nDoorCheckCount := 0;
    dmFormFunction.AdvStrinGridSetAllCheck(Sender,State);
  end else
  begin
    if State then L_nDoorCheckCount := L_nDoorCheckCount + 1
    else L_nDoorCheckCount := L_nDoorCheckCount - 1 ;
  end;

end;

procedure TDoorscheduleRegForm.CommandArrayCommandsTCommand0Execute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
//
end;

procedure TDoorscheduleRegForm.CommandArrayCommandsTCloseExecute(
  Command: TCommand; Params: TStringList);
begin
  inherited;
  Close;
end;


procedure TDoorscheduleRegForm.SearchScheduleDoor(aCode: string;
  aTopRow: integer);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stDoorGubun : string;
begin
  if cmb_BuildingCode1.itemindex > 0 then   stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  if cmb_FloorCode1.itemindex > 0 then stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  if cmb_AreaCode1.itemindex > 0 then stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];

  if cmb_Type.ItemIndex > 0 then stDoorGubun := DoorGubunCodeList.Strings[cmb_Type.ItemIndex];
  DoorLoad(stBuildingCode,stFloorCode,stAreaCode,stDoorGubun,aCode,aTopRow);
end;

procedure TDoorscheduleRegForm.cmb_TypeChange(Sender: TObject);
begin
  inherited;
  SearchScheduleDoor;
end;

procedure TDoorscheduleRegForm.GetDoorSchTime(aNodeNo, aEcuID,
  aDoorNo: string; var aWeek, aWeekend, aHoliday, aHoliday1, aHoliday2,
  aHoliday3: string);
var
  stSql : string;
  TempAdoQuery:TADOQuery;
begin
  aWeek:= '';
  aWeekend:= '';
  aHoliday:= '';
  aHoliday1:= '';
  aHoliday2:= '';
  aHoliday3:= '';

  stSql := 'SELECT * ';
  stSql := stSql + ' FROM TB_DEVICESCHEDULE ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDOORNO + ''' ';
  stSql := stSql + ' order by DE_DAYCODE ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;

      if RecordCount < 1 then
      begin
        Exit;
      end;
      While Not Eof do
      begin
        if FindField('DE_DAYCODE').AsInteger = 0 then
        begin
          aWeek := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aWeek := aWeek + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aWeek := aWeek + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aWeek := aWeek + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aWeek := aWeek + '마스터';
          aWeek := aWeek + ';';
          aWeek := aWeek + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aWeek := aWeek + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aWeek := aWeek + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aWeek := aWeek + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aWeek := aWeek + '마스터';
          aWeek := aWeek + ';';
          aWeek := aWeek + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aWeek := aWeek + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aWeek := aWeek + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aWeek := aWeek + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aWeek := aWeek + '마스터';
          aWeek := aWeek + ';';
          aWeek := aWeek + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aWeek := aWeek + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aWeek := aWeek + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aWeek := aWeek + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aWeek := aWeek + '마스터';
          aWeek := aWeek + ';';
          aWeek := aWeek + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aWeek := aWeek + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aWeek := aWeek + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aWeek := aWeek + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aWeek := aWeek + '마스터';
          aWeek := aWeek + ';';
        end else if FindField('DE_DAYCODE').AsInteger = 1 then
        begin
          aWeekend := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aWeekend := aWeekend + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aWeekend := aWeekend + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aWeekend := aWeekend + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aWeekend := aWeekend + '마스터';
          aWeekend := aWeekend + ';';
          aWeekend := aWeekend + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aWeekend := aWeekend + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aWeekend := aWeekend + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aWeekend := aWeekend + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aWeekend := aWeekend + '마스터';
          aWeekend := aWeekend + ';';
          aWeekend := aWeekend + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aWeekend := aWeekend + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aWeekend := aWeekend + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aWeekend := aWeekend + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aWeekend := aWeekend + '마스터';
          aWeekend := aWeekend + ';';
          aWeekend := aWeekend + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aWeekend := aWeekend + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aWeekend := aWeekend + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aWeekend := aWeekend + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aWeekend := aWeekend + '마스터';
          aWeekend := aWeekend + ';';
          aWeekend := aWeekend + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aWeekend := aWeekend + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aWeekend := aWeekend + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aWeekend := aWeekend + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aWeekend := aWeekend + '마스터';
          aWeekend := aWeekend + ';';
        end else if FindField('DE_DAYCODE').AsInteger = 2 then
        begin
          aHoliday := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aHoliday := aHoliday + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aHoliday := aHoliday + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aHoliday := aHoliday + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aHoliday := aHoliday + '마스터';
          aHoliday := aHoliday + ';';
          aHoliday := aHoliday + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aHoliday := aHoliday + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aHoliday := aHoliday + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aHoliday := aHoliday + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aHoliday := aHoliday + '마스터';
          aHoliday := aHoliday + ';';
          aHoliday := aHoliday + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aHoliday := aHoliday + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aHoliday := aHoliday + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aHoliday := aHoliday + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aHoliday := aHoliday + '마스터';
          aHoliday := aHoliday + ';';
          aHoliday := aHoliday + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aHoliday := aHoliday + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aHoliday := aHoliday + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aHoliday := aHoliday + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aHoliday := aHoliday + '마스터';
          aHoliday := aHoliday + ';';
          aHoliday := aHoliday + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aHoliday := aHoliday + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aHoliday := aHoliday + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aHoliday := aHoliday + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aHoliday := aHoliday + '마스터';
          aHoliday := aHoliday + ';';
        end else if FindField('DE_DAYCODE').AsInteger = 3 then
        begin
          aHoliday1 := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aHoliday1 := aHoliday1 + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aHoliday1 := aHoliday1 + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aHoliday1 := aHoliday1 + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aHoliday1 := aHoliday1 + '마스터';
          aHoliday1 := aHoliday1 + ';';
          aHoliday1 := aHoliday1 + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aHoliday1 := aHoliday1 + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aHoliday1 := aHoliday1 + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aHoliday1 := aHoliday1 + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aHoliday1 := aHoliday1 + '마스터';
          aHoliday1 := aHoliday1 + ';';
          aHoliday1 := aHoliday1 + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aHoliday1 := aHoliday1 + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aHoliday1 := aHoliday1 + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aHoliday1 := aHoliday1 + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aHoliday1 := aHoliday1 + '마스터';
          aHoliday1 := aHoliday1 + ';';
          aHoliday1 := aHoliday1 + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aHoliday1 := aHoliday1 + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aHoliday1 := aHoliday1 + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aHoliday1 := aHoliday1 + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aHoliday1 := aHoliday1 + '마스터';
          aHoliday1 := aHoliday1 + ';';
          aHoliday1 := aHoliday1 + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aHoliday1 := aHoliday1 + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aHoliday1 := aHoliday1 + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aHoliday1 := aHoliday1 + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aHoliday1 := aHoliday1 + '마스터';
          aHoliday1 := aHoliday1 + ';';
        end else if FindField('DE_DAYCODE').AsInteger = 4 then
        begin
          aHoliday2 := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aHoliday2 := aHoliday2 + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aHoliday2 := aHoliday2 + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aHoliday2 := aHoliday2 + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aHoliday2 := aHoliday2 + '마스터';
          aHoliday2 := aHoliday2 + ';';
          aHoliday2 := aHoliday2 + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aHoliday2 := aHoliday2 + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aHoliday2 := aHoliday2 + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aHoliday2 := aHoliday2 + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aHoliday2 := aHoliday2 + '마스터';
          aHoliday2 := aHoliday2 + ';';
          aHoliday2 := aHoliday2 + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aHoliday2 := aHoliday2 + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aHoliday2 := aHoliday2 + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aHoliday2 := aHoliday2 + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aHoliday2 := aHoliday2 + '마스터';
          aHoliday2 := aHoliday2 + ';';
          aHoliday2 := aHoliday2 + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aHoliday2 := aHoliday2 + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aHoliday2 := aHoliday2 + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aHoliday2 := aHoliday2 + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aHoliday2 := aHoliday2 + '마스터';
          aHoliday2 := aHoliday2 + ';';
          aHoliday2 := aHoliday2 + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aHoliday2 := aHoliday2 + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aHoliday2 := aHoliday2 + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aHoliday2 := aHoliday2 + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aHoliday2 := aHoliday2 + '마스터';
          aHoliday2 := aHoliday2 + ';';
        end else if FindField('DE_DAYCODE').AsInteger = 5 then
        begin
          aHoliday3 := '00:00~' + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2) + '-';
          if FindField('DE_CELL1MODE').asstring = '0' then aHoliday3 := aHoliday3 + '운영'
          else if FindField('DE_CELL1MODE').asstring = '1' then aHoliday3 := aHoliday3 + '개방'
          else if FindField('DE_CELL1MODE').asstring = '2' then aHoliday3 := aHoliday3 + '폐쇄'
          else if FindField('DE_CELL1MODE').asstring = '3' then aHoliday3 := aHoliday3 + '마스터';
          aHoliday3 := aHoliday3 + ';';
          aHoliday3 := aHoliday3 + copy(FindField('DE_CELL1TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL1TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2) + '-';
          if FindField('DE_CELL2MODE').asstring = '0' then aHoliday3 := aHoliday3 + '운영'
          else if FindField('DE_CELL2MODE').asstring = '1' then aHoliday3 := aHoliday3 + '개방'
          else if FindField('DE_CELL2MODE').asstring = '2' then aHoliday3 := aHoliday3 + '폐쇄'
          else if FindField('DE_CELL2MODE').asstring = '3' then aHoliday3 := aHoliday3 + '마스터';
          aHoliday3 := aHoliday3 + ';';
          aHoliday3 := aHoliday3 + copy(FindField('DE_CELL2TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL2TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2) + '-';
          if FindField('DE_CELL3MODE').asstring = '0' then aHoliday3 := aHoliday3 + '운영'
          else if FindField('DE_CELL3MODE').asstring = '1' then aHoliday3 := aHoliday3 + '개방'
          else if FindField('DE_CELL3MODE').asstring = '2' then aHoliday3 := aHoliday3 + '폐쇄'
          else if FindField('DE_CELL3MODE').asstring = '3' then aHoliday3 := aHoliday3 + '마스터';
          aHoliday3 := aHoliday3 + ';';
          aHoliday3 := aHoliday3 + copy(FindField('DE_CELL3TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL3TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2) + '-';
          if FindField('DE_CELL4MODE').asstring = '0' then aHoliday3 := aHoliday3 + '운영'
          else if FindField('DE_CELL4MODE').asstring = '1' then aHoliday3 := aHoliday3 + '개방'
          else if FindField('DE_CELL4MODE').asstring = '2' then aHoliday3 := aHoliday3 + '폐쇄'
          else if FindField('DE_CELL4MODE').asstring = '3' then aHoliday3 := aHoliday3 + '마스터';
          aHoliday3 := aHoliday3 + ';';
          aHoliday3 := aHoliday3 + copy(FindField('DE_CELL4TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL4TIME').asstring,3,2)+ '~' + copy(FindField('DE_CELL5TIME').asstring,1,2) + ':' + copy(FindField('DE_CELL5TIME').asstring,3,2) + '-';
          if FindField('DE_CELL5MODE').asstring = '0' then aHoliday3 := aHoliday3 + '운영'
          else if FindField('DE_CELL5MODE').asstring = '1' then aHoliday3 := aHoliday3 + '개방'
          else if FindField('DE_CELL5MODE').asstring = '2' then aHoliday3 := aHoliday3 + '폐쇄'
          else if FindField('DE_CELL5MODE').asstring = '3' then aHoliday3 := aHoliday3 + '마스터';
          aWeekend := aWeekend + ';';
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TDoorscheduleRegForm.ed_week1ehhKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stEditName : string;
  stNextEditName:string;
  stGroupboxName : string;
  oEdit : TEdit;
begin
  inherited;
  stEditName := TAdvEdit(sender).Name;
  stNextEditName := copy(stEditName,1,Length(stEditName)-4) + inttostr(TAdvEdit(sender).Tag + 1) + 's' + copy(stEditName,Length(stEditName)-1,2);
  oEdit := TravelEditItem(TGroupBox(TAdvEdit(Sender).Parent),stNextEditName,-1);
  if oEdit <> nil then
  begin
    oEdit.Text := TAdvEdit(sender).Text;
  end;

end;

procedure TDoorscheduleRegForm.ed_week2shhKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
var
  stEditName : string;
  stNextEditName:string;
  stGroupboxName : string;
  oEdit : TEdit;
begin
  inherited;
  stEditName := TAdvEdit(sender).Name;
  stNextEditName := copy(stEditName,1,Length(stEditName)-4) + inttostr(TAdvEdit(sender).Tag - 1) + 'e' + copy(stEditName,Length(stEditName)-1,2);
  oEdit := TravelEditItem(TGroupBox(TAdvEdit(Sender).Parent),stNextEditName,-1);
  if oEdit <> nil then
  begin
    oEdit.Text := TAdvEdit(sender).Text;
  end;

end;

procedure TDoorscheduleRegForm.btn_TextSaveClick(Sender: TObject);
var
  bresult : Boolean;
  j : integer;
  bchkState : Boolean;
  stNodeNo : string;
  stECUID : string;
  stDoorNO : string;
begin
  inherited;
  if L_nDoorCheckCount < 1 then
  begin
    showmessage('스케줄 적용할 출입문이 선택되지 않았습니다.');
    Exit;
  end;
  Screen.Cursor:= crHourGlass;

  with sg_DoorList do
  begin
    for j := 1 to RowCount - 1 do
    begin
      GetCheckBoxState(0,j, bchkState);
      if bChkState then //체크 되어 있으면 해당 출입구역 Insert;
      begin
        stNodeNo := inttostr(strtoint(copy(Cells[14,j],1,3)));
        stECUID := copy(Cells[14,j],4,2);
        stDoorNO := copy(Cells[14,j],6,1);
        CreateSchedule(stNodeNo,stECUID,stDoorNO);

        if PageControl2.ActivePage = tb_week then bresult := TextWeekScheduleSave(stNodeNo,stECUID,stDoorNO)
        else if PageControl2.ActivePage = tb_weekend then bresult := TextWeekendScheduleSave(stNodeNo,stECUID,stDoorNO)
        else if PageControl2.ActivePage = tb_sunday then bresult := TextsundayScheduleSave(stNodeNo,stECUID,stDoorNO)
        else if PageControl2.ActivePage = tb_holiday1 then bresult := Textholiday1ScheduleSave(stNodeNo,stECUID,stDoorNO)
        else if PageControl2.ActivePage = tb_holiday2 then bresult := Textholiday2ScheduleSave(stNodeNo,stECUID,stDoorNO)
        else if PageControl2.ActivePage = tb_holiday3 then bresult := Textholiday3ScheduleSave(stNodeNo,stECUID,stDoorNO);

        if Not bresult then break;
        if bresult then DataModule1.TB_SYSTEMLOGInsert(stNodeNo,stECUID,DOORTYPE,stDoorNO,'0000000000' , '스케줄변경')
      end;
      Application.ProcessMessages;
    end;

  end;
  Screen.Cursor:= crDefault;
  if bresult then
  begin
    ShowMessage('적용 되었습니다.');
    self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'SCHEDULETIMER'+ DATADELIMITER + '000000000000' + DATADELIMITER + 'N' + DATADELIMITER;
    self.FindSubForm('Main').FindCommand('SendData').Execute;

    SearchScheduleDoor(sg_DoorList.Cells[14,sg_DoorList.Row],sg_DoorList.TopRow);
  end;

end;

function TDoorscheduleRegForm.Textholiday1ScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_holiday11shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday11smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday12shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday12smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday13shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday13smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday14shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday14smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday15shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday15smm.Text) then bCheck := False;

  if Not isDigit(ed_holiday11ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday11emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday12ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday12emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday13ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday13emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday14ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday14emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday15ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday15emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_holiday11shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday12shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday13shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday14shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday15shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday11ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday12ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday13ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday14ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_holiday11smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday12smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday13smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday14smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday15smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday11emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday12emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday13emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday14emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_holiday11ehh.text,2) + FillZeroStrNum(ed_holiday11emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_holiday11mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_holiday12ehh.text,2) + FillZeroStrNum(ed_holiday12emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_holiday12mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_holiday13ehh.text,2) + FillZeroStrNum(ed_holiday13emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_holiday13mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_holiday14ehh.text,2) + FillZeroStrNum(ed_holiday14emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_holiday14mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_holiday15ehh.text,2) + FillZeroStrNum(ed_holiday15emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_holiday15mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''3'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

function TDoorscheduleRegForm.Textholiday2ScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_holiday21shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday21smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday22shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday22smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday23shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday23smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday24shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday24smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday25shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday25smm.Text) then bCheck := False;

  if Not isDigit(ed_holiday21ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday21emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday22ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday22emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday23ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday23emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday24ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday24emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday25ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday25emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_holiday21shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday22shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday23shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday24shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday25shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday21ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday22ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday23ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday24ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_holiday21smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday22smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday23smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday24smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday25smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday21emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday22emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday23emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday24emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_holiday21ehh.text,2) + FillZeroStrNum(ed_holiday21emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_holiday21mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_holiday22ehh.text,2) + FillZeroStrNum(ed_holiday22emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_holiday22mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_holiday23ehh.text,2) + FillZeroStrNum(ed_holiday23emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_holiday23mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_holiday24ehh.text,2) + FillZeroStrNum(ed_holiday24emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_holiday24mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_holiday25ehh.text,2) + FillZeroStrNum(ed_holiday25emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_holiday25mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''4'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

function TDoorscheduleRegForm.Textholiday3ScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_holiday31shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday31smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday32shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday32smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday33shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday33smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday34shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday34smm.Text) then bCheck := False;
  if Not isDigit(ed_holiday35shh.Text) then bCheck := False;
  if Not isDigit(ed_holiday35smm.Text) then bCheck := False;

  if Not isDigit(ed_holiday31ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday31emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday32ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday32emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday33ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday33emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday34ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday34emm.Text) then bCheck := False;
  if Not isDigit(ed_holiday35ehh.Text) then bCheck := False;
  if Not isDigit(ed_holiday35emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_holiday31shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday32shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday33shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday34shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday35shh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday31ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday32ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday33ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_holiday34ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_holiday31smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday32smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday33smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday34smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday35smm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday31emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday32emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday33emm.Text) > 59 then bCheck := False;
  if strtoint(ed_holiday34emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_holiday31ehh.text,2) + FillZeroStrNum(ed_holiday31emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_holiday31mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_holiday32ehh.text,2) + FillZeroStrNum(ed_holiday32emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_holiday32mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_holiday33ehh.text,2) + FillZeroStrNum(ed_holiday33emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_holiday33mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_holiday34ehh.text,2) + FillZeroStrNum(ed_holiday34emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_holiday34mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_holiday35ehh.text,2) + FillZeroStrNum(ed_holiday35emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_holiday35mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''5'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

function TDoorscheduleRegForm.TextsundayScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_sun1shh.Text) then bCheck := False;
  if Not isDigit(ed_sun1smm.Text) then bCheck := False;
  if Not isDigit(ed_sun2shh.Text) then bCheck := False;
  if Not isDigit(ed_sun2smm.Text) then bCheck := False;
  if Not isDigit(ed_sun3shh.Text) then bCheck := False;
  if Not isDigit(ed_sun3smm.Text) then bCheck := False;
  if Not isDigit(ed_sun4shh.Text) then bCheck := False;
  if Not isDigit(ed_sun4smm.Text) then bCheck := False;
  if Not isDigit(ed_sun5shh.Text) then bCheck := False;
  if Not isDigit(ed_sun5smm.Text) then bCheck := False;

  if Not isDigit(ed_sun1ehh.Text) then bCheck := False;
  if Not isDigit(ed_sun1emm.Text) then bCheck := False;
  if Not isDigit(ed_sun2ehh.Text) then bCheck := False;
  if Not isDigit(ed_sun2emm.Text) then bCheck := False;
  if Not isDigit(ed_sun3ehh.Text) then bCheck := False;
  if Not isDigit(ed_sun3emm.Text) then bCheck := False;
  if Not isDigit(ed_sun4ehh.Text) then bCheck := False;
  if Not isDigit(ed_sun4emm.Text) then bCheck := False;
  if Not isDigit(ed_sun5ehh.Text) then bCheck := False;
  if Not isDigit(ed_sun5emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_sun1shh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun2shh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun3shh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun4shh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun5shh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun1ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun2ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun3ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_sun4ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_sun1smm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun2smm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun3smm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun4smm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun5smm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun1emm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun2emm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun3emm.Text) > 59 then bCheck := False;
  if strtoint(ed_sun4emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_sun1ehh.text,2) + FillZeroStrNum(ed_sun1emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_sun1mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_sun2ehh.text,2) + FillZeroStrNum(ed_sun2emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_sun2mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_sun3ehh.text,2) + FillZeroStrNum(ed_sun3emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_sun3mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_sun4ehh.text,2) + FillZeroStrNum(ed_sun4emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_sun4mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_sun5ehh.text,2) + FillZeroStrNum(ed_sun5emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_sun5mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''2'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

function TDoorscheduleRegForm.TextWeekendScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_weekend1shh.Text) then bCheck := False;
  if Not isDigit(ed_weekend1smm.Text) then bCheck := False;
  if Not isDigit(ed_weekend2shh.Text) then bCheck := False;
  if Not isDigit(ed_weekend2smm.Text) then bCheck := False;
  if Not isDigit(ed_weekend3shh.Text) then bCheck := False;
  if Not isDigit(ed_weekend3smm.Text) then bCheck := False;
  if Not isDigit(ed_weekend4shh.Text) then bCheck := False;
  if Not isDigit(ed_weekend4smm.Text) then bCheck := False;
  if Not isDigit(ed_weekend5shh.Text) then bCheck := False;
  if Not isDigit(ed_weekend5smm.Text) then bCheck := False;

  if Not isDigit(ed_weekend1ehh.Text) then bCheck := False;
  if Not isDigit(ed_weekend1emm.Text) then bCheck := False;
  if Not isDigit(ed_weekend2ehh.Text) then bCheck := False;
  if Not isDigit(ed_weekend2emm.Text) then bCheck := False;
  if Not isDigit(ed_weekend3ehh.Text) then bCheck := False;
  if Not isDigit(ed_weekend3emm.Text) then bCheck := False;
  if Not isDigit(ed_weekend4ehh.Text) then bCheck := False;
  if Not isDigit(ed_weekend4emm.Text) then bCheck := False;
  if Not isDigit(ed_weekend5ehh.Text) then bCheck := False;
  if Not isDigit(ed_weekend5emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_weekend1shh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend2shh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend3shh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend4shh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend5shh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend1ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend2ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend3ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_weekend4ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_weekend1smm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend2smm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend3smm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend4smm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend5smm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend1emm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend2emm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend3emm.Text) > 59 then bCheck := False;
  if strtoint(ed_weekend4emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_weekend1ehh.text,2) + FillZeroStrNum(ed_weekend1emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_weekend1mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_weekend2ehh.text,2) + FillZeroStrNum(ed_weekend2emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_weekend2mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_weekend3ehh.text,2) + FillZeroStrNum(ed_weekend3emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_weekend3mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_weekend4ehh.text,2) + FillZeroStrNum(ed_weekend4emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_weekend4mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_weekend5ehh.text,2) + FillZeroStrNum(ed_weekend5emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_weekend5mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''1'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

function TDoorscheduleRegForm.TextWeekScheduleSave(aNodeNo,aECUID,aDoorNO:string): Boolean;
var
  bCheck : Boolean;
  stSql : string;
begin
  result := False;
  bCheck := True;
  if Not isDigit(ed_week1shh.Text) then bCheck := False;
  if Not isDigit(ed_week1smm.Text) then bCheck := False;
  if Not isDigit(ed_week2shh.Text) then bCheck := False;
  if Not isDigit(ed_week2smm.Text) then bCheck := False;
  if Not isDigit(ed_week3shh.Text) then bCheck := False;
  if Not isDigit(ed_week3smm.Text) then bCheck := False;
  if Not isDigit(ed_week4shh.Text) then bCheck := False;
  if Not isDigit(ed_week4smm.Text) then bCheck := False;
  if Not isDigit(ed_week5shh.Text) then bCheck := False;
  if Not isDigit(ed_week5smm.Text) then bCheck := False;

  if Not isDigit(ed_week1ehh.Text) then bCheck := False;
  if Not isDigit(ed_week1emm.Text) then bCheck := False;
  if Not isDigit(ed_week2ehh.Text) then bCheck := False;
  if Not isDigit(ed_week2emm.Text) then bCheck := False;
  if Not isDigit(ed_week3ehh.Text) then bCheck := False;
  if Not isDigit(ed_week3emm.Text) then bCheck := False;
  if Not isDigit(ed_week4ehh.Text) then bCheck := False;
  if Not isDigit(ed_week4emm.Text) then bCheck := False;
  if Not isDigit(ed_week5ehh.Text) then bCheck := False;
  if Not isDigit(ed_week5emm.Text) then bCheck := False;

  if Not bCheck then
  begin
    showmessage('시간은 숫자 타입만 입력 가능합니다.');
    Exit;
  end;
  if strtoint(ed_week1shh.Text) > 24 then bCheck := False;
  if strtoint(ed_week2shh.Text) > 24 then bCheck := False;
  if strtoint(ed_week3shh.Text) > 24 then bCheck := False;
  if strtoint(ed_week4shh.Text) > 24 then bCheck := False;
  if strtoint(ed_week5shh.Text) > 24 then bCheck := False;
  if strtoint(ed_week1ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_week2ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_week3ehh.Text) > 24 then bCheck := False;
  if strtoint(ed_week4ehh.Text) > 24 then bCheck := False;
  //if strtoint(ed_week5ehh.Text) > 24 then bCheck := False;
  if Not bCheck then
  begin
    showmessage('시 범위는 0~24 까지 입니다.');
    Exit;
  end;
  if strtoint(ed_week1smm.Text) > 59 then bCheck := False;
  if strtoint(ed_week2smm.Text) > 59 then bCheck := False;
  if strtoint(ed_week3smm.Text) > 59 then bCheck := False;
  if strtoint(ed_week4smm.Text) > 59 then bCheck := False;
  if strtoint(ed_week5smm.Text) > 59 then bCheck := False;
  if strtoint(ed_week1emm.Text) > 59 then bCheck := False;
  if strtoint(ed_week2emm.Text) > 59 then bCheck := False;
  if strtoint(ed_week3emm.Text) > 59 then bCheck := False;
  if strtoint(ed_week4emm.Text) > 59 then bCheck := False;

  if Not bCheck then
  begin
    showmessage('분 범위는 0~59 까지 입니다.');
    Exit;
  end;

  stSql := 'update TB_DEVICESCHEDULE ';
  stSql := stSql + ' Set ';
  stSql := stSql + ' DE_CELL1TIME = ''' + FillZeroStrNum(ed_week1ehh.text,2) + FillZeroStrNum(ed_week1emm.text,2) + ''', ';
  stSql := stSql + ' DE_CELL1MODE = ''' + inttostr(cmb_week1mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL2TIME = ''' + FillZeroStrNum(ed_week2ehh.text,2) + FillZeroStrNum(ed_week2emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL2MODE = ''' + inttostr(cmb_week2mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL3TIME = ''' + FillZeroStrNum(ed_week3ehh.text,2) + FillZeroStrNum(ed_week3emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL3MODE = ''' + inttostr(cmb_week3mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL4TIME = ''' + FillZeroStrNum(ed_week4ehh.text,2) + FillZeroStrNum(ed_week4emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL4MODE = ''' + inttostr(cmb_week4mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_CELL5TIME = ''' + FillZeroStrNum(ed_week5ehh.text,2) + FillZeroStrNum(ed_week5emm.text,2)  + ''', ';
  stSql := stSql + ' DE_CELL5MODE = ''' + inttostr(cmb_week5mode.ItemIndex) + ''', ';
  stSql := stSql + ' DE_UPDATETIME = ''' + FormatDatetime('yyyymmddhhnnss',now) + ''', ';
  stSql := stSql + ' DE_UPDATEOPERATOR = ''' + Master_ID + ''',';
  stSql := stSql + ' DE_RCVACK = ''N'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';
  stSql := stSql + ' AND DE_DAYCODE = ''0'' ';

  if Not DataModule1.ProcessExecSQL(stSql) then
  begin
      Application.MessageBox (PChar('스케쥴저장이 실패했습니다!'),
                              PChar(Caption),MB_ICONSTOP or MB_OK);
      Exit;
  end;

  result := True;
end;

initialization
  RegisterClass(TDoorscheduleRegForm);
Finalization
  UnRegisterClass(TDoorscheduleRegForm);

end.


