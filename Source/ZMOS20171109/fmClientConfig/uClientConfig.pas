unit uClientConfig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, Buttons, LMDCustomComponent, LMDIniCtrl,
  ComCtrls, DB, ADODB,WinSpool, ExtCtrls,ActiveX, uSubForm, CommandArray,
  MPlayer, Spin;

type
  TfmClientConfig = class(TfmASubForm)
    btn_Save: TSpeedButton;
    btn_Close: TSpeedButton;
    RzOpenDialog1: TOpenDialog;
    LMDIniCtrl1: TLMDIniCtrl;
    PageControl1: TPageControl;
    AccessTab: TTabSheet;
    AlarmTab: TTabSheet;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    chk_Alarm: TCheckBox;
    ed_alarmFile: TEdit;
    btWav1: TRzBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    cmb_CardGradeCopy: TComboBox;
    gb_AlarmConfig: TGroupBox;
    Label2: TLabel;
    chk_PTAlarm: TCheckBox;
    ed_PTalarmFile: TEdit;
    btn_PtAlalrm: TRzBitBtn;
    Label4: TLabel;
    cmb_ACEvent: TComboBox;
    GroupBox3: TGroupBox;
    chk_FireMessage: TCheckBox;
    ed_FireState: TEdit;
    GroupBox4: TGroupBox;
    chk_Intro: TCheckBox;
    Label5: TLabel;
    Label6: TLabel;
    ed_FireTime: TEdit;
    Label7: TLabel;
    MonitoringTab: TTabSheet;
    gb_monitoring: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    cmb_LoginStart: TComboBox;
    TabSheet1: TTabSheet;
    GroupBox6: TGroupBox;
    Label10: TLabel;
    cmb_Search: TComboBox;
    chk_longOpen: TCheckBox;
    chk_PTMessage: TCheckBox;
    chk_Close: TCheckBox;
    KT_TAB: TTabSheet;
    GroupBox8: TGroupBox;
    chk_DubCardReg: TCheckBox;
    fdmsADOQuery: TADOQuery;
    TabSheet2: TTabSheet;
    GroupBox7: TGroupBox;
    lb_emType: TLabel;
    cmb_emType: TComboBox;
    chk_ACAlarmEvnet: TCheckBox;
    ed_ACAlarmEvnetCode: TEdit;
    TabSheet3: TTabSheet;
    Label11: TLabel;
    cmb_Comport: TComboBox;
    tab_Attend: TTabSheet;
    GroupBox30: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    ed_AtInHH: TEdit;
    ed_AtOutHH: TEdit;
    ed_AtInNN: TEdit;
    ed_AtOutNN: TEdit;
    rg_atUse: TRadioGroup;
    cmb_MonitorType: TComboBox;
    gb_alarmevent: TGroupBox;
    gb_accessevent: TGroupBox;
    chk_AccessEvent1: TCheckBox;
    chk_AccessEvent2: TCheckBox;
    chk_AccessEvent3: TCheckBox;
    chk_AccessEvent4: TCheckBox;
    chk_AccessEvent5: TCheckBox;
    chk_AccessEvent6: TCheckBox;
    chk_AccessEvent7: TCheckBox;
    chk_AccessEvent8: TCheckBox;
    chk_AccessEvent9: TCheckBox;
    chk_AccessEvent10: TCheckBox;
    chk_AccessEvent11: TCheckBox;
    chk_AccessEvent12: TCheckBox;
    chk_AlarmEvent1: TCheckBox;
    chk_AlarmEvent2: TCheckBox;
    chk_AlarmEvent3: TCheckBox;
    chk_AlarmEvent4: TCheckBox;
    chk_AlarmEvent8: TCheckBox;
    chk_AlarmEvent7: TCheckBox;
    chk_AlarmEvent6: TCheckBox;
    chk_AlarmEvent5: TCheckBox;
    tab_Map: TTabSheet;
    Label12: TLabel;
    ed_Heigh: TEdit;
    ed_width: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    cmb_CreatePort: TComboBox;
    rg_Buildingsearch: TRadioGroup;
    rg_CompanySearch: TRadioGroup;
    GroupBox5: TGroupBox;
    Label15: TLabel;
    cmb_MultiDelete: TComboBox;
    GroupBox9: TGroupBox;
    cmb_EmployeeType: TComboBox;
    Label16: TLabel;
    Label17: TLabel;
    cmb_Building: TComboBox;
    chk_OpenModeDoorOpen: TCheckBox;
    MediaPlayer1: TMediaPlayer;
    chk_AccessEvent13: TCheckBox;
    chk_AccessEvent14: TCheckBox;
    chk_AccessEvent15: TCheckBox;
    chk_AccessEvent16: TCheckBox;
    chk_AlarmConfirmEvent: TCheckBox;
    GroupBox10: TGroupBox;
    Label18: TLabel;
    cmb_ExcelFormat: TComboBox;
    TabSheet4: TTabSheet;
    lb_OutDate: TLabel;
    ed_RetireDate: TEdit;
    chk_BasicRetireDate: TCheckBox;
    chk_PosiNega: TCheckBox;
    Label19: TLabel;
    cmb_FingerType: TComboBox;
    chk_BuildingAlarm: TCheckBox;
    chk_BuildingVisible: TCheckBox;
    chk_ModeChangSound: TCheckBox;
    btn_ArmSound: TRzBitBtn;
    btn_DisArmSound: TRzBitBtn;
    ed_ModeChangeArmSound: TEdit;
    ed_ModeChangeDisArmSound: TEdit;
    Label20: TLabel;
    se_MessageFont: TSpinEdit;
    gb_ReaderConfig: TGroupBox;
    ed_FingerIP: TEdit;
    lb_FingerIP: TLabel;
    Label21: TLabel;
    ed_FingerID: TEdit;
    cmb_readerver: TComboBox;
    Label22: TLabel;
    ed_AlarmCnt: TEdit;
    chk_AlarmMap: TCheckBox;
    procedure btn_CloseClick(Sender: TObject);
    procedure btWav1Click(Sender: TObject);
    procedure btn_SaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_PtAlalrmClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cmb_MonitorTypeChange(Sender: TObject);
    procedure cmb_FingerTypeChange(Sender: TObject);
    procedure btn_ArmSoundClick(Sender: TObject);
    procedure btn_DisArmSoundClick(Sender: TObject);
  private
    EmpTypeCodeList : TStringList;
    ComPortList : TStringList;
    { Private declarations }
    function GetSerialPortList(List : TStringList; const doOpenTest : Boolean = True) : LongWord;
    function EncodeCommportName(PortNum : WORD) : String;
    function DecodeCommportName(PortName : String) : WORD;

    Function UpdateTB_ATCODETime(aATCODE,aWorkFromTime,aWorkToTime:string):Boolean;
  public
    { Public declarations }
    procedure GetAtConfig;
  end;

var
  fmClientConfig: TfmClientConfig;

implementation
uses
  uDataModule1,
  uLomosUtil,
  uCompanyCodeLoad,
  uMonitoringCommonVariable;
{$R *.dfm}

procedure TfmClientConfig.btn_CloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmClientConfig.btWav1Click(Sender: TObject);
var
  st : string;
  edit : TEdit;
begin

  RzOpenDialog1.Title:= '소리 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'wav,mp3';
  RzOpenDialog1.InitialDir := 'C:\WINDOWS\Media'; //C:\WINDOWS\Media
  RzOpenDialog1.Filter := 'WAV files (*.wav,*.mp3)|*.WAV;*.MP3';
  if RzOpenDialog1.Execute then
  begin
    ed_alarmFile.Text := RzOpenDialog1.FileName;
    MediaPlayer1.Close;
    MediaPlayer1.FileName := ed_alarmFile.Text;
    MediaPlayer1.Open;
    MediaPlayer1.play;
  end;

end;

procedure TfmClientConfig.btn_SaveClick(Sender: TObject);
var
  nComPort : integer;
  stWorkStartTime : string;
  stWorkEndTime : string;
  chkBox : TCheckBox;
  i : integer;
begin
  nComPort := 0;
  if chk_Alarm.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','알람발생','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','알람발생','N');
  end;
  if chk_longOpen.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','장시간열림알람발생','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','장시간열림알람발생','N');
  end;
  if chk_ACAlarmEvnet.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','출입전용알람발생','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','출입전용알람발생','N');
  end;
  LMDIniCtrl1.WriteString('환경설정','출입전용알람코드',ed_ACAlarmEvnetCode.Text);
  if chk_ModeChangSound.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','경해모드음성','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','경해모드음성','Y');
  end;
  LMDIniCtrl1.WriteString('환경설정','경계모드음성',ed_ModeChangeArmSound.Text);
  LMDIniCtrl1.WriteString('환경설정','해제모드음성',ed_ModeChangeDisArmSound.Text);

  if chk_OpenModeDoorOpen.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','개방모드열림상태','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','개방모드열림상태','N');
  end;

  if isDigit(ed_AlarmCnt.Text) then
  begin
    LMDIniCtrl1.WriteInteger('환경설정','AlarmCount',strtoint(ed_AlarmCnt.Text));
    if strtoint(ed_AlarmCnt.Text) = 0 then chk_PTMessage.Checked := True;
  end else LMDIniCtrl1.WriteInteger('환경설정','AlarmCount',1);

  LMDIniCtrl1.WriteString('환경설정','알람파일',ed_alarmFile.Text);
  if chk_PTAlarm.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','방범알람발생','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','방범알람발생','N');
  end;
  if chk_PTMessage.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','알람메시지','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','알람메시지','N');
  end;
  if chk_AlarmConfirmEvent.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','알람확인이벤트','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','알람확인이벤트','N');
  end;
  if chk_BuildingAlarm.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','빌딩별경해','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','빌딩별경해','N');
  end;
  LMDIniCtrl1.WriteInteger('Message','FONT',se_MessageFont.Value);


  LMDIniCtrl1.WriteString('환경설정','방범알람파일',ed_PTalarmFile.Text);
  LMDIniCtrl1.WriteInteger('환경설정','카드권한복사',cmb_CardGradeCopy.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','출입이벤트',cmb_ACEvent.ItemIndex);
  if chk_Intro.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','범례표시','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','범례표시','N');
  end;
  if chk_Close.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','폐쇄모드','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','폐쇄모드','N');
  end;
  if chk_posiNega.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','POSINEGA','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','POSINEGA','N');
  end;
  if chk_FireMessage.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','화재메시지','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','화재메시지','N');
  end;
  LMDIniCtrl1.WriteString('환경설정','화재상태',ed_FireState.Text);
  if Not IsDigit(ed_FireTime.Text) then ed_FireTime.Text := '5';
  LMDIniCtrl1.WriteString('환경설정','화재표시시간',ed_FireTime.Text);
  LMDIniCtrl1.WriteInteger('환경설정','로그인모니터시작',cmb_LoginStart.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','모니터방법',cmb_MonitorType.ItemIndex);
  if chk_BuildingVisible.Checked then G_nBuildingVisible := 1
  else G_nBuildingVisible := 0;
  if chk_AlarmMap.Checked then G_nAlarmMapPopup := 1
  else G_nAlarmMapPopup := 0;
  LMDIniCtrl1.WriteInteger('Monitoring','BuildingVisible',G_nBuildingVisible);
  LMDIniCtrl1.WriteInteger('Monitoring','AlarmMap',G_nAlarmMapPopup);
  LMDIniCtrl1.WriteInteger('환경설정','조회방법',cmb_Search.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','회사정보조회순서',rg_CompanySearch.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','위치정보조회순서',rg_Buildingsearch.ItemIndex);

  if chk_DubCardReg.Checked then
  begin
    LMDIniCtrl1.WriteString('환경설정','카드중복발급','Y');
  end else
  begin
    LMDIniCtrl1.WriteString('환경설정','카드중복발급','N');
  end;
  if cmb_emType.ItemIndex > 0 then
    LMDIniCtrl1.WriteString('환경설정','연동코드',EmpTypeCodeList.Strings[cmb_emType.ItemIndex]);
  LMDIniCtrl1.WriteInteger('환경설정','멀티삭제',cmb_MultiDelete.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','사원관리',cmb_EmployeeType.ItemIndex);
  LMDIniCtrl1.WriteInteger('환경설정','파일포맷',cmb_ExcelFormat.ItemIndex);

  if chk_BasicRetireDate.Checked then
    LMDIniCtrl1.WriteInteger('사원정보','기본퇴사일사용유무',1)
  else LMDIniCtrl1.WriteInteger('사원정보','기본퇴사일사용유무',0);
  LMDIniCtrl1.WriteString('사원정보','기본퇴사일',ed_RetireDate.Text);

  if ComPortList.Count > 0 then
  begin
    if cmb_ComPort.ItemIndex > -1 then
    begin
      if cmb_ComPort.ItemIndex = 0 then nComPort := 0
      else
      begin
        if cmb_ComPort.ItemIndex = cmb_CreatePort.ItemIndex then
        begin
          showmessage('등록기 포트와 발급기 포트가 같을 수 없습니다.');
          Exit;
        end;
        nComPort := Integer(ComPortList.Objects[cmb_ComPort.ItemIndex - 1]);
      end;
      LMDIniCtrl1.WriteInteger('환경설정','등록기포트',nComPort);
      G_nCardRegisterPort := nComPort;
    end;
    if cmb_CreatePort.ItemIndex > -1 then
    begin
      if cmb_CreatePort.ItemIndex = 0 then nComPort := 0
      else nComPort := Integer(ComPortList.Objects[cmb_CreatePort.ItemIndex - 1]);
      if Not UseKTCardReg then nComPort := 0;
      LMDIniCtrl1.WriteInteger('CARDCREATE','COMPORT',nComPort);
      G_nCardCreatePort := nComPort;
    end;
  end;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    chkBox := TravelCheckBoxItem(gb_accessevent,'chk_AccessEvent',i + 1);
    if chkBox <> nil then
    begin
      if chkBox.Checked then AccessEventShowTable[i] := 1
      else AccessEventShowTable[i] := 0;
    end;
    LMDIniCtrl1.WriteInteger('출입이벤트',inttostr(i),AccessEventShowTable[i]);
  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    chkBox := TravelCheckBoxItem(gb_alarmevent,'chk_AlarmEvent',i + 1);
    if chkBox <> nil then
    begin
      if chkBox.Checked then AlarmEventShowTable[i] := 1
      else AlarmEventShowTable[i] := 0;
    end;
    LMDIniCtrl1.WriteInteger('알람이벤트',inttostr(i),AlarmEventShowTable[i]);
  end;

  LMDIniCtrl1.WriteInteger('환경설정','근태보고서',rg_atUse.ItemIndex);
  LMDIniCtrl1.WriteString('맵환경','높이',ed_Heigh.text);
  LMDIniCtrl1.WriteString('맵환경','넓이',ed_width.text);

  if cmb_Building.ItemIndex < 0 then cmb_Building.ItemIndex := 0;
  LMDIniCtrl1.WriteInteger('Config','Building',cmb_Building.ItemIndex);

  LMDIniCtrl1.WriteInteger('지문등록기','타입',cmb_FingerType.ItemIndex);
  LMDIniCtrl1.WriteString('지문등록기','IP',ed_FingerIP.text);
  LMDIniCtrl1.WriteString('지문등록기','ID',ed_FingerID.text);
  LMDIniCtrl1.WriteInteger('지문등록기','ver',cmb_readerver.ItemIndex);


  G_nFingerDeviceType := cmb_FingerType.ItemIndex;
  G_stFingerReaderIP := ed_FingerIP.Text ;
  G_stFingerReaderID := ed_FingerID.Text ;
  G_nFingerDeviceVer := cmb_readerver.ItemIndex;


  if G_nFingerDeviceType = 0 then
  begin
//    showmessage('지문등록기로 지문 등록시 인식률이 낮아 질 수 있어서 성현 지문리더를 이용한 지문 등록을 권장합니다.');
  end;


  if rg_atUse.ItemIndex = 1 then
  begin
    if Not isDigit(ed_AtInHH.Text) then
    begin
      showmessage('출근시간 설정이 잘못 되었습니다.');
      Exit;
    end;
    if Not isDigit(ed_AtInNN.Text) then
    begin
      showmessage('출근시간 설정이 잘못 되었습니다.');
      Exit;
    end;
    if Not isDigit(ed_AtOutHH.Text) then
    begin
      showmessage('퇴근시간 설정이 잘못 되었습니다.');
      Exit;
    end;
    if Not isDigit(ed_AtOutNN.Text) then
    begin
      showmessage('퇴근시간 설정이 잘못 되었습니다.');
      Exit;
    end;
    stWorkStartTime := FillZeroNumber(strtoint(ed_AtInHH.Text),2) + FillZeroNumber(strtoint(ed_AtInNN.Text),2);
    stWorkEndTime := FillZeroNumber(strtoint(ed_AtOutHH.Text),2) + FillZeroNumber(strtoint(ed_AtOutNN.Text),2);

    UpdateTB_ATCODETime('001',stWorkStartTime,stWorkEndTime);
    showmessage('근태 환경 변경시 반드시 데몬을 재시작 하셔야 합니다.');
  end;
  Close;
end;

procedure TfmClientConfig.FormCreate(Sender: TObject);
var
  nCount : integer;
  i : integer;
  stComPort : string;
  nIndex : integer;
  chkBox : TCheckBox;
begin
  EmpTypeCodeList := TStringList.Create;

  for i := 0 to ACCESSEVENTMAXCELL do
  begin
    chkBox := TravelCheckBoxItem(gb_accessevent,'chk_AccessEvent',i + 1);
    if chkBox <> nil then
    begin
      if AccessEventShowTable[i] = 1 then chkBox.Checked := True
      else chkBox.Checked := False;
    end;
  end;
  for i := 0 to ALARMEVENTMAXCELL do
  begin
    chkBox := TravelCheckBoxItem(gb_alarmevent,'chk_AlarmEvent',i + 1);
    if chkBox <> nil then
    begin
      if AlarmEventShowTable[i] = 1 then chkBox.Checked := True
      else chkBox.Checked := False;
    end;
  end;

  if PatrolUse then AlarmTab.TabVisible := True
  else AlarmTab.TabVisible := False;

  chk_OpenModeDoorOpen.Checked := OpenModeDoorOpen;
  chk_Alarm.Checked := ACAlarmUse;
  chk_longOpen.Checked := LongDoorOpenAlarmUse;
  chk_ACAlarmEvnet.Checked := ACAlarmEventUse;
  ed_ACAlarmEvnetCode.Text := ACAlarmEventCode;
  ed_alarmFile.Text := ACAlaramFile;
  chk_PTAlarm.Checked := PTAlarmUse;
  chk_PTMessage.Checked := PTAlarmMessageUse;
  chk_AlarmConfirmEvent.Checked := PTAlarmConfirmEvent;
  chk_BuildingAlarm.Checked := BuildingAlarmShow;
  chk_ModeChangSound.Checked := G_bModeChangSound;
  ed_ModeChangeArmSound.Text := G_stModeChangeArmSound;
  ed_ModeChangeDisArmSound.Text := G_stModeChangeDisArmSound;
  se_MessageFont.Value := G_nAlarmMessageFontSize;
  ed_AlarmCnt.Text := inttostr(G_nAlarmCount);


  ed_PTalarmFile.Text := PTAlaramFile;
  if IsCardGradCopy then cmb_CardGradeCopy.ItemIndex := 1
  else cmb_CardGradeCopy.ItemIndex := 0;
  cmb_ACEvent.ItemIndex := G_nAccessEventSearch;

  chk_Intro.Checked := G_bACIntroView;
  chk_Close.Checked := G_bColseModeView;
  chk_PosiNega.Checked := G_bPosiNega;
  chk_FireMessage.Checked := G_bFireMessageView;
  ed_FireState.Text := G_stFireState;
  ed_FireTime.Text := inttostr(G_nFireTime);
  cmb_LoginStart.ItemIndex := G_nLoginMoitorStart;
  cmb_MonitorType.ItemIndex := G_nMonitorGubun;
  cmb_MonitorTypeChange(cmb_MonitorType);

  if G_nBuildingVisible =  1 then chk_BuildingVisible.Checked := True
  else chk_BuildingVisible.Checked := False;
  if G_nAlarmMapPopup = 1 then chk_AlarmMap.Checked := True
  else chk_AlarmMap.Checked := False;    

  cmb_Search.ItemIndex := G_nSearchIndex;
  rg_CompanySearch.ItemIndex := G_nCompanySearchIndex;
  rg_Buildingsearch.ItemIndex := G_nBuildingSearchIndex;

  chk_DubCardReg.Checked := G_bKTDupCardReg;
  cmb_MultiDelete.ItemIndex := G_nMultiDeleteCard;
  cmb_EmployeeType.ItemIndex := G_nEmployeeAdminType;
  cmb_ExcelFormat.ItemIndex := G_nFileFormat;

  chk_BasicRetireDate.Checked := G_bRetireDateUse;
  ed_RetireDate.Text := inttostr(G_nRetireDate) ;
  
  ComPortList := TStringList.Create;
  ComPortList.Clear;

  GetAtConfig;
  rg_atUse.ItemIndex := G_nMonitoringAttendReport;

  tab_Attend.TabVisible := AttendUse;

  //gb_monitoring.Visible := False;

  chk_AccessEvent8.Caption := FM002;
  chk_AccessEvent9.Caption := FM012;
  chk_AccessEvent10.Caption := FM022;
  chk_AccessEvent11.Caption := FM101;
  chk_AccessEvent13.Caption := FM107;
  chk_AccessEvent14.Caption := FM103;
  chk_AccessEvent15.Caption := FM108;
  chk_AccessEvent16.Caption := FM109;

  ed_Heigh.text := LMDIniCtrl1.ReadString('맵환경','높이','32');
  ed_width.text := LMDIniCtrl1.ReadString('맵환경','넓이','32');
  cmb_Building.ItemIndex := strtoint(BuildingStep);

  nCount := GetSerialPortList(ComPortList,False);
  cmb_ComPort.Clear;
  cmb_ComPort.Items.add('사용안함');
  cmb_ComPort.ItemIndex := -1;
  cmb_CreatePort.Clear;
  cmb_CreatePort.Items.add('사용안함');
  cmb_CreatePort.ItemIndex := -1;
  if nCount = 0 then
  begin
    Exit;
  end;

  for i:= 0 to nCount - 1 do
  begin
    cmb_ComPort.items.Add(ComPortList.Strings[i])
  end;
  if G_nCardRegisterPort > 0 then
  begin
    stComPort := EncodeCommportName(G_nCardRegisterPort);
    nIndex := cmb_ComPort.Items.IndexOf(stComPort);
    if nIndex > -1 then cmb_ComPort.ItemIndex := nIndex;
  end else
    cmb_ComPort.ItemIndex := 0;

  for i:= 0 to nCount - 1 do
  begin
    cmb_CreatePort.items.Add(ComPortList.Strings[i])
  end;
  if G_nCardCreatePort > 0 then
  begin
    stComPort := EncodeCommportName(G_nCardCreatePort);
    nIndex := cmb_CreatePort.Items.IndexOf(stComPort);
    if nIndex > -1 then cmb_CreatePort.ItemIndex := nIndex;
  end else
    cmb_CreatePort.ItemIndex := 0;

  Label14.Visible := UseKTCardReg;
  cmb_CreatePort.Visible := UseKTCardReg;
  if Not UseKTCardReg then
  begin
    cmb_CreatePort.ItemIndex := 0;
  end;
  cmb_MonitorTypeChange(self);

  cmb_FingerType.ItemIndex := G_nFingerDeviceType ;
  cmb_FingerTypechange(cmb_FingerType);
  cmb_readerver.ItemIndex := G_nFingerDeviceVer ;

  ed_FingerID.Text := G_stFingerReaderID;
  ed_FingerIP.Text := G_stFingerReaderIP;
end;

procedure TfmClientConfig.btn_PtAlalrmClick(Sender: TObject);
var
  st : string;
begin

  RzOpenDialog1.Title:= '소리 파일 찾기';
  RzOpenDialog1.DefaultExt:= 'wav,mp3';
  RzOpenDialog1.InitialDir := 'C:\WINDOWS\Media'; //C:\WINDOWS\Media
  RzOpenDialog1.Filter := 'WAV files (*.wav,*.mp3)|*.WAV;*.MP3';
  if RzOpenDialog1.Execute then
  begin
    ed_PTalarmFile.Text := RzOpenDialog1.FileName;
    MediaPlayer1.Close;
    MediaPlayer1.FileName := ed_PTalarmFile.Text;
    MediaPlayer1.Open;
    MediaPlayer1.play;

  end;

end;

procedure TfmClientConfig.FormShow(Sender: TObject);
var
  nIndex : integer;
begin
  if G_nDaemonServerVersion < 1 then
  begin
    chk_Close.Visible := False;
    chk_Close.Checked := False;
  end;
  if G_nDaemonServerVersion < 10 then
  begin
    chk_PosiNega.Visible := False;
    chk_PosiNega.Checked := False;
  end;

  KT_TAB.TabVisible := False;
  if G_nSpecialProgram = 1 then
  begin
    KT_TAB.TabVisible := True;
  end;


  lb_emType.Caption := FM042;
  LoadsEmpType(EmpTypeCodeList,cmb_EmType);
  nIndex := EmpTypeCodeList.IndexOf(G_stRelayDefaultCode);
  if nIndex > -1 then cmb_EmType.ItemIndex := nIndex;

end;

procedure TfmClientConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EmpTypeCodeList.Free;
  ComPortList.Free;
end;

function TfmClientConfig.DecodeCommportName(PortName: String): WORD;
var
 Pt : Integer;
begin
 PortName := UpperCase(PortName);
 if (Copy(PortName, 1, 3) = 'COM') then begin
    Delete(PortName, 1, 3);
    Pt := Pos(':', PortName);
    if Pt = 0 then Result := 0
       else Result := StrToInt(Copy(PortName, 1, Pt-1));
 end
 else if (Copy(PortName, 1, 7) = '\\.\COM') then begin
    Delete(PortName, 1, 7);
    Result := StrToInt(PortName);
 end
 else Result := 0;

end;

function TfmClientConfig.EncodeCommportName(PortNum: WORD): String;
begin
 if PortNum < 10
    then Result := 'COM' + IntToStr(PortNum) + ':'
    else Result := '\\.\COM'+IntToStr(PortNum);

end;

function TfmClientConfig.GetSerialPortList(List: TStringList;
  const doOpenTest: Boolean): LongWord;
type
 TArrayPORT_INFO_1 = array[0..0] Of PORT_INFO_1;
 PArrayPORT_INFO_1 = ^TArrayPORT_INFO_1;
var
{$IF USE_ENUMPORTS_API}
 PL : PArrayPORT_INFO_1;
 TotalSize, ReturnCount : LongWord;
 Buf : String;
 CommNum : WORD;
{$IFEND}
 I : LongWord;
 CHandle : THandle;
begin
 List.Clear;
{$IF USE_ENUMPORTS_API}
 EnumPorts(nil, 1, nil, 0, TotalSize, ReturnCount);
 if TotalSize < 1 then begin
    Result := 0;
    Exit;
    end;
 GetMem(PL, TotalSize);
 EnumPorts(nil, 1, PL, TotalSize, TotalSize, Result);

 if Result < 1 then begin
    FreeMem(PL);
    Exit;
    end;

 for I:=0 to Result-1 do begin
    Buf := UpperCase(PL^[I].pName);
    CommNum := DecodeCommportName(PL^[I].pName);
    if CommNum = 0 then Continue;
    List.AddObject(EncodeCommportName(CommNum), Pointer(CommNum));
    end;
{$ELSE}
 for I:=1 to MAX_COMPORT do List.AddObject(EncodeCommportName(I), Pointer(I));
{$IFEND}
 // Open Test
 if List.Count > 0 then for I := List.Count-1 downto 0 do begin
    CHandle := CreateFile(PChar(List[I]), GENERIC_WRITE or GENERIC_READ,
     0, nil, OPEN_EXISTING,
     FILE_ATTRIBUTE_NORMAL,
     0);
    if CHandle = INVALID_HANDLE_VALUE then begin
if doOpenTest or (GetLastError() <> ERROR_ACCESS_DENIED) then List.Delete(I);
Continue;
end;
    CloseHandle(CHandle);
    end;

 Result := List.Count;
{$IF USE_ENUMPORTS_API}
 if Assigned(PL) then FreeMem(PL);
{$IFEND}

end;

function TfmClientConfig.UpdateTB_ATCODETime(aATCODE, aWorkFromTime,
  aWorkToTime: string): Boolean;
var
  stSql : string;
begin
  stSql := ' Update TB_ATCODE Set ';
  stSql := stSql + ' AT_WORKSTARTTIME = ''' + aWorkFromTime + ''', ';
  stSql := stSql + ' AT_WORKENDTIME = ''' + aWorkToTime + ''' ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE + ''' ';
  stSql := stSql + ' AND AT_ATCODE = ''' + aATCODE + ''' ';

  result :=  DataModule1.ProcessExecSQL(stSql);

end;

procedure TfmClientConfig.GetAtConfig;
var
  stSql : string;
  TempAdoQuery : TADOQuery;
begin
  stSql := 'select * from TB_ATCODE ';
  stSql := stSql + ' Where GROUP_CODE = ''' + GROUPCODE  + ''' ';
  stSql := stSql + ' AND AT_ATCODE = ''001'' ';

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
        showmessage('근태환경이 잘못 되었습니다.');
        Exit;
      end;

      First;
      ed_AtInHH.Text := copy(FindField('AT_WORKSTARTTIME').AsString,1,2);
      ed_AtInNN.Text := copy(FindField('AT_WORKSTARTTIME').AsString,3,2);
      ed_AtOutHH.Text := copy(FindField('AT_WORKENDTIME').AsString,1,2);
      ed_AtOutNN.Text := copy(FindField('AT_WORKENDTIME').AsString,3,2);
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
end;

procedure TfmClientConfig.cmb_MonitorTypeChange(Sender: TObject);
begin
  chk_AlarmMap.Visible := False;
  if (cmb_MonitorType.ItemIndex = 5) or
    (cmb_MonitorType.ItemIndex = 6) or
   (cmb_MonitorType.ItemIndex = 7) then
  begin
    tab_Map.TabVisible := True;
  end else tab_Map.TabVisible := False;

  if (cmb_MonitorType.ItemIndex = 2) or (cmb_MonitorType.ItemIndex = 4) then
  begin
    chk_BuildingVisible.Visible := True;
    if (cmb_MonitorType.ItemIndex = 2) then chk_AlarmMap.Visible := True;
  end else
  begin
    chk_BuildingVisible.Visible := False;
  end;
end;

procedure TfmClientConfig.cmb_FingerTypeChange(Sender: TObject);
begin
  inherited;
  if (cmb_FingerType.ItemIndex = 1) or (cmb_FingerType.ItemIndex = 2) then
  begin
    gb_ReaderConfig.Visible := True;
    if cmb_FingerType.ItemIndex = 1 then cmb_readerver.Visible := True
    else cmb_readerver.Visible := False;
  end else
  begin
    gb_ReaderConfig.Visible := False;
  end;
end;

procedure TfmClientConfig.btn_ArmSoundClick(Sender: TObject);
begin
  inherited;
  RzOpenDialog1.DefaultExt:= 'mp3';
  RzOpenDialog1.Filter := 'mp3 files (*.mp3)|*.mp3';
  if RzOpenDialog1.Execute then
  begin
    ed_ModeChangeArmSound.Text :=  RzOpenDialog1.FileName;
  end;
end;

procedure TfmClientConfig.btn_DisArmSoundClick(Sender: TObject);
begin
  inherited;
  RzOpenDialog1.DefaultExt:= 'mp3';
  RzOpenDialog1.Filter := 'mp3 files (*.mp3)|*.mp3';
  if RzOpenDialog1.Execute then
  begin
    ed_ModeChangeDisArmSound.Text :=  RzOpenDialog1.FileName;
  end;

end;

end.
