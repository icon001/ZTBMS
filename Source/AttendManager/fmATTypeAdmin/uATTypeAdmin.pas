unit uATTypeAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSubForm, CommandArray, Buttons, ExtCtrls, ComCtrls, StdCtrls,
  Grids, BaseGrid, AdvGrid, DB, ADODB,ActiveX, AdvObj;

type
  TfmATTypeAdmin = class(TfmASubForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btn_Insert: TSpeedButton;
    btn_Update: TSpeedButton;
    btn_Save: TSpeedButton;
    btn_Delete: TSpeedButton;
    btn_Cancel: TSpeedButton;
    btn_Close: TSpeedButton;
    Panel11: TPanel;
    ADOQuery: TADOQuery;
    Panel9: TPanel;
    Panel3: TPanel;
    sg_ATTypeCode: TAdvStringGrid;
    Panel4: TPanel;
    Panel5: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    ed_ATtypeCode: TEdit;
    ed_atTypeName: TEdit;
    PageControl1: TPageControl;
    WeekTab: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    ed_WEarlyAdd: TEdit;
    ed_WNormalAdd: TEdit;
    ed_WJigakAdd: TEdit;
    ed_WOutAdd: TEdit;
    ed_WExtendAdd: TEdit;
    ed_WNightAdd: TEdit;
    Panel6: TPanel;
    Label93: TLabel;
    ed_WEarlyHH: TEdit;
    ed_WEarlyMM: TEdit;
    ed_WNormalHH: TEdit;
    ed_WNormalMM: TEdit;
    ed_WJigakHH: TEdit;
    ed_WJigakMM: TEdit;
    ed_WOutHH: TEdit;
    ed_WOutMM: TEdit;
    ed_WExtendHH: TEdit;
    ed_WExtendMM: TEdit;
    ed_WNightMM: TEdit;
    ed_WNightHH: TEdit;
    SaturdayTab: TTabSheet;
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
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    GroupBox2: TGroupBox;
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
    ed_SEarlyAdd: TEdit;
    ed_SNormalAdd: TEdit;
    ed_SJigakAdd: TEdit;
    ed_SOutAdd: TEdit;
    ed_SExtendAdd: TEdit;
    ed_SNightAdd: TEdit;
    Panel7: TPanel;
    Label94: TLabel;
    ed_SEarlyHH: TEdit;
    ed_SEarlyMM: TEdit;
    ed_SNormalMM: TEdit;
    ed_SNormalHH: TEdit;
    ed_SJigakHH: TEdit;
    ed_SJigakMM: TEdit;
    ed_SOutMM: TEdit;
    ed_SOutHH: TEdit;
    ed_SExtendHH: TEdit;
    ed_SExtendMM: TEdit;
    ed_SNightMM: TEdit;
    ed_SNightHH: TEdit;
    HolidayTab: TTabSheet;
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
    Label87: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label91: TLabel;
    Label92: TLabel;
    GroupBox3: TGroupBox;
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
    ed_HEarlyAdd: TEdit;
    ed_HNormalAdd: TEdit;
    ed_HJigakAdd: TEdit;
    ed_HOutAdd: TEdit;
    ed_HExtendAdd: TEdit;
    ed_HNightAdd: TEdit;
    Panel8: TPanel;
    Label95: TLabel;
    ed_HEarlyHH: TEdit;
    ed_HEarlyMM: TEdit;
    ed_HNormalMM: TEdit;
    ed_HNormalHH: TEdit;
    ed_HJigakHH: TEdit;
    ed_HJigakMM: TEdit;
    ed_HOutMM: TEdit;
    ed_HOutHH: TEdit;
    ed_HExtendHH: TEdit;
    ed_HExtendMM: TEdit;
    ed_HNightMM: TEdit;
    ed_HNightHH: TEdit;
    Panel10: TPanel;
    GroupBox5: TGroupBox;
    Panel12: TPanel;
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
    ed_BwExtendAdd: TEdit;
    ed_BwNightAdd: TEdit;
    ed_BwEarlyAdd: TEdit;
    ed_BsEarlyAdd: TEdit;
    ed_BsExtendAdd: TEdit;
    ed_BsNightAdd: TEdit;
    ed_BhNormalAdd: TEdit;
    ed_BhExtendAdd: TEdit;
    ed_BhNightAdd: TEdit;
    rg_atTypePay: TRadioGroup;
    Panel13: TPanel;
    Label96: TLabel;
    ed_WeekTime: TEdit;
    Label97: TLabel;
    Label98: TLabel;
    ed_MonthLastDay: TEdit;
    Label99: TLabel;
    btn_AttendConfig: TSpeedButton;
    rg_atType: TRadioGroup;
    chk_AutoAtCode: TCheckBox;
    rg_atType1: TRadioGroup;
    lb_WorkerType: TLabel;
    cmb_WorkerType: TComboBox;
    btn_WorkerType: TButton;
    ADOTemp: TADOQuery;
    Label118: TLabel;
    ed_OutRangeHH: TEdit;
    Label119: TLabel;
    ed_OutRangeMM: TEdit;
    Label120: TLabel;
    Label121: TLabel;
    ed_sOutRangeHH: TEdit;
    Label122: TLabel;
    ed_sOutRangeMM: TEdit;
    Label123: TLabel;
    Label124: TLabel;
    ed_hOutRangeHH: TEdit;
    Label125: TLabel;
    ed_hOutRangeMM: TEdit;
    Label126: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure sg_ATTypeCodeClick(Sender: TObject);
    procedure btn_InsertClick(Sender: TObject);
    procedure btn_UpdateClick(Sender: TObject);
    procedure btn_CancelClick(Sender: TObject);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure btn_AttendConfigClick(Sender: TObject);
    procedure rg_atTypePayClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed_WeekTimeExit(Sender: TObject);
    procedure ed_MonthLastDayExit(Sender: TObject);
    procedure ed_BwEarlyAddExit(Sender: TObject);
    procedure ed_BwExtendAddExit(Sender: TObject);
    procedure ed_BwNightAddExit(Sender: TObject);
    procedure ed_BsEarlyAddExit(Sender: TObject);
    procedure ed_BsExtendAddExit(Sender: TObject);
    procedure ed_BsNightAddExit(Sender: TObject);
    procedure ed_BhNormalAddExit(Sender: TObject);
    procedure ed_BhExtendAddExit(Sender: TObject);
    procedure ed_BhNightAddExit(Sender: TObject);
    procedure rg_atTypeClick(Sender: TObject);
    procedure ed_ATtypeCodeChange(Sender: TObject);
    procedure chk_AutoAtCodeClick(Sender: TObject);
    procedure rg_atType1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_WorkerTypeClick(Sender: TObject);
  private
    State :String;
    bATTypePay : Boolean;
    bSaturDay :Boolean;
    ChangATType : integer; //교대근무타입 0:고정근무타입,1:사원별근무타입,2:교대근무타입,혼합타입
    WorkTypeCode : TStringList; //상시근무자 코드 타입
    { Private declarations }
    procedure FormClear;
    procedure FormEnable(aState:string);
    procedure ButtonEnable(aState:string);
    procedure ATtypeCodeSearch(aCode:string);
    procedure GetATTypeConfig;

    Function FormCheck:Boolean;

    Function DeleteTB_ATCode(aCode:string):Boolean;
    Function InsertTB_ATCODE(aATtypeCode,
                               aAtTypeName,
                               aWEarlyTime,
                               aWNormalTime,
                               aWJiGakTime,
                               aWOutTime,
                               aWExtendTime,
                               aWNightTime,
                               aSEarlyTime,
                               aSNormalTime,
                               aSJiGakTime,
                               aSOutTime,
                               aSExtendTime,
                               aSNightTime,
                               aHEarlyTime,
                               aHNormalTime,
                               aHJiGakTime,
                               aHOutTime,
                               aHExtendTime,
                               aHNightTime,
                               aWEarlyAdd,
                               aWNormalAdd,
                               aWJigakAdd,
                               aWOutAdd,
                               aWExtendAdd,
                               aWNightAdd,
                               aSEarlyAdd,
                               aSNormalAdd,
                               aSJigakAdd,
                               aSOutAdd,
                               aSExtendAdd,
                               aSNightAdd,
                               aHEarlyAdd,
                               aHNormalAdd,
                               aHJigakAdd,
                               aHOutAdd,
                               aHExtendAdd,
                               aHNightAdd,
                               aWorkCode,
                               aWOutRange,
                               aSOutRange,
                               aHOutRange:string
                               ):Boolean;
    Function UpdateTB_ATCODE(aATtypeCode,
                               aAtTypeName,
                               aWEarlyTime,
                               aWNormalTime,
                               aWJiGakTime,
                               aWOutTime,
                               aWExtendTime,
                               aWNightTime,
                               aSEarlyTime,
                               aSNormalTime,
                               aSJiGakTime,
                               aSOutTime,
                               aSExtendTime,
                               aSNightTime,
                               aHEarlyTime,
                               aHNormalTime,
                               aHJiGakTime,
                               aHOutTime,
                               aHExtendTime,
                               aHNightTime,
                               aWEarlyAdd,
                               aWNormalAdd,
                               aWJigakAdd,
                               aWOutAdd,
                               aWExtendAdd,
                               aWNightAdd,
                               aSEarlyAdd,
                               aSNormalAdd,
                               aSJigakAdd,
                               aSOutAdd,
                               aSExtendAdd,
                               aSNightAdd,
                               aHEarlyAdd,
                               aHNormalAdd,
                               aHJigakAdd,
                               aHOutAdd,
                               aHExtendAdd,
                               aHNightAdd,
                               aWorkCode,
                               aWOutRange,
                               aSOutRange,
                               aHOutRange:string
                               ):Boolean;

    Function GetAutoATCode:string;
    procedure LoadWorkType ;
  public
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string):Boolean;
    procedure SetPayConfig;
    { Public declarations }
  end;

var
  fmATTypeAdmin: TfmATTypeAdmin;

implementation

uses
  uDataModule1,
  uLomosUtil, uCommonSql, uWorkCodeType;
{$R *.dfm}

procedure TfmATTypeAdmin.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmATTypeAdmin.ButtonEnable(aState: string);
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
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
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
    if IsInsertGrade then btn_Insert.Enabled := True
    else btn_Insert.Enabled := False;
    if IsUpdateGrade then btn_Update.Enabled := True
    else btn_Update.Enabled := False;
    if IsDeleteGrade then btn_Delete.Enabled := True
    else btn_Delete.Enabled := False;
    btn_Save.Enabled := False;
    btn_Cancel.Enabled := False;
  end;
end;

procedure TfmATTypeAdmin.FormClear;
begin
  ed_ATtypeCode.Text := '';
  ed_atTypeName.Text := '';

  ed_WEarlyHH.Text :='00';
  ed_WEarlyMM.Text :='00';
  ed_WNormalHH.Text := '00';
  ed_WNormalMM.Text := '00';
  ed_WJigakHH.Text := '00';
  ed_WJigakMM.Text := '00';
  ed_WOutHH.Text := '00';
  ed_WOutMM.Text := '00';
  ed_WExtendHH.Text := '00';
  ed_WExtendMM.Text := '00';
  ed_WNightHH.Text := '00';
  ed_WNightMM.Text := '00';
  ed_WEarlyAdd.Text := '0';
  ed_WNormalAdd.Text := '0';
  ed_WJigakAdd.Text := '0';
  ed_WOutAdd.Text := '0';
  ed_WExtendAdd.Text := '0';
  ed_WNightAdd.Text := '0';

  ed_SEarlyHH.Text :='00';
  ed_SEarlyMM.Text :='00';
  ed_SNormalHH.Text := '00';
  ed_SNormalMM.Text := '00';
  ed_SJigakHH.Text := '00';
  ed_SJigakMM.Text := '00';
  ed_SOutHH.Text := '00';
  ed_SOutMM.Text := '00';
  ed_SExtendHH.Text := '00';
  ed_SExtendMM.Text := '00';
  ed_SNightHH.Text := '00';
  ed_SNightMM.Text := '00';
  ed_SEarlyAdd.Text := '0';
  ed_SNormalAdd.Text := '0';
  ed_SJigakAdd.Text := '0';
  ed_SOutAdd.Text := '0';
  ed_SExtendAdd.Text := '0';
  ed_SNightAdd.Text := '0';

  ed_HEarlyHH.Text :='00';
  ed_HEarlyMM.Text :='00';
  ed_HNormalHH.Text := '00';
  ed_HNormalMM.Text := '00';
  ed_HJigakHH.Text := '00';
  ed_HJigakMM.Text := '00';
  ed_HOutHH.Text := '00';
  ed_HOutMM.Text := '00';
  ed_HExtendHH.Text := '00';
  ed_HExtendMM.Text := '00';
  ed_HNightHH.Text := '00';
  ed_HNightMM.Text := '00';
  ed_HEarlyAdd.Text := '0';
  ed_HNormalAdd.Text := '0';
  ed_HJigakAdd.Text := '0';
  ed_HOutAdd.Text := '0';
  ed_HExtendAdd.Text := '0';
  ed_HNightAdd.Text := '0';


end;

procedure TfmATTypeAdmin.FormEnable(aState: string);
begin
  if upperCase(aState) = 'INSERT'  then
  begin
    sg_ATTypeCode.Enabled := False;
    ed_ATtypeCode.Enabled := TRUE;
    ed_atTypeName.Enabled := TRUE;

    ed_WEarlyHH.Enabled := TRUE;
    ed_WEarlyMM.Enabled := TRUE;
    ed_WNormalHH.Enabled := TRUE;
    ed_WNormalMM.Enabled := TRUE;
    ed_WJigakHH.Enabled := TRUE;
    ed_WJigakMM.Enabled := TRUE;
    ed_WOutHH.Enabled := TRUE;
    ed_WOutMM.Enabled := TRUE;
    ed_WExtendHH.Enabled := TRUE;
    ed_WExtendMM.Enabled := TRUE;
    ed_WNightHH.Enabled := TRUE;
    ed_WNightMM.Enabled := TRUE;
    ed_OutRangeHH.Enabled := TRUE;
    ed_OutRangeMM.Enabled := TRUE;
    ed_WEarlyAdd.Enabled := TRUE;
    ed_WNormalAdd.Enabled := TRUE;
    ed_WJigakAdd.Enabled := TRUE;
    ed_WOutAdd.Enabled := TRUE;
    ed_WExtendAdd.Enabled := TRUE;
    ed_WNightAdd.Enabled := TRUE;

    ed_SEarlyHH.Enabled := TRUE;
    ed_SEarlyMM.Enabled := TRUE;
    ed_SNormalHH.Enabled := TRUE;
    ed_SNormalMM.Enabled := TRUE;
    ed_SJigakHH.Enabled := TRUE;
    ed_SJigakMM.Enabled := TRUE;
    ed_SOutHH.Enabled := TRUE;
    ed_SOutMM.Enabled := TRUE;
    ed_SExtendHH.Enabled := TRUE;
    ed_SExtendMM.Enabled := TRUE;
    ed_SNightHH.Enabled := TRUE;
    ed_SNightMM.Enabled := TRUE;
    ed_SOutRangeHH.Enabled := TRUE;
    ed_SOutRangeMM.Enabled := TRUE;
    ed_SEarlyAdd.Enabled := TRUE;
    ed_SNormalAdd.Enabled := TRUE;
    ed_SJigakAdd.Enabled := TRUE;
    ed_SOutAdd.Enabled := TRUE;
    ed_SExtendAdd.Enabled := TRUE;
    ed_SNightAdd.Enabled := TRUE;

    ed_HEarlyHH.Enabled := TRUE;
    ed_HEarlyMM.Enabled := TRUE;
    ed_HNormalHH.Enabled := TRUE;
    ed_HNormalMM.Enabled := TRUE;
    ed_HJigakHH.Enabled := TRUE;
    ed_HJigakMM.Enabled := TRUE;
    ed_HOutHH.Enabled := TRUE;
    ed_HOutMM.Enabled := TRUE;
    ed_HExtendHH.Enabled := TRUE;
    ed_HExtendMM.Enabled := TRUE;
    ed_HNightHH.Enabled := TRUE;
    ed_HNightMM.Enabled := TRUE;
    ed_HOutRangeHH.Enabled := TRUE;
    ed_HOutRangeMM.Enabled := TRUE;
    ed_HEarlyAdd.Enabled := TRUE;
    ed_HNormalAdd.Enabled := TRUE;
    ed_HJigakAdd.Enabled := TRUE;
    ed_HOutAdd.Enabled := TRUE;
    ed_HExtendAdd.Enabled := TRUE;
    ed_HNightAdd.Enabled := TRUE;

    cmb_WorkerType.Enabled := True;
    btn_WorkerType.Enabled := True;
  end else if upperCase(aState) = 'SEARCH' then
  begin
    sg_ATTypeCode.Enabled := True;
    ed_ATtypeCode.Enabled := False;
    ed_atTypeName.Enabled := False;

    ed_WEarlyHH.Enabled := False;
    ed_WEarlyMM.Enabled := False;
    ed_WNormalHH.Enabled := False;
    ed_WNormalMM.Enabled := False;
    ed_WJigakHH.Enabled := False;
    ed_WJigakMM.Enabled := False;
    ed_WOutHH.Enabled := False;
    ed_WOutMM.Enabled := False;
    ed_WExtendHH.Enabled := False;
    ed_WExtendMM.Enabled := False;
    ed_WNightHH.Enabled := False;
    ed_WNightMM.Enabled := False;
    ed_OutRangeHH.Enabled := False;
    ed_OutRangeMM.Enabled := False;
    ed_WEarlyAdd.Enabled := False;
    ed_WNormalAdd.Enabled := False;
    ed_WJigakAdd.Enabled := False;
    ed_WOutAdd.Enabled := False;
    ed_WExtendAdd.Enabled := False;
    ed_WNightAdd.Enabled := False;

    ed_SEarlyHH.Enabled := False;
    ed_SEarlyMM.Enabled := False;
    ed_SNormalHH.Enabled := False;
    ed_SNormalMM.Enabled := False;
    ed_SJigakHH.Enabled := False;
    ed_SJigakMM.Enabled := False;
    ed_SOutHH.Enabled := False;
    ed_SOutMM.Enabled := False;
    ed_SExtendHH.Enabled := False;
    ed_SExtendMM.Enabled := False;
    ed_SNightHH.Enabled := False;
    ed_SNightMM.Enabled := False;
    ed_SOutRangeHH.Enabled := False;
    ed_SOutRangeMM.Enabled := False;
    ed_SEarlyAdd.Enabled := False;
    ed_SNormalAdd.Enabled := False;
    ed_SJigakAdd.Enabled := False;
    ed_SOutAdd.Enabled := False;
    ed_SExtendAdd.Enabled := False;
    ed_SNightAdd.Enabled := False;

    ed_HEarlyHH.Enabled := False;
    ed_HEarlyMM.Enabled := False;
    ed_HNormalHH.Enabled := False;
    ed_HNormalMM.Enabled := False;
    ed_HJigakHH.Enabled := False;
    ed_HJigakMM.Enabled := False;
    ed_HOutHH.Enabled := False;
    ed_HOutMM.Enabled := False;
    ed_HExtendHH.Enabled := False;
    ed_HExtendMM.Enabled := False;
    ed_HNightHH.Enabled := False;
    ed_HNightMM.Enabled := False;
    ed_HOutRangeHH.Enabled := False;
    ed_HOutRangeMM.Enabled := False;
    ed_HEarlyAdd.Enabled := False;
    ed_HNormalAdd.Enabled := False;
    ed_HJigakAdd.Enabled := False;
    ed_HOutAdd.Enabled := False;
    ed_HExtendAdd.Enabled := False;
    ed_HNightAdd.Enabled := False;

    cmb_WorkerType.Enabled := False;
    btn_WorkerType.Enabled := False;
  end else if upperCase(aState) = 'CLICK' then
  begin
    sg_ATTypeCode.Enabled := True;
    ed_ATtypeCode.Enabled := False;
    ed_atTypeName.Enabled := False;

    ed_WEarlyHH.Enabled := False;
    ed_WEarlyMM.Enabled := False;
    ed_WNormalHH.Enabled := False;
    ed_WNormalMM.Enabled := False;
    ed_WJigakHH.Enabled := False;
    ed_WJigakMM.Enabled := False;
    ed_WOutHH.Enabled := False;
    ed_WOutMM.Enabled := False;
    ed_WExtendHH.Enabled := False;
    ed_WExtendMM.Enabled := False;
    ed_WNightHH.Enabled := False;
    ed_WNightMM.Enabled := False;
    ed_OutRangeHH.Enabled := False;
    ed_OutRangeMM.Enabled := False;
    ed_WEarlyAdd.Enabled := False;
    ed_WNormalAdd.Enabled := False;
    ed_WJigakAdd.Enabled := False;
    ed_WOutAdd.Enabled := False;
    ed_WExtendAdd.Enabled := False;
    ed_WNightAdd.Enabled := False;

    ed_SEarlyHH.Enabled := False;
    ed_SEarlyMM.Enabled := False;
    ed_SNormalHH.Enabled := False;
    ed_SNormalMM.Enabled := False;
    ed_SJigakHH.Enabled := False;
    ed_SJigakMM.Enabled := False;
    ed_SOutHH.Enabled := False;
    ed_SOutMM.Enabled := False;
    ed_SExtendHH.Enabled := False;
    ed_SExtendMM.Enabled := False;
    ed_SNightHH.Enabled := False;
    ed_SNightMM.Enabled := False;
    ed_SOutRangeHH.Enabled := False;
    ed_SOutRangeMM.Enabled := False;
    ed_SEarlyAdd.Enabled := False;
    ed_SNormalAdd.Enabled := False;
    ed_SJigakAdd.Enabled := False;
    ed_SOutAdd.Enabled := False;
    ed_SExtendAdd.Enabled := False;
    ed_SNightAdd.Enabled := False;

    ed_HEarlyHH.Enabled := False;
    ed_HEarlyMM.Enabled := False;
    ed_HNormalHH.Enabled := False;
    ed_HNormalMM.Enabled := False;
    ed_HJigakHH.Enabled := False;
    ed_HJigakMM.Enabled := False;
    ed_HOutHH.Enabled := False;
    ed_HOutMM.Enabled := False;
    ed_HExtendHH.Enabled := False;
    ed_HExtendMM.Enabled := False;
    ed_HNightHH.Enabled := False;
    ed_HNightMM.Enabled := False;
    ed_HOutRangeHH.Enabled := False;
    ed_HOutRangeMM.Enabled := False;
    ed_HEarlyAdd.Enabled := False;
    ed_HNormalAdd.Enabled := False;
    ed_HJigakAdd.Enabled := False;
    ed_HOutAdd.Enabled := False;
    ed_HExtendAdd.Enabled := False;
    ed_HNightAdd.Enabled := False;

    cmb_WorkerType.Enabled := False;
    btn_WorkerType.Enabled := False;
  end else if upperCase(aState) = 'UPDATE' then
  begin
    sg_ATTypeCode.Enabled := False;
    ed_ATtypeCode.Enabled := False;
    ed_atTypeName.Enabled := TRUE;

    ed_WEarlyHH.Enabled := TRUE;
    ed_WEarlyMM.Enabled := TRUE;
    ed_WNormalHH.Enabled := TRUE;
    ed_WNormalMM.Enabled := TRUE;
    ed_WJigakHH.Enabled := TRUE;
    ed_WJigakMM.Enabled := TRUE;
    ed_WOutHH.Enabled := TRUE;
    ed_WOutMM.Enabled := TRUE;
    ed_WExtendHH.Enabled := TRUE;
    ed_WExtendMM.Enabled := TRUE;
    ed_WNightHH.Enabled := TRUE;
    ed_WNightMM.Enabled := TRUE;
    ed_OutRangeHH.Enabled := TRUE;
    ed_OutRangeMM.Enabled := TRUE;
    ed_WEarlyAdd.Enabled := TRUE;
    ed_WNormalAdd.Enabled := TRUE;
    ed_WJigakAdd.Enabled := TRUE;
    ed_WOutAdd.Enabled := TRUE;
    ed_WExtendAdd.Enabled := TRUE;
    ed_WNightAdd.Enabled := TRUE;

    ed_SEarlyHH.Enabled := TRUE;
    ed_SEarlyMM.Enabled := TRUE;
    ed_SNormalHH.Enabled := TRUE;
    ed_SNormalMM.Enabled := TRUE;
    ed_SJigakHH.Enabled := TRUE;
    ed_SJigakMM.Enabled := TRUE;
    ed_SOutHH.Enabled := TRUE;
    ed_SOutMM.Enabled := TRUE;
    ed_SExtendHH.Enabled := TRUE;
    ed_SExtendMM.Enabled := TRUE;
    ed_SNightHH.Enabled := TRUE;
    ed_SNightMM.Enabled := TRUE;
    ed_SOutRangeHH.Enabled := TRUE;
    ed_SOutRangeMM.Enabled := TRUE;
    ed_SEarlyAdd.Enabled := TRUE;
    ed_SNormalAdd.Enabled := TRUE;
    ed_SJigakAdd.Enabled := TRUE;
    ed_SOutAdd.Enabled := TRUE;
    ed_SExtendAdd.Enabled := TRUE;
    ed_SNightAdd.Enabled := TRUE;

    ed_HEarlyHH.Enabled := TRUE;
    ed_HEarlyMM.Enabled := TRUE;
    ed_HNormalHH.Enabled := TRUE;
    ed_HNormalMM.Enabled := TRUE;
    ed_HJigakHH.Enabled := TRUE;
    ed_HJigakMM.Enabled := TRUE;
    ed_HOutHH.Enabled := TRUE;
    ed_HOutMM.Enabled := TRUE;
    ed_HExtendHH.Enabled := TRUE;
    ed_HExtendMM.Enabled := TRUE;
    ed_HNightHH.Enabled := TRUE;
    ed_HNightMM.Enabled := TRUE;
    ed_HOutRangeHH.Enabled := TRUE;
    ed_HOutRangeMM.Enabled := TRUE;
    ed_HEarlyAdd.Enabled := TRUE;
    ed_HNormalAdd.Enabled := TRUE;
    ed_HJigakAdd.Enabled := TRUE;
    ed_HOutAdd.Enabled := TRUE;
    ed_HExtendAdd.Enabled := TRUE;
    ed_HNightAdd.Enabled := TRUE;

    cmb_WorkerType.Enabled := TRUE;
    btn_WorkerType.Enabled := TRUE;
  end;
end;

procedure TfmATTypeAdmin.ATtypeCodeSearch(aCode: string);
var
  stSql : string;
  nRow : integer;
begin
  GridInit(sg_ATTypeCode as TStringGrid,2);
  State := 'SEARCH';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  stSql := 'select * from TB_ATCODE ';
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
    if rg_atType.ItemIndex = 0 then //고정근무타입
    begin
      if recordCount > 1 then
        showmessage('고정근무타입에서는 근무타입이 1개만 적용됩니다. 근태환경을 확인하시기 바랍니다.');
    end;

    sg_ATTypeCode.RowCount := recordCount + 1;
    nRow := 1;
    While Not Eof do
    begin
      with sg_ATTypeCode do
      begin
        Cells[0,nRow] := FindField('AT_ATCODE').AsString;
        Cells[1,nRow] := FindField('AT_CODENAME').AsString;
        Cells[2,nRow] := FindField('AT_INFROMTIME').AsString;
        Cells[3,nRow] := FindField('AT_WORKSTARTTIME').AsString;
        Cells[4,nRow] := FindField('AT_INTOTIME').AsString;
        Cells[5,nRow] := FindField('AT_WORKENDTIME').AsString;
        Cells[6,nRow] := FindField('AT_EXTENDTIME').AsString;
        Cells[7,nRow] := FindField('AT_NIGHTTIME').AsString;
        Cells[8,nRow] := FindField('AT_EARLYADD').AsString;
        Cells[9,nRow] := FindField('AT_NORMALADD').AsString;
        Cells[10,nRow] := FindField('AT_JIGAKADD').AsString;
        Cells[11,nRow] := FindField('AT_JOTAEADD').AsString;
        Cells[12,nRow] := FindField('AT_EXTENDADD').AsString;
        Cells[13,nRow] := FindField('AT_NIGHTADD').AsString;
        Cells[14,nRow] := FindField('AT_SINFROMTIME').AsString;
        Cells[15,nRow] := FindField('AT_SWORKSTARTTIME').AsString;
        Cells[16,nRow] := FindField('AT_SINTOTIME').AsString;
        Cells[17,nRow] := FindField('AT_SWORKENDTIME').AsString;
        Cells[18,nRow] := FindField('AT_SEXTENDTIME').AsString;
        Cells[19,nRow] := FindField('AT_SNIGHTTIME').AsString;
        Cells[20,nRow] := FindField('AT_SEARLYADD').AsString;
        Cells[21,nRow] := FindField('AT_SNORMALADD').AsString;
        Cells[22,nRow] := FindField('AT_SJIGAKADD').AsString;
        Cells[23,nRow] := FindField('AT_SJOTAEADD').AsString;
        Cells[24,nRow] := FindField('AT_SEXTENDADD').AsString;
        Cells[25,nRow] := FindField('AT_SNIGHTADD').AsString;
        Cells[26,nRow] := FindField('AT_HINFROMTIME').AsString;
        Cells[27,nRow] := FindField('AT_HWORKSTARTTIME').AsString;
        Cells[28,nRow] := FindField('AT_HINTOTIME').AsString;
        Cells[29,nRow] := FindField('AT_HWORKENDTIME').AsString;
        Cells[30,nRow] := FindField('AT_HEXTENDTIME').AsString;
        Cells[31,nRow] := FindField('AT_HNIGHTTIME').AsString;
        Cells[32,nRow] := FindField('AT_HEARLYADD').AsString;
        Cells[33,nRow] := FindField('AT_HNORMALADD').AsString;
        Cells[34,nRow] := FindField('AT_HJIGAKADD').AsString;
        Cells[35,nRow] := FindField('AT_HJOTAEADD').AsString;
        Cells[36,nRow] := FindField('AT_HEXTENDADD').AsString;
        Cells[37,nRow] := FindField('AT_HNIGHTADD').AsString;
        Cells[38,nRow] := FindField('AW_CODE').AsString;
        Cells[39,nRow] := FindField('AT_OUTRANGE').AsString;
        Cells[40,nRow] := FindField('AT_SOUTRANGE').AsString;
        Cells[41,nRow] := FindField('AT_HOUTRANGE').AsString;
        if (FindField('AT_ATCODE').AsString )  = aCode then
        begin
          SelectRows(nRow,1);
        end;
      end;
      inc(nRow);
      Next;
    end;
  end;
  sg_ATTypeCodeClick(sg_ATTypeCode);
end;

procedure TfmATTypeAdmin.FormActivate(Sender: TObject);
begin

  ATtypeCodeSearch('');

  PageControl1.ActivePageIndex := 0;
end;

procedure TfmATTypeAdmin.sg_ATTypeCodeClick(Sender: TObject);
begin
  State := 'CLICK';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);

  with (Sender as TStringGrid) do
  begin
    if Cells[0,Row] = '' then Exit;
    ed_ATtypeCode.Text := Cells[0,Row];
    ed_atTypeName.Text := Cells[1,Row];
    ed_WEarlyHH.Text := copy(Cells[2,Row],1,2);
    ed_WEarlyMM.Text := copy(Cells[2,Row],3,2);
    ed_WNormalHH.Text := Copy(Cells[3,Row],1,2);
    ed_WNormalMM.Text := Copy(Cells[3,Row],3,2);
    ed_WJigakHH.Text := Copy(Cells[4,Row],1,2);
    ed_WJigakMM.Text := Copy(Cells[4,Row],3,2);
    ed_WOutHH.Text := Copy(Cells[5,Row],1,2);
    ed_WOutMM.Text := Copy(Cells[5,Row],3,2);
    ed_WExtendHH.Text := Copy(Cells[6,Row],1,2);
    ed_WExtendMM.Text := Copy(Cells[6,Row],3,2);
    ed_WNightHH.Text := Copy(Cells[7,Row],1,2);
    ed_WNightMM.Text := Copy(Cells[7,Row],3,2);
    ed_WEarlyAdd.Text := Cells[8,Row];
    ed_WNormalAdd.Text := Cells[9,Row];
    ed_WJigakAdd.Text := Cells[10,Row];
    ed_WOutAdd.Text := Cells[11,Row];
    ed_WExtendAdd.Text := Cells[12,Row];
    ed_WNightAdd.Text := Cells[13,Row];
    ed_OutRangeHH.Text := Copy(Cells[39,Row],1,2);
    ed_OutRangeMM.Text := Copy(Cells[39,Row],3,2);

    ed_SEarlyHH.Text := copy(Cells[14,Row],1,2);
    ed_SEarlyMM.Text := copy(Cells[14,Row],3,2);
    ed_SNormalHH.Text := Copy(Cells[15,Row],1,2);
    ed_SNormalMM.Text := Copy(Cells[15,Row],3,2);
    ed_SJigakHH.Text := Copy(Cells[16,Row],1,2);
    ed_SJigakMM.Text := Copy(Cells[16,Row],3,2);
    ed_SOutHH.Text := Copy(Cells[17,Row],1,2);
    ed_SOutMM.Text := Copy(Cells[17,Row],3,2);
    ed_SExtendHH.Text := Copy(Cells[18,Row],1,2);
    ed_SExtendMM.Text := Copy(Cells[18,Row],3,2);
    ed_SNightHH.Text := Copy(Cells[19,Row],1,2);
    ed_SNightMM.Text := Copy(Cells[19,Row],3,2);
    ed_SEarlyAdd.Text := Cells[20,Row];
    ed_SNormalAdd.Text := Cells[21,Row];
    ed_SJigakAdd.Text := Cells[22,Row];
    ed_SOutAdd.Text := Cells[23,Row];
    ed_SExtendAdd.Text := Cells[24,Row];
    ed_SNightAdd.Text := Cells[25,Row];
    ed_SOutRangeHH.Text := Copy(Cells[40,Row],1,2);
    ed_SOutRangeMM.Text := Copy(Cells[40,Row],3,2);

    ed_HEarlyHH.Text := copy(Cells[26,Row],1,2);
    ed_HEarlyMM.Text := copy(Cells[26,Row],3,2);
    ed_HNormalHH.Text := Copy(Cells[27,Row],1,2);
    ed_HNormalMM.Text := Copy(Cells[27,Row],3,2);
    ed_HJigakHH.Text := Copy(Cells[28,Row],1,2);
    ed_HJigakMM.Text := Copy(Cells[28,Row],3,2);
    ed_HOutHH.Text := Copy(Cells[29,Row],1,2);
    ed_HOutMM.Text := Copy(Cells[29,Row],3,2);
    ed_HExtendHH.Text := Copy(Cells[30,Row],1,2);
    ed_HExtendMM.Text := Copy(Cells[30,Row],3,2);
    ed_HNightHH.Text := Copy(Cells[31,Row],1,2);
    ed_HNightMM.Text := Copy(Cells[31,Row],3,2);
    ed_HEarlyAdd.Text := Cells[32,Row];
    ed_HNormalAdd.Text := Cells[33,Row];
    ed_HJigakAdd.Text := Cells[34,Row];
    ed_HOutAdd.Text := Cells[35,Row];
    ed_HExtendAdd.Text := Cells[36,Row];
    ed_HNightAdd.Text := Cells[37,Row];
    ed_HOutRangeHH.Text := Copy(Cells[41,Row],1,2);
    ed_HOutRangeMM.Text := Copy(Cells[41,Row],3,2);

    cmb_WorkerType.ItemIndex := WorkTypeCode.IndexOf(Cells[38,Row]);

  end;
end;

procedure TfmATTypeAdmin.btn_InsertClick(Sender: TObject);
begin
  State := 'INSERT';
  FormClear;
  FormEnable(State);
  ButtonEnable(State);
  with sg_ATTypeCode do
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
  if chk_AutoAtCode.Checked then chk_AutoAtCodeClick(Self);
end;

procedure TfmATTypeAdmin.btn_UpdateClick(Sender: TObject);
begin
  State := 'UPDATE';
  FormEnable(State);
  ButtonEnable(State);
end;

procedure TfmATTypeAdmin.btn_CancelClick(Sender: TObject);
begin
  ATtypeCodeSearch(ed_ATtypeCode.Text);
end;

procedure TfmATTypeAdmin.btn_DeleteClick(Sender: TObject);
begin
  if (Application.MessageBox(PChar('데이터를 삭제하시겠습니까?'),'삭제',MB_OKCANCEL) = ID_CANCEL)  then Exit;

  if Not DeleteTB_ATCode(ed_ATtypeCode.Text) then
  begin
    showmessage('삭제에 실패하였습니다.');
    Exit;
  end;
  ATtypeCodeSearch(ed_ATtypeCode.Text);
end;

function TfmATTypeAdmin.DeleteTB_ATCode(aCode: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Delete From TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_ATCODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATTypeAdmin.btn_SaveClick(Sender: TObject);
var
  stWEarlyTime,stWNormalTime,stWJiGakTime,stWOutTime,stWExtendTime,stWNightTime,stWOutRange : string;
  stSEarlyTime,stSNormalTime,stSJiGakTime,stSOutTime,stSExtendTime,stSNightTime,stSOutRange : string;
  stHEarlyTime,stHNormalTime,stHJiGakTime,stHOutTime,stHExtendTime,stHNightTime,stHOutRange : string;
  bResult : Boolean;
  stWorkCode : string;
begin
  if Not FormCheck then Exit;
  if rg_atType.ItemIndex <> 3 then stWorkCode := '001'
  else
  begin
    stWorkCode := WorkTypeCode.Strings[ cmb_WorkerType.ItemIndex ];
  end;
  stWEarlyTime := FillZeroNumber(strtoint(ed_WEarlyHH.Text),2) + FillZeroNumber(strtoint(ed_WEarlyMM.Text),2);
  stWNormalTime:= FillZeroNumber(strtoint(ed_WNormalHH.Text),2) + FillZeroNumber(strtoint(ed_WNormalMM.Text),2);
  stWJiGakTime := FillZeroNumber(strtoint(ed_WJigakHH.Text),2) + FillZeroNumber(strtoint(ed_WJigakMM.Text),2);
  stWOutTime   := FillZeroNumber(strtoint(ed_WOutHH.Text),2) + FillZeroNumber(strtoint(ed_WOutMM.Text),2);
  stWExtendTime:= FillZeroNumber(strtoint(ed_WExtendHH.Text),2) + FillZeroNumber(strtoint(ed_WExtendMM.Text),2);
  stWNightTime := FillZeroNumber(strtoint(ed_WNightHH.Text),2) + FillZeroNumber(strtoint(ed_WNightMM.Text),2);
  stWOutRange  := FillZeroNumber(strtoint(ed_OutRangeHH.Text),2) + FillZeroNumber(strtoint(ed_OutRangeMM.Text),2);
  stSEarlyTime := FillZeroNumber(strtoint(ed_SEarlyHH.Text),2) + FillZeroNumber(strtoint(ed_SEarlyMM.Text),2);
  stSNormalTime:= FillZeroNumber(strtoint(ed_SNormalHH.Text),2) + FillZeroNumber(strtoint(ed_SNormalMM.Text),2);
  stSJiGakTime := FillZeroNumber(strtoint(ed_SJigakHH.Text),2) + FillZeroNumber(strtoint(ed_SJigakMM.Text),2);
  stSOutTime   := FillZeroNumber(strtoint(ed_SOutHH.Text),2) + FillZeroNumber(strtoint(ed_SOutMM.Text),2);
  stSExtendTime:= FillZeroNumber(strtoint(ed_SExtendHH.Text),2) + FillZeroNumber(strtoint(ed_SExtendMM.Text),2);
  stSNightTime := FillZeroNumber(strtoint(ed_SNightHH.Text),2) + FillZeroNumber(strtoint(ed_SNightMM.Text),2);
  stSOutRange  := FillZeroNumber(strtoint(ed_SOutRangeHH.Text),2) + FillZeroNumber(strtoint(ed_SOutRangeMM.Text),2);
  stHEarlyTime := FillZeroNumber(strtoint(ed_HEarlyHH.Text),2) + FillZeroNumber(strtoint(ed_HEarlyMM.Text),2);
  stHNormalTime:= FillZeroNumber(strtoint(ed_HNormalHH.Text),2) + FillZeroNumber(strtoint(ed_HNormalMM.Text),2);
  stHJiGakTime := FillZeroNumber(strtoint(ed_HJigakHH.Text),2) + FillZeroNumber(strtoint(ed_HJigakMM.Text),2);
  stHOutTime   := FillZeroNumber(strtoint(ed_HOutHH.Text),2) + FillZeroNumber(strtoint(ed_HOutMM.Text),2);
  stHExtendTime:= FillZeroNumber(strtoint(ed_HExtendHH.Text),2) + FillZeroNumber(strtoint(ed_HExtendMM.Text),2);
  stHNightTime := FillZeroNumber(strtoint(ed_HNightHH.Text),2) + FillZeroNumber(strtoint(ed_HNightMM.Text),2);
  stHOutRange  := FillZeroNumber(strtoint(ed_HOutRangeHH.Text),2) + FillZeroNumber(strtoint(ed_HOutRangeMM.Text),2);


  if State = 'INSERT' then
    bResult := InsertTB_ATCODE(ed_ATtypeCode.Text,
                               ed_atTypeName.Text,
                               stWEarlyTime,
                               stWNormalTime,
                               stWJiGakTime,
                               stWOutTime,
                               stWExtendTime,
                               stWNightTime,
                               stSEarlyTime,
                               stSNormalTime,
                               stSJiGakTime,
                               stSOutTime,
                               stSExtendTime,
                               stSNightTime,
                               stHEarlyTime,
                               stHNormalTime,
                               stHJiGakTime,
                               stHOutTime,
                               stHExtendTime,
                               stHNightTime,
                               ed_WEarlyAdd.Text,
                               ed_WNormalAdd.Text,
                               ed_WJigakAdd.Text,
                               ed_WOutAdd.Text,
                               ed_WExtendAdd.Text,
                               ed_WNightAdd.Text,
                               ed_SEarlyAdd.Text,
                               ed_SNormalAdd.Text,
                               ed_SJigakAdd.Text,
                               ed_SOutAdd.Text,
                               ed_SExtendAdd.Text,
                               ed_SNightAdd.Text,
                               ed_HEarlyAdd.Text,
                               ed_HNormalAdd.Text,
                               ed_HJigakAdd.Text,
                               ed_HOutAdd.Text,
                               ed_HExtendAdd.Text,
                               ed_HNightAdd.Text,
                               stWorkCode,
                               stWOutRange,
                               stSOutRange,
                               stHOutRange
                               )
  else if State = 'UPDATE' then
    bResult := UpdateTB_ATCODE(ed_ATtypeCode.Text,
                               ed_atTypeName.Text,
                               stWEarlyTime,
                               stWNormalTime,
                               stWJiGakTime,
                               stWOutTime,
                               stWExtendTime,
                               stWNightTime,
                               stSEarlyTime,
                               stSNormalTime,
                               stSJiGakTime,
                               stSOutTime,
                               stSExtendTime,
                               stSNightTime,
                               stHEarlyTime,
                               stHNormalTime,
                               stHJiGakTime,
                               stHOutTime,
                               stHExtendTime,
                               stHNightTime,
                               ed_WEarlyAdd.Text,
                               ed_WNormalAdd.Text,
                               ed_WJigakAdd.Text,
                               ed_WOutAdd.Text,
                               ed_WExtendAdd.Text,
                               ed_WNightAdd.Text,
                               ed_SEarlyAdd.Text,
                               ed_SNormalAdd.Text,
                               ed_SJigakAdd.Text,
                               ed_SOutAdd.Text,
                               ed_SExtendAdd.Text,
                               ed_SNightAdd.Text,
                               ed_HEarlyAdd.Text,
                               ed_HNormalAdd.Text,
                               ed_HJigakAdd.Text,
                               ed_HOutAdd.Text,
                               ed_HExtendAdd.Text,
                               ed_HNightAdd.Text,
                               stWorkCode,
                               stWOutRange,
                               stSOutRange,
                               stHOutRange
                               );

  if Not bResult then
  begin
    showmessage('저장에 실패했습니다');
    Exit;
  end;
  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '근태타입관리');
  ATtypeCodeSearch(ed_ATtypeCode.Text);

end;

function TfmATTypeAdmin.FormCheck: Boolean;
begin
  result := False;
  if Trim(ed_ATtypeCode.Text)='' then
  begin
    showmessage('근태타입코드는 필수입니다..');
    Exit;
  end;
  if Trim(ed_atTypeName.Text)='' then
  begin
    showmessage('근태타입명칭은 필수입니다..');
    Exit;
  end;
  if ed_WEarlyHH.Text = '' then ed_WEarlyHH.Text := '00';
  if Not IsDigit(ed_WEarlyHH.Text) then
  begin
    showmessage('평일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WEarlyMM.Text = '' then ed_WEarlyMM.Text := '00';
  if Not IsDigit(ed_WEarlyMM.Text) then
  begin
    showmessage('평일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WNormalHH.Text = '' then ed_WNormalHH.Text := '00';
  if Not IsDigit(ed_WNormalHH.Text) then
  begin
    showmessage('평일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WNormalMM.Text = '' then ed_WNormalMM.Text := '00';
  if Not IsDigit(ed_WNormalMM.Text) then
  begin
    showmessage('평일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WJigakHH.Text = '' then ed_WJigakHH.Text := '00';
  if Not IsDigit(ed_WJigakHH.Text) then
  begin
    showmessage('평일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WJigakMM.Text = '' then ed_WJigakMM.Text := '00';
  if Not IsDigit(ed_WJigakMM.Text) then
  begin
    showmessage('평일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WOutHH.Text = '' then ed_WOutHH.Text := '00';
  if Not IsDigit(ed_WOutHH.Text) then
  begin
    showmessage('평일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WOutMM.Text = '' then ed_WOutMM.Text := '00';
  if Not IsDigit(ed_WOutMM.Text) then
  begin
    showmessage('평일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WExtendHH.Text = '' then ed_WExtendHH.Text := '00';
  if Not IsDigit(ed_WExtendHH.Text) then
  begin
    showmessage('평일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WExtendMM.Text = '' then ed_WExtendMM.Text := '00';
  if Not IsDigit(ed_WExtendMM.Text) then
  begin
    showmessage('평일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WNightHH.Text = '' then ed_WNightHH.Text := '00';
  if Not IsDigit(ed_WNightHH.Text) then
  begin
    showmessage('평일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_WNightMM.Text = '' then ed_WNightMM.Text := '00';
  if Not IsDigit(ed_WNightMM.Text) then
  begin
    showmessage('평일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_OutRangeHH.Text = '' then ed_OutRangeHH.Text := '00';
  if Not IsDigit(ed_OutRangeHH.Text) then
  begin
    ed_OutRangeHH.Text := '00';
  end;
  if ed_OutRangeMM.Text = '' then ed_OutRangeMM.Text := '00';
  if Not IsDigit(ed_OutRangeMM.Text) then
  begin
    ed_OutRangeMM.Text := '00';
  end;

  if ed_WEarlyAdd.Text = '' then ed_WEarlyAdd.Text := '0';
  if Not IsDigit(ed_WEarlyAdd.Text) then
  begin
    showmessage('평일 조기출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_WNormalAdd.Text = '' then ed_WNormalAdd.Text := '0';
  if Not IsDigit(ed_WNormalAdd.Text) then
  begin
    showmessage('평일 정상출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_WJigakAdd.Text = '' then ed_WJigakAdd.Text := '0';
  if Not IsDigit(ed_WJigakAdd.Text) then
  begin
    showmessage('평일 지각 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_WOutAdd.Text = '' then ed_WOutAdd.Text := '0';
  if Not IsDigit(ed_WOutAdd.Text) then
  begin
    showmessage('평일 조퇴 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_WExtendAdd.Text = '' then ed_WExtendAdd.Text := '0';
  if Not IsDigit(ed_WExtendAdd.Text) then
  begin
    showmessage('평일 연장근무 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_WNightAdd.Text = '' then ed_WNightAdd.Text := '0';
  if Not IsDigit(ed_WNightAdd.Text) then
  begin
    showmessage('평일 야간근무 급여계산 항목이 이상합니다.');
    Exit;
  end;

  if ed_SEarlyHH.Text = '' then ed_SEarlyHH.Text := '00';
  if Not IsDigit(ed_SEarlyHH.Text) then
  begin
    showmessage('토요일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SEarlyMM.Text = '' then ed_SEarlyMM.Text := '00';
  if Not IsDigit(ed_SEarlyMM.Text) then
  begin
    showmessage('토요일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SNormalHH.Text = '' then ed_SNormalHH.Text := '00';
  if Not IsDigit(ed_SNormalHH.Text) then
  begin
    showmessage('토요일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SNormalMM.Text = '' then ed_SNormalMM.Text := '00';
  if Not IsDigit(ed_SNormalMM.Text) then
  begin
    showmessage('토요일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SJigakHH.Text = '' then ed_SJigakHH.Text := '00';
  if Not IsDigit(ed_SJigakHH.Text) then
  begin
    showmessage('토요일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SJigakMM.Text = '' then ed_SJigakMM.Text := '00';
  if Not IsDigit(ed_SJigakMM.Text) then
  begin
    showmessage('토요일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SOutHH.Text = '' then ed_SOutHH.Text := '00';
  if Not IsDigit(ed_SOutHH.Text) then
  begin
    showmessage('토요일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SOutMM.Text = '' then ed_SOutMM.Text := '00';
  if Not IsDigit(ed_SOutMM.Text) then
  begin
    showmessage('토요일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SExtendHH.Text = '' then ed_SExtendHH.Text := '00';
  if Not IsDigit(ed_SExtendHH.Text) then
  begin
    showmessage('토요일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SExtendMM.Text = '' then ed_SExtendMM.Text := '00';
  if Not IsDigit(ed_SExtendMM.Text) then
  begin
    showmessage('토요일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SNightHH.Text = '' then ed_SNightHH.Text := '00';
  if Not IsDigit(ed_SNightHH.Text) then
  begin
    showmessage('토요일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_SNightMM.Text = '' then ed_SNightMM.Text := '00';
  if Not IsDigit(ed_SNightMM.Text) then
  begin
    showmessage('토요일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if Not IsDigit(ed_SOutRangeHH.Text) then ed_SOutRangeHH.Text := '00';
  if Not IsDigit(ed_SOutRangeMM.Text) then ed_SOutRangeMM.Text := '00';
  if ed_SEarlyAdd.Text = '' then ed_SEarlyAdd.Text := '0';
  if Not IsDigit(ed_SEarlyAdd.Text) then
  begin
    showmessage('토요일 조기출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_SNormalAdd.Text = '' then ed_SNormalAdd.Text := '0';
  if Not IsDigit(ed_SNormalAdd.Text) then
  begin
    showmessage('토요일 정상출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_SJigakAdd.Text = '' then ed_SJigakAdd.Text := '0';
  if Not IsDigit(ed_SJigakAdd.Text) then
  begin
    showmessage('토요일 지각 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_SOutAdd.Text = '' then ed_SOutAdd.Text := '0';
  if Not IsDigit(ed_SOutAdd.Text) then
  begin
    showmessage('토요일 조퇴 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_SExtendAdd.Text = '' then ed_SExtendAdd.Text := '0';
  if Not IsDigit(ed_SExtendAdd.Text) then
  begin
    showmessage('토요일 연장근무 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_SNightAdd.Text = '' then ed_SNightAdd.Text := '0';
  if Not IsDigit(ed_SNightAdd.Text) then
  begin
    showmessage('토요일 야간근무 급여계산 항목이 이상합니다.');
    Exit;
  end;

  if ed_HEarlyHH.Text = '' then ed_HEarlyHH.Text := '00';
  if Not IsDigit(ed_HEarlyHH.Text) then
  begin
    showmessage('공휴일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HEarlyMM.Text = '' then ed_HEarlyMM.Text := '00';
  if Not IsDigit(ed_HEarlyMM.Text) then
  begin
    showmessage('공휴일 조기출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HNormalHH.Text = '' then ed_HNormalHH.Text := '00';
  if Not IsDigit(ed_HNormalHH.Text) then
  begin
    showmessage('공휴일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HNormalMM.Text = '' then ed_HNormalMM.Text := '00';
  if Not IsDigit(ed_HNormalMM.Text) then
  begin
    showmessage('공휴일 정상출근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HJigakHH.Text = '' then ed_HJigakHH.Text := '00';
  if Not IsDigit(ed_HJigakHH.Text) then
  begin
    showmessage('공휴일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HJigakMM.Text = '' then ed_HJigakMM.Text := '00';
  if Not IsDigit(ed_HJigakMM.Text) then
  begin
    showmessage('공휴일 출근가능시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HOutHH.Text = '' then ed_HOutHH.Text := '00';
  if Not IsDigit(ed_HOutHH.Text) then
  begin
    showmessage('공휴일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HOutMM.Text = '' then ed_HOutMM.Text := '00';
  if Not IsDigit(ed_HOutMM.Text) then
  begin
    showmessage('공휴일 퇴근시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HExtendHH.Text = '' then ed_HExtendHH.Text := '00';
  if Not IsDigit(ed_HExtendHH.Text) then
  begin
    showmessage('공휴일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HExtendMM.Text = '' then ed_HExtendMM.Text := '00';
  if Not IsDigit(ed_HExtendMM.Text) then
  begin
    showmessage('공휴일 연장근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HNightHH.Text = '' then ed_HNightHH.Text := '00';
  if Not IsDigit(ed_HNightHH.Text) then
  begin
    showmessage('공휴일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if ed_HNightMM.Text = '' then ed_HNightMM.Text := '00';
  if Not IsDigit(ed_HNightMM.Text) then
  begin
    showmessage('공휴일 야간근무시작시간 데이터가 이상합니다.');
    Exit;
  end;
  if Not IsDigit(ed_HOutRangeHH.Text) then ed_HOutRangeHH.Text := '00';
  if Not IsDigit(ed_HOutRangeMM.Text) then ed_HOutRangeMM.Text := '00';
  if ed_HEarlyAdd.Text = '' then ed_HEarlyAdd.Text := '0';
  if Not IsDigit(ed_HEarlyAdd.Text) then
  begin
    showmessage('공휴일 조기출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_HNormalAdd.Text = '' then ed_HNormalAdd.Text := '0';
  if Not IsDigit(ed_HNormalAdd.Text) then
  begin
    showmessage('공휴일 정상출근 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_HJigakAdd.Text = '' then ed_HJigakAdd.Text := '0';
  if Not IsDigit(ed_HJigakAdd.Text) then
  begin
    showmessage('공휴일 지각 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_HOutAdd.Text = '' then ed_HOutAdd.Text := '0';
  if Not IsDigit(ed_HOutAdd.Text) then
  begin
    showmessage('공휴일 조퇴 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_HExtendAdd.Text = '' then ed_HExtendAdd.Text := '0';
  if Not IsDigit(ed_HExtendAdd.Text) then
  begin
    showmessage('공휴일 연장근무 급여계산 항목이 이상합니다.');
    Exit;
  end;
  if ed_HNightAdd.Text = '' then ed_HNightAdd.Text := '0';
  if Not IsDigit(ed_HNightAdd.Text) then
  begin
    showmessage('공휴일 야간근무 급여계산 항목이 이상합니다.');
    Exit;
  end;
  result := True;

end;

function TfmATTypeAdmin.InsertTB_ATCODE(aATtypeCode,aAtTypeName,
  aWEarlyTime, aWNormalTime,
  aWJiGakTime, aWOutTime, aWExtendTime, aWNightTime, aSEarlyTime,
  aSNormalTime, aSJiGakTime, aSOutTime, aSExtendTime, aSNightTime,
  aHEarlyTime, aHNormalTime, aHJiGakTime, aHOutTime, aHExtendTime,
  aHNightTime, aWEarlyAdd, aWNormalAdd, aWJigakAdd, aWOutAdd, aWExtendAdd,
  aWNightAdd, aSEarlyAdd, aSNormalAdd, aSJigakAdd, aSOutAdd, aSExtendAdd,
  aSNightAdd, aHEarlyAdd, aHNormalAdd, aHJigakAdd, aHOutAdd, aHExtendAdd,
  aHNightAdd,aWorkCode,aWOutRange,aSOutRange,aHOutRange: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Insert Into TB_ATCODE( ';
  stSql := stSql + 'GROUP_CODE,';
  stSql := stSql + 'AT_ATCODE,';
  stSql := stSql + 'AT_CODENAME,';
  stSql := stSql + 'AT_WORKSTARTTIME,';
  stSql := stSql + 'AT_WORKENDTIME,';
  stSql := stSql + 'AT_INFROMTIME,';
  stSql := stSql + 'AT_INTOTIME,';
  stSql := stSql + 'AT_EXTENDTIME,';
  stSql := stSql + 'AT_NIGHTTIME,';
  stSql := stSql + 'AT_NORMALADD,';
  stSql := stSql + 'AT_EARLYADD,';
  stSql := stSql + 'AT_JIGAKADD,';
  stSql := stSql + 'AT_JOTAEADD,';
  stSql := stSql + 'AT_EXTENDADD,';
  stSql := stSql + 'AT_NIGHTADD,';
  stSql := stSql + 'AT_SWORKSTARTTIME,';
  stSql := stSql + 'AT_SWORKENDTIME,';
  stSql := stSql + 'AT_SINFROMTIME,';
  stSql := stSql + 'AT_SINTOTIME,';
  stSql := stSql + 'AT_SEXTENDTIME,';
  stSql := stSql + 'AT_SNIGHTTIME,';
  stSql := stSql + 'AT_SNORMALADD,';
  stSql := stSql + 'AT_SEARLYADD,';
  stSql := stSql + 'AT_SJIGAKADD,';
  stSql := stSql + 'AT_SJOTAEADD,';
  stSql := stSql + 'AT_SEXTENDADD,';
  stSql := stSql + 'AT_SNIGHTADD,';
  stSql := stSql + 'AT_HWORKSTARTTIME,';
  stSql := stSql + 'AT_HWORKENDTIME,';
  stSql := stSql + 'AT_HINFROMTIME,';
  stSql := stSql + 'AT_HINTOTIME,';
  stSql := stSql + 'AT_HEXTENDTIME,';
  stSql := stSql + 'AT_HNIGHTTIME,';
  stSql := stSql + 'AT_HNORMALADD,';
  stSql := stSql + 'AT_HEARLYADD,';
  stSql := stSql + 'AT_HJIGAKADD,';
  stSql := stSql + 'AT_HJOTAEADD,';
  stSql := stSql + 'AT_HEXTENDADD,';
  stSql := stSql + 'AT_HNIGHTADD,';
  stSql := stSql + 'AW_CODE,';
  stSql := stSql + 'AT_OUTRANGE,';
  stSql := stSql + 'AT_SOUTRANGE,';
  stSql := stSql + 'AT_HOUTRANGE ) ';
  stSql := stSql + ' Values(';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aATtypeCode + ''',';
  stSql := stSql + '''' + aAtTypeName + ''',';
  stSql := stSql + '''' + aWNormalTime + ''',';
  stSql := stSql + '''' + aWOutTime + ''',';
  stSql := stSql + '''' + aWEarlyTime + ''',';
  stSql := stSql + '''' + aWJiGakTime + ''',';
  stSql := stSql + '''' + aWExtendTime + ''',';
  stSql := stSql + '''' + aWNightTime + ''',';
  stSql := stSql + '''' + aWNormalAdd + ''',';
  stSql := stSql + '''' + aWEarlyAdd + ''',';
  stSql := stSql + '''' + aWJigakAdd + ''',';
  stSql := stSql + '''' + aWOutAdd + ''',';
  stSql := stSql + '''' + aWExtendAdd + ''',';
  stSql := stSql + '''' + aWNightAdd + ''',';

  stSql := stSql + '''' + aSNormalTime + ''',';
  stSql := stSql + '''' + aSOutTime + ''',';
  stSql := stSql + '''' + aSEarlyTime + ''',';
  stSql := stSql + '''' + aSJiGakTime + ''',';
  stSql := stSql + '''' + aSExtendTime + ''',';
  stSql := stSql + '''' + aSNightTime + ''',';
  stSql := stSql + '''' + aSNormalAdd + ''',';
  stSql := stSql + '''' + aSEarlyAdd + ''',';
  stSql := stSql + '''' + aSJigakAdd + ''',';
  stSql := stSql + '''' + aSOutAdd + ''',';
  stSql := stSql + '''' + aSExtendAdd + ''',';
  stSql := stSql + '''' + aSNightAdd + ''',';

  stSql := stSql + '''' + aHNormalTime + ''',';
  stSql := stSql + '''' + aHOutTime + ''',';
  stSql := stSql + '''' + aHEarlyTime + ''',';
  stSql := stSql + '''' + aHJiGakTime + ''',';
  stSql := stSql + '''' + aHExtendTime + ''',';
  stSql := stSql + '''' + aHNightTime + ''',';
  stSql := stSql + '''' + aHNormalAdd + ''',';
  stSql := stSql + '''' + aHEarlyAdd + ''',';
  stSql := stSql + '''' + aHJigakAdd + ''',';
  stSql := stSql + '''' + aHOutAdd + ''',';
  stSql := stSql + '''' + aHExtendAdd + ''',';
  stSql := stSql + '''' + aHNightAdd + ''',';
  stSql := stSql + '''' + aWorkCode + ''',';
  stSql := stSql + '''' + aWOutRange + ''',';
  stSql := stSql + '''' + aSOutRange + ''',';
  stSql := stSql + '''' + aHOutRange + ''')';

  result := DataModule1.ProcessExecSQL(stSql);


end;

function TfmATTypeAdmin.UpdateTB_ATCODE(aATtypeCode,aAtTypeName,
  aWEarlyTime, aWNormalTime,
  aWJiGakTime, aWOutTime, aWExtendTime, aWNightTime, aSEarlyTime,
  aSNormalTime, aSJiGakTime, aSOutTime, aSExtendTime, aSNightTime,
  aHEarlyTime, aHNormalTime, aHJiGakTime, aHOutTime, aHExtendTime,
  aHNightTime, aWEarlyAdd, aWNormalAdd, aWJigakAdd, aWOutAdd, aWExtendAdd,
  aWNightAdd, aSEarlyAdd, aSNormalAdd, aSJigakAdd, aSOutAdd, aSExtendAdd,
  aSNightAdd, aHEarlyAdd, aHNormalAdd, aHJigakAdd, aHOutAdd, aHExtendAdd,
  aHNightAdd,aWorkCode,aWOutRange,aSOutRange,aHOutRange: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATCODE set ';
  stSql := stSql + 'AT_CODENAME = ''' + aAtTypeName + ''',';
  stSql := stSql + 'AT_WORKSTARTTIME = ''' + aWNormalTime + ''',';
  stSql := stSql + 'AT_WORKENDTIME = ''' + aWOutTime + ''',';
  stSql := stSql + 'AT_INFROMTIME = ''' + aWEarlyTime + ''',';
  stSql := stSql + 'AT_INTOTIME = ''' + aWJiGakTime + ''',';
  stSql := stSql + 'AT_EXTENDTIME = ''' + aWExtendTime + ''',';
  stSql := stSql + 'AT_NIGHTTIME = ''' + aWNightTime + ''',';
  stSql := stSql + 'AT_NORMALADD = ''' + aWNormalAdd + ''',';
  stSql := stSql + 'AT_EARLYADD = ''' + aWEarlyAdd + ''',';
  stSql := stSql + 'AT_JIGAKADD = ''' + aWJigakAdd + ''',';
  stSql := stSql + 'AT_JOTAEADD = ''' + aWOutAdd + ''',';
  stSql := stSql + 'AT_EXTENDADD = ''' + aWExtendAdd + ''',';
  stSql := stSql + 'AT_NIGHTADD = ''' + aWNightAdd + ''',';
  stSql := stSql + 'AT_SWORKSTARTTIME = ''' + aSNormalTime + ''',';
  stSql := stSql + 'AT_SWORKENDTIME = ''' + aSOutTime + ''',';
  stSql := stSql + 'AT_SINFROMTIME = ''' + aSEarlyTime + ''',';
  stSql := stSql + 'AT_SINTOTIME = ''' + aSJiGakTime + ''',';
  stSql := stSql + 'AT_SEXTENDTIME = ''' + aSExtendTime + ''',';
  stSql := stSql + 'AT_SNIGHTTIME = ''' + aSNightTime + ''',';
  stSql := stSql + 'AT_SNORMALADD = ''' + aSNormalAdd + ''',';
  stSql := stSql + 'AT_SEARLYADD = ''' + aSEarlyAdd + ''',';
  stSql := stSql + 'AT_SJIGAKADD = ''' + aSJigakAdd + ''',';
  stSql := stSql + 'AT_SJOTAEADD = ''' + aSOutAdd + ''',';
  stSql := stSql + 'AT_SEXTENDADD = ''' + aSExtendAdd + ''',';
  stSql := stSql + 'AT_SNIGHTADD = ''' + aSNightAdd + ''',';
  stSql := stSql + 'AT_HWORKSTARTTIME = ''' + aHNormalTime + ''',';
  stSql := stSql + 'AT_HWORKENDTIME = ''' + aHOutTime + ''',';
  stSql := stSql + 'AT_HINFROMTIME = ''' + aHEarlyTime + ''',';
  stSql := stSql + 'AT_HINTOTIME = ''' + aHJiGakTime + ''',';
  stSql := stSql + 'AT_HEXTENDTIME = ''' + aHExtendTime + ''',';
  stSql := stSql + 'AT_HNIGHTTIME = ''' + aHNightTime + ''',';
  stSql := stSql + 'AT_HNORMALADD = ''' + aHNormalAdd + ''',';
  stSql := stSql + 'AT_HEARLYADD = ''' + aHEarlyAdd + ''',';
  stSql := stSql + 'AT_HJIGAKADD = ''' + aHJigakAdd + ''',';
  stSql := stSql + 'AT_HJOTAEADD = ''' + aHOutAdd + ''',';
  stSql := stSql + 'AT_HEXTENDADD = ''' + aHExtendAdd + ''',';
  stSql := stSql + 'AT_HNIGHTADD  = ''' + aHNightAdd + ''', ';
  stSql := stSql + 'AW_CODE  = ''' + aWorkCode + ''', ';
  stSql := stSql + 'AT_OUTRANGE  = ''' + aWOutRange + ''', ';
  stSql := stSql + 'AT_SOUTRANGE  = ''' + aSOutRange + ''', ';
  stSql := stSql + 'AT_HOUTRANGE  = ''' + aHOutRange + '''  ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_ATCODE =''' + aATtypeCode + '''';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATTypeAdmin.GetATTypeConfig;
var
  stSql : string;
begin
  bATTypePay := True;
  bSaturDay := True;

  stSql := ' select * from TB_CONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ( (CO_CONFIGGROUP = ''ATTEND'' AND CO_CONFIGCODE = ''SATURDAY'') ';
  stSql := stSql + ' OR (CO_CONFIGGROUP = ''ATTEND'' AND CO_CONFIGCODE = ''ATTYPE'')  ';
  stSql := stSql + ' OR (CO_CONFIGGROUP = ''PAY'' AND CO_CONFIGCODE = ''ATTYPEPAY'') ) ';

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
    if recordCount < 0 then Exit;
    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then
      begin
        if FindField('CO_CONFIGVALUE').AsInteger =  1 then bSaturDay := True
        else bSaturDay := False;
      end
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
      begin
        ChangATType := FindField('CO_CONFIGVALUE').AsInteger;
      end
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then
      begin
        if FindField('CO_CONFIGVALUE').AsInteger =  0 then bATTypePay := True
        else bATTypePay := False;
      end;
      Next;
    end;
  end;

end;

procedure TfmATTypeAdmin.btn_AttendConfigClick(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','WEEKTIME',ed_WeekTime.Text);
  UpdateTB_CONFIG('PAY','MONTHLAST',ed_MonthLastDay.Text);
  UpdateTB_CONFIG('PAY','ATTYPEPAY',inttostr(rg_atTypePay.ItemIndex));

  UpdateTB_CONFIG('PAY','EARLYADD',ed_BwEarlyAdd.Text);
  UpdateTB_CONFIG('PAY','EXTENDADD',ed_BwExtendAdd.Text);
  UpdateTB_CONFIG('PAY','NIGHTADD',ed_BwNightAdd.Text);
  UpdateTB_CONFIG('PAY','SEARLYADD',ed_BsEarlyAdd.Text);
  UpdateTB_CONFIG('PAY','SEXTENDADD',ed_BsExtendAdd.Text);
  UpdateTB_CONFIG('PAY','SNIGHTADD',ed_BsNightAdd.Text);
  UpdateTB_CONFIG('PAY','HEARLYADD','0');
  UpdateTB_CONFIG('PAY','HNORMALADD',ed_BhNormalAdd.text);
  UpdateTB_CONFIG('PAY','HEXTENDADD',ed_BhExtendAdd.Text);
  UpdateTB_CONFIG('PAY','HNIGHTADD',ed_BhNightAdd.Text);
  UpdateTB_CONFIG('ATTEND','ATTYPE',inttostr(rg_atType.ItemIndex));
  UpdateTB_CONFIG('ATTEND','ATTYPE1',inttostr(rg_atType1.ItemIndex));

  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '근무환경설정');

end;

procedure TfmATTypeAdmin.rg_atTypePayClick(Sender: TObject);
begin
  if rg_atTypePay.ItemIndex <> 1 then
  begin
    Panel12.Visible:= False;
  end
  else
  begin
    Panel12.Visible := True;
  end;
  if rg_atTypePay.ItemIndex = 0 then bATTypePay := True
  else bATTypePay := False;

  if bATTypePay then
  begin
    GroupBox1.Visible := True;
    GroupBox2.Visible := True;
    GroupBox3.Visible := True;
  end else
  begin
    GroupBox1.Visible := False;
    GroupBox2.Visible := False;
    GroupBox3.Visible := False;
  end;
  UpdateTB_CONFIG('PAY','ATTYPEPAY',inttostr(rg_atTypePay.ItemIndex));
end;

function TfmATTypeAdmin.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string): Boolean;
var
  stSql : string;
begin

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmATTypeAdmin.SetPayConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_Config ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND ( CO_CONFIGGROUP = ''PAY'' OR CO_CONFIGGROUP = ''ATTEND'' ) ';

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
      TempAdoQuery.free;
      CoUninitialize;
      Exit;
    End;
    if RecordCount < 1 then
    begin
      TempAdoQuery.Free;
      CoUninitialize;
      Exit;
    end;

    First;
    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'WEEKTIME' then
        ed_WeekTime.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'EARLYADD' then
        ed_BwEarlyAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'EXTENDADD' then
        ed_BwExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'NIGHTADD' then
        ed_BwNightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SEARLYADD' then
        ed_BsEarlyAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SEXTENDADD' then
        ed_BsExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SNIGHTADD' then
        ed_BsNightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HNORMALADD' then
        ed_BhNormalAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HEXTENDADD' then
        ed_BhExtendAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'HNIGHTADD' then
        ed_BhNightAdd.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPEPAY' then
        rg_atTypePay.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'MONTHLAST' then
        ed_MonthLastDay.Text := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
        rg_atType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
      else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then
        rg_atType1.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger;
      Next;
    end;
  end;
  TempAdoQuery.Free;
  CoUninitialize;
  if rg_atTypePay.ItemIndex = 1 then Panel12.Visible:= True
  else Panel12.Visible := False;
end;

procedure TfmATTypeAdmin.FormShow(Sender: TObject);
begin
  SetPayConfig;
  GetATTypeConfig;
  if bATTypePay then
  begin
    GroupBox1.Visible := True;
    GroupBox2.Visible := True;
    GroupBox3.Visible := True;
  end else
  begin
    GroupBox1.Visible := False;
    GroupBox2.Visible := False;
    GroupBox3.Visible := False;
  end;
  if bSaturDay then  SaturdayTab.TabVisible := True
  else SaturdayTab.TabVisible := False;

  LoadWorkType;
end;

procedure TfmATTypeAdmin.ed_WeekTimeExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','WEEKTIME',ed_WeekTime.Text);
end;

procedure TfmATTypeAdmin.ed_MonthLastDayExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','MONTHLAST',ed_MonthLastDay.Text);

end;

procedure TfmATTypeAdmin.ed_BwEarlyAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','EARLYADD',ed_BwEarlyAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BwExtendAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','EXTENDADD',ed_BwExtendAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BwNightAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','NIGHTADD',ed_BwNightAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BsEarlyAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','SEARLYADD',ed_BsEarlyAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BsExtendAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','SEXTENDADD',ed_BsExtendAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BsNightAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','SNIGHTADD',ed_BsNightAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BhNormalAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','HNORMALADD',ed_BhNormalAdd.text);
end;

procedure TfmATTypeAdmin.ed_BhExtendAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','HEXTENDADD',ed_BhExtendAdd.Text);
end;

procedure TfmATTypeAdmin.ed_BhNightAddExit(Sender: TObject);
begin
  UpdateTB_CONFIG('PAY','HNIGHTADD',ed_BhNightAdd.Text);
end;

procedure TfmATTypeAdmin.rg_atTypeClick(Sender: TObject);
begin
  UpdateTB_CONFIG('ATTEND','ATTYPE',inttostr(rg_atType.ItemIndex));

  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '교대근무타입' + inttostr(rg_atType.ItemIndex));

  if rg_atType.ItemIndex = 3 then
  begin
    lb_WorkerType.Visible := True;
    cmb_WorkerType.Visible := True;
    btn_WorkerType.Visible := True;
  end else
  begin
    lb_WorkerType.Visible := False;
    cmb_WorkerType.Visible := False;
    btn_WorkerType.Visible := False;
  end;

end;

procedure TfmATTypeAdmin.ed_ATtypeCodeChange(Sender: TObject);
begin
  if ed_ATtypeCode.Text = '' then Exit;
  if Not IsDigit(ed_ATtypeCode.Text) then
  begin
    showmessage('코드는 숫자만 입력하세요.');
    Exit;
  end;
end;

procedure TfmATTypeAdmin.chk_AutoAtCodeClick(Sender: TObject);
begin
  if chk_AutoAtCode.Checked then ed_ATtypeCode.Text := GetAutoATCode;
end;

function TfmATTypeAdmin.GetAutoATCode: string;
var
  stSql : string;
  nSeq : integer;
begin
  result := '';
  nSeq := 1;
  stSql := CommonSql.GetMaxATCode;
  with ADOQuery do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;
    Try
      Open;
    Except
      result := FillZeroNumber(nSeq,3);
      Exit;
    End;
    if recordCount > 0 then
    begin
      if IsDigit(FindField('AT_ATCODE').AsString) then
      begin
        nSeq := strtoint(FindField('AT_ATCODE').AsString) + 1;
      end;
    end;
  end;
  result := FillZeroNumber(nSeq,3);
end;

procedure TfmATTypeAdmin.rg_atType1Click(Sender: TObject);
begin
  UpdateTB_CONFIG('ATTEND','ATTYPE1',inttostr(rg_atType1.ItemIndex));
  DataModule1.TB_SYSTEMLOGInsert('000','00','0','0','0000000000' , '출근타입' + inttostr(rg_atType1.ItemIndex));

end;

procedure TfmATTypeAdmin.LoadWorkType;
var
  stSql : string;
begin
  WorkTypeCode.Clear;
  cmb_WorkerType.Clear;

  stSql := 'Select * from TB_ATWORKTYPE  ';
  stSql := stSql + ' Order by AW_CODE ';

  with ADOTemp do
  begin
    Close;
    Sql.Clear;
    Sql.Text := stSql;

    Try
      Open;
    Except
      Exit;
    End;
    While Not Eof do
    begin
      WorkTypeCode.Add(FindField('AW_CODE').AsString);
      cmb_WorkerType.Items.Add(FindField('AW_NAME').AsString);
      Next;
    end;
    cmb_WorkerType.ItemIndex := 0;
  end;
end;

procedure TfmATTypeAdmin.FormCreate(Sender: TObject);
begin
  inherited;
  WorkTypeCode := TStringList.Create;
end;

procedure TfmATTypeAdmin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  WorkTypeCode.Free;
end;

procedure TfmATTypeAdmin.btn_WorkerTypeClick(Sender: TObject);
begin
  inherited;
  fmWorkCodeType:= TfmWorkCodeType.Create(Self);
  fmWorkCodeType.SHowmodal;
  fmWorkCodeType.Free;
  LoadWorkType;
end;

end.
