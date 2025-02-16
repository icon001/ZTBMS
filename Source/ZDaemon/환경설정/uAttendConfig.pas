unit uAttendConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Buttons, Grids, BaseGrid, AdvGrid,
  FolderDialog, RzShellDialogs,ADODB, ExtCtrls,FileCtrl,ActiveX;

type
  TfmAttendConfig = class(TForm)
    PageControl1: TPageControl;
    GroupBox2: TGroupBox;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    cmb_ChangCnt: TComboBox;
    Label2: TLabel;
    ed_YHour: TEdit;
    Label3: TLabel;
    ed_YMin: TEdit;
    Label4: TLabel;
    Label53: TLabel;
    cmb_ATDeviceType: TComboBox;
    GroupBox8: TGroupBox;
    Label54: TLabel;
    ed_FoodFrom4Hour: TEdit;
    Label55: TLabel;
    ed_FoodFrom4Min: TEdit;
    Label56: TLabel;
    Label57: TLabel;
    ed_FoodTo4Hour: TEdit;
    Label58: TLabel;
    ed_FoodTo4Min: TEdit;
    Label59: TLabel;
    GroupBox9: TGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    ed_FoodFrom3Hour: TEdit;
    ed_FoodFrom3Min: TEdit;
    ed_FoodTo3Hour: TEdit;
    ed_FoodTo3Min: TEdit;
    GroupBox10: TGroupBox;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    ed_FoodFrom2Hour: TEdit;
    ed_FoodFrom2Min: TEdit;
    ed_FoodTo2Hour: TEdit;
    ed_FoodTo2Min: TEdit;
    GroupBox11: TGroupBox;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    ed_FoodFrom1Hour: TEdit;
    ed_FoodFrom1Min: TEdit;
    ed_FoodTo1Hour: TEdit;
    ed_FoodTo1Min: TEdit;
    GroupBox12: TGroupBox;
    rd_Auto: TRadioButton;
    rd_Oper: TRadioButton;
    GroupBox14: TGroupBox;
    Label78: TLabel;
    ed_BackCycle: TEdit;
    Label79: TLabel;
    Label80: TLabel;
    ed_BackHour: TEdit;
    Label81: TLabel;
    ed_BackMin: TEdit;
    Label82: TLabel;
    GroupBox16: TGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    ed_AcDel: TEdit;
    Label88: TLabel;
    ed_FdDel: TEdit;
    Label89: TLabel;
    Label90: TLabel;
    ed_AtDel: TEdit;
    Label91: TLabel;
    Label92: TLabel;
    ed_PTDel: TEdit;
    Label93: TLabel;
    TabSheet4: TTabSheet;
    GroupBox15: TGroupBox;
    GroupBox17: TGroupBox;
    Label94: TLabel;
    Label95: TLabel;
    Label96: TLabel;
    ed_LogDel: TEdit;
    rd_AckSave: TRadioButton;
    rd_AckNotSave: TRadioButton;
    ed_BackDir: TEdit;
    SpeedButton1: TSpeedButton;
    Label85: TLabel;
    FolderDialog1: TFolderDialog;
    GroupBox4: TGroupBox;
    rd_CardAuto: TRadioButton;
    rd_CardOper: TRadioButton;
    TabSheet5: TTabSheet;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label98: TLabel;
    ed_MasterID: TEdit;
    chk_dtAC: TCheckBox;
    chk_dtAT: TCheckBox;
    chk_dtPT: TCheckBox;
    chk_dtFD: TCheckBox;
    Label97: TLabel;
    ed_FoAmt1: TEdit;
    ed_FoAmt2: TEdit;
    Label99: TLabel;
    ed_FoAmt3: TEdit;
    Label100: TLabel;
    ed_FoAmt4: TEdit;
    Label101: TLabel;
    Panel1: TPanel;
    TabSheet6: TTabSheet;
    GroupBox1: TGroupBox;
    chk_Short: TCheckBox;
    chk_down: TCheckBox;
    GroupBox13: TGroupBox;
    Label103: TLabel;
    cmb_FoodDeviceType: TComboBox;
    rg_FdGrade: TRadioGroup;
    chk_dtSE: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ed_ATHH: TEdit;
    Label9: TLabel;
    ed_ATMM: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    gr_FileServer: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    SpeedButton2: TSpeedButton;
    ed_FileserverIP: TEdit;
    ed_FileServerDir: TEdit;
    TabSheet7: TTabSheet;
    GroupBox7: TGroupBox;
    rg_fdmsUse: TRadioGroup;
    gb_fdms: TGroupBox;
    OpenDialog1: TOpenDialog;
    rg_Alarmview: TRadioGroup;
    rg_readerType: TRadioGroup;
    rg_ServerReader: TRadioGroup;
    GroupBox18: TGroupBox;
    cmb_PersonRelay: TComboBox;
    btn_perRelayConfig: TSpeedButton;
    GroupBox19: TGroupBox;
    cmb_SentenceRelay: TComboBox;
    btn_Relaysentence: TSpeedButton;
    TabSheet8: TTabSheet;
    GroupBox20: TGroupBox;
    Label17: TLabel;
    cmb_FireAllOpen: TComboBox;
    Label18: TLabel;
    ed_FireStatus: TEdit;
    Label19: TLabel;
    cmb_FireRecUse: TComboBox;
    chk_InOutCount: TCheckBox;
    TabSheet9: TTabSheet;
    Panel2: TPanel;
    GroupBox21: TGroupBox;
    Label20: TLabel;
    cmb_DHCPUse: TComboBox;
    gb_ServerPort: TGroupBox;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    ed_DeviceServerPort1: TEdit;
    ed_DeviceServerPort2: TEdit;
    ed_DeviceServerPort3: TEdit;
    GroupBox22: TGroupBox;
    cmb_ACEvent: TComboBox;
    TabSheet10: TTabSheet;
    GroupBox23: TGroupBox;
    Label25: TLabel;
    cmb_Special: TComboBox;
    GroupBox24: TGroupBox;
    cmb_Ftp: TComboBox;
    rg_MultiDaemon: TRadioGroup;
    pan_SingleD: TPanel;
    Label83: TLabel;
    Label12: TLabel;
    Label84: TLabel;
    Label24: TLabel;
    ed_DaemonIP: TEdit;
    ed_AtServerPort: TEdit;
    ed_DaemonPort: TEdit;
    ed_FTPPort: TEdit;
    Pan_MulitD: TPanel;
    SpeedButton3: TSpeedButton;
    GroupBox25: TGroupBox;
    Label26: TLabel;
    ed_Maxprocess: TEdit;
    TabSheet11: TTabSheet;
    gb_PgType: TGroupBox;
    cmb_CardType: TComboBox;
    cmb_CardNumeric: TComboBox;
    cmb_DupCard: TComboBox;
    cmb_CardPositionNum: TComboBox;
    GroupBox26: TGroupBox;
    chk_CardLenFixed: TCheckBox;
    pan_CardFix: TPanel;
    Label29: TLabel;
    ed_cardFiexedLen: TEdit;
    GroupBox27: TGroupBox;
    rg_Front: TRadioButton;
    rg_back: TRadioButton;
    ed_FillChar: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    cmb_setPersonRelay: TComboBox;
    ed_ControlPort: TEdit;
    Label32: TLabel;
    Label33: TLabel;
    ed_StatePort: TEdit;
    ed_EventPort: TEdit;
    Label34: TLabel;
    GroupBox28: TGroupBox;
    cmb_multiSocket: TComboBox;
    GroupBox29: TGroupBox;
    chk_AlarmEventLengthUse: TCheckBox;
    Label35: TLabel;
    ed_AlarmEventLenth: TEdit;
    TabSheet12: TTabSheet;
    rg_ScheduleDevice: TRadioGroup;
    rg_ScheduleAsync: TRadioGroup;
    TabSheet13: TTabSheet;
    rg_CommLog: TRadioGroup;
    rg_CardLog: TRadioGroup;
    pan_ATNO: TPanel;
    Label36: TLabel;
    ed_StartWorkNo: TEdit;
    ed_OffWorkNo: TEdit;
    Label37: TLabel;
    Label38: TLabel;
    cmb_InOutDeviceType: TComboBox;
    pan_OUTNO: TPanel;
    Label39: TLabel;
    Label40: TLabel;
    ed_WorkOutSideNo: TEdit;
    ed_WorkInNo: TEdit;
    Label41: TLabel;
    chk_ATPrivateServer: TCheckBox;
    Panel3: TPanel;
    ed_fdmsCardLen: TEdit;
    Label28: TLabel;
    ed_fdmsNo: TEdit;
    Label27: TLabel;
    ed_fdmsPw: TEdit;
    lb_fdmsPw: TLabel;
    lb_File: TLabel;
    ed_fdmsPath: TEdit;
    btn_fdmsSearch: TButton;
    rg_fdmsdbtype: TRadioGroup;
    lb_fdmsUserid: TLabel;
    ed_fdmsUserid: TEdit;
    lb_fdmsport: TLabel;
    ed_fdmsport: TEdit;
    lb_fdmsDB: TLabel;
    ed_fdmsDB: TEdit;
    ed_fdmsDBIP: TEdit;
    Label15: TLabel;
    TabSheet14: TTabSheet;
    GroupBox30: TGroupBox;
    Label16: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    ed_kttServerIP: TEdit;
    ed_kttServerPort: TEdit;
    ed_kttClientPort: TEdit;
    rg_kttControlServerUses: TRadioGroup;
    chk_Clinetseq: TCheckBox;
    ed_ClientTime: TEdit;
    chk_DaemonPW: TCheckBox;
    chk_FdmsNoAuto: TCheckBox;
    Label44: TLabel;
    ed_KTTPamCycle: TEdit;
    Label45: TLabel;
    GroupBox31: TGroupBox;
    rg_FireRelayUse: TRadioGroup;
    Label46: TLabel;
    cmb_FireRelayNo: TComboBox;
    Label47: TLabel;
    cmb_FireRelayTime: TComboBox;
    Label48: TLabel;
    GroupBox32: TGroupBox;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    ed_DDNSIP: TEdit;
    ed_DDNSQueryIP: TEdit;
    ed_DDNSPort: TEdit;
    ed_DDNSQueryPort: TEdit;
    rg_kttDDNSServerUses: TRadioGroup;
    rg_DupEvent: TRadioGroup;
    chk_CardDelete: TCheckBox;
    Label102: TLabel;
    ed_cardDeleteStart: TEdit;
    Label104: TLabel;
    ed_CardDeleteLength: TEdit;
    chk_AutoFdmsCard: TCheckBox;
    GroupBox33: TGroupBox;
    cmb_SockType: TComboBox;
    TabSheet15: TTabSheet;
    Label105: TLabel;
    ed_LongTimeCode: TEdit;
    chk_ASCIIToHex: TCheckBox;
    rg_DoorTimeCodeUse: TRadioGroup;
    chk_FdmsDepartCode: TCheckBox;
    Label106: TLabel;
    ed_FdYesterdayHH: TEdit;
    Label107: TLabel;
    ed_FdYesterdayMM: TEdit;
    Label108: TLabel;
    GroupBox34: TGroupBox;
    cmb_EventDBType: TComboBox;
    gb_ArmStateView: TGroupBox;
    Label109: TLabel;
    ed_AlarmLogStart: TEdit;
    ed_AlarmLogEnd: TEdit;
    Label110: TLabel;
    GroupBox35: TGroupBox;
    chk_pwLength: TCheckBox;
    ed_PWLength: TEdit;
    chk_pwchar: TCheckBox;
    TabSheet16: TTabSheet;
    rg_AntiPassGroup: TRadioGroup;
    rg_CardMemoryLoading: TRadioGroup;
    chk_ArmAreaUse: TCheckBox;
    GroupBox36: TGroupBox;
    rg_Facecop: TRadioGroup;
    Label111: TLabel;
    ed_FaceCopIP: TEdit;
    ed_facecopCycleTime: TEdit;
    Label112: TLabel;
    Label113: TLabel;
    btn_faceconnect: TSpeedButton;
    gb_GlobalInfo: TGroupBox;
    Label114: TLabel;
    cmb_GlobalInit: TComboBox;
    Label115: TLabel;
    ed_GlobalInitTime: TEdit;
    Label116: TLabel;
    Label117: TLabel;
    ed_AntiInitStartTime: TEdit;
    Label118: TLabel;
    ed_AntiInitEndTime: TEdit;
    tab_SonghoFood: TTabSheet;
    GroupBox37: TGroupBox;
    chk_DayLimit: TCheckBox;
    ed_songhoDayCount: TEdit;
    Label119: TLabel;
    chk_WeekLimit: TCheckBox;
    ed_songhoWeekCount: TEdit;
    Label120: TLabel;
    chk_semesterLimit: TCheckBox;
    ed_songhoSemesterCount: TEdit;
    Label121: TLabel;
    GroupBox38: TGroupBox;
    chk_semester1: TCheckBox;
    chk_semester2: TCheckBox;
    chk_semester3: TCheckBox;
    chk_semester4: TCheckBox;
    cmb_StartMM1: TComboBox;
    Label122: TLabel;
    Label123: TLabel;
    cmb_StartDD1: TComboBox;
    Label124: TLabel;
    cmb_ENDMM1: TComboBox;
    Label125: TLabel;
    cmb_ENDDD1: TComboBox;
    Label126: TLabel;
    cmb_StartMM2: TComboBox;
    Label127: TLabel;
    cmb_StartDD2: TComboBox;
    Label128: TLabel;
    Label129: TLabel;
    cmb_ENDMM2: TComboBox;
    Label130: TLabel;
    cmb_ENDDD2: TComboBox;
    Label131: TLabel;
    cmb_StartMM3: TComboBox;
    Label132: TLabel;
    cmb_StartDD3: TComboBox;
    Label133: TLabel;
    Label134: TLabel;
    cmb_ENDMM3: TComboBox;
    Label135: TLabel;
    cmb_ENDDD3: TComboBox;
    Label136: TLabel;
    cmb_StartMM4: TComboBox;
    Label137: TLabel;
    cmb_StartDD4: TComboBox;
    Label138: TLabel;
    Label139: TLabel;
    cmb_ENDMM4: TComboBox;
    Label140: TLabel;
    cmb_ENDDD4: TComboBox;
    Label141: TLabel;
    gb_ModebusPort: TGroupBox;
    Label142: TLabel;
    ed_ModBusPort: TEdit;
    cmb_SendServer: TComboBox;
    Label143: TLabel;
    GroupBox39: TGroupBox;
    chk_CardDeleteUse: TCheckBox;
    Label144: TLabel;
    ed_CardDeleteDay: TEdit;
    Label145: TLabel;
    GroupBox40: TGroupBox;
    chk_COPHONEENC: TCheckBox;
    rg_OldCardDelete: TRadioGroup;
    rg_DevicePermitSync: TRadioGroup;
    GroupBox41: TGroupBox;
    chk_AutoLogOutUse: TCheckBox;
    ed_AutoLogOutTime: TEdit;
    Label146: TLabel;
    GroupBox42: TGroupBox;
    Label147: TLabel;
    chk_LoginLimitUse: TCheckBox;
    ed_LoginLimitCnt: TEdit;
    chk_LineCheck: TCheckBox;
    gb_RelayPG: TGroupBox;
    Label148: TLabel;
    ed_RelayPGPort: TEdit;
    rg_RelayServer: TRadioGroup;
    chk_AtTime: TCheckBox;
    ed_ATTime: TEdit;
    Label149: TLabel;
    rg_schUsepacket: TRadioGroup;
    ed_PWChange: TEdit;
    Label150: TLabel;
    SpeedButton4: TSpeedButton;
    Label151: TLabel;
    ed_EmpDel: TEdit;
    Label152: TLabel;
    GroupBox43: TGroupBox;
    chk_CardFull: TCheckBox;
    Label153: TLabel;
    procedure btn_CloseClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cmb_ChangCntChange(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure rd_OperClick(Sender: TObject);
    procedure rd_AutoClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rg_fdmsUseClick(Sender: TObject);
    procedure btn_fdmsSearchClick(Sender: TObject);
    procedure cmb_FoodDeviceTypeChange(Sender: TObject);
    procedure rg_readerTypeClick(Sender: TObject);
    procedure btn_perRelayConfigClick(Sender: TObject);
    procedure btn_RelaysentenceClick(Sender: TObject);
    procedure cmb_DupCardChange(Sender: TObject);
    procedure rg_MultiDaemonClick(Sender: TObject);
    procedure chk_CardLenFixedClick(Sender: TObject);
    procedure cmb_ATDeviceTypeChange(Sender: TObject);
    procedure cmb_InOutDeviceTypeChange(Sender: TObject);
    procedure rg_kttControlServerUsesClick(Sender: TObject);
    procedure chk_ClinetseqClick(Sender: TObject);
    procedure cmb_CardTypeChange(Sender: TObject);
    procedure cmb_SpecialChange(Sender: TObject);
    procedure btn_faceconnectClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
    procedure GetConfig;
    procedure GetNewAtConfig;
    procedure GetFdConfig;
    procedure GetSonghoConfig;
    procedure GetSemester;
    procedure SetViewAttend(AtCnt:integer);
    Function InsertTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_FOODCODE(aFOODCODE,aSTARTTIME ,aENDTIME,aFOAMT:string):Boolean;
    Function UpdateTB_ATWORKTYPE(aCode,aField,aValue:string):Boolean;

    //procedure InsertATCode;
    Function InsertTB_ATCODE(aATCODE,aATName,aInFromTime,aInToTime,aWorkFromTime,aWorkToTime:string):Boolean;
  private
    procedure Change_ATWORKTYPE;
    function CheckeFormatSemester:Boolean;
    Function SemesterDataSave:Boolean;
    Function SonghoFoodConfigSave:Boolean;
  public
    { Public declarations }
  end;

var
  fmAttendConfig: TfmAttendConfig;

implementation
uses
  uDataModule1,
  uLomosUtil, uPerRelayConfig, uRelaysentence, uPostGreSql, uMssql,
  uMDBSql, uFireBird, uRelayDB, uCommonSql, uServerDaemon;
{$R *.dfm}

procedure TfmAttendConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAttendConfig.SpeedButton1Click(Sender: TObject);
begin
  FolderDialog1.Title := '백업 디렉토리 찾기';

  if FolderDialog1.Execute then
    ed_BackDir.Text := FolderDialog1.Directory;
end;

procedure TfmAttendConfig.FormActivate(Sender: TObject);
begin
  GetConfig;
  GetNewAtConfig;
  GetFdConfig;
  GetSonghoConfig;
  GetSemester;
  PageControl1.ActivePageIndex := 3;
end;

procedure TfmAttendConfig.GetConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_Config ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

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
        if Findfield('CO_CONFIGGROUP').AsString = 'ATTEND' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          begin
            cmb_ChangCnt.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
            SetViewAttend(strtoint(FindField('CO_CONFIGVALUE').AsString));
          end else if FindField('CO_CONFIGCODE').AsString = 'ATPRSERVER' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then
            begin
              chk_ATPrivateServer.Checked := True;
            end else
            begin
              chk_ATPrivateServer.Checked := False;
            end;
          end else if FindField('CO_CONFIGCODE').AsString = 'IOTIMEUSE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = '1' then chk_AtTime.Checked := True
            else chk_AtTime.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'IOTIME' then
          begin
            ed_ATTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
          {
          if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then
          begin
            cmb_ATDeviceType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
            cmb_ATDeviceTypeChange(cmb_ATDeviceType);
          end else if FindField('CO_CONFIGCODE').AsString = 'STARTWKNO' then
          begin
            ed_StartWorkNo.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'OFFWKNO' then
          begin
            ed_OffWorkNo.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'WKOUTNO' then
          begin
            ed_WorkOutSideNo.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'WKINNO' then
          begin
            ed_WorkInNo.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'INOUTTYPE' then
          begin
            cmb_InOutDeviceType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
            cmb_InOutDeviceTypeChange(cmb_InOutDeviceType);
          end else if FindField('CO_CONFIGCODE').AsString = 'ATTYPE' then
          begin
            cmb_ChangCnt.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
            SetViewAttend(strtoint(FindField('CO_CONFIGVALUE').AsString));
          end else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
          begin
            ed_YHour.Text := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
            ed_YMin.Text := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
          end else if FindField('CO_CONFIGCODE').AsString = 'ATPRSERVER' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then
            begin
              chk_ATPrivateServer.Checked := True;
            end else
            begin
              chk_ATPrivateServer.Checked := False;
            end;
          end;  }
        end else if Findfield('CO_CONFIGGROUP').AsString = 'ALARM' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'SHORT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then chk_Short.Checked := True
            else chk_Short.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'DOWN' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then chk_down.Checked := True
            else chk_down.Checked := False;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'DAEMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'IP' then
          begin
            ed_DaemonIP.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PORT' then
          begin
            ed_DaemonPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FTPPORT' then
          begin
            ed_FTPPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'ATPORT' then
          begin
            ed_AtServerPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'CARDMEMORY' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then rg_CardMemoryLoading.ItemIndex := 0
            else rg_CardMemoryLoading.ItemIndex := 1;
          end else if FindField('CO_CONFIGCODE').AsString = 'CONTRLPORT' then
          begin
            ed_ControlPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'GLANTIUSE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> '1' then rg_AntiPassGroup.ItemIndex := 0
            else rg_AntiPassGroup.ItemIndex := 1;
          end else if FindField('CO_CONFIGCODE').AsString = 'GLINITUSE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then cmb_GlobalInit.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else cmb_GlobalInit.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'GLINITTIME' then
          begin
            ed_GlobalInitTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'GLINITSTM' then
          begin
            ed_AntiInitStartTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'GLINITETM' then
          begin
            ed_AntiInitEndTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'STATEPORT' then
          begin
            ed_StatePort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'EVENTPORT' then
          begin
            ed_EventPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'MODBUSPORT' then
          begin
            ed_ModBusPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'MULTISOCK' then
          begin
            cmb_multiSocket.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'LOGINTYPE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'FALSE' then chk_DaemonPW.Checked := True
            else chk_DaemonPW.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'CLIENTSEQ' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'Y' then chk_Clinetseq.Checked := False
            else chk_Clinetseq.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'CLIENTTIME' then
          begin
            ed_ClientTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DEVICESVER' then
          begin
            cmb_DHCPUse.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT1' then
          begin
            ed_DeviceServerPort1.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT2' then
          begin
            ed_DeviceServerPort2.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DTOSPORT3' then
          begin
            ed_DeviceServerPort3.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FTPUSE' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then
              cmb_Ftp.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else cmb_Ftp.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'MULTI' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then
              rg_MultiDaemon.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else rg_MultiDaemon.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'MAXPROCESS' then
          begin
            ed_Maxprocess.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'USEARMLEN' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'TRUE' then chk_AlarmEventLengthUse.Checked := False
            else chk_AlarmEventLengthUse.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMLEN' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then ed_AlarmEventLenth.Text := FindField('CO_CONFIGVALUE').AsString
            else ed_AlarmEventLenth.Text := '10';
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHASYNC' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_ScheduleAsync.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else rg_ScheduleAsync.ItemIndex :=  0;
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHDEVICE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_ScheduleDevice.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else rg_ScheduleDevice.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'SCHUSEPACK' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_schUsepacket.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else rg_schUsepacket.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'COMMLOG' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_CommLog.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else rg_CommLog.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'CARDLOG' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_CardLog.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else rg_CardLog.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'CSOCKTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then cmb_SockType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else cmb_SockType.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'LONGTIMECD' then
          begin
            ed_LongTimeCode.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'TIMEUSE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then rg_DoorTimeCodeUse.ItemIndex := 1
            else rg_DoorTimeCodeUse.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'EVENTDB' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then cmb_EventDBType.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger
            else cmb_EventDBType.ItemIndex := 0;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'DAEMONLOG' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DELETDAY' then
          begin
            ed_LogDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FULLLOG' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then rd_AckSave.Checked := True
            else rd_AckNotSave.Checked := True;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'DATABASE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'AUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'TRUE' then rd_Auto.Checked := True
            else rd_Oper.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'BACKCYCLE' then
          begin
            ed_BackCycle.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'BACKTIME' then
          begin
            ed_BackHour.Text  := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
            ed_BackMin.Text  := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
          end else if FindField('CO_CONFIGCODE').AsString = 'BACKDIR' then
          begin
            ed_BackDir.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'AC_DELETE' then
          begin
            ed_AcDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'AT_DELETE' then
          begin
            ed_AtDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'EMP_DELETE' then
          begin
            ed_EmpDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FD_DELETE' then
          begin
            ed_FdDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then
          begin
            ed_PtDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'MOSTYPE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ACCESS' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_dtAC.Checked := True
            else chk_dtAC.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARM' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_dtPT.Checked := True
            else chk_dtPT.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'ATTEND' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_dtAT.Checked := True
            else chk_dtAT.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FOOD' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_dtFD.Checked := True
            else chk_dtFD.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'SENSOR' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_dtSE.Checked := True
            else chk_dtSE.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'INOUTCOUNT' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_InOutCount.Checked := True
            else chk_InOutCount.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'MASTERID' then
          begin
            ed_MasterID.Text := FindField('CO_CONFIGVALUE').AsString ;
          end else if FindField('CO_CONFIGCODE').AsString = 'FOODDEVICE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'READER' then cmb_FoodDeviceType.ItemIndex := 0
            else cmb_FoodDeviceType.ItemIndex := 1 ;
          end else if FindField('CO_CONFIGCODE').AsString = 'FOODGRADE' then
          begin
            rg_FdGrade.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'FILEIP' then
          begin
            ed_FileserverIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FILEDIR' then
          begin
            ed_FileserverDir.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'ALARMVIEW' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'REAL' then
            begin
              rg_AlarmView.ItemIndex := 0;
            end else
            begin
              rg_AlarmView.ItemIndex := 1;
            end;
          end else if FindField('CO_CONFIGCODE').AsString = 'ARMAREAUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsInteger = 0 then chk_ArmAreaUse.Checked := False
            else chk_ArmAreaUse.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWLENUSE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then chk_pwLength.Checked := True
            else chk_pwLength.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWLENGTH' then
          begin
            ed_PWLength.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWCHAR' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then chk_pwchar.Checked := True
            else chk_pwchar.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'PWCHANGE' then
          begin
            ed_PWChange.text := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'MCUCOMM' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'TRUE' then
            begin
              rd_CardAuto.Checked := True;
            end else
            begin
              rd_CardOper.Checked := True;
            end;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'RELAY' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'EMPSPORT' then
          begin
            ed_RelayPGPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'fdmsUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'TRUE' then
            begin
              rg_fdmsUse.ItemIndex := 1;
            end else
            begin
              rg_fdmsUse.ItemIndex := 0;
            end;
          end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPath' then
          begin
            ed_fdmsPath.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBTYPE' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_fdmsdbtype.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) ;
//            rg_readerTypeClick(self);
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBIP' then
          begin
            ed_fdmsDBIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBPORT' then
          begin
            ed_fdmsport.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSUSER' then
          begin
            ed_fdmsUserid.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDBNAME' then
          begin
            ed_fdmsDB.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'fdmsPW' then
          begin
            ed_fdmsPw.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'fdmsType' then
          begin
            if Isdigit(FindField('CO_CONFIGVALUE').AsString) then
              rg_readerType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
            rg_readerTypeClick(self);
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSNO' then
          begin
            ed_fdmsNo.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSCARDLN' then
          begin
            ed_fdmsCardLen.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'cardServer' then
          begin
            rg_ServerReader.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'FACECOP' then
          begin
            rg_FaceCop.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'FACECOPIP' then
          begin
            ed_FaceCopIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FA_RETIME' then   //연동주기
          begin
            ed_facecopCycleTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PER_RELAY' then
          begin
            cmb_PersonRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'PER_SRELAY' then
          begin
            cmb_setPersonRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'SENT_RELAY' then
          begin
            cmb_SentenceRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'fdmsEMCODE' then
          begin
            //if FindField('CO_CONFIGVALUE').AsString = 'TRUE' then chk_sabun.Checked := true
            //else chk_sabun.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSNOAUTO' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'N' then chk_FdmsNoAuto.Checked := False
            else chk_FdmsNoAuto.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'DELCARDUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_CardDelete.Checked := True
            else chk_CardDelete.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'DCARDSTART' then
          begin
            ed_cardDeleteStart.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DELCARDLEN' then
          begin
            ed_CardDeleteLength.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'AUTOFCARD' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_AutoFdmsCard.Checked := True
            else chk_AutoFdmsCard.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'ASCIITOHEX' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'Y' then chk_ASCIIToHex.Checked := True
            else chk_ASCIIToHex.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'FDMSDEPART' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then chk_FdmsDepartCode.Checked := True
            else chk_FdmsDepartCode.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'EMPSERVER' then
          begin
            rg_RelayServer.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then cmb_CardType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then cmb_CardNumeric.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then cmb_CardPositionNum.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then cmb_DupCard.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then cmb_ACEvent.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then cmb_Special.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'EVENTSTART' then ed_AlarmLogStart.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'EVENTEND' then ed_AlarmLogEnd.Text := FindField('CO_CONFIGVALUE').AsString
          else if FindField('CO_CONFIGCODE').AsString = 'CARDDLTUSE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then chk_CardDeleteUse.Checked := True
            else chk_CardDeleteUse.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'CARDDELETE' then
          begin
            ed_CardDeleteDay.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PERMITSYNC' then
          begin
            rg_DevicePermitSync.ItemIndex := FindField('CO_CONFIGVALUE').AsInteger;
          end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOGOUT' then
          begin
            if FindField('CO_CONFIGVALUE').AsInteger = 1 then chk_AutoLogOutUse.Checked := True
            else chk_AutoLogOutUse.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'AUTOLOTIME' then
          begin
            ed_AutoLogOutTime.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'LOGINLIMIT' then
          begin
            if FindField('CO_CONFIGVALUE').AsInteger = 1 then chk_LoginLimitUse.Checked := True
            else chk_LoginLimitUse.Checked := False;
          end else if FindField('CO_CONFIGCODE').AsString = 'LOGINCOUNT' then
          begin
            ed_LoginLimitCnt.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'CARDFULL' then
          begin
            if FindField('CO_CONFIGVALUE').AsInteger = 1 then chk_CardFull.Checked := True
            else chk_CardFull.Checked := False;
          end;

        end else if Findfield('CO_CONFIGGROUP').AsString = 'KT' then
        begin
          if FindField('CO_CONFIGVALUE').AsString = '0' then rg_OldCardDelete.ItemIndex := 0
          else rg_OldCardDelete.ItemIndex := 1;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'FIRERECUSE' then cmb_FireRecUse.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'FIREOPEN' then cmb_FireAllOpen.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'FIRESTATUS' then ed_FireStatus.Text := FindField('CO_CONFIGVALUE').AsString;
          if FindField('CO_CONFIGCODE').AsString = 'RELAYUSE' then rg_FireRelayUse.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'RELAYNO' then
          begin
            if strtoint(FindField('CO_CONFIGVALUE').AsString) < 5 then
              cmb_FireRelayNo.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1
            else cmb_FireRelayNo.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 2;
          end;
          if FindField('CO_CONFIGCODE').AsString = 'RELAYTIME' then cmb_FireRelayTime.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'CARD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDFIXED' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) = 'TRUE' then  chk_CardLenFixed.Checked := True
            else chk_CardLenFixed.Checked := False;
            chk_CardLenFixedClick(self);
          end else if FindField('CO_CONFIGCODE').AsString = 'FILLCHAR' then
          begin
            ed_FillChar.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'FILLPOSI' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then rg_back.Checked := True
            else rg_Front.Checked := True;
          end else if FindField('CO_CONFIGCODE').AsString = 'FIXEDLEN' then
          begin
            ed_cardFiexedLen.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'KTT' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'KTTSUSES' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then rg_kttControlServerUses.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else rg_kttControlServerUses.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTSIP' then
          begin
            ed_kttServerIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTSPORT' then
          begin
            ed_kttServerPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTCPORT' then
          begin
            ed_kttClientPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTPCYCLE' then
          begin
            ed_KTTPamCycle.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNSUSES' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then rg_kttDDNSServerUses.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else rg_kttDDNSServerUses.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'KTTSENDSER' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then cmb_SendServer.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else cmb_SendServer.ItemIndex := 0;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SIP' then
          begin
            ed_DDNSIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_SPORT' then
          begin
            ed_DDNSPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QIP' then
          begin
            ed_DDNSQueryIP.Text := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'DDNS_QPORT' then
          begin
            ed_DDNSQueryPort.Text := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'FOOD' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'DUPEVENT' then
          begin
            if isDigit(FindField('CO_CONFIGVALUE').AsString) then rg_DupEvent.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'YSDAYTIME' then
          begin
            ed_FdYesterdayHH.Text := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
            ed_FdYesterdayMM.Text := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'EMPLOYEE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ENCCOTEL' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = '1' then chk_COPHONEENC.Checked := True
            else chk_COPHONEENC.Checked := False;
          end;
        end;

        Next;
      end;
      chk_CardDeleteUse.Checked := G_bCardDeleteUse;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  rg_MultiDaemonClick(self);
  cmb_SpecialChange(cmb_Special);
end;

procedure TfmAttendConfig.SetViewAttend(AtCnt: integer);
begin
end;

procedure TfmAttendConfig.cmb_ChangCntChange(Sender: TObject);
begin
  SetViewAttend(cmb_ChangCnt.ItemIndex + 1);
end;
{
procedure TfmAttendConfig.GetAtConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE  + ''' ';

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

    if Recordcount < 1 then
    begin
      TempAdoQuery.Free;
      Exit;
    end;

    First;
    while Not Eof do
    begin
      if FindField('AT_ATCODE').AsString = '001' then
      begin
        ed_InFrom1Hour.Text := copy(FindField('AT_INFROMTIME').AsString,1,2);
        ed_InFrom1Min.Text := copy(FindField('AT_INFROMTIME').AsString,3,2);
        ed_InTo1Hour.Text := copy(FindField('AT_INTOTIME').AsString,1,2);
        ed_InTo1Min.Text := copy(FindField('AT_INTOTIME').AsString,3,2);
        ed_WorkFrom1Hour.Text := copy(FindField('AT_WORKSTARTTIME').AsString,1,2);
        ed_WorkFrom1Min.Text := copy(FindField('AT_WORKSTARTTIME').AsString,3,2);
        ed_WorkTo1Hour.Text := copy(FindField('AT_WORKENDTIME').AsString,1,2);
        ed_WorkTo1Min.Text := copy(FindField('AT_WORKENDTIME').AsString,3,2);
      end else if FindField('AT_ATCODE').AsString = '002' then
      begin
        ed_InFrom2Hour.Text := copy(FindField('AT_INFROMTIME').AsString,1,2);
        ed_InFrom2Min.Text := copy(FindField('AT_INFROMTIME').AsString,3,2);
        ed_InTo2Hour.Text := copy(FindField('AT_INTOTIME').AsString,1,2);
        ed_InTo2Min.Text := copy(FindField('AT_INTOTIME').AsString,3,2);
        ed_WorkFrom2Hour.Text := copy(FindField('AT_WORKSTARTTIME').AsString,1,2);
        ed_WorkFrom2Min.Text := copy(FindField('AT_WORKSTARTTIME').AsString,3,2);
        ed_WorkTo2Hour.Text := copy(FindField('AT_WORKENDTIME').AsString,1,2);
        ed_WorkTo2Min.Text := copy(FindField('AT_WORKENDTIME').AsString,3,2);
      end else if FindField('AT_ATCODE').AsString = '003' then
      begin
        ed_InFrom3Hour.Text := copy(FindField('AT_INFROMTIME').AsString,1,2);
        ed_InFrom3Min.Text := copy(FindField('AT_INFROMTIME').AsString,3,2);
        ed_InTo3Hour.Text := copy(FindField('AT_INTOTIME').AsString,1,2);
        ed_InTo3Min.Text := copy(FindField('AT_INTOTIME').AsString,3,2);
        ed_WorkFrom3Hour.Text := copy(FindField('AT_WORKSTARTTIME').AsString,1,2);
        ed_WorkFrom3Min.Text := copy(FindField('AT_WORKSTARTTIME').AsString,3,2);
        ed_WorkTo3Hour.Text := copy(FindField('AT_WORKENDTIME').AsString,1,2);
        ed_WorkTo3Min.Text := copy(FindField('AT_WORKENDTIME').AsString,3,2);
      end else if FindField('AT_ATCODE').AsString = '004' then
      begin
        ed_InFrom4Hour.Text := copy(FindField('AT_INFROMTIME').AsString,1,2);
        ed_InFrom4Min.Text := copy(FindField('AT_INFROMTIME').AsString,3,2);
        ed_InTo4Hour.Text := copy(FindField('AT_INTOTIME').AsString,1,2);
        ed_InTo4Min.Text := copy(FindField('AT_INTOTIME').AsString,3,2);
        ed_WorkFrom4Hour.Text := copy(FindField('AT_WORKSTARTTIME').AsString,1,2);
        ed_WorkFrom4Min.Text := copy(FindField('AT_WORKSTARTTIME').AsString,3,2);
        ed_WorkTo4Hour.Text := copy(FindField('AT_WORKENDTIME').AsString,1,2);
        ed_WorkTo4Min.Text := copy(FindField('AT_WORKENDTIME').AsString,3,2);
      end;

      Next;
    end;
  end;
  TempAdoQuery.Free;
end;   }

procedure TfmAttendConfig.GetFdConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_FOODCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE  + ''' ';

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

      if Recordcount < 1 then
      begin
        Exit;
      end;

      First;
      while Not Eof do
      begin
        if FindField('FO_FOODCODE').AsString = '001' then    //조식
        begin
          ed_FoodFrom1Hour.Text := copy(FindField('FO_STARTTIME').AsString,1,2);
          ed_FoodFrom1Min.Text := copy(FindField('FO_STARTTIME').AsString,3,2);
          ed_FoodTo1Hour.Text := copy(FindField('FO_ENDTIME').AsString,1,2);
          ed_FoodTo1Min.Text := copy(FindField('FO_ENDTIME').AsString,3,2);
          ed_FoAmt1.Text := FindField('FO_AMT').AsString;
        end else if FindField('FO_FOODCODE').AsString = '002' then  //중식
        begin
          ed_FoodFrom2Hour.Text := copy(FindField('FO_STARTTIME').AsString,1,2);
          ed_FoodFrom2Min.Text := copy(FindField('FO_STARTTIME').AsString,3,2);
          ed_FoodTo2Hour.Text := copy(FindField('FO_ENDTIME').AsString,1,2);
          ed_FoodTo2Min.Text := copy(FindField('FO_ENDTIME').AsString,3,2);
          ed_FoAmt2.Text := FindField('FO_AMT').AsString;
        end else if FindField('FO_FOODCODE').AsString = '003' then    //석식
        begin
          ed_FoodFrom3Hour.Text := copy(FindField('FO_STARTTIME').AsString,1,2);
          ed_FoodFrom3Min.Text := copy(FindField('FO_STARTTIME').AsString,3,2);
          ed_FoodTo3Hour.Text := copy(FindField('FO_ENDTIME').AsString,1,2);
          ed_FoodTo3Min.Text := copy(FindField('FO_ENDTIME').AsString,3,2);
          ed_FoAmt3.Text := FindField('FO_AMT').AsString;
        end else if FindField('FO_FOODCODE').AsString = '004' then  //야식
        begin
          ed_FoodFrom4Hour.Text := copy(FindField('FO_STARTTIME').AsString,1,2);
          ed_FoodFrom4Min.Text := copy(FindField('FO_STARTTIME').AsString,3,2);
          ed_FoodTo4Hour.Text := copy(FindField('FO_ENDTIME').AsString,1,2);
          ed_FoodTo4Min.Text := copy(FindField('FO_ENDTIME').AsString,3,2);
          ed_FoAmt4.Text := FindField('FO_AMT').AsString;
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAttendConfig.btn_SaveClick(Sender: TObject);
var
  stFoodDeviceType : string;
  nTemp : integer;
begin
  if chk_ATPrivateServer.Checked then UpdateTB_CONFIG('ATTEND','ATPRSERVER','TRUE')
  else UpdateTB_CONFIG('ATTEND','ATPRSERVER','FALSE');
  UpdateTB_CONFIG('ATTEND','ATTYPE',inttostr(cmb_ChangCnt.ItemIndex));
  if chk_AtTime.Checked then UpdateTB_CONFIG('ATTEND','IOTIMEUSE','1')
  else UpdateTB_CONFIG('ATTEND','IOTIMEUSE','0');
  if Not isdigit(ed_ATTime.Text) then ed_ATTime.Text := '10';
  UpdateTB_CONFIG('ATTEND','IOTIME',ed_ATTime.Text);

  if length(ed_YHour.Text) < 2 then ed_YHour.Text := '00';
  if length(ed_YMin.Text) < 2 then ed_YMin.Text := '00';
  if length(ed_ATHH.Text) < 2 then ed_ATHH.Text := '00';
  if length(ed_ATMM.Text) < 2 then ed_ATMM.Text := '00';
  UpdateTB_ATWORKTYPE('001','AW_YESTERDAYTIME',ed_YHour.Text + ed_YMin.Text);
  UpdateTB_ATWORKTYPE('001','AW_DEVICETYPE',inttostr(cmb_ATDeviceType.ItemIndex));
  UpdateTB_ATWORKTYPE('001','AW_ATSTARTBUTTON',ed_StartWorkNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_ATOFFBUTTON',ed_OffWorkNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_INOUTDEVICETYPE',inttostr(cmb_InOutDeviceType.ItemIndex));
  UpdateTB_ATWORKTYPE('001','AW_WORKOUTBUTTON',ed_WorkOutSideNo.Text);
  UpdateTB_ATWORKTYPE('001','AW_WORKINBUTTON',ed_WorkInNo.Text);

  UpdateTB_CONFIG('DAEMON','IP',ed_DaemonIP.Text);
  UpdateTB_CONFIG('DAEMON','PORT',ed_DaemonPort.Text );
  UpdateTB_CONFIG('DAEMON','FTPPORT',ed_FTPPort.Text );
  UpdateTB_CONFIG('DAEMON','ATPORT',ed_AtserverPort.Text );
  UpdateTB_CONFIG('DAEMON','CONTRLPORT',ed_ControlPort.Text );
  UpdateTB_CONFIG('DAEMON','STATEPORT',ed_StatePort.Text );
  UpdateTB_CONFIG('DAEMON','EVENTPORT',ed_EventPort.Text );
  if cmb_multiSocket.ItemIndex < 0 then cmb_multiSocket.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','MULTISOCK',inttostr(cmb_multiSocket.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','COMMLOG',inttostr(rg_CommLog.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','CARDLOG',inttostr(rg_CardLog.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','CSOCKTYPE',inttostr(cmb_SockType.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','EVENTDB',inttostr(cmb_EventDBType.ItemIndex) );

  UpdateTB_CONFIG('DAEMONLOG','DELETDAY',ed_LogDel.Text);
  if rd_AckSave.Checked then
    UpdateTB_CONFIG('DAEMON','FULLLOG','Y' )
  else UpdateTB_CONFIG('DAEMON','FULLLOG','N' );
  if chk_DaemonPW.Checked then
    UpdateTB_CONFIG('DAEMON','LOGINTYPE','TRUE' )
  else UpdateTB_CONFIG('DAEMON','LOGINTYPE','FALSE' );
  if chk_Clinetseq.Checked then
    UpdateTB_CONFIG('DAEMON','CLIENTSEQ','Y' )
  else UpdateTB_CONFIG('DAEMON','CLIENTSEQ','N' );
  UpdateTB_CONFIG('DAEMON','CLIENTTIME',ed_ClientTime.Text);

  if chk_AlarmEventLengthUse.Checked then
    UpdateTB_CONFIG('DAEMON','USEARMLEN','TRUE' )
  else UpdateTB_CONFIG('DAEMON','USEARMLEN','FALSE' );

  if chk_LineCheck.Checked then UpdateTB_CONFIG('DAEMON','LINECHECK','TRUE' )
  else UpdateTB_CONFIG('DAEMON','LINECHECK','FALSE' );

  UpdateTB_CONFIG('DAEMON','ALARMLEN',ed_AlarmEventLenth.Text );
  UpdateTB_CONFIG('DAEMON','SCHASYNC',inttostr(rg_ScheduleAsync.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','SCHDEVICE',inttostr(rg_ScheduleDevice.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','SCHUSEPACK',inttostr(rg_schUsepacket.ItemIndex) );

  if rg_DoorTimeCodeUse.ItemIndex = 1 then UpdateTB_CONFIG('DAEMON','TIMEUSE','TRUE')
  else UpdateTB_CONFIG('DAEMON','TIMEUSE','FALSE');

  if rd_CardAuto.Checked then
    UpdateTB_CONFIG('MCUCOMM','CARDAUTO','TRUE' )
  else UpdateTB_CONFIG('MCUCOMM','CARDAUTO','FALSE' );


  if rd_Auto.Checked then
    UpdateTB_CONFIG('DATABASE','AUTO','TRUE' )
  else UpdateTB_CONFIG('DATABASE','AUTO','FALSE' );
  UpdateTB_CONFIG('DATABASE','BACKCYCLE',ed_BackCycle.Text );
  if length(ed_BackHour.Text) < 2 then ed_BackHour.Text := '01';
  if length(ed_BackMin.Text) < 2 then ed_BackMin.Text := '00';
  UpdateTB_CONFIG('DATABASE','BACKTIME',ed_BackHour.Text + ed_BackMin.Text );
  ed_BackDir.Text := stringReplace(ed_BackDir.Text,'\\','\',[rfReplaceAll]);
  if DBType = 'PG' then
    UpdateTB_CONFIG('DATABASE','BACKDIR',stringReplace(ed_BackDir.Text,'\','\\',[rfReplaceAll]) )
  else UpdateTB_CONFIG('DATABASE','BACKDIR',ed_BackDir.Text );
  //UpdateTB_CONFIG('DATABASE','BACKDIR',ed_BackDir.Text );
  UpdateTB_CONFIG('DATABASE','AC_DELETE',ed_AcDel.Text );
  UpdateTB_CONFIG('DATABASE','AT_DELETE',ed_AtDel.Text );
  UpdateTB_CONFIG('DATABASE','EMP_DELETE',ed_EmpDel.Text );
  UpdateTB_CONFIG('DATABASE','FD_DELETE',ed_FdDel.Text );
  UpdateTB_CONFIG('DATABASE','PT_DELETE',ed_PtDel.Text );

  if chk_Short.Checked then UpdateTB_CONFIG('ALARM','SHORT','1' )
  else UpdateTB_CONFIG('ALARM','SHORT','0' );
  if chk_down.Checked then UpdateTB_CONFIG('ALARM','DOWN','1' )
  else UpdateTB_CONFIG('ALARM','DOWN','0' );

  if rg_AlarmView.ItemIndex = 0 then UpdateTB_CONFIG('MOSTYPE','ALARMVIEW','REAL')
  else UpdateTB_CONFIG('MOSTYPE','ALARMVIEW','QUERY');
  if chk_ArmAreaUse.Checked then UpdateTB_CONFIG('DAEMON','ARMAREAUSE','1')
  else UpdateTB_CONFIG('DAEMON','ARMAREAUSE','0');   

  //InsertATCode;
  if ed_FoAmt1.Text = '' then ed_FoAmt1.Text := '0';
  if ed_FoAmt2.Text = '' then ed_FoAmt2.Text := '0';
  if ed_FoAmt3.Text = '' then ed_FoAmt3.Text := '0';
  if ed_FoAmt4.Text = '' then ed_FoAmt4.Text := '0';

  UpdateTB_FOODCODE('001',ed_FoodFrom1Hour.Text + ed_FoodFrom1Min.Text ,ed_FoodTo1Hour.Text + ed_FoodTo1Min.Text,ed_FoAmt1.Text);
  UpdateTB_FOODCODE('002',ed_FoodFrom2Hour.Text + ed_FoodFrom2Min.Text ,ed_FoodTo2Hour.Text + ed_FoodTo2Min.Text,ed_FoAmt2.Text);
  UpdateTB_FOODCODE('003',ed_FoodFrom3Hour.Text + ed_FoodFrom3Min.Text ,ed_FoodTo3Hour.Text + ed_FoodTo3Min.Text,ed_FoAmt3.Text);
  UpdateTB_FOODCODE('004',ed_FoodFrom4Hour.Text + ed_FoodFrom4Min.Text ,ed_FoodTo4Hour.Text + ed_FoodTo4Min.Text,ed_FoAmt4.Text);

  if chk_dtAC.Checked then UpdateTB_CONFIG('MOSTYPE','ACCESS','Y' )
  else UpdateTB_CONFIG('MOSTYPE','ACCESS','N' );
  if chk_dtAT.Checked then UpdateTB_CONFIG('MOSTYPE','ATTEND','Y' )
  else UpdateTB_CONFIG('MOSTYPE','ATTEND','N' );
  if chk_dtPT.Checked then UpdateTB_CONFIG('MOSTYPE','ALARM','Y' )
  else UpdateTB_CONFIG('MOSTYPE','ALARM','N' );
  if chk_dtFD.Checked then UpdateTB_CONFIG('MOSTYPE','FOOD','Y' )
  else UpdateTB_CONFIG('MOSTYPE','FOOD','N' );
  if chk_dtSE.Checked then UpdateTB_CONFIG('MOSTYPE','SENSOR','Y' )
  else UpdateTB_CONFIG('MOSTYPE','SENSOR','N' );
  if chk_InOutCount.Checked then UpdateTB_CONFIG('MOSTYPE','INOUTCOUNT','Y' )
  else UpdateTB_CONFIG('MOSTYPE','INOUTCOUNT','N' );
  UpdateTB_CONFIG('MOSTYPE','MASTERID',ed_MasterID.Text );
  UpdateTB_CONFIG('MOSTYPE','FILEIP',ed_FileserverIP.Text );
  ed_FileServerDir.Text := stringReplace(ed_FileServerDir.Text,'\\','\',[rfReplaceAll]);
  if DBType = 'PG' then
    UpdateTB_CONFIG('MOSTYPE','FILEDIR',stringReplace(ed_FileServerDir.Text,'\','\\',[rfReplaceAll]) )
  else UpdateTB_CONFIG('MOSTYPE','FILEDIR',ed_FileServerDir.Text );

  if chk_pwLength.Checked then UpdateTB_CONFIG('MOSTYPE','PWLENUSE','TRUE' )
  else UpdateTB_CONFIG('MOSTYPE','PWLENUSE','FALSE' );
  if chk_COPHONEENC.Checked then UpdateTB_CONFIG('EMPLOYEE','ENCCOTEL','1' )
  else UpdateTB_CONFIG('EMPLOYEE','ENCCOTEL','0' );

  if chk_AutoLogOutUse.Checked then UpdateTB_CONFIG('COMMON','AUTOLOGOUT','1' )
  else UpdateTB_CONFIG('COMMON','AUTOLOGOUT','0' );
  UpdateTB_CONFIG('COMMON','AUTOLOTIME',ed_AutoLogOutTime.Text );
  if chk_LoginLimitUse.Checked then UpdateTB_CONFIG('COMMON','LOGINLIMIT','1' )
  else UpdateTB_CONFIG('COMMON','LOGINLIMIT','0' );
  UpdateTB_CONFIG('COMMON','LOGINCOUNT',ed_LoginLimitCnt.Text );
  if chk_CardFull.Checked then UpdateTB_CONFIG('COMMON','CARDFULL','1' )
  else UpdateTB_CONFIG('COMMON','CARDFULL','0' );

  UpdateTB_CONFIG('MOSTYPE','PWLENGTH',ed_PWLength.Text ) ;
  if chk_pwchar.Checked then UpdateTB_CONFIG('MOSTYPE','PWCHAR','TRUE' )
  else UpdateTB_CONFIG('MOSTYPE','PWCHAR','FALSE' );
  UpdateTB_CONFIG('MOSTYPE','PWCHANGE',ed_PWChange.text );

  if cmb_FoodDeviceType.ItemIndex = 0 then  stFoodDeviceType := 'READER'
  else stFoodDeviceType := 'DOOR';
  UpdateTB_CONFIG('MOSTYPE','FOODDEVICE',stFoodDeviceType );
  if cmb_FoodDeviceType.ItemIndex < 0 then cmb_FoodDeviceType.ItemIndex := 0;
  UpdateTB_CONFIG('MOSTYPE','FOODGRADE',inttostr(rg_FdGrade.itemIndex) );
  if cmb_Ftp.itemIndex < 0 then cmb_Ftp.itemIndex := 0;
  UpdateTB_CONFIG('DAEMON','FTPUSE',inttostr(cmb_Ftp.itemIndex) );
  if rg_MultiDaemon.ItemIndex < 0 then rg_MultiDaemon.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','MULTI',inttostr(rg_MultiDaemon.ItemIndex));
  UpdateTB_CONFIG('FOOD','DUPEVENT',inttostr(rg_DupEvent.ItemIndex) );
  UpdateTB_CONFIG('FOOD','YSDAYTIME',ed_FdYesterdayHH.Text + ed_FdYesterdayMM.Text );

  if rg_fdmsUse.ItemIndex = 0 then
    UpdateTB_CONFIG('RELAY','fdmsUSE','FALSE' )
  else
  begin
    {if cmb_DupCard.ItemIndex = 1 then
    begin
      showmessage('지문리더 사용시에는 1인당 2장이상 카드를 발급 하실 수 없습니다.');
      Exit;
    end; }
    if rg_fdmsdbtype.ItemIndex = 1 then
    begin
     UpdateTB_CONFIG('RELAY','fdmsUSE','TRUE' );
    end else
    begin
      if Not FileExists(ed_fdmsPath.Text) then
      begin
        showmessage('지문연동 파일이 잘못 되었습니다.');
        UpdateTB_CONFIG('RELAY','fdmsUSE','FALSE' );
      end else UpdateTB_CONFIG('RELAY','fdmsUSE','TRUE' );
    end;
  end;
  UpdateTB_CONFIG('RELAY','FDMSNO',ed_fdmsNo.Text );
  UpdateTB_CONFIG('RELAY','FDMSCARDLN',ed_fdmscardLen.Text );
  UpdateTB_CONFIG('RELAY','FDMSDBTYPE',inttostr(rg_fdmsdbtype.ItemIndex) );
  UpdateTB_CONFIG('RELAY','FDMSDBIP',ed_fdmsDBIP.Text );
  UpdateTB_CONFIG('RELAY','FDMSUSER',ed_fdmsUserid.Text );
  UpdateTB_CONFIG('RELAY','FDMSDBNAME',ed_fdmsDB.Text );
  UpdateTB_CONFIG('RELAY','FDMSDBPORT',ed_fdmsport.Text );
  if chk_FdmsNoAuto.Checked then UpdateTB_CONFIG('RELAY','FDMSNOAUTO','Y')
  else UpdateTB_CONFIG('RELAY','FDMSNOAUTO','N');

  if isDigit(ed_RelayPGPort.Text) then UpdateTB_CONFIG('RELAY','EMPSPORT',ed_RelayPGPort.Text);

  if chk_CardDelete.Checked then UpdateTB_CONFIG('RELAY','DELCARDUSE','Y')
  else UpdateTB_CONFIG('RELAY','DELCARDUSE','N');
  UpdateTB_CONFIG('RELAY','DCARDSTART',ed_cardDeleteStart.Text );
  UpdateTB_CONFIG('RELAY','DELCARDLEN',ed_CardDeleteLength.Text );
  if cmb_CardType.ItemIndex = 1 then  //가변길이 인 경우
  begin
    if rg_fdmsUse.ItemIndex > 0 then   //지문연동을 사용하면서
    begin
      if chk_ASCIIToHex.Checked then //ASCII to Hex 타입이면 확인 메시지를 출력하자
      begin
        if Application.MessageBox('지문연동방식이 ASCIITOHex 타입이 정확합니까?(통합16BYTE 타입은 ASCIITOHEX타입을 사용하시면 안됩니다.)','경고',MB_OKCANCEL) = ID_CANCEL then Exit;
      end;
    end;
    if Not chk_AlarmEventLengthUse.Checked then
    begin
      if Application.MessageBox('알람길이가변 사용안함이 정확합니까?(충남대 외 가변길이 사용시 알람길이가변을 사용해야 함)','경고',MB_OKCANCEL) = ID_CANCEL then Exit;
    end;
  end;
  if chk_ASCIIToHex.Checked then UpdateTB_CONFIG('RELAY','ASCIITOHEX','Y')
  else UpdateTB_CONFIG('RELAY','ASCIITOHEX','N');
  if chk_FdmsDepartCode.Checked then UpdateTB_CONFIG('RELAY','FDMSDEPART','TRUE')
  else UpdateTB_CONFIG('RELAY','FDMSDEPART','FALSE');
  UpdateTB_CONFIG('RELAY','EMPSERVER',inttostr(rg_RelayServer.ItemIndex));

  if chk_AutoFdmsCard.Checked then
  begin
    if cmb_CardType.ItemIndex = 2 then
    begin
      showmessage(chk_AutoFdmsCard.Caption + ' 항목은 KT사옥카드는  불가능합니다.');
      chk_AutoFdmsCard.Checked := False;
    end;
  end;
  if chk_AutoFdmsCard.Checked then UpdateTB_CONFIG('RELAY','AUTOFCARD','Y')
  else UpdateTB_CONFIG('RELAY','AUTOFCARD','N');


  if rg_ServerReader.ItemIndex < 0 then rg_ServerReader.ItemIndex := 0;
  //if Not InsertTB_CONFIG('RELAY','cardServer',inttostr(rg_ServerReader.ItemIndex),'카드서버연동유무') then
  UpdateTB_CONFIG('RELAY','cardServer',inttostr(rg_ServerReader.ItemIndex),'카드서버연동유무');

  if rg_Facecop.ItemIndex < 0 then rg_Facecop.ItemIndex := 0;
  UpdateTB_CONFIG('RELAY','FACECOP',inttostr(rg_Facecop.ItemIndex),'FaceCop연동유무');
  UpdateTB_CONFIG('RELAY','FACECOPIP',ed_FaceCopIP.Text,'FaceCopIP');
  if Not isDigit(ed_facecopCycleTime.Text) then ed_facecopCycleTime.Text := '1';
  UpdateTB_CONFIG('RELAY','FA_RETIME',ed_facecopCycleTime.Text);


  if cmb_PersonRelay.ItemIndex < 0 then cmb_PersonRelay.ItemIndex := 0;
  //if Not InsertTB_CONFIG('RELAY','PER_RELAY',inttostr(cmb_PersonRelay.ItemIndex),'사원정보연동유무') then
  UpdateTB_CONFIG('RELAY','PER_RELAY',inttostr(cmb_PersonRelay.ItemIndex),'사원정보연동유무');

  if cmb_setPersonRelay.ItemIndex < 0 then cmb_setPersonRelay.ItemIndex := 0;
  //if Not InsertTB_CONFIG('RELAY','PER_SRELAY',inttostr(cmb_setPersonRelay.ItemIndex),'보내는사원정보연동유무') then
  UpdateTB_CONFIG('RELAY','PER_SRELAY',inttostr(cmb_setPersonRelay.ItemIndex),'보내는사원정보연동유무');

  if cmb_SentenceRelay.ItemIndex < 0 then cmb_SentenceRelay.ItemIndex := 0;
  //if Not InsertTB_CONFIG('RELAY','SENT_RELAY',inttostr(cmb_SentenceRelay.ItemIndex),'전문연동유무') then
  UpdateTB_CONFIG('RELAY','SENT_RELAY',inttostr(cmb_SentenceRelay.ItemIndex),'전문연동유무');



  if DBType = 'PG' then
    UpdateTB_CONFIG('RELAY','fdmsPath',stringReplace(ed_fdmsPath.Text,'\','\\',[rfReplaceAll]),'지문path' )
  else UpdateTB_CONFIG('RELAY','fdmsPath',ed_fdmsPath.Text,'지문Path' );
  UpdateTB_CONFIG('RELAY','fdmsPW',ed_fdmsPw.Text,'지문Pw' );
  UpdateTB_CONFIG('RELAY','fdmsType',inttostr(rg_readerType.ItemIndex),'지문Type' );
  //if chk_sabun.Checked then
  //  UpdateTB_CONFIG('RELAY','fdmsEMCODE','TRUE','지문사번연동' )
  //else UpdateTB_CONFIG('RELAY','fdmsEMCODE','FALSE','지문사번연동' );

  if cmb_CardType.ItemIndex < 0 then cmb_CardType.ItemIndex := 0;
  //if Not InsertTB_CONFIG('COMMON','CARDNOTYPE',inttostr(cmb_CardType.ItemIndex),'카드번호Type(고정/가변)') then
  //begin
  UpdateTB_CONFIG('COMMON','CARDNOTYPE',inttostr(cmb_CardType.ItemIndex),'카드번호Type(고정/가변)');
  //end;

  if cmb_CardNumeric.ItemIndex < 0  then cmb_CardNumeric.ItemIndex := 0;
  if cmb_CardType.ItemIndex > 0 then cmb_CardNumeric.ItemIndex := 1;   //4Byte가 아니면 무조건 Ascii 타입으로 저장하자
  UpdateTB_CONFIG('COMMON','CARDNUM',inttostr(cmb_CardNumeric.ItemIndex),'카드숫자인식Type');

  if cmb_CardPositionNum.ItemIndex < 0  then cmb_CardPositionNum.ItemIndex := 0;
  //if Not InsertTB_CONFIG('COMMON','CAPOSINUM',inttostr(cmb_CardPositionNum.ItemIndex),'카드위치사용유무') then
  //begin
  UpdateTB_CONFIG('COMMON','CAPOSINUM',inttostr(cmb_CardPositionNum.ItemIndex),'카드위치사용유무');
  //end;

  if cmb_DupCard.ItemIndex < 0 then cmb_DupCard.ItemIndex := 0;
  //if Not InsertTB_CONFIG('COMMON','DUPCARD',inttostr(cmb_DupCard.ItemIndex),'1인당카드중복여부') then
  //begin
  UpdateTB_CONFIG('COMMON','DUPCARD',inttostr(cmb_DupCard.ItemIndex),'1인당카드중복여부');
  //end;

  if cmb_FireRecUse.ItemIndex < 0 then cmb_FireRecUse.ItemIndex := 0;
  //if Not InsertTB_CONFIG('FIRE','FIRERECUSE',inttostr(cmb_FireRecUse.ItemIndex),'화재복구사용유무') then
  //begin
  UpdateTB_CONFIG('FIRE','FIRERECUSE',inttostr(cmb_FireRecUse.ItemIndex),'화재복구사용유무');
  //end;

  if cmb_FireAllOpen.ItemIndex < 0 then cmb_FireAllOpen.ItemIndex := 0;
  //if Not InsertTB_CONFIG('FIRE','FIREOPEN',inttostr(cmb_FireAllOpen.ItemIndex),'화재감지시전체개방') then
  //begin
  UpdateTB_CONFIG('FIRE','FIREOPEN',inttostr(cmb_FireAllOpen.ItemIndex),'화재감지시전체개방');
  //end;

  if Trim(ed_FireStatus.Text) = '' then ed_FireStatus.Text := 'FI';
  //if Not InsertTB_CONFIG('FIRE','FIRESTATUS',ed_FireStatus.Text,'화재감지시상태값') then
  //begin
  UpdateTB_CONFIG('FIRE','FIRESTATUS',ed_FireStatus.Text,'화재감지시상태값');
  //end;
  UpdateTB_CONFIG('FIRE','RELAYUSE',inttostr(rg_FireRelayUse.ItemIndex),'화재연동릴레이사용유무');
  if cmb_FireRelayNo.ItemIndex < 4 then nTemp := cmb_FireRelayNo.ItemIndex + 1
  else nTemp := cmb_FireRelayNo.ItemIndex + 2; //OUT5 가 실제로는 6번릴레이임
  UpdateTB_CONFIG('FIRE','RELAYNO',inttostr(nTemp),'화재연동릴레이번호');
  nTemp := cmb_FireRelayTime.ItemIndex + 1;
  UpdateTB_CONFIG('FIRE','RELAYTIME',inttostr(nTemp),'화재연동릴레이시간');

  if cmb_DHCPUse.ItemIndex < 0 then cmb_DHCPUse.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','DEVICESVER',inttostr(cmb_DHCPUse.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','DTOSPORT1',ed_DeviceServerPort1.Text );
  UpdateTB_CONFIG('DAEMON','DTOSPORT2',ed_DeviceServerPort2.Text );
  UpdateTB_CONFIG('DAEMON','DTOSPORT3',ed_DeviceServerPort3.Text );
  //특화서비스
  if cmb_Special.ItemIndex < 0 then cmb_Special.ItemIndex := 0;
  UpdateTB_CONFIG('COMMON','SPECIALCD',inttostr(cmb_Special.ItemIndex) );
  UpdateTB_CONFIG('COMMON','EVENTSTART',ed_AlarmLogStart.Text,'알람이벤트로그시작');
  UpdateTB_CONFIG('COMMON','EVENTEND',ed_AlarmLogEnd.Text,'알람이벤트로그종료');
  UpdateTB_CONFIG('KT','OLDEMPDEL',inttostr(rg_OldCardDelete.ItemIndex),'KT사옥구사원증삭제');

  //if Not InsertTB_CONFIG('COMMON','ACEVENT',inttostr(cmb_ACEvent.ItemIndex),'0.전체이력,1.카드이벤트만') then
  //begin
  UpdateTB_CONFIG('COMMON','ACEVENT',inttostr(cmb_ACEvent.ItemIndex),'0.전체이력,1.카드이벤트만');
  //end;

  if Not isDigit(ed_Maxprocess.Text) then ed_Maxprocess.Text := '3';
  UpdateTB_CONFIG('DAEMON','MAXPROCESS',ed_Maxprocess.Text,'최대처리프로세스갯수');

  if chk_CardLenFixed.Checked then
    UpdateTB_CONFIG('CARD','CARDFIXED','TRUE','카드고정길이사용유무')
  else UpdateTB_CONFIG('CARD','CARDFIXED','FALSE','카드고정길이사용유무');
  UpdateTB_CONFIG('CARD','FILLCHAR',ed_FillChar.Text,'카드채움문자');
  if Not rg_Front.Checked then
    UpdateTB_CONFIG('CARD','FILLPOSI','1','채움문자위치 0:앞,1:뒤')
  else UpdateTB_CONFIG('CARD','FILLPOSI','0','채움문자위치 0:앞,1:뒤');
  UpdateTB_CONFIG('CARD','FIXEDLEN',ed_cardFiexedLen.Text,'카드고정길이');

  if rg_kttControlServerUses.ItemIndex < 0 then rg_kttControlServerUses.ItemIndex := 0;
  UpdateTB_CONFIG('KTT','KTTSUSES',inttostr(rg_kttControlServerUses.ItemIndex));
  UpdateTB_CONFIG('KTT','KTTSIP',ed_kttServerIP.Text );
  UpdateTB_CONFIG('KTT','KTTSPORT',ed_kttServerPort.Text );
  UpdateTB_CONFIG('KTT','KTTCPORT',ed_kttClientPort.Text );
  UpdateTB_CONFIG('KTT','KTTPCYCLE',ed_KTTPamCycle.Text );
  if rg_kttDDNSServerUses.ItemIndex < 0 then rg_kttDDNSServerUses.ItemIndex := 0;
  UpdateTB_CONFIG('KTT','DDNSUSES',inttostr(rg_kttDDNSServerUses.ItemIndex));
  UpdateTB_CONFIG('KTT','DDNS_SIP',ed_DDNSIP.Text );
  UpdateTB_CONFIG('KTT','DDNS_SPORT',ed_DDNSPort.Text );
  UpdateTB_CONFIG('KTT','DDNS_QIP',ed_DDNSQueryIP.Text );
  UpdateTB_CONFIG('KTT','DDNS_QPORT',ed_DDNSQueryPort.Text );
  UpdateTB_CONFIG('KTT','KTTSENDSER',inttostr(cmb_SendServer.ItemIndex));


  if rg_AntiPassGroup.ItemIndex < 0 then rg_AntiPassGroup.ItemIndex := 0;
  if rg_CardMemoryLoading.ItemIndex < 0 then rg_CardMemoryLoading.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','CARDMEMORY',inttostr(rg_CardMemoryLoading.ItemIndex) );  
  UpdateTB_CONFIG('DAEMON','GLANTIUSE',inttostr(rg_AntiPassGroup.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','GLINITUSE',inttostr(cmb_GlobalInit.ItemIndex) );
  if cmb_GlobalInit.ItemIndex = 0 then ed_GlobalInitTime.Text := '0';
  if Not isDigit(ed_GlobalInitTime.Text) then ed_GlobalInitTime.Text := '0';
  UpdateTB_CONFIG('DAEMON','GLINITTIME',ed_GlobalInitTime.Text );
  UpdateTB_CONFIG('DAEMON','GLINITSTM',FillZeroStrNum(ed_AntiInitStartTime.Text,4) );
  UpdateTB_CONFIG('DAEMON','GLINITETM',FillZeroStrNum(ed_AntiInitEndTime.Text,4) );
  if isDigit(ed_ModBusPort.Text) then
    UpdateTB_CONFIG('DAEMON','MODBUSPORT',ed_ModBusPort.Text);

  if chk_CardDeleteUse.Checked then UpdateTB_CONFIG('COMMON','CARDDLTUSE','1')
  else UpdateTB_CONFIG('COMMON','CARDDLTUSE','0');
  UpdateTB_CONFIG('COMMON','CARDDELETE',ed_CardDeleteDay.Text);
  if rg_DevicePermitSync.itemindex = 0 then
  begin
    if Application.MessageBox('카드권한동기화 사용 안함으로 선택시 권한등록이나 삭제가 원활하지 않을 수 있습니다.','경고',MB_OKCANCEL) = ID_CANCEL then Exit;
  end;
  UpdateTB_CONFIG('COMMON','PERMITSYNC',inttostr(rg_DevicePermitSync.itemindex));
  if rg_DevicePermitSync.itemindex = 0 then G_bDeviceCardPermitSync := False
  else G_bDeviceCardPermitSync := True;

  if ed_LongTimeCode.Text <> '' then
  begin
    if Length(ed_LongTimeCode.Text) <> 2 then
    begin
      showmessage('장시간문열림 알람 발생 하시려면 코드는 2자리로 사용 하셔야 합니다.');
      Exit;
    end;
  end;
  UpdateTB_CONFIG('DAEMON','LONGTIMECD',ed_LongTimeCode.Text);

  if cmb_FoodDeviceType.ItemIndex = 0 then
  begin
    if rg_FdGrade.ItemIndex = 0 then
    begin
      showmessage('식수 사용을 리더 구분으로 하실 경우에는 권한은 서버에서만 적용할 수 있습니다.');
      Exit;
    end;
  end;

  if tab_SonghoFood.Visible then
  begin
    if Not CheckeFormatSemester then
    begin
      showmessage('학기중 겹치는 기간이 존재 합니다. 학기중 날짜를 확인 하여 주세요.');
      Exit;
    end;
    SemesterDataSave;
    SonghoFoodConfigSave;
  end;
  //Change_ATWORKTYPE;

  Showmessage('환경설정 변경후에는 데몬서비스를 종료후 재시작하여 주시기 바랍니다.');
  Close;
end;

function TfmAttendConfig.UpdateTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string;aConfigDetail:string=''): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_CONFIG ';
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''' ';
  if aConfigDetail <> '' then
  stSql := stSql + ', CO_CONFIGDETAIL = ''' + aConfigDetail + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND CO_CONFIGGROUP = ''' + aCONFIGGROUP + ''' ';
  stSql := stSql + ' AND CO_CONFIGCODE = ''' + aCONFIGCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

function TfmAttendConfig.UpdateTB_FOODCODE(aFOODCODE, aSTARTTIME,
  aENDTIME,aFOAMT: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Update TB_FOODCODE ';
  stSql := stSql + ' Set FO_STARTTIME = ''' + aSTARTTIME + ''', ';
  stSql := stSql + ' FO_ENDTIME = ''' + aENDTIME + ''', ';
  stSql := stSql + ' FO_AMT = ' + aFOAMT ;
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND FO_FOODCODE = ''' + aFOODCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;
{
procedure TfmAttendConfig.InsertATCode;
var
  stSql : string;
  stInFromTime : string;
  stInToTime : string;
  stWorkFromTime : string;
  stWorkToTime : string;
begin
  stSql := 'Delete From TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';

  DataModule1.ProcessExecSQL(stSql);

  stInFromTime := ed_InFrom1Hour.Text + ed_InFrom1Min.Text;
  stInToTime := ed_InTo1Hour.Text + ed_InTo1Min.Text;
  stWorkFromTime := ed_WorkFrom1Hour.Text + ed_WorkFrom1Min.Text;
  stWorkToTime := ed_WorkTo1Hour.Text + ed_WorkTo1Min.Text;
  InsertTB_ATCODE('001','1교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);

  if cmb_ChangCnt.ItemIndex > 0 then
  begin
    stInFromTime := ed_InFrom2Hour.Text + ed_InFrom2Min.Text;
    stInToTime := ed_InTo2Hour.Text + ed_InTo2Min.Text;
    stWorkFromTime := ed_WorkFrom2Hour.Text + ed_WorkFrom2Min.Text;
    stWorkToTime := ed_WorkTo2Hour.Text + ed_WorkTo2Min.Text;
    InsertTB_ATCODE('002','2교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

  if cmb_ChangCnt.ItemIndex > 1 then
  begin
    stInFromTime := ed_InFrom3Hour.Text + ed_InFrom3Min.Text;
    stInToTime := ed_InTo3Hour.Text + ed_InTo3Min.Text;
    stWorkFromTime := ed_WorkFrom3Hour.Text + ed_WorkFrom3Min.Text;
    stWorkToTime := ed_WorkTo3Hour.Text + ed_WorkTo3Min.Text;
    InsertTB_ATCODE('003','3교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

  if cmb_ChangCnt.ItemIndex > 2 then
  begin
    stInFromTime := ed_InFrom4Hour.Text + ed_InFrom4Min.Text;
    stInToTime := ed_InTo4Hour.Text + ed_InTo4Min.Text;
    stWorkFromTime := ed_WorkFrom4Hour.Text + ed_WorkFrom4Min.Text;
    stWorkToTime := ed_WorkTo4Hour.Text + ed_WorkTo4Min.Text;
    InsertTB_ATCODE('004','4교대',stInFromTime,stInToTime,stWorkFromTime,stWorkToTime);
  end;

end;  }

function TfmAttendConfig.InsertTB_ATCODE(aATCODE, aATName, aInFromTime,
  aInToTime, aWorkFromTime, aWorkToTime: string): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := ' Insert Into TB_ATCODE( ';
  stSql := stSql + ' GROUP_CODE,AT_ATCODE,AT_CODENAME,';
  stSql := stSql + ' AT_WORKSTARTTIME,AT_WORKENDTIME,AT_INFROMTIME,AT_INTOTIME )';
  stSql := stSql + ' Values ( ';
  stSql := stSql + '''' + GROUPCODE + ''',';
  stSql := stSql + '''' + aATCODE + ''',';
  stSql := stSql + '''' + aATName + ''',';
  stSql := stSql + '''' + aWorkFromTime + ''',';
  stSql := stSql + '''' + aWorkToTime + ''',';
  stSql := stSql + '''' + aInFromTime + ''',';
  stSql := stSql + '''' + aInToTime + ''') ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAttendConfig.rd_OperClick(Sender: TObject);
begin
  if rd_Oper.Checked then
  begin
    GroupBox14.Enabled := False;
    GroupBox16.Enabled := False;
  end;
end;

procedure TfmAttendConfig.rd_AutoClick(Sender: TObject);
begin
  if rd_Auto.Checked then
  begin
    GroupBox14.Enabled := True;
    GroupBox16.Enabled := True;
  end;

end;

procedure TfmAttendConfig.SpeedButton2Click(Sender: TObject);
var
  sStr : string;
begin
 if Trim( ed_FileserverIP.Text) = '' then
  begin
    showmessage('파일서버 IP를 먼저 셋팅해 주세요.');
    Exit;
  end;
  if SelectDirectory('\\' + ed_FileserverIP.Text + '\','\\' + ed_FileserverIP.Text + '\',sStr) then
  begin
    ed_FileServerDir.Text := sStr;
  end;
end;

procedure TfmAttendConfig.rg_fdmsUseClick(Sender: TObject);
begin
  if rg_fdmsUse.ItemIndex = 0 then gb_fdms.Visible := False
  else gb_fdms.Visible := True;
end;

procedure TfmAttendConfig.btn_fdmsSearchClick(Sender: TObject);
begin
  OpenDialog1.DefaultExt := 'mdb';
  OpenDialog1.Filter := 'Access files (*.mdb)|*.MDB';
  if OpenDialog1.Execute then
  begin
    ed_fdmsPath.Text := OpenDialog1.FileName;  
  end;
end;

procedure TfmAttendConfig.cmb_FoodDeviceTypeChange(Sender: TObject);
begin
  if cmb_FoodDeviceType.ItemIndex = 0 then rg_FdGrade.ItemIndex := 1;
end;

procedure TfmAttendConfig.rg_readerTypeClick(Sender: TObject);
begin
  Label15.Visible := False;
  if (rg_readerType.ItemIndex = 0) or (rg_readerType.ItemIndex = 2) or (rg_readerType.ItemIndex = 3) then
  begin
    rg_fdmsdbtype.Enabled := True;
    if rg_fdmsdbtype.ItemIndex = 0 then
    begin
      lb_fdmsPw.Visible := False;
      ed_fdmsPw.Visible := False;
      lb_fdmsport.Visible := False;
      ed_fdmsport.Visible := False;
      lb_fdmsUserid.Visible := False;
      ed_fdmsUserid.Visible := False;
      lb_fdmsDB.Visible := False;
      ed_fdmsDB.Visible := False;
      ed_fdmsDBIP.Visible := False;
      ed_fdmsPath.Visible := True;
      lb_File.Caption := '지문연동파일';
    end else
    begin
      lb_fdmsPw.Visible := True;
      ed_fdmsPw.Visible := True;
      lb_fdmsport.Visible := True;
      ed_fdmsport.Visible := True;
      lb_fdmsUserid.Visible := True;
      ed_fdmsUserid.Visible := True;
      lb_fdmsDB.Visible := True;
      ed_fdmsDB.Visible := True;
      ed_fdmsDBIP.Visible := True;
      ed_fdmsPath.Visible := False;
      lb_File.Caption := 'DB IP';
      Label15.Visible := True;
    end;
    if(rg_readerType.ItemIndex = 3) then
    begin
      ed_fdmsDB.Text := 'DigetSystem';
      //ed_fdmsPw.Text := 'tjdgus123!@';
    end;

  end else
  begin
    lb_fdmsPw.Visible := True;
    ed_fdmsPw.Visible := True;
    lb_fdmsport.Visible := False;
    ed_fdmsport.Visible := False;
    lb_fdmsUserid.Visible := False;
    ed_fdmsUserid.Visible := False;
    lb_fdmsDB.Visible := False;
    ed_fdmsDB.Visible := False;
    ed_fdmsDBIP.Visible := False;
    ed_fdmsPath.Visible := True;
    rg_fdmsdbtype.Enabled := False;
    lb_File.Caption := '지문연동파일';
  end;
end;

function TfmAttendConfig.InsertTB_CONFIG(aCONFIGGROUP, aCONFIGCODE,
  aCONFIGVALUE: string;aConfigDetail:string=''): Boolean;
var
  stSql : string;
begin
  Result := False;

  stSql := 'Insert Into TB_CONFIG (';
  stSql := stSql + ' GROUP_CODE ,';
  stSql := stSql + ' CO_CONFIGGROUP ,';
  stSql := stSql + ' CO_CONFIGCODE ,';
  stSql := stSql + ' CO_CONFIGVALUE,';
  stSql := stSql + ' CO_CONFIGDETAIL ) ';
  stSql := stSql + ' Values ( ';
  stSql := stSql + ' ''' + GROUPCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGGROUP + ''', ';
  stSql := stSql + ' ''' + aCONFIGCODE + ''', ';
  stSql := stSql + ' ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' ''' + aConfigDetail + ''' ) ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmAttendConfig.btn_perRelayConfigClick(Sender: TObject);
begin
  fmperRelayConfig:= TfmperRelayConfig.Create(Self);
  fmperRelayConfig.gb_dbConfig2.Enabled := True;
  fmperRelayConfig.gb_dbConfig1.Enabled := True;
  if (cmb_setPersonRelay.ItemIndex = 0) then
  begin
    fmperRelayConfig.gb_dbConfig2.Enabled := False;
  end;
  if (cmb_PersonRelay.ItemIndex = 0) or (cmb_PersonRelay.ItemIndex = 4) then
  begin
    fmperRelayConfig.gb_dbConfig1.Enabled := False;
  end else
  begin
    if (cmb_PersonRelay.ItemIndex = 3) then
    begin
      fmperRelayConfig.gb_dbConfig2.Enabled := True;
    end;
  end;
  fmperRelayConfig.SHowmodal;
  fmperRelayConfig.Free;

end;

procedure TfmAttendConfig.btn_RelaysentenceClick(Sender: TObject);
begin
  fmRelaysentence:= TfmRelaysentence.Create(Self);
  fmRelaysentence.SHowmodal;
  fmRelaysentence.Free;

end;

procedure TfmAttendConfig.cmb_DupCardChange(Sender: TObject);
begin
  if cmb_DupCard.ItemIndex = 1 then
  begin
    cmb_CardPositionNum.ItemIndex := 0;
    cmb_CardPositionNum.Enabled := False;
  end else cmb_CardPositionNum.Enabled := True ;
end;

procedure TfmAttendConfig.rg_MultiDaemonClick(Sender: TObject);
begin
  if rg_MultiDaemon.ItemIndex = 0 then
  begin
    pan_SingleD.Visible := True;
    Pan_MulitD.Visible := False;
  end else
  begin
    pan_SingleD.Visible := False;
    Pan_MulitD.Visible := True;
  end;
end;

procedure TfmAttendConfig.chk_CardLenFixedClick(Sender: TObject);
begin
  pan_CardFix.Visible := chk_CardLenFixed.Checked;
end;

procedure TfmAttendConfig.cmb_ATDeviceTypeChange(Sender: TObject);
begin
  if cmb_ATDeviceType.ItemIndex = 0 then pan_ATNO.Visible := False
  else pan_ATNO.Visible := True;
end;

procedure TfmAttendConfig.cmb_InOutDeviceTypeChange(Sender: TObject);
begin
  if cmb_InOutDeviceType.ItemIndex <> 0 then pan_OUTNO.Visible := True
  else pan_OUTNO.Visible := False;
end;

procedure TfmAttendConfig.rg_kttControlServerUsesClick(Sender: TObject);
var
  stSql : string;
begin
  if rg_kttControlServerUses.ItemIndex = 1 then
  begin
    if cmb_Special.ItemIndex = 1 then
    begin
      showmessage('KT사옥용 프로그램에서는 사용할 수 없는 기능입니다.');   //KT사옥용에서는 Operater 부분에서 카드번호를 추출할 수 없다.
      rg_kttControlServerUses.ItemIndex := 0;
      Exit;
    end;
    (*if cmb_CardType.ItemIndex <> 0 then
    begin
      showmessage('범용시스템에서만 사용할 수 있습니다.');
      rg_kttControlServerUses.ItemIndex := 0;
      Exit;
    end;  *)
(*    if DBTYPE = 'PG' then stSql := PostGreSql.AlterTB_ALARMEVENTKTTSENDSTATUS_Add
    else if DBTYPE = 'MSSQL' then stSql := MSSQL.AlterTB_ALARMEVENTKTTSENDSTATUS_Add
    else if DBTYPE = 'MDB' then stSql := MDBSql.AlterTB_ALARMEVENTKTTSENDSTATUS_Add
    else if DBTYPE = 'FB' then stSql := FireBird.AlterTB_ALARMEVENTKTTSENDSTATUS_Add
    else Exit;
    DataModule1.ProcessEventExecSQL(stSql);  *)
  end;
end;

procedure TfmAttendConfig.chk_ClinetseqClick(Sender: TObject);
begin
  ed_ClientTime.Visible := chk_Clinetseq.Checked;
end;

procedure TfmAttendConfig.cmb_CardTypeChange(Sender: TObject);
begin
  if cmb_CardType.ItemIndex <> 0 then rg_kttControlServerUses.ItemIndex := 0;
end;

procedure TfmAttendConfig.cmb_SpecialChange(Sender: TObject);
begin
  rg_OldCardDelete.Visible := False;
  if cmb_Special.ItemIndex = 1 then
  begin
    rg_OldCardDelete.Visible := True;
    rg_kttControlServerUses.ItemIndex := 0;
  end;
  if cmb_Special.ItemIndex = 4 then gb_ArmStateView.Visible := True
  else gb_ArmStateView.Visible := False;
  if cmb_Special.ItemIndex = 5 then tab_SonghoFood.tabVisible := True
  else tab_SonghoFood.tabVisible := False;
  if cmb_Special.ItemIndex = 7 then gb_ModebusPort.Visible := True
  else gb_ModebusPort.Visible := False;
end;

procedure TfmAttendConfig.Change_ATWORKTYPE;
var
  stSql : string;
  stTemp : string;
  stAW_YESTERDAYTIME : string; //어제 날짜 기준 시간
  stAW_SATURDAYTYPE : string; //토요일근무타입 0:공휴일,1:반휴일,2:평일
  stAW_DEVICETYPE : string; //0:업데이트,1:카드리더,2:버튼방식
  stAW_FIXATTYPE : string; //0:정상,1:전직원 정상 출퇴근
  stAW_NOTBACKUPTYPE : string; //0:미복귀시조퇴처리,1:미복귀시정상퇴근
  stAW_ATSTARTBUTTON : string; //출근조작버튼
  stAW_ATOFFBUTTON : string; //퇴근조작버튼
  stAW_INOUTDEVICETYPE : string; //외출-0:사용안함,1:리더,2:버튼
  stAW_WORKOUTBUTTON : string; //외출조작버튼
  stAW_WORKINBUTTON : string; //복귀조작버튼
begin
  stSql := 'select * from TB_CONFIG ';
  stSql := stSql + ' where CO_CONFIGGROUP = ''ATTEND'' ';

  with DataModule1.ADOQuery do
  begin
    Close;
    Sql.Text := stSql;
    Try
      Open;
    Except
      Exit;
    End;

    While Not Eof do
    begin
      if FindField('CO_CONFIGCODE').AsString = 'ATTYPE1' then stAW_FIXATTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'DEVICETYPE' then stAW_DEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'INOUTTYPE' then stAW_INOUTDEVICETYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OFFWKNO' then stAW_ATOFFBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'OUTTIME' then stAW_NOTBACKUPTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'SATURDAY' then stAW_SATURDAYTYPE := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'STARTWKNO' then stAW_ATSTARTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKINNO' then stAW_WORKINBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'WKOUTNO' then stAW_WORKOUTBUTTON := FindField('CO_CONFIGVALUE').AsString
      else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then stAW_YESTERDAYTIME := FindField('CO_CONFIGVALUE').AsString ;

      Next;
    end;
    stTemp := 'Update TB_ATWORKTYPE set ';
    stTemp := stTemp + 'AW_YESTERDAYTIME = ''' + stAW_YESTERDAYTIME + ''',';
    stTemp := stTemp + 'AW_SATURDAYTYPE = ''' + stAW_SATURDAYTYPE + ''',';
    stTemp := stTemp + 'AW_DEVICETYPE = ''' + stAW_DEVICETYPE + ''',';
    stTemp := stTemp + 'AW_FIXATTYPE = ''' + stAW_FIXATTYPE + ''',';
    stTemp := stTemp + 'AW_NOTBACKUPTYPE = ''' + stAW_NOTBACKUPTYPE + ''',';
    stTemp := stTemp + 'AW_ATSTARTBUTTON = ''' + stAW_ATSTARTBUTTON + ''',';
    stTemp := stTemp + 'AW_ATOFFBUTTON = ''' + stAW_ATOFFBUTTON + ''',';
    stTemp := stTemp + 'AW_INOUTDEVICETYPE = ''' + stAW_INOUTDEVICETYPE + ''',';
    stTemp := stTemp + 'AW_WORKOUTBUTTON = ''' + stAW_WORKOUTBUTTON + ''',';
    stTemp := stTemp + 'AW_WORKINBUTTON = ''' + stAW_WORKINBUTTON + ''' ';
    stTemp := stTemp + 'Where AW_CODE = ''001'' ';

    DataModule1.ProcessExecSQL(stTemp);
  end;
end;

procedure TfmAttendConfig.GetNewAtConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_ATWORKTYPE ';
  stSql := stSql + ' Where AW_CODE = ''001'' ';

  Try
    CoInitialize(nil);
    TempAdoQuery := TADOQuery.Create(nil);
    TempAdoQuery.Connection := DataModule1.ADOConnection;

    with TempAdoQuery do
    begin
      Close;
      Sql.Text := stSql;
      Try
        Open;
      Except
        Exit;
      End;
      if recordCount < 1 then Exit;
      if isDigit(FindField('AW_DEVICETYPE').AsString) then
      begin
          cmb_ATDeviceType.ItemIndex := strtoint(FindField('AW_DEVICETYPE').AsString);
          cmb_ATDeviceTypeChange(cmb_ATDeviceType);
      end else cmb_ATDeviceType.ItemIndex := 0;

      ed_StartWorkNo.Text:= FindField('AW_ATSTARTBUTTON').AsString;
      ed_OffWorkNo.Text := FindField('AW_ATOFFBUTTON').AsString;
      ed_WorkOutSideNo.Text := FindField('AW_WORKOUTBUTTON').AsString;
      ed_WorkInNo.Text := FindField('AW_WORKINBUTTON').AsString;
      if isDigit(FindField('AW_INOUTDEVICETYPE').AsString) then
      begin
        cmb_InOutDeviceType.ItemIndex := strtoint(FindField('AW_INOUTDEVICETYPE').AsString);
        cmb_InOutDeviceTypeChange(cmb_InOutDeviceType);
      end else cmb_InOutDeviceType.ItemIndex := 0;
      ed_YHour.Text := copy(FindField('AW_YESTERDAYTIME').AsString,1,2);
      ed_YMin.Text := copy(FindField('AW_YESTERDAYTIME').AsString,3,2);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;

end;

function TfmAttendConfig.UpdateTB_ATWORKTYPE(aCode, aField,
  aValue: string): Boolean;
var
  stSql : string;
begin
  stSql := 'Update TB_ATWORKTYPE set ' + aField + ' = ''' + aValue + ''' ';
  stSql := stSql + ' Where AW_CODE = ''' + aCode + ''' ';

  result := DataModule1.ProcessExecSQL(stSql);
end;

procedure TfmAttendConfig.btn_faceconnectClick(Sender: TObject);
begin                                                         //'facedb'
  if dmRelayDB.FaceCopDataBaseConnect(ed_FaceCopIP.text,'5432','postgres','postgres','topadmin',True) then showmessage('접속성공')
  else showmessage('접속실패');
end;

procedure TfmAttendConfig.GetSemester;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
  stTemp : string;
begin
  stSql := 'select * from TB_SEMESTER ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE  + ''' ';

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

      if Recordcount < 1 then
      begin
        Exit;
      end;

      First;
      while Not Eof do
      begin
        if FindField('SE_CODE').AsInteger = 1 then    //1학기
        begin
          if FindField('SE_USE').AsString = 'Y' then chk_semester1.Checked := True
          else chk_semester1.Checked := False;
          stTemp := FindField('SE_STARTDATE').AsString;
          cmb_StartMM1.ItemIndex := cmb_StartMM1.Items.IndexOf(copy(stTemp,1,2));
          cmb_StartDD1.ItemIndex := cmb_StartDD1.Items.IndexOf(copy(stTemp,3,2));
          stTemp := FindField('SE_ENDDATE').AsString;
          cmb_ENDMM1.ItemIndex := cmb_ENDMM1.Items.IndexOf(copy(stTemp,1,2));
          cmb_ENDDD1.ItemIndex := cmb_ENDDD1.Items.IndexOf(copy(stTemp,3,2));
        end else if FindField('SE_CODE').AsInteger = 2 then  //2학기
        begin
          if FindField('SE_USE').AsString = 'Y' then chk_semester2.Checked := True
          else chk_semester2.Checked := False;
          stTemp := FindField('SE_STARTDATE').AsString;
          cmb_StartMM2.ItemIndex := cmb_StartMM2.Items.IndexOf(copy(stTemp,1,2));
          cmb_StartDD2.ItemIndex := cmb_StartDD2.Items.IndexOf(copy(stTemp,3,2));
          stTemp := FindField('SE_ENDDATE').AsString;
          cmb_ENDMM2.ItemIndex := cmb_ENDMM2.Items.IndexOf(copy(stTemp,1,2));
          cmb_ENDDD2.ItemIndex := cmb_ENDDD2.Items.IndexOf(copy(stTemp,3,2));
        end else if FindField('SE_CODE').AsInteger = 3 then  //3학기
        begin
          if FindField('SE_USE').AsString = 'Y' then chk_semester3.Checked := True
          else chk_semester3.Checked := False;
          stTemp := FindField('SE_STARTDATE').AsString;
          cmb_StartMM3.ItemIndex := cmb_StartMM3.Items.IndexOf(copy(stTemp,1,2));
          cmb_StartDD3.ItemIndex := cmb_StartDD3.Items.IndexOf(copy(stTemp,3,2));
          stTemp := FindField('SE_ENDDATE').AsString;
          cmb_ENDMM3.ItemIndex := cmb_ENDMM3.Items.IndexOf(copy(stTemp,1,2));
          cmb_ENDDD3.ItemIndex := cmb_ENDDD3.Items.IndexOf(copy(stTemp,3,2));
        end else if FindField('SE_CODE').AsInteger = 4 then  //4학기
        begin
          if FindField('SE_USE').AsString = 'Y' then chk_semester4.Checked := True
          else chk_semester4.Checked := False;
          stTemp := FindField('SE_STARTDATE').AsString;
          cmb_StartMM4.ItemIndex := cmb_StartMM4.Items.IndexOf(copy(stTemp,1,2));
          cmb_StartDD4.ItemIndex := cmb_StartDD4.Items.IndexOf(copy(stTemp,3,2));
          stTemp := FindField('SE_ENDDATE').AsString;
          cmb_ENDMM4.ItemIndex := cmb_ENDMM4.Items.IndexOf(copy(stTemp,1,2));
          cmb_ENDDD4.ItemIndex := cmb_ENDDD4.Items.IndexOf(copy(stTemp,3,2));
        end;
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmAttendConfig.GetSonghoConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_SONGHOFDCONFIG ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE  + ''' ';

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

      if Recordcount < 1 then
      begin
        Exit;
      end;

      First;
      while Not Eof do
      begin
        if FindField('SF_CODE').AsString = 'DAY' then    //일별제한 횟수
        begin
          if FindField('SF_USE').AsString = 'Y' then chk_DayLimit.Checked := True
          else chk_DayLimit.Checked := False;
          ed_songhoDayCount.Text := FindField('SF_COUNT').AsString;
        end else if FindField('SF_CODE').AsString = 'WEEK' then  //주별제한 횟수
        begin
          if FindField('SF_USE').AsString = 'Y' then chk_WeekLimit.Checked := True
          else chk_WeekLimit.Checked := False;
          ed_songhoWeekCount.Text := FindField('SF_COUNT').AsString;
        end else if FindField('SF_CODE').AsString = 'SEMESTER' then    //학기별 제한 횟수
        begin
          if FindField('SF_USE').AsString = 'Y' then chk_semesterLimit.Checked := True
          else chk_semesterLimit.Checked := False;
          ed_songhoSemesterCount.Text := FindField('SF_COUNT').AsString;
        end;   
        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

function TfmAttendConfig.CheckeFormatSemester: Boolean;
var
  stTemp1 : string;
  stTemp2 : string;
  stStartDate : string;
  stEndDate : string;
begin
  result := False;

  if chk_semester1.Checked then
  begin
    stTemp1 := cmb_StartMM1.Text + cmb_StartDD1.Text;
    stTemp2 := cmb_ENDMM1.Text + cmb_ENDDD1.Text;
    if chk_semester2.Checked then
    begin
      stStartDate := cmb_StartMM2.Text + cmb_StartDD2.Text;
      stEndDate := cmb_ENDMM2.Text + cmb_ENDDD2.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester3.Checked then
    begin
      stStartDate := cmb_StartMM3.Text + cmb_StartDD3.Text;
      stEndDate := cmb_ENDMM3.Text + cmb_ENDDD3.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester4.Checked then
    begin
      stStartDate := cmb_StartMM4.Text + cmb_StartDD4.Text;
      stEndDate := cmb_ENDMM4.Text + cmb_ENDDD4.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
  end;
  if chk_semester2.Checked then
  begin
    stTemp1 := cmb_StartMM2.Text + cmb_StartDD2.Text;
    stTemp2 := cmb_ENDMM2.Text + cmb_ENDDD2.Text;
    if chk_semester1.Checked then
    begin
      stStartDate := cmb_StartMM1.Text + cmb_StartDD1.Text;
      stEndDate := cmb_ENDMM1.Text + cmb_ENDDD1.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester3.Checked then
    begin
      stStartDate := cmb_StartMM3.Text + cmb_StartDD3.Text;
      stEndDate := cmb_ENDMM3.Text + cmb_ENDDD3.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester4.Checked then
    begin
      stStartDate := cmb_StartMM4.Text + cmb_StartDD4.Text;
      stEndDate := cmb_ENDMM4.Text + cmb_ENDDD4.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
  end;
  if chk_semester3.Checked then
  begin
    stTemp1 := cmb_StartMM3.Text + cmb_StartDD3.Text;
    stTemp2 := cmb_ENDMM3.Text + cmb_ENDDD3.Text;
    if chk_semester1.Checked then
    begin
      stStartDate := cmb_StartMM1.Text + cmb_StartDD1.Text;
      stEndDate := cmb_ENDMM1.Text + cmb_ENDDD1.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester2.Checked then
    begin
      stStartDate := cmb_StartMM2.Text + cmb_StartDD2.Text;
      stEndDate := cmb_ENDMM2.Text + cmb_ENDDD2.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester4.Checked then
    begin
      stStartDate := cmb_StartMM4.Text + cmb_StartDD4.Text;
      stEndDate := cmb_ENDMM4.Text + cmb_ENDDD4.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
  end;
  if chk_semester4.Checked then
  begin
    stTemp1 := cmb_StartMM4.Text + cmb_StartDD4.Text;
    stTemp2 := cmb_ENDMM4.Text + cmb_ENDDD4.Text;
    if chk_semester1.Checked then
    begin
      stStartDate := cmb_StartMM1.Text + cmb_StartDD1.Text;
      stEndDate := cmb_ENDMM1.Text + cmb_ENDDD1.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester2.Checked then
    begin
      stStartDate := cmb_StartMM2.Text + cmb_StartDD2.Text;
      stEndDate := cmb_ENDMM2.Text + cmb_ENDDD2.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
    if chk_semester3.Checked then
    begin
      stStartDate := cmb_StartMM3.Text + cmb_StartDD3.Text;
      stEndDate := cmb_ENDMM3.Text + cmb_ENDDD3.Text;
      if (stTemp1 > stStartDate) and (stTemp1 < stEndDate) then Exit;
      if (stTemp2 > stStartDate) and (stTemp2 < stEndDate) then Exit;
    end;
  end;
  result := True;
end;

function TfmAttendConfig.SemesterDataSave: Boolean;
var
  stSql : string;
begin
  if chk_semester1.Checked then
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('1','SE_USE','Y')
  else
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('1','SE_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('1','SE_STARTDATE',cmb_StartMM1.Text + cmb_StartDD1.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('1','SE_ENDDATE',cmb_ENDMM1.Text + cmb_ENDDD1.Text);
  DataModule1.ProcessExecSQL(stSql);

  if chk_semester2.Checked then
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('2','SE_USE','Y')
  else
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('2','SE_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('2','SE_STARTDATE',cmb_StartMM2.Text + cmb_StartDD2.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('2','SE_ENDDATE',cmb_ENDMM2.Text + cmb_ENDDD2.Text);
  DataModule1.ProcessExecSQL(stSql);

  if chk_semester3.Checked then
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('3','SE_USE','Y')
  else
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('3','SE_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('3','SE_STARTDATE',cmb_StartMM3.Text + cmb_StartDD3.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('3','SE_ENDDATE',cmb_ENDMM3.Text + cmb_ENDDD3.Text) ;
  DataModule1.ProcessExecSQL(stSql);

  if chk_semester4.Checked then
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('4','SE_USE','Y')
  else
    stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('4','SE_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('4','SE_STARTDATE',cmb_StartMM4.Text + cmb_StartDD4.Text);
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SEMESTER_Field_StringValue('4','SE_ENDDATE',cmb_ENDMM4.Text + cmb_ENDDD4.Text);
  DataModule1.ProcessExecSQL(stSql);

  result := True;
end;

function TfmAttendConfig.SonghoFoodConfigSave: Boolean;
var
  stSql : string;
begin
  if Not isDigit(ed_songhoDayCount.Text) then
  begin
    chk_DayLimit.Checked := False;
    ed_songhoDayCount.Text := '0';
  end;
  if Not isDigit(ed_songhoWeekCount.Text) then
  begin
    chk_WeekLimit.Checked := False;
    ed_songhoWeekCount.Text := '0';
  end;
  if Not isDigit(ed_songhoSemesterCount.Text) then
  begin
    chk_semesterLimit.Checked := False;
    ed_songhoSemesterCount.Text := '0';
  end;

  if chk_DayLimit.Checked then stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('DAY','SF_USE','Y')
  else stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('DAY','SF_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_IntValue('DAY','SF_COUNT',ed_songhoDayCount.Text);
  DataModule1.ProcessExecSQL(stSql);

  if chk_WeekLimit.Checked then stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('WEEK','SF_USE','Y')
  else stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('WEEK','SF_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_IntValue('WEEK','SF_COUNT',ed_songhoWeekCount.Text);
  DataModule1.ProcessExecSQL(stSql);

  if chk_semesterLimit.Checked then stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('SEMESTER','SF_USE','Y')
  else stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_StringValue('SEMESTER','SF_USE','N');
  DataModule1.ProcessExecSQL(stSql);
  stSql := CommonSql.UpdateTB_SONGHOFDCONFIG_Field_IntValue('SEMESTER','SF_COUNT',ed_songhoSemesterCount.Text);
  DataModule1.ProcessExecSQL(stSql); 

  result := True;
end;

procedure TfmAttendConfig.SpeedButton4Click(Sender: TObject);
begin
  if( fmMain.fdmsConnect(true) ) then Exit;
  showmessage('test');
end;

end.
