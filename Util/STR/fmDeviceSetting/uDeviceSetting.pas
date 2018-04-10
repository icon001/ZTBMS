unit uDeviceSetting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, BaseGrid, AdvGrid, Mask, RzEdit, RzSpnEdt, RzPanel,
  StdCtrls, RzCmboBx, RzButton, ExtCtrls, Shader, ComCtrls, ImgList,
  RzLstBox, RzChkLst, RzListVw, RzTabs, RzLabel, Buttons, uSubForm,
  CommandArray, Spin, Menus,ADODB,ActiveX,
  uDataModule1;

type
  TfmDeviceSetting = class(TfmASubForm)
    PageControl1: TPageControl;
    tbDEVICE: TTabSheet;
    GroupBox3: TGroupBox;
    TreeView_Device: TTreeView;
    Shader3: TShader;
    Panel1: TPanel;
    pg_DeviceSetting: TPageControl;
    TabMCUSetting: TTabSheet;
    StaticText2: TStaticText;
    ed_mcuid: TEdit;
    GroupBox10: TGroupBox;
    btn_TimeSync: TRzBitBtn;
    btn_TimeSearch: TRzBitBtn;
    st_Time: TStaticText;
    TabSystemInfo: TTabSheet;
    gb_systemInfo: TGroupBox;
    StaticText3: TStaticText;
    ComboBox_WatchPowerOff: TRzComboBox;
    st_Door1Type: TStaticText;
    ComboBox_DoorType1: TRzComboBox;
    ComboBox_DoorType2: TRzComboBox;
    st_Door2Type: TStaticText;
    gb_SystemControl: TGroupBox;
    btn_Alarm: TRzBitBtn;
    btn_DisAlarm: TRzBitBtn;
    StaticText45: TStaticText;
    st_AlarmState: TStaticText;
    tab_DoorLock: TTabSheet;
    gb_DoorLock: TGroupBox;
    Label12: TLabel;
    Label16: TLabel;
    Label46: TLabel;
    Label11: TLabel;
    RzPanel2: TRzPanel;
    RzPanel4: TRzPanel;
    cmb_DoorControlTime1: TRzComboBox;
    cmb_DoorControlTime2: TRzComboBox;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    ComboBox_SendDoorStatus1: TRzComboBox;
    ComboBox_SendDoorStatus2: TRzComboBox;
    StaticText13: TStaticText;
    ComboBox_AlarmLongOpen1: TRzComboBox;
    ComboBox_AlarmLongOpen2: TRzComboBox;
    StaticText14: TStaticText;
    ComboBox_ControlFire1: TRzComboBox;
    ComboBox_ControlFire2: TRzComboBox;
    StaticText16: TStaticText;
    ComboBox_LockType1: TRzComboBox;
    ComboBox_LockType2: TRzComboBox;
    cmb_DsOpenState2: TRzComboBox;
    cmb_DsOpenState1: TRzComboBox;
    cmb_RemoteDoorOpen1: TRzComboBox;
    cmb_RemoteDoorOpen2: TRzComboBox;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    SpinEdit_OpenMoni1: TRzSpinEdit;
    SpinEdit_OpenMoni2: TRzSpinEdit;
    gb_DoorLockState: TGroupBox;
    RzPanel13: TRzPanel;
    RzPanel14: TRzPanel;
    StaticText47: TStaticText;
    StaticText48: TStaticText;
    StaticText49: TStaticText;
    StaticText50: TStaticText;
    cmb_COMNO1: TRzComboBox;
    cmb_COMNO2: TRzComboBox;
    cmb_ExGnd2: TRzComboBox;
    cmb_ExGnd1: TRzComboBox;
    cmb_dsgnd2: TRzComboBox;
    cmb_dsgnd1: TRzComboBox;
    cmb_Firestat: TRzComboBox;
    btn_DevicState: TRzBitBtn;
    btn_FireDevice: TRzBitBtn;
    StaticText4: TStaticText;
    cmb_lsgnd1: TRzComboBox;
    cmb_lsgnd2: TRzComboBox;
    sg_FireDevice: TAdvStringGrid;
    tab_CardReader: TTabSheet;
    gb_CardReader: TGroupBox;
    StaticText20: TStaticText;
    RzPanel1: TRzPanel;
    cmb_ReaderUse1: TRzComboBox;
    RzPanel5: TRzPanel;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText25: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    RzPanel3: TRzPanel;
    RzPanel6: TRzPanel;
    RzPanel7: TRzPanel;
    RzPanel8: TRzPanel;
    cmb_ReaderDoor1: TRzComboBox;
    cmb_ReaderDoorLocate1: TRzComboBox;
    cmb_ReaderBuildingLocate1: TRzComboBox;
    st_ReaderComstate1: TStaticText;
    cmb_ReaderUse2: TRzComboBox;
    cmb_ReaderDoor2: TRzComboBox;
    cmb_ReaderDoorLocate2: TRzComboBox;
    cmb_ReaderBuildingLocate2: TRzComboBox;
    st_ReaderComstate2: TStaticText;
    cmb_ReaderUse3: TRzComboBox;
    cmb_ReaderDoor3: TRzComboBox;
    cmb_ReaderDoorLocate3: TRzComboBox;
    cmb_ReaderBuildingLocate3: TRzComboBox;
    st_ReaderComstate3: TStaticText;
    cmb_ReaderUse4: TRzComboBox;
    cmb_ReaderDoor4: TRzComboBox;
    cmb_ReaderDoorLocate4: TRzComboBox;
    cmb_ReaderBuildingLocate4: TRzComboBox;
    st_ReaderComstate4: TStaticText;
    cmb_ReaderUse5: TRzComboBox;
    cmb_ReaderDoor5: TRzComboBox;
    cmb_ReaderDoorLocate5: TRzComboBox;
    cmb_ReaderBuildingLocate5: TRzComboBox;
    st_ReaderComstate5: TStaticText;
    cmb_ReaderUse6: TRzComboBox;
    cmb_ReaderDoor6: TRzComboBox;
    cmb_ReaderDoorLocate6: TRzComboBox;
    cmb_ReaderBuildingLocate6: TRzComboBox;
    st_ReaderComstate6: TStaticText;
    cmb_ReaderUse7: TRzComboBox;
    cmb_ReaderDoor7: TRzComboBox;
    cmb_ReaderDoorLocate7: TRzComboBox;
    cmb_ReaderBuildingLocate7: TRzComboBox;
    st_ReaderComstate7: TStaticText;
    cmb_ReaderUse8: TRzComboBox;
    cmb_ReaderDoor8: TRzComboBox;
    cmb_ReaderDoorLocate8: TRzComboBox;
    cmb_ReaderBuildingLocate8: TRzComboBox;
    st_ReaderComstate8: TStaticText;
    st_cardreaderType: TStaticText;
    cb_CardType: TRzComboBox;
    Tab_Port: TTabSheet;
    gb_Port: TGroupBox;
    StaticText37: TStaticText;
    RzPanel9: TRzPanel;
    cmb_WatchType1: TRzComboBox;
    RzPanel10: TRzPanel;
    StaticText38: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    RzPanel12: TRzPanel;
    cmb_recorver1: TRzComboBox;
    cmb_WatchType2: TRzComboBox;
    cmb_recorver2: TRzComboBox;
    cmb_WatchType3: TRzComboBox;
    cmb_recorver3: TRzComboBox;
    cmb_WatchType4: TRzComboBox;
    cmb_recorver4: TRzComboBox;
    cmb_WatchType5: TRzComboBox;
    cmb_recorver5: TRzComboBox;
    cmb_WatchType6: TRzComboBox;
    cmb_recorver6: TRzComboBox;
    RzPanel15: TRzPanel;
    st_ZoneState1: TStaticText;
    st_ZoneState2: TStaticText;
    st_ZoneState3: TStaticText;
    st_ZoneState4: TStaticText;
    st_ZoneState5: TStaticText;
    st_ZoneState6: TStaticText;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    st_EcuID: TStaticText;
    st_DeviceVer: TStaticText;
    st_DeviceCode: TStaticText;
    Panel3: TPanel;
    gb_ControlButton: TGroupBox;
    btn_UseControlerSearch: TRzBitBtn;
    btn_Registration: TRzBitBtn;
    btn_Next: TRzBitBtn;
    StaticText63: TStaticText;
    cmb_WatchType7: TRzComboBox;
    cmb_recorver7: TRzComboBox;
    st_ZoneState7: TStaticText;
    st_ZoneState8: TStaticText;
    cmb_recorver8: TRzComboBox;
    cmb_WatchType8: TRzComboBox;
    StaticText64: TStaticText;
    RzPanel11: TRzPanel;
    cmb_ZoneDelay1: TRzComboBox;
    cmb_ZoneDelay2: TRzComboBox;
    cmb_ZoneDelay3: TRzComboBox;
    cmb_ZoneDelay4: TRzComboBox;
    cmb_ZoneDelay5: TRzComboBox;
    cmb_ZoneDelay6: TRzComboBox;
    cmb_ZoneDelay7: TRzComboBox;
    cmb_ZoneDelay8: TRzComboBox;
    StaticText15: TStaticText;
    ComboBox_UseSch1: TRzComboBox;
    ComboBox_UseSch2: TRzComboBox;
    gb_Telecop: TGroupBox;
    RzLabel9: TRzLabel;
    Edit_LinkusID: TEdit;
    Edit_LinkusTel: TEdit;
    RzLabel17: TRzLabel;
    Label79: TLabel;
    Spinner_Ring: TRzSpinner;
    Spinner_cancelRing: TRzSpinner;
    Label25: TLabel;
    gb_TelLineCheck: TGroupBox;
    Label22: TLabel;
    ed_Time: TEdit;
    SpinEdit_OutDelay: TRzSpinEdit;
    Label15: TLabel;
    SpinEdit_InDelay: TRzSpinEdit;
    Label4: TLabel;
    chk_Jaejung: TCheckBox;
    StaticText28: TStaticText;
    StaticText30: TStaticText;
    gb_ecuUsed: TGroupBox;
    sg_ECUCode: TAdvStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    ed_Ecuno: TSpinEdit;
    Label10: TLabel;
    Label5: TLabel;
    ed_EcuName: TEdit;
    btn_Insert: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    Label6: TLabel;
    toolslist: TImageList;
    cmb_ecuType: TComboBox;
    Label7: TLabel;
    Popup_Device: TPopupMenu;
    Menu_DeviceReboot: TMenuItem;
    Menu_ArmMode: TMenuItem;
    Menu_DisArmMode: TMenuItem;
    Menu_DoorManageMode: TMenuItem;
    Menu_DoorOpeneMode: TMenuItem;
    Menu_DoorCloseMode: TMenuItem;
    chk_Door1use: TCheckBox;
    chk_Door2use: TCheckBox;
    Splitter1: TSplitter;
    btnTelLineCheck: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Panel3Resize(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeView_DeviceClick(Sender: TObject);
    procedure pg_DeviceSettingChange(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure sg_ECUCodeClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure chk_Door1useClick(Sender: TObject);
    procedure chk_Door2useClick(Sender: TObject);
    procedure btn_RegistrationClick(Sender: TObject);
    procedure btn_AlarmClick(Sender: TObject);
    procedure btn_DisAlarmClick(Sender: TObject);
    procedure btnTelLineCheckClick(Sender: TObject);
    procedure Menu_ArmModeClick(Sender: TObject);
    procedure Menu_DisArmModeClick(Sender: TObject);
    procedure Menu_DoorManageModeClick(Sender: TObject);
    procedure Menu_DoorOpeneModeClick(Sender: TObject);
    procedure Menu_DoorCloseModeClick(Sender: TObject);
    procedure TreeView_DeviceMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure btn_UseControlerSearchClick(Sender: TObject);
    procedure btn_NextClick(Sender: TObject);
    procedure ed_mcuidChange(Sender: TObject);
    procedure btn_DevicStateClick(Sender: TObject);
    procedure btn_FireDeviceClick(Sender: TObject);
    procedure Menu_DeviceRebootClick(Sender: TObject);
  private
    L_bFirst : Boolean;
    TreeDeviceCodeList : TStringList;
    TreeDeviceCaptionList : TStringList;
    ZoneStatusList : TStringList; //존구분 리스트
    State : string;
    L_bSettingChanged : Boolean;
    L_nOldPageIndex : integer; //이전 Page

    L_nReaderCount : integer;
    L_nPortCount : integer;
    FDeviceID: string;
    { Private declarations }
    procedure FormSetting;
    procedure Form_AllPort_ColorInitialize(aPortNo:integer);

    function GetPortComboBox(nPortNo:integer;aComboBoxName:string):TComboBox;
    function GetPortStaticText(nPortNo:integer;aName:string):TStaticText;

    procedure ZoneStatusLoad;
    procedure ZoneStatusmemoryInitialize;
    procedure SetDeviceID(const Value: string);

  private
    procedure MCUSelected(aSelected:Boolean);
    procedure MCUSettingLoad;
    procedure MCUInfoLoad(aNodeNo : string);
    procedure EcuUseInfoLoad(aNodeNo : string);
    procedure SystemInfoLoad;
    procedure DoorInfoLoad;
    procedure ReaderTypeLoad;
    procedure ReaderInfoLoad;
    procedure PortInfoLoad;
  private
    procedure EcuInfoFormClear;
    procedure EcuInfoFormEnable(aState:string);

    procedure MCUColorInitialize;
    procedure SystemColorInitialize;
    procedure DoorLockColorInitialize;
    procedure CardReaderColorInitialize;
    procedure PortColorInitialize;

    procedure FireMemoryClear;
  private
    procedure Form811TypeChange;
    procedure Form812TypeChange;
    procedure FormICU100TypeChange;
    procedure FormICU200TypeChange;
  private
    procedure EcuListChange_DaemonSend(aNodeNo:string;aConnected:Boolean);
    function RegistDeviceType(aNodeNo:string;aConnected:Boolean):Boolean;
    procedure RegistControllerID(aNodeNo,aMcuid:string;aConnected:Boolean);
    procedure RegistLinkusID(aNodeNo,aLinkusID:string;aConnected:Boolean);
    procedure RegistLinkusTelNumber(aNodeNo,aLinkusTel:string;aConnected:Boolean);
    procedure RegistRingCount(aNodeNo,aRingCount,aCancelRingCount:string;aConnected:Boolean);
    procedure RegistSystemInfo(aNodeNo,aEcuID,aWatchPowerOff,aOutDelay,aInDelay,aDoorType1,aDoorType2:string;aConnected:Boolean);
    procedure RegistJaejungDelayUse(aNodeNo,aEcuID,aJaeJung:string;aConnected:Boolean);
    function RegistDoorLockInfo(aNodeNo,aEcuID: string;        // 기기번호
                         aDoorNo: Integer;         // 문번호
                          aCardMode: Integer;      // 카드 운영모드 (0:Positive, 1:Negative)
                          aDoorMode: Integer;      // 출입문 운영모드 (0:운영, 1:개방)
                          aDoorOpenTime: string;   // Door 제어시간
                          aOpenMoniTime: Integer;   // 장시간 열림 경보
                          aUseSchedule: Integer;    // 스케줄 적용 여부 (0:사용안함, 1:사용)
                          aSendDoorState: Integer;  // 출입문 상태 전송(0:사용안함, 1:사용)
                          aUseOpenalarm: Integer;   // 장시간 열림 부저 출력(0:사용안함, 1:사용)
                          aLockType: Integer;       // 전기정 타입
                          aControledFire: Integer;   // 화재 발생시 문제어
                          aDsOpenState:integer;
                          aRemoteCancelDoorOpen:integer;
                          aConnected:Boolean): Boolean;
    function RegistCardReaderInfo(aNodeNo,aEcuID: string;
             aReaderNo,aReaderuse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate:integer;
             aConnected:Boolean):Boolean;
    function RegistCardType(aNodeNo,aEcuID:string;aCardType:integer;aConnected:Boolean):Boolean;
    function RegistPort(aNodeNo,aEcuID:string;       // 기기번호
              aPortNo,aWhatchType,aZoneDelay,aRecorver,aWhatchTime:integer;
              aLocate:string;aConnected:Boolean):Boolean;
  private
    function UpdateTB_ACCESSDEVICE_MCUInfo(aNodeNo,aEcuID,aMcuid,aLinkusID,aLinkusTel,aRingCount,aCancelRingCount:string):Boolean;
    function UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNo,aEcuID,aWatchPowerOff,aOutDelay,aInDelay,aDoorType1,aDoorType2,aJaejung:string):Boolean;
    function UpdateTB_Door_SystemInfo(aNodeNo,aEcuID,aDoorNo,aDoorControlTime,
       aOpenMoni,aUseSch,aSendDoorStatus,aAlarmLongOpen,aLockType,aControlFire,
       aDsOpenState,aRemoteDoorOpen:string):Boolean;
    function UpdateTB_READER_info(aNodeNo,aEcuID,aReaderNo,aReaderuse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate:string):Boolean;
    function UpdateTB_ACCESSDEVICE_CardType(aNodeNo,aEcuID,aCardType:string):Boolean;
    function UpdateTB_ZONEDEVICE_Info(aNodeNo,aEcuID,aZoneNo,aWhatchType,aZoneDelay,aRecorver,aWhatchTime:string):Boolean;
  private
    Function GetMaxEcuID(aNodeNo : string):integer;
    Function GetDoorTime(cDoorControlTime:Char):string;
    Function GetDoorControlTimeStringToChar(aDoorControlTime1:string):string;
  private
    procedure MCUSettingSearch;
    function ControllerIDSearch:Boolean;
    function TelecopInfoSearch : Boolean;
    function DeviceUseStateSearch : Boolean;
    function DeviceTypeSearch:Boolean;
    function TimeCheck:Boolean;
  private
    procedure SystemSettingSearch;
    function SystemInfoSearch:Boolean;
    function ArmStateSearch:Boolean;
    function ZoneabnormalCheck : Boolean;
  private
    procedure DoorSettingSearch;
    function  DoorLockInfoSearch(aDoorNo:string):Boolean;
    function  DoorLockStateSearch(aDoorNo:string):Boolean;
  private
    procedure CardReaderSettingSearch;
    function  CardReaderTypeSearch:Boolean;
    function  CardReaderInfoSearch(aCardReaderNo:string):Boolean;
    function  CardReaderVerSearch(aCardReaderNo:string):Boolean;
    procedure CardReaderVersionCheck;
  private
    procedure PortSettingSearch;
    function PortInfoSearch(aPortNo:string):Boolean;
    function PortStateSearch:Boolean;
  private
    procedure MCUSettingSave(aNodeNo,aEcuID:string;aConnected:Boolean);
    procedure SystemInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
    procedure DoorLockInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
    procedure CardReaderInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
    procedure PortInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
  private
    //조회 등록 할때 변경값 변경하지 못하도록 처리
    procedure MCUControlEnable(aValue:Boolean);
    procedure SystemControlEnable(aValue:Boolean);
    procedure DoorLockEnable(aValue:Boolean);
    procedure CardReaderEnable(aValue:Boolean);
    procedure PortEnable(aValue:Boolean);

  private
    Function DupCheckAlarm(aNodeNo,aECUID:string):Boolean;
    Function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;

  private
    Function ECU_Add(aNode,aEcuID,aEcuType,aEcuName:string):Boolean;
    Function ECU_Update(aNode,aEcuID,aEcuType,aEcuName:string):Boolean;
    Function DeleteECUDoorAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUAlarmAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUZoneAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUFoodAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteReader(aNodeNo,aECUID:string):Boolean;
    Function DeleteECU(aNodeNo,aECUID:string):Boolean;
    Function CreateCardReader(aNodeNo,aEcuID:string):Boolean;
    Function UpdateTB_ACCESSDEVICE_DeviceChange(aNode,aEcuID:string):Boolean;

    Function InsertAlarmDevice(aNodeNo,aEcuID,aName:string):Boolean;
    function UpdateAlarmDefaultInfo(aNodeNo,aEcuID,aName:string):Boolean;
    function UpdateZoneDefaultInfo(aNodeNo,aEcuID,aName:string):Boolean;
    function InsertAlarmDefaultInfo(aNodeNo,aEcuID,aName:string):Boolean;
    Function InsertZoneDefaultInfo(aNodeNo,aEcuID,aName:string):Boolean; //존의 디폴트값을 생성하자.
    Function UpdateDoorName(aNodeNo,aEcuID,aEcuName:string):Boolean;
    Function UpdateECUInfo(aNodeNo,aEcuID,aEcuName,aEcuType:string):Boolean;

    Function InsertTB_ALARMDEVICE(aNodeNo,aEcuID,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aAlarmSeq :string):Boolean;
    Function InsertTB_ZoneDEVICE(aACNODENO,aACECUID,aZoneNo,aZoneName,aRegState,
                                 aBuildingCode,aFloorCode,aAreaCode,aTotWidth,
                                 aTotHeight,aCurX,aCurY:string):Boolean;
    Function InsertTB_DOOR(aNodeNo,aEcuID,aDoorNo,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aDoorSeq :string):Boolean;
    Function InsertTB_ACCESSDEVICE(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aSendAck,aCardReaderType,
                                   aGubun,aUpdate,aViewSeq,aEcuType:string):Boolean;
    Function InsertIntoTB_Reader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    Function SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand,aRcvAck:string):Boolean;
    Function CheckTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand:string):Boolean;
    Function InsertTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand,aRcvAck:string):Boolean;
    Function UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand,aRcvAck:string):Boolean;
  private
    Function updateTB_ACCESSDEVICE_AllDeviceType(NodeNo:integer;aData:string):Boolean;
    Function updateTB_ACCESSDEVICE_DeviceType(NodeNo:integer;aEcuID,aEcuType:string):Boolean;
    Function CheckServerWithDevice(NodeNo:integer;aData:string):Boolean;
    Function ServerUsedCheck(NodeNo:integer;aEcuID,aUsed:string):Boolean;
  private
    Function GetEcuList(aNodeNo:string):string;
    Function GetEcuType(aNodeNo:string):string;
  public
    { Public declarations }
    procedure LoadTreeView;
    procedure DeviceRefresh;

    procedure DeviceConnected(NodeNo:integer;aEcuID:string;aConnected:Boolean);
    procedure NodeConnectState(NodeNo:integer;aConnectState:TNodeCurrentState);
    procedure ServerDisConnect;
    procedure DoorStateChange(NodeNo : integer;aEcuID,aDoorNo:string;
                                  aDoorManageType:TDoorManageMode;
                                  aDoorPNType:TDoorPNMode;
                                  aDoorStateType:TDoorState;
                                  aDoorLockType:TDoorLockState);
    procedure AlarmModeChanged(NodeNo:integer;aEcuID:string;aWachMode:TWatchMode);
    procedure DeviceTypeChange(NodeNo:integer;aEcuID,aDeviceType:string);
  public
    procedure RcvDeviceID(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusId(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusTelNo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvRingCount(NodeNo:integer;aEcuID,aData:string);
    procedure RcvUsedDevice(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDeviceType(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCardReader(NodeNo:integer;aEcuID,aData:string);
    procedure RcvSysinfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvJaejungDelayUse(NodeNo:integer;aEcuID,aData:string);
    procedure RcvRelay(NodeNo:integer;aEcuID,aData:string);
    procedure RcvPort(NodeNo:integer;aEcuID,aData:string);
    procedure RcvUsedAlarmdisplay(NodeNo:integer;aEcuID,aData:string);
    procedure RcvWiznetInfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvControlDialInfo(NodeNo:integer;aEcuID,aData:string);
    procedure RcvLinkusPt(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCardType(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceState1Show(NodeNo:integer;aEcuID,aData:string);
    procedure ZoneStateShow(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceState2Show(NodeNo:integer;aEcuID,aData:string);
    procedure DeviceExceptShow(NodeNo:integer;aEcuID,aData:string);
    procedure RcvArmDsCheck(NodeNo:integer;aEcuID,aData:string);
    procedure RcvCDMASettingData(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDVRSettingData(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDeviceVersion(NodeNo:integer;aEcuID,aVersion:string);
    procedure RcvDeviceCode(NodeNo:integer;aEcuID,aCode:string);
    procedure RcvTime(NodeNo:integer;aEcuID,aTime:string);
    procedure RcvCardReaderVersion(NodeNo:integer;aEcuID,aData:string);
    procedure RcvAlarmState(NodeNo:integer;aEcuID,aData:string);
    procedure RcvDoorinfo2(NodeNo:integer;aEcuID,aData:string);
  private
    procedure DoorSettingView(aDoorNo,aCardMode,aDoorMode,aDoorControlTime,
                     aLongDoorOpenTime,aSchedule,aDoorState,aNetFailRun,
                     aAntiPass,aLongDoorOpenUse,aNetFailAlarm,aDoorLockType,
                     aFireDoorControl,aLockState,aDoorOpenState,aRemoteDoorOpen:string);
    procedure FireDeviceCheck;
    procedure InsertFireDevice(aEcuID:string);
    procedure DeleteFireDevice(aEcuID:string);
  private
    property DeviceID :string read FDeviceID write SetDeviceID;
  end;

var
  fmDeviceSetting: TfmDeviceSetting;

implementation

uses
  uLomosUtil,
  uMonitoringCommonVariable,
  uDeviceState,
  uFunction,
  uDeviceSettingValiable,
  uMain;
  
{$R *.dfm}


procedure TfmDeviceSetting.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  self.FindSubForm('Main').FindCommand('Command').Params.Values['cmd'] := 'DEVICESETTING';
  self.FindSubForm('Main').FindCommand('Command').Params.Values['data'] := 'FALSE';
  self.FindSubForm('Main').FindCommand('Command').Execute;

  TreeDeviceCodeList.Free;
  TreeDeviceCaptionList.Free;
  ZoneStatusList.Free;
  Action := caFree;
end;

procedure TfmDeviceSetting.Panel3Resize(Sender: TObject);
begin
  gb_ControlButton.Left := (Panel3.Width div 2) - (gb_ControlButton.Width div 2);
end;

procedure TfmDeviceSetting.FormActivate(Sender: TObject);
begin
  if L_bFirst then
  begin
    L_bFirst := False;
    self.FindSubForm('Main').FindCommand('Command').Params.Values['cmd'] := 'DEVICESETTING';
    self.FindSubForm('Main').FindCommand('Command').Params.Values['data'] := 'TRUE';
    self.FindSubForm('Main').FindCommand('Command').Execute;
  end;
  DeviceRefresh;
end;

procedure TfmDeviceSetting.LoadTreeView;
var
  i,j,k : integer;
  aTreeView   : TTreeview;
  FirstNode : TTreeNode;
  aNode,bNode,cNode,dNode   : TTreeNode;
  stDeviceName : string;
  nIndex : integer;
  stDeviceID : string;
  stTreeDeviceID : string;
begin
  aTreeView := TreeView_Device;
  aTreeView.ReadOnly:= True;
  aTreeView.Items.Clear;
  TreeDeviceCodeList.Clear;
  TreeDeviceCaptionList.Clear;
  FirstNode := nil;

  for i := 0 to NodeList.Count - 1 do
  begin
    stTreeDeviceID := 'N' + FillZeroNumber(TNodeState(NodeList.Objects[i]).NodeNo,3) + '00';
    TreeDeviceCodeList.Add(stTreeDeviceID);
    stDeviceName := FillZeroNumber(TNodeState(NodeList.Objects[i]).NodeNo,3)+ ':' + TNodeState(NodeList.Objects[i]).NodeIP ;
    aNode:= aTreeView.Items.Add(nil,stDeviceName);
    TreeDeviceCaptionList.Add(stDeviceName);
    if i = 0 then FirstNode := aNode;
    if TNodeState(NodeList.Objects[i]).NodeConnected then
    begin
      aNode.ImageIndex:=NodeConnectImageIndex;
      aNode.SelectedIndex:=NodeConnectImageIndex;
    end else begin
      aNode.ImageIndex:=NodeDisConnectImageIndex;
      aNode.SelectedIndex:=NodeDisConnectImageIndex;
    end;
    aNode.StateIndex:= NothingStateIndex;
    for j:= 0 to TNodeState(NodeList.Objects[i]).NodeDeviceList.Count - 1 do
    begin
      stDeviceID := TNodeState(NodeList.Objects[i]).NodeDeviceList.Strings[j];
      nIndex := DeviceStateList.IndexOf(stDeviceID);
      if nIndex > -1 then
      begin
        if aNode <> nil then
        begin
          aNode.MakeVisible;
          stTreeDeviceID := 'E' + stDeviceID;
          TreeDeviceCodeList.Add(stTreeDeviceID);
          bNode:= aTreeView.Items.AddChild(aNode,copy(stDeviceID,4,2) + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).DeviceName);
//          TreeDeviceCaptionList.Add(stDeviceID + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).DeviceName);
          if TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
          begin
            bNode.ImageIndex:=DeviceConnectImageIndex;
            bNode.SelectedIndex:=DeviceConnectImageIndex;
          end else
          begin
            bNode.ImageIndex:=DeviceDisConnectImageIndex;
            bNode.SelectedIndex:=DeviceDisConnectImageIndex;
          end;
          bNode.StateIndex:= NothingStateIndex;
          if bNode <> nil then
          begin
            bNode.MakeVisible;
            //방범구역 달자
            stTreeDeviceID := 'A' + stDeviceID;
            TreeDeviceCodeList.Add(stTreeDeviceID);
            cNode:= aTreeView.Items.AddChild(bNode,TDeviceState(DeviceStateList.Objects[nIndex]).AlarmName);
            //TreeDeviceCaptionList.Add(stDeviceID + TDeviceState(DeviceStateList.Objects[nIndex]).AlarmName);
            case TDeviceState(DeviceStateList.Objects[nIndex]).AlarmMode of
              cmArm :
                begin
                  cNode.ImageIndex := 14;
                  cNode.SelectedIndex := 14;
                end;
              cmDisarm :
                begin
                  cNode.ImageIndex := 13;
                  cNode.SelectedIndex := 13;
                end;
              else
                begin
                  cNode.ImageIndex := 12;
                  cNode.SelectedIndex := 12;
                end;
            end;
            //출입문 달자
            if TDeviceState(DeviceStateList.Objects[nIndex]).DoorNumber > 0 then
            begin
              if TDeviceState(DeviceStateList.Objects[nIndex]).Door1Use then
              begin
                stTreeDeviceID := 'D' + stDeviceID + '1';
                TreeDeviceCodeList.Add(stTreeDeviceID);
                cNode:= aTreeView.Items.AddChild(bNode,'1' + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).Door1Name);
                //TreeDeviceCaptionList.Add(stDeviceID + '1' + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).Door1Name);
                case TDeviceState(DeviceStateList.Objects[nIndex]).Door1ManageMode of
                  dmManager :
                    begin
                      if TDeviceState(DeviceStateList.Objects[nIndex]).Door1State = dsClose then
                      begin
                        cNode.ImageIndex := 9;
                        cNode.SelectedIndex := 9;
                      end else if TDeviceState(DeviceStateList.Objects[nIndex]).Door1State = dsOpen then
                      begin
                        cNode.ImageIndex := 8;
                        cNode.SelectedIndex := 8;
                      end else
                      begin
                        cNode.ImageIndex := 7;
                        cNode.SelectedIndex := 7;
                      end;
                    end;
                  dmOpen :
                    begin
                      if TDeviceState(DeviceStateList.Objects[nIndex]).Door1State = dsClose then
                      begin
                        cNode.ImageIndex := 11;
                        cNode.SelectedIndex := 11;
                      end else if TDeviceState(DeviceStateList.Objects[nIndex]).Door1State = dsOpen then
                      begin
                        cNode.ImageIndex := 10;
                        cNode.SelectedIndex := 10;
                      end else
                      begin
                        cNode.ImageIndex := 7;
                        cNode.SelectedIndex := 7;
                      end;
                    end;
                  else
                    begin
                      cNode.ImageIndex := 7;
                      cNode.SelectedIndex := 7;
                    end;
                end;
                cNode.StateIndex := NothingStateIndex;
              end;
            end;
            if TDeviceState(DeviceStateList.Objects[nIndex]).DoorNumber > 1 then
            begin
              if TDeviceState(DeviceStateList.Objects[nIndex]).Door2Use then
              begin
                stTreeDeviceID := 'D' + stDeviceID + '2';
                TreeDeviceCodeList.Add(stTreeDeviceID);
                cNode:= aTreeView.Items.AddChild(bNode,'2' + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).Door2Name);
                //TreeDeviceCaptionList.Add(stDeviceID + '2' + ':' + TDeviceState(DeviceStateList.Objects[nIndex]).Door1Name);
                case TDeviceState(DeviceStateList.Objects[nIndex]).Door2ManageMode of
                  dmManager :
                    begin
                      if TDeviceState(DeviceStateList.Objects[nIndex]).Door2State = dsClose then
                      begin
                        cNode.ImageIndex := 9;
                        cNode.SelectedIndex := 9;
                      end else if TDeviceState(DeviceStateList.Objects[nIndex]).Door2State = dsOpen then
                      begin
                        cNode.ImageIndex := 8;
                        cNode.SelectedIndex := 8;
                      end else
                      begin
                        cNode.ImageIndex := 7;
                        cNode.SelectedIndex := 7;
                      end;
                    end;
                  dmOpen :
                    begin
                      if TDeviceState(DeviceStateList.Objects[nIndex]).Door2State = dsClose then
                      begin
                        cNode.ImageIndex := 11;
                        cNode.SelectedIndex := 11;
                      end else if TDeviceState(DeviceStateList.Objects[nIndex]).Door2State = dsOpen then
                      begin
                        cNode.ImageIndex := 10;
                        cNode.SelectedIndex := 10;
                      end else
                      begin
                        cNode.ImageIndex := 7;
                        cNode.SelectedIndex := 7;
                      end;
                    end;
                  else
                    begin
                      cNode.ImageIndex := 7;
                      cNode.SelectedIndex := 7;
                    end;
                end;
                cNode.StateIndex := NothingStateIndex;
              end;
            end;
            //리더기 달자
            for k := 0 to TDeviceState(DeviceStateList.Objects[nIndex]).ReaderNumber - 1 do
            begin
              if TReaderState(TDeviceState(DeviceStateList.Objects[nIndex]).ReaderList.Objects[k]).ReaderUse then
              begin
                stTreeDeviceID := 'R' + stDeviceID + inttostr(TReaderState(TDeviceState(DeviceStateList.Objects[nIndex]).ReaderList.Objects[k]).ReaderNo);
                TreeDeviceCodeList.Add(stTreeDeviceID);
                cNode:= aTreeView.Items.AddChild(bNode,inttostr(TReaderState(TDeviceState(DeviceStateList.Objects[nIndex]).ReaderList.Objects[k]).ReaderNo));
                //TreeDeviceCaptionList.Add(stDeviceID + inttostr(TReaderState(TDeviceState(DeviceStateList.Objects[nIndex]).ReaderList.Objects[k]).ReaderNo));
                if TReaderState(TDeviceState(DeviceStateList.Objects[nIndex]).ReaderList.Objects[k]).Connected then
                begin
                  cNode.ImageIndex := 16;
                  cNode.SelectedIndex := 16;
                end else
                begin
                  cNode.ImageIndex := 15;
                  cNode.SelectedIndex := 15;
                end;
              end;
            end;
            if cNode <> nil then
                cNode.MakeVisible;
          end;
        end;
      end;
    end;
  end;
  if NodeList.Count > 0 then
  begin
    TreeView_Device.Select(FirstNode,[]);
    TreeView_DeviceClick(TreeView_Device);
  end;
end;

procedure TfmDeviceSetting.FormCreate(Sender: TObject);
begin
  inherited;
  TreeDeviceCodeList := TStringList.Create;
  TreeDeviceCaptionList := TStringList.Create;
  ZoneStatusList := TStringList.Create;

  L_bFirst := True;

  FormSetting;
  ZoneStatusmemoryInitialize;

  L_nOldPageIndex := 0;
  L_bSettingChanged := False;

  L_nReaderCount := 8;
  L_nPortCount := 8;
end;

procedure TfmDeviceSetting.TreeView_DeviceClick(Sender: TObject);
var
  nIndex : integer;
  stDeviceCode : string;
  cDeviceType : Char;
  nTempIndex : integer;
begin
  nIndex := TreeView_Device.Selected.AbsoluteIndex;
  stDeviceCode := TreeDeviceCodeList.Strings[nIndex];

  cDeviceType := stDeviceCode[1];
  delete(stDeviceCode,1,1);
  DeviceID := copy(stDeviceCode,1,5);
  st_EcuID.Caption := copy(DeviceID,1,3) + ':' + copy(DeviceID,4,2);
  TreeView_Device.PopupMenu := Popup_Device;

  case cDeviceType of
    'N' :
      begin
        MCUSelected(True);
        pg_DeviceSetting.ActivePage := TabMCUSetting;
        Menu_DeviceReboot.Visible := True;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
        pg_DeviceSettingChange(pg_DeviceSetting);
      end;
    'E' :
      begin
        if copy(DeviceID,4,2) = '00' then
        begin
          MCUSelected(True);
          pg_DeviceSetting.ActivePage := TabMCUSetting;
        end else
        begin
          MCUSelected(False);
          pg_DeviceSetting.ActivePage := TabSystemInfo;
        end;
        Menu_DeviceReboot.Visible := True;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
        pg_DeviceSettingChange(pg_DeviceSetting);
      end;
    'A' :
      begin
        if copy(DeviceID,4,2) = '00' then
        begin
          MCUSelected(True);
        end else
        begin
          MCUSelected(False);
        end;
        pg_DeviceSetting.ActivePage := Tab_Port;
        Menu_DeviceReboot.Visible := False;
        Menu_ArmMode.Visible := True;
        Menu_DisArmMode.Visible := True;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
        pg_DeviceSettingChange(pg_DeviceSetting);
      end;
    'D' :
      begin
        if copy(DeviceID,4,2) = '00' then
        begin
          MCUSelected(True);
        end else
        begin
          MCUSelected(False);
        end;
        pg_DeviceSetting.ActivePage := tab_DoorLock;
        Menu_DeviceReboot.Visible := False;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := True;
        Menu_DoorOpeneMode.Visible := True;
        //Menu_DoorCloseMode.Visible := True;
        pg_DeviceSettingChange(pg_DeviceSetting);
      end;
    'R' :
      begin
        if copy(DeviceID,4,2) = '00' then
        begin
          MCUSelected(True);
        end else
        begin
          MCUSelected(False);
        end;
        pg_DeviceSetting.ActivePage := tab_CardReader;
        TreeView_Device.PopupMenu := nil;
        pg_DeviceSettingChange(pg_DeviceSetting);
      end;
    else
      begin
      end;
  end;

  nTempIndex := DeviceStateList.IndexOf(DeviceID);
  if nTempIndex > -1 then
     DeviceTypeChange(strtoint(copy(DeviceID,1,3)),copy(DeviceID,4,2),TDeviceState(DeviceStateList.Objects[nTempIndex]).DeviceType);

//  showmessage();
end;

procedure TfmDeviceSetting.MCUSelected(aSelected: Boolean);
begin
  if aSelected then
  begin
    TabMCUSetting.TabVisible := True;
  end else
  begin
    TabMCUSetting.TabVisible := False;
  end;
end;

procedure TfmDeviceSetting.pg_DeviceSettingChange(Sender: TObject);
var
  nTempIndex : integer;
begin
  L_nOldPageIndex := pg_DeviceSetting.ActivePageIndex;
  if pg_DeviceSetting.ActivePageIndex = pg_DeviceSetting.PageCount - 1 then btn_Next.Enabled := False
  else btn_Next.Enabled := True;

  if pg_DeviceSetting.ActivePage = TabMCUSetting then
  begin
    MCUSettingLoad;
  end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
  begin
    SystemInfoLoad;
  end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
  begin
    DoorInfoLoad;
  end else if pg_DeviceSetting.ActivePage = tab_CardReader then
  begin
    ReaderTypeLoad;
    ReaderInfoLoad;
  end else if pg_DeviceSetting.ActivePage = Tab_Port then
  begin
    ZoneStatusLoad;
    PortInfoLoad;
  end;
  nTempIndex := DeviceStateList.IndexOf(DeviceID);
  if nTempIndex > -1 then
     DeviceTypeChange(strtoint(copy(DeviceID,1,3)),copy(DeviceID,4,2),TDeviceState(DeviceStateList.Objects[nTempIndex]).DeviceType);

end;

procedure TfmDeviceSetting.MCUSettingLoad;
begin
  MCUColorInitialize;
  if Not isDigit(copy(DeviceID,1,3)) then Exit;
  MCUInfoLoad(copy(DeviceID,1,3));
  EcuUseInfoLoad(copy(DeviceID,1,3));
  L_bSettingChanged := False;
end;

procedure TfmDeviceSetting.EcuUseInfoLoad(aNodeNo: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
  nRow : integer;
begin
  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID <> ''00'' ';
  stSql := stSql + ' Order by AC_ECUID ';

  State := 'SEARCH';
  EcuInfoFormClear;
  EcuInfoFormEnable(State);

  GridInit(sg_ECUCode,2); //스트링그리드 초기화

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      sg_ECUCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_ECUCode do
        begin
          cells[0,nRow] := FindField('AC_ECUID').AsString;
          cells[1,nRow] := FindField('AC_DEVICENAME').AsString;
          cells[2,nRow] := FindField('AC_DEVICETYPE').AsString;

          nRow := nRow + 1;
        end;
        Next;
      end;
      sg_EcuCode.SelectRows(1,1);
      sg_EcuCodeClick(sg_EcuCode);
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDeviceSetting.MCUInfoLoad(aNodeNo: string);
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin

  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      First;
      ed_mcuid.Text := FindField('AC_MCUID').AsString;
      Edit_LinkusID.Text := FindField('AC_LINKUSID').AsString;
      Edit_LinkusTel.Text := FindField('AC_LINKUSTELNO').AsString;
      Spinner_Ring.Value := FindField('AC_ARMRING').AsInteger;
      Spinner_cancelRing.Value := FindField('AC_DISARMRING').AsInteger;
      NETTYPE := FindField('AC_NETTYPE').AsString;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;

end;

procedure TfmDeviceSetting.EcuInfoFormClear;
begin
  ed_Ecuno.Value := 0;
  cmb_ecuType.ItemIndex := 0;
  ed_EcuName.Text := '';
end;

procedure TfmDeviceSetting.EcuInfoFormEnable(aState: string);
begin
  if aState = 'SEARCH' then
  begin
    ed_Ecuno.Enabled := False;
    cmb_ecuType.Enabled := False;
    ed_EcuName.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
  end else if aState = 'INSERT' then
  begin
    ed_Ecuno.Enabled := TRUE;
    cmb_ecuType.Enabled := TRUE;
    ed_EcuName.Enabled := TRUE;
    btn_Delete.Enabled := False;
    btn_Save.Enabled := True;
  end else if aState = 'CLICK' then
  begin
    ed_Ecuno.Enabled := False;
    cmb_ecuType.Enabled := TRUE;
    ed_EcuName.Enabled := TRUE;
    btn_Delete.Enabled := True;
    btn_Save.Enabled := True;
  end;
end;

procedure TfmDeviceSetting.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  EcuInfoFormClear;
  if isDigit(copy(DeviceID,1,3)) then
    ed_Ecuno.Value := GetMaxEcuID(copy(DeviceID,1,3));
  EcuInfoFormEnable(State);
end;

procedure TfmDeviceSetting.sg_ECUCodeClick(Sender: TObject);
begin
  inherited;
  if sg_ECUCode.Row < 1 then Exit;
  if Not isDigit(sg_ECUCode.cells[0,sg_ECUCode.Row]) then Exit;
  State := 'CLICK';
  EcuInfoFormClear;
  EcuInfoFormEnable(State);
  with sg_ECUCode do
  begin
    if isDigit(cells[0,Row]) then ed_Ecuno.Value := strtoint(cells[0,Row])
    else Exit;
    if isDigit(cells[2,Row]) then cmb_ecuType.ItemIndex := strtoint(cells[2,Row])-1 
    else cmb_ecuType.ItemIndex := 0;
    ed_EcuName.Text := cells[1,Row];
  end;
end;

procedure TfmDeviceSetting.btn_SaveClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  stEcuType : string;

  bConnected : Boolean;
  nIndex : integer;
begin
  stNodeNo := copy(DeviceID ,1 ,3);
  if Not IsDigit(stNodeNo) then Exit;
  stEcuID := FillZeroNumber(ed_Ecuno.Value,2);
  if cmb_ecuType.ItemIndex  > -1 then
    stEcuType := inttostr(cmb_ecuType.ItemIndex + 1)
  else stEcuType := '1';

  nIndex := DeviceStateList.IndexOf(copy(DeviceID ,1 ,5));
  if nIndex < 0 then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;
  bConnected := True;
  if Not TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
  begin
    bConnected := False;
  end;

  btn_Save.Enabled := False;
  if State = 'INSERT' then
  begin
    ECU_Add(stNodeNo,stEcuID,stEcuType,ed_EcuName.Text);
    CreateCardReader(stNodeNo,stEcuID);
    EcuListChange_DaemonSend(stNodeNo,bConnected);
    self.FindSubForm('Main').FindCommand('Refresh').Execute;
  end else if State = 'CLICK' then
  begin
    ECU_Update(stNodeNo,stEcuID,stEcuType,ed_EcuName.Text);
    EcuUseInfoLoad(stNodeNo);
  end;
//  EcuUseInfoLoad(stNodeNo);
  RegistDeviceType(stNodeNo,bConnected);
  btn_Save.Enabled := True;

end;

function TfmDeviceSetting.GetMaxEcuID(aNodeNo: string): integer;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := 1;

  stSql := ' Select Max(AC_ECUID) as AC_ECUID from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      First;
      if isDigit(FindField('AC_ECUID').AsString) then
        result := strtoint(FindField('AC_ECUID').AsString) + 1;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDeviceSetting.btn_DeleteClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
  bResult : Boolean;

  nIndex : integer;
  bConnected : Boolean;
begin
  if Application.MessageBox(Pchar('삭제시 서버에 등록된 컨트롤러 정보도 모두 삭제 됩니다. 정말 삭제 하시겠습니까?'),'경고',MB_OKCANCEL) = IDCANCEL  then Exit;
  if Application.MessageBox(Pchar('컨트롤러 삭제시 해당 방범구역 및 출입문정보도 모두 삭제 됩니다. 정말 삭제 하시겠습니까?'),'경고',MB_OKCANCEL) = IDCANCEL  then Exit;
  stNodeNo := copy(DeviceID,1,3);
  if Not isDigit(stNodeNo) then Exit;
  if ed_Ecuno.Value < 1 then Exit;
  stEcuID := FillZeroNumber(ed_Ecuno.Value,2);
  bResult := DeleteECUDoorAll(stNodeNo,stECUID);
  if Not bResult Then
  begin
    showmessage('해당 ECU의 출입문정보 삭제에 실패했습니다. 해당 출입문정보삭제후 시도 하세요.');
    Exit;
  end;
  bResult := DeleteECUAlarmAll(stNodeNo,stECUID);
  if Not bResult Then
  begin
    showmessage('해당 ECU의 방범정보 삭제에 실패했습니다. 해당 방범정보삭제후 시도 하세요.');
    Exit;
  end;
  bResult := DeleteECUZoneAll(stNodeNo,stECUID);
  if Not bResult Then
  begin
    showmessage('해당 ECU의 존정보 삭제에 실패했습니다. 해당 존정보삭제후 시도 하세요.');
    Exit;
  end;

  bResult := DeleteECUFoodAll(stNodeNo,stECUID);
  if Not bResult Then
  begin
    showmessage('해당 ECU의 식수정보 삭제에 실패했습니다. 해당 식수정보삭제후 시도 하세요.');
    Exit;
  end;
  bResult := DeleteReader(stNodeNo,stECUID);
  if Not bResult Then
  begin
    showmessage('해당 ECU의 리더정보 삭제에 실패했습니다. 해당 리더정보삭제후 시도 하세요.');
    Exit;
  end;

  bResult := DeleteECU(stNodeNo,stECUID);

  nIndex := DeviceStateList.IndexOf(copy(DeviceID ,1 ,5));
  if nIndex < 0 then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;
  bConnected := True;
  if Not TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
  begin
    bConnected := False;
  end;

  EcuListChange_DaemonSend(stNodeNo,bConnected);
  self.FindSubForm('Main').FindCommand('Refresh').Execute;
  //RegistDeviceType(stNodeNo);
//  UpdateTB_ACCESSDEVICESendAck(stNodeNo,'00','N');
//  EcuUseInfoLoad(stNodeNo);

end;

function TfmDeviceSetting.DeleteECU(aNodeNo, aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 기기의 권한 부분을 모두 제거함
  stSql := 'Delete from TB_DEVICECARDNO ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);


  //해당 기기 삭제
  stSql := 'Delete from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.DeleteECUAlarmAll(aNodeNo,
  aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 알람장비 삭제
  stSql := 'Delete from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.DeleteECUDoorAll(aNodeNo,
  aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 알람장비 삭제
  stSql := 'Delete from TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.DeleteECUFoodAll(aNodeNo,
  aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 알람장비 삭제
  stSql := 'Delete from TB_FOOD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.DeleteECUZoneAll(aNodeNo,
  aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 알람장비 삭제
  stSql := 'Delete from TB_ZONEDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.DeleteReader(aNodeNo, aECUID: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  //해당 기기의 리더정보 삭제
  stSql := 'Delete from TB_READER ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDeviceSetting.DeviceRefresh;
begin
  LoadTreeView;
end;

function TfmDeviceSetting.ECU_Add(aNode, aEcuID, aEcuType,
  aEcuName: string): Boolean;
begin
  InsertAlarmDevice(aNode,aEcuID,aEcuName);
  if aEcuType <> '4' then InsertTB_DOOR(aNode,aEcuID,'1',aEcuName + '_1번출입문','000','000','000','N','0','0','0','0','1');
  if aEcuType = '1' then InsertTB_DOOR(aNode,aEcuID,'2',aEcuName + '_2번출입문','000','000','000','N','0','0','0','0','1');
  result := InsertTB_ACCESSDEVICE(aNode,ed_mcuid.Text,aEcuID,'','',aEcuName,'000',
                        '000','000','N','0','0','0','0','1','0','1','0',
                        'N','0','1','N','1',aEcuType);
  UpdateTB_ACCESSDEVICE_DeviceChange(aNode,'00');
end;

function TfmDeviceSetting.ECU_Update(aNode, aEcuID, aEcuType,
  aEcuName: string): Boolean;
begin
  InsertAlarmDevice(aNode,aEcuID,aEcuName);
  UpdateDoorName(aNode,aEcuID,aEcuName); //메인컨트롤러의 출입문 명칭을 변경해 주자
  UpdateECUInfo(aNode,aEcuID,aEcuName,aEcuType); //확장기의 명칭을 변경 해 주자.

end;

function TfmDeviceSetting.InsertAlarmDevice(aNodeNo, aEcuID, aName: string): Boolean;
begin
  //알람 목록에 있는지 체크 하여 인서트 혹은 업데이트
  if DupCheckAlarm(aNodeNo,aEcuID) then
  begin
    //업데이트 시에 수정사항이 있으면 업데이트 안함
    result := UpdateAlarmDefaultInfo(aNodeNo,aEcuID,aName);
    result := UpdateZoneDefaultInfo(aNodeNo,aEcuID,aName);
    Exit;
  end else
  begin
    //업데이트 시에 수정사항이 있으면 업데이트 안함
    result := InsertAlarmDefaultInfo(aNodeNo,aEcuID,aName);
    result := InsertZoneDefaultInfo(aNodeNo,aEcuID,aName);
  end;
end;

function TfmDeviceSetting.DupCheckAlarm(aNodeNo, aECUID: string): Boolean;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';

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

      if RecordCount > 0 then Result := True;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmDeviceSetting.UpdateAlarmDefaultInfo(aNodeNo, aEcuID, aName: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE  Set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aName + '''';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND (AL_UPDATE IS NULL OR AL_UPDATE = ''N'' ) ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.UpdateZoneDefaultInfo(aNodeNo, aEcuID, aName: string): Boolean;
var
  i : integer;
  stSql : string;
begin
  for i := 1 to ZONECOUNT do
  begin
    stSql := ' UPDATE TB_ZoneDevice SET ';
    stSql := stSql + ' AL_ZONENAME = ''' + aName + '-' + inttostr(i) + ''' ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(i) + ''' ';
    stSql := stSql + ' AND (AL_UPDATE IS NULL OR AL_UPDATE = ''N'' ) ';

    result :=  DataModule1.ProcessExecSQL(stSql);
  end;
end;

function TfmDeviceSetting.InsertAlarmDefaultInfo(aNodeNo, aEcuID, aName: string): Boolean;
begin
  result := InsertTB_ALARMDEVICE(aNodeNo,
                                       aEcuID,
                                       //inttostr(ed_AlarmNo4.Value),
                                       aName,
                                       '000',
                                       '000',
                                       '000',
                                       'N',
                                       '0',
                                       '0',
                                       '0',
                                       '0',
                                       '1'
                                       );
end;

function TfmDeviceSetting.InsertZoneDefaultInfo(aNodeNo, aEcuID, aName: string): Boolean;
var
  i : integer;
begin
  for i := 1 to ZONECOUNT do
  begin
    InsertTB_ZONEDEVICE(aNodeNo,aEcuID,inttostr(i),aName + '-' + inttostr(i),'N','000', '000', '000','0','0','0','0');
  end;

end;

function TfmDeviceSetting.InsertTB_ALARMDEVICE(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth, aTotHeight,
  aCurX, aCurY, aAlarmSeq: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ALARMDEVICE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
//  stSql := stSql + 'AL_DEVICENO,';
  stSql := stSql + 'AL_ZONENAME,';
  stSql := stSql + 'AL_LOCATEUSE,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AL_TOTWIDTH,';
  stSql := stSql + 'AL_TOTHEIGHT,';
  stSql := stSql + 'AL_CURX,';
  stSql := stSql + 'AL_CURY,';
  stSql := stSql + 'AL_VIEWSEQ )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
//  stSql := stSql + '''' + aAlarmNo + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + aAlarmSeq + ') ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.InsertTB_ZoneDEVICE(aACNODENO, aACECUID, aZoneNo,
  aZoneName, aRegState, aBuildingCode, aFloorCode, aAreaCode, aTotWidth,
  aTotHeight, aCurX, aCurY: string): Boolean;
var
  stSql :string;
begin
  result := False;
  if aTotWidth = '' then aTotWidth := '0';
  if aTotHeight = '' then aTotHeight := '0';
  if aCurX = '' then aCurX := '0';
  if aCurY = '' then aCurY := '0';

  stSql := ' Insert Into TB_ZoneDevice(GROUP_CODE,AC_NODENO,AC_ECUID,';
  stSql := stSql + ' AL_ZONENUM,AL_ZONENAME,AL_LOCATEUSE,AL_TOTWIDTH,';
  stSql := stSql + ' AL_TOTHEIGHT,AL_CURX,AL_CURY,LO_DONGCODE,LO_FLOORCODE,';
  stSql := stSql + ' LO_AREACODE ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aACNODENO + ',';
  stSql := stSql + '''' + aACECUID + ''',';
  stSql := stSql + '''' + aZoneNo + ''',';
  stSql := stSql + '''' + aZoneName + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''') ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.InsertTB_DOOR(aNodeNo, aEcuID, aDoorNo, aName,
  aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth, aTotHeight,
  aCurX, aCurY, aDoorSeq: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_DOOR (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'DO_DOORNONAME,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'DO_LOCATEUSE,';
  stSql := stSql + 'DO_TOTWIDTH,';
  stSql := stSql + 'DO_TOTHEIGHT,';
  stSql := stSql + 'DO_CURX,';
  stSql := stSql + 'DO_CURY,';
  stSql := stSql + 'DO_VIEWSEQ )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aDoorNo + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + aDoorSeq + ') ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.InsertTB_ACCESSDEVICE(aNodeNo, aMcuID, aEcuID,
  aMcuIp, aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aMcuAC, aMcuFd, aMcuPt, aMcuAt,
  aSendAck, aCardReaderType, aGubun, aUpdate, aViewSeq,aEcuType: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_ACCESSDEVICE (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stsql + 'AC_MCUID,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'AC_MCUIP,';
  stSql := stSql + 'AC_MCUPORT,';
  stSql := stSql + 'AC_DEVICENAME,';
  stSql := stSql + 'AC_VIEWSEQ ,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'AC_LOCATEUSE,';
  stSql := stSql + 'AC_TOTWIDTH,';
  stSql := stSql + 'AC_TOTHEIGHT,';
  stSql := stSql + 'AC_CURX,';
  stSql := stSql + 'AC_CURY,';
  stSql := stSql + 'AC_ACTYPE,';
  stSql := stSql + 'AC_ATTYPE,';
  stSql := stSql + 'AC_FDTYPE,';
  stSql := stSql + 'AC_PTTYPE,';
  stSql := stSql + 'AC_NETTYPE,';
  stSql := stSql + 'AC_GUBUN,';
  stSql := stSql + 'AC_DEVICETYPE,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'AC_CARDREADERTYPE,';
  stSql := stSql + 'AC_UPDATE )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aMcuID + ''',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMcuIp + ''',';
  stSql := stSql + '''' + aMcuPort + ''',';
  stSql := stSql + '''' + aName + ''',';
  stSql := stSql + '' + aViewSeq + ',';
  stSql := stSql + '''' + aBuildingCode + ''',';
  stSql := stSql + '''' + aFloorCode + ''',';
  stSql := stSql + '''' + aAreaCode + ''',';
  stSql := stSql + '''' + aRegState + ''',';
  stSql := stSql + aTotWidth + ',';
  stSql := stSql + aTotHeight + ',';
  stSql := stSql + aCurX + ',';
  stSql := stSql + aCurY + ',';
  stSql := stSql + '''' + aMcuAC + ''',';
  stSql := stSql + '''' + aMcuAt + ''',';
  stSql := stSql + '''' + aMcuFd + ''',';
  stSql := stSql + '''' + aMcuPt + ''',';
  stSql := stSql + '''' + NETTYPE + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''' + aEcuType + ''',';
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aCardReaderType + ''', ';
  stSql := stSql + '''' + aUpdate + ''' ) ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.CreateCardReader(aNodeNo,
  aEcuID: string): Boolean;
var
  i : integer;
begin
  for i := 1 to CARDREADERCOUNT do
  begin
    if Not DupCheckCardReader(aNodeNo,aEcuID,inttostr(i)) then
      InsertIntoTB_Reader(aNodeNo,aEcuID,inttostr(i));
  end;

end;

function TfmDeviceSetting.DupCheckCardReader(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := false;
  stSql := ' select * from TB_READER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

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
      if recordCount < 1 then Exit;
    end;
    result := True;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmDeviceSetting.InsertIntoTB_Reader(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql :string;
begin
  stSql := ' Insert Into TB_READER (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'RE_READERNO,';
  stSql := stSql + 'DO_DOORNO,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'RE_USE )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + inttostr(strtoint(aNodeNo)) + ',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aReaderNo + ''',';
  stSql := stSql + '''0'',';
  stSql := stSql + '''N'',';
  stSql := stSql + '''N'')';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.UpdateDoorName(aNodeNo, aEcuID,
  aEcuName: string): Boolean;
var
  stSql : string;
begin
  //해당 확장기의 출입문이 수정사항이 없으면 디폴트값 출입문 명칭을 변경 하자
  if DBTYPE = 'MSSQL' then stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aEcuName + ''' + ''_'' + AC_ECUID + ''_'' + DO_DOORNO + ''번 출입문'' '
  else  stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aEcuName + ''' || ''_'' || AC_ECUID || ''_'' || DO_DOORNO || ''번 출입문'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND ( DO_UPDATE is null or DO_UPDATE = ''N'' ) ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.UpdateECUInfo(aNodeNo, aEcuID, aEcuName,
  aEcuType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE ';
  stSql := stSql + ' Set AC_DEVICENAME = ''' + aEcuName + ''',';
  stSql := stSql + ' AC_DEVICETYPE = ''' + aEcuType + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDeviceSetting.FormSetting;
var
  i : integer;
begin

  with ComboBox_WatchPowerOff do //정전감시
  begin
    Clear;
    Items.Add('정전 감시 OFF');
    Items.Add('정전 감시 ON');
    ItemIndex := 1;
  end;

  with ComboBox_DoorType1 do //문1 용도
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex := 2;
  end;

  with ComboBox_DoorType2 do  //문2용도
  begin
    Clear;
    Items.Add('0.방범전용');
    Items.Add('1.출입전용');
    Items.Add('2.방범 + 출입');
    ItemIndex := 2;
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
    Items.Add('도어락상태');
    Items.Add('출입문+도어락상태');
    ItemIndex := 1;
  end;
  with ComboBox_SendDoorStatus2 do     //출입문1 상태 전송여부
  begin
    Clear;
    Items.Add('사용안함');
    Items.Add('출입문상태');
    Items.Add('도어락상태');
    Items.Add('출입문+도어락상태');
    ItemIndex := 1;
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
    Items.Add('EM락(정전시 잠김)');
    Items.Add('EM락(정전시 열림)');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이크(정전시 잠김)');
    Items.Add('스트라이크(정전시 열림)');
    Items.Add('자동문/주차');
    Items.Add('식당(부져/램프제어)');
    Items.Add('SPEED GATE');
    Items.Add('===========');
    Items.Add('자바라-열림');
    Items.Add('자바라-닫힘');
    ItemIndex := 1;
  end;

  with ComboBox_LockType2 do       //출입문2 전기정 타입
  begin
    Clear;
    Items.Add('EM락(정전시 잠김)');
    Items.Add('EM락(정전시 열림)');
    Items.Add('데드볼트(정전시 잠김)');
    Items.Add('데드볼트(정전시 열림)');
    Items.Add('스트라이크(정전시 잠김)');
    Items.Add('스트라이크(정전시 열림)');
    Items.Add('자동문/주차');
    Items.Add('식당(부져/램프제어)');
    Items.Add('SPEED GATE');
    Items.Add('===========');
    Items.Add('자바라-열림');
    Items.Add('자바라-닫힘');
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

procedure TfmDeviceSetting.Form_AllPort_ColorInitialize(aPortNo: integer);
var
  i : integer;
  cmb_box:TCombobox;
  static_Text :TStaticText;
  nIndex : integer;
begin
  nIndex := DeviceStateList.IndexOf(DeviceID);
  if nIndex < 0 then Exit;

  if aPortNo = 0 then
  begin
    for i:=1 to TDeviceState(DeviceStateList.Objects[nIndex]).PortNumber do
    begin
      cmb_Box := GetPortComboBox(i,'cmb_WatchType');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(i,'cmb_ZoneDelay');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      cmb_Box := GetPortComboBox(i,'cmb_recorver');
      if cmb_Box <> nil then cmb_Box.Color := clWhite;
      static_Text := GetPortStaticText(i,'st_ZoneState');
      if static_Text <> nil then
      begin
        static_Text.Caption := '';
        static_Text.Color := clWhite;
      end;
    end;
  end else
  begin
    cmb_Box := GetPortComboBox(aPortNo,'cmb_WatchType');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aPortNo,'cmb_ZoneDelay');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := GetPortComboBox(aPortNo,'cmb_recorver');
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    static_Text := GetPortStaticText(aPortNo,'st_ZoneState');
    if static_Text <> nil then
    begin
      static_Text.Caption := '';
      static_Text.Color := clWhite;
    end;
  end;
end;

function TfmDeviceSetting.GetPortComboBox(nPortNo: integer;
  aComboBoxName: string): TComboBox;
begin
  result := TravelComboBoxItem(gb_Port,aComboBoxName,nPortNo);
end;


function TfmDeviceSetting.GetPortStaticText(nPortNo: integer;
  aName: string): TStaticText;
begin
  result := TravelTStaticTextItem(gb_Port,aName,nPortNo);
end;

procedure TfmDeviceSetting.ZoneStatusLoad;
var
  nPort,i : integer;
  cmb_Box : TComboBox;
  nIndex : integer;
begin
  nIndex := DeviceStateList.IndexOf(DeviceID);
  if nIndex < 0 then Exit;

  for nPort := 1 to TDeviceState(DeviceStateList.Objects[nIndex]).PortNumber do
  begin
    cmb_Box := GetPortComboBox(nPort,'cmb_WatchType');

    if cmb_Box = nil then continue;
    cmb_Box.Items.Clear;
    for i := 0 to ZoneStatusList.Count - 1 do
    begin
      if TDeviceState(DeviceStateList.Objects[nIndex]).DeviceType <> '2' then
      begin
        if i > 4 then break;  //KTT812 가 아니면 재중 없음
      end;
      cmb_Box.Items.Add(ZoneStatusList.Strings[i]);
    end;
    cmb_Box.ItemIndex := 0;
  end;
end;

procedure TfmDeviceSetting.ZoneStatusmemoryInitialize;
begin
  ZoneStatusList.Clear;
  ZoneStatusList.Add('방범--경계');
  ZoneStatusList.Add('화재--24시간');
  ZoneStatusList.Add('가스--24시간');
  ZoneStatusList.Add('비상--24시간');
  ZoneStatusList.Add('설비--24시간');
  ZoneStatusList.Add('============');
  ZoneStatusList.Add('방범--재중');

end;


procedure TfmDeviceSetting.SystemInfoLoad;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  SystemColorInitialize;
  if Not isDigit(DeviceID) then Exit;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      First;
      if isDigit(FindField('AC_POWERTYPE').AsString) then ComboBox_WatchPowerOff.ItemIndex := strtoint(FindField('AC_POWERTYPE').AsString)
      else ComboBox_WatchPowerOff.ItemIndex := 0;
      if Not FindField('AC_OUTDELAY').IsNull then SpinEdit_OutDelay.Value := FindField('AC_OUTDELAY').AsInteger
      else SpinEdit_OutDelay.Value := 0;
      if Not FindField('AC_INDELAY').IsNull then SpinEdit_InDelay.Value := FindField('AC_INDELAY').AsInteger
      else SpinEdit_InDelay.Value := 0;
      if isDigit(FindField('AC_DOOR1TYPE').AsString) then ComboBox_DoorType1.ItemIndex := strtoint(FindField('AC_DOOR1TYPE').AsString)
      else ComboBox_DoorType1.ItemIndex := 2;
      if isDigit(FindField('AC_DOOR2TYPE').AsString) then ComboBox_DoorType2.ItemIndex := strtoint(FindField('AC_DOOR2TYPE').AsString)
      else ComboBox_DoorType2.ItemIndex := 2;
      if FindField('AC_JAEJUNG').AsString = 'Y' then chk_Jaejung.Checked := True
      else chk_Jaejung.Checked := False;


    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;
end;

procedure TfmDeviceSetting.chk_Door1useClick(Sender: TObject);
begin
  cmb_DoorControlTime1.Enabled := chk_Door1use.Checked;
  SpinEdit_OpenMoni1.Enabled := chk_Door1use.Checked;
  ComboBox_UseSch1.Enabled := chk_Door1use.Checked;
  ComboBox_SendDoorStatus1.Enabled := chk_Door1use.Checked;
  ComboBox_AlarmLongOpen1.Enabled := chk_Door1use.Checked;
  ComboBox_ControlFire1.Enabled := chk_Door1use.Checked;
  ComboBox_LockType1.Enabled := chk_Door1use.Checked;
  cmb_DsOpenState1.Enabled := chk_Door1use.Checked;
  cmb_RemoteDoorOpen1.Enabled := chk_Door1use.Checked;
end;

procedure TfmDeviceSetting.chk_Door2useClick(Sender: TObject);
begin
  cmb_DoorControlTime2.Enabled := chk_Door2use.Checked;
  SpinEdit_OpenMoni2.Enabled := chk_Door2use.Checked;
  ComboBox_UseSch2.Enabled := chk_Door2use.Checked;
  ComboBox_SendDoorStatus2.Enabled := chk_Door2use.Checked;
  ComboBox_AlarmLongOpen2.Enabled := chk_Door2use.Checked;
  ComboBox_ControlFire2.Enabled := chk_Door2use.Checked;
  ComboBox_LockType2.Enabled := chk_Door2use.Checked;
  cmb_DsOpenState2.Enabled := chk_Door2use.Checked;
  cmb_RemoteDoorOpen2.Enabled := chk_Door2use.Checked;

end;

procedure TfmDeviceSetting.DoorInfoLoad;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  chDoorOPen : char;
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  stDoorOpenTime : string;
begin
  chk_Door1use.Checked := False;
  chk_Door1useClick(self);
  chk_Door2use.Checked := False;
  chk_Door2useClick(self);
  DoorLockColorInitialize;

  if Not isDigit(DeviceID) then Exit;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  stSql := ' Select * from TB_DOOR ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;

      First;
      While Not Eof do
      begin
        if FindField('DO_DOORNO').AsString = '1' then
        begin
          chk_Door1use.Checked := True;
          chk_Door1useClick(self);
          if FindField('DO_CONTROLTIME').IsNull then cmb_DoorControlTime1.Text := '5'
          else cmb_DoorControlTime1.Text := GetDoorTime(FindField('DO_CONTROLTIME').AsString[1]);
          if isDigit(FindField('DO_OPENMONI').AsString) then SpinEdit_OpenMoni1.Value := strtoint(FindField('DO_OPENMONI').AsString)
          else SpinEdit_OpenMoni1.Value := 0;
          if isDigit(FindField('DO_SCHUSE').AsString) then ComboBox_UseSch1.ItemIndex := strtoint(FindField('DO_SCHUSE').AsString)
          else ComboBox_UseSch1.ItemIndex := 0;
          if isDigit(FindField('DO_SENDDOOR').AsString) then ComboBox_SendDoorStatus1.ItemIndex := strtoint(FindField('DO_SENDDOOR').AsString)
          else ComboBox_SendDoorStatus1.ItemIndex := 1;
          if isDigit(FindField('DO_ALARMLONG').AsString) then ComboBox_AlarmLongOpen1.ItemIndex := strtoint(FindField('DO_ALARMLONG').AsString)
          else ComboBox_AlarmLongOpen1.ItemIndex := 0;
          if isDigit(FindField('DO_FIRE').AsString) then ComboBox_ControlFire1.ItemIndex := strtoint(FindField('DO_FIRE').AsString)
          else ComboBox_ControlFire1.ItemIndex := 0;
          if FindField('DO_DOORTYPE').IsNull then ComboBox_LockType1.ItemIndex := 1
          else ComboBox_LockType1.ItemIndex := ord(FindField('DO_DOORTYPE').asstring[1]) - ord('0');
          if isDigit(FindField('DO_DSOPEN').AsString) then cmb_DsOpenState1.ItemIndex := strtoint(FindField('DO_DSOPEN').AsString)
          else cmb_DsOpenState1.ItemIndex := 1;
          if isDigit(FindField('DO_REMOTEDOOR').AsString) then cmb_RemoteDoorOpen1.ItemIndex := strtoint(FindField('DO_REMOTEDOOR').AsString)
          else cmb_RemoteDoorOpen1.ItemIndex := 1;


        end else if FindField('DO_DOORNO').AsString = '2' then
        begin
          chk_Door2use.Checked := True;
          chk_Door2useClick(self);
          if FindField('DO_CONTROLTIME').IsNull then cmb_DoorControlTime2.Text := '5'
          else cmb_DoorControlTime2.Text := GetDoorTime(FindField('DO_CONTROLTIME').AsString[1]);
          if isDigit(FindField('DO_OPENMONI').AsString) then SpinEdit_OpenMoni2.Value := strtoint(FindField('DO_OPENMONI').AsString)
          else SpinEdit_OpenMoni2.Value := 0;
          if isDigit(FindField('DO_SCHUSE').AsString) then ComboBox_UseSch2.ItemIndex := strtoint(FindField('DO_SCHUSE').AsString)
          else ComboBox_UseSch2.ItemIndex := 0;
          if isDigit(FindField('DO_SENDDOOR').AsString) then ComboBox_SendDoorStatus2.ItemIndex := strtoint(FindField('DO_SENDDOOR').AsString)
          else ComboBox_SendDoorStatus2.ItemIndex := 1;
          if isDigit(FindField('DO_ALARMLONG').AsString) then ComboBox_AlarmLongOpen2.ItemIndex := strtoint(FindField('DO_ALARMLONG').AsString)
          else ComboBox_AlarmLongOpen2.ItemIndex := 0;
          if isDigit(FindField('DO_FIRE').AsString) then ComboBox_ControlFire2.ItemIndex := strtoint(FindField('DO_FIRE').AsString)
          else ComboBox_ControlFire2.ItemIndex := 0;
          if FindField('DO_DOORTYPE').IsNull then ComboBox_LockType2.ItemIndex := 1
          else ComboBox_LockType2.ItemIndex := ord(FindField('DO_DOORTYPE').asstring[1]) - ord('0');
          if isDigit(FindField('DO_DSOPEN').AsString) then cmb_DsOpenState2.ItemIndex := strtoint(FindField('DO_DSOPEN').AsString)
          else cmb_DsOpenState2.ItemIndex := 1;
          if isDigit(FindField('DO_REMOTEDOOR').AsString) then cmb_RemoteDoorOpen2.ItemIndex := strtoint(FindField('DO_REMOTEDOOR').AsString)
          else cmb_RemoteDoorOpen2.ItemIndex := 1;

        end;
        Next;
      end;

    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;
end;

function TfmDeviceSetting.GetDoorTime(cDoorControlTime: Char): string;
var
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
begin
  if cDoorControlTime >= #$30 then
  begin
   if cDoorControlTime < #$40 then  result := cDoorControlTime
   else
   begin
      if (cDoorControlTime >= 'A') and (cDoorControlTime <= 'Z') then  nDoorControlTime := Ord(cDoorControlTime) - Ord('A')
      else nDoorControlTime := Ord(cDoorControlTime) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      result := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(cDoorControlTime);
    nMsec := (nOrd - $20) * 100;
    result := inttostr(nMsec) + 'ms';
  end;

end;

procedure TfmDeviceSetting.ReaderInfoLoad;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  cmb_box:TCombobox;
  static_Text :TStaticText;
begin
  CardReaderColorInitialize;
  if Not isDigit(DeviceID) then Exit;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  stSql := ' Select * from TB_READER ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;

      First;
      While Not Eof do
      begin
        if isDigit(FindField('RE_READERNO').AsString) then
        begin
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',strtoint(FindField('RE_READERNO').AsString));
          if isDigit(FindField('RE_USE').AsString) then cmb_Box.ItemIndex := strtoint(FindField('RE_USE').AsString)
          else cmb_Box.ItemIndex := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',strtoint(FindField('RE_READERNO').AsString));
          if isDigit(FindField('DO_DOORNO').AsString) then cmb_Box.ItemIndex := strtoint(FindField('DO_DOORNO').AsString)
          else cmb_Box.ItemIndex := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',strtoint(FindField('RE_READERNO').AsString));
          if isDigit(FindField('DOOR_POSI').AsString) then cmb_Box.ItemIndex := strtoint(FindField('DOOR_POSI').AsString)
          else cmb_Box.ItemIndex := 0;
          cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',strtoint(FindField('RE_READERNO').AsString));
          if isDigit(FindField('build_posi').AsString) then cmb_Box.ItemIndex := strtoint(FindField('build_posi').AsString)
          else cmb_Box.ItemIndex := 0;
          static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',strtoint(FindField('RE_READERNO').AsString));
          static_Text.Caption := FindField('RE_VER').AsString;
        end;
        Next;
      end;

    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;
end;

procedure TfmDeviceSetting.ReaderTypeLoad;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  chDoorOPen : char;
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  stDoorOpenTime : string;
begin

  if Not isDigit(DeviceID) then Exit;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  stSql := ' Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;

      First;
      While Not Eof do
      begin
        if isDigit(FindField('AC_CARDREADERTYPE').AsString) then cb_CardType.ItemIndex := strtoint(FindField('AC_CARDREADERTYPE').AsString) + 1
        else cb_CardType.ItemIndex := 0;
        Next;
      end;

    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;
end;

procedure TfmDeviceSetting.PortInfoLoad;
var
  stNodeNo : string;
  stEcuID : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
  cmb_box:TCombobox;
  static_Text :TStaticText;
begin
  PortColorInitialize;
  if Not isDigit(DeviceID) then Exit;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  stSql := ' Select * from TB_ZONEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + stNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + stEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;

      First;
      While Not Eof do
      begin
        if isDigit(FindField('AL_ZONENUM').AsString) then
        begin
          cmb_Box := TravelComboBoxItem(gb_Port,'cmb_WatchType',strtoint(FindField('AL_ZONENUM').AsString));
          if isDigit(FindField('AL_WATCHTYPE').AsString) then cmb_Box.ItemIndex := strtoint(FindField('AL_WATCHTYPE').AsString)
          else cmb_Box.ItemIndex := 0;
          cmb_Box := TravelComboBoxItem(gb_Port,'cmb_ZoneDelay',strtoint(FindField('AL_ZONENUM').AsString));
          if isDigit(FindField('AL_DELAYUSE').AsString) then cmb_Box.ItemIndex := strtoint(FindField('AL_DELAYUSE').AsString)
          else cmb_Box.ItemIndex := 0;
          cmb_Box := TravelComboBoxItem(gb_Port,'cmb_recorver',strtoint(FindField('AL_ZONENUM').AsString));
          if isDigit(FindField('AL_PORTRECOVERY').AsString) then cmb_Box.ItemIndex := strtoint(FindField('AL_PORTRECOVERY').AsString)
          else cmb_Box.ItemIndex := 0;
        end;
        Next;
      end;

    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  L_bSettingChanged := False;
end;

procedure TfmDeviceSetting.btn_RegistrationClick(Sender: TObject);
var
  stNodeNo:string;
  stEcuID : string;
  stDeviceID : string;
  nIndex : integer;
  bConnected : Boolean;
begin
  if Not isDigit(DeviceID) then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;
  stNodeNo := copy(DeviceID ,1 ,3);
  stEcuID := copy(DeviceID ,4 ,2);
  stDeviceID := FillZeroNumber(strtoint(stNodeNo),3) + stEcuID;
  nIndex := DeviceStateList.IndexOf(stDeviceID);
  if nIndex < 0 then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;
  bConnected := True;
  if Not TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
  begin
    bConnected := False;
    showmessage('통신 복구시 자동으로 설정값이 전송 됩니다.');
  end;

  gb_ControlButton.Enabled := False;
  TreeView_Device.Enabled := False;
  pg_DeviceSetting.Enabled := False;

  if pg_DeviceSetting.ActivePage = TabMCUSetting then
  begin
    MCUSettingSave(stNodeNo,stEcuID,bConnected);
  end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
  begin
    SystemInfoSave(stNodeNo,stEcuID,bConnected);
  end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
  begin
    DoorLockInfoSave(stNodeNo,stEcuID,bConnected);
  end else if pg_DeviceSetting.ActivePage = tab_CardReader then
  begin
    CardReaderInfoSave(stNodeNo,stEcuID,bConnected);
  end else if pg_DeviceSetting.ActivePage = Tab_Port then
  begin
    PortInfoSave(stNodeNo,stEcuID,bConnected);
  end;
  gb_ControlButton.Enabled := True;
  TreeView_Device.Enabled := True;
  pg_DeviceSetting.Enabled := True;


end;

procedure TfmDeviceSetting.MCUSettingSave(aNodeNo,aEcuID:string;aConnected:Boolean);
begin
  if Length(ed_mcuid.Text) <> 7 then
  begin
    showmessage('Controller ID 의 자리수가 맞지 않습니다.');
    Exit;
  end;

  MCUControlEnable(False);
  MCUColorInitialize;

  if Edit_LinkusID.Text = '' then Edit_LinkusID.Text := 'AAAA';

  if UpdateTB_ACCESSDEVICE_MCUInfo(aNodeNo,aEcuID,ed_mcuid.Text,Edit_LinkusID.Text,Edit_LinkusTel.Text,inttostr(Spinner_Ring.Value),inttostr(Spinner_cancelRing.Value)) then
  begin
    RegistControllerID(aNodeNo,ed_mcuid.Text,aConnected);
    RegistLinkusID(aNodeNo,Edit_LinkusID.Text,aConnected);
    RegistLinkusTelNumber(aNodeNo,Edit_LinkusTel.Text,aConnected);
    RegistRingCount(aNodeNo,inttostr(Spinner_Ring.Value),inttostr(Spinner_cancelRing.Value),aConnected);
  end;

  EcuListChange_DaemonSend(aNodeNo,aConnected);
  RegistDeviceType(aNodeNo,aConnected);

  MCUControlEnable(True);
end;

procedure TfmDeviceSetting.MCUColorInitialize;
begin
  ed_mcuid.Color := clWhite;
  Edit_LinkusID.Color := clWhite;
  Edit_LinkusTel.Color := clWhite;
  Spinner_Ring.Color := clWhite;
  Spinner_cancelRing.Color := clWhite;
  st_Time.Color := clWhite;
  sg_ECUCode.Color := clWhite;
end;

function TfmDeviceSetting.UpdateTB_ACCESSDEVICE_MCUInfo(aNodeNo, aEcuID,
  aMcuid, aLinkusID, aLinkusTel, aRingCount,
  aCancelRingCount: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set ';
  stSql := stSql + ' AC_MCUID = ''' + aMcuID + ''',';
  stSql := stSql + ' AC_LINKUSID = ''' + aLinkusID + ''',';
  stSql := stSql + ' AC_LINKUSTELNO = ''' + aLinkusTel + ''',';
  stSql := stSql + ' AC_ARMRING = ' + aRingCount + ',';
  stSql := stSql + ' AC_DISARMRING = ' + aCancelRingCount + ',';
  stSql := stSql + ' REG_SEND = ''C'' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.UpdateTB_ACCESSDEVICE_DeviceChange(aNode,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set REG_SEND = ''C'' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNode + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDeviceSetting.EcuListChange_DaemonSend(aNodeNo: string;aConnected:Boolean);
var
  stEcuList : string;
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','ECUCOUNT','N');
  if Not aConnected then Exit;
  stEcuList := GetEcuList(aNodeNo);
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.UsedDevice_Registration(aNodeNo,stEcuList) then break;
  end;

end;

function TfmDeviceSetting.GetEcuList(aNodeNo: string): string;
var
  stEcuList : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
//                       1         2         3         4         5
//              12345678901234567890123456789012345678901234567890
  stEcuList := '10000000000000000000000000000000000000000000000000'+
               '00000000000000000000000000000000000000000000000000';
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' Order by AC_ECUID ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if isDigit(FindField('AC_ECUID').AsString) then
        begin
          stEcuList[strtoint(FindField('AC_ECUID').AsString) + 1] := '1';
        end;
        Next;
      end;
    end;
    result := stEcuList;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmDeviceSetting.RegistControllerID(aNodeNo, aMcuid: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','MCUID','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.ControllerID_Registration(aNodeNo,aMcuid) then break;
  end;

end;

procedure TfmDeviceSetting.RegistLinkusID(aNodeNo, aLinkusID: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','TELECOPID','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.LinkusID_Registration(aNodeNo,aLinkusID) then break;
  end;

end;

procedure TfmDeviceSetting.RegistLinkusTelNumber(aNodeNo,
  aLinkusTel: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','TELECOPTELNUM1','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.LinkusTelNumber_Registration(aNodeNo,aLinkusTel) then break;
  end;

end;

procedure TfmDeviceSetting.RegistRingCount(aNodeNo, aRingCount,
  aCancelRingCount: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','TELECOPTELCOUNT','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.RingCount_Registration(aNodeNo,aRingCount,aCancelRingCount) then break;
  end;

end;

procedure TfmDeviceSetting.SystemInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
var
  stJaeJung : string;
  nTempIndex : integer;
begin

  if ComboBox_WatchPowerOff.ItemIndex < 0 then
  begin
    showmessage('정전 감시 여부 를 선택하세요.');
    Exit;
  end;

  if ComboBox_DoorType1.ItemIndex < 0 then
  begin
    showmessage('DOOR1 용도 를 선택하세요.');
    Exit;
  end;
  
  if ComboBox_DoorType2.ItemIndex < 0 then
  begin
    showmessage('DOOR2 용도 를 선택하세요.');
    Exit;
  end;

  SystemColorInitialize;
  SystemControlEnable(False);
  
  if chk_Jaejung.Checked then stJaeJung := 'Y'
  else stJaeJung := 'N';

  if UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNo,aEcuID,inttostr(ComboBox_WatchPowerOff.ItemIndex),inttostr(SpinEdit_OutDelay.IntValue),inttostr(SpinEdit_InDelay.IntValue),inttostr(ComboBox_DoorType1.ItemIndex),inttostr(ComboBox_DoorType2.ItemIndex),stJaeJung) then
  begin
    RegistSystemInfo(aNodeNo,aEcuID,inttostr(ComboBox_WatchPowerOff.ItemIndex),inttostr(SpinEdit_OutDelay.IntValue),inttostr(SpinEdit_InDelay.IntValue),inttostr(ComboBox_DoorType1.ItemIndex),inttostr(ComboBox_DoorType2.ItemIndex),aConnected);
    nTempIndex := DeviceStateList.IndexOf(DeviceID);
    if nTempIndex > -1 then
    begin
      if TDeviceState(DeviceStateList.Objects[nTempIndex]).DeviceType = '2' then   //현재 재중 기능은 812 에만 있음
         RegistJaejungDelayUse(aNodeNo,aEcuID,stJaeJung,aConnected);
    end;
  end;
  SystemControlEnable(True);

end;

procedure TfmDeviceSetting.SystemColorInitialize;
begin
  ComboBox_WatchPowerOff.Color := clWhite;
  SpinEdit_OutDelay.Color := clWhite;
  SpinEdit_InDelay.Color := clWhite;
  ComboBox_DoorType1.Color := clWhite;
  ComboBox_DoorType2.Color := clWhite;
  st_AlarmState.Color := clWhite;
end;

function TfmDeviceSetting.UpdateTB_ACCESSDEVICE_SystemInfo(aNodeNo, aEcuID,
  aWatchPowerOff, aOutDelay, aInDelay, aDoorType1,
  aDoorType2,aJaejung: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set ';
  stSql := stSql + ' AC_POWERTYPE = ''' + aWatchPowerOff + ''',';
  stSql := stSql + ' AC_OUTDELAY = ' + aOutDelay + ',';
  stSql := stSql + ' AC_INDELAY = ' + aInDelay + ',';
  stSql := stSql + ' AC_DOOR1TYPE = ''' + aDoorType1 + ''',';
  stSql := stSql + ' AC_DOOR2TYPE = ''' + aDoorType2 + ''',';
  stSql := stSql + ' AC_JAEJUNG = ''' + aJaejung + ''',';
  stSql := stSql + ' REG_SEND = ''C'' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmDeviceSetting.RegistSystemInfo(aNodeNo, aEcuID,
  aWatchPowerOff, aOutDelay, aInDelay, aDoorType1, aDoorType2: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'SYSTEMINFO','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.SystemInfo_Registration(aNodeNo,aEcuID,aWatchPowerOff, aOutDelay, aInDelay, aDoorType1, aDoorType2) then break;
  end;

end;

procedure TfmDeviceSetting.RegistJaejungDelayUse(aNodeNo, aEcuID,
  aJaeJung: string;aConnected:Boolean);
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'JAEJUNGINFO','N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.JaejungDelayUse_Registration(aNodeNo,aEcuID,aJaeJung) then break;
  end;

end;

procedure TfmDeviceSetting.btn_AlarmClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin

  if Not isDigit(DeviceID) then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);
  fmMain.ChangeArmMode(stNodeNo,stEcuID,'A');

{  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + DeviceID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
}

end;

procedure TfmDeviceSetting.btn_DisAlarmClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin

  if Not isDigit(DeviceID) then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;

  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  fmMain.ChangeArmMode(stNodeNo,stEcuID,'D');

end;

procedure TfmDeviceSetting.btnTelLineCheckClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  if Not IsDigit(ed_Time.Text) then
  begin
    showmessage('국선체크 시간은 숫자 타입입니다.');
    Exit;
  end;
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  fmMain.TelLineCheck_Registration(stNodeNo,stEcuID,ed_Time.Text);
end;

procedure TfmDeviceSetting.DoorLockInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
var
  stDoorControlTime : string;
  nLockType : integer;
begin

  DoorLockColorInitialize;
  DoorLockEnable(False);

  if chk_Door1use.Checked then
  begin
    stDoorControlTime := GetDoorControlTimeStringToChar(cmb_DoorControlTime1.Text);
    if stDoorControlTime = '' then Exit;
    if cmb_DsOpenState1.ItemIndex < 0 then cmb_DsOpenState1.ItemIndex := 0;
    if cmb_RemoteDoorOpen1.ItemIndex < 0 then cmb_RemoteDoorOpen1.ItemIndex := 0;

    nLockType := ord('0') + ComboBox_LockType1.ItemIndex;
    if UpdateTB_Door_SystemInfo(aNodeNo,aEcuID,'1',
       stDoorControlTime,
       inttostr(SpinEdit_OpenMoni1.IntValue),
       inttostr(ComboBox_UseSch1.ItemIndex),
       inttostr(ComboBox_SendDoorStatus1.ItemIndex),
       inttostr(ComboBox_AlarmLongOpen1.ItemIndex),
       char(nLockType),
       inttostr(ComboBox_ControlFire1.ItemIndex),
       inttostr(cmb_DsOpenState1.ItemIndex),
       inttostr(cmb_RemoteDoorOpen1.ItemIndex)
        ) then
    begin
      RegistDoorLockInfo(aNodeNo,aEcuID,1,
                0,      // 카드 운영모드 (0:Positive, 1:Negative)
                0,      // 출입문 운영모드 (0:운영, 1:개방)
                stDoorControlTime,           // Door 제어시간
                SpinEdit_OpenMoni1.IntValue,           // 장시간 열림 경보
                ComboBox_UseSch1.ItemIndex,            // 스케줄 적용 여부 (0:사용안함, 1:사용)
                ComboBox_SendDoorStatus1.ItemIndex,    // 출입문 상태 전송(0:사용안함, 1:사용)
                ComboBox_AlarmLongOpen1.ItemIndex,     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
                nLockType,          // 전기정 타입
                ComboBox_ControlFire1.ItemIndex,  // 화재 발생시 문제어
                cmb_DsOpenState1.ItemIndex,  //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
                cmb_RemoteDoorOpen1.ItemIndex,
                aConnected);
    end;
    
  end;
  if chk_Door2use.Checked then
  begin
    stDoorControlTime := GetDoorControlTimeStringToChar(cmb_DoorControlTime2.Text);
    if stDoorControlTime = '' then Exit;
    if cmb_DsOpenState2.ItemIndex < 0 then cmb_DsOpenState2.ItemIndex := 0;
    if cmb_RemoteDoorOpen2.ItemIndex < 0 then cmb_RemoteDoorOpen2.ItemIndex := 0;

    nLockType := ord('0') + ComboBox_LockType2.ItemIndex;
    RegistDoorLockInfo(aNodeNo,aEcuID,2,
              0,      // 카드 운영모드 (0:Positive, 1:Negative)
              0,      // 출입문 운영모드 (0:운영, 1:개방)
              stDoorControlTime,           // Door 제어시간
              SpinEdit_OpenMoni2.IntValue,           // 장시간 열림 경보
              ComboBox_UseSch2.ItemIndex,            // 스케줄 적용 여부 (0:사용안함, 1:사용)
              ComboBox_SendDoorStatus2.ItemIndex,    // 출입문 상태 전송(0:사용안함, 1:사용)
              ComboBox_AlarmLongOpen2.ItemIndex,     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
              nLockType,          // 전기정 타입
              ComboBox_ControlFire2.ItemIndex,  // 화재 발생시 문제어
              cmb_DsOpenState2.ItemIndex,  //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
              cmb_RemoteDoorOpen2.ItemIndex,
              aConnected);
    
  end;
  DoorLockEnable(True);

end;

procedure TfmDeviceSetting.DoorLockColorInitialize;
begin
  cmb_DoorControlTime1.Color := clWhite;
  SpinEdit_OpenMoni1.Color := clWhite;
  ComboBox_UseSch1.Color := clWhite;
  ComboBox_SendDoorStatus1.Color := clWhite;
  ComboBox_AlarmLongOpen1.Color := clWhite;
  ComboBox_ControlFire1.Color := clWhite;
  ComboBox_LockType1.Color := clWhite;
  cmb_DsOpenState1.Color := clWhite;
  cmb_RemoteDoorOpen1.Color := clWhite;

  cmb_DoorControlTime2.Color := clWhite;
  SpinEdit_OpenMoni2.Color := clWhite;
  ComboBox_UseSch2.Color := clWhite;
  ComboBox_SendDoorStatus2.Color := clWhite;
  ComboBox_AlarmLongOpen2.Color := clWhite;
  ComboBox_ControlFire2.Color := clWhite;
  ComboBox_LockType2.Color := clWhite;
  cmb_DsOpenState2.Color := clWhite;
  cmb_RemoteDoorOpen2.Color := clWhite;

  cmb_COMNO1.Color := clWhite;
  cmb_COMNO2.Color := clWhite;
  cmb_ExGnd1.Color := clWhite;
  cmb_ExGnd2.Color := clWhite;
  cmb_dsgnd1.Color := clWhite;
  cmb_dsgnd2.Color := clWhite;
  cmb_lsgnd1.Color := clWhite;
  cmb_lsgnd2.Color := clWhite;
  cmb_Firestat.Color := clWhite;
  sg_FireDevice.Visible := False;
  btn_FireDevice.Enabled := False;
end;

function TfmDeviceSetting.GetDoorControlTimeStringToChar(
  aDoorControlTime1: string): string;
var
  nOrdUDiff : integer;
  nDoorTime : integer;
  nOrd : integer;
  stMSEC : string;
  nMSec : integer;
begin
  result := '';
  if IsDigit(aDoorControlTime1) then
  begin
    if strtoint(aDoorControlTime1) < 10 then
    begin
       result := Trim(aDoorControlTime1);
    end else
    begin
      nOrdUDiff := 26;
      nDoorTime := strtoint(aDoorControlTime1) - 10;
      nDoorTime := nDoorTime div 5;
      if nDoorTime < nOrdUDiff then  nOrd := Ord('A') + nDoorTime
      else nOrd := Ord('a') + nDoorTime - nOrdUDiff;
      if nOrd > Ord('z') then nOrd := Ord('z');
      result := Char(nOrd);
    end;
  end else
  begin
    stMSEC := copy(aDoorControlTime1,1,3);
    if Not isDigit(stMSEC) then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nMSec := strtoint(stMsec) div 100;
    if nMSec < 1 then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    if nMSec > 9 then
    begin
      showmessage('밀리초 단위는 선택에 의해서만 가능합니다.');
      Exit;
    end;
    nOrd := $20 + nMSec; //21~29 까지 MSEC;
    result := Char(nOrd);
  end;

end;

function TfmDeviceSetting.SaveTB_DEVICESETTINGINFO(aNodeNo, aEcuID,
  acommand, aRcvAck: string): Boolean;
begin
  if CheckTB_DEVICESETTINGINFO(aNodeNo, aEcuID,acommand) then
  begin
    UpdateTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand,aRcvAck);
  end else
  begin
    InsertTB_DEVICESETTINGINFO(aNodeNo,aEcuID,acommand,aRcvAck);
  end;
end;

function TfmDeviceSetting.CheckTB_DEVICESETTINGINFO(aNodeNo, aEcuID,
  acommand: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_DEVICESETTINGINFO ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO =  ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DS_COMMAND = ''' + acommand + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmDeviceSetting.InsertTB_DEVICESETTINGINFO(aNodeNo, aEcuID,
  acommand, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_DEVICESETTINGINFO ';
  stSql := stSql + '(' ;
  stSql := stSql + 'GROUP_CODE,' ;
  stSql := stSql + 'AC_NODENO,' ;
  stSql := stSql + 'AC_ECUID,' ;
  stSql := stSql + 'DS_COMMAND,' ;
  stSql := stSql + 'DS_RCVACK' ;
  stSql := stSql + ')' ;
  stSql := stSql + ' VALUES' ;
  stSql := stSql + '(' ;
  stSql := stSql + '''' + GROUPCODE + ''',' ;
  stSql := stSql + '' + aNodeNo + ',' ;
  stSql := stSql + '''' + aEcuID + ''',' ;
  stSql := stSql + '''' + acommand + ''',' ;
  stSql := stSql + '''' + aRcvAck + '''' ;
  stSql := stSql + ')' ;

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.UpdateTB_DEVICESETTINGINFO(aNodeNo, aEcuID,
  acommand, aRcvAck: string): Boolean;
var
  stSql : string;
begin
  stSql := ' update TB_DEVICESETTINGINFO ';
  stSql := stSql + ' set DS_RCVACK = ''' + aRcvAck + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ' ;
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + '' ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ' ;
  stSql := stSql + ' AND DS_COMMAND = ''' + acommand + ''' ' ;

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDeviceSetting.DeviceConnected(NodeNo: integer; aEcuID: string;
  aConnected: Boolean);
var
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
  nDeviceIndex : integer;
  nNodeIndex : integer;
  stDeviceID : string;
  stCaption : string;
begin
  stDeviceID := 'E' + FillZeroNumber(NodeNo,3) + aEcuID;
  nDeviceIndex := TreeDeviceCodeList.IndexOf(stDeviceID);
  if nDeviceIndex < 0 then Exit;

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;

  //aNode:= GetNodeByText(aTreeView,stCaption,False);
  aNode:= aTreeView.Items[nDeviceIndex];
  if aNode = Nil then Exit;
  if aConnected then
  begin
    if aNode.ImageIndex <> DeviceConnectImageIndex then aNode.ImageIndex:=DeviceConnectImageIndex;
    if aNode.SelectedIndex <> DeviceConnectImageIndex then aNode.SelectedIndex:=DeviceConnectImageIndex;
  end else
  begin
    if aNode.ImageIndex <> DeviceDisConnectImageIndex then aNode.ImageIndex:=DeviceDisConnectImageIndex;
    if aNode.SelectedIndex <> DeviceDisConnectImageIndex then aNode.SelectedIndex:=DeviceDisConnectImageIndex;
  end;

  aNode.StateIndex:= -1;
  aTreeView.Refresh;

end;

procedure TfmDeviceSetting.NodeConnectState(NodeNo: integer;
  aConnectState: TNodeCurrentState);
var
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
  stCaption   : string;
  nIndex      : integer;
begin
  nIndex := TreeDeviceCodeList.IndexOf('N'+FillZeroNumber(NodeNo,3) + '00');
  if nIndex < 0 then Exit;

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= aTreeView.Items[nIndex];
  if aNode = Nil then Exit;

  case aConnectState of
    nsDisConnected :
      begin
        aNode.ImageIndex:=NodeDisConnectImageIndex;
        aNode.SelectedIndex:=NodeDisConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    nsConnected :
      begin
        aNode.ImageIndex:=NodeConnectImageIndex;
        aNode.SelectedIndex:=NodeConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    nsFault :
      begin
        aNode.ImageIndex:=NodeConnectImageIndex;
        aNode.SelectedIndex:=NodeConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
    else
      begin
        aNode.ImageIndex:=NodeDisConnectImageIndex;
        aNode.SelectedIndex:=NodeDisConnectImageIndex;
        aNode.StateIndex:= NothingStateIndex;
      end;
  end;
  aTreeView.Refresh;
end;

procedure TfmDeviceSetting.ServerDisConnect;
begin

end;

procedure TfmDeviceSetting.DoorStateChange(NodeNo: integer; aEcuID,
  aDoorNo: string; aDoorManageType: TDoorManageMode;
  aDoorPNType: TDoorPNMode; aDoorStateType: TDoorState;
  aDoorLockType: TDoorLockState);
var
  stDoorID : string;
  nDoorIndex : integer;
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
begin
  stDoorID := FillZeroNumber(NodeNo,3) + aEcuID + aDoorNo;
  nDoorIndex := TreeDeviceCodeList.IndexOf('D' + stDoorID);
  if nDoorIndex < 0 then Exit;

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= aTreeView.Items[nDoorIndex];
  if aNode = Nil then Exit;

  case aDoorManageType of
    dmManager :
      begin
        if aDoorStateType = dsClose then
        begin
          aNode.ImageIndex := 9;
          aNode.SelectedIndex := 9;
        end else if aDoorStateType = dsOpen then
        begin
          aNode.ImageIndex := 8;
          aNode.SelectedIndex := 8;
        end else
        begin
          aNode.ImageIndex := 7;
          aNode.SelectedIndex := 7;
        end;
      end;
    dmOpen :
      begin
        if aDoorStateType = dsClose then
        begin
          aNode.ImageIndex := 11;
          aNode.SelectedIndex := 11;
        end else if aDoorStateType = dsOpen then
        begin
          aNode.ImageIndex := 10;
          aNode.SelectedIndex := 10;
        end else
        begin
          aNode.ImageIndex := 7;
          aNode.SelectedIndex := 7;
        end;
      end;
    else
      begin
        aNode.ImageIndex := 7;
        aNode.SelectedIndex := 7;
      end;
  end;
  aNode.StateIndex := NothingStateIndex;
  aTreeView.Refresh;

end;

procedure TfmDeviceSetting.AlarmModeChanged(NodeNo: integer;
  aEcuID: string; aWachMode: TWatchMode);
var
  nAlarmIndex : integer;
  stDeviceID : string;
  aTreeView   : TTreeview;
  aNode       : TTreeNode;
begin
  stDeviceID := FillZeroNumber(NodeNo,3) + aEcuID;
  nAlarmIndex := TreeDeviceCodeList.IndexOf('A' + stDeviceID);
  if nAlarmIndex < 0 then Exit;

  aTreeView := TreeView_Device;
  if aTreeView.Items.Count < 1 then Exit;
  aNode:= aTreeView.Items[nAlarmIndex];
  if aNode = Nil then Exit;

  case aWachMode of
    cmArm :
      begin
        aNode.ImageIndex := 14;
        aNode.SelectedIndex := 14;
        st_AlarmState.Caption := '경계';
        st_AlarmState.Color := clRed;
      end;
    cmDisarm :
      begin
        aNode.ImageIndex := 13;
        aNode.SelectedIndex := 13;
        st_AlarmState.Caption := '해제';
        st_AlarmState.Color := clBlue;
      end;
    else
      begin
        aNode.ImageIndex := 12;
        aNode.SelectedIndex := 12;
        st_AlarmState.Caption := '모름';
        st_AlarmState.Color := clYellow;
      end;
  end;
  aNode.StateIndex := NothingStateIndex;
  aTreeView.Refresh;
end;

procedure TfmDeviceSetting.Menu_ArmModeClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID := DeviceID;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMSETTING'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;
end;

procedure TfmDeviceSetting.Menu_DisArmModeClick(Sender: TObject);
var
  stAlarmID : string;
begin
  stAlarmID := DeviceID;

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'ALARMDISABLE'+ DATADELIMITER + stAlarmID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmDeviceSetting.Menu_DoorManageModeClick(Sender: TObject);
var
  nIndex : integer;
  stDeviceCode : string;
  stDoorID : string;
  cDeviceType : Char;
  i : integer;
begin
  nIndex := TreeView_Device.Selected.AbsoluteIndex;
  stDeviceCode := TreeDeviceCodeList.Strings[nIndex];

  cDeviceType := stDeviceCode[1];
  if cDeviceType <> 'D' then Exit;
  delete(stDeviceCode,1,1);
  stDoorID := copy(stDeviceCode,1,6);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPERATEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmDeviceSetting.Menu_DoorOpeneModeClick(Sender: TObject);
var
  nIndex : integer;
  stDeviceCode : string;
  stDoorID : string;
  cDeviceType : Char;
  i : integer;
begin
  nIndex := TreeView_Device.Selected.AbsoluteIndex;
  stDeviceCode := TreeDeviceCodeList.Strings[nIndex];

  cDeviceType := stDeviceCode[1];
  if cDeviceType <> 'D' then Exit;
  delete(stDeviceCode,1,1);
  stDoorID := copy(stDeviceCode,1,6);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'OPENMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmDeviceSetting.Menu_DoorCloseModeClick(Sender: TObject);
var
  nIndex : integer;
  stDeviceCode : string;
  stDoorID : string;
  cDeviceType : Char;
  i : integer;
begin
  nIndex := TreeView_Device.Selected.AbsoluteIndex;
  stDeviceCode := TreeDeviceCodeList.Strings[nIndex];

  cDeviceType := stDeviceCode[1];
  if cDeviceType <> 'D' then Exit;
  delete(stDeviceCode,1,1);
  stDoorID := copy(stDeviceCode,1,6);

  self.FindSubForm('Main').FindCommand('SendData').Params.Values['VALUE'] := 'CLOSEMODE'+ DATADELIMITER + stDoorID + DATADELIMITER;
  self.FindSubForm('Main').FindCommand('SendData').Execute;

end;

procedure TfmDeviceSetting.TreeView_DeviceMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  aNode       : TTreeNode;
  stDeviceCode : string;
  nIndex : integer;
  cDeviceType : Char;
  stDeviceID : string;
begin
  Exit;
  aNode := TreeView_Device.GetNodeAt(X,Y);
  if (aNode = nil) then Exit;

  aNode.Selected := True;

  nIndex := TreeView_Device.Selected.AbsoluteIndex;
  stDeviceCode := TreeDeviceCodeList.Strings[nIndex];

  cDeviceType := stDeviceCode[1];
  delete(stDeviceCode,1,1);
  stDeviceID := copy(stDeviceCode,1,5);
  DeviceID := stDeviceID;
  st_EcuID.Caption := copy(stDeviceID,1,3) + ':' + copy(stDeviceID,4,2);
  TreeView_Device.PopupMenu := Popup_Device;

  case cDeviceType of
    'N' :
      begin
        Menu_DeviceReboot.Visible := True;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
      end;
    'E' :
      begin
        Menu_DeviceReboot.Visible := True;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
      end;
    'A' :
      begin
        Menu_DeviceReboot.Visible := False;
        Menu_ArmMode.Visible := True;
        Menu_DisArmMode.Visible := True;
        Menu_DoorManageMode.Visible := False;
        Menu_DoorOpeneMode.Visible := False;
        Menu_DoorCloseMode.Visible := False;
      end;
    'D' :
      begin
        Menu_DeviceReboot.Visible := False;
        Menu_ArmMode.Visible := False;
        Menu_DisArmMode.Visible := False;
        Menu_DoorManageMode.Visible := True;
        Menu_DoorOpeneMode.Visible := True;
      end;
    'R' :
      begin
        TreeView_Device.PopupMenu := nil;
      end;
    else
      begin
      end;
  end;

end;

procedure TfmDeviceSetting.btn_UseControlerSearchClick(Sender: TObject);
begin
  if Not isDigit(DeviceID) then
  begin
    showmessage('선택된 컨트롤러가 없습니다.');
    Exit;
  end;
  gb_ControlButton.Enabled := False;
  TreeView_Device.Enabled := False;
  pg_DeviceSetting.Enabled := False;
  if pg_DeviceSetting.ActivePage = TabMCUSetting then
  begin
    MCUSettingSearch;
  end else if pg_DeviceSetting.ActivePage = TabSystemInfo then
  begin
    SystemSettingSearch;
  end else if pg_DeviceSetting.ActivePage = tab_DoorLock then
  begin
    DoorSettingSearch;
  end else if pg_DeviceSetting.ActivePage = tab_CardReader then
  begin
    CardReaderSettingSearch;
  end else if pg_DeviceSetting.ActivePage = Tab_Port then
  begin
    PortSettingSearch;
  end;
  gb_ControlButton.Enabled := True;
  TreeView_Device.Enabled := True;
  pg_DeviceSetting.Enabled := True;

end;

procedure TfmDeviceSetting.btn_NextClick(Sender: TObject);
begin
  if L_bSettingChanged then
  begin
    if Application.MessageBox(pchar('변경된 사항을 등록하지 않으셨습니다. 계속 진행하시겠습니까?'),'주의',MB_OKCANCEL) = ID_CANCEL then
    begin
      pg_DeviceSetting.ActivePageIndex := L_nOldPageIndex;
      Exit;
    end;
    L_bSettingChanged := False;
  end;
  pg_DeviceSetting.ActivePageIndex := pg_DeviceSetting.ActivePageIndex + 1;
  pg_DeviceSettingChange(self);
end;

procedure TfmDeviceSetting.ed_mcuidChange(Sender: TObject);
begin
  inherited;
  L_bSettingChanged := True;

end;

procedure TfmDeviceSetting.MCUSettingSearch;
begin
  MCUControlEnable(False);
  MCUColorInitialize;
  ControllerIDSearch;
  TelecopInfoSearch;
  DeviceUseStateSearch;
  DeviceTypeSearch;
  TimeCheck;
  MCUControlEnable(True);

end;

procedure TfmDeviceSetting.MCUControlEnable(aValue: Boolean);
begin
  ed_mcuid.Enabled := aValue;
  gb_Telecop.Enabled := aValue;
  gb_ecuUsed.Enabled := aValue;
end;

function TfmDeviceSetting.ControllerIDSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
begin
  
  stNodeNo := copy(DeviceID,1,3);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.ControllerIDSearch(stNodeNo);
    if result then Break;
  end;
end;

function TfmDeviceSetting.DeviceTypeSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
begin

  stNodeNo := copy(DeviceID,1,3);
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.DeviceTypeSearch(stNodeNo);
    if result then Break;
  end;

end;


function TfmDeviceSetting.TelecopInfoSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
begin
  
  stNodeNo := copy(DeviceID,1,3);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.TelecopIDSearch(stNodeNo);
    if result then Break;
  end;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.TelecopTelNumSearch(stNodeNo);
    if result then Break;
  end;
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.TelecopRingCountSearch(stNodeNo);
    if result then Break;
  end;
end;


function TfmDeviceSetting.TimeCheck: Boolean;
var
  i : integer;
  stNodeNo : string;
begin
  stNodeNo := copy(DeviceID,1,3);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.TimeCheck(stNodeNo);
    if result then Break;
  end;
end;


procedure TfmDeviceSetting.SystemSettingSearch;
begin
  SystemControlEnable(False);
  SystemColorInitialize;
  SystemInfoSearch;
  ArmStateSearch;
  SystemControlEnable(True);

end;

procedure TfmDeviceSetting.SystemControlEnable(aValue: Boolean);
begin
  gb_systemInfo.Enabled := aValue;
  gb_SystemControl.Enabled := aValue;
  gb_TelLineCheck.Enabled := aValue;
end;

function TfmDeviceSetting.ArmStateSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.ArmStateSearch(stNodeNo,stEcuID);
    if result then Break;
  end;

end;

function TfmDeviceSetting.SystemInfoSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.SystemInfoSearch(stNodeNo,stEcuID);
    if result then Break;
  end;

end;

procedure TfmDeviceSetting.DoorSettingSearch;
begin
  DoorLockEnable(False);
  DoorLockColorInitialize;
  if chk_Door1use.Checked then
  begin
    DoorLockInfoSearch('1');
  end;
  if chk_Door2use.Checked then
  begin
    DoorLockInfoSearch('2');
  end;
//  ArmStateSearch;
  btn_DevicStateClick(self);
  DoorLockEnable(True);

end;

procedure TfmDeviceSetting.DoorLockEnable(aValue: Boolean);
begin
  gb_DoorLock.Enabled := aValue;
  gb_DoorLockState.Enabled := aValue;
end;

function TfmDeviceSetting.DoorLockInfoSearch(aDoorNo: string): Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.DoorLockInfoSearch(stNodeNo,stEcuID,aDoorNo);
    if result then Break;
  end;

end;

function TfmDeviceSetting.DoorLockStateSearch(aDoorNo: string): Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.DoorLockStateSearch(stNodeNo,stEcuID,aDoorNo);
    if result then Break;
  end;

end;


procedure TfmDeviceSetting.CardReaderSettingSearch;
var
  i :integer;
begin
  if L_nReaderCount < 1 then Exit;
  CardReaderEnable(False);
  CardReaderColorInitialize;
  CardReaderTypeSearch;
  for i := 1 to L_nReaderCount do
  begin
    CardReaderInfoSearch(inttostr(i));
  end;
  CardReaderVersionCheck;
  CardReaderEnable(True);
end;

function TfmDeviceSetting.CardReaderInfoSearch(
  aCardReaderNo: string): Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.CardReaderInfoSearch(stNodeNo,stEcuID,aCardReaderNo);
    if result then Break;
  end;

end;

function TfmDeviceSetting.CardReaderTypeSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.CardReaderTypeSearch(stNodeNo,stEcuID);
    if result then Break;
  end;
end;

function TfmDeviceSetting.CardReaderVerSearch(
  aCardReaderNo: string): Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.CardReaderVerSearch(stNodeNo,stEcuID,aCardReaderNo);
    if result then Break;
  end;

end;

procedure TfmDeviceSetting.PortSettingSearch;
var
  i :integer;
begin
  if L_nPortCount < 1 then Exit;
  PortEnable(False);
  PortColorInitialize;
  for i := 1 to L_nPortCount do
  begin
    PortInfoSearch(inttostr(i));
  end;
  PortStateSearch;
  PortEnable(True);

end;

function TfmDeviceSetting.PortInfoSearch(aPortNo: string): Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.PortInfoSearch(stNodeNo,stEcuID,aPortNo);
    if result then Break;
  end;

end;

function TfmDeviceSetting.PortStateSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.PortStateSearch(stNodeNo,stEcuID);
    if result then Break;
  end;

end;


procedure TfmDeviceSetting.CardReaderEnable(aValue: Boolean);
begin
  cb_CardType.Enabled := aValue;
  gb_CardReader.Enabled := aValue;
end;

procedure TfmDeviceSetting.PortEnable(aValue: Boolean);
begin
  gb_Port.Enabled := aValue;
end;

function TfmDeviceSetting.RegistDoorLockInfo(aNodeNo, aEcuID: string;
  aDoorNo, aCardMode, aDoorMode: Integer; aDoorOpenTime: string;
  aOpenMoniTime, aUseSchedule, aSendDoorState, aUseOpenalarm, aLockType,
  aControledFire, aDsOpenState, aRemoteCancelDoorOpen: integer;aConnected:Boolean): Boolean;
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'DOORSETTINGINFO' + inttostr(aDoorNo),'N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.RegistDoorLockInfo(
              aNodeNo,
              aEcuID,
              aDoorNo,
              aCardMode,      // 카드 운영모드 (0:Positive, 1:Negative)
              aDoorMode,      // 출입문 운영모드 (0:운영, 1:개방)
              aDoorOpenTime,           // Door 제어시간
              aOpenMoniTime,           // 장시간 열림 경보
              aUseSchedule,            // 스케줄 적용 여부 (0:사용안함, 1:사용)
              aSendDoorState,    // 출입문 상태 전송(0:사용안함, 1:사용)
              aUseOpenalarm,     // 장시간 열림 부저 출력(0:사용안함, 1:사용)
              aLockType,          // 전기정 타입
              aControledFire,  // 화재 발생시 문제어
              aDsOpenState,  //출입문열림상태 (DS OPEN 0x30,DS CLOSE 0x31)
              aRemoteCancelDoorOpen) then break;
  end;

end;

procedure TfmDeviceSetting.CardReaderInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
var
  i : integer;
  cmb_Box : TComboBox;
  nReaderuse : integer;
  nReaderDoor : integer;
  nReaderDoorLocate : integer;
  nReaderBuildingLocate : integer;
  nCardReaderType : Integer;
begin

  CardReaderColorInitialize;
  CardReaderEnable(False);

  for i := 1 to L_nReaderCount do
  begin
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
    if cmb_Box <> nil then
    begin
      nReaderuse := cmb_Box.ItemIndex;
    end;
    if nReaderuse < 0 then nReaderuse := 0;

    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
    if cmb_Box <> nil then
    begin
      nReaderDoor := cmb_Box.ItemIndex;
    end;
    if nReaderDoor < 0 then nReaderDoor := 0;

    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
    if cmb_Box <> nil then
    begin
      nReaderDoorLocate := cmb_Box.ItemIndex;
    end;
    if nReaderDoorLocate < 0 then nReaderDoorLocate := 0;

    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
    if cmb_Box <> nil then
    begin
      nReaderBuildingLocate := cmb_Box.ItemIndex;
    end;
    if nReaderBuildingLocate < 0 then nReaderBuildingLocate := 0;

    if UpdateTB_READER_info(aNodeNo,aEcuID,inttostr(i),inttostr(nReaderuse),inttostr(nReaderDoor),inttostr(nReaderDoorLocate),inttostr(nReaderBuildingLocate)) then
    begin
      RegistCardReaderInfo(aNodeNo,aEcuID,i,
        nReaderuse,nReaderDoor,nReaderDoorLocate,nReaderBuildingLocate,aConnected);
    end;
  end;

  nCardReaderType := cb_CardType.ItemIndex - 1;
  if nCardReaderType < 0 then nCardReaderType := 0;
  if UpdateTB_ACCESSDEVICE_CardType(aNodeNo,aEcuID,inttostr(nCardReaderType)) then
  begin
    RegistCardType(aNodeNo,aEcuID,nCardReaderType,aConnected);
  end;

  CardReaderVersionCheck;

  CardReaderEnable(True);
end;

procedure TfmDeviceSetting.CardReaderColorInitialize;
var
  i : integer;
  cmb_Box : TComboBox;
  static_Text : TStaticText;
begin
  cb_CardType.Color := clWhite;
  for i:=1 to 8 do
  begin
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;

    static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
    if static_Text <> nil then static_Text.Color := clWhite;
  end;

end;

function TfmDeviceSetting.UpdateTB_Door_SystemInfo(aNodeNo, aEcuID,
  aDoorNo, aDoorControlTime, aOpenMoni, aUseSch, aSendDoorStatus,
  aAlarmLongOpen, aLockType, aControlFire, aDsOpenState,
  aRemoteDoorOpen: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_DOOR set ';
  stSql := stSql + ' DO_CONTROLTIME = ''' + aDoorControlTime[1] + ''',';
  stSql := stSql + ' DO_OPENMONI = ' + aOpenMoni[1] + ',';
  stSql := stSql + ' DO_SCHUSE = ' + aUseSch[1] + ',';
  stSql := stSql + ' DO_SENDDOOR = ''' + aSendDoorStatus[1] + ''',';
  stSql := stSql + ' DO_ALARMLONG = ''' + aAlarmLongOpen[1] + ''',';
  stSql := stSql + ' DO_DOORTYPE = ''' + aLockType[1] + ''',';
  stSql := stSql + ' DO_FIRE = ''' + aControlFire[1] + ''',';
  stSql := stSql + ' DO_DSOPEN = ''' + aDsOpenState[1] + ''',';
  stSql := stSql + ' DO_REMOTEDOOR = ''' + aRemoteDoorOpen[1] + ''',';
  stSql := stSql + ' REG_SEND = ''N'' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmDeviceSetting.RegistCardReaderInfo(aNodeNo, aEcuID: string;
  aReaderNo,aReaderuse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate: integer;aConnected:Boolean): Boolean;
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'CARDREADERSETTINGINFO' + inttostr(aReaderNo),'N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.RegistCardReaderInfo(aNodeNo,aEcuID,aReaderNo,
      aReaderuse,aReaderDoor,aReaderDoorLocate,aReaderBuildingLocate) then break;
  end;

end;

function TfmDeviceSetting.RegistCardType(aNodeNo, aEcuID: string;
  aCardType: integer;aConnected:Boolean): Boolean;
begin
  if aCardType < 0 then Exit;
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'CARDREADERTYPEINFO','N');
  if Not aConnected then Exit;
  result := fmMain.RegistCardType(aNodeNo, aEcuID,aCardType);

end;

procedure TfmDeviceSetting.PortInfoSave(aNodeNo,aEcuID:string;aConnected:Boolean);
var
  i : integer;
  cmb_Box : TComboBox;
  nWhatchType : integer;
  nZoneDelay : integer;
  nRecorver : integer;
begin

  PortColorInitialize;
  PortEnable(False);

  for i := 1 to L_nPortCount do
  begin
    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_WatchType',i);
    if cmb_Box <> nil then
    begin
      nWhatchType := cmb_Box.ItemIndex;
    end;
    if nWhatchType < 0 then nWhatchType := 0;

    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_ZoneDelay',i);
    if cmb_Box <> nil then
    begin
      nZoneDelay := cmb_Box.ItemIndex;
    end;
    if nZoneDelay < 0 then nZoneDelay := 0;

    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_recorver',i);
    if cmb_Box <> nil then
    begin
      nRecorver := cmb_Box.ItemIndex;
    end;
    if nRecorver < 0 then nRecorver := 0;

    if UpdateTB_ZONEDEVICE_Info(aNodeNo,aEcuID,inttostr(i),inttostr(nWhatchType),inttostr(nZoneDelay),inttostr(nRecorver),'4') then
    begin
      RegistPort(aNodeNo,aEcuID,       // 기기번호
              I,               // 포트번호
              nWhatchType,      // 감시형태
              nZoneDelay,       // 지연시간
              nRecorver,      // 복구사용유무
              4,     // 감지시간
              '',
              aConnected);
    end;
  end;

  PortEnable(True);
end;

procedure TfmDeviceSetting.PortColorInitialize;
var
  i : integer;
  cmb_Box : TComboBox;
  static_Text : TStaticText;
begin
  for i:=1 to 8 do
  begin
    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_WatchType',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_ZoneDelay',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;
    cmb_Box := TravelComboBoxItem(gb_Port,'cmb_recorver',i);
    if cmb_Box <> nil then cmb_Box.Color := clWhite;

    static_Text := TravelTStaticTextItem(gb_Port,'st_ZoneState',i);
    if static_Text <> nil then static_Text.Color := clWhite;
  end;

end;

function TfmDeviceSetting.RegistPort(aNodeNo, aEcuID: string; aPortNo,
  aWhatchType, aZoneDelay, aRecorver, aWhatchTime: integer;
  aLocate: string;aConnected:Boolean): Boolean;
var
  i : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,aEcuID,'PROTSETTINGINFO' + inttostr(aPortNo),'N');
  if Not aConnected then Exit;
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.RegistPort(aNodeNo,aEcuID,       // 기기번호
              aPortNo,               // 포트번호
              aWhatchType,      // 감시형태
              aZoneDelay,       // 지연시간
              aRecorver,      // 복구사용유무
              aWhatchTime,     // 감지시간
              aLocate) then break;
  end;

end;

function TfmDeviceSetting.RegistDeviceType(aNodeNo: string;aConnected:Boolean): Boolean;
var
  stEcuType : string;
  i : integer;
  stDeviceID : string;
  nIndex : integer;
begin
  SaveTB_DEVICESETTINGINFO(aNodeNo,'00','ECUTYPE','N');
  if Not aConnected then Exit;
  stDeviceID := FillZeroNumber(strtoint(aNodeNo),3) + '00';
  stEcuType := GetEcuType(aNodeNo);
  for i := 0 to G_nLoopCount - 1 do
  begin
    if G_bApplicationTerminate then Exit;
    if fmMain.RegistDeviceType(aNodeNo,stEcuType) then break;
  end;

end;

function TfmDeviceSetting.GetEcuType(aNodeNo: string): string;
var
  stEcuType : string;
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := '';
//                       1         2         3         4         5
//              12345678901234567890123456789012345678901234567890
  stEcuType := '10000000000000000000000000000000000000000000000000'+
               '00000000000000000000000000000000000000000000000000';
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' Order by AC_ECUID ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then Exit;
      while Not Eof do
      begin
        if isDigit(FindField('AC_ECUID').AsString) then
        begin
          stEcuType[strtoint(FindField('AC_ECUID').AsString)+1] := FindField('ac_devicetype').AsString[1];
        end;
        Next;
      end;
    end;
    result := stEcuType;
  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDeviceSetting.DeviceExceptShow(NodeNo: integer; aEcuID,
  aData: string);
var
  stCmd : string;
  stData : string;
  nStartNo : integer;
  stDeviceState : string;
  i : integer;
  stTemp : string;
  stEcuID : string;
  stBinary : string;
begin
  //존 이상상태 체크
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[ZONESENSECHECK] := True;
  stCmd := copy(aData,3,2);
  stData := copy(aData,5,Length(aData) - 4);
  nStartNo := strtoint(copy(stData,1,2));
  stDeviceState := copy(stData,4,Length(stData) - 3);
  for i := 0 to 31 do
  begin
    stEcuID := FillZeroNumber(nStartNo + i ,2);
    G_bFireDevice[strtoint(stEcuID)] := False;
    stTemp := Trim(copy(stDeviceState,(i*3) + 1,3));
    if stTemp = '' then break;
    stBinary := HexToBinary(stTemp);
    if stBinary[8] = '1' then G_bFireDevice[strtoint(stEcuID)] := True;
  end;

  FireDeviceCheck;


end;

procedure TfmDeviceSetting.DeviceState1Show(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.DeviceState2Show(NodeNo: integer; aEcuID,
  aData: string);
var
  stData : string;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[LOCKSTATECHECK] := True;
  stData := aData;
  Delete(stData,1,4);
  
  if IsDigit(stData[6]) then
  begin
    cmb_COMNO1.ItemIndex := strtoint(stData[6]);
    cmb_COMNO1.Color := clYellow;
  end;

  if isDigit(stData[7]) then
  begin
    cmb_lsgnd1.ItemIndex := strtoint(stData[7]);
    cmb_lsgnd1.Color := clYellow;
  end;

  if IsDigit(stData[8]) then
  begin
    cmb_dsgnd1.ItemIndex := strtoint(stData[8]);
    cmb_dsgnd1.Color := clYellow;
  end;

  if IsDigit(stData[9]) then
  begin
    cmb_ExGnd1.ItemIndex := strtoint(stData[9]);
    cmb_ExGnd1.Color := clYellow;
  end;

  if Length(stData) < 14 then Exit; 
  if isDigit(stData[11]) then
  begin
    cmb_COMNO2.ItemIndex := strtoint(stData[11]);
    cmb_COMNO2.Color := clYellow;
  end;

  if isDigit(stData[12]) then
  begin
    cmb_lsgnd2.ItemIndex := strtoint(stData[12]);
    cmb_lsgnd2.Color := clYellow;
  end;

  if isDigit(stData[13]) then
  begin
    cmb_dsgnd2.ItemIndex := strtoint(stData[13]);
    cmb_dsgnd2.Color := clYellow;
  end;

  if isDigit(stData[14]) then
  begin
    cmb_ExGnd2.ItemIndex := strtoint(stData[14]);
    cmb_ExGnd2.Color := clYellow;
  end;

end;

procedure TfmDeviceSetting.RcvArmDsCheck(NodeNo: integer; aEcuID,
  aData: string);
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  //경계시 문열림 검사 - 812 에만 있는 기능으로 STR 에서는 배제됨
end;

procedure TfmDeviceSetting.RcvCardReader(NodeNo: integer; aEcuID,
  aData: string);
var
  stReaderNo : string;
  stUsedCR : string;
  stCRPosition : string;
  stDoorNo : string;
  stLocate : string;
  stBuildingPosi : string;
  nReaderPoint : integer;
  nCardReaderNo : integer;

  cmb_box:TCombobox;
  spinEdit : TSpinEdit;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;

  stReaderNo := Copy(aData, 3, 2);
  stUsedCR := Copy(aData, 5, 1);         // 카드리더 사용여부
  stCRPosition := Copy(aData, 6, 1);               // 설치 위치
  stDoorNo := Copy(aData, 7, 1);                 // 연동 문번호
  stLocate := Copy(aData, 10, 16);       // 카드리더 위치명
  stBuildingPosi := Copy(aData, 26, 1);          //빌딩 위치

  if Not isDigit(stReaderNo) then Exit;
  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + strtoint(stReaderNo);

  G_bCardReaderResponse[nReaderPoint] := True;

  nCardReaderNo := strtoint(stReaderNo);

  if Not isDigit(stUsedCR) then Exit;
  cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',nCardReaderNo);
  if cmb_box <> nil then
  begin
    cmb_box.ItemIndex := strtoint(stUsedCR);
    cmb_box.Color := clYellow;
  end;
  if Not isDigit(stDoorNo) then Exit;
  cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoor',nCardReaderNo);
  if cmb_box <> nil then
  begin
    cmb_box.ItemIndex := strtoint(stDoorNo);
    cmb_box.Color := clYellow;
  end;
  if Not isDigit(stCRPosition) then Exit;
  cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderDoorLocate',nCardReaderNo);
  if cmb_box <> nil then
  begin
    cmb_box.ItemIndex := strtoint(stCRPosition);
    cmb_box.Color := clYellow;
  end;
  if Not isDigit(stBuildingPosi) then Exit;
  cmb_box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderBuildingLocate',nCardReaderNo);
  if cmb_box <> nil then
  begin
    cmb_box.ItemIndex := strtoint(stBuildingPosi);
    cmb_box.Color := clYellow;
  end;

end;

procedure TfmDeviceSetting.RcvCardType(NodeNo: integer; aEcuID,
  aData: string);
var
  stCardType: string;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[CARDREADERTYPE] := True;
  stCardType := Copy(aData, 5, 1);
  if Not isdigit(stCardType) then Exit;
  cb_CardType.ItemIndex := strtoint(stCardType) + 1;
  cb_CardType.Color := clYellow;

end;

procedure TfmDeviceSetting.RcvCDMASettingData(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.RcvControlDialInfo(NodeNo: integer; aEcuID,
  aData: string);
begin
  //데코더 DTMF 다이얼 타임

end;

procedure TfmDeviceSetting.RcvDeviceID(NodeNo: integer; aEcuID,
  aData: string);
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[IDCHECK] := True;
  ed_mcuid.Text := copy(aData,3,7);
  ed_mcuid.Color := clYellow;
end;

procedure TfmDeviceSetting.RcvDeviceType(NodeNo: integer; aEcuID,
  aData: string);
var
  stData : string;
begin
  if FillZeroNumber(NodeNo,3) <> copy(DeviceID,1,3) then Exit;
  G_bDeviceResponse[DEVICETYPECHECK] := True;
  //stData := Copy(aData, 5, 100);
  //updateTB_ACCESSDEVICE_AllDeviceType(NodeNo,stData); //데몬에서 변경하자.
  EcuUseInfoLoad(copy(DeviceID,1,3));
  sg_ECUCode.Color := clYellow;
end;

procedure TfmDeviceSetting.RcvDVRSettingData(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.RcvJaejungDelayUse(NodeNo: integer; aEcuID,
  aData: string);
var
  stData : string;
begin
  if FillZeroNumber(NodeNo,3) <> copy(DeviceID,1,3) then Exit;
  G_bDeviceResponse[JAEJUNG] := True;

  if aData[5] = '0' then chk_Jaejung.Checked := False
  else chk_Jaejung.Checked := True;
  chk_Jaejung.Color := clYellow;

end;

procedure TfmDeviceSetting.RcvLinkusId(NodeNo: integer; aEcuID,
  aData: string);
var
  stID : string;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[LINKUSID] := True;
  stID := copy(aData,5,4);
  if stID = 'AAAA' then Edit_LinkusID.Text := 'AAAA'
  else Edit_LinkusID.Text := FillZeroNumber(Hex2Dec(stID),4);
  Edit_LinkusID.Color := clYellow;
end;

procedure TfmDeviceSetting.RcvLinkusPt(NodeNo: integer; aEcuID,
  aData: string);
begin
//국선체크 시작 시간
end;

procedure TfmDeviceSetting.RcvLinkusTelNo(NodeNo: integer; aEcuID,
  aData: string);
var
  stTemp: string;
  nTelNo: Integer;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[LINKUSTEL] := True;

  stTemp := Copy(aData, 5, Length(aData) - 4);
  if isDigit(stTemp) then
    nTelNo := StrToInt(Copy(stTemp, 1, 2));
  Delete(stTemp, 1, 2);
  DeleteChar(stTemp, ' ');
  if nTelNo = 0 then
  begin
    Edit_LinkusTel.Text := stTemp;
    Edit_LinkusTel.Color := clYellow;
  end;

end;

procedure TfmDeviceSetting.RcvPort(NodeNo: integer; aEcuID, aData: string);
var
  nPortPoint : integer;
  stPort: string;
  stWatchTypeCode : string; //김시형태
  stAlarmType : string; //알람발생형식
  stRecoverType : string;   //복구형식
  stDelayTimeType :string;  //지연시간형식
  stPortLocate  :string;    //포트위치명
  stDetectTime : string;

  nPort : integer;
  cmb_Box : TComboBox;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;

  stPort := Copy(aData, 3, 2);
  stWatchTypeCode := Copy(aData, 5, 2);
  stAlarmType := Copy(aData, 7, 1);
  stRecoverType := Copy(aData, 9, 1);
  stDelayTimeType := Copy(aData, 10, 1);
  stPortLocate := Copy(aData, 33, 16);
  stDetectTime := Copy(aData, 49, 4);

  if Not isDigit(stPort) then Exit;
  nPortPoint := (strtoint(aEcuID) * PortMaxNum ) + strtoint(stPort);
  G_bPortResponse[nPortPoint] := True;

  nPort := strtoint(stPort);
  if Not isDigit(stAlarmType) then Exit;
  cmb_Box := GetPortComboBox(nPort,'cmb_WatchType');
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(stAlarmType);
    cmb_Box.Color := clYellow;
  end;

  if Not isDigit(stDelayTimeType) then Exit;
  cmb_Box := GetPortComboBox(nPort,'cmb_ZoneDelay');
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(stDelayTimeType);
    cmb_Box.Color := clYellow;
  end;

  if Not isDigit(stRecoverType) then Exit;
  cmb_Box := GetPortComboBox(nPort,'cmb_recorver');
  if cmb_Box <> nil then
  begin
    cmb_Box.ItemIndex := strtoint(stRecoverType);
    cmb_Box.Color := clYellow;
  end;
end;

procedure TfmDeviceSetting.RcvRelay(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.RcvRingCount(NodeNo: integer; aEcuID,
  aData: string);
var
  stTemp: string;
  stCancelCount : string;
  aCount: Integer;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[RINGCOUNT] := True;

  stTemp := Copy(aData, 5, 2);
  stCancelCount := Copy(aData, 7, 2);
  if isDigit(stTemp) then
    aCount := StrToInt(stTemp)
  else aCount := 0;
  Spinner_Ring.Value := aCount;
  Spinner_Ring.Color := clYellow;

  if IsDigit(stCancelCount) then
  begin
    Spinner_CancelRing.Value := strtoint(stCancelCount);
  end;
  Spinner_CancelRing.Color := clYellow;

end;

procedure TfmDeviceSetting.RcvSysinfo(NodeNo: integer; aEcuID,
  aData: string);
var
  stTemp : string;
  stPowerWatch : string;
  stOutDelay : string;
  stDoor1Type : string;
  stDoor2Type : string;
  stLocate : string;
  stInDelay : string;
  stLockExtend : string;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[SYSINFOCHECK] := True;


  stPowerWatch := aData[5];  {정전 감시여부}
  stOutDelay := Copy(aData, 6, 3);  {퇴실지연시간}
  stDoor1Type := aData[10];  {Door1 용도}
  stDoor2Type := aData[11];  {Door2 용도}
  stLocate := Trim(Copy(aData, 12, 16)); {시스템 위치명}
  stInDelay := Trim(Copy(aData, 28, 3)); {입실지연시간}

  if Not isDigit(stPowerWatch) then exit;
  ComboBox_WatchPowerOff.ItemIndex := StrToInt(stPowerWatch);
  ComboBox_WatchPowerOff.Color := clYellow;

  if Not isDigit(stDoor1Type) then exit;
  ComboBox_DoorType1.ItemIndex := StrToInt(stDoor1Type);
  ComboBox_DoorType1.Color := clYellow;

  if Not isDigit(stDoor2Type) then exit;
  ComboBox_DoorType2.ItemIndex := StrToInt(stDoor2Type);
  ComboBox_DoorType2.Color := clYellow;

  if Not isDigit(stOutDelay) then exit;
  SpinEdit_OutDelay.Value := strtoint(stOutDelay);
  SpinEdit_OutDelay.Color := clYellow;

  if Not isDigit(stInDelay) then exit;
  SpinEdit_InDelay.Value := strtoint(stInDelay);
  SpinEdit_InDelay.Color := clYellow;


end;

procedure TfmDeviceSetting.RcvUsedAlarmdisplay(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.RcvUsedDevice(NodeNo: integer; aEcuID,
  aData: string);
var
  stData : string;
begin
  if FillZeroNumber(NodeNo,3) <> copy(DeviceID,1,3) then Exit;
  G_bDeviceResponse[USEDEVICECHECK] := True;
  stData := Copy(aData, 5, 100);
  if Not CheckServerWithDevice(NodeNo,stData) then
  begin
    showmessage('기기설정 정보가 서버등록정보와 다릅니다.서버 등록 정보를 확인 후 반드시 기기등록을 해 주세요.');
  end;
end;

procedure TfmDeviceSetting.RcvWiznetInfo(NodeNo: integer; aEcuID,
  aData: string);
begin

end;

procedure TfmDeviceSetting.ZoneStateShow(NodeNo: integer; aEcuID,
  aData: string);
var
  stData : string;
  i : integer;
  stZoneStateName : string;
  static_Text : TStaticText;
begin
  if FillZeroNumber(NodeNo,3) <> copy(DeviceID,1,3) then Exit;
  G_bDeviceResponse[PORTSTATE] := True;
  stData := Copy(aData, 6, Length(aData) - 5);
  for i := 1 to Length(stData) do
  begin
    static_Text := GetPortStaticText(i,'st_ZoneState');
    if static_Text = nil then continue;

    static_Text.Color := clYellow;
    if stData[i] = 'S' then
    begin
      static_Text.Caption := 'Short';
      static_Text.Color := clRed;
    end else if stData[i] = 'P' then
    begin
      static_Text.Caption := 'Open';
      static_Text.Color := clRed;
    end else if stData[i] = 'O' then
    begin
      static_Text.Caption := 'Open';
      static_Text.Color := clRed;
    end else if stData[i] = 'N' then
    begin
      static_Text.Caption := 'Normal';
    end else static_Text.Caption := '';
  end;
end;

function TfmDeviceSetting.DeviceUseStateSearch: Boolean;
var
  i : integer;
  stNodeNo : string;
begin

  stNodeNo := copy(DeviceID,1,3);
  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.DeviceUseStateSearch(stNodeNo);
    if result then Break;
  end;

end;

function TfmDeviceSetting.updateTB_ACCESSDEVICE_AllDeviceType(NodeNo: integer;
  aData: string): Boolean;
var
  i : integer;
  nIndex : integer;
begin
  for i := 1 to 63 do
  begin
    updateTB_ACCESSDEVICE_DeviceType(NodeNo,FillzeroNumber(i-1,2),aData[i]);
    nIndex := DeviceStateList.IndexOf(FillZeroNumber(NodeNo,3) + FillZeroNumber(i-1,2));
    if nIndex > - 1 then TDeviceState(DeviceStateList.Objects[nIndex]).DeviceType := aData[i];
  end;
end;

function TfmDeviceSetting.updateTB_ACCESSDEVICE_DeviceType(NodeNo: integer;
  aEcuID, aEcuType: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ACCESSDEVICE set AC_DEVICETYPE = ''' + aEcuType[1] + ''' ' ;
  stSql := stSql + ' Where AC_NODENO = ' + inttostr(NodeNo);
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmDeviceSetting.RcvDeviceVersion(NodeNo: integer; aEcuID,
  aVersion: string);
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[DEVICEVERSIONCHECK] := True;

  st_DeviceVer.Caption := aVersion;
end;

procedure TfmDeviceSetting.RcvTime(NodeNo: integer; aEcuID, aTime: string);
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[TIME] := True;

  st_Time.Caption := aTime;
  st_Time.Color := clYellow;

end;

procedure TfmDeviceSetting.RcvCardReaderVersion(NodeNo: integer; aEcuID,
  aData: string);
var
  stReaderNo : string;
  nReaderPoint : integer;
  stCardReaderVersion : string;
  static_Text:TStaticText;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  stReaderNo := copy(aData,3,2);
  if Not isDigit(stReaderNo) then Exit;
  nReaderPoint := (strtoint(aEcuID) * CardReaderMaxNum ) + strtoint(stReaderNo);
  G_bCardReaderVersionResponse[nReaderPoint] := True;

  stCardReaderVersion := copy(aData,5,Length(aData) - 4);

  static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',strtoint(stReaderNo));
  if static_Text <> nil then
  begin
    static_Text.Caption := stCardReaderVersion;
    static_Text.Color := clYellow;
  end;

end;

procedure TfmDeviceSetting.RcvAlarmState(NodeNo: integer; aEcuID,
  aData: string);
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  if Pos('ModeChangeStart',aData) > 0 then
  begin
    G_bDeviceResponse[ALARMCONTROL] := True;
  end;

end;

function TfmDeviceSetting.CheckServerWithDevice(NodeNo: integer;
  aData: string): Boolean;
var
  i : integer;
begin
  result := False;
  for i := 1 to 63 do
  begin
    if Not ServerUsedCheck(NodeNo,FillZeroNumber(i-1,2),aData[i]) then Exit;
  end;
  result := True;

end;

function TfmDeviceSetting.ServerUsedCheck(NodeNo: integer; aEcuID,
  aUsed: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  result := False;
  stSql := 'Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO =  ' + inttostr(NodeNo) + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    TempAdoQuery.DisableControls;

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
      if recordcount < 1 then
      begin
        if aUsed[1] = '0' then result := True;
        Exit;
      end;
      if aUsed[1] = '1' then result := True;
    end;

  Finally
    TempAdoQuery.EnableControls;
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmDeviceSetting.RcvDoorinfo2(NodeNo: integer; aEcuID,
  aData: string);
var
  stDoorNo : string;
  stCardMode : string;
  stDoorMode : string;
  stDoorControlTime : string;
  nDoorControlTime : integer;
  nOrd : integer;
  nMsec : integer;
  stLongDoorOpenTime : string;
  stSchedule : string;
  stDoorState : string;
  stNetFailRun : string;
  stAntiPass : string;
  stLongDoorOpenUse : string;
  stNetFailAlarm : string;
  stDoorLockType : string;
  nLockType : integer;
  stFireDoorControl : string;
  stLockState : string;
  stDoorOpenState : string;
  stRemoteDoorOpen : string;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[DOORSYSTEMCHECK] := True;


  stDoorNo:=  aData[3];
  stCardMode := aData[6];
  stDoorMode := aData[7];
  stDoorControlTime := aData[8];
  if aData[8] >= #$30 then
  begin
   if aData[8] < #$40 then  stDoorControlTime := aData[8]
   else
   begin
      if (aData[8] >= 'A') and (aData[8] <= 'Z') then  nDoorControlTime := Ord(aData[8]) - Ord('A')
      else nDoorControlTime := Ord(aData[8]) - Ord('a') + 26;
      nDoorControlTime := nDoorControlTime * 5;
      stDoorControlTime := inttostr( 10 + nDoorControlTime );
   end;
  end else
  begin
    nOrd := Ord(aData[8]);
    nMsec := (nOrd - $20) * 100;
    stDoorControlTime := inttostr(nMsec) + 'ms';
  end;
  stLongDoorOpenTime := aData[9];
  stSchedule := aData[10];
  stDoorState := aData[11];
  stNetFailRun := aData[12];  //사용안함
  stAntiPass := aData[13];  //사용안함
  stLongDoorOpenUse := aData[14];
  stNetFailAlarm := aData[15]; //사용안함
  nLockType := 0;
  if aData[16] >= #$30 then
  begin
    nLockType:= ord(aData[16]) - ord('0');
  end;
  stDoorLockType := inttostr(nLockType);
  stFireDoorControl := aData[17];
  stLockState := aData[18];
  stDoorOpenState := aData[19];
  stRemoteDoorOpen := aData[20];

  DoorSettingView(stDoorNo,stCardMode,stDoorMode,stDoorControlTime,
                     stLongDoorOpenTime,stSchedule,stDoorState,stNetFailRun,
                     stAntiPass,stLongDoorOpenUse,stNetFailAlarm,stDoorLockType,
                     stFireDoorControl,stLockState,stDoorOpenState,stRemoteDoorOpen);

end;

procedure TfmDeviceSetting.DoorSettingView(aDoorNo, aCardMode, aDoorMode,
  aDoorControlTime, aLongDoorOpenTime, aSchedule, aDoorState, aNetFailRun,
  aAntiPass, aLongDoorOpenUse, aNetFailAlarm, aDoorLockType,
  aFireDoorControl, aLockState, aDoorOpenState, aRemoteDoorOpen: string);
begin
  if aDoorNo = '1' then
  begin
    cmb_DoorControlTime1.Text := aDoorControlTime;
    cmb_DoorControlTime1.Color := clYellow;
    SpinEdit_OpenMoni1.IntValue:=  strtoint(aLongDoorOpenTime);
    SpinEdit_OpenMoni1.Color := clYellow;
    ComboBox_UseSch1.ItemIndex:= strtoint(aSchedule);
    ComboBox_UseSch1.Color := clYellow;
    ComboBox_SendDoorStatus1.ItemIndex:=   strtoint(aDoorState);
    ComboBox_SendDoorStatus1.Color := clYellow;
    ComboBox_AlarmLongOpen1.ItemIndex:=    strtoint(aLongDoorOpenUse);
    ComboBox_AlarmLongOpen1.Color := clYellow;

    ComboBox_ControlFire1.ItemIndex:= strtoint(aFireDoorControl);
    ComboBox_ControlFire1.Color := clYellow;
    ComboBox_LockType1.ItemIndex:=         strtoint(aDoorLockType);
    ComboBox_LockType1.Color := clYellow;

    //출입문열림상태
    if IsDigit(aDoorOpenState) then
    begin
      cmb_DsOpenState1.ItemIndex := strtoint(aDoorOpenState);
      cmb_DsOpenState1.Color := clYellow;
    end;
    //원격해제시 Door Open
    if IsDigit(aRemoteDoorOpen) then
    begin
      cmb_RemoteDoorOpen1.ItemIndex := strtoint(aRemoteDoorOpen);
      cmb_RemoteDoorOpen1.Color := clYellow;
    end;


  end else if aDoorNo = '2' then
  begin
    cmb_DoorControlTime2.Text := aDoorControlTime;
    cmb_DoorControlTime2.Color := clYellow;
    SpinEdit_OpenMoni2.IntValue:= strtoint(aLongDoorOpenTime);;
    SpinEdit_OpenMoni2.Color := clYellow;
    ComboBox_UseSch2.ItemIndex:= strtoint(aSchedule);
    ComboBox_UseSch2.Color := clYellow;
    ComboBox_SendDoorStatus2.ItemIndex:=   strtoint(aDoorState);
    ComboBox_SendDoorStatus2.Color := clYellow;
    ComboBox_AlarmLongOpen2.ItemIndex:=    strtoint(aLongDoorOpenUse);
    ComboBox_AlarmLongOpen2.Color := clYellow;
    ComboBox_ControlFire2.ItemIndex:= strtoint(aFireDoorControl);
    ComboBox_ControlFire2.Color := clYellow;
    ComboBox_LockType2.ItemIndex:=         strtoint(aDoorLockType);
    ComboBox_LockType2.Color := clYellow;

    //출입문열림상태
    if IsDigit(aDoorOpenState) then
    begin
      cmb_DsOpenState2.ItemIndex := strtoint(aDoorOpenState);
      cmb_DsOpenState2.Color := clYellow;
    end;
    //원격해제시 Door Open
    if IsDigit(aRemoteDoorOpen) then
    begin
      cmb_RemoteDoorOpen2.ItemIndex := strtoint(aRemoteDoorOpen);
      cmb_RemoteDoorOpen2.Color := clYellow;
    end;

  end;
end;

procedure TfmDeviceSetting.btn_DevicStateClick(Sender: TObject);
begin
  FireMemoryClear;
  if chk_Door1use.Checked then
  begin
    DoorLockStateSearch('1');
  end;
  if chk_Door2use.Checked then
  begin
    DoorLockStateSearch('2');
  end;
  ZoneabnormalCheck;
end;

function TfmDeviceSetting.ZoneabnormalCheck: Boolean;
var
  i : integer;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i := 0 to G_nLoopCount do
  begin
    if G_bApplicationTerminate then Exit;
    result := fmMain.ZoneabnormalCheck(stNodeNo,stEcuID);
    if result then Break;
  end;

end;

procedure TfmDeviceSetting.FireMemoryClear;
var
  i : integer;
begin
  for i := 0 to HIGH(G_bFireDevice) - 1 do
  begin
    G_bFireDevice[i] := False;
  end;
end;

procedure TfmDeviceSetting.FireDeviceCheck;
var
  i : integer;
  bFire : Boolean;
begin
  bFire := False;
  for i := 0 to HIGH(G_bFireDevice) - 1 do
  begin
    if G_bFireDevice[i] then
    begin
      bFire := True;
      InsertFireDevice(FillZeroNumber(i,2));
    end else DeleteFireDevice(FillZeroNumber(i,2));
  end;
  if bFire then
  begin
    btn_FireDevice.Enabled := True;
    cmb_Firestat.itemIndex := 1;
    cmb_Firestat.Color := clRed;
  end else
  begin
    btn_FireDevice.Enabled := False;
    sg_FireDevice.Visible := False;
    cmb_Firestat.itemIndex := 0;
    cmb_Firestat.Color := clYellow;
  end;

end;

procedure TfmDeviceSetting.btn_FireDeviceClick(Sender: TObject);
begin
  sg_FireDevice.Visible := Not sg_FireDevice.Visible;
end;

procedure TfmDeviceSetting.DeleteFireDevice(aEcuID: string);
var
  i : integer;
begin
  for i := 1 to sg_FireDevice.RowCount - 1 do
  begin
    if sg_FireDevice.Cells[0,i] = aEcuID then
    begin
      sg_FireDevice.RemoveRows(i,1);
      if  sg_FireDevice.RowCount < 2 then sg_FireDevice.RowCount := 2;
    end;
  end;

end;

procedure TfmDeviceSetting.InsertFireDevice(aEcuID: string);
var
  i : integer;
  bSearch : Boolean;
begin

  bSearch := False;
  for i := 1 to sg_FireDevice.RowCount - 1 do
  begin
    if sg_FireDevice.Cells[0,i] = aEcuID then
    begin
      bSearch := True;
      break;
    end;
  end;
  if Not bSearch then
  begin
    if sg_FireDevice.Cells[0,1] = '' then sg_FireDevice.Cells[0,1] := aEcuID
    else
    begin
      sg_FireDevice.AddRow;
      sg_FireDevice.Cells[0,sg_FireDevice.RowCount - 1] := aEcuID;
    end;
  end;

end;

procedure TfmDeviceSetting.CardReaderVersionCheck;
var
  i : integer;
  cmb_Box : TComboBox;
  static_Text : TStaticText;
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID,1,3);
  stEcuID := copy(DeviceID,4,2);

  for i:= 1 to CardReaderMaxNum do
  begin
    cmb_Box := TravelComboBoxItem(gb_CardReader,'cmb_ReaderUse',i);
    if cmb_Box <> nil then
    begin
      if cmb_Box.ItemIndex = 1 then
      begin
        static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
        if static_Text <> nil then
        begin
          static_Text.Caption := '버젼체크중';
          if Not fmMain.CardReaderVersionCheck(stNodeNo,stEcuID,inttostr(i)) then
          begin
            if static_Text <> nil then
            begin
              static_Text.Caption := '실패';
              static_Text.Color := clRed;
            end;
          end;
        end;
      end else
      begin
        static_Text := TravelTStaticTextItem(gb_CardReader,'st_ReaderComstate',i);
        static_Text.Caption := '미사용';
      end;
    end;
  end;

end;

function TfmDeviceSetting.UpdateTB_ACCESSDEVICE_CardType(aNodeNo, aEcuID,
  aCardType: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ACCESSDEVICE set ';
  stSql := stSql + ' ac_cardreadertype = ''' + aCardType + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.UpdateTB_READER_info(aNodeNo, aEcuID, aReaderNo,
  aReaderuse, aReaderDoor, aReaderDoorLocate,
  aReaderBuildingLocate: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_READER set ';
  stSql := stSql + ' RE_USE = ''' + aReaderuse + ''', ';
  stSql := stSql + ' DO_DOORNO = ''' + aReaderDoor + ''', ';
  stSql := stSql + ' DOOR_POSI = ''' + aReaderDoorLocate + ''', ';
  stSql := stSql + ' BUILD_POSI = ''' + aReaderBuildingLocate + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmDeviceSetting.UpdateTB_ZONEDEVICE_Info(aNodeNo, aEcuID,
  aZoneNo, aWhatchType, aZoneDelay, aRecorver,
  aWhatchTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ZONEDEVICE set ';
  stSql := stSql + ' AL_WATCHTYPE = ''' + aWhatchType + ''', ';
  stSql := stSql + ' AL_DELAYUSE = ''' + aZoneDelay + ''', ';
  stSql := stSql + ' AL_PORTRECOVERY = ''' + aRecorver + ''' ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNo + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmDeviceSetting.DeviceTypeChange(NodeNo: integer; aEcuID,
  aDeviceType: string);
var
  nTempIndex : integer;
begin

  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;

  nTempIndex := DeviceStateList.IndexOf(DeviceID);
  if nTempIndex > -1 then
     TDeviceState(DeviceStateList.Objects[nTempIndex]).DeviceType := aDeviceType;

  case aDeviceType[1] of
    '1' : begin Form811TypeChange end;
    '2' : begin Form812TypeChange end;
    '3' : begin FormICU100TypeChange end;
    '4' : begin FormICU200TypeChange end;
    else  begin Form811TypeChange end;
  end;
end;

procedure TfmDeviceSetting.Form811TypeChange;
begin
  st_Door2Type.Visible := True;
  ComboBox_DoorType2.Visible := True;
  tab_DoorLock.TabVisible := True;
  tab_CardReader.TabVisible := True;
  chk_Jaejung.Visible := False;
end;

procedure TfmDeviceSetting.Form812TypeChange;
begin
  st_Door2Type.Visible := False;
  ComboBox_DoorType2.Visible := False;
  chk_Door2use.Checked := False;
  chk_Door2useClick(self);
  tab_DoorLock.TabVisible := True;
  tab_CardReader.TabVisible := True;
  chk_Jaejung.Visible := True;
end;

procedure TfmDeviceSetting.FormICU100TypeChange;
begin
  st_Door2Type.Visible := False;
  ComboBox_DoorType2.Visible := False;
  chk_Door2use.Checked := False;
  chk_Door2useClick(self);
  tab_DoorLock.TabVisible := True;
  tab_CardReader.TabVisible := False;
  chk_Jaejung.Visible := False;
end;

procedure TfmDeviceSetting.FormICU200TypeChange;
begin
  st_Door1Type.Visible := False;
  ComboBox_DoorType1.Visible := False;
  st_Door2Type.Visible := False;
  ComboBox_DoorType2.Visible := False;
  tab_DoorLock.TabVisible := False;
  tab_CardReader.TabVisible := False;
  chk_Jaejung.Visible := False;
end;


procedure TfmDeviceSetting.Menu_DeviceRebootClick(Sender: TObject);
var
  stNodeNo : string;
  stEcuID : string;
begin
  stNodeNo := copy(DeviceID ,1 ,3);
  stEcuID := copy(DeviceID ,4 ,2);

  fmMain.DeviceReboot(stNodeNo,stEcuID);

end;


procedure TfmDeviceSetting.SetDeviceID(const Value: string);
var
  nIndex : integer;
begin
  if FDeviceID = Value then Exit;
  FDeviceID := Value;
  st_DeviceVer.Caption := '';
  st_DeviceCode.Caption := '';
  //연결이 되어 있으면
  nIndex := DeviceStateList.IndexOf(Value);
  if nIndex < 0 then
  begin
    Exit;
  end;
  if TDeviceState(DeviceStateList.Objects[nIndex]).Connected then
  begin
    //기기버젼 체크 및 기기코드 체크하자.
    fmMain.DeviceVersion_Check(copy(Value,1,3),copy(Value,4,2));
    fmMain.DeviceCode_Check(copy(Value,1,3),copy(Value,4,2));
  end;
end;

procedure TfmDeviceSetting.RcvDeviceCode(NodeNo: integer; aEcuID,
  aCode: string);
var
  nTempIndex : integer;
begin
  if (FillZeroNumber(NodeNo,3) + aEcuID) <> copy(DeviceID,1,5) then Exit;
  G_bDeviceResponse[DEVICECODECHECK] := True;

  nTempIndex := DeviceStateList.IndexOf(DeviceID);
  if nTempIndex > -1 then
     TDeviceState(DeviceStateList.Objects[nTempIndex]).DeviceCode := aCode;

  st_DeviceCode.Caption := aCode;

end;

initialization
  RegisterClass(TfmDeviceSetting);
Finalization
  UnRegisterClass(TfmDeviceSetting);

end.
