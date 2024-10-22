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
    cmb_ATType: TComboBox;
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
    Label15: TLabel;
    Label16: TLabel;
    ed_fdmsPath: TEdit;
    ed_fdmsPw: TEdit;
    btn_fdmsSearch: TButton;
    OpenDialog1: TOpenDialog;
    chk_DaemonPW: TCheckBox;
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
    Label27: TLabel;
    ed_fdmsNo: TEdit;
    ed_fdmsCardLen: TEdit;
    Label28: TLabel;
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
    GroupBox28: TGroupBox;
    Label32: TLabel;
    cmb_RelayServer: TComboBox;
    rg_HidCardType: TRadioGroup;
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
  private
    { Private declarations }
    procedure GetConfig;
    procedure GetFdConfig;
    procedure SetViewAttend(AtCnt:integer);
    Function InsertTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_CONFIG(aCONFIGGROUP,aCONFIGCODE,aCONFIGVALUE:string;aConfigDetail:string=''):Boolean;
    Function UpdateTB_FOODCODE(aFOODCODE,aSTARTTIME ,aENDTIME,aFOAMT:string):Boolean;
    //procedure InsertATCode;
    Function InsertTB_ATCODE(aATCODE,aATName,aInFromTime,aInToTime,aWorkFromTime,aWorkToTime:string):Boolean;
  public
    { Public declarations }
  end;

var
  fmAttendConfig: TfmAttendConfig;

implementation
uses
  uDataModule1,
  uLomosUtil, uPerRelayConfig, uRelaysentence;
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
  GetFdConfig;
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
          if FindField('CO_CONFIGCODE').AsString = 'CHANGECNT' then
          begin
            cmb_ChangCnt.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString) - 1;
            SetViewAttend(strtoint(FindField('CO_CONFIGVALUE').AsString));
          end else if FindField('CO_CONFIGCODE').AsString = 'YTIME' then
          begin
            ed_YHour.Text := copy(FindField('CO_CONFIGVALUE').AsString,1,2);
            ed_YMin.Text := copy(FindField('CO_CONFIGVALUE').AsString,3,2);
          end;
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
          end else if FindField('CO_CONFIGCODE').AsString = 'LOGINTYPE' then
          begin
            if UpperCase(FindField('CO_CONFIGVALUE').AsString) <> 'FALSE' then chk_DaemonPW.Checked := True
            else chk_DaemonPW.Checked := False;
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
          end else if FindField('CO_CONFIGCODE').AsString = 'HIDCARD' then
          begin
            if isdigit(FindField('CO_CONFIGVALUE').AsString) then rg_HidCardType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
            else rg_HidCardType.ItemIndex := 0;
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
          end else if FindField('CO_CONFIGCODE').AsString = 'FD_DELETE' then
          begin
            ed_FdDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end else if FindField('CO_CONFIGCODE').AsString = 'PT_DELETE' then
          begin
            ed_PtDel.Text  := FindField('CO_CONFIGVALUE').AsString;
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'MOSTYPE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'ATTENDTYPE' then
          begin
            if FindField('CO_CONFIGVALUE').AsString = 'UPDATE' then
            begin
              cmb_ATType.ItemIndex := 0;
            end else if FindField('CO_CONFIGVALUE').AsString = 'READER' then
            begin
              cmb_ATType.ItemIndex := 1;
            end else if FindField('CO_CONFIGVALUE').AsString = 'BUTTON' then
            begin
              cmb_ATType.ItemIndex := 2;
            end;
          end else if FindField('CO_CONFIGCODE').AsString = 'ACCESS' then
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
          if FindField('CO_CONFIGCODE').AsString = 'fdmsUSE' then
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
          end else if FindField('CO_CONFIGCODE').AsString = 'PER_RELAY' then
          begin
            cmb_PersonRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'PER_SRELAY' then
          begin
            cmb_setPersonRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end else if FindField('CO_CONFIGCODE').AsString = 'SENT_RELAY' then
          begin
            cmb_SentenceRelay.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          end;
        end else if Findfield('CO_CONFIGGROUP').AsString = 'COMMON' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'CARDNOTYPE' then cmb_CardType.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CARDNUM' then cmb_CardNumeric.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'CAPOSINUM' then cmb_CardPositionNum.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'DUPCARD' then cmb_DupCard.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'ACEVENT' then cmb_ACEvent.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString)
          else if FindField('CO_CONFIGCODE').AsString = 'SPECIALCD' then cmb_Special.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end else if Findfield('CO_CONFIGGROUP').AsString = 'FIRE' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'FIRERECUSE' then cmb_FireRecUse.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'FIREOPEN' then cmb_FireAllOpen.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
          if FindField('CO_CONFIGCODE').AsString = 'FIRESTATUS' then ed_FireStatus.Text := FindField('CO_CONFIGVALUE').AsString;
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
        end else if Findfield('CO_CONFIGGROUP').AsString = 'SCS' then
        begin
          if FindField('CO_CONFIGCODE').AsString = 'RY_SERVER' then cmb_RelayServer.ItemIndex := strtoint(FindField('CO_CONFIGVALUE').AsString);
        end;

        Next;
      end;
    end;
  Finally
    TempAdoQuery.Free;
    CoUninitialize;
  End;
  rg_MultiDaemonClick(self);
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
begin
{  UpdateTB_CONFIG('ATTEND','ATTYPE',inttostr(cmb_ChangCnt.ItemIndex));
  if length(ed_YHour.Text) < 2 then ed_YHour.Text := '00';
  if length(ed_YMin.Text) < 2 then ed_YMin.Text := '00';
  if length(ed_ATHH.Text) < 2 then ed_ATHH.Text := '00';
  if length(ed_ATMM.Text) < 2 then ed_ATMM.Text := '00';
  UpdateTB_CONFIG('ATTEND','YTIME',ed_YHour.Text + ed_YMin.Text);
  UpdateTB_CONFIG('ATTEND','TTIME',ed_ATHH.Text + ed_ATMM.Text);
  if cmb_ATType.ItemIndex = 0 then       //업데이트방식
    UpdateTB_CONFIG('MOSTYPE','ATTENDTYPE','UPDATE')
  else if cmb_ATType.ItemIndex = 1 then  //카드리더구분(1:출근/2:퇴근)
    UpdateTB_CONFIG('MOSTYPE','ATTENDTYPE','READER')
  else if cmb_ATType.ItemIndex = 2 then  //버튼방식(1:출근/2:퇴근)
    UpdateTB_CONFIG('MOSTYPE','ATTENDTYPE','BUTTON'); }
  UpdateTB_CONFIG('DAEMON','IP',ed_DaemonIP.Text);
  UpdateTB_CONFIG('DAEMON','PORT',ed_DaemonPort.Text );
  UpdateTB_CONFIG('DAEMON','FTPPORT',ed_FTPPort.Text );
  UpdateTB_CONFIG('DAEMON','ATPORT',ed_AtserverPort.Text );
  UpdateTB_CONFIG('DAEMONLOG','DELETDAY',ed_LogDel.Text);
  if rd_AckSave.Checked then
    UpdateTB_CONFIG('DAEMON','FULLLOG','Y' )
  else UpdateTB_CONFIG('DAEMON','FULLLOG','N' );
  if chk_DaemonPW.Checked then
    UpdateTB_CONFIG('DAEMON','LOGINTYPE','TRUE' )
  else UpdateTB_CONFIG('DAEMON','LOGINTYPE','FALSE' );
  UpdateTB_CONFIG('DAEMON','HIDCARD',inttostr(rg_HidCardType.ItemIndex));

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
  if DBType = 'PG' then
    UpdateTB_CONFIG('DATABASE','BACKDIR',stringReplace(ed_BackDir.Text,'\','\\',[rfReplaceAll]) )
  else UpdateTB_CONFIG('DATABASE','BACKDIR',ed_BackDir.Text );
  //UpdateTB_CONFIG('DATABASE','BACKDIR',ed_BackDir.Text );
  UpdateTB_CONFIG('DATABASE','AC_DELETE',ed_AcDel.Text );
  UpdateTB_CONFIG('DATABASE','AT_DELETE',ed_AtDel.Text );
  UpdateTB_CONFIG('DATABASE','FD_DELETE',ed_FdDel.Text );
  UpdateTB_CONFIG('DATABASE','PT_DELETE',ed_PtDel.Text );

  if chk_Short.Checked then UpdateTB_CONFIG('ALARM','SHORT','1' )
  else UpdateTB_CONFIG('ALARM','SHORT','0' );
  if chk_down.Checked then UpdateTB_CONFIG('ALARM','DOWN','1' )
  else UpdateTB_CONFIG('ALARM','DOWN','0' );

  if rg_AlarmView.ItemIndex = 0 then UpdateTB_CONFIG('MOSTYPE','ALARMVIEW','REAL')
  else UpdateTB_CONFIG('MOSTYPE','ALARMVIEW','QUERY');


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
  if DBType = 'PG' then
    UpdateTB_CONFIG('MOSTYPE','FILEDIR',stringReplace(ed_FileServerDir.Text,'\','\\',[rfReplaceAll]) )
  else UpdateTB_CONFIG('MOSTYPE','FILEDIR',ed_FileServerDir.Text );

  if cmb_FoodDeviceType.ItemIndex = 0 then  stFoodDeviceType := 'READER'
  else stFoodDeviceType := 'DOOR';
  UpdateTB_CONFIG('MOSTYPE','FOODDEVICE',stFoodDeviceType );
  if cmb_FoodDeviceType.ItemIndex < 0 then cmb_FoodDeviceType.ItemIndex := 0;
  UpdateTB_CONFIG('MOSTYPE','FOODGRADE',inttostr(rg_FdGrade.itemIndex) );
  if cmb_Ftp.itemIndex < 0 then cmb_Ftp.itemIndex := 0;
  UpdateTB_CONFIG('DAEMON','FTPUSE',inttostr(cmb_Ftp.itemIndex) );
  if rg_MultiDaemon.ItemIndex < 0 then rg_MultiDaemon.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','MULTI',inttostr(rg_MultiDaemon.ItemIndex));

  if rg_fdmsUse.ItemIndex = 0 then
    UpdateTB_CONFIG('RELAY','fdmsUSE','FALSE' )
  else
  begin
    if Not FileExists(ed_fdmsPath.Text) then
    begin
      showmessage('지문연동 파일이 잘못 되었습니다.');
      UpdateTB_CONFIG('RELAY','fdmsUSE','FALSE' );
    end else UpdateTB_CONFIG('RELAY','fdmsUSE','TRUE' );
  end;
  UpdateTB_CONFIG('RELAY','FDMSNO',ed_fdmsNo.Text );
  UpdateTB_CONFIG('RELAY','FDMSCARDLN',ed_fdmscardLen.Text );

  if rg_ServerReader.ItemIndex < 0 then rg_ServerReader.ItemIndex := 0;
  if Not InsertTB_CONFIG('RELAY','cardServer',inttostr(rg_ServerReader.ItemIndex),'카드서버연동유무') then
    UpdateTB_CONFIG('RELAY','cardServer',inttostr(rg_ServerReader.ItemIndex),'카드서버연동유무');
  if cmb_PersonRelay.ItemIndex < 0 then cmb_PersonRelay.ItemIndex := 0;
  if Not InsertTB_CONFIG('RELAY','PER_RELAY',inttostr(cmb_PersonRelay.ItemIndex),'사원정보연동유무') then
    UpdateTB_CONFIG('RELAY','PER_RELAY',inttostr(cmb_PersonRelay.ItemIndex),'사원정보연동유무');
  if cmb_setPersonRelay.ItemIndex < 0 then cmb_setPersonRelay.ItemIndex := 0;
  if Not InsertTB_CONFIG('RELAY','PER_SRELAY',inttostr(cmb_setPersonRelay.ItemIndex),'보내는사원정보연동유무') then
    UpdateTB_CONFIG('RELAY','PER_SRELAY',inttostr(cmb_setPersonRelay.ItemIndex),'보내는사원정보연동유무');

  if cmb_SentenceRelay.ItemIndex < 0 then cmb_SentenceRelay.ItemIndex := 0;
  if Not InsertTB_CONFIG('RELAY','SENT_RELAY',inttostr(cmb_SentenceRelay.ItemIndex),'전문연동유무') then
    UpdateTB_CONFIG('RELAY','SENT_RELAY',inttostr(cmb_SentenceRelay.ItemIndex),'전문연동유무');



  if DBType = 'PG' then
    UpdateTB_CONFIG('RELAY','fdmsPath',stringReplace(ed_fdmsPath.Text,'\','\\',[rfReplaceAll]),'지문path' )
  else UpdateTB_CONFIG('RELAY','fdmsPath',ed_fdmsPath.Text,'지문Path' );
  UpdateTB_CONFIG('RELAY','fdmsPW',ed_fdmsPw.Text,'지문Pw' );
  UpdateTB_CONFIG('RELAY','fdmsType',inttostr(rg_readerType.ItemIndex),'지문Type' );

  if cmb_CardType.ItemIndex < 0 then cmb_CardType.ItemIndex := 0;
  if Not InsertTB_CONFIG('COMMON','CARDNOTYPE',inttostr(cmb_CardType.ItemIndex),'카드번호Type(고정/가변)') then
  begin
    UpdateTB_CONFIG('COMMON','CARDNOTYPE',inttostr(cmb_CardType.ItemIndex),'카드번호Type(고정/가변)');
  end;

  if cmb_CardNumeric.ItemIndex < 0  then cmb_CardNumeric.ItemIndex := 0;
  if Not InsertTB_CONFIG('COMMON','CARDNUM',inttostr(cmb_CardNumeric.ItemIndex),'카드숫자인식Type') then
  begin
    UpdateTB_CONFIG('COMMON','CARDNUM',inttostr(cmb_CardNumeric.ItemIndex),'카드숫자인식Type');
  end;

  if cmb_CardPositionNum.ItemIndex < 0  then cmb_CardPositionNum.ItemIndex := 0;
  if Not InsertTB_CONFIG('COMMON','CAPOSINUM',inttostr(cmb_CardPositionNum.ItemIndex),'카드위치사용유무') then
  begin
    UpdateTB_CONFIG('COMMON','CAPOSINUM',inttostr(cmb_CardPositionNum.ItemIndex),'카드위치사용유무');
  end;

  if cmb_DupCard.ItemIndex < 0 then cmb_DupCard.ItemIndex := 0;
  if Not InsertTB_CONFIG('COMMON','DUPCARD',inttostr(cmb_DupCard.ItemIndex),'1인당카드중복여부') then
  begin
    UpdateTB_CONFIG('COMMON','DUPCARD',inttostr(cmb_DupCard.ItemIndex),'1인당카드중복여부');
  end;

  if cmb_FireRecUse.ItemIndex < 0 then cmb_FireRecUse.ItemIndex := 0;
  if Not InsertTB_CONFIG('FIRE','FIRERECUSE',inttostr(cmb_FireRecUse.ItemIndex),'화재복구사용유무') then
  begin
    UpdateTB_CONFIG('FIRE','FIRERECUSE',inttostr(cmb_FireRecUse.ItemIndex),'화재복구사용유무');
  end;

  if cmb_FireAllOpen.ItemIndex < 0 then cmb_FireAllOpen.ItemIndex := 0;
  if Not InsertTB_CONFIG('FIRE','FIREOPEN',inttostr(cmb_FireAllOpen.ItemIndex),'화재감지시전체개방') then
  begin
    UpdateTB_CONFIG('FIRE','FIREOPEN',inttostr(cmb_FireAllOpen.ItemIndex),'화재감지시전체개방');
  end;

  if Trim(ed_FireStatus.Text) = '' then ed_FireStatus.Text := 'FI';
  if Not InsertTB_CONFIG('FIRE','FIRESTATUS',ed_FireStatus.Text,'화재감지시상태값') then
  begin
    UpdateTB_CONFIG('FIRE','FIRESTATUS',ed_FireStatus.Text,'화재감지시상태값');
  end;
  if cmb_DHCPUse.ItemIndex < 0 then cmb_DHCPUse.ItemIndex := 0;
  UpdateTB_CONFIG('DAEMON','DEVICESVER',inttostr(cmb_DHCPUse.ItemIndex) );
  UpdateTB_CONFIG('DAEMON','DTOSPORT1',ed_DeviceServerPort1.Text );
  UpdateTB_CONFIG('DAEMON','DTOSPORT2',ed_DeviceServerPort2.Text );
  UpdateTB_CONFIG('DAEMON','DTOSPORT3',ed_DeviceServerPort3.Text );
  //특화서비스
  if cmb_Special.ItemIndex < 0 then cmb_Special.ItemIndex := 0;
  UpdateTB_CONFIG('COMMON','SPECIALCD',inttostr(cmb_Special.ItemIndex) );

  if cmb_RelayServer.ItemIndex < 0 then cmb_RelayServer.ItemIndex := 0;
  UpdateTB_CONFIG('SCS','RY_SERVER',inttostr(cmb_RelayServer.ItemIndex) );

  if Not InsertTB_CONFIG('COMMON','ACEVENT',inttostr(cmb_ACEvent.ItemIndex),'0.전체이력,1.카드이벤트만') then
  begin
    UpdateTB_CONFIG('COMMON','ACEVENT',inttostr(cmb_ACEvent.ItemIndex),'0.전체이력,1.카드이벤트만');
  end;

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

  if cmb_FoodDeviceType.ItemIndex = 0 then
  begin
    if rg_FdGrade.ItemIndex = 0 then
    begin
      showmessage('식수 사용을 리더 구분으로 하실 경우에는 권한은 서버에서만 적용할 수 있습니다.');
      Exit;
    end;
  end;


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
  stSql := stSql + ' Set CO_CONFIGVALUE = ''' + aCONFIGVALUE + ''', ';
  stSql := stSql + ' CO_CONFIGDETAIL = ''' + aConfigDetail + ''' ';
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
  if rg_readerType.ItemIndex = 0 then
  begin
    Label16.Visible := False;
    ed_fdmsPw.Visible := False;
  end else
  begin
    Label16.Visible := True;
    ed_fdmsPw.Visible := True;
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

end.
