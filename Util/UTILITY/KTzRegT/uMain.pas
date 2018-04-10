{***************************************************************}
{  TBMS 용 설정 프로그램                                        }
{  File Name: uMain.pas                                         }
{                                                               }
{  Copyright (c) 2007 this70@naver.com                          }
{                                                               }
{  All rights reserved.                                         }
{                                                               }
{***************************************************************}

{

 MCU(Main Control Unit)
 ECU(Expension Control Unit)
 ICU(Integration Cardreader Unit)
 GCU(General Cardreader Unit)
 SCU(State Control unit)
 PCU(Power Control unit)

 ★ Used components  ★
    Async Professional
    Raize
  ============================================================
  프로그램 조건
  ============================================================
  - 설정내용은 INI 파일에 저정및 불러 오기를 힐 수 있어야 한다.
  - 하나의 버튼으로 전체 내용을 불러 올수 있어야 한다.
  - 하나의 버튼으로 전체 내용을 저장 힐 수 있어야 한다.
  - 카드등`과 스케쥴은 따로 저장 및 불러오기가 가능해야 한다.
  - MCU와 ECU 등록 화면이 각가가 존재 해야 한다.
  ============================================================
}


unit uMain;

interface



uses
  TraceTool,
  uLomosUtil,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzPanel, ExtCtrls, Menus, RzSplit, OoMisc, AdPort,
  ImgList, AdWnPort, StdCtrls, RzSpnEdt, Grids, RzGrids, RzRadGrp,
  RzCmboBx, RzLabel, RzTabs, RzLstBox, RzChkLst, Mask, RzEdit, DB, dbisamtb,
  DBGrids, RzDBGrid, ActnList, ComCtrls, RzListVw, RzBHints, ToolWin, jpeg,
  RzCommon, AdStatLt, RzStatus, DXString, DXServerCore, LMDStrList,
  LMDCustomComponent, LMDBaseController, LMDCustomContainer, LMDStringList,
  RzRadChk, LMDContainerComponent, LMDBaseDialog, LMDTextEditDlg, LMDTipDlg,
  LMDCustomCheckListDlg, LMDCheckListDlg, LMDMsg,iniFiles, Buttons;

type

  TSendData = class
  private
    // The data fields of this new class
    fMarker: string;
    fTRansmitData: string;
    fSendTime: TDatetime;
    fSendCount: Integer;

  public
    // Properties to read these data values
    property Marker: string read fMarker;
    property TRansmitData: string read fTRansmitData;
    property SendTime: TDatetime read fSendTime;
    property SendCount: Integer read fSendCount;

    // Constructor
    constructor Create(const aMarker: string; const aTRansmitData: string);
  end;

  TForm_Main = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    MCU1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    Menu_ImageList: TImageList;
    MCU2: TMenuItem;
    ECUtjfwjd1: TMenuItem;
    RzStatusBar1: TRzStatusBar;
    ActionList1: TActionList;
    Action_RegMCU: TAction;
    Action_RegECU: TAction;
    RzBalloonHints1: TRzBalloonHints;
    Panel_Main: TRzPanel;
    CoolBar1: TCoolBar;
    RzToolbar1: TRzToolbar;
    Panel_MCU: TRzPanel;
    Panel_ktlog: TRzPanel;
    Image1: TImage;
    ToolButton_Connect: TRzToolButton;
    ToolButton_Disconnect: TRzToolButton;
    RzSpacer1: TRzSpacer;
    ToolButton_MCU: TRzToolButton;
    ToolButton_ECU: TRzToolButton;
    RzSpacer2: TRzSpacer;
    ToolButton_LoadFile: TRzToolButton;
    ToolButton_SaveFile: TRzToolButton;
    Action_Connect: TAction;
    Action_Disconnect: TAction;
    Action_FileLoad: TAction;
    ActionFIleSave: TAction;
    RzRegIniFile1: TRzRegIniFile;
    N7: TMenuItem;
    Action_SetComport: TAction;
    CommPort: TApdComPort;
    FieldStatus_ComStatus: TRzFieldStatus;
    RzFieldStatus2: TRzFieldStatus;
    Label2: TLabel;
    Label7: TLabel;
    StatusLight_TX: TApdStatusLight;
    StatusLight_RX: TApdStatusLight;
    ApdSLController: TApdSLController;
    RzGroupBox7: TRzGroupBox;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    Label8: TLabel;
    Edit_IP: TRzEdit;
    Edit_subnet: TRzEdit;
    Label9: TLabel;
    edit_Gateway: TRzEdit;
    edit_port: TRzEdit;
    btnRegCard: TRzBitBtn;
    btnRegSchedule: TRzBitBtn;
    Status_CardEvent: TRzFieldStatus;
    About1: TMenuItem;
    dsTB_CARD: TDataSource;
    TB_CARD: TDBISAMTable;
    toolslist: TImageList;
    Status_AlarmMode: TRzGlyphStatus;
    Status_Door1: TRzGlyphStatus;
    Status_Door2: TRzGlyphStatus;
    SmallDoorList: TImageList;
    RzSpacer3: TRzSpacer;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    MCUID1: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    MENU_REGMCUID: TMenuItem;
    MENU_REGECU: TMenuItem;
    MENU_REGDISALARM: TMenuItem;
    MENU_KTTID: TMenuItem;
    MENU_REGDECODERNO: TMenuItem;
    MENU_REGTELLCOUNT: TMenuItem;
    MENU_REGLAN: TMenuItem;
    MENU_REGSYS: TMenuItem;
    MENU_REGSYS2: TMenuItem;
    MENU_REGREADER: TMenuItem;
    MENU_REGPORT: TMenuItem;
    MENU_CHKMCU: TMenuItem;
    MENU_CHKECU: TMenuItem;
    MENU_CHKDISALARM: TMenuItem;
    MENU_CHKKTTID: TMenuItem;
    MENU_CHKDECODERNO: TMenuItem;
    MENU_CHKTELLCOUNT: TMenuItem;
    MENU_CHKLAN: TMenuItem;
    MENU_CHECKMCU: TMenuItem;
    MENU_CHKSYS: TMenuItem;
    MENU_CHKSYS2: TMenuItem;
    MENU_CHKREADER: TMenuItem;
    MENU_CHKPORT: TMenuItem;
    MENU_TIMESYNC: TMenuItem;
    MENU_RESET: TMenuItem;
    N33: TMenuItem;
    N110: TMenuItem;
    N210: TMenuItem;
    MENU_OPENDOOR1: TMenuItem;
    MENU_NMOODDOOR1: TMenuItem;
    MENU_OMODEDOOR1: TMenuItem;
    MENU_OPEMDOOR2: TMenuItem;
    MENU_NMODEDOOR2: TMenuItem;
    MENU_OMODEDOOR2: TMenuItem;
    MENU_CLEARREG: TMenuItem;
    N41: TMenuItem;
    MENU_SETARM: TMenuItem;
    MENU_SETDISARM: TMenuItem;
    SendTimer: TTimer;
    MENU_MCUREG: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    Button1: TButton;
    LMDMessageBoxDlg1: TLMDMessageBoxDlg;
    N15: TMenuItem;
    TB_DEVICE: TDBISAMTable;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    N16: TMenuItem;
    N17: TMenuItem;
    MENU_Version: TMenuItem;
    btnComCheck: TRzBitBtn;
    RzSpacer4: TRzSpacer;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    RzToolButton3: TRzToolButton;
    Timer_ENQ: TTimer;
    Rg_Mode: TRadioGroup;
    N18: TMenuItem;
    PopupMenu1: TPopupMenu;
    N19: TMenuItem;
    GroupBox2: TGroupBox;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ed_server: TRzEdit;
    ed_SPort: TRzEdit;
    btnLanSett: TBitBtn;
    ed_imageSIP: TRzEdit;
    ed_ImageSPort: TRzEdit;
    btn_ImageLan: TBitBtn;
    btn_ImageSearch: TBitBtn;
    ed_AdminIp: TRzEdit;
    ed_AdminPort: TRzEdit;
    btn_AdminSearch: TBitBtn;
    btn_adminset: TBitBtn;
    RzGroupBox8: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    Label31: TLabel;
    Label32: TLabel;
    ed_IP2: TRzEdit;
    ed_SubNet2: TRzEdit;
    ed_GateWay2: TRzEdit;
    ed_Port2: TRzEdit;
    RadioGroup1: TRadioGroup;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    ed_LServerIP: TRzEdit;
    ed_LServerPort: TRzEdit;
    RzEdit7: TRzEdit;
    RzEdit8: TRzEdit;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    RzEdit9: TRzEdit;
    RzEdit10: TRzEdit;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    btn_Lan2Set: TBitBtn;
    btn_LanSearch: TBitBtn;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    btnRefresh: TRzBitBtn;
    btnReg: TRzBitBtn;
    Panel2: TPanel;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    PageControl1: TPageControl;
    tb_Mcu: TTabSheet;
    tb_Ecu: TTabSheet;
    RzGroupBox6: TRzGroupBox;
    RzLabel1: TRzLabel;
    Edit_DeviceID1: TRzEdit;
    Edit_DeviceID2: TRzEdit;
    Edit_DeviceID3: TRzEdit;
    Edit_DeviceID4: TRzEdit;
    Edit_DeviceID5: TRzEdit;
    Edit_DeviceID6: TRzEdit;
    Edit_DeviceID7: TRzEdit;
    RzGroupBox5: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel17: TRzLabel;
    Label79: TLabel;
    Edit_LinkusID: TRzEdit;
    Edit_LinkusTel: TRzEdit;
    Spinner_Ring: TRzSpinner;
    RzGroupBox9: TRzGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label52: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    RadioGroup2: TRadioGroup;
    ed_ip: TEdit;
    ed_port: TEdit;
    ed_Subnet: TEdit;
    ed_GateWay: TEdit;
    rg_NM: TRadioGroup;
    ed_Serverip: TEdit;
    ed_ServerPort: TEdit;
    ed_AVServerIP: TEdit;
    ed_AVServerPort: TEdit;
    ed_UserAVIP: TEdit;
    ed_UserAVPort: TEdit;
    ed_Constate: TEdit;
    ed_Connect: TEdit;
    rg_Dhcp: TRadioGroup;
    chk_Local: TCheckBox;
    ed_LocalIP: TEdit;
    ed_LocalPort: TEdit;
    rg_LocalNM: TRadioGroup;
    ed_LocalSubnet: TEdit;
    ed_LocalGateWay: TEdit;
    ed_LocalServerPort: TEdit;
    ed_LocalServerIP: TEdit;
    rg_Debug: TRadioGroup;
    ed_LocalConnect: TEdit;
    ed_LocalConState: TEdit;
    rg_LocalDhcp: TRadioGroup;
    ed_Version: TEdit;
    btnKTLanSet: TButton;
    btnKTLanSearch: TButton;
    RzGroupBox10: TRzGroupBox;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    lvECU: TRzListView;
    TabSheet2: TRzTabSheet;
    CheckList_Alarm: TRzCheckList;
    btnECUAdd: TRzBitBtn;
    btnECUErase: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label3: TLabel;
    Label76: TLabel;
    Label4: TLabel;
    Label1: TLabel;
    ComboBox_WatchPowerOff: TRzComboBox;
    SpinEdit_OutDelay: TRzSpinEdit;
    ComboBox_DoorType1: TRzComboBox;
    ComboBox_DoorType2: TRzComboBox;
    SpinEdit_InDelay: TRzSpinEdit;
    Edit_Locate: TRzEdit;
    ComboBox_ECU: TRzComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RzGroupBox3: TRzGroupBox;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label16: TLabel;
    ComboBox_CardModeType1: TRzComboBox;
    ComboBox_DoorModeType1: TRzComboBox;
    SpinEdit_DoorOPen1: TRzSpinEdit;
    SpinEdit_OpenMoni1: TRzSpinEdit;
    ComboBox_UseSch1: TRzComboBox;
    ComboBox_SendDoorStatus1: TRzComboBox;
    ComboBox_AlarmLongOpen1: TRzComboBox;
    ComboBox_LockType1: TRzComboBox;
    ComboBox_ControlFire1: TRzComboBox;
    ComboBox_CardModeType2: TRzComboBox;
    ComboBox_DoorModeType2: TRzComboBox;
    SpinEdit_DoorOPen2: TRzSpinEdit;
    SpinEdit_OpenMoni2: TRzSpinEdit;
    ComboBox_UseSch2: TRzComboBox;
    ComboBox_SendDoorStatus2: TRzComboBox;
    ComboBox_AlarmLongOpen2: TRzComboBox;
    ComboBox_LockType2: TRzComboBox;
    ComboBox_ControlFire2: TRzComboBox;
    RzPanel2: TRzPanel;
    RzPanel4: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    Label5: TLabel;
    Label20: TLabel;
    cb_CardType: TRzComboBox;
    RzGroupBox4: TRzGroupBox;
    Label6: TLabel;
    sgPort: TRzStringGrid;
    cbPort: TRzComboBox;
    Bevel1: TBevel;
    RzGroupBox11: TRzGroupBox;
    Label69: TLabel;
    sg_CCTV: TRzStringGrid;
    cmb_cctv: TRzComboBox;
    sgCardReader: TRzStringGrid;
    cbCardReader: TRzComboBox;
    Panel3: TPanel;
    Label17: TLabel;
    lb_Version: TLabel;
    btn_CCTVSearch: TButton;
    btn_CCTVSet: TButton;
    procedure Action_SearchMCUExecute(Sender: TObject);
    procedure Action_RegMCUExecute(Sender: TObject);
    procedure Action_RegECUExecute(Sender: TObject);
    procedure Action_CloseExecute(Sender: TObject);
    procedure CommportTriggerAvail(CP: TObject; Count: Word);
    procedure cbCardReaderExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure sgCardReaderSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sgPortSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure cbPortExit(Sender: TObject);
    procedure btnECUAddClick(Sender: TObject);
    procedure Action_ConnectExecute(Sender: TObject);
    procedure Action_DisconnectExecute(Sender: TObject);
    procedure Action_FileLoadExecute(Sender: TObject);
    procedure ActionFIleSaveExecute(Sender: TObject);
    procedure Action_SetComportExecute(Sender: TObject);
    procedure CommPortPortOpen(Sender: TObject);
    procedure CommPortPortClose(Sender: TObject);
    procedure btnECUEraseClick(Sender: TObject);
    procedure btnRegCardClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRegScheduleClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox_ECUChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lvECUChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure lvECUKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SendTimerTimer(Sender: TObject);
    procedure MENU_CHKMCUClick(Sender: TObject);
    procedure MENU_CHKECUClick(Sender: TObject);
    procedure MENU_CHKDISALARMClick(Sender: TObject);
    procedure MENU_CHKKTTIDClick(Sender: TObject);
    procedure MENU_CHKDECODERNOClick(Sender: TObject);
    procedure MENU_CHKTELLCOUNTClick(Sender: TObject);
    procedure MENU_CHKLANClick(Sender: TObject);
    procedure MENU_CHKSYSClick(Sender: TObject);
    procedure MENU_CHKSYS2Click(Sender: TObject);
    procedure MENU_CHKREADERClick(Sender: TObject);
    procedure MENU_CHKPORTClick(Sender: TObject);
    procedure MENU_REGMCUIDClick(Sender: TObject);
    procedure MENU_REGECUClick(Sender: TObject);
    procedure MENU_REGDISALARMClick(Sender: TObject);
    procedure MENU_KTTIDClick(Sender: TObject);
    procedure MENU_REGDECODERNOClick(Sender: TObject);
    procedure MENU_REGTELLCOUNTClick(Sender: TObject);
    procedure MENU_REGLANClick(Sender: TObject);
    procedure MENU_REGSYSClick(Sender: TObject);
    procedure MENU_REGSYS2Click(Sender: TObject);
    procedure MENU_REGREADERClick(Sender: TObject);
    procedure MENU_REGPORTClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnRegClick(Sender: TObject);
    procedure Edit_LinkusIDChange(Sender: TObject);
    procedure Edit_LinkusTelChange(Sender: TObject);
    procedure Spinner_RingChange(Sender: TObject);
    procedure Edit_IPChange(Sender: TObject);
    procedure Edit_subnetChange(Sender: TObject);
    procedure edit_GatewayChange(Sender: TObject);
    procedure edit_portChange(Sender: TObject);
    procedure ComboBox_WatchPowerOffChange(Sender: TObject);
    procedure SpinEdit_OutDelayChange(Sender: TObject);
    procedure SpinEdit_InDelayChange(Sender: TObject);
    procedure ComboBox_DoorType1Change(Sender: TObject);
    procedure ComboBox_DoorType2Change(Sender: TObject);
    procedure Edit_LocateChange(Sender: TObject);
    procedure ComboBox_CardModeType1Change(Sender: TObject);
    procedure ComboBox_CardModeType2Change(Sender: TObject);
    procedure ComboBox_DoorModeType1Change(Sender: TObject);
    procedure ComboBox_DoorModeType2Change(Sender: TObject);
    procedure SpinEdit_DoorOPen1Change(Sender: TObject);
    procedure SpinEdit_DoorOPen2Change(Sender: TObject);
    procedure SpinEdit_OpenMoni1Change(Sender: TObject);
    procedure SpinEdit_OpenMoni2Change(Sender: TObject);
    procedure ComboBox_UseSch1Change(Sender: TObject);
    procedure ComboBox_UseSch2Change(Sender: TObject);
    procedure ComboBox_SendDoorStatus1Change(Sender: TObject);
    procedure ComboBox_SendDoorStatus2Change(Sender: TObject);
    procedure ComboBox_AlarmLongOpen1Change(Sender: TObject);
    procedure ComboBox_AlarmLongOpen2Change(Sender: TObject);
    procedure ComboBox_ControlFire1Change(Sender: TObject);
    procedure ComboBox_ControlFire2Change(Sender: TObject);
    procedure ComboBox_LockType1Change(Sender: TObject);
    procedure ComboBox_LockType2Change(Sender: TObject);
    procedure sgCardReaderDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure sgPortDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    Procedure PortDataUpdate(aCol,aRow:Integer);
    procedure sgPortExit(Sender: TObject);
    procedure CardReaderUpdate(aCol,aRow:Integer);
    procedure CCTVUpdate(aCol,aRow:integer);
    procedure sgCardReaderExit(Sender: TObject);
    procedure sgPortColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sgPortRowMoved(Sender: TObject; FromIndex, ToIndex: Integer);
    procedure sgCardReaderColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sgCardReaderRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure N16Click(Sender: TObject);
    procedure MENU_VersionClick(Sender: TObject);
    procedure lvECUDblClick(Sender: TObject);
    procedure N17Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure ECUStatusCheck;
    procedure MENU_TIMESYNCClick(Sender: TObject);
    procedure MENU_RESETClick(Sender: TObject);
    procedure MENU_SETARMClick(Sender: TObject);
    procedure MENU_SETDISARMClick(Sender: TObject);
    procedure MENU_OPENDOOR1Click(Sender: TObject);
    procedure MENU_OPEMDOOR2Click(Sender: TObject);
    procedure MENU_NMOODDOOR1Click(Sender: TObject);
    procedure MENU_OMODEDOOR1Click(Sender: TObject);
    procedure MENU_NMODEDOOR2Click(Sender: TObject);
    procedure MENU_OMODEDOOR2Click(Sender: TObject);
    procedure btnComCheckClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer_ENQTimer(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure ed_serverChange(Sender: TObject);
    procedure Rg_ModeClick(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure CardTypeReg;
    Function  KTDeviceReg(aCmd:char;aData:string):Boolean;
    Function  KTConfigReg(aCmd:char;aData:string):Boolean;
    procedure CardTypeSearch;
    procedure cb_CardTypeChange(Sender: TObject);
    procedure btnLanSettClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_ImageLanClick(Sender: TObject);
    procedure btn_ImageSearchClick(Sender: TObject);
    procedure btn_adminsetClick(Sender: TObject);
    procedure btn_AdminSearchClick(Sender: TObject);
    procedure btn_Lan2SetClick(Sender: TObject);
    procedure btn_LanSearchClick(Sender: TObject);
    procedure btnKTLanSearchClick(Sender: TObject);
    procedure btnKTLanSetClick(Sender: TObject);
    procedure chk_LocalClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cmb_cctvExit(Sender: TObject);
    procedure sg_CCTVSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure sg_CCTVRowMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure sg_CCTVExit(Sender: TObject);
    procedure sg_CCTVColumnMoved(Sender: TObject; FromIndex,
      ToIndex: Integer);
    procedure btn_CCTVSearchClick(Sender: TObject);
    procedure btn_CCTVSetClick(Sender: TObject);
    procedure sgCardReaderClick(Sender: TObject);
    procedure sgPortClick(Sender: TObject);
    procedure sg_CCTVClick(Sender: TObject);
    procedure cmb_cctvChange(Sender: TObject);
    procedure cbCardReaderChange(Sender: TObject);
    procedure cbPortChange(Sender: TObject);
  private
    { Private declarations }
    procedure ControlInit;
    procedure LanControl_Yellow;
    procedure ViewLocal;
    procedure HideLocal;
    function LanPanelCheck:boolean;
    function  GetSetData:string;
    function HexToIP(aHex:string):string;
    function MacFormat(aMac:string):string;
    function IPtoHex(aIP:string):string;
    function PortToHex(aPort:string):string;
    procedure DeviceTableShow(stECUNO:string);
    Function InsertDeviceTable(stMCUNO,ECUNo:string):Boolean;
    Function DeleteDeviceAllTable:Boolean;
    Function DeleteDeviceTable(stECUID:string): Boolean;
    //테이블 업데이트
    Function UpdateSystemID(stECUID,stSystemID:string): Boolean;
    Function UpdateLinkusTel(stECUID,stLinkusTel:string): Boolean;
    Function UpdateRingCnt(stECUID,stRingCnt:string):Boolean;
    Function UpdateMcuIp(stECUID,stMcuIp:string):Boolean;
    Function UpdateServerIP(stECUID,stServerIP:string):Boolean;
    Function UpdateMode(stECUID,stMode:string):Boolean;
    Function UpdateMcuSubnet(stECUID,stMcuSubnet:string):Boolean;
    Function UpdateMcuGate(stECUID,stMcuGate:string):Boolean;
    Function UpdateMcuPort(stECUID,stMcuPort:string):Boolean;
    Function UpdateWatchPower(stECUID,stWatchPower:string):Boolean;
    Function UpdateOutDelay(stECUID,stOutDelay:string):Boolean;
    Function UpdateInDelay(stECUID,stInDelay:string):Boolean;
    Function UpdateDoorType1(stECUID,stDoorType1:string):Boolean;
    Function UpdateDoorType2(stECUID,stDoorType2:string):Boolean;
    Function UpdateLocate(stECUID,stLocate:string):Boolean;
    Function UpdateCardType1(stECUID,stCardType1:string):Boolean;
    Function UpdateCardType2(stECUID,stCardType2:string):Boolean;
    Function UpdateDoorModeType1(stECUID,stDoorModeType1:string):Boolean;
    Function UpdateDoorModeType2(stECUID,stDoorModeType2:string):Boolean;
    Function UpdateDoorOpen1(stECUID,stDoorOpen1:string):Boolean;
    Function UpdateDoorOpen2(stECUID,stDoorOpen2:string):Boolean;
    Function UpdateOpenMoni1(stECUID,stOpenMoni1:string):Boolean;
    Function UpdateOpenMoni2(stECUID,stOpenMoni2:string):Boolean;
    Function UpdateUseSch1(stECUID,stUseSch1:string):Boolean;
    Function UpdateUseSch2(stECUID,stUseSch2:string):Boolean;
    Function UpdateDoorStatus1(stECUID,stDoorStatus1:string):Boolean;
    Function UpdateDoorStatus2(stECUID,stDoorStatus2:string):Boolean;
    Function UpdateAlarmLong1(stECUID,stAlarmLong1:string):Boolean;
    Function UpdateAlarmLong2(stECUID,stAlarmLong2:string):Boolean;
    Function UpdateControlFire1(stECUID,stControlFire1:string):Boolean;
    Function UpdateControlFire2(stECUID,stControlFire2:string):Boolean;
    Function UpdateLockType1(stECUID,stLockType1:string):Boolean;
    Function UpdateLockType2(stECUID,stLockType2:string):Boolean;
    Function UpdateReaderUse(stECUID,stReaderUse:string;nReaderNo:integer):Boolean;
    Function UpdateReaderDoor(stECUID,stReaderDoor:string;nReaderNo:integer):Boolean;
    Function UpdateReaderName(stECUID,stReaderName:string;nReaderNo:integer):Boolean;
    Function UpdatePortType(stECUID,stPortType:string;nPortNo:integer):Boolean;
    Function UpdatePortDelay(stECUID,stPortDelay:string;nPortNo:integer):Boolean;
    Function UpdatePortSense(stECUID,stPortSense:string;nPortNo:integer):Boolean;
    Function UpdatePortName(stECUID,stPortName:string;nPortNo:integer):Boolean;
    Function UpdateCCTVDEVICEID(stECUID,stDeviceID:string;nCCTVNo:integer):Boolean;
    Function UpdateCCTVPortNo(stECUID,stPortNo:string;nCCTVNo:integer):Boolean;

    Function DeviceTabletoFile(filename:string):Boolean;
    Function FileToInsertDeviceTable(filename:string):Boolean;

    Function UpdateReader1Use(stECUID,stReader1Use:string):Boolean;
    Function UpdateReader2Use(stECUID,stReader2Use:string):Boolean;
    Function UpdateReader3Use(stECUID,stReader3Use:string):Boolean;
    Function UpdateReader4Use(stECUID,stReader4Use:string):Boolean;
    Function UpdateReader5Use(stECUID,stReader5Use:string):Boolean;
    Function UpdateReader6Use(stECUID,stReader6Use:string):Boolean;
    Function UpdateReader7Use(stECUID,stReader7Use:string):Boolean;
    Function UpdateReader8Use(stECUID,stReader8Use:string):Boolean;
    Function UpdateReader1Door(stECUID,stReader1Door:string):Boolean;
    Function UpdateReader2Door(stECUID,stReader2Door:string):Boolean;
    Function UpdateReader3Door(stECUID,stReader3Door:string):Boolean;
    Function UpdateReader4Door(stECUID,stReader4Door:string):Boolean;
    Function UpdateReader5Door(stECUID,stReader5Door:string):Boolean;
    Function UpdateReader6Door(stECUID,stReader6Door:string):Boolean;
    Function UpdateReader7Door(stECUID,stReader7Door:string):Boolean;
    Function UpdateReader8Door(stECUID,stReader8Door:string):Boolean;
    Function UpdateReader1Name(stECUID,stReader1Name:string):Boolean;
    Function UpdateReader2Name(stECUID,stReader2Name:string):Boolean;
    Function UpdateReader3Name(stECUID,stReader3Name:string):Boolean;
    Function UpdateReader4Name(stECUID,stReader4Name:string):Boolean;
    Function UpdateReader5Name(stECUID,stReader5Name:string):Boolean;
    Function UpdateReader6Name(stECUID,stReader6Name:string):Boolean;
    Function UpdateReader7Name(stECUID,stReader7Name:string):Boolean;
    Function UpdateReader8Name(stECUID,stReader8Name:string):Boolean;
    Function UpdatePort1Type(stECUID,stPort1Type:string):Boolean;
    Function UpdatePort2Type(stECUID,stPort2Type:string):Boolean;
    Function UpdatePort3Type(stECUID,stPort3Type:string):Boolean;
    Function UpdatePort4Type(stECUID,stPort4Type:string):Boolean;
    Function UpdatePort5Type(stECUID,stPort5Type:string):Boolean;
    Function UpdatePort6Type(stECUID,stPort6Type:string):Boolean;
    Function UpdatePort7Type(stECUID,stPort7Type:string):Boolean;
    Function UpdatePort8Type(stECUID,stPort8Type:string):Boolean;
    Function UpdatePort1Delay(stECUID,stPort1Delay:string):Boolean;
    Function UpdatePort2Delay(stECUID,stPort2Delay:string):Boolean;
    Function UpdatePort3Delay(stECUID,stPort3Delay:string):Boolean;
    Function UpdatePort4Delay(stECUID,stPort4Delay:string):Boolean;
    Function UpdatePort5Delay(stECUID,stPort5Delay:string):Boolean;
    Function UpdatePort6Delay(stECUID,stPort6Delay:string):Boolean;
    Function UpdatePort7Delay(stECUID,stPort7Delay:string):Boolean;
    Function UpdatePort8Delay(stECUID,stPort8Delay:string):Boolean;
    Function UpdatePort1Sense(stECUID,stPort1Sense:string):Boolean;
    Function UpdatePort2Sense(stECUID,stPort2Sense:string):Boolean;
    Function UpdatePort3Sense(stECUID,stPort3Sense:string):Boolean;
    Function UpdatePort4Sense(stECUID,stPort4Sense:string):Boolean;
    Function UpdatePort5Sense(stECUID,stPort5Sense:string):Boolean;
    Function UpdatePort6Sense(stECUID,stPort6Sense:string):Boolean;
    Function UpdatePort7Sense(stECUID,stPort7Sense:string):Boolean;
    Function UpdatePort8Sense(stECUID,stPort8Sense:string):Boolean;
    Function UpdatePort1Name(stECUID,stPort1Name:string):Boolean;
    Function UpdatePort2Name(stECUID,stPort2Name:string):Boolean;
    Function UpdatePort3Name(stECUID,stPort3Name:string):Boolean;
    Function UpdatePort4Name(stECUID,stPort4Name:string):Boolean;
    Function UpdatePort5Name(stECUID,stPort5Name:string):Boolean;
    Function UpdatePort6Name(stECUID,stPort6Name:string):Boolean;
    Function UpdatePort7Name(stECUID,stPort7Name:string):Boolean;
    Function UpdatePort8Name(stECUID,stPort8Name:string):Boolean;
    Function UpdateCardReaderType(stECUID:string;stType:string):Boolean;


  public
    { Public declarations }

    xMCUID: string;
    WiznetData: string;
    bRegCardShow : Boolean; //카드 등록 화면 Show 여부
    bDoorSchRegShow : Boolean; //스케줄등록화면 Show 여부
    bTotalComCheckShow : Boolean; //전체통신환경 화면 Show 여부
    bDeviceComCheckShow : Boolean; //기기별통신체크 화면 Show 여부
    bSensorShow : Boolean; //감지기 등록 화면 Show
    bKTRegShow : Boolean;  //KT주장치정보화면 Show
    IsLogShow : Boolean;   //LogShow 유무

    Function GetFileLastWriteTime( sFileName : string ) : TDateTime;
    function ListviewBinarySearch(listview: TRzListview;
      const Item: string; var Index: Integer): Boolean;
    // 모니터링 화면에 출력
    procedure CommMoni(aData: string);
    // 데이터 패킷찾기
    function CheckDataPacket(aData: string; var bData: string): string;
    // 읽혀진 데이터 처리
    function DataPacektProcess(aData: string): Boolean;
    // 데이터 전송
    function SendPacket(aDeviceID: string; aCmd: Char; aData: string;
      aQuick: Boolean): Boolean;
    //ReserveSendDataList에 누적된 데이터를 전송한다.
    procedure ExecSendPacket;

    //카드리더 초기정보 등록
    procedure MakeCardreaderInfo;
    //포트 초기정보 등록
    procedure MakePortInfo;
    //CCTV 초기정보 등록
    procedure MakeCCTVInfo;


    //wiznet 조회
    function CheckWiznet(aDeviceID: string): Boolean;
    // wiznet 등록
    function Writewiznet(aDeviceID, aLocalIP, aSubnet, aGateway,aPortNo,aServerIp,aServerport,aMode,aCmd: string): Boolean;
    // wiznet 응답처리
    procedure RcvWiznetInfo(aData: string);
    // 영상 Wiznet응답처리
    procedure RcvImgWiznetInfo(aData: string);
    //관리자 응답처리
    procedure RcvAdminWiznetInfo(aData: string);
    //로칼서버 응답처리
    procedure RcvLocalPcWiznetInfo(aData: string);


    //기기번호 조회(MCU조회)
    function CheckID: Boolean;
    // 기기번호등록(MCU 등록)
    function RegID(aDeviceID: string): Boolean;
    // 기기번호 응답
    procedure RcvDeviceID(aData: string);

    //ECU 조회
    function CheckUsedDevice(aDeviceID: string): Boolean;
    // ECU 등록
    function RegUsedDevice(aDeviceID: string; UsedDevice: string): Boolean;
    // ECU 응답
    procedure RcvUsedDevice(aData: string);
    //Error 처리
    procedure ErrorDataProcess(aData:string);

    //알람표시기 조회
    function CheckUsedAlarmDisplay(aDeviceID: string): Boolean;
    // 알람표시기 등록
    function RegUsedAlarmDisplay(aDeviceID: string; UsedDevice: string): Boolean;
    // 알람표시기 응답
    procedure RcvUsedAlarmdisplay(aData: string);


    //링커스 ID 조회
    function CheckLinkusID(aDeviceID: string): Boolean;
    //링커스 ID 등록
    function RegLinkusID(aDeviceID, aLinkusId: string): Boolean;
    //링커스 ID응답
    procedure RcvLinkusId(aData: string);


    // 데코더 전화번호 조회
    function CheckLinksTellNo(aDeviceID: string; aNo: Integer): Boolean;
    // 데코더 전화번호 등록
    function RegLinksTellNo(aDeviceID: string; aNo: Integer; aTellno: string): Boolean;
    //데코더 전화번호 응답
    procedure RcvLinkusTelNo(aData: string);


    //텔카운트 조회
    function CheckRingCount(aDeviceID: string): Boolean;
    //텔카운트 등록
    function RegRingCount(aDeviceID: string; aCount: Integer): Boolean;
    //텔카운트 응답
    procedure RcvRingCount(aData: string);
    //카드타입 응답
    procedure RcvCardType(aData: string);


    //시스템정보  조회
    function CheckSysInfo(aDeviceID: string): Boolean;
    //시스템정보  등록
    function RegSysInfo(aDeviceID: string;      // 기기번호
                        WatchPowerOff: Integer; // 정전감시
                        DelayIn: Integer;       // 입실지연시간
                        DelayOut: Integer;      // 퇴실지연시간
                        Door1Type: Integer;     // Door1용도(0:방범,1:출입.2:방범+출입)
                        Door2Type: Integer;     //Door2용도(0:방범,1:출입.2:방범+출입)
                        Locate: string          // 위치명
    ): Boolean;
    //시스템정보  응답
    procedure RcvSysinfo(aData: string);
    //ECU 통신상태 체크
    function CheckECUCommState(aDeviceID:string) : Boolean;
    //Reader 통신상태 체크
    function CheckReaderCommState(aDeviceID:string):Boolean;
    //상황표시 통신상태 체크
    function CheckIndicatorCommState(aDeviceID:string):Boolean;
    //시스템정보  조회(출입통제)
    function CheckSysInfo2(aDeviceID: string; aDoorNo: Integer): Boolean;
    //시스템정보  등록(출입통제)
    function RegSysInfo2(aDeviceID: string;        // 기기번호
                         aDoorNo: Integer;         // 문번호
                          aCardMode: Integer;      // 카드 운영모드 (0:Positive, 1:Negative)
                          aDoorMode: Integer;      // 출입문 운영모드 (0:운영, 1:개방)
                          aDoorOpenTime: Integer;   // Door 제어시간
                          aOpenMoniTime: Integer;   // 장시간 열림 경보
                          aUseSchedule: Integer;    // 스케줄 적용 여부 (0:사용안함, 1:사용)
                          aSendDoorState: Integer;  // 출입문 상태 전송(0:사용안함, 1:사용)
                          aUseOpenalarm: Integer;   // 장시간 열림 부저 출력(0:사용안함, 1:사용)
                          aLockType: Integer;       // 전기정 타입
                          aControledFire: Integer   // 화재 발생시 문제어
    ): Boolean;


    //출입통제 기기등록 응답 처리
    procedure RcvSysinfo2(DeviceID,aData: String);


    //사용카드리더 조회
    function CheckCardReader(aDeviceID: string; aNo: Integer): Boolean;

    //사용카드리더 등록
    function RegCardReader(aDeviceID: string;       // 기기번호
                            aNo,                    // 카드리더 번호
                            aUsed,                  //  사용여부
                            aDoorNo: Integer;        // 연결 문번호
                            aLocate: string          // 위치명
    ): Boolean;
    //CCTV 등록
    function RegCCTV(aDeviceID: string;       // 기기번호
                            aNo: Integer;           // CCTV 번호
                            aUsed,                  //  사용여부
                            aECUNo,                 // ECUNO
                            aPortNo: string          // 포트번호
    ): Boolean;
    function CheckCCTV(aDeviceID: string; aNo:integer):Boolean;

    //카드리더 타입 조회
    function CheckCardReaderType(aDeviceID:string):Boolean;
    //카드리더 타입 등록
    function RegCardReaderType(aDeviceID:string;nType:integer):Boolean;

    //카드리더 설정 응답
    procedure RcvCardReader(aData: string);
    //CCTV 응답
    procedure RcvCCTV(aData:string);

    //사용포트LOOP 조회
    function CheckPort(aDeviceID: string; aNo: Integer): Boolean;
    //사용포트LOOP 등록
    function RegPort(aDeviceID: string;            // 기기번호
      aNo: Integer;                  // 포트번호
      aAlarmType: Integer;          // 감시형태
      aUseDelay: Integer;           // 지연시간
      aDetectTime: Integer;         // 감지시간
      aLocate: string               // 위치명
    ): Boolean;
    // 포트 설정 응답
    procedure RcvPort(aData: string);


    //시간동기화
    function TimeSync(aDeviceID: string): Boolean;

    //버젼확인
    function CheckVersion(aDeviceID: string): Boolean;

    //리더기버젼 확인
    function CheckReaderVersion(aDeviceID: string; aNo: Integer): Boolean;

    //기기리셋
    function ResetDevice(aDeviceID: string): Boolean;

    //기기 메모리 삭제
    function ClearRegister(aDeviceID: string): Boolean;

    //알람모드 변경
    function ChangeAlarmMode(aDeviceID: string; aMode: Char;aQuick:Boolean): Boolean;

    // 문제어
    function DoorControl(aDeviceID: string;     //기기번호
      aNo: Integer;            // 문번호
      aControlType: Integer;
      //제어방식 '0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
      aControl: Integer      //제어 커맨드
    ): Boolean;

    // 등록 메세지코드 처리
    Procedure RegDataProcess(aData:String);
    // 원격제어 메세지 코드 처리
    Procedure RemoteDataProcess(aData:String);
    // 출입데이터 메세지 코드 처리
    Procedure AccessDataProcess(aData:String);
    // 출입카드 이벤트
    procedure RcvAccEventData(aDevice,aData:String);
    //문상태 변경 데이터 처리
    procedure RcvDoorEventData(aData:String);
    // 기기 제어 응답
    Procedure RcvAccControl(aData:String);
    // 카드등록 응답
    Procedure RcvCardRegAck(aData,aDeviceID:String);
    //스케줄 등록 응답
    Procedure RcvSch(aData: String);
    //입력한 MCU ID 구하기
    Function GetMcuID:String;
    //기기번호 확인
    Function GetDeviceID:String;
    //설정된 ECU 구하기
    Function GetECU:String;
    //설정된 알람표시기 구하기
    FUnction GetAlarmDisplay:String;

    //감지기등록
    Function RegSensorSet(aDeviceID,aData:string):Boolean;
    //감지기체크
    Function CheckSensorSet(aDeviceID:string):Boolean;
    //감지기정보등록
    Function RegSensorInfo(aDeviceID,aSensorNo,aPortNo,aAlarmType,aDetectTime:string):Boolean;
    //감지기정보체크
    Function CheckSensorInfo(aDeviceID,aSensorNo,aPortNo:string):Boolean;
    //감지기응답
    Function RcvSensorSet(aData:string):Boolean;
    //감지기정보응답
    Function RcvSensorInfo(aData:string):Boolean;
    //KT정보응답
    Function RcvKTConfig(aData:string):Boolean;
    Function RcvKTDevice(aData:string):Boolean;
    //KT랜정보 응답
    Function RcvKTLAN(aPacket:string):Boolean;

  end;

var
  Form_Main: TForm_Main;
  ComTrace: IWinTrace; // TX/RX  Debug Trace
  ReserveSendDataList: TStringList; //내보낼 데이터 목록
  ECUList : TstringList; //ECUList
  bConnected : Boolean;
  CountCardReadData : integer;
  stPW : string;

  {$I zRegT.INC}

implementation

uses
  uAppendECU,
  uwinzet,
  uSetcomm,
  uCardReg,
  DoorSchReg, uTotalComCheck, uDeviceComChk, uInfo, uConfig, uLogin, uCopy,
  uSensor, uKTReg;

{$R *.dfm}


  // TSendData constructor
  // -----------------------------------------------------------------------------
constructor TSendData.Create(const aMarker: string; const aTRansmitData: string);
begin
  self.fMarker := aMarker;
  self.fTRansmitData := aTRansmitData;
  self.fSendTime := Now;
  self.fSendCount := 0;
end;

procedure TForm_Main.sgCardReaderDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  stECUID : string;
begin
  if IsConfigMCU then stECUID := '00'
  else stECUID := copy(ComboBox_ECU.Text,1,2);
  with sgCardReader do
  begin
    if aCol < FixedCols then exit;
    if aRow < FixedRows then exit;
    if aCol = 1 then UpdateReaderUse(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 2 then UpdateReaderDoor(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 3 then UpdateReaderName(stECUID,Trim(Cells[aCol,aRow]),aRow);

  end;
end;


function TForm_Main.ListviewBinarySearch(listview: TRzListview;
  const Item: string; var Index: Integer): Boolean;
var
  First, last, pivot, res: Integer;
begin
  Assert(Assigned(listview));
  Assert(Length(item) > 0);

  Result := false;
  Index := 0;
  if listview.Items.Count = 0 then Exit;

  First := 0;
  last := listview.Items.Count - 1;
  repeat
    pivot := (First + last) div 2;
    res   := lstrcmp(PChar(item), PChar(listview.Items[pivot].Caption));
    if res = 0 then
    begin
      { Found the item, return its index and exit. }
      Index := pivot;
      Result := true;
      Break;
    end { If }
    else if res > 0 then
    begin
      { Item is larger than item at pivot }
      First := pivot + 1;
    end { If }
    else
    begin
      { Item is smaller than item at pivot }
      last := pivot - 1;
    end;
  until last < First;
  Index := First;
end; { ListviewBinarySearch }


//MCU  ID 확인
function TForm_Main.GetMcuID: String;
var
  aMCUID: String;
begin

  aMCUID:= Edit_DeviceID1.Text +
           Edit_DeviceID2.Text +
           Edit_DeviceID3.Text +
           Edit_DeviceID4.Text +
           Edit_DeviceID5.Text +
           Edit_DeviceID6.Text +
           Edit_DeviceID7.Text ;

  Result:= aMCUID;

end;

//기기번호 확인
function TForm_Main.GetDeviceID: String;
begin
  Result:= '';
  if Not IsConfigMCU then // ECU설정중
  begin
    Result:= xMCUID + Copy(ComboBox_ECU.Text,1,2);
  end else                       // MCU 설정중
  begin
    Result:= xMCUID + '00';
  end;
end;

//설정된 ECU 구하기
function TForm_Main.GetECU: String;
var
  I: Integer;
  aNo: Integer;
  aData: String[100];
begin
//                  1         2         3         4         5
//         12345678901234567890123456789012345678901234567890
  aData:= '10000000000000000000000000000000000000000000000000'+
          '00000000000000000000000000000000000000000000000000';

  for I:= 0 to lvECU.Items.Count - 1  do
  begin
    aNo:= StrtoInt(lvECU.Items[I].Caption);
    aData[aNo + 1]:= '1';
  end;
  Result:= aData;
end;

//설정된 알람표시기 구하기
function TForm_Main.GetAlarmDisplay: String;
var
  I: Integer;
  aNo: Integer;
  aData: String;
begin
  aData:= '0000';
  for I:= 0 to 3 do
    if CheckList_Alarm.ItemChecked[I] = True then aData[I+1]:= '1';
  Result:= aData;
end;



// Search MCU

procedure TForm_Main.Action_SearchMCUExecute(Sender: TObject);
begin
  Form_wiznet := TForm_wiznet.Create(Self);
  Form_wiznet.ShowModal;
  Form_wiznet.Free;
end;


//  MCU 등록
procedure TForm_Main.Action_RegMCUExecute(Sender: TObject);
begin
  IsConfigMCU := True;
  PageControl1.ActivePageIndex := 0;
  Panel_ktlog.Visible := false;
  ComboBox_ECU.Enabled:= False;
  //MCU관련 등록메뉴 Enabled
  MENU_MCUREG.Enabled:= True;
  MENU_CHECKMCU.Enabled:= True;
  DeviceTableShow('00');

end;

// ECU 등록
procedure TForm_Main.Action_RegECUExecute(Sender: TObject);
var
  I: Integer;
  st:String;
  aNo: Integer;
begin
{  if lvECU.Selected <> nil then
  begin
    if lvECU.ItemFocused.Index = 0 then
    begin
      Action_RegMCUExecute(self);
      Exit;
    end;
  end; }
  PageControl1.ActivePageIndex := 1;
  if lvECU.Items.Count < 1 then Exit;
  IsConfigMCU := False;
  Panel_ktlog.Align := alClient;
  Panel_ktlog.Visible := true;
  ComboBox_ECU.Enabled:= True;

  //MCU관련 등록메뉴 Disbaled
  MENU_MCUREG.Enabled:= False;
  MENU_CHECKMCU.Enabled:= False;


  //ComboBox_ECU에 lvECU의 데이터를 로드한다.
  ComboBox_ECU.Clear;
  for I:= 0 to lvECU.Items.Count - 1 do
  begin
    st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
    ComboBox_ECU.Items.Add(st);
  end;
  //
  if lvECU.Selected <> nil then ComboBox_ECU.ItemIndex:= lvECU.ItemFocused.Index
  else                          ComboBox_ECU.ItemIndex:= 0;

  DeviceTableShow(copy(ComboBox_ECU.Text,1,2));

end;

// Close Program
procedure TForm_Main.Action_CloseExecute(Sender: TObject);
begin
  //
  IsStop := True;
  Close;
end;

// 통신연결
procedure TForm_Main.Action_ConnectExecute(Sender: TObject);
begin
  //
  try
    FieldStatus_ComStatus.Caption := '연결시도  COM NO:' +
      IntToStr(Commport.ComNumber);
    Commport.Open := true;

  except
    MessageDlg('통신포트 설정이 잘못  되었습니다.', mtError, [mbOK], 0);
    FieldStatus_ComStatus.Caption := '연결실패 COM NO:' +
      IntToStr(Commport.ComNumber);
    Exit;
  end;
  bSearch := False;
end;

// 통신끊기
procedure TForm_Main.Action_DisconnectExecute(Sender: TObject);
begin
  //
  Commport.Open := false;
end;

//파일 읽기
procedure TForm_Main.Action_FileLoadExecute(Sender: TObject);
var
  filename : string;
begin
  OpenDialog1.DefaultExt:= 'CSV';
  OpenDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if OpenDialog1.Execute then
  begin
   filename := OpenDialog1.FileName;
   FileToInsertDeviceTable(filename);
   Action_RegMCUExecute(Sender);
  end;
end;

// 파일 저장
procedure TForm_Main.ActionFIleSaveExecute(Sender: TObject);
var
  filename : string;
begin
  SaveDialog1.DefaultExt:= 'CSV';
  SaveDialog1.Filter := 'Text files (*.CSV)|*.CSV';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   DeviceTabletoFile(filename);
  end;
end;

//통신포트설정
procedure TForm_Main.Action_SetComportExecute(Sender: TObject);
begin
  Form_SetComPort := TForm_SetComPort.Create(Self);

  if Form_SetComPort.ShowModal = mrOk then
  begin
    if Commport.Open then Commport.Open := false;

    Commport.DeviceLayer := dlWin32;
    Commport.ComNumber   := Form_SetComPort.ComboBox_ComNo.ItemIndex + 1;
  end;
  Form_SetComPort.Free;
end;


// 모니터링 데이터 처리
procedure TForm_Main.CommMoni(aData: string);
var
  st: string;
begin
{
  if lbMoni.Count > 1000 then lbMoni.Delete(1000);
  lbMoni.Insert(0,aData);
}
  st := FormatDateTime('yyyy-mm-dd hh:nn:ss:zzz', Now) + #9 + aData;

  if Not IsLogShow then Exit;

  if ComTrace = nil then 
  begin
    ComTrace := TTrace.CreateWinTrace('COM Data', 'COM Monitoring');
    ComTrace.SetMultiColumn(1);
    ComTrace.setColumnsTitle('발생시각' + #9 + 'TX/RX' + #9 +
      '기기번호' + #9 + 'CMD' + #9 + 'MSGNO' + #9 + 'DATA' + #9 + 'FULLDATA');
    ComTrace.setColumnsWidth('130' + #9 + '50' + #9 + '100' + #9 +
      '40' + #9 + '40' + #9 + '400' + #9 + '500');
    ComTrace.DisplayWin();
  end;
  ComTrace.Debug.Send(st);
end;


procedure TForm_Main.CommportTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: string;
  st3: string;
  aIndex: Integer;
  I: Integer;
  Lenstr: string;
  DataLength: Integer;
begin



  st := '';
  for I := 1 to Count do st := st + Commport.GetChar;


  ComBuff := ComBuff + st;
  aIndex := Pos(STX, ComBuff);          // STX 위치를 확인 한다.
  if aIndex = 0 then Exit               // STX가 없으면 루틴에서 나간다.
  else if aIndex > 1 then
  begin
    Delete(ComBuff, 1, aIndex - 1);       //STX위치가 1아니면 STX앞까지 삭제
  end;
  if Length(Combuff) < 21 then Exit;
  // 21Byte 이하이면 데이터처리 하지 않고 다시 받는다.
  repeat
    st3     := CheckDataPacket(ComBuff, st2);
    ComBuff := st2;
    if st <> '' then DataPacektProcess(st3);
  until Pos(ETX, comBuff) = 0;
end;


function TForm_Main.CheckDataPacket(aData: string; var bData: string): string;
var
  aIndex: Integer;
  Lenstr: string;
  DefinedDataLength: Integer;
  StrBuff: string;
  etxIndex: Integer;
begin
  Result := '';
  Lenstr := Copy(aData, 2, 3);
  //데이터 길이 위치 데이터가 숫자가 아니면...
  if not isDigit(Lenstr) then
  begin
    Delete(aData, 1, 1);       //1'st STX 삭제
    aIndex := Pos(STX, aData); // 다음 STX 찾기
    if aIndex = 0 then         //STX가 없으면...
    begin
      //전체 데이터 버림
      bData := '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData, 1, aIndex - 1);//STX 앞 데이터 삭제
      bData := aData;
    end else
    begin
      bData := aData;
    end;
    Exit;
  end;
  //패킷에 정의된 길이
  DefinedDataLength := StrToInt(Lenstr);
  //패킷에 정의된 길이보다 실제 데이터가 작으면
  if Length(aData) < DefinedDataLength then
  begin
    //실제 데이터가 길이가 작으면(아직 다 못받은 상태)
    etxIndex := Pos(ETX, aData);
    if etxIndex > 0 then
    begin
      Delete(aData, 1, etxIndex);
    end;
    bData := aData;
    Exit;
  end;

  // 정의된 길이 마지막 데이터가 ETX가 맞는가?
  if aData[DefinedDataLength] = ETX then
  begin
    StrBuff := Copy(aData, 1, DefinedDataLength);
    Result  := StrBuff;
    Delete(aData, 1, DefinedDataLength);
    bData := aData;
  end else
  begin
    //마직막 데이터가 EXT가 아니면 1'st STX지우고 다음 STX를 찾는다.
    Delete(aData, 1, 1);
    aIndex := Pos(STX, aData); // 다음 STX 찾기
    if aIndex = 0 then         //STX가 없으면...
    begin
      //전체 데이터 버림
      bData := '';
    end else if aIndex > 1 then // STX가 1'st가 아니면
    begin
      Delete(aData, 1, aIndex - 1);//STX 앞 데이터 삭제
      bData := aData;
    end else
    begin
      bData := aData;
    end;
  end;
end;

{정상적으로 들어온 데이터 패킷 처리 루틴}
function TForm_Main.DataPacektProcess(aData: string): Boolean;
var
  aKey: Byte;
  st: string;
  aCommand: Char;
  aCntId: string;
  aMarker: String;
  aSenderIndex: Integer;
begin
  Result := false;
  if aData = '' then Exit;

  SendTimer.Enabled:= False;

  //31:Q++()./,-**s*S^**+()./,-()
  aKey := Ord(aData[5]);
  st := Copy(aData, 1, 5) + EncodeData(aKey,
    Copy(aData, 6, Length(aData) - 6)) + aData[Length(aData)];
  aData := st;
  aCntId := Copy(aData, 8, 9);
  aCommand := aData[17];
  Rcv_MsgNo := aData[18];



  {
  st:=  'RX'+#9+
        Copy(aCntId,1,9)+#9+
        aCommand+#9+
        Rcv_MsgNo+#9+
        Copy(aData,19,Length(aData)-21)+#9+
        aData;


  //if aCommand <> 'e' then CommMoni(st);
  CommMoni(st);
  }

  if IsLogShow then
    TTRace.Debug.Send('COMM', 'RX>' + aData);


  if (aCommand = 'e') then // Polling command
  begin
    SendPacket(aCntID, 'a', '', true);
  end else if (aCommand = 'a') then
  begin
    SendTimer.Enabled:= True;
    Exit;

  end else if (aCommand <> 'c') then
  begin
    SendPacket(aCntID, 'a', '', true);
  end;

// ReserveSendDataList에서 응답 COMMAND 삭제
//==============================================================================




  aMarker := Copy(aData, 8, 13);
  // aMarker 1,9 : DeviceID
  // aMarker 10,1 : COMMAND
  // aMarker 11,1 : Message No : 으답이 보낸 메세지 넘버를 가고 있지 않음 (ACK에서 달고 옴)
  // aMarker 12,2 : DATA

  if (Copy(aMarker,12,2) = 'ID') or // 'ID'명령은 000000000 ==> 설정된 ID로 전송된다.
     (xMCUID = '0000000') then
  begin
    aMarker:= StringReplace(aMarker,aCntId,'000000000',[rfReplaceAll,rfIgnoreCase]);
  end;
  aMarker[11]:= '0';
  case aMarker[10] of
    'i':begin // Inital Data
          aMarker[10]:= 'I';
        end;
    'r':begin // Remote Data
          aMarker[10]:= 'R';
        end;

    'q':begin //
          aMarker[10]:= 'Q';
        end;

    'c':begin // 출입통제
          case aMarker[12] of
            'a': aMarker[12]:= 'A'; //기기등록
            'b': aMarker[12]:= 'B'; //기기조회
            'c': aMarker[12]:= 'C'; //제어
            'l': aMarker[12]:= 'L'; //카드데이터등록
            'm': aMarker[12]:= 'M'; //카드데이터조회
            'n': aMarker[12]:= 'N'; //카드데이터삭제
            'o': aMarker[12]:= 'O'; //전체카드데이터삭제
            's': aMarker[12]:= 'S'; //스케줄 등록
            'p': aMarker[12]:= 'P'; //스케줄 조회
            'q': aMarker[12]:= 'Q'; //특정일 등록
            'r': aMarker[12]:= 'R'; //특정일 조회
            'k': aMarker[12]:= 'K'; //타이패턴 등록
            't': aMarker[12]:= 'T'; //타임패턴 조회
          end;
        end;

  end;


  aSenderIndex:= ReserveSendDataList.IndexOf(aMarker);
  if aSenderIndex > -1 then
  begin
     //TSendData(ReserveSendDataList.Objects[aSenderIndex]).Free;
     ReserveSendDataList.Delete(aSenderIndex);
     FieldStatus_ComStatus.Caption:= InttoStr(ReserveSendDataList.Count) +'전송 대기중';
     if ReserveSendDataList.Count > 0 then ExecSendPacket;

  end else
  begin
     FieldStatus_ComStatus.Caption:= 'SenderIndex = -1';
     //SendTimer.Enabled:= True;
  end;


//==============================================================================



  {받은 데이터 커맨드별 처리}
  { ================================================================================
  "A" = Alarm Data
  "I" = Initial Data
  "R" = Remote Command
  "e" = ENQ
  "E" = ERROR
  "a" = ACK
  "n" = NAK
  "r" = Remote Answer
  "c" = Access Control data
  ★ c(출입통제 데이터)인경우에는 ACK 를 'c' command를 만들어 응답을 해야 한다.
    ================================================================================ }


  case aCommand of
    'A':{알람}          begin  end;
    'i':{Initial}       begin  RegDataProcess(aData)    end;
    'R':{Remote}        begin  RemoteDataProcess(aData) end;
    'r':{Remote Answer} begin  RemoteDataProcess(aData) end;
    'c':{출입통제}      begin  AccessDataProcess(aData) end;
    //'f':{펌웨어}        begin  FirmwareProcess(aData)   end;
    //'F':{펌웨어}        begin  FirmwareProcess2(aData)  end;
    'e':{ERROR}         begin ErrorDataProcess(aData) end;
    else {error 발생: [E003]정의 되지 않은 커맨드}  begin ErrorDataProcess(aData) end;
  end;

  if ReserveSendDataList.Count > 0 then
  begin
    SendTimer.Enabled:= True;
  end;

  Result := true;
end;


function TForm_Main.SendPacket(aDeviceID: string; aCmd: Char;
  aData: string; aQuick: Boolean): Boolean;
var
  ACKStr: string;
  ACKStr2: string;
  aDataLength: Integer;
  aLengthStr: string;
  aKey: Integer;
  aMsgNo: Integer;
  st: string;
  aMarker: string;
  aSendData: TSendData;
begin
  Result := false;
  if not Commport.Open then
  begin
    //Off_Timer.Enabled:= False;
    bConnected := False;
    IsStop := True;
    ShowMessage('통신 연결이 안되었습니다.');
    Exit;
  end;

  bSended := True;

  aDataLength := 21 + Length(aData);
  aLengthStr := FillZeroNumber(aDataLength, 3);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr  := STX + aLengthStr + #$20 + 'K1' + aDeviceID + aCmd + Rcv_MsgNo;
    ACkStr  := ACkStr + MakeCSData(ACKStr + ETX) + ETX;
    aKey    := $20;
    ACkStr2 := Copy(ACKStr, 1, 5) + EncodeData(aKey,
      Copy(ACkStr, 6, Length(ACkStr) - 6)) + ETX;
  end else {제어 or 등록 }
  begin
    aMsgNo  := Send_MsgNo;
    ACkStr  := STX + aLengthStr + #$20 + 'K1' + aDeviceID + aCmd +
      IntToStr(aMsgNo) + aData;
    ACkStr  := ACkStr + MakeCSData(ACKStr + ETX) + ETX;
    aKey    := Ord(ACkStr[5]);
    ACkStr2 := Copy(ACKStr, 1, 5) + EncodeData(aKey,
      Copy(ACkStr, 6, Length(ACkStr) - 6)) + ETX;
    if aMsgNo >= 9 then Send_MsgNo := 0
    else Send_MsgNo := aMsgNo + 1;
  end;


  if aQuick then
  begin
    if Commport.Open then
    begin
      Commport.PutString(ACKStr2);
      if IsLogShow then
        TTRace.Debug.Send('COMM', 'TX>' + ACkStr2);
    end;
  end else
  begin
    aMarker   := Copy(ACKStr2, 8, 13);

    if aMarker[10] = 'Q' then aMarker[10] := 'I';
    aMarker[11] := '0';


    aSendData := TSendData.Create(aMarker, ACKStr2);

    ReserveSendDataList.AddObject(aMarker, aSendData);
  end;

 //SnedTimer를 활성화 한다.
  SendTimer.Enabled:= True;
  bSended := False;

  Result := true;
end;

//ReserveSendDataList에 누적된 데이터를 전송한다.
procedure TForm_Main.ExecSendPacket;
var
  I: Integer;
  st: string;
begin


  if not CommPort.Open then Exit;
  if ReserveSendDataList.Count > 0 then
  begin
    bSended := True;    //송신중
    if TSendData(ReserveSendDataList.Objects[0]).SendCount < 3 then
    begin
      Inc(TSendData(ReserveSendDataList.Objects[0]).fSendCount);
      st := TSendData(ReserveSendDataList.Objects[0]).fTRansmitData;
      CommPort.PutString(st);
      if IsLogShow then
        TTRace.Debug.Send('COMM', 'TXn>' + st);
    end else
    begin
      ReserveSendDataList.Delete(0);
    end;
    bSended := False;
    //ReserveSendDataList.Delete(0);
  end;
end;


//카드리더 정보 만들기
procedure TForm_Main.MakeCardreaderInfo;
var
  I: Integer;
begin
//  sgCardReader.ColWidths[2] := sgCardReader.Width - sgCardReader.ColWidths[0] - sgCardReader.ColWidths[1];
  sgCardReader.ColWidths[3] := 0;
  sgCardReader.Cells[0, 0] := '리더기번호';
  sgCardReader.Cells[1, 0] := '사용여부';
  sgCardReader.Cells[2, 0] := '문번호';
  sgCardReader.Cells[3, 0] := '위치명';
  sgCardReader.FixedColor := clWhite;
  sgCardReader.Color := clWhite;

  for I := 1 to 8 do
  begin
    sgCardReader.Cells[0, I] := IntToStr(I);
    if I = 1 then  sgCardReader.Cells[1, I] := '사용'
    else sgCardReader.Cells[1, I] := '미사용';
    sgCardReader.Cells[2, I] := '1';
    sgCardReader.Cells[3, I] := '미설정';
  end;
end;

//포트 초기정보 등록
procedure TForm_Main.MakePortInfo;
var
  I: Integer;
begin
  sgPort.ColWidths[0] := 60;
  sgPort.ColWidths[4] := 0;
  sgPort.Cells[0, 0] := '포트번호';
  sgPort.Cells[1, 0] := '감시형태';
  sgPort.Cells[2, 0] := '지연시간';
  sgPort.Cells[3, 0] := '감지시간';
  sgPort.Cells[4, 0] := '위치명';
  sgPort.FixedColor := clWhite;
  sgPort.Color := clWhite;

  for I := 1 to 8 do
  begin
    sgPort.Cells[0, I] := IntToStr(I);
    if I = 7 then sgPort.Cells[1, I] := '1.화재'
    else if I = 8 then sgPort.Cells[1, I] := '3.비상'
    else sgPort.Cells[1, I] := '0.방범';
    sgPort.Cells[2, I] := '미사용';
    sgPort.Cells[3, I] := '400';
    sgPort.Cells[4, I] := '미설정';
  end;
end;


procedure TForm_Main.cbCardReaderExit(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      with sgCardReader do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;
end;

procedure TForm_Main.FormCreate(Sender: TObject);
begin
  IsStop := False;
  bConnected := False;
  bSended := False;
  
  ECUList := TStringList.Create;
  ECUList.Clear;
  ECUList.Add('99.전체');
  ECUList.Add('00.Controler');
  
  //프로그램 구동시 MCU 설정화면
  IsConfigMCU := true;

  //SEND Buffer List
  ReserveSendDataList := TStringList.Create;
  ReserveSendDataList.Clear;


  // 카드 등록 모드
  RegCardMode := false;

  //카드리더 정보 생성
  MakeCardreaderInfo;
  cbCardReader.Visible := false;

  //루프 정보 생성
  MakePortInfo;
  cbPort.Visible := false;

  //CCTV정보 생성
  MakeCCTVInfo;
  cmb_CCTV.Visible := False;


  with ComboBox_WatchPowerOff do //정전감시
  begin
    Clear;
    Items.Add('정전 감시 OFF');
    Items.Add('정전 감시 ON');
    ItemIndex := 0;
  end;

  with ComboBox_DoorType1 do //문1 용도
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex := 0;
  end;

  with ComboBox_DoorType2 do  //문2용도
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex := 0;
  end;

  with ComboBox_CardModeType1 do     //출입문1 카드운영 모드
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex := 0;
  end;

  with ComboBox_CardModeType2 do     //출입문2 카드운영 모드
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex := 0;
  end;


  with ComboBox_DoorModeType1 do     //출입문1 운영 모드
  begin
    Clear;
    Items.Add('운영모드');
    Items.Add('개방모드');
    ItemIndex := 0;
  end;
  with ComboBox_DoorModeType2 do     //출입문2 운영 모드
  begin
    Clear;
    Items.Add('운영모드');
    Items.Add('개방모드');
    ItemIndex := 0;
  end;


  with ComboBox_UseSch1 do     //출입문1 스케쥴
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex := 0;
  end;
  with ComboBox_UseSch2 do     //출입문2 스케쥴
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex := 0;
  end;

  with ComboBox_SendDoorStatus1 do     //출입문1 상태 전송여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('출입문상태');
    Items.Add('전기정상태');
    Items.Add('출입문+전기정상태');
    ItemIndex := 0;
  end;
  with ComboBox_SendDoorStatus2 do     //출입문1 상태 전송여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('출입문상태');
    Items.Add('전기정상태');
    Items.Add('출입문+전기정상태');
    ItemIndex := 0;
  end;

  with ComboBox_AlarmLongOpen1 do     //출입문1장시간 열림 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex := 0;
  end;
  with ComboBox_AlarmLongOpen2 do     //출입문2장시간 열림 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex := 0;
  end;

  with ComboBox_LockType1 do       //출입문1 전기정 타입
  begin
    Clear;
    Items.Add('일반형(정전시 잠김)');
//    Items.Add('자동문');
//    Items.Add('일반형(정전시 열림)');
    Items.Add('데드락/EM락/스트라이커');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이커(정전시 열림)');
    Items.Add('0x35 예비');
//    Items.Add('0x36 예비');
    Items.Add('자동문(센서감지)');
//    Items.Add('0x37 식당');
    Items.Add('식당');
    ItemIndex := 1;
  end;
  with ComboBox_LockType2 do       //출입문2 전기정 타입
  begin
    Clear;
    Items.Add('일반형(정전시 잠김)');
//    Items.Add('자동문');
//    Items.Add('일반형(정전시 열림)');
    Items.Add('데드락/EM락/스트라이커');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이커(정전시 열림)');
    Items.Add('0x35 예비');
//    Items.Add('0x36 예비');
    Items.Add('자동문(센서감지)');
//    Items.Add('0x37 식당');
    Items.Add('식당');
    ItemIndex := 1;
  end;



  with ComboBox_ControlFire1 do     //출입문1 화재 발생시 문제어
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex := 0;
  end;
  with ComboBox_ControlFire2 do     //출입문2 화재 발생시 문제어
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex := 0;
  end;
end;


procedure TForm_Main.sgCardReaderSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  if ACol = 1 then    // 1번째열로 포커스가 이동됐을때 combobox 보여주기
  begin
    Rect := sgCardReader.CellRect(ACol, ARow);
    // 현재 Cell의 좌표를 Rect로 저장
    with cbCardReader do
    begin
      // 사용 여부 등록
      Clear;
      Items.Add('미사용');
      Items.Add('사용');
      ItemIndex := 0;
      Visible := true;
      Left := sgCardReader.Left + Rect.Left + 2;
      Top := sgCardReader.Top + Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sgCardReader.Cells[ACol, ARow];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end else if ACol = 2 then
  begin
    Rect := sgCardReader.CellRect(ACol, ARow);
    // 현재 Cell의 좌표를 Rect로 저장
    with cbCardReader do
    begin
      //사용문번호
      Clear;
//      Items.Add('0');
      Items.Add('1');
      Items.Add('2');
      ItemIndex := 1;
      Visible := true;
      Left := sgCardReader.Left + Rect.Left + 2;
      Top := sgCardReader.Top + Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sgCardReader.Cells[ACol, ARow];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end;
end;

procedure TForm_Main.sgPortSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  Rect := sgPort.CellRect(ACol, ARow);

  case ACol of
    1: // 감시형태
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('0.방범');
        Items.Add('1.화재');
        Items.Add('2.가스');
        Items.Add('3.비상');
        Items.Add('4.설비');
        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    2: //지연시간 사용유무
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('미사용');
        Items.Add('사용');
        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
    3: //감지시간
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('400');
        Items.Add('600');
        Items.Add('800');
        Items.Add('1000');

        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
        SetFocus;
      end;
    end;
  end;
end;

procedure TForm_Main.cbPortExit(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      with sgPort do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
        PortDataUpdate(Col,row);
      end;
    end;
  end;
end;

// ECU 추가
procedure TForm_Main.btnECUAddClick(Sender: TObject);
var
  i : integer;
  st : string;
  stMCUID : string;
begin
  Form_AddECU := TForm_AddECU.Create(Self);
  Form_AddECU.ShowModal;
  Form_AddECU.Free;

  ECUList.Clear;
  ECUList.Add('99.전체');
  ECUList.Add('00.Controler');
  DeleteDeviceAllTable;
  stMCUID := GetMcuID;
  InsertDeviceTable(stMCUID,'00');
  for i:= 0 to lvECU.Items.Count - 1 do
  begin
    st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
    ECUList.Add(st);
    InsertDeviceTable(stMCUID,lvECU.Items[I].Caption);
  end;

  
end;
//ECU 삭제

procedure TForm_Main.btnECUEraseClick(Sender: TObject);
var
  stECUID : string;
  st : string;
begin
  if lvECU.Selected = nil then exit;
  stECUID := lvECU.Selected.Caption;
  st := lvECU.Selected.Caption + '.'+ lvECU.Selected.SubItems.Strings[0];
  if lvECU.Selected <> nil then lvECU.Selected.Delete;
  if lvECU.Items.Count < 1 then
  begin
    ToolButton_ECU.Enabled:= False;
    tb_Ecu.TabVisible := False;
  end;

  ECUList.Delete(ECUList.IndexOf(st));
  DeleteDeviceTable(stECUID);
end;


procedure TForm_Main.CommPortPortOpen(Sender: TObject);
begin
  bConnected := True;
  ToolButton_Connect.Enabled := false;
  ToolButton_Disconnect.Enabled := true;
  FieldStatus_ComStatus.Caption := '연결 COM NO:' + IntToStr(Commport.ComNumber);
  ApdSLController.Monitoring := true;
  Timer_ENQ.enabled := True;
  {ID를 우선 확인한다.}
  if Not CheckID then
  begin
//    Action_DisconnectExecute(self);
//    Commport.Open := false;
//    FieldStatus_ComStatus.Caption := '연결실패';
//    exit;
  end;
  bTimeShow := False;
  TimeSync(GetMcuID + '00');

  {기기설정을 위해선 반드시 해제 모드}
  ChangeAlarmMode('000000000','D',True);

end;

procedure TForm_Main.CommPortPortClose(Sender: TObject);
begin
  Timer_ENQ.enabled := False;
  ToolButton_Connect.Enabled := true;
  ToolButton_Disconnect.Enabled := false;
  ApdSLController.Monitoring := false;
  FieldStatus_ComStatus.Caption := '연결종료 COM NO:' +
    IntToStr(Commport.ComNumber);
end;


procedure TForm_Main.btnRegCardClick(Sender: TObject);
begin
  Form_RegCard := TForm_RegCard.Create(Self);
  Form_RegCard.ECUList := TStringList.Create;
  Form_RegCard.ECUList.Clear;
  Form_RegCard.ECUList := ECUList;
  Form_RegCard.DeviceID := GetMcuID;
  Form_RegCard.ShowModal;
  Form_RegCard.Free;
end;

procedure TForm_Main.FormShow(Sender: TObject);
begin
  TB_CARD.CreateTable;
  TB_CARD.Active := true;
  TB_DEVICE.CreateTable;
  TB_DEVICE.Active := true;
  InsertDeviceTable('0000000','00');
  ToolButton_ECU.Enabled:= False;
  ComboBox_ECU.Enabled:= False;
  tb_Ecu.TabVisible := false;

  xMCUID:= '0000000';

  bRegCardShow := False;
  bDoorSchRegShow := False;
  bECUStatusCheck := False;
  CountCardReadData := 1;

end;

procedure TForm_Main.btnRegScheduleClick(Sender: TObject);
begin
  DoorscheduleRegForm:= TDoorscheduleRegForm.Create(Self);
  DoorscheduleRegForm.ECUList := TStringList.Create;
  DoorscheduleRegForm.ECUList.Clear;
  DoorscheduleRegForm.ECUList := ECUList;
  DoorscheduleRegForm.DeviceID := GetMcuID;
  DoorscheduleRegForm.Showmodal;
  DoorscheduleRegForm.Free;
end;

procedure TForm_Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  IsStop := True;
  if CommPort.Open then CommPort.Open := false;
end;

//wiznet 정보확인
function TForm_Main.CheckWiznet(aDeviceID: string): Boolean;
var
  aData: string;
  nTime: integer;
begin
  Result := false;
  aData := 'NW00';
  bWiznetCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//랜모듈 설정
function TForm_Main.Writewiznet(aDeviceID, aLocalIP, aSubnet,
  aGateway, aPortNo,aServerIp,aServerport,aMode,aCmd: string): Boolean;
var
  I: Integer;
  No: Integer;
  st, st2: string;
  DataStr: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[6];
  nTime:integer;
begin
  Result := false;

  //1.Header
  FHeader := 'AA';
  //2.MAC Address 지정안함
  FMacAddress := '000000000000';
  //3.Mode (Server mode: 01, Client mode: 00)
  FMode := aMode;
  {
  if Checkbox_Client.Checked then FMode:= '00'
  else                            FMode:= '01';
   }

  // 4.IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aLocalIP, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FIPAddress := ToHexStrNoSpace(st2);

  // 5.Subnet mask
  st2 := '';

  //if Edit_Subnet.Text = '' then Edit_Subnet.Text:= '0.0.0.0';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aSubnet, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FSubnet := ToHexStrNoSpace(st2);

  // 6.Gateway address
  st2 := '';
  //if Edit_Gateway.Text = '' then Edit_Gateway.Text:= '0.0.0.0';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aGateway, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FGateway := ToHexStrNoSpace(st2);

  //7.Port number (Client)
  st2 := '';
  //if Edit_LocalPort.Text = '' then Edit_LocalPort.Text:= '0';
  st := Dec2Hex(StrToInt(aPortNo), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FClientPort := ToHexStrNoSpace(st2);

  //8. Server IP address
  st2 := '';
  for I := 0 to 3 do
  begin
    st  := FindCharCopy(aServerIp, I, '.');
    No  := StrToInt(st);
    st2 := st2 + Char(No);
  end;
  FServerIP := ToHexStrNoSpace(st2);

  //9.  Port number (Server)
  st2 := '';
  //if Edit_Serverport.Text = '' then Edit_Serverport.Text:= '3000';
  if aPortNo = '' then aPortNo := '3000';
  st2 := '';
  st := Dec2Hex(StrToInt(aServerport), 2);
  if Length(st) < 4 then st := '0' + st;
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FServerPort := ToHexStrNoSpace(st2);

  //10. Serial speed (bps)
  FSerial_Baud := 'FD';
  {
  case ComboBox_Boad.ItemIndex of
    0: FSerial_Baud:= 'F4'; //9600           F4
    1: FSerial_Baud:= 'FA'; //19200          FA
    2: FSerial_Baud:= 'FD'; //38400 Default  FD
    3: FSerial_Baud:= 'FE'; //57600          FE
    4: FSerial_Baud:= 'FF'; //115200         FF
    else FSerial_Baud:= 'FD';
  end;
   }

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  FSerial_data := '08';
  {
  case ComboBox_Databit.ItemIndex of
      0: FSerial_data:= '07';
      1: FSerial_data:= '08'; //Default
      else FSerial_data:= '08';
  end;
   }

  //12. Parity (00: No), (01: Odd), (02: Even)
  FSerial_Parity := '00';
  {
  case ComboBox_Parity.ItemIndex of
    0: FSerial_Parity:= '00'; //None Default
    1: FSerial_Parity:= '01'; //Odd
    2: FSerial_Parity:= '02'; //Even
    else FSerial_Parity:= '00';
  end;
   }
  //13. Stop bit
  FSerial_stop := '01';

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  FSerial_flow := '00';
  {
  case ComboBox_Flow.ItemIndex  of
    0: FSerial_flow:= '00'; //Default
    1: FSerial_flow:= '01';
    2: FSerial_flow:= '02';
  end;
   }

  //15. Delimiter char
  FDelimiterChar := '03';
  {
  if Edit_Char.Text ='' then Edit_Char.Text:= '00';
  FDelimiterChar:= Edit_Char.Text;
   }

  //16.Delimiter size
  {
  if Edit_Size.Text ='' then Edit_Size.Text:= '0';
  st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
  st:=FillZeroStrNum(st,4);
   }
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterSize := ToHexStrNoSpace(st2);

  //17. Delimiter time

  //if Edit_Time.Text = '' then Edit_Time.Text:= '20';

  st := Dec2Hex(StrToInt('10'), 2);
  st := FillZeroStrNum(st, 4);

  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimitertime := ToHexStrNoSpace(st2);

  //18.Delimiter idle time
  //if Edit_Idle.Text = '' then Edit_Idle.Text:= '0';
  //st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
  //st:=FillZeroStrNum(st,4);
  st := '0000';
  st2 := '';
  st2 := Chr(Hex2Dec(Copy(st, 1, 2))) + Char(Hex2Dec(Copy(st, 3, 2)));
  FDelimiterIdle := ToHexStrNoSpace(st2);

  //19. Debug code (00: ON), (01: OFF)
  FDebugMode := '01';
  {
  if Checkbox_Debugmode.Checked then FDebugMode:= '00'
  else                               FDebugMode:= '01';
   }
  //20.Software major version
  FROMVer := '0000';

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  FOnDHCP := '00';
  {
  if Checkbox_DHCP.Checked then FOnDHCP:= '01'
  else                          FOnDHCP:= '00';
  }

  //22.Reserved for future use
  FReserve := '000000';

  DataStr := FHeader + FMacAddress + FMode + FIPAddress + FSubnet +
    FGateway + FClientPort + FServerIP + FServerPort + FSerial_Baud +
    FSerial_data + FSerial_Parity + FSerial_stop + FSerial_flow +
    FDelimiterChar + FDelimiterSize + FDelimitertime + FDelimiterIdle +
    FDebugMode + FROMVer + FOnDHCP + FReserve;

  WiznetData := DataStr;
  {
  SHowMessage(FHeader+#13+
              FMacAddress+#13+
              FMode+#13+
              FIPAddress+#13+
              FSubnet+#13+
              FGateway+#13+
              FClientPort+#13+
              FServerIP+#13+
              FServerPort+#13+
              FSerial_Baud+#13+
              FSerial_data+#13+
              FSerial_Parity+#13+
              FSerial_stop+#13+
              FSerial_flow+#13+
              FDelimiterChar+#13+
              FDelimiterSize+#13+
              FDelimitertime+#13+
              FDelimiterIdle+#13+
              FDebugMode+#13+
              FROMVer+#13+
              FOnDHCP+#13+
              FReserve+#13+
            '길이:'+InttoStr(Length(DataStr)));
  }

  bWiznetCheck := False;
  //SendPacket(aDeviceID, 'I',  aCmd + '00' + DataStr, True);
  SendPacket(aDeviceID, 'I',  'NW' + aCmd  + DataStr, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

procedure TForm_Main.RcvWiznetInfo(aData: string);
var
  I: Integer;
  TempStr: string;
  st, st2: string;
  DataStr: string;
  ErrorLog: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr := Copy(aData, 22, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

  bWiznetCheck := True;

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    //Wiznet 조회 요청 처리 할것
    //WizNetRcvACK:= True;
    //btnCheckwiznetClick(Self);

//   Exit;
  end;

  //2.MAC Address
  TempStr := 'MAC Addr;' + FMacAddress;
  //LMDListBox1.Items.Add(TempStr);

  //3.Mode (Server mode: 01, Client mode: 00)
  TempStr := 'Client Mode;';
//  if FMode = '00' then Rg_Mode.ItemIndex  := 1
//  else Rg_Mode.ItemIndex  := 0;
  UpdateMode('00',inttostr(rg_mode.ItemIndex));
  //LMDListBox1.Items.Add(TempStr);

  // 4.IP address ★★★★★
  st2 := '';
  st := Hex2Ascii(FIPAddress);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;

  Edit_IP.Text := st2;
  Edit_IP.Color := clYellow;
  TempStr := 'Local/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 5.Subnet mask ★★★★★
  st2 := '';
  st := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  Edit_subnet.Text := st2;
  Edit_subnet.Color := clYellow;
  TempStr := 'Local/SubNet;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 6.Gateway address  ★★★★★
  st2 := '';
  st := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  edit_Gateway.Text := st2;
  edit_Gateway.Color := clYellow;
  TempStr := 'Local/Gateway;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //7.Port number (Client) ★★★★★
  st2 := Hex2DecStr(FClientPort);
  edit_port.Text := st2;
  edit_port.Color := clYellow;
  TempStr := 'Local/Port;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //8. Server IP address
  st2 := '';
  st := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  ed_server.Color:= clYellow;
  ed_server.Text:= st2;
  TempStr := 'Server/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //9.  Port number (Server)
  st2 := '';
  st2 := Hex2DecStr(FServerPort);
  TempStr := 'Server/Port;' + st2;
  ed_ServerPort.Text := st2;
  ed_ServerPort.Color := clyellow;
  //Edit_Serverport.Color:= clYellow;
  //Edit_Serverport.Text:= st2;
  //LMDListBox1.Items.Add(TempStr);

  //10. Serial speed (bps)
  TempStr := 'Serial/Baud;';

  if FSerial_Baud = 'F4' then TempStr := TempStr + '9600[F4]'
  else if FSerial_Baud = 'FA' then TempStr := TempStr + '19200[FA]'
  else if FSerial_Baud = 'FD' then TempStr := TempStr + '38400[FD]'
  else if FSerial_Baud = 'FE' then TempStr := TempStr + '57600[FE]'
  else if FSerial_Baud = 'FF' then TempStr := TempStr + '115200[FF]'
  else TempStr := TempStr + FSerial_Baud;
  //LMDListBox1.Items.Add(TempStr);

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  TempStr := 'Serial/Data;';
  if FSerial_data = '07' then TempStr := TempStr + '7'
  else if FSerial_data = '08' then TempStr := TempStr + '8'
  else TempStr := TempStr + 'error:' + FSerial_data;
  //LMDListBox1.Items.Add(TempStr);

  //12. Parity (00: No), (01: Odd), (02: Even)
  TempStr := 'Serial/Parity;';
  if FSerial_Parity = '00' then TempStr := TempStr + 'No'
  else if FSerial_Parity = '01' then TempStr := TempStr + 'Odd'
  else if FSerial_Parity = '02' then TempStr := TempStr + 'even'
  else TempStr := TempStr + 'error:' + FSerial_Parity;
  //LMDListBox1.Items.Add(TempStr);

  //13. Stop bit
  TempStr := 'Serial/Stop;';
  if FSerial_stop = '01' then TempStr := TempStr + '1'
  else TempStr := TempStr + 'error:' + FSerial_stop;
  //LMDListBox1.Items.Add(TempStr);

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  TempStr := 'Serial/Flow;';
  if FSerial_flow = '00' then TempStr := TempStr + 'None'
  else if FSerial_flow = '01' then TempStr := TempStr + 'XON/XOFF'
  else if FSerial_flow = '02' then TempStr := TempStr + 'CTS/RTS'
  else TempStr := TempStr + 'error:' + FSerial_flow;
  //LMDListBox1.Items.Add(TempStr);

  //15. Delimiter char
  TempStr := 'Delimiter/char;';
  TempStr := TempStr + FDelimiterChar;
  //LMDListBox1.Items.Add(TempStr);

  //16.Delimiter size
  TempStr := 'Delimiter/Size;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterSize);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //17. Delimiter time
  TempStr := 'Delimiter/Time;';
  st2 := '';
  st2 := Hex2DecStr(FDelimitertime);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //18.Delimiter idle time
  TempStr := 'Delimiter/idleTime;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterIdle);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //19. Debug code (00: ON), (01: OFF)
  TempStr := 'Debug Mode;';
  if FDebugMode = '00' then TempStr := TempStr + 'ON[00]'
  else TempStr := TempStr + 'OFF[01]';
  //LMDListBox1.Items.Add(TempStr);

  //20.Software major version
  TempStr := 'version;';
  st := Hex2Ascii(FROMVer);
  TempStr := TempStr + IntToStr(Ord(st[1])) + '.' + IntToStr(Ord(st[2]));
  //LMDListBox1.Items.Add(TempStr);

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)

  TempStr := 'DHCP;';
  if FOnDHCP = '01' then
  begin
    //Checkbox_DHCP.Checked:= True;
    TempStr := TempStr + 'ON[01]'
  end else if FOnDHCP = '00' then
  begin
    //Checkbox_DHCP.Checked:= False;
    TempStr := TempStr + 'OFF[00]';
  end;

  ErrorLog := '';

  if FMode <> Copy(wiznetData, 15, 2) then
    ErrorLog := ErrorLog + 'Mode:' + Copy(wiznetData, 15, 2) + '<>' + FMode + #13;
  if FIPAddress <> Copy(wiznetData, 17, 8) then
    ErrorLog := ErrorLog + 'IPAddress:' + Copy(wiznetData, 17,
      8) + '<>' + FIPAddress + #13;
  if FSubnet <> Copy(wiznetData, 25, 8) then
    ErrorLog := ErrorLog + 'SubNet:' + Copy(wiznetData, 25,
      8) + '<>' + FSubnet + #13;
  if FGateway <> Copy(wiznetData, 33, 8) then
    ErrorLog := ErrorLog + 'Gateway:' + Copy(wiznetData, 33,
      8) + '<>' + FGateway + #13;
  if FClientPort <> Copy(wiznetData, 41, 4) then
    ErrorLog := ErrorLog + 'ClientPort:' + Copy(wiznetData, 41,
      8) + '<>' + FClientPort + #13;
  if FServerIP <> Copy(wiznetData, 45, 8) then
    ErrorLog := ErrorLog + 'ServerIP:' + Copy(wiznetData, 45,
      8) + '<>' + FServerIP + #13;
  if FServerPort <> Copy(wiznetData, 53, 4) then
    ErrorLog := ErrorLog + 'ServerPort:' + Copy(wiznetData, 53,
      8) + '<>' + FServerPort + #13;
  if FSerial_Baud <> Copy(wiznetData, 57, 2) then
    ErrorLog := ErrorLog + 'Serial_Baud:' + Copy(wiznetData, 57,
      2) + '<>' + FSerial_Baud + #13;
  if FSerial_data <> Copy(wiznetData, 59, 2) then
    ErrorLog := ErrorLog + 'Serial_data:' + Copy(wiznetData, 59,
      2) + '<>' + FSerial_data + #13;
  if FSerial_Parity <> Copy(wiznetData, 61, 2) then
    ErrorLog := ErrorLog + 'Serial_Parity:' + Copy(wiznetData, 61,
      2) + '<>' + FSerial_Parity + #13;
  if FSerial_stop <> Copy(wiznetData, 63, 2) then
    Errorlog := Errorlog + 'Serial_stop:' + Copy(wiznetData, 63,
      2) + '<>' + FSerial_stop + #13;
  if FSerial_flow <> Copy(wiznetData, 65, 2) then
    Errorlog := Errorlog + 'Serial_flow:' + Copy(wiznetData, 65,
      2) + '<>' + FSerial_flow + #13;
  if FDelimiterChar <> Copy(wiznetData, 67, 2) then
    Errorlog := Errorlog + 'DelimiterChar:' + Copy(wiznetData, 67,
      2) + '<>' + FDelimiterChar + #13;
  if FDelimiterSize <> Copy(wiznetData, 69, 4) then
    Errorlog := Errorlog + 'DelimiterSize:' + Copy(wiznetData, 69,
      2) + '<>' + FDelimiterSize + #13;
  if FDelimitertime <> Copy(wiznetData, 73, 4) then
    Errorlog := Errorlog + 'Delimitertime:' + Copy(wiznetData, 73,
      4) + '<>' + FDelimitertime + #13;
  if FDelimiterIdle <> Copy(wiznetData, 77, 4) then
    Errorlog := Errorlog + 'DelimiterIdle:' + Copy(wiznetData, 77,
      4) + '<>' + FDelimiterIdle + #13;
  if FDebugMode <> Copy(wiznetData, 81, 2) then
    Errorlog := Errorlog + 'DebugMode:' + Copy(wiznetData, 81,
      4) + '<>' + FDebugMode + #13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData, 87, 2) then
    Errorlog := Errorlog + 'OnDHCP:' + Copy(wiznetData, 87, 4) + '<>' + FOnDHCP;
  if FReserve <> Copy(wiznetData, 89, 6) then
    //if (Errorlog <> '') and (WizNetRegMode = True) then
    if Errorlog <> '' then
    begin
      Errorlog := '설정값과 응답값이 틀립니다.' + #13 +
        '===========================' + #13 + '  설정값 < ===== > 응답값  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
  }

end;


//기기번호 조회(MCU조회)
function TForm_Main.CheckID: Boolean;
var
  aData : string;
  nTime : integer;
begin
  Result := false;
  aData := 'ID000000000';

  bMCUIDCheck := False;
  SendPacket('000000000', 'Q', aData, True);

  nTime := 0;
  while Not bMCUIDCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
// 기기번호등록

function TForm_Main.RegID(aDeviceID: string): Boolean;
var
  nTime:integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 7) then Exit;
  xMCUID:= aDeviceID;
  bMCUIDCheck := False;
  SendPacket('000000000', 'I', 'ID00' + aDeviceID, True);

  nTime := 0;
  while Not bMCUIDCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
  Result := true;

end;

// 기기번호 응답
procedure TForm_Main.RcvDeviceID(aData: string);
var
  st: string;
  stEUC : string;
begin
  //40 K1123456700i1IF00제론시스템      61
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 7);

  Edit_DeviceID1.Text := st[1];
  Edit_DeviceID2.Text := st[2];
  Edit_DeviceID3.Text := st[3];
  Edit_DeviceID4.Text := st[4];
  Edit_DeviceID5.Text := st[5];
  Edit_DeviceID6.Text := st[6];
  Edit_DeviceID7.Text := st[7];
  xMCUID:= st;
  stEUC := Copy(aData, 29, 2);
  InsertDeviceTable(xMCUID, stEUC);
  bMCUIDCheck := True;  //MCUID체크 성공


  // 기기 응답 완료후 나머지 정보를 조회를 수행한다.
  {
  if isRegMode then RegSysInfo(xDeviceID)
  else CheckSysInfo(xDeviceID);
   }
end;

//ECU 조회
function TForm_Main.CheckUsedDevice(aDeviceID: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'EX00';
  bUsedDeviceCheck  := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bUsedDeviceCheck  do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
  Result := true;
end;
  // ECU 등록
  //UsedDevice:00~99 ==> '00000 ~000000'(100Byte)

function TForm_Main.RegUsedDevice(aDeviceID: string;
  UsedDevice: string): Boolean;
var
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  if (not isdigit(UsedDevice)) or (Length(UsedDevice) <> 100) then Exit;

  bUsedDeviceCheck := False;
  
  SendPacket(aDeviceID, 'I', 'EX00' + UsedDevice, true);

  nTime := 0;
  while Not bUsedDeviceCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// ECU 응답
procedure TForm_Main.RcvUsedDevice(aData: string);
var
  st: string;
  I: Integer;
  ECUNo: string;
  aIndex: Integer;
  alist: TListItem;
  stMCUNO: string;
begin

  lvECU.Clear;
  ECUList.Clear;
  ECUList.Add('99.전체');
  ECUList.Add('00.Controler');
  for i:= 0 to lvECU.Items.Count - 1 do
  begin
    st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
    ECUList.Add(st);
  end;
{  aList := lvECU.Items.Add;
  aList.Caption := '00'; //ECU 번호
  aList.ImageIndex := 4;
  aList.SubItems.Add('Controler');
}
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 100);
  stMCUNO := Copy(aData,7,7);
  for I := 2 to 100 do  // 1번째는 메인임
  begin
    if st[I] = '1' then
    begin
      ECUNo := FillZeroNumber(I-1, 2);
      if ListviewBinarySearch(lvECU, ECUNo, aIndex) then
      begin
        // 이미등록되어 있음
      end else
      begin
        // ECU 추가
        aList := lvECU.Items.Add;
        aList.Caption := ECUNo; //ECU 번호
        aList.ImageIndex := 4;
        aList.SubItems.Add('ECU');
        ECUList.Add(ECUNo + '.ECU');
        InsertDeviceTable(stMCUNO,ECUNo);
      end;
    end;
  end;
  lvECU.Color := clYellow;
  bUsedDeviceCheck := True;
end;


//알람표시기 조회
function TForm_Main.CheckUsedAlarmDisplay(aDeviceID: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'AD00';
  bUsedAlarmCheck  := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bUsedAlarmCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

  // 알람표시기 등록
  // UsedDevice:1~4==> '0000'(4Byte)
function TForm_Main.RegUsedAlarmDisplay(aDeviceID: string;
  UsedDevice: string): Boolean;
var
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  if (not isdigit(UsedDevice)) or (Length(UsedDevice) <> 4) then Exit;

  bUsedAlarmCheck := False;
  SendPacket(aDeviceID, 'I', 'AD00' + '0' + UsedDevice, true);

  nTime := 0;
  while Not bUsedAlarmCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := True;
end;

// 알람표시기 응답
procedure TForm_Main.RcvUsedAlarmdisplay(aData: string);
var
  st: string;
  I: Integer;
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 23, 4);
  
  CheckList_Alarm.UncheckAll;
  for I := 1 to 4 do
  begin
    if st[I] = '1' then CheckList_Alarm.ItemChecked[I - 1] := true
    else CheckList_Alarm.ItemChecked[I - 1] := false;
  end;
  bUsedAlarmCheck := True;
end;


//링커스 ID 조회
function TForm_Main.CheckLinkusID(aDeviceID: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'Id00';
  
  bLinkusIDCheck  := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bLinkusIDCheck  do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//링커스 ID 등록
function TForm_Main.RegLinkusID(aDeviceID, aLinkusId: string): Boolean;
var
  aID: Integer;
  bID: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  if not isdigit(aLinkusId) then Exit;
  aID := StrToInt(aLinkusId);
  bID := Dec2Hex(aID, 4);
  bLinkusIDCheck := False;
  SendPacket(aDeviceID, 'I', 'Id00' + bID, true);

  nTime := 0;
  while Not bLinkusIDCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//링커스 ID응답
procedure TForm_Main.RcvLinkusId(aData: string);
var
  st: string;
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 4);
  Edit_LinkusID.Text := Hex2DecStr(st);
  Edit_LinkusID.Color := clYellow;
  bLinkusIDCheck := True;
end;


// 데코더 전화번호 조회
function TForm_Main.CheckLinksTellNo(aDeviceID: string; aNo: Integer): Boolean;
var
  IndexStr: string;
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  IndexStr := '0' + IntToStr(aNo);
  aData := 'Tn00' +  //COMMAND
    IndexStr;        //전화 번호 인덱스
  bLinksTelNoCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bLinksTelNoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// 데코더 전화번호 등록
function TForm_Main.RegLinksTellNo(aDeviceID: string; aNo: Integer;
  aTellno: string): Boolean;
var
  NoStr: string[2];
  st: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  if not isdigit(aTellNo) then Exit;
  NoStr := IntToStr(aNo);
  if Length(NoStr) < 2 then NoStr := '0' + NoStr;
  st := SetLength(aTellNo, 20);

  bLinksTelNoCheck := False;
  SendPacket(aDeviceID, 'I', 'Tn00' + NoStr + st, true);

  nTime := 0;
  while Not bLinksTelNoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//링커스 관제 번호 수신
procedure TForm_Main.RcvLinkusTelNo(aData: string);
var
  st: string;
  MNo: Integer;
begin
//           1         2
//  123456789012345678901234567
//	027 K1100000100iSTn0000D6

  bLinksTelNoCheck := True;
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, Length(aData) - 24);
  MNo := StrToInt(Copy(st, 1, 2));
  Delete(st, 1, 2);
  DeleteChar(st, ' ');
  //MNo(Index)무시: 0번 하나만 사용중...
  Edit_LinkusTel.Text := st;
  Edit_LinkusTel.Color := clYellow;
end;


//텔카운트 조회
function TForm_Main.CheckRingCount(aDeviceID: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'Rc00';
  bRingCountCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bRingCountCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
//텔카운트 등록

function TForm_Main.RegRingCount(aDeviceID: string; aCount: Integer): Boolean;
var
  Countstr: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  CountStr := FillZeroNumber(aCount, 2);
  bRingCountCheck := False;
  SendPacket(aDeviceID, 'I', 'Rc00' + CountStr, true);

  nTime := 0;
  while Not bRingCountCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
//텔카운트 응답

procedure TForm_Main.RcvRingCount(aData: string);
var
  st: string;
  aCount: Integer;
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 2);
  aCount := StrToInt(st);
  Spinner_Ring.Value := aCount;
  Spinner_Ring.Color := clYellow;
  bRingCountCheck := True;
end;


//시스템정보  조회
function TForm_Main.CheckSysInfo(aDeviceID: string): Boolean;
var
  aData: string;
  nTime: integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'SY00';
  bSysInfoCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bSysInfoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//시스템정보  등록
function TForm_Main.RegSysInfo(aDeviceID: string; WatchPowerOff: Integer;
  DelayIn: Integer; DelayOut: Integer; Door1Type: Integer;
  Door2Type: Integer; Locate: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  if (WatchPowerOff + DelayIn + DelayOut + Door1Type + Door2Type) < 0 then
    Exit;

  aData := 'SY00' +                                   // COMMAND
    IntToStr(WatchPowerOff) +                         // 정전감시여부
    FillZeroNumber(DelayOut, 3) +                     // 퇴실지연시간
    '2' +                                             // 예비
    IntToStr(Door1Type) +                             // Door1
    IntToStr(Door2Type) +                             //Door2
    SetLength(Locate, 16) +                           // 위치명
    FillZeroNumber(DelayIn, 3) +                      // 입실지연시간
    '1';                                              // 관제 통신 방식(고정)

  bSysInfoCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bSysInfoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//시스템정보  조회
procedure TForm_Main.RcvSysinfo(aData: string);
var
  st: string;
  stECUID:string;
begin
  //         1         2         3         4         5
  //12345678901234567890123456789012345678901234567890123
  //052 K1111111100iHSY001010200테스트          000079

  //052 K1000000000i5SY001000221                000157
  //                      ---------------------------


  bSysInfoCheck := True;

  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 7);
  stECUID := Copy(aData,14,2);
  if not isDigit(st) then Exit;

  {정전 감시여부}
  ComboBox_WatchPowerOff.ItemIndex := StrToInt(st[1]);
  ComboBox_WatchPowerOff.Text := ComboBox_WatchPowerOff.Items
    [ComboBox_WatchPowerOff.ItemIndex];
  ComboBox_WatchPowerOff.Color := clYellow;
  UpdateWatchPower(stECUID,st[1]);

  {퇴실지연시간}
  SpinEdit_OutDelay.IntValue := StrToInt(Copy(st, 2, 3));
  SpinEdit_OutDelay.Color := clYellow;

  {예비}
  //ComboBox_DeviceType.ItemIndex:= StrtoInt(st[5]);
  //ComboBox_DeviceType.Text:= ComboBox_DeviceType.Items[ComboBox_DeviceType.ItemIndex];

  {Door1 용도}
  ComboBox_DoorType1.ItemIndex := StrToInt(st[6]);
  ComboBox_DoorType1.Text := ComboBox_DoorType1.Items[ComboBox_DoorType1.ItemIndex];
  ComboBox_DoorType1.Color := clYellow;
  UpdateDoorType1(stECUID,st[6]);

  {Door2 용도}
  ComboBox_DoorType2.ItemIndex := StrToInt(st[7]);
  ComboBox_DoorType2.Text := ComboBox_DoorType2.Items[ComboBox_DoorType2.ItemIndex];
  ComboBox_DoorType2.Color := clYellow;
  UpdateDoorType2(stECUID,st[7]);
  
  {시스템 위치명}
  Edit_Locate.Text := Copy(aData, 29, 16);
  Edit_Locate.Color := clYellow;
  
  {입실지연시간}
  SpinEdit_InDelay.IntValue := StrToInt(Copy(aData, 45, 3));
  SpinEdit_InDelay.Color := clYellow;

end;


//시스템정보  조회(출입통제)
function TForm_Main.CheckSysInfo2(aDeviceID: string;
  aDoorNo: Integer): Boolean;
var
  aData: string;
  DeviceID: string;
  nTime : integer;
begin
  result := False;
  aData := 'B' + '0' +                             //MSG Code
    IntToStr(aDoorNo) +               //문번호
    #$20 + #$20 + '00000000000000000000';          //조회는 전체를 '0'으로 마킹

  bSysInfo2Check := False;
  SendPacket(aDeviceID, 'c', aData, True);

  nTime := 0;
  while Not bSysInfo2Check do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;
//출입통제 시스템정보  등록

function TForm_Main.RegSysInfo2(aDeviceID: string;
  aDoorNo, aCardMode, aDoorMode, aDoorOpenTime, aOpenMoniTime,
  aUseSchedule, aSendDoorState, aUseOpenalarm, aLockType,
  aControledFire: Integer): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  aData := 'A' +                       //MSG Code
    '0' +                              //Msg Count(고정)
    IntToStr(aDoorNo) +                //문번호
    #$20 + #$20 +                      // Record count
    IntToStr(aCardMode) +              //카드운영모드
    IntToStr(aDoorMode) +              //출입문 운영모드
    IntToStr(aDoorOpenTime) +          //Door제어 시간
    IntToStr(aOpenMoniTime) +          //장시간 열림 경보
    IntToStr(aUseSchedule) +           //스케줄 적용유무
    IntToStr(aSendDoorState) +         //출입문상태전송
    '0' +                              //통신이상시 기기운영(사용안함:고정)
    '0' +                              //AntiPassBack(사용안함:고정)
    IntToStr(aUseOpenalarm) +          //장시간 열림 부저출력
    '0' +                              //통신 이상시 부저 출력 (사용안함:고정)
    IntToStr(aLockType) +              //전기정 타입
    IntToStr(aControledFire) +         //화재 발생시 문제어
    '0' +                              //DS LS 검사(사용안함:고정)
    '0000000';                         //예비


  bSysInfo2Check := False;
  SendPacket(aDeviceID, 'c', aData, true);

  nTime := 0;
  while Not bSysInfo2Check do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;


//사용카드리더 조회
function TForm_Main.CheckCardReader(aDeviceID: string; aNo: Integer): Boolean;
var
  aData: string;
  ReaderNoStr: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  ReaderNoStr := FillZeroNumber(aNo, 2);
  aData := 'CD' + ReaderNoStr;
  bCardReaderCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bCardReaderCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//카드리더 등록



//등록	046 K1111111100I6CD010010011111111        2E
//응답	046 K1111111100iaCD010010011111111        E3
//조회 	025 K1111111100Q0CD01A8
//응답  046 K1111111100ihCD010010011111111        DC

function TForm_Main.RegCardReader(aDeviceID: string;    // 기기번호
  aNo,                  // 카드리더 번호
  aUsed,                //  사용여부
  aDoorNo: Integer;     // 연결 문번호
  aLocate: string       // 위치명
  ): Boolean;
var
  aReaderNoStr: string;
  aData: string;
  nTime : integer;
begin
  Result := false;
  aReaderNoStr := FillZeroNumber(aNo, 2);
  aData := 'CD' +                                         //COMMAND
    aReaderNoStr +                                        //리더 번호
    IntToStr(aUsed) +                                     //리더 사용 유무
    '0' +                                                 //리더 위치(고정)
    IntToStr(aDoorNo) +                                   //Door No
    '00' +                                                //존번호
    SetLength(aLocate, 16);                               //위치명

  bCardReaderCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCardReaderCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//카드리더 설정 응답
procedure TForm_Main.RcvCardReader(aData: string);
var
  st: string;
  aReaderNo: Integer;
  UsedCardreader: Char;
  DoorNo: Char;
  Locate: string;
  stECUID :string;
begin

//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC

  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 20, 2);
  stECUID := copy(aData,14,2);
  aReaderNo := StrToInt(st);
  st := Copy(aData, 22, 21);
  //if not isdigit(st) then Exit;
  UsedCardreader := st[1];         // 카드리더 사용여부
  DoorNo := st[3];                 // 연동 문번호
  Locate := Copy(st, 6, 16);       // 카드리더 위치명

  if UsedCardreader = '0' then  sgCardReader.Cells[1, aReaderNo] := '미사용'
  else sgCardReader.Cells[1, aReaderNo] := '사용';
  //sgCardReader.Cells[1, aReaderNo] := UsedCardreader;
  UpdateReaderUse(stECUID,sgCardReader.Cells[1, aReaderNo],aReaderNo);
  sgCardReader.Cells[2, aReaderNo] := DoorNo;
  UpdateReaderDoor(stECUID,DoorNo,aReaderNo);
//  sgCardReader.Cells[3, aReaderNo] := Trim(Locate);
//  UpdateReaderName(stECUID,Trim(Locate),aReaderNo);
  sgCardReader.Color := clYellow;

  bCardReaderCheck := True;
end;

//사용포트LOOP 조회
function TForm_Main.CheckPort(aDeviceID: string; aNo: Integer): Boolean;
var
  aData: string;
  aPortNoStr: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aPortNoStr := FillZeroNumber(aNo, 2);
  aData := 'LP' + aPortNoStr;
  bPortCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bPortCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// 포트 등록
//073 K1111111100I5LP01S111011111111100011111111100                040057
//073 K1111111100i3LP01S111011111111100011111111100                040039

function TForm_Main.RegPort(aDeviceID: string;           // 기기번호
  aNo,                         // 포트번호
  aAlarmType,                  // 감시형태
  aUseDelay,                   // 지연시간
  aDetectTime: Integer;         // 감지시간
  aLocate: string              // 위치명
  ): Boolean;
var
  aData: string;
  aPortNoStr: string;
  nTime : integer;
begin
  Result := false;
  aPortNoStr := FillZeroNumber(aNo, 2);
  aData := 'LP' +                              //COMMAND
    aPortNoStr +                               //포트번호
    'SS' +                                     //상태코드('SS' 고정)
    IntToStr(aAlarmType) +                     //감시형태
    '0' +                                      //알람발생 방식(고정)
    '0' +                                      //복구신호전송(고정)
    IntToStr(aUseDelay) +                      //지연시간 사용유무
    '00' +                                     //램프
    '00' +                                     //싸이렌
    '00' +                                     //릴레이1
    '00' +                                     //릴레이2
    '00' +                                     //출입문연동1
    '00' +                                     //출입문연동2
    '00' +                                     //메인램프
    '00' +                                     //메인싸이렌
    '00' +                                     //메인릴레이1
    '00' +                                     //메인릴레이2
    '00' +                                     //존번호
    SetLength(aLocate, 16) +                   //위치명
    FillZeroNumber(aDetectTime, 2) +           //감지시간
    '00';                                      //사용안함

  bPortCheck:=False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bPortCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// 포트 설정 응답
procedure TForm_Main.RcvPort(aData: string);
var
  st: string;
  aIndex: Integer;
  aWatchCode: Integer;
  aWatchStr: string;
  aDelayTime: string;
  aDetectTime: string;
  aLocate: string;
  stECUID: string;
begin
//         1         2         3         4         5         6
//1234567890123456789012345678901234567890123456789012345678901234567890123
//073 K1100000100idLP08S831001111111101011111111100                0400FD

  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 20, 2);
  stECUID := copy(aData,14,2);
  aIndex := StrToInt(st);

  //감시형태
  aWatchCode := StrToInt(aData[24]);
  //지연시간
  aDelayTime := aData[27];
  //감지시간
  aDetecttime := Copy(aData, 66, 4);
  //위치명
  aLocate := Copy(aData, 50, 16);


  //감시형태
  case aWatchCode of
    0: aWatchStr := '0.방범';
    1: aWatchStr := '1.화재';
    2: aWatchStr := '2.가스';
    3: aWatchStr := '3.비상';
    4: aWatchStr := '4.설비';
    else aWatchStr := '0.방범';
  end;

  //포트번호
  sgPort.Cells[0, aIndex] := IntToStr(aIndex);

  //감시형태
  sgPort.Cells[1, aIndex] := aWatchStr;
  UpdatePortType(stECUID,aWatchStr,aIndex);

  //지연시간
  if aDelayTime = '0' then sgPort.Cells[2, aIndex] := '미사용'
  else sgPort.Cells[2, aIndex] := '사용';
  //sgPort.Cells[2, aIndex] := aDelayTime;
  UpdatePortDelay(stECUID,sgPort.Cells[2, aIndex],aIndex);

  //감지시간
  sgPort.Cells[3, aIndex] := inttostr(strtoint(aDetecttime));
  UpdatePortSense(stECUID,sgPort.Cells[3, aIndex],aIndex);

  //위치명
  sgPort.Cells[4, aIndex] := trim(aLocate);
  UpdatePortName(stECUID,trim(aLocate),aIndex);

  sgPort.Color := clYellow;
  bPortCheck := True;
end;


//시간동기화
function TForm_Main.TimeSync(aDeviceID: string): Boolean;
var
  aTimeStr: string;
  aData: string;
begin
  Result := false;
  aTimeStr := FormatDateTime('yyyymmddhhnnss', Now);
  aData := 'TM00' +   // COMMAND
    aTimeStr;         // 시간데이터
  SendPacket(aDeviceID, 'R', aData, True);
  Result := true;
end;

//버젼확인
function TForm_Main.CheckVersion(aDeviceID: string): Boolean;
var
  aData: string;
  nTime: integer;
begin
  Result := false;
  aData := 'VR00';
  bVERCheck := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  While Not bVERCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime then exit;
    Application.ProcessMessages;
    sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//리더기버젼 확인
function TForm_Main.CheckReaderVersion(aDeviceID: string; aNo: Integer): Boolean;
var
  aReaderNoStr: string;
  aData: string;
begin
  Result := false;
  aReaderNoStr := FillZeroNumber(aNo, 2);
  aData := 'CV' +          // COMMAND
    aReaderNoStr;          // Reader No
  SendPacket(aDeviceID, 'R', aData, false);
  Result := true;
end;

//기기리셋
function TForm_Main.ResetDevice(aDeviceID: string): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'RS00Reset';
  SendPacket(aDeviceID, 'R', aData, false);
  Result := true;
end;

//기기 메모리삭제
function TForm_Main.ClearRegister(aDeviceID: string): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'ac00Register Clear';
  SendPacket(aDeviceID, 'I', aData, false);
  Result := true;
end;

// 알람 모드 변경
function TForm_Main.ChangeAlarmMode(aDeviceID: string; aMode: Char;aQuick:Boolean): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'MC' +         //COMMAND
    '00' +                //ZONE 고정
    aMode;                //A:경계, D:해제, P:순회
  SendPacket(aDeviceID, 'R', aData, aQuick);
  Result := true;
end;

// 문제어
function TForm_Main.DoorControl(aDeviceID: string;  //기기번호
  aNo,               // 문번호
  aControlType,      //제어방식
  aControl: Integer  //제어 커맨드
  ): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'C' + '0' +                                    //정상/비정상 여부
    IntToStr(aNo) +                          //기기내 문번호
    '0' +                                    //고정
    IntToStr(aControlType) +                    //'0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
    IntToStr(aControl);                        // 카드운영:Positive:'0',Negative:'1'
  // 출입운영:'0':운영 ,'1':개방
  // 원격제어:'0':시정,'1':해정
  SendPacket(aDeviceID, 'c', aData, True);
  Result := true;
end;

procedure TForm_Main.ComboBox_ECUChange(Sender: TObject);
var
  stECUNO:string;
begin
  stECUNO := copy(ComboBox_ECU.Text,1,2);
  DeviceTableShow(stECUNO);
  // ECU가 변경 되면 통신버퍼를 Clear한다.
  if Not bConnected then Exit;
  if ReserveSendDataList.Count > 0 then ReserveSendDataList.Clear;
  CommPort.FlushOutBuffer;
  CommPort.FlushInBuffer;
end;

procedure TForm_Main.FormDestroy(Sender: TObject);
begin
  ReserveSendDataList.Free;
end;

procedure TForm_Main.AccessDataProcess(aData:String);
var
  DeviceID: String;
  st: string;
  msgCode: Char;
  accData: String;
begin

  // STX ~ 21's Byte :Header
  //040 K1123456700i1IFN00제론시스템      61

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  DeviceID:= Copy(aData,8,9);



  accData:= Copy(aData,19,Length(aData)-20); //출입통제 위한 실제 데이터
  msgCode:= accData[1];

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aData,20,2)+'  '+'a';
    SendPacket(DeviceID, 'c', st, true);
  end;

  {출입통제 데이터 처리}
//0460K1100000400c2a51  005000000010000000009E
  case msgcode of
     //'F': RcvTelEventData(accData);
    'E': RcvAccEventData(DeviceID,accData);
    'D': RcvDoorEventData(accData);
    'a': RcvSysinfo2(DeviceID,accData);        //기기 등록 응답
    'b': RcvSysinfo2(DeviceID,accData);        //기기 조회 응답
    'c': RcvAccControl(accData);      //기기 제어 응답
'l','n','m': RcvCardRegAck(accData,DeviceID);  //카드등록응답
's','p': RcvSch(accData);             // 스케줄 응답
//    'v': RcvFoodTime(accData);        //식사시간응답
  end;

  {
  제어내용             PC  <-> COntroller
  ====================================
  출입이벤트            #$90 <-> #$31
  DOOR 이벤트           #$90 <-> #32

  제어                  #$31 <-> #$41

  시스템정보 등록       #$50 <-> #$60
  시스템저보 조회       #$51 <-> #$61
  카드데이터 등록       #$52 <-> #$62
  카드데이터 조회       #$53 <-> #$63
  스케줄데이터 등록     #$56 <-> #$66
  스케줄데이터 조회     #$57 <-> #$67
  특정일데이터 등록     #$58 <-> #$68
  특정일데이터 조희     #$59 <-> #$69
  카드데이터(개별)등록  #$70 <-> #$80
  카드데이터(개별)조회  #$71 <-> #$81
  카드데이터(개별)삭제  #$72 <-> #$82
  ACK 전송              #$90
  }

end;

procedure TForm_Main.RegDataProcess(aData:String);
var
  aDeviceCode: String;
  I: Integer;
  aRegCode: cString;
  aRegGubun : string;
begin


  aRegCode:= Copy(aData,19,2);
  aRegGubun := Copy(aData,21,2);
  //40 K1123456700i1IF00제론시스템      61

  if aRegCode = 'ID' then
  begin
    RcvDeviceID(aData);
  end else if aRegCode = 'CD' then
  begin
    RcvCardReader(aData);
  end else if aRegCode = 'SY' then
  begin
    RcvSysinfo(aData);
  end else if aRegCode = 'RY' then
  begin
    //RcvRelay(aData)
  end else if aRegCode = 'LP' then
  begin
    RcvPort(aData)
  end else if aRegCode = 'AD' then
  begin
    RcvUsedAlarmdisplay(aData)
  end else if aRegCode = 'EX' then
  begin
    RcvUsedDevice(aData)
  end else if aRegCode = 'TN' then
  begin
    RcvLinkusTelNo(aData);
  end else if aRegCode = 'CT' then
  begin
    //RcvCallTime(aData);
  end else if aRegCode = 'BT' then
  begin
    //RcvbroadcastTime(aData);
  end else if aRegCode = 'DI' then
  begin
    //RcvDialInfo(aData);
  end else if aRegCode = 'NW' then
  begin
    if aRegGubun = '00' then
      RcvWiznetInfo(aData)
    else if aRegGubun = '01' then
      RcvImgWiznetInfo(aData)
    else if aRegGubun = '02' then
      RcvAdminWiznetInfo(aData)
    else if aRegGubun = '10' then
      RcvLocalPcWiznetInfo(aData)
    else if aRegGubun = '50' then  //KTLan 설정
      RcvKTLAN(copy(aData,18,Length(aData)-17));
  end else if aRegCode = 'nw' then
  begin
    RcvImgWiznetInfo(aData);
  end else if aRegCode = 'Nw' then
  begin
    RcvAdminWiznetInfo(aData);
  end else if aRegCode = 'VC' then
  begin
    //RcvVoiceTime(aData);
  end else if aRegCode = 'Id' then
  begin
    RcvLinkusId(aData);
  end else if aRegCode = 'Tn' then
  begin
    RcvLinkusTelNo(aData);
  end else if aRegCode = 'Pt' then
  begin
    //RcvLinkusPt(aData);
  end else if aRegCode = 'Ct' then
  begin
    RcvCardType(aData);
  end else if aRegCode = 'Rc' then
  begin
    RcvRingCount(aData);
  end else if aRegCode = 'EL' then
  begin
    RcvSensorSet(aData);
  end else if aRegCode = 'el' then
  begin
    RcvSensorInfo(aData);
  end else if aRegCode = 'KT' then
  begin
    if aRegGubun = '97' then
      RcvKTConfig(aData)
    else if aRegGubun = '79' then
      RcvKTDevice(aData);
  end else if aRegCode = 'CM' then
  begin
    RcvCCTV(aData);
  end else
  begin
    if Copy(aData,20,2) = 'NW' then  //랜조회 등록
    begin
      RcvKTLAN(copy(aData,19,Length(aData)-18));
    end;
  end;
end;

procedure TForm_Main.RemoteDataProcess(aData:String);
var
  aCode: String;
  st: string;
  aIndex: Integer;
  aType:String;
  aRelayNo: Integer;
  i : integer;
  aComCheck : string;
begin
  //037 K1123456700r1TM00050107180637EF
  aCode:= Copy(aData,19,2);
  aComCheck:= Copy(aData,21,2);
  if aCode = 'TM' then
  begin
    //시간설정
    st :=  Copy(aData,23,4)+'-'+  //년
           Copy(aData,27,2)+'-'+  //월
           Copy(aData,29,2)+' '+  //일
           Copy(aData,31,2)+':'+  //시
           Copy(aData,33,2)+':'+  //분
           Copy(aData,35,2);      //초
    if bTimeShow then
    MessageDlg('EUC ID:'+ Copy(aData,15,2) + ' 시간설정'+#13
               +st, mtInformation, [mbOK], 0);


  end else if aCode = 'VR' then
  begin
    //기기 버젼확인
    bVERCheck := True;
    if bECUStatusCheck then exit;
    if bTotalComCheckShow then fmTotalComCheck.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-23)   //ECUID + Version;
    else if bDeviceComCheckShow then fmDeviceComChk.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-23)
    else lb_Version.Caption:= Copy(aData,23,Length(aData)-23);

  end else if aCode = 'CV' then
  begin
    // 카드리더 버젼
    bReaderVERCheck := True;
    if bTotalComCheckShow then fmTotalComCheck.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-25)
    else if bDeviceComCheckShow then fmDeviceComChk.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-25);   //ECUID + Version;
    //else lb_Version.Caption:= Copy(aData,23,Length(aData)-23);
    //
  end else if aCode = 'RS' then //Reset
  begin
    //Edit_Reset.Text:= Copy(aData,23,Length(aData)-23);
    MessageDlg('ECUID:' + copy(aData,15,2) + ' 리셋 되었습니다.', mtInformation, [mbOK], 0);

  end else if aCode = 'MC' then   //Change mode
  begin
    // 존번호: 현재는 전체 00만 존재함.
    {
    st:= Copy(aData,21,2);
    if isDigit(st) then
    begin
      aIndex:=  StrtoInt(st);
      if aIndex >= ComboBox_Zone.Items.Count  then Exit;
      ComboBox_Zone.ItemIndex:= aIndex;
      ComboBox_Zone.Text:=ComboBox_Zone.Items[aIndex];
    end;
    }
    // 알람모드
    case aData[23] of
      'A': begin //경계모드
             Status_AlarmMode.ImageIndex:= 3;
             Status_AlarmMode.Caption:= '경계모드';
           end;
      'D': begin //해제모드
             Status_AlarmMode.ImageIndex:= 2;
             Status_AlarmMode.Caption:= '해제모드';
           end;
      'P': begin //순회모드
             Status_AlarmMode.ImageIndex:= 7;
             Status_AlarmMode.Caption:= '해제모드';
           end;
    end;

  end else if aCode = 'cs' then //통신상태체크
  begin
    if aComCheck = '00' then   bECUCommState := True
    else if aComCheck = '01' then bReaderCOMCheck := True
    else if aComCheck = '02' then bIndicatorCheck := True;
    if bTotalComCheckShow then fmTotalComCheck.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-25);

  end;
end;

procedure TForm_Main.lvECUChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if TRzListView(Sender).Items.Count < 1 then
  begin
    ToolButton_ECU.Enabled:= False;
    tb_Ecu.TabVisible := False;
  end
  else
  begin
    ToolButton_ECU.Enabled:= True;
    tb_Ecu.TabVisible := True;
  end;
end;

procedure TForm_Main.lvECUKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  aIndex: Integer;
begin
  if Key  = VK_DELETE then
  begin
    if lvECU.Selected <> nil then
    begin
      aIndex:= lvECU.Selected.Index;
      lvECU.Selected.Delete;
    end;
    if (aIndex <> 0 ) and (aIndex >= lvECU.Items.Count) then lvECU.Items[aIndex-1].Selected:= True
    else if aIndex > 0 then lvECU.Items[aIndex].Selected:= True;

    if aIndex = 0 then
    begin
      ToolButton_ECU.Enabled:= False;
      tb_Ecu.TabVisible := False;

    end;
  end;

end;

// 출입카드 이벤트
procedure TForm_Main.RcvAccEventData(aDevice,aData:String);
var
  st: String;
  StatusStr: String;
  aCardNo: String;
  bCardNo: String;
  DeviceID: String;
  NoStr: String;
  i : Integer;
  aDoorNo: Char;
  DoorState: Char;
  DoorMode: Char;
  DoorMode2: Char;
  aImageIndex: Integer;
  stSql : string;
begin



  aDoorNo:=   aData[3];
  DoorState:= aData[22];    //문상태
  DoorMode:=  aData[19];    //운영/개방
  DoorMode2:= aData[18];    //Posi/Nega


   st:= Copy(aData,6,2)+'-'+
       Copy(aData,8,2)+'-'+
       Copy(aData,10,2)+' '+
       Copy(aData,12,2)+':'+
       Copy(aData,14,2)+':'+
       Copy(aData,16,2)+';';
  {2.카드번호/출입번호}

  //aCardNo:= copy(aData,24,8);
  aCardNo:= copy(aData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
  //bCardNo:= Hex2Dec64(aCardNo);
  //st:= st + FillZeroNumber2(bCardNo,10);

  bCardNo:= DecodeCardNo(aCardNo);
  st:= st+ bCardNo +';';//+ '000000';
   {3.확장기번호}
   st:= st + Copy(aDevice,8,2)+';';
  {4.문번호}
  st:= st + aData[3]+';';

  {5.Posi/Nega}
  case aData[18] of
    '0': st:=st + 'Positive;';
    '1': st:= st + 'Negative;';
    else   st:= st+ aData[18];
  end;
  {6.운영모드}
  case aData[19] of
    '0': st:= st+'운영모드;';
    '1': st:= st+'개방모드;';
    else   st:= st+aData[19];
  end;
  {7.변경사유}
  case aData[20] of
    'C': st:= st + '카드;';
    'P': st:= st + '전화;';
    'R': st:= st + '원격제어;';
    'B': st:= st + '버튼;';
    'S': st:= st + '스케쥴;';
    else st:= st + aData[20];
  end;
  {8.출입승인결과}
  case aData[21]of
    #$30: st:= st + '0;';
    #$31: st:= st + '출입승인;';
    #$32: st:= st + '출입승인(*);';
    #$41: st:= st + '미등록카드;';
    #$42: st:= st + '출입불가;';
    #$43: st:= st + '미등록카드(*);';
    #$44: st:= st + '경계모드출입불가;';
    #$45: st:= st + '출입제한시간;';
    #$46: st:= st + '유효기간만료;';
    else st:= st + aData[21]+';';
  end;
  {9.출입문 상태}
  case aData[22]of
    'C': st:= st +'닫힘;';
    'O': st:= st +'열림;';
    else st:= st +aData[22];
  end;

  //st:= st + DecodeCardNo(aCardNo);
  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;

  if aDoorNo = '1' then
  begin
    Status_Door1.Caption:= StatusStr;
    Status_Door1.ImageIndex:= aImageIndex;
  end else
  begin
    Status_Door2.Caption:= StatusStr;
    Status_Door2.ImageIndex:= aImageIndex;
  end;

  if Status_CardEvent.Font.Color = clBlue then Status_CardEvent.Font.Color := clBlack
  else                                         Status_CardEvent.Font.Color := clBlue;
  Status_CardEvent.Caption:= st;

   if bRegCardShow then   //카드등록 화면이 활성화 되어 있으면 AutoDown 실행
   begin
      Form_RegCard.LMDListBox1.Items.Add(st);
      for i := 0 to Form_RegCard.LMDListBox1.Count-1 do
      begin
         if Form_RegCard.LMDListBox1.Selected[i] then Form_RegCard.LMDListBox1.Selected[i]:= False;
      end;
      Form_RegCard.LMDListBox1.Selected[Form_RegCard.LMDListBox1.Count-1]:= True;
      inc(CountCardReadData);
      Form_RegCard.AutoCardDownLoad(bCardNo);
   end;
  {
  if cbAutoReg.Checked = True then
  begin
    DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    //메모장에 등록
    Append_Memo_CardNo(bCardNo);
    // 다운로드
    CD_DownLoad(DeviceID,bCardNo+'000000' ,'L');

  end;
   }




end;

//문상태 변경 데이터 처리
procedure TForm_Main.RcvDoorEventData(aData:String);
Var
  st: String;
  aDoorNo: String;
  aMsgNo: Char;
  aIndex  : Integer;
  DoorState: Char;
  DoorMode: Char;
  DoorMode2: Char;
  TimeStr: String;
  aTime: String;
  aImageIndex: Integer;
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  aDoorNo:=   aData[3];
  DoorState:= aData[22];    //문상태
  DoorMode:=  aData[19];    //운영/개방
  DoorMode2:= aData[18];    //Posi/Nega
  aTime:=     Copy(aData,6,12);

  if DoorMode2 <> '1' then //Positive
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[운영P]';
      '1':st:= aDoorNo+'[개방P]';
    end;
  end else                //Negative
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[운영N]';
      '1':st:= aDoorNo+'[개방N]';
    end;
  end;


  case DoorState of
    'C': //닫힘
      begin
        aImageIndex:=0;
      end;
    'O': //열림
      begin
        aImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[장시간열림]';
      end;
    'U'://해정이상
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[해정이상]';
      end;
    'L'://시정이상
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[시정이상]';
      end;
  end;

  if aDoorNo = '1' then
  begin
    Status_Door1.Caption:= st;
    Status_Door1.ImageIndex:= aImageIndex;
  end else
  begin
    Status_Door2.Caption:= st;
    Status_Door2.ImageIndex:= aImageIndex;
  end;
end;

//출입통제 기기등록 응답 처리
procedure TForm_Main.RcvSysinfo2(DeviceID,aData: String);
var
  aNo: Integer;
  aDoorNo: Integer;
  aCardMode: Integer;
  aDoorMode: Integer;
  aDoorOPen: Char;
  aOpenMoni: Char;
  UseSch:    Integer;
  SendDoorStatus: Integer;
  AlarmLongOpen: Integer;
  LockType: Integer;
  ControlFire: Integer;
  StatusStr: String;
  stECUID : string;
  stComcheck: string;
begin
//         1         2
//123456789012345678901234567
//a11  0040000000100000000095
  stECUID := copy(DeviceID,8,2);
  stComcheck := stECUID;

  bSysInfo2Check := True;
  {기기 문번호}
  if aData[3] >= #$30 then
  begin
    aDoorNo:= StrtoInt(aData[3]);
  end;
  stComcheck := stComcheck + aData[3] ;

  {카드운영모드}
  if aData[6] >= #$30 then
  begin
    aCardMode:= StrtoInt(aData[6]);
  end;
  if aCardMode = 0 then stComcheck := stComcheck + '카드모드:Positive'
  else stComcheck := stComcheck + '카드모드:Negative' ;

  {출입문 운영모드}
  if aData[7] >= #$30 then
  begin
    aDoorMode:= StrtoInt(aData[7]);
  end;
  if aDoorMode = 0 then stComcheck := stComcheck + '/운영모드:운영'
  else stComcheck := stComcheck + '/운영모드:개방' ;
  if bTotalComCheckShow then
  begin
    fmTotalComCheck.stMessage := stComCheck;
    exit;
  end else if bDeviceComCheckShow then
  begin
    fmDeviceComChk.stMessage := stComCheck;
    exit;
  end;

  {DOOR제어시간}
  if aData[8] >= #$30 then
  begin
    aDoorOPen:= aData[8];
  end;

  {장시간 열림 경보}
  if aData[9] >= #$30 then
  begin
    aOpenMoni:= aData[9];
  end;
  {스케줄 적용 여부}
  if aData[10] >= #$30 then
  begin
   UseSch:= StrtoInt(aData[10]);
  end;
  {출입문 상태 전송}
  if aData[11] >= #$30 then
  begin
    SendDoorStatus:= StrtoInt(aData[11]);
  end;
  {통신 이상시 기기운영 }
  if aData[12] >= #$30 then
  begin
    // 현재 사용안함
  end;
  {Antipassback}
  if aData[13] >= #$30 then
  begin
    //현재 사용 안함
  end;
  {장시간 열림 부저 출력}
  if aData[14] >= #$30 then
  begin
    AlarmLongOpen:= StrtoInt(aData[14]);
  end;
  {통신 이상시 부저 출력}
  if aData[15] >= #$30 then
  begin
    //현재 사용 안함
  end;
  {전기정 타입}
  if aData[16] >= #$30 then
  begin
    LockType:= StrtoInt(aData[16]);
  end;
  {화재 발생시 문제어}
  if aData[17] >= #$30 then
  begin
   ControlFire:= StrtoInt(aData[17]);
  end;

  case aDoorNo of
    1:begin
        ComboBox_CardModeType1.ItemIndex:=     aCardMode;
        UpdateCardType1(stECUID,inttostr(aCardMode));
        ComboBox_CardModeType1.Color := clYellow;

        ComboBox_DoorModeType1.ItemIndex:=     aDoorMode;
        UpdateDoorModeType1(stECUID,inttostr(aDoorMode));
        ComboBox_DoorModeType1.Color := clYellow;
        
        SpinEdit_DoorOPen1.IntValue:=          Ord(aDoorOPen) - $30;
        UpdateDoorOpen1(stECUID,inttostr(SpinEdit_DoorOPen1.IntValue));
        SpinEdit_DoorOPen1.Color := clYellow;

        SpinEdit_OpenMoni1.IntValue:=          Ord(aOpenMoni) - $30;
        UpdateOpenMoni1(stECUID,inttostr(SpinEdit_OpenMoni1.IntValue));
        SpinEdit_OpenMoni1.Color := clYellow;

        ComboBox_UseSch1.ItemIndex:=           UseSch;
        UpdateUseSch1(stECUID,inttostr(UseSch));
        ComboBox_UseSch1.Color := clYellow;

        ComboBox_SendDoorStatus1.ItemIndex:=   SendDoorStatus;
        UpdateDoorStatus1(stECUID,inttostr(SendDoorStatus));
        ComboBox_SendDoorStatus1.Color := clYellow;

        ComboBox_AlarmLongOpen1.ItemIndex:=    AlarmLongOpen;
        UpdateAlarmLong1(stECUID,inttostr(AlarmLongOpen));
        ComboBox_AlarmLongOpen1.Color := clYellow;

        ComboBox_LockType1.ItemIndex:=         LockType;
        UpdateLockType1(stECUID,inttostr(LockType));
        ComboBox_LockType1.Color := clYellow;

        ComboBox_ControlFire1.ItemIndex:=      ControlFire;
        UpdateControlFire1(stECUID,inttostr(ControlFire));
        ComboBox_ControlFire1.Color := clYellow;
      end;
    2:begin
        ComboBox_CardModeType2.ItemIndex:=     aCardMode;
        UpdateCardType2(stECUID,inttostr(aCardMode));
        ComboBox_CardModeType2.Color := clYellow;

        ComboBox_DoorModeType2.ItemIndex:=     aDoorMode;
        UpdateDoorModeType2(stECUID,inttostr(aDoorMode));
        ComboBox_DoorModeType2.Color := clYellow;

        SpinEdit_DoorOPen2.IntValue:=          Ord(aDoorOPen) - $30;
        UpdateDoorOpen2(stECUID,inttostr(SpinEdit_DoorOPen2.IntValue));
        SpinEdit_DoorOPen2.Color := clYellow;
        
        SpinEdit_OpenMoni2.IntValue:=          Ord(aOpenMoni) - $30;
        UpdateOpenMoni2(stECUID,inttostr(SpinEdit_OpenMoni2.IntValue));
        SpinEdit_OpenMoni2.Color := clYellow;

        ComboBox_UseSch2.ItemIndex:=           UseSch;
        UpdateUseSch2(stECUID,inttostr(UseSch));
        ComboBox_UseSch2.Color := clYellow;

        ComboBox_SendDoorStatus2.ItemIndex:=   SendDoorStatus;
        UpdateDoorStatus2(stECUID,inttostr(SendDoorStatus));
        ComboBox_SendDoorStatus2.Color := clYellow;

        ComboBox_AlarmLongOpen2.ItemIndex:=    AlarmLongOpen;
        UpdateAlarmLong2(stECUID,inttostr(AlarmLongOpen));
        ComboBox_AlarmLongOpen2.Color := clYellow;

        ComboBox_LockType2.ItemIndex:=         LockType;
        UpdateLockType2(stECUID,inttostr(LockType));
        ComboBox_LockType2.Color := clYellow;

        ComboBox_ControlFire2.ItemIndex:=      ControlFire;
        UpdateControlFire2(stECUID,inttostr(ControlFire));
        ComboBox_ControlFire2.Color := clYellow;
      end;
  end;


  if aCardMode <> 1 then //Positive
  begin
    Case aDoorMode of
      0:begin
            StatusStr:= InttoStr(aDoorNo)+'[운영P]';
          end;

      1:begin
            StatusStr:= InttoStr(aDoorNo)+'[개방P]';
          end;
    end;
  end else                //Negative
  begin
    Case aDoorMode of
      0:begin
            StatusStr:= InttoStr(aDoorNo)+'[운영N]';
          end;
      1:begin
            StatusStr:= InttoStr(aDoorNo)+'[개방N]';
          end;
    end;
  end;

  if aDoorNo = 1 then
  begin
    Status_Door1.Caption:= StatusStr;
    Status_Door1.ImageIndex:= 0;
  end else
  begin
    Status_Door2.Caption:= StatusStr;
    Status_Door2.ImageIndex:= 0;
  end;


end;

// 기기 제어 응답
procedure TForm_Main.RcvAccControl(aData: String);
Var
  st: String;
  aDoorNo: String;
  aMsgNo: Char;
  aIndex  : Integer;
  DoorState: Char;
  DoorMode: Char;
  DoorMode2: Char;
  TimeStr: String;
  aTime: String;
  aImageIndex: Integer;
begin
  //0434K1123456700c6
  //19쨰 ~
  //D20000504161543370000O D3

  aDoorNo:=   aData[3];
  DoorState:= aData[8];    //문상태
  DoorMode:=  aData[7];    //운영/개방
  DoorMode2:= aData[6];    //Posi/Nega

  if DoorMode2 <> '1' then //Positive
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[운영P]';
      '1':st:= aDoorNo+'[개방P]';
    end;
  end else                //Negative
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[운영N]';
      '1':st:= aDoorNo+'[개방N]';
    end;
  end;


  case DoorState of
    'C': //닫힘
      begin
        aImageIndex:=0;
      end;
    'O': //열림
      begin
        aImageIndex:=1;
      end;
    'T'://장시간 열림
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[장시간열림]';
      end;
    'U'://해정이상
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[해정이상]';
      end;
    'L'://시정이상
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[시정이상]';
      end;
  end;

  if aDoorNo = '1' then
  begin
    Status_Door1.Caption:= st;
    Status_Door1.ImageIndex:= aImageIndex;
  end else
  begin
    Status_Door2.Caption:= st;
    Status_Door2.ImageIndex:= aImageIndex;
  end;
end;

// 카드등록 응답
procedure TForm_Main.RcvCardRegAck(aData,aDeviceID: String);
var
  st: string;
  aMsg: String;
  aCardNo: string;
  LinkusNo: String;
begin

  //if Copy(aData,7,10) <> '0000000000' then Exit;

  case aData[1] of
    'l':aMsg:='[등록]';
    'm':aMsg:='[조회]';
    'n':aMsg:='[삭제]';
  end;
  aCardNo:= Copy(aData,9,8);
  aMsg := aMsg + aDeviceID + ':';  //등록 기기번호 출력

  aMsg:= aMsg + DeCodeCardNo(aCardNo)+ ':';
  aMsg:= aMsg + Copy(aData,17,6)+':';

  LinkusNo:= Copy(aData,4,3);
  aMsg:= aMsg + Hex2DecStr(LinkusNo)+':';

  case aData[23] of
    '0': aMsg:= aMsg +'미사용'+':';
    '1': aMsg:= aMsg +'미등록'+':';
    '2': aMsg:= aMsg +'  등록'+':';
  end;

  case aData[24] of
    '0': aMsg:= aMsg +'출입';
    '1': aMsg:= aMsg +'방범';
    '2': aMsg:= aMsg +'출입방범';
  end;

   if bRegCardShow then   //카드등록 화면이 활성화 되어 있으면 등록결과 조회
   begin
      Form_RegCard.Memo2.Lines.Add(aMsg);
   end;


end;

//스케줄 등록 응답
Procedure TForm_Main.RcvSch(aData: String);
var
  aCode: Integer;
begin
  //여기에서 스케줄 조회 하자....
  if Not bDoorSchRegShow then Exit; //스케줄조회 화면이 떠 있지 않으면 무시하자...
  DoorscheduleRegForm.LoadSchadule(aData);
end;

//전송 Timer
procedure TForm_Main.SendTimerTimer(Sender: TObject);
begin
  if CommPort.Open then ExecSendPacket;

end;

// 조회명령 ====================================================================
procedure TForm_Main.MENU_CHKMCUClick(Sender: TObject);
var
  bResult : Boolean;
  nLoop : integer;
begin
///
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckID;
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKMCU 통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

procedure TForm_Main.MENU_CHKECUClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin

  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckUsedDevice(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKECU 통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKDISALARMClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckUsedAlarmDisplay(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKDISALARM 통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKKTTIDClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckLinkusID(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKKTTID통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKDECODERNOClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckLinksTellNo(aDeviceID,0);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKDECODERNO통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKTELLCOUNTClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckRingCount(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKTELLCOUNT통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKLANClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckWiznet(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKLAN통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKSYSClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckSysInfo(aDeviceID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKSYS통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;


procedure TForm_Main.MENU_CHKSYS2Click(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckSysInfo2(aDeviceID,1);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKSYS2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckSysInfo2(aDeviceID,2);
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKSYS2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKREADERClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,1);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER1통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,2);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,3);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER3통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,4);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER4통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,5);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER5통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,6);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER6통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,7);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER7통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckCardReader(aDeviceID,8);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKREADER8통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

procedure TForm_Main.MENU_CHKPORTClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,1);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT1통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,2);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,3);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT3통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,4);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT4통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,5);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT5통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,6);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT6통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,7);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT7통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckPort(aDeviceID,8);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('CHKPORT8통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;
// =============================================================================

// 등록 메뉴 ===================================================================
//ID등록
procedure TForm_Main.MENU_REGMCUIDClick(Sender: TObject);
var
  aMCUID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aMCUID:= GetMcuID;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegID(aMCUID);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGMCUID통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//ECU등록
procedure TForm_Main.MENU_REGECUClick(Sender: TObject);
var
  aDeviceID: String;
  xECU: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  xECU:= GetECU;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegUsedDevice(aDeviceID,xECU);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGECU통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//알람표시기 등록
procedure TForm_Main.MENU_REGDISALARMClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegUsedAlarmDisplay(aDeviceID,GetAlarmDisplay);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGDISALARM통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//관제ID 등록
procedure TForm_Main.MENU_KTTIDClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  if Edit_LinkusID.Text = '' then Edit_LinkusID.Text := '43690';

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegLinkusID(aDeviceID,Edit_LinkusID.Text);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('KTTID통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//데코더 번호 등록
procedure TForm_Main.MENU_REGDECODERNOClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegLinksTellNo(aDeviceID,0,Edit_LinkusTel.Text);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  {if not bResult then
  begin
    IsStop := True;
    showmessage('REGDECODERNO통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end; }
end;

//텔카운트 등록
procedure TForm_Main.MENU_REGTELLCOUNTClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegRingCount(aDeviceID,Spinner_Ring.Value);
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGTELLCOUNT통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//랜정보 설정
procedure TForm_Main.MENU_REGLANClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
  aMode : string;
begin

  aDeviceID:= GetDeviceID;
 
  if Edit_IP.Text = '' then       Edit_IP.Text :=       '127.0.0.1';
  if Edit_subnet.Text = '' then   Edit_subnet.Text :=   '255.255.255.0';
  if edit_Gateway.Text = '' then  Edit_Gateway.Text :=  '192.168.10.1';
  if ed_Server.Text = '' then    ed_Server.Text := '192.168.10.1';
  if edit_port.Text = '' then     Edit_port.Text :=     '3000';
  if ed_Serverport.Text = ''  then ed_serverport.Text := '3000';
  if rg_mode.ItemIndex = 0 then aMode := '02'
  else aMode := '00';

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Writewiznet(aDeviceID,Edit_IP.Text,Edit_subnet.Text,edit_Gateway.Text,edit_port.Text,ed_Server.text,ed_ServerPort.Text,aMode,'00');
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGLAN통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;

end;

// 시스템 정보 등록
procedure TForm_Main.MENU_REGSYSClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo(aDeviceID,                           // 기기번호
             ComboBox_WatchPowerOff.ItemIndex,    // 정전감시
             SpinEdit_InDelay.IntValue,           // 입실지연시간
             SpinEdit_OutDelay.IntValue,          // 퇴실지연시간
             ComboBox_DoorType1.ItemIndex,        // Door1용도(0:방범,1:출입.2:방범+출입)
             ComboBox_DoorType2.ItemIndex,        //Door2용도(0:방범,1:출입.2:방범+출입)
             Edit_Locate.Text);                   // 위치명
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;


//출입통제 등록
procedure TForm_Main.MENU_REGSYS2Click(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  //출입문1
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo2(aDeviceID,                             // 기기번호
              1,                                     // 문번호
              ComboBox_CardModeType1.ItemIndex,      // 카드 운영모드 (0:Positive, 1:Negative)
              ComboBox_DoorModeType1.ItemIndex,      // 출입문 운영모드 (0:운영, 1:개방)
              SpinEdit_DoorOPen1.IntValue,           // Door 제어시간
              SpinEdit_OpenMoni1.IntValue,           // 장시간 열림 경보
              ComboBox_UseSch1.ItemIndex,            // 스케줄 적용 여부 (0:사용안함, 1:사용)
              ComboBox_SendDoorStatus1.ItemIndex,    // 출입문 상태 전송(0:사용안함, 1:사용)
              ComboBox_AlarmLongOpen1.ItemIndex,     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
              ComboBox_LockType1.ItemIndex,          // 전기정 타입
              ComboBox_ControlFire1.ItemIndex);      // 화재 발생시 문제어
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  //출입문2
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo2(aDeviceID,                             // 기기번호
              2,                                     // 문번호
              ComboBox_CardModeType2.ItemIndex,      // 카드 운영모드 (0:Positive, 1:Negative)
              ComboBox_DoorModeType2.ItemIndex,      // 출입문 운영모드 (0:운영, 1:개방)
              SpinEdit_DoorOPen2.IntValue,           // Door 제어시간
              SpinEdit_OpenMoni2.IntValue,           // 장시간 열림 경보
              ComboBox_UseSch2.ItemIndex,            // 스케줄 적용 여부 (0:사용안함, 1:사용)
              ComboBox_SendDoorStatus2.ItemIndex,    // 출입문 상태 전송(0:사용안함, 1:사용)
              ComboBox_AlarmLongOpen2.ItemIndex,     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
              ComboBox_LockType2.ItemIndex,          // 전기정 타입
              ComboBox_ControlFire2.ItemIndex);      // 화재 발생시 문제어
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS2통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

//카드리더 등록
procedure TForm_Main.MENU_REGREADERClick(Sender: TObject);
var
  I: Integer;
  aDeviceID: String;
  aUsed: Integer;
  aDoorNo: Integer;
  aLocate:String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  for I:= 1 to 8 do
  begin
    if sgCardReader.Cells[1, I] = '미사용' then  aUsed:= 0
    else aUsed:= 1;
//    aUsed:=   StrtoInt(sgCardReader.Cells[1, I]);
    aDoorNo:= StrtoInt(sgCardReader.Cells[2, I]);
//    aLocate:= sgCardReader.Cells[3, I];

    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegCardReader(aDeviceID,  // 기기번호
                  I,          // 카드리더 번호
                  aUsed,      //  사용여부
                  aDoorNo,    // 연결 문번호
                  aLocate);   // 위치명
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('REGREADER통신응답이 없습니다.동작모드를 확인하여 주세요.');
      Panel1.Visible := False;
      btnRefresh.Enabled := True;
      btnReg.Enabled := True;
      Exit;
    end;

  end;

end;



procedure TForm_Main.MENU_REGPORTClick(Sender: TObject);
var
  I: Integer;
  st: String;
  aDeviceID:    String;
  aAlarmType:   Integer;         // 감시형태
  aUseDelay:    Integer;         // 지연시간
  aDetectTime:  Integer;         // 감지시간
  aLocate:      string;          // 위치명
  bResult : Boolean;
  nLoop : integer;

begin
  aDeviceID:= GetDeviceID;
  for I:= 1 to 8 do
  begin
    st:= sgPort.Cells[1, I];
    aAlarmType:=  Ord(st[1]) - $30;
    if sgPort.Cells[2, I] = '미사용' then  aUseDelay:= 0
    else aUseDelay:= 1;
    //aUseDelay:=   StrtoInt(sgPort.Cells[2, I]);
    aDetectTime:= StrtoInt(sgPort.Cells[3, I]);
    aDetectTime := aDetectTime div 100;
    aLocate:=     sgPort.Cells[4, I];
    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegPort(aDeviceID,       // 기기번호
              I,               // 포트번호
              aAlarmType,      // 감시형태
              aUseDelay,       // 지연시간
              aDetectTime,     // 감지시간
              aLocate);        // 위치명
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('REGPORT통신응답이 없습니다.동작모드를 확인하여 주세요.');
      Panel1.Visible := False;
      btnRefresh.Enabled := True;
      btnReg.Enabled := True;
      Exit;
    end;
  end;

end;

{전체조회}
procedure TForm_Main.btnRefreshClick(Sender: TObject);
begin
  IsStop := False;
  bSearch := True;
  ControlInit;
  bConnected := True;
  Panel1.Visible := True;
  btnReg.Enabled := False;
  btnRefresh.Enabled := False;
  MENU_VersionClick(Self);
  if IsStop then Exit;
  Panel1.Caption := '메인 환경 조회중입니다.';
  if IsConfigMCU then MENU_CHKMCUClick(Self);
  if Not bConnected then
  begin
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Panel1.Visible := False;
    Exit;
  end;
  if IsStop then Exit;
  Panel1.Caption := 'MCU정보 체크중입니다.';
  if IsConfigMCU then MENU_CHKECUClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then ECUStatusCheck;
  if IsStop then Exit;
  if IsConfigMCU then MENU_CHKDISALARMClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then MENU_CHKKTTIDClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then MENU_CHKDECODERNOClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then MENU_CHKTELLCOUNTClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then btnKTLanSearchClick(Self);
//  if IsConfigMCU then MENU_CHKLANClick(Self);
//  if IsConfigMCU then btn_AdminSearchClick(Self);
//  if IsConfigMCU then btn_ImageSearchClick(Self);
//  if IsConfigMCU then btn_LanSearchClick(Self);
  if IsStop then Exit;
  if IsConfigMCU then btn_CCTVSearchClick(Self);
  if IsStop then Exit;
  if Not bConnected then
  begin
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Panel1.Visible := False;
    Exit;
  end;
  bErrorCheck := False;
  Panel1.Caption := '시스템 정보등록 체크중입니다.';
  if Not IsConfigMCU then MENU_CHKSYSClick(Self);
  if bErrorCheck then
  begin
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Panel1.Visible := False;
    Showmessage(ErrorMessage + ' 통신 에러입니다.');
    exit;
  end;
  if IsStop then Exit;
  //MENU_CHKSYSClick(Self);
  Panel1.Caption := '출입통제등록 체크중입니다.';
  if Not IsConfigMCU then MENU_CHKSYS2Click(Self);
  if IsStop then Exit;
  Panel1.Caption := '카드리더등록 체크중입니다.';
  //CardTypeSearch;
  if Not IsConfigMCU then MENU_CHKREADERClick(Self);
  if IsStop then Exit;
  Panel1.Caption := '포트설정 체크중입니다.';
  if Not IsConfigMCU then MENU_CHKPORTClick(Self);
  if IsStop then Exit;
  Panel1.Visible := False;
  btnReg.Enabled := True;
  btnRefresh.Enabled := True;

end;

{전체등록}
procedure TForm_Main.btnRegClick(Sender: TObject);
var
  aDeviceID :string;
  nTime : integer;
begin
  IsStop := False;
  ControlInit;

{  if GetMcuID = '0000000' then
  begin
    MessageDlg('MCU ID를 입력 하세요', mtWarning, [mbOK], 0);
    Exit;
  end;    }

  if IsConfigMCU then  aDeviceID := GetMcuID + '00'
  else aDeviceID := GetMcuID + copy(ComboBox_ECU.Text,1,2);

  if cb_CardType.ItemIndex = 0 then
  begin
    cb_CardType.ItemIndex := 1;
//    showmessage('카드리더 타입을 선택하셔야 합니다.');
//    Panel1.Visible := False;
//    cb_CardType.SetFocus;
//    Exit;
  end;

  bConnected := True;
//  ChangeAlarmMode(aDeviceID,'D',True);//무조건 경계해제모드로 변경 후 등록하자.
  if IsStop then Exit;
  Panel1.Visible := True;
  Panel1.Caption := '메인 환경 등록중입니다.';
  btnReg.Enabled := False;
  btnRefresh.Enabled := False;
  if IsConfigMCU then MENU_REGMCUIDClick(Self);         //ID등록
  if Not bConnected then Exit;
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGECUClick(Self);           //ECU등록
  if IsStop then Exit;
  if IsConfigMCU then ECUStatusCheck;
  if IsConfigMCU then MENU_REGDISALARMClick(Self);      //알람표시기 등록
  if IsStop then Exit;
  if IsConfigMCU then MENU_KTTIDClick(Self);            //관제 시스템ID 등록
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGDECODERNOClick(Self);     //데코더 번호 등록
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGTELLCOUNTClick(Self);     //텔카운트 등록
  if IsStop then Exit;
  if IsConfigMCU then btnKTLanSetClick(self);
//  if IsConfigMCU then MENU_REGLANClick(Self);           //랜정보 등록
//  if IsConfigMCU then btn_adminsetClick(self);
//  if IsConfigMCU then btn_ImageLanClick(self);
  if IsStop then Exit;
  if IsConfigMCU then btn_CCTVSetClick(self);
  if IsStop then Exit;


  if Not IsConfigMCU then
  begin
    ChangeAlarmMode(aDeviceID,'D',True);//무조건 경계해제모드로 변경 후 등록하자.
    nTime := 0; //1초 정도 대기 하자
    while True do
    begin
      if nTime > 1000 Then Break; //1초 대기
      Application.ProcessMessages;
      Sleep(1);
      nTime := nTime + 1;
    end;

  end;
  Panel1.Caption := '시스템 정보 등록중입니다.';
  bErrorCheck := False;
  if Not IsConfigMCU then MENU_REGSYSClick(Self);           //시스템 정보 등록
  if bErrorCheck then
  begin
    Panel1.Visible := False;
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Showmessage(ErrorMessage + ' 통신 에러입니다.');
    exit;
  end;
  if IsStop then Exit;

  Panel1.Caption := '출입통제 등록중입니다.';
  if Not IsConfigMCU then MENU_REGSYS2Click(Self);          //출입통제 등록
  if IsStop then Exit;
  Panel1.Caption := '카드리더 등록중입니다.';
  //CardTypeReg;
  if Not IsConfigMCU then MENU_REGREADERClick(Self);        //카드리더 등록
  if IsStop then Exit;
  Panel1.Caption := '포트정보 등록중입니다.';
  if Not IsConfigMCU then MENU_REGPORTClick(Self);           //포트정보등록
  if IsStop then Exit;
  Panel1.Visible := False;
  btnReg.Enabled := True;
  btnRefresh.Enabled := True;


end;


procedure TForm_Main.ControlInit;
begin
  lvECU.Color := clWhite;
  Edit_LinkusID.Color := clWhite;
  Edit_LinkusTel.Color := clWhite;
  Spinner_Ring.Color := clWhite;
  Edit_IP.Color := clWhite;
  Edit_subnet.Color := clWhite;
  edit_Gateway.Color := clWhite;
  edit_port.Color := clWhite;
  ed_Server.Color := clWhite;
  ed_serverport.Color := clWhite;
  ComboBox_ECU.Color := clWhite;
  ComboBox_WatchPowerOff.Color := clWhite;
  SpinEdit_OutDelay.Color := clWhite;
  SpinEdit_InDelay.Color := clWhite;
  ComboBox_DoorType1.Color := clWhite;
  ComboBox_DoorType2.Color := clWhite;
  Edit_Locate.Color := clWhite;
  Edit_Locate.Text := '';
  ComboBox_CardModeType1.Color := clWhite;
  ComboBox_DoorModeType1.Color := clWhite;
  SpinEdit_DoorOPen1.Color := clWhite;
  SpinEdit_OpenMoni1.Color := clWhite;
  ComboBox_UseSch1.Color := clWhite;
  ComboBox_SendDoorStatus1.Color := clWhite;
  ComboBox_AlarmLongOpen1.Color := clWhite;
  ComboBox_LockType1.Color := clWhite;
  ComboBox_ControlFire1.Color := clWhite;

  ComboBox_CardModeType2.Color := clWhite;
  ComboBox_DoorModeType2.Color := clWhite;
  SpinEdit_DoorOPen2.Color := clWhite;
  SpinEdit_OpenMoni2.Color := clWhite;
  ComboBox_UseSch2.Color := clWhite;
  ComboBox_SendDoorStatus2.Color := clWhite;
  ComboBox_AlarmLongOpen2.Color := clWhite;
  ComboBox_LockType2.Color := clWhite;
  ComboBox_ControlFire2.Color := clWhite;
  cb_CardType.Color := clWhite;
  sgCardReader.Color := clWhite;
  sgPort.Color := clWhite;
//  MakeCardreaderInfo;
//  MakePortInfo;
end;



///////////////////////////////////////////////////////////////
///Device Table 관련된 함수
///////////////////////////////////////////////////////////////

function TForm_Main.InsertDeviceTable(stMCUNO, ECUNo: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([ECUNo]) then
    begin
      Append;
      FindField('DEVICE_ID').AsString:= stMCUNO;
      FindField('EUC_ID').AsString:= ECUNo;
      try
        Post;
      except
        Exit;
      end;
    end else
    begin
      Edit;
      FindField('DEVICE_ID').AsString:= stMCUNO;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.DeleteDeviceAllTable: Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      Delete;
      Next;
    end;
  end;
  Result := True;
end;

function TForm_Main.DeleteDeviceTable(stECUID:string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Delete;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateAlarmLong1(stECUID,
  stAlarmLong1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('ALARM_LONG1').AsString:= stAlarmLong1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateAlarmLong2(stECUID,
  stAlarmLong2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('ALARM_LONG2').AsString:= stAlarmLong2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateCardType1(stECUID, stCardType1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('CARD_TYPE1').AsString:= stCardType1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateCardType2(stECUID, stCardType2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('CARD_TYPE2').AsString:= stCardType2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateControlFire1(stECUID,
  stControlFire1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('CONTROL_FIRE1').AsString:= stControlFire1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateControlFire2(stECUID,
  stControlFire2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('CONTROL_FIRE2').AsString:= stControlFire2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorModeType1(stECUID,
  stDoorModeType1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOORMODE_TYPE1').AsString:= stDoorModeType1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorModeType2(stECUID,
  stDoorModeType2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOORMODE_TYPE2').AsString:= stDoorModeType2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorOpen1(stECUID, stDoorOpen1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_OPEN1').AsString:= stDoorOpen1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorOpen2(stECUID, stDoorOpen2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_OPEN2').AsString:= stDoorOpen2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorStatus1(stECUID,
  stDoorStatus1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_STATUS1').AsString:= stDoorStatus1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorStatus2(stECUID,
  stDoorStatus2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_STATUS2').AsString:= stDoorStatus2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorType1(stECUID, stDoorType1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_TYPE1').AsString:= stDoorType1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateDoorType2(stECUID, stDoorType2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('DOOR_TYPE2').AsString:= stDoorType2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateInDelay(stECUID, stInDelay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('IN_DELAY').AsString:= stInDelay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateLinkusTel(stECUID, stLinkusTel: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('LINKUS_TEL').AsString:= stLinkusTel;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateLocate(stECUID, stLocate: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('LOCATE').AsString:= stLocate;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateMcuGate(stECUID, stMcuGate: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('MCU_GATE').AsString:= stMcuGate;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateMcuIp(stECUID, stMcuIp: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('MCU_IP').AsString:= stMcuIp;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateMcuPort(stECUID, stMcuPort: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('MCU_PORT').AsString:= stMcuPort;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateMcuSubnet(stECUID, stMcuSubnet: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('MCU_SUBNET').AsString:= stMcuSubnet;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateOpenMoni1(stECUID, stOpenMoni1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('OPEN_MONI1').AsString:= stOpenMoni1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateOpenMoni2(stECUID, stOpenMoni2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('OPEN_MONI2').AsString:= stOpenMoni2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateOutDelay(stECUID, stOutDelay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('OUT_DELAY').AsString:= stOutDelay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort1Delay(stECUID,
  stPort1Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT1_DELAY').AsString:= stPort1Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort1Name(stECUID, stPort1Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT1_NAME').AsString:= stPort1Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort1Sense(stECUID,
  stPort1Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT1_SENS').AsString:= stPort1Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort1Type(stECUID, stPort1Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT1_TYPE').AsString:= stPort1Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort2Delay(stECUID,
  stPort2Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT2_DELAY').AsString:= stPort2Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort2Name(stECUID, stPort2Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT2_NAME').AsString:= stPort2Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort2Sense(stECUID,
  stPort2Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT2_SENS').AsString:= stPort2Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort2Type(stECUID, stPort2Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT2_TYPE').AsString:= stPort2Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort3Delay(stECUID,
  stPort3Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT3_DELAY').AsString:= stPort3Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort3Name(stECUID, stPort3Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT3_NAME').AsString:= stPort3Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort3Sense(stECUID,
  stPort3Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT3_SENS').AsString:= stPort3Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort3Type(stECUID, stPort3Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT3_TYPE').AsString:= stPort3Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort4Delay(stECUID,
  stPort4Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT4_DELAY').AsString:= stPort4Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort4Name(stECUID, stPort4Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT4_NAME').AsString:= stPort4Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort4Sense(stECUID,
  stPort4Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT4_SENS').AsString:= stPort4Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort4Type(stECUID, stPort4Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT4_TYPE').AsString:= stPort4Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort5Delay(stECUID,
  stPort5Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT5_DELAY').AsString:= stPort5Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort5Name(stECUID, stPort5Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT5_NAME').AsString:= stPort5Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort5Sense(stECUID,
  stPort5Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT5_SENS').AsString:= stPort5Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort5Type(stECUID, stPort5Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT5_TYPE').AsString:= stPort5Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort6Delay(stECUID,
  stPort6Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT6_DELAY').AsString:= stPort6Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort6Name(stECUID, stPort6Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT6_NAME').AsString:= stPort6Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort6Sense(stECUID,
  stPort6Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT6_SENS').AsString:= stPort6Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort6Type(stECUID, stPort6Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT6_TYPE').AsString:= stPort6Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort7Delay(stECUID,
  stPort7Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT7_DELAY').AsString:= stPort7Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort7Name(stECUID, stPort7Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT7_NAME').AsString:= stPort7Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort7Sense(stECUID,
  stPort7Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT7_SENS').AsString:= stPort7Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort7Type(stECUID, stPort7Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT7_TYPE').AsString:= stPort7Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort8Delay(stECUID,
  stPort8Delay: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT8_DELAY').AsString:= stPort8Delay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort8Name(stECUID, stPort8Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT8_NAME').AsString:= stPort8Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort8Sense(stECUID,
  stPort8Sense: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT8_SENS').AsString:= stPort8Sense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePort8Type(stECUID, stPort8Type: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('PORT8_TYPE').AsString:= stPort8Type;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader1Door(stECUID,
  stReader1Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER1_DOOR').AsString:= stReader1Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader1Name(stECUID,
  stReader1Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER1_NAME').AsString:= stReader1Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader1Use(stECUID,
  stReader1Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER1_USE').AsString:= stReader1Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader2Door(stECUID,
  stReader2Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER2_DOOR').AsString:= stReader2Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader2Name(stECUID,
  stReader2Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER2_NAME').AsString:= stReader2Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader2Use(stECUID,
  stReader2Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER2_USE').AsString:= stReader2Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader3Door(stECUID,
  stReader3Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER3_DOOR').AsString:= stReader3Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader3Name(stECUID,
  stReader3Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER3_NAME').AsString:= stReader3Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader3Use(stECUID,
  stReader3Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER3_USE').AsString:= stReader3Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader4Door(stECUID,
  stReader4Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER4_DOOR').AsString:= stReader4Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader4Name(stECUID,
  stReader4Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER4_NAME').AsString:= stReader4Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader4Use(stECUID,
  stReader4Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER4_USE').AsString:= stReader4Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader5Door(stECUID,
  stReader5Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER5_DOOR').AsString:= stReader5Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader5Name(stECUID,
  stReader5Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER5_NAME').AsString:= stReader5Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader5Use(stECUID,
  stReader5Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER5_USE').AsString:= stReader5Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader6Door(stECUID,
  stReader6Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER6_DOOR').AsString:= stReader6Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader6Name(stECUID,
  stReader6Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER6_NAME').AsString:= stReader6Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader6Use(stECUID,
  stReader6Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER6_USE').AsString:= stReader6Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader7Door(stECUID,
  stReader7Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER7_DOOR').AsString:= stReader7Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader7Name(stECUID,
  stReader7Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER7_NAME').AsString:= stReader7Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader7Use(stECUID,
  stReader7Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER7_USE').AsString:= stReader7Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader8Door(stECUID,
  stReader8Door: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER8_DOOR').AsString:= stReader8Door;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader8Name(stECUID,
  stReader8Name: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER8_NAME').AsString:= stReader8Name;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReader8Use(stECUID,
  stReader8Use: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('READER8_USE').AsString:= stReader8Use;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateRingCnt(stECUID, stRingCnt: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('RING_CNT').AsString:= stRingCnt;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateSystemID(stECUID, stSystemID: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('SYSTEM_ID').AsString:= stSystemID;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateUseSch1(stECUID, stUseSch1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('USE_SCH1').AsString:= stUseSch1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateUseSch2(stECUID, stUseSch2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('USE_SCH2').AsString:= stUseSch2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateWatchPower(stECUID,
  stWatchPower: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('WATCH_POWER').AsString:= stWatchPower;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateLockType1(stECUID, stLockType1: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('LOCK_TYPE1').AsString:= stLockType1;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateLockType2(stECUID, stLockType2: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('LOCK_TYPE2').AsString:= stLockType2;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReaderUse(stECUID, stReaderUse: string;
  nReaderNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nReaderNo = 1 then  FindField('READER1_USE').AsString:= stReaderUse
      else if nReaderNo = 2 then  FindField('READER2_USE').AsString:= stReaderUse
      else if nReaderNo = 3 then  FindField('READER3_USE').AsString:= stReaderUse
      else if nReaderNo = 4 then  FindField('READER4_USE').AsString:= stReaderUse
      else if nReaderNo = 5 then  FindField('READER5_USE').AsString:= stReaderUse
      else if nReaderNo = 6 then  FindField('READER6_USE').AsString:= stReaderUse
      else if nReaderNo = 7 then  FindField('READER7_USE').AsString:= stReaderUse
      else if nReaderNo = 8 then  FindField('READER8_USE').AsString:= stReaderUse;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReaderDoor(stECUID, stReaderDoor: string;
  nReaderNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nReaderNo = 1 then  FindField('READER1_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 2 then  FindField('READER2_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 3 then  FindField('READER3_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 4 then  FindField('READER4_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 5 then  FindField('READER5_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 6 then  FindField('READER6_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 7 then  FindField('READER7_DOOR').AsString:= stReaderDoor
      else if nReaderNo = 8 then  FindField('READER8_DOOR').AsString:= stReaderDoor;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateReaderName(stECUID, stReaderName: string;
  nReaderNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nReaderNo = 1 then  FindField('READER1_NAME').AsString:= stReaderName
      else if nReaderNo = 2 then  FindField('READER2_NAME').AsString:= stReaderName
      else if nReaderNo = 3 then  FindField('READER3_NAME').AsString:= stReaderName
      else if nReaderNo = 4 then  FindField('READER4_NAME').AsString:= stReaderName
      else if nReaderNo = 5 then  FindField('READER5_NAME').AsString:= stReaderName
      else if nReaderNo = 6 then  FindField('READER6_NAME').AsString:= stReaderName
      else if nReaderNo = 7 then  FindField('READER7_NAME').AsString:= stReaderName
      else if nReaderNo = 8 then  FindField('READER8_NAME').AsString:= stReaderName;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePortType(stECUID, stPortType: string;
  nPortNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nPortNo = 1 then  FindField('PORT1_TYPE').AsString:= stPortType
      else if nPortNo = 2 then  FindField('PORT2_TYPE').AsString:= stPortType
      else if nPortNo = 3 then  FindField('PORT3_TYPE').AsString:= stPortType
      else if nPortNo = 4 then  FindField('PORT4_TYPE').AsString:= stPortType
      else if nPortNo = 5 then  FindField('PORT5_TYPE').AsString:= stPortType
      else if nPortNo = 6 then  FindField('PORT6_TYPE').AsString:= stPortType
      else if nPortNo = 7 then  FindField('PORT7_TYPE').AsString:= stPortType
      else if nPortNo = 8 then  FindField('PORT8_TYPE').AsString:= stPortType;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePortDelay(stECUID, stPortDelay: string;
  nPortNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nPortNo = 1 then  FindField('PORT1_DELAY').AsString:= stPortDelay
      else if nPortNo = 2 then  FindField('PORT2_DELAY').AsString:= stPortDelay
      else if nPortNo = 3 then  FindField('PORT3_DELAY').AsString:= stPortDelay
      else if nPortNo = 4 then  FindField('PORT4_DELAY').AsString:= stPortDelay
      else if nPortNo = 5 then  FindField('PORT5_DELAY').AsString:= stPortDelay
      else if nPortNo = 6 then  FindField('PORT6_DELAY').AsString:= stPortDelay
      else if nPortNo = 7 then  FindField('PORT7_DELAY').AsString:= stPortDelay
      else if nPortNo = 8 then  FindField('PORT8_DELAY').AsString:= stPortDelay;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePortSense(stECUID, stPortSense: string;
  nPortNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nPortNo = 1 then  FindField('PORT1_SENS').AsString:= stPortSense
      else if nPortNo = 2 then  FindField('PORT2_SENS').AsString:= stPortSense
      else if nPortNo = 3 then  FindField('PORT3_SENS').AsString:= stPortSense
      else if nPortNo = 4 then  FindField('PORT4_SENS').AsString:= stPortSense
      else if nPortNo = 5 then  FindField('PORT5_SENS').AsString:= stPortSense
      else if nPortNo = 6 then  FindField('PORT6_SENS').AsString:= stPortSense
      else if nPortNo = 7 then  FindField('PORT7_SENS').AsString:= stPortSense
      else if nPortNo = 8 then  FindField('PORT8_SENS').AsString:= stPortSense;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdatePortName(stECUID, stPortName: string;
  nPortNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nPortNo = 1 then  FindField('PORT1_NAME').AsString:= stPortName
      else if nPortNo = 2 then  FindField('PORT2_NAME').AsString:= stPortName
      else if nPortNo = 3 then  FindField('PORT3_NAME').AsString:= stPortName
      else if nPortNo = 4 then  FindField('PORT4_NAME').AsString:= stPortName
      else if nPortNo = 5 then  FindField('PORT5_NAME').AsString:= stPortName
      else if nPortNo = 6 then  FindField('PORT6_NAME').AsString:= stPortName
      else if nPortNo = 7 then  FindField('PORT7_NAME').AsString:= stPortName
      else if nPortNo = 8 then  FindField('PORT8_NAME').AsString:= stPortName;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;


///////////////////////////////////////////////////////////////
///Device Table 관련된 함수   끝
///////////////////////////////////////////////////////////////

procedure TForm_Main.Edit_LinkusIDChange(Sender: TObject);
begin
  UpdateSystemID('00',Trim(Edit_LinkusID.Text));
end;

procedure TForm_Main.Edit_LinkusTelChange(Sender: TObject);
begin
  UpdateLinkusTel('00',Trim(Edit_LinkusTel.Text));
end;

procedure TForm_Main.Spinner_RingChange(Sender: TObject);
begin
  UpdateRingCnt('00',Trim(inttostr(Spinner_Ring.value)));
end;

procedure TForm_Main.Edit_IPChange(Sender: TObject);
begin
  UpdateMcuIp('00',Trim(Edit_IP.Text));
end;

procedure TForm_Main.Edit_subnetChange(Sender: TObject);
begin
  UpdateMcuSubnet('00',Trim(Edit_subnet.Text));
end;

procedure TForm_Main.edit_GatewayChange(Sender: TObject);
begin
  UpdateMcuGate('00',Trim(edit_Gateway.Text));
end;

procedure TForm_Main.edit_portChange(Sender: TObject);
begin
  UpdateMcuPort('00',Trim(edit_port.Text));
end;

procedure TForm_Main.ComboBox_WatchPowerOffChange(Sender: TObject);
begin
  if IsConfigMCU then UpdateWatchPower('00',inttostr(ComboBox_WatchPowerOff.ItemIndex))
  else UpdateWatchPower(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_WatchPowerOff.ItemIndex));
end;

procedure TForm_Main.SpinEdit_OutDelayChange(Sender: TObject);
begin
  if IsConfigMCU then UpdateOutDelay('00',inttostr(SpinEdit_OutDelay.IntValue))
  else UpdateOutDelay(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_OutDelay.IntValue));
end;

procedure TForm_Main.SpinEdit_InDelayChange(Sender: TObject);
begin
  if IsConfigMCU then UpdateInDelay('00',inttostr(SpinEdit_InDelay.IntValue))
  else UpdateInDelay(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_InDelay.IntValue));
end;

procedure TForm_Main.ComboBox_DoorType1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorType1('00',inttostr(ComboBox_DoorType1.ItemIndex))
  else UpdateDoorType1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_DoorType1.ItemIndex));
end;

procedure TForm_Main.ComboBox_DoorType2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorType2('00',inttostr(ComboBox_DoorType2.ItemIndex))
  else UpdateDoorType2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_DoorType2.ItemIndex));

end;

procedure TForm_Main.Edit_LocateChange(Sender: TObject);
begin
  if IsConfigMCU then UpdateLocate('00',trim(Edit_Locate.Text))
  else UpdateLocate(copy(ComboBox_ECU.Text,1,2),trim(Edit_Locate.Text));
end;

procedure TForm_Main.ComboBox_CardModeType1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateCardType1('00',inttostr(ComboBox_CardModeType1.ItemIndex))
  else UpdateCardType1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_CardModeType1.ItemIndex));
end;

procedure TForm_Main.ComboBox_CardModeType2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateCardType2('00',inttostr(ComboBox_CardModeType2.ItemIndex))
  else UpdateCardType2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_CardModeType2.ItemIndex));
end;

procedure TForm_Main.ComboBox_DoorModeType1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorModeType1('00',inttostr(ComboBox_DoorModeType1.ItemIndex))
  else UpdateDoorModeType1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_DoorModeType1.ItemIndex));
end;

procedure TForm_Main.ComboBox_DoorModeType2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorModeType2('00',inttostr(ComboBox_DoorModeType2.ItemIndex))
  else UpdateDoorModeType2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_DoorModeType2.ItemIndex));
end;

procedure TForm_Main.SpinEdit_DoorOPen1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorOpen1('00',inttostr(SpinEdit_DoorOPen1.IntValue))
  else UpdateDoorOpen1(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_DoorOPen1.IntValue));

end;

procedure TForm_Main.SpinEdit_DoorOPen2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorOpen2('00',inttostr(SpinEdit_DoorOPen2.IntValue))
  else UpdateDoorOpen2(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_DoorOPen2.IntValue));
end;

procedure TForm_Main.SpinEdit_OpenMoni1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateOpenMoni1('00',inttostr(SpinEdit_OpenMoni1.IntValue))
  else UpdateOpenMoni1(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_OpenMoni1.IntValue));
end;

procedure TForm_Main.SpinEdit_OpenMoni2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateOpenMoni2('00',inttostr(SpinEdit_OpenMoni2.IntValue))
  else UpdateOpenMoni2(copy(ComboBox_ECU.Text,1,2),inttostr(SpinEdit_OpenMoni2.IntValue));
end;

procedure TForm_Main.ComboBox_UseSch1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateUseSch1('00',inttostr(ComboBox_UseSch1.ItemIndex))
  else UpdateUseSch1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_UseSch1.ItemIndex));
end;

procedure TForm_Main.ComboBox_UseSch2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateUseSch2('00',inttostr(ComboBox_UseSch2.ItemIndex))
  else UpdateUseSch2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_UseSch2.ItemIndex));
end;

procedure TForm_Main.ComboBox_SendDoorStatus1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorStatus1('00',inttostr(ComboBox_SendDoorStatus1.ItemIndex))
  else UpdateDoorStatus1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_SendDoorStatus1.ItemIndex));
end;

procedure TForm_Main.ComboBox_SendDoorStatus2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateDoorStatus2('00',inttostr(ComboBox_SendDoorStatus2.ItemIndex))
  else UpdateDoorStatus2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_SendDoorStatus2.ItemIndex));
end;

procedure TForm_Main.ComboBox_AlarmLongOpen1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateAlarmLong1('00',inttostr(ComboBox_AlarmLongOpen1.ItemIndex))
  else UpdateAlarmLong1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_AlarmLongOpen1.ItemIndex));
end;

procedure TForm_Main.ComboBox_AlarmLongOpen2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateAlarmLong2('00',inttostr(ComboBox_AlarmLongOpen2.ItemIndex))
  else UpdateAlarmLong2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_AlarmLongOpen2.ItemIndex));
end;

procedure TForm_Main.ComboBox_ControlFire1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateControlFire1('00',inttostr(ComboBox_ControlFire1.ItemIndex))
  else UpdateControlFire1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_ControlFire1.ItemIndex));
end;

procedure TForm_Main.ComboBox_ControlFire2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateControlFire2('00',inttostr(ComboBox_ControlFire2.ItemIndex))
  else UpdateControlFire2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_ControlFire2.ItemIndex));
end;

procedure TForm_Main.ComboBox_LockType1Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateLockType1('00',inttostr(ComboBox_LockType1.ItemIndex))
  else UpdateLockType1(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_LockType1.ItemIndex));
end;


procedure TForm_Main.ComboBox_LockType2Change(Sender: TObject);
begin
  if IsConfigMCU then UpdateLockType2('00',inttostr(ComboBox_LockType2.ItemIndex))
  else UpdateLockType2(copy(ComboBox_ECU.Text,1,2),inttostr(ComboBox_LockType2.ItemIndex));
end;








procedure TForm_Main.sgPortDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  stECUID : string;
begin
  if IsConfigMCU then stECUID := '00'
  else stECUID := copy(ComboBox_ECU.Text,1,2);
  with sgPort do
  begin
    if aCol < FixedCols then exit;
    if aRow < FixedRows then exit;
    if aCol = 1 then UpdatePortType(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 2 then UpdatePortDelay(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 3 then UpdatePortSense(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 4 then UpdatePortName(stECUID,Trim(Cells[aCol,aRow]),aRow);

  end;
end;

function TForm_Main.DeviceTabletoFile(filename: string): Boolean;
var
  st :string;
  aStringList: Tstringlist;
begin
  Result := False;
  aStringList := TStringList.Create;
  aStringList.Clear;

  with TB_DEVICE do
  begin
    First;
    while Not Eof do
    begin
      st := '';
      st := st + FindField('DEVICE_ID').AsString + ',';
      st := st + FindField('EUC_ID').AsString + ',';
      st := st + FindField('SYSTEM_ID').AsString + ',';
      st := st + FindField('Linkus_Tel').AsString + ',';
      st := st + FindField('Ring_Cnt').AsString + ',';
      st := st + FindField('MCU_IP').AsString + ',';
      st := st + FindField('MCU_SUBNET').AsString + ',';
      st := st + FindField('MCU_GATE').AsString + ',';
      st := st + FindField('MCU_PORT').AsString + ',';
      st := st + FindField('WATCH_POWER').AsString + ',';
      st := st + FindField('OUT_DELAY').AsString + ',';
      st := st + FindField('IN_DELAY').AsString + ',';
      st := st + FindField('DOOR_TYPE1').AsString + ',';
      st := st + FindField('DOOR_TYPE2').AsString + ',';
      st := st + FindField('LOCATE').AsString + ',';
      st := st + FindField('CARD_TYPE1').AsString + ',';
      st := st + FindField('CARD_TYPE2').AsString + ',';
      st := st + FindField('DOORMODE_TYPE1').AsString + ',';
      st := st + FindField('DOORMODE_TYPE2').AsString + ',';
      st := st + FindField('DOOR_OPEN1').AsString + ',';
      st := st + FindField('DOOR_OPEN2').AsString + ',';
      st := st + FindField('OPEN_MONI1').AsString + ',';
      st := st + FindField('OPEN_MONI2').AsString + ',';
      st := st + FindField('USE_SCH1').AsString + ',';
      st := st + FindField('USE_SCH2').AsString + ',';
      st := st + FindField('DOOR_STATUS1').AsString + ',';
      st := st + FindField('DOOR_STATUS2').AsString + ',';
      st := st + FindField('ALARM_LONG1').AsString + ',';
      st := st + FindField('ALARM_LONG2').AsString + ',';
      st := st + FindField('CONTROL_FIRE1').AsString + ',';
      st := st + FindField('CONTROL_FIRE2').AsString + ',';
      st := st + FindField('LOCK_TYPE1').AsString + ',';
      st := st + FindField('LOCK_TYPE2').AsString + ',';
      st := st + FindField('READER1_USE').AsString + ',';
      st := st + FindField('READER1_DOOR').AsString + ',';
      st := st + FindField('READER1_NAME').AsString + ',';
      st := st + FindField('READER2_USE').AsString + ',';
      st := st + FindField('READER2_DOOR').AsString + ',';
      st := st + FindField('READER2_NAME').AsString + ',';
      st := st + FindField('READER3_USE').AsString + ',';
      st := st + FindField('READER3_DOOR').AsString + ',';
      st := st + FindField('READER3_NAME').AsString + ',';
      st := st + FindField('READER4_USE').AsString + ',';
      st := st + FindField('READER4_DOOR').AsString + ',';
      st := st + FindField('READER4_NAME').AsString + ',';
      st := st + FindField('READER5_USE').AsString + ',';
      st := st + FindField('READER5_DOOR').AsString + ',';
      st := st + FindField('READER5_NAME').AsString + ',';
      st := st + FindField('READER6_USE').AsString + ',';
      st := st + FindField('READER6_DOOR').AsString + ',';
      st := st + FindField('READER6_NAME').AsString + ',';
      st := st + FindField('READER7_USE').AsString + ',';
      st := st + FindField('READER7_DOOR').AsString + ',';
      st := st + FindField('READER7_NAME').AsString + ',';
      st := st + FindField('READER8_USE').AsString + ',';
      st := st + FindField('READER8_DOOR').AsString + ',';
      st := st + FindField('READER8_NAME').AsString + ',';
      st := st + FindField('PORT1_TYPE').AsString + ',';
      st := st + FindField('PORT1_DELAY').AsString + ',';
      st := st + FindField('PORT1_SENS').AsString + ',';
      st := st + FindField('PORT1_NAME').AsString + ',';
      st := st + FindField('PORT2_TYPE').AsString + ',';
      st := st + FindField('PORT2_DELAY').AsString + ',';
      st := st + FindField('PORT2_SENS').AsString + ',';
      st := st + FindField('PORT2_NAME').AsString + ',';
      st := st + FindField('PORT3_TYPE').AsString + ',';
      st := st + FindField('PORT3_DELAY').AsString + ',';
      st := st + FindField('PORT3_SENS').AsString + ',';
      st := st + FindField('PORT3_NAME').AsString + ',';
      st := st + FindField('PORT4_TYPE').AsString + ',';
      st := st + FindField('PORT4_DELAY').AsString + ',';
      st := st + FindField('PORT4_SENS').AsString + ',';
      st := st + FindField('PORT4_NAME').AsString + ',';
      st := st + FindField('PORT5_TYPE').AsString + ',';
      st := st + FindField('PORT5_DELAY').AsString + ',';
      st := st + FindField('PORT5_SENS').AsString + ',';
      st := st + FindField('PORT5_NAME').AsString + ',';
      st := st + FindField('PORT6_TYPE').AsString + ',';
      st := st + FindField('PORT6_DELAY').AsString + ',';
      st := st + FindField('PORT6_SENS').AsString + ',';
      st := st + FindField('PORT6_NAME').AsString + ',';
      st := st + FindField('PORT7_TYPE').AsString + ',';
      st := st + FindField('PORT7_DELAY').AsString + ',';
      st := st + FindField('PORT7_SENS').AsString + ',';
      st := st + FindField('PORT7_NAME').AsString + ',';
      st := st + FindField('PORT8_TYPE').AsString + ',';
      st := st + FindField('PORT8_DELAY').AsString + ',';
      st := st + FindField('PORT8_SENS').AsString + ',';
      st := st + FindField('PORT8_NAME').AsString ;

      aStringList.Add(st);
      Next;
    end;
    aStringList.SaveToFile(filename);
    aStringList.Free;

  end;
  Result := True;
end;

function TForm_Main.FileToInsertDeviceTable(filename: string): Boolean;
var
  DeviceDataList : TStringList;
  aECUID : string;
  i : integer;
begin
  Result := False;
  DeviceDataList := TStringList.Create;
  DeviceDataList.Clear;
  DeviceDataList.LoadFromFile(filename);

  with TB_DEVICE,DeviceDataList do
  begin
    for i:=0 to RecordCount - 1 do
    begin
      TB_DEVICE.Delete;
    end;
    for i:= 0 to DeviceDataList.Count - 1 do
    begin
      aECUID := Trim(FindCharCopy(Strings[i],1,','));
      if Not FindKey([aECUID]) then
      begin
        TB_DEVICE.Append;
        FindField('DEVICE_ID').AsString := Trim(FindCharCopy(Strings[i],0,','));
        FindField('EUC_ID').AsString := Trim(FindCharCopy(Strings[i],1,','));
        FindField('SYSTEM_ID').AsString := Trim(FindCharCopy(Strings[i],2,','));
        FindField('Linkus_Tel').AsString := Trim(FindCharCopy(Strings[i],3,','));
        FindField('Ring_Cnt').AsString := Trim(FindCharCopy(Strings[i],4,','));
        FindField('MCU_IP').AsString := Trim(FindCharCopy(Strings[i],5,','));
        FindField('MCU_SUBNET').AsString := Trim(FindCharCopy(Strings[i],6,','));
        FindField('MCU_GATE').AsString := Trim(FindCharCopy(Strings[i],7,','));
        FindField('MCU_PORT').AsString := Trim(FindCharCopy(Strings[i],8,','));
        FindField('WATCH_POWER').AsString := Trim(FindCharCopy(Strings[i],9,','));
        FindField('OUT_DELAY').AsString := Trim(FindCharCopy(Strings[i],10,','));
        FindField('IN_DELAY').AsString := Trim(FindCharCopy(Strings[i],11,','));
        FindField('DOOR_TYPE1').AsString := Trim(FindCharCopy(Strings[i],12,','));
        FindField('DOOR_TYPE2').AsString := Trim(FindCharCopy(Strings[i],13,','));
        FindField('LOCATE').AsString := Trim(FindCharCopy(Strings[i],14,','));
        FindField('CARD_TYPE1').AsString := Trim(FindCharCopy(Strings[i],15,','));
        FindField('CARD_TYPE2').AsString := Trim(FindCharCopy(Strings[i],16,','));
        FindField('DOORMODE_TYPE1').AsString := Trim(FindCharCopy(Strings[i],17,','));
        FindField('DOORMODE_TYPE2').AsString := Trim(FindCharCopy(Strings[i],18,','));
        FindField('DOOR_OPEN1').AsString := Trim(FindCharCopy(Strings[i],19,','));
        FindField('DOOR_OPEN2').AsString := Trim(FindCharCopy(Strings[i],20,','));
        FindField('OPEN_MONI1').AsString := Trim(FindCharCopy(Strings[i],21,','));
        FindField('OPEN_MONI2').AsString := Trim(FindCharCopy(Strings[i],22,','));
        FindField('USE_SCH1').AsString := Trim(FindCharCopy(Strings[i],23,','));
        FindField('USE_SCH2').AsString := Trim(FindCharCopy(Strings[i],24,','));
        FindField('DOOR_STATUS1').AsString := Trim(FindCharCopy(Strings[i],25,','));
        FindField('DOOR_STATUS2').AsString := Trim(FindCharCopy(Strings[i],26,','));
        FindField('ALARM_LONG1').AsString := Trim(FindCharCopy(Strings[i],27,','));
        FindField('ALARM_LONG2').AsString := Trim(FindCharCopy(Strings[i],28,','));
        FindField('CONTROL_FIRE1').AsString := Trim(FindCharCopy(Strings[i],29,','));
        FindField('CONTROL_FIRE2').AsString := Trim(FindCharCopy(Strings[i],30,','));
        FindField('LOCK_TYPE1').AsString := Trim(FindCharCopy(Strings[i],31,','));
        FindField('LOCK_TYPE2').AsString := Trim(FindCharCopy(Strings[i],32,','));
        FindField('READER1_USE').AsString := Trim(FindCharCopy(Strings[i],33,','));
        FindField('READER1_DOOR').AsString := Trim(FindCharCopy(Strings[i],34,','));
        FindField('READER1_NAME').AsString := Trim(FindCharCopy(Strings[i],35,','));
        FindField('READER2_USE').AsString := Trim(FindCharCopy(Strings[i],36,','));
        FindField('READER2_DOOR').AsString := Trim(FindCharCopy(Strings[i],37,','));
        FindField('READER2_NAME').AsString := Trim(FindCharCopy(Strings[i],38,','));
        FindField('READER3_USE').AsString := Trim(FindCharCopy(Strings[i],39,','));
        FindField('READER3_DOOR').AsString := Trim(FindCharCopy(Strings[i],40,','));
        FindField('READER3_NAME').AsString := Trim(FindCharCopy(Strings[i],41,','));
        FindField('READER4_USE').AsString := Trim(FindCharCopy(Strings[i],42,','));
        FindField('READER4_DOOR').AsString := Trim(FindCharCopy(Strings[i],43,','));
        FindField('READER4_NAME').AsString := Trim(FindCharCopy(Strings[i],44,','));
        FindField('READER5_USE').AsString := Trim(FindCharCopy(Strings[i],45,','));
        FindField('READER5_DOOR').AsString := Trim(FindCharCopy(Strings[i],46,','));
        FindField('READER5_NAME').AsString := Trim(FindCharCopy(Strings[i],47,','));
        FindField('READER6_USE').AsString := Trim(FindCharCopy(Strings[i],48,','));
        FindField('READER6_DOOR').AsString := Trim(FindCharCopy(Strings[i],49,','));
        FindField('READER6_NAME').AsString := Trim(FindCharCopy(Strings[i],50,','));
        FindField('READER7_USE').AsString := Trim(FindCharCopy(Strings[i],51,','));
        FindField('READER7_DOOR').AsString := Trim(FindCharCopy(Strings[i],52,','));
        FindField('READER7_NAME').AsString := Trim(FindCharCopy(Strings[i],53,','));
        FindField('READER8_USE').AsString := Trim(FindCharCopy(Strings[i],54,','));
        FindField('READER8_DOOR').AsString := Trim(FindCharCopy(Strings[i],55,','));
        FindField('READER8_NAME').AsString := Trim(FindCharCopy(Strings[i],56,','));
        FindField('PORT1_TYPE').AsString := Trim(FindCharCopy(Strings[i],57,','));
        FindField('PORT1_DELAY').AsString := Trim(FindCharCopy(Strings[i],58,','));
        FindField('PORT1_SENS').AsString := Trim(FindCharCopy(Strings[i],59,','));
        FindField('PORT1_NAME').AsString := Trim(FindCharCopy(Strings[i],60,','));
        FindField('PORT2_TYPE').AsString := Trim(FindCharCopy(Strings[i],61,','));
        FindField('PORT2_DELAY').AsString := Trim(FindCharCopy(Strings[i],62,','));
        FindField('PORT2_SENS').AsString := Trim(FindCharCopy(Strings[i],63,','));
        FindField('PORT2_NAME').AsString := Trim(FindCharCopy(Strings[i],64,','));
        FindField('PORT3_TYPE').AsString := Trim(FindCharCopy(Strings[i],65,','));
        FindField('PORT3_DELAY').AsString := Trim(FindCharCopy(Strings[i],66,','));
        FindField('PORT3_SENS').AsString := Trim(FindCharCopy(Strings[i],67,','));
        FindField('PORT3_NAME').AsString := Trim(FindCharCopy(Strings[i],68,','));
        FindField('PORT4_TYPE').AsString := Trim(FindCharCopy(Strings[i],69,','));
        FindField('PORT4_DELAY').AsString := Trim(FindCharCopy(Strings[i],70,','));
        FindField('PORT4_SENS').AsString := Trim(FindCharCopy(Strings[i],71,','));
        FindField('PORT4_NAME').AsString := Trim(FindCharCopy(Strings[i],72,','));
        FindField('PORT5_TYPE').AsString := Trim(FindCharCopy(Strings[i],73,','));
        FindField('PORT5_DELAY').AsString := Trim(FindCharCopy(Strings[i],74,','));
        FindField('PORT5_SENS').AsString := Trim(FindCharCopy(Strings[i],75,','));
        FindField('PORT5_NAME').AsString := Trim(FindCharCopy(Strings[i],76,','));
        FindField('PORT6_TYPE').AsString := Trim(FindCharCopy(Strings[i],77,','));
        FindField('PORT6_DELAY').AsString := Trim(FindCharCopy(Strings[i],78,','));
        FindField('PORT6_SENS').AsString := Trim(FindCharCopy(Strings[i],79,','));
        FindField('PORT6_NAME').AsString := Trim(FindCharCopy(Strings[i],80,','));
        FindField('PORT7_TYPE').AsString := Trim(FindCharCopy(Strings[i],81,','));
        FindField('PORT7_DELAY').AsString := Trim(FindCharCopy(Strings[i],82,','));
        FindField('PORT7_SENS').AsString := Trim(FindCharCopy(Strings[i],83,','));
        FindField('PORT7_NAME').AsString := Trim(FindCharCopy(Strings[i],84,','));
        FindField('PORT8_TYPE').AsString := Trim(FindCharCopy(Strings[i],85,','));
        FindField('PORT8_DELAY').AsString := Trim(FindCharCopy(Strings[i],86,','));
        FindField('PORT8_SENS').AsString := Trim(FindCharCopy(Strings[i],87,','));
        FindField('PORT8_NAME').AsString := Trim(FindCharCopy(Strings[i],88,','));
        try
          Post;
        except
          Continue;
        end;

      end;

    end;
  end;

  DeviceDataList.Free;
  Result := True;
end;

procedure TForm_Main.DeviceTableShow(stECUNO: string);
var
  aDeviceID : string;
  alist: TListItem;
begin
  ControlInit;
  //ECU 등록
  if IsConfigMCU then
  begin
    with TB_DEVICE do //ECU 체크
    begin
      First;
      lvECU.Clear;
      ECUList.Clear;
      ECUList.Add('99.전체');
      ECUList.Add('00.Controler');
      while Not Eof do
      begin
        if FindField('EUC_ID').AsString = '00' then
        begin
          Next;
          Continue;
        end;

        aList := lvECU.Items.Add;
        aList.Caption := FindField('EUC_ID').AsString; //ECU 번호
        aList.ImageIndex := 4;
        if FindField('EUC_ID').AsString = '00' then
        begin
        //  aList.SubItems.Add('Controler')
        end
        else
        begin
          aList.SubItems.Add('ECU');
          ECUList.Add(aList.Caption + '.ECU');
        end;
        Next;
      end;
    end;
  end;

  with TB_DEVICE do
  begin
    if FindKey([stECUNO]) then
    begin
      if IsConfigMCU then
      begin
        aDeviceID := FindField('DEVICE_ID').AsString;
        Edit_DeviceID1.Text := copy(aDeviceID,1,1);
        Edit_DeviceID2.Text := copy(aDeviceID,2,1);
        Edit_DeviceID3.Text := copy(aDeviceID,3,1);
        Edit_DeviceID4.Text := copy(aDeviceID,4,1);
        Edit_DeviceID5.Text := copy(aDeviceID,5,1);
        Edit_DeviceID6.Text := copy(aDeviceID,6,1);
        Edit_DeviceID7.Text := copy(aDeviceID,7,1);

        Edit_LinkusID.Text := FindField('SYSTEM_ID').AsString;
        Edit_LinkusTel.Text := FindField('Linkus_Tel').AsString;
        Spinner_Ring.Value := FindField('Ring_Cnt').AsInteger;
        Edit_IP.Text := FindField('MCU_IP').AsString;
        Edit_subnet.Text := FindField('MCU_SUBNET').AsString;
        edit_Gateway.Text := FindField('MCU_GATE').AsString;
        edit_port.Text := FindField('MCU_PORT').AsString ;
        ed_server.Text := FindField('Server_IP').AsString ;
        rg_Mode.ItemIndex := FindField('MODE').AsInteger;
        ComboBox_ECU.Text := '';
      end
      else
      begin
        ComboBox_ECU.Enabled := True;
        ComboBox_ECU.ItemIndex := ComboBox_ECU.IndexOf(FindField('EUC_ID').AsString + '.ECU');
      end;
      //공통부분
      ComboBox_WatchPowerOff.ItemIndex := FindField('WATCH_POWER').AsInteger;
      SpinEdit_OutDelay.IntValue := FindField('OUT_DELAY').AsInteger;
      SpinEdit_InDelay.IntValue := FindField('IN_DELAY').AsInteger;
      ComboBox_DoorType1.ItemIndex := FindField('DOOR_TYPE1').AsInteger;
      ComboBox_DoorType2.ItemIndex := FindField('DOOR_TYPE2').AsInteger;
      Edit_Locate.Text := FindField('LOCATE').AsString;
      ComboBox_CardModeType1.ItemIndex := FindField('CARD_TYPE1').AsInteger;
      ComboBox_CardModeType2.ItemIndex := FindField('CARD_TYPE2').AsInteger;
      ComboBox_DoorModeType1.ItemIndex := FindField('DOORMODE_TYPE1').AsInteger;
      ComboBox_DoorModeType2.ItemIndex := FindField('DOORMODE_TYPE2').AsInteger;
      SpinEdit_DoorOPen1.IntValue := FindField('DOOR_OPEN1').AsInteger;
      SpinEdit_DoorOPen2.IntValue := FindField('DOOR_OPEN2').AsInteger;
      SpinEdit_OpenMoni1.IntValue := FindField('OPEN_MONI1').AsInteger;
      SpinEdit_OpenMoni2.IntValue := FindField('OPEN_MONI2').AsInteger;
      ComboBox_UseSch1.ItemIndex := FindField('USE_SCH1').AsInteger;
      ComboBox_UseSch2.ItemIndex := FindField('USE_SCH2').AsInteger;
      ComboBox_SendDoorStatus1.ItemIndex := FindField('DOOR_STATUS1').AsInteger;
      ComboBox_SendDoorStatus2.ItemIndex := FindField('DOOR_STATUS2').AsInteger;
      ComboBox_AlarmLongOpen1.ItemIndex := FindField('ALARM_LONG1').AsInteger;
      ComboBox_AlarmLongOpen2.ItemIndex := FindField('ALARM_LONG2').AsInteger;
      ComboBox_ControlFire1.ItemIndex := FindField('CONTROL_FIRE1').AsInteger;
      ComboBox_ControlFire2.ItemIndex := FindField('CONTROL_FIRE2').AsInteger;
      ComboBox_LockType1.ItemIndex := FindField('LOCK_TYPE1').AsInteger;
      ComboBox_LockType2.ItemIndex := FindField('LOCK_TYPE2').AsInteger;
      cb_CardType.itemindex := FindField('CARDREADER_TYPE').AsInteger;
      
      with sgCardReader do
      begin
        Cells[1,1] := FindField('READER1_USE').AsString;
        Cells[2,1] := FindField('READER1_DOOR').AsString;
        Cells[3,1] := FindField('READER1_NAME').AsString;
        Cells[1,2] := FindField('READER2_USE').AsString;
        Cells[2,2] := FindField('READER2_DOOR').AsString;
        Cells[3,2] := FindField('READER2_NAME').AsString;
        Cells[1,3] := FindField('READER3_USE').AsString;
        Cells[2,3] := FindField('READER3_DOOR').AsString;
        Cells[3,3] := FindField('READER3_NAME').AsString;
        Cells[1,4] := FindField('READER4_USE').AsString;
        Cells[2,4] := FindField('READER4_DOOR').AsString;
        Cells[3,4] := FindField('READER4_NAME').AsString;
        Cells[1,5] := FindField('READER5_USE').AsString;
        Cells[2,5] := FindField('READER5_DOOR').AsString;
        Cells[3,5] := FindField('READER5_NAME').AsString;
        Cells[1,6] := FindField('READER6_USE').AsString;
        Cells[2,6] := FindField('READER6_DOOR').AsString;
        Cells[3,6] := FindField('READER6_NAME').AsString;
        Cells[1,7] := FindField('READER7_USE').AsString;
        Cells[2,7] := FindField('READER7_DOOR').AsString;
        Cells[3,7] := FindField('READER7_NAME').AsString;
        Cells[1,8] := FindField('READER8_USE').AsString;
        Cells[2,8] := FindField('READER8_DOOR').AsString;
        Cells[3,8] := FindField('READER8_NAME').AsString;
      end;
      with sgPort do
      begin
        Cells[1,1] := FindField('PORT1_TYPE').AsString;
        Cells[2,1] := FindField('PORT1_DELAY').AsString;
        Cells[3,1] := FindField('PORT1_SENS').AsString;
        Cells[4,1] := FindField('PORT1_NAME').AsString;
        Cells[1,2] := FindField('PORT2_TYPE').AsString;
        Cells[2,2] := FindField('PORT2_DELAY').AsString;
        Cells[3,2] := FindField('PORT2_SENS').AsString;
        Cells[4,2] := FindField('PORT2_NAME').AsString;
        Cells[1,3] := FindField('PORT3_TYPE').AsString;
        Cells[2,3] := FindField('PORT3_DELAY').AsString;
        Cells[3,3] := FindField('PORT3_SENS').AsString;
        Cells[4,3] := FindField('PORT3_NAME').AsString;
        Cells[1,4] := FindField('PORT4_TYPE').AsString;
        Cells[2,4] := FindField('PORT4_DELAY').AsString;
        Cells[3,4] := FindField('PORT4_SENS').AsString;
        Cells[4,4] := FindField('PORT4_NAME').AsString;
        Cells[1,5] := FindField('PORT5_TYPE').AsString;
        Cells[2,5] := FindField('PORT5_DELAY').AsString;
        Cells[3,5] := FindField('PORT5_SENS').AsString;
        Cells[4,5] := FindField('PORT5_NAME').AsString;
        Cells[1,6] := FindField('PORT6_TYPE').AsString;
        Cells[2,6] := FindField('PORT6_DELAY').AsString;
        Cells[3,6] := FindField('PORT6_SENS').AsString;
        Cells[4,6] := FindField('PORT6_NAME').AsString;
        Cells[1,7] := FindField('PORT7_TYPE').AsString;
        Cells[2,7] := FindField('PORT7_DELAY').AsString;
        Cells[3,7] := FindField('PORT7_SENS').AsString;
        Cells[4,7] := FindField('PORT7_NAME').AsString;
        Cells[1,8] := FindField('PORT8_TYPE').AsString;
        Cells[2,8] := FindField('PORT8_DELAY').AsString;
        Cells[3,8] := FindField('PORT8_SENS').AsString;
        Cells[4,8] := FindField('PORT8_NAME').AsString;

      end;

    end; //if FindKey([stECUNO]) then
  end;
end;

procedure TForm_Main.PortDataUpdate(aCol, aRow: Integer);
var
  stECUID : string;
begin
  if IsConfigMCU then stECUID := '00'
  else stECUID := copy(ComboBox_ECU.Text,1,2);
  with sgPort do
  begin
    if aCol < FixedCols then exit;
    if aRow < FixedRows then exit;
    if aCol = 1 then UpdatePortType(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 2 then UpdatePortDelay(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 3 then UpdatePortSense(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 4 then UpdatePortName(stECUID,Trim(Cells[aCol,aRow]),aRow);

  end;
end;

procedure TForm_Main.sgPortExit(Sender: TObject);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sgPort.ColCount - 1 do
  begin
    for aRow := 0 to sgPort.RowCount - 1 do
    begin
      PortDataUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.CardReaderUpdate(aCol, aRow: Integer);
var
  stECUID : string;
begin
  if IsConfigMCU then stECUID := '00'
  else stECUID := copy(ComboBox_ECU.Text,1,2);
  with sgCardReader do
  begin
    if aCol < FixedCols then exit;
    if aRow < FixedRows then exit;
    if aCol = 1 then UpdateReaderUse(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 2 then UpdateReaderDoor(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 3 then UpdateReaderName(stECUID,Trim(Cells[aCol,aRow]),aRow);

  end;
end;

procedure TForm_Main.sgCardReaderExit(Sender: TObject);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sgCardReader.ColCount - 1 do
  begin
    for aRow := 0 to sgCardReader.RowCount - 1 do
    begin
      CardReaderUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.sgPortColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sgPort.ColCount - 1 do
  begin
    for aRow := 0 to sgPort.RowCount - 1 do
    begin
      PortDataUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.sgPortRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sgPort.ColCount - 1 do
  begin
    for aRow := 0 to sgPort.RowCount - 1 do
    begin
      PortDataUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.sgCardReaderColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
    for aCol := 0 to sgCardReader.ColCount - 1 do
    begin
      for aRow := 0 to sgCardReader.RowCount - 1 do
      begin
        CardReaderUpdate(aCol,aRow);
      end;
    end;
  
end;

procedure TForm_Main.sgCardReaderRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sgCardReader.ColCount - 1 do
  begin
    for aRow := 0 to sgCardReader.RowCount - 1 do
    begin
      CardReaderUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.N16Click(Sender: TObject);
begin
{  if Not bSearch then
  begin
    showmessage('통신환경 체크는 기기정보 조회 후 체크 가능 합니다.');
    Exit;
  end; }

  fmTotalComCheck := TfmTotalComCheck.Create(Self);
  fmTotalComCheck.ECUList := TStringList.Create;
  fmTotalComCheck.ECUList.Clear;
  fmTotalComCheck.ECUList := ECUList;
  fmTotalComCheck.DeviceID := GetMcuID;
  fmTotalComCheck.ItemIndex := 0;
  fmTotalComCheck.ShowModal;
  fmTotalComCheck.Free;
end;

procedure TForm_Main.MENU_VersionClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := CheckVersion(aDeviceID);
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('Version통신응답이 없습니다.동작모드를 확인하여 주세요.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

end;

procedure TForm_Main.lvECUDblClick(Sender: TObject);
begin
  if lvECU.Selected = nil then exit;
  Action_RegECUExecute(Self);
end;

procedure TForm_Main.ErrorDataProcess(aData: string);
var
  stErr : string;
begin
  stErr := copy(aData,20,4);
  if UpperCase(stErr) <> 'COMM' then  exit;
  ErrorMessage := copy(aData,20,10);
  bErrorCheck := True;
end;

procedure TForm_Main.N17Click(Sender: TObject);
begin
  if Not bSearch then
  begin
    showmessage('통신환경 체크는 기기정보 조회 후 체크 가능 합니다.');
    Exit;
  end;

  fmDeviceComChk := TfmDeviceComChk.Create(Self);
  fmDeviceComChk.DeviceID := GetMcuID;
  fmDeviceComChk.ShowModal;
  fmDeviceComChk.Free;
end;

procedure TForm_Main.About1Click(Sender: TObject);
begin
  fmInfo := TfmInfo.Create(Self);
  fmInfo.ShowModal;
  fmInfo.Free;
end;

procedure TForm_Main.ECUStatusCheck;
var
  i : integer;
  aDevice : string;
  aDeviceID : string;
begin
  aDevice := GetMcuID;
  for i := 0 to lvECU.Items.Count - 1 do
  begin
    aDeviceID := aDevice + lvECU.items[i].Caption;
    bECUStatusCheck := True;
    if CheckVersion(aDeviceID) then lvECU.items[i].ImageIndex := 3
    else lvECU.items[i].ImageIndex := 4;
    bECUStatusCheck := False;
  end;
end;

procedure TForm_Main.MENU_TIMESYNCClick(Sender: TObject);
var
  aDeviceID : string;
begin
  bTimeShow := True;

  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  TimeSync(aDeviceID);
{  fmTimeSync := TfmTimeSync.Create(Self);
  fmTimeSync.ECUList := TStringList.Create;
  fmTimeSync.ECUList.Clear;
  fmTimeSync.ECUList := ECUList;
  fmTimeSync.DeviceID := GetMcuID;
  fmTimeSync.ShowModal;
  fmTimeSync.Free;  }
end;

procedure TForm_Main.MENU_RESETClick(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  SendPacket(aDeviceID,'R','RS00Reset',True);

end;

procedure TForm_Main.MENU_SETARMClick(Sender: TObject);
var
  aMode:Char;
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  aMode:= 'A';
  ChangeAlarmMode(aDeviceID,aMode,True);
end;

procedure TForm_Main.MENU_SETDISARMClick(Sender: TObject);
var
  aMode:Char;
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  aMode:= 'D';
  ChangeAlarmMode(aDeviceID,aMode,True);

end;

procedure TForm_Main.MENU_OPENDOOR1Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,1,3,1 ); //문번호,원격제어,문열림(1)
end;


procedure TForm_Main.MENU_OPEMDOOR2Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,2,3,1 );

end;

procedure TForm_Main.MENU_NMOODDOOR1Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,1,2,0 );    //문번호,출입운영,운영모드

end;

procedure TForm_Main.MENU_OMODEDOOR1Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,1,2,1 );    //문번호,출입운영,개방모드
end;

procedure TForm_Main.MENU_NMODEDOOR2Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,2,2,0 );    //문번호,출입운영,운영모드

end;

procedure TForm_Main.MENU_OMODEDOOR2Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,2,2,1 );    //문번호,출입운영,개방모드

end;

procedure TForm_Main.btnComCheckClick(Sender: TObject);
begin
{  if Not bSearch then
  begin
    showmessage('통신환경 체크는 기기정보 조회 후 체크 가능 합니다.');
    Exit;
  end;          }

  fmTotalComCheck := TfmTotalComCheck.Create(Self);
  fmTotalComCheck.ECUList := TStringList.Create;
  fmTotalComCheck.ECUList.Clear;
  fmTotalComCheck.ECUList := ECUList;
  fmTotalComCheck.DeviceID := GetMcuID;
  if IsConfigMCU then  fmTotalComCheck.ItemIndex := 1
  else fmTotalComCheck.ItemIndex := ComboBox_ECU.ItemIndex + 2 ;

  fmTotalComCheck.chkCard.Checked := True;
  fmTotalComCheck.chkDoor.Checked := True;
  fmTotalComCheck.ShowModal;
  fmTotalComCheck.Free;

end;

function TForm_Main.CheckECUCommState(aDeviceID:string): Boolean;
var
  aData : string;
  nTime : integer;
begin
  result := False;
  aData := 'cs00' ;   //통신상태 체크 명령
  bECUCommState := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bECUCommState do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;

function TForm_Main.CheckReaderCommState(aDeviceID: string): Boolean;
var
  aData : string;
  nTime : integer;
begin
  result := False;
  aData := 'cs01' ;   //통신상태 체크 명령
  bReaderCOMCheck := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bReaderCOMCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;

function TForm_Main.CheckIndicatorCommState(aDeviceID: string): Boolean;
var
  aData : string;
  nTime : integer;
begin
  result := False;
  aData := 'cs02' ;   //통신상태 체크 명령
  bIndicatorCheck := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bIndicatorCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;

procedure TForm_Main.FormActivate(Sender: TObject);
var
  stStr : string;
  ini_fun : TiniFile;
  bLogined :Boolean;
  stLOG :string;
//  alist: TListItem;
begin
  stStr := 'KTL-9 설정 프로그램';
  stStr := stStr + '[수정일:' + FormatdateTime('yyyy-mm-dd',getfilelastwritetime(Application.ExeName)) + ']';
  self.Caption := stStr;
  ini_fun := TiniFile.Create(ExtractFileDir(Application.ExeName) + '\zRegT.INI');
  stPW := ini_fun.ReadString('Config','PW','0000');
  stLOG := ini_fun.ReadString('Config','LOG','FALSE');
  if stLOG = 'FALSE' then IsLogShow := False
  else IsLogShow := True;

  if stPW <> '*' then
  begin
    fmLogin := TfmLogin.Create(Self);
    fmLogin.OrgPW := stPW;
    fmLogin.ShowModal;
    bLogined := fmLogin.bLogined;
    fmLogin.Free;
  end
  else bLogined := True;

  if Not bLogined then
  begin
    Self.Close;
  end;

  if stPW = '0000' then
  begin
    //환경설정 프로그램 띄움
    fmConfig := TfmConfig.Create(Self);
    fmConfig.OrgPW := stPW;
    fmConfig.ShowModal;
    fmConfig.Free;
  end;

  HideLocal;
  lvECU.Items.Clear;
{  aList:= lvECU.Items.Add;
  aList.Caption:= '00'; //기기 번호
  aList.ImageIndex:= 4;
  aList.SubItems.Add('Controler');
}
end;

function TForm_Main.GetFileLastWriteTime(sFileName: string): TDateTime;
var
ffd : TWin32FindData; 
dft : DWord; 
lft : TFileTime; 
h : THandle; 
begin 
  h := Windows.FindFirstFile(PChar(sFileName), ffd);
  if(INVALID_HANDLE_VALUE <> h)then 
  begin 
    Windows.FindClose( h ); 
    FileTimeToLocalFileTime(ffd.ftLastWriteTime, lft ); 
    FileTimeToDosDateTime(lft, LongRec(dft).Hi, LongRec(dft).Lo); 
    Result := FileDateToDateTime(dft);
  end;

end;

procedure TForm_Main.Timer_ENQTimer(Sender: TObject);
begin
  if Not bSended then  SendPacket(GetMcuID + '00', 'e', '', true);
end;

procedure TForm_Main.N18Click(Sender: TObject);
begin
    fmConfig := TfmConfig.Create(Self);
    fmConfig.OrgPW := stPW;
    fmConfig.ShowModal;
    fmConfig.Free;
end;

function TForm_Main.UpdateMode(stECUID, stMode: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('MODE').AsString:= stMode;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateServerIP(stECUID, stServerIP: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('SERVER_IP').AsString:= stServerIP;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

procedure TForm_Main.ed_serverChange(Sender: TObject);
begin
  UpdateServerIP('00',Trim(ed_Server.Text));
end;

procedure TForm_Main.Rg_ModeClick(Sender: TObject);
begin
  UpdateMode('00',inttostr(rg_mode.ItemIndex));
end;

procedure TForm_Main.N19Click(Sender: TObject);
var
  stECUID : string;
begin
  if lvECU.Selected = nil then exit;
  stECUID := lvECU.Items[lvECU.Selected.Index].Caption;

  fmCopy := TfmCopy.Create(Self);
  fmCopy.ECUID := stECUID;
  fmCopy.ECUList := TStringList.Create;
  fmCopy.ECUList.Clear;
  fmCopy.ECUList := ECUList;
  fmCopy.ShowModal;
  fmCopy.Free;

end;

procedure TForm_Main.CardTypeReg;
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

//  for nLoop := 0 to LoopCount - 1 do
//  begin
    bResult := RegCardReaderType(aDeviceID,cb_CardType.ItemIndex);
//    if Not bConnected then Exit;
//    if bResult then break;
//  end;
  if not bResult then
  begin
    cb_CardType.ItemIndex := 0;
    if IsConfigMCU then UpdateCardReaderType('00',inttostr(cb_CardType.ItemIndex))
    else UpdateCardReaderType(copy(ComboBox_ECU.Text,1,2),inttostr(cb_CardType.ItemIndex));
  end;
end;

procedure TForm_Main.CardTypeSearch;
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;

//  for nLoop := 0 to LoopCount - 1 do
//  begin
    bResult := CheckCardReaderType(aDeviceID);
//    if Not bConnected then Exit;
//    if bResult then break;
//  end;
  if not bResult then
  begin
    cb_CardType.ItemIndex := 0;
    if IsConfigMCU then UpdateCardReaderType('00',inttostr(cb_CardType.ItemIndex))
    else UpdateCardReaderType(copy(ComboBox_ECU.Text,1,2),inttostr(cb_CardType.ItemIndex));
  end;
end;

function TForm_Main.CheckCardReaderType(aDeviceID: string): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (not isdigit(aDeviceID)) or (Length(aDeviceID) <> 9) then Exit;
  aData := 'Ct00';
  bCardReaderTypeCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bCardReaderTypeCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.RegCardReaderType(aDeviceID: string;nType:integer): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  if (nType < 1) or (nType > 2) then Exit;
  aData := 'Ct00' + inttostr(nType - 1);                               //카드리더 타입 등록

  bCardReaderTypeCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCardReaderTypeCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

procedure TForm_Main.RcvCardType(aData: string);
var
  st: string;
  aCount: Integer;
  stECUID : string;
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  st := Copy(aData, 22, 1);
  stECUID := Copy(aData,14,2);
  if st = '0' then
  begin
    cb_CardType.ItemIndex := 1;
  end else if st = '1' then
  begin
    cb_CardType.ItemIndex := 2;
  end else
  begin
    cb_CardType.ItemIndex := 0;
  end;
  UpdateCardReaderType(stECUID,inttostr(cb_CardType.ItemIndex));
  cb_CardType.Color := clYellow;

  bCardReaderTypeCheck := True;
end;

procedure TForm_Main.cb_CardTypeChange(Sender: TObject);
begin
  if IsConfigMCU then UpdateCardReaderType('00',inttostr(cb_CardType.ItemIndex))
  else UpdateCardReaderType(copy(ComboBox_ECU.Text,1,2),inttostr(cb_CardType.ItemIndex));
end;

function TForm_Main.UpdateCardReaderType(stECUID: string;
  stType: string): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      FindField('CARDREADER_TYPE').AsString:= stType;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

procedure TForm_Main.btnLanSettClick(Sender: TObject);
begin
  MENU_REGLANClick(self);
end;

procedure TForm_Main.BitBtn1Click(Sender: TObject);
begin
  fmSensor := TfmSensor.Create(Self);
  if IsConfigMCU then
    fmSensor.stECUNO := '00'
  else
    fmSensor.stECUNO := copy(ComboBox_ECU.Text,1,2);
  fmSensor.DeviceID := GetMcuID;
  fmSensor.ShowModal;
  fmSensor.Free;

end;

function TForm_Main.RegSensorSet(aDeviceID, aData: string): Boolean;
var
  nTime : integer;
  stSendData : string;
begin
  result := False;
  stSendData := 'EL00' + aData;
  bSensorSet := False;
  SendPacket(aDeviceID, 'I', stSendData, True);

  nTime := 0;
  while Not bSensorSet do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;

function TForm_Main.CheckSensorSet(aDeviceID: string): Boolean;
var
  nTime : integer;
  stSendData : string;
begin
  result := False;
  stSendData := 'EL00' ;
  bSensorSet := False;
  SendPacket(aDeviceID, 'Q', stSendData, True);

  nTime := 0;
  while Not bSensorSet do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;

end;

function TForm_Main.RegSensorInfo(aDeviceID, aSensorNo, aPortNo,
  aAlarmType, aDetectTime: string): Boolean;
var
  aData: string;
  aPortNoStr: string;
  nTime : integer;
  stStatus : string;
begin
  Result := false;
  aSensorNo := FillZeroNumber(strtoint(aSensorNo), 2);
  aPortNo := FillZeroNumber(strtoint(aPortNo), 2);
  stStatus := 'E' + inttostr(strtoint(aPortNo));
  aData := 'el' +                              //COMMAND
    aSensorNo +                                //감지기번호
    aPortNo +                                  //포트번호
    stStatus +                                 //Status E1~E8
    aAlarmType +                               //감시형태
    '0' +                                      //AREA
    FillZeroNumber(strtoint(aDetectTime), 4) ;           //감지시간

  bSensorInfo:=False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bSensorInfo do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.CheckSensorInfo(aDeviceID, aSensorNo,
  aPortNo: string): Boolean;
var
  aData: string;
  aPortNoStr: string;
  nTime : integer;
begin
  Result := false;
  aSensorNo := FillZeroNumber(strtoint(aSensorNo), 2);
  aPortNo := FillZeroNumber(strtoint(aPortNo), 2);
  aData := 'el' +                              //COMMAND
    aSensorNo +                                //감지기번호
    aPortNo ;                                  //포트번호

  bSensorInfo:=False;
  SendPacket(aDeviceID, 'Q', aData, true);

  nTime := 0;
  while Not bSensorInfo do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.RcvSensorInfo(aData: string): Boolean;
var
  stSensorNO : string;
  stPortNo : string;
  stAlarmType : string;
  stTime : string;
begin

//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC

  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  stSensorNO := Copy(aData, 20, 2); //감지기번호
  stPortNo := Copy(aData,22,2); //감지기 포트번호
  stAlarmType := copy(aData,26,1); //감시형태
  stTime := copy(aData,29,4); //감지시간

  if bSensorShow then fmSensor.SensorInfoShow(stSensorNO, stPortNo, stAlarmType,stTime);
  
  bSensorInfo := True;
end;

function TForm_Main.RcvSensorSet(aData: string): Boolean;
var
  stSensorNO : string;
begin

//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC

  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  stSensorNO := Copy(aData,23,16); //감지기 포트번호

  if bSensorShow then fmSensor.SensorSetShow(stSensorNO);

  bSensorSet := True;
end;

procedure TForm_Main.BitBtn2Click(Sender: TObject);
begin
  fmKTReg := TfmKTReg.Create(Self);

  fmKTReg.ShowModal;
  fmKTReg.Free;

end;

function TForm_Main.KTConfigReg(aCmd:char; aData: string): Boolean;
var
  nTime : integer;
  aDeviceID : string;
begin
  Result := false;
  aDeviceID:= GetDeviceID;

  aData := 'KT97' + aData;
  bKTConfig := False;
  SendPacket(aDeviceID, aCmd, aData, True);

  nTime := 0;
  while Not bKTConfig do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.KTDeviceReg(aCmd:char; aData: string): Boolean;
var
  nTime : integer;
  aDeviceID : string;
begin
  Result := false;
  aDeviceID:= GetDeviceID;

  aData := 'KT79' + aData;
  bKTDevice := False;
  SendPacket(aDeviceID, aCmd, aData, True);

  nTime := 0;
  while Not bKTDevice do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.RcvKTConfig(aData: string): Boolean;
begin

  Delete(aData, 1, 1);
  bKTConfig := True;
  if bKTRegShow then fmKTReg.KTConfigRecv(aData);

end;

function TForm_Main.RcvKTDevice(aData: string): Boolean;
begin

  Delete(aData, 1, 1);
  bKTDevice := True;
  if bKTRegShow then fmKTReg.KTDeviceRecv(aData);

end;

procedure TForm_Main.btn_ImageLanClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
  aMode : string;
begin

  aDeviceID:= GetDeviceID;


  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Writewiznet(aDeviceID,'127.0.0.1','255.255.255.0','192.168.10.1','3000',ed_ImageSIP.text,ed_ImageSport.Text,'02','02');
    if Not bConnected then Exit;
    if bResult then break;
  end;

end;

procedure TForm_Main.btn_ImageSearchClick(Sender: TObject);
var
  aData: string;
  nTime: integer;
  aDeviceID : string;
begin
  aDeviceID:= GetDeviceID;
  aData := 'NW02';
  bWiznetCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
end;

procedure TForm_Main.RcvImgWiznetInfo(aData: string);
var
  I: Integer;
  TempStr: string;
  st, st2: string;
  DataStr: string;
  ErrorLog: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr := Copy(aData, 22, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

  bWiznetCheck := True;

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    //Wiznet 조회 요청 처리 할것
    //WizNetRcvACK:= True;
    //btnCheckwiznetClick(Self);

//   Exit;
  end;

  //2.MAC Address
  TempStr := 'MAC Addr;' + FMacAddress;
  //LMDListBox1.Items.Add(TempStr);

  //3.Mode (Server mode: 01, Client mode: 00)
  TempStr := 'Client Mode;';
//  if FMode = '00' then Rg_Mode.ItemIndex  := 1
//  else Rg_Mode.ItemIndex  := 0;
  UpdateMode('00',inttostr(rg_mode.ItemIndex));
  //LMDListBox1.Items.Add(TempStr);

  // 4.IP address ★★★★★
  st2 := '';
  st := Hex2Ascii(FIPAddress);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;

  //Edit_IP.Text := st2;
  //Edit_IP.Color := clYellow;
  TempStr := 'Local/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 5.Subnet mask ★★★★★
  st2 := '';
  st := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  //Edit_subnet.Text := st2;
  //Edit_subnet.Color := clYellow;
  TempStr := 'Local/SubNet;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 6.Gateway address  ★★★★★
  st2 := '';
  st := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  //edit_Gateway.Text := st2;
  //edit_Gateway.Color := clYellow;
  TempStr := 'Local/Gateway;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //7.Port number (Client) ★★★★★
  st2 := Hex2DecStr(FClientPort);
  //edit_port.Text := st2;
  //edit_port.Color := clYellow;
  TempStr := 'Local/Port;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //8. Server IP address
  st2 := '';
  st := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  ed_ImageSIP.Color:= clYellow;
  ed_ImageSIP.Text:= st2;
  TempStr := 'Server/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //9.  Port number (Server)
  st2 := '';
  st2 := Hex2DecStr(FServerPort);
  TempStr := 'Server/Port;' + st2;
  ed_ImageSPort.Text := st2;
  ed_ImageSPort.Color := clyellow;
  //Edit_Serverport.Color:= clYellow;
  //Edit_Serverport.Text:= st2;
  //LMDListBox1.Items.Add(TempStr);

  //10. Serial speed (bps)
  TempStr := 'Serial/Baud;';

  if FSerial_Baud = 'F4' then TempStr := TempStr + '9600[F4]'
  else if FSerial_Baud = 'FA' then TempStr := TempStr + '19200[FA]'
  else if FSerial_Baud = 'FD' then TempStr := TempStr + '38400[FD]'
  else if FSerial_Baud = 'FE' then TempStr := TempStr + '57600[FE]'
  else if FSerial_Baud = 'FF' then TempStr := TempStr + '115200[FF]'
  else TempStr := TempStr + FSerial_Baud;
  //LMDListBox1.Items.Add(TempStr);

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  TempStr := 'Serial/Data;';
  if FSerial_data = '07' then TempStr := TempStr + '7'
  else if FSerial_data = '08' then TempStr := TempStr + '8'
  else TempStr := TempStr + 'error:' + FSerial_data;
  //LMDListBox1.Items.Add(TempStr);

  //12. Parity (00: No), (01: Odd), (02: Even)
  TempStr := 'Serial/Parity;';
  if FSerial_Parity = '00' then TempStr := TempStr + 'No'
  else if FSerial_Parity = '01' then TempStr := TempStr + 'Odd'
  else if FSerial_Parity = '02' then TempStr := TempStr + 'even'
  else TempStr := TempStr + 'error:' + FSerial_Parity;
  //LMDListBox1.Items.Add(TempStr);

  //13. Stop bit
  TempStr := 'Serial/Stop;';
  if FSerial_stop = '01' then TempStr := TempStr + '1'
  else TempStr := TempStr + 'error:' + FSerial_stop;
  //LMDListBox1.Items.Add(TempStr);

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  TempStr := 'Serial/Flow;';
  if FSerial_flow = '00' then TempStr := TempStr + 'None'
  else if FSerial_flow = '01' then TempStr := TempStr + 'XON/XOFF'
  else if FSerial_flow = '02' then TempStr := TempStr + 'CTS/RTS'
  else TempStr := TempStr + 'error:' + FSerial_flow;
  //LMDListBox1.Items.Add(TempStr);

  //15. Delimiter char
  TempStr := 'Delimiter/char;';
  TempStr := TempStr + FDelimiterChar;
  //LMDListBox1.Items.Add(TempStr);

  //16.Delimiter size
  TempStr := 'Delimiter/Size;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterSize);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //17. Delimiter time
  TempStr := 'Delimiter/Time;';
  st2 := '';
  st2 := Hex2DecStr(FDelimitertime);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //18.Delimiter idle time
  TempStr := 'Delimiter/idleTime;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterIdle);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //19. Debug code (00: ON), (01: OFF)
  TempStr := 'Debug Mode;';
  if FDebugMode = '00' then TempStr := TempStr + 'ON[00]'
  else TempStr := TempStr + 'OFF[01]';
  //LMDListBox1.Items.Add(TempStr);

  //20.Software major version
  TempStr := 'version;';
  st := Hex2Ascii(FROMVer);
  TempStr := TempStr + IntToStr(Ord(st[1])) + '.' + IntToStr(Ord(st[2]));
  //LMDListBox1.Items.Add(TempStr);

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)

  TempStr := 'DHCP;';
  if FOnDHCP = '01' then
  begin
    //Checkbox_DHCP.Checked:= True;
    TempStr := TempStr + 'ON[01]'
  end else if FOnDHCP = '00' then
  begin
    //Checkbox_DHCP.Checked:= False;
    TempStr := TempStr + 'OFF[00]';
  end;

  ErrorLog := '';

  if FMode <> Copy(wiznetData, 15, 2) then
    ErrorLog := ErrorLog + 'Mode:' + Copy(wiznetData, 15, 2) + '<>' + FMode + #13;
  if FIPAddress <> Copy(wiznetData, 17, 8) then
    ErrorLog := ErrorLog + 'IPAddress:' + Copy(wiznetData, 17,
      8) + '<>' + FIPAddress + #13;
  if FSubnet <> Copy(wiznetData, 25, 8) then
    ErrorLog := ErrorLog + 'SubNet:' + Copy(wiznetData, 25,
      8) + '<>' + FSubnet + #13;
  if FGateway <> Copy(wiznetData, 33, 8) then
    ErrorLog := ErrorLog + 'Gateway:' + Copy(wiznetData, 33,
      8) + '<>' + FGateway + #13;
  if FClientPort <> Copy(wiznetData, 41, 4) then
    ErrorLog := ErrorLog + 'ClientPort:' + Copy(wiznetData, 41,
      8) + '<>' + FClientPort + #13;
  if FServerIP <> Copy(wiznetData, 45, 8) then
    ErrorLog := ErrorLog + 'ServerIP:' + Copy(wiznetData, 45,
      8) + '<>' + FServerIP + #13;
  if FServerPort <> Copy(wiznetData, 53, 4) then
    ErrorLog := ErrorLog + 'ServerPort:' + Copy(wiznetData, 53,
      8) + '<>' + FServerPort + #13;
  if FSerial_Baud <> Copy(wiznetData, 57, 2) then
    ErrorLog := ErrorLog + 'Serial_Baud:' + Copy(wiznetData, 57,
      2) + '<>' + FSerial_Baud + #13;
  if FSerial_data <> Copy(wiznetData, 59, 2) then
    ErrorLog := ErrorLog + 'Serial_data:' + Copy(wiznetData, 59,
      2) + '<>' + FSerial_data + #13;
  if FSerial_Parity <> Copy(wiznetData, 61, 2) then
    ErrorLog := ErrorLog + 'Serial_Parity:' + Copy(wiznetData, 61,
      2) + '<>' + FSerial_Parity + #13;
  if FSerial_stop <> Copy(wiznetData, 63, 2) then
    Errorlog := Errorlog + 'Serial_stop:' + Copy(wiznetData, 63,
      2) + '<>' + FSerial_stop + #13;
  if FSerial_flow <> Copy(wiznetData, 65, 2) then
    Errorlog := Errorlog + 'Serial_flow:' + Copy(wiznetData, 65,
      2) + '<>' + FSerial_flow + #13;
  if FDelimiterChar <> Copy(wiznetData, 67, 2) then
    Errorlog := Errorlog + 'DelimiterChar:' + Copy(wiznetData, 67,
      2) + '<>' + FDelimiterChar + #13;
  if FDelimiterSize <> Copy(wiznetData, 69, 4) then
    Errorlog := Errorlog + 'DelimiterSize:' + Copy(wiznetData, 69,
      2) + '<>' + FDelimiterSize + #13;
  if FDelimitertime <> Copy(wiznetData, 73, 4) then
    Errorlog := Errorlog + 'Delimitertime:' + Copy(wiznetData, 73,
      4) + '<>' + FDelimitertime + #13;
  if FDelimiterIdle <> Copy(wiznetData, 77, 4) then
    Errorlog := Errorlog + 'DelimiterIdle:' + Copy(wiznetData, 77,
      4) + '<>' + FDelimiterIdle + #13;
  if FDebugMode <> Copy(wiznetData, 81, 2) then
    Errorlog := Errorlog + 'DebugMode:' + Copy(wiznetData, 81,
      4) + '<>' + FDebugMode + #13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData, 87, 2) then
    Errorlog := Errorlog + 'OnDHCP:' + Copy(wiznetData, 87, 4) + '<>' + FOnDHCP;
  if FReserve <> Copy(wiznetData, 89, 6) then
    //if (Errorlog <> '') and (WizNetRegMode = True) then
    if Errorlog <> '' then
    begin
      Errorlog := '설정값과 응답값이 틀립니다.' + #13 +
        '===========================' + #13 + '  설정값 < ===== > 응답값  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
  }

end;

procedure TForm_Main.btn_adminsetClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
  aMode : string;
begin
  aDeviceID:= GetDeviceID;


  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Writewiznet(aDeviceID,'127.0.0.1','255.255.255.0','192.168.10.1','3000',ed_AdminIP.text,ed_Adminport.Text,'02','01');
    if Not bConnected then Exit;
    if bResult then break;
  end;

end;

procedure TForm_Main.btn_AdminSearchClick(Sender: TObject);
var
  aData: string;
  nTime: integer;
  aDeviceID : string;
begin
  aDeviceID:= GetDeviceID;
  aData := 'NW01';
  bWiznetCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
end;

procedure TForm_Main.RcvAdminWiznetInfo(aData: string);
var
  I: Integer;
  TempStr: string;
  st, st2: string;
  DataStr: string;
  ErrorLog: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr := Copy(aData, 22, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

  bWiznetCheck := True;

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    //Wiznet 조회 요청 처리 할것
    //WizNetRcvACK:= True;
    //btnCheckwiznetClick(Self);

//   Exit;
  end;

  //2.MAC Address
  TempStr := 'MAC Addr;' + FMacAddress;
  //LMDListBox1.Items.Add(TempStr);

  //3.Mode (Server mode: 01, Client mode: 00)
  TempStr := 'Client Mode;';
//  if FMode = '00' then Rg_Mode.ItemIndex  := 1
//  else Rg_Mode.ItemIndex  := 0;
  UpdateMode('00',inttostr(rg_mode.ItemIndex));
  //LMDListBox1.Items.Add(TempStr);

  // 4.IP address ★★★★★
  st2 := '';
  st := Hex2Ascii(FIPAddress);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;

  //Edit_IP.Text := st2;
  //Edit_IP.Color := clYellow;
  TempStr := 'Local/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 5.Subnet mask ★★★★★
  st2 := '';
  st := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  //Edit_subnet.Text := st2;
  //Edit_subnet.Color := clYellow;
  TempStr := 'Local/SubNet;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 6.Gateway address  ★★★★★
  st2 := '';
  st := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  //edit_Gateway.Text := st2;
  //edit_Gateway.Color := clYellow;
  TempStr := 'Local/Gateway;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //7.Port number (Client) ★★★★★
  st2 := Hex2DecStr(FClientPort);
  //edit_port.Text := st2;
  //edit_port.Color := clYellow;
  TempStr := 'Local/Port;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //8. Server IP address
  st2 := '';
  st := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  ed_AdminIP.Color:= clYellow;
  ed_AdminIP.Text:= st2;
  TempStr := 'Server/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //9.  Port number (Server)
  st2 := '';
  st2 := Hex2DecStr(FServerPort);
  TempStr := 'Server/Port;' + st2;
  ed_AdminPort.Text := st2;
  ed_AdminPort.Color := clyellow;
  //Edit_Serverport.Color:= clYellow;
  //Edit_Serverport.Text:= st2;
  //LMDListBox1.Items.Add(TempStr);

  //10. Serial speed (bps)
  TempStr := 'Serial/Baud;';

  if FSerial_Baud = 'F4' then TempStr := TempStr + '9600[F4]'
  else if FSerial_Baud = 'FA' then TempStr := TempStr + '19200[FA]'
  else if FSerial_Baud = 'FD' then TempStr := TempStr + '38400[FD]'
  else if FSerial_Baud = 'FE' then TempStr := TempStr + '57600[FE]'
  else if FSerial_Baud = 'FF' then TempStr := TempStr + '115200[FF]'
  else TempStr := TempStr + FSerial_Baud;
  //LMDListBox1.Items.Add(TempStr);

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  TempStr := 'Serial/Data;';
  if FSerial_data = '07' then TempStr := TempStr + '7'
  else if FSerial_data = '08' then TempStr := TempStr + '8'
  else TempStr := TempStr + 'error:' + FSerial_data;
  //LMDListBox1.Items.Add(TempStr);

  //12. Parity (00: No), (01: Odd), (02: Even)
  TempStr := 'Serial/Parity;';
  if FSerial_Parity = '00' then TempStr := TempStr + 'No'
  else if FSerial_Parity = '01' then TempStr := TempStr + 'Odd'
  else if FSerial_Parity = '02' then TempStr := TempStr + 'even'
  else TempStr := TempStr + 'error:' + FSerial_Parity;
  //LMDListBox1.Items.Add(TempStr);

  //13. Stop bit
  TempStr := 'Serial/Stop;';
  if FSerial_stop = '01' then TempStr := TempStr + '1'
  else TempStr := TempStr + 'error:' + FSerial_stop;
  //LMDListBox1.Items.Add(TempStr);

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  TempStr := 'Serial/Flow;';
  if FSerial_flow = '00' then TempStr := TempStr + 'None'
  else if FSerial_flow = '01' then TempStr := TempStr + 'XON/XOFF'
  else if FSerial_flow = '02' then TempStr := TempStr + 'CTS/RTS'
  else TempStr := TempStr + 'error:' + FSerial_flow;
  //LMDListBox1.Items.Add(TempStr);

  //15. Delimiter char
  TempStr := 'Delimiter/char;';
  TempStr := TempStr + FDelimiterChar;
  //LMDListBox1.Items.Add(TempStr);

  //16.Delimiter size
  TempStr := 'Delimiter/Size;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterSize);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //17. Delimiter time
  TempStr := 'Delimiter/Time;';
  st2 := '';
  st2 := Hex2DecStr(FDelimitertime);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //18.Delimiter idle time
  TempStr := 'Delimiter/idleTime;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterIdle);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //19. Debug code (00: ON), (01: OFF)
  TempStr := 'Debug Mode;';
  if FDebugMode = '00' then TempStr := TempStr + 'ON[00]'
  else TempStr := TempStr + 'OFF[01]';
  //LMDListBox1.Items.Add(TempStr);

  //20.Software major version
  TempStr := 'version;';
  st := Hex2Ascii(FROMVer);
  TempStr := TempStr + IntToStr(Ord(st[1])) + '.' + IntToStr(Ord(st[2]));
  //LMDListBox1.Items.Add(TempStr);

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)

  TempStr := 'DHCP;';
  if FOnDHCP = '01' then
  begin
    //Checkbox_DHCP.Checked:= True;
    TempStr := TempStr + 'ON[01]'
  end else if FOnDHCP = '00' then
  begin
    //Checkbox_DHCP.Checked:= False;
    TempStr := TempStr + 'OFF[00]';
  end;

  ErrorLog := '';

  if FMode <> Copy(wiznetData, 15, 2) then
    ErrorLog := ErrorLog + 'Mode:' + Copy(wiznetData, 15, 2) + '<>' + FMode + #13;
  if FIPAddress <> Copy(wiznetData, 17, 8) then
    ErrorLog := ErrorLog + 'IPAddress:' + Copy(wiznetData, 17,
      8) + '<>' + FIPAddress + #13;
  if FSubnet <> Copy(wiznetData, 25, 8) then
    ErrorLog := ErrorLog + 'SubNet:' + Copy(wiznetData, 25,
      8) + '<>' + FSubnet + #13;
  if FGateway <> Copy(wiznetData, 33, 8) then
    ErrorLog := ErrorLog + 'Gateway:' + Copy(wiznetData, 33,
      8) + '<>' + FGateway + #13;
  if FClientPort <> Copy(wiznetData, 41, 4) then
    ErrorLog := ErrorLog + 'ClientPort:' + Copy(wiznetData, 41,
      8) + '<>' + FClientPort + #13;
  if FServerIP <> Copy(wiznetData, 45, 8) then
    ErrorLog := ErrorLog + 'ServerIP:' + Copy(wiznetData, 45,
      8) + '<>' + FServerIP + #13;
  if FServerPort <> Copy(wiznetData, 53, 4) then
    ErrorLog := ErrorLog + 'ServerPort:' + Copy(wiznetData, 53,
      8) + '<>' + FServerPort + #13;
  if FSerial_Baud <> Copy(wiznetData, 57, 2) then
    ErrorLog := ErrorLog + 'Serial_Baud:' + Copy(wiznetData, 57,
      2) + '<>' + FSerial_Baud + #13;
  if FSerial_data <> Copy(wiznetData, 59, 2) then
    ErrorLog := ErrorLog + 'Serial_data:' + Copy(wiznetData, 59,
      2) + '<>' + FSerial_data + #13;
  if FSerial_Parity <> Copy(wiznetData, 61, 2) then
    ErrorLog := ErrorLog + 'Serial_Parity:' + Copy(wiznetData, 61,
      2) + '<>' + FSerial_Parity + #13;
  if FSerial_stop <> Copy(wiznetData, 63, 2) then
    Errorlog := Errorlog + 'Serial_stop:' + Copy(wiznetData, 63,
      2) + '<>' + FSerial_stop + #13;
  if FSerial_flow <> Copy(wiznetData, 65, 2) then
    Errorlog := Errorlog + 'Serial_flow:' + Copy(wiznetData, 65,
      2) + '<>' + FSerial_flow + #13;
  if FDelimiterChar <> Copy(wiznetData, 67, 2) then
    Errorlog := Errorlog + 'DelimiterChar:' + Copy(wiznetData, 67,
      2) + '<>' + FDelimiterChar + #13;
  if FDelimiterSize <> Copy(wiznetData, 69, 4) then
    Errorlog := Errorlog + 'DelimiterSize:' + Copy(wiznetData, 69,
      2) + '<>' + FDelimiterSize + #13;
  if FDelimitertime <> Copy(wiznetData, 73, 4) then
    Errorlog := Errorlog + 'Delimitertime:' + Copy(wiznetData, 73,
      4) + '<>' + FDelimitertime + #13;
  if FDelimiterIdle <> Copy(wiznetData, 77, 4) then
    Errorlog := Errorlog + 'DelimiterIdle:' + Copy(wiznetData, 77,
      4) + '<>' + FDelimiterIdle + #13;
  if FDebugMode <> Copy(wiznetData, 81, 2) then
    Errorlog := Errorlog + 'DebugMode:' + Copy(wiznetData, 81,
      4) + '<>' + FDebugMode + #13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData, 87, 2) then
    Errorlog := Errorlog + 'OnDHCP:' + Copy(wiznetData, 87, 4) + '<>' + FOnDHCP;
  if FReserve <> Copy(wiznetData, 89, 6) then
    //if (Errorlog <> '') and (WizNetRegMode = True) then
    if Errorlog <> '' then
    begin
      Errorlog := '설정값과 응답값이 틀립니다.' + #13 +
        '===========================' + #13 + '  설정값 < ===== > 응답값  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
  }

end;

procedure TForm_Main.btn_Lan2SetClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
  aMode : string;
begin
  aDeviceID:= GetDeviceID;


  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := Writewiznet(aDeviceID,ed_IP2.Text,ed_SubNet2.Text,ed_GateWay2.Text ,ed_Port2.Text ,ed_LocalServerIP.text,ed_LocalServerport.Text,'02','10');
    if Not bConnected then Exit;
    if bResult then break;
  end;

end;

procedure TForm_Main.RcvLocalPcWiznetInfo(aData: string);
var
  I: Integer;
  TempStr: string;
  st, st2: string;
  DataStr: string;
  ErrorLog: string;
  FHeader: string[2];
  FMacAddress: string[12];
  FMode: string[2];
  FIPAddress: string[8];
  FSubnet: string[8];
  FGateway: string[8];
  FClientPort: string[4];
  FServerIP: string[8];
  FServerPort: string[4];
  FSerial_Baud: string[2];
  FSerial_data: string[2];
  FSerial_Parity: string[2];
  FSerial_stop: string[2];
  FSerial_flow: string[2];
  FDelimiterChar: string[2];
  FDelimiterSize: string[4];
  FDelimitertime: string[4];
  FDelimiterIdle: string[4];
  FDebugMode: string[2];
  FROMVer: string[4];
  FOnDHCP: string[2];
  FReserve: string[4];
begin
  Delete(aData, 1, 1);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  DataStr := Copy(aData, 22, 94);

  FHeader := Copy(DataStr, 1, 2);
  FMacAddress := Copy(DataStr, 3, 12);
  FMode := Copy(DataStr, 15, 2);
  FIPAddress := Copy(DataStr, 17, 8);
  FSubnet := Copy(DataStr, 25, 8);
  FGateway := Copy(DataStr, 33, 8);
  FClientPort := Copy(DataStr, 41, 4);
  FServerIP := Copy(DataStr, 45, 8);
  FServerPort := Copy(DataStr, 53, 4);
  FSerial_Baud := Copy(DataStr, 57, 2);
  FSerial_data := Copy(DataStr, 59, 2);
  FSerial_Parity := Copy(DataStr, 61, 2);
  FSerial_stop := Copy(DataStr, 63, 2);
  FSerial_flow := Copy(DataStr, 65, 2);
  FDelimiterChar := Copy(DataStr, 67, 2);
  FDelimiterSize := Copy(DataStr, 69, 4);
  FDelimitertime := Copy(DataStr, 73, 4);
  FDelimiterIdle := Copy(DataStr, 77, 4);
  FDebugMode := Copy(DataStr, 81, 2);
  FROMVer := Copy(DataStr, 83, 4);
  FOnDHCP := Copy(DataStr, 87, 2);
  FReserve := Copy(DataStr, 89, 6);

  bWiznetCheck := True;

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    //Wiznet 조회 요청 처리 할것
    //WizNetRcvACK:= True;
    //btnCheckwiznetClick(Self);

//   Exit;
  end;

  //2.MAC Address
  TempStr := 'MAC Addr;' + FMacAddress;
  //LMDListBox1.Items.Add(TempStr);

  //3.Mode (Server mode: 01, Client mode: 00)
  TempStr := 'Client Mode;';
//  if FMode = '00' then Rg_Mode.ItemIndex  := 1
//  else Rg_Mode.ItemIndex  := 0;
  UpdateMode('00',inttostr(rg_mode.ItemIndex));
  //LMDListBox1.Items.Add(TempStr);

  // 4.IP address ★★★★★
  st2 := '';
  st := Hex2Ascii(FIPAddress);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;

  Ed_IP2.Text := st2;
  Ed_IP2.Color := clYellow;
  TempStr := 'Local/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 5.Subnet mask ★★★★★
  st2 := '';
  st := Hex2Ascii(FSubnet);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  Ed_subnet2.Text := st2;
  Ed_subnet2.Color := clYellow;
  TempStr := 'Local/SubNet;' + st2;
  //LMDListBox1.Items.Add(TempStr);

  // 6.Gateway address  ★★★★★
  st2 := '';
  st := Hex2Ascii(FGateway);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  ed_Gateway2.Text := st2;
  ed_Gateway2.Color := clYellow;
  TempStr := 'Local/Gateway;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //7.Port number (Client) ★★★★★
  st2 := Hex2DecStr(FClientPort);
  ed_port2.Text := st2;
  ed_port2.Color := clYellow;
  TempStr := 'Local/Port;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //8. Server IP address
  st2 := '';
  st := Hex2Ascii(FServerIP);
  for I := 1 to 4 do
  begin
    if I < 4 then st2 := st2 + IntToStr(Ord(st[I])) + '.'
    else st2 := st2 + IntToStr(Ord(st[I]));
  end;
  ed_LocalserverIp.Color:= clYellow;
  ed_LocalserverIp.Text:= st2;
  TempStr := 'Server/IP;' + st2;
  //LMDListBox1.Items.Add(TempStr);


  //9.  Port number (Server)
  st2 := '';
  st2 := Hex2DecStr(FServerPort);
  TempStr := 'Server/Port;' + st2;
  ed_LocalserverPort.Text := st2;
  ed_LocalserverPort.Color := clyellow;
  //Edit_Serverport.Color:= clYellow;
  //Edit_Serverport.Text:= st2;
  //LMDListBox1.Items.Add(TempStr);

  //10. Serial speed (bps)
  TempStr := 'Serial/Baud;';

  if FSerial_Baud = 'F4' then TempStr := TempStr + '9600[F4]'
  else if FSerial_Baud = 'FA' then TempStr := TempStr + '19200[FA]'
  else if FSerial_Baud = 'FD' then TempStr := TempStr + '38400[FD]'
  else if FSerial_Baud = 'FE' then TempStr := TempStr + '57600[FE]'
  else if FSerial_Baud = 'FF' then TempStr := TempStr + '115200[FF]'
  else TempStr := TempStr + FSerial_Baud;
  //LMDListBox1.Items.Add(TempStr);

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  TempStr := 'Serial/Data;';
  if FSerial_data = '07' then TempStr := TempStr + '7'
  else if FSerial_data = '08' then TempStr := TempStr + '8'
  else TempStr := TempStr + 'error:' + FSerial_data;
  //LMDListBox1.Items.Add(TempStr);

  //12. Parity (00: No), (01: Odd), (02: Even)
  TempStr := 'Serial/Parity;';
  if FSerial_Parity = '00' then TempStr := TempStr + 'No'
  else if FSerial_Parity = '01' then TempStr := TempStr + 'Odd'
  else if FSerial_Parity = '02' then TempStr := TempStr + 'even'
  else TempStr := TempStr + 'error:' + FSerial_Parity;
  //LMDListBox1.Items.Add(TempStr);

  //13. Stop bit
  TempStr := 'Serial/Stop;';
  if FSerial_stop = '01' then TempStr := TempStr + '1'
  else TempStr := TempStr + 'error:' + FSerial_stop;
  //LMDListBox1.Items.Add(TempStr);

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  TempStr := 'Serial/Flow;';
  if FSerial_flow = '00' then TempStr := TempStr + 'None'
  else if FSerial_flow = '01' then TempStr := TempStr + 'XON/XOFF'
  else if FSerial_flow = '02' then TempStr := TempStr + 'CTS/RTS'
  else TempStr := TempStr + 'error:' + FSerial_flow;
  //LMDListBox1.Items.Add(TempStr);

  //15. Delimiter char
  TempStr := 'Delimiter/char;';
  TempStr := TempStr + FDelimiterChar;
  //LMDListBox1.Items.Add(TempStr);

  //16.Delimiter size
  TempStr := 'Delimiter/Size;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterSize);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //17. Delimiter time
  TempStr := 'Delimiter/Time;';
  st2 := '';
  st2 := Hex2DecStr(FDelimitertime);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //18.Delimiter idle time
  TempStr := 'Delimiter/idleTime;';
  st2 := '';
  st2 := Hex2DecStr(FDelimiterIdle);
  TempStr := TempStr + st2;
  //LMDListBox1.Items.Add(TempStr);

  //19. Debug code (00: ON), (01: OFF)
  TempStr := 'Debug Mode;';
  if FDebugMode = '00' then TempStr := TempStr + 'ON[00]'
  else TempStr := TempStr + 'OFF[01]';
  //LMDListBox1.Items.Add(TempStr);

  //20.Software major version
  TempStr := 'version;';
  st := Hex2Ascii(FROMVer);
  TempStr := TempStr + IntToStr(Ord(st[1])) + '.' + IntToStr(Ord(st[2]));
  //LMDListBox1.Items.Add(TempStr);

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)

  TempStr := 'DHCP;';
  if FOnDHCP = '01' then
  begin
    //Checkbox_DHCP.Checked:= True;
    TempStr := TempStr + 'ON[01]'
  end else if FOnDHCP = '00' then
  begin
    //Checkbox_DHCP.Checked:= False;
    TempStr := TempStr + 'OFF[00]';
  end;

  ErrorLog := '';

  if FMode <> Copy(wiznetData, 15, 2) then
    ErrorLog := ErrorLog + 'Mode:' + Copy(wiznetData, 15, 2) + '<>' + FMode + #13;
  if FIPAddress <> Copy(wiznetData, 17, 8) then
    ErrorLog := ErrorLog + 'IPAddress:' + Copy(wiznetData, 17,
      8) + '<>' + FIPAddress + #13;
  if FSubnet <> Copy(wiznetData, 25, 8) then
    ErrorLog := ErrorLog + 'SubNet:' + Copy(wiznetData, 25,
      8) + '<>' + FSubnet + #13;
  if FGateway <> Copy(wiznetData, 33, 8) then
    ErrorLog := ErrorLog + 'Gateway:' + Copy(wiznetData, 33,
      8) + '<>' + FGateway + #13;
  if FClientPort <> Copy(wiznetData, 41, 4) then
    ErrorLog := ErrorLog + 'ClientPort:' + Copy(wiznetData, 41,
      8) + '<>' + FClientPort + #13;
  if FServerIP <> Copy(wiznetData, 45, 8) then
    ErrorLog := ErrorLog + 'ServerIP:' + Copy(wiznetData, 45,
      8) + '<>' + FServerIP + #13;
  if FServerPort <> Copy(wiznetData, 53, 4) then
    ErrorLog := ErrorLog + 'ServerPort:' + Copy(wiznetData, 53,
      8) + '<>' + FServerPort + #13;
  if FSerial_Baud <> Copy(wiznetData, 57, 2) then
    ErrorLog := ErrorLog + 'Serial_Baud:' + Copy(wiznetData, 57,
      2) + '<>' + FSerial_Baud + #13;
  if FSerial_data <> Copy(wiznetData, 59, 2) then
    ErrorLog := ErrorLog + 'Serial_data:' + Copy(wiznetData, 59,
      2) + '<>' + FSerial_data + #13;
  if FSerial_Parity <> Copy(wiznetData, 61, 2) then
    ErrorLog := ErrorLog + 'Serial_Parity:' + Copy(wiznetData, 61,
      2) + '<>' + FSerial_Parity + #13;
  if FSerial_stop <> Copy(wiznetData, 63, 2) then
    Errorlog := Errorlog + 'Serial_stop:' + Copy(wiznetData, 63,
      2) + '<>' + FSerial_stop + #13;
  if FSerial_flow <> Copy(wiznetData, 65, 2) then
    Errorlog := Errorlog + 'Serial_flow:' + Copy(wiznetData, 65,
      2) + '<>' + FSerial_flow + #13;
  if FDelimiterChar <> Copy(wiznetData, 67, 2) then
    Errorlog := Errorlog + 'DelimiterChar:' + Copy(wiznetData, 67,
      2) + '<>' + FDelimiterChar + #13;
  if FDelimiterSize <> Copy(wiznetData, 69, 4) then
    Errorlog := Errorlog + 'DelimiterSize:' + Copy(wiznetData, 69,
      2) + '<>' + FDelimiterSize + #13;
  if FDelimitertime <> Copy(wiznetData, 73, 4) then
    Errorlog := Errorlog + 'Delimitertime:' + Copy(wiznetData, 73,
      4) + '<>' + FDelimitertime + #13;
  if FDelimiterIdle <> Copy(wiznetData, 77, 4) then
    Errorlog := Errorlog + 'DelimiterIdle:' + Copy(wiznetData, 77,
      4) + '<>' + FDelimiterIdle + #13;
  if FDebugMode <> Copy(wiznetData, 81, 2) then
    Errorlog := Errorlog + 'DebugMode:' + Copy(wiznetData, 81,
      4) + '<>' + FDebugMode + #13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData, 87, 2) then
    Errorlog := Errorlog + 'OnDHCP:' + Copy(wiznetData, 87, 4) + '<>' + FOnDHCP;
  if FReserve <> Copy(wiznetData, 89, 6) then
    //if (Errorlog <> '') and (WizNetRegMode = True) then
    if Errorlog <> '' then
    begin
      Errorlog := '설정값과 응답값이 틀립니다.' + #13 +
        '===========================' + #13 + '  설정값 < ===== > 응답값  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
  }


end;

procedure TForm_Main.btn_LanSearchClick(Sender: TObject);
var
  aData: string;
  nTime: integer;
  aDeviceID : string;
begin
  aDeviceID:= GetDeviceID;
  aData := 'NW10';
  bWiznetCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

end;

procedure TForm_Main.btnKTLanSearchClick(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := GetMcuID + '00';
  SendPacket(stDeviceID, 'Q', 'NW50', True);
end;

procedure TForm_Main.btnKTLanSetClick(Sender: TObject);
var
  stSendData : string;
  stDeviceID : string;
  bResult : boolean;
begin
  bResult := LanPanelCheck;
  if Not bResult then
  begin
    IsStop := True;
    showmessage('랜정보 셋팅데이터가 정확하지 않습니다.');
    Exit;
  end;
  stDeviceID := GetMcuID + '00';
  stSendData := 'NW50' + GetSetData;
  SendPacket(stDeviceID, 'I', stSendData, True);
end;

function TForm_Main.GetSetData: string;
var
  stData : string;
begin
  stData := '1';  //네트웍정보
  stData := stData + '000000000000';          //MAC
  stData := stData + IPtoHex(ed_ip.Text);           //IP
  stData := stData + IPtoHex(ed_subnet.Text);       //SUBNET
  stData := stData + IPtoHex(ed_gateway.Text);      //GateWay
  stData := stData + PortToHex(ed_port.Text);       //Port
  stData := stData + IPtoHex(ed_ServerIp.Text);     //ServerIp
  stData := stData + PortToHex(ed_ServerPort.Text); //ServerPort
  if rg_nm.ItemIndex = 0 then                       //NetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_Dhcp.ItemIndex < 0 then rg_Dhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_Dhcp.ItemIndex);
  stData := stData + ed_Constate.Text;               //Connect Sate
  stData := stData + '^';
  if chk_Local.Checked then stData := stData + '1'  //로칼 네트웍 정보
  else stData := stData + '0';
  stData := stData + '000000000000'; //Local Mac
  stData := stData + IPtoHex(ed_Localip.Text);           //LocalIP
  stData := stData + IPtoHex(ed_Localsubnet.Text);       //LocalSUBNET
  stData := stData + IPtoHex(ed_Localgateway.Text);      //LocalGateWay
  stData := stData + PortToHex(ed_Localport.Text);       //LocalPort
  stData := stData + IPtoHex(ed_LocalServerIp.Text);     //LocalServerIp
  stData := stData + PortToHex(ed_LocalServerPort.Text); //LocalServerPort
  if rg_Localnm.ItemIndex = 0 then                       //LocalNetWork Mode
    stData := stData + 'C'
  else stData := stData + 'S';
  if rg_LocalDhcp.ItemIndex < 0 then rg_LocalDhcp.ItemIndex := 0;
  stData := stData + inttostr(rg_LocalDhcp.ItemIndex);
  stData := stData + ed_LocalConstate.Text;               //LocalConnect Sate
  stData := stData + '^';
  stData := stData + IPtoHex(ed_AVServerIP.Text);         //AV Manager Server Ip
  stData := stData + PortToHex(ed_AVServerPort.Text);     //AV Manager Server Port
  stData := stData + IPtoHex(ed_UserAVIP.Text);         //AV Generl Server Ip
  stData := stData + PortToHex(ed_UserAVPort.Text);     //AV Generl Server Port
  if rg_Debug.ItemIndex < 0 then rg_Debug.ItemIndex := 0;
  stData := stData + inttostr(rg_Debug.ItemIndex);
  stData := stData + FillSpace(ed_Version.Text,4);

  result := stData;
end;

function TForm_Main.HexToIP(aHex: string): string;
var
  stData:string;
  stTemp : string;
  nTemp : integer;
  i : integer;
begin
  if Length(aHex) < 8 then
  begin
    result := '';
    Exit;
  end;
  aHex := Hex2Ascii(aHex);
  stData := '';
  for i:=1 to 4 do
  begin
    if I < 4 then stData := stData + IntToStr(Ord(aHex[I])) + '.'
    else stData := stData + IntToStr(Ord(aHex[I]));
  end;
  result := stData ;
end;

function TForm_Main.IPtoHex(aIP: string): string;
var
  stTemp : string;
  i : integer;
  nTemp : integer;
  stData : string;
begin
  stData := '';
  for i := 0 to 3 do
  begin
    stTemp  := FindCharCopy(aIP, i, '.');
    nTemp  := StrToInt(stTemp);
    stData := stData + Char(nTemp);
  end;
  result := ToHexStrNoSpace(stData);

end;

function TForm_Main.MacFormat(aMac: string): string;
begin
  result := copy(aMac,1,2) + ':' +
            copy(aMac,3,2) + ':' +
            copy(aMac,5,2) + ':' +
            copy(aMac,7,2) + ':' +
            copy(aMac,9,2) + ':' +
            copy(aMac,11,2);

end;

function TForm_Main.PortToHex(aPort: string): string;
var
  stTemp : string;
  i : integer;
  nTemp : integer;
  stData : string;
begin
  stData := '';
  stTemp := Dec2Hex(StrToInt(aPort), 2);
  if Length(stTemp) < 4 then stTemp := '0' + stTemp;
  stData := Chr(Hex2Dec(Copy(stTemp, 1, 2))) + Char(Hex2Dec(Copy(stTemp, 3, 2)));
  result := ToHexStrNoSpace(stData);

end;

function TForm_Main.RcvKTLAN(aPacket: string): Boolean;
begin

//  ed_mac.Text := MacFormat(copy(aPacket,7,12));     //Mac
  ed_ip.Text := HexToIP(copy(aPacket,19,8));         //IP
  ed_Subnet.Text := HexToIP(copy(aPacket,27,8));    //SubNet
  ed_GateWay.Text := HexToIP(copy(aPacket,35,8));   //GateWay
  ed_port.Text := Hex2DecStr(copy(aPacket,43,4));   //Port
  ed_Serverip.Text := HexToIP(copy(aPacket,47,8));  //ServerIP
  ed_ServerPort.Text := Hex2DecStr(copy(aPacket,55,4));  //ServerPort
  if copy(aPacket,59,1) = 'S' then rg_NM.ItemIndex := 1
  else rg_NM.ItemIndex := 0;
  rg_Dhcp.ItemIndex := strtoint(copy(aPacket,60,1));
  if copy(aPacket,61,1) = 'C' then ed_Connect.Text := 'Connected'
  else ed_Connect.Text := 'DisConnected';
  ed_Constate.Text := copy(aPacket,61,1);
  if copy(aPacket,63,1) = '1' then
  begin
    chk_Local.Checked := True;
    ViewLocal;
  end else
  begin
    chk_Local.Checked := False;
    HideLocal;
  end;
  //ed_LocalMac.Text := MacFormat(copy(aPacket,64,12));  //Local Mac
  ed_LocalIP.Text := HexToIP(copy(aPacket,76,8));  //LocalIP
  ed_LocalSubnet.Text := HexToIP(copy(aPacket,84,8));  //LocalSubNet
  ed_LocalGateWay.Text := HexToIP(copy(aPacket,92,8));  //LocalGateWay
  ed_LocalPort.Text := Hex2DecStr(copy(aPacket,100,4));  //LocalPort
  ed_LocalServerIP.Text := HexToIP(copy(aPacket,104,8));  //LocalServerIP
  ed_LocalServerPort.Text := Hex2DecStr(copy(aPacket,112,4));  //LocalServerPort
  if copy(aPacket,116,1) = 'S' then rg_LocalNM.ItemIndex := 1
  else rg_LocalNM.ItemIndex := 0;
  rg_LocalDhcp.ItemIndex := strtoint(copy(aPacket,117,1));
  if copy(aPacket,118,1) = 'C' then ed_LocalConnect.Text := 'Connected'
  else ed_LocalConnect.Text := 'DisConnected';
  ed_LocalConState.Text := copy(aPacket,118,1);
  ed_AVServerIP.Text := HexToIP(copy(aPacket,120,8));  //AV Manager IP
  ed_AVServerPort.Text := Hex2DecStr(copy(aPacket,128,4));  //AV Manager Port
  ed_UserAVIP.Text := HexToIP(copy(aPacket,132,8));  //AV General IP
  ed_UserAVPort.Text := Hex2DecStr(copy(aPacket,140,4));  //AV General Port
  rg_debug.ItemIndex := strtoint(copy(aPacket,144,1));  //Debug Code
  ed_Version.Text := copy(aPacket,145,4);  //Version
  LanControl_Yellow;
  //btn_Setting.Enabled := True;
end;

procedure TForm_Main.LanControl_Yellow;
begin
    //chk_Local.Color := clWhite;
    //ed_mac.Color := clYellow;
    ed_ip.Color := clYellow;
    ed_Subnet.Color := clYellow;
    ed_GateWay.Color := clYellow;
    ed_port.Color := clYellow;
    ed_Serverip.Color := clYellow;
    ed_ServerPort.Color := clYellow;
    //rg_NM.Color := clWhite;
    //rg_Dhcp.Color := clWhite;
    ed_Connect.Color := clYellow;
    ed_Constate.Color := clYellow;
    //ed_LocalMac.Color := clYellow;
    ed_LocalIP.Color := clYellow;
    ed_LocalSubnet.Color := clYellow;
    ed_LocalGateWay.Color := clYellow;
    ed_LocalPort.Color := clYellow;
    ed_LocalServerIP.Color := clYellow;
    ed_LocalServerPort.Color := clYellow;
    //rg_LocalNM.Color := clWhite;
    //rg_LocalDhcp.Color := clWhite;
    ed_LocalConnect.Color := clYellow;
    ed_LocalConState.Color := clYellow;
    ed_AVServerIP.Color := clYellow;
    ed_AVServerPort.Color := clYellow;
    ed_UserAVIP.Color := clYellow;
    ed_UserAVPort.Color := clYellow;
    //rg_debug.Color := clWhite;
    ed_Version.Color := clYellow;
end;

procedure TForm_Main.HideLocal;
begin
  Label62.Enabled := False;
  ed_LocalIP.Enabled := False;
  Label63.Enabled := False;
  ed_LocalPort.Enabled := False;
  Label64.Enabled := False;
  ed_LocalSubnet.Enabled := False;
  rg_LocalNm.Enabled := False;
  Label65.Enabled := False;
  ed_LocalGateWay.Enabled := False;
  Label66.Enabled := False;
  ed_LocalServerIP.Enabled := False;
  Label67.Enabled := False;
  ed_LocalServerPort.Enabled := False;
  ed_LocalConnect.Enabled := False;

end;

procedure TForm_Main.ViewLocal;
begin
  Label62.Enabled := True;
  ed_LocalIP.Enabled := True;
  Label63.Enabled := True;
  ed_LocalPort.Enabled := True;
  Label64.Enabled := True;
  ed_LocalSubnet.Enabled := True;
  rg_LocalNm.Enabled := True;
  Label65.Enabled := True;
  ed_LocalGateWay.Enabled := True;
  Label66.Enabled := True;
  ed_LocalServerIP.Enabled := True;
  Label67.Enabled := True;
  ed_LocalServerPort.Enabled := True;
  ed_LocalConnect.Enabled := True;
end;

procedure TForm_Main.chk_LocalClick(Sender: TObject);
begin
  if chk_Local.Checked then ViewLocal
  else HideLocal;

end;

function TForm_Main.LanPanelCheck: boolean;
begin
  result := False;
  Try
    if ed_ip.Text = '' then Exit;
    if strtoint(ed_port.Text) < 0 then Exit;
    if ed_subnet.Text = '' then Exit;
    if ed_GateWay.Text = '' then Exit;
    if ed_ServerIp.Text = '' then Exit;
    if strtoint(ed_serverPort.Text) < 0 then Exit;
    if ed_AVServerIP.Text = '' then Exit;
    if strtoint(ed_AVServerPort.Text) < 0 then Exit;
    if ed_UserAVIP.Text = '' then Exit;
    if strtoint(ed_UserAVPort.Text) < 0 then Exit;
    if ed_Constate.Text = '' then ed_Constate.Text := 'C';
    if chk_Local.Checked then
    begin
      if ed_LocalIP.Text = '' then Exit;
      if strtoint(ed_LocalPort.Text) < 0 then Exit;
      if ed_LocalSubnet.Text = '' then Exit;
      if ed_LocalGateWay.Text = '' then Exit;
      if ed_LocalServerIP.Text = '' then Exit;
      if strtoint(ed_LocalServerPort.Text) < 0 then Exit;
    end else
    begin
      if ed_LocalIP.Text = '' then ed_LocalIP.Text := '127.0.0.1';
      if ed_LocalPort.Text = '' then ed_LocalPort.Text := '3000';
      if ed_LocalSubnet.Text = '' then ed_LocalSubnet.Text := '255.255.255.0';
      if ed_LocalGateWay.Text = '' then ed_LocalGateWay.Text := '127.0.0.1';
      if ed_LocalServerIP.Text = '' then ed_LocalServerIP.Text := '127.0.0.1';
      if ed_LocalServerPort.Text = '' then ed_LocalServerPort.Text := '3000';
    end;
    if ed_LocalConstate.Text = '' then ed_LocalConstate.Text := 'C';
  Except
    Exit;
  End;
  result := True;
end;

procedure TForm_Main.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = 0 then
    Action_RegMCUExecute(self)
  else
    Action_RegECUExecute(self);
end;

procedure TForm_Main.cmb_cctvExit(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    hide;
    if ItemIndex >= 0 then
    begin
      with sg_cctv do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;
end;

procedure TForm_Main.sg_CCTVSelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
  i:integer;
  st:string;
begin
  if ACol = 1 then    // 1번째열로 포커스가 이동됐을때 combobox 보여주기
  begin
    Rect := sg_CCTV.CellRect(ACol, ARow);
    // 현재 Cell의 좌표를 Rect로 저장
    with cmb_cctv do
    begin
      // ECU
      Clear;
      Items.Add('미사용');
      Items.Add('00.MCU');
      for i:= 0 to lvECU.Items.Count - 1 do
      begin
        st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
        Items.Add(st);
      end;
      ItemIndex := 0;
      Visible := true;
      Left := sg_CCTV.Left + Rect.Left + 2;
      Top := sg_CCTV.Top + Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sg_CCTV.Cells[ACol, ARow];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end else if ACol = 2 then
  begin
    Rect := sg_CCTV.CellRect(ACol, ARow);
    // 현재 Cell의 좌표를 Rect로 저장
    with cmb_cctv do
    begin
      //사용포트번호
      Clear;
//      Items.Add('0');
      Items.Add('1');
      Items.Add('2');
      Items.Add('3');
      Items.Add('4');
      Items.Add('5');
      Items.Add('6');
      Items.Add('7');
      Items.Add('8');
      ItemIndex := 1;
      Visible := true;
      Left := sg_CCTV.Left + Rect.Left + 2;
      Top := sg_CCTV.Top + Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sg_CCTV.Cells[ACol, ARow];
      BringToFront;   // comboBox1을 최상위로 옮기기 <> SendToBack
      SetFocus;
    end;
  end;
end;

procedure TForm_Main.MakeCCTVInfo;
var
  I: Integer;
begin
  with sg_CCTV do
  begin
    Cells[0, 0] := '카메라번호';
    Cells[1, 0] := '기기번호';
    Cells[2, 0] := '포트번호';
    FixedColor := clWhite;
    Color := clWhite;

    for I := 1 to 4 do
    begin
      Cells[0, I] := IntToStr(I);
      Cells[1, I] := '미사용';
      Cells[2, I] := '1';
    end;
  end;
end;

function TForm_Main.UpdateCCTVDEVICEID(stECUID, stDeviceID: string;
  nCCTVNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nCCTVNo = 1 then  FindField('CCTV1_DEVICEID').AsString:= stDeviceID
      else if nCCTVNo = 2 then  FindField('CCTV2_DEVICEID').AsString:= stDeviceID
      else if nCCTVNo = 3 then  FindField('CCTV3_DEVICEID').AsString:= stDeviceID
      else if nCCTVNo = 4 then  FindField('CCTV4_DEVICEID').AsString:= stDeviceID;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

function TForm_Main.UpdateCCTVPortNo(stECUID, stPortNo: string;
  nCCTVNo: integer): Boolean;
begin
  Result := False;
  with TB_DEVICE do
  begin
    if Not FindKey([stECUID]) then
    begin
      Exit;
    end else
    begin
      Edit;
      if nCCTVNo = 1 then  FindField('CCTV1_PORTNO').AsString:= stPortNo
      else if nCCTVNo = 2 then  FindField('CCTV2_PORTNO').AsString:= stPortNo
      else if nCCTVNo = 3 then  FindField('CCTV3_PORTNO').AsString:= stPortNo
      else if nCCTVNo = 4 then  FindField('CCTV4_PORTNO').AsString:= stPortNo;
      try
        Post;
      except
        Exit;
      end;
    end;
  end;
  Result := True;
end;

procedure TForm_Main.CCTVUpdate(aCol, aRow: integer);
var
  stECUID : string;
begin
  if IsConfigMCU then stECUID := '00'
  else stECUID := copy(ComboBox_ECU.Text,1,2);
  with sg_CCTV do
  begin
    if aCol < FixedCols then exit;
    if aRow < FixedRows then exit;
    if aCol = 1 then UpdateCCTVDEVICEID(stECUID,Trim(Cells[aCol,aRow]),aRow);
    if aCol = 2 then UpdateCCTVPortNo(stECUID,Trim(Cells[aCol,aRow]),aRow);

  end;
end;

procedure TForm_Main.sg_CCTVRowMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sg_CCTV.ColCount - 1 do
  begin
    for aRow := 0 to sg_CCTV.RowCount - 1 do
    begin
      CCTVUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.sg_CCTVExit(Sender: TObject);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sg_CCTV.ColCount - 1 do
  begin
    for aRow := 0 to sg_CCTV.RowCount - 1 do
    begin
      CCTVUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.sg_CCTVColumnMoved(Sender: TObject; FromIndex,
  ToIndex: Integer);
var
  aCol,aRow :integer;
begin
  for aCol := 0 to sg_CCTV.ColCount - 1 do
  begin
    for aRow := 0 to sg_CCTV.RowCount - 1 do
    begin
      CCTVUpdate(aCol,aRow);
    end;
  end;

end;

procedure TForm_Main.btn_CCTVSearchClick(Sender: TObject);
var
  aDeviceID : string;
  nLoop : integer;
  i : integer;
  bResult : Boolean;
begin
  sg_CCTV.Color := clWhite;
  aDeviceID:= GetDeviceID;
  for I:= 1 to 4 do
  begin
    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := CheckCCTV(aDeviceID,i);  // 기기번호
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('CCTV조회응답이 없습니다.동작모드를 확인하여 주세요.');
      Panel1.Visible := False;
      btnRefresh.Enabled := True;
      btnReg.Enabled := True;
      Exit;
    end;

  end;
end;

procedure TForm_Main.btn_CCTVSetClick(Sender: TObject);
var
  I: Integer;
  aDeviceID: String;
  aUsed: String;
  aECUNo: String;
  aPortNo:String;
  bResult : Boolean;
  nLoop : integer;
begin
  sg_CCTV.Color := clWhite;
  aDeviceID:= GetDeviceID;
  for I:= 1 to 4 do
  begin
    if sg_CCTV.Cells[1, I] = '미사용' then
    begin
      aUsed:= '00';
      aECUNo:= '00';
    end else if sg_CCTV.Cells[1, I] = '00.MCU' then
    begin
      aUsed:= '4D'; // 'M'MCU
      aECUNo:= copy(sg_CCTV.Cells[1, I],1,2);
    end else
    begin
      aUsed:= '45'; // 'E'확장기
      aECUNo:= copy(sg_CCTV.Cells[1, I],1,2);
    end;
    aPortNo := sg_CCTV.Cells[2, I];

    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegCCTV(aDeviceID,  // 기기번호
                  I,          // cctv 번호
                  aUsed,      //  사용여부
                  aECUNo,    // 연결 기기번호
                  aPortNo);   // 포트번호
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('CCTV설정응답이 없습니다.동작모드를 확인하여 주세요.');
      Panel1.Visible := False;
      btnRefresh.Enabled := True;
      btnReg.Enabled := True;
      Exit;
    end;

  end;
end;

function TForm_Main.RegCCTV(aDeviceID: string; aNo: Integer; aUsed, aECUNo,
  aPortNo: string): Boolean;
var
  aCCTVNoStr: string;
  aData: string;
  stPortNo : string;
  nTime : integer;
begin
  Result := false;
  aCCTVNoStr := FillZeroNumber(aNo, 2);
  stPortNo := Dec2Hex(strtoint(aPortNo),2);
  aData := 'CM' +                                          //COMMAND
    aCCTVNoStr +                                           //CCTV 번호
    aUsed +                                                //사용 유무 00:미사용,45:ECU,4D:MCU
    aECUNo +                                               //기기 번호
    '00' +                                                 //기기타입 00:미사용
    '00' +                                                 //기기번호 00:미사용
    stPortNo +                                             //포트번호
    '0000000000000000000000000000000000000000'             //추후 추가 예정
    ;

  bCCTVCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCCTVCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

function TForm_Main.CheckCCTV(aDeviceID: string; aNo: integer): Boolean;
var
  nTime : integer;
begin
  Result := false;

  bCCTVCheck := False;
  SendPacket(aDeviceID, 'Q', 'CM' + FillzeroNumber(aNo,2), True);
  nTime := 0;
  while Not bCCTVCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300밀리동안 응답 없으면 실패로 처리함
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;


end;

procedure TForm_Main.RcvCCTV(aData: string);
var
  st: string;
  aCCTVNo: Integer;
  stECUID :string;
  stData : string;
  stEcu : string;
  stPortNo : string;
begin

//         1         2         3         4
//12345678901234567890123456789012345678901234567
//046 K1111111100ihCD010010011111111        DC

  Delete(aData, 1, 1);
  stECUID := copy(aData,14,2);
  stData := copy(aData,18,length(aData) - 19);
  //데이터길이 1Byte가 나중에 추가되어 임의로 1Byte 삭제 처리
  aCCTVNo := StrToInt(Copy(stData, 3, 2));
  if copy(stData,5,2) = '00' then //미사용
  begin
    sg_CCTV.Cells[1,aCCTVNo] := '미사용';
  end else if copy(stData,5,2) = '4D' then //MCU
  begin
    stEcu := copy(stData,7,2);
    stEcu := stEcu + '.MCU';
    sg_CCTV.Cells[1,aCCTVNo] := stEcu;
  end else if copy(stData,5,2) = '45' then //확장기
  begin
    stEcu := copy(stData,7,2);
    stEcu := stEcu + '.ECU';
    sg_CCTV.Cells[1,aCCTVNo] := stEcu;
  end;
  sg_CCTV.Cells[2,aCCTVNo] := inttostr(strtoint(copy(stData,13,2)));
  UpdateCCTVDEVICEID(stECUID,Trim(sg_CCTV.Cells[1,aCCTVNo]),aCCTVNo);
  UpdateCCTVPortNo(stECUID,Trim(sg_CCTV.Cells[2,aCCTVNo]),aCCTVNo);
  sg_CCTV.Color := clYellow;
  bCCTVCheck := True;
end;

procedure TForm_Main.sgCardReaderClick(Sender: TObject);
var
  bResult:Boolean;
begin
  sgCardReaderSelectCell(self,
  sgCardReader.Col, sgCardReader.Row,bResult);

end;

procedure TForm_Main.sgPortClick(Sender: TObject);
var
  bResult:Boolean;
begin
  sgPortSelectCell(self,
  sgPort.Col, sgPort.Row,bResult);

end;

procedure TForm_Main.sg_CCTVClick(Sender: TObject);
var
  bResult:Boolean;
begin
  sg_CCTVSelectCell(self,
  sg_CCTV.Col, sg_CCTV.Row,bResult);

end;

procedure TForm_Main.cmb_cctvChange(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    if ItemIndex >= 0 then
    begin
      with sg_cctv do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;
end;

procedure TForm_Main.cbCardReaderChange(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    if ItemIndex >= 0 then
    begin
      with sgCardReader do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
      end;
    end;
  end;

end;

procedure TForm_Main.cbPortChange(Sender: TObject);
var
  st: string;
begin
  with Sender as TRzCombobox do
  begin
    if ItemIndex >= 0 then
    begin
      with sgPort do
      begin
        st := Items[ItemIndex];
        Cells[Col, row] := st;
        PortDataUpdate(Col,row);
      end;
    end;
  end;

end;

end.



{
카드 리더 등록
  위치명에 랜덤하게 1Byte가
}
