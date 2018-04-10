{ Zreg 수정사항 : 마지막 수정자는 반드시 수정내용을 명기 할것..
================================================================================
수정일:   2007.08.04
수정자:   전진운
수정항목: 포트정보등록에서 강시 형태 추가
수정목적: 외부에서 콜버튼을 누르면 관제신호는 발생하지 않고 로컬PC에 상태전달
수정내용: 05.호출 추가
================================================================================





}
(*
0V00.00.001, V00.00.001, Sep 09 2005F

#define LS_ALARM_CMD  					  'A'
#define LS_INIT_CMD							  'I'	// = Initial Data
#define LS_INIT_REQUEST_CMD				'Q'	// = Initial Data Request
#define LS_INIT_ANS_CMD						'i'	// = Initial Data
#define LS_REMOTE_CMD						  'R' // = Remote Command
#define LS_REMOTE_ANS_CMD					'r' // = Remote Answer
#define LS_REMOTE_ERROR_CMD				'e' // = Remote Command				// New
#define LS_ENQ_CMD							  'E' // = ENQ
#define LS_ACK_CMD							  'a' // = ACK
#define LS_NAK_CMD							  'n' // = NAK
#define LS_ACCESS_CMD						  'c' // = Access Control data
#define LS_FLASH_CMD						  'F' // = Flash Down Load Command
#define LS_FLASH_ANS_CMD					'f' // = Flash Down Load Answer Command
*)




unit uMain;

//{$DEFINE DEBUG}
interface

uses
  uLomosUtil,
  systeminfos,
  clipbrd,
  Dialogs,
  AdSocket,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ScktComp, LMDStopWatch, RzShellDialogs, DB,  ImgList, ExtCtrls,
  AdStatLt, OoMisc, AdPort, AdWnPort, LMDCustomComponent, LMDIniCtrl,
  Menus, RzPanel, RzButton, ADTrmEmu, Grids, DBGrids, RXDBCtrl,
  RzTabs, StdCtrls, LMDControl, LMDBaseControl, LMDBaseGraphicControl,
  LMDBaseLabel, LMDCustomSimpleLabel, LMDSimpleLabel, LMDCaptionPanel,
  LMDCustomScrollBox, LMDListBox, RzLstBox, ComCtrls, RzDTP, RzBtnEdt,
  RzSpnEdt, RzRadGrp, RzLabel, RzRadChk, RzCmboBx, Mask, RzEdit, LMDEdit,
  LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit,
  LMDCustomEdit, LMDCustomMaskEdit, LMDCustomExtCombo,
  LMDCustomListComboBox, LMDListComboBox, RzGroupBar, RzSplit, RzStatus,
  LMDCustomParentPanel, LMDCustomGroupBox, LMDCustomButtonGroup,
  LMDCustomRadioGroup, LMDRadioGroup, LMDButtonControl, LMDCustomCheckBox,
  LMDCheckBox, LMDGlobalHotKey, Buttons, MPlayer,Math, dbisamtb,
  IdThreadMgr, IdThreadMgrDefault, IdBaseComponent, IdComponent,
  IdTCPServer,DateUtils, Gauges,uComParsing,uComSentence;

const
  PROGRAM_NAME = '제론 시스템 장비 등록 프로그램';
  // 경고음 부분 추가
  CONTROLCNT = 16;
type

  TFirmwareDownInfo = Record
    Version: string;    //Version
    FMM:     string;    //Flash Memory Map
    FSC:     String;    //Flash Start Command
    FWFN:    String;    //Flash Writer File Name
    FDFN:    String;    //Flash Data File Name
    CMDCODE: String;    //FX##(##:00 이거나 CMDCODE)
  end;

  TUser_Send = Record
    Edit      : TRzEdit;
    Func      : TRzEdit;
    Btn_Send  : TRzButton;
    Btn_Clear : TRzButton;
  end;

  PNode   = ^TNode;
  TNode = record
    ConnectedIP:  String[20];
    Connected:    TDateTime;
    LastAction:   TDateTime;
    Thread:       Pointer;
    //SocketHandle: Integer;
    ReadData:     shortString;
    SendMsgNo:    Integer;
    RcvMsgNo:     Char;
  end;

  TRecevieAC_Data = Record
    DeviceID: String[9];
    aMsgCode: Char;
    aMsgCount: Char;
    aPosi:Char;
    aAddr:Char;
    aInOut: Char;
    aDate:string;
    aPositive: Char;
    aMode: Char;
    aControll: Char;
    aPermit: Char;
    aDoorStatus: Char;
    aAttend: Char;
    aIDNo_Companey: String[3];
    aIDNo_Resion: String[3];
    aIDNo_Cardtype: String[3];
    aIDNo_CardNo: String[6];
  end;

  TMainForm = class(TForm)
    RzStatusBar1: TRzStatusBar;
    Panel_ActiveClinetCount: TRzStatusPane;
    RzClockStatus1: TRzClockStatus;
    RzSplitter1: TRzSplitter;
    RzPanel2: TRzPanel;
    RzPanel3: TRzPanel;
    RzSplitter2: TRzSplitter;
    RzGroupBar1: TRzGroupBar;
    RzGroup1: TRzGroup;
    RzGroup2: TRzGroup;
    RzGroup3: TRzGroup;
    MainMenu1: TMainMenu;
    N6: TMenuItem;
    M_Close: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    LMDIniCtrl1: TLMDIniCtrl;
    RzGroup4: TRzGroup;
    Edit_CurrentID: TRzEdit;
    ComboBox_IDNO: TRzComboBox;
    Label3: TLabel;
    Label4: TLabel;
    Label40: TLabel;
    WinsockPort: TApdWinsockPort;
    RXLight: TApdStatusLight;
    TXLight: TApdStatusLight;
    ApdSLController1: TApdSLController;
    Bevel1: TBevel;
    cbPolling: TRzCheckBox;
    RzSpinner1: TRzSpinner;
    Label22: TLabel;
    Polling_Timer: TTimer;
    RzCheckBox2: TRzCheckBox;
    Off_Timer: TTimer;
    RzSplitter3: TRzSplitter;
    RzPanel4: TRzPanel;
    RzLabel3: TRzLabel;
    RzLabel1: TRzLabel;
    Notebook1: TNotebook;
    Label300: TLabel;
    Edit_DeviceID: TEdit;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    Group_Device: TRzCheckGroup;
    RzBitBtn3: TRzBitBtn;
    RzBitBtn4: TRzBitBtn;
    Group_AlarmDisplay: TRzCheckGroup;
    RzBitBtn22: TRzBitBtn;
    RzBitBtn23: TRzBitBtn;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Edit_PTStatus: TEdit;
    ComboBox_WatchType: TRzComboBox;
    ComboBox_AlarmType: TRzComboBox;
    ComboBox_recover: TRzComboBox;
    ComboBox_Delay: TRzComboBox;
    Port_Out1: TRzCheckGroup;
    Port_Out2: TRzCheckGroup;
    Port_Out3: TRzCheckGroup;
    Port_Out4: TRzCheckGroup;
    Edit_PTZoneNo: TEdit;
    Edit_PTLocate: TEdit;
    Port_Door1: TRzCheckGroup;
    Port_Door2: TRzCheckGroup;
    RzBitBtn11: TRzBitBtn;
    RzBitBtn12: TRzBitBtn;
    M_Port_Out1: TRzCheckGroup;
    M_Port_Out2: TRzCheckGroup;
    M_Port_Out3: TRzCheckGroup;
    M_Port_Out4: TRzCheckGroup;
    Group_Port: TRzRadioGroup;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label25: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    RzBitBtn9: TRzBitBtn;
    RzBitBtn10: TRzBitBtn;
    COmBoBox_Linktype1: TRzComboBox;
    ComboBox_OutType1: TRzComboBox;
    ComboBox_RenewTimer1: TRzComboBox;
    ComboBox_UseType1: TRzComboBox;
    RzSpinEdit2: TRzSpinEdit;
    CheckBox1: TCheckBox;
    Group_Relay: TRzRadioGroup;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Btn_SyncTime: TRzBitBtn;
    RzBitBtn13: TRzBitBtn;
    RzBitBtn14: TRzBitBtn;
    RzBitBtn15: TRzBitBtn;
    RzBitBtn16: TRzBitBtn;
    Edit_TimeSync: TRzEdit;
    Edit_Ver: TRzEdit;
    Edit_Reset: TRzEdit;
    RzComboBox1: TRzComboBox;
    RzComboBox2: TRzComboBox;
    RzSpinEdit3: TRzSpinEdit;
    Edit_Random: TRzEdit;
    RzBitBtn17: TRzBitBtn;
    Edit_CMD1: TEdit;
    ComboBox_Zone: TRzComboBox;
    Label_CurentIp: TRzLabel;
    GroupBox1: TGroupBox;
    RzToolbar1: TRzToolbar;
    RzToolButton1: TRzToolButton;
    RzToolButton2: TRzToolButton;
    ImageList1: TImageList;
    DBISAMTable1: TDBISAMTable;
    DataSource1: TDataSource;
    DBISAMTable1SeqNo: TAutoIncField;
    DBISAMTable1EventTime: TDateTimeField;
    DBISAMTable1IP: TStringField;
    DBISAMTable1DeviceID: TStringField;
    DBISAMTable1DeviceNo: TStringField;
    DBISAMTable1Cmd: TStringField;
    DBISAMTable1Data: TStringField;
    DBISAMTable1FullData: TStringField;
    RzLabel2: TRzLabel;
    DBISAMTable1way: TStringField;
    RzGroup5: TRzGroup;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    ComboBox1: TComboBox;
    Label59: TLabel;
    ComboBox2: TComboBox;
    Label62: TLabel;
    Btn_RegDialInfo: TRzBitBtn;
    Btn_CheckDialInfo: TRzBitBtn;
    Bevel2: TBevel;
    GroupBox5: TGroupBox;
    Label63: TLabel;
    RzSpinner2: TRzSpinner;
    Bevel3: TBevel;
    Btn_RegCalltime: TRzBitBtn;
    Btn_CheckCalltime: TRzBitBtn;
    Memo_CardNo: TMemo;
    Label64: TLabel;
    Btn_RegCardNo: TRzBitBtn;
    Btn_DelCardNo: TRzBitBtn;
    GroupBox6: TGroupBox;
    LMDListBox1: TLMDListBox;
    RzBitBtn25: TRzBitBtn;
    RzBitBtn26: TRzBitBtn;
    RzBitBtn28: TRzBitBtn;
    RzRadioGroup1: TRzRadioGroup;
    CB_SerialComm: TLMDLabeledListComboBox;
    Edit2: TLMDLabeledEdit;
    Button1: TButton;
    RzGroupBox7: TRzGroupBox;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    Edit_LocalIP: TRzEdit;
    Edit_Sunnet: TRzEdit;
    Edit_Gateway: TRzEdit;
    Edit_LocalPort: TRzEdit;
    RzGroupBox8: TRzGroupBox;
    RzLabel8: TRzLabel;
    RzLabel10: TRzLabel;
    Edit_ServerIp: TRzEdit;
    Edit_Serverport: TRzEdit;
    Checkbox_Client: TRzCheckBox;
    RzGroupBox9: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel11: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    ComboBox_Boad: TRzComboBox;
    ComboBox_Databit: TRzComboBox;
    ComboBox_Parity: TRzComboBox;
    ComboBox_Stopbit: TRzComboBox;
    ComboBox_Flow: TRzComboBox;
    RzGroupBox10: TRzGroupBox;
    RzLabel15: TRzLabel;
    RzLabel16: TRzLabel;
    RzLabel17: TRzLabel;
    RzLabel18: TRzLabel;
    Edit_Time: TRzEdit;
    Edit_Size: TRzEdit;
    Edit_Char: TRzEdit;
    Edit_Idle: TRzEdit;
    RzBitBtn30: TRzBitBtn;
    RzBitBtn31: TRzBitBtn;
    Checkbox_Debugmode: TRzCheckBox;
    RzLabel19: TRzLabel;
    RzEdit1: TRzEdit;
    Checkbox_DHCP: TRzCheckBox;
    RzBitBtn32: TRzBitBtn;
    btnCheckLan: TRzBitBtn;
    RzLabel20: TRzLabel;
    RzEdit2: TRzEdit;
    LMDCaptionPanel1: TLMDCaptionPanel;
    ProgressBar3: TProgressBar;
    LMDSimpleLabel1: TLMDSimpleLabel;
    edRegTelNo1: TRzButtonEdit;
    edRegTelNo2: TRzButtonEdit;
    edRegTelNo3: TRzButtonEdit;
    edRegTelNo4: TRzButtonEdit;
    edRegTelNo5: TRzButtonEdit;
    edRegTelNo6: TRzButtonEdit;
    edRegTelNo7: TRzButtonEdit;
    edRegTelNo8: TRzButtonEdit;
    edRegTelNo9: TRzButtonEdit;
    RzLabel21: TRzLabel;
    RzLabel22: TRzLabel;
    RzLabel23: TRzLabel;
    RzLabel24: TRzLabel;
    RzLabel25: TRzLabel;
    RzLabel26: TRzLabel;
    RzLabel27: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    GroupBox8: TGroupBox;
    btnRegVoicetime: TRzBitBtn;
    btnCheckVoicetime: TRzBitBtn;
    Label7: TLabel;
    RzSpinner3: TRzSpinner;
    Bevel4: TBevel;
    edTelNo1: TRzButtonEdit;
    edTelNo2: TRzButtonEdit;
    edTelNo3: TRzButtonEdit;
    edTelNo4: TRzButtonEdit;
    edTelNo5: TRzButtonEdit;
    edTelNo6: TRzButtonEdit;
    edTelNo7: TRzButtonEdit;
    edTelNo8: TRzButtonEdit;
    edTelNo9: TRzButtonEdit;
    RzLabel30: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel32: TRzLabel;
    RzLabel33: TRzLabel;
    RzLabel34: TRzLabel;
    RzLabel35: TRzLabel;
    RzLabel36: TRzLabel;
    RzLabel37: TRzLabel;
    RzLabel38: TRzLabel;
    cbVoiceDetect: TRzCheckBox;
    RzLabel39: TRzLabel;
    edRegTelNo0: TRzButtonEdit;
    RzLabel40: TRzLabel;
    edTelNo0: TRzButtonEdit;
    RzButton1: TRzButton;
    cbDisplayPolling: TRzCheckBox;
    GroupBox7: TGroupBox;
    LMDListBox2: TLMDListBox;
    Memo1: TMemo;
    Panel1: TPanel;
    Label12: TLabel;
    Btn_DelEventLog: TRzBitBtn;
    GroupBox9: TGroupBox;
    Label50: TLabel;
    Bevel5: TBevel;
    RzSpinner4: TRzSpinner;
    Btn_Regbroadcasttime: TRzBitBtn;
    Btn_Checkbroadcasttime: TRzBitBtn;
    Button2: TButton;
    RzLabel41: TRzLabel;
    Bevel6: TBevel;
    RzLabel42: TRzLabel;
    RzRadioGroup2: TRzRadioGroup;
    RzDateTimePicker1: TRzDateTimePicker;
    RzDateTimePicker2: TRzDateTimePicker;
    ListBox_DownLoadInfo: TRzListBox;
    LMDIniCtrl2: TLMDIniCtrl;
    RzBitBtn29: TRzBitBtn;
    RzBitBtn34: TRzBitBtn;
    RzBitBtn35: TRzBitBtn;
    RzBitBtn36: TRzBitBtn;
    RzBitBtn37: TRzBitBtn;
    cb_RelayNo: TRzComboBox;
    Label65: TLabel;
    cb_RelayOnOff: TRzComboBox;
    RzBitBtn38: TRzBitBtn;
    cb_Download: TCheckBox;
    Button3: TButton;
    RzGroupBox5: TRzGroupBox;
    Label26: TLabel;
    Label27: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Edit_Send1: TRzEdit;
    Edit_Send2: TRzEdit;
    Edit_Send3: TRzEdit;
    Edit_Send4: TRzEdit;
    Btn_Send1: TRzBitBtn;
    Btn_Send2: TRzBitBtn;
    Btn_Send3: TRzBitBtn;
    Btn_Send4: TRzBitBtn;
    Btn_Clear1: TRzBitBtn;
    Btn_Clear2: TRzBitBtn;
    Btn_Clear3: TRzBitBtn;
    Btn_Clear4: TRzBitBtn;
    cb_SendFullData: TCheckBox;
    Edit_Func1: TRzEdit;
    Edit_Func2: TRzEdit;
    Edit_Func3: TRzEdit;
    Edit_Func4: TRzEdit;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Edit_Send5: TRzEdit;
    Edit_Send6: TRzEdit;
    Edit_Send7: TRzEdit;
    Edit_Send8: TRzEdit;
    Btn_Send5: TRzBitBtn;
    Btn_Send6: TRzBitBtn;
    Btn_Send7: TRzBitBtn;
    Btn_Send8: TRzBitBtn;
    Btn_Clear5: TRzBitBtn;
    Btn_Clear6: TRzBitBtn;
    Btn_Clear7: TRzBitBtn;
    Btn_Clear8: TRzBitBtn;
    Edit_Func5: TRzEdit;
    Edit_Func6: TRzEdit;
    Edit_Func7: TRzEdit;
    Edit_Func8: TRzEdit;
    Label71: TLabel;
    Label72: TLabel;
    Edit_Send9: TRzEdit;
    Edit_Send0: TRzEdit;
    Btn_Send9: TRzBitBtn;
    Btn_Send0: TRzBitBtn;
    Btn_Clear9: TRzBitBtn;
    Btn_Clear0: TRzBitBtn;
    Edit_Func9: TRzEdit;
    Edit_Func0: TRzEdit;
    Label73: TLabel;
    Edit_LinkusID: TEdit;
    btmRegLinkusID: TRzBitBtn;
    btmCheckLinkusID: TRzBitBtn;
    GroupBox10: TGroupBox;
    RzLabel43: TRzLabel;
    RzLabel44: TRzLabel;
    RzLabel45: TRzLabel;
    RzLabel46: TRzLabel;
    RzLabel47: TRzLabel;
    edLinkusTel0: TEdit;
    edLinkusTel1: TEdit;
    edLinkusTel2: TEdit;
    edLinkusTel3: TEdit;
    edLinkusTel4: TEdit;
    btnRegLinkusTel0: TRzBitBtn;
    btnCheckLinkusTel0: TRzBitBtn;
    btnRegLinkusTel1: TRzBitBtn;
    btnCheckLinkusTel1: TRzBitBtn;
    btnRegLinkusTel2: TRzBitBtn;
    btnCheckLinkusTel2: TRzBitBtn;
    btnRegLinkusTel3: TRzBitBtn;
    btnCheckLinkusTel3: TRzBitBtn;
    btnRegLinkusTel4: TRzBitBtn;
    btnCheckLinkusTel4: TRzBitBtn;
    GroupBox11: TGroupBox;
    Label75: TLabel;
    Bevel7: TBevel;
    btnRegPtTime: TRzBitBtn;
    btnCheckPtTime: TRzBitBtn;
    edPtTime: TEdit;
    RadioGroup_Mode: TRzRadioGroup;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet2: TRzTabSheet;
    Label77: TLabel;
    ComboBox_DetectTime: TRzComboBox;
    GroupBox12: TGroupBox;
    Label78: TLabel;
    Bevel8: TBevel;
    btnRegPtDelayTime: TRzBitBtn;
    btnCheckPtDelayTime: TRzBitBtn;
    edPtDelayTime: TEdit;
    GroupBox13: TGroupBox;
    Label79: TLabel;
    Bevel9: TBevel;
    Spinner_Ring: TRzSpinner;
    Btn_RegRingCount: TRzBitBtn;
    Btn_CheckRingCount: TRzBitBtn;
    RzOpenDialog1: TOpenDialog;
    Label80: TLabel;
    Memo2: TMemo;
    Label74: TLabel;
    Btn_CheckCardNo: TRzBitBtn;
    ClientSocket1: TClientSocket;
    RzFieldStatus1: TRzFieldStatus;
    WiznetTimer: TTimer;
    RadioModeClient: TRadioButton;
    RadioModeServer: TRadioButton;
    RadioModeMixed: TRadioButton;
    CB_IPList: TLMDLabeledListComboBox;
    Label81: TLabel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label85: TLabel;
    Label86: TLabel;
    Edit_SendA: TRzEdit;
    Edit_SendB: TRzEdit;
    Edit_SendC: TRzEdit;
    Edit_SendD: TRzEdit;
    Btn_SendA: TRzBitBtn;
    Btn_SendB: TRzBitBtn;
    Btn_SendC: TRzBitBtn;
    Btn_SendD: TRzBitBtn;
    Btn_ClearA: TRzBitBtn;
    Btn_ClearB: TRzBitBtn;
    Btn_ClearC: TRzBitBtn;
    Btn_ClearD: TRzBitBtn;
    Edit_FuncA: TRzEdit;
    Edit_FuncB: TRzEdit;
    Edit_FuncC: TRzEdit;
    Edit_FuncD: TRzEdit;
    Edit_SendE: TRzEdit;
    Edit_SendF: TRzEdit;
    Btn_SendE: TRzBitBtn;
    Btn_SendF: TRzBitBtn;
    Btn_ClearE: TRzBitBtn;
    Btn_ClearF: TRzBitBtn;
    Edit_FuncE: TRzEdit;
    Edit_FuncF: TRzEdit;
    RzSpacer1: TRzSpacer;
    GroupMAc: TRzGroupBox;
    editMAC1: TRzEdit;
    editMAC2: TRzEdit;
    editMAC3: TRzEdit;
    editMAC4: TRzEdit;
    editMAC5: TRzEdit;
    editMAC6: TRzEdit;
    RzButton2: TRzButton;
    btnRegMAC: TRzBitBtn;
    RzBitBtn40: TRzBitBtn;
    ReconnectSocketTimer: TTimer;
    LMDStopWatch1: TLMDStopWatch;
    RzToolButton3: TRzToolButton;
    Edit_TopRomVer: TRzEdit;
    RxDBGrid1: TRxDBGrid;
    RzSaveDialog1: TSaveDialog;
    AdVT100Emulator1: TAdVT100Emulator;
    cbAutoReg: TRzCheckBox;
    cb_RelayTIme: TRzComboBox;
    Label88: TLabel;
    cb_Reader: TComboBox;
    RzBitBtn33: TRzBitBtn;
    RzSpinEdit1: TRzSpinEdit;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    edPhoneNo: TEdit;
    CheckBox2: TCheckBox;
    RzBitBtn39: TRzBitBtn;
    RzBitBtn41: TRzBitBtn;
    DLRadioGroup: TLMDRadioGroup;
    DLCodeEdit: TLMDEdit;
    DLCheckBox: TLMDCheckBox;
    btnRegisterClear: TRzBitBtn;
    CardNoPopupMenu: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    Btn_DelCardNoBtn_DelAllCardNo: TRzBitBtn;
    edFfNo: TEdit;
    rgCmdFilter: TRzRadioGroup;
    edFilter: TEdit;
    RzBitBtn27: TRzBitBtn;
    cbFinterNo: TRzCheckBox;
    Label92: TLabel;
    RzButton3: TRzButton;
    RzButton4: TRzButton;
    rgDeviceNo: TRzRadioGroup;
    PopupMenu1: TPopupMenu;
    ID1: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    DOOR1: TMenuItem;
    N16: TMenuItem;
    Group_DeviceBase: TRzCheckGroup;
    rgNoAckFilter: TRzRadioGroup;
    Edit1: TEdit;
    GroupBox14: TGroupBox;
    Label18: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label66: TLabel;
    Label93: TLabel;
    ComboBox_CardModeType: TRzComboBox;
    ComboBox_DoorModeType: TRzComboBox;
    RzSpinEdit4: TRzSpinEdit;
    RzSpinEdit5: TRzSpinEdit;
    ComboBox_UseSch: TRzComboBox;
    ComboBox_SendDoorStatus: TRzComboBox;
    ComboBox_UseCommOff: TRzComboBox;
    ComboBox_AlarmLongOpen: TRzComboBox;
    ComboBox_AlramCommoff: TRzComboBox;
    ComboBox_LockType: TRzComboBox;
    ComboBox_ControlFire: TRzComboBox;
    RzBitBtn18: TRzBitBtn;
    RzBitBtn19: TRzBitBtn;
    ComboBox_AntiPass: TRzComboBox;
    gbDoorNo: TRadioGroup;
    ComboBox_CheckDSLS: TRzComboBox;
    GroupBox15: TGroupBox;
    lbDoorControl: TLabel;
    RzGroupBox1: TRzGroupBox;
    Btn_Positive: TRzBitBtn;
    Btn_Negative: TRzBitBtn;
    RzGroupBox2: TRzGroupBox;
    Btn_Nomal: TRzBitBtn;
    Btn_Open: TRzBitBtn;
    RzGroupBox6: TRzGroupBox;
    Btn_DoorOPen: TRzBitBtn;
    Btn_DoorClose: TRzBitBtn;
    gbDoorNo2: TRadioGroup;
    Btn_CheckStatus: TRzBitBtn;
    Label94: TLabel;
    GroupBox16: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label2: TLabel;
    Label76: TLabel;
    Label87: TLabel;
    ComboBox_WatchPowerOff: TRzComboBox;
    SpinEdit_OutDelay: TRzSpinEdit;
    ComboBox_DeviceType: TRzComboBox;
    RzBitBtn7: TRzBitBtn;
    RzBitBtn8: TRzBitBtn;
    ComboBox_DoorType1: TRzComboBox;
    ComboBox_DoorType2: TRzComboBox;
    Edit_Locate: TEdit;
    SpinEdit_InDelay: TRzSpinEdit;
    ComboBox_ComLikus: TRzComboBox;
    GroupBox17: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label35: TLabel;
    ComBoBox_UseCardReader: TRzComboBox;
    ComBoBox_DoorNo: TRzComboBox;
    Edit_CRLocatge: TEdit;
    RzBitBtn5: TRzBitBtn;
    RzBitBtn6: TRzBitBtn;
    ComBoBox_InOutCR: TRzComboBox;
    ComboBox_Zone1: TRzComboBox;
    Group_CardReader: TRzRadioGroup;
    btnCheckCdVer: TRzBitBtn;
    Label17: TLabel;
    RzBitBtn24: TRzBitBtn;
    RzBitBtn42: TRzBitBtn;
    Label95: TLabel;
    rgSchDoorNo: TRadioGroup;
    Label96: TLabel;
    rgSchCode: TRadioGroup;
    Label97: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    Label101: TLabel;
    Label102: TLabel;
    Label103: TLabel;
    edSch1: TEdit;
    edSch2: TEdit;
    edSch3: TEdit;
    edSch4: TEdit;
    edSch5: TEdit;
    Label104: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    edFood1: TEdit;
    edFood2: TEdit;
    edFood3: TEdit;
    edFood4: TEdit;
    RzBitBtn43: TRzBitBtn;
    RzBitBtn44: TRzBitBtn;
    GroupBox18: TGroupBox;
    gbDoorNo3: TRadioGroup;
    RzGroupBox3: TRzGroupBox;
    Btn_RDoorOPen: TRzBitBtn;
    Btn_RDoorClose: TRzBitBtn;
    miSound: TMenuItem;
    GroupBox19: TGroupBox;
    edComp1: TRzEdit;
    Label109: TLabel;
    Label110: TLabel;
    edComp2: TRzEdit;
    Label111: TLabel;
    edComp3: TRzEdit;
    Label112: TLabel;
    edComp4: TRzEdit;
    Label113: TLabel;
    edComp5: TRzEdit;
    Label114: TLabel;
    edComp6: TRzEdit;
    Label115: TLabel;
    edComp7: TRzEdit;
    Label116: TLabel;
    edComp8: TRzEdit;
    Label117: TLabel;
    edComp9: TRzEdit;
    check1: TCheckBox;
    check2: TCheckBox;
    check3: TCheckBox;
    check4: TCheckBox;
    check5: TCheckBox;
    check6: TCheckBox;
    check7: TCheckBox;
    check8: TCheckBox;
    check9: TCheckBox;
    Label118: TLabel;
    check10: TCheckBox;
    edComp10: TRzEdit;
    Label119: TLabel;
    check11: TCheckBox;
    edComp11: TRzEdit;
    Label120: TLabel;
    check12: TCheckBox;
    edComp12: TRzEdit;
    Label121: TLabel;
    check13: TCheckBox;
    edComp13: TRzEdit;
    Label122: TLabel;
    check14: TCheckBox;
    edComp14: TRzEdit;
    Label123: TLabel;
    check15: TCheckBox;
    edComp15: TRzEdit;
    Label126: TLabel;
    check16: TCheckBox;
    edComp16: TRzEdit;
    btWav1: TRzBitBtn;
    btWav2: TRzBitBtn;
    btWav4: TRzBitBtn;
    btWav3: TRzBitBtn;
    btWav5: TRzBitBtn;
    btWav6: TRzBitBtn;
    btWav7: TRzBitBtn;
    btWav8: TRzBitBtn;
    btWav9: TRzBitBtn;
    btWav10: TRzBitBtn;
    btWav11: TRzBitBtn;
    btWav12: TRzBitBtn;
    btWav13: TRzBitBtn;
    btWav14: TRzBitBtn;
    btWav15: TRzBitBtn;
    btPlay1: TRzBitBtn;
    btPlay2: TRzBitBtn;
    btPlay3: TRzBitBtn;
    btPlay4: TRzBitBtn;
    btPlay5: TRzBitBtn;
    btPlay6: TRzBitBtn;
    btPlay7: TRzBitBtn;
    btPlay8: TRzBitBtn;
    btPlay9: TRzBitBtn;
    btPlay10: TRzBitBtn;
    btPlay11: TRzBitBtn;
    btPlay12: TRzBitBtn;
    btPlay13: TRzBitBtn;
    btPlay14: TRzBitBtn;
    btPlay15: TRzBitBtn;
    edFile1: TEdit;
    edFile2: TEdit;
    edFile3: TEdit;
    edFile4: TEdit;
    edFile5: TEdit;
    edFile6: TEdit;
    edFile7: TEdit;
    edFile8: TEdit;
    edFile9: TEdit;
    edFile10: TEdit;
    edFile11: TEdit;
    edFile12: TEdit;
    edFile13: TEdit;
    edFile14: TEdit;
    edFile15: TEdit;
    btAllClear: TBitBtn;
    btSelectClear: TBitBtn;
    MediaPlayer1: TMediaPlayer;
    GroupBox20: TGroupBox;
    lblCard: TLabel;
    rdSelectCardNo: TRadioGroup;
    bt_Broad: TBitBtn;
    edCard: TRzEdit;
    btBroadFile: TBitBtn;
    Group_BroadDevice: TRzCheckGroup;
    RzBitBtn45: TRzBitBtn;
    Group_BroadDeviceBase: TRzCheckGroup;
    lbState: TLabel;
    btBroadFileSet: TRzBitBtn;
    chk_BroadFile: TCheckBox;
    Label124: TLabel;
    btCaptureSave: TRzBitBtn;
    edBroadFileSave: TEdit;
    edBRFileLoad: TEdit;
    GroupBox21: TGroupBox;
    Label125: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    Label129: TLabel;
    Label130: TLabel;
    cbRegCode: TComboBox;
    rdMsgCode: TRadioGroup;
    cbCardAdmin: TComboBox;
    cbMasterMode: TComboBox;
    cbInOut: TComboBox;
    btBroadStop: TBitBtn;
    rdMaster: TRadioGroup;
    BroadTimer: TTimer;
    broadStopTimer: TTimer;
    lb_start: TLabel;
    lb_end: TLabel;
    lb_Timestat: TLabel;
    ed_DeviceNO: TRzEdit;
    btExe1: TRzBitBtn;
    edExe1: TEdit;
    btExe2: TRzBitBtn;
    btExe3: TRzBitBtn;
    btExe4: TRzBitBtn;
    btExe5: TRzBitBtn;
    btExe6: TRzBitBtn;
    btExe7: TRzBitBtn;
    btExe8: TRzBitBtn;
    btExe9: TRzBitBtn;
    btExe10: TRzBitBtn;
    btExe11: TRzBitBtn;
    btExe12: TRzBitBtn;
    btExe13: TRzBitBtn;
    btExe14: TRzBitBtn;
    btExe15: TRzBitBtn;
    edExe2: TEdit;
    edExe3: TEdit;
    edExe4: TEdit;
    edExe5: TEdit;
    edExe6: TEdit;
    edExe7: TEdit;
    edExe8: TEdit;
    edExe9: TEdit;
    edExe10: TEdit;
    edExe11: TEdit;
    edExe12: TEdit;
    edExe13: TEdit;
    edExe14: TEdit;
    edExe15: TEdit;
    rd_UseCardReader: TRadioGroup;
    rd_InOutCR: TRadioGroup;
    rd_DoorNo: TRadioGroup;
    GroupBox22: TGroupBox;
    edYYYY: TEdit;
    Label132: TLabel;
    edMM: TEdit;
    Label133: TLabel;
    edDD: TEdit;
    Label134: TLabel;
    ck_YYMMDD: TCheckBox;
    Label131: TLabel;
    btBroadRetry: TBitBtn;
    rdMode: TRadioGroup;
    Group_BroadDownLoad: TRzCheckGroup;
    RzBitBtn46: TRzBitBtn;
    GroupBox23: TGroupBox;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    Group_BroadDownLoadBase: TRzCheckGroup;
    BroadSleep_Timer: TTimer;
    GroupBox24: TGroupBox;
    RzBitBtn20: TRzBitBtn;
    RzBitBtn21: TRzBitBtn;
    btBroadFileRetry: TRzBitBtn;
    rdInOutMode: TRadioGroup;
    rdCardAuth: TRadioGroup;
    rdRegCode: TRadioGroup;
    btCardReg: TRzBitBtn;
    RzButtonEdit1: TEdit;
    BitBtn1: TBitBtn;
    chk_Notupgrade: TCheckBox;
    Label135: TLabel;
    ComBoBox_Building: TRzComboBox;
    btn_Timecheck: TRzBitBtn;
    Label56: TLabel;
    cb_CardType: TRzComboBox;
    btn_Cuerrent: TRzBitBtn;
    RichEdit1: TRichEdit;
    btWav16: TRzBitBtn;
    btPlay16: TRzBitBtn;
    btExe16: TRzBitBtn;
    edExe16: TEdit;
    edFile16: TEdit;
    pn_Gauge: TPanel;
    btn_Play: TSpeedButton;
    btn_Moment: TSpeedButton;
    btn_Stop: TSpeedButton;
    Gauge1: TGauge;
    cmb_Multi: TComboBox;
    RzBitBtn47: TRzBitBtn;
    RzBitBtn48: TRzBitBtn;
    RzBitBtn49: TRzBitBtn;
    RzBitBtn50: TRzBitBtn;
    RzBitBtn51: TRzBitBtn;
    RzBitBtn52: TRzBitBtn;
    Label136: TLabel;
    GroupBox25: TGroupBox;
    Label137: TLabel;
    Label138: TLabel;
    Label139: TLabel;
    Label140: TLabel;
    Bevel10: TBevel;
    cmb_ControlOnTime: TComboBox;
    cmb_ControlOffTime: TComboBox;
    btn_ControlReg: TRzBitBtn;
    btn_ControlSearch: TRzBitBtn;
    Label141: TLabel;
    Label142: TLabel;
    chk_FastSave: TCheckBox;
    chk_SendTime: TCheckBox;
    ed_SendTime: TEdit;
    Label143: TLabel;
    btn_CardDownLoadStop: TRzBitBtn;
    GroupBox26: TGroupBox;
    ed_SortMin: TEdit;
    Label144: TLabel;
    btn_Sort: TButton;
    btn_SortDisp: TButton;
    ed_SortDisp: TEdit;
    Label145: TLabel;
    ed_DeviceCode: TEdit;
    Label146: TLabel;
    ed_SendSize: TEdit;
    btn_Close: TRzBitBtn;
    RzBitBtn53: TRzBitBtn;
    GroupBox27: TGroupBox;
    RzBitBtn54: TRzBitBtn;
    chk_Hex: TRzCheckBox;
    Button4: TButton;
    chk_CmdX: TCheckBox;
    procedure RzGroup2ItemsClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Notebook1PageChanged(Sender: TObject);
    procedure RegClick(Sender: TObject);
    procedure btnCheck(Sender: TObject);
    procedure Edit_DeviceIDMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure M_CloseClick(Sender: TObject);
    procedure Btn_SyncTimeClick(Sender: TObject);
    procedure RzBitBtn13Click(Sender: TObject);
    procedure RzBitBtn14Click(Sender: TObject);
    procedure RzBitBtn15Click(Sender: TObject);
    procedure RzBitBtn16Click(Sender: TObject);
    procedure RzBitBtn17Click(Sender: TObject);
    procedure btn_ConnectClick(Sender: TObject);
    procedure Btn_DisConnectClick(Sender: TObject);
    procedure WinsockPortWsConnect(Sender: TObject);
    procedure WinsockPortWsDisconnect(Sender: TObject);
    procedure WinsockPortWsError(Sender: TObject; ErrCode: Integer);
    procedure WinsockPortTriggerAvail(CP: TObject; Count: Word);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure RzBitBtn4Click(Sender: TObject);
    procedure RzGroup3Items0Click(Sender: TObject);
    procedure ListBox_EventKeyDown(Sender: TObject; var Key: Word;Shift: TShiftState);
    procedure cbPollingClick(Sender: TObject);
    procedure Polling_TimerTimer(Sender: TObject);
    procedure RzSpinner1Change(Sender: TObject);
    procedure Btn_send1Click(Sender: TObject);
    procedure Btn_Clear1Click(Sender: TObject);
    procedure Off_TimerTimer(Sender: TObject);
    procedure RzBitBtn20Click(Sender: TObject);
    procedure RzBitBtn21Click(Sender: TObject);
    procedure RzBitBtn22Click(Sender: TObject);
    procedure RzBitBtn23Click(Sender: TObject);
    procedure RzBitBtn18Click(Sender: TObject);
    procedure RzBitBtn19Click(Sender: TObject);
    procedure RzGroup3Items1Click(Sender: TObject);
    procedure Btn_NomalClick(Sender: TObject);
    procedure Btn_OpenClick(Sender: TObject);
    procedure WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
      var Accept: Boolean);
    procedure Btn_PositiveClick(Sender: TObject);
    procedure Btn_NegativeClick(Sender: TObject);
    procedure Btn_DoorOPenClick(Sender: TObject);
    procedure Btn_DoorCloseClick(Sender: TObject);
    procedure RzGroup3Items2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure DBISAMTable1EventTimeGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure RzGroup2Items7Click(Sender: TObject);
    procedure Btn_RegDialInfoClick(Sender: TObject);
    procedure Btn_CheckDialInfoClick(Sender: TObject);
    procedure Btn_RegCalltimeClick(Sender: TObject);
    procedure Btn_CheckCalltimeClick(Sender: TObject);

    procedure Edit_Combo_Enter(Sender: TObject);
    procedure Btn_RegCardNoClick(Sender: TObject);
    procedure Btn_DelCardNoClick(Sender: TObject);
    procedure Btn_DelEventLogClick(Sender: TObject);
    procedure RzGroup2Items0Click(Sender: TObject);
    procedure RzGroup2Items1Click(Sender: TObject);
    procedure RzGroup2Items2Click(Sender: TObject);
    procedure RzGroup2Items3Click(Sender: TObject);
    procedure RzGroup2Items4Click(Sender: TObject);
    procedure RzGroup2Items5Click(Sender: TObject);
    procedure RzGroup2Items6Click(Sender: TObject);
    procedure RzBitBtn26Click(Sender: TObject);
    procedure RzBitBtn25Click(Sender: TObject);
    procedure RzBitBtn27Click(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure RzBitBtn28Click(Sender: TObject);
    procedure RzGroup1Open(Sender: TObject);
    procedure RzRadioGroup1Changing(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzBitBtn32Click(Sender: TObject);
    procedure btnCheckLanClick(Sender: TObject);
    procedure RzBitBtn30Click(Sender: TObject);
    procedure RzBitBtn31Click(Sender: TObject);
    procedure LMDCaptionPanel1CloseBtnClick(Sender: TObject;
      var Cancel: Boolean);
    procedure edRegTelNoButtonClick(Sender: TObject);
    procedure edTelNoButtonClick(Sender: TObject);
    procedure cbVoiceDetectClick(Sender: TObject);
    procedure btnRegVoicetimeClick(Sender: TObject);
    procedure btnCheckVoicetimeClick(Sender: TObject);
    procedure RzButton1Click(Sender: TObject);
    procedure LMDListBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Btn_RegbroadcasttimeClick(Sender: TObject);
    procedure Btn_CheckbroadcasttimeClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RzButtonEdit100ButtonClick(Sender: TObject);
    procedure RzGroup2Items8Click(Sender: TObject);
    procedure btmRegLinkusIDClick(Sender: TObject);
    procedure btmCheckLinkusIDClick(Sender: TObject);
    procedure btnRegLinkusTel0Click(Sender: TObject);
    procedure btnCheckLinkusTel0Click(Sender: TObject);
    procedure btnRegPtTimeClick(Sender: TObject);
    procedure btnCheckPtTimeClick(Sender: TObject);
    procedure btnRegPtDelayTimeClick(Sender: TObject);
    procedure Btn_CheckRingCountClick(Sender: TObject);
    procedure Btn_RegRingCountClick(Sender: TObject);
    procedure Btn_CheckCardNoClick(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure WiznetTimerTimer(Sender: TObject);
    procedure btnRegMACClick(Sender: TObject);
    procedure RzButton2Click(Sender: TObject);
    procedure editMAC1Click(Sender: TObject);
    procedure ReconnectSocketTimerTimer(Sender: TObject);
    procedure RzToolButton3Click(Sender: TObject);
    procedure AdVT100Emulator1ProcessChar(Sender: TObject; Character: Char;
      var ReplaceWith: String; Commands: TAdEmuCommandList;
      CharSource: TAdCharSource);
    procedure RzBitBtn38Click(Sender: TObject);
    procedure RzBitBtn33Click(Sender: TObject);
    procedure RzBitBtn39Click(Sender: TObject);
    procedure RzBitBtn41Click(Sender: TObject);
    procedure DLRadioGroupChange(Sender: TObject; ButtonIndex: Integer);
    procedure DLCheckBoxChange(Sender: TObject);
    procedure btnRegisterClearClick(Sender: TObject);
    procedure Memo_CardNoChange(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure Btn_DelCardNoBtn_DelAllCardNoClick(Sender: TObject);
    procedure RzButton3Click(Sender: TObject);
    procedure LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox_IDNOChange(Sender: TObject);
    procedure rgDeviceNoChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure RzButton4Click(Sender: TObject);
    procedure Group_DeviceBaseChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure Btn_CheckStatusClick(Sender: TObject);
    procedure btnCheckCdVerClick(Sender: TObject);
    procedure RzGroup3Items3Click(Sender: TObject);
    procedure RzBitBtn43Click(Sender: TObject);
    procedure Btn_RDoorOPenClick(Sender: TObject);
    procedure Btn_RDoorCloseClick(Sender: TObject);
    procedure miSoundClick(Sender: TObject);
    procedure btWavClick(Sender: TObject);
    procedure edFileChange(Sender: TObject);
    procedure btPlayClick(Sender: TObject);
    procedure btAllClearClick(Sender: TObject);
    procedure btSelectClearClick(Sender: TObject);
    procedure rdSelectCardNoClick(Sender: TObject);
    procedure chk_BroadFileClick(Sender: TObject);
    procedure btBroadFileClick(Sender: TObject);
    procedure Group_BroadDeviceBaseChange(Sender: TObject; Index: Integer;
      NewState: TCheckBoxState);
    procedure bt_BroadClick(Sender: TObject);
    procedure edCardChange(Sender: TObject);
    procedure btBroadFileSetClick(Sender: TObject);
    procedure btCaptureSaveClick(Sender: TObject);
    procedure btBroadStopClick(Sender: TObject);
    procedure BroadTimerTimer(Sender: TObject);
    procedure broadStopTimerTimer(Sender: TObject);
    procedure btExe1Click(Sender: TObject);
    procedure edExe1Change(Sender: TObject);
    procedure edYYYYKeyPress(Sender: TObject; var Key: Char);
    procedure edMMKeyPress(Sender: TObject; var Key: Char);
    procedure edDDKeyPress(Sender: TObject; var Key: Char);
    procedure edMMExit(Sender: TObject);
    procedure edDDExit(Sender: TObject);
    procedure ck_YYMMDDClick(Sender: TObject);
    procedure btBroadRetryClick(Sender: TObject);
    procedure Group_BroadDownLoadBaseChange(Sender: TObject;
      Index: Integer; NewState: TCheckBoxState);
    procedure BroadSleep_TimerTimer(Sender: TObject);
    procedure btBroadFileRetryClick(Sender: TObject);
    procedure btCardRegClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_TimecheckClick(Sender: TObject);
    procedure btn_CuerrentClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btn_PlayClick(Sender: TObject);
    procedure btn_MomentClick(Sender: TObject);
    procedure btn_StopClick(Sender: TObject);
    procedure RzBitBtn47Click(Sender: TObject);
    procedure RzBitBtn48Click(Sender: TObject);
    procedure RzBitBtn49Click(Sender: TObject);
    procedure RzBitBtn50Click(Sender: TObject);
    procedure RzBitBtn51Click(Sender: TObject);
    procedure RzBitBtn52Click(Sender: TObject);
    procedure btn_ControlRegClick(Sender: TObject);
    procedure btn_ControlSearchClick(Sender: TObject);
    procedure chk_SendTimeClick(Sender: TObject);
    procedure btn_CardDownLoadStopClick(Sender: TObject);
    procedure btn_SortClick(Sender: TObject);
    procedure btn_SortDispClick(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure RzBitBtn53Click(Sender: TObject);
    procedure RzBitBtn54Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    bStop : Boolean;
    bStart : Boolean;
    bCardDownLoadStop : Boolean;
    BaseDataLength : integer;
    Msg_Ver       : string;
    { Private declarations }
    //카드리더 타입 등록
    function RegCardReaderType(aDeviceID:string;nType:integer):Boolean;
    procedure ConfigInit;
    function  RecevieDataProcess(aData:String; var bData:String):Boolean;
    function  DataPacektProcess( aData: string):Boolean;
    procedure AddEventList(aData: String);
    function  SendPacket(aDeviceID: String;aCmd:Char; aData: String):Boolean;
    Procedure PollingAck(aDeviceID: String);

    procedure ACC_sendData(aDeviceID:CString; aData:CString);
    //function  SendPackettoClient(ClientThread: PNode;aDeviceID: String;
    //          aCmd:Char; aData: String): Boolean;
    procedure Init_IDNO_ComboBox(aComBoBox:TRzComboBox);
    Procedure RegDataProcess(aDeviceID,aData: String);
    procedure RemoteDataProcess(aDeviceID,aData: String);
    Procedure AccessDataProcess(aDeviceID,aData: String);

    {커스 관련 등록 항목}
    //관제용 ID 등록/조회
    Procedure RegLinkusID(aDeviceID: String;aLinkusId:String);
    Procedure CheckLinkusID(aDeviceID: String);
    Procedure RcvLinkusId(aDeviceID,aData:String);
    //관제 전화번호 등록 조회
    Procedure RegLinksTellNo(aDeviceID:String;aNo:Integer;aTellno:String);
    Procedure CheckLinkusTellNo(aDeviceID:String;aNo:Integer);
    Procedure RcvLinkusTelNo(aDeviceID,aData:String);
    //국선체크
    Procedure RegLinkusPt(aDeviceID:String;aTime:String);
    Procedure CheckLinkusPt(aDeviceID:String);
    Procedure RcvLinkusPt(aDeviceID,aData:String);

    //국선체크 대기시간
    Procedure RegLinkusPtDelay(aDeviceID:String;aTime:String);

    /// 방법  등록 /제어
    Procedure RegID(aDeviceID: String);
    procedure RegLocate(aDeviceID: String;aLocate:String);
    Procedure RegCR(aDeviceID: String; aReaderNo: Integer);
    Procedure RegSysInfo(aDeviceID: String);
    Procedure RegRelay(aDeviceID: String; aRelayNo: Integer);
    Procedure RegPort(aDeviceID: String; aPortNo: Integer);
    Procedure RegUsedDevice(aDeviceID: String; UsedDevice:String);


    Procedure CheckUsedDevice(aDeviceID: String);
    Procedure RegUsedAlarmDisplay(aDeviceID: String; UsedDevice:String);
    Procedure CheckUsedAlarmDisplay(aDeviceID: String);
    Procedure CheckID(aDeviceID: String);
    procedure CheckLocate(aDeviceID: String);
    Procedure CheckCR(aDeviceID: String; aReaderNo: Integer);
    Procedure CheckSysInfo(aDeviceID: String);
    Procedure CheckRelay(aDeviceID: String; aRelayNo: Integer);
    Procedure CheckPort(aDeviceID: String; aPortNo: Integer);
    Procedure RegTellNo(aDeviceID:String;aNo:Integer;aTellno:String);
    Procedure CheckTellNo(aDeviceID:String;aNo:Integer);

    Procedure RegDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
    Procedure RegControlDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
    Procedure CheckDialTime(aDeviceID:String);
    Procedure CheckControlDialTime(aDeviceID:String);
    Procedure RegCallTime(aDeviceID:String;aTime: Integer);
    Procedure CheckCallTime(aDeviceID:String);
    Procedure RegVoiceTime(aDeviceID:String;aTime: Integer);
    Procedure CheckVoiceTime(DeviceID: String);
    Procedure RegbroadcastTime(aDeviceID:String;aTime: Integer);
    Procedure CheckbroadcastTime(aDeviceID:String);
    Procedure RegRingCount(aDeviceID:String;aCount: Integer);
    Procedure CheckRingCount(aDeviceID:String);


    Procedure RcvRingCount(aDeviceID,aData:String);
    procedure RcvDeviceID(aDeviceID,aData: String);
    procedure RcvCR(aDeviceID,aData: String);
    Procedure RcvSysinfo(aDeviceID,aData: String);
    Procedure RcvRelay(aDeviceID,aData: String);
    Procedure RcvPort(aDeviceID,aData: String);
    Procedure RcvUsedDevice(aDeviceID,aData: String);
    Procedure RcvUsedAlarmdisplay(aDeviceID,aData:String);
    Procedure RcvTellNo(aDeviceID,aData:String);
    Procedure RcvVoiceTime(aDeviceID,aData:String);
    Procedure RcvCallTime(aDeviceID,aData:String);
    Procedure RcvbroadcastTime(aDeviceID,aData:String);
    //카드타입 응답
    procedure RcvCardType(aDeviceID,aData: string);

    Procedure RcvDialInfo(aDeviceID,aData:String);
    Procedure RcvControlDialInfo(aDeviceID,aData:String);
    Procedure RcvWiznetInfo(aDeviceID,aData:String);

    Procedure Cnt_TimeSync(aDeviceID: String; aTimeStr:String);
    Procedure Cnt_CheckVer(aDeviceID: String);
    Procedure Cnt_CheckCdVer(aDeviceID: String; aReaderNo:Integer);
    Procedure Cnt_Reset(aDeviceID:String);
    Procedure Cnt_ClearRegister(aDeviceID:String);

    Procedure Cnt_ChangeMode(aDeviceID:String; aZoneNo:Integer; aMode:Char);
    Procedure Cnt_Random(aDeviceID:String; onOn:Boolean; aTime:Integer);
    Procedure Cnt_USerCMD(aDeviceID:String;  aData: String);
    Procedure Cnt_Siren(aDeviceID: String; aOn:Boolean);
    Procedure Cnt_Lamp(aDeviceID: String; aOn:Boolean);
    Procedure Cnt_Relay(aDeviceID: String; aNo:String; aFunction:Char; aTime:String);
    Procedure Cnt_RemoteTellCall(aDeviceID: String; CallTime: String; aSpeaker:Char; aTellNo:String);

    /// 출입통제  등록 /제어
    procedure RegSch(aDeviceID: String);   // 스케줄 등록
    Procedure CheckSch(aDeviceID: String); // 스케줄 조회
    Procedure RcvSch(aData: String);       // 스케쥴데이터 응답

    Procedure RegFoodTime(aDeviceID: String); //식사시간등록
    Procedure RcvFoodTime(aData: String);     //식사시간응답


    procedure RegSysInfo2(aDeviceID: String);
    procedure CheckSysInfo2(aDeviceID: String);
    Procedure EmptySysinfo2;
    Procedure RcvSysinfo2(aData: String);
    Procedure RcvAccControl(aData:String);
    Procedure RcvAccEventData(aData:String);
    Procedure RcvAccXEventData(aData:String);
    Procedure RcvDoorEventData(aData:String);
    Procedure RcvCardRegAck(aData:String);
    Procedure RcvTelEventData(accData:String);
    Procedure DoorModeChange(DeviceID: String;  aMode:Char);
    Procedure DoorControl(DeviceID:String; aNo:Integer; aControlType:Char; aControl:Char);

    Procedure FillArray_Send; //임의 데이터 전송용 EditBox Array

    {펌웨에 다운로드 관련 루틴}
    Procedure LoadINI_firmwareInfo;
    function  CheckRomVer:Boolean;
    Procedure DownLoadRom(aDeviceID:String;aType:Integer;aFileName: String);
    Procedure BroadDownLoadRom(aDeviceID:String;aFileName: String);
    Procedure SendRomData(aDeviceID:String;aType:Integer; adata: String);
    Procedure BroadSendRomData(aDeviceID:String; adata: String);
    Procedure Write_ListBox_DownLoadInfo(aData: String);
    Procedure SendFSC(aDeviceID :string);
    Procedure DownloadFMM(aDeviceID :string);
    Procedure ReceiveFI(aDeviceID,aData:String);   //FI:Flash Memory Map
    Procedure ReceiveFPFD(aDeviceID,aData:String);
    Procedure ReceiveFX(aDeviceID,aData:String);   //FX:Flash Start Command



    Procedure CreateLogDB;

    Procedure CD_DownLoad(aDevice: String;aCardNo:String;func:Char);
    Procedure CD_XDownLoad(aDevice: String;aCardNo:String;func:Char);
    Procedure CardAllDownLoad(aFunc:Char);
    Procedure ClearWiznetInfo;
    procedure FirmwareProcess(aDeviceID,aData: String);
    Procedure BroadFirmwareProcess(aDeviceID,aData: String);
    procedure FirmwareProcess2(aDeviceID,aData: String);
    Procedure SendFPData(aDeviceID: String; aNo:Integer);
    Procedure SendFDData(aDeviceID: String; aNo:Integer);
    Procedure SendFPBineryData(aDeviceID: String; aNo,aSize:Integer);
    Procedure SendFDBineryData(aDeviceID: String; aNo,aSize:Integer);
    Procedure SendRomUpDateInfo(aDeviceID:string);
    Procedure SendRomBroadFileInfo; //브로드 파일 전송
    Procedure SendFPData2(aDeviceID: String;aNo:Integer);
    Procedure SendFDData2(aDeviceID: String;aNo:Integer);
    Procedure SendFPBineryData2(aDeviceID: String;aNo,aSize:Integer);
    Procedure SendFDBineryData2(aDeviceID: String;aNo,aSize:Integer);

    Procedure SendCancelRomUpDate(aDeviceID:String);

    Procedure ClearLanInfo;

    Procedure Append_Memo_CardNo(aCardNo:String);

   // procedure SendDataSave(ast:string);

   // 경고음을 내주기 위해 추가
    Function TravelEditItem(GroupBox:TGroupBox; no:Integer):TEdit;
    Function TravelEdExeItem(GroupBox:TGroupBox; no:Integer):TEdit;
    Function TravelPlayItem(GroupBox:TGroupBox; no:Integer):TRzBitBtn;
    Function TravelFileItem(GroupBox:TGroupBox; no:Integer):TRzBitBtn;
    Function TravelWavItem(GroupBox:TGroupBox; no:Integer):TRzBitBtn;
    Function TravelCheckItem(GroupBox:TGroupBox; no:Integer):TCheckBox;
    Function TravelCompareItem(GroupBox:TGroupBox; no:Integer):TRzEdit;
    Function StringXOR(Src:String;Org:String):Boolean;
    function StrToHex(const S: string): string;
    Function StringAND(Src:String;Org:String;len:integer):String;
    Function WarningCompare(Data:String):Boolean;   //경고 메시지가 있는지 체크해 보자
    Function DataCompare(Data:String;no:Integer):Boolean;  //해당항목과 데이터 비교
    Procedure WarningBeep(no:Integer); //해당항목의 소리를 울려주자
    Procedure ExeFile(no:Integer); //해당항목의 파일을 실행해 주자

    //카드데이터 브로드캐스팅 부분 추가
    Function GetSendCount():Integer;
    Procedure SendServerBroadData;
    Procedure SendMainBroadData(ID:String; NO:Integer); //Main 주관 요청 데이터 전송
    Function MakeBroadData(No:Integer):String;
    Procedure BroadCastProcess(aData:String);
    Function GetBroadControlerNum(CheckGroup:TRZCheckGroup):String;
    Function BroadControlNumConvert(Num:Integer):String;
    Function BroadToHex(aMsgData:String):String;  //전송 포맷을 보여주기 위해 Hex 형태 변경
    Function BroadText2Hex(stTemp:String):String; //File format을 전송포맷 변경
    Procedure BroadErrorProcess(aData:String);  //브로드 데이터 에러 내역 정리
    Procedure PrintLog(aData:String);

    Function ConvertToHex(aData:string):string;

  public
    { Public declarations }
    Rcv_MsgNo     : Char;
    Send_MsgNo    : Integer;
    Array_SendEdit: Array[0..15] of TUser_Send;
    OffCount      : Integer;
    IsDownLoad    : Boolean;
    EventIndex    : Integer;
    OnMoni        : Boolean;
    WiznetData    : String;
    WizNetRegMode : Boolean;
    WizNetRcvACK  : Boolean;
    DoCloseWinsock: Boolean;
    StopConnection: Boolean;
    OnWritewiznet : Boolean;
    BroadID       : String; //브로드 파일 다운로드시 순서

  end;

var
  MainForm: TMainForm;
  ComBuff: String;
  LastMsg: String;
  aFI: TFirmwareDownInfo;


  DownLoadList: TStringList;
  ROM_FlashWrite: TStringList;
  ROM_FlashData : TStringList;
  ROM_BineryFlashWrite : PChar;
  ROM_BineryFlashData : PChar;

  DownLoadType: Integer;
  DownLoadCount: Integer;
  CancelDownload: Boolean;
  SockErroCode: Integer;
  CountCardReadData: Integer;
  //카드 브로드 캐스팅 부분 추가
  CardBroadSendCount : Integer;  //총 전송할 건수
  CurCBCount : Integer;          //현재 진행중인 건수
  BroadControlerNum : String;    //ControlerNum 9자리
  BroadFileList: TStringList;    //Broad File List
  BroadSaveFileList: TStringList;    //Broad File Save List
  BroadSendData : String;        //메모리에 저장후 응답이 없을때 2분간 전송시도
  BroadOrgDataList : TStringList; //브로드데이터 원본
  BroadSendDataList : TStringList;  //브로드데이터 전송내역 저장
  BroadErrorDataList : TStringList;  //브로드데이터 에러내역 저장
  BroadRetryDataList : TStringList;  //브로드데이터 재송신 내역
  startTime : Tdatetime;
  bBroadFileSendERR : Boolean; //브로드파일 송신 성공유무


  //Nodes: TThreadList;

implementation

{$R *.dfm}

{Flash Memory Map을 다운로드 한다.}
procedure TMainForm.DownloadFMM(aDeviceID:string);
var
  I: Integer;
  CMD: string;
  st: string;
  aLength: Integer;
//SYMFDST052S123455F00005F0000FF00005C0000F80000FF0000
begin
  CMD:= 'FI00';
  //st:= CMD + aFI.FMM;
  //2007 10 12 수정
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;

  st := CMD + aFI.FMM + ' ' + ed_DeviceCode.Text + ' ' + FillZeroNumber(strtoint(ed_SendSize.text),4) + ' ' + st;
//  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if aFI.FMM = '' then
  begin
    ShowMessage('데이터 없음');
    Exit;
  end;

  SendPacket(aDeviceID,'F', st);
  Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
end;

procedure TMainForm.RcvAccXEventData(aData: String);
var
  st: String;
  aCardNo: String;
  bCardNo: String;
  DeviceID: String;
  NoStr: String;
  i : Integer;
  nCardLength : integer;
begin
  {1.시간}
  st:= Copy(aData,6,2)+'-'+
       Copy(aData,8,2)+'-'+
       Copy(aData,10,2)+' '+
       Copy(aData,12,2)+':'+
       Copy(aData,14,2)+':'+
       Copy(aData,16,2)+';';
  {2.문번호}
  st:= st + aData[3]+';';

  {3.Posi/Nega}
  case aData[18] of
    '0': st:=st + 'Positive;';
    '1': st:= st + 'Negative;';
    else   st:= st+ aData[18];
  end;
  {4.운영모드}
  case aData[19] of
    '0': st:= st+'운영모드;';
    '1': st:= st+'개방모드;';
    '2': st:= st+'폐쇄모드;';
    else   st:= st+aData[19]+ ';';
  end;
  {5.변경사유}
  case aData[20] of
    'C': st:= st + '카드;';
    'P': st:= st + '전화;';
    'R': st:= st + '원격제어;';
    'B': st:= st + '버튼;';
    'S': st:= st + '스케쥴;';
    else st:= st + aData[20];
  end;
  {6.출입승인결과}
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
  {7.출입문 상태}
  case aData[22]of
    'C': st:= st +'닫힘;';
    'O': st:= st +'열림;';
    else st:= st +aData[22];
  end;
  if aData[24] > '9' then nCardLength :=  10 + (Ord(aData[24]) - Ord('A'))
  else nCardLength := strtoint(aData[24]);
  {8.카드번호/출입번호}

  //aCardNo:= copy(aData,24,8);
  aCardNo:= copy(aData,25,nCardLength);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
  //bCardNo:= Hex2Dec64(aCardNo);
  //st:= st + FillZeroNumber2(bCardNo,10);

  //bCardNo:= DecodeCardNo(aCardNo);
  st:= st+ aCardNo + ';' ;//+ '000000';
  //st:= st + DecodeCardNo(aCardNo);
  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;
//  st := st + ' ;' + Dec2Hex64(StrtoInt64(bCardNo),nCardLength);

  RzFieldStatus1.Caption := stringReplace(st,';','   ',[rfReplaceAll]);
  LMDListBox1.Items.Add(st);
  //LMDListBox1.Selected[LMDListBox1.ItemIndex]:= True;
  for i := 0 to LMDListBox1.Count-1 do
  begin
     if LMDListBox1.Selected[i] then LMDListBox1.Selected[i]:= False;
  end;
  LMDListBox1.Selected[LMDListBox1.Count-1]:= True;


  Inc(CountCardReadData);
  LMDListBox1.ItemIndex:= LMDListBox1.Items.Count -1;


   // 자동 등록 모드이면...
  if cbAutoReg.Checked = True then
  begin
    DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    //메모장에 등록
    Append_Memo_CardNo(aCardNo);
    // 다운로드
    CD_XDownLoad(DeviceID,aCardNo,'L')

  end;

  {
  // 미등록 데이터이면....
  if (aData[21] = #$41) or (aData[21] = #$43) then
  begin
    // 자동 등록 모드이면...
    if cbAutoReg.Checked = True then
    begin
      DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
      //메모장에 등록
      Append_Memo_CardNo(bCardNo);
      // 다운로드
      CD_DownLoad(DeviceID,bCardNo+'000000' ,'L');

    end;
  end;
  }
end;

function TMainForm.ConvertToHex(aData: string): string;
var
  nLength : integer;
  stData : string;
  stHex :string;
  i : integer;
begin
  nLength := Length(aData);
  stData := '';
  for i:=1 to nLength do
  begin
    stHex := Dec2Hex(Ord(aData[i]),2);
    if ( stHex <= '1F') OR ( stHex >= '7F') then
      stData := stData + '[' + stHex + ']'
    else stData := stData + aData[i];
  end;
  result := stData;
end;

procedure TMainForm.SendFDBineryData(aDeviceID: String; aNo,
  aSize: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;
begin

  if aNo = 0 then
  begin
    ShowMessage('flash data 요청번지가 0 입니다.');
    Exit;
  end;

  if ROM_BineryFlashData = nil then
  begin
    ShowMessage('전송 가능한 flash data 가 없습니다.');
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashData);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    st:= 'fD00' ;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end
  else
  begin

    st:= 'fD00' + stSendData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
    //데이터송신
  end;

end;

procedure TMainForm.SendFDBineryData2(aDeviceID: String; aNo,
  aSize: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;

begin
  if aNo = 0 then
  begin
    ShowMessage('flash data 요청번지가 0 입니다.');
    Exit;
  end;

  if ROM_BineryFlashData = nil then
  begin
    st:= 'fD00' +FillZeroNumber(0,7);
    SendPacket(aDeviceID,'F',st);
    ShowMessage('전송 가능한 flash data 가 없습니다.');
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashData);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashData,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    st:= 'fD00' + FillZeroNumber(0,7) ;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end
  else
  begin

    st:= 'fD00' + FillZeroNumber(aNo,7) + stSendData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
    //데이터송신
  end;

end;

procedure TMainForm.SendFPBineryData(aDeviceID: String; aNo,
  aSize: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;

begin

  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;

  if ROM_BineryFlashWrite = nil then
  begin
    st:= 'fP00' +FillZeroNumber(0,7);
    SendPacket(aDeviceID,'F',st);
    ShowMessage('전송 가능한 flash write 가 없습니다.');
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashWrite);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    st:= 'fP00';
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end
  else
  begin
    st:= 'fP00' + stSendData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
    //데이터송신
  end;

end;

procedure TMainForm.SendFPBineryData2(aDeviceID: String; aNo,
  aSize: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
  iFileLength: Integer;
  bSendData : Boolean;
  stSendData : string;

begin

  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;

  if ROM_BineryFlashWrite = nil then
  begin
    ShowMessage('전송 가능한 flash write 가 없습니다.');
    st:= 'fP00' +FillZeroNumber(0,7);
    SendPacket(aDeviceID,'F',st);
    Exit;
  end;

  bSendData := False;
  iFileLength := length(ROM_BineryFlashWrite);
  if iFileLength > 0 then
  begin
    //요청 데이터가 끝난 시점인지...체크
    if iFileLength < ((aNo - 1) * aSize) then
    begin
      bSendData := False;
    end
    else
    begin
      //여기에서 데이터 셋팅
      bSendData := True;
      if (aNo * aSize) < iFileLength then
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,aSize);
      end
      else
      begin
        stSendData := copy(ROM_BineryFlashWrite,((aNo - 1) * aSize) + 1,iFileLength -((aNo - 1) * aSize));
      end;
      RzFieldStatus1.Caption := inttostr(length(stSendData)) + ':' + stSendData;
    end;
  end;
  if Not bSendData then
  begin
    //보낼 데이터가 없음
    st:= 'fP00' +FillZeroNumber(0,7);
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end
  else
  begin
    st:= 'fP00' +FillZeroNumber(aNo,7)+ stSendData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
    //데이터송신
  end;

end;

procedure TMainForm.N2Click(Sender: TObject);
var
  aFile: String;
  FileList : TStringList;
  LineList : TStringList;
  i : integer;
  stTime : string;
  CurTime : TDateTime;
  BeforTime:TDateTime;
  SpaceTime : Cardinal;
  st : string;
  stMulti : string;
begin

  bStart := True;
  bStop := False;
  btn_Play.Enabled := False;
  btn_Moment.Enabled := True;
  btn_Stop.Enabled := True;
  pn_Gauge.Visible := True;

  FileList := TStringList.Create;
  LineList := TStringList.Create;
  BeforTime := Now + 1;

  RzOpenDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  if RzOpenDialog1.Execute then
  begin
    FileList.Clear;
    aFile:= RzOpenDialog1.FileName;
    FileList.LoadFromFile(aFile);
    Gauge1.MaxValue := FileList.Count;
    Gauge1.Progress := 0;
    for i:=0 to FileList.Count - 1 do
    begin
      //LineList.Clear;
      //LineList.Delimiter := ',';
      //LineList.DelimitedText := FileList.Strings[i];
      if bStop then
      begin
        FileList.Free;
        LineList.Free;
        pn_Gauge.Visible := False;
        Exit;
      end;
      
      stMulti := cmb_Multi.Text;
      stMulti := StringReplace(stMulti,'X','',[rfReplaceAll]);
      if stMulti = '' then stMulti := '1';
      stTime := FindCharCopy(FileList.Strings[i],2,',');
      //stTime := LineList.Strings[2];
      try
        CurTime := strToDateTime(stTime);
      Except
        continue;
      end;
      if BeforTime < Now then
      begin
        SpaceTime := DateTimeToUnix(CurTime * 1000) - DateTimeToUnix(BeforTime * 1000);
        //Application.ProcessMessages;
        SpaceTime := SpaceTime div strtoint(stMulti);
        delay(SpaceTime);
        //Sleep(SpaceTime);
      end;
      BeforTime := CurTime;

      While Not bStart do
      begin
        Application.ProcessMessages;
      end;

      st:=  StringReplace(FindCharCopy(FileList.Strings[i],3,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],4,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],5,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],6,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],7,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],1,','),'"','',[rfReplaceAll]) +#9+
            StringReplace(FindCharCopy(FileList.Strings[i],8,','),'"','',[rfReplaceAll]);

      AddEventList(st);
      Gauge1.Progress := Gauge1.Progress + 1;
//      LineList.DelimitedText
    end;
  end;

  FileList.Free;
  LineList.Free;
  pn_Gauge.Visible := False;

end;



procedure TMainForm.btCardRegClick(Sender: TObject);
var
 DeviceID : String;
 i,j : Integer;
 aCardNo : String;
begin
  Label136.Caption :=inttostr(LMDListBox1.SelCount);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  for i:= 0 to  LMDListBox1.Count - 1 do
  begin
    if  LMDListBox1.Selected[i] then
    begin
      aCardNo:= FindCharCopy(LMDListBox1.Items.Strings[i],8,';');
      Label136.Caption := LMDListBox1.Items.Strings[i];
      if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,'L')
      else CD_DownLoad(DeviceID,aCardNo,'L');
    end;
    Sleep(100);
    Application.ProcessMessages;
  end;
end;



procedure TMainForm.ReceiveFPFD(aDeviceID,aData: String);
var
  st: string;
  stSeq : String;
  Addrstr :string;
  Addr : integer;
begin


//  Addrstr:= Copy(aData,23,7);
//  Addr:= Strtoint(Addrstr);
//  if Length(aData) < 34 then stSeq := '0000'
//  else stSeq := copy(aData,31,4);
//  RzFieldStatus1.Caption := stSeq;

  Off_Timer.enabled:= False;
  OffCount:=0;
  ProgressBar1.Position:= DownLoadCount;

  Inc(DownLoadCount);
  //SendDataSave(' [R] '+aData);
  if DownLoadList.Count > 0 then DownLoadList.Delete(0);


  if DownLoadList.Count < 1 then
  begin
    if DownLoadType > 1 then
    begin
      SetForegroundWindow(MainForm.Handle);
      MainForm.SetFocus;
      //Write_ListBox_DownLoadInfo('Flash Data File 다운로드가 완료 되었습니다.');
      SendFSC(aDeviceID);
      //Write_ListBox_DownLoadInfo('Flash Start Command 전송');
      //ShowMessage('다운로드가 완료 되었습니다.');
      GroupBox23.visible := False;

    end else
    begin
      //Write_ListBox_DownLoadInfo('Flash Writer File 다운로드가 완료 되었습니다.');
      if aFI.FDFN <> '' then
      begin
        DownLoadRom(aDeviceID,2,aFI.FDFN);
      //Write_ListBox_DownLoadInfo('Flash Data File Name 전송시작');
      end;
    end;
  end else
  begin
    st:= DownLoadList[0];
    SendRomData(aDeviceID,Downloadtype,st);
    Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
  end;
   
end;

procedure TMainForm.BroadSleep_TimerTimer(Sender: TObject);
var
  stData:String;
  FPAddr:Integer;
  FDAddr:Integer;
  st:String;
  CMD:String;
  Loop:Integer;
  aTime: TDatetime;

begin
  if bBroadFileSendERR then
  begin
    bBroadFileSendERR := False;
    showmessage('브로드 파일 전송중 에러가 있습니다. 재전송 하여 주세요.');
    BroadSleep_Timer.enabled := false;
    exit;
  end;

  case strtoint('0' + BroadID)  of
    1 : {FU송신완료}
          begin
            CMD:= 'FI00';
            BroadID := '02';
            st:= CMD + aFI.FMM;
            CardBroadSendCount := 1;
            ProgressBar1.Max := 1;
            CurCBCount := 0;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(1,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(1,7) ;           //ID가 02 이면 Fu송신

            st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            BroadOrgDataList.Add(st);
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData);
            Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
          end;
    2 : {FI송신완료}
          begin
            BroadID := '03';
            CurCBCount := 0;
            ProgressBar1.Max := ROM_FlashWrite.Count;
            CardBroadSendCount := ROM_FlashWrite.Count;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(ROM_FlashWrite.Count,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(ROM_FlashWrite.Count,7) ;           //ID가 02 이면 Fu송신

            //st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            for Loop :=0 to ROM_FlashWrite.count-1 do
            begin
              st:= 'fP00'+FillZeroNumber(Loop + 1,7) + ROM_FlashWrite[Loop];
              st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

              BroadOrgDataList.Add(st)
            end;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData);
            Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(CardBroadSendCount) + '건');
          end;
    3 : {FP송신완료}
          begin
            BroadID := '04';
            CurCBCount := 0;
            CardBroadSendCount := ROM_FlashData.Count;
            ProgressBar1.Max := CardBroadSendCount;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(ROM_FlashData.Count,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(ROM_FlashData.Count,7) ;           //ID가 02 이면 Fu송신

            //st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;
            BroadOrgDataList.Clear;
            for Loop :=0 to ROM_FlashData.count-1 do
            begin
              st:= 'fD00'+FillZeroNumber(Loop + 1,7) + ROM_FlashData[Loop];
              st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

              BroadOrgDataList.Add(st)
            end;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData);
            Write_ListBox_DownLoadInfo('flash Data 전송:'+ InttoStr(CardBroadSendCount) + '건');

          end;
    4 : {FD송신완료}
          begin
            BroadID := '05';
            CurCBCount := 0;
            CardBroadSendCount := 1;
            ProgressBar1.Max := CardBroadSendCount;
            if rdMode.ItemIndex = 2 then stData := 'BS' + BroadID + FillZeroNumber(1,7)
            else if rdMode.ItemIndex = 3 then stData := 'BI' + BroadID + FillZeroNumber(1,7) ;           //ID가 02 이면 Fu송신

            Delete(aFI.FSC,9,18);
            if RzRadioGroup2.ItemIndex = 0 then   // 즉시 다운로드
            begin
              aFI.FSC:= aFI.FSC +#$20+'00/00/00 00:00:00';
            end else                              // 예약 다운로드
            begin
              RzDateTimePicker2.Date:= RzDateTimePicker1.Date;
              aTime:= RzDateTimePicker2.DateTime;
              st:= FormatDatetime('yy"/"mm"/"dd" "hh":"nn":"ss',aTime);

              aFI.FSC:= aFI.FSC + #$20 + st;
            end;

            CMD:= 'FX'+aFI.CMDCODE;
            st:= CMD + aFI.FSC;
            st:= 'BD' + BroadID + FillZeroNumber(Loop + 1,7) + BroadControlerNum + st;

            BroadOrgDataList.Clear;
            BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

            //데이터 전송
            SendPacket(Edit_CurrentID.text + '00','*',stData);

            Write_ListBox_DownLoadInfo('펌웨어 시작 시간 전송시작');

          end;
  end;
  BroadSleep_Timer.Enabled := False;
end;

procedure TMainForm.btBroadFileRetryClick(Sender: TObject);
var
  stData,st : String;
  Loop : integer;
  stBroadControlNum : String;
begin
//BroadControlNumConvert(Num)
   btBroadFileRetry.enabled := False;
   bBroadFileSendERR := False;
   
   BroadSendDataList.Clear;

   for Loop := 0 to BroadErrorDataList.count - 1 do
   begin
      st := BroadErrorDataList.Strings[Loop];
      stBroadControlNum := BroadControlNumConvert(strtoint(copy(st,1,2)));
      st := copy(st,3,4) + FillZeroNumber(Loop+1,7) + copy(st,15,Length(st)-15);
      st := copy(st,1,11) + stBroadControlNum + copy(st,30,Length(st)-30);
      BroadSendDataList.Add(st);
   end;
   BroadErrorDataList.Clear;
  //송신데이터 생성
  if rdMode.ItemIndex = 3 then   //Server 이면
  begin
    stData := 'BI' + BroadID + FillZeroNumber(BroadSendDataList.count,7);
  end
  else if rdMode.ItemIndex = 2 then   //Main 이면
  begin
    stData := 'BS' + BroadID + FillZeroNumber(BroadSendDataList.count,7);
  end else
  begin
    exit;
  end;

  SendPacket(Edit_CurrentID.Text + '00','*',stData);

end;

procedure TMainForm.BroadDownLoadRom(aDeviceID:String;aFileName: String);
var
  I: Integer;
  st: string;
begin
  DownLoadList.Clear;
  DownLoadList.LoadFromFile(aFileName);
  st:= DownLoadList[0];
  BroadSendRomData(aDeviceID,st);

  OffCount:= 0;
  DownLoadCount:= 0;
  ProgressBar1.Position:= 0;
  ProgressBar1.Max:= DownLoadList.Count;
  Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);

end;

procedure TMainForm.BroadSendRomData(aDeviceID:String; adata: String);
var
  st: string;
  stData: String;
begin

  if BroadID = '03' then
  begin
    st:= 'FP00'+aData;
    Write_ListBox_DownLoadInfo('RomData 전송');
  end
  else if BroadID = '04' then
  begin
    st:= 'FD00'+aData;
  end;

  if rdMode.ItemIndex = 3 then stData := 'BI' + '02' + FillZeroNumber(1,7)
  else if rdMode.ItemIndex = 2 then  stData := 'BS' + '02' + FillZeroNumber(1,7);

  st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;

  BroadOrgDataList.Clear;
  BroadOrgDataList.Add(st);
  BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

  SendPacket(aDeviceID,'*',st);

end;

procedure TMainForm.SendRomBroadFileInfo;
var
  stDeviceID : String;
  stData : String;
  Loop : integer;
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
begin
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDownLoad);

  CurCBCount := 0 ; //현재 진행 건수를 0으로 표시하자

  {전송건수 추출}
  CardBroadSendCount := 1;    //CMD:= 'FU00';FU는 한건이다.
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMode.ItemIndex = 3 then   //Server 이면
  begin
    BroadID := '02';
    stData := 'BI' + BroadID + FillZeroNumber(CardBroadSendCount,7);
    CMD:= 'FI00';
    st:= CMD + aFI.FMM;
    if aFI.FMM = '' then
    begin
      ShowMessage('데이터 없음');
      Exit;
    end;
    Write_ListBox_DownLoadInfo('Flash Memory Map 전송');
  end
  else if rdMode.ItemIndex = 2 then   //Main주관이면
  begin
    BroadID := '01';
    stData := 'BS' + BroadID + FillZeroNumber(CardBroadSendCount,7);           //ID가 02 이면 Fu송신
    CMD:= 'FU00';
    FPAddr:= ROM_FlashWrite.Count;
    FDAddr:= ROM_FlashData.Count;
    st:=  CMD +FillZeroNumber(FPAddr,7)+','+ FillZeroNumber(FDAddr,7);
    Write_ListBox_DownLoadInfo(' firmware upgrade 정보 전송');


  end
  else exit;

  st:= 'BD' + BroadID + FillZeroNumber(1,7) + BroadControlerNum + st;


  BroadOrgDataList.Clear;
  BroadOrgDataList.Add(st);
  BroadSendDataList := BroadOrgDataList;   //다음 송신 데이터 리스트에 추가

  //데이터 전송
  SendPacket(stDeviceID,'*',stData);


end;


procedure TMainForm.btBroadRetryClick(Sender: TObject);
var
  stData,st : String;
  Loop : integer;
begin

  btBroadRetry.enabled := False;
  startTime := Now;
  btBroadStop.Enabled := True;
  lb_start.Caption := '시작:' + FormatDateTime('hh:mm:ss',startTime);
  lb_end.Caption := '종료:' ;

   BroadSendDataList.Clear;

   for Loop := 0 to BroadErrorDataList.count - 1 do
   begin
      st := BroadErrorDataList.Strings[Loop];
      st := copy(st,1+2,2) + FillZeroNumber(Loop+1+2,9) + copy(st,11+2,Length(st)-13);
      BroadSendDataList.Add(st);
   end;
   BroadErrorDataList.Clear;
  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    stData := 'BI' + FillZeroNumber(BroadSendDataList.count,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(BroadSendDataList.count,9);
  end;

  SendPacket(Edit_CurrentID.Text + '00','*',stData);


end;

procedure TMainForm.BroadErrorProcess(aData: String);
var
  st : string;
  nFrom : integer;
  nTo : integer;
  Loop : integer;
  stBLData : String;
begin

  if copy(aData,19,2) <> 'BL' then exit;

  nFrom := strtoint(copy(aData,23,7));
  nTo := strtoint(copy(aData,31,7));
  stBLData := (copy(aData,15,2));
  if BroadSendDataList.Count < nTo then exit;

  for Loop := nFrom to nTo do
  begin
      st := BroadSendDataList.Strings[Loop-1];
      BroadErrorDataList.add(stBLData + st);
  end;

  if copy(aData,21,2) = '00' then btBroadRetry.Enabled:=True
  else
  begin
    bBroadFileSendERR := True;
    btBroadFileRetry.Enabled := True;
  end;

end;

procedure TMainForm.ExeFile(no: Integer);
var
  edExe : TEdit;
begin
  edExe := TravelEdExeItem(GroupBox19,no);
  if edExe <> nil then
  begin
    if edExe.text <> '' then
       WinExec( Pchar(edExe.text), SW_SHOWNORMAL );

  end;

end;


procedure TMainForm.SendMainBroadData(ID:String; NO: Integer);
var
  stSendData : String;
  stDeviceID : String;
  progTime : cardinal;
  aIndex : Integer;
  st:String;
begin

  st:='';
//  if CardBroadSendCount = CurCBCount then exit;

  CurCBCount := CurCBCount + 1; //현재 상태를 증가 시켜주자.

  if ID = '00' then
  begin
    lbState.caption := inttostr(CurCBCount) + ' / ' + inttostr(CardBroadSendCount);  //송신상태를 표시해 주자
    progTime := DateTimeToUnix(Now) - DateTimeToUnix(startTime);

    lb_TimeStat.Caption := '진행: ' +  FormatDateTime('hh:mm:ss', UnixToDateTime(progTime));
  end
  else
  begin
    ProgressBar1.Position := CurCBCount;
    Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
  end;

    //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //여기서는 Sever모드에서 데이터 생성후 전송하는 부분이다.
  //stSendData := MakeBroadData(NO);
  if BroadSendDataList.count < NO then exit;

  stSendData := BroadSendDataList.Strings[NO-1];

  //데이터 전송
  SendPacket(stDeviceID,'*',stSendData);
end;


function TMainForm.BroadText2Hex(stTemp: String): String;
VAR
  Loop : integer;
  stHex : String;
  bHex : Boolean;
  st : String;
begin
  Result := '';
  st := '';
  stHex := '';
  bHex := False;
//stTemp 중 [] 부분을 Hex 부분으로 추출하여 Char 로 변경 후 리턴
  for Loop:=1 to length(stTemp) do
  begin
    if stTemp[Loop] = '[' then
    begin
      bHex := True;
      Continue;
    end;
    if stTemp[Loop] = ']' then
    begin
      bHex := False;
      st := st + Char(StrToIntDef('$' + stHex, 0));
      stHex := '';
      Continue;
    end;
    if bHex then  stHex := stHex + stTemp[Loop]
    else st := st + stTemp[Loop];

  end;   //For 문

  Result := st;

end;


//브로드 파일중 확장기 부분 Hex값 표시 안되는 부분때문에 강제로 Hex표시 함
function TMainForm.BroadToHex(aMsgData: String): String;
var
  StTemp : String;
  Loop : Integer;
  nASC : Integer;
begin
  StTemp := copy(aMsgData,1,11);
  for Loop := 1 to 9 do
  begin
     nASC := 0;
     nASC := byte(aMsgData[Loop + 11]);
     StTemp := StTemp + '[' + IntToHex(nASC,2) + ']';
  end;

  StTemp := StTemp + copy(aMsgData,21,Length(aMsgData) - 20);
  Result := stTemp;

end;

function TMainForm.TravelCompareItem(GroupBox: TGroupBox;
  no: Integer): TRzEdit;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'edcomp' + inttostr(no) then
    Begin
      Result:=TRzEdit(GroupBox.Controls[Loop]);
      break;
    End;
  End;
end;

function TMainForm.TravelCheckItem(GroupBox: TGroupBox;
  no: Integer): TCheckBox;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'check' + inttostr(no) then
    Begin
      Result:=TCheckBox(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

Function TMainForm.WarningCompare(Data: String):Boolean;
var
  check:TCheckBox;
  Loop:Integer;
  bRtn:Boolean;
begin
  Result := False;

  if Data = '' then exit;

  for Loop := 1 to CONTROLCNT - 1 do   //16번째는 노랑색으로 표시 안함
  begin
     bRtn := False;
     check := TravelCheckItem(Groupbox19,Loop);
     if check.checked then
     begin
       bRtn := DataCompare(Data,strtoint(check.hint));  //체크 되어 있으면 해당 내용과 데이터 비교
       if bRtn then
       begin
          WarningBeep(strtoint(check.hint));    //동일하면 메시지 울림 ,한번만 찾아 주자.
          ExeFile(strtoint(check.hint)); //실행 파일 실행해 주자.
          Result := True;
          break;
       end;
     end;
  end;

end;


procedure TMainForm.RzBitBtn26Click(Sender: TObject);
var
  st: string;
begin
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '==== STOP ==== '+#9+
        ''+#9+
        '';
  AddEventList(st);
  OnMoni:= False;
end;


procedure TMainForm.bt_BroadClick(Sender: TObject);
var
  stDeviceID : String;
  stData : String;
  Loop : integer;
begin
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;

  startTime := Now;
  lb_start.Caption := '시작:' + FormatDateTime('hh:mm:ss',startTime);
  lb_end.Caption := '종료:' ;

  btBroadStop.Enabled := True;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDevice);

  CurCBCount := 0 ; //현재 진행 건수를 0으로 표시하자

  {전송건수 추출}
  CardBroadSendCount := GetSendCount();
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    stData := 'BI' + FillZeroNumber(CardBroadSendCount,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(CardBroadSendCount,9);
  end;

  //여기에서 송신할 데이터를 만들어 버릴까나???
  BroadOrgDataList.Clear;
  for Loop := 0 to CardBroadSendCount - 1 do
  begin
    BroadOrgDataList.Add(MakeBroadData(Loop + 1));
  end;
  BroadSendDataList := BroadOrgDataList;
  //데이터 전송
  SendPacket(stDeviceID,'*',stData);

end;

function TMainForm.GetSendCount: Integer;
begin
  Result:=0;
  //전송건수를 추출한다. 순차 또는 난수일때에는 전송건수
  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  //난수 또는 순차증가
  begin
    Result := strtoint('0' + edcard.text);
  end
  else if rdSelectCardNo.ItemIndex = 2 then    //파일인경우
  begin
     Result := BroadFileList.Count;
  end
  else if rdSelectCardNo.ItemIndex = 3 then  //고정인 경우 1
  begin
    Result := 1;
  end;

end;

procedure TMainForm.SendServerBroadData;
var
//  stSendData : String;
  stDeviceID : String;
  progTime : cardinal;
  st : String;
begin
  st := '';
  BroadTimer.Enabled := False; // Timer 동작 정지
  broadStopTimer.Enabled := False;

  if CardBroadSendCount <=  CurCBCount then exit;

  CurCBCount := CurCBCount + 1; //현재 상태를 증가 시켜주자.
  lbState.caption := inttostr(CurCBCount) + ' / ' + inttostr(CardBroadSendCount);  //송신상태를 표시해 주자
  progTime := DateTimeToUnix(Now) - DateTimeToUnix(startTime);

  lb_TimeStat.Caption := '진행: ' +  FormatDateTime('hh:mm:ss', UnixToDateTime(progTime));

    //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //여기서는 Sever모드에서 데이터 생성후 전송하는 부분이다.
  BroadSendData := '';
//  BroadSendData := MakeBroadData(CurCBCount);
  BroadSendData := BroadSendDataList.Strings[CurCBCount-1];

  //데이터 전송
  SendPacket(stDeviceID,'*',BroadSendData);

  BroadTimer.Enabled := True; // Timer 동작 시작 - 전송후 Timer 체크해서 무한정 기다리지 않고 데이터 송신
  broadStopTimer.Enabled := True;

end;

procedure TMainForm.edCardChange(Sender: TObject);
begin
  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  CardBroadSendCount := strtoint(edCard.text);
end;

function TMainForm.MakeBroadData(No: Integer): String;
var
  stExt: String; //확장기의 정보
  stCardData : String;
  nCardNo1,nCardNo2 : Integer;
  stMsgCode,stRegCode,stCardNo,hexCardNo,stCardAdmin : String;
  stInOut,stMasterMode : String ;
  stTemp : String;
  I: Integer;
begin
  Result := '';
  stExt := BroadControlerNum ; //확장기의 정보
  //###############카드 데이터 생성################
  stCardData := '';
  case rdMsgCode.ItemIndex  of
    0 : {등록}      begin stMsgCode := 'L'  end;
    1 : {조회}      begin stMsgCode := 'M' end;
    2 : {삭제}      begin stMsgCode := 'N' end;
    3 : {전체삭제}  begin stMsgCode := 'O' end;
    else            begin stMsgCode := 'L' end;
  end;
  case cbRegCode.ItemIndex  of
    0 : {첫번째두번째}      begin stRegCode := '0' end;
    1 : {첫번째출입문}      begin stRegCode := '1' end;
    2 : {두번째출입문}      begin stRegCode := '2' end;
    3 : {방범카드전용}      begin stRegCode := '3' end;
    else                    begin stRegCode := '0' end;
  end;

  case cbCardAdmin.ItemIndex  of
    0 : {출입전용}      begin stCardAdmin := '0' end;
    1 : {방범전용}      begin stCardAdmin := '1' end;
    2 : {방범/출입}     begin stCardAdmin := '2' end;
    else                begin stCardAdmin := '0' end;
  end;

  case cbInOut.ItemIndex  of
    0 : {해당없음}      begin stInOut := '0' end;
    1 : {1모드}         begin stInOut := '1' end;
    2 : {2모드}         begin stInOut := '2' end;
    3 : {3모드}         begin stInOut := '3' end;
    else                begin stInOut := '0' end;
  end;

  case cbMasterMode.ItemIndex  of
    0 : {일반}          begin stMasterMode := '0' end;
    1 : {마스터}        begin stMasterMode := '1' end;
    else                begin stMasterMode := '0' end;
  end;

  if rdSelectCardNo.ItemIndex = 0 then
  begin //난수이면
    Randomize;
    nCardNo1 := Random(99999);
    Randomize;
    nCardNo2 := Random(99999);
    stCardNo := FillZeroNumber(nCardNo1,5) + FillZeroNumber(nCardNo2,5);
  end
  else   if rdSelectCardNo.ItemIndex = 1 then
  begin //순차이면
    stCardNo := FillZeroNumber(CurCBCount,10);
  end
  else   if rdSelectCardNo.ItemIndex = 2 then
  begin //파일이면
     stTemp := BroadFileList[No - 1];
     stTemp := BroadText2Hex(stTemp);
     Result := stTemp;
     exit;
    //stCardNo := FillZeroNumber(CurCBCount,10);
  end
  else   if rdSelectCardNo.ItemIndex = 3 then
  begin //고정이면
    stCardNo := FillZeroNumber(strtoint(edcard.text),10);
  end;

  hexCardNo := '00' + EncodeCardNo(stCardNo);


  stCardData := stCardData + stMsgCode + '0' + stRegCode + '  ' + '0'
                + hexCardNo + FormatDatetime('yymmdd',Now) + '0' + stCardAdmin
                + stInOut + stMasterMode;
  //###############카드 데이터 생성 끝 ################


  Result := 'BD' + FillZeroNumber(No,9) + stExt + 'CD00' + stCardData;
end;

procedure TMainForm.BroadCastProcess(aData: String);
begin
    if Copy(aData,19,2) = 'BC' then   //송신에 대한 Ack가 날라옴
    begin
        if rdMaster.ItemIndex = 0 then //서버모드이면
        begin
           SendServerBroadData(); //브로드캐스트 데이터를 만들어 송신하자.
        end
        else if rdMode.ItemIndex = 3 then //서버모드이면
        begin
          //여기에서 데이터를 만들어 송신하자.
        end
        else exit;  //Main 모드 이면 Ack는 무시하고 다음 요청데이터를 기다리자.
    end else if Copy(aData,19,2) = 'bq' then  //Main 모드에서 데이터 요청시
    begin
        SendMainBroadData(Copy(aData,21,2),strtoint(Copy(aData,23,7)));
        //if Copy(aData,21,2) = '00' then SendMainBroadData(Copy(aData,21,2),strtoint(Copy(aData,21,9)))
        //else Copy(aData,21,2) = '01' then SendMainBroadData(strtoint(Copy(aData,21,9))); //요청데이터 확인 후 브로드캐스트 데이터를 만들어 송신하자.
    end else if Copy(aData,19,2) = 'be' then //데이터 송신 완료 됨을 알려주자
    begin
        if Copy(aData,21,2) = '00' then
        begin
          lbState.Caption := lbState.Caption + '송신성공';
          lb_end.Caption := '종료:' + FormatDateTime('hh:mm:ss',Now);
        end else
        begin
          BroadID := Copy(aData,21,2);
          if Copy(aData,21,2) <> '05' then
          begin
            BroadSleep_Timer.Enabled := True;
            //3초간 대기 브로드 파일 전송후  다음 데이터 전송
          end;
        end;
    end else if Copy(aData,19,2) = 'BL' then //데이터 수신실패
    begin
        BroadErrorProcess(aData);
    end else
    begin
        //여기서 FirmWare File 전송하자.
    end;
end;

function TMainForm.GetBroadControlerNum(CheckGroup:TRZCheckGroup): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
begin

  for i:=0 to 8 do
  begin
    for j:=0 to 7 do
    begin
      nTemp[i,j]:=0;
    end;
  end;

  //체크 되어 있는 위치에 데이터를 넣는다.
  for k:= 0 to 63 do
  begin
    if CheckGroup.ItemChecked[k] = True then
    begin
      i := k div 8;
      j := k Mod 8 ;
      nTemp[i,j] := 1;
    end;
  end;

  stHex := '';
  for k:=0 to 8 do
  begin
    nDecimal := 0;
    stTemp := '';
    For j:= 4 to 7 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j - 4));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
    nDecimal := 0;

    For j:= 0 to 3 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
{
    For j:= 3 downto 0 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, 3 - j));
    end;

    stTemp := intTostr(nDecimal);
    nDecimal := 0;
    For j:= 7 downto 4 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, 7 - j));
    end;

    stTemp := stTemp + intToStr(nDecimal);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));   }
  end;

  //showmessage(stTemp);
  Result:=stHex;

end;

procedure TMainForm.Init_IDNO_ComboBox(aComBoBox:TRzComboBox);
var
  I: Integer;
  st: String;
begin

  aComBoBox.Clear;
  for I:= 0 to 64 do
  begin
    if I < 10 then st:= '0'+InttoStr(I)
    else           st:= InttoStr(I);
    aComBoBox.Items.Add(st);
  end;
  aComBoBox.ItemIndex:= 0;
end;

procedure TMainForm.ConfigInit;
var
 aTCP: String;
 I: Integer;
 st: string;
 ViewMAC: Integer;
begin


  {장비 IP}
  with LMDIniCtrl1 do
  begin
    RzRadioGroup1.ItemIndex:= ReadInteger('설정','연결방식',0);
    CB_SerialComm.ItemIndex:= ReadInteger('설정','ComNo',0);

    RadioGroup_Mode.ItemIndex:= ReadInteger('설정','TCPMode',1);

    aTCP:= ReadString('설정','TCP','127.0.0.1,3000');

    Edit_send1.Text:= Hex2Ascii(ReadString('설정','SEND1',''));
    Edit_send2.Text:= Hex2Ascii(ReadString('설정','SEND2',''));
    Edit_send3.Text:= Hex2Ascii(ReadString('설정','SEND3',''));
    Edit_send4.Text:= Hex2Ascii(ReadString('설정','SEND4',''));
    Edit_send5.Text:= Hex2Ascii(ReadString('설정','SEND5',''));
    Edit_send6.Text:= Hex2Ascii(ReadString('설정','SEND6',''));
    Edit_send7.Text:= Hex2Ascii(ReadString('설정','SEND7',''));
    Edit_send8.Text:= Hex2Ascii(ReadString('설정','SEND8',''));
    Edit_send9.Text:= Hex2Ascii(ReadString('설정','SEND9',''));
    Edit_send0.Text:= Hex2Ascii(ReadString('설정','SEND0',''));
    Edit_sendA.Text:= Hex2Ascii(ReadString('설정','SENDA',''));
    Edit_sendB.Text:= Hex2Ascii(ReadString('설정','SENDB',''));
    Edit_sendC.Text:= Hex2Ascii(ReadString('설정','SENDC',''));
    Edit_sendD.Text:= Hex2Ascii(ReadString('설정','SENDD',''));
    Edit_sendE.Text:= Hex2Ascii(ReadString('설정','SENDE',''));
    Edit_sendF.Text:= Hex2Ascii(ReadString('설정','SENDF',''));

    Edit_Func1.Text:= ReadString('설정','FUNC1','');
    Edit_Func2.Text:= ReadString('설정','FUNC2','');
    Edit_Func3.Text:= ReadString('설정','FUNC3','');
    Edit_Func4.Text:= ReadString('설정','FUNC4','');
    Edit_Func5.Text:= ReadString('설정','FUNC5','');
    Edit_Func6.Text:= ReadString('설정','FUNC6','');
    Edit_Func7.Text:= ReadString('설정','FUNC7','');
    Edit_Func8.Text:= ReadString('설정','FUNC8','');
    Edit_Func9.Text:= ReadString('설정','FUNC9','');
    Edit_Func0.Text:= ReadString('설정','FUNC0','');
    Edit_FuncA.Text:= ReadString('설정','FUNCA','');
    Edit_FuncB.Text:= ReadString('설정','FUNCB','');
    Edit_FuncC.Text:= ReadString('설정','FUNCC','');
    Edit_FuncD.Text:= ReadString('설정','FUNCD','');
    Edit_FuncE.Text:= ReadString('설정','FUNCE','');
    Edit_FuncF.Text:= ReadString('설정','FUNCF','');

    // DBGrid 칼럼 사이즈
    RxDBGrid1.Columns[0].Width:= ReadInteger('모니터링그리드설정','순번'      ,RxDBGrid1.Columns[0].Width);
    RxDBGrid1.Columns[1].Width:= ReadInteger('모니터링그리드설정','방향'      ,RxDBGrid1.Columns[1].Width);
    RxDBGrid1.Columns[2].Width:= ReadInteger('모니터링그리드설정','시간'      ,RxDBGrid1.Columns[2].Width);
    RxDBGrid1.Columns[3].Width:= ReadInteger('모니터링그리드설정','기기ID'    ,RxDBGrid1.Columns[3].Width);
    RxDBGrid1.Columns[4].Width:= ReadInteger('모니터링그리드설정','No'        ,RxDBGrid1.Columns[4].Width);
    RxDBGrid1.Columns[5].Width:= ReadInteger('모니터링그리드설정','커맨드'    ,RxDBGrid1.Columns[5].Width);
    RxDBGrid1.Columns[6].Width:= ReadInteger('모니터링그리드설정','데이터'    ,RxDBGrid1.Columns[6].Width);
    RxDBGrid1.Columns[7].Width:= ReadInteger('모니터링그리드설정','전체데이터',RxDBGrid1.Columns[7].Width);

    //소리부분 셋팅
    edComp1.Text:= Hex2Ascii(ReadString('소리','EDCOMP1',''));
    edComp2.Text:= Hex2Ascii(ReadString('소리','EDCOMP2',''));
    edComp3.Text:= Hex2Ascii(ReadString('소리','EDCOMP3',''));
    edComp4.Text:= Hex2Ascii(ReadString('소리','EDCOMP4',''));
    edComp5.Text:= Hex2Ascii(ReadString('소리','EDCOMP5',''));
    edComp6.Text:= Hex2Ascii(ReadString('소리','EDCOMP6',''));
    edComp7.Text:= Hex2Ascii(ReadString('소리','EDCOMP7',''));
    edComp8.Text:= Hex2Ascii(ReadString('소리','EDCOMP8',''));
    edComp9.Text:= Hex2Ascii(ReadString('소리','EDCOMP9',''));
    edComp10.Text:= Hex2Ascii(ReadString('소리','EDCOMP10',''));
    edComp11.Text:= Hex2Ascii(ReadString('소리','EDCOMP11',''));
    edComp12.Text:= Hex2Ascii(ReadString('소리','EDCOMP12',''));
    edComp13.Text:= Hex2Ascii(ReadString('소리','EDCOMP13',''));
    edComp14.Text:= Hex2Ascii(ReadString('소리','EDCOMP14',''));
    edComp15.Text:= Hex2Ascii(ReadString('소리','EDCOMP15',''));
    edComp16.Text:= Hex2Ascii(ReadString('소리','EDCOMP16',''));

    edFile1.Text:= ReadString('소리','EDFILE1','');
    edFile2.Text:= ReadString('소리','EDFILE2','');
    edFile3.Text:= ReadString('소리','EDFILE3','');
    edFile4.Text:= ReadString('소리','EDFILE4','');
    edFile5.Text:= ReadString('소리','EDFILE5','');
    edFile6.Text:= ReadString('소리','EDFILE6','');
    edFile7.Text:= ReadString('소리','EDFILE7','');
    edFile8.Text:= ReadString('소리','EDFILE8','');
    edFile9.Text:= ReadString('소리','EDFILE9','');
    edFile10.Text:= ReadString('소리','EDFILE10','');
    edFile11.Text:= ReadString('소리','EDFILE11','');
    edFile12.Text:= ReadString('소리','EDFILE12','');
    edFile13.Text:= ReadString('소리','EDFILE13','');
    edFile14.Text:= ReadString('소리','EDFILE14','');
    edFile15.Text:= ReadString('소리','EDFILE15','');
    edFile16.Text:= ReadString('소리','EDFILE16','');

    edExe1.Text:= ReadString('실행','EDEXE1','');
    edExe2.Text:= ReadString('실행','EDEXE2','');
    edExe3.Text:= ReadString('실행','EDEXE3','');
    edExe4.Text:= ReadString('실행','EDEXE4','');
    edExe5.Text:= ReadString('실행','EDEXE5','');
    edExe6.Text:= ReadString('실행','EDEXE6','');
    edExe7.Text:= ReadString('실행','EDEXE7','');
    edExe8.Text:= ReadString('실행','EDEXE8','');
    edExe9.Text:= ReadString('실행','EDEXE9','');
    edExe10.Text:= ReadString('실행','EDEXE10','');
    edExe11.Text:= ReadString('실행','EDEXE11','');
    edExe12.Text:= ReadString('실행','EDEXE12','');
    edExe13.Text:= ReadString('실행','EDEXE13','');
    edExe14.Text:= ReadString('실행','EDEXE14','');
    edExe15.Text:= ReadString('실행','EDEXE15','');
    edExe16.Text:= ReadString('실행','EDEXE16','');

    if ReadInteger('소리','CHECK1',0) = 0 then check1.Checked := false
    else check1.Checked := True;
    if ReadInteger('소리','CHECK2',0) = 0 then check2.Checked := false
    else check2.Checked := True;
    if ReadInteger('소리','CHECK3',0) = 0 then check3.Checked := false
    else check3.Checked := True;
    if ReadInteger('소리','CHECK4',0) = 0 then check4.Checked := false
    else check4.Checked := True;
    if ReadInteger('소리','CHECK5',0) = 0 then check5.Checked := false
    else check5.Checked := True;
    if ReadInteger('소리','CHECK6',0) = 0 then check6.Checked := false
    else check6.Checked := True;
    if ReadInteger('소리','CHECK7',0) = 0 then check7.Checked := false
    else check7.Checked := True;
    if ReadInteger('소리','CHECK8',0) = 0 then check8.Checked := false
    else check8.Checked := True;
    if ReadInteger('소리','CHECK9',0) = 0 then check9.Checked := false
    else check9.Checked := True;
    if ReadInteger('소리','CHECK10',0) = 0 then check10.Checked := false
    else check10.Checked := True;
    if ReadInteger('소리','CHECK11',0) = 0 then check11.Checked := false
    else check11.Checked := True;
    if ReadInteger('소리','CHECK12',0) = 0 then check12.Checked := false
    else check12.Checked := True;
    if ReadInteger('소리','CHECK13',0) = 0 then check13.Checked := false
    else check13.Checked := True;
    if ReadInteger('소리','CHECK14',0) = 0 then check14.Checked := false
    else check14.Checked := True;
    if ReadInteger('소리','CHECK15',0) = 0 then check15.Checked := false
    else check15.Checked := True;
    if ReadInteger('소리','CHECK16',0) = 0 then check16.Checked := false
    else check16.Checked := True;

    //브로드 캐스트 부분
    edBroadFileSave.Text := ReadString('BroadCasting','SaveFileName','');
    BroadSaveFileList.Clear;
    if edBroadFileSave.Text <> '' then
    begin
     if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
    end;

    edBRFileLoad.Text := ReadString('BroadCasting','OpenFileName','');
    BroadFileList.Clear;
    if edBRFileLoad.text <> '' then
    begin
      if fileexists(edBRFileLoad.text) = true then BroadFileList.LoadFromFile(edBRFileLoad.text);
    end;


    ViewMAC:= ReadInteger('설정','VIEWMAC',0);

    if ViewMAC < 1 then GroupMAc.Visible:= False
    else                GroupMAc.Visible:= True;

  end;


  CB_IPList.Text:= FindCharCopy(aTCP,0,',');
  Edit2.Text:= FindCharCopy(aTCP,1,',');
  (*
  if Length(aTCP) > 5 then aTCP:= '3000';
  Edit2.Text:= aTCP;
    *)
  Group_Device.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2);
    Group_Device.Items.Add(st);
  end;

  Group_BroadDevice.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2) + '  ';
    Group_BroadDevice.Items.Add(st);
  end;

  Group_BroadDownLoad.Items.Clear;
  for I:= 0 to 99 do
  begin
    st:= FillZeroNumber(I,2) ;
    Group_BroadDownLoad.Items.Add(st);
  end;

  {1.방범_위치정보등록}
  Init_IDNO_ComboBox(ComboBox_IDNO);

  {2.방범_카드리더 등록}
  with ComBoBox_UseCardReader do
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  with ComBoBox_InOutCR do
  begin
    Clear;
    Items.Add('내부');
    Items.Add('외부');
    ItemIndex:= 0;
  end;
  with ComBoBox_Building do
  begin
    Clear;
    Items.Add('내부');
    Items.Add('외부');
    ItemIndex:= 0;
  end;

  with ComBoBox_DoorNo do
  begin
    Clear;
    Items.Add('없음');
    Items.Add('1');
    Items.Add('2');
    ItemIndex:= 0;
  end;

  {3.방범 시스템 등록 정보}
  with ComboBox_WatchPowerOff do
  begin
    Clear;
    Items.Add('정전 감시 OFF');
    Items.Add('정전 감시 ON');
    ItemIndex:= 0;
  end;
  with ComboBox_DeviceType do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 2;
  end;
  with ComboBox_DoorType1 do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 0;
  end;
  with ComboBox_DoorType2 do
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex:= 0;
  end;

  {방범_릴레이 등록 정보}
  with COmBoBox_Linktype1 do     //릴레이 연동 방법
  begin
    Clear;
    Items.Add('처음 발생시만');
    Items.Add('발생시마다');
    ItemIndex:= 0;
  end;
  with ComboBox_OutType1 do     //릴레이 출력 빙식
  begin
    Clear;
    Items.Add('OPEN 접점');
    Items.Add('CLOSE 접점');
    ItemIndex:= 0;
  end;
  with ComboBox_RenewTimer1 do     //Timer Renew
  begin
    Clear;
    Items.Add('Timer Renew OFF');
    Items.Add('Timer Renew ON');
    ItemIndex:= 0;
  end;
  with ComboBox_UseType1 do     //릴레이 사용방식
  begin
    Clear;
    Items.Add('포트 연동');
    Items.Add('모드 연동');
    Items.Add('전등 사용');
    ItemIndex:= 0;
  end;

  {포트정보 등록}
  with ComboBox_WatchType do     //감시형태
  begin
    Clear;
    Items.Add('0.방범');
    Items.Add('1.화재');
    Items.Add('2.가스');
    Items.Add('3.비상');
    Items.Add('4.설비');
    Items.Add('5.호출'); //2007.08.05 추가

    ItemIndex:= 0;
  end;

  with ComboBox_AlarmType do     //경보발생방식
  begin
    Clear;
    Items.Add('1회발생');
    Items.Add('발생시마다');
    ItemIndex:= 0;
  end;

  with ComboBox_recover do     //복구신호 전송 유무
  begin
    Clear;
    Items.Add('안함');
    Items.Add('전송 ');
    ItemIndex:= 0;
  end;

  with ComboBox_Delay do     //복구신호 전송 유무
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex:= 0;
  end;
 {출입통제:시스템정보 등록(II)}
 {
  with ComboBox_DoorNo2 do     //문 번호
  begin
    Clear;
    Items.Add('1번');
    Items.Add('2번');
    ItemIndex:= 0;
  end;
  }
  with ComboBox_CardModeType do     //카드운영 모드
  begin
    Clear;
    Items.Add('Positive');
    Items.Add('Negative');
    ItemIndex:= 0;
  end;
  with ComboBox_DoorModeType do     //출입문 운영 모드
  begin
    Clear;
    Items.Add('운영');
    Items.Add('개방');
    Items.Add('폐쇄');
    ItemIndex:= 0;
  end;
  with ComboBox_UseSch do     //출입문 운영 모드
  begin
    Clear;
    Items.Add('안함');
    Items.Add('적용');
    ItemIndex:= 0;
  end;
  with ComboBox_SendDoorStatus do     //출입문 상태 전송여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('출입문상태');
    Items.Add('전기정상태');
    Items.Add('출입문+전기정상태');
    ItemIndex:= 0;
  end;
  with ComboBox_AntiPass do     //AntiPassBAck 사용여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;

  with ComboBox_UseCommOff do     //통신이상시 기기 운영
  begin
    Clear;
    Items.Add('정지');
    Items.Add('동작');
    ItemIndex:= 0;
  end;

  with ComboBox_AlarmLongOpen do     //장시간 열림 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  with ComboBox_AlramCommoff do     //통신 이상시 부저 출력
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;
  with ComboBox_LockType do       //전기정 타입
  begin
    Clear;
    Items.Add('일반형(정전시 잠김)');
//    Items.Add('자동문');
    Items.Add('일반형(정전시 열림)');
//    Items.Add('데드락/EM락/스트라이커');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이크(정전시 잠김)');
//    Items.Add('0x35 예비');
    Items.Add('스트라이크(정신시 열림)');
//    Items.Add('0x36 예비');
    Items.Add('자동문/주차');
//    Items.Add('0x37 식당');
    Items.Add('부져/램프제어');
    Items.Add('SPEED GATE');
    Items.Add('순시타입');
    ItemIndex := 1;
  end;
  with ComboBox_ControlFire do     //화재 발생시 문제어
  begin
    Clear;
    Items.Add('안함');
    Items.Add('사용');
    ItemIndex:= 0;
  end;


  with ComboBox_CheckDSLS do     //DS , LS 검사 설정
  begin
    Clear;
    Items.Add('안함');
    Items.Add('DS 검사');
    Items.Add('LS 검사');
    Items.Add('DS+LS 검사');
    ItemIndex:= 0;
  end;


 {출입통제:DOOR 제어}
 {
  with ComboBox_DoorNo3 do     //문 번호
  begin
    Clear;
    Items.Add('1번');
    Items.Add('2번');
    ItemIndex:= 0;
  end;
  }

  {EDIT, COMBO 마우스 클릭시 색상을 White로 만들자}

  for I:= 0 to MainForm.ComponentCount -1 do
  begin
    if Components[I] is TEdit then TEdit(Components[I]).OnEnter:= Edit_Combo_Enter
    else if Components[I] is TComboBox then TComboBox(Components[I]).OnEnter:= Edit_Combo_Enter
    else if Components[I] is TRzComboBox then TRzComboBox(Components[I]).OnEnter:= Edit_Combo_Enter;
  end;


end;

procedure TMainForm.AddEventList(aData: String);
var
  acmd: String;
  aIP:String;
  aDeviceID: String;
  aDeviceNo: String;
  amsgData:  String;
  aFullData: String;
  aWay:      String;
//  aNo:       String;

begin
 (*
 st:= FormatDatetime('hh":"nn":"ss":"zzz',Now)+';'+ aData;
 if ListBox_Event.Items.Count > 100 then ListBox_Event.Items.Delete(0);
 if EventIndex >= 99 then EventIndex:= 0
 else                     Inc(EventIndex);
 st:= InttoStr(EventIndex)+';'+st;
 ListBox_Event.Items.Add(st);
 ListBox_Event.ItemIndex:= ListBox_Event.Items.Count -1 ;
   *)


  if not OnMoni then Exit;
  aIP:= FindCharCopy(aData,0,#9);
  acmd:= FindCharCopy(aData,3,#9);
  aDeviceID:= FindCharCopy(aData,1,#9);
  aDeviceNo:= FindCharCopy(aData,2,#9);
  amsgData:=  FindCharCopy(aData,4,#9);
  aWay:=      FindCharCopy(aData,5,#9);
  aFullData:= FindCharCopy(aData,6,#9);
  if chk_Hex.Checked then aFullData := ConvertToHex(aFullData);

  if aCmd = '*' then // 브로드캐스팅 부분때문에 데이터 처리
  begin
    //showmessage(aWay);
  end;

  //커맨드 필터 적용
  if rgCmdFilter.ItemIndex = 1 then
  begin
    if (edFilter.Text = '') or (Pos(acmd,edFilter.Text) = 0) then Exit;
  end else if rgCmdFilter.ItemIndex = 2 then
  begin
    if (edFilter.Text = '') or (Pos(acmd,edFilter.Text) > 0) then Exit;
  end;


  if WarningCompare(aFullData) then amsgData := 'Y:' + amsgData
  else amsgData := 'N:' + amsgData;
  // 기기번호 필터 사용
  if cbFinterNo.Checked then
  begin
    if Pos(aDeviceNo,edFfNo.Text) = 0 then Exit;
  end;

  with DBISAMTable1 do
  begin
    Append;
    FindField('EventTime').asDatetime:= Now;
    FindField('IP').asString         := aIP;
    FindField('DeviceID').asString   := aDeviceID;
    FindField('DeviceNo').asString   := aDeviceNo;
    FindField('cmd').asString        := aCmd;
    FindField('Data').asString       := amsgData;
    FindField('FullData').asString   := aFullData;
    FindField('Way').asString        := aWay;
    //SHowMessage(FindCharCopy(aData,5,';'));

    try
      Post;
    except
      Exit;
    end;
    if (aCmd <> 'e') and (aCmd <> 'a') then
    begin
      if FindField('Way').asString = 'RX' then
      begin
      //Beep;
      end;
    end;
  end;
end;


procedure TMainForm.AdVT100Emulator1ProcessChar(Sender: TObject;
  Character: Char; var ReplaceWith: String; Commands: TAdEmuCommandList;
  CharSource: TAdCharSource);
begin
(*
  if (Character = ETX) and (CharSource = csPort) then
  begin

  end;
  *)
end;


procedure TMainForm.FormShow(Sender: TObject);
var
  I: Integer;
  aDir:String;
begin
  Msg_Ver := 'K1';
  BaseDataLength := 21;
  BroadFileList := TStringList.Create;
  BroadSaveFileList := TStringList.Create;
  BroadSendDataList := TStringList.Create;  //브로드데이터 전송내역 저장
  BroadSendDataList.Clear;
  BroadErrorDataList := TStringList.Create; //브로드데이터 에러내역 저장
  BroadErrorDataList.Clear;
  BroadRetryDataList := TStringList.Create;
  BroadRetryDataList.Clear;
  BroadOrgDataList:= TStringList.Create;

  MainForm.Caption:= PROGRAM_NAME +' '+ strBuildInfo+'[관제등록포함]';
  ConfigInit;
  Notebook1.PageIndex:= 10;
  FillArray_Send;
  IsDownLoad:= False;
  DownLoadList:= TStringList.Create;
  ROM_FlashWrite:= TStringList.Create;
  ROM_FlashData := TStringList.Create;
  ROM_BineryFlashWrite := nil;
  ROM_BineryFlashData := nil;

  EventIndex:= 0;
  CountCardReadData:= 1;
  DBISAMTable1.CreateTable;
  DBISAMTable1.Active:= True;
  OnMoni:= True;

  for I:= 0 to RzGroupBar1.GroupCount -1 do
  begin
       TRzGroup(RzGroupBar1.Groups[i]).OPen;
  end;

  aDir:= ExtractFileDir(Application.ExeName);
  aDir:= aDir +'\iplist.ini';
  if FileExists(aDir) then
  begin
    CB_IPList.Items.LoadFromFile(aDir);
    //CB_IPList.ItemIndex:= 0;
  end;
  //Server.Open;
  //Server.Active:= True;

  CardBroadSendCount :=0;  //총 전송할 건수
  CurCBCount :=0;          //현재 진행중인 건수
  BroadControlerNum := '';
  BroadID := '';
  btBroadFileRetry.Enabled := False;
  BroadSleep_Timer.Enabled := False;

  RzPageControl1.ActivePageIndex:= 0;

end;

Procedure TMainForm.FillArray_Send;
begin
  Array_SendEdit[1].Edit:= Edit_Send1;
  Array_SendEdit[1].Func:= Edit_Func1;
  Array_SendEdit[1].Btn_Send:= Btn_Send1;
  Array_SendEdit[1].Btn_Clear:= Btn_Clear1;

  Array_SendEdit[2].Edit:= Edit_Send2;
  Array_SendEdit[2].Func:= Edit_Func2;
  Array_SendEdit[2].Btn_Send:= Btn_Send2;
  Array_SendEdit[2].Btn_Clear:= Btn_Clear2;

  Array_SendEdit[3].Edit:= Edit_Send3;
  Array_SendEdit[3].Func:= Edit_Func3;
  Array_SendEdit[3].Btn_Send:= Btn_Send3;
  Array_SendEdit[3].Btn_Clear:= Btn_Clear3;

  Array_SendEdit[4].Edit:= Edit_Send4;
  Array_SendEdit[4].Func:= Edit_Func4;
  Array_SendEdit[4].Btn_Send:= Btn_Send4;
  Array_SendEdit[4].Btn_Clear:= Btn_Clear4;

  Array_SendEdit[5].Edit:= Edit_Send5;
  Array_SendEdit[5].Func:= Edit_Func5;
  Array_SendEdit[5].Btn_Send:= Btn_Send5;
  Array_SendEdit[5].Btn_Clear:= Btn_Clear5;

  Array_SendEdit[6].Edit:= Edit_Send6;
  Array_SendEdit[6].Func:= Edit_Func6;
  Array_SendEdit[6].Btn_Send:= Btn_Send6;
  Array_SendEdit[6].Btn_Clear:= Btn_Clear6;

  Array_SendEdit[7].Edit:= Edit_Send7;
  Array_SendEdit[7].Func:= Edit_Func7;
  Array_SendEdit[7].Btn_Send:= Btn_Send7;
  Array_SendEdit[7].Btn_Clear:= Btn_Clear7;

  Array_SendEdit[8].Edit:= Edit_Send8;
  Array_SendEdit[8].Func:= Edit_Func8;
  Array_SendEdit[8].Btn_Send:= Btn_Send8;
  Array_SendEdit[8].Btn_Clear:= Btn_Clear8;

  Array_SendEdit[9].Edit:= Edit_Send9;
  Array_SendEdit[9].Func:= Edit_Func9;
  Array_SendEdit[9].Btn_Send:= Btn_Send9;
  Array_SendEdit[9].Btn_Clear:= Btn_Clear9;

  Array_SendEdit[0].Edit:= Edit_Send0;
  Array_SendEdit[0].Func:= Edit_Func0;
  Array_SendEdit[0].Btn_Send:= Btn_Send0;
  Array_SendEdit[0].Btn_Clear:= Btn_Clear0;

  Array_SendEdit[10].Edit:= Edit_SendA;
  Array_SendEdit[10].Func:= Edit_FuncA;
  Array_SendEdit[10].Btn_Send:= Btn_SendA;
  Array_SendEdit[10].Btn_Clear:= Btn_ClearA;

  Array_SendEdit[11].Edit:= Edit_SendB;
  Array_SendEdit[11].Func:= Edit_FuncB;
  Array_SendEdit[11].Btn_Send:= Btn_SendB;
  Array_SendEdit[11].Btn_Clear:= Btn_ClearB;

  Array_SendEdit[12].Edit:= Edit_SendC;
  Array_SendEdit[12].Func:= Edit_FuncC;
  Array_SendEdit[12].Btn_Send:= Btn_SendC;
  Array_SendEdit[12].Btn_Clear:= Btn_ClearC;

  Array_SendEdit[13].Edit:= Edit_SendD;
  Array_SendEdit[13].Func:= Edit_FuncD;
  Array_SendEdit[13].Btn_Send:= Btn_SendD;
  Array_SendEdit[13].Btn_Clear:= Btn_ClearD;

  Array_SendEdit[14].Edit:= Edit_SendE;
  Array_SendEdit[14].Func:= Edit_FuncE;
  Array_SendEdit[14].Btn_Send:= Btn_SendE;
  Array_SendEdit[14].Btn_Clear:= Btn_ClearE;

  Array_SendEdit[15].Edit:= Edit_SendF;
  Array_SendEdit[15].Func:= Edit_FuncF;
  Array_SendEdit[15].Btn_Send:= Btn_SendF;
  Array_SendEdit[15].Btn_Clear:= Btn_ClearF;

end;



function TMainForm.RecevieDataProcess(aData:String; var bData :String):Boolean;
var
//  st: string;
  aIndex: Integer;
  Lenstr: String;
  RealDataLength: Integer;
  StrBuff: String;
begin

  Result:= False;

  Lenstr:= Copy(aData,2,3);
  if not isDigit(Lenstr) then
  begin
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData);
    if aIndex = 0 then
    begin
      aIndex:= Length(aData);
      StrBuff:= Copy(aData,1,aIndex);
    end else
    begin
      StrBuff:= Copy(aData,1,aIndex-1);
    end;


    Delete(aData, 1, Length(StrBuff));
    bData:= aData;
    Exit;
  end;

  RealDataLength:= StrtoInt(Lenstr);

  if aData[RealDataLength] = ETX then
  begin
    RealDataLength:= StrtoInt(LenStr);
    StrBuff:= Copy(aData,1,RealDataLength);
    Result:= True;
    bData:=StrBuff;
    Delete(aData, 1, RealDataLength);
  end else
  begin
    if Length(aData) < RealDataLength then
    begin
      bData:= aData;
      Exit;
    end;
    Delete(aData,1,1);
    aIndex:= Pos(STX,aData);
    StrBuff:= Copy(aData,1,aIndex-1);
    //ReceviePackettoListView(ListView_Comm,2,ClientThread.Socket.PeerIPAddress,'[E0002]'+STX+StrBuff);
    //Codesite.SendError('DATA ERROR:'+STX+StrBuff);
    Delete(aData, 1, aIndex-1);
    bData:= aData;
  end;
end;

{정상적으로 들어온 데이터 패킷 처리 루틴}
function TMainForm.DataPacektProcess(aData: string):Boolean;
var
  aKey: Byte;
  st: string;
  chCmd: Char;
  stDeviceID: String;
  stData : String;
  stFullData : string;
begin
  Result:= False;
  if aData = '' then Exit;

  //31:Q++()./,-**s*S^**+()./,-()
  aKey:= Ord(aData[5]);
  st:= Copy(aData,1,5) + EncodeData(aKey,Copy(aData,6,Length(aData)-6))+aData[Length(aData)];
  stFullData:= st;
  stData := GetDataPacket(st,stDeviceID,chCmd,Rcv_MsgNo,Msg_Ver,BaseDataLength);

  st:=  WinsockPort.WsAddress +#9+
        Copy(stDeviceID,1,7)+#9+
        Copy(stDeviceID,8,2)+#9+
        chCmd+#9+
        stData+#9+
        'RX'+#9+
        stFullData;

  if cbDisplayPolling.Checked = True then
  begin
    AddEventList(st);
  end else
  begin
    if chCmd <> 'e' then AddEventList(st);
  end;

  if  (chCmd = 'e') then
  begin
      if RzCheckBox2.Checked then PollingAck(stDeviceID);
  end else if (chCmd = 'a') then
  begin
    Exit;
  end else if (chCmd <> 'c') then
  begin
    if RzCheckBox2.Checked then // ACK 응답 처리
    begin
      if (chCmd <> '*') then SendPacket(stDeviceID,'a','');   //브로드캐스팅일때는 무시
    end;
  end;


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
  즉 ACK 응답을 두번 주어야 한다.(①전체 패킷응답,②출입통제 응답)
   ================================================================================ }

  //codesite.SendMsg(st);
  case chCmd of
    'A':{알람}          begin  end;
    'i':{Initial}       begin  RegDataProcess(stDeviceID,stData)    end;
    'R':{Remote}        begin  RemoteDataProcess(stDeviceID,stData) end;
    'r':{Remote Answer} begin  RemoteDataProcess(stDeviceID,stData) end;
    'c':{출입통제}      begin  AccessDataProcess(stDeviceID,stData) end;
    'f':{펌웨어}        begin  FirmwareProcess(stDeviceID,stData)   end;
    'F':{펌웨어}        begin  FirmwareProcess2(stDeviceID,stData)  end;
//    '*':{브로드캐스트}  begin  BroadCastProcess(stDeviceID,stData)  end;
//    'E':{브로드캐스트에러} begin  BroadErrorProcess(stDeviceID,stData) end;
    'e':{ERROR}
    else {error 발생: [E003]정의 되지 않은 커맨드}
  end;

  Result:= True;
end;



(*
Procedure TForm1.AlarmDataProcess(aData: String);
var
  st        : string;
  aTime     : String[50];
  aNode     : String[7];
  aDeviceID:  String[2];
  aMsgNo    : Char;
  aSubCLass : String[2];
  aSubAddr  : String[2];
  aZOneCOde : String[2];
  aMode     : String[2];
  ModeStr   : String[10];
  aStatus   : String[2];
  aPortNo   : String[2];
  aState    : Char;
  aOper     : String[20];
  aNo       : Integer;
  aImageIndex: Integer;
  StatusStr: String;
  isAlarm  : Integer;
begin

  aNode     := copy(aData,8,7);
  aDeviceID := Copy(aData,15,2);
  aMsgNo    := aData[18];
  aTime     := copy(aData,20,14);
  aSubCLass := copy(aData,34,2);
  aSubAddr  := copy(aData,36,2);
  aZoneCode := copy(aData,38,2);
  aMode     := aData[40];
  aStatus   := copy(aData,41,2);
  aPortNo   := copy(aData,43,2);
  aState    := aData[45];
  aOper     := copy(aData,46,10);

  aMode:= UpperCase(aMode);


  case aMode[1] of
   'A': ModeStr:= '[A]경비모드';
   'D': ModeStr:= '[D]해제모드';
   'P': ModeStr:= '[P]순회모드';
   'I': ModeStr:= '[I]등록모드';
   'T': ModeStr:= '[T]시험모드';
  end;
end;
*)


{등록데이터 응답 처리}
Procedure TMainForm.RegDataProcess(aDeviceID,aData: String);
var
  stMCUID: String;
  I: Integer;
  stDataCmd: String;
begin
  stMCUID := Copy(aDeviceID, 1,Length(aDeviceID) - 2);
  RzLabel1.Caption:= stMCUID;
  Edit_DeviceID.Color:= clYellow;
  Edit_DEviceID.Text:= stMCUID;
  Edit_CurrentID.Text:= stMCUID;

  For I:= 0 to ComponentCount -1 do
  begin
     if (Components[I] is TRzEdit) and
        (Pos('DeviceID', TRzEdit(Components[I]).Name) > 0 ) then
     begin
      TRzEdit(Components[I]).Text:= stMCUID;
     end;
  end;

  stDataCmd:= GetDataCommand(aData);
  if stDataCmd = 'ID' then
  begin
    RcvDeviceID(aDeviceID,aData);
  end else if stDataCmd = 'CD' then
  begin
    RcvCR(aDeviceID,aData);
  end else if stDataCmd = 'SY' then
  begin
    RcvSysinfo(aDeviceID,aData);
  end else if stDataCmd = 'RY' then
  begin
    RcvRelay(aDeviceID,aData)
  end else if stDataCmd = 'LP' then
  begin
    RcvPort(aDeviceID,aData)
  end else if stDataCmd = 'AD' then
  begin
    RcvUsedAlarmdisplay(aDeviceID,aData)
  end else if stDataCmd = 'EX' then
  begin
    RcvUsedDevice(aDeviceID,aData)
  end else if stDataCmd = 'TN' then
  begin
    RcvTellNo(aDeviceID,aData);
  end else if stDataCmd = 'CT' then
  begin
    RcvCallTime(aDeviceID,aData);
  end else if stDataCmd = 'BT' then
  begin
    RcvbroadcastTime(aDeviceID,aData);
  end else if stDataCmd = 'DI' then
  begin
    RcvDialInfo(aDeviceID,aData);
  end else if stDataCmd = 'DT' then
  begin
    RcvControlDialInfo(aDeviceID,aData);
  end else if stDataCmd = 'NW' then
  begin
    ClearWiznetInfo;
    RcvWiznetInfo(aDeviceID,aData);
  end else if stDataCmd = 'VC' then
  begin
    RcvVoiceTime(aDeviceID,aData);
  end else if stDataCmd = 'Id' then
  begin
    RcvLinkusId(aDeviceID,aData);
  end else if stDataCmd = 'Tn' then
  begin
    RcvLinkusTelNo(aDeviceID,aData);
  end else if stDataCmd = 'Pt' then
  begin
    RcvLinkusPt(aDeviceID,aData);
  end else if stDataCmd = 'Rc' then
  begin
    RcvRingCount(aDeviceID,aData);
  end else if stDataCmd = 'Ct' then
  begin
    RcvCardType(aDeviceID,aData);
  end;

end;

procedure TMainForm.RemoteDataProcess(aDeviceID,aData: String);
var
  stDataCmd: String;
  st: string;
  aIndex: Integer;
  aType:String;
  aRelayNo: Integer;
  stData : string;
begin
  //TM00050107180637EF
  stDataCmd:= GetDataCommand(aData);

  if stDataCmd = 'TM' then          //시간설정
  begin
    stData := GetTimeSync(aData);
    Edit_TimeSync.Text:= Copy(stData,1,4)+'-'+  //년
                         Copy(stData,5,2)+'-'+  //월
                         Copy(stData,7,2)+' '+  //일
                         Copy(stData,9,2)+':'+  //시
                         Copy(stData,11,2)+':'+  //분
                         Copy(stData,13,2);      //초
  end else if stDataCmd = 'VR' then //버젼확인
  begin
    Edit_Ver.Text:= GetDeviceVersion(aData);
    Edit_TopRomVer.Text:= Edit_Ver.Text;
  end else if stDataCmd = 'CV' then
  begin
    Label17.Caption:= 'Reader Ver:' + GetDeviceVersion(aData);
  end else if stDataCmd = 'RS' then //Reset
  begin
    Edit_Reset.Text:= GetDeviceData(aData);
  end else if stDataCmd = 'MC' then   //Change mode
  begin
    ComboBox_Zone.Color:= clYellow;
    RzComboBox1.Color:= ClYellow;
    st:= Copy(aData,5,2);
    if isDigit(st) then
    begin
      aIndex:=  StrtoInt(st);
      if aIndex >= ComboBox_Zone.Items.Count  then Exit;
      ComboBox_Zone.ItemIndex:= aIndex;
      ComboBox_Zone.Text:=ComboBox_Zone.Items[aIndex];
    end;

    stData := GetAlarmMode(aData);
    case stData[1] of
      'A': RzComboBox1.ItemIndex:= 0;
      'D': RzComboBox1.ItemIndex:= 1;
      'P': RzComboBox1.ItemIndex:= 2;
    end;
    RzComboBox1.Text:= RzComboBox1.Items[RzComboBox1.ItemIndex];
  end else if stDataCmd = 'RN' then
  begin
    Edit_Random.Text:= GetDeviceData(aData);
  end else if stDataCmd = 'RY' then
  begin
    aType := GetSirenType(aData);
    if aType = 'SI' then
    begin
      if aData[7] = '1' then SHowMessage('싸이렌이 ON 되었습니다.')
      else                    SHowMessage('싸이렌이 OFF 되었습니다.')
    end else if aType = 'LP'then
    begin
      if aData[7] = '1' then SHowMessage('경광등이 ON 되었습니다.')
      else                    SHowMessage('경광등이 OFF 되었습니다.')
    end else
    begin
      if isDigit(aType) then
      begin
        aRelayNo:= StrtoInt(aType);
        cb_RelayNo.ItemIndex:= aRelayNo-1;
        if aData[7] = '1' then cb_RelayOnOff.ItemIndex:= 1
        else                    cb_RelayOnOff.ItemIndex:= 0;
      end;
    end;
  end else if stDataCmd = 'Pt' then //
  begin
    edPtDelayTime.Color:= clYellow;
    edPtDelayTime.Text:= GetLinkusLineCheckStartTime(aData);
  end else if stDataCmd = 'Rd' then
  begin
   SHowMessage('전화걸기 요청 응답'+#13+ GetDeviceData(aData));
  end else if stDataCmd = 'sc' then //
  begin
    ed_SortDisp.Color:= clYellow;
    ed_SortDisp.Text:= GetDeviceData(aData);
  end else if stDataCmd = 'CD' then
  begin
    aType:= GetDataCommandType(aData);
    if aType = '00' then Label141.Caption := GetDeviceData(aData)
    else if aType = '01' then Label142.Caption := GetDeviceData(aData);
  end;
end;

{출입 통제 데이터 처리루틴}
procedure TMainForm.AccessDataProcess(aDeviceID,aData:String);
var
  st: string;
  msgCode: Char;
  stDoorNo: String;
begin

  msgCode:= GetAcMsgCode(aData);

  {ACK 응답:출입과 DOOR}
  if (msgCode <> 'a') and (msgCode <> 'b') and (msgCode <> 'c') and
     (msgCode <> 'l') and (msgCode <> 'm') and (msgCode <> 'n')
  then
  begin
    st:='Y' + Copy(aData,2,2)+'  '+'a';
    ACC_sendData(aDeviceID, st);  //Ack Send
  end;

  {출입통제 데이터 처리}
//0460K1100000400c2a51  005000000010000000009E
  case msgcode of
    'F': RcvTelEventData(aData);
    'E': RcvAccEventData(aData);
    'X': RcvAccXEventData(aData);
    'D': RcvDoorEventData(aData);
    'a': RcvSysinfo2(aData);        //기기 등록 응답
    'b': RcvSysinfo2(aData);        //기기 조회 응답
    'c': RcvAccControl(aData);      //기기 제어 응답
'l','n','m': RcvCardRegAck(aData);  //카드등록응답
's','p': RcvSch(aData);             // 스케줄 응답
    'v': RcvFoodTime(aData);        //식사시간응답
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

{펌웨에 :f 수신}
Procedure TMainForm.FirmwareProcess(aDeviceID,aData:String);
var
  aRegCode: String;
begin

  aRegCode:= GetDataCommand(aData);
  //FI:Flash Memory Map
  //FP:Flash Writer File Name
  //FD:Flash Data File Name
  //FX:Flash Start Command

  if aRegCode = 'FI' then
  begin
    IsDownLoad:= True;
    //if cb_Download.Checked = False then  ReceiveFI(aData)
    if rdMode.ItemIndex = 1 then ReceiveFI(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 응답');
  end else if aRegCode = 'FP' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash write program 응답');
  end else if aRegCode = 'FD' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash Data program 응답');
  end else if aRegCode = 'FX' then
  begin
    //if cb_Download.Checked = False then ReceiveFX(aData)
    if rdMode.ItemIndex = 1 then ReceiveFX(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash exec data 요청 응답');
  end else  if aRegCode = 'FU' then
  begin

  end else
  begin

  end;
end;

{펌웨에 :F 수신}
procedure TMainForm.FirmwareProcess2(aDeviceID,aData: String);
var
  aRegCode: String;
  Addrstr: String;
  Addr: Integer;
  stSeq : string;
begin

  aRegCode:= GetDataCommand(aData);

  if aRegCode = 'fu' then           {버젼정보 확인}
  begin
    //if (cb_Download.Checked = true) and (aFI.Version <> '' ) then
    if (rdMode.ItemIndex = 0) and (aFI.Version <> '' ) and (Not chk_Notupgrade.Checked) then
    begin
      ListBox_DownLoadInfo.Clear;
      Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
      Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
      IsDownLoad:= True;
      SendRomUpDateInfo(aDeviceID);
    end;

  end else if aRegCode = 'fi' then  {Flash Memory Map 전송}
  begin

    if aFI.FMM <> '' then
    begin
      DownloadFMM(aDeviceID);
    end else
    begin
      ShowMessage('메모리맵 데이터가 없습니다.');
      SendCancelRomUpDate(aDeviceID);
      Exit;
    end;

  end else if aRegCode = 'fp' then  { flash write program}
  begin
    if Length(aData) < 15 then stSeq := '0000'
    else stSeq := GetFlashWriteSize(aData);
    RzFieldStatus1.Caption := stSeq;
    if stSeq = '0000' then
    begin
      ProgressBar1.Position:= GetFlashWritePrograss(aData);
      ProgressBar1.Max:= ROM_FlashWrite.Count;
      if rdMode.ItemIndex = 1 then SendFPData(aDeviceID,GetFlashWritePrograss(aData))
      else if rdMode.ItemIndex = 0 then SendFPData2(aDeviceID,GetFlashWritePrograss(aData));
    end else
    begin
      ProgressBar1.Position:= GetFlashWritePrograss(aData) * strToint(stSeq);
      ProgressBar1.Max:= Length(ROM_BineryFlashWrite);
      if rdMode.ItemIndex = 1 then SendFPBineryData(aDeviceID,GetFlashWritePrograss(aData),strtoint(stSeq))
      else if rdMode.ItemIndex = 0 then SendFPBineryData2(aDeviceID,GetFlashWritePrograss(aData),strtoint(stSeq));

    end;

    //if not cb_Download.Checked then SendFPData(aDeviceID,Addr)
    //else                            SendFPData2(aDeviceID,Addr);

  end else if aRegCode = 'fd' then  {flash data program}
  begin
    Addrstr:= Copy(aData,23,7);
    Addr:= Strtoint(Addrstr);
    if Length(aData) < 15 then stSeq := '0000'
    else stSeq := copy(aData,31,4);
    if stSeq = '0000' then
    begin
      ProgressBar1.Position:= Addr;
      ProgressBar1.Max:= ROM_FlashData.Count;
      //if not cb_Download.Checked then SendFDData(aDeviceID,Addr)
      //else                            SendFDData2(aDeviceID,Addr);
      if rdMode.ItemIndex = 1 then SendFDData(aDeviceID,Addr)
      else if rdMode.ItemIndex = 0 then   SendFDData2(aDeviceID,Addr);
    end else
    begin
      ProgressBar1.Position:= Addr * strToint(stSeq);
      ProgressBar1.Max:= Length(ROM_BineryFlashData);
      if rdMode.ItemIndex = 1 then SendFDBineryData(aDeviceID,Addr,strtoint(stSeq))
      else if rdMode.ItemIndex = 0 then SendFDBineryData2(aDeviceID,Addr,strtoint(stSeq));

    end;


  end else if aRegCode = 'fx' then  {Upgrade flash exec command request}
  begin
    SendFSC(aDeviceID);
  end;

end;

{UpDate취소}
Procedure TMainForm.SendCancelRomUpDate(aDeviceID:String);
var
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
  aLength: Integer;
  i : integer;
begin

  //FPAddr:= ROM_FlashWrite.Count;
  //FDAddr:= ROM_FlashData.Count;

  CMD:= 'FU00';
  st:= CMD +'0000000'+','+ '0000000';
  //aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'F', st);

  // 2007년 10월 12일 추가
  Delay(300);
  CMD:= 'FC00';
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;
  //aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'F', CMD + ed_DeviceCode.Text + ' ---- ' + st);

  Write_ListBox_DownLoadInfo(' firmware upgrade 취소 전송');

end;


{UpDate정보 전송}
Procedure TMainForm.SendRomUpDateInfo(aDeviceID:string);
var
  FPAddr: Integer;
  FDAddr: Integer;
  CMD: string;
  st: string;
  aLength: Integer;

begin

  FPAddr:= ROM_FlashWrite.Count;
  FDAddr:= ROM_FlashData.Count;

  CMD:= 'FU00';
  st:= CMD +FillZeroNumber(FPAddr,7)+','+ FillZeroNumber(FDAddr,7);

  SendPacket(aDeviceID,'F', st);
  Write_ListBox_DownLoadInfo(' firmware upgrade 정보 전송');
end;

{ flash write program 다운로드 실행}
procedure TMainForm.SendFPData(aDeviceID:String; aNo:Integer);
var
  DeviceID: String;
  aData:String;
  st: String;

begin
  if ROM_FlashWrite.Count < 1 then
  begin
    //ShowMessage('전송할 데이터가 없습니다.');
    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  if aNo <= ROM_FlashWrite.Count then
  begin
    aData:= ROM_FlashWrite[aNo-1];
    st:= 'FP00'+aData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 write 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
  end;
end;

{flash data program 다운로드 실행:라인수 포함}
procedure TMainForm.SendFPData2(aDeviceID:String;aNo: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
begin
  if ROM_FlashWrite.Count < 1 then
  begin
    //ShowMessage('전송할 데이터가 없습니다.');
    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash write 요청번지가 0 입니다.');
    Exit;
  end;
  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  if aNo <= ROM_FlashWrite.Count then
  begin
    aData:= ROM_FlashWrite[aNo-1];
    st:= 'fP00'+FillZeroNumber(aNo,7)+aData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash write 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 write 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);

  end;
end;




{flash data program 다운로드 실행}
procedure TMainForm.SendFDData(aDeviceID:String;aNo:Integer);
var
  DeviceID: String;
  aData:String;
  st: String;
begin
  if ROM_FlashData.Count < 1 then
  begin
    //ShowMessage('전송할 데이터가 없습니다.');

    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);

    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash data 요청번지가 0 입니다.');
    Exit;
  end;
  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  if aNo <= ROM_FlashData.Count then
  begin
    aData:= ROM_FlashData[aNo-1];
    st:= 'FD00'+aData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash data 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 Data 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashData.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);

  end;
end;

{ flash write program 다운로드 실행: 라인수 포함}
procedure TMainForm.SendFDData2(aDeviceID:String; aNo: Integer);
var
  DeviceID: String;
  aData:String;
  st: String;

begin
  if ROM_FlashData.Count < 1 then
  begin

    //ShowMessage('전송할 데이터가 없습니다.');

    if MessageDlg('전송할 데이터가 없습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashWrite.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);
    Exit;
  end;

  if aNo = 0 then
  begin
    ShowMessage('flash Data 요청번지가 0 입니다.');
    Exit;
  end;

  //DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if aNo <= ROM_FlashData.Count then
  begin
    aData:= ROM_FlashData[aNo-1];
    st:= 'fD00'+FillZeroNumber(aNo,7)+aData;
    SendPacket(aDeviceID,'F',st);
    Write_ListBox_DownLoadInfo('flash Data 전송:'+InttoStr(aNo));
  end else
  begin
    if MessageDlg('요청된 번지가 잘못되었거나 Data 파일에 문제가 있습니다.'+
                  '['+InttoStr(aNo)+']/'+ InttoStr(ROM_FlashData.Count)
                  +#13+'취소 하시겠습니까?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    SendCancelRomUpDate(aDeviceID);

  end;

end;


Procedure TMainForm.PollingAck(aDeviceID: String);
var
  ACKStr: String;
  ACKStr2: String;
  aLengthStr: String;
  aKey:Integer;
  aMsgNo: Integer;
  st: string;

begin
  aLengthStr:= FillZeroNumber(BaseDataLength,3);

  ACkStr:= STX +aLengthStr+  #$20+ Msg_Ver + aDeviceID+ 'a'+Rcv_MsgNo;
  ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
  aKey:= $20;
  ACkStr2:= Copy(ACKStr,1,5)+EncodeData(aKey,Copy(ACkStr,6,Length(ACkStr)-6))+ETX;

  //WinsockPort.FlushOutBuffer;
  WinsockPort.PutString(ACKStr2);



  st:=  'Server:' +#9+
        Copy(aDeviceID,1,7)+#9+
        Copy(aDeviceID,8,2)+#9+
        //Copy(ACKStr2,17,2)+';'+
        ACKStr2[17]+#9+
        Copy(ACKStr2,19,Length(ACKStr2)-21)+#9+
        'TX'+#9+
        ACkStr2;

  if cbDisplayPolling.Checked = True then
  begin
    AddEventList(st);
  end;
end;

function TMainForm.SendPacket(aDeviceID: String;aCmd:Char; aData: String):Boolean;
var
  ErrCode: Integer;
  stSendData: String;
  aDataLength: Integer;
  aMsgNo: Integer;
  amsgData : String;
  st: string;
  stDataCommand : string;
begin

  Result := False;
  
  if DoCloseWinsock then Exit;

  if not WinsockPort.Open then
  begin
    Off_Timer.Enabled:= False;
    BroadTimer.Enabled:= False;
    BroadStopTimer.Enabled := False;
    bCardDownLoadStop := True;
    ShowMessage('통신 연결이 안되었습니다.');
    Exit;
  end;

  ErrCode:= 0;
  Result:= False;
  aDataLength:= BaseDataLength + Length(aData);

  if aCmd = 'a' then {응답 처리}
  begin
    stSendData := MakeSendData(aDeviceID,aCmd,Msg_Ver,Rcv_MsgNo,aData,aDataLength);
  end else           {제어 or 등록 }
  begin
    stSendData := MakeSendData(aDeviceID,aCmd,Msg_Ver,inttostr(Send_MsgNo),aData,aDataLength);
    if Send_MsgNo >= 9 then  Send_MsgNo:= 0
    else                     Send_MsgNo:= aMsgNo + 1;
  end;

  WinsockPort.PutString(stSendData);

  if aCmd = '*' then // 브로드캐스팅 부분때문에 데이터 처리
  begin
    stDataCommand := GetDataCommand(aData);
    if stDataCommand = 'BD' then
    begin
       if chk_BroadFile.Checked then
       begin
          BroadSaveFileList.Add(aData);
       end;
    end else
    begin
      amsgData :=  aData;
    end;
  end else  amsgData :=  aData;


  st:=  'Server:'+INttoStr(Errcode) +#9+
        copy(aDeviceID,1,Length(aDeviceID) - 2) +#9+
        copy(aDeviceID,Length(aDeviceID) - 1,2) +#9+
        aCmd + #9+
        amsgData+#9+
        //Copy(ACKStr2,19,Length(ACKStr2)-21)+#9+
        'TX' + #9+
        stSendData;

  AddEventList(st);

  Result:= True;
end;




{출입통제 Send data}
procedure TMainForm.ACC_sendData(aDeviceID:CString; aData:CString);
begin
  SendPacket(aDeviceID,'c', aData);
end;











(*
function TMainForm.SendPackettoClient(ClientThread: PNode;aDeviceID: String;
          aCmd:Char; aData: String):Boolean;
var
  ErrCode: Integer;
  ACKStr: cString;
  ACKStr2: cString;
  aDataLength: Integer;
  aLengthStr: cString;
  aKey:Integer;
  aMsgNo: Integer;
  I: Integer;
  st: string;
begin
  Result:= False;
  aDataLength:= 20 + Length(aData);
  aLengthStr:= InttoStr(aDataLength);

  if aCmd = 'a' then {응답 처리}
  begin
    ACkStr:= STX +aLengthStr+  #$20+'K1'+ aDeviceID+ aCmd+ClientThread.RcvMsgNo;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= $20;
    ACkStr2:= Copy(ACKStr,1,4)+EncodeData(aKey,Copy(ACkStr,5,Length(ACkStr)-5))+ETX;
  end else           {제어 or 등록 }
  begin
    aMsgNo:= ClientThread.SendMsgNo;
    ACkStr:= STX +aLengthStr+ #$20+'K1'+ aDeviceID+ aCmd+InttoStr(aMsgNo) +aData;
    ACkStr:= ACkStr+ MakeCSData(ACKStr+ETX)+ETX;
    aKey:= Ord(ACkStr[4]);
    ACkStr2:= Copy(ACKStr,1,4)+EncodeData(aKey,Copy(ACkStr,5,Length(ACkStr)-5))+ETX;


    if aMsgNo >= 9 then  ClientThread.SendMsgNo:= 0
    else                 ClientThread.SendMsgNo:= aMsgNo + 1;
  end;

  try
    TDXClientThread(ClientThread.Thread).Socket.Write(ACKStr2);
    {$IFDEF DEBUG}
    CodeSite.SendMsg(ACKStr2);
    CodeSite.SendMsg(toHexStr(ACKStr2));
    {$ENDIF}
    st:=  'Server:'+INttoStr(Errcode) +';'+ ACkStr2;
    AddEventList(st);

  except
    //TDXClientThread(ClientThread.Thread).Terminate;
  end;

  Result:= True;
end;
*)

{ID등록}
procedure TMainForm.RzGroup2Items0Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 0;
end;

{시스템 정보 등록}
procedure TMainForm.RzGroup2Items1Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 1;
end;

{포트정보등록}
procedure TMainForm.RzGroup2Items2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 2;
end;
{릴레이정보 등록}
procedure TMainForm.RzGroup2Items3Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 4;
end;
{원격제어}
procedure TMainForm.RzGroup2Items4Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 5;
end;
{전화관련등록}
procedure TMainForm.RzGroup2Items5Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 12;
end;

procedure TMainForm.RzGroup2Items6Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 13;
end;

procedure TMainForm.RzGroup2Items7Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 6;
end;
{임의 데이터 전송}
procedure TMainForm.RzGroup2Items8Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 15;
end;


{랜모듈 설정}
procedure TMainForm.RzGroup2ItemsClick(Sender: TObject);
begin

end;

{출입통제 등록/제어}
procedure TMainForm.RzGroup3Items0Click(Sender: TObject);
begin
  //Notebook1.ActivePage:= RzGroup3.Items[0].Caption;
  Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzGroup3Items1Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzGroup3Items2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 9;
end;





procedure TMainForm.Notebook1PageChanged(Sender: TObject);
begin
//  if Notebook1.PageIndex = 14 then  RzLabel3.Caption:=  TNoteBook(Sender).ActivePage
//  else
  RzLabel3.Caption:= '세부 등록['+ TNoteBook(Sender).ActivePage+']';

end;


Procedure TMainForm.RegID(aDeviceID: String);
begin
  SendPacket('000000000','I','ID00'+aDeviceID);
end;

procedure TMainForm.RegLocate(aDeviceID: String;aLocate:String);
var
  aNo: String[2];
begin

  aLocate:= Setlength(aLocate,16);
  aNo:= Copy(aDeviceID,8,2);
  if   Length(aDeviceID) = 9 then
  begin
    SendPacket(aDeviceID,'I','IF'+aNo+aLocate);
  end else
  begin
    SHowMessage('장비ID를  확인하세요');
  end;
end;

Procedure TMainForm.RegCR(aDeviceID: String; aReaderNo: Integer);
var
  aData: String;
  ReaderNoStr: String[2];
  I: Integer;
  bResult : Boolean;
begin
  if cb_CardType.ItemIndex = 0 then cb_CardType.ItemIndex := 1;
  bResult := RegCardReaderType(aDeviceID,cb_CardType.ItemIndex);

//
  aData:= InttoStr(ComBoBox_UseCardReader.ItemIndex)+   //리더 사용 유무
          InttoStr(ComBoBox_InOutCR.ItemIndex)+         //리더 위치
          InttoStr(ComBoBox_DoorNo.ItemIndex) +         //Door No
          Copy(ComboBox_Zone1.Text,1,2)+                //존번호
          Setlength(Edit_CRLocatge.Text,16) +           //위치명
          InttoStr(ComBoBox_Building.ItemIndex);         //건물 설치 위치

{
  aData:= InttoStr(rd_UseCardReader.ItemIndex)+   //리더 사용 유무
          InttoStr(rd_InOutCR.ItemIndex)+         //리더 위치
          InttoStr(rd_DoorNo.ItemIndex) +                         //Door No
          Copy(ComboBox_Zone1.Text,1,2)+                //존번호
          Setlength(Edit_CRLocatge.Text,16);            //위치명
}

  if Length(aDeviceID) <> 9 then
  begin
    ShowMessage('ID를 확인하세요');
    Exit;
  end;

  if Group_CardReader.ItemIndex > 0 then
  begin
    ReaderNoStr:= '0'+InttoStr(Group_CardReader.ItemIndex);
    SendPacket(aDeviceID,'I','CD'+ReaderNoStr+aData);
  end else
  begin
    for I:= 1 to 8 do
    begin
      ReaderNoStr:= '0'+InttoStr(I);
      SendPacket(aDeviceID,'I','CD'+ReaderNoStr+aData);
      Sleep(100);
      Application.ProcessMessages;
    end;
  end;


end;

Procedure TMainForm.RegSysInfo(aDeviceID: String);
var
  aData: String;
  aTime: Integer;
  bTime: Integer;
  aLinkusComType: String[1];
begin

  aTime:= SpinEdit_OutDelay.IntValue;
  bTime:= SpinEdit_inDelay.IntValue;
  if ComboBox_ComLikus.Text <> '' then aLinkusComType:= ComboBox_ComLikus.Text[1]
  else aLinkusComType:= '2';


  aData:= InttoStr(ComboBox_WatchPowerOff.ItemIndex) + // 정전감시여부
          FillZeroNumber(aTime,3)+                     // 퇴실지연시간
          InttoStr(ComboBox_DeviceType.ItemIndex)+     //예비
          InttoStr(ComboBox_DoorType1.ItemIndex)+      //문1 모드
          InttoStr(ComboBox_DoorType2.ItemIndex)+      //문2 모드
          Setlength(Edit_Locate.Text,16)+              //위치명
          FillZeroNumber(bTime,3)+                     //입실지연시간
          aLinkusComType;                              //관제통신 방식




  if  Length(aDeviceID) = 9 then
  begin
    SendPacket(aDeviceID,'I','SY00'+aData);
  end else
  begin
    SHowMessage('ID를 확인하세요');
  end;

end;

Procedure TMainForm.RegRelay(aDeviceID: String; aRelayNo: Integer);
var
  aData: String;
  aTime: String;
  RelayNoStr: String;
  I: Integer;
begin

  aData:= InttoStr(ComBoBox_Linktype1.ItemIndex)+   //연동방식
          InttoStr(ComboBox_OutType1.ItemIndex)+    //출력방식
          InttoStr(ComboBox_RenewTimer1.ItemIndex)+ //타이머
          InttoStr(ComboBox_UseType1.ItemIndex);    //릴레이 용도

  if CheckBox1.Checked then RzSpinEdit2.IntValue:= 65535;

  aTime:= FillZeroNumber(RzSpinEdit2.IntValue,5);//동작시간

  aData:= aData + aTime;

  if aRelayNo > 0 then
  begin
    RelayNoStr:= '0'+InttoStr(aRelayNo);
    SendPacket(aDeviceID,'I','RY'+RelayNoStr +aData);
  end else
  begin
    for I:= 1 to 4 do
    begin
      RelayNoStr:= '0'+InttoStr(I);
      SendPacket(aDeviceID,'I','RY'+RelayNoStr +aData);
      Sleep(100);
      application.ProcessMessages;
    end;
  end;
end;


Procedure TMainForm.RegPort(aDeviceID: String; aPortNo: Integer);
var
  aData: String;
  aFlg: String[8];
  PortStr: String[2];
  I: Integer;
begin


  aData:= Edit_PTStatus.Text +                      //상태코드
          InttoStr(ComboBox_WatchType.ItemIndex) + //감시형태
          InttoStr(ComboBox_AlarmType.ItemIndex) + //알람발생 방식
          InttoStr(ComboBox_recover.ItemIndex) +   //복구신호전송
          InttoStr(ComboBox_Delay.ItemIndex);      //지연시간 사용유무


  {램프}
  aFlg:= '00';
  if Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {싸이렌}
  aFlg:= '00';
  if Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이1}
  aFlg:= '00';
  if Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {릴레이2}
  aFlg:= '00';
  if Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동1}
  aFlg:= '00';
  if Port_Door1.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {출입문 연동2}
  aFlg:= '00';
  if Port_Door2.ItemChecked[0] then aFlg[1]:= '1';
  if Port_Door2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인램프}
  aFlg:= '00';
  if M_Port_Out1.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out1.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인싸이렌}
  aFlg:= '00';
  if M_Port_Out2.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out2.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이1}
  aFlg:= '00';
  if M_Port_Out3.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out3.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;
  {메인릴레이2}
  aFlg:= '00';
  if M_Port_Out4.ItemChecked[0] then aFlg[1]:= '1';
  if M_Port_Out4.ItemChecked[1] then aFlg[2]:= '1';
  aData:= aData + aFlg;

  {존 번호}
  if Length(Edit_PTZoneNo.Text) < 2 then Edit_PTZoneNo.Text:= '0'+Edit_PTZoneNo.Text;
  aData:= aData + Edit_PTZoneNo.Text;
  {위치정보}
  aData:= aData + Setlength(Edit_PTLocate.Text,16);

  {감지시간}

  if (ComboBox_DetectTime.Text = '') or (Isdigit(ComboBox_DetectTime.Text) = False) then
    ComboBox_DetectTime.Text:= '0400';
  aData:= aData + ComboBox_DetectTime.Text;

  if aPortNo > 0 then
  begin
    PortStr:= '0'+InttoStr(aPortNo);
    SendPacket(aDeviceID,'I','LP'+PortStr+aData);
  end else
  begin
    for I := 1 to 8 do
    begin
      PortStr:= '0'+InttoStr(I);
      SendPacket(aDeviceID,'I','LP'+PortStr+aData);
      Sleep(100);
      Application.ProcessMessages;
    end;

  end;
end;

Procedure TMainForm.RegUsedDevice(aDeviceID: String; UsedDevice:String);
begin
  SendPacket(aDeviceID,'I','EX00'+UsedDevice);
end;

Procedure TMainForm.CheckUsedDevice(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','EX00');
end;

Procedure TMainForm.RegUsedAlarmDisplay(aDeviceID: String; UsedDevice:String);
begin
  //SHowMessage(UsedDevice);
  SendPacket(aDeviceID,'I','AD00'+'0'+UsedDevice);
end;

Procedure TMainForm.CheckUsedAlarmDisplay(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','AD00');
end;



Procedure TMainForm.CheckID(aDeviceID: String);
begin
  Label_CurentIp.Color:= clWhite;
  Edit_DeviceID.Color:= clWhite;
  Edit_DeviceID.Text:= '';
  SendPacket('000000000','Q','ID000000000');

end;

procedure TMainForm.CheckLocate(aDeviceID: String);
begin
  Edit_Locate.Color:= clWhite;
  Edit_Locate.Text:= '';
  SendPacket(aDeviceID,'Q','IF00');
end;

Procedure TMainForm.CheckCR(aDeviceID: String; aReaderNo: Integer);
var
  ReaderNoStr:String;
begin

  cb_CardType.ItemIndex := 0;
  SendPacket(aDeviceID, 'Q', 'Ct00');  //카드리더종류 조회

  ComBoBox_UseCardReader.Text:= '';
  ComBoBox_InOutCR.Text:= '';
  ComBoBox_Building.Text:= '';
  ComBoBox_DoorNo.Text:= '';
  ComboBox_Zone1.ItemIndex:= 0;
  Edit_CRLocatge.Text:= '';

  if aReaderNo > 0 then
  begin
    ReaderNoStr:= '0'+IntToStr(aReaderNo);
    SendPacket(aDeviceID,'Q','CD'+ReaderNoStr);
  end else
  begin
    ShowMessage('전체 조회는 불가 합니다.');
  end;


end;

Procedure TMainForm.CheckSysInfo(aDeviceID: String);
begin
  ComboBox_WatchPowerOff.Text:= '';
  ComboBox_ComLikus.Text:= '';
  SpinEdit_OutDelay.IntValue:= 0;
  SpinEdit_InDelay.IntValue:= 0;
  ComboBox_DeviceType.Text:= '';
  ComboBox_DoorType1.Text:= '';
  ComboBox_DoorType2.Text:='';
  Edit_Locate.Text:= '';
  SendPacket(aDeviceID,'Q','SY00');
end;

Procedure TMainForm.CheckRelay(aDeviceID: String; aRelayNo: Integer);
var
  RelayNoStr: String;
begin
  COmBoBox_Linktype1.Text:= '';
  ComboBox_OutType1.Text:= '';
  ComboBox_RenewTimer1.Text:= '';
  ComboBox_UseType1.Text:= '';
  RzSpinEdit2.IntValue:= 0;
  CheckBox1.Checked:= False;
  if aRelayNo > 0 then
  begin
    RelayNoStr:= '0'+InttoStr(aRelayNo);
    SendPacket(aDeviceID,'Q','RY'+RelayNoStr);
  end else
  begin
    ShowMessage('전체 조회가 불가능합니다.');
  end;


end;

Procedure TMainForm.CheckPort(aDeviceID: String; aPortNo: Integer);
var
  PortStr: String;
Procedure ClearCheckGroup(aCheckBox:TRzCheckGroup);
var
  I:Integer;
begin
  for I:= 0 to aCHeckBox.Items.Count-1 do
  begin
    aCheckBox.ItemChecked[I]:= False;
  end;
end;

begin
  Edit_PTStatus.Text:= '';
  ComboBox_WatchType.Text:= '';
  ComboBox_AlarmType.Text:= '';
  ComboBox_recover.Text:= '';
  ComboBox_Delay.Text:= '';
  Edit_PTZoneNo.Text:= '';
  Edit_PTLocate.Text:= '';
  ClearCheckGroup(Port_Out1);
  ClearCheckGroup(Port_Out2);
  ClearCheckGroup(Port_Out3);
  ClearCheckGroup(Port_Out4);
  ClearCheckGroup(Port_Door1);
  ClearCheckGroup(Port_Door2);
  ClearCheckGroup(M_Port_Out1);
  ClearCheckGroup(M_Port_Out2);
  ClearCheckGroup(M_Port_Out3);
  ClearCheckGroup(M_Port_Out4);

  ComboBox_DetectTime.Text:= '';

  if aPortNo > 0 then
  begin
    PortStr:= '0'+InttoStr(aPortNo);
    SendPacket(aDeviceID,'Q','LP'+ PortStr);
  end else
  begin
    ShowMessage('전체 조회는 불가능 합니다.');
  end;
end;

{전화번호 등록}
procedure TMainForm.RegTellNo(aDeviceID: String; aNo: Integer;
  aTellno: String);
var
  NoStr: String[2];
  st: string;
  ReaderNo:String;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  st:= Setlength(aTellNo,20);
  ReaderNo:= cb_Reader.Text;
  SendPacket(aDeviceID,'I','TN'+ReaderNo+NoStr+st);
end;

{등록 전화번호 확인}
procedure TMainForm.CheckTellNo(aDeviceID: String; aNo: Integer);
var
  NoStr: String[2];
  ReaderNo:String;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  ReaderNo:= cb_Reader.Text;
  SendPacket(aDeviceID,'Q','TN'+ReaderNo+NoStr);
end;

{통화시간 등록}
procedure TMainForm.RegCallTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,4);
  SendPacket(aDeviceID,'I','CT01'+TimeStr);
end;
{통화시간 조회}
procedure TMainForm.CheckCallTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','CT01');
end;

{방송시간 조회}
procedure TMainForm.CheckbroadcastTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','BT01');
end;
{방송시간 등록}
procedure TMainForm.RegbroadcastTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,4);
  SendPacket(aDeviceID,'I','BT01'+TimeStr);
end;


{다이얼링 정보 등록}
procedure TMainForm.RegDialTime(aDeviceID:String;OnTime: Integer;OffTime:Integer);
var
  aTime: Integer;
  bTIme: Integer;
  Timestr: string;
begin
  aTime:= onTime div 20;
  bTime:= OffTime div 20;

  Timestr:= FillZeroNumber(aTime,2) +   // On Time
            FillZeroNumber(bTime,2);    // Off Time
  SendPacket(aDeviceID,'I','DI01'+TimeStr);

end;

{다이얼링 정보 조회}
procedure TMainForm.CheckDialTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','DI01');
end;

procedure TMainForm.RcvDeviceID(aDeviceID,aData: String);
begin
  ComboBox_IDNO.Color:= clYellow;
  Edit_CurrentID.Text:= copy(aDeviceID,1,Length(aDeviceID)-2);

  ComboBox_IDNO.ItemIndex:= 0;
  ComboBox_IDNO.Text:= ComboBox_IDNO.Items[ComboBox_IDNO.ItemIndex];
  Cnt_CheckVer(aDeviceID);
  ComboBox_IDNO.ItemIndex:=rgDeviceNo.ItemIndex;
end;

procedure TMainForm.RcvCR(aDeviceID,aData: String);
var
  st: String;
  ReaderNo : integer;
begin
  ComBoBox_UseCardReader.Color:= ClYellow;
  ComBoBox_InOutCR.Color:= ClYellow;
  ComBoBox_Building.Color:= ClYellow;
  ComBoBox_DoorNo.Color:= ClYellow;
  ComboBox_Zone1.Color:= ClYellow;
  Edit_CRLocatge.Color:= ClYellow;

  ReaderNo := GetReaderNo(aData);
  Group_CardReader.ItemIndex:= ReaderNo;
  {카드리더 사용유무}
//  st:= copy(aData,5,5); //1~2 DataCmd,3~4 Reader No
//  if not isdigit(st) then Exit;

  ComBoBox_UseCardReader.ItemIndex:= GetCardReaderUse(aData);//StrtoInt(st[1]);
  ComBoBox_UseCardReader.Text:= ComBoBox_UseCardReader.Items[ComBoBox_UseCardReader.ItemIndex];
  {카드리더 위치}
  ComBoBox_InOutCR.ItemIndex:= GetCardReaderInOut(aData); //StrtoInt(st[2]);
  {카드리더 건물위치  - 17 }
  ComBoBox_Building.ItemIndex:= GetCardReaderBuildingInOut(aData);
  //rd_InOutCR.ItemIndex:= StrtoInt(st[2]);
  ComBoBox_InOutCR.Text:= ComBoBox_InOutCR.Items[ComboBox_InOutCR.ItemIndex];
  {연동 문번호}
  ComBoBox_DoorNo.ItemIndex:= GetReaderToDoorNo(aData);// StrtoInt(st[3]);

  ComBoBox_DoorNo.Text:= ComBoBox_DoorNo.Items[ComBoBox_DoorNo.ItemIndex];
  {존번호}
  ComboBox_Zone1.ItemIndex := GetCardReaderToZoneNo(aData);// StrtoInt(Copy(st,4,2));
  {위치명}
  Edit_CRLocatge.Text:= GetCardReaderLocateName(aData);

end;

Procedure TMainForm.RcvSysinfo(aDeviceID,aData: String);
var
  st:String;
begin

//         1         2         3         4         5
//12345678901234567890123456789012345678901234567890123
//052 K1000000000i5SY001000221                000157
//                      ---------------------------
  ComboBox_WatchPowerOff.Color:= clYellow;
  ComboBox_ComLikus.Color:= clYellow;
  ComboBox_DeviceType.Color:= clYellow;
  ComboBox_DoorType1.Color:= clYellow;
  ComboBox_DoorType2.Color:= clYellow;
  Edit_Locate.Color:= clYellow;

  st:= Copy(aData,5,7);
  if not isDigit(st) then Exit;

  {정전 감시여부}
  ComboBox_WatchPowerOff.ItemIndex:= GetWatchPowerOff(aData);
  ComboBox_WatchPowerOff.Text:= ComboBox_WatchPowerOff.Items[ComboBox_WatchPowerOff.ItemIndex];
  {퇴실지연시간}
  SpinEdit_OutDelay.IntValue:= GetOutDelayTime(aData);
  {예비}
  ComboBox_DeviceType.ItemIndex:= GetSystemSpare(aData);
  ComboBox_DeviceType.Text:= ComboBox_DeviceType.Items[ComboBox_DeviceType.ItemIndex];
  {Door1 용도}
  ComboBox_DoorType1.ItemIndex:= GetDoor1Type(aData);
  ComboBox_DoorType1.Text:= ComboBox_DoorType1.Items[ComboBox_DoorType1.ItemIndex];
  {Door2 용도}
  ComboBox_DoorType2.ItemIndex:= GetDoor2Type(aData);
  ComboBox_DoorType2.Text:= ComboBox_DoorType2.Items[ComboBox_DoorType2.ItemIndex];
  {시스템 위치명}
  Edit_Locate.Text:=GetSystemLocateName(aData);
  {입실지연시간}
  SpinEdit_InDelay.IntValue:= GetInDelayTime(aData);
  {관제통신방식}
  ComboBox_ComLikus.ItemIndex:= GetComControlType(aData) - 1;
  ComboBox_ComLikus.Text:= ComboBox_ComLikus.Items[ComboBox_ComLikus.ItemIndex];

end;

Procedure TMainForm.RcvRelay(aDeviceID,aData: String);
var
  st: string;
begin
  ComBoBox_Linktype1.Color:= clYellow;
  ComboBox_OutType1.Color:= clYellow;
  ComboBox_RenewTimer1.Color:= clYellow;
  ComboBox_UseType1.Color:= clYellow;

  Group_Relay.ItemIndex:= GetRelayNo(aData);

  st:= Copy(aData,22,9);

  {릴레이 연동 방식}
  ComBoBox_Linktype1.ItemIndex:= GetRelayLinkType(aData); 
  ComBoBox_Linktype1.Text:= ComBoBox_Linktype1.Items[ComBoBox_Linktype1.ItemIndex];
  {릴레이 출력 방식}
  ComboBox_OutType1.ItemIndex:= GetRelayOutPutType(aData);
  ComboBox_OutType1.Text:= ComboBox_OutType1.Items[ComboBox_OutType1.ItemIndex];
  {TImer Renew}
  ComboBox_RenewTimer1.ItemIndex:= GetRelayTimer(aData); //StrtoInt(st[3]);
  ComboBox_RenewTimer1.Text:= ComboBox_RenewTimer1.Items[ComboBox_RenewTimer1.ItemIndex];
  {릴레이 사용방식}
  ComboBox_UseType1.ItemIndex:= GetRelayUseType(aData); //StrtoInt(st[4]);
  ComboBox_UseType1.Text:= ComboBox_UseType1.Items[ComboBox_UseType1.ItemIndex];

  {동작시간}
  if GetRelayActionTime(aData) = 65535 then
  begin
    CheckBox1.Checked:= True;
    RzSpinEdit2.IntValue:= 65535;
  end else
  begin
    CheckBox1.Checked:= False;
    RzSpinEdit2.IntValue:= GetRelayActionTime(aData);
  end;
end;

Procedure TMainForm.RcvPort(aDeviceID,aData: String);
var
  st: String;
begin
  Edit_PTStatus.Color:= clYellow;
  ComboBox_WatchType.Color:= clYellow;
  ComboBox_AlarmType.Color:= clYellow;
  ComboBox_recover.Color:= clYellow;
  ComboBox_Delay.Color:= clYellow;

  Group_Port.ItemIndex:= GetPortNo(aData);

  Edit_PTStatus.Text:= GetPortStatus(aData);

//  st:= Copy(aData,24,26);

  {감시형태}
  ComboBox_WatchType.ItemIndex:= GetPortWatchType(aData);
  ComboBox_WatchType.Text:= ComboBox_WatchType.Items[ComboBox_WatchType.ItemIndex];
  {알람 발생 방식}
  ComboBox_AlarmType.ItemIndex:= GetPortAlarmType(aData);
  ComboBox_AlarmType.Text:= ComboBox_AlarmType.Items[ComboBox_AlarmType.ItemIndex];
  {복구신호 전송 유무}
  ComboBox_recover.ItemIndex:= GetPortRecorverSignal(aData); //StrtoInt(st[3]);
  ComboBox_recover.Text:= ComboBox_recover.Items[ComboBox_recover.ItemIndex];
  {지연시간}
  ComboBox_Delay.ItemIndex:= GetPortDelayTimeUse(aData); //StrtoInt(st[4]);
  ComboBox_Delay.Text:= ComboBox_Delay.Items[ComboBox_Delay.ItemIndex];

  {램프}
  if aData[11] = '1' then Port_Out1.ItemChecked[0]:= True;
  if aData[12] = '1' then Port_Out1.ItemChecked[1]:= True;
  {싸이렌}
  if aData[13] = '1' then Port_Out2.ItemChecked[0]:= True;
  if aData[14] = '1' then Port_Out2.ItemChecked[1]:= True;
  {릴레이1}
  if aData[15] = '1' then Port_Out3.ItemChecked[0]:= True;
  if aData[16] = '1' then Port_Out3.ItemChecked[1]:= True;
  {릴레이2}
  if aData[17] = '1' then Port_Out4.ItemChecked[0]:= True;
  if aData[18] = '1' then Port_Out4.ItemChecked[1]:= True;
  {출입문 제어1}
  if aData[19] = '1' then Port_Door1.ItemChecked[0]:= True;
  if aData[20] = '1' then Port_Door1.ItemChecked[1]:= True;
 {출입문 제어2}
  if aData[21] = '1' then Port_Door2.ItemChecked[0]:= True;
  if aData[22] = '1' then Port_Door2.ItemChecked[1]:= True;
  {메인 램프}
  if aData[23] = '1' then M_Port_Out1.ItemChecked[0]:= True;
  if aData[24] = '1' then M_Port_Out1.ItemChecked[1]:= True;
  {메인 싸이렌 }
  if aData[25] = '1' then M_Port_Out2.ItemChecked[0]:= True;
  if aData[26] = '1' then M_Port_Out2.ItemChecked[1]:= True;
  {메인 릴레이1}
  if aData[27] = '1' then M_Port_Out3.ItemChecked[0]:= True;
  if aData[28] = '1' then M_Port_Out3.ItemChecked[1]:= True;
  {메인 릴레이2}
  if aData[29] = '1' then M_Port_Out4.ItemChecked[0]:= True;
  if aData[30] = '1' then M_Port_Out4.ItemChecked[1]:= True;
  {존번호}
  Edit_PTZoneNo.Text:= copy(aData,31,2);//st[25] + st[26];
  {위치명}
  Edit_PTLocate.Text:= GetPortLocateName(aData);
  {감지기 감지시간}
  ComboBox_DetectTime.Text:= GetPortDetectTime(aData); // Copy(aData,66,4);
end;

Procedure TMainForm.RcvUsedDevice(aDeviceID,aData:String);
var
  st: string;
  I: Integer;
begin
  st:= Copy(aData,5,100);

  for I:= 1 to 100 do
  begin
    if st[I] = '1' then Group_Device.ItemChecked[I-1]:= True
    else                Group_Device.ItemChecked[I-1]:= False;
    //브로드 캐스팅 부분으로 추가 됨
    if st[I] = '1' then Group_BroadDevice.ItemChecked[I-1]:= True
    else                Group_BroadDevice.ItemChecked[I-1]:= False;
    //브로드 펌웨어 다운로드 부분으로 추가 됨
    if st[I] = '1' then Group_BroadDownLoad.ItemChecked[I-1]:= True
    else                Group_BroadDownLoad.ItemChecked[I-1]:= False;

  end;
end;

Procedure TMainForm.RcvUsedAlarmdisplay(aDeviceID,aData:String);
var
  st: string;
  I: Integer;
begin
  st:= Copy(aData,5,5);
  for I:= 2 to 5 do
  begin
    if st[I] = '1' then Group_Alarmdisplay.ItemChecked[I-2]:= True
    else                Group_Alarmdisplay.ItemChecked[I-2]:= False;
  end;
end;

procedure TMainForm.RcvTellNo(aDeviceID,aData: String);
var
  st: string;
  MNo: Integer;
begin
  st:= copy(aData,5,Length(aData)-7);
  MNo:= StrtoInt(Copy(st,1,2));
  Delete(st,1,2);
  case MNo of
    0: edTelNo0.Text:= st;
    1: edTelNo1.Text:= st;
    2: edTelNo2.Text:= st;
    3: edTelNo3.Text:= st;
    4: edTelNo4.Text:= st;
    5: edTelNo5.Text:= st;
    6: edTelNo6.Text:= st;
    7: edTelNo7.Text:= st;
    8: edTelNo8.Text:= st;
    9: edTelNo9.Text:= st;
  end;
end;


procedure TMainForm.RcvCallTime(aDeviceID,aData: String);
var
  st: string;
  aTime: Integer;
begin
  RzSpinner2.Color:= ClYellow;
  st:= copy(aData,5,4);
  aTime:= StrtoInt(st);
  RzSpinner2.Value:= aTime;
end;

procedure TMainForm.RcvbroadcastTime(aDeviceID,aData: String);
var
  st: string;
  aTime: Integer;
begin
  RzSpinner4.Color:= ClYellow;
  st:= copy(aData,5,4);
  aTime:= StrtoInt(st);
  RzSpinner4.Value:= aTime;
end;


procedure TMainForm.RcvDialInfo(aDeviceID,aData: String);
var
  st: string;
  aTime: Integer;
  bTime: Integer;
begin
  ComboBox1.Color:= ClYellow;
  ComboBox2.Color:= ClYellow;
  st:= copy(aData,5,4);
  aTime:= StrtoInt(Copy(st,1,2));
  bTime:= StrtoInt(Copy(st,3,2));

  ComboBox1.Text:= InttoStr(aTime * 20);
  ComboBox2.Text:= InttoStr(bTime * 20);
end;

Procedure TMainForm.RcvWiznetInfo(aDeviceID,aData:String);
var
  I: Integer;
  st,st2: String;
  DataStr:String;
  ErrorLog: String;
  FHeader:        String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[4];
begin

  DataStr:= copy(aData,5,94);

  FHeader:=            Copy(DataStr, 1,2);
  FMacAddress:=        Copy(DataStr, 3,12);
  FMode:=              Copy(DataStr,15,2);
  FIPAddress:=         Copy(DataStr,17,8);
  FSubnet:=            Copy(DataStr,25,8);
  FGateway:=           Copy(DataStr,33,8);
  FClientPort:=        Copy(DataStr,41,4);
  FServerIP:=          Copy(DataStr,45,8);
  FServerPort:=        Copy(DataStr,53,4);
  FSerial_Baud:=       Copy(DataStr,57,2);
  FSerial_data:=       Copy(DataStr,59,2);
  FSerial_Parity:=     Copy(DataStr,61,2);
  FSerial_stop:=       Copy(DataStr,63,2);
  FSerial_flow:=       Copy(DataStr,65,2);
  FDelimiterChar:=     Copy(DataStr,67,2);
  FDelimiterSize:=     Copy(DataStr,69,4);
  FDelimitertime:=     Copy(DataStr,73,4);
  FDelimiterIdle:=     Copy(DataStr,77,4);
  FDebugMode:=         Copy(DataStr,81,2);
  FROMVer:=            Copy(DataStr,83,4);
  FOnDHCP:=            Copy(DataStr,87,2);
  FReserve:=           Copy(DataStr,89,6);

  //헤더가 aa이면 설정응답
  if FHeader = 'aa' then
  begin
    WizNetRcvACK:= True;
    Exit;
  end;

  LMDCaptionPanel1.visible := False;
  LMDSimpleLabel1.Twinkle:= False;
  Off_Timer.Enabled:= False;

  //2.MAC Address
  //RzEdit2.Text:=  FMacAddress;

  editMAC1.Color:= clYellow;
  editMAC2.Color:= clYellow;
  editMAC3.Color:= clYellow;
  editMAC4.Color:= clYellow;
  editMAC5.Color:= clYellow;
  editMAC6.Color:= clYellow;

  editMAC1.Text:= Copy(FMacAddress,1,2);
  editMAC2.Text:= Copy(FMacAddress,3,2);
  editMAC3.Text:= Copy(FMacAddress,5,2);
  editMAC4.Text:= Copy(FMacAddress,7,2);
  editMAC5.Text:= Copy(FMacAddress,9,2);
  editMAC6.Text:= Copy(FMacAddress,11,2);

  RzEdit2.Text:= editMAC1.Text +' '+
                 editMAC2.Text +' '+
                 editMAC3.Text +' '+
                 editMAC4.Text +' '+
                 editMAC5.Text +' '+
                 editMAC6.Text;


  //3.Mode (Server mode: 01, Client mode: 00)
  //if FMode = '00' then Checkbox_Client.Checked:= True
  //else               Checkbox_Client.Checked:= False;

  if FMode = '00' then RadioModeClient.Checked:= True
  else if FMode = '02' then RadioModeServer.Checked:= True
  else                      RadioModeMixed.Checked:= True;

  // 4.IP address
  st2:= '';
  st:= Hex2Ascii(FIPAddress);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_LocalIP.Text:= st2;

  // 5.Subnet mask
  st2:= '';
  st:= Hex2Ascii(FSubnet);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Sunnet.Text:= st2;

  // 6.Gateway address
  st2:= '';
  st:= Hex2Ascii(FGateway);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Gateway.Text:= st2;

  //7.Port number (Client)
  st2:= Hex2DecStr(FClientPort);
  Edit_LocalPort.Text:= st2;

  //8. Server IP address
  st2:= '';
  st:= Hex2Ascii(FServerIP);
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  //9.  Port number (Server)
  st2:= '';
  st2:= Hex2DecStr(FServerPort);
  Edit_Serverport.Text:= st2;

  //10. Serial speed (bps)
  if FSerial_Baud = 'A0' then ComboBox_Boad.ItemIndex:=0
  else if FSerial_Baud = 'D0' then ComboBox_Boad.ItemIndex:=1
  else if FSerial_Baud = 'E8' then ComboBox_Boad.ItemIndex:=2
  else if FSerial_Baud = 'F4' then ComboBox_Boad.ItemIndex:=3
  else if FSerial_Baud = 'FA' then ComboBox_Boad.ItemIndex:=4
  else if FSerial_Baud = 'FD' then ComboBox_Boad.ItemIndex:=5
  else if FSerial_Baud = 'FE' then ComboBox_Boad.ItemIndex:=6
  else if FSerial_Baud = 'FF' then ComboBox_Boad.ItemIndex:=7
  else ComboBox_Boad.ItemIndex:=-1;

  //11. Serial data size (08: 8 bit), (07: 7 bit)
  if FSerial_data = '07' then      ComboBox_Databit.ItemIndex:= 0
  else if FSerial_data = '08' then ComboBox_Databit.ItemIndex:= 1
  else                             ComboBox_Databit.ItemIndex:= -1;

  //12. Parity (00: No), (01: Odd), (02: Even)
  if FSerial_Parity = '00' then      ComboBox_Parity.ItemIndex:= 0
  else if FSerial_Parity = '01' then ComboBox_Parity.ItemIndex:= 1
  else if FSerial_Parity = '02' then ComboBox_Parity.ItemIndex:= 2
  else                               ComboBox_Parity.ItemIndex:= -1;

  //13. Stop bit
  if FSerial_stop = '01' then ComboBox_Stopbit.ItemIndex:= 0
  else                        ComboBox_Stopbit.ItemIndex:= -1;

  //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
  if FSerial_flow = '00' then ComboBox_Flow.ItemIndex:= 0
  else if FSerial_flow = '01' then ComboBox_Flow.ItemIndex:= 1
  else if FSerial_flow = '02' then ComboBox_Flow.ItemIndex:= 2
  else                             ComboBox_Flow.ItemIndex:= -1;


  //15. Delimiter char

  Edit_Char.Text:= FDelimiterChar;

  //16.Delimiter size
  st2:= '';
  st2:= Hex2DecStr(FDelimiterSize);
  Edit_Size.Text:= st2;


  //17. Delimiter time
  st2:= '';
  st2:= Hex2DecStr(FDelimitertime);
  Edit_Time.Text:= st2;

  //18.Delimiter idle time
  st2:= '';
  st2:= Hex2DecStr(FDelimiterIdle);
  Edit_Idle.Text:= st2;

  //19. Debug code (00: ON), (01: OFF)
  if FDebugMode = '00' then Checkbox_Debugmode.Checked:= True
  else                      Checkbox_Debugmode.Checked:= False;

  //20.Software major version
   st:= Hex2Ascii(FROMVer);
   RzEdit1.Text:= InttoStr(Ord(st[1]))+'.'+InttoStr(Ord(st[2]));

  // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
  if FOnDHCP = '01' then  Checkbox_DHCP.Checked:= True
  else if FOnDHCP = '00' then  Checkbox_DHCP.Checked:= False;


  ErrorLog:= '';

  if FMode <> Copy(wiznetData,15,2)then
     ErrorLog:= ErrorLog +'Mode:' +Copy(wiznetData,15,2) +'<>'+FMode+#13;
  if FIPAddress <> Copy(wiznetData,17,8) then
     ErrorLog:= ErrorLog +'IPAddress:' +Copy(wiznetData,17,8) +'<>'+FIPAddress+#13;
  if FSubnet <> Copy(wiznetData,25,8) then
     ErrorLog:= ErrorLog +'SubNet:' +Copy(wiznetData,25,8) +'<>'+FSubnet+#13;
  if FGateway <> Copy(wiznetData,33,8) then
     ErrorLog:= ErrorLog +'Gateway:' +Copy(wiznetData,33,8) +'<>'+FGateway+#13;
  if FClientPort <> Copy(wiznetData,41,4) then
     ErrorLog:= ErrorLog +'ClientPort:' +Copy(wiznetData,41,8) +'<>'+FClientPort+#13;
  if FServerIP <> Copy(wiznetData,45,8)then
     ErrorLog:= ErrorLog +'ServerIP:' +Copy(wiznetData,45,8) +'<>'+FServerIP+#13;
  if FServerPort <> Copy(wiznetData,53,4)then
     ErrorLog:= ErrorLog +'ServerPort:' +Copy(wiznetData,53,8) +'<>'+FServerPort+#13;
  if FSerial_Baud <> Copy(wiznetData,57,2)then
     ErrorLog:= ErrorLog +'Serial_Baud:' +Copy(wiznetData,57,2) +'<>'+FSerial_Baud+#13;
  if FSerial_data <> Copy(wiznetData,59,2)then
     ErrorLog:= ErrorLog +'Serial_data:' +Copy(wiznetData,59,2) +'<>'+FSerial_data+#13;
  if FSerial_Parity <> Copy(wiznetData,61,2)then
     ErrorLog:= ErrorLog +'Serial_Parity:' +Copy(wiznetData,61,2) +'<>'+FSerial_Parity+#13;
  if FSerial_stop <> Copy(wiznetData,63,2)then
     Errorlog:= Errorlog +'Serial_stop:' +Copy(wiznetData,63,2) +'<>'+FSerial_stop+#13;
  if FSerial_flow <> Copy(wiznetData,65,2)then
     Errorlog:= Errorlog +'Serial_flow:' +Copy(wiznetData,65,2) +'<>'+FSerial_flow+#13;
  if FDelimiterChar <> Copy(wiznetData,67,2)then
     Errorlog:= Errorlog +'DelimiterChar:' +Copy(wiznetData,67,2) +'<>'+FDelimiterChar+#13;
  if FDelimiterSize <> Copy(wiznetData,69,4)then
     Errorlog:= Errorlog +'DelimiterSize:' +Copy(wiznetData,69,2) +'<>'+FDelimiterSize+#13;
  if FDelimitertime <> Copy(wiznetData,73,4)then
     Errorlog:= Errorlog +'Delimitertime:' +Copy(wiznetData,73,4) +'<>'+FDelimitertime+#13;
  if FDelimiterIdle <> Copy(wiznetData,77,4)then
     Errorlog:= Errorlog +'DelimiterIdle:' +Copy(wiznetData,77,4) +'<>'+FDelimiterIdle+#13;
  if FDebugMode <> Copy(wiznetData,81,2) then
     Errorlog:= Errorlog +'DebugMode:' +Copy(wiznetData,81,4) +'<>'+FDebugMode+#13;
  {
  if FROMVer <> Copy(wiznetData,83,4)then
     Errorlog:= Errorlog +'ROMVer:' +Copy(wiznetData,83,4) +'<>'+FROMVer+#13;
  }
  if FOnDHCP <> Copy(wiznetData,87,2)then
     Errorlog:= Errorlog +'OnDHCP:' +Copy(wiznetData,87,4) +'<>'+FOnDHCP;
  if FReserve <> Copy(wiznetData,89,6) then
  if (Errorlog <> '') and (WizNetRegMode = True) then
  begin
     Errorlog:= '설정값과 응답값이 틀립니다.' +#13+
                 '==========================='+#13+
                 '  설정값 < ===== > 응답값  '+#13+
                 '==========================='+#13+
                  Errorlog;
     SHowMessage(Errorlog);
  end else
  begin
    //SHowMessage('설정/조회 완료 되었습니다..');
  end;


  (*
  if (wiznetData <> DataStr) and (WizNetRegMode = True) then
  begin
    ShowMessage('설정값과 응답값이 틀립니다.'+#13+'설정데이터:'+wiznetdata+#13+'응답데이터:'+DataStr);
  end else
  begin
    SHowMessage('설정/조회 완료 되었습니다..');
  end;
    *)
end;



Procedure TMainForm.Cnt_TimeSync(aDeviceID: String; aTimeStr:String);
begin
  SendPacket(aDeviceID,'R','TM00'+aTimeStr);
end;

Procedure TMainForm.Cnt_CheckVer(aDeviceID: String);
begin
  SendPacket(aDeviceID,'R','VR00');
end;

{리더버젼확인}
procedure TMainForm.Cnt_CheckCdVer(aDeviceID:String; aReaderNo: Integer);
var
  aNo: String;
begin
  aNo:= '0'+InttoStr(aReaderNo);
  SendPacket(aDeviceID,'R','CV'+aNo);
end;


Procedure TMainForm.Cnt_Reset(aDeviceID:String);
begin
  SendPacket(aDeviceID,'R','RS00Reset');
end;

Procedure TMainForm.Cnt_ClearRegister(aDeviceID:String);
begin
  SendPacket(aDeviceID,'I','ac00Register Clear');
end;


Procedure TMainForm.Cnt_ChangeMode(aDeviceID:String; aZoneNo:Integer; aMode:Char);
var
  aZone: String[2];
begin
  aZone:= FillZeroNumber(aZoneNo,2);
  SendPacket(aDeviceID,'R','MC'+aZone+aMode);
end;

Procedure TMainForm.Cnt_Random(aDeviceID:String; onOn:Boolean; aTime:Integer);
var
  TimeStr: String[3];
begin
  if onOn then
  begin
    SendPacket(aDeviceID,'R','rn00random on')
  end else
  begin
    TimeStr:= FillZeroNumber(aTime,3);
    SendPacket(aDeviceID,'R','rn00random off '+TimeStr);
  end;
end;

Procedure TMainForm.Cnt_USerCMD(aDeviceID:String; aData: String);
begin
  SendPacket(aDeviceID,'c',aData);
end;

/// 출입통제 제어/등록 ////////////////////////////////////////////////////////

procedure TMainForm.RegSch(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'S' +                                        //MSG Code
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+          //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +             // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          copy(edSch1.Text,1,4)+edSch1.Text[6]+       //구간1
          copy(edSch2.Text,1,4)+edSch2.Text[6]+      //구간2
          copy(edSch3.Text,1,4)+edSch3.Text[6]+      //구간3
          copy(edSch4.Text,1,4)+edSch4.Text[6]+      //구간4
          copy(edSch5.Text,1,4)+edSch5.Text[6];      //구간5

   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData);

end;

Procedure TMainForm.CheckSch(aDeviceID:String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'P' +                                    //MSG Code
          //IntToStr(Send_MsgNo)+                 //Msg Count
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+      //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +         // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          '00000000000000000000000';              //조회는 전체를 '0'으로 마킹
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  ACC_sendData(DeviceID, aData);

end;

procedure TMainForm.RegSysInfo2(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'A' +                                        //MSG Code
          //IntToStr(Send_MsgNo)+                         //Msg Count
          '0'+

          IntToStr(gbDoorNo.ItemIndex+1)+       //문번호

          #$20 + #$20 +                                 // Record count
          InttoStr(ComboBox_CardModeType.ItemIndex) +   //카드운영모드
          InttoStr(ComboBox_DoorModeType.ItemIndex) +   //출입문 운영모드
          InttoStr(RzSpinEdit4.IntValue)            +   //Door제어 시간
          InttoStr(RzSpinEdit5.IntValue)            +   //장시간 열림 경보
          InttoStr(ComboBox_UseSch.ItemIndex)       +   //스케줄 적용유무
          InttoStr(ComboBox_SendDoorStatus.ItemIndex)+  //출입단독 사용유무
          InttoStr(ComboBox_UseCommOff.ItemIndex)   +   //통신이상시 기기운영
          //#$FF+                                         //분실카드 추적 기능(기능삭제)
          InttoStr(ComboBox_AntiPass.ItemIndex      )+   //AntiPassBack
          InttoStr(ComboBox_AlarmLongOpen.ItemIndex)+   //장시간 열림 부저출력
          InttoStr(ComboBox_AlramCommoff.ItemIndex) +   //통신 이상시 부저 출력
          InttoStr(ComboBox_LockType.ItemIndex)     +   //전기정 타입
          InttoStr(ComboBox_ControlFire.ItemIndex)  +   //화재 발생시 문제어
          InttoStr(ComboBox_CheckDSLS.ItemIndex)    +   //DS LS 검사
          '0000000';
          //#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff+#$ff;      //예비
   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData);
   (*
   Sleep(100);
   aData:=  #90 +
            IntToStr(Send_MsgNo)+                         //Msg Count
            IntToStr(ComboBox_DoorNo2.ItemIndex+1)+
            '  '+#$80;
   ACC_sendData(DeviceID, aData);
   *)

end;

procedure TMainForm.EmptySysinfo2;
begin
  //ComboBox_DoorNo2.ItemIndex:= 0;
  ComboBox_CardModeType.ItemIndex:= 0;
  ComboBox_DoorModeType.ItemIndex:= 0;
  RzSpinEdit4.Text:= '0';
  RzSpinEdit5.Text:= '0';
  ComboBox_UseSch.ItemIndex:= 0;
  ComboBox_SendDoorStatus.ItemIndex:= 0;
  ComboBox_UseCommOff.ItemIndex:= 0;
  ComboBox_AlramCommoff.ItemIndex:= 0;
  ComboBox_AntiPass.ItemIndex:= 0;
  ComboBox_AlarmLongOpen.ItemIndex:= 0;
  ComboBox_LockType.ItemIndex:= 0;
  ComboBox_ControlFire.ItemIndex:= 0;
  ComboBox_CheckDSLS.ItemIndex:= 0;
end;

procedure TMainForm.CheckSysInfo2(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'B' +                                     //MSG Code
          //IntToStr(Send_MsgNo)+                      //Msg Count
          '0'+
          IntToStr(gbDoorNo.ItemIndex+1)+    //문번호
          #$20 + #$20 +
          '00000000000000000000';                    //조회는 전체를 '0'으로 마킹
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  ACC_sendData(DeviceID, aData);
  EmptySysinfo2;
end;

Procedure TMainForm.RcvSysinfo2(aData: String);
var
aNo: Integer;
begin
//         1         2
//123456789012345678901234567
//a11  0040000000100000000095
  {기기 문번호}

  //ComboBox_DoorNo2.Color:= clYellow;
  ComboBox_CardModeType.Color:= clYellow;
  ComboBox_DoorModeType.Color:= clYellow;
  ComboBox_UseSch.Color:= clYellow;
  ComboBox_SendDoorStatus.Color:= clYellow;
  ComboBox_UseCommOff.Color:= clYellow;
  ComboBox_AntiPass.Color:= clYellow;
  ComboBox_AlarmLongOpen.Color:= clYellow;
  ComboBox_AlramCommoff.Color:= clYellow;
  ComboBox_LockType.Color:= clYellow;
  ComboBox_ControlFire.Color:= clYellow;
  ComboBox_CheckDSLS.Color:= clYellow;


  if aData[3] >= #$30 then
  begin
    aNo:= StrtoInt(aData[3]);
    gbDoorNo.ItemIndex:= aNo -1;
    //ComboBox_DoorNo2.Text:= ComboBox_DoorNo2.Items[ComboBox_DoorNo2.ItemIndex];
  end;
  {카드운영모드}
  if aData[6] >= #$30 then
  begin
    aNo:= StrtoInt(aData[6]);
    ComboBox_CardModeType.ItemIndex:= aNo;
    ComboBox_CardModeType.Text:= ComboBox_CardModeType.Items[ComboBox_CardModeType.ItemIndex];
  end;
  {출입문 운영모드}
  if aData[7] >= #$30 then
  begin
    aNo:= StrtoInt(aData[7]);
    ComboBox_DoorModeType.ItemIndex:= aNo;
    ComboBox_DoorModeType.Text:= ComboBox_DoorModeType.Items[ComboBox_DoorModeType.ItemIndex];
  end;
  {DOOR제어시간}
  if aData[8] >= #$30 then
  begin
   RzSpinEdit4.Text:= aData[8];
  end;
  {장시간 열림 경보}
  if aData[9] >= #$30 then
  begin
   RzSpinEdit5.Text:= aData[9];
  end;
  {스케줄 적용 여부}
  if aData[10] >= #$30 then
  begin
   aNo:= StrtoInt(aData[10]);
   ComboBox_UseSch.ItemIndex:= aNo;
   ComboBox_UseSch.Text:= ComboBox_UseSch.Items[ComboBox_UseSch.ItemIndex];
  end;
  {출입문 상태 전송}
  if aData[11] >= #$30 then
  begin
   aNo:= StrtoInt(aData[11]);
   ComboBox_SendDoorStatus.ItemIndex:= aNo;
   ComboBox_SendDoorStatus.Text:= ComboBox_SendDoorStatus.Items[ComboBox_SendDoorStatus.ItemIndex];
  end;
  {통신 이상시 기기운영 }
  if aData[12] >= #$30 then
  begin
   aNo:= StrtoInt(aData[12]);
   ComboBox_UseCommOff.ItemIndex:= aNo;
   ComboBox_UseCommOff.Text:= ComboBox_UseCommOff.Items[ComboBox_UseCommOff.ItemIndex];
  end;
  {Antipassback}
  if aData[13] >= #$30 then
  begin
   aNo:= StrtoInt(aData[13]);
   ComboBox_AntiPass.ItemIndex:= aNo;
   ComboBox_AntiPass.Text:= ComboBox_AntiPass.Items[ComboBox_AntiPass.ItemIndex];
  end;

  {장시간 열림 부저 출력}
  if aData[14] >= #$30 then
  begin
   aNo:= StrtoInt(aData[14]);
   ComboBox_AlarmLongOpen.ItemIndex:= aNo;
   ComboBox_AlarmLongOpen.Text:= ComboBox_AlarmLongOpen.Items[ComboBox_AlarmLongOpen.ItemIndex];
  end;

  {통신 이상시 부저 출력}
  if aData[15] >= #$30 then
  begin
   aNo:= StrtoInt(aData[15]);
   ComboBox_AlramCommoff.ItemIndex:= aNo;
   ComboBox_AlramCommoff.Text:= ComboBox_AlramCommoff.Items[ComboBox_AlramCommoff.ItemIndex];
  end;
  {전기정 타입}
  if aData[16] >= #$30 then
  begin
   aNo:= StrtoInt(aData[16]);
   ComboBox_LockType.ItemIndex:= aNo;
   ComboBox_LockType.Text:= ComboBox_LockType.Items[ComboBox_LockType.ItemIndex];
  end;
  {화재 발생시 문제어}
  if aData[17] >= #$30 then
  begin
   aNo:= StrtoInt(aData[17]);
   ComboBox_ControlFire.ItemIndex:= aNo;
   ComboBox_ControlFire.Text:= ComboBox_ControlFire.Items[ComboBox_ControlFire.ItemIndex];
  end;

  {DS LS 검사}
  if aData[18] >= #$30 then
  begin
   aNo:= StrtoInt(aData[18]);
   ComboBox_CheckDSLS.ItemIndex:= aNo;
   ComboBox_CheckDSLS.Text:= ComboBox_CheckDSLS.Items[ComboBox_CheckDSLS.ItemIndex];
  end;
  //SHowMessage(aData);
end;


Procedure TMainForm.RcvSch(aData: String);
var
  aCode: Integer;
begin
  aCode:= StrtoInt(aData[5]);
  rgSchCode.ItemIndex:= aCode;
  edSch1.Text:= Copy(aData,6,4)+ ' '+Copy(aData,10,1);
  edSch2.Text:= Copy(aData,11,4)+ ' '+Copy(aData,15,1);
  edSch3.Text:= Copy(aData,16,4)+ ' '+Copy(aData,20,1);
  edSch4.Text:= Copy(aData,21,4)+ ' '+Copy(aData,25,1);
  edSch5.Text:= Copy(aData,26,4)+ ' '+Copy(aData,30,1);
end;

//식사시간등록
procedure TMainForm.RegFoodTime(aDeviceID: String);
var
  aData: String;
  DeviceID: String;
begin
  aData:= 'V' +                                        //MSG Code
          '0'+
          IntToStr(rgSchDoorNo.ItemIndex+1)+          //문번호
          #$20 +
          IntToStr(rgSchCode.ItemIndex) +             // 요일코드 0.평일 1.반휴일 2.일요일 3.특정일
          edFood1.Text +'1'+                          //조식
          edFood2.Text +'2'+                          //중식
          edFood3.Text +'3'+                          //석식
          edFood4.Text+'4';                           //야식

   DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
   ACC_sendData(DeviceID, aData);

end;

//식사시간응답
procedure TMainForm.RcvFoodTime(aData: String);
var
  aCode: Integer;
begin
  aCode:= StrtoInt(aData[5]);
  rgSchCode.ItemIndex:= aCode;
  edFood1.Text:= Copy(aData,6,4);
  edFood2.Text:= Copy(aData,11,4);
  edFood3.Text:= Copy(aData,16,4);
  edFood4.Text:= Copy(aData,21,4);
end;



procedure TMainForm.RcvAccControl(aData: String);
var
  st:String;
begin
//a11  0040000000100000000095

  st:='';
  if aData[6] = '0' then st:= 'POSITIVE:'
  else                   st:= 'NEGATIVE:';

  if aData[7] = '0' then st:= st + '운영모드:'
  else if aData[7] = '1' then st:= st + '개방모드:'
  else if aData[7] = '2' then st:= st + '폐쇄모드:'
  else                   st:= st + aData[7] + ':';

  if aData[8] = 'O' then st:= st + '열림상태:'
  else                   st:= st + '닫힘태:';

  lbDoorControl.Caption:= st+aData;
 (*
  case aData[5] of
    '0':begin
          //SHowMessage(aData);
          st:='';
          if aData[6] = '0' then st:= 'POSITIVE:'
          else                   st:= 'NEGATIVE:';

          if aData[7] = '0' then st:= st + '운영모드:'
          else                   st:= st + '개방모드:';

          if aData[8] = 'O' then st:= st + '열림상태:'
          else                   st:= st + '닫힘태:';

          lbDoorControl.Caption:= st+aData;


        end;
    '1':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '카드운영모드:POSITIVE로 변경:'+aData
            //ShowMessage('카드운영모드'+#13+'POSITIVE로 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '카드운영모드:NEGATIVE로 변경:'+aData;
            //ShowMessage('카드운영모드'+#13+'NEGATIVE로 변경'+#13+aData);
        end;
    '2':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '출입운영모드:운영모드로 변경:'+aData
            //ShowMessage('출입운영모드'+#13+'운영모드로 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '출입운영모드:개방모드로 변경:'+aData;
            //ShowMessage('출입운영모드'+#13+'개방모드로 변경'+#13+aData);
        end;
    '3':begin
          if aData[6] = '0' then
            lbDoorControl.Caption:= '원격제어:시정 변경:'+aData
            //ShowMessage('원격제어'+#13+'시정 변경'+#13+aData)
          else
            lbDoorControl.Caption:= '원격제어:해정 변경:'+aData;
            //ShowMessage('원격제어'+#13+'해정 변경'+#13+aData);
        end;
  end;
 *)
end;


procedure TMainForm.RcvAccEventData(aData:String);
var
  st: String;
  aCardNo: String;
  bCardNo: String;
  DeviceID: String;
  NoStr: String;
  i : Integer;
begin
  {1.시간}
  st:= Copy(aData,6,2)+'-'+
       Copy(aData,8,2)+'-'+
       Copy(aData,10,2)+' '+
       Copy(aData,12,2)+':'+
       Copy(aData,14,2)+':'+
       Copy(aData,16,2)+';';
  {2.문번호}
  st:= st + aData[3]+';';

  {3.Posi/Nega}
  case aData[18] of
    '0': st:=st + 'Positive;';
    '1': st:= st + 'Negative;';
    else   st:= st+ aData[18];
  end;
  {4.운영모드}
  case aData[19] of
    '0': st:= st+'운영모드;';
    '1': st:= st+'개방모드;';
    '2': st:= st+'폐쇄모드;';
    else   st:= st+aData[19]+ ';';
  end;
  {5.변경사유}
  case aData[20] of
    'C': st:= st + '카드;';
    'P': st:= st + '전화;';
    'R': st:= st + '원격제어;';
    'B': st:= st + '버튼;';
    'S': st:= st + '스케쥴;';
    else st:= st + aData[20];
  end;
  {6.출입승인결과}
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
  {7.출입문 상태}
  case aData[22]of
    'C': st:= st +'닫힘;';
    'O': st:= st +'열림;';
    else st:= st +aData[22];
  end;
  {8.카드번호/출입번호}

  //aCardNo:= copy(aData,24,8);
  aCardNo:= copy(aData,26,8);  //카드번호 10자리 수정(현재 앞 00 두바이트 사용 안함)
  //bCardNo:= Hex2Dec64(aCardNo);
  //st:= st + FillZeroNumber2(bCardNo,10);

  bCardNo:= DecodeCardNo(aCardNo);
  st:= st+ bCardNo;//+ '000000';
  //st:= st + DecodeCardNo(aCardNo);
  NoStr:= InttoStr(CountCardReadData);
  st:= NoStr + ' ;'+st;
  st := st + ' ;' + Dec2Hex64(StrtoInt64(bCardNo),8);

  RzFieldStatus1.Caption := stringReplace(st,';','   ',[rfReplaceAll]);
  LMDListBox1.Items.Add(st);
  //LMDListBox1.Selected[LMDListBox1.ItemIndex]:= True;
  for i := 0 to LMDListBox1.Count-1 do
  begin
     if LMDListBox1.Selected[i] then LMDListBox1.Selected[i]:= False;
  end;
  LMDListBox1.Selected[LMDListBox1.Count-1]:= True;


  Inc(CountCardReadData);
  LMDListBox1.ItemIndex:= LMDListBox1.Items.Count -1;


   // 자동 등록 모드이면...
  if cbAutoReg.Checked = True then
  begin
    DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    //메모장에 등록
    Append_Memo_CardNo(bCardNo);
    // 다운로드
    CD_DownLoad(DeviceID,bCardNo+'000000' ,'L');

  end;

  {
  // 미등록 데이터이면....
  if (aData[21] = #$41) or (aData[21] = #$43) then
  begin
    // 자동 등록 모드이면...
    if cbAutoReg.Checked = True then
    begin
      DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
      //메모장에 등록
      Append_Memo_CardNo(bCardNo);
      // 다운로드
      CD_DownLoad(DeviceID,bCardNo+'000000' ,'L');

    end;
  end;
  }
end;



procedure TMainForm.RcvDoorEventData(aData:String);
begin

end;

procedure TMainForm.RcvCardRegAck(aData:String);
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

  aMsg:= aMsg + DeCodeCardNo(aCardNo)+ ':';
  aMsg:= aMsg + Copy(aData,17,6)+':';

  LinkusNo:= Copy(aData,4,3);
  aMsg:= aMsg + Hex2DecStr(LinkusNo)+':';

  case aData[23] of
    '0': aMsg:= aMsg +'0'+':';
    '1': aMsg:= aMsg +'미등록'+':';
    '2': aMsg:= aMsg +'  등록'+':';
  end;

  case aData[24] of
    '0': aMsg:= aMsg +'출입';
    '1': aMsg:= aMsg +'방범';
    '2': aMsg:= aMsg +'출입방범';
  end;

  Memo2.Lines.Add(aMsg);


end;

{전화 사용 이벤트 처리}
procedure TMainForm.RcvTelEventData(accData: String);
var
  st: string;
begin
  Memo1.Lines.Add(accData);
  st:= ToHexStr(accData);
  Memo1.Lines.Add(st);


end;



Procedure TMainForm.DoorModeChange(DeviceID: String;  aMode:Char);
var
  st: string;
begin

  st:= #$32 +
       //IntToStr(Send_MsgNo)+                      //Msg Count
       '0'+
       InttoStr(gbDoorNo2.ItemIndex +1)+
       //ComboBox_DoorNo3.Text[1]+
       '  '+
       aMode; //'0':운영 ,'1':개방

  ACC_sendData(DeviceID, st);
end;

procedure TMainForm.DoorControl(DeviceID: String; aNo:Integer; aControlType,
  aControl: Char);
var
  st: string;
begin

  st:= 'C' +
       //IntToStr(Send_MsgNo)+                       //Msg Count
       '0'+
       InttoStr(aNo)+                             //기기내 문번호
       '0'+
       aControlType+                              //'0':해당사항없음,'1':카드운영,'2':출입운영,'3':원격제어
       aControl;                                  // 카드운영:Positive:'0',Negative:'1'
                                                  // 출입운영:'0':운영 ,'1':개방
                                                  // 원격제어:'0':시정,'1':해정
  ACC_sendData(DeviceID, st);
end;






{등록}
procedure TMainForm.RegClick(Sender: TObject);
var
  DeviceID: String;
//  bResult : Boolean;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  Case Notebook1.PageIndex of
    0: RegID(Edit_DeviceID.Text);
    1: begin
         if Sender = RzBitBtn7 then RegSysInfo(DeviceID)
         else if Sender = RzBitBtn5 then RegCR(DeviceID,Group_CardReader.ItemIndex);
       end;
    2: RegPort(DeviceID,Group_Port.ItemIndex);
    3: begin RegSch(DeviceID); end;
    4: RegRelay(DeviceID,Group_Relay.ItemIndex);
  else SHowMessage('선택된 메뉴 번호가 없습니다.');
  end;
end;

{조회}
procedure TMainForm.btnCheck(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  Case Notebook1.PageIndex of
    0: CheckID(DeviceID);
    1: begin
         if sender = RzBitBtn8 then CheckSysInfo(DeviceID);
         if Sender = RzBitBtn6 then CheckCR(DeviceID,Group_CardReader.ItemIndex);
       end;
    2: CheckPort(DeviceID,Group_Port.ItemIndex);
    3: begin CheckSch(DeviceID) end;
    4: CheckRelay(DeviceID,Group_Relay.ItemIndex);
    else SHowMessage('선택된 메뉴 번호가 없습니다.');
  end;
end;

procedure TMainForm.Edit_DeviceIDMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 TEdit(Sender).Color:= clWhite;
end;


procedure TMainForm.M_CloseClick(Sender: TObject);
begin
  M_Close.Enabled := False;
  Close;
end;

{시간동기화}
procedure TMainForm.Btn_SyncTimeClick(Sender: TObject);
var
  TimeStr: String;
begin
  TimeStr:= FormatDatetime('yyyymmddhhnnss',Now);
  Cnt_TimeSync(Edit_CurrentID.Text + ComboBox_IDNO.Text,TimeStr);
  Edit_TimeSync.Text:= '';
end;

{버젼 확인}
procedure TMainForm.RzBitBtn13Click(Sender: TObject);
begin
  Cnt_CheckVer(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Ver.Text:= '';
  Edit_TopRomVer.Text:= '';
end;



{리셋}
procedure TMainForm.RzBitBtn14Click(Sender: TObject);
begin
  Cnt_Reset(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Reset.Text:= '';
end;

{모드변경}
procedure TMainForm.RzBitBtn15Click(Sender: TObject);
var
  aMode:Char;
begin
  aMode:= ' ';
  ComboBox_Zone.Color:= clWhite;
  RzComboBox1.Color:= ClWhite;

  Case RzComboBox1.ItemIndex of
    0: aMode:= 'A';  //경비모드
    1: aMode:= 'D';  //해제모드
    2: aMode:= 'P';  //순회모드
  end;

  Cnt_ChangeMode(Edit_CurrentID.Text + ComboBox_IDNO.Text,
                 ComboBox_Zone.ItemIndex,
                 aMode);
end;








{암호화 사용}
procedure TMainForm.RzBitBtn16Click(Sender: TObject);
begin
  if RzComboBox2.ItemIndex  = 0 then
  begin
    Cnt_Random(Edit_CurrentID.Text + ComboBox_IDNO.Text,
               False,
               RzSpinEdit3.IntValue);
  end else
  begin
    Cnt_Random(Edit_CurrentID.Text + ComboBox_IDNO.Text,
               True,
               RzSpinEdit3.IntValue);
  end;
end;
{사용자 정의 명령어 }
procedure TMainForm.RzBitBtn17Click(Sender: TObject);
begin
  Cnt_USerCMD(Edit_CurrentID.Text + ComboBox_IDNO.Text,Edit_CMD1.Text);

end;

procedure TMainForm.btn_ConnectClick(Sender: TObject);
var
  aTCP: String;
  aIndex: Integer;
  aDir: String;
begin
//  DBISAMQuery1.Active := True;
  //Server.Open;
  with WinsockPort do
  begin
    if RzRadioGroup1.ItemIndex = 0 then
    begin
      DeviceLayer:= dlWinsock;
      wsAddress:= CB_IPList.Text;
      wsPort:=    Edit2.Text;
      Rcv_MsgNo:='0';
      Send_MsgNo:= 0;
      ComBuff:= '';
      ApdSLController1.Monitoring:= True;
      OPen:= False;
      Sleep(100);


      aIndex:= CB_IPList.Items.IndexOf(wsAddress);
      if aIndex < 0 then
      begin
        if CB_IPList.Items.Count >= 20 then CB_IPList.Items.Delete(19);
        CB_IPList.Items.Insert(0,wsAddress);
      end;

      aDir:= ExtractFileDir(Application.ExeName);
      aDir:= aDir +'\iplist.ini';
      CB_IPList.Items.SaveToFile(adir);


      if RadioGroup_Mode.ItemIndex < 1 then
      begin
        wsMode:= wsClient;
      end else
      begin
        wsMode:= wsServer;
        Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속대기중';
      end;
      OPen:= True;
      StopConnection:= False;

      aTCP:= CB_IPList.Text+ ','+ Edit2.Text;
      LMDIniCtrl1.WriteString('설정','TCP',aTCP);
      LMDIniCtrl1.WriteInteger('설정','TCPMode',RadioGroup_Mode.ItemIndex);


    end else
    begin
      DeviceLayer:= dlWin32;
      Baud:= 38400;
      WinsockPort.ComNumber:=  StrtoInt(CB_SerialComm.Text[4]);
      try
        ApdSLController1.Monitoring:= True;
        OPen:= True;
      except
        ShowMessage('통신포트 를 확인하세요');
        Exit;
      end;
      Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결대기';
      LMDIniCtrl1.WriteInteger('설정','ComNo',CB_SerialComm.ItemIndex);
      Delay(100);
      CheckID('0000000');


    end;

  end;



end;

procedure TMainForm.Btn_DisConnectClick(Sender: TObject);
begin
  StopConnection:= True;
  Polling_Timer.Enabled:= False;
  Off_Timer.Enabled:= False;

  WinsockPort.OPen:= False;

  if RzRadioGroup1.ItemIndex = 1 then
    Panel_ActiveClinetCount.Caption:=  'Com'+ CB_SerialComm.Text[4] + ' 연결해제'
  else
    Panel_ActiveClinetCount.Caption:=  CB_IPList.Text + ' 연결해제'
end;

{}
procedure TMainForm.WinsockPortWsConnect(Sender: TObject);
var
  st: string;
begin
  SockErroCode:= 0;
  Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 접속';
  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        ''+#9+
        '<==== Connected :'+CB_IPList.Text;
  AddEventList(st);

  //btn_Connect.Color:= $00F48D6A;
  //Btn_DisConnect.Color:= $00F0F4F4;
  CheckID('0000000');



end;

procedure TMainForm.WinsockPortWsDisconnect(Sender: TObject);
var
  st: string;
begin

  if ReconnectSocketTimer.Enabled then exit; // only do once



  if cbPolling.Checked then
  begin
   Polling_Timer.Enabled:= False;
   cbPolling.Checked:= False;
  end;


  Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 해제';
  //btn_Connect.Color:= $00F0F4F4;
  //Btn_DisConnect.Color:= $003CC7FF;

  st:=  '' +#9+
        '' +#9+
        '' +#9+
        '' +#9+
        '' +#9 +
        '' +#9 +
        '====>Disconnected: '+CB_IPList.Text;
  AddEventList(st);

  //Btn_DisConnectClick(Self);

  if StopConnection then Exit;

  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;


end;

procedure TMainForm.WinsockPortWsError(Sender: TObject; ErrCode: Integer);
var
  st:string;
begin

  if ReconnectSocketTimer.Enabled then exit; // only do once


  if SockErroCode <> ErrCode then
  begin
    SockErroCode:= ErrCode;
    Panel_ActiveClinetCount.Caption:= CB_IPList.Text + ' 접속 에러['+InttoStr(ErrCode)+']';
    st:=  '' +#9+
          '' +#9+
          '' +#9+
          '' +#9+
          ''+#9+
          ''+#9+
          '====> Error:'+InttoStr(ErrCode);
    AddEventList(st);
  end;
  if cbPolling.Checked then
  begin
   Polling_Timer.Enabled:= False;
   cbPolling.Checked:= False;
  end;

  if StopConnection then Exit;
  
  DoCloseWinsock := true;
  ReconnectSocketTimer.Enabled := true;

  //btn_Connect.Color:= $00F0F4F4;
  //Btn_DisConnect.Color:= $003CC7FF;
end;


procedure TMainForm.WinsockPortTriggerAvail(CP: TObject; Count: Word);
var
  st: string;
  st2: String;
  st3: String;
  aIndex: Integer;
  I: Integer;
  Lenstr:String;
  DataLength: Integer;
begin
  st:= '';

  for I := 1 to Count do st := st + WinsockPort.GetChar;

  if OnMoni then PrintLog(st);

  
  ComBuff:= ComBuff + st;
  aIndex:= Pos(STX,ComBuff);  // STX 위치를 확인 한다.
  if aIndex = 0 then Exit    // STX가 없으면 루틴에서 나간다.
  else if aIndex > 1 then
  begin
    //SHowMessage(ComBuff);
    Delete(ComBuff,1,aIndex-1);  //STX위치가 1아니면 STX앞까지 삭제
  end;
  if Length(Combuff) < 21 then Exit;
  repeat
    st3:= CheckDataPacket(ComBuff,st2);

    ComBuff:= st2;
    if st <> '' then DataPacektProcess(st3);
  until pos(ETX,comBuff) = 0;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if WinsockPort.Open then WinsockPort.Open:= False;
  //DelayTicks( 9, true); // Give the com port time to shut down before we destroy it.
  LMDIniCtrl1.WriteString('설정','SEND1',ToHexStr(Edit_Send1.Text));
  LMDIniCtrl1.WriteString('설정','SEND2',ToHexStr(Edit_Send2.Text));
  LMDIniCtrl1.WriteString('설정','SEND3',ToHexStr(Edit_Send3.Text));
  LMDIniCtrl1.WriteString('설정','SEND4',ToHexStr(Edit_Send4.Text));
  LMDIniCtrl1.WriteString('설정','SEND5',ToHexStr(Edit_Send5.Text));
  LMDIniCtrl1.WriteString('설정','SEND6',ToHexStr(Edit_Send6.Text));
  LMDIniCtrl1.WriteString('설정','SEND7',ToHexStr(Edit_Send7.Text));
  LMDIniCtrl1.WriteString('설정','SEND8',ToHexStr(Edit_Send8.Text));
  LMDIniCtrl1.WriteString('설정','SEND9',ToHexStr(Edit_Send9.Text));
  LMDIniCtrl1.WriteString('설정','SEND0',ToHexStr(Edit_Send0.Text));
  LMDIniCtrl1.WriteString('설정','SENDA',ToHexStr(Edit_SendA.Text));
  LMDIniCtrl1.WriteString('설정','SENDB',ToHexStr(Edit_SendB.Text));
  LMDIniCtrl1.WriteString('설정','SENDC',ToHexStr(Edit_SendC.Text));
  LMDIniCtrl1.WriteString('설정','SENDD',ToHexStr(Edit_SendD.Text));
  LMDIniCtrl1.WriteString('설정','SENDE',ToHexStr(Edit_SendE.Text));
  LMDIniCtrl1.WriteString('설정','SENDF',ToHexStr(Edit_SendF.Text));


  LMDIniCtrl1.WriteString('설정','FUNC1',Edit_Func1.Text);
  LMDIniCtrl1.WriteString('설정','FUNC2',Edit_Func2.Text);
  LMDIniCtrl1.WriteString('설정','FUNC3',Edit_Func3.Text);
  LMDIniCtrl1.WriteString('설정','FUNC4',Edit_Func4.Text);
  LMDIniCtrl1.WriteString('설정','FUNC5',Edit_Func5.Text);
  LMDIniCtrl1.WriteString('설정','FUNC6',Edit_Func6.Text);
  LMDIniCtrl1.WriteString('설정','FUNC7',Edit_Func7.Text);
  LMDIniCtrl1.WriteString('설정','FUNC8',Edit_Func8.Text);
  LMDIniCtrl1.WriteString('설정','FUNC9',Edit_Func9.Text);
  LMDIniCtrl1.WriteString('설정','FUNC0',Edit_Func0.Text);
  LMDIniCtrl1.WriteString('설정','FUNCA',Edit_FuncA.Text);
  LMDIniCtrl1.WriteString('설정','FUNCB',Edit_FuncB.Text);
  LMDIniCtrl1.WriteString('설정','FUNCC',Edit_FuncC.Text);
  LMDIniCtrl1.WriteString('설정','FUNCD',Edit_FuncD.Text);
  LMDIniCtrl1.WriteString('설정','FUNCE',Edit_FuncE.Text);
  LMDIniCtrl1.WriteString('설정','FUNCF',Edit_FuncF.Text);

  // 모니터링 그리드 현재값저장

  LMDIniCtrl1.WriteInteger('모니터링그리드설정','순번'      ,RxDBGrid1.Columns[0].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','방향'      ,RxDBGrid1.Columns[1].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','시간'      ,RxDBGrid1.Columns[2].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','기기ID'    ,RxDBGrid1.Columns[3].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','No'        ,RxDBGrid1.Columns[4].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','커맨드'    ,RxDBGrid1.Columns[5].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','데이터'    ,RxDBGrid1.Columns[6].Width);
  LMDIniCtrl1.WriteInteger('모니터링그리드설정','전체데이터',RxDBGrid1.Columns[7].Width);

  //소리부분 저장
  LMDIniCtrl1.WriteString('소리','EDCOMP1',ToHexStr(edComp1.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP2',ToHexStr(edComp2.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP3',ToHexStr(edComp3.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP4',ToHexStr(edComp4.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP5',ToHexStr(edComp5.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP6',ToHexStr(edComp6.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP7',ToHexStr(edComp7.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP8',ToHexStr(edComp8.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP9',ToHexStr(edComp9.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP10',ToHexStr(edComp10.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP11',ToHexStr(edComp11.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP12',ToHexStr(edComp12.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP13',ToHexStr(edComp13.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP14',ToHexStr(edComp14.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP15',ToHexStr(edComp15.Text));
  LMDIniCtrl1.WriteString('소리','EDCOMP16',ToHexStr(edComp16.Text));

  LMDIniCtrl1.WriteString('소리','EDFILE1',edFile1.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE2',edFile2.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE3',edFile3.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE4',edFile4.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE5',edFile5.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE6',edFile6.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE7',edFile7.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE8',edFile8.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE9',edFile9.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE10',edFile10.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE11',edFile11.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE12',edFile12.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE13',edFile13.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE14',edFile14.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE15',edFile15.Text);
  LMDIniCtrl1.WriteString('소리','EDFILE16',edFile16.Text);

  LMDIniCtrl1.WriteString('실행','EDEXE1',edExe1.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE2',edExe2.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE3',edExe3.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE4',edExe4.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE5',edExe5.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE6',edExe6.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE7',edExe7.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE8',edExe8.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE9',edExe9.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE10',edExe10.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE11',edExe11.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE12',edExe12.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE13',edExe13.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE14',edExe14.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE15',edExe15.Text);
  LMDIniCtrl1.WriteString('실행','EDEXE16',edExe16.Text);

  if check1.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK1',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK1',0);
  if check2.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK2',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK2',0);
  if check3.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK3',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK3',0);
  if check4.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK4',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK4',0);
  if check5.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK5',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK5',0);
  if check6.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK6',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK6',0);
  if check7.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK7',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK7',0);
  if check8.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK8',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK8',0);
  if check9.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK9',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK9',0);
  if check10.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK10',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK10',0);
  if check11.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK11',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK11',0);
  if check12.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK12',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK12',0);
  if check13.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK13',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK13',0);
  if check14.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK14',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK14',0);
  if check15.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK15',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK15',0);
  if check16.Checked then LMDIniCtrl1.WriteInteger('소리','CHECK16',1)
  else LMDIniCtrl1.WriteInteger('소리','CHECK16',0);



  LMDIniCtrl1.WriteInteger('설정','연결방식',RzRadioGroup1.ItemIndex);
  //LMDIniCtrl1.WriteInteger('설정','Comno',WinsockPort.ComNumber);

  //브로드캐스트 부분 저장
  LMDIniCtrl1.WriteString('BroadCasting','SaveFileName',edBroadFileSave.text);
  LMDIniCtrl1.WriteString('BroadCasting','OpenFileName',edBRFileLoad.text);

  if BroadSaveFileList.count > 0 then BroadSaveFileList.SaveToFile(edBroadFileSave.text);
  if BroadFileList <> nil then BroadFileList.Free;
  if BroadSaveFileList <> nil then BroadSaveFileList.Free;

  if DownLoadList <> nil then DownLoadList.Free;
  if ROM_FlashWrite <> nil then ROM_FlashWrite.Free;
  if ROM_FlashData <> nil then ROM_FlashData.Free;

end;

{연결장비 등록}
procedure TMainForm.RzBitBtn3Click(Sender: TObject);
var
  st: string;
  I: Integer;
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_Device.Items.Count-1 do
  begin
    if Group_Device.ItemChecked[I] then st[I+1]:= '1';
  end;
  RegUsedDevice(DeviceID,st);
end;

{연결장비 검색}
procedure TMainForm.RzBitBtn4Click(Sender: TObject);
var
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckUsedDevice(DeviceID);
end;


procedure TMainForm.ListBox_EventKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;  
begin

  if key = 17 then Exit;

  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    st:= DBISAMTable1.FindField('FullData').asString;
    ClipBoard.SetTextBuf(PChar(st));

  end;

end;
      
procedure TMainForm.cbPollingClick(Sender: TObject);
begin

  if cbPolling.Checked then
  begin
    Polling_TimerTimer(Self);
    Polling_Timer.Interval:= RzSpinner1.Value * 1000;
    Polling_Timer.Enabled:= True;
  end else
  begin
    Polling_Timer.Enabled:= False;
  end;

end;

{폴링 타이머}
procedure TMainForm.Polling_TimerTimer(Sender: TObject);
var
  aDeviceID: String;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'e', '');
end;

procedure TMainForm.RzSpinner1Change(Sender: TObject);
begin
  Polling_Timer.Interval:= RzSpinner1.Value * 1000;
end;

{임의 데이터 전송}
procedure TMainForm.Btn_send1Click(Sender: TObject);
var
  I: Integer;
  aDeviceID: String;
  aData: String;
  st: string;
  aFunc: Char;
begin
  for I:= 0 to 15 do
  begin
    if Array_SendEdit[I].Btn_Send = Sender then
    begin
      if Array_SendEdit[I].Edit.Text <> '' then
      begin
        aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

        if cb_SendFullData.Checked = False then
        begin
          if Array_SendEdit[I].Func.Text <> '' then
          begin
            aData:= Array_SendEdit[I].Edit.Text;
            aFunc:= Array_SendEdit[I].Func.Text[1];
            SendPacket(aDeviceID,aFunc,aData);
          end else
          begin
            SHowMessage('펑션코드가  없습니다.');
            Exit;
          end;
        end else
        begin
          //WinsockPort.FlushOutBuffer;
          aData:= Array_SendEdit[I].Edit.Text;
          WinsockPort.PutString(aData);
          st:=  'Server:'+'0' +#9+
                Copy(aDeviceID,1,7)+#9+
                Copy(aDeviceID,8,2)+#9+
                //Copy(ACKStr2,17,2)+';'+
                aData[17]+#9+
                Copy(aData,19,Length(aData)-21)+#9+
                'TX'+#9+
                aData;
           showMessage(st);
          AddEventList(st);

        end;


      end else
      begin
        //SHowMessage('전송할 데이터 가 없습니다.');
        if MessageDlg('전송할 데이터가 없습니다.취소 하시겠습니까?',
        mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        SendCancelRomUpDate(aDeviceID);
      end;

      Exit;
    end;
  end;
end;

{전송 데이터 Edit 내용 삭제}
procedure TMainForm.Btn_Clear1Click(Sender: TObject);
var
  I: Integer;
begin
  for I:= 1 to 15 do
  begin
    if Array_SendEdit[I].Btn_Clear = Sender then
    begin
      Array_SendEdit[I].Edit.Text:= '';
      Exit;
    end;
  end;
end;

{펌웨어 다운로드}
Procedure TMainForm.DownLoadRom(aDeviceID:String;aType:Integer;aFileName: String);
var
  I: Integer;
  st: string;
begin
  DownLoadList.Clear;
  DOwnLoadType:= aType;
  DownLoadList.LoadFromFile(aFileName);
  st:= DownLoadList[0];
  SendRomData(aDeviceID,Downloadtype,st);

  OffCount:= 0;
  DownLoadCount:= 0;
  ProgressBar1.Position:= 0;
  ProgressBar1.Max:= DownLoadList.Count;
  Label1.Caption:= InttoStr(ProgressBar1.Position)+'/'+ InttoStr(ProgressBar1.Max);
end;

Procedure TMainForm.SendRomData(aDeviceID:String;aType:Integer; adata: String);
var
  st: string;
begin


  if aType =1 then st:= 'FP00'+aData
  else             st:= 'FD00'+aData;
  SendPacket(aDeviceID,'F',st);
  //SendDataSave(' [S] '+st);
  Off_Timer.Enabled:= True;

end;



procedure TMainForm.Off_TimerTimer(Sender: TObject);
var
  st: string;
  I: Integer;
  aDeviceID:String;
begin

  if not WinsockPort.Open then
  begin
    //if not ISDwonLoad then Off_Timer.Enabled:= False;
    Exit;
  end;

  if LMDCaptionPanel1.Visible then
  begin
    if ProgressBar3.Position >= 10 then
    begin
       if not WizNetRcvACK then
       begin
         LMDCaptionPanel1.visible := False;
         LMDSimpleLabel1.Twinkle:= False;
         Off_Timer.Enabled:= False;
         SHowMessage('기기 조회/설정을 실패 했습니다.재시도 하세요');
       end else
       begin
         btnCheckLanClick(Self);
       end;
       Exit;
    end else
    begin
      I:= ProgressBar3.Position;
      Inc(I);
      ProgressBar3.Position:= I;
    end;
  end else // 펌웨어 다운로드
  begin
    (*
    if OffCount > 10 then
    begin
      Off_Timer.enabled:= False;
      ShowMessage('다운로드가 실패 했습니다.');
      IsDwonLoad:= False;
      Exit;
    end;
      *)
    if DownLoadList.Count > 0 then
    begin
      st:= DownLoadList[0];
      aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
      SendRomData(aDeviceID,Downloadtype,st);
      Inc(OffCount);
    end else
    begin
      IsDownLoad:= False;
      Off_Timer.Enabled:= False;
    end;
  end;
end;

procedure TMainForm.RzBitBtn20Click(Sender: TObject);
begin
  bBroadFileSendERR := False;//처음 시작 할때는 Err 가 없다.
  btBroadFileRetry.Enabled := False;
  BroadSendDataList.Clear;
  BroadErrorDataList.Clear;
  btBroadRetry.Enabled := False;
  //여기서 한번만 Controler 셋팅해주자.
  BroadControlerNum := '';
  BroadControlerNum := GetBroadControlerNum(Group_BroadDownLoad);

 {다운로드 이전에 코드를 확인한다.}
 if DLCheckBox.Checked then
 begin
   if DLRadioGroup.ItemIndex = 0 then aFI.CMDCODE:= '00'
   else                               aFI.CMDCODE:= DLCodeEdit.Text;

   if Length(aFI.CMDCODE) <> 2 then
   begin
    ShowMessage('코드를 2자리로 입력 확인하세요');
    exit;
   end;
 end;

 GroupBox23.Visible := True;


// if cb_Download.Checked then
 if rdMode.ItemIndex = 0 then
 begin

    ListBox_DownLoadInfo.Clear;
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드 수동시작');
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
    Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
    SendRomUpDateInfo(Edit_CurrentID.Text + ComboBox_IDNO.Text);
 end else if rdMode.ItemIndex = 2 then
 begin
    ListBox_DownLoadInfo.Clear;
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드 수동시작');
    Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 전송');
    Write_ListBox_DownLoadInfo('펌웨어 버젼:aFI.Version');
    SendRomBroadFileInfo;

 end else
 begin

    LMDStopWatch1.Start;
    CancelDownload:= False;

    {
    if RzButtonEdit1.Text = '' then
    begin
      ShowMessage('선택한 파일이 없습니다.');
      Exit;
    end;
     }
    //Req_Version;

    ListBox_DownLoadInfo.Clear;
    if WinsockPort.Open = False then
    begin
      WinsockPort.Open:= True;
    end;

    Write_ListBox_DownLoadInfo('펌웨어 버젼 확인');

    if CheckRomVer then
    begin
      if MessageDlg('펌웨어 버젼이 같습니다.'+#13+'['+aFI.Version+']'+#13+'전송 하시겠습니까?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      begin
        Write_ListBox_DownLoadInfo('현재 펌웨어 버젼:'+Edit_Ver.Text);
        Write_ListBox_DownLoadInfo('전송할 펌웨어 버젼:'+aFI.Version);
        DownloadFMM(Edit_CurrentID.Text + ComboBox_IDNO.Text);
      end;
    end else
    begin
      Write_ListBox_DownLoadInfo('현재 펌웨어 버젼:'+Edit_Ver.Text);
      Write_ListBox_DownLoadInfo('전송할 펌웨어 버젼:'+aFI.Version);
      DownloadFMM(Edit_CurrentID.Text + ComboBox_IDNO.Text);
    end;
 end;

end;

procedure TMainForm.RzBitBtn21Click(Sender: TObject);
var
  aDeviceID:String;
  stData : String;
begin
//  if cb_Download.Checked then
  BroadID := '05';

  if rdMode.ItemIndex = 0 then
  begin
    aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    SendCancelRomUpDate(aDeviceID);
  end else if rdMode.ItemIndex = 1 then
  begin
    CancelDownload:= True;
    OffCount:=0;
    DownLoadList.Clear;
  end else if rdMode.ItemIndex = 2 then    //Main주관
  begin
    aDeviceID:= Edit_CurrentID.Text + '00';
    stData := 'BS' + BroadID + FillZeroNumber(0,7);
    SendPacket(aDeviceID,'*',stData);
  end else if rdMode.ItemIndex = 3 then   //Server주관
  begin
    aDeviceID:= Edit_CurrentID.Text + '00';
    stData := 'BI' + BroadID + FillZeroNumber(0,7);
    SendPacket(aDeviceID,'*',stData);
  end;
  IsDownLoad:= False;

  GroupBox23.Visible := False;
  ProgressBar1.Position:= 0;
  BroadSleep_Timer.Enabled := False;

end;

procedure TMainForm.RzBitBtn22Click(Sender: TObject);
var
  st: string;
  I: Integer;
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  st:='0000';
  for I:= 0 to Group_AlarmDisplay.Items.Count-1 do
  begin
    if Group_AlarmDisplay.ItemChecked[I] then st[I+1]:= '1';
  end;

  RegUsedAlarmDisplay(DeviceID,st);

end;

procedure TMainForm.RzBitBtn23Click(Sender: TObject);
var
  DeviceID: String;
begin
{}
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckUsedAlarmDisplay(DeviceID);
end;

procedure TMainForm.RzBitBtn18Click(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegSysInfo2(DeviceID);

end;

procedure TMainForm.RzBitBtn19Click(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckSysInfo2(DeviceID);
end;

{출입통제/운영모드}
procedure TMainForm.Btn_NomalClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'2','0' );
  //DoorModeChange(DeviceID,'0');

end;

{출입통제/개방모드}
procedure TMainForm.Btn_OpenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'2','1' );
  //DoorModeChange(DeviceID,'1');
end;

{POSI/NEGATIVE}
procedure TMainForm.Btn_PositiveClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'1','0' );
  //DoorModeChange(DeviceID,'1');
end;

procedure TMainForm.Btn_NegativeClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'1','1' );
  //DoorModeChange(DeviceID,'1');
end;
{Door Close}
procedure TMainForm.Btn_DoorOPenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'3','0' );
  //DoorModeChange(DeviceID,'1');
end;

{Door OPen}
procedure TMainForm.Btn_DoorCloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'3','1' );
  //DoorModeChange(DeviceID,'1');
  //beep
end;

procedure TMainForm.WinsockPortWsAccept(Sender: TObject; Addr: TInAddr;
  var Accept: Boolean);
var
  ConnectedIP: string;
begin
  SockErroCode:= 0;
  //btn_Connect.Color:= $00F48D6A;
  //Btn_DisConnect.Color:= $00F0F4F4;

  ConnectedIP:= InttoStr(Ord(Addr.S_un_b.s_b1))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b2))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b3))+'.'+
       InttoStr(Ord(Addr.S_un_b.s_b4));

  if ConnectedIP = CB_IPList.Text then
  begin
    Panel_ActiveClinetCount.Caption:= ConnectedIP+ ' 접속';
    //Edit1.Text:= st;
    Accept := true;
    CheckID('0000000');
  end else
  begin
    Panel_ActiveClinetCount.Caption:= ConnectedIP+ ' 접속불허';
    //Edit1.Text:= ConnectedIP;
    Accept := False;
  end;


end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
end;


{LOG 데이터용 메모리 DB생성}
procedure TMainForm.CreateLogDB;
begin
  with DBISAMTable1.FieldDefs do
  begin     Clear;     Add('SeqNo',ftInteger,0,True);     Add('EventTime',ftDatetime,0,False);     Add('IP',ftString,20,False);     Add('DeviceID',ftString,10,False);     Add('DEviceNo',ftString,2,False);     Add('Cmmd',ftString,3,False);     Add('Data',ftString,200,False);     Add('FullData',ftString,200,False);  end;  with DBISAMTable1.IndexDefs do  begin     Clear;     Add('','SeqNo',[ixPrimary]);     Add('ByCompany','Company',[ixCaseInsensitive],'',icDuplicateByte);  end;  if not DBISAMTable1.Exists then DBISAMTable1.CreateTable;end;
procedure TMainForm.RxDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
var
  st: String;
  stWarning: String;
begin

  st:= (Sender as TRxDBGrid).Datasource.Dataset.FindField('Way').asString;
  stWarning:= copy((Sender as TRxDBGrid).Datasource.Dataset.FindField('Data').asString,1,2);
  if      st = 'RX' then  Background:= $00DDFFDD
  else if st = 'TX' then  Background:= $00E2EDFA
  else                    Background:= clWhite;
  if Highlight= True then
  begin
    Background:= clNavy;
    AFont.Color:= clWhite;
  end;
  if stWarning = 'Y:' then
  begin
    Background:= clYellow;
    AFont.Color:= clBlack;
  end;
end;

procedure TMainForm.DBISAMTable1EventTimeGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text:= FormatDatetime('hh":"nn":"ss":"zzz', Sender.ASDatetime);
end;


procedure TMainForm.Btn_RegDialInfoClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegDialTime(DeviceID,StrtoInt(ComboBox1.Text),StrtoInt(ComboBox2.Text));
end;

procedure TMainForm.Btn_CheckDialInfoClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckDialTime(DeviceID);
end;

procedure TMainForm.Btn_RegCalltimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegCallTime(DeviceID,RzSpinner2.Value);
end;

procedure TMainForm.Btn_CheckCalltimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckCallTime(DeviceID);
end;


procedure TMainForm.Edit_Combo_Enter(Sender: TObject);
begin
  if Sender is TEdit then TEdit(Sender).Color:= clWhite
  else if Sender is TComboBox then TComboBox(Sender).Color:= clWHite
  else if Sender is TrzComboBox then TrzComboBox(Sender).Color:= clWhite;
end;


Procedure TMainForm.CD_DownLoad(aDevice: String;aCardNo:String;func:Char);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  aLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
begin

  aLength:= Length(aCardNo);
  if aLength < 10 then
    aCardNo:= FillZeroStrNum(aCardNo,10);

  if aLength < 16 then
  begin
    for I := 1  to 16 - aLength do
    begin
      aCardNo:= aCardNo + '0';
    end;
  end;


  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,10);
  ValidDay:=   Copy(aCardNo,11,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  xCardNo:=  '00'+EncodeCardNo(RealCardNo);

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  '+                     //RecordCount #$20 #$20
          '0'+                      //예비
          xCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  //SHowMessage(aData);
  SendPacket(aDevice,'c',aData);
end;

Procedure TMainForm.CardAllDownLoad(aFunc:Char);
var
  I: Integer;
  DeviceID: String;
  aCardNo: String;
begin
  // aFunc:L등록,N삭제,M조회
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  for I:= 0 to Memo_CardNo.Lines.Count -1 do
  begin
    if bCardDownLoadStop then break;
    
    aCardNo:= Memo_CardNo.Lines[I];

    if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,aFunc)
    else CD_DownLoad(DeviceID,aCardNo,aFunc);
//    CD_DownLoad(DeviceID,aCardNo,aFunc);
    if chk_SendTime.checked then Sleep(strtoint(ed_SendTime.Text))
    else Sleep(100);
    Application.ProcessMessages;
  end;
  //CD_DownLoad(DeviceID,'0000000000',aFunc);
end;

{카드번호 등록}
procedure TMainForm.Btn_RegCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('등록할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  bCardDownLoadStop := False;
  if chk_FastSave.Checked then CardAllDownLoad('F')
  else
  CardAllDownLoad('L');

end;

procedure TMainForm.Btn_DelCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('삭제할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('N');
end;


procedure TMainForm.Btn_DelEventLogClick(Sender: TObject);
begin
  LMDListBox1.Items.Clear;
  CountCardReadData:= 1;

end;












procedure TMainForm.RzBitBtn25Click(Sender: TObject);
begin
  OnMoni:= True;
end;

procedure TMainForm.RzBitBtn27Click(Sender: TObject);
var
  aFile: String;
begin
  RzSaveDialog1.InitialDir:= ExtractFileDir(Application.ExeName);
  if RzSaveDialog1.Execute then
  begin
    aFile:= RzSaveDialog1.FileName;
    DBISAMTable1.ExportTable(aFile,',');
  end;
end;

procedure TMainForm.ComboBox1Click(Sender: TObject);
begin
  if Sender is TCombobox then
    TCombobox(Sender).Color:= clWhite
  else if Sender is TRzSpinner then
    TRzSpinner(Sender).Color:= clWhite;

end;

procedure TMainForm.RzBitBtn28Click(Sender: TObject);
begin

  if RzPageControl1.ActivePage = TabSheet1 then
  begin
    with DBISAMTable1 do
    begin
      Append;
      FindField('EventTime').asString:= '';
      FindField('IP').asString:= '';
      FindField('DeviceID').asString:= '';
      FindField('DeviceNo').asString:= '';
      FindField('cmd').asString:= '';
      FindField('Data').asString:= '';
      FindField('FullData').asString:='';
      FindField('Way').asString:= '';
      try
        Post;
      except
        Exit;
      end;
    end;
  end else
  begin
    RichEdit1.Lines.Add('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<<<'+#$0D+#$0A);
    //RichEdit1.Lines.Add(#13);
  end;
end;

procedure TMainForm.RzGroup1Open(Sender: TObject);
var
  I: Integer;
begin
(*
  for I:= 0 to RzGroupBar1.GroupCount -1 do
  begin
    if TRzGroup(Sender) <> TRzGroup(RzGroupBar1.Groups[i]) then
       TRzGroup(RzGroupBar1.Groups[i]).Close;
  end;
  *)
end;

procedure TMainForm.RzRadioGroup1Changing(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
    if NewIndex = 0 then
    begin
      //LAN
      CB_SerialComm.Enabled:= False;
      RadioGroup_Mode.Enabled:= True;
      CB_IPList.Enabled:= True;
      Edit2.Enabled:= True;
    end else
    begin
      //Serial
      CB_SerialComm.Enabled:= True;
      RadioGroup_Mode.Enabled:= False;
      CB_IPList.Enabled:= False;
      Edit2.Enabled:= False;
    end;

end;
{랜모둘 데이터 설정}
procedure TMainForm.RzBitBtn32Click(Sender: TObject);
var
  I: Integer;
  No: Integer;
  st,st2: String;
  DataStr: String;
  aDeviceID: String;
  FHeader:         String[2];
  FMacAddress:    String[12];
  FMode:          String[2];
  FIPAddress:     String[8];
  FSubnet:        String[8];
  FGateway:       String[8];
  FClientPort:    String[4];
  FServerIP:      String[8];
  FServerPort:    String[4];
  FSerial_Baud:   String[2];
  FSerial_data:   String[2];
  FSerial_Parity: String[2];
  FSerial_stop:   String[2];
  FSerial_flow:   String[2];
  FDelimiterChar: String[2];
  FDelimiterSize: String[4];
  FDelimitertime: String[4];
  FDelimiterIdle: String[4];
  FDebugMode:     String[2];
  FROMVer:        String[4];
  FOnDHCP:        String[2];
  FReserve:       String[6];
begin




  if RzRadioGroup1.ItemIndex = 1 then
  begin

    WizNetRegMode:= True;
    WizNetRcvACK:= False;
    //1.Header
    FHeader:= 'AA';
    //2.MAC Address 지정안함
    FMacAddress:='000000000000';
    //3.Mode (Server mode: 02, Client mode: 00)
    //if Checkbox_Client.Checked then FMode:= '00'
    //else                            FMode:= '01';
    if RadioModeClient.Checked then FMode:= '00'
    else if RadioModeServer.Checked then FMode:= '02'
    else if RadioModeMixed.Checked then  FMode:= '01';



    // 4.IP address
    st2:= '';
    if Edit_LocalIP.Text = '' then Edit_LocalIP.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_LocalIP.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FIPAddress:= ToHexStrNoSpace(st2);

    // 5.Subnet mask
    st2:= '';
    if Edit_Sunnet.Text = '' then Edit_Sunnet.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Sunnet.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FSubnet:= ToHexStrNoSpace(st2);

    // 6.Gateway address
    st2:= '';
    if Edit_Gateway.Text = '' then Edit_Gateway.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Gateway.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FGateway:= ToHexStrNoSpace(st2);

    //7.Port number (Client)
    st2:= '';
    if Edit_LocalPort.Text = '' then Edit_LocalPort.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_LocalPort.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FClientPort:= ToHexStrNoSpace(st2);

    //8. Server IP address
    st2:= '';
    if Edit_ServerIp.Text = '' then Edit_ServerIp.Text:= '0.0.0.0';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    FServerIP:= ToHexStrNoSpace(st2);

    //9.  Port number (Server)
    st2:= '';
    if Edit_Serverport.Text = '' then Edit_Serverport.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FServerPort:= ToHexStrNoSpace(st2);

    //10. Serial speed (bps)
    case ComboBox_Boad.ItemIndex of
      0: FSerial_Baud:= 'F4'; //9600           F4
      1: FSerial_Baud:= 'FA'; //19200          FA
      2: FSerial_Baud:= 'FD'; //38400 Default  FD
      3: FSerial_Baud:= 'FE'; //57600          FE
      4: FSerial_Baud:= 'FF'; //115200         FF
      else FSerial_Baud:= 'FD';
    end;

    //11. Serial data size (08: 8 bit), (07: 7 bit)
    case ComboBox_Databit.ItemIndex of
        0: FSerial_data:= '07';
        1: FSerial_data:= '08';
        else FSerial_data:= '08';
    end;

    //12. Parity (00: No), (01: Odd), (02: Even)
    case ComboBox_Parity.ItemIndex of
      0: FSerial_Parity:= '00'; //None
      1: FSerial_Parity:= '01'; //Odd
      2: FSerial_Parity:= '02'; //Even
      else FSerial_Parity:= '00';
    end;

    //13. Stop bit
    FSerial_stop:= '01';

    //14.Flow control (00: None), (01: XON/XOFF), (02: CTS/RTS)
    case ComboBox_Flow.ItemIndex  of
      0: FSerial_flow:= '00';
      1: FSerial_flow:= '01';
      2: FSerial_flow:= '02';
    end;

    //15. Delimiter char
    if Edit_Char.Text ='' then Edit_Char.Text:= '00';
    FDelimiterChar:= Edit_Char.Text;

    //16.Delimiter size
    st2:= '';
    if Edit_Size.Text ='' then Edit_Size.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimiterSize:= ToHexStrNoSpace(st2);

    //17. Delimiter time
    if Edit_Time.Text = '' then Edit_Time.Text:= '20';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimitertime:= ToHexStrNoSpace(st2);

    //18.Delimiter idle time
    if Edit_Idle.Text = '' then Edit_Idle.Text:= '0';
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    FDelimiterIdle:= ToHexStrNoSpace(st2);

    //19. Debug code (00: ON), (01: OFF)
    if Checkbox_Debugmode.Checked then FDebugMode:= '00'
    else                               FDebugMode:= '01';

    //20.Software major version
    FROMVer:='0000';

    // 21.DHCP option (00: DHCP OFF, 01:DHCP ON)
    if Checkbox_DHCP.Checked then FOnDHCP:= '01'
    else                          FOnDHCP:= '00';

    //22.Reserved for future use
    FReserve:= '000000';

    DataStr:= FHeader+
              FMacAddress+
              FMode+
              FIPAddress+
              FSubnet+
              FGateway+
              FClientPort+
              FServerIP+
              FServerPort+
              FSerial_Baud+
              FSerial_data+
              FSerial_Parity+
              FSerial_stop+
              FSerial_flow+
              FDelimiterChar+
              FDelimiterSize+
              FDelimitertime+
              FDelimiterIdle+
              FDebugMode+
              FROMVer+
              FOnDHCP+
              FReserve;
    WiznetData:= DataStr;

    aDeviceID:= Edit_DeviceID.Text;
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
    if  Length(aDeviceID) < 9 then
    begin
      aDeviceID:= '000000000';
    end;
    SendPacket(aDeviceID,'I','NW00'+DataStr);
    //ClearWiznetInfo;
    Off_Timer.Enabled:= True;
    LMDSimpleLabel1.Caption:= '랜정보 설정중 입니다. 잠시만 기다려 주십시오';
    LMDCaptionPanel1.visible := True;
    LMDSimpleLabel1.Twinkle:= True;
    ProgressBar3.Position:= 0;
  end else
  begin

    wiznetData[1]:='S';
    wiznetData[2]:='E';
    wiznetData[3]:='T';
    wiznetData[4]:='T';

    {LocalIP}
    st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_LocalIP.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[11+I]:= st2[I];
    end;

   {Local subnet}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Sunnet.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[15+I]:= st2[I];
    end;

   {Local Gateway}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_Gateway.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[19+I]:= st2[I];
    end;

    {Local Port}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_LocalPort.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[24]:= st2[1];
    wiznetData[25]:= st2[2];

   {Server IP}
   st2:='';
    for I:= 0 to 3 do
    begin
      st:= FindCharCopy(Edit_ServerIp.Text,I,'.');
      No:= StrToInt(st);
      st2:= st2 + Char(No);
    end;
    for I:= 1 to 4 do
    begin
      wiznetData[25+I]:= st2[I];
    end;

    {Server Port}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Serverport.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[30]:= st2[1];
    wiznetData[31]:= st2[2];

    {Mode}
    //if Checkbox_Client.Checked then wiznetData[11] := #$00
    //else                            wiznetData[11] := #$01;

    if RadioModeClient.Checked then wiznetData[11] := #$00
    else if RadioModeServer.Checked then wiznetData[11] := #$02
    else if RadioModeMixed.Checked then  wiznetData[11] := #$01;



    {Board}
    case ComboBox_Boad.ItemIndex of
      3: wiznetData[32]:= #$F4; //9600
      4: wiznetData[32]:= #$FA; //19200
      5: wiznetData[32]:= #$FD; //38400
      6: wiznetData[32]:= #$FE; //57600
      7: wiznetData[32]:= #$FF; //115200
    else wiznetData[32]:= #$FD; //38400
    end;

    {DataBit}
    case ComboBox_Databit.ItemIndex of
      0: wiznetData[33]:= #$07;
      1: wiznetData[33]:= #$08;
    end;

    {Parity}
    case ComboBox_Parity.ItemIndex of
      0: wiznetData[34]:= #$00;
      1: wiznetData[34]:= #$01;
      2: wiznetData[34]:= #$02;
    end;

    {Stop Bit}
    wiznetData[35]:= #$01;

    {Flow}
    case ComboBox_Flow.ItemIndex of
      0: wiznetData[36]:= #$00;
      1: wiznetData[36]:= #$01;
      2: wiznetData[36]:= #$02;
    end;

    {Delimeter Time}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Time.Text),2);
    //if Length(st) < 4 then st:= '0'+st;
    st:=FillZeroStrNum(st,4);
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[40]:= st2[1];
    wiznetData[41]:= st2[2];

    {Delimeter Size}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Size.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[38]:= st2[1];
    wiznetData[39]:= st2[2];

    {Delimeter Char}
    st:= Edit_Char.Text;
    wiznetData[37]:= Char(Hex2Dec(st));

    {Delimeter IdleTIme}
    st2:='';
    st:= Dec2Hex(StrtoInt(Edit_Idle.Text),2);
    if Length(st) < 4 then st:= '0'+st;
    st2:= Chr(Hex2Dec(Copy(st,1,2)))+ Char(Hex2Dec(Copy(st,3,2)));
    wiznetData[42]:= st2[1];
    wiznetData[43]:= st2[2];
    {Debug Mode}
    if Checkbox_Debugmode.Checked then  wiznetData[44]:= #$00
    else                                wiznetData[44] := #$01;

    if Checkbox_DHCP.Checked then wiznetData[47]:= #$01
    else                          wiznetData[47]:= #$00;

    if ClientSocket1.Active then
    begin
      OnWritewiznet:= True;
      ClientSocket1.Socket.SendText(wiznetData);
      ClearLanInfo;
    end else
    begin
      SHowMessage('랜모듈 정보 읽기를 해주세요');
      Exit;
    end;

  end;

end;



procedure TMainForm.btnCheckLanClick(Sender: TObject);
var
  aDeviceID: String;
begin
  wiznetData:= '';
  OnWritewiznet:= False;
  if RzRadioGroup1.ItemIndex <> 0 then
  begin
    WizNetRegMode:= False;
    WizNetRcvACK:= False;
    aDeviceID:= Edit_DeviceID.Text;
    if  Length(aDeviceID) < 9 then
    begin
      aDeviceID:= '000000000';
    end;
    SendPacket(aDeviceID,'Q','NW00');
    //ClearWiznetInfo;
    Off_Timer.Enabled:= True;
    LMDSimpleLabel1.Caption:= '랜정보 조회중 입니다. 잠시만 기다려 주십시오';
    LMDCaptionPanel1.visible := True;
    LMDSimpleLabel1.Twinkle:= True;
    ProgressBar3.Position:= 0;
 end else
 begin
   ClearLanInfo;
   if ClientSocket1.Active  then  ClientSocket1.Active:= False;
   ClientSocket1.Host:= CB_IPList.Text;
   ClientSocket1.Active:= True;
   WiznetTimer.Enabled:= True;
 end;
end;

procedure TMainForm.RzBitBtn30Click(Sender: TObject);
begin

  if MessageDlg('현재 설정된 값을 기본값으로 지정 하시겠습니까?',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    LMDIniCtrl1.WriteString('Wiznet','LocalIP',Edit_LocalIP.Text);
    LMDIniCtrl1.WriteString('Wiznet','Subnet',Edit_Sunnet.Text);
    LMDIniCtrl1.WriteString('Wiznet','Gateway',Edit_Gateway.Text);
    LMDIniCtrl1.WriteString('Wiznet','Localport',Edit_LocalPort.Text);
    LMDIniCtrl1.WriteString('Wiznet','Serverip',Edit_ServerIp.Text);
    LMDIniCtrl1.WriteString('Wiznet','Serverport',Edit_Serverport.Text);
    LMDIniCtrl1.WriteString('Wiznet','DTime',Edit_Time.Text);
    LMDIniCtrl1.WriteString('Wiznet','DSize',Edit_Size.Text);
    LMDIniCtrl1.WriteString('Wiznet','DChar',Edit_Char.Text);
    LMDIniCtrl1.WriteString('Wiznet','DIdle',Edit_Idle.Text);
    LMDIniCtrl1.WriteInteger('Wiznet','Boad',ComboBox_Boad.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Databit',ComboBox_Databit.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Parity',ComboBox_Parity.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Stopbit',ComboBox_Stopbit.ItemIndex);
    LMDIniCtrl1.WriteInteger('Wiznet','Flow',ComboBox_Flow.ItemIndex);
    LMDIniCtrl1.WriteBool('Wiznet','ClinetOnly',Checkbox_Client.Checked);
    LMDIniCtrl1.WriteBool('Wiznet','Debugmode',Checkbox_Debugmode.Checked);
    LMDIniCtrl1.WriteBool('Wiznet','DHCP',Checkbox_DHCP.Checked);
  end;

end;

procedure TMainForm.RzBitBtn31Click(Sender: TObject);
var
  aBool: Boolean;
begin
  Edit_LocalIP.Text:=     LMDIniCtrl1.ReadString('Wiznet','LocalIP','0.0.0.0');
  Edit_Sunnet.Text:=      LMDIniCtrl1.ReadString('Wiznet','Subnet','0.0.0.0');
  Edit_Gateway.Text:=     LMDIniCtrl1.ReadString('Wiznet','Gateway','0.0.0.0');
  Edit_LocalPort.Text:=   LMDIniCtrl1.ReadString('Wiznet','Localport','0');
  Edit_ServerIp.Text:=    LMDIniCtrl1.ReadString('Wiznet','Serverip','0.0.0.0');
  Edit_Serverport.Text:=  LMDIniCtrl1.ReadString('Wiznet','Serverport','0');
  Edit_Time.Text:=        LMDIniCtrl1.ReadString('Wiznet','DTime','0');
  Edit_Size.Text:=        LMDIniCtrl1.ReadString('Wiznet','DSize','0');
  Edit_Char.Text:=        LMDIniCtrl1.ReadString('Wiznet','DChar','00');
  Edit_Idle.Text:=        LMDIniCtrl1.ReadString('Wiznet','DIdle','0');
  ComboBox_Boad.ItemIndex:=     LMDIniCtrl1.ReadInteger('Wiznet','Boad',2);
  ComboBox_Databit.ItemIndex:=  LMDIniCtrl1.ReadInteger('Wiznet','Databit',1);
  ComboBox_Parity.ItemIndex:=   LMDIniCtrl1.ReadInteger('Wiznet','Parity',0);
  ComboBox_Stopbit.ItemIndex:=  LMDIniCtrl1.ReadInteger('Wiznet','Stopbit',0);
  ComboBox_Flow.ItemIndex:=     LMDIniCtrl1.ReadInteger('Wiznet','Flow',0);
  aBool:=                       LMDIniCtrl1.ReadBool('Wiznet','ClinetOnly',True);
  if aBool then  RadioModeClient.Checked:= True
  else           RadioModeServer.Checked:= True;

  Checkbox_Debugmode.Checked:=  LMDIniCtrl1.ReadBool('Wiznet','Debugmode',False);
  Checkbox_DHCP.Checked:=       LMDIniCtrl1.ReadBool('Wiznet','DHCP',False);


end;

procedure TMainForm.LMDCaptionPanel1CloseBtnClick(Sender: TObject;
  var Cancel: Boolean);
begin
  //LMDCaptionPanel1.visible := False;
  LMDSimpleLabel1.Twinkle:= False;
  Off_Timer.Enabled:= False;
  SHowMessage('기기 설정을 취소 했습니다.');
end;

procedure TMainForm.edRegTelNoButtonClick(Sender: TObject);
var
  M_No: Integer;
  T_No: String;
  DeviceID: String;
begin
{}
  M_No:= TRzButtonEdit(Sender).Tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  T_No:= TRzButtonEdit(Sender).Text;
  if T_No = '' then T_No:= '1234567890';
  RegTellNo(DeviceID,M_No,T_No);

end;

procedure TMainForm.edTelNoButtonClick(Sender: TObject);
var
  DeviceID: String;
  aNo: Integer;
begin
  aNo:= TRzButtonEdit(Sender).Tag;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckTellNo(DeviceID, aNo );
  TRzButtonEdit(Sender).Text:= '';

end;

procedure TMainForm.cbVoiceDetectClick(Sender: TObject);
begin
  cbVoiceDetect.Color:= clBtnFace;
  if cbVoiceDetect.Checked then RzSpinner3.Enabled:= True
  else                          RzSpinner3.Enabled:= False;
end;

{보이스 감지 시간 조회}
procedure TMainForm.CheckVoiceTime(DeviceID: String);
var
  aDeviceID: String;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'Q','VC00');
end;

{보이스 감지시간}
//0:사용 안함
//구간 5 ~99초
procedure TMainForm.RcvVoiceTime(aDeviceID,aData: String);
var
  st: string;
  aTime: Integer;
begin

  st:= copy(aData,5,2);
  aTime:= StrtoInt(st);
  if aTime < 1 then
  begin
    cbVoiceDetect.Color:= clBtnFace;
    cbVoiceDetect.Checked:= False;
    RzSpinner3.Enabled:= False;
  end else
  begin
    RzSpinner3.Color:= ClYellow;
    cbVoiceDetect.Checked:= True;
    RzSpinner3.Enabled:= True;
    RzSpinner3.Value:= aTime;
  end;
end;

{보이스 감지 사간 등록}
procedure TMainForm.RegVoiceTime(aDeviceID: String; aTime: Integer);
var
  Timestr: string;
begin
  TimeStr:= FillZeroNumber(aTime,2);
  SendPacket(aDeviceID,'I','VC00'+TimeStr);
end;

procedure TMainForm.btnRegVoicetimeClick(Sender: TObject);
var
  DeviceID:String;
  aTime: Integer;
begin
  RzSpinner3.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  if cbVoiceDetect.Checked then aTime:= RzSpinner3.Value
  else                          aTime:= 0;

  RegVoiceTime(DeviceID,aTime);
end;

procedure TMainForm.btnCheckVoicetimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner3.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckVoiceTime(DeviceID);
end;

procedure TMainForm.RzButton1Click(Sender: TObject);
begin
  (*
  if RzRadioGroup1.ItemIndex = 0 then
  begin
    SHowMessage('연결 방식을 RS-232로 바꾸세요');
    Exit;
  end;
  Notebook1.PageIndex:= 10;
  *)

  if RzRadioGroup1.ItemIndex <> 0 then ClientSocket1.Active:= False;
  Notebook1.PageIndex:= 10;


end;

procedure TMainForm.LMDListBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  st: string;
begin
  if key = 17 then Exit;
  if (Key = 67) and (Shift = [ssCtrl]) 	then
  begin
    st:= LMDListBox1.ItemPart(LMDListBox1.ItemIndex,8);
    ClipBoard.SetTextBuf(PChar(st));
  end;
end;


procedure TMainForm.Btn_RegbroadcasttimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner4.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegbroadcastTime(DeviceID,RzSpinner4.Value);
end;

procedure TMainForm.Btn_CheckbroadcasttimeClick(Sender: TObject);
var
  DeviceID:String;
begin
  RzSpinner2.Color:= ClWhite;;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckbroadcastTime(DeviceID);
end;



procedure TMainForm.Button2Click(Sender: TObject);
var
  M_No: Integer;
  T_No: String;
  DeviceID: String;
begin

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  for M_No:= 0 to 9 do
  begin
    T_No:= '123450'+InttoStr(M_No);
    RegTellNo(DeviceID,M_No,T_No);
    Delay(200);
  end;



end;

procedure TMainForm.RzButtonEdit100ButtonClick(Sender: TObject);
var
  st: string;
  iFileLength: Integer;
  iBytesRead: Integer;
  iFileHandle: Integer;
begin

  RzOpenDialog1.Title:= '펌웨어 설정 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'ini';
  RzOpenDialog1.Filter := 'INI files (*.ini)|*.INI';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    RzButtonEdit1.Text:= st;
    LMDIniCtrl2.IniFile:= st;
    LoadINI_firmwareInfo;
    st:= aFI.Version + #13+
         aFI.FMM     + #13+
         aFI.FSC     + #13+
         aFI.FWFN    + #13+
         aFI.FDFN;
    ROM_FlashWrite.Clear;
    ROM_FlashWrite.LoadFromFile(aFI.FWFN);
    ROM_FlashData.Clear;
    ROM_FlashData.LoadFromFile(aFI.FDFN);
    //여기서 첫번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FWFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashWrite := nil;
    ROM_BineryFlashWrite := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashWrite^, iFileLength);
    //여기서 두번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FDFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashData := nil;
    ROM_BineryFlashData := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashData^, iFileLength);

    FileClose(iFileHandle);
  end;
end;

function TMainForm.CheckRomVer: Boolean;
var
  st: string;
begin
  st:= Edit_Ver.Text;
  if pos(aFI.Version, st) > 0 then Result:= True
  else                             Result:= False;
end;

{다운로드 시작시간}
procedure TMainForm.SendFSC(aDeviceID :string);
var
  CMD: string;
  st,stAdd: string;
  aLength: Integer;
  aTime: TDatetime;
  aData: String;
  i : integer;
begin

  Delete(aFI.FSC,9,18);
  if RzRadioGroup2.ItemIndex = 0 then   // 즉시 다운로드
  begin
    aFI.FSC:= aFI.FSC +#$20+'00/00/00 00:00:00';
  end else                              // 예약 다운로드
  begin
    RzDateTimePicker2.Date:= RzDateTimePicker1.Date;
    aTime:= RzDateTimePicker2.DateTime;
    st:= FormatDatetime('yy"/"mm"/"dd" "hh":"nn":"ss',aTime);

    aFI.FSC:= aFI.FSC + #$20 + st;
  end;
  //2007 10 12 변경
  st:='1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000';
  for I:= 1 to Group_BroadDownLoad.Items.Count-1 do
  begin
    if Group_BroadDownLoad.ItemChecked[I] then st[I+1]:= '1';
  end;

  stAdd:= ed_DeviceCode.Text + ' ' + FillZeroNumber(strtoint(ed_SendSize.Text),4) ;
  stAdd:= stAdd + ' ' + st;

  CMD:= 'FX'+aFI.CMDCODE;
  aData:= CMD + aFI.FSC + ' ' + stAdd;
//  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(aDeviceID,'F', aData);
  Write_ListBox_DownLoadInfo('펌웨어 시작 시간 전송시작');
end;


procedure TMainForm.Write_ListBox_DownLoadInfo(aData: String);
var
  st: string;
begin
  st:= FormatDatetime('hh":"nn":"ss',Now) +'  '+aData;
  ListBox_DownLoadInfo.Add(st);
  ListBox_DownLoadInfo.ItemIndex:= ListBox_DownLoadInfo.Items.Count;
end;


procedure TMainForm.LoadINI_firmwareInfo;
var
  st: string;
begin
  //GetDir(0,aDir);

  with LMDIniCtrl2 do
  begin
    aFI.Version:= ReadString('DOWNLOAD','Version','');
    aFI.FMM    := ReadString('DOWNLOAD','FMM','');

    st         := ReadString('DOWNLOAD','FSC','');
    aFI.FSC    := FindCharCopy(st,0,',');
    aFI.CMDCODE:= FindCharCopy(st,1,',');

    if aFI.CMDCODE = '' then aFI.CMDCODE:= '00';

    aFI.FWFN   := ReadString('DOWNLOAD','FWFN','');
    aFI.FDFN   := ReadString('DOWNLOAD','FDFN','');
  end;

end;


procedure TMainForm.ReceiveFI(aDeviceID,aData: String);
begin
  if aFI.FWFN <> '' then DownLoadRom(aDeviceID,1,aFI.FWFN);
end;


procedure TMainForm.ReceiveFX(aDeviceID,aData: String);
begin
  if LMDStopWatch1.Active then
  begin
    LMDStopWatch1.Stop;
    Write_ListBox_DownLoadInfo('전송 완료시간:'+LMDStopWatch1.TimeString);
    IsDownLoad:= False;
  end;

end;

procedure TMainForm.Cnt_Lamp(aDeviceID: String; aOn: Boolean);
begin
  if aOn then SendPacket(aDeviceID,'R','RY00'+'LP1')
  else        SendPacket(aDeviceID,'R','RY00'+'LP0')
end;

procedure TMainForm.Cnt_Relay(aDeviceID: String; aNo:String; aFunction:Char; aTime:String);
var
  No: String[2];
begin
  No:= Setlength(aNo,2);
  SendPacket(aDeviceID,'R','RY00'+No+aFunction+aTime)
end;

procedure TMainForm.Cnt_Siren(aDeviceID: String; aOn: Boolean);
begin
  if aOn then SendPacket(aDeviceID,'R','RY00'+'SI1')
  else        SendPacket(aDeviceID,'R','RY00'+'SI0');

end;



{국선체크시간 확인}
procedure TMainForm.CheckLinkusPt(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','Pt00');

end;


{국선체크시간 등록}
procedure TMainForm.RegLinkusPt(aDeviceID, aTime: String);
begin
  SendPacket(aDeviceID,'I','Pt00'+aTime);
end;



{관제 전화번호 확인}
procedure TMainForm.CheckLinkusTellNo(aDeviceID: String; aNo: Integer);
var
  NoStr: String[2];
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  SendPacket(aDeviceID,'Q','Tn00'+NoStr);
end;

{관제 전화번호 등록}
procedure TMainForm.RegLinksTellNo(aDeviceID: String; aNo: Integer;
  aTellno: String);
var
  NoStr: String[2];
  st: string;
begin
  NoStr:= InttoStr(aNo);
  if Length(NoStr) < 2 then NoStr:= '0'+NoStr;
  st:= Setlength(aTellNo,20);
  SendPacket(aDeviceID,'I','Tn00'+NoStr+st);
end;

{링커스 ID확인}
procedure TMainForm.CheckLinkusID(aDeviceID: String);
begin
  Edit_LinkusID.Color:= clWhite;
  Edit_LinkusID.Text:= '';
  SendPacket(aDeviceID,'Q','Id00');
end;

{링커스 ID 등록}
procedure TMainForm.RegLinkusID(aDeviceID, aLinkusId: String);
var
  aID: integer;
  bID: String;
begin
  if not isdigit(aLinkusId) then
  begin
    ShowMessage('관제ID가 잘못 되었습니다.');
    Exit;
  end;
  aID:= Strtoint(aLinkusId);
  bID:= Dec2Hex(aID,4);
  SendPacket(aDeviceID,'I','Id00'+bID);
end;

{링커스 아이디 등록}
procedure TMainForm.btmRegLinkusIDClick(Sender: TObject);
var
  DeviceID: String;
begin
  if Edit_DeviceID.Text = '' then Edit_DeviceID.Text:= '0000000';
  if Edit_LinkusID.Text = '' then Edit_LinkusID.Text := '0000';

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusID(DeviceID,Edit_LinkusID.Text);
end;

{링커스 아이디 확인}
procedure TMainForm.btmCheckLinkusIDClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckLinkusID(DeviceID);
end;

{링커스 관제 전화번호 등록}
procedure TMainForm.btnRegLinkusTel0Click(Sender: TObject);
var
  st: string;
  No: Integer;
  DeviceID: String;
begin
  st:= TRzBitBtn(Sender).Name;
  Delete(st,1,15);
  No:= StrtoInt(st);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case No of
    0: RegLinksTellNo(DeviceID,No,edLinkusTel0.Text);
    1: RegLinksTellNo(DeviceID,No,edLinkusTel1.Text);
    2: RegLinksTellNo(DeviceID,No,edLinkusTel2.Text);
    3: RegLinksTellNo(DeviceID,No,edLinkusTel3.Text);
    4: RegLinksTellNo(DeviceID,No,edLinkusTel4.Text);
  end;
end;
{링커스 관제 전화번호 확인}
procedure TMainForm.btnCheckLinkusTel0Click(Sender: TObject);
var
  st: string;
  No: Integer;
  DeviceID: String;
begin
//
  st:= TRzBitBtn(Sender).Name;
  Delete(st,1,17);
  No:= StrtoInt(st);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case No of
    0: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel0.Color:= clWhite; end;
    1: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel1.Color:= clWhite; end;
    2: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel2.Color:= clWhite; end;
    3: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel3.Color:= clWhite; end;
    4: begin CheckLinkusTellNo(DeviceID,No); edLinkusTel4.Color:= clWhite; end;
  end;
end;

{국선 체크시간 등록}
procedure TMainForm.btnRegPtTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusPt(DeviceID,edPtTime.Text);
  edPtDelayTime.Color:= clWhite;
end;
{국선 체크시간 확인}
procedure TMainForm.btnCheckPtTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckLinkusPt(DeviceID);
end;
{링커스 ID수신}
procedure TMainForm.RcvLinkusId(aDeviceID,aData: String);
begin
  Edit_LinkusID.Color:= clYellow;
  Edit_LinkusID.Text:= GetLinKusID(aData);;
end;
{링커스 국선체크시간 수신}
procedure TMainForm.RcvLinkusPt(aDeviceID,aData: String);
begin
  edPtTime.Color:= clYellow;
  edPtTime.Text:= GetLinkusLineCheckTime(aData) ;
end;

{링커스 관제 번호 수신}
procedure TMainForm.RcvLinkusTelNo(aDeviceID,aData: String);
var
  stLinkusTelNum: String;
  MNo: Integer;
begin
  MNo:= GetLinkusTelNoSeq(aData);
  stLinkusTelNum := GetLinkusTelNum(aData);
  case MNo of
    0:begin edLinkusTel0.Color:= clYellow; edLinkusTel0.Text:= stLinkusTelNum; end;
    1:begin edLinkusTel1.Color:= clYellow; edLinkusTel1.Text:= stLinkusTelNum; end;
    2:begin edLinkusTel2.Color:= clYellow; edLinkusTel2.Text:= stLinkusTelNum; end;
    3:begin edLinkusTel3.Color:= clYellow; edLinkusTel3.Text:= stLinkusTelNum; end;
    4:begin edLinkusTel4.Color:= clYellow; edLinkusTel4.Text:= stLinkusTelNum; end;
  end;
end;

{원격제어:국선체크 대기시간 }
procedure TMainForm.RegLinkusPtDelay(aDeviceID, aTime: String);
begin
  if not isdigit(aTime) then
  begin
    ShowMessage('시간이  올바르지 않습니다.');
    Exit;
  end;
  if Length(aTime) < 2 then aTime:= '0'+aTime;
  SendPacket(aDeviceID,'R','Pt00'+aTime);
end;

procedure TMainForm.btnRegPtDelayTimeClick(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegLinkusPtDelay(DeviceID,edPtDelayTime.Text);
  edPtDelayTime.Color:= clWhite;
end;


procedure TMainForm.RegRingCount(aDeviceID: String; aCount: Integer);
var
  Countstr: string;
begin
  CountStr:= FillZeroNumber(aCount,2);
  SendPacket(aDeviceID,'I','Rc00'+CountStr);
end;

procedure TMainForm.CheckRingCount(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','Rc00');
end;

procedure TMainForm.RcvRingCount(aDeviceID,aData: String);
begin
  Spinner_Ring.Color:= ClYellow;
  Spinner_Ring.Value:= GetLinkusRemoteControlRingCount(aData);
end;


procedure TMainForm.Btn_CheckRingCountClick(Sender: TObject);
var
  DeviceID:String;
begin
  Spinner_Ring.Color:= ClWhite;;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckRingCount(DeviceID);
end;

procedure TMainForm.Btn_RegRingCountClick(Sender: TObject);
var
  DeviceID:String;
begin
  Spinner_Ring.Color:= ClWhite;
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegRingCount(DeviceID,Spinner_Ring.Value);
end;

procedure TMainForm.Btn_CheckCardNoClick(Sender: TObject);
var
  I: Integer;
begin
  if Memo_CardNo.Lines.Count < 1 then
  begin
    ShowMessage('조회할 카드번호/출입번호 가 없습니다.');
    Exit;
  end;
  Memo2.Clear;
  CardAllDownLoad('M');
end;


procedure TMainForm.ClearWiznetInfo;
begin

  Edit_LocalIP.Text:= '';
  Edit_Sunnet.Text:= '';
  Edit_Gateway.Text:= '';
  Edit_LocalPort.Text:= '';
  Edit_ServerIp.Text:= '';
  Edit_Serverport.Text:= '';
  Edit_Time.Text:= '';
  Edit_Size.Text:= '';
  Edit_Char.Text:= '';
  Edit_Idle.Text:= '';
  RzEdit1.Text:= '';
  RzEdit2.Text:= '';
  ComboBox_Boad.ItemIndex:= -1;
  ComboBox_Databit.ItemIndex:= -1;
  ComboBox_Parity.ItemIndex:= -1;
  ComboBox_Stopbit.ItemIndex:= -1;
  ComboBox_Flow.ItemIndex:= -1;

end;


procedure TMainForm.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
  I: Integer;
  S: string;
  st: String;
  st2: String;
  n: Integer;
  MAcStr:String;
begin

  WiznetTimer.Enabled:= False;

  S:= Socket.ReceiveText;

  if  Length(S) < 47 then Exit;

  WiznetData:= S;
  {MAC Address}

  if (copy(S,1,4) <> 'IMIN') and (copy(S,1,4) <> 'SETC') then Exit;

  st:= copy(S,5,6);
  RzEdit2.Text:= ToHexStr(st);
  MAcStr:= ToHexStrNoSpace(st);
  editMAC1.Color:= clYellow;
  editMAC2.Color:= clYellow;
  editMAC3.Color:= clYellow;
  editMAC4.Color:= clYellow;
  editMAC5.Color:= clYellow;
  editMAC6.Color:= clYellow;

  editMAC1.Text:= Copy(MAcStr,1,2);
  editMAC2.Text:= Copy(MAcStr,3,2);
  editMAC3.Text:= Copy(MAcStr,5,2);
  editMAC4.Text:= Copy(MAcStr,7,2);
  editMAC5.Text:= Copy(MAcStr,9,2);
  editMAC6.Text:= Copy(MAcStr,11,2);


  {Mode}
  //if S[11] = #$00 then Checkbox_Client.Checked:= True
  //else                 Checkbox_Client.Checked:= False;

  if S[11] = #$00 then RadioModeClient.Checked:= True
  else if S[11] = #$02 then RadioModeServer.Checked:= True
  else if S[11] = #$01 then RadioModeMixed.Checked:= True;

  {IP Address}
  st:= Copy(S,12,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_LocalIP.Text:= st2;

  {Subnet Mask}
  st:= Copy(S,16,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Sunnet.Text:= st2;

  {GateWay}
  st:= Copy(S,20,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_Gateway.Text:= st2;

  {Port Number- Client}
  st:= copy(S,24,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_LocalPort.Text:= st2;

  {Server IP}
  st:= copy(s,26,4);
  st2:='';
  for I:= 1 to 4 do
  begin
    if I < 4 then st2:= st2 + InttoStr(Ord(st[I]))+'.'
    else          st2:= st2 + InttoStr(Ord(st[I]));
  end;
  Edit_ServerIp.Text:= st2;

  {Server Port}
  st:= copy(S,30,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Serverport.Text:= st2;

  {Serial Baudrate}
  case S[32] of
     #$BB: begin ComboBox_Boad.ItemIndex:= 8; end;
     #$FF: begin ComboBox_Boad.ItemIndex:= 7; end;
     #$FE: begin ComboBox_Boad.ItemIndex:= 6; end;
     #$FD: begin ComboBox_Boad.ItemIndex:= 5; end;
     #$FA: begin ComboBox_Boad.ItemIndex:= 4; end;
     #$F4: begin ComboBox_Boad.ItemIndex:= 3; end;
     #$E8: begin ComboBox_Boad.ItemIndex:= 2; end;
     #$D0: begin ComboBox_Boad.ItemIndex:= 1; end;
     #$A0: begin ComboBox_Boad.ItemIndex:= 0; end;
  end;
  ComboBox_Boad.Text:= ComboBox_Boad.Items[ComboBox_Boad.ItemIndex];
  {Data Bit}
  st:= copy(s,33,1);
  n:= Ord(st[1]);
  if n = 7 then ComboBox_Databit.ItemIndex:= 0
  else if n =8 then ComboBox_Databit.ItemIndex:= 1
  else ComboBox_Databit.Text:= InttoStr(n);
  ComboBox_Databit.Text:= ComboBox_Databit.Items[ComboBox_Databit.ItemIndex];

  {Parity}
  case S[34] of
    #$00: ComboBox_Parity.ItemIndex:= 0;
    #$01: ComboBox_Parity.ItemIndex:= 1;
    #$02: ComboBox_Parity.ItemIndex:= 2;
  end;
  ComboBox_Parity.Text:= ComboBox_Parity.Items[ComboBox_Parity.ItemIndex];
  {Stop Bit}
  st:= copy(s,35,1);
  ComboBox_Stopbit.Text:= InttoStr(Ord(st[1]));

  {Flow Control}
  case S[36] of
    #$00: ComboBox_Flow.ItemIndex:= 0;
    #$01: ComboBox_Flow.ItemIndex:= 1;
    #$02: ComboBox_Flow.ItemIndex:= 2;
  end;
  ComboBox_Flow.Text:= ComboBox_Flow.Items[ComboBox_Flow.ItemIndex];
  {DelimiterChar}
  Edit_Char.Text:= ToHexStrNoSpace(s[37]);
  {FDelimiterSize}
  st:= Copy(S,38,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Size.Text:= st2;
  {Delimitertime}
  st:= Copy(S,40,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Time.Text:= st2;

  {FDelimiterIdle}
  st:= Copy(S,42,2);
  st2:= Hex2DecStr(ToHexStrNoSpace(st));
  Edit_Idle.Text:= st2;

  {Debug Mode}
  if S[44] = #$0 then Checkbox_Debugmode.Checked:= True //IIM7100.FDebugMode:='0' //ON
  else                Checkbox_Debugmode.Checked:= False;// IIM7100.FDebugMode:='1';//OFF

  {Major Version}
  RzEdit1.Text:= InttoStr(Ord(s[45]))+'.'+InttoStr(Ord(s[46]));

  {DHCP MODE}
  if S[47] = #$0 then Checkbox_DHCP.Checked:= False//IIM7100.FOnDHCP:= '0'//OFF
  else                Checkbox_DHCP.Checked:= True;//IIM7100.FOnDHCP:= '1'; //ON

  //Wiznet 접속을 끊는다.
  if (OnWritewiznet = True) and ClientSocket1.Active  then  ClientSocket1.Active:= False;

end;

procedure TMainForm.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RzFieldStatus1.Caption:= '[7100A]'+ClientSocket1.Host + '연결 되었습니다.';
  if not OnWritewiznet then Socket.SendText('FIND');
end;

procedure TMainForm.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode:= 0;
  RzFieldStatus1.Caption:='[7100A]'+ ClientSocket1.Host + '에러가 발생 했습니다.';
end;

procedure TMainForm.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  RzFieldStatus1.Caption:='[7100A]'+ ClientSocket1.Host + '끊어졌습니다.';
end;

procedure TMainForm.ClearLanInfo;
begin

  RzEdit1.Text:= '';
  RzEdit2.Text:= '';
  Edit_LocalIP.Text:= '';
  Edit_Sunnet.Text:= '';
  Edit_Gateway.Text:= '';
  Edit_LocalPort.Text:= '';
  ComboBox_Boad.Text:= '';
  ComboBox_Databit.Text:= '';
  ComboBox_Parity.Text:= '';
  ComboBox_Stopbit.Text:= '';
  ComboBox_Flow.Text:= '';
  Edit_Time.Text:= '';
  Edit_Size.Text:= '';
  Edit_Char.Text:= '';
  Edit_Idle.Text:= '';
  Edit_ServerIp.Text:= '';
  Edit_Serverport.Text:= '';
  Checkbox_Debugmode.Checked:= False;
  Checkbox_DHCP.Checked:= False;
  RadioModeMixed.Checked:= True;
end;

procedure TMainForm.WiznetTimerTimer(Sender: TObject);
begin
  WiznetTimer.Enabled:= False;
  ClientSocket1.Active:= False;
  RzFieldStatus1.Caption:= '';
  ShowMessage('연결이 안됩니다.');

end;

{맥어드레스 등록}
procedure TMainForm.btnRegMACClick(Sender: TObject);
var
  aData: string;
  DeviceID: String;
  MAC: String;
begin
  if editMAC1.Text = '' then editMAC1.Text:= '00';
  if editMAC2.Text = '' then editMAC2.Text:= '00';
  if editMAC3.Text = '' then editMAC3.Text:= '00';
  if editMAC4.Text = '' then editMAC4.Text:= '00';
  if editMAC5.Text = '' then editMAC5.Text:= '00';
  if editMAC6.Text = '' then editMAC6.Text:= '00';

  if Length(editMAC1.Text) < 2 then editMAC1.Text:= '0' + editMAC1.Text;
  if Length(editMAC2.Text) < 2 then editMAC2.Text:= '0' + editMAC2.Text;
  if Length(editMAC3.Text) < 2 then editMAC3.Text:= '0' + editMAC3.Text;
  if Length(editMAC4.Text) < 2 then editMAC4.Text:= '0' + editMAC4.Text;
  if Length(editMAC5.Text) < 2 then editMAC5.Text:= '0' + editMAC5.Text;
  if Length(editMAC6.Text) < 2 then editMAC6.Text:= '0' + editMAC6.Text;
  MAC:= editMAC1.Text + editMAC2.Text + editMAC3.Text +
        editMAC4.Text + editMAC5.Text + editMAC6.Text;

  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  aData:= 'NW99'+
          'AA'+
          MAC +
          '~mAc^wRITe^coNFIrm~';
  SendPacket(DeviceID,'I',aData);
end;

procedure TMainForm.RzButton2Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 6;
end;

procedure TMainForm.RzButton4Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 5;
end;


procedure TMainForm.editMAC1Click(Sender: TObject);
begin
  editMAC1.Color:= clWhite;
  editMAC2.Color:= clWhite;
  editMAC3.Color:= clWhite;
  editMAC4.Color:= clWhite;
  editMAC5.Color:= clWhite;
  editMAC6.Color:= clWhite;
end;

procedure TMainForm.ReconnectSocketTimerTimer(Sender: TObject);
begin
  if DoCloseWinsock then
  begin
    DoCloseWinsock:= False;
    WinsockPort.OPen:= False;
    Panel_ActiveClinetCount.Caption:= 'Closed socket !!!';
  end else
  begin
    //Panel_ActiveClinetCount.Caption:= 'DoCloseWinsock= False';
    if RadioGroup_Mode.ItemIndex = 0 then
      Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속시도'
    else
      Panel_ActiveClinetCount.Caption:= CB_IPList.Text+ ' 접속대기중';
    ReconnectSocketTimer.Enabled:= False;
    WinsockPort.OPen:= True;
  end;
end;

{버젼확인}
procedure TMainForm.RzToolButton3Click(Sender: TObject);
begin
  Cnt_CheckVer(Edit_CurrentID.Text + ComboBox_IDNO.Text);
  Edit_Ver.Text:= '';
  Edit_TopRomVer.Text:= '';
end;

procedure TMainForm.RzBitBtn38Click(Sender: TObject);
var
  aDeviceID: String;
  aFunc: Char;
begin

  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  case cb_RelayOnOff.ItemIndex of
    0: aFunc:= '0';
    1: aFunc:= '1';
    2: aFunc:= 'o';
    3: aFunc:= 'f';
  end;
  Cnt_Relay(aDeviceID,cb_RelayNo.Text,aFunc,cb_RelayTIme.Text);

end;

procedure TMainForm.Cnt_RemoteTellCall(aDeviceID, CallTime: String;aSpeaker: Char; aTellNo: String);
begin
  SendPacket(aDeviceID,'R','Rd01'+'T'+CallTime+aSpeaker+aTellNo);
end;

procedure TMainForm.RzBitBtn33Click(Sender: TObject);
var
  aDeviceID: String;
  aCallTime: String;
  aSpeaker: Char;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;

  aCallTime:= FillZeroNumber(RzSpinEdit1.IntValue,3);
  if CheckBox2.Checked = True then aSpeaker:= 'o'
  else                             aSpeaker:= 'f';
  Cnt_RemoteTellCall(aDeviceID,aCallTime,aSpeaker,edPhoneNo.Text);
end;

procedure TMainForm.RzBitBtn39Click(Sender: TObject);
var
  cmdList: TStringList;
  st: string;
  I: Integer;
  aData: String;
begin
  cmdList:= TStringList.Create;
  cmdList.Clear;

  RzOpenDialog1.Title:= '데이터 전송 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'cmd';
  RzOpenDialog1.Filter := 'INI files (*.cmd)|*.CMD';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    cmdList.LoadFromFile(st);
  end;

  for I:= 0 to cmdList.Count-1 do
  begin
    aData:= cmdList[I];
    Array_SendEdit[I].Edit.Text := FindCharCopy(aData,1,',');
    Array_SendEdit[I].Func.Text := FindCharCopy(aData,0,',');
  end;
  cmdList.Free;
end;

procedure TMainForm.RzBitBtn41Click(Sender: TObject);
var
  cmdList: TStringList;
  st: String;
  aFile: String;
  I:Integer;
begin
  cmdList:= TStringList.Create;
  cmdList.Clear;
  for I:= 0 to 15 do
  begin
    st:= Array_SendEdit[I].Func.Text + ',' + Array_SendEdit[I].Edit.Text;
    cmdList.Add(st);
  end;

  RzSaveDialog1.DefaultExt:= 'cmd';
  RzSaveDialog1.Filter := 'INI files (*.cmd)|*.CMD';

  if RzSaveDialog1.Execute then
  begin
    aFile:= RzSaveDialog1.FileName;
    cmdList.SavetoFile(aFile);
  end;
  cmdList.Free;
  SHowMessage('저장이 완료 되었습니다.');

end;

procedure TMainForm.DLRadioGroupChange(Sender: TObject;
  ButtonIndex: Integer);
begin
  if ButtonIndex = 0 then DLCodeEdit.enabled := False
  else begin DLCodeEdit.enabled := True; DLCodeEdit.Setfocus; end;
end;

procedure TMainForm.DLCheckBoxChange(Sender: TObject);
begin
  if DLCheckBox.Checked then
  begin
    DLRadioGroup.Enabled:= True;
    DLRadioGroup.ItemIndex:= 0;
  end else
  begin
    DLRadioGroup.Enabled:= False;
    DLCodeEdit.Enabled:= False;
  end;
end;

procedure TMainForm.btnRegisterClearClick(Sender: TObject);
begin
  if MessageDlg('기기가 초기화 됩니다. 정말 진행 하시겠습니까 ?'+#13#13+ '기기번호: '+ComboBox_IDNO.Text,
    mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  Cnt_ClearRegister(Edit_CurrentID.Text + ComboBox_IDNO.Text);
end;

// 등록할 카드 번호 메모장에 추가
procedure TMainForm.Append_Memo_CardNo(aCardNo: String);
begin
  if Memo_CardNo.Lines.Indexof(aCardNo) < 0 then
  begin
    Memo_CardNo.Lines.Add(aCardNo);
  end;
end;

procedure TMainForm.Memo_CardNoChange(Sender: TObject);
begin
  GroupBox1.Caption:= '등록할 카드 번호['+InttoStr(Memo_CardNo.Lines.Count)+']';
end;

//카드번호 불러오기
procedure TMainForm.N4Click(Sender: TObject);
var
  filename: String;
begin
  Memo_CardNo.Lines.Clear;
  OpenDialog1.DefaultExt:= 'TXT';
  OpenDialog1.Filter := 'Text files (*.txt)|*.txt';
  if OpenDialog1.Execute then
  begin
   filename := OpenDialog1.FileName;

   Memo_CardNo.Lines.LoadFromFile(Filename);
  end;
end;

//카드번호 저장하기
procedure TMainForm.N5Click(Sender: TObject);
var
  filename: String;
begin

  SaveDialog1.DefaultExt:= 'TXT';
  SaveDialog1.Filter := 'Text files (*.txt)|*.txt';
  if SaveDialog1.Execute then
  begin
   filename := SaveDialog1.FileName;
   Memo_CardNo.Lines.SavetoFile(FileName);
  end;
end;


//카드데이터 전체 삭제
procedure TMainForm.Btn_DelCardNoBtn_DelAllCardNoClick(Sender: TObject);
Var
  DeviceID:String;
begin
  DeviceID:=Edit_CurrentID.Text + ComboBox_IDNO.Text;

  CD_DownLoad(DeviceID,'0000000000','O');
end;

procedure TMainForm.RzButton3Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 13;
end;

procedure TMainForm.LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F2 then SHowMessage('12121');
end;

procedure TMainForm.ComboBox_IDNOChange(Sender: TObject);
begin
  if ComboBox_IDNO.ItemIndex < 6 then
     rgDeviceNo.ItemIndex:= ComboBox_IDNO.ItemIndex;
  ed_DeviceNo.text := ComboBox_IDNO.text;
end;

procedure TMainForm.rgDeviceNoChanging(Sender: TObject; NewIndex: Integer;
  var AllowChange: Boolean);
begin
  ComboBox_IDNO.ItemIndex:= NewIndex;
  ed_DeviceNo.text := rgDeviceNo.Items[NewIndex];
end;


procedure TMainForm.Group_DeviceBaseChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_Device.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_Device.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_Device.Items.Count -1  do Group_Device.ItemChecked[I]:= True;
      for I:= 0 to Group_DeviceBase.Items.Count -1  do Group_DeviceBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_Device.Items.Count -1  do Group_Device.ItemChecked[I]:= False;
      for I:= 0 to Group_DeviceBase.Items.Count -1  do Group_DeviceBase.ItemChecked[I]:= False;
    end;

  end;
end;

procedure TMainForm.Btn_CheckStatusClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:='';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'0','0' );
end;

procedure TMainForm.btnCheckCdVerClick(Sender: TObject);
var
  DeviceID: String;
begin
  if Group_CardReader.ItemIndex > 0 then
  begin
    Label17.Caption:= 'Reader Ver:' ;
    DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
    Cnt_CheckCdVer(DeviceID,Group_CardReader.ItemIndex);
  end else
  begin
    MessageDlg('리더기 번호를 선택해 주세요 (1 ~ 8)', mtError, [mbOK], 0);
  end;
end;

// 스케쥴 지정
procedure TMainForm.RzGroup3Items3Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 3;

end;


procedure TMainForm.RzBitBtn43Click(Sender: TObject);
var
  DeviceID: String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegFoodTime(DeviceID);
end;

procedure TMainForm.Btn_RDoorOPenClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo3.ItemIndex+1,'3','0' );
  //DoorModeChange(DeviceID,'1');
end;

procedure TMainForm.Btn_RDoorCloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo3.ItemIndex+1,'3','1' );
  //DoorModeChange(DeviceID,'1');
  //beep

end;

procedure TMainForm.miSoundClick(Sender: TObject);
begin
  Notebook1.PageIndex := 14;
end;

procedure TMainForm.btWavClick(Sender: TObject);
var
  st : string;
  edit : TEdit;
begin

  RzOpenDialog1.Title:= '소리 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'wav,mp3';
  RzOpenDialog1.Filter := 'WAV files (*.wav,*.mp3)|*.WAV;*.MP3';
  if RzOpenDialog1.Execute then
  begin
    edit := TravelEditItem(GroupBox19, strtoint((Sender as TRzBitBtn).Hint));
    if edit <> nil then
    edit.Text := RzOpenDialog1.FileName;
 end;

end;

procedure TMainForm.edFileChange(Sender: TObject);
var
  Play : TRzBitBtn;
begin
  Play := TravelPlayItem(GroupBox19,strtoint((Sender as TEdit).hint ));
  if Play <> nil then
  begin
    if (Sender as TEdit).text = '' then Play.enabled := false
    else  Play.enabled := True;
  end;

end;



procedure TMainForm.btPlayClick(Sender: TObject);
var
  edit : TEdit;
begin
  edit := TravelEditItem(GroupBox19,strtoint((Sender as TRzBitBtn).Hint));
  if edit.text = '' then exit;
  MediaPlayer1.FileName := edit.text;
  MediaPlayer1.Open;
  MediaPlayer1.play;
end;

function TMainForm.TravelEditItem(GroupBox:TGroupBox; no: Integer): TEdit;
var
Loop:integer;
begin
  Result:= Nil;
  //showmessage(GroupBox.Controls[0].ClassName);

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'edfile' + inttostr(no) then
    Begin
      Result:=TEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

function TMainForm.TravelPlayItem(GroupBox:TGroupBox; no: Integer): TRzBitBtn;
var
Loop:integer;
begin
  Result:= Nil;
  //showmessage(GroupBox.Controls[0].ClassName);

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'btplay' + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

function TMainForm.TravelWavItem(GroupBox:TGroupBox; no: Integer): TRzBitBtn;
var
Loop:integer;
begin
  Result:= Nil;

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'btwav' + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;
end;

procedure TMainForm.btAllClearClick(Sender: TObject);
var
  edit:TEdit;
  Loop:Integer;
  rzedit: TRzEdit;
  check:TCheckBox;
  edExe:TEdit;
begin
  for Loop := 1 to CONTROLCNT do
  begin
     check := TravelCheckItem(Groupbox19,Loop);
     check.checked := False;

     rzedit := TravelCompareItem(GroupBox19, Loop);
     rzedit.Text := '';
     edit := TravelEditItem(GroupBox19, Loop);
     edit.text := '';
     edExe := TravelEdExeItem(GroupBox19, Loop);
     edExe.text := '';
  end;

end;

procedure TMainForm.btSelectClearClick(Sender: TObject);
var
  edit:TEdit;
  edExe:TEdit;
  Loop:Integer;
  check:TCheckBox;
  rzedit: TRzEdit;
begin

  for Loop := 1 to CONTROLCNT do
  begin
    check := TravelCheckItem(Groupbox19,Loop);
    if check.checked then
    begin
     rzedit := TravelCompareItem(GroupBox19, Loop);
     rzedit.Text := '';
     edit := TravelEditItem(GroupBox19, Loop);
     edit.text := '';
     edExe := TravelEdExeItem(GroupBox19, Loop);
     edExe.text := '';
    end;
  end;

end;


function TMainForm.StringAND(Src, Org: String; len: integer): String;
var
  bSrc : Byte;
  bOrg : Byte;
  stSrc,stOrg : String;
  Loop : integer;
  Temp : Byte;
begin

  Result:= '';
//  Src := stringreplace(src,' ',inttostring($00));

  for Loop:=1 to len do
  begin
    bSrc := Byte( Src[Loop] );
    if bSrc = $20 then bSrc := $00;
    bOrg := Byte( Org[Loop] );
    Temp := bSrc And bOrg;
    Result:= Result + IntToHex( Temp, 2 );
  end;
end;

function TMainForm.StringXOR(Src, Org: String): Boolean;
var
  bSrc : Byte;
  bOrg : Byte;
  stSrc,stOrg : String;
  Loop : integer;
  Temp : Byte;
  len : integer;
begin

  Result:= False;
  len := length(src);
  for Loop:=1 to len do
  begin
    bSrc := Byte( Src[Loop] );
    bOrg := Byte( Org[Loop] );
    Temp := bSrc Xor bOrg;
    if Temp = $00 then continue  //0x00 이면 같으므로 계속 비교
    else exit;
  end;

  Result:= True;
end;

function TMainForm.StrToHex(const S: string): string;
var
 Index: Integer;
 bSrc : Byte;
begin
 Result := '';
 for Index := 1 to Length(S) do
 begin
   bSrc := Byte( S[Index] );
   if bSrc = $20 then bSrc := $00;
   Result := Result + IntToHex( bSrc, 2 );
 end;
end;


function TMainForm.DataCompare(Data: String; no: Integer): Boolean;
var
  stTemp : String;
  rzedit: TRzEdit;
  Loop:Integer;
begin

  Result:= False;
  rzedit := TravelCompareItem(GroupBox19, no);
  if rzedit.text = '' then exit;

  stTemp:= StringAND(rzedit.Text,Data,length(rzedit.Text));
  Result:= StringXOR(StrToHex(rzedit.Text),stTemp);

end;

procedure TMainForm.WarningBeep(no: Integer);
var
  Play : TRzBitBtn;
begin
  Play := TravelPlayItem(GroupBox19,no);
  if Play <> nil then
  begin
    Play.click;
  end;
end;

procedure TMainForm.rdSelectCardNoClick(Sender: TObject);
begin

  lblcard.Visible := False;
  edcard.visible := False;
  btBroadFile.visible := False;
  //chk_BroadFile.Left := 392;

  if (rdSelectCardNo.ItemIndex = 0) or (rdSelectCardNo.ItemIndex = 1) then  //난수 또는 순차증가
  begin
    lblcard.Visible := True ;
    lblcard.caption := '카드번호생성갯수';
    edcard.visible := True;
    edcard.text := '';
    //chk_BroadFile.Left := 492;
  end
  else if rdSelectCardNo.ItemIndex = 2 then
  begin
    btBroadFile.visible := True;
    if edBRFileLoad.text = '' then
    begin
      btBroadFileclick(Self);
    end;
    //chk_BroadFile.Left := 492;
  end
  else if rdSelectCardNo.ItemIndex = 3 then
  begin
    lblcard.Visible := True ;
    lblcard.caption := '카드번호';
    edcard.visible := True;
    edcard.text := '';
  end;
end;

procedure TMainForm.chk_BroadFileClick(Sender: TObject);
begin
  if chk_BroadFile.Checked then
  begin
    if edBroadFileSave.Text = '' then
    begin
      SaveDialog1.Title:= '생성할 파일 이름';
      SaveDialog1.DefaultExt:= 'txt';
  //    OpenDialog1.Options := [ofCreatePrompt]	;
      SaveDialog1.Filter := 'TXT files (*.txt)|*.TXT';
      if SaveDialog1.Execute then
      begin
        edBroadFileSave.Text := SaveDialog1.FileName;
      end;
    end;
    btBroadFileSet.enabled := True;
    btCaptureSave.enabled := True;
    if edBroadFileSave.Text = '' then
    begin
      chk_BroadFile.Checked := False;
      btBroadFileSet.enabled := False;
      btCaptureSave.enabled := False;
    end else
    begin
         if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
    end;

  end
  else
  begin
    btBroadFileSet.enabled := False;
    btCaptureSave.enabled := False;
    if BroadSaveFileList.count > 0 then BroadSaveFileList.SaveToFile(edBroadFileSave.text);
    BroadSaveFileList.clear;
  end;
end;

procedure TMainForm.btBroadFileClick(Sender: TObject);
begin
  OpenDialog1.Title:= '카드 데이터 찾기';
  OpenDialog1.DefaultExt:= 'txt';
//  OpenDialog1.Options := [ofReadOnly]	;
  OpenDialog1.Filter := 'TXT files (*.txt)|*.TXT';
  if OpenDialog1.Execute then
  begin
    BroadFileList.Clear;
    edBRFileLoad.text := OpenDialog1.FileName;
    if edBRFileLoad.text <> '' then
    begin
      if fileexists(edBRFileLoad.text) = true then BroadFileList.LoadFromFile(edBRFileLoad.text);
    end;
  end;


end;

procedure TMainForm.Group_BroadDeviceBaseChange(Sender: TObject; Index: Integer;
  NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_BroadDevice.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_BroadDevice.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_BroadDevice.Items.Count -1  do Group_BroadDevice.ItemChecked[I]:= True;
      for I:= 0 to Group_BroadDeviceBase.Items.Count -1  do Group_BroadDeviceBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_BroadDevice.Items.Count -1  do Group_Device.ItemChecked[I]:= False;
      for I:= 0 to Group_BroadDeviceBase.Items.Count -1  do Group_BroadDeviceBase.ItemChecked[I]:= False;
    end;

  end;
end;






procedure TMainForm.btBroadFileSetClick(Sender: TObject);
begin
  BroadSaveFileList.Clear;
  edBroadFileSave.Text := '';
  SaveDialog1.Title:= '생성할 파일 이름';
  SaveDialog1.DefaultExt:= 'txt';
  SaveDialog1.Filter := 'TXT files (*.txt)|*.TXT';

  if SaveDialog1.Execute then
  begin
    edBroadFileSave.Text := SaveDialog1.FileName;
  end;
  if edBroadFileSave.Text = '' then
  begin
      chk_BroadFile.Checked := False;
      btBroadFileSet.enabled := False;
  end else
  begin
    if fileexists(edBroadFileSave.Text) = true then BroadSaveFileList.LoadFromFile(edBroadFileSave.Text);
  end;
end;


procedure TMainForm.btCaptureSaveClick(Sender: TObject);
begin
  btCaptureSave.enabled := False;
  BroadSaveFileList.SaveToFile(edBroadFileSave.text);
  BroadSaveFileList.clear;
  if chk_broadfile.checked then
  begin
     chk_broadfile.checked := False ;
     btBroadFileSet.enabled := False;
     btCaptureSave.enabled := False;
  end;
end;



procedure TMainForm.btBroadStopClick(Sender: TObject);
var
  stDeviceID : String;
  stData : String;
begin
  btBroadStop.Enabled := False;
  //ControlID추출
  stDeviceID := Edit_CurrentID.Text + '00';

  //송신데이터 생성
  if rdMaster.ItemIndex = 0 then   //Server 이면
  begin
    CardBroadSendCount := 0;
    stData := 'BI' + FillZeroNumber(0,9);
  end
  else
  begin
    stData := 'BS' + FillZeroNumber(0,9);
  end;
  
  //데이터 전송
  SendPacket(stDeviceID,'*',stData);
end;

procedure TMainForm.BroadTimerTimer(Sender: TObject);
var
  stDeviceID : String;
begin
  stDeviceID := Edit_CurrentID.Text + '00';
  SendPacket(stDeviceID,'*',BroadSendData);
end;

procedure TMainForm.broadStopTimerTimer(Sender: TObject);
begin
  BroadTimer.Enabled := False;
  showmessage('통신상태가 불량합니다.');
end;

procedure TMainForm.btExe1Click(Sender: TObject);
var
  st : string;
  edit : TEdit;

begin

  RzOpenDialog1.Title:= '실행 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'exe';
  RzOpenDialog1.Filter := 'EXE files (*.exe)|*.exe';
  if RzOpenDialog1.Execute then
  begin
    edit := TravelEdExeItem(GroupBox19, strtoint((Sender as TRzBitBtn).Hint));
    if edit <> nil then
    edit.Text := RzOpenDialog1.FileName;

 end;

end;

function TMainForm.TravelEdExeItem(GroupBox: TGroupBox;
  no: Integer): TEdit;
var
Loop:integer;
begin
  Result:= Nil;
  //showmessage(GroupBox.Controls[0].ClassName);

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'edexe' + inttostr(no) then
    Begin
      Result:=TEdit(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

procedure TMainForm.edExe1Change(Sender: TObject);
var
  btExe : TRzBitBtn;
begin
  btExe := TravelFileItem(GroupBox19,strtoint((Sender as TEdit).hint ));
  if btExe <> nil then
  begin
    if (Sender as TEdit).text = '' then btExe.Font.color := clBlack
    else  btExe.Font.color := clYellow;
  end;

end;

function TMainForm.TravelFileItem(GroupBox:TGroupBox; no: Integer): TRzBitBtn;
var
Loop:integer;
begin
  Result:= Nil;
  //showmessage(GroupBox.Controls[0].ClassName);

  For Loop:=0 to GroupBox.ControlCount-1 do
  Begin
    If LowerCase(GroupBox.Controls[Loop].name) = 'btexe' + inttostr(no) then
    Begin
      Result:=TRzBitBtn(GroupBox.Controls[Loop]);
      exit;
    End;
  End;

end;

procedure TMainForm.edYYYYKeyPress(Sender: TObject; var Key: Char);
begin
  if length(edYYYY.text)=2 then edMM.setfocus;
end;

procedure TMainForm.edMMKeyPress(Sender: TObject; var Key: Char);
begin
  if  ck_YYMMDD.checked And  (length(edMM.text)=2)  then
  begin
      edDD.setfocus;
  end;
end;

procedure TMainForm.edDDKeyPress(Sender: TObject; var Key: Char);
begin
  if  ck_YYMMDD.checked And (length(edDD.text)=2)  then
  begin
    Btn_RegCardNo.setfocus;
  end;
end;

procedure TMainForm.edMMExit(Sender: TObject);
begin
  if  ck_YYMMDD.checked  then
  begin
    if (strtoint('0' + edMM.text) > 12) OR (strtoint('0' + edMM.text) < 1)  then
    begin
      showmessage('월의 형식이 맞지 않습니다.');
      edMM.setfocus;
    end;
  end;
end;

procedure TMainForm.edDDExit(Sender: TObject);
begin
    if (strtoint('0' + edDD.text) > 31) OR (strtoint('0' + edDD.text) < 1)  then
    begin
      showmessage('일의 형식이 맞지 않습니다.');
      edDD.setfocus;
    end;

end;

procedure TMainForm.ck_YYMMDDClick(Sender: TObject);
begin
  if ck_YYMMDD.checked then edYYYY.setfocus;
end;



procedure TMainForm.Group_BroadDownLoadBaseChange(Sender: TObject;
  Index: Integer; NewState: TCheckBoxState);
var
 I: Integer;
 Base: Integer;
begin
  if Index < 10 then
  begin
    Base:= Index * 10;
    if NewState = cbChecked then
    begin
      for I:= 0 to 9 do Group_BroadDownLoad.ItemChecked[Base + I]:= True;
    end else
    begin
      for I:= 0 to 9 do Group_BroadDownLoad.ItemChecked[Base + I]:= False;
    end;
  end else
  begin
    if NewState = cbChecked then
    begin
      for I:= 0 to Group_BroadDownLoad.Items.Count -1  do Group_BroadDownLoad.ItemChecked[I]:= True;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= True;

    end else
    begin
      for I:= 0 to Group_BroadDownLoad.Items.Count -1  do Group_BroadDownLoad.ItemChecked[I]:= False;
      for I:= 0 to Group_BroadDownLoadBase.Items.Count -1  do Group_BroadDownLoadBase.ItemChecked[I]:= False;
    end;

  end;
end;


procedure TMainForm.BroadFirmwareProcess(aDeviceID,aData: String);
var
  aRegCode: String;
begin

  aRegCode:= Copy(aData,19,2);
  //FI:Flash Memory Map
  //FP:Flash Writer File Name
  //FD:Flash Data File Name
  //FX:Flash Start Command

  if aRegCode = 'FI' then
  begin
    IsDownLoad:= True;
    //if cb_Download.Checked = False then  ReceiveFI(aData)
    if rdMode.ItemIndex = 1 then ReceiveFI(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('펌웨어 업그레이드정보 응답');
  end else if aRegCode = 'FP' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 0 then ReceiveFPFD(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash write program 응답');
  end else if aRegCode = 'FD' then
  begin
    //if cb_Download.Checked = False then ReceiveFPFD(aData)
    if rdMode.ItemIndex = 1 then ReceiveFPFD(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash Data program 응답');
  end else if aRegCode = 'FX' then
  begin
    //if cb_Download.Checked = False then ReceiveFX(aData)
    if rdMode.ItemIndex = 0 then ReceiveFX(aDeviceID,aData)
    else Write_ListBox_DownLoadInfo('flash exec data 요청 응답');
  end else  if aRegCode = 'FU' then
  begin

  end else
  begin

  end;
end;




function TMainForm.BroadControlNumConvert(Num: Integer): String;
var
  nTemp : array[0..8, 0..7] of Integer;
  i,j,k : Integer;
  stTemp: String;
  stHex:String;
  nDecimal: Integer;
begin

  for i:=0 to 8 do
  begin
    for j:=0 to 7 do
    begin
      nTemp[i,j]:=0;
    end;
  end;


  i := Num div 8;
  j := Num Mod 8 ;

  nTemp[i,j] := 1;

  stHex := '';
  for k:=0 to 8 do
  begin
    nDecimal := 0;
    stTemp := '';
    For j:= 4 to 7 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j - 4));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));
    nDecimal := 0;

    For j:= 0 to 3 do
    Begin
        nDecimal := nDecimal + nTemp[k,j] * Trunc(Power(2, j));
    end;
    stTemp := '3' + IntToHex(nDecimal,1);
    stHex := stHex + Char(StrToIntDef('$' + stTemp, 0));

  end;

  //showmessage(stTemp);
  Result:=stHex;

end;


procedure TMainForm.BitBtn1Click(Sender: TObject);
var
  st: string;
  iFileLength: Integer;
  iBytesRead: Integer;
  iFileHandle: Integer;
begin

  RzOpenDialog1.Title:= '펌웨어 설정 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'ini';
  RzOpenDialog1.Filter := 'INI files (*.ini)|*.INI';
  if RzOpenDialog1.Execute then
  begin
    st:= RzOpenDialog1.FileName;
    RzButtonEdit1.Text:= st;
    LMDIniCtrl2.IniFile:= st;
    LoadINI_firmwareInfo;
    st:= aFI.Version + #13+
         aFI.FMM     + #13+
         aFI.FSC     + #13+
         aFI.FWFN    + #13+
         aFI.FDFN;
    ROM_FlashWrite.Clear;
    ROM_FlashWrite.LoadFromFile(aFI.FWFN);
    ROM_FlashData.Clear;
    ROM_FlashData.LoadFromFile(aFI.FDFN);
    //여기서 첫번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FWFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashWrite := nil;
    ROM_BineryFlashWrite := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashWrite^, iFileLength);
    FileClose(iFileHandle);
    
    //여기서 두번째 파일을 읽어 들이자
    iFileHandle := FileOpen(aFI.FDFN, fmOpenRead);
    iFileLength := FileSeek(iFileHandle,0,2);
    FileSeek(iFileHandle,0,0);

    ROM_BineryFlashData := nil;
    ROM_BineryFlashData := PChar(AllocMem(iFileLength + 1));
    iBytesRead := FileRead(iFileHandle, ROM_BineryFlashData^, iFileLength);

    FileClose(iFileHandle);
  end;

end;

function TMainForm.RegCardReaderType(aDeviceID: string;
  nType: integer): Boolean;
var
  aData: string;
  nTime : integer;
begin
  Result := false;
  cb_CardType.itemIndex := 0;
  if (nType < 1) or (nType > 2) then Exit;
  aData := 'Ct00' + inttostr(nType - 1);                               //카드리더 타입 등록

//  bCardReaderTypeCheck := False;
  SendPacket(aDeviceID, 'I', aData);


  Result := true;

end;

procedure TMainForm.btn_TimecheckClick(Sender: TObject);
begin
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','TM9920000000000099');
end;

procedure TMainForm.RcvCardType(aDeviceID,aData: string);
var
  st: string;
  aCount: Integer;
  stECUID : string;
  chCardType : char;
begin
  chCardType := GetCardReaderType(aData);
  if chCardType = '0' then
  begin
    cb_CardType.ItemIndex := 1;
  end else if chCardType = '1' then
  begin
    cb_CardType.ItemIndex := 2;
  end else
  begin
    cb_CardType.ItemIndex := 0;
  end;

  cb_CardType.Color := clYellow;

end;

procedure TMainForm.btn_CuerrentClick(Sender: TObject);
begin
  SendPacket(Edit_CurrentID.Text + ComboBox_IDNO.Text,'R','RD00');

end;

procedure TMainForm.PrintLog(aData: String);
var
 position: Integer;
 LineNo: Integer;
begin

  LineNo:= RichEdit1.Lines.Count;
  position := RichEdit1.Perform(EM_LINEINDEX, LineNo, 0) + Length(RichEdit1.Lines[LineNo]);
  RichEdit1.SelStart := position;
  RichEdit1.SelLength := 0;
  RichEdit1.SelText := aData;
  SendMessage(RichEdit1.handle, EM_SCROLLCARET,0,0);


end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  bStop := False;
end;

procedure TMainForm.btn_PlayClick(Sender: TObject);
begin
  bStart := True;
  btn_Moment.enabled := True;
  btn_Stop.enabled := True;
  btn_Play.enabled := False;
end;

procedure TMainForm.btn_MomentClick(Sender: TObject);
begin
  bStart := False;
  btn_Play.enabled := True;
  btn_Moment.enabled := False;
  btn_Stop.enabled := False;
end;

procedure TMainForm.btn_StopClick(Sender: TObject);
begin
  bStop := True;
  pn_Gauge.Visible := False;
end;

procedure TMainForm.RzBitBtn47Click(Sender: TObject);
var
 DeviceID : String;
 i,j : Integer;
 aCardNo : String;
begin
  Label136.Caption :=inttostr(LMDListBox1.SelCount);
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  for i:= 0 to  LMDListBox1.Count - 1 do
  begin
    if  LMDListBox1.Selected[i] then
    begin
      aCardNo:= FindCharCopy(LMDListBox1.Items.Strings[i],8,';');
      Label136.Caption := LMDListBox1.Items.Strings[i];
      //CD_DownLoad(DeviceID,aCardNo,'N');
      if chk_CmdX.Checked then CD_XDownLoad(DeviceID,aCardNo,'N')
      else CD_DownLoad(DeviceID,aCardNo,'N');
    end;
    Sleep(100);
    Application.ProcessMessages;
  end;
end;

procedure TMainForm.RzBitBtn48Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD00');
end;

procedure TMainForm.RzBitBtn49Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD01');

end;

procedure TMainForm.RzBitBtn50Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD11');

end;

procedure TMainForm.RzBitBtn51Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD12');

end;

procedure TMainForm.RzBitBtn52Click(Sender: TObject);
var
  stDeviceID : string;
begin
  stDeviceID := Edit_CurrentID.Text + ComboBox_IDNO.Text;
  SendPacket(stDeviceID,'R','CD10');

end;

procedure TMainForm.RegControlDialTime(aDeviceID: String; OnTime,
  OffTime: Integer);
var
  aTime: Integer;
  bTIme: Integer;
  Timestr: string;
begin
  aTime:= onTime div 20;
  bTime:= OffTime div 20;

  Timestr:= FillZeroNumber(aTime,2) +   // On Time
            FillZeroNumber(bTime,2);    // Off Time
  SendPacket(aDeviceID,'I','DT00'+TimeStr);

end;

procedure TMainForm.btn_ControlRegClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  RegControlDialTime(DeviceID,StrtoInt(cmb_ControlOnTime.Text),StrtoInt(cmb_ControlOffTime.Text));

end;

procedure TMainForm.CheckControlDialTime(aDeviceID: String);
begin
  SendPacket(aDeviceID,'Q','DT00');
end;

procedure TMainForm.btn_ControlSearchClick(Sender: TObject);
var
  DeviceID:String;
begin
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  CheckControlDialTime(DeviceID);

end;

procedure TMainForm.RcvControlDialInfo(aDeviceID,aData: String);
var
  st: string;
  aTime: Integer;
  bTime: Integer;
begin
  cmb_ControlOnTime.Color:= ClYellow;
  cmb_ControlOffTime.Color:= ClYellow;
  st:= copy(aData,5,4);
  aTime:= StrtoInt(Copy(st,1,2));
  bTime:= StrtoInt(Copy(st,3,2));

  cmb_ControlOnTime.Text:= InttoStr(aTime * 20);
  cmb_ControlOffTime.Text:= InttoStr(bTime * 20);
end;

procedure TMainForm.chk_SendTimeClick(Sender: TObject);
begin
  if chk_SendTime.Checked then ed_SendTime.Enabled := True
  else ed_SendTime.Enabled := False;
end;

procedure TMainForm.btn_CardDownLoadStopClick(Sender: TObject);
begin
  bCardDownLoadStop := True;
end;

procedure TMainForm.btn_SortClick(Sender: TObject);
begin
  SendPacket(Edit_CurrentID.text + ComboBox_IDNO.Text,'R','st00' + FillZeroNumber(strtoint(ed_SortMin.text),2));
end;

procedure TMainForm.btn_SortDispClick(Sender: TObject);
begin
  ed_SortDisp.Color:= clWhite;
  ed_SortDisp.Text := '';
  SendPacket(Edit_CurrentID.text + ComboBox_IDNO.Text,'R','sc00');

end;

procedure TMainForm.btn_CloseClick(Sender: TObject);
var
  DeviceID: String;
begin
  lbDoorControl.Caption:= '';
  DeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  DoorControl(DeviceID,gbDoorNo2.ItemIndex+1,'2','2' );

end;

procedure TMainForm.RzBitBtn53Click(Sender: TObject);
begin
    Notebook1.PageIndex:= 7;
end;

procedure TMainForm.RzBitBtn54Click(Sender: TObject);
begin
  Notebook1.PageIndex:= 9;

end;

procedure TMainForm.Button4Click(Sender: TObject);
begin
  showmessage(ConvertToHex('abcdefg'));
end;


procedure TMainForm.CD_XDownLoad(aDevice, aCardNo: String; func: Char);
var
  aData: String;
  I: Integer;
  xCardNo: String;
  RealCardNo: String;
  ValidDay: String;
  aLength: Integer;
  stYY,stMM,stDD:String;
  aRegCode,aCardAuth,aInOutMode : String;
  stCardLength : string;
begin

  aLength:= Length(aCardNo);
  if aLength < 10 then
    stCardLength := inttoStr(aLength)
  else
    stCardLength := Hex2Ascii(Dec2Hex(Ord('A') + (aLength - 10),2));

  //SHowMessage(aCardNo);
  RealCardNo:= Copy(aCardNo,1,10);
  ValidDay:=   Copy(aCardNo,11,6);
  //xCardNo:=  '00'+Dec2Hex64(StrtoInt64(RealCardNo),8);
  xCardNo:=  '00'+EncodeCardNo(RealCardNo);

  stYY := edYYYY.text;
  stMM := edMM.text;
  stDD := edDD.text;
  if (ck_YYMMDD.checked = False) or (stYY = '') then stYY := '0';
  if (ck_YYMMDD.checked = False) or (stMM = '') then stMM := '0';
  if (ck_YYMMDD.checked = False) or (stDD = '') then stDD := '0';

  aRegCode := inttostr(rdRegCode.itemindex);
  if rdCardAuth.itemindex > 0 then
    aCardAuth := inttostr(rdCardAuth.itemindex - 1)
  else aCardAuth := '2';
  aInOutMode := inttostr(rdInOutMode.itemindex);

  aData:= '';
  aData:= func +
          //InttoStr(Send_MsgNo)+     // Message Count
          '0'+
          aRegCode+                      //등록코드(0:1,2   1:1번문,  2:2번문, 3:방범전용)
          '  '+                     //RecordCount #$20 #$20
          stCardLength +                      //카드번호길이
          aCardNo+                  //카드번호
//          ValidDay+                 //유효기간
          FillZeroNumber(strtoint(stYY),2) +
          FillZeroNumber(strtoint(stMM),2) +
          FillZeroNumber(strtoint(stDD),2) + //유효기간
          '0'+                      //등록 결과
          aCardAuth+                      //카드권한(0:출입전용,1:방범전용,2:방범+출입)
          aInOutMode;                      //타입패턴

  //SHowMessage(aData);
  SendPacket(aDevice,'c',aData);
end;

end.


(*

uses ... ShlObj, ActiveX;
...
function TForm1.GetTarget
  (const LinkFileName:String):String;
var
   psl  : IShellLink;
   ppf  : IPersistFile;
   WidePath  : Array[0..260] of WideChar;
   Info      : Array[0..MAX_PATH] of Char;
   wfs       : TWin32FindData;
begin
 if UpperCase(ExtractFileExt(LinkFileName)) <> '.LNK' Then
 begin
   Result:='NOT a shortuct by extension!';
   Exit;
 end;

 CoCreateInstance(CLSID_ShellLink,
                  nil,
                  CLSCTX_INPROC_SERVER,
                  IShellLink,
                  psl);
 if psl.QueryInterface(IPersistFile, ppf) = 0 then
 begin
   MultiByteToWideChar(CP_ACP,
                       MB_PRECOMPOSED,
                       PChar(LinkFileName),
                       -1,
                       @WidePath,
                       MAX_PATH);
   ppf.Load(WidePath, STGM_READ);
   psl.GetPath(@info,
               MAX_PATH,
               wfs,
               SLGP_UNCPRIORITY);
   Result := info;
 end
 else
   Result := '';
end;


  *)




  {
procedure TMainForm.Cnt_RemoteTellCall(aDeviceID, CallTime: String;aSpeaker: Char; aTellNo: String);
begin
  SendPacket(aDeviceID,'R','Rd01'+'T'+CallTime+aSpeaker+aTellNo);
end;
}

procedure TMainForm.RzBitBtn33Click(Sender: TObject);
var
  aDeviceID: String;
  aCallTime: String;
  aSpeaker: Char;
begin
  aDeviceID:= Edit_CurrentID.Text + ComboBox_IDNO.Text;
  aCallTime:= FillZeroNumber(RzSpinEdit1.Value,3);
  if CheckBox2.Checked = True then aSpeaker:= 'o'
  else                             aSpeaker:= 'f';
  //Cnt_RemoteTellCall(aDeviceID,aCallTime,aSpeaker,edPhoneNo.Text);
end;

