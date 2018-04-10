{***************************************************************}
{  TBMS �� ���� ���α׷�                                        }
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

 �� Used components  ��
    Async Professional
    Raize
  ============================================================
  ���α׷� ����
  ============================================================
  - ���������� INI ���Ͽ� ������ �ҷ� ���⸦ �� �� �־�� �Ѵ�.
  - �ϳ��� ��ư���� ��ü ������ �ҷ� �ü� �־�� �Ѵ�.
  - �ϳ��� ��ư���� ��ü ������ ���� �� �� �־�� �Ѵ�.
  - ī���`�� �������� ���� ���� �� �ҷ����Ⱑ �����ؾ� �Ѵ�.
  - MCU�� ECU ��� ȭ���� ������ ���� �ؾ� �Ѵ�.
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
    //���̺� ������Ʈ
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
    bRegCardShow : Boolean; //ī�� ��� ȭ�� Show ����
    bDoorSchRegShow : Boolean; //�����ٵ��ȭ�� Show ����
    bTotalComCheckShow : Boolean; //��ü���ȯ�� ȭ�� Show ����
    bDeviceComCheckShow : Boolean; //��⺰���üũ ȭ�� Show ����
    bSensorShow : Boolean; //������ ��� ȭ�� Show
    bKTRegShow : Boolean;  //KT����ġ����ȭ�� Show
    IsLogShow : Boolean;   //LogShow ����

    Function GetFileLastWriteTime( sFileName : string ) : TDateTime;
    function ListviewBinarySearch(listview: TRzListview;
      const Item: string; var Index: Integer): Boolean;
    // ����͸� ȭ�鿡 ���
    procedure CommMoni(aData: string);
    // ������ ��Ŷã��
    function CheckDataPacket(aData: string; var bData: string): string;
    // ������ ������ ó��
    function DataPacektProcess(aData: string): Boolean;
    // ������ ����
    function SendPacket(aDeviceID: string; aCmd: Char; aData: string;
      aQuick: Boolean): Boolean;
    //ReserveSendDataList�� ������ �����͸� �����Ѵ�.
    procedure ExecSendPacket;

    //ī�帮�� �ʱ����� ���
    procedure MakeCardreaderInfo;
    //��Ʈ �ʱ����� ���
    procedure MakePortInfo;
    //CCTV �ʱ����� ���
    procedure MakeCCTVInfo;


    //wiznet ��ȸ
    function CheckWiznet(aDeviceID: string): Boolean;
    // wiznet ���
    function Writewiznet(aDeviceID, aLocalIP, aSubnet, aGateway,aPortNo,aServerIp,aServerport,aMode,aCmd: string): Boolean;
    // wiznet ����ó��
    procedure RcvWiznetInfo(aData: string);
    // ���� Wiznet����ó��
    procedure RcvImgWiznetInfo(aData: string);
    //������ ����ó��
    procedure RcvAdminWiznetInfo(aData: string);
    //��Į���� ����ó��
    procedure RcvLocalPcWiznetInfo(aData: string);


    //����ȣ ��ȸ(MCU��ȸ)
    function CheckID: Boolean;
    // ����ȣ���(MCU ���)
    function RegID(aDeviceID: string): Boolean;
    // ����ȣ ����
    procedure RcvDeviceID(aData: string);

    //ECU ��ȸ
    function CheckUsedDevice(aDeviceID: string): Boolean;
    // ECU ���
    function RegUsedDevice(aDeviceID: string; UsedDevice: string): Boolean;
    // ECU ����
    procedure RcvUsedDevice(aData: string);
    //Error ó��
    procedure ErrorDataProcess(aData:string);

    //�˶�ǥ�ñ� ��ȸ
    function CheckUsedAlarmDisplay(aDeviceID: string): Boolean;
    // �˶�ǥ�ñ� ���
    function RegUsedAlarmDisplay(aDeviceID: string; UsedDevice: string): Boolean;
    // �˶�ǥ�ñ� ����
    procedure RcvUsedAlarmdisplay(aData: string);


    //��Ŀ�� ID ��ȸ
    function CheckLinkusID(aDeviceID: string): Boolean;
    //��Ŀ�� ID ���
    function RegLinkusID(aDeviceID, aLinkusId: string): Boolean;
    //��Ŀ�� ID����
    procedure RcvLinkusId(aData: string);


    // ���ڴ� ��ȭ��ȣ ��ȸ
    function CheckLinksTellNo(aDeviceID: string; aNo: Integer): Boolean;
    // ���ڴ� ��ȭ��ȣ ���
    function RegLinksTellNo(aDeviceID: string; aNo: Integer; aTellno: string): Boolean;
    //���ڴ� ��ȭ��ȣ ����
    procedure RcvLinkusTelNo(aData: string);


    //��ī��Ʈ ��ȸ
    function CheckRingCount(aDeviceID: string): Boolean;
    //��ī��Ʈ ���
    function RegRingCount(aDeviceID: string; aCount: Integer): Boolean;
    //��ī��Ʈ ����
    procedure RcvRingCount(aData: string);
    //ī��Ÿ�� ����
    procedure RcvCardType(aData: string);


    //�ý�������  ��ȸ
    function CheckSysInfo(aDeviceID: string): Boolean;
    //�ý�������  ���
    function RegSysInfo(aDeviceID: string;      // ����ȣ
                        WatchPowerOff: Integer; // ��������
                        DelayIn: Integer;       // �Խ������ð�
                        DelayOut: Integer;      // ��������ð�
                        Door1Type: Integer;     // Door1�뵵(0:���,1:����.2:���+����)
                        Door2Type: Integer;     //Door2�뵵(0:���,1:����.2:���+����)
                        Locate: string          // ��ġ��
    ): Boolean;
    //�ý�������  ����
    procedure RcvSysinfo(aData: string);
    //ECU ��Ż��� üũ
    function CheckECUCommState(aDeviceID:string) : Boolean;
    //Reader ��Ż��� üũ
    function CheckReaderCommState(aDeviceID:string):Boolean;
    //��Ȳǥ�� ��Ż��� üũ
    function CheckIndicatorCommState(aDeviceID:string):Boolean;
    //�ý�������  ��ȸ(��������)
    function CheckSysInfo2(aDeviceID: string; aDoorNo: Integer): Boolean;
    //�ý�������  ���(��������)
    function RegSysInfo2(aDeviceID: string;        // ����ȣ
                         aDoorNo: Integer;         // ����ȣ
                          aCardMode: Integer;      // ī�� ���� (0:Positive, 1:Negative)
                          aDoorMode: Integer;      // ���Թ� ���� (0:�, 1:����)
                          aDoorOpenTime: Integer;   // Door ����ð�
                          aOpenMoniTime: Integer;   // ��ð� ���� �溸
                          aUseSchedule: Integer;    // ������ ���� ���� (0:������, 1:���)
                          aSendDoorState: Integer;  // ���Թ� ���� ����(0:������, 1:���)
                          aUseOpenalarm: Integer;   // ��ð� ���� ���� ���(0:������, 1:���)
                          aLockType: Integer;       // ������ Ÿ��
                          aControledFire: Integer   // ȭ�� �߻��� ������
    ): Boolean;


    //�������� ����� ���� ó��
    procedure RcvSysinfo2(DeviceID,aData: String);


    //���ī�帮�� ��ȸ
    function CheckCardReader(aDeviceID: string; aNo: Integer): Boolean;

    //���ī�帮�� ���
    function RegCardReader(aDeviceID: string;       // ����ȣ
                            aNo,                    // ī�帮�� ��ȣ
                            aUsed,                  //  ��뿩��
                            aDoorNo: Integer;        // ���� ����ȣ
                            aLocate: string          // ��ġ��
    ): Boolean;
    //CCTV ���
    function RegCCTV(aDeviceID: string;       // ����ȣ
                            aNo: Integer;           // CCTV ��ȣ
                            aUsed,                  //  ��뿩��
                            aECUNo,                 // ECUNO
                            aPortNo: string          // ��Ʈ��ȣ
    ): Boolean;
    function CheckCCTV(aDeviceID: string; aNo:integer):Boolean;

    //ī�帮�� Ÿ�� ��ȸ
    function CheckCardReaderType(aDeviceID:string):Boolean;
    //ī�帮�� Ÿ�� ���
    function RegCardReaderType(aDeviceID:string;nType:integer):Boolean;

    //ī�帮�� ���� ����
    procedure RcvCardReader(aData: string);
    //CCTV ����
    procedure RcvCCTV(aData:string);

    //�����ƮLOOP ��ȸ
    function CheckPort(aDeviceID: string; aNo: Integer): Boolean;
    //�����ƮLOOP ���
    function RegPort(aDeviceID: string;            // ����ȣ
      aNo: Integer;                  // ��Ʈ��ȣ
      aAlarmType: Integer;          // ��������
      aUseDelay: Integer;           // �����ð�
      aDetectTime: Integer;         // �����ð�
      aLocate: string               // ��ġ��
    ): Boolean;
    // ��Ʈ ���� ����
    procedure RcvPort(aData: string);


    //�ð�����ȭ
    function TimeSync(aDeviceID: string): Boolean;

    //����Ȯ��
    function CheckVersion(aDeviceID: string): Boolean;

    //��������� Ȯ��
    function CheckReaderVersion(aDeviceID: string; aNo: Integer): Boolean;

    //��⸮��
    function ResetDevice(aDeviceID: string): Boolean;

    //��� �޸� ����
    function ClearRegister(aDeviceID: string): Boolean;

    //�˶���� ����
    function ChangeAlarmMode(aDeviceID: string; aMode: Char;aQuick:Boolean): Boolean;

    // ������
    function DoorControl(aDeviceID: string;     //����ȣ
      aNo: Integer;            // ����ȣ
      aControlType: Integer;
      //������ '0':�ش���׾���,'1':ī��,'2':���Կ,'3':��������
      aControl: Integer      //���� Ŀ�ǵ�
    ): Boolean;

    // ��� �޼����ڵ� ó��
    Procedure RegDataProcess(aData:String);
    // �������� �޼��� �ڵ� ó��
    Procedure RemoteDataProcess(aData:String);
    // ���Ե����� �޼��� �ڵ� ó��
    Procedure AccessDataProcess(aData:String);
    // ����ī�� �̺�Ʈ
    procedure RcvAccEventData(aDevice,aData:String);
    //������ ���� ������ ó��
    procedure RcvDoorEventData(aData:String);
    // ��� ���� ����
    Procedure RcvAccControl(aData:String);
    // ī���� ����
    Procedure RcvCardRegAck(aData,aDeviceID:String);
    //������ ��� ����
    Procedure RcvSch(aData: String);
    //�Է��� MCU ID ���ϱ�
    Function GetMcuID:String;
    //����ȣ Ȯ��
    Function GetDeviceID:String;
    //������ ECU ���ϱ�
    Function GetECU:String;
    //������ �˶�ǥ�ñ� ���ϱ�
    FUnction GetAlarmDisplay:String;

    //��������
    Function RegSensorSet(aDeviceID,aData:string):Boolean;
    //������üũ
    Function CheckSensorSet(aDeviceID:string):Boolean;
    //�������������
    Function RegSensorInfo(aDeviceID,aSensorNo,aPortNo,aAlarmType,aDetectTime:string):Boolean;
    //����������üũ
    Function CheckSensorInfo(aDeviceID,aSensorNo,aPortNo:string):Boolean;
    //����������
    Function RcvSensorSet(aData:string):Boolean;
    //��������������
    Function RcvSensorInfo(aData:string):Boolean;
    //KT��������
    Function RcvKTConfig(aData:string):Boolean;
    Function RcvKTDevice(aData:string):Boolean;
    //KT������ ����
    Function RcvKTLAN(aPacket:string):Boolean;

  end;

var
  Form_Main: TForm_Main;
  ComTrace: IWinTrace; // TX/RX  Debug Trace
  ReserveSendDataList: TStringList; //������ ������ ���
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


//MCU  ID Ȯ��
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

//����ȣ Ȯ��
function TForm_Main.GetDeviceID: String;
begin
  Result:= '';
  if Not IsConfigMCU then // ECU������
  begin
    Result:= xMCUID + Copy(ComboBox_ECU.Text,1,2);
  end else                       // MCU ������
  begin
    Result:= xMCUID + '00';
  end;
end;

//������ ECU ���ϱ�
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

//������ �˶�ǥ�ñ� ���ϱ�
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


//  MCU ���
procedure TForm_Main.Action_RegMCUExecute(Sender: TObject);
begin
  IsConfigMCU := True;
  PageControl1.ActivePageIndex := 0;
  Panel_ktlog.Visible := false;
  ComboBox_ECU.Enabled:= False;
  //MCU���� ��ϸ޴� Enabled
  MENU_MCUREG.Enabled:= True;
  MENU_CHECKMCU.Enabled:= True;
  DeviceTableShow('00');

end;

// ECU ���
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

  //MCU���� ��ϸ޴� Disbaled
  MENU_MCUREG.Enabled:= False;
  MENU_CHECKMCU.Enabled:= False;


  //ComboBox_ECU�� lvECU�� �����͸� �ε��Ѵ�.
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

// ��ſ���
procedure TForm_Main.Action_ConnectExecute(Sender: TObject);
begin
  //
  try
    FieldStatus_ComStatus.Caption := '����õ�  COM NO:' +
      IntToStr(Commport.ComNumber);
    Commport.Open := true;

  except
    MessageDlg('�����Ʈ ������ �߸�  �Ǿ����ϴ�.', mtError, [mbOK], 0);
    FieldStatus_ComStatus.Caption := '������� COM NO:' +
      IntToStr(Commport.ComNumber);
    Exit;
  end;
  bSearch := False;
end;

// ��Ų���
procedure TForm_Main.Action_DisconnectExecute(Sender: TObject);
begin
  //
  Commport.Open := false;
end;

//���� �б�
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

// ���� ����
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

//�����Ʈ����
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


// ����͸� ������ ó��
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
    ComTrace.setColumnsTitle('�߻��ð�' + #9 + 'TX/RX' + #9 +
      '����ȣ' + #9 + 'CMD' + #9 + 'MSGNO' + #9 + 'DATA' + #9 + 'FULLDATA');
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
  aIndex := Pos(STX, ComBuff);          // STX ��ġ�� Ȯ�� �Ѵ�.
  if aIndex = 0 then Exit               // STX�� ������ ��ƾ���� ������.
  else if aIndex > 1 then
  begin
    Delete(ComBuff, 1, aIndex - 1);       //STX��ġ�� 1�ƴϸ� STX�ձ��� ����
  end;
  if Length(Combuff) < 21 then Exit;
  // 21Byte �����̸� ������ó�� ���� �ʰ� �ٽ� �޴´�.
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
  //������ ���� ��ġ �����Ͱ� ���ڰ� �ƴϸ�...
  if not isDigit(Lenstr) then
  begin
    Delete(aData, 1, 1);       //1'st STX ����
    aIndex := Pos(STX, aData); // ���� STX ã��
    if aIndex = 0 then         //STX�� ������...
    begin
      //��ü ������ ����
      bData := '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(aData, 1, aIndex - 1);//STX �� ������ ����
      bData := aData;
    end else
    begin
      bData := aData;
    end;
    Exit;
  end;
  //��Ŷ�� ���ǵ� ����
  DefinedDataLength := StrToInt(Lenstr);
  //��Ŷ�� ���ǵ� ���̺��� ���� �����Ͱ� ������
  if Length(aData) < DefinedDataLength then
  begin
    //���� �����Ͱ� ���̰� ������(���� �� ������ ����)
    etxIndex := Pos(ETX, aData);
    if etxIndex > 0 then
    begin
      Delete(aData, 1, etxIndex);
    end;
    bData := aData;
    Exit;
  end;

  // ���ǵ� ���� ������ �����Ͱ� ETX�� �´°�?
  if aData[DefinedDataLength] = ETX then
  begin
    StrBuff := Copy(aData, 1, DefinedDataLength);
    Result  := StrBuff;
    Delete(aData, 1, DefinedDataLength);
    bData := aData;
  end else
  begin
    //������ �����Ͱ� EXT�� �ƴϸ� 1'st STX����� ���� STX�� ã�´�.
    Delete(aData, 1, 1);
    aIndex := Pos(STX, aData); // ���� STX ã��
    if aIndex = 0 then         //STX�� ������...
    begin
      //��ü ������ ����
      bData := '';
    end else if aIndex > 1 then // STX�� 1'st�� �ƴϸ�
    begin
      Delete(aData, 1, aIndex - 1);//STX �� ������ ����
      bData := aData;
    end else
    begin
      bData := aData;
    end;
  end;
end;

{���������� ���� ������ ��Ŷ ó�� ��ƾ}
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

// ReserveSendDataList���� ���� COMMAND ����
//==============================================================================




  aMarker := Copy(aData, 8, 13);
  // aMarker 1,9 : DeviceID
  // aMarker 10,1 : COMMAND
  // aMarker 11,1 : Message No : ������ ���� �޼��� �ѹ��� ���� ���� ���� (ACK���� �ް� ��)
  // aMarker 12,2 : DATA

  if (Copy(aMarker,12,2) = 'ID') or // 'ID'����� 000000000 ==> ������ ID�� ���۵ȴ�.
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

    'c':begin // ��������
          case aMarker[12] of
            'a': aMarker[12]:= 'A'; //�����
            'b': aMarker[12]:= 'B'; //�����ȸ
            'c': aMarker[12]:= 'C'; //����
            'l': aMarker[12]:= 'L'; //ī�嵥���͵��
            'm': aMarker[12]:= 'M'; //ī�嵥������ȸ
            'n': aMarker[12]:= 'N'; //ī�嵥���ͻ���
            'o': aMarker[12]:= 'O'; //��üī�嵥���ͻ���
            's': aMarker[12]:= 'S'; //������ ���
            'p': aMarker[12]:= 'P'; //������ ��ȸ
            'q': aMarker[12]:= 'Q'; //Ư���� ���
            'r': aMarker[12]:= 'R'; //Ư���� ��ȸ
            'k': aMarker[12]:= 'K'; //Ÿ������ ���
            't': aMarker[12]:= 'T'; //Ÿ������ ��ȸ
          end;
        end;

  end;


  aSenderIndex:= ReserveSendDataList.IndexOf(aMarker);
  if aSenderIndex > -1 then
  begin
     //TSendData(ReserveSendDataList.Objects[aSenderIndex]).Free;
     ReserveSendDataList.Delete(aSenderIndex);
     FieldStatus_ComStatus.Caption:= InttoStr(ReserveSendDataList.Count) +'���� �����';
     if ReserveSendDataList.Count > 0 then ExecSendPacket;

  end else
  begin
     FieldStatus_ComStatus.Caption:= 'SenderIndex = -1';
     //SendTimer.Enabled:= True;
  end;


//==============================================================================



  {���� ������ Ŀ�ǵ庰 ó��}
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
  �� c(�������� ������)�ΰ�쿡�� ACK �� 'c' command�� ����� ������ �ؾ� �Ѵ�.
    ================================================================================ }


  case aCommand of
    'A':{�˶�}          begin  end;
    'i':{Initial}       begin  RegDataProcess(aData)    end;
    'R':{Remote}        begin  RemoteDataProcess(aData) end;
    'r':{Remote Answer} begin  RemoteDataProcess(aData) end;
    'c':{��������}      begin  AccessDataProcess(aData) end;
    //'f':{�߿���}        begin  FirmwareProcess(aData)   end;
    //'F':{�߿���}        begin  FirmwareProcess2(aData)  end;
    'e':{ERROR}         begin ErrorDataProcess(aData) end;
    else {error �߻�: [E003]���� ���� ���� Ŀ�ǵ�}  begin ErrorDataProcess(aData) end;
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
    ShowMessage('��� ������ �ȵǾ����ϴ�.');
    Exit;
  end;

  bSended := True;

  aDataLength := 21 + Length(aData);
  aLengthStr := FillZeroNumber(aDataLength, 3);

  if aCmd = 'a' then {���� ó��}
  begin
    ACkStr  := STX + aLengthStr + #$20 + 'K1' + aDeviceID + aCmd + Rcv_MsgNo;
    ACkStr  := ACkStr + MakeCSData(ACKStr + ETX) + ETX;
    aKey    := $20;
    ACkStr2 := Copy(ACKStr, 1, 5) + EncodeData(aKey,
      Copy(ACkStr, 6, Length(ACkStr) - 6)) + ETX;
  end else {���� or ��� }
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

 //SnedTimer�� Ȱ��ȭ �Ѵ�.
  SendTimer.Enabled:= True;
  bSended := False;

  Result := true;
end;

//ReserveSendDataList�� ������ �����͸� �����Ѵ�.
procedure TForm_Main.ExecSendPacket;
var
  I: Integer;
  st: string;
begin


  if not CommPort.Open then Exit;
  if ReserveSendDataList.Count > 0 then
  begin
    bSended := True;    //�۽���
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


//ī�帮�� ���� �����
procedure TForm_Main.MakeCardreaderInfo;
var
  I: Integer;
begin
//  sgCardReader.ColWidths[2] := sgCardReader.Width - sgCardReader.ColWidths[0] - sgCardReader.ColWidths[1];
  sgCardReader.ColWidths[3] := 0;
  sgCardReader.Cells[0, 0] := '�������ȣ';
  sgCardReader.Cells[1, 0] := '��뿩��';
  sgCardReader.Cells[2, 0] := '����ȣ';
  sgCardReader.Cells[3, 0] := '��ġ��';
  sgCardReader.FixedColor := clWhite;
  sgCardReader.Color := clWhite;

  for I := 1 to 8 do
  begin
    sgCardReader.Cells[0, I] := IntToStr(I);
    if I = 1 then  sgCardReader.Cells[1, I] := '���'
    else sgCardReader.Cells[1, I] := '�̻��';
    sgCardReader.Cells[2, I] := '1';
    sgCardReader.Cells[3, I] := '�̼���';
  end;
end;

//��Ʈ �ʱ����� ���
procedure TForm_Main.MakePortInfo;
var
  I: Integer;
begin
  sgPort.ColWidths[0] := 60;
  sgPort.ColWidths[4] := 0;
  sgPort.Cells[0, 0] := '��Ʈ��ȣ';
  sgPort.Cells[1, 0] := '��������';
  sgPort.Cells[2, 0] := '�����ð�';
  sgPort.Cells[3, 0] := '�����ð�';
  sgPort.Cells[4, 0] := '��ġ��';
  sgPort.FixedColor := clWhite;
  sgPort.Color := clWhite;

  for I := 1 to 8 do
  begin
    sgPort.Cells[0, I] := IntToStr(I);
    if I = 7 then sgPort.Cells[1, I] := '1.ȭ��'
    else if I = 8 then sgPort.Cells[1, I] := '3.���'
    else sgPort.Cells[1, I] := '0.���';
    sgPort.Cells[2, I] := '�̻��';
    sgPort.Cells[3, I] := '400';
    sgPort.Cells[4, I] := '�̼���';
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
  ECUList.Add('99.��ü');
  ECUList.Add('00.Controler');
  
  //���α׷� ������ MCU ����ȭ��
  IsConfigMCU := true;

  //SEND Buffer List
  ReserveSendDataList := TStringList.Create;
  ReserveSendDataList.Clear;


  // ī�� ��� ���
  RegCardMode := false;

  //ī�帮�� ���� ����
  MakeCardreaderInfo;
  cbCardReader.Visible := false;

  //���� ���� ����
  MakePortInfo;
  cbPort.Visible := false;

  //CCTV���� ����
  MakeCCTVInfo;
  cmb_CCTV.Visible := False;


  with ComboBox_WatchPowerOff do //��������
  begin
    Clear;
    Items.Add('���� ���� OFF');
    Items.Add('���� ���� ON');
    ItemIndex := 0;
  end;

  with ComboBox_DoorType1 do //��1 �뵵
  begin
    Clear;
    Items.Add('0.�������');
    Items.Add('1.��������');
    Items.Add('2.��� + ����');
    ItemIndex := 0;
  end;

  with ComboBox_DoorType2 do  //��2�뵵
  begin
    Clear;
    Items.Add('0.�������');
    Items.Add('1.��������');
    Items.Add('2.��� + ����');
    ItemIndex := 0;
  end;

  with ComboBox_CardModeType1 do     //���Թ�1 ī�� ���
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex := 0;
  end;

  with ComboBox_CardModeType2 do     //���Թ�2 ī�� ���
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex := 0;
  end;


  with ComboBox_DoorModeType1 do     //���Թ�1 � ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('������');
    ItemIndex := 0;
  end;
  with ComboBox_DoorModeType2 do     //���Թ�2 � ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('������');
    ItemIndex := 0;
  end;


  with ComboBox_UseSch1 do     //���Թ�1 ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('����');
    ItemIndex := 0;
  end;
  with ComboBox_UseSch2 do     //���Թ�2 ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('����');
    ItemIndex := 0;
  end;

  with ComboBox_SendDoorStatus1 do     //���Թ�1 ���� ���ۿ���
  begin
    Clear;
    Items.Add('������');
    Items.Add('���Թ�����');
    Items.Add('����������');
    Items.Add('���Թ�+����������');
    ItemIndex := 0;
  end;
  with ComboBox_SendDoorStatus2 do     //���Թ�1 ���� ���ۿ���
  begin
    Clear;
    Items.Add('������');
    Items.Add('���Թ�����');
    Items.Add('����������');
    Items.Add('���Թ�+����������');
    ItemIndex := 0;
  end;

  with ComboBox_AlarmLongOpen1 do     //���Թ�1��ð� ���� ���� ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;
  with ComboBox_AlarmLongOpen2 do     //���Թ�2��ð� ���� ���� ���
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;

  with ComboBox_LockType1 do       //���Թ�1 ������ Ÿ��
  begin
    Clear;
    Items.Add('�Ϲ���(������ ���)');
//    Items.Add('�ڵ���');
//    Items.Add('�Ϲ���(������ ����)');
    Items.Add('�����/EM��/��Ʈ����Ŀ');
    Items.Add('���庼Ʈ(������ ���)');
    Items.Add('���庼Ʈ(������ ����)');
    Items.Add('��Ʈ����Ŀ(������ ����)');
    Items.Add('0x35 ����');
//    Items.Add('0x36 ����');
    Items.Add('�ڵ���(��������)');
//    Items.Add('0x37 �Ĵ�');
    Items.Add('�Ĵ�');
    ItemIndex := 1;
  end;
  with ComboBox_LockType2 do       //���Թ�2 ������ Ÿ��
  begin
    Clear;
    Items.Add('�Ϲ���(������ ���)');
//    Items.Add('�ڵ���');
//    Items.Add('�Ϲ���(������ ����)');
    Items.Add('�����/EM��/��Ʈ����Ŀ');
    Items.Add('���庼Ʈ(������ ���)');
    Items.Add('���庼Ʈ(������ ����)');
    Items.Add('��Ʈ����Ŀ(������ ����)');
    Items.Add('0x35 ����');
//    Items.Add('0x36 ����');
    Items.Add('�ڵ���(��������)');
//    Items.Add('0x37 �Ĵ�');
    Items.Add('�Ĵ�');
    ItemIndex := 1;
  end;



  with ComboBox_ControlFire1 do     //���Թ�1 ȭ�� �߻��� ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;
  with ComboBox_ControlFire2 do     //���Թ�2 ȭ�� �߻��� ������
  begin
    Clear;
    Items.Add('����');
    Items.Add('���');
    ItemIndex := 0;
  end;
end;


procedure TForm_Main.sgCardReaderSelectCell(Sender: TObject;
  ACol, ARow: Integer; var CanSelect: Boolean);
var
  Rect: TRect;
begin
  if ACol = 1 then    // 1��°���� ��Ŀ���� �̵������� combobox �����ֱ�
  begin
    Rect := sgCardReader.CellRect(ACol, ARow);
    // ���� Cell�� ��ǥ�� Rect�� ����
    with cbCardReader do
    begin
      // ��� ���� ���
      Clear;
      Items.Add('�̻��');
      Items.Add('���');
      ItemIndex := 0;
      Visible := true;
      Left := sgCardReader.Left + Rect.Left + 2;
      Top := sgCardReader.Top + Rect.Top + 3;
      Width := Rect.Right - Rect.Left;
      Height := (Rect.Bottom - Rect.Top);
      Text := sgCardReader.Cells[ACol, ARow];
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 2 then
  begin
    Rect := sgCardReader.CellRect(ACol, ARow);
    // ���� Cell�� ��ǥ�� Rect�� ����
    with cbCardReader do
    begin
      //��빮��ȣ
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
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
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
    1: // ��������
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('0.���');
        Items.Add('1.ȭ��');
        Items.Add('2.����');
        Items.Add('3.���');
        Items.Add('4.����');
        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
        SetFocus;
      end;
    end;
    2: //�����ð� �������
    begin
      with cbPort do
      begin
        Clear;
        Items.Add('�̻��');
        Items.Add('���');
        ItemIndex := 0;
        Visible := true;
        Left := sgPort.Left + Rect.Left + 2;
        Top := sgPort.Top + Rect.Top + 3;
        Width := Rect.Right - Rect.Left;
        Height := (Rect.Bottom - Rect.Top);
        Text := sgPort.Cells[ACol, ARow];
        BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
        SetFocus;
      end;
    end;
    3: //�����ð�
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
        BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
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

// ECU �߰�
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
  ECUList.Add('99.��ü');
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
//ECU ����

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
  FieldStatus_ComStatus.Caption := '���� COM NO:' + IntToStr(Commport.ComNumber);
  ApdSLController.Monitoring := true;
  Timer_ENQ.enabled := True;
  {ID�� �켱 Ȯ���Ѵ�.}
  if Not CheckID then
  begin
//    Action_DisconnectExecute(self);
//    Commport.Open := false;
//    FieldStatus_ComStatus.Caption := '�������';
//    exit;
  end;
  bTimeShow := False;
  TimeSync(GetMcuID + '00');

  {��⼳���� ���ؼ� �ݵ�� ���� ���}
  ChangeAlarmMode('000000000','D',True);

end;

procedure TForm_Main.CommPortPortClose(Sender: TObject);
begin
  Timer_ENQ.enabled := False;
  ToolButton_Connect.Enabled := true;
  ToolButton_Disconnect.Enabled := false;
  ApdSLController.Monitoring := false;
  FieldStatus_ComStatus.Caption := '�������� COM NO:' +
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

//wiznet ����Ȯ��
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//����� ����
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
  //2.MAC Address ��������
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
            '����:'+InttoStr(Length(DataStr)));
  }

  bWiznetCheck := False;
  //SendPacket(aDeviceID, 'I',  aCmd + '00' + DataStr, True);
  SendPacket(aDeviceID, 'I',  'NW' + aCmd  + DataStr, True);

  nTime := 0;
  while Not bWiznetCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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

  //����� aa�̸� ��������
  if FHeader = 'aa' then
  begin
    //Wiznet ��ȸ ��û ó�� �Ұ�
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

  // 4.IP address �ڡڡڡڡ�
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

  // 5.Subnet mask �ڡڡڡڡ�
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

  // 6.Gateway address  �ڡڡڡڡ�
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


  //7.Port number (Client) �ڡڡڡڡ�
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
      Errorlog := '�������� ���䰪�� Ʋ���ϴ�.' + #13 +
        '===========================' + #13 + '  ������ < ===== > ���䰪  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('����/��ȸ �Ϸ� �Ǿ����ϴ�..');
  end;
  }

end;


//����ȣ ��ȸ(MCU��ȸ)
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
// ����ȣ���

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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
  Result := true;

end;

// ����ȣ ����
procedure TForm_Main.RcvDeviceID(aData: string);
var
  st: string;
  stEUC : string;
begin
  //40 K1123456700i1IF00���нý���      61
  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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
  bMCUIDCheck := True;  //MCUIDüũ ����


  // ��� ���� �Ϸ��� ������ ������ ��ȸ�� �����Ѵ�.
  {
  if isRegMode then RegSysInfo(xDeviceID)
  else CheckSysInfo(xDeviceID);
   }
end;

//ECU ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;
  Result := true;
end;
  // ECU ���
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// ECU ����
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
  ECUList.Add('99.��ü');
  ECUList.Add('00.Controler');
  for i:= 0 to lvECU.Items.Count - 1 do
  begin
    st:= lvECU.Items[I].Caption + '.'+ lvECU.Items[I].SubItems.Strings[0];
    ECUList.Add(st);
  end;
{  aList := lvECU.Items.Add;
  aList.Caption := '00'; //ECU ��ȣ
  aList.ImageIndex := 4;
  aList.SubItems.Add('Controler');
}
  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 22, 100);
  stMCUNO := Copy(aData,7,7);
  for I := 2 to 100 do  // 1��°�� ������
  begin
    if st[I] = '1' then
    begin
      ECUNo := FillZeroNumber(I-1, 2);
      if ListviewBinarySearch(lvECU, ECUNo, aIndex) then
      begin
        // �̵̹�ϵǾ� ����
      end else
      begin
        // ECU �߰�
        aList := lvECU.Items.Add;
        aList.Caption := ECUNo; //ECU ��ȣ
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


//�˶�ǥ�ñ� ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

  // �˶�ǥ�ñ� ���
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := True;
end;

// �˶�ǥ�ñ� ����
procedure TForm_Main.RcvUsedAlarmdisplay(aData: string);
var
  st: string;
  I: Integer;
begin
  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 23, 4);
  
  CheckList_Alarm.UncheckAll;
  for I := 1 to 4 do
  begin
    if st[I] = '1' then CheckList_Alarm.ItemChecked[I - 1] := true
    else CheckList_Alarm.ItemChecked[I - 1] := false;
  end;
  bUsedAlarmCheck := True;
end;


//��Ŀ�� ID ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//��Ŀ�� ID ���
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//��Ŀ�� ID����
procedure TForm_Main.RcvLinkusId(aData: string);
var
  st: string;
begin
  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 22, 4);
  Edit_LinkusID.Text := Hex2DecStr(st);
  Edit_LinkusID.Color := clYellow;
  bLinkusIDCheck := True;
end;


// ���ڴ� ��ȭ��ȣ ��ȸ
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
    IndexStr;        //��ȭ ��ȣ �ε���
  bLinksTelNoCheck := False;
  SendPacket(aDeviceID, 'Q', aData, True);

  nTime := 0;
  while Not bLinksTelNoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// ���ڴ� ��ȭ��ȣ ���
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//��Ŀ�� ���� ��ȣ ����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 22, Length(aData) - 24);
  MNo := StrToInt(Copy(st, 1, 2));
  Delete(st, 1, 2);
  DeleteChar(st, ' ');
  //MNo(Index)����: 0�� �ϳ��� �����...
  Edit_LinkusTel.Text := st;
  Edit_LinkusTel.Color := clYellow;
end;


//��ī��Ʈ ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
//��ī��Ʈ ���

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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;
//��ī��Ʈ ����

procedure TForm_Main.RcvRingCount(aData: string);
var
  st: string;
  aCount: Integer;
begin
  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 22, 2);
  aCount := StrToInt(st);
  Spinner_Ring.Value := aCount;
  Spinner_Ring.Color := clYellow;
  bRingCountCheck := True;
end;


//�ý�������  ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//�ý�������  ���
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
    IntToStr(WatchPowerOff) +                         // �������ÿ���
    FillZeroNumber(DelayOut, 3) +                     // ��������ð�
    '2' +                                             // ����
    IntToStr(Door1Type) +                             // Door1
    IntToStr(Door2Type) +                             //Door2
    SetLength(Locate, 16) +                           // ��ġ��
    FillZeroNumber(DelayIn, 3) +                      // �Խ������ð�
    '1';                                              // ���� ��� ���(����)

  bSysInfoCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bSysInfoCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//�ý�������  ��ȸ
procedure TForm_Main.RcvSysinfo(aData: string);
var
  st: string;
  stECUID:string;
begin
  //         1         2         3         4         5
  //12345678901234567890123456789012345678901234567890123
  //052 K1111111100iHSY001010200�׽�Ʈ          000079

  //052 K1000000000i5SY001000221                000157
  //                      ---------------------------


  bSysInfoCheck := True;

  Delete(aData, 1, 1);
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 22, 7);
  stECUID := Copy(aData,14,2);
  if not isDigit(st) then Exit;

  {���� ���ÿ���}
  ComboBox_WatchPowerOff.ItemIndex := StrToInt(st[1]);
  ComboBox_WatchPowerOff.Text := ComboBox_WatchPowerOff.Items
    [ComboBox_WatchPowerOff.ItemIndex];
  ComboBox_WatchPowerOff.Color := clYellow;
  UpdateWatchPower(stECUID,st[1]);

  {��������ð�}
  SpinEdit_OutDelay.IntValue := StrToInt(Copy(st, 2, 3));
  SpinEdit_OutDelay.Color := clYellow;

  {����}
  //ComboBox_DeviceType.ItemIndex:= StrtoInt(st[5]);
  //ComboBox_DeviceType.Text:= ComboBox_DeviceType.Items[ComboBox_DeviceType.ItemIndex];

  {Door1 �뵵}
  ComboBox_DoorType1.ItemIndex := StrToInt(st[6]);
  ComboBox_DoorType1.Text := ComboBox_DoorType1.Items[ComboBox_DoorType1.ItemIndex];
  ComboBox_DoorType1.Color := clYellow;
  UpdateDoorType1(stECUID,st[6]);

  {Door2 �뵵}
  ComboBox_DoorType2.ItemIndex := StrToInt(st[7]);
  ComboBox_DoorType2.Text := ComboBox_DoorType2.Items[ComboBox_DoorType2.ItemIndex];
  ComboBox_DoorType2.Color := clYellow;
  UpdateDoorType2(stECUID,st[7]);
  
  {�ý��� ��ġ��}
  Edit_Locate.Text := Copy(aData, 29, 16);
  Edit_Locate.Color := clYellow;
  
  {�Խ������ð�}
  SpinEdit_InDelay.IntValue := StrToInt(Copy(aData, 45, 3));
  SpinEdit_InDelay.Color := clYellow;

end;


//�ý�������  ��ȸ(��������)
function TForm_Main.CheckSysInfo2(aDeviceID: string;
  aDoorNo: Integer): Boolean;
var
  aData: string;
  DeviceID: string;
  nTime : integer;
begin
  result := False;
  aData := 'B' + '0' +                             //MSG Code
    IntToStr(aDoorNo) +               //����ȣ
    #$20 + #$20 + '00000000000000000000';          //��ȸ�� ��ü�� '0'���� ��ŷ

  bSysInfo2Check := False;
  SendPacket(aDeviceID, 'c', aData, True);

  nTime := 0;
  while Not bSysInfo2Check do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  result := True;
end;
//�������� �ý�������  ���

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
    '0' +                              //Msg Count(����)
    IntToStr(aDoorNo) +                //����ȣ
    #$20 + #$20 +                      // Record count
    IntToStr(aCardMode) +              //ī�����
    IntToStr(aDoorMode) +              //���Թ� ����
    IntToStr(aDoorOpenTime) +          //Door���� �ð�
    IntToStr(aOpenMoniTime) +          //��ð� ���� �溸
    IntToStr(aUseSchedule) +           //������ ��������
    IntToStr(aSendDoorState) +         //���Թ���������
    '0' +                              //����̻�� ���(������:����)
    '0' +                              //AntiPassBack(������:����)
    IntToStr(aUseOpenalarm) +          //��ð� ���� �������
    '0' +                              //��� �̻�� ���� ��� (������:����)
    IntToStr(aLockType) +              //������ Ÿ��
    IntToStr(aControledFire) +         //ȭ�� �߻��� ������
    '0' +                              //DS LS �˻�(������:����)
    '0000000';                         //����


  bSysInfo2Check := False;
  SendPacket(aDeviceID, 'c', aData, true);

  nTime := 0;
  while Not bSysInfo2Check do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;


//���ī�帮�� ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//ī�帮�� ���



//���	046 K1111111100I6CD010010011111111        2E
//����	046 K1111111100iaCD010010011111111        E3
//��ȸ 	025 K1111111100Q0CD01A8
//����  046 K1111111100ihCD010010011111111        DC

function TForm_Main.RegCardReader(aDeviceID: string;    // ����ȣ
  aNo,                  // ī�帮�� ��ȣ
  aUsed,                //  ��뿩��
  aDoorNo: Integer;     // ���� ����ȣ
  aLocate: string       // ��ġ��
  ): Boolean;
var
  aReaderNoStr: string;
  aData: string;
  nTime : integer;
begin
  Result := false;
  aReaderNoStr := FillZeroNumber(aNo, 2);
  aData := 'CD' +                                         //COMMAND
    aReaderNoStr +                                        //���� ��ȣ
    IntToStr(aUsed) +                                     //���� ��� ����
    '0' +                                                 //���� ��ġ(����)
    IntToStr(aDoorNo) +                                   //Door No
    '00' +                                                //����ȣ
    SetLength(aLocate, 16);                               //��ġ��

  bCardReaderCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCardReaderCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

//ī�帮�� ���� ����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 20, 2);
  stECUID := copy(aData,14,2);
  aReaderNo := StrToInt(st);
  st := Copy(aData, 22, 21);
  //if not isdigit(st) then Exit;
  UsedCardreader := st[1];         // ī�帮�� ��뿩��
  DoorNo := st[3];                 // ���� ����ȣ
  Locate := Copy(st, 6, 16);       // ī�帮�� ��ġ��

  if UsedCardreader = '0' then  sgCardReader.Cells[1, aReaderNo] := '�̻��'
  else sgCardReader.Cells[1, aReaderNo] := '���';
  //sgCardReader.Cells[1, aReaderNo] := UsedCardreader;
  UpdateReaderUse(stECUID,sgCardReader.Cells[1, aReaderNo],aReaderNo);
  sgCardReader.Cells[2, aReaderNo] := DoorNo;
  UpdateReaderDoor(stECUID,DoorNo,aReaderNo);
//  sgCardReader.Cells[3, aReaderNo] := Trim(Locate);
//  UpdateReaderName(stECUID,Trim(Locate),aReaderNo);
  sgCardReader.Color := clYellow;

  bCardReaderCheck := True;
end;

//�����ƮLOOP ��ȸ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// ��Ʈ ���
//073 K1111111100I5LP01S111011111111100011111111100                040057
//073 K1111111100i3LP01S111011111111100011111111100                040039

function TForm_Main.RegPort(aDeviceID: string;           // ����ȣ
  aNo,                         // ��Ʈ��ȣ
  aAlarmType,                  // ��������
  aUseDelay,                   // �����ð�
  aDetectTime: Integer;         // �����ð�
  aLocate: string              // ��ġ��
  ): Boolean;
var
  aData: string;
  aPortNoStr: string;
  nTime : integer;
begin
  Result := false;
  aPortNoStr := FillZeroNumber(aNo, 2);
  aData := 'LP' +                              //COMMAND
    aPortNoStr +                               //��Ʈ��ȣ
    'SS' +                                     //�����ڵ�('SS' ����)
    IntToStr(aAlarmType) +                     //��������
    '0' +                                      //�˶��߻� ���(����)
    '0' +                                      //������ȣ����(����)
    IntToStr(aUseDelay) +                      //�����ð� �������
    '00' +                                     //����
    '00' +                                     //���̷�
    '00' +                                     //������1
    '00' +                                     //������2
    '00' +                                     //���Թ�����1
    '00' +                                     //���Թ�����2
    '00' +                                     //���η���
    '00' +                                     //���ν��̷�
    '00' +                                     //���θ�����1
    '00' +                                     //���θ�����2
    '00' +                                     //����ȣ
    SetLength(aLocate, 16) +                   //��ġ��
    FillZeroNumber(aDetectTime, 2) +           //�����ð�
    '00';                                      //������

  bPortCheck:=False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bPortCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
    Application.ProcessMessages;
    Sleep(1);
    nTime := nTime + 1;
  end;

  Result := true;
end;

// ��Ʈ ���� ����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  st := Copy(aData, 20, 2);
  stECUID := copy(aData,14,2);
  aIndex := StrToInt(st);

  //��������
  aWatchCode := StrToInt(aData[24]);
  //�����ð�
  aDelayTime := aData[27];
  //�����ð�
  aDetecttime := Copy(aData, 66, 4);
  //��ġ��
  aLocate := Copy(aData, 50, 16);


  //��������
  case aWatchCode of
    0: aWatchStr := '0.���';
    1: aWatchStr := '1.ȭ��';
    2: aWatchStr := '2.����';
    3: aWatchStr := '3.���';
    4: aWatchStr := '4.����';
    else aWatchStr := '0.���';
  end;

  //��Ʈ��ȣ
  sgPort.Cells[0, aIndex] := IntToStr(aIndex);

  //��������
  sgPort.Cells[1, aIndex] := aWatchStr;
  UpdatePortType(stECUID,aWatchStr,aIndex);

  //�����ð�
  if aDelayTime = '0' then sgPort.Cells[2, aIndex] := '�̻��'
  else sgPort.Cells[2, aIndex] := '���';
  //sgPort.Cells[2, aIndex] := aDelayTime;
  UpdatePortDelay(stECUID,sgPort.Cells[2, aIndex],aIndex);

  //�����ð�
  sgPort.Cells[3, aIndex] := inttostr(strtoint(aDetecttime));
  UpdatePortSense(stECUID,sgPort.Cells[3, aIndex],aIndex);

  //��ġ��
  sgPort.Cells[4, aIndex] := trim(aLocate);
  UpdatePortName(stECUID,trim(aLocate),aIndex);

  sgPort.Color := clYellow;
  bPortCheck := True;
end;


//�ð�����ȭ
function TForm_Main.TimeSync(aDeviceID: string): Boolean;
var
  aTimeStr: string;
  aData: string;
begin
  Result := false;
  aTimeStr := FormatDateTime('yyyymmddhhnnss', Now);
  aData := 'TM00' +   // COMMAND
    aTimeStr;         // �ð�������
  SendPacket(aDeviceID, 'R', aData, True);
  Result := true;
end;

//����Ȯ��
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

//��������� Ȯ��
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

//��⸮��
function TForm_Main.ResetDevice(aDeviceID: string): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'RS00Reset';
  SendPacket(aDeviceID, 'R', aData, false);
  Result := true;
end;

//��� �޸𸮻���
function TForm_Main.ClearRegister(aDeviceID: string): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'ac00Register Clear';
  SendPacket(aDeviceID, 'I', aData, false);
  Result := true;
end;

// �˶� ��� ����
function TForm_Main.ChangeAlarmMode(aDeviceID: string; aMode: Char;aQuick:Boolean): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'MC' +         //COMMAND
    '00' +                //ZONE ����
    aMode;                //A:���, D:����, P:��ȸ
  SendPacket(aDeviceID, 'R', aData, aQuick);
  Result := true;
end;

// ������
function TForm_Main.DoorControl(aDeviceID: string;  //����ȣ
  aNo,               // ����ȣ
  aControlType,      //������
  aControl: Integer  //���� Ŀ�ǵ�
  ): Boolean;
var
  aData: string;
begin
  Result := false;
  aData := 'C' + '0' +                                    //����/������ ����
    IntToStr(aNo) +                          //��⳻ ����ȣ
    '0' +                                    //����
    IntToStr(aControlType) +                    //'0':�ش���׾���,'1':ī��,'2':���Կ,'3':��������
    IntToStr(aControl);                        // ī��:Positive:'0',Negative:'1'
  // ���Կ:'0':� ,'1':����
  // ��������:'0':����,'1':����
  SendPacket(aDeviceID, 'c', aData, True);
  Result := true;
end;

procedure TForm_Main.ComboBox_ECUChange(Sender: TObject);
var
  stECUNO:string;
begin
  stECUNO := copy(ComboBox_ECU.Text,1,2);
  DeviceTableShow(stECUNO);
  // ECU�� ���� �Ǹ� ��Ź��۸� Clear�Ѵ�.
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
  //040 K1123456700i1IFN00���нý���      61

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  DeviceID:= Copy(aData,8,9);



  accData:= Copy(aData,19,Length(aData)-20); //�������� ���� ���� ������
  msgCode:= accData[1];

  {ACK ����:���԰� DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aData,20,2)+'  '+'a';
    SendPacket(DeviceID, 'c', st, true);
  end;

  {�������� ������ ó��}
//0460K1100000400c2a51  005000000010000000009E
  case msgcode of
     //'F': RcvTelEventData(accData);
    'E': RcvAccEventData(DeviceID,accData);
    'D': RcvDoorEventData(accData);
    'a': RcvSysinfo2(DeviceID,accData);        //��� ��� ����
    'b': RcvSysinfo2(DeviceID,accData);        //��� ��ȸ ����
    'c': RcvAccControl(accData);      //��� ���� ����
'l','n','m': RcvCardRegAck(accData,DeviceID);  //ī��������
's','p': RcvSch(accData);             // ������ ����
//    'v': RcvFoodTime(accData);        //�Ļ�ð�����
  end;

  {
  �����             PC  <-> COntroller
  ====================================
  �����̺�Ʈ            #$90 <-> #$31
  DOOR �̺�Ʈ           #$90 <-> #32

  ����                  #$31 <-> #$41

  �ý������� ���       #$50 <-> #$60
  �ý������� ��ȸ       #$51 <-> #$61
  ī�嵥���� ���       #$52 <-> #$62
  ī�嵥���� ��ȸ       #$53 <-> #$63
  �����ٵ����� ���     #$56 <-> #$66
  �����ٵ����� ��ȸ     #$57 <-> #$67
  Ư���ϵ����� ���     #$58 <-> #$68
  Ư���ϵ����� ����     #$59 <-> #$69
  ī�嵥����(����)���  #$70 <-> #$80
  ī�嵥����(����)��ȸ  #$71 <-> #$81
  ī�嵥����(����)����  #$72 <-> #$82
  ACK ����              #$90
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
  //40 K1123456700i1IF00���нý���      61

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
    else if aRegGubun = '50' then  //KTLan ����
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
    if Copy(aData,20,2) = 'NW' then  //����ȸ ���
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
    //�ð�����
    st :=  Copy(aData,23,4)+'-'+  //��
           Copy(aData,27,2)+'-'+  //��
           Copy(aData,29,2)+' '+  //��
           Copy(aData,31,2)+':'+  //��
           Copy(aData,33,2)+':'+  //��
           Copy(aData,35,2);      //��
    if bTimeShow then
    MessageDlg('EUC ID:'+ Copy(aData,15,2) + ' �ð�����'+#13
               +st, mtInformation, [mbOK], 0);


  end else if aCode = 'VR' then
  begin
    //��� ����Ȯ��
    bVERCheck := True;
    if bECUStatusCheck then exit;
    if bTotalComCheckShow then fmTotalComCheck.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-23)   //ECUID + Version;
    else if bDeviceComCheckShow then fmDeviceComChk.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-23)
    else lb_Version.Caption:= Copy(aData,23,Length(aData)-23);

  end else if aCode = 'CV' then
  begin
    // ī�帮�� ����
    bReaderVERCheck := True;
    if bTotalComCheckShow then fmTotalComCheck.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-25)
    else if bDeviceComCheckShow then fmDeviceComChk.stMessage := copy(aData,15,2) + Copy(aData,23,Length(aData)-25);   //ECUID + Version;
    //else lb_Version.Caption:= Copy(aData,23,Length(aData)-23);
    //
  end else if aCode = 'RS' then //Reset
  begin
    //Edit_Reset.Text:= Copy(aData,23,Length(aData)-23);
    MessageDlg('ECUID:' + copy(aData,15,2) + ' ���� �Ǿ����ϴ�.', mtInformation, [mbOK], 0);

  end else if aCode = 'MC' then   //Change mode
  begin
    // ����ȣ: ����� ��ü 00�� ������.
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
    // �˶����
    case aData[23] of
      'A': begin //�����
             Status_AlarmMode.ImageIndex:= 3;
             Status_AlarmMode.Caption:= '�����';
           end;
      'D': begin //�������
             Status_AlarmMode.ImageIndex:= 2;
             Status_AlarmMode.Caption:= '�������';
           end;
      'P': begin //��ȸ���
             Status_AlarmMode.ImageIndex:= 7;
             Status_AlarmMode.Caption:= '�������';
           end;
    end;

  end else if aCode = 'cs' then //��Ż���üũ
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

// ����ī�� �̺�Ʈ
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
  DoorState:= aData[22];    //������
  DoorMode:=  aData[19];    //�/����
  DoorMode2:= aData[18];    //Posi/Nega


   st:= Copy(aData,6,2)+'-'+
       Copy(aData,8,2)+'-'+
       Copy(aData,10,2)+' '+
       Copy(aData,12,2)+':'+
       Copy(aData,14,2)+':'+
       Copy(aData,16,2)+';';
  {2.ī���ȣ/���Թ�ȣ}

  //aCardNo:= copy(aData,24,8);
  aCardNo:= copy(aData,26,8);  //ī���ȣ 10�ڸ� ����(���� �� 00 �ι���Ʈ ��� ����)
  //bCardNo:= Hex2Dec64(aCardNo);
  //st:= st + FillZeroNumber2(bCardNo,10);

  bCardNo:= DecodeCardNo(aCardNo);
  st:= st+ bCardNo +';';//+ '000000';
   {3.Ȯ����ȣ}
   st:= st + Copy(aDevice,8,2)+';';
  {4.����ȣ}
  st:= st + aData[3]+';';

  {5.Posi/Nega}
  case aData[18] of
    '0': st:=st + 'Positive;';
    '1': st:= st + 'Negative;';
    else   st:= st+ aData[18];
  end;
  {6.����}
  case aData[19] of
    '0': st:= st+'����;';
    '1': st:= st+'������;';
    else   st:= st+aData[19];
  end;
  {7.�������}
  case aData[20] of
    'C': st:= st + 'ī��;';
    'P': st:= st + '��ȭ;';
    'R': st:= st + '��������;';
    'B': st:= st + '��ư;';
    'S': st:= st + '������;';
    else st:= st + aData[20];
  end;
  {8.���Խ��ΰ��}
  case aData[21]of
    #$30: st:= st + '0;';
    #$31: st:= st + '���Խ���;';
    #$32: st:= st + '���Խ���(*);';
    #$41: st:= st + '�̵��ī��;';
    #$42: st:= st + '���ԺҰ�;';
    #$43: st:= st + '�̵��ī��(*);';
    #$44: st:= st + '��������ԺҰ�;';
    #$45: st:= st + '�������ѽð�;';
    #$46: st:= st + '��ȿ�Ⱓ����;';
    else st:= st + aData[21]+';';
  end;
  {9.���Թ� ����}
  case aData[22]of
    'C': st:= st +'����;';
    'O': st:= st +'����;';
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

   if bRegCardShow then   //ī���� ȭ���� Ȱ��ȭ �Ǿ� ������ AutoDown ����
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
    //�޸��忡 ���
    Append_Memo_CardNo(bCardNo);
    // �ٿ�ε�
    CD_DownLoad(DeviceID,bCardNo+'000000' ,'L');

  end;
   }




end;

//������ ���� ������ ó��
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
  //19�� ~
  //D20000504161543370000O D3

  aDoorNo:=   aData[3];
  DoorState:= aData[22];    //������
  DoorMode:=  aData[19];    //�/����
  DoorMode2:= aData[18];    //Posi/Nega
  aTime:=     Copy(aData,6,12);

  if DoorMode2 <> '1' then //Positive
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[�P]';
      '1':st:= aDoorNo+'[����P]';
    end;
  end else                //Negative
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[�N]';
      '1':st:= aDoorNo+'[����N]';
    end;
  end;


  case DoorState of
    'C': //����
      begin
        aImageIndex:=0;
      end;
    'O': //����
      begin
        aImageIndex:=1;
      end;
    'T'://��ð� ����
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[��ð�����]';
      end;
    'U'://�����̻�
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[�����̻�]';
      end;
    'L'://�����̻�
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[�����̻�]';
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

//�������� ����� ���� ó��
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
  {��� ����ȣ}
  if aData[3] >= #$30 then
  begin
    aDoorNo:= StrtoInt(aData[3]);
  end;
  stComcheck := stComcheck + aData[3] ;

  {ī�����}
  if aData[6] >= #$30 then
  begin
    aCardMode:= StrtoInt(aData[6]);
  end;
  if aCardMode = 0 then stComcheck := stComcheck + 'ī����:Positive'
  else stComcheck := stComcheck + 'ī����:Negative' ;

  {���Թ� ����}
  if aData[7] >= #$30 then
  begin
    aDoorMode:= StrtoInt(aData[7]);
  end;
  if aDoorMode = 0 then stComcheck := stComcheck + '/����:�'
  else stComcheck := stComcheck + '/����:����' ;
  if bTotalComCheckShow then
  begin
    fmTotalComCheck.stMessage := stComCheck;
    exit;
  end else if bDeviceComCheckShow then
  begin
    fmDeviceComChk.stMessage := stComCheck;
    exit;
  end;

  {DOOR����ð�}
  if aData[8] >= #$30 then
  begin
    aDoorOPen:= aData[8];
  end;

  {��ð� ���� �溸}
  if aData[9] >= #$30 then
  begin
    aOpenMoni:= aData[9];
  end;
  {������ ���� ����}
  if aData[10] >= #$30 then
  begin
   UseSch:= StrtoInt(aData[10]);
  end;
  {���Թ� ���� ����}
  if aData[11] >= #$30 then
  begin
    SendDoorStatus:= StrtoInt(aData[11]);
  end;
  {��� �̻�� ��� }
  if aData[12] >= #$30 then
  begin
    // ���� ������
  end;
  {Antipassback}
  if aData[13] >= #$30 then
  begin
    //���� ��� ����
  end;
  {��ð� ���� ���� ���}
  if aData[14] >= #$30 then
  begin
    AlarmLongOpen:= StrtoInt(aData[14]);
  end;
  {��� �̻�� ���� ���}
  if aData[15] >= #$30 then
  begin
    //���� ��� ����
  end;
  {������ Ÿ��}
  if aData[16] >= #$30 then
  begin
    LockType:= StrtoInt(aData[16]);
  end;
  {ȭ�� �߻��� ������}
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
            StatusStr:= InttoStr(aDoorNo)+'[�P]';
          end;

      1:begin
            StatusStr:= InttoStr(aDoorNo)+'[����P]';
          end;
    end;
  end else                //Negative
  begin
    Case aDoorMode of
      0:begin
            StatusStr:= InttoStr(aDoorNo)+'[�N]';
          end;
      1:begin
            StatusStr:= InttoStr(aDoorNo)+'[����N]';
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

// ��� ���� ����
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
  //19�� ~
  //D20000504161543370000O D3

  aDoorNo:=   aData[3];
  DoorState:= aData[8];    //������
  DoorMode:=  aData[7];    //�/����
  DoorMode2:= aData[6];    //Posi/Nega

  if DoorMode2 <> '1' then //Positive
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[�P]';
      '1':st:= aDoorNo+'[����P]';
    end;
  end else                //Negative
  begin
    Case DoorMode of
      '0':st:= aDoorNo+'[�N]';
      '1':st:= aDoorNo+'[����N]';
    end;
  end;


  case DoorState of
    'C': //����
      begin
        aImageIndex:=0;
      end;
    'O': //����
      begin
        aImageIndex:=1;
      end;
    'T'://��ð� ����
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[��ð�����]';
      end;
    'U'://�����̻�
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[�����̻�]';
      end;
    'L'://�����̻�
      begin
        aImageIndex:=4;
        st:= aDoorNo+'[�����̻�]';
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

// ī���� ����
procedure TForm_Main.RcvCardRegAck(aData,aDeviceID: String);
var
  st: string;
  aMsg: String;
  aCardNo: string;
  LinkusNo: String;
begin

  //if Copy(aData,7,10) <> '0000000000' then Exit;

  case aData[1] of
    'l':aMsg:='[���]';
    'm':aMsg:='[��ȸ]';
    'n':aMsg:='[����]';
  end;
  aCardNo:= Copy(aData,9,8);
  aMsg := aMsg + aDeviceID + ':';  //��� ����ȣ ���

  aMsg:= aMsg + DeCodeCardNo(aCardNo)+ ':';
  aMsg:= aMsg + Copy(aData,17,6)+':';

  LinkusNo:= Copy(aData,4,3);
  aMsg:= aMsg + Hex2DecStr(LinkusNo)+':';

  case aData[23] of
    '0': aMsg:= aMsg +'�̻��'+':';
    '1': aMsg:= aMsg +'�̵��'+':';
    '2': aMsg:= aMsg +'  ���'+':';
  end;

  case aData[24] of
    '0': aMsg:= aMsg +'����';
    '1': aMsg:= aMsg +'���';
    '2': aMsg:= aMsg +'���Թ��';
  end;

   if bRegCardShow then   //ī���� ȭ���� Ȱ��ȭ �Ǿ� ������ ��ϰ�� ��ȸ
   begin
      Form_RegCard.Memo2.Lines.Add(aMsg);
   end;


end;

//������ ��� ����
Procedure TForm_Main.RcvSch(aData: String);
var
  aCode: Integer;
begin
  //���⿡�� ������ ��ȸ ����....
  if Not bDoorSchRegShow then Exit; //��������ȸ ȭ���� �� ���� ������ ��������...
  DoorscheduleRegForm.LoadSchadule(aData);
end;

//���� Timer
procedure TForm_Main.SendTimerTimer(Sender: TObject);
begin
  if CommPort.Open then ExecSendPacket;

end;

// ��ȸ��� ====================================================================
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
    showmessage('CHKMCU ��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKECU ��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKDISALARM ��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKKTTID��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKDECODERNO��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKTELLCOUNT��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKLAN��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKSYS��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKSYS2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKSYS2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER1��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER3��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER4��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER5��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER6��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER7��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKREADER8��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT1��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT3��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT4��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT5��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT6��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT7��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('CHKPORT8��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;
// =============================================================================

// ��� �޴� ===================================================================
//ID���
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
    showmessage('REGMCUID��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//ECU���
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
    showmessage('REGECU��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//�˶�ǥ�ñ� ���
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
    showmessage('REGDISALARM��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//����ID ���
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
    showmessage('KTTID��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//���ڴ� ��ȣ ���
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
    showmessage('REGDECODERNO��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end; }
end;

//��ī��Ʈ ���
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
    showmessage('REGTELLCOUNT��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;

//������ ����
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
    showmessage('REGLAN��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;

end;

// �ý��� ���� ���
procedure TForm_Main.MENU_REGSYSClick(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo(aDeviceID,                           // ����ȣ
             ComboBox_WatchPowerOff.ItemIndex,    // ��������
             SpinEdit_InDelay.IntValue,           // �Խ������ð�
             SpinEdit_OutDelay.IntValue,          // ��������ð�
             ComboBox_DoorType1.ItemIndex,        // Door1�뵵(0:���,1:����.2:���+����)
             ComboBox_DoorType2.ItemIndex,        //Door2�뵵(0:���,1:����.2:���+����)
             Edit_Locate.Text);                   // ��ġ��
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
  end;
end;


//�������� ���
procedure TForm_Main.MENU_REGSYS2Click(Sender: TObject);
var
  aDeviceID: String;
  bResult : Boolean;
  nLoop : integer;
begin
  aDeviceID:= GetDeviceID;
  //���Թ�1
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo2(aDeviceID,                             // ����ȣ
              1,                                     // ����ȣ
              ComboBox_CardModeType1.ItemIndex,      // ī�� ���� (0:Positive, 1:Negative)
              ComboBox_DoorModeType1.ItemIndex,      // ���Թ� ���� (0:�, 1:����)
              SpinEdit_DoorOPen1.IntValue,           // Door ����ð�
              SpinEdit_OpenMoni1.IntValue,           // ��ð� ���� �溸
              ComboBox_UseSch1.ItemIndex,            // ������ ���� ���� (0:������, 1:���)
              ComboBox_SendDoorStatus1.ItemIndex,    // ���Թ� ���� ����(0:������, 1:���)
              ComboBox_AlarmLongOpen1.ItemIndex,     // ��ð� ���� ���� ���(0:������, 1:���)
              ComboBox_LockType1.ItemIndex,          // ������ Ÿ��
              ComboBox_ControlFire1.ItemIndex);      // ȭ�� �߻��� ������
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;

  //���Թ�2
  for nLoop := 0 to LoopCount - 1 do
  begin
    bResult := RegSysInfo2(aDeviceID,                             // ����ȣ
              2,                                     // ����ȣ
              ComboBox_CardModeType2.ItemIndex,      // ī�� ���� (0:Positive, 1:Negative)
              ComboBox_DoorModeType2.ItemIndex,      // ���Թ� ���� (0:�, 1:����)
              SpinEdit_DoorOPen2.IntValue,           // Door ����ð�
              SpinEdit_OpenMoni2.IntValue,           // ��ð� ���� �溸
              ComboBox_UseSch2.ItemIndex,            // ������ ���� ���� (0:������, 1:���)
              ComboBox_SendDoorStatus2.ItemIndex,    // ���Թ� ���� ����(0:������, 1:���)
              ComboBox_AlarmLongOpen2.ItemIndex,     // ��ð� ���� ���� ���(0:������, 1:���)
              ComboBox_LockType2.ItemIndex,          // ������ Ÿ��
              ComboBox_ControlFire2.ItemIndex);      // ȭ�� �߻��� ������
    if Not bConnected then Exit;
    if bResult then break;
  end;
  if not bResult then
  begin
    IsStop := True;
    showmessage('REGSYS2��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
    Panel1.Visible := False;
    btnRefresh.Enabled := True;
    btnReg.Enabled := True;
    Exit;
  end;
end;

//ī�帮�� ���
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
    if sgCardReader.Cells[1, I] = '�̻��' then  aUsed:= 0
    else aUsed:= 1;
//    aUsed:=   StrtoInt(sgCardReader.Cells[1, I]);
    aDoorNo:= StrtoInt(sgCardReader.Cells[2, I]);
//    aLocate:= sgCardReader.Cells[3, I];

    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegCardReader(aDeviceID,  // ����ȣ
                  I,          // ī�帮�� ��ȣ
                  aUsed,      //  ��뿩��
                  aDoorNo,    // ���� ����ȣ
                  aLocate);   // ��ġ��
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('REGREADER��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
  aAlarmType:   Integer;         // ��������
  aUseDelay:    Integer;         // �����ð�
  aDetectTime:  Integer;         // �����ð�
  aLocate:      string;          // ��ġ��
  bResult : Boolean;
  nLoop : integer;

begin
  aDeviceID:= GetDeviceID;
  for I:= 1 to 8 do
  begin
    st:= sgPort.Cells[1, I];
    aAlarmType:=  Ord(st[1]) - $30;
    if sgPort.Cells[2, I] = '�̻��' then  aUseDelay:= 0
    else aUseDelay:= 1;
    //aUseDelay:=   StrtoInt(sgPort.Cells[2, I]);
    aDetectTime:= StrtoInt(sgPort.Cells[3, I]);
    aDetectTime := aDetectTime div 100;
    aLocate:=     sgPort.Cells[4, I];
    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegPort(aDeviceID,       // ����ȣ
              I,               // ��Ʈ��ȣ
              aAlarmType,      // ��������
              aUseDelay,       // �����ð�
              aDetectTime,     // �����ð�
              aLocate);        // ��ġ��
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('REGPORT��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
      Panel1.Visible := False;
      btnRefresh.Enabled := True;
      btnReg.Enabled := True;
      Exit;
    end;
  end;

end;

{��ü��ȸ}
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
  Panel1.Caption := '���� ȯ�� ��ȸ���Դϴ�.';
  if IsConfigMCU then MENU_CHKMCUClick(Self);
  if Not bConnected then
  begin
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Panel1.Visible := False;
    Exit;
  end;
  if IsStop then Exit;
  Panel1.Caption := 'MCU���� üũ���Դϴ�.';
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
  Panel1.Caption := '�ý��� ������� üũ���Դϴ�.';
  if Not IsConfigMCU then MENU_CHKSYSClick(Self);
  if bErrorCheck then
  begin
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Panel1.Visible := False;
    Showmessage(ErrorMessage + ' ��� �����Դϴ�.');
    exit;
  end;
  if IsStop then Exit;
  //MENU_CHKSYSClick(Self);
  Panel1.Caption := '����������� üũ���Դϴ�.';
  if Not IsConfigMCU then MENU_CHKSYS2Click(Self);
  if IsStop then Exit;
  Panel1.Caption := 'ī�帮����� üũ���Դϴ�.';
  //CardTypeSearch;
  if Not IsConfigMCU then MENU_CHKREADERClick(Self);
  if IsStop then Exit;
  Panel1.Caption := '��Ʈ���� üũ���Դϴ�.';
  if Not IsConfigMCU then MENU_CHKPORTClick(Self);
  if IsStop then Exit;
  Panel1.Visible := False;
  btnReg.Enabled := True;
  btnRefresh.Enabled := True;

end;

{��ü���}
procedure TForm_Main.btnRegClick(Sender: TObject);
var
  aDeviceID :string;
  nTime : integer;
begin
  IsStop := False;
  ControlInit;

{  if GetMcuID = '0000000' then
  begin
    MessageDlg('MCU ID�� �Է� �ϼ���', mtWarning, [mbOK], 0);
    Exit;
  end;    }

  if IsConfigMCU then  aDeviceID := GetMcuID + '00'
  else aDeviceID := GetMcuID + copy(ComboBox_ECU.Text,1,2);

  if cb_CardType.ItemIndex = 0 then
  begin
    cb_CardType.ItemIndex := 1;
//    showmessage('ī�帮�� Ÿ���� �����ϼž� �մϴ�.');
//    Panel1.Visible := False;
//    cb_CardType.SetFocus;
//    Exit;
  end;

  bConnected := True;
//  ChangeAlarmMode(aDeviceID,'D',True);//������ ����������� ���� �� �������.
  if IsStop then Exit;
  Panel1.Visible := True;
  Panel1.Caption := '���� ȯ�� ������Դϴ�.';
  btnReg.Enabled := False;
  btnRefresh.Enabled := False;
  if IsConfigMCU then MENU_REGMCUIDClick(Self);         //ID���
  if Not bConnected then Exit;
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGECUClick(Self);           //ECU���
  if IsStop then Exit;
  if IsConfigMCU then ECUStatusCheck;
  if IsConfigMCU then MENU_REGDISALARMClick(Self);      //�˶�ǥ�ñ� ���
  if IsStop then Exit;
  if IsConfigMCU then MENU_KTTIDClick(Self);            //���� �ý���ID ���
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGDECODERNOClick(Self);     //���ڴ� ��ȣ ���
  if IsStop then Exit;
  if IsConfigMCU then MENU_REGTELLCOUNTClick(Self);     //��ī��Ʈ ���
  if IsStop then Exit;
  if IsConfigMCU then btnKTLanSetClick(self);
//  if IsConfigMCU then MENU_REGLANClick(Self);           //������ ���
//  if IsConfigMCU then btn_adminsetClick(self);
//  if IsConfigMCU then btn_ImageLanClick(self);
  if IsStop then Exit;
  if IsConfigMCU then btn_CCTVSetClick(self);
  if IsStop then Exit;


  if Not IsConfigMCU then
  begin
    ChangeAlarmMode(aDeviceID,'D',True);//������ ����������� ���� �� �������.
    nTime := 0; //1�� ���� ��� ����
    while True do
    begin
      if nTime > 1000 Then Break; //1�� ���
      Application.ProcessMessages;
      Sleep(1);
      nTime := nTime + 1;
    end;

  end;
  Panel1.Caption := '�ý��� ���� ������Դϴ�.';
  bErrorCheck := False;
  if Not IsConfigMCU then MENU_REGSYSClick(Self);           //�ý��� ���� ���
  if bErrorCheck then
  begin
    Panel1.Visible := False;
    btnReg.Enabled := True;
    btnRefresh.Enabled := True;
    Showmessage(ErrorMessage + ' ��� �����Դϴ�.');
    exit;
  end;
  if IsStop then Exit;

  Panel1.Caption := '�������� ������Դϴ�.';
  if Not IsConfigMCU then MENU_REGSYS2Click(Self);          //�������� ���
  if IsStop then Exit;
  Panel1.Caption := 'ī�帮�� ������Դϴ�.';
  //CardTypeReg;
  if Not IsConfigMCU then MENU_REGREADERClick(Self);        //ī�帮�� ���
  if IsStop then Exit;
  Panel1.Caption := '��Ʈ���� ������Դϴ�.';
  if Not IsConfigMCU then MENU_REGPORTClick(Self);           //��Ʈ�������
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
///Device Table ���õ� �Լ�
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
///Device Table ���õ� �Լ�   ��
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
  //ECU ���
  if IsConfigMCU then
  begin
    with TB_DEVICE do //ECU üũ
    begin
      First;
      lvECU.Clear;
      ECUList.Clear;
      ECUList.Add('99.��ü');
      ECUList.Add('00.Controler');
      while Not Eof do
      begin
        if FindField('EUC_ID').AsString = '00' then
        begin
          Next;
          Continue;
        end;

        aList := lvECU.Items.Add;
        aList.Caption := FindField('EUC_ID').AsString; //ECU ��ȣ
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
      //����κ�
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
    showmessage('���ȯ�� üũ�� ������� ��ȸ �� üũ ���� �մϴ�.');
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
    showmessage('Version��������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    showmessage('���ȯ�� üũ�� ������� ��ȸ �� üũ ���� �մϴ�.');
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
  DoorControl(aDeviceID,1,3,1 ); //����ȣ,��������,������(1)
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
  DoorControl(aDeviceID,1,2,0 );    //����ȣ,���Կ,����

end;

procedure TForm_Main.MENU_OMODEDOOR1Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,1,2,1 );    //����ȣ,���Կ,������
end;

procedure TForm_Main.MENU_NMODEDOOR2Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,2,2,0 );    //����ȣ,���Կ,����

end;

procedure TForm_Main.MENU_OMODEDOOR2Click(Sender: TObject);
var
  aDeviceID : string;
begin
  if IsConfigMCU then  aDeviceID :=  GetMcuID + '00'
  else aDeviceID :=  GetMcuID + copy(ComboBox_ECU.Text,1,2)  ;
  DoorControl(aDeviceID,2,2,1 );    //����ȣ,���Կ,������

end;

procedure TForm_Main.btnComCheckClick(Sender: TObject);
begin
{  if Not bSearch then
  begin
    showmessage('���ȯ�� üũ�� ������� ��ȸ �� üũ ���� �մϴ�.');
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
  aData := 'cs00' ;   //��Ż��� üũ ���
  bECUCommState := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bECUCommState do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  aData := 'cs01' ;   //��Ż��� üũ ���
  bReaderCOMCheck := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bReaderCOMCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  aData := 'cs02' ;   //��Ż��� üũ ���
  bIndicatorCheck := False;
  SendPacket(aDeviceID, 'R', aData, True);

  nTime := 0;
  while Not bIndicatorCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  stStr := 'KTL-9 ���� ���α׷�';
  stStr := stStr + '[������:' + FormatdateTime('yyyy-mm-dd',getfilelastwritetime(Application.ExeName)) + ']';
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
    //ȯ�漳�� ���α׷� ���
    fmConfig := TfmConfig.Create(Self);
    fmConfig.OrgPW := stPW;
    fmConfig.ShowModal;
    fmConfig.Free;
  end;

  HideLocal;
  lvECU.Items.Clear;
{  aList:= lvECU.Items.Add;
  aList.Caption:= '00'; //��� ��ȣ
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  aData := 'Ct00' + inttostr(nType - 1);                               //ī�帮�� Ÿ�� ���

  bCardReaderTypeCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCardReaderTypeCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    aSensorNo +                                //�������ȣ
    aPortNo +                                  //��Ʈ��ȣ
    stStatus +                                 //Status E1~E8
    aAlarmType +                               //��������
    '0' +                                      //AREA
    FillZeroNumber(strtoint(aDetectTime), 4) ;           //�����ð�

  bSensorInfo:=False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bSensorInfo do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    aSensorNo +                                //�������ȣ
    aPortNo ;                                  //��Ʈ��ȣ

  bSensorInfo:=False;
  SendPacket(aDeviceID, 'Q', aData, true);

  nTime := 0;
  while Not bSensorInfo do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  stSensorNO := Copy(aData, 20, 2); //�������ȣ
  stPortNo := Copy(aData,22,2); //������ ��Ʈ��ȣ
  stAlarmType := copy(aData,26,1); //��������
  stTime := copy(aData,29,4); //�����ð�

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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  stSensorNO := Copy(aData,23,16); //������ ��Ʈ��ȣ

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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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

  //����� aa�̸� ��������
  if FHeader = 'aa' then
  begin
    //Wiznet ��ȸ ��û ó�� �Ұ�
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

  // 4.IP address �ڡڡڡڡ�
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

  // 5.Subnet mask �ڡڡڡڡ�
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

  // 6.Gateway address  �ڡڡڡڡ�
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


  //7.Port number (Client) �ڡڡڡڡ�
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
      Errorlog := '�������� ���䰪�� Ʋ���ϴ�.' + #13 +
        '===========================' + #13 + '  ������ < ===== > ���䰪  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('����/��ȸ �Ϸ� �Ǿ����ϴ�..');
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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

  //����� aa�̸� ��������
  if FHeader = 'aa' then
  begin
    //Wiznet ��ȸ ��û ó�� �Ұ�
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

  // 4.IP address �ڡڡڡڡ�
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

  // 5.Subnet mask �ڡڡڡڡ�
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

  // 6.Gateway address  �ڡڡڡڡ�
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


  //7.Port number (Client) �ڡڡڡڡ�
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
      Errorlog := '�������� ���䰪�� Ʋ���ϴ�.' + #13 +
        '===========================' + #13 + '  ������ < ===== > ���䰪  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('����/��ȸ �Ϸ� �Ǿ����ϴ�..');
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
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

  //����� aa�̸� ��������
  if FHeader = 'aa' then
  begin
    //Wiznet ��ȸ ��û ó�� �Ұ�
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

  // 4.IP address �ڡڡڡڡ�
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

  // 5.Subnet mask �ڡڡڡڡ�
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

  // 6.Gateway address  �ڡڡڡڡ�
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


  //7.Port number (Client) �ڡڡڡڡ�
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
      Errorlog := '�������� ���䰪�� Ʋ���ϴ�.' + #13 +
        '===========================' + #13 + '  ������ < ===== > ���䰪  ' +
        #13 + '===========================' + #13 + Errorlog;
      //ShowMessage(Errorlog);
    end;
  {
  else
  begin
    SHowMessage('����/��ȸ �Ϸ� �Ǿ����ϴ�..');
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    showmessage('������ ���õ����Ͱ� ��Ȯ���� �ʽ��ϴ�.');
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
  stData := '1';  //��Ʈ������
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
  if chk_Local.Checked then stData := stData + '1'  //��Į ��Ʈ�� ����
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
  if ACol = 1 then    // 1��°���� ��Ŀ���� �̵������� combobox �����ֱ�
  begin
    Rect := sg_CCTV.CellRect(ACol, ARow);
    // ���� Cell�� ��ǥ�� Rect�� ����
    with cmb_cctv do
    begin
      // ECU
      Clear;
      Items.Add('�̻��');
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
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
      SetFocus;
    end;
  end else if ACol = 2 then
  begin
    Rect := sg_CCTV.CellRect(ACol, ARow);
    // ���� Cell�� ��ǥ�� Rect�� ����
    with cmb_cctv do
    begin
      //�����Ʈ��ȣ
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
      BringToFront;   // comboBox1�� �ֻ����� �ű�� <> SendToBack
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
    Cells[0, 0] := 'ī�޶��ȣ';
    Cells[1, 0] := '����ȣ';
    Cells[2, 0] := '��Ʈ��ȣ';
    FixedColor := clWhite;
    Color := clWhite;

    for I := 1 to 4 do
    begin
      Cells[0, I] := IntToStr(I);
      Cells[1, I] := '�̻��';
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
      bResult := CheckCCTV(aDeviceID,i);  // ����ȣ
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('CCTV��ȸ������ �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    if sg_CCTV.Cells[1, I] = '�̻��' then
    begin
      aUsed:= '00';
      aECUNo:= '00';
    end else if sg_CCTV.Cells[1, I] = '00.MCU' then
    begin
      aUsed:= '4D'; // 'M'MCU
      aECUNo:= copy(sg_CCTV.Cells[1, I],1,2);
    end else
    begin
      aUsed:= '45'; // 'E'Ȯ���
      aECUNo:= copy(sg_CCTV.Cells[1, I],1,2);
    end;
    aPortNo := sg_CCTV.Cells[2, I];

    for nLoop := 0 to LoopCount - 1 do
    begin
      bResult := RegCCTV(aDeviceID,  // ����ȣ
                  I,          // cctv ��ȣ
                  aUsed,      //  ��뿩��
                  aECUNo,    // ���� ����ȣ
                  aPortNo);   // ��Ʈ��ȣ
      if Not bConnected then Exit;
      if bResult then break;
    end;
    if not bResult then
    begin
      IsStop := True;
      showmessage('CCTV���������� �����ϴ�.���۸�带 Ȯ���Ͽ� �ּ���.');
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
    aCCTVNoStr +                                           //CCTV ��ȣ
    aUsed +                                                //��� ���� 00:�̻��,45:ECU,4D:MCU
    aECUNo +                                               //��� ��ȣ
    '00' +                                                 //���Ÿ�� 00:�̻��
    '00' +                                                 //����ȣ 00:�̻��
    stPortNo +                                             //��Ʈ��ȣ
    '0000000000000000000000000000000000000000'             //���� �߰� ����
    ;

  bCCTVCheck := False;
  SendPacket(aDeviceID, 'I', aData, true);

  nTime := 0;
  while Not bCCTVCheck do
  begin
    if Not bConnected then Exit;
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
    if nTime > DelayTime Then Exit; //300�и����� ���� ������ ���з� ó����
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
  //�����ͱ��� 1Byte�� ���߿� �߰��Ǿ� ���Ƿ� 1Byte ���� ó��
  aCCTVNo := StrToInt(Copy(stData, 3, 2));
  if copy(stData,5,2) = '00' then //�̻��
  begin
    sg_CCTV.Cells[1,aCCTVNo] := '�̻��';
  end else if copy(stData,5,2) = '4D' then //MCU
  begin
    stEcu := copy(stData,7,2);
    stEcu := stEcu + '.MCU';
    sg_CCTV.Cells[1,aCCTVNo] := stEcu;
  end else if copy(stData,5,2) = '45' then //Ȯ���
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
ī�� ���� ���
  ��ġ�� �����ϰ� 1Byte��
}
