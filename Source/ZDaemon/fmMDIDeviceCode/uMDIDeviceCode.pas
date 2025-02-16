unit uMDIDeviceCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, BaseGrid, AdvGrid, ExtCtrls, Buttons,
  Spin, uSubForm, CommandArray, DB, ADODB,ActiveX,Imm, AdvObj;

type
  TfmMDIDeviceCode = class(TfmASubForm)
    PageControl1: TPageControl;
    MCUTab: TTabSheet;
    ECUTab: TTabSheet;
    DoorTab: TTabSheet;
    StatusBar1: TStatusBar;
    AlarmTab: TTabSheet;
    GroupBox2: TGroupBox;
    Panel2: TPanel;
    Panel3: TPanel;
    GroupBox7: TGroupBox;
    lb_McuIp: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    lb_McuID: TLabel;
    Label19: TLabel;
    ed_McuIp: TEdit;
    cmb_sBuildingCode1: TComboBox;
    cmb_sFloorCode1: TComboBox;
    cmb_sAreaCode1: TComboBox;
    ed_McuPort: TEdit;
    ed_MCUID: TEdit;
    ed_MCUname: TEdit;
    gb_Device: TGroupBox;
    chk_McuAC: TCheckBox;
    chk_MCUFd: TCheckBox;
    chk_MCUPt: TCheckBox;
    chk_McuAT: TCheckBox;
    Splitter1: TSplitter;
    GroupBox4: TGroupBox;
    Panel6: TPanel;
    GroupBox10: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label22: TLabel;
    cmb_sBuildingCode2: TComboBox;
    cmb_sFloorCode2: TComboBox;
    cmb_sAreaCode2: TComboBox;
    ed_EcuName: TEdit;
    Panel5: TPanel;
    GroupBox11: TGroupBox;
    Label9: TLabel;
    cmb_MCUCode2: TComboBox;
    sg_ECUCode: TAdvStringGrid;
    Splitter2: TSplitter;
    GroupBox6: TGroupBox;
    Panel9: TPanel;
    GroupBox12: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    ed_sDoorName: TEdit;
    cmb_sBuildingCode3: TComboBox;
    cmb_sFloorCode3: TComboBox;
    cmb_sAreaCode3: TComboBox;
    cmb_sMCUCode3: TComboBox;
    cmb_sECUCode3: TComboBox;
    Panel8: TPanel;
    GroupBox13: TGroupBox;
    Label8: TLabel;
    Label14: TLabel;
    cmb_MCUCode3: TComboBox;
    cmb_ECUCode3: TComboBox;
    sg_DoorCode: TAdvStringGrid;
    Splitter3: TSplitter;
    GroupBox14: TGroupBox;
    Label26: TLabel;
    cmb_BuildingCode1: TComboBox;
    Label27: TLabel;
    cmb_FloorCode1: TComboBox;
    Label28: TLabel;
    cmb_AreaCode1: TComboBox;
    Label29: TLabel;
    cmb_BuildingCode2: TComboBox;
    Label30: TLabel;
    cmb_FloorCode2: TComboBox;
    Label31: TLabel;
    cmb_AreaCode2: TComboBox;
    Label32: TLabel;
    cmb_BuildingCode3: TComboBox;
    Label33: TLabel;
    cmb_FloorCode3: TComboBox;
    Label34: TLabel;
    cmb_AreaCode3: TComboBox;
    GroupBox16: TGroupBox;
    Splitter4: TSplitter;
    Panel4: TPanel;
    GroupBox17: TGroupBox;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    cmb_sBuildingCode4: TComboBox;
    cmb_sFloorCode4: TComboBox;
    cmb_sAreaCode4: TComboBox;
    cmb_sMCUCode4: TComboBox;
    cmb_sECUCode4: TComboBox;
    ed_AlarmName4: TEdit;
    Panel7: TPanel;
    GroupBox18: TGroupBox;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    cmb_MCUCode4: TComboBox;
    cmb_BuildingCode4: TComboBox;
    cmb_FloorCode4: TComboBox;
    cmb_AreaCode4: TComboBox;
    sg_AlarmCode: TAdvStringGrid;
    ed_AlarmNo4: TSpinEdit;
    Label45: TLabel;
    Label46: TLabel;
    ed_AlarmViewSeq: TEdit;
    Label47: TLabel;
    Label48: TLabel;
    ed_sDoorNo: TSpinEdit;
    Label10: TLabel;
    ed_Ecuno: TSpinEdit;
    chk_McuReg: TCheckBox;
    Label21: TLabel;
    chk_EcuReg: TCheckBox;
    gb_Device2: TGroupBox;
    chk_EcuAC: TCheckBox;
    chk_EcuFd: TCheckBox;
    chk_EcuPt: TCheckBox;
    chk_EcuAT: TCheckBox;
    chk_DoorReg: TCheckBox;
    chk_AlarmReg: TCheckBox;
    ed_TotWidth1: TEdit;
    ed_TotHeight1: TEdit;
    ed_CurX1: TEdit;
    ed_CurY1: TEdit;
    ed_NodeNo: TEdit;
    ed_NodeNo2: TEdit;
    ed_TotWidth2: TEdit;
    ed_TotHeight2: TEdit;
    ed_CurX2: TEdit;
    ed_CurY2: TEdit;
    ed_NodeNo3: TEdit;
    ed_TotWidth3: TEdit;
    ed_TotHeight3: TEdit;
    ed_CurX3: TEdit;
    ed_CurY3: TEdit;
    ed_NodeNo4: TEdit;
    ed_TotWidth4: TEdit;
    ed_TotHeight4: TEdit;
    ed_CurX4: TEdit;
    ed_CurY4: TEdit;
    ed_DoorViewSeq: TEdit;
    Label49: TLabel;
    cmb_sMCUCode2: TComboBox;
    sg_MCUCode: TAdvStringGrid;
    FoodTab: TTabSheet;
    GroupBox3: TGroupBox;
    Splitter5: TSplitter;
    Panel10: TPanel;
    GroupBox5: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    ed_sFoodName: TEdit;
    cmb_sBuildingCode5: TComboBox;
    cmb_sFloorCode5: TComboBox;
    cmb_sAreaCode5: TComboBox;
    cmb_sMCUCode5: TComboBox;
    cmb_sECUCode5: TComboBox;
    ed_sFoodNo: TSpinEdit;
    chk_FoodReg: TCheckBox;
    ed_NodeNo5: TEdit;
    ed_TotWidth5: TEdit;
    ed_TotHeight5: TEdit;
    ed_CurX5: TEdit;
    ed_CurY5: TEdit;
    Panel11: TPanel;
    GroupBox9: TGroupBox;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    cmb_MCUCode5: TComboBox;
    cmb_ECUCode5: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    sg_FoodCode: TAdvStringGrid;
    GroupBox8: TGroupBox;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Close: TSpeedButton;
    Label58: TLabel;
    ed_FoodAmtPer: TEdit;
    btnFoodPosition: TBitBtn;
    btnMCUPosition: TBitBtn;
    btnECUPosition: TBitBtn;
    btnDoorPosition: TBitBtn;
    btnAlarmPosition: TBitBtn;
    ADONode: TADOQuery;
    ADOECU: TADOQuery;
    ADOQuery: TADOQuery;
    ADOExec: TADOQuery;
    Panel12: TPanel;
    ZoneTab: TTabSheet;
    GroupBox1: TGroupBox;
    Splitter6: TSplitter;
    Panel1: TPanel;
    GroupBox15: TGroupBox;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label72: TLabel;
    cmb_sBuildingCode6: TComboBox;
    cmb_sFloorCode6: TComboBox;
    cmb_sAreaCode6: TComboBox;
    cmb_sAlarmCode6: TComboBox;
    ed_ZoneName: TEdit;
    ed_ZoneNo6: TSpinEdit;
    chk_ZoneReg: TCheckBox;
    ed_TotWidth6: TEdit;
    ed_TotHeight6: TEdit;
    ed_CurX6: TEdit;
    ed_CurY6: TEdit;
    btnZonePosition: TBitBtn;
    Panel13: TPanel;
    GroupBox19: TGroupBox;
    Label73: TLabel;
    cmb_MCUCode6: TComboBox;
    sg_ZoneCode: TAdvStringGrid;
    Label67: TLabel;
    Label71: TLabel;
    cmb_AlarmCode6: TComboBox;
    btn_Cancel: TSpeedButton;
    chk_McuUpdate: TCheckBox;
    chk_EcuUpdate: TCheckBox;
    chk_EcuName: TCheckBox;
    chk_DoorName: TCheckBox;
    chk_PtName: TCheckBox;
    chk_ECUDoorName: TCheckBox;
    chk_ECUPtName: TCheckBox;
    gbKTT: TGroupBox;
    Label2: TLabel;
    ed_muxid: TEdit;
    ed_systemid: TEdit;
    Label18: TLabel;
    Label76: TLabel;
    ed_decoderid: TEdit;
    chk_ECUJavara: TCheckBox;
    chk_MCUJavara: TCheckBox;
    chk_ECUTimeCode: TCheckBox;
    chk_MCUTimeCode: TCheckBox;
    Label74: TLabel;
    cmb_CardType: TComboBox;
    Label75: TLabel;
    cmb_SockType: TComboBox;
    Label77: TLabel;
    cmb_McuArmAreaUse: TComboBox;
    Label78: TLabel;
    cmb_EcuArmAreaUse: TComboBox;
    Label79: TLabel;
    se_McuSeq: TSpinEdit;
    procedure StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure cmb_BuildingCode1Change(Sender: TObject);
    procedure cmb_BuildingCode2Change(Sender: TObject);
    procedure cmb_BuildingCode3Change(Sender: TObject);
    procedure cmb_BuildingCode4Change(Sender: TObject);
    procedure cmb_sBuildingCode1Change(Sender: TObject);
    procedure cmb_sBuildingCode2Change(Sender: TObject);
    procedure cmb_sBuildingCode3Change(Sender: TObject);
    procedure cmb_FloorCode3Change(Sender: TObject);
    procedure cmb_FloorCode1Change(Sender: TObject);
    procedure cmb_FloorCode2Change(Sender: TObject);
    procedure cmb_FloorCode4Change(Sender: TObject);
    procedure cmb_sFloorCode1Change(Sender: TObject);
    procedure cmb_sFloorCode2Change(Sender: TObject);
    procedure cmb_sFloorCode3Change(Sender: TObject);
    procedure cmb_sFloorCode4Change(Sender: TObject);
    procedure cmb_AreaCode2Change(Sender: TObject);
    procedure cmb_AreaCode3Change(Sender: TObject);
    procedure cmb_AreaCode4Change(Sender: TObject);
    procedure cmb_sBuildingCode4Change(Sender: TObject);
    procedure cmb_sAreaCode2Change(Sender: TObject);
    procedure cmb_sAreaCode3Change(Sender: TObject);
    procedure cmb_sAreaCode4Change(Sender: TObject);
    procedure btn_CloseClick(Sender: TObject);
    procedure cmb_AreaCode1Change(Sender: TObject);
    procedure sg_MCUCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure cmb_MCUCode2Change(Sender: TObject);
    procedure sg_ECUCodeClick(Sender: TObject);
    procedure cmb_sMCUCode2Change(Sender: TObject);
    procedure cmb_MCUCode3Change(Sender: TObject);
    procedure cmb_ECUCode3Change(Sender: TObject);
    procedure sg_DoorCodeClick(Sender: TObject);
    procedure cmb_sMCUCode3Change(Sender: TObject);
    procedure cmb_MCUCode4Change(Sender: TObject);
    procedure sg_AlarmCodeClick(Sender: TObject);
    procedure cmb_sMCUCode4Change(Sender: TObject);
    procedure chk_EcuFdClick(Sender: TObject);
    procedure chk_EcuACClick(Sender: TObject);
    procedure chk_EcuPtClick(Sender: TObject);
    procedure chk_EcuATClick(Sender: TObject);
    procedure chk_McuACClick(Sender: TObject);
    procedure chk_MCUPtClick(Sender: TObject);
    procedure chk_McuATClick(Sender: TObject);
    procedure chk_MCUFdClick(Sender: TObject);
    procedure cmb_MCUCode5Change(Sender: TObject);
    procedure cmb_ECUCode5Change(Sender: TObject);
    procedure cmb_sBuildingCode5Change(Sender: TObject);
    procedure cmb_sFloorCode5Change(Sender: TObject);
    procedure cmb_sMCUCode5Change(Sender: TObject);
    procedure sg_FoodCodeClick(Sender: TObject);
    procedure btnFoodPositionClick(Sender: TObject);
    procedure btnMCUPositionClick(Sender: TObject);
    procedure btnECUPositionClick(Sender: TObject);
    procedure btnDoorPositionClick(Sender: TObject);
    procedure btnAlarmPositionClick(Sender: TObject);
    procedure cmb_MCUCode6Change(Sender: TObject);
    procedure sg_ZoneCodeClick(Sender: TObject);
    procedure cmb_sBuildingCode6Change(Sender: TObject);
    procedure cmb_sFloorCode6Change(Sender: TObject);
    procedure btnZonePositionClick(Sender: TObject);
    procedure cmb_AlarmCode6Change(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmb_CardReaderTypeChange(Sender: TObject);
    procedure cmb_CardReaderType2Click(Sender: TObject);
    procedure ed_EcunoChange(Sender: TObject);
    procedure cmb_sAreaCode1Change(Sender: TObject);
    procedure ed_EcuNameEnter(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure chk_ECUJavaraClick(Sender: TObject);
    procedure chk_MCUJavaraClick(Sender: TObject);
    procedure cmb_SockTypeChange(Sender: TObject);
  private
    { Private declarations }
    L_nTopRow : integer;
    L_bArmAreaUse : Boolean;
    BuildingCodeList : TStringList;
    sBuildingCodeList : TStringList;
    FloorCodeList : TStringList;
    sFloorCodeList : TStringList;
    AreaCodeList :TStringList;
    sAreaCodeList :TStringList;
    MCUCodeList : TStringList;
    sMCUCodeList : TStringList;
    ECUCodeList : TStringList;
    sECUCodeList : TStringList;
    AlarmCodeList : TStringList;
    sAlarmCodeList : TStringList;

    State : string;
    PrevECUNO : integer;

    procedure LoadBuildingCode(cmb_Box:TComboBox);
    procedure LoadsBuildingCode(cmb_Box:TComboBox);
    procedure LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
    procedure LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
    procedure LoadMCUCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);
    procedure LoadsMCUCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);
    procedure LoadECUCode(aMCUCode,aGubun:string;cmb_Box:TComboBox);
    procedure LoadsECUCode(aNodeNo,aGubun:string;cmb_Box:TComboBox);
    procedure LoadAlarmCode(aNodeNo:string;cmb_Box:TComboBox);
    procedure LoadsAlarmCode(aNodeNo:string;cmb_Box:TComboBox);
    procedure MCUSearch(aBuildingCode,aFloorCode,aAreaCode,aNodeNo:String;aTop:integer=0);
    procedure ECUSearch(aBuildingCode,aFloorCode,aAreaCode,aNodeNo,aSearchECUID:String;aTop:integer=0);
    procedure AlarmSearch(aNodeNo,aSearchAlarmNo:string);
    procedure DoorSearch(aNodeNo,aECUCode,aSearchDoorID:string);
    procedure ZoneSearch(aNodeNo,aAlarmNo:string);
    procedure FoodSearch(aNodeNo,aECUCode,aSearchFoodID:string);
    Function UpdateTB_NODE_RCV(aNodeNo,aSendAck:string):Boolean;
    Function InsertTB_ACCESSDEVICE(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aJavara,aSendAck,
                                   aGubun,aUpdate,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType:string;aArmAreaUse:string='N'):Boolean;
    Function UpdateTB_ACCESSDEVICE(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aMcuAC,aMcuFd,aMcuPt,aMcuAt,aJavara,aSendAck,
                                   aUpdate,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType,aArmAreaUse:string):Boolean;
    Function UpdateTB_ACCESSDEVICEInfo(aNodeNo,aMcuID,aEcuID,aMcuIp,aMcuPort,aName,aBuildingCode,
                                   aFloorCode,aAreaCode,aRegState,aTotWidth,aTotHeight,
                                   aCurX,aCurY,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType,aArmAreaUse:string):Boolean;
    Function UpdateTB_ACCESSDEVICESendAck(aNodeNo,aEcuID,aSendAck:string):Boolean;
    Function InsertTB_DOOR(aNodeNo,aEcuID,aDoorNo,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aDoorSeq :string):Boolean;
    Function UpdateTB_DOOR(aNodeNo,aEcuID,aDoorNo,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aDoorSeq :string):Boolean;
    Function InsertTB_ALARMDEVICE(aNodeNo,aEcuID,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aAlarmSeq :string):Boolean;
    Function UpdateTB_ALARMDEVICE(aNodeNo,aEcuID,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aDoorSeq :string):Boolean;
    Function InsertTB_ZoneDEVICE(aACNODENO,aACECUID,aZoneNo,aZoneName,aRegState,
                                 aBuildingCode,aFloorCode,aAreaCode,aTotWidth,
                                 aTotHeight,aCurX,aCurY:string):Boolean;
    Function UpdateTB_ZoneDEVICE(aACNODENO,aACECUID,aZoneNo,aZoneName,aRegState,
                                 aBuildingCode,aFloorCode,aAreaCode,aTotWidth,
                                 aTotHeight,aCurX,aCurY:string):Boolean;
    Function InsertTB_FOOD(aNodeNo,aEcuID,aDoorNo,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aFoodAmtPer :string):Boolean;
    Function UpdateTB_FOOD(aNodeNo,aEcuID,aDoorNo,aName,aBuildingCode,aFloorCode,
                                   aAreaCode,aRegState,aTotWidth,aTotHeight,aCurX,
                                   aCurY,aFoodAmtPer :string):Boolean;
    Function UpdateDeviceCardNoSend(aNodeNo,aEcuID:string):Boolean;

    Function UpdateECUIDFromECU(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromDOOR(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromALARM(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromFOOD(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromCARDNO(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromAdminDoor(aNodeNo,aPrevECUNO,aCurEcuno:string):Boolean;
    Function UpdateECUIDFromAdminFood(aNodeNO,aPrevECUNO,aCurEcuno:string):Boolean;

    Function DeleteTB_ACCESSDEVICE(aNodeNo,aEcuID:string):Boolean;
    Function DeleteTB_DOOR(aNodeNo,aEcuID,aDoorNo : string):Boolean;
    Function DeleteTB_FOOD(aNodeNo,aEcuID,aDoorNo : string):Boolean;
    Function DeleteTB_ALARMDEVICE(aACNODNON,aACECUID : string):Boolean;
    Function DeleteTB_ZONEDEVICE(aAlarmNo,aZoneNo : string):Boolean;
    Function DupCheckECU(aNodeNo,aEcuId:string):Boolean;
    Function DupCheckECUName(aNodeNo,aEcuId,aEcuName:string):Boolean;
    Function DupCheckDoor(aNodeNo,aECUID,aDoorNo:string):Boolean;
    Function DupCheckFood(aNodeNo,aECUID,aDoorNo:string):Boolean;
    Function DupCheckAlarm(aNodeNo,aECUID:string):Boolean;
    Function DupCheckZone(aNodeNo,aECUID,aZoneNo:string):Boolean;
    Function GarbageECUCheck(aNodeNo:string):Boolean;
    Function DeleteNODEECUALL(aNodeNo:string):Boolean;
    Function DeleteECUDoorAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUAlarmAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUZoneAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteECUFoodAll(aNodeNo,aECUID:string):Boolean;
    Function DeleteReader(aNodeNo,aECUID:string):Boolean;
    Function DeleteECU(aNodeNo,aECUID:string):Boolean;

    Function GarbageDoorCheck(aNodeNo,aECUID:string):Boolean;
    Function GarbageAlarmCheck(aNodeNo,aECUID:string):Boolean;
    Function GarbageFoodCheck(aNodeNo,aECUID:string):Boolean;

    procedure MCUSave ;
    procedure ECUSave;
    procedure DoorSave;
    procedure AlarmSave;
    procedure ZoneSave;
    procedure FoodSave;
    Function CreateCardReader(aNodeNo,aEcuID:string):Boolean;
    Function DupCheckCardReader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    Function InsertIntoTB_Reader(aNodeNo,aEcuID,aReaderNo:string):Boolean;
    Function InsertAlarmDevice(aNodeNo,aEcuID,aName,aBuildingCode,aFloorCode,aAreaCode,aArmAreaUse:string;bUpdate:Boolean=False):Boolean;
    Function UpdateECUName(aNodeNo,aMcuName:string):Boolean; //메인 명칭 변경시 디폴트값인 경우 확장기명칭 변경
    Function UpdateDoorName(aNodeNo,aEcuID,aEcuName:string;aUpdate:Boolean=False):Boolean; //해당 확장기의 디폴트값인 출입문 명칭을 변경하자
    Function DeleteAlarmDevice(aNodeNo,aEcuID:string):Boolean; //해당 방범기기를 삭제 하자
    Function InsertZoneDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode:string):Boolean; //존의 디폴트값을 생성하자.
    function InsertAlarmDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode:string):Boolean;
    function InsertARMAREADefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse:string):Boolean;
    function UpdateAlarmDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode:string;aUpdate:Boolean = False):Boolean;
    function UpdateZoneDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode:string;aUpdate:Boolean=False):Boolean;
    function UpdateARMAREADefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse:string;aUpdate:Boolean):Boolean;
  public
    { Public declarations }
    WorkCode : integer;
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);

    procedure MCUInsertClick;
    procedure ECUInsertClick;
    procedure DoorInsertClick;
    procedure AlarmInsertClick;
    procedure ZoneInsertClick;
    procedure FoodInsertClick;

    procedure DeleteMCUClick;
    procedure DeleteECUClick;
    procedure DeleteDoorClick;
    procedure DeleteAlaramClick;
    procedure DeleteZoneClick;
    procedure DeleteFoodClick;
    function GetZoneBuildingCode(aAlarmCode:string):string;
    function GetZoneFloorCode(aAlarmCode:string):string;
    function GetZoneSectorCode(aAlarmCode:string):string;
  end;

var
  fmMDIDeviceCode: TfmMDIDeviceCode;

implementation
uses
  uLomosUtil,
  uDataModule1,
  uPositionSet,
  uEcuCount,
  uKTTControl, uCommonSql,
  uDBFunction;

{$R *.dfm}

{ TfmDeviceCode }

procedure TfmMDIDeviceCode.StringGrideDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
var
  DataInCell : string;
  nLeft,nTop : integer;
begin
  if (AROW < (Sender as TStringGrid).FixedRows) then
  begin

    DataInCell := (Sender as TStringGrid).Cells[Acol,Arow];

    with (Sender as TStringGrid).Canvas do
    begin
      FillRect(Rect);  //켄버스를 칠한다.(기본값은 흰색)

      if DataInCell <> '' then
      begin
        nLeft := ((Rect.Right-Rect.Left) - TextWidth(DataInCell)) div 2;
        nTop := ((Rect.Bottom-Rect.Top) - TextHeight(DataInCell)) div 2;
        TextRect(Rect, Rect.Left + nLeft, Rect.Top + nTop, DataInCell);  //문자를 뿌려준다.. 기본은 검정색
      end;

    End;
  End;   
end;

procedure TfmMDIDeviceCode.FormCreate(Sender: TObject);
begin
  L_nTopRow := 1;

  BuildingCodeList := TStringList.Create ;
  sBuildingCodeList := TStringList.Create ;
  FloorCodeList := TStringList.Create;
  sFloorCodeList := TStringList.Create;
  AreaCodeList := TStringList.Create;
  sAreaCodeList := TStringList.Create;
  MCUCodeList := TStringList.Create;
  sMCUCodeList := TStringList.Create;
  ECUCodeList := TStringList.Create;
  sECUCodeList := TStringList.Create;
  AlarmCodeList := TStringList.Create;
  sAlarmCodeList := TStringList.Create;

  gbKTT.Visible := G_bKTTEventServerUse;
end;

procedure TfmMDIDeviceCode.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    BuildingCodeList.Free ;
    sBuildingCodeList.Free ;
    FloorCodeList.Free;
    sFloorCodeList.Free;
    AreaCodeList.Free;
    sAreaCodeList.Free;
    MCUCodeList.Free;
    sMCUCodeList.Free;
    ECUCodeList.Free;
    sECUCodeList.Free;
    AlarmCodeList.Free;
    sAlarmCodeList.Free;

  self.FindSubForm('Main').FindCommand('RESTART').Execute;

  Action := caFree;

end;

procedure TfmMDIDeviceCode.LoadAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
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
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadBuildingCode(cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  cmb_Box.Clear;
  BuildingCodeList.Clear;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadECUCode(aMCUCode,aGubun:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  ECUCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aGubun <> 'FOOD' then
    stSql := stSql + ' AND AC_FDTYPE <> ''1'' '
  else stSql := stSql + ' AND AC_FDTYPE = ''1'' ';

  if (aMCUCode <> '') And (aMCUCode <> '0000000000')  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(copy(aMCUCode,1,3))) ;
  end else Exit;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    cmb_Box.Items.Add('전체');
    ECUCodeList.Add('');
    cmb_Box.ItemIndex := 0;

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
        cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
        ECUCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) +  FindField('AC_ECUID').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
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
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE';

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
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadMCUCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  MCUCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
    if (aFloorCode <> '') And (aFloorCode <> '000')  then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
      if (aAreaCode <> '') And (aAreaCode <> '000')  then
      begin
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + '''';
      end;
    end;

  end;
  stSql := stSql + ' order by AC_NODENO ';

  cmb_Box.Items.Add('전체');
  MCUCodeList.Add('');
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
        cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
        MCUCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadsAreaCode(aBuildingCode,aFloorCode:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAreaCodeList.Clear;

  cmb_Box.Items.Add('');
  sAreaCodeList.Add('');
  cmb_Box.ItemIndex := 0;


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
  stSql := stsql + ' order by LO_DONGCODE,LO_FLOORCODE,LO_AREACODE ';

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
        sAreaCodeList.Add(FindField('LO_AREACODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadsBuildingCode(cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sBuildingCodeList.Clear;

  cmb_Box.Items.Add('');
  sBuildingCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''0'' ';
  stSql := stSql + ' order by LO_DONGCODE ';

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
        sBuildingCodeList.Add(FindField('LO_DONGCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadsECUCode(aNodeNo,aGubun:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sECUCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  if aGubun <> 'FOOD' then
    stSql := stSql + ' AND AC_FDTYPE <> ''1'' '
  else stSql := stSql + ' AND AC_FDTYPE = ''1'' ';

  if (aNodeNo <> '') And (aNodeNo <> '000')  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  end;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID' ;

  cmb_Box.Items.Add('');
  sECUCodeList.Add('');
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
        cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
        sECUCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) +  FindField('AC_ECUID').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadsFloorCode(aBuildingCode:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sFloorCodeList.Clear;

  cmb_Box.Items.Add('');
  sFloorCodeList.Add('000');
  cmb_Box.ItemIndex := 0;

  stSql := 'select * from TB_LOCATION ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND LO_GUBUN = ''1'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
  end else Exit;
  stSql := stSql + ' order by LO_DONGCODE,LO_FLOORCODE ';

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
        sFloorCodeList.Add(FindField('LO_FLOORCODE').AsString);
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.LoadsMCUCode(aBuildingCode,aFloorCode,aAreaCode:string;cmb_Box:TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sMCUCodeList.Clear;

  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_ECUID = ''00'' ';

  if (aBuildingCode <> '') And (aBuildingCode <> '000')  then
  begin
    stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + '''';
    if (aFloorCode <> '') And (aFloorCode <> '000')  then
    begin
      stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + '''';
      if (aAreaCode <> '') And (aAreaCode <> '000')  then
      begin
        stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + '''';
      end;
    end;

  end;
  stSql :=  stSql + ' order by AC_NODENO ';


  cmb_Box.Items.Add('');
  sMCUCodeList.Add('');
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
        cmb_Box.Items.Add(FindField('AC_DEVICENAME').AsString );
        sMCUCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3));
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.FormActivate(Sender: TObject);
var
  i : integer;
  stBuildingCode : string;
begin
  if (WorkCode < 0) or (WorkCode > 3) then WorkCode := 0;
  PageControl1.ActivePageIndex := WorkCode;


  with sg_MCUCode do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 3 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
    if Not UseDeviceServer then ColWidths[1] := 0
    else ColWidths[0] := 0;
  end;
  with sg_ECUCode do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 3 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_DoorCode do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 4 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;
  with sg_AlarmCode do
  begin
    //OnDrawCell:=StringGrideDrawCell;
    for i := 4 to ColCount - 1 do
    begin
      ColWidths[i] := 0;
    end;
  end;

  if WorkCode = 0 then    //MCU 관리
  begin
    LoadBuildingCode(cmb_BuildingCode1);
    LoadsBuildingCode(cmb_sBuildingCode1);
    MCUSearch('000', '000','000','0');
  end  else if WorkCode = 1 then //ECU 관리
  begin
    LoadBuildingCode(cmb_BuildingCode2);
    LoadsBuildingCode(cmb_sBuildingCode2);
    LoadMCUCode('000','000','000',cmb_MCUCode2);
    LoadsMCUCode('000','000','000',cmb_sMCUCode2);
    ECUSearch('000', '000','000','000','');
  end else if WorkCode = 2 then //DOOR 관리
  begin
    LoadBuildingCode(cmb_BuildingCode3);
    LoadsBuildingCode(cmb_sBuildingCode3);
    LoadMCUCode('000','000','000',cmb_MCUCode3);
    LoadsMCUCode('000','000','000',cmb_sMCUCode3);
  end else if WorkCode = 3 then   //방범관리
  begin
    LoadBuildingCode(cmb_BuildingCode4);
    LoadsBuildingCode(cmb_sBuildingCode4);
    LoadMCUCode('000','000','000',cmb_MCUCode4);
    LoadsMCUCode('000','000','000',cmb_sMCUCode4);
    AlarmSearch('000','');
  end else if WorkCode = 4 then   //식수관리
  begin
    LoadsBuildingCode(cmb_sBuildingCode5);
    LoadMCUCode('000','000','000',cmb_MCUCode5);
    LoadsMCUCode('000','000','000',cmb_sMCUCode5);
  end;

end;

procedure TfmMDIDeviceCode.PageControl1Change(Sender: TObject);
begin
  with PageControl1 do
  begin
    if ActivePage.Name = 'MCUTab' then    //MCU 관리
    begin
      LoadBuildingCode(cmb_BuildingCode1);
      LoadsBuildingCode(cmb_sBuildingCode1);
      MCUSearch('000', '000','000','0');
    end  else if ActivePage.Name = 'ECUTab' then //ECU 관리
    begin
      LoadBuildingCode(cmb_BuildingCode2);
      LoadsBuildingCode(cmb_sBuildingCode2);
      LoadMCUCode('000','000','000',cmb_MCUCode2);
      LoadsMCUCode('000','000','000',cmb_sMCUCode2);
      ECUSearch('000', '000','000','000','');
    end else if ActivePage.Name = 'DoorTab' then //DOOR 관리
    begin
      LoadBuildingCode(cmb_BuildingCode3);
      LoadsBuildingCode(cmb_sBuildingCode3);
      LoadMCUCode('000','000','000',cmb_MCUCode3);
      LoadsMCUCode('000','000','000',cmb_sMCUCode3);
      DoorSearch('000', '','')
    end else if ActivePage.Name = 'AlarmTab' then   //방범관리
    begin
      LoadBuildingCode(cmb_BuildingCode4);
      LoadsBuildingCode(cmb_sBuildingCode4);
      LoadMCUCode('000','000','000',cmb_MCUCode4);
      LoadsMCUCode('000','000','000',cmb_sMCUCode4);
      AlarmSearch('000','');
    end else if ActivePage.Name = 'ZoneTab' then   //존관리
    begin
      LoadsBuildingCode(cmb_sBuildingCode6);
      LoadMCUCode('000','000','000',cmb_MCUCode6);
      LoadAlarmCode('000',cmb_AlarmCode6);
      LoadsAlarmCode('000',cmb_sAlarmCode6);
      ZoneSearch('000',AlarmCodeList.Strings[cmb_AlarmCode6.itemIndex]);
    end else if ActivePage.Name = 'FoodTab' then //Food 관리
    begin
      LoadsBuildingCode(cmb_sBuildingCode5);
      LoadMCUCode('000','000','000',cmb_MCUCode5);
      LoadsMCUCode('000','000','000',cmb_sMCUCode5);
      FoodSearch('000', '','')
    end;
  end;

end;

procedure TfmMDIDeviceCode.cmb_BuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_BuildingCode1.itemindex < 0 then
  begin
    Exit;
  end;
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode1);
  LoadAreaCode(stBuildingCode,'000',cmb_AreaCode1);
  MCUSearch(stBuildingCode, '000','000','0');

end;

procedure TfmMDIDeviceCode.cmb_BuildingCode2Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_BuildingCode2.itemindex < 0 then
  begin
    Exit;
  end;

  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode2);
  LoadAreaCode(stBuildingCode,'000',cmb_AreaCode2);
  LoadMCUCode(stBuildingCode,'000','000',cmb_MCUCode2);
  ECUSearch(stBuildingCode, '000','000','000','');

end;

procedure TfmMDIDeviceCode.cmb_BuildingCode3Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode3.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode3);
  LoadMCUCode(stBuildingCode,'000','000',cmb_MCUCode3);

end;

procedure TfmMDIDeviceCode.cmb_BuildingCode4Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode4.itemindex ];
  LoadFloorCode(stBuildingCode,cmb_FloorCode4);
  LoadMCUCode(stBuildingCode,'000','000',cmb_MCUCode4);

end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode1Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode1.itemindex < 0 then
  begin
    cmb_sBuildingCode1.Text := '';
    Exit;
  End;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode1);
  LoadsAreaCode(stBuildingCode,'000',cmb_sAreaCode1);

end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode2Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  if cmb_sBuildingCode2.itemindex < 0 then
  begin
    cmb_sBuildingCode2.Text := '';
    Exit;
  end;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode2.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode2);
  LoadsAreaCode(stBuildingCode,'000',cmb_sAreaCode2);
//  LoadsMCUCode(stBuildingCode,'000','000',cmb_sMCUCode2);

end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode3Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode3.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode3);
  cmb_sAreaCode3.Clear;
  sAreaCodeList.Clear;


end;


procedure TfmMDIDeviceCode.cmb_FloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode1);
  MCUSearch(stBuildingCode, stFloorCode,'000','0');

end;

procedure TfmMDIDeviceCode.cmb_FloorCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode2);
  LoadMCUCode(stBuildingCode,stFloorCode,'000',cmb_MCUCode2);
  ECUSearch(stBuildingCode, stFloorCode,'000','000','');

end;

procedure TfmMDIDeviceCode.cmb_FloorCode3Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode3.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode3.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode3);
  LoadMCUCode(stBuildingCode,stFloorCode,'000',cmb_MCUCode3);

end;

procedure TfmMDIDeviceCode.cmb_FloorCode4Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode4.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode4.itemindex ];
  LoadAreaCode(stBuildingCode,stFloorCode,cmb_AreaCode4);
  LoadMCUCode(stBuildingCode,stFloorCode,'000',cmb_MCUCode4);

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode1.itemindex < 0 then
  begin
    cmb_sBuildingCode1.Text := '';
    Exit;
  End;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];
  if cmb_sFloorCode1.itemindex < 0 then
  begin
    cmb_sFloorCode1.Text := '';
    Exit;
  End;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode1.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode1);

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  if cmb_sBuildingCode2.itemindex < 0 then
  begin
    cmb_sBuildingCode2.Text := '';
    Exit;
  End;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode2.itemindex ];
  if cmb_sFloorCode2.itemindex < 0 then
  begin
    cmb_sFloorCode2.Text := '';
    Exit;
  End;
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode2.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode2);
//  LoadsMCUCode(stBuildingCode,stFloorCode,'000',cmb_sMCUCode2);

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode3Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode3.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode3.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode3);
  //LoadsMCUCode(stBuildingCode,stFloorCode,'000',cmb_sMCUCode3);

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode4Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode4.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode4.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode4);
  //LoadsMCUCode(stBuildingCode,stFloorCode,'000',cmb_sMCUCode4);

end;

procedure TfmMDIDeviceCode.cmb_AreaCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
  stAreaCode := AreaCodeList.Strings[ cmb_AreaCode2.itemindex ];
  LoadMCUCode(stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode2);
  ECUSearch(stBuildingCode, stFloorCode,stAreaCode,'000','');
end;

procedure TfmMDIDeviceCode.cmb_AreaCode3Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode3.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode3.itemindex ];
  stAreaCode := AreaCodeList.Strings[ cmb_AreaCode3.itemindex ];
  LoadMCUCode(stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode3);

end;

procedure TfmMDIDeviceCode.cmb_AreaCode4Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode4.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode4.itemindex ];
  stAreaCode := AreaCodeList.Strings[ cmb_AreaCode4.itemindex ];
  LoadMCUCode(stBuildingCode,stFloorCode,stAreaCode,cmb_MCUCode4);

end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode4Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode4.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode4);
  //LoadsMCUCode(stBuildingCode,'000','000',cmb_sMCUCode4);

end;

procedure TfmMDIDeviceCode.cmb_sAreaCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sAreaCode2.itemindex < 0 then
  begin
    cmb_sAreaCode2.Text := '';
    Exit;
  End;
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode2.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode2.itemindex ];
  stAreaCode := sAreaCodeList.Strings[ cmb_sAreaCode2.itemindex ];

end;

procedure TfmMDIDeviceCode.cmb_sAreaCode3Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode3.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode3.itemindex ];
  stAreaCode := sAreaCodeList.Strings[ cmb_sAreaCode3.itemindex ];

end;

procedure TfmMDIDeviceCode.cmb_sAreaCode4Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode4.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode4.itemindex ];
  stAreaCode := sAreaCodeList.Strings[ cmb_sAreaCode4.itemindex ];

end;

procedure TfmMDIDeviceCode.MCUSearch(aBuildingCode, aFloorCode,
  aAreaCode,aNodeNo: String;aTop:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  if aNodeNo = '' then aNodeNo := '0';
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_MCUCode); //스트링그리드 초기화
//  LoadsBuildingCode(cmb_sBuildingCode1);
//  LoadsFloorCode('000',cmb_sFloorCode1);
//  LoadsAreaCode('000','000',cmb_sAreaCode1);


  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_GUBUN = ''0'' ';
  stSql := stSql + ' AND AC_NETTYPE = ''' + NETTYPE + ''' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then  stSql := stSql + ' AND LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then   stSql := stSql + ' AND LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then    stSql := stSql + ' AND LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' order by AC_NODENO ';

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
      sg_MCUCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_MCUCode do
        begin
          cells[0,nRow] := FindField('AC_MCUID').AsString;
          cells[1,nRow] := FindField('AC_MCUIP').AsString;
          cells[2,nRow] := FindField('AC_DEVICENAME').AsString;
          cells[3,nRow] := FindField('AC_NODENO').AsString;
          cells[4,nRow] := FindField('AC_ECUID').AsString;
          cells[5,nRow] := FindField('AC_ACTYPE').AsString;
          cells[6,nRow] := FindField('AC_ATTYPE').AsString;
          cells[7,nRow] := FindField('AC_FDTYPE').AsString;
          cells[8,nRow] := FindField('AC_PTTYPE').AsString;
          cells[9,nRow] := FindField('LO_DONGCODE').AsString;
          cells[10,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[11,nRow] := FindField('LO_AREACODE').AsString;
          cells[12,nRow] := FindField('AC_VIEWSEQ').AsString;
          cells[13,nRow] := FindField('AC_MCUIP').AsString;
          cells[14,nRow] := FindField('AC_MCUPORT').AsString;
          cells[15,nRow] := FindField('AC_LOCATEUSE').AsString;
          cells[16,nRow] := FindField('AC_TOTWIDTH').AsString;
          cells[17,nRow] := FindField('AC_TOTHEIGHT').AsString;
          cells[18,nRow] := FindField('AC_CURX').AsString;
          cells[19,nRow] := FindField('AC_CURY').AsString;
          cells[20,nRow] := FindField('AC_CARDREADERTYPE').AsString;
          cells[21,nRow] := FindField('AC_LINKUSID').AsString;
          cells[22,nRow] := FindField('AC_MUXID').AsString;
          cells[23,nRow] := FindField('AC_DECODERID').AsString;
          cells[24,nRow] := FindField('AC_JAVARATYPE').AsString;
          cells[25,nRow] := FindField('AC_TIMETYPE').AsString;
          cells[26,nRow] := FindField('AC_CARDBYTE').AsString;
          cells[27,nRow] := FindField('AC_SOCKTYPE').AsString;
          cells[28,nRow] := FindField('AC_ARMAREAUSE').AsString;

          if FindField('AC_NODENO').AsString = inttostr(strtoint(aNodeNo)) then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
    if aTop <> 0 then
      sg_MCUCode.topRow := aTop
    else
    begin
      if sg_MCUCode.row > 7 then sg_MCUCode.TopRow := sg_MCUCode.row - 6;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_MCUCodeClick(sg_MCUCode);
end;

procedure TfmMDIDeviceCode.btn_CloseClick(Sender: TObject);
begin
//  self.FindSubForm('Main').FindCommand('DEVICE').Execute;
  Close;
end;

procedure TfmMDIDeviceCode.cmb_AreaCode1Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
  stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
  MCUSearch(stBuildingCode, stFloorCode,stAreaCode,'0');

end;

procedure TfmMDIDeviceCode.sg_MCUCodeClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode : string;
begin
  with (Sender as TStringGrid) do
  begin
    if (cells[0,Row] = '') and (Cells[1,Row] = '') then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_NodeNo.Text := cells[3,Row];
    ed_MCUID.Text  := cells[0,Row];
    ed_MCUIP.Text  := cells[13,Row];
    ed_MCUPORT.Text  := cells[14,Row];
    ed_MCUNAME.Text  := cells[2,Row];

    
    LoadsBuildingCode(cmb_sBuildingCode1);
    if (cells[9,Row] = '') or (cells[9,Row] = '000') then cmb_sBuildingCode1.ItemIndex := 0
    else cmb_sBuildingCode1.ItemIndex := sBuildingCodeList.IndexOf(cells[9,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode1.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode1);
    if (cells[10,Row] = '') or (cells[10,Row] = '000') then cmb_sFloorCode1.ItemIndex := 0
    else cmb_sFloorCode1.ItemIndex := sFloorCodeList.IndexOf(cells[10,Row]);
    if cmb_sFloorCode1.itemindex > -1 then
      stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode1.itemindex ]
    else stFloorCode := '000';
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode1);;
    if (cells[11,Row] = '') or (cells[11,Row] = '000') then cmb_sAreaCode1.ItemIndex := 0
    else cmb_sAreaCode1.ItemIndex := sAreaCodeList.IndexOf(cells[11,Row]);

    if isDigit(cells[12,Row]) then se_McuSeq.Value := strtoint(cells[12,Row]);

    if cells[15,Row] = 'Y' then chk_MCUReg.Checked := True
    else chk_MCUReg.Checked := False;
    ed_TotWidth1.Text := cells[16,Row];
    ed_TotHeight1.Text := cells[17,Row];
    ed_CurX1.Text := cells[18,Row];
    ed_CurY1.Text := cells[19,Row];
    if cells[5,Row] <> '0' then chk_MCUAc.Checked := True
    else chk_MCUAc.Checked := False;
    if cells[6,Row] <> '0' then chk_MCUAt.Checked := True
    else chk_MCUAt.Checked := False;
    //if cells[8,Row] <> '0' then chk_MCUPt.Checked := True
    //else chk_MCUPt.Checked := False;
    chk_MCUPt.Checked := True;
    if cells[7,Row] <> '0' then chk_MCUFd.Checked := True
    else chk_MCUFd.Checked := False;
    if cells[24,Row] <> '0' then chk_MCUJavara.Checked := True
    else chk_MCUJavara.Checked := False;
    if cells[25,Row] <> '1' then chk_MCUTimeCode.Checked := False
    else chk_MCUTimeCode.Checked := True;

    ed_systemid.Text := cells[21,Row];
    ed_muxid.Text := cells[22,Row];
    ed_decoderid.Text := cells[23,Row];
    if isDigit(cells[26,Row]) then cmb_CardType.ItemIndex := strtoint(cells[26,Row])
    else cmb_CardType.ItemIndex :=  CARDLENGTHTYPE;
    if isDigit(cells[27,Row]) then cmb_SockType.ItemIndex := strtoint(cells[27,Row]) - 1
    else
    begin
      if UseDeviceServer then cmb_SockType.ItemIndex :=  0
      else cmb_SockType.ItemIndex := 1;
    end;
    if cells[28,Row] = 'Y' then
    begin
      cmb_McuArmAreaUse.ItemIndex := 1;
      L_bArmAreaUse := True;
    end else
    begin
      cmb_McuArmAreaUse.ItemIndex := 0;
      L_bArmAreaUse := False;
    end;
    if cmb_SockType.ItemIndex = 0 then
    begin
      lb_McuIP.Visible := True;
      ed_MCUIP.Visible := True;
      lb_McuID.Visible := False;
      ed_MCUID.Visible := False;
    end else
    begin
      lb_McuIP.Visible := False;
      ed_MCUIP.Visible := False;
      lb_McuID.Visible := True;
      ed_MCUID.Visible := True;
    end;


  end;
end;

procedure TfmMDIDeviceCode.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  if PageControl1.ActivePage.Name = 'MCUTab' then
  begin
    L_nTopRow := sg_MCUCode.TopRow;
    LoadsBuildingCode(cmb_sBuildingCode1);
    MCUInsertClick;
    if Not UseDeviceServer then ed_McuID.SetFocus
    else ed_McuIp.SetFocus;
  end else if PageControl1.ActivePage.Name = 'ECUTab' then
  begin
    L_nTopRow := sg_ECUCode.TopRow;
    LoadsBuildingCode(cmb_sBuildingCode2);
    ECUInsertClick;
    ed_EcuName.SetFocus;
  end else if PageControl1.ActivePage.Name = 'DoorTab' then
  begin
    LoadsBuildingCode(cmb_sBuildingCode3);
    DoorInsertClick;
  end else if PageControl1.ActivePage.Name = 'AlarmTab' then  //방범 입력
  begin
    LoadsBuildingCode(cmb_sBuildingCode4);
    AlarmInsertClick;
  end else if PageControl1.ActivePage.Name = 'ZoneTab' then  //존 위치 입력
  begin
    LoadsBuildingCode(cmb_sBuildingCode6);
    ZoneInsertClick;
  end else if PageControl1.ActivePage.Name = 'FoodTab' then
  begin
    LoadsBuildingCode(cmb_sBuildingCode5);
    FoodInsertClick;
  end;
end;

procedure TfmMDIDeviceCode.btn_UpdateClick(Sender: TObject);
begin
  chk_McuUpdate.Checked := False;
  chk_EcuUpdate.Checked := False;
  
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);

  if PageControl1.ActivePage.Name = 'MCUTab' then
  begin
    L_nTopRow := sg_MCUCode.TopRow;
    if cmb_SockType.ItemIndex = 1 then ed_McuID.SetFocus
    else ed_McuIp.SetFocus;
  end else if PageControl1.ActivePage.Name = 'ECUTab' then
  begin
    L_nTopRow := sg_ECUCode.TopRow;
    ed_EcuName.SetFocus;
  end else if PageControl1.ActivePage.Name = 'DoorTab' then
  begin
    ed_sDoorName.SetFocus;
  end else if PageControl1.ActivePage.Name = 'AlarmTab' then
  begin
    ed_AlarmName4.SetFocus;
  end else if PageControl1.ActivePage.Name = 'ZoneTab' then
  begin
    //ed_ZoneName.SetFocus;
  end else if PageControl1.ActivePage.Name = 'FoodTab' then
  begin
    ed_sFoodName.SetFocus;
  end;
end;

procedure TfmMDIDeviceCode.btn_SaveClick(Sender: TObject);

begin
  if PageControl1.ActivePage.Name = 'MCUTab' then     //MCU 정보 저장
  begin
    MCUSave;
  end else if PageControl1.ActivePage.Name = 'ECUTab' then    //ECU 정보 저장
  begin
    ECUSave;
  end else if PageControl1.ActivePage.Name = 'DoorTab' then   //Door 정보 저장
  begin
    DoorSave;
  end else if PageControl1.ActivePage.Name = 'AlarmTab' then   //방범 정보 저장
  begin
    AlarmSave;
  end else if PageControl1.ActivePage.Name = 'ZoneTab' then   //존 정보 저장
  begin
    ZoneSave;
  end else if PageControl1.ActivePage.Name = 'FoodTab' then   //Food 정보 저장
  begin
    FoodSave;
  end;
end;

function TfmMDIDeviceCode.InsertTB_ACCESSDEVICE(aNodeNo,aMcuID, aEcuID, aMcuIp,
  aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aMcuAC, aMcuFd, aMcuPt,
  aMcuAt,aJavara,aSendAck,aGubun,aUpdate,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType:string;aArmAreaUse:string='N'): Boolean;
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
  stSql := stSql + 'AC_JAVARATYPE,';
  stSql := stSql + 'AC_NETTYPE,';
  stSql := stSql + 'AC_GUBUN,';
  stSql := stSql + 'AC_DEVICETYPE,';
  stSql := stSql + 'SEND_ACK,';
  stSql := stSql + 'AC_UPDATE,';
  stSql := stSql + 'AC_LINKUSID,';
  stSql := stSql + 'AC_MUXID,';
  stSql := stSql + 'AC_DECODERID,';
  stSql := stSql + 'AC_TIMETYPE,';
  stSql := stSql + 'AC_CARDBYTE';
  if aSockType <> '' then stSql := stSql + ',AC_SOCKTYPE';
  stSql := stSql + ',AC_ARMAREAUSE';
  stSql := stSql + ' )';
  stSql := stSql + ' values (';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + aNodeNo + ',';
  stSql := stSql + '''' + aMcuID + ''',';
  stSql := stSql + '''' + aEcuID + ''',';
  stSql := stSql + '''' + aMcuIp + ''',';
  stSql := stSql + '''' + aMcuPort + ''',';
  stSql := stSql + '''' + aName + ''',';
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
  stSql := stSql + '''' + aJavara + ''',';
  stSql := stSql + '''' + NETTYPE + ''',';
  stSql := stSql + '''' + aGubun + ''',';
  stSql := stSql + '''1'',';    //KTT811
  stSql := stSql + '''' + aSendAck + ''',';
  stSql := stSql + '''' + aUpdate + ''',';
  stSql := stSql + '''' + aSystemId + ''',';
  stSql := stSql + '''' + aMuxId + ''',';
  stSql := stSql + '''' + aDecoderID + ''', ';
  stSql := stSql + '''' + aTimeCodeType + ''', ';
  stSql := stSql + '''' + aCardType + ''' ';
  if aSockType <> '' then stSql := stSql + ',' + aSockType + ' ';
  stSql := stSql + ',''' + aArmAreaUse + ''' ';
  stSql := stSql + ')';

  result :=  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Insert Into TB_TIMECODEDEVICE( ';
  stSql := stSql + ' GROUP_CODE,';
  stSql := stSql + ' AC_NODENO,';
  stSql := stSql + ' AC_ECUID,';
  stSql := stSql + ' TC_GROUP,';
  stSql := stSql + ' TC_TIME1,';
  stSql := stSql + ' TC_TIME2,';
  stSql := stSql + ' TC_TIME3,';
  stSql := stSql + ' TC_TIME4,';
  stSql := stSql + ' TC_SEND)';
  stSql := stSql + ' Select a.GROUP_CODE,a.AC_NODENO,a.AC_ECUID,b.TC_GROUP,';
  stSql := stSql + ' b.TC_TIME1,b.TC_TIME2,b.TC_TIME3,b.TC_TIME4,''N'' ';
  stSql := stSql + ' From TB_ACCESSDEVICE a ';
  stSql := stSql + ' Left Join TB_TIMECODE b ';
  stSql := stSql + ' ON(a.GROUP_CODE = b.GROUP_CODE) ';
  stSql := stSql + ' Where a.AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND a.AC_ECUID = ''' + aEcuID + ''' ';
  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateTB_ACCESSDEVICE(aNodeNo,aMcuID, aEcuID, aMcuIp,
  aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aMcuAC, aMcuFd, aMcuPt,
  aMcuAt,aJavara,aSendAck,aUpdate,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType,aArmAreaUse:string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aMcuIp + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''', ';
  stSql := stSql + 'AC_MCUPORT = ''' + aMcuPort + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AC_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'AC_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'AC_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'AC_CURX = ' + aCurX + ',';
  stSql := stSql + 'AC_CURY = ' + aCurY + ',';
  stSql := stSql + 'AC_ACTYPE = ''' + aMcuAC + ''',';
  stSql := stSql + 'AC_ATTYPE = ''' + aMcuAt + ''',';
  stSql := stSql + 'AC_FDTYPE = ''' + aMcuFd + ''',';
  stSql := stSql + 'AC_PTTYPE = ''' + aMcuPt + ''', ';
  stSql := stSql + 'AC_JAVARATYPE = ''' + aJavara + ''', ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''', ';
  stSql := stSql + 'AC_UPDATE = ''' + aUpdate + ''', ';
  stSql := stSql + 'AC_LINKUSID = ''' + aSystemId + ''', ';
  stSql := stSql + 'AC_MUXID = ''' + aMuxId + ''', ';
  stSql := stSql + 'AC_DECODERID = ''' + aDecoderID + ''', ';
  stSql := stSql + 'AC_TIMETYPE = ''' + aTimeCodeType + ''', ';
  stSql := stSql + 'AC_CARDBYTE = ''' + aCardType + ''' ';
  if aSockType <> '' then stSql := stSql + ',AC_SOCKTYPE = ' + aSockType + ' ';
  if aArmAreaUse <> '' then stSql := stSql + ',AC_ARMAREAUSE = ''' + aArmAreaUse + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DeleteTB_ACCESSDEVICE(aNodeNo,
  aEcuID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_ACCESSDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' +  aEcuID + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

  stSql := 'Delete From TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.btn_DeleteClick(Sender: TObject);
var
  bResult : boolean;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stMCUCode,stECUID : string;
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  if PageControl1.ActivePage.Name = 'MCUTab' then
  begin
    DeleteMCUClick;
  end else if PageControl1.ActivePage.Name = 'ECUTab' then
  begin
    DeleteECUClick;
  end else if PageControl1.ActivePage.Name = 'DoorTab' then
  begin
    DeleteDoorClick;
  end else if PageControl1.ActivePage.Name = 'AlarmTab' then
  begin
    DeleteAlaramClick;
  end else if PageControl1.ActivePage.Name = 'ZoneTab' then
  begin
    DeleteZoneClick;
  end else if PageControl1.ActivePage.Name = 'FoodTab' then
  begin
    DeleteFoodClick;
  end;
end;

function TfmMDIDeviceCode.GarbageECUCheck(aNodeNo: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin

  Result := False;
  stSql := 'Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID <> ''00''' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;
    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.ECUSearch(aBuildingCode, aFloorCode, aAreaCode,
  aNodeNO,aSearchECUID: String;aTop:integer=0);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_ECUCode); //스트링그리드 초기화

  stSql := 'select a.*,b.AC_DEVICENAME as MCUNAME from TB_ACCESSDEVICE a';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'') ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND a.AC_ECUID <> ''00'' ';
  if (aBuildingCode <> '') and (aBuildingCode <> '000') then  stSql := stSql + ' AND a.LO_DONGCODE = ''' + aBuildingCode + ''' ';
  if (aFloorCode <> '') and (aFloorCode <> '000') then   stSql := stSql + ' AND a.LO_FLOORCODE = ''' + aFloorCode + ''' ';
  if (aAreaCode <> '') and (aAreaCode <> '000') then    stSql := stSql + ' AND a.LO_AREACODE = ''' + aAreaCode + ''' ';
  if (aNodeNo <> '') and (aNodeNo <> '000') then    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID ';

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
      sg_ECUCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_ECUCode do
        begin
          cells[0,nRow] := FindField('MCUNAME').AsString;
          cells[1,nRow] := FindField('AC_ECUID').AsString;
          cells[2,nRow] := FindField('AC_DEVICENAME').AsString;
          cells[3,nRow] := FindField('AC_NODENO').AsString;
          cells[4,nRow] := FindField('AC_ACTYPE').AsString;
          cells[5,nRow] := FindField('AC_ATTYPE').AsString;
          cells[6,nRow] := FindField('AC_FDTYPE').AsString;
          cells[7,nRow] := FindField('AC_PTTYPE').AsString;
          cells[8,nRow] := FindField('LO_DONGCODE').AsString;
          cells[9,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[10,nRow] := FindField('LO_AREACODE').AsString;
          cells[11,nRow] := FindField('AC_VIEWSEQ').AsString;
          cells[12,nRow] := FindField('AC_MCUIP').AsString;
          cells[13,nRow] := FindField('AC_MCUPORT').AsString;
          cells[14,nRow] := FindField('AC_LOCATEUSE').AsString;
          cells[15,nRow] := FindField('AC_TOTWIDTH').AsString;
          cells[16,nRow] := FindField('AC_TOTHEIGHT').AsString;
          cells[17,nRow] := FindField('AC_CURX').AsString;
          cells[18,nRow] := FindField('AC_CURY').AsString;
          cells[19,nRow] := FindField('AC_CARDREADERTYPE').AsString;
          cells[20,nRow] := FindField('AC_JAVARATYPE').AsString;
          cells[21,nRow] := FindField('AC_TIMETYPE').AsString;
          cells[22,nRow] := FindField('AC_ARMAREAUSE').AsString;

          if (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
              FindField('AC_ECUID').AsString )
             = aSearchECUID then
          begin
            SelectRows(nRow,1);
          end;


          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
    if aTop <> 0 then
      sg_ECUCode.topRow := aTop
    else
    begin
      if sg_ECUCode.row > 9 then sg_ECUCode.TopRow := sg_ECUCode.row - 8;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_ECUCodeClick(sg_ECUCode);
end;

procedure TfmMDIDeviceCode.cmb_MCUCode2Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
begin
  stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
  if (stBuildingCode <> '000') AND ( stBuildingCode <> '' ) then
  begin
    stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
    if (stFloorCode <> '000') AND ( stFloorCode <> '' ) then
      stAreaCode := AreaCodeList.Strings[ cmb_AreaCode2.itemindex ];
  end;
  stNodeNo := MCUCodeList.Strings[ cmb_MCUCode2.itemindex ];
  stNodeNo := copy(stNodeNo,1,3);
  ECUSearch(stBuildingCode, stFloorCode,stAreaCode,stNodeNo,'');
end;

procedure TfmMDIDeviceCode.sg_ECUCodeClick(Sender: TObject);
var
  stBuildingCode,stFloorCode,stAreaCode,stNodeNo : string;
begin
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_NodeNo2.Text := cells[3,Row];
    LoadsMCUCode('000','000','000',cmb_sMCUCode2);
    stNodeNo := FillZeroNumber(strtoint(cells[3,Row]),3);
    cmb_sMCUCode2.ItemIndex := sMCUCodeList.IndexOf(stNodeNo);
    PrevECUNO := strtoint(cells[1,Row]);
    ed_ECUNO.Value  := strtoint(cells[1,Row]);
    ed_ECUNAME.Text  := cells[2,Row];

    LoadsBuildingCode(cmb_sBuildingCode2);
    if (cells[8,Row] = '') or (cells[8,Row] = '000') then cmb_sBuildingCode2.ItemIndex := 0
    else cmb_sBuildingCode2.ItemIndex := sBuildingCodeList.IndexOf(cells[8,Row]);
    if cmb_sBuildingCode2.itemindex > -1 then
      stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode2.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode2);
    if (cells[9,Row] = '') or (cells[9,Row] = '000') then cmb_sFloorCode2.ItemIndex := 0
    else cmb_sFloorCode2.ItemIndex := sFloorCodeList.IndexOf(cells[9,Row]);
    if cmb_sFloorCode2.itemindex > -1 then
      stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode2.itemindex ];
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode2);;
    if (cells[10,Row] = '') or (cells[10,Row] = '000') then cmb_sAreaCode2.ItemIndex := 0
    else cmb_sAreaCode2.ItemIndex := sAreaCodeList.IndexOf(cells[10,Row]);

    if cells[14,Row] = 'Y' then chk_ECUReg.Checked := True
    else chk_ECUReg.Checked := False;
    ed_TotWidth2.Text := cells[15,Row];
    ed_TotHeight2.Text := cells[16,Row];
    ed_CurX2.Text := cells[17,Row];
    ed_CurY2.Text := cells[18,Row];
    if cells[4,Row] <> '0' then chk_ECUAc.Checked := True
    else chk_ECUAc.Checked := False;
    if cells[5,Row] <> '0' then chk_ECUAt.Checked := True
    else chk_ECUAt.Checked := False;
    //if cells[7,Row] <> '0' then chk_ECUPt.Checked := True
    //else chk_ECUPt.Checked := False;
    chk_ECUPt.Checked := True;
    if cells[6,Row] <> '0' then chk_ECUFd.Checked := True
    else chk_ECUFd.Checked := False;
    if cells[20,Row] <> '0' then chk_ECUJavara.Checked := True
    else chk_ECUJavara.Checked := False;
    if cells[21,Row] <> '1' then chk_ECUTimeCode.Checked := False
    else chk_ECUTimeCode.Checked := True;
    if cells[22,Row] = 'Y' then
    begin
      cmb_EcuArmAreaUse.ItemIndex := 1;
      L_bArmAreaUse := True;
    end else
    begin
      cmb_EcuArmAreaUse.ItemIndex := 0;
      L_bArmAreaUse := False;
    end;

  end;

end;

procedure TfmMDIDeviceCode.cmb_sMCUCode2Change(Sender: TObject);
var
  stSql : string;
  stNodeNo : string;
  TempAdoQuery : TADOQuery;
  stEcuID : string;
begin
  if cmb_sMCUCode2.ItemIndex > 0 then
  begin
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode2.ItemIndex];
    stSql := 'select MAX(AC_ECUID) as AC_ECUID from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(stNodeNo)) + ' ';

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
          showmessage('테이블에 이상이 있습니다.');
          Exit;
        End;
        stEcuID := FieldByName('AC_ECUID').AsString;
        if Not IsDigit(stEcuID) then ed_Ecuno.Value := 1
        else ed_Ecuno.Value := strtoint(stEcuID) + 1;
        {
        if RecordCount > 0 then ed_Ecuno.Value := FieldByName('AC_ECUID').asinteger + 1
        else ed_Ecuno.Value := 1;  }
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  end;
end;

function TfmMDIDeviceCode.DupCheckECU(aNodeNo, aEcuId: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuId + ''' ';

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

procedure TfmMDIDeviceCode.cmb_MCUCode3Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode3.itemIndex];
  LoadECUCode(stMCUCode,'MCU',cmb_ECUCode3);
  DoorSearch(copy(stMCUCode,1,3), '','');
end;

procedure TfmMDIDeviceCode.DoorSearch(aNodeNO, aECUCode,aSearchDoorID: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_DoorCode); //스트링그리드 초기화

  stSql := 'select a.DO_DOORNO,a.DO_DOORNONAME,a.AC_NODENO,b.AC_MCUIP,c.AC_DEVICENAME as MCUNAME,';
  stSql := stSql + 'a.AC_ECUID,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,';
  stSql := stSql + 'a.DO_VIEWSEQ,a.DO_LOCATEUSE,a.DO_TOTWIDTH,';
  stSql := stSql + 'a.DO_TOTHEIGHT,a.DO_CURX,a.DO_CURY from TB_DOOR a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND a.AC_ECUID = b.AC_ECUID ) ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND c.AC_ECUID = ''00'') ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aNodeNO <> '') and (aNodeNO <> '000') then  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNO)) + ' ';
  if (aECUCode <> '') then   stSql := stSql + ' AND a.AC_ECUID = ''' + aECUCode + ''' ';
  stSql := stSql + ' order by a.AC_NODENO,a.AC_ECUID,a.DO_DOORNO ';

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
      sg_DoorCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_DoorCode do
        begin
          cells[0,nRow] := FindField('MCUNAME').AsString;
          cells[1,nRow] := FindField('AC_ECUID').AsString;
          cells[2,nRow] := FindField('DO_DOORNO').AsString;
          cells[3,nRow] := FindField('DO_DOORNONAME').AsString;
          cells[4,nRow] := FindField('AC_NODENO').AsString;
          cells[5,nRow] := FindField('LO_DONGCODE').AsString;
          cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[7,nRow] := FindField('LO_AREACODE').AsString;
          cells[8,nRow] := FindField('DO_VIEWSEQ').AsString;
          cells[9,nRow] := FindField('DO_LOCATEUSE').AsString;
          cells[10,nRow] := FindField('DO_TOTWIDTH').AsString;
          cells[11,nRow] := FindField('DO_TOTHEIGHT').AsString;
          cells[12,nRow] := FindField('DO_CURX').AsString;
          cells[13,nRow] := FindField('DO_CURY').AsString;

          if (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
              FindField('AC_ECUID').AsString +
              FindField('DO_DOORNO').AsString )
              = aSearchDoorID then
          begin
            SelectRows(nRow,1);
          end;
          nRow := nRow + 1;
        end;
        Next;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_DoorCodeClick(sg_DoorCode);

end;

procedure TfmMDIDeviceCode.cmb_ECUCode3Change(Sender: TObject);
var
  stMCUCode : string;
  stECUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode3.itemIndex];
  stECUCode := ECUCodeList.Strings[cmb_ECUCode3.itemIndex];
  if stECUCode <> '' then
    DoorSearch(copy(stMCUCode,1,3), copy(stECUCode,4,2),'')
  else DoorSearch(copy(stMCUCode,1,3),'','');

end;

procedure TfmMDIDeviceCode.sg_DoorCodeClick(Sender: TObject);
var
  stNodeNo : string;
  stECUID : string;
  stBuildingCode,stFloorCode : string;
begin
  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_NodeNo3.Text := cells[4,Row];
    LoadsMCUCode('000','000','000',cmb_sMCUCode3);
    stNodeNo := FillZeroNumber(strtoint(cells[4,Row]),3);
    cmb_sMCUCode3.ItemIndex := sMCUCodeList.IndexOf(stNodeNo);
    LoadsECUCode(stNodeNo,'DOOR',cmb_sECUCode3);
    stECUID := cells[1,Row];
    cmb_sECUCode3.ItemIndex := sECUCodeList.IndexOf(FillZeroNumber(strtoint(stNodeNo),3) + stECUID);

    ed_sDoorNo.Value  := strtoint(cells[2,Row]);
    ed_sDoorName.Text  := cells[3,Row];
    LoadsBuildingCode(cmb_sBuildingCode3);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sBuildingCode3.ItemIndex := 0
    else cmb_sBuildingCode3.ItemIndex := sBuildingCodeList.IndexOf(cells[5,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode3.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode3);
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sFloorCode3.ItemIndex := 0
    else cmb_sFloorCode3.ItemIndex := sFloorCodeList.IndexOf(cells[6,Row]);
    stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode3.itemindex ];
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode3);;
    if (cells[7,Row] = '') or (cells[7,Row] = '000') then cmb_sAreaCode3.ItemIndex := 0
    else cmb_sAreaCode3.ItemIndex := sAreaCodeList.IndexOf(cells[7,Row]);

    ed_DoorViewSeq.text := cells[8,Row];
    if cells[9,Row] = 'Y' then chk_DoorReg.Checked := True
    else chk_DoorReg.Checked := False;
    ed_TotWidth3.Text := cells[10,Row];
    ed_TotHeight3.Text := cells[11,Row];
    ed_CurX3.Text := cells[12,Row];
    ed_CurY3.Text := cells[13,Row];

  end;

end;

procedure TfmMDIDeviceCode.cmb_sMCUCode3Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := sMCUCodeList.Strings[cmb_sMCUCode3.itemIndex];
  LoadsECUCode(stMCUCode,'DOOR',cmb_sECUCode3);

end;

function TfmMDIDeviceCode.DupCheckDoor(aNodeNo,aECUID, aDoorNo: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_Door ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' + aDoorNo + ''' ';

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

function TfmMDIDeviceCode.InsertTB_DOOR(aNodeNo, aEcuID, aDoorNo,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY, aDoorSeq: string): Boolean;
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

function TfmMDIDeviceCode.UpdateTB_DOOR(aNodeNo, aEcuID, aDoorNo,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY, aDoorSeq: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_DOOR  Set ';
  stSql := stSql + 'DO_DOORNONAME = ''' + aName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'DO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'DO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'DO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'DO_CURX = ' + aCurX + ',';
  stSql := stSql + 'DO_CURY = ' + aCurY + ',';
  stSql := stSql + 'DO_VIEWSEQ = ' + aDoorSeq ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO =' + aDoorNo ;

  result :=  DataModule1.ProcessExecSQL(stSql);


end;

procedure TfmMDIDeviceCode.cmb_MCUCode4Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode4.itemIndex];
  AlarmSearch(copy(stMCUCode,1,3),'');

end;

procedure TfmMDIDeviceCode.AlarmSearch(aNodeNo,aSearchAlarmNo: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_AlarmCode); //스트링그리드 초기화

  stSql := 'select a.*,b.AC_DEVICENAME as MCUNAME from TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'') ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aNodeNo <> '') and (aNodeNo <> '000') then    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' order by a.AL_VIEWSEQ,a.AC_NODENO,a.AC_ECUID ';

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
      sg_AlarmCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_AlarmCode do
        begin
          cells[0,nRow] := FindField('MCUNAME').AsString;
          cells[1,nRow] := FindField('AC_ECUID').AsString;
          //cells[2,nRow] := FindField('AL_DEVICENO').AsString;
          cells[3,nRow] := FindField('AL_ZONENAME').AsString;
          cells[4,nRow] := FindField('AC_NODENO').AsString;
          cells[5,nRow] := FindField('LO_DONGCODE').AsString;
          cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[7,nRow] := FindField('LO_AREACODE').AsString;
          cells[8,nRow] := FindField('AL_VIEWSEQ').AsString;
          cells[9,nRow] := FindField('AL_LOCATEUSE').AsString;
          cells[10,nRow] := FindField('AL_TOTWIDTH').AsString;
          cells[11,nRow] := FindField('AL_TOTHEIGHT').AsString;
          cells[12,nRow] := FindField('AL_CURX').AsString;
          cells[13,nRow] := FindField('AL_CURY').AsString;
          if FillZeroNumber(FindField('AC_NODENO').AsInteger,3) + FindField('AC_ECUID').AsString  = aSearchAlarmNo then
          begin
            SelectRows(nRow,1);
          end;

          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_AlarmCodeClick(sg_AlarmCode);
end;

procedure TfmMDIDeviceCode.sg_AlarmCodeClick(Sender: TObject);
var
  stNodeNo : string;
  stECUID : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_NodeNo4.Text := cells[4,Row];
    LoadsMCUCode('000','000','000',cmb_sMCUCode4);
    stNodeNo := FillZeroNumber(strtoint(cells[4,Row]),3) ;
    cmb_sMCUCode4.ItemIndex := sMCUCodeList.IndexOf(stNodeNo);
    LoadsECUCode(stNodeNo,'ALARM',cmb_sECUCode4);
    stECUID := cells[1,Row];
    cmb_sECUCode4.ItemIndex := sECUCodeList.IndexOf(FillZeroNumber(strtoint(stNodeNo),3) + stECUID);

    ed_AlarmNo4.Value  := strtoint(cells[2,Row]);
    ed_AlarmName4.Text  := cells[3,Row];
    LoadsBuildingCode(cmb_sBuildingCode4);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sBuildingCode4.ItemIndex := 0
    else cmb_sBuildingCode4.ItemIndex := sBuildingCodeList.IndexOf(cells[5,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode4.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode4);
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sFloorCode4.ItemIndex := 0
    else cmb_sFloorCode4.ItemIndex := sFloorCodeList.IndexOf(cells[6,Row]);
    if cmb_sFloorCode4.itemindex < 1 then stFloorCode := ''
    else stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode4.itemindex ];
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode4);;
    if (cells[7,Row] = '') or (cells[7,Row] = '000') then cmb_sAreaCode4.ItemIndex := 0
    else cmb_sAreaCode4.ItemIndex := sAreaCodeList.IndexOf(cells[7,Row]);

    ed_AlarmViewSeq.text := cells[8,Row];
    if cells[9,Row] = 'Y' then chk_AlarmReg.Checked := True
    else chk_AlarmReg.Checked := False;
    ed_TotWidth4.Text := cells[10,Row];
    ed_TotHeight4.Text := cells[11,Row];
    ed_CurX4.Text := cells[12,Row];
    ed_CurY4.Text := cells[13,Row];

  end;

end;

function TfmMDIDeviceCode.DeleteTB_DOOR(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_DOOR ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' +  aEcuID + ''' ';
  stSql := stSql + ' AND DO_DOORNO = ''' +  aDoorNo + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DupCheckAlarm(aNodeNo,aECUID: string): Boolean;
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

function TfmMDIDeviceCode.InsertTB_ALARMDEVICE(aNodeNo, aEcuID,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aAlarmSeq: string): Boolean;
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

function TfmMDIDeviceCode.UpdateTB_ALARMDEVICE(aNodeNo, aEcuID,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY, aDoorSeq: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ALARMDEVICE  Set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aName + ''',';
  stSql := stSql + 'AL_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AL_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'AL_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'AL_CURX = ' + aCurX + ',';
  stSql := stSql + 'AL_CURY = ' + aCurY + ',';
  stSql := stSql + 'AL_VIEWSEQ = ' + aDoorSeq ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  //stSql := stSql + ' AND AL_DEVICENO =' + aAlarmNo ;

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DeleteTB_ALARMDEVICE(aACNODNON,aACECUID: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_ALARMDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  //stSql := stSql + ' AND AL_DEVICENO = ' + aAlarmNo ;
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aACNODNON));
  stSql := stSql + ' AND AC_ECUID = ''' + aACECUID + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.cmb_sMCUCode4Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := sMCUCodeList.Strings[cmb_sMCUCode4.itemIndex];
  LoadsECUCode(stMCUCode,'ALARM',cmb_sECUCode4);

end;

procedure TfmMDIDeviceCode.chk_EcuFdClick(Sender: TObject);
begin
  if chk_EcuFd.Checked then
  begin
    chk_EcuAC.Checked := False;
    chk_EcuAT.Checked := False;
    chk_EcuPT.Checked := False;
  end else
  begin
    chk_EcuAC.Checked := True;
    chk_EcuPT.Checked := True;
  end;
  chk_EcuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_EcuACClick(Sender: TObject);
begin
  if chk_EcuAC.Checked then chk_EcuFd.Checked := False;
  chk_EcuUpdate.Checked := True;

end;

procedure TfmMDIDeviceCode.chk_EcuPtClick(Sender: TObject);
begin
  if chk_EcuPt.Checked then chk_EcuFd.Checked := False;
  chk_EcuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_EcuATClick(Sender: TObject);
begin
  if chk_EcuAT.Checked then chk_EcuFd.Checked := False;
  chk_EcuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_McuACClick(Sender: TObject);
begin
  if chk_McuAC.Checked then chk_McuFd.Checked := False;
  chk_McuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_MCUPtClick(Sender: TObject);
begin
  if chk_MCUPt.Checked then chk_McuFd.Checked := False;
  chk_McuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_McuATClick(Sender: TObject);
begin
  if chk_McuAT.Checked then chk_McuFd.Checked := False;
  chk_McuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.chk_MCUFdClick(Sender: TObject);
begin
  if chk_MCUFd.Checked then
  begin
    chk_McuAC.Checked := False;
    chk_McuAT.Checked := False;
    chk_McuPT.Checked := False;
  end else
  begin
    chk_McuAC.Checked := True;
    chk_McuPT.Checked := True;
  end;
  chk_McuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.cmb_MCUCode5Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode5.itemIndex];
  LoadECUCode(stMCUCode,'FOOD',cmb_ECUCode5);
  FoodSearch(copy(stMCUCode,1,3), '','');

end;

procedure TfmMDIDeviceCode.cmb_ECUCode5Change(Sender: TObject);
var
  stMCUCode : string;
  stECUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode5.itemIndex];
  stECUCode := ECUCodeList.Strings[cmb_ECUCode5.itemIndex];
  if stECUCode <> '' then
    FoodSearch(copy(stMCUCode,1,3), copy(stECUCode,4,2),'')
  else FoodSearch(copy(stMCUCode,1,3),'','');

end;

procedure TfmMDIDeviceCode.FoodSearch(aNodeNo, aECUCode,aSearchFoodID: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_FoodCode); //스트링그리드 초기화

  stSql := 'select a.FO_DOORNO,a.FO_NAME,a.AC_NODENO,b.AC_DEVICENAME as MCUNAME,';
  stSql := stSql + 'a.AC_ECUID,a.LO_DONGCODE,a.LO_FLOORCODE,a.LO_AREACODE,';
  stSql := stSql + 'a.FO_LOCATEUSE,a.FO_TOTWIDTH,';
  stSql := stSql + 'a.FO_TOTHEIGHT,a.FO_CURX,a.FO_CURY from TB_FOOD a ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = b.AC_NODENO ';
  stSql := stSql + ' AND b.AC_ECUID = ''00'' ) ';
  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aNodeNO <> '') and (aNodeNO <> '000') then  stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNO)) + ' ';
  if (aECUCode <> '') then   stSql := stSql + ' AND a.AC_ECUID = ''' + aECUCode + ''' ';

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
      sg_FoodCode.RowCount := RecordCount + 1;
      nRow := 1;
      while Not Eof do
      begin
        with sg_FoodCode do
        begin
          cells[0,nRow] := FindField('FO_DOORNO').AsString;
          cells[1,nRow] := FindField('FO_NAME').AsString;
          cells[2,nRow] := FindField('AC_NODENO').AsString;
          cells[3,nRow] := FindField('MCUNAME').AsString;
          cells[4,nRow] := FindField('AC_ECUID').AsString;
          cells[5,nRow] := FindField('LO_DONGCODE').AsString;
          cells[6,nRow] := FindField('LO_FLOORCODE').AsString;
          cells[7,nRow] := FindField('LO_AREACODE').AsString;
          cells[8,nRow] := FindField('FO_LOCATEUSE').AsString;
          cells[9,nRow] := FindField('FO_TOTWIDTH').AsString;
          cells[10,nRow] := FindField('FO_TOTHEIGHT').AsString;
          cells[11,nRow] := FindField('FO_CURX').AsString;
          cells[12,nRow] := FindField('FO_CURY').AsString;

          if (FillZeroNumber(FindField('AC_NODENO').AsInteger,3) +
              FindField('AC_ECUID').AsString +
              FindField('FO_DOORNO').AsString )
              = aSearchFoodID then
          begin
            SelectRows(nRow,1);
          end;
          nRow := nRow + 1;
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  sg_FoodCodeClick(sg_FoodCode);
end;

function TfmMDIDeviceCode.InsertTB_FOOD(aNodeNo, aEcuID, aDoorNo,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY,aFoodAmtPer: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Insert Into TB_FOOD (';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AC_NODENO,';
  stSql := stSql + 'AC_ECUID,';
  stSql := stSql + 'FO_DOORNO,';
  stSql := stSql + 'FO_NAME,';
  stSql := stSql + 'LO_DONGCODE,';
  stSql := stSql + 'LO_FLOORCODE,';
  stSql := stSql + 'LO_AREACODE,';
  stSql := stSql + 'FO_LOCATEUSE,';
  stSql := stSql + 'FO_TOTWIDTH,';
  stSql := stSql + 'FO_TOTHEIGHT,';
  stSql := stSql + 'FO_CURX,';
  stSql := stSql + 'FO_CURY,FO_AMTPER )';
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
  stSql := stSql + aFoodAmtPer + ') ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateTB_FOOD(aNodeNo, aEcuID, aDoorNo,
  aName, aBuildingCode, aFloorCode, aAreaCode, aRegState, aTotWidth,
  aTotHeight, aCurX, aCurY,aFoodAmtPer: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_FOOD  Set ';
  stSql := stSql + 'FO_NAME = ''' + aName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'FO_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'FO_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'FO_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'FO_CURX = ' + aCurX + ',';
  stSql := stSql + 'FO_CURY = ' + aCurY + ',';
  stSql := stSql + 'FO_AMTPER = ' + aFoodAmtPer ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO =' + aDoorNo ;

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DupCheckFood(aNodeNo,aECUID, aDoorNo: string): Boolean;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_FOOD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' + aDoorNo + ''' ';

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

function TfmMDIDeviceCode.DeleteTB_FOOD(aNodeNo, aEcuID,
  aDoorNo: string): Boolean;
var
  stSql : string;
begin
  result := False;
  stSql := 'Delete From TB_FOOD ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' +  aEcuID + ''' ';
  stSql := stSql + ' AND FO_DOORNO = ''' +  aDoorNo + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode5Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode5.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode5);
  cmb_sAreaCode5.Clear;
  sAreaCodeList.Clear;

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode5Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode5.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode5.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode5);

end;

procedure TfmMDIDeviceCode.cmb_sMCUCode5Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := sMCUCodeList.Strings[cmb_sMCUCode5.itemIndex];
  LoadsECUCode(stMCUCode,'FOOD',cmb_sECUCode5);

end;

procedure TfmMDIDeviceCode.sg_FoodCodeClick(Sender: TObject);
var
  stNodeNo : string;
  stECUID : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    ed_NodeNo5.Text := cells[2,Row];
    LoadsMCUCode('000','000','000',cmb_sMCUCode5);
    stNodeNo := FillZeroNumber(strtoint(cells[2,Row]),3) ;
    cmb_sMCUCode5.ItemIndex := sMCUCodeList.IndexOf(stNodeNo);
    LoadsECUCode(stNodeNo,'FOOD',cmb_sECUCode5);
    stECUID := cells[4,Row];
    cmb_sECUCode5.ItemIndex := sECUCodeList.IndexOf(FillZeroNumber(strtoint(stNodeNo),3) + stECUID);

    ed_sFoodNo.Value  := strtoint(cells[0,Row]);
    ed_sFoodName.Text  := cells[1,Row];
    LoadsBuildingCode(cmb_sBuildingCode5);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sBuildingCode5.ItemIndex := 0
    else cmb_sBuildingCode5.ItemIndex := sBuildingCodeList.IndexOf(cells[5,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode5.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode5);
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sFloorCode5.ItemIndex := 0
    else cmb_sFloorCode5.ItemIndex := sFloorCodeList.IndexOf(cells[6,Row]);
    stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode5.itemindex ];
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode5);;
    if (cells[7,Row] = '') or (cells[7,Row] = '000') then cmb_sAreaCode5.ItemIndex := 0
    else cmb_sAreaCode5.ItemIndex := sAreaCodeList.IndexOf(cells[7,Row]);

    if cells[8,Row] = 'Y' then chk_FoodReg.Checked := True
    else chk_FoodReg.Checked := False;
    ed_TotWidth3.Text := cells[9,Row];
    ed_TotHeight3.Text := cells[10,Row];
    ed_CurX3.Text := cells[11,Row];
    ed_CurY3.Text := cells[12,Row];

  end;

end;

function TfmMDIDeviceCode.GarbageAlarmCheck(aNodeNo, aECUID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMDIDeviceCode.GarbageDoorCheck(aNodeNo, aECUID: string): Boolean;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_DOOR ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMDIDeviceCode.GarbageFoodCheck(aNodeNo, aECUID: string): Boolean;
var
  stSql : string;
  TempAdoQuery :TADOQuery;
begin
  Result := False;
  stSql := 'Select * from TB_FOOD ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + '''' ;

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      close;
      Sql.Clear;
      Sql.Text := stSql;

      Try
        Open;
      Except
        Exit;
      End;
      if RecordCount > 0 then result := True;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

procedure TfmMDIDeviceCode.btnFoodPositionClick(Sender: TObject);
begin
  if cmb_sBuildingCode5.itemIndex < 0 then cmb_sBuildingCode5.itemIndex := 0;
  if cmb_sFloorCode5.itemIndex < 0 then cmb_sFloorCode5.itemIndex := 0;
  if cmb_sAreaCode5.itemIndex < 0 then cmb_sAreaCode5.itemIndex := 0;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '5';
  fmPositionSet.DeviceName := ed_sFoodName.Text;
  fmPositionSet.X_Position := ed_CurX5.Text;
  fmPositionSet.Y_Position := ed_CurY5.Text;
  fmPositionSet.X_Size := ed_TotWidth5.Text;
  fmPositionSet.Y_Size := ed_TotHeight5.Text;
  fmPositionSet.BuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode5.itemIndex];
  fmPositionSet.FloorCode := sFloorCodeList.Strings[cmb_sFloorCode5.itemIndex];
  fmPositionSet.SectorCode := sAreaCodeList.Strings[cmb_sAreaCode5.itemIndex];
  fmPositionSet.SHowmodal;
  ed_CurX5.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY5.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth5.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight5.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;

end;

procedure TfmMDIDeviceCode.btnMCUPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode1.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
  end;
  if cmb_sFloorCode1.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode1.itemIndex];
  end;
  if cmb_sAreaCode1.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode1.itemIndex];
  end;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '1';
  fmPositionSet.DeviceName := ed_MCUName.Text;
  fmPositionSet.X_Position := ed_CurX1.Text;
  fmPositionSet.Y_Position := ed_CurY1.Text;
  fmPositionSet.X_Size := ed_TotWidth1.Text;
  fmPositionSet.Y_Size := ed_TotHeight1.Text;

  fmPositionSet.BuildingCode := stBuildingCode;
  fmPositionSet.FloorCode := stFloorCode;
  fmPositionSet.SectorCode := stAreaCode;
  
  fmPositionSet.SHowmodal;
  ed_CurX1.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY1.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth1.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight1.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;

end;

procedure TfmMDIDeviceCode.btnECUPositionClick(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
begin
  if cmb_sBuildingCode2.itemIndex < 0 then
  begin
    stBuildingCode := '';
  end else
  begin
    stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode2.itemIndex];
  end;
  if cmb_sFloorCode2.itemIndex < 0 then
  begin
    stFloorCode := '';
  end else
  begin
    stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode2.itemIndex];
  end;
  if cmb_sAreaCode2.itemIndex < 0 then
  begin
    stAreaCode := '';
  end else
  begin
    stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode2.itemIndex];
  end;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '2';
  fmPositionSet.DeviceName := ed_ECUName.Text;
  fmPositionSet.X_Position := ed_CurX2.Text;
  fmPositionSet.Y_Position := ed_CurY2.Text;
  fmPositionSet.X_Size := ed_TotWidth2.Text;
  fmPositionSet.Y_Size := ed_TotHeight2.Text;

  fmPositionSet.BuildingCode := stBuildingCode;
  fmPositionSet.FloorCode := stFloorCode;
  fmPositionSet.SectorCode := stAreaCode;

  fmPositionSet.SHowmodal;

  ed_CurX2.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY2.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth2.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight2.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;

end;

procedure TfmMDIDeviceCode.btnDoorPositionClick(Sender: TObject);
begin
  if cmb_sBuildingCode3.itemIndex < 0 then cmb_sBuildingCode3.itemIndex := 0;
  if cmb_sFloorCode3.itemIndex < 0 then cmb_sFloorCode3.itemIndex := 0;
  if cmb_sAreaCode3.itemIndex < 0 then cmb_sAreaCode3.itemIndex := 0;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '3';
  fmPositionSet.DeviceName := ed_sDoorName.Text;
  fmPositionSet.X_Position := ed_CurX3.Text;
  fmPositionSet.Y_Position := ed_CurY3.Text;
  fmPositionSet.X_Size := ed_TotWidth3.Text;
  fmPositionSet.Y_Size := ed_TotHeight3.Text;
  fmPositionSet.BuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode3.itemIndex];
  fmPositionSet.FloorCode := sFloorCodeList.Strings[cmb_sFloorCode3.itemIndex];
  fmPositionSet.SectorCode := sAreaCodeList.Strings[cmb_sAreaCode3.itemIndex];
  fmPositionSet.SHowmodal;
  ed_CurX3.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY3.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth3.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight3.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;

end;

procedure TfmMDIDeviceCode.btnAlarmPositionClick(Sender: TObject);
begin
  if cmb_sBuildingCode4.itemIndex < 0 then cmb_sBuildingCode4.itemIndex := 0;
  if cmb_sFloorCode4.itemIndex < 0 then cmb_sFloorCode4.itemIndex := 0;
  if cmb_sAreaCode4.itemIndex < 0 then cmb_sAreaCode4.itemIndex := 0;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '4';
  fmPositionSet.DeviceName := ed_AlarmName4.Text;
  fmPositionSet.X_Position := ed_CurX4.Text;
  fmPositionSet.Y_Position := ed_CurY4.Text;
  fmPositionSet.X_Size := ed_TotWidth4.Text;
  fmPositionSet.Y_Size := ed_TotHeight4.Text;
  fmPositionSet.BuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode4.itemIndex];
  fmPositionSet.FloorCode := sFloorCodeList.Strings[cmb_sFloorCode4.itemIndex];
  fmPositionSet.SectorCode := sAreaCodeList.Strings[cmb_sAreaCode4.itemIndex];
  fmPositionSet.SHowmodal;
  ed_CurX4.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY4.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth4.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight4.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;

end;

function TfmMDIDeviceCode.DeleteNODEECUALL(aNodeNo: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  stSql := 'Select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  //stSql := stSql + ' AND AC_ECUID <> ''00''' ;

  with ADOECU do
  begin
    close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    if RecordCount < 1 then
    begin
      Result := True;
      Exit;
    end;
    While Not Eof do
    begin
      Result := DeleteECUDoorAll(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Result := DeleteECUAlarmAll(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Result := DeleteECUZoneAll(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Result := DeleteECUFoodAll(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Result := DeleteReader(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      if Not result then Exit;
      Result := DeleteECU(FillZeroNumber(FindField('AC_NODENO').AsInteger,3),FindField('AC_ECUID').AsString);
      Next;
    end;
  end;
  //result := True;
end;

function TfmMDIDeviceCode.DeleteECUAlarmAll(aNodeNo,aECUID: string): Boolean;
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

  stSql := 'Delete from TB_ARMAREA ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DeleteECUDoorAll(aNodeNo,aECUID: string): Boolean;
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

function TfmMDIDeviceCode.DeleteECUFoodAll(aNodeNo,aECUID: string): Boolean;
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

function TfmMDIDeviceCode.DeleteECU(aNodeNo,aECUID: string): Boolean;
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

  stSql := 'Delete From TB_TIMECODEDEVICE ';
  stSql := stSql + ' Where AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateDeviceCardNoSend(aNodeNo,aEcuID: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ECU의 MCU ID변경
  stSql := 'Update TB_DEVICECARDNO Set  ';
  stSql := stSql + ' DE_RCVACK = ''N'' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.MCUSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stAC,stFd,stPt,stAT,stJavara : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stNodeNo : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
  stFoodAmt :string;
  nEcuCount : integer;
  i : integer;
  bDeviceDoorUse : Boolean;
  stEcuName : string;
  stSql : string;
  stTimeType : string;
  stArmAreaUse : string;
begin
    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    stTimeType := '0';
    if cmb_sBuildingCode1.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode1.itemIndex];
    if cmb_sFloorCode1.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode1.itemIndex];
    if cmb_sAreaCode1.itemIndex > 0 then stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode1.itemIndex];
    if chk_McuReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;
    if Not chk_MCUFd.Checked then  stAC := '1'
    else stAC := '0' ;
    if chk_MCUFd.Checked then  stFd := '1'
    else stFd := '0' ;
    if chk_MCUPt.Checked then  stPt := '1'
    else stPt := '0' ;
    if chk_McuAT.Checked then  stAT := '1'
    else stAT := '0' ;
    if chk_MCUJavara.Checked then  stJavara := '1'
    else stJavara := '0' ;
    if chk_MCUTimeCode.Checked then  stTimeType := '1'
    else stTimeType := '0' ;

    
    if Trim(ed_TotWidth1.text) <> '' then stTotWidth := Trim(ed_TotWidth1.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight1.text) <> '' then stTotHeight := Trim(ed_TotHeight1.text)
    else stTotHeight := '0';
    if Trim(ed_CurX1.text) <> '' then stCurX := Trim(ed_CurX1.text)
    else stCurX := '0';
    if Trim(ed_CurY1.text) <> '' then stCurY := Trim(ed_CurY1.text)
    else stCurY := '0';


    if cmb_SockType.ItemIndex = 1 then
    begin
      if Length(Trim(ed_McuID.Text)) <> 7 then
      begin
        showmessage('MCU ID는 반드시 7자리여야 합니다.');
        Exit;
      end;
    end else
    begin
      if Trim(ed_McuIp.Text) = '' then
      begin
        showmessage('MCU IP는 반드시 등록해 주셔야 합니다.');
        Exit;
      end;
    end;

    if cmb_McuArmAreaUse.ItemIndex = 1 then stArmAreaUse := 'Y'
    else stArmAreaUse := 'N';
    
    if DBTYPE <> 'MDB' then DataModule1.ADOConnection.BeginTrans;
    if UpperCase(State) = 'INSERT' then
    begin
      if cmb_SockType.ItemIndex = 1 then bResult := dmDBFunction.DupCheckTB_ACCESSDEVICE_MCUID(Trim(ed_McuID.Text))
      else bResult := dmDBFunction.DupCheckTB_ACCESSDEVICE_MCUIP(ed_McuIp.Text,ed_McuPort.Text);

      if bResult then
      begin
        if DBTYPE <> 'MDB' then DataModule1.ADOConnection.RollbackTrans;
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := dmDBFunction.InsertTB_ACCESSDEVICE(ed_NodeNo.Text,
                                       ed_mcuid.Text,
                                       '00',
                                       ed_McuIp.Text,
                                       ed_McuPort.Text,
                                       ed_MCUname.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stAC,
                                       stFd,
                                       stPt,
                                       stAt,
                                       stJavara,
                                       'N',
                                       '0',
                                       '0',
                                       'Y',
                                       inttostr(se_McuSeq.Value),
                                       inttostr(cmb_CardType.ItemIndex),
                                       stArmAreaUse,
                                       stTimeType,
                                       ed_systemid.text,
                                       ed_muxid.text,
                                       ed_decoderid.text,
                                       inttostr(cmb_SockType.ItemIndex + 1)
                                       );

      if bresult then  //MCU 입력시 출입문 달 것인지 여부
      begin
        stSql := ' Insert Into TB_FIREGROUP(AC_NODENO) Values(' + ed_NodeNo.Text + ')';
        DataModule1.ProcessExecSQL(stSql);
        if chk_MCUPt.Checked then
        begin
          InsertAlarmDevice(ed_NodeNo.Text,'00',ed_MCUname.Text,stBuildingCode,stFloorCode,stAreaCode,stArmAreaUse,chk_PtName.Checked);
        end;

        if Application.MessageBox(PChar('해당MCU에 기본 항목으로 출입문을 사용하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
        begin
          InsertTB_DOOR(ed_NodeNo.Text,'00','1',ed_MCUname.Text + '_1번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
          if stJavara <> '1' then
            InsertTB_DOOR(ed_NodeNo.Text,'00','2',ed_MCUname.Text + '_2번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
        end;
        if Application.MessageBox(PChar('해당MCU에 기본 항목으로 ECU를 추가하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
        begin
          fmEcuCount:= TfmEcuCount.Create(Self);
          fmEcuCount.showmodal;
          nEcuCount := fmEcuCount.L_nEcuCount;
          fmEcuCount.free;
          if nEcuCount > 0 then //등록할 ECU가 있는 거다.
          begin
            bDeviceDoorUse := False;
            if Application.MessageBox(PChar('해당ECU에 기본 항목으로 출입문을 사용하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
            begin
              bDeviceDoorUse := True;
            end;
            for i := 1 to nEcuCount do
            begin
              stEcuName := ed_MCUname.Text + '_' + FillZeroNumber(i,2) ;
              if dmDBFunction.InsertTB_ACCESSDEVICE(ed_NodeNo.Text,
                                       ed_mcuid.Text,
                                       FillZeroNumber(i,2),
                                       ed_McuIp.Text,
                                       ed_McuPort.Text,
                                       stEcuName,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       'N',
                                       stTotWidth,
                                       stTotHeight,
                                       '0',
                                       '0',
                                       '1',
                                       '0',
                                       '1',
                                       '0',
                                       '0',
                                       'N',
                                       '0',
                                       '1',
                                       'Y',
                                       '1',
                                       inttostr(cmb_CardType.ItemIndex),
                                       'N',
                                       '0',
                                       '',
                                       '',
                                       '',
                                       '1') then
              begin
                if bDeviceDoorUse then
                begin
                  InsertTB_DOOR(ed_NodeNo.Text,FillZeroNumber(i,2),'1',stEcuName + '_1번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
                  InsertTB_DOOR(ed_NodeNo.Text,FillZeroNumber(i,2),'2',stEcuName + '_2번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
                end;
                InsertAlarmDevice(ed_NodeNo.Text,FillZeroNumber(i,2),stEcuName,stBuildingCode,stFloorCode,stAreaCode,'N',chk_PtName.Checked);
              end;
            end;
          end;
        end;
      end;
    end
    else if UpperCase(State) = 'UPDATE' then
    begin
      {bResult := UpdateDeviceCardNoSend(ed_NodeNo.Text,'00'); //해당노드의 카드권한 부분 변경 처리
      if Not bResult then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        showmessage('카드권한정보의 MCUID변경 작업 실패');
        Exit;
      end; }
      if chk_McuUpdate.Checked then
      begin
        bResult := UpdateTB_ACCESSDEVICE(ed_NodeNo.Text,
                                       ed_mcuid.Text,
                                       '00',
                                       ed_McuIp.Text,
                                       ed_McuPort.Text,
                                       ed_MCUname.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stAC,
                                       stFd,
                                       stPt,
                                       stAt,
                                       stJavara,
                                       'N',
                                       'Y',
                                       ed_systemid.text,
                                       ed_muxid.text,
                                       ed_decoderid.text,
                                       stTimeType,
                                       inttostr(cmb_CardType.ItemIndex),
                                       inttostr(cmb_SockType.ItemIndex + 1),
                                       stArmAreaUse);
      end else
      begin
        bResult := UpdateTB_ACCESSDEVICEInfo(ed_NodeNo.Text,
                                       ed_mcuid.Text,
                                       '00',
                                       ed_McuIp.Text,
                                       ed_McuPort.Text,
                                       ed_MCUname.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       ed_systemid.text,
                                       ed_muxid.text,
                                       ed_decoderid.text,
                                       stTimeType,
                                       inttostr(cmb_CardType.ItemIndex),
                                       inttostr(cmb_SockType.ItemIndex + 1),
                                       stArmAreaUse);
      end;
      if chk_MCUPt.Checked then
      begin
        if (L_bArmAreaUse and ( stArmAreaUse = 'Y' ) ) or (Not L_bArmAreaUse and ( stArmAreaUse = 'N' ) ) then //변경 되지 않았다.
        begin
          InsertAlarmDevice(ed_NodeNo.Text,'00',ed_MCUname.Text,stBuildingCode,stFloorCode,stAreaCode,'',chk_PtName.Checked);
        end else
        begin
          InsertAlarmDevice(ed_NodeNo.Text,'00',ed_MCUname.Text,stBuildingCode,stFloorCode,stAreaCode,stArmAreaUse,chk_PtName.Checked);
        end;
      end else
      begin
        DeleteAlarmDevice(ed_NodeNo.Text,'00');
      end;
    end;
    CreateCardReader(ed_NodeNo.Text,'00');
    if chk_DoorName.Checked then
      UpdateDoorName(ed_NodeNo.Text,'00',ed_MCUname.Text,True); //메인컨트롤러의 출입문 명칭을 변경해 주자
    UpdateECUName(ed_NodeNo.Text,ed_MCUname.Text); //확장기의 명칭을 변경 해 주자.


    if bResult then
    begin
      if DBTYPE <> 'MDB' then  DataModule1.ADOConnection.CommitTrans;
      stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
      if (stBuildingCode = '') or (stBuildingCode = '000') then stFloorCode := '000'
      else  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
      if (stFloorCode = '') or (stFloorCode = '000') then stAreaCode := '000'
      else stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];

      if UpperCase(State) = 'INSERT' then
        MCUSearch(stBuildingCode, stFloorCode,stAreaCode,ed_NodeNo.Text)
      else
        MCUSearch(stBuildingCode, stFloorCode,stAreaCode,ed_NodeNo.Text,sg_MCUCode.TopRow);
    end else
    begin
      if DBTYPE <> 'MDB' then  DataModule1.ADOConnection.RollbackTrans ;
      showmessage('저장실패');
    end;
end;

procedure TfmMDIDeviceCode.ECUSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stAC,stFd,stPt,stAT,stJavara : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stNodeNo : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
  stFoodAmt :string;
  stSearchEcuID : string;
  stTimeType : string;
  stArmAreaUse : string;
begin
    if cmb_sMCUCode2.itemIndex = 0 then
    begin
      showmessage('MCU를 선택하셔야 합니다.');
      Exit;
    end;

    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_sBuildingCode2.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode2.itemIndex];
    if cmb_sFloorCode2.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode2.itemIndex];
    if cmb_sAreaCode2.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode2.itemIndex];
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode2.itemIndex];
    if chk_ECUReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;
    if Not chk_ECUFd.Checked then  stAC := '1'
    else stAC := '0' ;
    if chk_ECUFd.Checked then  stFd := '1'
    else stFd := '0' ;
    if chk_ECUPt.Checked then  stPt := '1'
    else stPt := '0' ;
    if chk_EcuAT.Checked then  stAT := '1'
    else stAT := '0' ;
    if chk_ECUJavara.Checked then  stJavara := '1'
    else stJavara := '0' ;
    if chk_ECUTimeCode.Checked then  stTimeType := '1'
    else stTimeType := '0' ;

    if Trim(ed_TotWidth2.text) <> '' then stTotWidth := Trim(ed_TotWidth2.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight2.text) <> '' then stTotHeight := Trim(ed_TotHeight2.text)
    else stTotHeight := '0';
    if Trim(ed_CurX2.text) <> '' then stCurX := Trim(ed_CurX2.text)
    else stCurX := '0';
    if Trim(ed_CurY2.text) <> '' then stCurY := Trim(ed_CurY2.text)
    else stCurY := '0';
    stSearchEcuID := FillZeroNumber(strtoint(stNodeNo),3) + FillZeroNumber(ed_Ecuno.Value,2);
    if cmb_EcuArmAreaUse.ItemIndex = 1 then stArmAreaUse := 'Y'
    else stArmAreaUse := 'N';

    DataModule1.ADOConnection.BeginTrans;
    if UpperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckECU(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2));
      if bResult then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := DupCheckECUName(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text);
      if bResult then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        showmessage('같은 이름으로 이미 등록되어 있습니다.');
        Exit;
      end;
      bResult := dmDBFunction.InsertTB_ACCESSDEVICE(inttostr(strtoint(stNodeNo)),
                                       '',
                                       FillZeroNumber(ed_Ecuno.Value,2),
                                       '',
                                       '',
                                       ed_EcuName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stAC,
                                       stFd,
                                       stPt,
                                       stAt,
                                       stJavara,
                                       'N',
                                       '0',
                                       '1',
                                       'Y',
                                       '1',
                                       inttostr(cmb_CardType.ItemIndex),
                                       stArmAreaUse,
                                       stTimeType,
                                       '',
                                       '',
                                       '',
                                       '1'
                                       );
      
      if Application.MessageBox(PChar('해당ECU에 기본 항목으로 출입문을 사용하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
      begin
        InsertTB_DOOR(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),'1',ed_EcuName.Text + '_1번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
        if stJavara <> '1' then
          InsertTB_DOOR(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),'2',ed_EcuName.Text + '_2번출입문',stBuildingCode,stFloorCode,stAreaCode,'N',stTotWidth,stTotHeight,'0','0','1');
      end;
      InsertAlarmDevice(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,stBuildingCode,stFloorCode,stAreaCode,stArmAreaUse,True);
      UpdateTB_NODE_RCV(inttostr(strtoint(stNodeNo)),'N');   //기기추가시 MCU정보를 다시 내리자.
    end
    else if UpperCase(State) = 'UPDATE' then
    begin
      if PrevECUNO <> ed_ecuno.Value then   //ECU ID 변경 된경우
      begin
        bResult := DupCheckECU(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2));
        if bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('이미 등록되어 있는 장비 입니다.');
          Exit;
        end;
        bResult := DupCheckECUName(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text);
        if bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('같은 이름으로 이미 등록되어 있습니다.');
          Exit;
        end;
        //기존 ECU의 아이디 변경
        bResult := UpdateECUIDFromECU(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('ECU의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 출입문 변경
        bResult := UpdateECUIDFromDOOR(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('출입문의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 방범구역 변경
        bResult := UpdateECUIDFromALARM(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('방범기기의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 식수구역 변경
        bResult := UpdateECUIDFromFOOD(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('식수장비의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 권한 변경
        bResult := UpdateECUIDFromCARDNO(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('카드권한의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 관리자 권한 변경
        bResult := UpdateECUIDFromAdminDoor(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('담당자출입조회권한의 ECUID변경 작업 실패');
          Exit;
        end;
        //기존 ECU의 관리자 식수 권한 변경
        bResult := UpdateECUIDFromAdminFood(stNodeNo,FillZeroNumber(PrevECUNO,2),FillZeroNumber(ed_ecuno.Value,2));
        if Not bResult then
        begin
          DataModule1.ADOConnection.RollbackTrans;
          showmessage('담당자식수조회권한의 ECUID변경 작업 실패');
          Exit;
        end;
        UpdateTB_NODE_RCV(inttostr(strtoint(stNodeNo)),'N');   //기기 아이디 변경시 MCU 정보를 다시 내리자
      end;
      {
      bResult := UpdateDeviceCardNoSend(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2)); //해당ECU의 카드권한 부분 변경 처리
      if Not bResult then
      begin
        DataModule1.ADOConnection.RollbackTrans;
        showmessage('카드권한정보 작업 실패');
        Exit;
      end; }
      if chk_EcuUpdate.Checked then
      begin
        bResult := UpdateTB_ACCESSDEVICE(inttostr(strtoint(stNodeNo)),
                                       '',
                                       FillZeroNumber(ed_Ecuno.Value,2),
                                       '',
                                       '',
                                       ed_EcuName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stAC,
                                       stFd,
                                       stPt,
                                       stAt,
                                       stJavara,
                                       'N',
                                       'Y',
                                       '',
                                       '',
                                       '',
                                       stTimeType,
                                       inttostr(CARDLENGTHTYPE),
                                       '',
                                       stArmAreaUse);
      end else
      begin
        bResult := UpdateTB_ACCESSDEVICEInfo(inttostr(strtoint(stNodeNo)),
                                       '',
                                       FillZeroNumber(ed_Ecuno.Value,2),
                                       '',
                                       '',
                                       ed_EcuName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       '',
                                       '',
                                       '',
                                       stTimeType,
                                       inttostr(CARDLENGTHTYPE),
                                       '',
                                       stArmAreaUse);
      end;
    end;
    if chk_ECUDoorName.Checked then
      UpdateDoorName(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,chk_ECUDoorName.Checked);
    if chk_EcuPt.Checked then
    begin
      if (L_bArmAreaUse and ( stArmAreaUse = 'Y' ) ) or (Not L_bArmAreaUse and ( stArmAreaUse = 'N' ) ) then //변경 되지 않았다.
      begin
        InsertAlarmDevice(inttostr(strtoint(stNodeNo)),FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,stBuildingCode,stFloorCode,stAreaCode,'',chk_ECUPtName.Checked);
      end else
      begin
        InsertAlarmDevice(inttostr(strtoint(stNodeNo)),FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,stBuildingCode,stFloorCode,stAreaCode,stArmAreaUse,chk_ECUPtName.Checked)
      end;

      //if chk_ECUPtName.Checked then InsertAlarmDevice(inttostr(strtoint(stNodeNo)),FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,stBuildingCode,stFloorCode,stAreaCode,chk_ECUPtName.Checked)
      //else  InsertAlarmDevice(inttostr(strtoint(stNodeNo)),FillZeroNumber(ed_Ecuno.Value,2),ed_EcuName.Text,stBuildingCode,stFloorCode,stAreaCode,chk_ECUPtName.Checked);
    end else
    begin
      DeleteAlarmDevice(inttostr(strtoint(stNodeNo)),FillZeroNumber(ed_Ecuno.Value,2));
    end;
    //UpdateTB_NODE_RCV(inttostr(strtoint(stNodeNo)),'N');  //기기추가나 아이디 변경시에만 MCU 정보를 다시 내림으로 변경
    CreateCardReader(stNodeNo,FillZeroNumber(ed_Ecuno.Value,2));

    if bResult then
    begin
      DataModule1.ADOConnection.CommitTrans;
      stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
      if (stBuildingCode = '') or (stBuildingCode = '000') then stFloorCode := '000'
      else  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
      if (stFloorCode = '') or (stFloorCode = '000') then stAreaCode := '000'
      else stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex ];
      stNodeNo := MCUCodeList.Strings[ cmb_MCUCode2.itemindex ];
      stNodeNo := copy(stNodeNo,1,3);
      if UpperCase(State) = 'INSERT' then
        ECUSearch(stBuildingCode, stFloorCode,stAreaCode,stNodeNo,stSearchEcuID)
      else
        ECUSearch(stBuildingCode, stFloorCode,stAreaCode,stNodeNo,stSearchEcuID,sg_ECUCode.TopRow);
    end else
    begin
      DataModule1.ADOConnection.RollbackTrans;
      showmessage('저장실패');
    end;
end;

procedure TfmMDIDeviceCode.DoorSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stAC,stFd,stPt,stAT : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stNodeNo,stECUID : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
  stFoodAmt :string;
begin
    if cmb_sMCUCode3.itemIndex = 0 then
    begin
      showmessage('MCU를 선택하셔야 합니다.');
      Exit;
    end;

    if ed_sDoorNo.Value < 1 then
    begin
      showmessage('문번호를 선택하셔야 합니다.');
      Exit;
    end;
    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_sBuildingCode3.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode3.itemIndex];
    if cmb_sFloorCode3.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode3.itemIndex];
    if cmb_sAreaCode3.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode3.itemIndex];
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode3.itemIndex];
    if cmb_sECUCode3.itemIndex < 1 then stECUID := '00'
    else stECUID := copy(sECUCodeList.Strings[cmb_sECUCode3.itemIndex],4,2);
    if stECUID = '' then stECUID := '00';
    if chk_DoorReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;
    if ed_DoorViewSeq.Text = '' then  stSeq := '0'
    else stSeq := ed_DoorViewSeq.Text;
    if Trim(ed_TotWidth3.text) <> '' then stTotWidth := Trim(ed_TotWidth3.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight3.text) <> '' then stTotHeight := Trim(ed_TotHeight3.text)
    else stTotHeight := '0';
    if Trim(ed_CurX3.text) <> '' then stCurX := Trim(ed_CurX3.text)
    else stCurX := '0';
    if Trim(ed_CurY3.text) <> '' then stCurY := Trim(ed_CurY3.text)
    else stCurY := '0';

    if UpperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckDoor(stNodeNo,stECUID,inttostr(ed_sDoorNo.Value));
      if bResult then
      begin
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := InsertTB_DOOR(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       inttostr(ed_sDoorNo.Value),
                                       ed_sDoorName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stSeq
                                       );
    end
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_DOOR(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       inttostr(ed_sDoorNo.Value),
                                       ed_sDoorName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stSeq
                                       );

    if bResult then
    begin
      stMCUCode := MCUCodeList.Strings[cmb_MCUCode3.itemIndex];
      if cmb_MCUCode3.itemIndex <> 0 then stECUCode := ECUCodeList.Strings[cmb_ECUCode3.itemIndex]
      else stECUCode := '';
      if stECUCode <> '' then
        DoorSearch(copy(stMCUCode,1,3), copy(stECUCode,4,2),FillZeroNumber(strtoint(stNodeNo),3) + stECUID+inttostr(ed_sDoorNo.Value))
      else DoorSearch(copy(stMCUCode,1,3),'',FillZeroNumber(strtoint(stNodeNo),3) + stECUID+inttostr(ed_sDoorNo.Value));
    end else showmessage('저장실패');
end;

procedure TfmMDIDeviceCode.AlarmSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stAC,stFd,stPt,stAT : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stNodeNo,stECUID : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
  stFoodAmt :string;
begin
    if cmb_sMCUCode4.itemIndex < 1 then
    begin
      showmessage('MCU를 선택하셔야 합니다.');
      Exit;
    end;
    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_sBuildingCode4.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode4.itemIndex];
    if cmb_sFloorCode4.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode4.itemIndex];
    if cmb_sAreaCode4.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode4.itemIndex];
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode4.itemIndex];
    if cmb_sECUCode4.itemIndex < 1 then stECUID := '00'
    else stECUID := copy(sECUCodeList.Strings[cmb_sECUCode4.itemIndex],4,2);
    if stECUID = '' then stECUID := '00';
    if chk_AlarmReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;
    if ed_AlarmViewSeq.Text = '' then  stSeq := '0'
    else stSeq := ed_AlarmViewSeq.Text;
    if Trim(ed_TotWidth4.text) <> '' then stTotWidth := Trim(ed_TotWidth4.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight4.text) <> '' then stTotHeight := Trim(ed_TotHeight4.text)
    else stTotHeight := '0';
    if Trim(ed_CurX4.text) <> '' then stCurX := Trim(ed_CurX4.text)
    else stCurX := '0';
    if Trim(ed_CurY4.text) <> '' then stCurY := Trim(ed_CurY4.text)
    else stCurY := '0';

    if UpperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckAlarm(stNodeNo,stECUID);
      if bResult then
      begin
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := InsertTB_ALARMDEVICE(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       //inttostr(ed_AlarmNo4.Value),
                                       ed_AlarmName4.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stSeq
                                       );
    end
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_ALARMDEVICE(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       //inttostr(ed_AlarmNo4.Value),
                                       ed_AlarmName4.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,
                                       stSeq
                                       );

    if bResult then
    begin
      stMCUCode := MCUCodeList.Strings[cmb_MCUCode4.itemIndex];
      if stMCUCode <> '' then AlarmSearch(copy(stMCUCode,1,3),inttostr(ed_AlarmNo4.Value))
      else AlarmSearch('000',inttostr(ed_AlarmNo4.Value));
    end else showmessage('저장실패');
end;

procedure TfmMDIDeviceCode.FoodSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  stAC,stFd,stPt,stAT : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stNodeNo,stECUID : string;
  stMCUCode,stECUCode : string;
  stSeq : string;
  stFoodAmt :string;
begin
    stFoodAmt := '0';
    if cmb_sMCUCode5.itemIndex = 0 then
    begin
      showmessage('MCU를 선택하셔야 합니다.');
      Exit;
    end;

    if ed_sFoodNo.Value < 1 then
    begin
      showmessage('문번호를 선택하셔야 합니다.');
      Exit;
    end;
    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_sBuildingCode5.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode5.itemIndex];
    if cmb_sFloorCode5.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode5.itemIndex];
    if cmb_sAreaCode5.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode5.itemIndex];
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode5.itemIndex];
    if cmb_sECUCode5.itemIndex < 1 then stECUID := '00'
    else stECUID := copy(sECUCodeList.Strings[cmb_sECUCode5.itemIndex],4,2);
    if stECUID = '' then stECUID := '00';
    if chk_FoodReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;

    if Trim(ed_TotWidth5.text) <> '' then stTotWidth := Trim(ed_TotWidth5.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight5.text) <> '' then stTotHeight := Trim(ed_TotHeight5.text)
    else stTotHeight := '0';
    if Trim(ed_CurX5.text) <> '' then stCurX := Trim(ed_CurX5.text)
    else stCurX := '0';
    if Trim(ed_CurY5.text) <> '' then stCurY := Trim(ed_CurY5.text)
    else stCurY := '0';
    if Trim(ed_FoodAmtPer.Text) <> '' then stFoodAmt := Trim(ed_FoodAmtPer.Text);

    if UpperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckFood(stNodeNo,stECUID,inttostr(ed_sFoodNo.Value));
      if bResult then
      begin
        showmessage('이미 등록되어 있는 장비 입니다.');
        Exit;
      end;
      bResult := InsertTB_Food(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       inttostr(ed_sFoodNo.Value),
                                       ed_sFoodName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,stFoodAmt
                                       );
    end
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_Food(inttostr(strtoint(stNodeNo)),
                                       stECUID,
                                       inttostr(ed_sFoodNo.Value),
                                       ed_sFoodName.Text,
                                       stBuildingCode,
                                       stFloorCode,
                                       stAreaCode,
                                       stRegState,
                                       stTotWidth,
                                       stTotHeight,
                                       stCurX,
                                       stCurY,stFoodAmt
                                       );

    if bResult then
    begin
      stMCUCode := MCUCodeList.Strings[cmb_MCUCode5.itemIndex];
      if cmb_MCUCode5.itemIndex <> 0 then stECUCode := ECUCodeList.Strings[cmb_ECUCode5.itemIndex]
      else stECUCode := '';
      if stECUCode <> '' then
        FoodSearch(copy(stMCUCode,1,3), copy(stECUCode,4,2),FillZeroNumber(strtoint(stNodeNo),3) + stECUID + inttostr(ed_sFoodNo.Value))
      else FoodSearch(copy(stMCUCode,1,3),'',FillZeroNumber(strtoint(stNodeNo),3) + stECUID + inttostr(ed_sFoodNo.Value));
    end else showmessage('저장실패');
end;

function TfmMDIDeviceCode.UpdateECUIDFromALARM(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ALARM의 ECU ID변경
  stSql := 'Update TB_ALARMDEVICE Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromCARDNO(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ECU의 ECU ID변경
  stSql := 'Update TB_DEVICECARDNO Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''', ' ;
  stSql := stSql + ' DE_RCVACK = ''N'' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromDOOR(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ECU의 ECU ID변경
  stSql := 'Update TB_DOOR Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromECU(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 ECU의 ECU ID변경
  stSql := 'Update TB_ACCESSDEVICE Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromFOOD(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 FOOD의 ECU ID변경
  stSql := 'Update TB_FOOD Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromAdminDoor(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 FOOD의 ECU ID변경
  stSql := 'Update TB_ADMINDOOR Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateECUIDFromAdminFood(aNodeNo, aPrevECUNO,
  aCurEcuno: string): Boolean;
var
  stSql : string;
begin
  Result := False;
  //해당 FOOD의 ECU ID변경
  stSql := 'Update TB_ADMINFOOD Set ';
  stSql := stSql + ' AC_ECUID = ''' + aCurEcuno + ''' ' ;
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aPrevECUNO + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;


procedure TfmMDIDeviceCode.ZoneSearch(aNodeNo,aAlarmNo: string);
var
  stSql : string;
  nRow : integer;
  TempAdoQuery : TADOQuery;
begin
{  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  GridInitialize(sg_ZoneCode); //스트링그리드 초기화

  stSql := 'select a.AL_ZONENAME,a.AL_DEVICENO,a.AC_ECUID,b.AL_ZONENUM,b.LO_DONGCODE,';
  stSql := stSql + 'b.LO_FLOORCODE,b.LO_AREACODE,b.AL_LOCATEUSE,b.AL_TOTWIDTH,';
  stSql := stSql + 'b.AL_TOTHEIGHT,b.AL_CURX,b.AL_CURY,c.AC_DEVICENAME as MCUNAME ';
  stSql := stSql + ' from TB_ALARMDEVICE a ';
  stSql := stSql + ' Inner Join TB_ZONEDEVICE b ';
  stSql := stSql + ' ON (a.GROUP_CODE = b.GROUP_CODE ';
  stSql := stSql + ' AND a.AL_DEVICENO = b.AL_DEVICENO ) ';
  stSql := stSql + ' Inner Join TB_ACCESSDEVICE c ';
  stSql := stSql + ' ON (a.GROUP_CODE = c.GROUP_CODE ';
  stSql := stSql + ' AND a.AC_NODENO = c.AC_NODENO ';
  stSql := stSql + ' AND c.AC_ECUID = ''00'') ';

  stSql := stSql + ' where a.GROUP_CODE = ''' + GROUPCODE + ''' ';
  if (aNodeNo <> '') and (aNodeNo <> '000') then    stSql := stSql + ' AND a.AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  if (aAL_DeviceNO <> '') then stSql := stSql + ' AND a.AL_DEVICENO = ' + inttostr(strtoint(aAL_DeviceNO));
  stSql := stSql + ' order by a.AL_DEVICENO ';

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
      TempAdoQuery.Free;
      Exit;
    End;

    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    First;
    sg_ZoneCode.RowCount := RecordCount + 1;
    nRow := 1;
    while Not Eof do
    begin
      with sg_ZoneCode do
      begin
        cells[0,nRow] := FindField('AL_ZONENAME').AsString;
        cells[1,nRow] := FindField('MCUNAME').AsString;
        cells[2,nRow] := FindField('AC_ECUID').AsString;
        cells[3,nRow] := FindField('AL_ZONENUM').AsString;
        cells[4,nRow] := FindField('LO_DONGCODE').AsString;
        cells[5,nRow] := FindField('LO_FLOORCODE').AsString;
        cells[6,nRow] := FindField('LO_AREACODE').AsString;
        cells[7,nRow] := FindField('AL_LOCATEUSE').AsString;
        cells[8,nRow] := FindField('AL_TOTWIDTH').AsString;
        cells[9,nRow] := FindField('AL_TOTHEIGHT').AsString;
        cells[10,nRow] := FindField('AL_CURX').AsString;
        cells[11,nRow] := FindField('AL_CURY').AsString;
        cells[12,nRow] := FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString;

        nRow := nRow + 1;
      end;
      Next;
    end;
  end;
  TempAdoQuery.Free;}

end;

procedure TfmMDIDeviceCode.cmb_MCUCode6Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode6.itemIndex];
  LoadAlarmCode(copy(stMCUCode,1,3),cmb_AlarmCode6);
  LoadsAlarmCode(copy(stMCUCode,1,3),cmb_sAlarmCode6);
  ZoneSearch(copy(stMCUCode,1,3),AlarmCodeList.Strings[cmb_AlarmCode6.ItemIndex]);

end;

procedure TfmMDIDeviceCode.sg_ZoneCodeClick(Sender: TObject);
var
  stAL_DEVICENO : string;
//  stECUID : string;
  stBuildingCode,stFloorCode : string;
begin

  with (Sender as TStringGrid) do
  begin
    if cells[0,Row] = '' then exit;

    State := 'CLICK';
    FormClear;
    FormEnable(State);
    ButtonEnable(State);

    stAL_DEVICENO := FillZeroNumber(strtoint(cells[12,Row]),3) ;
    cmb_sAlarmCode6.ItemIndex := sAlarmCodeList.IndexOf(stAL_DEVICENO);

    ed_ZoneNo6.Value  := strtoint(cells[3,Row]);

    LoadsBuildingCode(cmb_sBuildingCode6);
    if (cells[4,Row] = '') or (cells[4,Row] = '000') then cmb_sBuildingCode6.ItemIndex := 0
    else cmb_sBuildingCode6.ItemIndex := sBuildingCodeList.IndexOf(cells[4,Row]);
    stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode6.itemindex ];
    if (stBuildingCode <> '') or (stBuildingCode <> '000') then LoadsFloorCode(stBuildingCode,cmb_sFloorCode6);
    if (cells[5,Row] = '') or (cells[5,Row] = '000') then cmb_sFloorCode6.ItemIndex := 0
    else cmb_sFloorCode6.ItemIndex := sFloorCodeList.IndexOf(cells[5,Row]);
    if cmb_sFloorCode6.itemindex < 1 then stFloorCode := ''
    else stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode6.itemindex ];
    if (stFloorCode <> '') or (stFloorCode <> '000') then LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode6);;
    if (cells[6,Row] = '') or (cells[6,Row] = '000') then cmb_sAreaCode6.ItemIndex := 0
    else cmb_sAreaCode6.ItemIndex := sAreaCodeList.IndexOf(cells[6,Row]);

    if cells[7,Row] = 'Y' then chk_ZoneReg.Checked := True
    else chk_ZoneReg.Checked := False;
    ed_TotWidth6.Text := cells[8,Row];
    ed_TotHeight6.Text := cells[9,Row];
    ed_CurX6.Text := cells[10,Row];
    ed_CurY6.Text := cells[11,Row];

  end;
end;

procedure TfmMDIDeviceCode.LoadsAlarmCode(aNodeNo: string;
  cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  sAlarmCodeList.Clear;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (aNodeNo <> '') And (aNodeNo <> '000')  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  end;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID' ;

  cmb_Box.Items.Add('');
  sAlarmCodeList.Add('');
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
        cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString );
        sAlarmCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').AsString) ;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.MCUInsertClick;
var
  stSql : string;
  stNodeNo : string;
  TempAdoQuery : TADOQuery;
begin

  stSql := 'select MAX(AC_NODENO) as AC_NODENO from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
        showmessage('테이블에 이상이 있습니다.');
        Exit;
      End;

      if RecordCount > 0 then ed_NodeNo.Text := inttostr(FieldByName('AC_NODENO').asinteger + 1)
      else ed_NodeNo.Text := '1';

    end;
    with sg_MCUCode do
    begin
      if Cells[0,1] <> '' then
      begin
        AddRow;
        SelectRows(RowCount - 1,1);
        Enabled := True;
        if RowCount > 5 then TopRow := RowCount - 5;
        Enabled := False;
      end;
    end;
  //  ed_MCUID.SetFocus;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.ECUInsertClick;
var
  stSql : string;
  stNodeNo : string;
  TempAdoQuery : TADOQuery;
  stEcuNo : string;
  stTemp : string;
begin

  stTemp := '';
  LoadsMCUCode('000','000','000',cmb_sMCUCode2);
  if cmb_MCUCode2.ItemIndex > 0 then
     stTemp := MCUCodeList.Strings[cmb_MCUCode2.ItemIndex];
  if stTemp <> '' then
    cmb_sMCUCode2.ItemIndex := sMCUCodeList.indexof(stTemp);
  LoadsBuildingCode(cmb_sBuildingCode2);
  ed_Ecuno.Value := 1;
  if cmb_sMCUCode2.ItemIndex > 0 then
  begin
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode2.ItemIndex];
    stSql := 'select MAX(AC_ECUID) as AC_ECUID from TB_ACCESSDEVICE ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(stNodeNo)) + ' ';

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
          showmessage('테이블에 이상이 있습니다.');
          Exit;
        End;

        stEcuNo := FieldByName('AC_ECUID').AsString;
        if isDigit(stEcuNo) then
        begin
          ed_Ecuno.Value := strtoint(stEcuNo) + 1;
        end;
      end;
    Finally
      TempAdoQuery.Free;
      CoUninitialize;
    End;
  end;

  with sg_ECUCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  ed_EcuName.SetFocus;

end;

procedure TfmMDIDeviceCode.DoorInsertClick;
var
  stNodeNo : string;
begin

  LoadsMCUCode('000','000','000',cmb_sMCUCode3);
  cmb_sMCUCode3.ItemIndex := cmb_MCUCode3.ItemIndex;
  if cmb_sMCUCode3.ItemIndex <> 0 then
  begin
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode3.ItemIndex];
    LoadsECUCode(stNodeNo,'DOOR',cmb_sECUCode3);
    cmb_sECUCode3.ItemIndex := cmb_ECUCode3.ItemIndex;
  end else
  begin
    cmb_sECUCode3.Clear;
    sECUCodeList.Clear;
  end;

  LoadsBuildingCode(cmb_sBuildingCode3);

  with sg_DoorCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  ed_sDoorName.SetFocus;
end;

procedure TfmMDIDeviceCode.AlarmInsertClick;
var
  stSql : string;
  stNodeNo : string;
  TempAdoQuery : TADOQuery;
begin
{  TempAdoQuery := TADOQuery.Create(nil);
  TempAdoQuery.Connection := DataModule1.ADOConnection;

  LoadsMCUCode('000','000','000',cmb_sMCUCode4);
  cmb_sMCUCode4.ItemIndex := cmb_MCUCode4.ItemIndex;
  if cmb_sMCUCode4.ItemIndex <> 0 then
  begin
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode4.ItemIndex];
    LoadsECUCode(stNodeNo,'ALARM',cmb_sECUCode4);
  end else
  begin
    cmb_sECUCode4.Clear;
    sECUCodeList.Clear;
  end;

  LoadsBuildingCode(cmb_sBuildingCode4);
  ed_AlarmNo4.Value := 1;
  stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode4.ItemIndex];
  stSql := 'select MAX(AL_DEVICENO) as AL_DEVICENO from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  with TempAdoQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      TempAdoQuery.Free;
      showmessage('테이블에 이상이 있습니다.');
      Exit;
    End;

    if RecordCount > 0 then ed_AlarmNo4.Value := FieldByName('AL_DEVICENO').asinteger + 1
    else ed_AlarmNo4.Value := 1;
  end;

  TempAdoQuery.Free;
  with sg_AlarmCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;
  ed_AlarmName4.SetFocus;   }
end;

procedure TfmMDIDeviceCode.FoodInsertClick;
var
  stNodeNo : string;
begin

  LoadsMCUCode('000','000','000',cmb_sMCUCode5);
  cmb_sMCUCode5.ItemIndex := cmb_MCUCode5.ItemIndex;
  if cmb_sMCUCode5.ItemIndex <> 0 then
  begin
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode5.ItemIndex];
    LoadsECUCode(stNodeNo,'FOOD',cmb_sECUCode5);
    cmb_sECUCode5.ItemIndex := cmb_ECUCode5.ItemIndex;
  end else
  begin
    cmb_sECUCode5.Clear;
    sECUCodeList.Clear;
  end;

  LoadsBuildingCode(cmb_sBuildingCode5);

  with sg_FoodCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  ed_sFoodName.SetFocus;
end;

procedure TfmMDIDeviceCode.ZoneInsertClick;
var
  stAL_DeviceNO : string;
begin
{
  LoadsBuildingCode(cmb_sBuildingCode6);
  with sg_ZoneCode do
  begin
    if Cells[0,1] <> '' then
    begin
      AddRow;
      SelectRows(RowCount - 1,1);
      Enabled := True;
      if RowCount > 5 then TopRow := RowCount - 5;
      Enabled := False;
    end;
  end;

  ed_ZoneNo6.SetFocus; }
end;

procedure TfmMDIDeviceCode.ZoneSave;
var
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stRegState : string;
  bResult : Boolean;
  stTotWidth,stTotHeight,stCurX,stCurY : string;
  stAL_DEVICENO : string;
  stMCUCode : string;
begin
{    if cmb_sAlarmCode6.itemIndex < 1 then
    begin
      showmessage('방범구역을 선택하셔야 합니다.');
      Exit;
    end;
    stBuildingCode := '000';
    stFloorCode := '000';
    stAreaCode := '000';
    if cmb_sBuildingCode6.itemIndex > 0 then stBuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode6.itemIndex];
    if cmb_sFloorCode6.itemIndex > 0 then stFloorCode := sFloorCodeList.Strings[cmb_sFloorCode6.itemIndex];
    if cmb_sAreaCode6.itemIndex > 0 then  stAreaCode := sAreaCodeList.Strings[cmb_sAreaCode6.itemIndex];
    stAL_DEVICENO := sAlarmCodeList.Strings[cmb_sAlarmCode6.itemIndex];
    if chk_ZoneReg.Checked then  stRegState := 'Y'
    else stRegState := 'N' ;
    if Trim(ed_TotWidth6.text) <> '' then stTotWidth := Trim(ed_TotWidth6.text)
    else stTotWidth := '0';
    if Trim(ed_TotHeight6.text) <> '' then stTotHeight := Trim(ed_TotHeight6.text)
    else stTotHeight := '0';
    if Trim(ed_CurX6.text) <> '' then stCurX := Trim(ed_CurX6.text)
    else stCurX := '0';
    if Trim(ed_CurY6.text) <> '' then stCurY := Trim(ed_CurY6.text)
    else stCurY := '0';

    if UpperCase(State) = 'INSERT' then
    begin
      bResult := DupCheckZone(copy(stAL_DEVICENO,1,3),copy(stAL_DEVICENO,4,2),inttostr(ed_ZoneNo6.Value));
      if bResult then
      begin
        showmessage('이미 등록되어 있는 존 입니다.');
        Exit;
      end;
      bResult := InsertTB_ZoneDEVICE(copy(stAL_DEVICENO,1,3),copy(stAL_DEVICENO,4,2),
                                     inttostr(ed_ZoneNo6.Value),
                                     ed_ZoneName.Text,
                                     stRegState,
                                     stBuildingCode,
                                     stFloorCode,
                                     stAreaCode,
                                     stTotWidth,
                                     stTotHeight,
                                     stCurX,
                                     stCurY
                                     );
    end
    else if UpperCase(State) = 'UPDATE' then
      bResult := UpdateTB_ZoneDEVICE(copy(stAL_DEVICENO,1,3),copy(stAL_DEVICENO,4,2),
                                     inttostr(ed_ZoneNo6.Value),
                                     ed_ZoneName.Text,
                                     stRegState,
                                     stBuildingCode,
                                     stFloorCode,
                                     stAreaCode,
                                     stTotWidth,
                                     stTotHeight,
                                     stCurX,
                                     stCurY
                                     );

    if bResult then
    begin
      stMCUCode := MCUCodeList.Strings[cmb_MCUCode6.itemIndex];
      if stMCUCode <> '' then ZoneSearch(copy(stMCUCode,1,3),AlarmCodeList.Strings[cmb_AlarmCode6.itemIndex])
      else ZoneSearch('000','');
    end else showmessage('저장실패'); }
end;

function TfmMDIDeviceCode.DupCheckZone(aNodeNo,aECUID,
  aZoneNo: string): Boolean;
var
  stSql :string;
  TempAdoQuery :TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_ZoneDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNo + ''' ';

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

function TfmMDIDeviceCode.InsertTB_ZoneDEVICE(aACNODENO,aACECUID, aZoneNo,
  aZoneName, aRegState, aBuildingCode, aFloorCode, aAreaCode, aTotWidth,
  aTotHeight, aCurX, aCurY:string): Boolean;
var
  stSql :string;
begin
  result := False;
//  aAL_DEVICENO := inttostr(strtoint(aAL_DEVICENO));
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

function TfmMDIDeviceCode.UpdateTB_ZoneDEVICE(aACNODENO,aACECUID, aZoneNo,
  aZoneName, aRegState, aBuildingCode, aFloorCode, aAreaCode, aTotWidth,
  aTotHeight, aCurX, aCurY:string): Boolean;
var
  stSql :string;
begin
  result := False;
  //aAL_DEVICENO := inttostr(strtoint(aAL_DEVICENO));
  if aTotWidth = '' then aTotWidth := '0';
  if aTotHeight = '' then aTotHeight := '0';
  if aCurX = '' then aCurX := '0';
  if aCurY = '' then aCurY := '0';

  stSql := ' UPDATE TB_ZoneDevice SET ';
  stSql := stSql + ' AL_ZONENAME = ''' + aZoneName + ''',';
  stSql := stSql + ' AL_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + ' AL_TOTWIDTH = ' + aTotWidth + ',';
  stSql := stSql + ' AL_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + ' AL_CURX = ' + aCurX + ',';
  stSql := stSql + ' AL_CURY = ' + aCurY + ',';
  stSql := stSql + ' LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + ' LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + ' LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aACNODENO ;
  stSql := stSql + ' AND AC_ECUID = ''' + aACECUID + ''' ';
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNo + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmMDIDeviceCode.cmb_sBuildingCode6Change(Sender: TObject);
var
  stBuildingCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode6.itemindex ];
  LoadsFloorCode(stBuildingCode,cmb_sFloorCode6);

end;

procedure TfmMDIDeviceCode.cmb_sFloorCode6Change(Sender: TObject);
var
  stBuildingCode : string;
  stFloorCode : string;
begin
  stBuildingCode := sBuildingCodeList.Strings[ cmb_sBuildingCode6.itemindex ];
  stFloorCode := sFloorCodeList.Strings[ cmb_sFloorCode6.itemindex ];
  LoadsAreaCode(stBuildingCode,stFloorCode,cmb_sAreaCode6);

end;

procedure TfmMDIDeviceCode.btnZonePositionClick(Sender: TObject);
begin
{  if cmb_sBuildingCode6.itemIndex < 0 then cmb_sBuildingCode6.itemIndex := 0;
  if cmb_sFloorCode6.itemIndex < 0 then cmb_sFloorCode6.itemIndex := 0;
  if cmb_sAreaCode6.itemIndex < 0 then cmb_sAreaCode6.itemIndex := 0;  }
  if cmb_sAlarmCode6.ItemIndex < 1 then
  begin
    showmessage('방범구역을 선택하세요.');
    Exit;
  end;

  fmPositionSet:= TfmPositionSet.Create(Self);
  fmPositionSet.DeviceType := '6';
  fmPositionSet.DeviceName := inttostr(ed_ZoneNo6.Value) + ' 번존';
  fmPositionSet.X_Position := ed_CurX6.Text;
  fmPositionSet.Y_Position := ed_CurY6.Text;
  fmPositionSet.X_Size := ed_TotWidth6.Text;
  fmPositionSet.Y_Size := ed_TotHeight6.Text;
  fmPositionSet.BuildingCode := GetZoneBuildingCode(sAlarmCodeList.Strings[cmb_sAlarmCode6.itemIndex]);
  fmPositionSet.FloorCode := GetZoneFloorCode(sAlarmCodeList.Strings[cmb_sAlarmCode6.itemIndex]);
  fmPositionSet.SectorCode := GetZoneSectorCode(sAlarmCodeList.Strings[cmb_sAlarmCode6.itemIndex]);
{  fmPositionSet.BuildingCode := sBuildingCodeList.Strings[cmb_sBuildingCode6.itemIndex];
  fmPositionSet.FloorCode := sFloorCodeList.Strings[cmb_sFloorCode6.itemIndex];
  fmPositionSet.SectorCode := sAreaCodeList.Strings[cmb_sAreaCode6.itemIndex];}
  fmPositionSet.SHowmodal;
  ed_CurX6.Text := inttostr(fmPositionSet.L_nImageLeft);
  ed_CurY6.Text := inttostr(fmPositionSet.L_nImageTop);
  ed_TotWidth6.Text := inttostr(fmPositionSet.L_nImageWidth);
  ed_TotHeight6.Text := inttostr(fmPositionSet.L_nImageHeight);
  fmPositionSet.Free;
end;

procedure TfmMDIDeviceCode.LoadAlarmCode(aNodeNo: string; cmb_Box: TComboBox);
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  cmb_Box.Clear;
  AlarmCodeList.Clear;

  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';

  if (aNodeNo <> '') And (aNodeNo <> '000')  then
  begin
    stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  end;
  stSql := stSql + ' order by AC_NODENO,AC_ECUID' ;

  cmb_Box.Items.Add('전체');
  AlarmCodeList.Add('');
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
        cmb_Box.Items.Add(FindField('AL_ZONENAME').AsString );
        AlarmCodeList.Add( FillZeroNumber(FindField('AC_NODENO').asinteger,3) + FindField('AC_ECUID').asstring) ;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmMDIDeviceCode.cmb_AlarmCode6Change(Sender: TObject);
var
  stMCUCode : string;
begin
  stMCUCode := MCUCodeList.Strings[cmb_MCUCode6.itemIndex];
  ZoneSearch(copy(stMCUCode,1,3),AlarmCodeList.Strings[cmb_AlarmCode6.ItemIndex]);

end;

procedure TfmMDIDeviceCode.DeleteMCUClick;
var
  bResult : boolean;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stMCUCode : string;
begin
  bResult := DeleteNODEECUALL(ed_NodeNo.Text);
  if Not bResult Then
  begin
    showmessage('해당 노드의 ECU정보 삭제에 실패했습니다. 해당 ECU 삭제후 시도 하세요.');
  end;

  //bResult := DeleteTB_ACCESSDEVICE(ed_NodeNo.Text,'00');

  if bResult then
  begin
    dmDBFunction.DeleteTB_FIREGROUP_NodeNo(ed_NodeNo.Text);
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode1.itemindex ];
    if (stBuildingCode = '') or (stBuildingCode = '000') then stFloorCode := '000'
    else  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode1.itemindex ];
    if (stFloorCode = '') or (stFloorCode = '000') then stAreaCode := '000'
    else stAreaCode := AreaCodeList.Strings[cmb_AreaCode1.itemIndex ];
    MCUSearch(stBuildingCode, stFloorCode,stAreaCode,'0',sg_MCUCode.TopRow);
  end else showmessage('삭제실패.');

end;

procedure TfmMDIDeviceCode.DeleteECUClick;
var
  bResult : boolean;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stMCUCode,stECUID : string;
begin
  if cmb_sMCUCode2.itemIndex > -1 then
    stNodeNo := sMCUCodeList.Strings[cmb_sMCUCode2.itemIndex]
  else stNodeNo := '';
  stECUID := FillZeroNumber(ed_Ecuno.Value,2);
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
  UpdateTB_ACCESSDEVICESendAck(stNodeNo,'00','N');

  if bResult then
  begin
    stBuildingCode := BuildingCodeList.Strings[ cmb_BuildingCode2.itemindex ];
    if (stBuildingCode = '') or (stBuildingCode = '000') then stFloorCode := '000'
    else  stFloorCode := FloorCodeList.Strings[ cmb_FloorCode2.itemindex ];
    if (stFloorCode = '') or (stFloorCode = '000') then stAreaCode := '000'
    else stAreaCode := AreaCodeList.Strings[cmb_AreaCode2.itemIndex ];
    stNodeNo := MCUCodeList.Strings[ cmb_MCUCode2.itemindex ];
    stNodeNo := copy(stNodeNo,1,3);
    ECUSearch(stBuildingCode, stFloorCode,stAreaCode,stNodeNo,'',sg_ECUCode.TopRow);
  end else showmessage('삭제실패.');

end;

procedure TfmMDIDeviceCode.DeleteDoorClick;
var
  bResult : boolean;
  stBuildingCode : string;
  stFloorCode : string;
  stAreaCode : string;
  stNodeNo : string;
  stECUID : string;
begin
  stECUID := copy(sECUCodeList.Strings[ cmb_sECUCode3.itemIndex ],4,2);
  bResult := DeleteTB_DOOR(ed_NodeNo3.Text,stECUID,inttostr(ed_sDoorNo.value));

  if bResult then
  begin
    stNodeNo := MCUCodeList.Strings[cmb_MCUCode3.itemIndex];
    if cmb_MCUCode3.itemIndex <> 0 then stECUID := copy(ECUCodeList.Strings[cmb_ECUCode3.itemIndex],4,2)
    else stECUID := '';
    if stECUID <> '' then
      DoorSearch(stNodeNo, stECUID,'')
    else DoorSearch(stNodeNo,'','');
  end else showmessage('삭제실패.');
end;

procedure TfmMDIDeviceCode.DeleteAlaramClick;
var
  bResult : boolean;
  stMCUCode : string;
begin
{  bResult := DeleteTB_ALARMDEVICE(inttostr(ed_AlarmNo4.value));

  if bResult then
  begin
    stMCUCode := MCUCodeList.Strings[cmb_MCUCode3.itemIndex];
    if stMCUCode <> '' then AlarmSearch(copy(stMCUCode,1,3),'')
    else AlarmSearch('000','');

  end else showmessage('삭제실패.'); }
end;

procedure TfmMDIDeviceCode.DeleteFoodClick;
var
  bResult : boolean;
  stMCUCode,stECUID : string;
begin
  if cmb_sECUCode5.itemIndex < 0 then
  begin
    showmessage('식수기기 코드가 잘못되었습니다.');
    Exit;
  end;
  stECUID := sECUCodeList.Strings[ cmb_sECUCode5.itemIndex ];
  bResult := DeleteTB_FOOD(ed_NodeNo5.Text,copy(stECUID,4,2),inttostr(ed_sFoodNo.value));

  if bResult then
  begin
    stMCUCode := MCUCodeList.Strings[cmb_MCUCode5.itemIndex];
    if cmb_MCUCode5.itemIndex <> 0 then stECUID := copy(ECUCodeList.Strings[cmb_ECUCode5.itemIndex],4,2)
    else stECUID := '';
    if stECUID <> '' then
      FoodSearch(stMCUCode, stECUID,'')
    else FoodSearch(stMCUCode,'','');
  end else showmessage('삭제실패.');
end;

procedure TfmMDIDeviceCode.DeleteZoneClick;
var
  bResult : boolean;
  stMCUCode : string;
begin
  bResult := DeleteTB_ZONEDEVICE(
                                 AlarmCodeList.Strings[cmb_sAlarmCode6.ItemIndex],
                                 inttostr(ed_ZoneNo6.Value)
                                 );

  if bResult then
  begin
    stMCUCode := MCUCodeList.Strings[cmb_MCUCode6.itemIndex];
    if stMCUCode <> '' then ZoneSearch(copy(stMCUCode,1,3),AlarmCodeList.Strings[cmb_AlarmCode6.itemIndex])
    else ZoneSearch('000','');
  end else showmessage('삭제실패');
end;

function TfmMDIDeviceCode.DeleteTB_ZONEDEVICE(aAlarmNo,
  aZoneNo: string): Boolean;
var
  stSql : string;
begin
{  result := False;
  stSql := 'Delete From TB_ZONEDEVICE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DEVICENO = ' + aAlarmNo ;
  stSql := stSql + ' AND AL_ZONENUM = ''' + aZoneNo + ''' ' ;

  result :=  DataModule1.ProcessExecSQL(stSql); }
end;

function TfmMDIDeviceCode.GetZoneBuildingCode(aAlarmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
{  result := '000';
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DEVICENO = ' + inttostr(strtoint(aAlarmCode)) ;
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
      TempAdoQuery.Free;
      Exit;
    End;
    if recordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;
    First;
    result := FindField('LO_DONGCODE').AsString;
  end;
  TempAdoQuery.Free;}
end;

function TfmMDIDeviceCode.GetZoneFloorCode(aAlarmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
{  result := '000';
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DEVICENO = ' + inttostr(strtoint(aAlarmCode)) ;
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
      TempAdoQuery.Free;
      Exit;
    End;
    if recordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;
    First;
    result := FindField('LO_FLOORCODE').AsString;
  end;
  TempAdoQuery.Free;}
end;

function TfmMDIDeviceCode.GetZoneSectorCode(aAlarmCode: string): string;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
{  result := '000';
  stSql := 'select * from TB_ALARMDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AL_DEVICENO = ' + inttostr(strtoint(aAlarmCode)) ;
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
      TempAdoQuery.Free;
      Exit;
    End;
    if recordCount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;
    First;
    result := FindField('LO_AREACODE').AsString;
  end;
  TempAdoQuery.Free; }
end;

procedure TfmMDIDeviceCode.ButtonEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    btn_Insert.Enabled := False;
    btn_update.Enabled := false;
    btn_Save.Enabled := True;
    btn_delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    btn_Insert.Enabled := True;
    btn_Insert.Enabled := True;
    btn_Update.Enabled := False;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    btn_Insert.Enabled := False;
    btn_Update.Enabled := False;
    btn_Save.Enabled := True;
    btn_Delete.Enabled := False;
    btn_Cancel.Enabled := True;
  end else if upperCase(aState) = 'CLICK' then
  begin
    btn_Insert.Enabled := True;
    btn_Update.Enabled := True;
    btn_Save.Enabled := False;
    btn_Delete.Enabled := True;
    btn_Cancel.Enabled := False;
  end;

end;

procedure TfmMDIDeviceCode.FormClear;
begin
  lb_McuIP.Visible := UseDeviceServer;
  ed_MCUIP.Visible := UseDeviceServer;

  lb_McuID.Visible := Not UseDeviceServer;
  ed_MCUID.Visible := Not UseDeviceServer;

  //MCU Form Clear
  ed_NodeNo.Text := '';
  ed_MCUID.Text  := '0000000';
  ed_MCUIP.Text  := '';
  ed_MCUPORT.Text  := '3000';
  ed_MCUNAME.Text  := '';
  ed_systemid.Text := '';
  ed_muxid.Text := '';
  ed_decoderid.Text := 'KTT00';
  cmb_CardType.ItemIndex :=  CARDLENGTHTYPE;
  if UseDeviceServer then cmb_SockType.ItemIndex :=  0
  else cmb_SockType.ItemIndex := 1;

  chk_MCUReg.Checked := False;
  ed_TotWidth1.Text := '';
  ed_TotHeight1.Text := '';
  ed_CurX1.Text := '';
  ed_CurY1.Text := '';
  chk_MCUAc.Checked := True;
  chk_MCUAt.Checked := False;
  chk_MCUFd.Checked := False;
  chk_MCUPt.Checked := True;

  chk_McuUpdate.Checked := False;
  chk_EcuUpdate.Checked := False;

  //ECU Form Clear
  cmb_sMCUCode2.ItemIndex := -1;
  ed_Ecuno.Value := 1;
  ed_ECUNAME.Text  := '';

  chk_ECUReg.Checked := False;
  ed_TotWidth2.Text := '';
  ed_TotHeight2.Text := '';
  ed_CurX2.Text := '';
  ed_CurY2.Text := '';
  chk_ECUAc.Checked := True;
  chk_ECUAt.Checked := False;
  chk_ECUFd.Checked := False;
  chk_ECUPt.Checked := True;

  //Door Form Clear
  ed_sDoorNo.Value := 0;
  ed_sDoorName.Text  := '';
  cmb_sFloorCode3.Clear;
  sFloorCodeList.Clear;
  cmb_sAreaCode3.Clear;
  sAreaCodeList.Clear;
  chk_DoorReg.Checked := False;
  ed_TotWidth3.Text := '';
  ed_TotHeight3.Text := '';
  ed_CurX3.Text := '';
  ed_CurY3.Text := '';
  ed_DoorViewSeq.Text := '';

  //Alarm Form Clear
  ed_AlarmName4.Text  := '';
  cmb_sFloorCode4.Clear;
  sFloorCodeList.Clear;
  cmb_sAreaCode4.Clear;
  sAreaCodeList.Clear;
  chk_AlarmReg.Checked := False;
  ed_TotWidth4.Text := '';
  ed_TotHeight4.Text := '';
  ed_CurX4.Text := '';
  ed_CurY4.Text := '';
  ed_AlarmViewSeq.Text := '';

  //Zone Form Clear
  ed_ZoneNo6.Value := 1;
  chk_ZoneReg.Checked := False;
  ed_TotWidth6.Text := '';
  ed_TotHeight6.Text := '';
  ed_CurX6.Text := '';
  ed_CurY6.Text := '';

  //Food Form Clear
  ed_sFoodNo.Value := 0;
  ed_sFoodName.Text  := '';
  chk_FoodReg.Checked := False;
  ed_TotWidth5.Text := '';
  ed_TotHeight5.Text := '';
  ed_CurX5.Text := '';
  ed_CurY5.Text := '';

  cmb_sBuildingCode1.Clear;
  cmb_sFloorCode1.Clear;
  cmb_sAreaCode1.Clear;
  cmb_sBuildingCode2.Clear;
  cmb_sFloorCode2.Clear;
  cmb_sAreaCode2.Clear;
  cmb_sBuildingCode3.Clear;
  cmb_sFloorCode3.Clear;
  cmb_sAreaCode3.Clear;
  cmb_sBuildingCode4.Clear;
  cmb_sFloorCode4.Clear;
  cmb_sAreaCode4.Clear;
  cmb_sBuildingCode5.Clear;
  cmb_sFloorCode5.Clear;
  cmb_sAreaCode5.Clear;
  cmb_sBuildingCode6.Clear;
  cmb_sFloorCode6.Clear;
  cmb_sAreaCode6.Clear;

  sBuildingCodeList.Clear;
  sFloorCodeList.Clear;
  sAreaCodeList.Clear;

end;

procedure TfmMDIDeviceCode.FormEnable(aState: string);
begin

  if upperCase(aState) = 'INSERT'  then
  begin
    //MCU Form Enable
    sg_MCUCode.Enabled := False;
    ed_MCUID.Enabled := True;
    ed_MCUIP.Enabled := True;
    ed_MCUPORT.Enabled := True;
    ed_MCUNAME.Enabled := True;
    se_McuSeq.Enabled := True;
    ed_systemid.Enabled := True;
    ed_muxid.Enabled := True;
    ed_decoderid.Enabled := True;
    cmb_sBuildingCode1.Enabled := True;
    cmb_sFloorCode1.Enabled := True;
    cmb_sAreaCode1.Enabled := True;
    chk_MCUReg.Enabled := True;
    gb_Device.Enabled := True;
    btnMCUPosition.Enabled := True;
    chk_EcuName.Enabled := True;
    chk_DoorName.Enabled := True;
    chk_PtName.Enabled := True;
    cmb_CardType.Enabled := True;
    cmb_SockType.Enabled := True;
    cmb_McuArmAreaUse.Enabled := True;
    
    //ECU Form Enable
    sg_ECUCode.Enabled := False;
    cmb_sMCUCode2.Enabled := True;
    ed_Ecuno.Enabled := True;
    ed_EcuName.Enabled := True;
    cmb_sBuildingCode2.Enabled := True;
    cmb_sFloorCode2.Enabled := True;
    cmb_sAreaCode2.Enabled := True;
    chk_ECUReg.Enabled := True;
    gb_Device2.Enabled := True;
    btnECUPosition.Enabled := True;
    chk_ECUDoorName.Enabled := True;
    chk_ECUPtName.Enabled := True;
    cmb_EcuArmAreaUse.Enabled := True;

    //Door Form Enable
    sg_DoorCode.Enabled := False;
    cmb_sMCUCode3.Enabled := True;
    cmb_sECUCode3.Enabled := True;
    ed_sDoorNo.Enabled := True;
    ed_sDoorName.Enabled := True;
    cmb_sBuildingCode3.Enabled := True;
    cmb_sFloorCode3.Enabled := True;
    cmb_sAreaCode3.Enabled := True;
    chk_DoorReg.Enabled := True;
    ed_DoorViewSeq.Enabled := True;
    btnDoorPosition.Enabled := True;

    //Alarm Form Enable
    sg_AlarmCode.Enabled := False;
    cmb_sMCUCode4.Enabled := True;
    cmb_sECUCode4.Enabled := True;
    ed_AlarmNo4.Enabled := True;
    ed_AlarmName4.Enabled := True;
    cmb_sBuildingCode4.Enabled := True;
    cmb_sFloorCode4.Enabled := True;
    cmb_sAreaCode4.Enabled := True;
    ed_AlarmViewSeq.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;

    //Zone Form Enable
    sg_ZoneCode.Enabled := False;
    cmb_sAlarmCode6.Enabled := True;
    ed_ZoneNo6.Enabled := True;
    ed_ZoneName.Enabled := True;
    cmb_sBuildingCode6.Enabled := True;
    cmb_sFloorCode6.Enabled := True;
    cmb_sAreaCode6.Enabled := True;
    chk_ZoneReg.Enabled := True;
    btnZonePosition.Enabled := True;

    //Food Form Enable
    sg_FoodCode.Enabled := False;
    cmb_sMCUCode5.Enabled := True;
    cmb_sECUCode5.Enabled := True;
    ed_sFoodNo.Enabled := True;
    ed_sFoodName.Enabled := True;
    cmb_sBuildingCode5.Enabled := True;
    cmb_sFloorCode5.Enabled := True;
    cmb_sAreaCode5.Enabled := True;
    chk_FoodReg.Enabled := True;
    ed_FoodAmtPer.Enabled := True;
    btnFoodPosition.Enabled := True;
  end else if UpperCase(aState) = 'UPDATE' then
  begin
    //MCU Form Enable
    sg_ECUCode.Enabled := False;
    sg_MCUCode.Enabled := False;
    ed_MCUID.Enabled := True;
    ed_MCUIP.Enabled := True;
    ed_MCUPORT.Enabled := True;
    ed_MCUNAME.Enabled := True;
    se_McuSeq.Enabled := True;
    ed_systemid.Enabled := True;
    ed_muxid.Enabled := True;
    ed_decoderid.Enabled := True;
    cmb_sBuildingCode1.Enabled := True;
    cmb_sFloorCode1.Enabled := True;
    cmb_sAreaCode1.Enabled := True;
    chk_MCUReg.Enabled := True;
    gb_Device.Enabled := True;
    btnMCUPosition.Enabled := True;
    chk_EcuName.Enabled := True;
    chk_DoorName.Enabled := True;
    chk_PtName.Enabled := True;
    cmb_CardType.Enabled := True;
    cmb_SockType.Enabled := True;
    cmb_McuArmAreaUse.Enabled := True;

    //ECU Form Enable
    cmb_sMCUCode2.Enabled := False;
    ed_Ecuno.Enabled := True;
    ed_EcuName.Enabled := True;
    cmb_sBuildingCode2.Enabled := True;
    cmb_sFloorCode2.Enabled := True;
    cmb_sAreaCode2.Enabled := True;
    chk_ECUReg.Enabled := True;
    gb_Device2.Enabled := True;
    btnECUPosition.Enabled := True;
    chk_ECUDoorName.Enabled := True;
    chk_ECUPtName.Enabled := True;
    cmb_EcuArmAreaUse.Enabled := True;

    //Door Form Enable
    sg_DoorCode.Enabled := False;
    cmb_sMCUCode3.Enabled := False;
    cmb_sECUCode3.Enabled := False;
    ed_sDoorNo.Enabled := False;
    ed_sDoorName.Enabled := True;
    cmb_sBuildingCode3.Enabled := True;
    cmb_sFloorCode3.Enabled := True;
    cmb_sAreaCode3.Enabled := True;
    chk_DoorReg.Enabled := True;
    ed_DoorViewSeq.Enabled := True;
    btnDoorPosition.Enabled := True;

    //Alarm Form Enable
    sg_AlarmCode.Enabled := False;
    cmb_sMCUCode4.Enabled := False;
    cmb_sECUCode4.Enabled := False;
    ed_AlarmNo4.Enabled := False;
    ed_AlarmName4.Enabled := True;
    cmb_sBuildingCode4.Enabled := True;
    cmb_sFloorCode4.Enabled := True;
    cmb_sAreaCode4.Enabled := True;
    ed_AlarmViewSeq.Enabled := True;
    chk_AlarmReg.Enabled := True;
    btnAlarmPosition.Enabled := True;

    //Zone Form Enable
    sg_ZoneCode.Enabled := False;
    cmb_sAlarmCode6.Enabled := False;
    ed_ZoneNo6.Enabled := False;
    ed_ZoneName.Enabled := True;
    cmb_sBuildingCode6.Enabled := True;
    cmb_sFloorCode6.Enabled := True;
    cmb_sAreaCode6.Enabled := True;
    chk_ZoneReg.Enabled := True;
    btnZonePosition.Enabled := True;

    //Food Form Enable
    sg_FoodCode.Enabled := False;
    cmb_sMCUCode5.Enabled := False;
    cmb_sECUCode5.Enabled := False;
    ed_sFoodNo.Enabled := False;
    ed_sFoodName.Enabled := True;
    cmb_sBuildingCode5.Enabled := True;
    cmb_sFloorCode5.Enabled := True;
    cmb_sAreaCode5.Enabled := True;
    chk_FoodReg.Enabled := True;
    ed_FoodAmtPer.Enabled := True;
    btnFoodPosition.Enabled := True;
  end else if UpperCase(aState) = 'SEARCH' then
  begin
    //MCU Form Enable
    sg_MCUCode.Enabled := True;
    ed_MCUID.Enabled := False;
    ed_MCUIP.Enabled := False;
    ed_MCUPORT.Enabled := False;
    ed_MCUNAME.Enabled := False;
    se_McuSeq.Enabled := False;
    ed_systemid.Enabled := False;
    ed_muxid.Enabled := False;
    ed_decoderid.Enabled := False;
    cmb_sBuildingCode1.Enabled := False;
    cmb_sFloorCode1.Enabled := False;
    cmb_sAreaCode1.Enabled := False;
    chk_MCUReg.Enabled := False;
    gb_Device.Enabled := False;
    btnMCUPosition.Enabled := False;
    chk_EcuName.Enabled := False;
    chk_DoorName.Enabled := False;
    chk_PtName.Enabled := False;
    cmb_CardType.Enabled := False;
    cmb_SockType.Enabled := False;
    cmb_McuArmAreaUse.Enabled := False;

    //ECU Form Enable
    sg_ECUCode.Enabled := True;
    cmb_sMCUCode2.Enabled := False;
    ed_Ecuno.Enabled := False;
    ed_EcuName.Enabled := False;
    cmb_sBuildingCode2.Enabled := False;
    cmb_sFloorCode2.Enabled := False;
    cmb_sAreaCode2.Enabled := False;
    chk_ECUReg.Enabled := False;
    gb_Device2.Enabled := False;
    btnECUPosition.Enabled := False;
    chk_ECUDoorName.Enabled := False;
    chk_ECUPtName.Enabled := False;
    cmb_EcuArmAreaUse.Enabled := False;

    //Door Form Enable
    sg_DoorCode.Enabled := True;
    cmb_sMCUCode3.Enabled := False;
    cmb_sECUCode3.Enabled := False;
    ed_sDoorNo.Enabled := False;
    ed_sDoorName.Enabled := False;
    cmb_sBuildingCode3.Enabled := False;
    cmb_sFloorCode3.Enabled := False;
    cmb_sAreaCode3.Enabled := False;
    chk_DoorReg.Enabled := False;
    ed_DoorViewSeq.Enabled := False;
    btnDoorPosition.Enabled := False;

    //Alarm Form Enable
    sg_AlarmCode.Enabled := True;
    cmb_sMCUCode4.Enabled := False;
    cmb_sECUCode4.Enabled := False;
    ed_AlarmNo4.Enabled := False;
    ed_AlarmName4.Enabled := False;
    cmb_sBuildingCode4.Enabled := False;
    cmb_sFloorCode4.Enabled := False;
    cmb_sAreaCode4.Enabled := False;
    ed_AlarmViewSeq.Enabled := False;
    chk_AlarmReg.Enabled := False;
    btnAlarmPosition.Enabled := False;

    //Zone Form Enable
    sg_ZoneCode.Enabled := True;
    cmb_sAlarmCode6.Enabled := False;
    ed_ZoneNo6.Enabled := False;
    ed_ZoneName.Enabled := False;
    cmb_sBuildingCode6.Enabled := False;
    cmb_sFloorCode6.Enabled := False;
    cmb_sAreaCode6.Enabled := False;
    chk_ZoneReg.Enabled := False;
    btnZonePosition.Enabled := False;

    //Food Form Enable
    sg_FoodCode.Enabled := True;
    cmb_sMCUCode5.Enabled := False;
    cmb_sECUCode5.Enabled := False;
    ed_sFoodNo.Enabled := False;
    ed_sFoodName.Enabled := False;
    cmb_sBuildingCode5.Enabled := False;
    cmb_sFloorCode5.Enabled := False;
    cmb_sAreaCode5.Enabled := False;
    chk_FoodReg.Enabled := False;
    ed_FoodAmtPer.Enabled := False;
    btnFoodPosition.Enabled := False;
  end;

end;

procedure TfmMDIDeviceCode.btn_CancelClick(Sender: TObject);
var
  stSearchEcuID : string;
  stSearchDoorID : string;
  stSearchFoodID : string;
begin
  with PageControl1 do
  begin
    if ActivePage.Name = 'MCUTab' then    //MCU 관리
    begin
      MCUSearch('000', '000','000',ed_NodeNo.Text,L_nTopRow);
    end  else if ActivePage.Name = 'ECUTab' then //ECU 관리
    begin
      if ed_NodeNo2.Text = '' then ed_NodeNo2.Text := '0';
      stSearchEcuID := FillZeroNumber(strtoint(ed_NodeNo2.Text),3) + FillZeroNumber(ed_Ecuno.Value,2);
      ECUSearch('000', '000','000','000',stSearchEcuID,L_nTopRow);
    end else if ActivePage.Name = 'DoorTab' then //DOOR 관리
    begin
      if ed_NodeNo3.Text = '' then ed_NodeNo3.Text := '0';
      if cmb_sECUCode3.itemIndex < 0 then cmb_sECUCode3.itemIndex := 0;
      stSearchDoorID := FillZeroNumber(strtoint(ed_NodeNo3.Text),3) +
                        copy(sEcuCodeList.Strings[cmb_sECUCode3.itemIndex],4,2) +
                        inttostr(ed_sDoorNo.Value);
      DoorSearch('000', '',stSearchDoorID)
    end else if ActivePage.Name = 'AlarmTab' then   //방범관리
    begin
      AlarmSearch('000',inttostr(ed_AlarmNo4.Value));
    end else if ActivePage.Name = 'ZoneTab' then   //존관리
    begin
      if cmb_AlarmCode6.itemIndex < 0 then cmb_AlarmCode6.itemIndex := 0;
      ZoneSearch('000',AlarmCodeList.Strings[cmb_AlarmCode6.itemIndex]);
    end else if ActivePage.Name = 'FoodTab' then //Food 관리
    begin
      if ed_NodeNo5.Text = '' then ed_NodeNo5.Text := '0';
      if cmb_sECUCode5.itemIndex < 0 then cmb_sECUCode5.itemIndex := 0;
      stSearchFoodID := FillZeroNumber(strtoint(ed_NodeNo5.Text),3) +
                        copy(sEcuCodeList.Strings[cmb_sECUCode5.itemIndex],4,2) +
                        inttostr(ed_sFoodNo.Value);
      FoodSearch('000', '',stSearchFoodID);
    end;
  end;

end;

function TfmMDIDeviceCode.CreateCardReader(aNodeNo, aEcuID: string): Boolean;
var
  i : integer;
begin
  for i := 1 to CARDREADERCOUNT do
  begin
    if Not DupCheckCardReader(aNodeNo,aEcuID,inttostr(i)) then
      InsertIntoTB_Reader(aNodeNo,aEcuID,inttostr(i));
  end;

end;

function TfmMDIDeviceCode.DupCheckCardReader(aNodeNo, aEcuID,
  aReaderNo: string): Boolean;
var
  stSql : string;
begin
  result := false;
  stSql := ' select * from TB_READER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aECUID + ''' ';
  stSql := stSql + ' AND RE_READERNO = ''' + aReaderNo + ''' ';
  with AdoQuery do
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
end;

function TfmMDIDeviceCode.InsertIntoTB_Reader(aNodeNo, aEcuID,
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

procedure TfmMDIDeviceCode.FormShow(Sender: TObject);
begin
  if Not IsMaster then
  begin
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
  end;

end;

function TfmMDIDeviceCode.UpdateTB_NODE_RCV(aNodeNo,
  aSendAck: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE set ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + ''' ';
  stSql := stSql + ' WHERE GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo));
  stSql := stSql + ' AND AC_ECUID = ''00'' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.DeleteReader(aNodeNo, aECUID: string): Boolean;
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

function TfmMDIDeviceCode.DupCheckECUName(aNodeNo, aEcuId,
  aEcuName: string): Boolean;
var
  stSql :string;
  TempAdoQuery : TADOQuery;
begin
  Result := False;
  stSql := 'select * from TB_ACCESSDEVICE ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_DEVICENAME = ''' + aEcuName + ''' ';

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

      if RecordCount > 0 then
      begin
        if (FindField('AC_NODENO').Asinteger <> strtoint(aNodeNo) ) or
           (FindField('AC_ECUID').AsString <> aEcuId ) then
            Result := True;
      end;

    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmMDIDeviceCode.UpdateTB_ACCESSDEVICESendAck(aNodeNo, aEcuID,
  aSendAck: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'SEND_ACK = ''' + aSendAck + '''  ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + inttostr(strtoint(aNodeNo)) ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.cmb_CardReaderTypeChange(Sender: TObject);
begin
  chk_McuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.cmb_CardReaderType2Click(Sender: TObject);
begin
  chk_EcuUpdate.Checked := True;
end;

function TfmMDIDeviceCode.UpdateTB_ACCESSDEVICEInfo(aNodeNo,aMcuID, aEcuID, aMcuIp,
  aMcuPort, aName, aBuildingCode, aFloorCode, aAreaCode, aRegState,
  aTotWidth, aTotHeight, aCurX, aCurY,aSystemId,aMuxId,aDecoderID,aTimeCodeType,aCardType,aSockType,aArmAreaUse: string): Boolean;
var
  stSql :string;
begin
  result := False;

  stSql := ' Update TB_ACCESSDEVICE  Set ';
  stSql := stSql + 'AC_MCUIP = ''' + aMcuIp + ''',';
  stSql := stSql + 'AC_MCUPORT = ''' + aMcuPort + ''',';
  stSql := stSql + 'AC_MCUID = ''' + aMcuID + ''',';
  stSql := stSql + 'AC_DEVICENAME = ''' + aName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''',';
  stSql := stSql + 'AC_LOCATEUSE = ''' + aRegState + ''',';
  stSql := stSql + 'AC_TOTWIDTH =' + aTotWidth + ',';
  stSql := stSql + 'AC_TOTHEIGHT = ' + aTotHeight + ',';
  stSql := stSql + 'AC_CURX = ' + aCurX + ',';
  stSql := stSql + 'AC_CURY = ' + aCurY + ', ';
  stSql := stSql + 'AC_UPDATE = ''Y'', ';
  stSql := stSql + 'AC_LINKUSID = ''' + aSystemId + ''', ';
  stSql := stSql + 'AC_MUXID = ''' + aMuxId + ''', ';
  stSql := stSql + 'AC_DECODERID = ''' + aDecoderID + ''', ';
  stSql := stSql + 'AC_TIMETYPE = ''' + aTimeCodeType + ''', ';
  stSql := stSql + 'AC_CARDBYTE = ''' + aCardType + ''' ';
  if aSockType <> '' then stSql := stSql + ',AC_SOCKTYPE = ' + aSockType + ' ';
  if aArmAreaUse <> '' then stSql := stSql + ',AC_ARMAREAUSE = ''' + aArmAreaUse + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmMDIDeviceCode.ed_EcunoChange(Sender: TObject);
begin
  chk_EcuUpdate.Checked := True;
end;

procedure TfmMDIDeviceCode.cmb_sAreaCode1Change(Sender: TObject);
begin
  if cmb_sAreaCode1.itemindex < 0 then
  begin
    cmb_sAreaCode1.Text := '';
    Exit;
  End;

end;


function TfmMDIDeviceCode.InsertAlarmDevice(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse: string;bUpdate:Boolean=False): Boolean;
begin
  //알람 목록에 있는지 체크 하여 인서트 혹은 업데이트
  if DupCheckAlarm(aNodeNo,aEcuID) then
  begin
    result := UpdateARMAREADefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse,bUpdate);
    if Not bUpdate then Exit;
    result := UpdateAlarmDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,bUpdate);
    result := UpdateZoneDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,bUpdate);
    Exit;
  end else
  begin
    result := InsertAlarmDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode);
    result := InsertARMAREADefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse);
    result := InsertZoneDefaultInfo(aNodeNo,aEcuID,aName,aBuildingCode, aFloorCode, aAreaCode);
  end;
  //존 체크 하여 존 입력
end;

function TfmMDIDeviceCode.UpdateECUName(aNodeNo, aMcuName: string): Boolean;
var
  stSql : string;
begin
  //if Application.MessageBox(PChar('전체 로컬컨트롤러 명칭을 메인컨트롤러 명칭으로 변경 하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
  if chk_EcuName.Checked then
  begin
  //디폴트값인 확장기 명칭 변경
    if DBTYPE = 'MSSQL' then stSql := ' Update TB_ACCESSDEVICE set AC_DEVICENAME = ''' + aMcuName + ''' + ''_'' + AC_ECUID '
    else  stSql := ' Update TB_ACCESSDEVICE set AC_DEVICENAME = ''' + aMcuName + ''' || ''_'' || AC_ECUID ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( AC_UPDATE is null or AC_UPDATE = ''N'' ) ';
    result := DataModule1.ProcessExecSQL(stSql);
  end;

  //if Application.MessageBox(PChar('전체 출입문 명칭을 메인컨트롤러 명칭으로 변경 하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
  if chk_DoorName.Checked then
  begin
  //디폴트값인 확장기의 출입문 도어 명칭 변경
    if DBTYPE = 'MSSQL' then stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aMcuName + ''' + ''_'' + AC_ECUID + ''_'' + DO_DOORNO + ''번 출입문'' '
    else  stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aMcuName + ''' || ''_'' || AC_ECUID || ''_'' || DO_DOORNO || ''번 출입문'' ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( DO_UPDATE is null or DO_UPDATE = ''N'' ) ';
    result := DataModule1.ProcessExecSQL(stSql);
  end;

  //if Application.MessageBox(PChar('전체 방범구역 명칭을 메인컨트롤러 명칭으로 변경 하시겠습니까?'),'정보',MB_OKCANCEL) = IDOK then
  if chk_PtName.Checked then
  begin
  //디폴트값인 방범구역 명칭 변경
    if DBTYPE = 'MSSQL' then stSql := ' Update TB_ALARMDEVICE set AL_ZONENAME = ''' + aMcuName + ''' + ''_'' + AC_ECUID '
    else  stSql := ' Update TB_ALARMDEVICE set AL_ZONENAME = ''' + aMcuName + ''' || ''_'' || AC_ECUID ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( AL_UPDATE is null or AL_UPDATE = ''N'' ) ';
    result := DataModule1.ProcessExecSQL(stSql);
  //디폴트값인 존의 존 명칭 변경
    if DBTYPE = 'MSSQL' then stSql := ' Update TB_ZONEDEVICE set AL_ZONENAME = ''' + aMcuName + ''' + ''_'' + AC_ECUID + ''-'' + AL_ZONENUM '
    else  stSql := ' Update TB_ZONEDEVICE set AL_ZONENAME = ''' + aMcuName + ''' || ''_'' || AC_ECUID || ''-'' || AL_ZONENUM ';
    stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
    stSql := stSql + ' AND ( AL_UPDATE is null or AL_UPDATE = ''N'' ) ';
    result := DataModule1.ProcessExecSQL(stSql);
  end;
end;

function TfmMDIDeviceCode.UpdateDoorName(aNodeNo, aEcuID,
  aEcuName: string;aUpdate:Boolean=False): Boolean;
var
  stSql : string;
begin
  //해당 확장기의 출입문이 수정사항이 없으면 디폴트값 출입문 명칭을 변경 하자
  if DBTYPE = 'MSSQL' then stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aEcuName + ''' + ''_'' + AC_ECUID + ''_'' + DO_DOORNO + ''번 출입문'' '
  else  stSql := ' Update TB_DOOR set DO_DOORNONAME = ''' + aEcuName + ''' || ''_'' || AC_ECUID || ''_'' || DO_DOORNO || ''번 출입문'' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo + ' ';
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if Not aUpdate then stSql := stSql + ' AND ( DO_UPDATE is null or DO_UPDATE = ''N'' ) ';
  result := DataModule1.ProcessExecSQL(stSql);
end;

function TfmMDIDeviceCode.DeleteAlarmDevice(aNodeNo, aEcuID: string): Boolean;
begin
  //해당방범기기 삭제
  result := DeleteECUAlarmAll(aNodeNo,aEcuID);
  //해당 방범기기의 존정보 삭제
  result := DeleteECUZoneAll(aNodeNo,aEcuID);

end;

function TfmMDIDeviceCode.DeleteECUZoneAll(aNodeNo, aECUID: string): Boolean;
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

function TfmMDIDeviceCode.InsertZoneDefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode: string): Boolean;
var
  i : integer;
begin
  for i := 1 to ZONECOUNT do
  begin
    InsertTB_ZONEDEVICE(aNodeNo,aEcuID,inttostr(i),aName + '-' + inttostr(i),'N',aBuildingCode, aFloorCode, aAreaCode,'0','0','0','0');
  end;

end;

function TfmMDIDeviceCode.InsertAlarmDefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode: string): Boolean;
begin
  result := InsertTB_ALARMDEVICE(aNodeNo,
                                       aEcuID,
                                       //inttostr(ed_AlarmNo4.Value),
                                       aName,
                                       aBuildingCode,
                                       aFloorCode,
                                       aAreaCode,
                                       'N',
                                       '0',
                                       '0',
                                       '0',
                                       '0',
                                       '1'
                                       );
end;

function TfmMDIDeviceCode.UpdateAlarmDefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode: string;aUpdate:Boolean = False): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ALARMDEVICE  Set ';
  stSql := stSql + 'AL_ZONENAME = ''' + aName + ''',';
  stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
  stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
  stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''' ';
  stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
  stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
  if Not aUpdate then stSql := stSql + ' AND (AL_UPDATE IS NULL OR AL_UPDATE = ''N'' ) ';

  result := DataModule1.ProcessExecSQL(stSql);

end;

function TfmMDIDeviceCode.UpdateZoneDefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode: string;aUpdate:Boolean=False): Boolean;
var
  i : integer;
  stSql : string;
begin
  for i := 1 to ZONECOUNT do
  begin
    stSql := ' UPDATE TB_ZoneDevice SET ';
    stSql := stSql + ' AL_ZONENAME = ''' + aName + '-' + inttostr(i) + ''',';
    stSql := stSql + ' LO_DONGCODE = ''' + aBuildingCode + ''',';
    stSql := stSql + ' LO_FLOORCODE = ''' + aFloorCode + ''',';
    stSql := stSql + ' LO_AREACODE = ''' + aAreaCode + ''' ';
    stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
    stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
    stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
    stSql := stSql + ' AND AL_ZONENUM = ''' + inttostr(i) + ''' ';
    if Not aUpdate then stSql := stSql + ' AND (AL_UPDATE IS NULL OR AL_UPDATE = ''N'' ) ';

    result :=  DataModule1.ProcessExecSQL(stSql);
  end;

end;

procedure TfmMDIDeviceCode.ed_EcuNameEnter(Sender: TObject);
var
  TIMC: HIMC;
  dwSentence : DWORD; dwConversion : DWORD;
begin
  TIMC := ImmGetContext(TEdit(Sender).Handle);
  ImmGetConversionStatus(TIMC, dwConversion, dwSentence);
  ImmSetConversionStatus(TIMC, IME_CMODE_NATIVE, dwSentence);
  ImmReleaseContext(TEdit(Sender).Handle, TIMC);

end;
 
procedure TfmMDIDeviceCode.FormResize(Sender: TObject);
var
  nWidth : integer;
  nBlock : integer;
  nLeft : integer;
  nCenter : integer;
begin
  nWidth := GroupBox8.Width;
  nBlock := (nWidth - 200) div 6; //양쪽으로 50 씩 띄우자

  nCenter := nBlock div 2;
  nLeft := nCenter - (btn_Insert.Width div 2);

  btn_Insert.Left := 100 + nLeft;
  btn_Update.Left := 100 + nBlock + nLeft;
  btn_Save.Left := 100 + (nBlock * 2) + nLeft;
  btn_Delete.Left := 100 + (nBlock * 3) + nLeft;
  btn_Cancel.Left := 100 + (nBlock * 4) + nLeft;
  btn_Close.Left := 100 + (nBlock * 5) + nLeft;

end;

procedure TfmMDIDeviceCode.chk_ECUJavaraClick(Sender: TObject);
begin
  inherited;
  if chk_ECUJavara.Checked then chk_EcuFd.Checked := False;
  chk_EcuUpdate.Checked := True;

end;

procedure TfmMDIDeviceCode.chk_MCUJavaraClick(Sender: TObject);
begin
  inherited;
  if chk_MCUJavara.Checked then chk_McuFd.Checked := False;
  chk_McuUpdate.Checked := True;

end;

function TfmMDIDeviceCode.UpdateARMAREADefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse: string;aUpdate:Boolean): Boolean;
var
  i : integer;
  stUse : string;
  stArmAreaName : string;
  stSql : string;
  stArmAreaUse : string;
begin
  for i := 0 to con_nFIXMAXAREANO do
  begin
    if i = 0 then
    begin
      if aArmAreaUse = 'Y' then stArmAreaUse := 'N'
      else stArmAreaUse := 'Y';
      stArmAreaName := aName;
    end else
    begin
      if aArmAreaUse = 'Y' then stArmAreaUse := 'Y'
      else stArmAreaUse := 'N';
      stArmAreaName := aName + '_' + inttostr(i) + '구역';
    end;
    if aUpdate then
    begin
      stSql := ' Update TB_ARMAREA  Set ';
      stSql := stSql + 'AR_NAME = ''' + stArmAreaName + ''',';
      stSql := stSql + 'LO_DONGCODE = ''' + aBuildingCode + ''',';
      stSql := stSql + 'LO_FLOORCODE = ''' + aFloorCode + ''',';
      stSql := stSql + 'LO_AREACODE = ''' + aAreaCode + ''' ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
      stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
      stSql := stSql + ' AND AR_AREANO = ''' + '0' + inttostr(i) + ''' ';
      stSql := stSql + ' AND (AR_UPDATE IS NULL OR AR_UPDATE = ''N'' ) ';

      result := DataModule1.ProcessExecSQL(stSql);
    end;

    if aArmAreaUse <> '' then
    begin
      stSql := ' Update TB_ARMAREA  Set ';
      stSql := stSql + 'AR_USE = ''' + stArmAreaUse + ''' ';
      stSql := stSql + ' where GROUP_CODE = ''' + GROUPCODE + ''' ';
      stSql := stSql + ' AND AC_NODENO = ' + aNodeNo ;
      stSql := stSql + ' AND AC_ECUID = ''' + aEcuID + ''' ';
      stSql := stSql + ' AND AR_AREANO = ''' + '0' + inttostr(i) + ''' ';
      result := DataModule1.ProcessExecSQL(stSql);
    end;
  end;
end;

function TfmMDIDeviceCode.InsertARMAREADefaultInfo(aNodeNo, aEcuID, aName,
  aBuildingCode, aFloorCode, aAreaCode,aArmAreaUse: string): Boolean;
var
  i : integer;
  stUse : string;
  stArmAreaName : string;
  stSql : string;
begin
  for i := 0 to con_nFIXMAXAREANO do
  begin
    if i = 0 then
    begin
      if aArmAreaUse = 'Y' then stUse := 'N'
      else stUse := 'Y';
      stArmAreaName := aName;
    end else
    begin
      if aArmAreaUse = 'Y' then stUse := 'Y'
      else stUse := 'N';
      stArmAreaName := aName + '_' + inttostr(i) + '구역';
    end;
    stSql := CommonSql.InsertIntoTB_ARMAREA(aNodeNo,
                                       aEcuID,
                                       inttostr(i),
                                       stArmAreaName,
                                       stUse,
                                       '',
                                       '1',
                                       'N',
                                       '0',
                                       '0',
                                       '0',
                                       '0',
                                       aBuildingCode,
                                       aFloorCode,
                                       aAreaCode
                                       );

    DataModule1.ProcessExecSQL(stSql);
  end;
end;

procedure TfmMDIDeviceCode.cmb_SockTypeChange(Sender: TObject);
begin
  inherited;
    if cmb_SockType.ItemIndex = 0 then
    begin
      lb_McuIP.Visible := True;
      ed_MCUIP.Visible := True;
      lb_McuID.Visible := False;
      ed_MCUID.Visible := False;
    end else
    begin
      lb_McuIP.Visible := False;
      ed_MCUIP.Visible := False;
      lb_McuID.Visible := True;
      ed_MCUID.Visible := True;
    end;
end;


initialization
  RegisterClass(TfmMDIDeviceCode);
Finalization
  UnRegisterClass(TfmMDIDeviceCode);

end.
